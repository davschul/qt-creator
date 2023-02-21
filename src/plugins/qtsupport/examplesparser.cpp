// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only WITH Qt-GPL-exception-1.0

#include "examplesparser.h"

#include <utils/algorithm.h>
#include <utils/stylehelper.h>

#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QPixmapCache>
#include <QXmlStreamReader>

using namespace Utils;

namespace QtSupport::Internal {

static QString relativeOrInstallPath(const QString &path,
                                     const QString &manifestPath,
                                     const QString &installPath)
{
    const QChar slash = QLatin1Char('/');
    const QString relativeResolvedPath = manifestPath + slash + path;
    const QString installResolvedPath = installPath + slash + path;
    if (QFile::exists(relativeResolvedPath))
        return relativeResolvedPath;
    if (QFile::exists(installResolvedPath))
        return installResolvedPath;
    // doesn't exist, just return relative
    return relativeResolvedPath;
}

static QString fixStringForTags(const QString &string)
{
    QString returnString = string;
    returnString.remove(QLatin1String("<i>"));
    returnString.remove(QLatin1String("</i>"));
    returnString.remove(QLatin1String("<tt>"));
    returnString.remove(QLatin1String("</tt>"));
    return returnString;
}

static QStringList trimStringList(const QStringList &stringlist)
{
    return Utils::transform(stringlist, [](const QString &str) { return str.trimmed(); });
}

static QList<ExampleItem *> parseExamples(QXmlStreamReader *reader,
                                          const QString &projectsOffset,
                                          const QString &examplesInstallPath)
{
    QList<ExampleItem *> result;
    std::unique_ptr<ExampleItem> item;
    const QChar slash = QLatin1Char('/');
    while (!reader->atEnd()) {
        switch (reader->readNext()) {
        case QXmlStreamReader::StartElement:
            if (reader->name() == QLatin1String("example")) {
                item = std::make_unique<ExampleItem>();
                item->type = Example;
                QXmlStreamAttributes attributes = reader->attributes();
                item->name = attributes.value(QLatin1String("name")).toString();
                item->projectPath = attributes.value(QLatin1String("projectPath")).toString();
                item->hasSourceCode = !item->projectPath.isEmpty();
                item->projectPath = relativeOrInstallPath(item->projectPath,
                                                          projectsOffset,
                                                          examplesInstallPath);
                item->imageUrl = attributes.value(QLatin1String("imageUrl")).toString();
                QPixmapCache::remove(item->imageUrl);
                item->docUrl = attributes.value(QLatin1String("docUrl")).toString();
                item->isHighlighted = attributes.value(QLatin1String("isHighlighted")).toString()
                                      == QLatin1String("true");

            } else if (reader->name() == QLatin1String("fileToOpen")) {
                const QString mainFileAttribute
                    = reader->attributes().value(QLatin1String("mainFile")).toString();
                const QString filePath
                    = relativeOrInstallPath(reader->readElementText(
                                                QXmlStreamReader::ErrorOnUnexpectedElement),
                                            projectsOffset,
                                            examplesInstallPath);
                item->filesToOpen.append(filePath);
                if (mainFileAttribute.compare(QLatin1String("true"), Qt::CaseInsensitive) == 0)
                    item->mainFile = filePath;
            } else if (reader->name() == QLatin1String("description")) {
                item->description = fixStringForTags(
                    reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement));
            } else if (reader->name() == QLatin1String("dependency")) {
                item->dependencies.append(
                    projectsOffset + slash
                    + reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement));
            } else if (reader->name() == QLatin1String("tags")) {
                item->tags = trimStringList(
                    reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement)
                        .split(QLatin1Char(','), Qt::SkipEmptyParts));
            } else if (reader->name() == QLatin1String("platforms")) {
                item->platforms = trimStringList(
                    reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement)
                        .split(QLatin1Char(','), Qt::SkipEmptyParts));
            }
            break;
        case QXmlStreamReader::EndElement:
            if (reader->name() == QLatin1String("example")) {
                result.push_back(item.release());
            } else if (reader->name() == QLatin1String("examples")) {
                return result;
            }
            break;
        default: // nothing
            break;
        }
    }
    return result;
}

