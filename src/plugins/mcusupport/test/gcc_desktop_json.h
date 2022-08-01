/****************************************************************************
**
** Copyright (C) 2022 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Creator.
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
****************************************************************************/

#pragma once

constexpr auto gcc_desktop_json = R"({
  "qulVersion": "2.3.0",
  "compatVersion": "1",
  "platform": {
      "id": "Qt",
      "platformName": "Desktop",
      "vendor": "Qt",
      "colorDepths": [
          32
      ],
      "pathEntries": [
      ],
      "environmentEntries": [
      ],
      "cmakeEntries": [
         {
              "envVar": "Qul_DIR",
              "label": "Qt for MCUs SDK",
              "type": "path",
              "cmakeVar": "Qul_ROOT",
              "optional": false
         }
      ]
  },
  "toolchain": {
    "id": "gcc",
    "versions": [
      "9.4.0",
      "10.3.1"
    ],
    "compiler": {
      "defaultValue": "/usr",
      "versionDetection": {
          "filePattern": "bin/g++",
          "executableArgs": "--version",
          "regex": "\\b(\\d+\\.\\d+\\.\\d+)\\b"
      }
    }
  }
})";
