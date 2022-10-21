/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
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

import QtQuick 2.15

QtObject {
    readonly property int width: 1920
    readonly property int height: 1080

    property FontLoader controlIcons: FontLoader {
        source: "icons.ttf"
    }

    objectName: "internalConstantsObject"

    readonly property string actionIcon: "\u0021"
    readonly property string actionIconBinding: "\u0022"
    readonly property string addColumnAfter: "\u0023"
    readonly property string addColumnBefore: "\u0024"
    readonly property string addFile: "\u0025"
    readonly property string addRowAfter: "\u0026"
    readonly property string addRowBefore: "\u0027"
    readonly property string addTable: "\u0028"
    readonly property string adsClose: "\u0029"
    readonly property string adsDetach: "\u002A"
    readonly property string adsDropDown: "\u002B"
    readonly property string alias: "\u002C"
    readonly property string aliasAnimated: "\u002D"
    readonly property string alignBottom: "\u002E"
    readonly property string alignCenterHorizontal: "\u002F"
    readonly property string alignCenterVertical: "\u0030"
    readonly property string alignLeft: "\u0031"
    readonly property string alignRight: "\u0032"
    readonly property string alignTo: "\u0033"
    readonly property string alignTop: "\u0034"
    readonly property string anchorBaseline: "\u0035"
    readonly property string anchorBottom: "\u0036"
    readonly property string anchorFill: "\u0037"
    readonly property string anchorLeft: "\u0038"
    readonly property string anchorRight: "\u0039"
    readonly property string anchorTop: "\u003A"
    readonly property string animatedProperty: "\u003B"
    readonly property string annotationBubble: "\u003C"
    readonly property string annotationDecal: "\u003D"
    readonly property string applyMaterialToSelected: "\u003E"
    readonly property string assign: "\u003F"
    readonly property string bevelAll: "\u0040"
    readonly property string bevelCorner: "\u0041"
    readonly property string centerHorizontal: "\u0042"
    readonly property string centerVertical: "\u0043"
    readonly property string closeCross: "\u0044"
    readonly property string closeLink: "\u0045"
    readonly property string colorPopupClose: "\u0046"
    readonly property string columnsAndRows: "\u0047"
    readonly property string copyLink: "\u0048"
    readonly property string copyStyle: "\u0049"
    readonly property string cornerA: "\u004A"
    readonly property string cornerB: "\u004B"
    readonly property string cornersAll: "\u004C"
    readonly property string curveDesigner: "\u004D"
    readonly property string curveEditor: "\u004E"
    readonly property string customMaterialEditor: "\u004F"
    readonly property string decisionNode: "\u0050"
    readonly property string deleteColumn: "\u0051"
    readonly property string deleteMaterial: "\u0052"
    readonly property string deleteRow: "\u0053"
    readonly property string deleteTable: "\u0054"
    readonly property string detach: "\u0055"
    readonly property string distributeBottom: "\u0056"
    readonly property string distributeCenterHorizontal: "\u0057"
    readonly property string distributeCenterVertical: "\u0058"
    readonly property string distributeLeft: "\u0059"
    readonly property string distributeOriginBottomRight: "\u005A"
    readonly property string distributeOriginCenter: "\u005B"
    readonly property string distributeOriginNone: "\u005C"
    readonly property string distributeOriginTopLeft: "\u005D"
    readonly property string distributeRight: "\u005E"
    readonly property string distributeSpacingHorizontal: "\u005F"
    readonly property string distributeSpacingVertical: "\u0060"
    readonly property string distributeTop: "\u0061"
    readonly property string download: "\u0062"
    readonly property string downloadUnavailable: "\u0063"
    readonly property string downloadUpdate: "\u0064"
    readonly property string downloaded: "\u0065"
    readonly property string edit: "\u0066"
    readonly property string eyeDropper: "\u0067"
    readonly property string favorite: "\u0068"
    readonly property string flowAction: "\u0069"
    readonly property string flowTransition: "\u006A"
    readonly property string fontStyleBold: "\u006B"
    readonly property string fontStyleItalic: "\u006C"
    readonly property string fontStyleStrikethrough: "\u006D"
    readonly property string fontStyleUnderline: "\u006E"
    readonly property string gradient: "\u006F"
    readonly property string gridView: "\u0070"
    readonly property string idAliasOff: "\u0071"
    readonly property string idAliasOn: "\u0072"
    readonly property string infinity: "\u0073"
    readonly property string keyframe: "\u0074"
    readonly property string linkTriangle: "\u0075"
    readonly property string linked: "\u0076"
    readonly property string listView: "\u0077"
    readonly property string lockOff: "\u0078"
    readonly property string lockOn: "\u0079"
    readonly property string materialPreviewEnvironment: "\u007A"
    readonly property string materialPreviewModel: "\u007B"
    readonly property string mergeCells: "\u007C"
    readonly property string minus: "\u007D"
    readonly property string mirror: "\u007E"
    readonly property string newMaterial: "\u007F"
    readonly property string openLink: "\u0080"
    readonly property string openMaterialBrowser: "\u0081"
    readonly property string orientation: "\u0082"
    readonly property string paddingEdge: "\u0083"
    readonly property string paddingFrame: "\u0084"
    readonly property string pasteStyle: "\u0085"
    readonly property string pause: "\u0086"
    readonly property string pin: "\u0087"
    readonly property string play: "\u0088"
    readonly property string plus: "\u0089"
    readonly property string promote: "\u008A"
    readonly property string readOnly: "\u008B"
    readonly property string redo: "\u008C"
    readonly property string rotationFill: "\u008D"
    readonly property string rotationOutline: "\u008E"
    readonly property string search: "\u008F"
    readonly property string sectionToggle: "\u0090"
    readonly property string splitColumns: "\u0091"
    readonly property string splitRows: "\u0092"
    readonly property string startNode: "\u0093"
    readonly property string testIcon: "\u0094"
    readonly property string textAlignBottom: "\u0095"
    readonly property string textAlignCenter: "\u0096"
    readonly property string textAlignJustified: "\u0097"
    readonly property string textAlignLeft: "\u0098"
    readonly property string textAlignMiddle: "\u0099"
    readonly property string textAlignRight: "\u009A"
    readonly property string textAlignTop: "\u009B"
    readonly property string textBulletList: "\u009D"
    readonly property string textFullJustification: "\u009E"
    readonly property string textNumberedList: "\u009F"
    readonly property string tickIcon: "\u00A0"
    readonly property string translationCreateFiles: "\u00A1"
    readonly property string translationCreateReport: "\u00A2"
    readonly property string translationExport: "\u00A3"
    readonly property string translationImport: "\u00A4"
    readonly property string translationSelectLanguages: "\u00A5"
    readonly property string translationTest: "\u00A6"
    readonly property string transparent: "\u00A7"
    readonly property string triState: "\u00A8"
    readonly property string triangleArcA: "\u00A9"
    readonly property string triangleArcB: "\u00AA"
    readonly property string triangleCornerA: "\u00AB"
    readonly property string triangleCornerB: "\u00AC"
    readonly property string unLinked: "\u00AE"
    readonly property string undo: "\u00AF"
    readonly property string unpin: "\u00B0"
    readonly property string upDownIcon: "\u00B1"
    readonly property string upDownSquare2: "\u00B2"
    readonly property string visibilityOff: "\u00B3"
    readonly property string visibilityOn: "\u00B4"
    readonly property string wildcard: "\u00B5"
    readonly property string wizardsAutomotive: "\u00B6"
    readonly property string wizardsDesktop: "\u00B7"
    readonly property string wizardsGeneric: "\u00B8"
    readonly property string wizardsMcuEmpty: "\u00B9"
    readonly property string wizardsMcuGraph: "\u00BA"
    readonly property string wizardsMobile: "\u00BB"
    readonly property string wizardsUnknown: "\u00BC"
    readonly property string zoomAll: "\u00BD"
    readonly property string zoomIn: "\u00BE"
    readonly property string zoomOut: "\u00BF"
    readonly property string zoomSelection: "\u00C0"

    readonly property font iconFont: Qt.font({
                                                 "family": controlIcons.name,
                                                 "pixelSize": 12
                                             })

    readonly property font font: Qt.font({
                                             "family": "Arial",
                                             "pointSize": Qt.application.font.pixelSize
                                         })

    readonly property font largeFont: Qt.font({
                                                  "family": "Arial",
                                                  "pointSize": Qt.application.font.pixelSize * 1.6
                                              })
}