static QList<ExampleItem *> parseDemos(QXmlStreamReader *reader,
                                       const QString &projectsOffset,
                                       const QString &demosInstallPath)
{
    QList<ExampleItem *> result;
    std::unique_ptr<ExampleItem> item;
    const QChar slash = QLatin1Char('/');
    while (!reader->atEnd()) {
        switch (reader->readNext()) {
        case QXmlStreamReader::StartElement:
            if (reader->name() == QLatin1String("demo")) {
                item = std::make_unique<ExampleItem>();
                item->type = Demo;
                QXmlStreamAttributes attributes = reader->attributes();
                item->name = attributes.value(QLatin1String("name")).toString();
                item->projectPath = attributes.value(QLatin1String("projectPath")).toString();
                item->hasSourceCode = !item->projectPath.isEmpty();
                item->projectPath = relativeOrInstallPath(item->projectPath,
                                                          projectsOffset,
                                                          demosInstallPath);
                item->imageUrl = attributes.value(QLatin1String("imageUrl")).toString();
                QPixmapCache::remove(item->imageUrl);
                item->docUrl = attributes.value(QLatin1String("docUrl")).toString();
                item->isHighlighted = attributes.value(QLatin1String("isHighlighted")).toString()
                                      == QLatin1String("true");
            } else if (reader->name() == QLatin1String("fileToOpen")) {
                item->filesToOpen.append(
                    relativeOrInstallPath(reader->readElementText(
                                              QXmlStreamReader::ErrorOnUnexpectedElement),
                                          projectsOffset,
                                          demosInstallPath));
            } else if (reader->name() == QLatin1String("description")) {
                item->description = fixStringForTags(
                    reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement));
            } else if (reader->name() == QLatin1String("dependency")) {
                item->dependencies.append(
                    projectsOffset + slash
                    + reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement));
            } else if (reader->name() == QLatin1String("tags")) {
                item->tags = reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement)
                                 .split(QLatin1Char(','));
            }
            break;
        case QXmlStreamReader::EndElement:
            if (reader->name() == QLatin1String("demo")) {
                result.push_back(item.release());
            } else if (reader->name() == QLatin1String("demos")) {
                return result;
            }
            break;
        default: // nothing
            break;
        }
    }
    return result;
}

static QList<ExampleItem *> parseTutorials(QXmlStreamReader *reader, const QString &projectsOffset)
{
    QList<ExampleItem *> result;
    std::unique_ptr<ExampleItem> item = std::make_unique<ExampleItem>();
    const QChar slash = QLatin1Char('/');
    while (!reader->atEnd()) {
        switch (reader->readNext()) {
        case QXmlStreamReader::StartElement:
            if (reader->name() == QLatin1String("tutorial")) {
                item = std::make_unique<ExampleItem>();
                item->type = Tutorial;
                QXmlStreamAttributes attributes = reader->attributes();
                item->name = attributes.value(QLatin1String("name")).toString();
                item->projectPath = attributes.value(QLatin1String("projectPath")).toString();
                item->hasSourceCode = !item->projectPath.isEmpty();
                item->projectPath.prepend(slash);
                item->projectPath.prepend(projectsOffset);
                item->imageUrl = Utils::StyleHelper::dpiSpecificImageFile(
                    attributes.value(QLatin1String("imageUrl")).toString());
                QPixmapCache::remove(item->imageUrl);
                item->docUrl = attributes.value(QLatin1String("docUrl")).toString();
                item->isVideo = attributes.value(QLatin1String("isVideo")).toString()
                                == QLatin1String("true");
                item->videoUrl = attributes.value(QLatin1String("videoUrl")).toString();
                item->videoLength = attributes.value(QLatin1String("videoLength")).toString();
            } else if (reader->name() == QLatin1String("fileToOpen")) {
                item->filesToOpen.append(
                    projectsOffset + slash
                    + reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement));
            } else if (reader->name() == QLatin1String("description")) {
                item->description = fixStringForTags(
                    reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement));
            } else if (reader->name() == QLatin1String("dependency")) {
                item->dependencies.append(
                    projectsOffset + slash
                    + reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement));
            } else if (reader->name() == QLatin1String("tags")) {
                item->tags = reader->readElementText(QXmlStreamReader::ErrorOnUnexpectedElement)
                                 .split(QLatin1Char(','));
            }
            break;
        case QXmlStreamReader::EndElement:
            if (reader->name() == QLatin1String("tutorial"))
                result.push_back(item.release());
            else if (reader->name() == QLatin1String("tutorials"))
                return result;
            break;
        default: // nothing
            break;
        }
    }
    return result;
}

expected_str<QList<ExampleItem *>> parseExamples(const QString &manifest,
                                                 const QString &examplesInstallPath,
                                                 const QString &demosInstallPath,
                                                 const bool examples)
{
    QFile exampleFile(manifest);
    if (!exampleFile.open(QIODevice::ReadOnly))
        return make_unexpected(QString("Could not open file \"%1\"").arg(manifest));

    QFileInfo fi(manifest);
    QString offsetPath = fi.path();
    QDir examplesDir(offsetPath);
    QDir demosDir(offsetPath);

    QList<ExampleItem *> items;
    QXmlStreamReader reader(&exampleFile);
    while (!reader.atEnd()) {
        switch (reader.readNext()) {
        case QXmlStreamReader::StartElement:
            if (examples && reader.name() == QLatin1String("examples"))
                items += parseExamples(&reader, examplesDir.path(), examplesInstallPath);
            else if (examples && reader.name() == QLatin1String("demos"))
                items += parseDemos(&reader, demosDir.path(), demosInstallPath);
            else if (!examples && reader.name() == QLatin1String("tutorials"))
                items += parseTutorials(&reader, examplesDir.path());
            break;
        default: // nothing
            break;
        }
    }

    if (reader.hasError()) {
        qDeleteAll(items);
        return make_unexpected(QString("Could not parse file \"%1\" as XML document: %2:%3: %4")
                                   .arg(manifest)
                                   .arg(reader.lineNumber())
                                   .arg(reader.columnNumber())
                                   .arg(reader.errorString()));
    }
    return items;
}

} // namespace QtSupport::Internal
