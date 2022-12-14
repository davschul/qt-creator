// Copyright (C) 2022 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial

#include "axivionoutputpane.h"

#include "axivionplugin.h"
#include "axivionresultparser.h"
#include "axiviontr.h"

#include <utils/qtcassert.h>

#include <QFormLayout>
#include <QLabel>
#include <QStackedWidget>

namespace Axivion::Internal {

class DashboardWidget : public QWidget
{
public:
    explicit DashboardWidget(QWidget *parent = nullptr);
    void updateUi();
    bool hasProject() const { return !m_project->text().isEmpty(); }
private:
    QLabel *m_project = nullptr;
    QLabel *m_loc = nullptr;
    QFormLayout *m_formLayout = nullptr;
};

DashboardWidget::DashboardWidget(QWidget *parent)
    : QWidget(parent)
{
    QVBoxLayout *layout = new QVBoxLayout(this);
    QFormLayout *projectLayout = new QFormLayout;
    m_project = new QLabel(this);
    projectLayout->addRow(Tr::tr("Project:"), m_project);
    m_loc = new QLabel(this);
    projectLayout->addRow(Tr::tr("Lines of Code:"), m_loc);
    layout->addLayout(projectLayout);
    m_formLayout = new QFormLayout;
    layout->addLayout(m_formLayout);
}

void DashboardWidget::updateUi()
{
    const ProjectInfo &info = AxivionPlugin::projectInfo();
    m_project->setText(info.name);
    m_loc->setText({});
    while (m_formLayout->rowCount())
        m_formLayout->removeRow(0);

    if (info.versions.isEmpty())
        return;

    const ResultVersion &last = info.versions.last();
    m_loc->setText(QString::number(last.linesOfCode));

    const QString tmpl("%1 %2 +%3 / -%4");
    auto apply = [&tmpl](int t, int a, int r){
        QChar tr = (a == r ? '=' : (a < r ? '^' : 'v'));
        return tmpl.arg(t, 10, 10, QLatin1Char(' ')).arg(tr).arg(a, 5, 10, QLatin1Char(' '))
                .arg(r, 5, 10, QLatin1Char(' '));
    };
    const QList<IssueKind> &issueKinds = info.issueKinds;
    auto toolTip = [issueKinds](const QString &prefix){
        for (const IssueKind &kind : issueKinds) {
            if (kind.prefix == prefix)
                return kind.nicePlural;
        }
        return QString();
    };
    int allTotal = 0, allAdded = 0, allRemoved = 0;
    for (auto issueCount : std::as_const(last.issueCounts)) {
        allTotal += issueCount.total;
        allAdded += issueCount.added;
        allRemoved += issueCount.removed;
        const QString txt = apply(issueCount.total, issueCount.added, issueCount.removed);
        const QString currentToolTip = toolTip(issueCount.issueKind);
        QLabel *label = new QLabel(issueCount.issueKind, this);
        label->setToolTip(currentToolTip);
        QLabel *values = new QLabel(txt, this);
        values->setToolTip(currentToolTip);
        m_formLayout->addRow(label, values);
    }

    QLabel *label = new QLabel(apply(allTotal, allAdded, allRemoved), this);
    m_formLayout->addRow(Tr::tr("Total:"), label);
}

AxivionOutputPane::AxivionOutputPane(QObject *parent)
    : Core::IOutputPane(parent)
{
    m_outputWidget = new QStackedWidget;
    DashboardWidget *dashboardWidget = new DashboardWidget(m_outputWidget);
    m_outputWidget->addWidget(dashboardWidget);
}

AxivionOutputPane::~AxivionOutputPane()
{
    if (!m_outputWidget->parent())
        delete m_outputWidget;
}

QWidget *AxivionOutputPane::outputWidget(QWidget *parent)
{
    if (m_outputWidget)
        m_outputWidget->setParent(parent);
    else
        QTC_CHECK(false);
    return m_outputWidget;
}

QList<QWidget *> AxivionOutputPane::toolBarWidgets() const
{
    QList<QWidget *> buttons;
    return buttons;
}

QString AxivionOutputPane::displayName() const
{
    return Tr::tr("Axivion");
}

int AxivionOutputPane::priorityInStatusBar() const
{
    return -1;
}

void AxivionOutputPane::clearContents()
{
}

void AxivionOutputPane::setFocus()
{
}

bool AxivionOutputPane::hasFocus() const
{
    return false;
}

bool AxivionOutputPane::canFocus() const
{
    return true;
}

bool AxivionOutputPane::canNavigate() const
{
    return true;
}

bool AxivionOutputPane::canNext() const
{
    return false;
}

bool AxivionOutputPane::canPrevious() const
{
    return false;
}

void AxivionOutputPane::goToNext()
{
}

void AxivionOutputPane::goToPrev()
{
}

void AxivionOutputPane::updateDashboard()
{
    if (auto dashboard = static_cast<DashboardWidget *>(m_outputWidget->widget(0))) {
        dashboard->updateUi();
        m_outputWidget->setCurrentIndex(0);
        if (dashboard->hasProject())
            flash();
    }
}

} // Axivion::Internal
