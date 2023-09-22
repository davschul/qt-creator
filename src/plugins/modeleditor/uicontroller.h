// Copyright (C) 2016 Jochen Becher
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only WITH Qt-GPL-exception-1.0

#pragma once

#include <QObject>

namespace Utils { class QtcSettings; }

namespace ModelEditor {
namespace Internal {

class UiController : public QObject
{
    Q_OBJECT
    class UiControllerPrivate;

public:
    UiController();
    ~UiController();

signals:
    void rightSplitterChanged(const QByteArray &state);
    void rightHorizSplitterChanged(const QByteArray &state);

public:
    bool hasRightSplitterState() const;
    QByteArray rightSplitterState() const;
    bool hasRightHorizSplitterState() const;
    QByteArray rightHorizSplitterState() const;

    void onRightSplitterChanged(const QByteArray &state);
    void onRightHorizSplitterChanged(const QByteArray &state);
    void saveSettings(Utils::QtcSettings *settings);
    void loadSettings(Utils::QtcSettings *settings);

private:
    UiControllerPrivate *d;
};

} // namespace Internal
} // namespace ModelEditor
