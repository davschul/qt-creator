import qbs 1.0

QtcPlugin {
    name: "TextEditor"

    Depends { name: "Qt"; submodules: ["widgets", "xml", "network", "script", "printsupport"] }
    Depends { name: "Aggregation" }
    Depends { name: "Utils" }

    Depends { name: "Core" }

    cpp.includePaths: base.concat([path]) // Needed for the highlighterengine autotest.

    files: [
        "autocompleter.cpp",
        "autocompleter.h",
        "basefilefind.cpp",
        "basefilefind.h",
        "basehoverhandler.cpp",
        "basehoverhandler.h",
        "behaviorsettings.cpp",
        "behaviorsettings.h",
        "behaviorsettingspage.cpp",
        "behaviorsettingspage.h",
        "behaviorsettingspage.ui",
        "behaviorsettingswidget.cpp",
        "behaviorsettingswidget.h",
        "behaviorsettingswidget.ui",
        "blockrange.h",
        "circularclipboard.cpp",
        "circularclipboard.h",
        "circularclipboardassist.cpp",
        "circularclipboardassist.h",
        "codecselector.cpp",
        "codecselector.h",
        "codestyleeditor.cpp",
        "codestyleeditor.h",
        "codestylepool.cpp",
        "codestylepool.h",
        "codestyleselectorwidget.cpp",
        "codestyleselectorwidget.h",
        "codestyleselectorwidget.ui",
        "colorpreviewhoverhandler.cpp",
        "colorpreviewhoverhandler.h",
        "colorscheme.cpp",
        "colorscheme.h",
        "colorschemeedit.cpp",
        "colorschemeedit.h",
        "colorschemeedit.ui",
        "completionsettings.cpp",
        "completionsettings.h",
        "convenience.cpp",
        "convenience.h",
        "displaysettings.cpp",
        "displaysettings.h",
        "displaysettingspage.cpp",
        "displaysettingspage.h",
        "displaysettingspage.ui",
        "extraencodingsettings.cpp",
        "extraencodingsettings.h",
        "findincurrentfile.cpp",
        "findincurrentfile.h",
        "findinfiles.cpp",
        "findinfiles.h",
        "findinopenfiles.cpp",
        "findinopenfiles.h",
        "fontsettings.cpp",
        "fontsettings.h",
        "fontsettingspage.cpp",
        "fontsettingspage.h",
        "fontsettingspage.ui",
        "helpitem.cpp",
        "helpitem.h",
        "highlighterutils.cpp",
        "highlighterutils.h",
        "icodestylepreferences.cpp",
        "icodestylepreferences.h",
        "icodestylepreferencesfactory.cpp",
        "icodestylepreferencesfactory.h",
        "indenter.cpp",
        "indenter.h",
        "ioutlinewidget.h",
        "linenumberfilter.cpp",
        "linenumberfilter.h",
        "marginsettings.cpp",
        "marginsettings.h",
        "normalindenter.cpp",
        "normalindenter.h",
        "outlinefactory.cpp",
        "outlinefactory.h",
        "plaintexteditorfactory.cpp",
        "plaintexteditorfactory.h",
        "quickfix.cpp",
        "quickfix.h",
        "refactoringchanges.cpp",
        "refactoringchanges.h",
        "refactoroverlay.cpp",
        "refactoroverlay.h",
        "semantichighlighter.cpp",
        "semantichighlighter.h",
        "simplecodestylepreferences.cpp",
        "simplecodestylepreferences.h",
        "simplecodestylepreferenceswidget.cpp",
        "simplecodestylepreferenceswidget.h",
        "storagesettings.cpp",
        "storagesettings.h",
        "syntaxhighlighter.cpp",
        "syntaxhighlighter.h",
        "tabsettings.cpp",
        "tabsettings.h",
        "tabsettingswidget.cpp",
        "tabsettingswidget.h",
        "tabsettingswidget.ui",
        "textdocument.cpp",
        "textdocument.h",
        "textdocumentlayout.cpp",
        "textdocumentlayout.h",
        "texteditor.cpp",
        "texteditor.h",
        "texteditor.qrc",
        "texteditor_global.h",
        "texteditor_p.h",
        "texteditoractionhandler.cpp",
        "texteditoractionhandler.h",
        "texteditorconstants.cpp",
        "texteditorconstants.h",
        "texteditoroptionspage.cpp",
        "texteditoroptionspage.h",
        "texteditoroverlay.cpp",
        "texteditoroverlay.h",
        "texteditorplugin.cpp",
        "texteditorplugin.h",
        "texteditorsettings.cpp",
        "texteditorsettings.h",
        "textmark.cpp",
        "textmark.h",
        "textmarkregistry.h",
        "textstyles.h",
        "typingsettings.cpp",
        "typingsettings.h",
    ]

    Group {
        name: "CodeAssist"
        prefix: "codeassist/"
        files: [
            "assistenums.h",
            "assistinterface.cpp",
            "assistinterface.h",
            "assistproposalitem.cpp",
            "assistproposalitem.h",
            "assistproposaliteminterface.h",
            "codeassistant.cpp",
            "codeassistant.h",
            "completionassistprovider.cpp",
            "completionassistprovider.h",
            "functionhintproposal.cpp",
            "functionhintproposal.h",
            "functionhintproposalwidget.cpp",
            "functionhintproposalwidget.h",
            "genericproposal.cpp",
            "genericproposal.h",
            "genericproposalmodel.cpp",
            "genericproposalmodel.h",
            "genericproposalwidget.cpp",
            "genericproposalwidget.h",
            "iassistprocessor.cpp",
            "iassistprocessor.h",
            "iassistproposal.cpp",
            "iassistproposal.h",
            "iassistproposalmodel.cpp",
            "iassistproposalmodel.h",
            "iassistproposalwidget.cpp",
            "iassistproposalwidget.h",
            "iassistprovider.cpp",
            "iassistprovider.h",
            "ifunctionhintproposalmodel.cpp",
            "ifunctionhintproposalmodel.h",
            "keywordscompletionassist.cpp",
            "keywordscompletionassist.h",
            "quickfixassistprocessor.cpp",
            "quickfixassistprocessor.h",
            "quickfixassistprovider.cpp",
            "quickfixassistprovider.h",
            "runner.cpp",
            "runner.h",
            "textdocumentmanipulator.cpp",
            "textdocumentmanipulator.h",
            "textdocumentmanipulatorinterface.h",
        ]
    }

    Group {
        name: "GenericHighlighter"
        prefix: "generichighlighter/"
        files: [
            "context.cpp",
            "context.h",
            "definitiondownloader.cpp",
            "definitiondownloader.h",
            "dynamicrule.cpp",
            "dynamicrule.h",
            "highlightdefinition.cpp",
            "highlightdefinition.h",
            "highlightdefinitionhandler.cpp",
            "highlightdefinitionhandler.h",
            "highlightdefinitionmetadata.h",
            "highlighter.cpp",
            "highlighter.h",
            "highlighterexception.h",
            "highlightersettings.cpp",
            "highlightersettings.h",
            "highlightersettingspage.cpp",
            "highlightersettingspage.h",
            "highlightersettingspage.ui",
            "includerulesinstruction.cpp",
            "includerulesinstruction.h",
            "itemdata.cpp",
            "itemdata.h",
            "keywordlist.cpp",
            "keywordlist.h",
            "managedefinitionsdialog.cpp",
            "managedefinitionsdialog.h",
            "managedefinitionsdialog.ui",
            "manager.cpp",
            "manager.h",
            "progressdata.cpp",
            "progressdata.h",
            "reuse.h",
            "rule.cpp",
            "rule.h",
            "specificrules.cpp",
            "specificrules.h",
        ]
    }

    Group {
        name: "Snippets"
        prefix: "snippets/"
        files: [
            "isnippetprovider.cpp",
            "isnippetprovider.h",
            "plaintextsnippetprovider.cpp",
            "plaintextsnippetprovider.h",
            "reuse.h",
            "snippet.cpp",
            "snippet.h",
            "snippetassistcollector.cpp",
            "snippetassistcollector.h",
            "snippeteditor.cpp",
            "snippeteditor.h",
            "snippetscollection.cpp",
            "snippetscollection.h",
            "snippetssettings.cpp",
            "snippetssettings.h",
            "snippetssettingspage.cpp",
            "snippetssettingspage.h",
            "snippetssettingspage.ui",
        ]
    }

    Group {
        name: "Tests"
        condition: project.testsEnabled
        files: [
            "texteditor_test.cpp",
        ]
    }
}
