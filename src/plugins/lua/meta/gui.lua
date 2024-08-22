---@meta Gui

local gui = {}

---The base class of all ui related classes.
---@class Object
gui.Object = {}

---The base class of all gui layout classes.
---@class Layout : Object
gui.layout = {}

---The base class of all widget classes, an empty widget itself.
---@class Widget : Object
gui.widget = {}

---@alias LayoutChild string|BaseAspect|Layout|Widget|function
---@alias LayoutChildren LayoutChild[]

---@class WidgetAttributeMapT<T>: { [WidgetAttribute]: T }

---@class (exact) BaseWidgetOptions
---@field size? integer[] Two integers, representing the width and height of the widget.
---@field windowFlags? WindowType[] The window flags of the widget.
---@field widgetAttributes? WidgetAttributeMapT<boolean> The widget attributes of the widget.
---@field autoFillBackground? boolean A boolean, representing whether the widget should automatically fill its background.
gui.baseWidgetOptions = {}

---@class (exact) WidgetOptions : BaseWidgetOptions
---@field title? string The title of the widget, if applicable.
---@field onTextChanged? function The function to be called when the text of the widget changes, if applicable.
---@field onClicked? function The function to be called when the widget is clicked, if applicable.
---@field text? string The text of the widget, if applicable.
---@field value? integer The value of the widget, if applicable.
---@field [1]? Layout The layout of the widget, if applicable.
gui.widgetOptions = {}

---@param options WidgetOptions
---@return Widget
function gui.Widget(options) end

---Show the widget. (see [QWidget::show](https://doc.qt.io/qt-5/qwidget.html#show))
function gui.widget:show() end

---Sets the top-level widget containing this widget to be the active window. (see [QWidget::activateWindow](https://doc.qt.io/qt-5/qwidget.html#activateWindow))
function gui.widget:activateWindow() end

---Closes the widget. (see [QWidget::close](https://doc.qt.io/qt-5/qwidget.html#close))
function gui.widget:close() end

---Column layout
---@class Column : Layout
local column = {}

---@param children LayoutChildren
---@return Column
function gui.Column(children) end

---A group box with a title.
---@class Group : Widget
local group = {}

---@param options WidgetOptions
---@return Group
function gui.Group(options) end

---Row layout.
---@class Row : Layout
local row = {}

---@param children LayoutChildren
---@return Row
function gui.Row(children) end

---Flow layout.
---@class Flow : Layout
local flow = {}

---@param children LayoutChildren
---@return Flow
function gui.Flow(children) end

---Grid layout.
---@class Grid : Layout
local grid = {}

---@param children LayoutChildren
---@return Grid
function gui.Grid(children) end

---Form layout.
---@class Form : Layout
local form = {}

---@param children LayoutChildren
---@return Form
function gui.Form(children) end

---A stack of multiple widgets.
---@class Stack : Widget
local stack = {}

---@param options WidgetOptions
---@return Stack
function gui.Stack(options) end

---A Tab widget.
---@class Tab : Widget
local tab = {}

---@param name string
---@param layout Layout
---@return Tab
function gui.Tab(name, layout) end

---@class (exact) TabOptions
---@field [1] string The name of the tab.
---@field [2] Layout The layout of the tab.
gui.tabOptions = {}

---@param options TabOptions
---@return Tab tab The new tab.
function gui.Tab(options) end

---A Multiline text edit.
---@class TextEdit : Widget
local textEdit = {}

---@param options WidgetOptions
---@return TextEdit
function gui.TextEdit(options) end

---@class PushButton : Widget
local pushButton = {}

---@param options WidgetOptions
---@return PushButton
function gui.PushButton(options) end

---@class Label : Widget
local label = {}

---@param options WidgetOptions
---@return Label
function gui.Label(options) end

---@class SpinBox : Widget
local spinBox = {}

---@param options WidgetOptions
---@return SpinBox
function gui.SpinBox(options) end

---@class Splitter : Widget
local splitter = {}

---@alias Orientation "horizontal"|"vertical"

---@class (exact) SplitterOptions : BaseWidgetOptions
---@field orientation? Orientation The orientation of the splitter. (default: "vertical")
---@field childrenCollapsible? boolean A boolean, representing whether the children are collapsible. (default: true)
---@field stretchFactors? integer[] A list of integers, representing the stretch factors of the children. (default: {1, ...})
---@field size? integer[] Two integers, representing the width and height of the widget.
---@field [integer] Layout | Widget The splits.
gui.splitterOptions = {}

---@param options SplitterOptions
---@return Splitter
function gui.Splitter(options) end

---@class ToolBar : Widget
local toolBar = {}

---@param options WidgetOptions
---@return ToolBar
function gui.ToolBar(options) end

---@class TabWidget : Widget
local tabWidget = {}

---@param options Tab[]
---@return TabWidget
function gui.TabWidget(options) end

---@param name string
---@param child WidgetOptions
---@return TabWidget
function gui.TabWidget(name, child) end

---A "Line break" in the gui.
function gui.br() end

---A "Stretch" in the layout.
function gui.st() end

---An empty grid cell in a grid layout.
function gui.empty() end

---A horizontal line in the layout.
function gui.hr() end

---Clears the margin of the layout.
function gui.noMargin() end

---Sets the margin of the layout to the default value.
function gui.normalMargin() end

---Sets the alignment of a Grid layout according to the Form layout rules.
function gui.withFormAlignment() end

--- Enum representing various window types.
---@enum WindowType
gui.WindowType = {
    Widget = 0,
    Window = 0,
    Dialog = 0,
    Sheet = 0,
    Drawer = 0,
    Popup = 0,
    Tool = 0,
    ToolTip = 0,
    SplashScreen = 0,
    Desktop = 0,
    SubWindow = 0,
    ForeignWindow = 0,
    CoverWindow = 0,
    WindowType_Mask = 0,
    MSWindowsFixedSizeDialogHint = 0,
    MSWindowsOwnDC = 0,
    BypassWindowManagerHint = 0,
    X11BypassWindowManagerHint = 0,
    FramelessWindowHint = 0,
    WindowTitleHint = 0,
    WindowSystemMenuHint = 0,
    WindowMinimizeButtonHint = 0,
    WindowMaximizeButtonHint = 0,
    WindowMinMaxButtonsHint = 0,
    WindowContextHelpButtonHint = 0,
    WindowShadeButtonHint = 0,
    WindowStaysOnTopHint = 0,
    WindowTransparentForInput = 0,
    WindowOverridesSystemGestures = 0,
    WindowDoesNotAcceptFocus = 0,
    MaximizeUsingFullscreenGeometryHint = 0,
    CustomizeWindowHint = 0,
    WindowStaysOnBottomHint = 0,
    WindowCloseButtonHint = 0,
    MacWindowToolBarButtonHint = 0,
    BypassGraphicsProxyWidget = 0,
    NoDropShadowWindowHint = 0,
    WindowFullscreenButtonHint = 0,
}

---@enum (key) WidgetAttribute
gui.WidgetAttribute = {
    WA_Disabled = 0,
    WA_UnderMouse = 0,
    WA_MouseTracking = 0,
    WA_OpaquePaintEvent = 0,
    WA_StaticContents = 0,
    WA_LaidOut = 0,
    WA_PaintOnScreen = 0,
    WA_NoSystemBackground = 0,
    WA_UpdatesDisabled = 0,
    WA_Mapped = 0,
    WA_InputMethodEnabled = 0,
    WA_WState_Visible = 0,
    WA_WState_Hidden = 0,
    WA_ForceDisabled = 0,
    WA_KeyCompression = 0,
    WA_PendingMoveEvent = 0,
    WA_PendingResizeEvent = 0,
    WA_SetPalette = 0,
    WA_SetFont = 0,
    WA_SetCursor = 0,
    WA_NoChildEventsFromChildren = 0,
    WA_WindowModified = 0,
    WA_Resized = 0,
    WA_Moved = 0,
    WA_PendingUpdate = 0,
    WA_InvalidSize = 0,
    WA_CustomWhatsThis = 0,
    WA_LayoutOnEntireRect = 0,
    WA_OutsideWSRange = 0,
    WA_GrabbedShortcut = 0,
    WA_TransparentForMouseEvents = 0,
    WA_PaintUnclipped = 0,
    WA_SetWindowIcon = 0,
    WA_NoMouseReplay = 0,
    WA_DeleteOnClose = 0,
    WA_RightToLeft = 0,
    WA_SetLayoutDirection = 0,
    WA_NoChildEventsForParent = 0,
    WA_ForceUpdatesDisabled = 0,
    WA_WState_Created = 0,
    WA_WState_CompressKeys = 0,
    WA_WState_InPaintEvent = 0,
    WA_WState_Reparented = 0,
    WA_WState_ConfigPending = 0,
    WA_WState_Polished = 0,
    WA_WState_OwnSizePolicy = 0,
    WA_WState_ExplicitShowHide = 0,
    WA_ShowModal = 0,
    WA_MouseNoMask = 0,
    WA_NoMousePropagation = 0,
    WA_Hover = 0,
    WA_InputMethodTransparent = 0,
    WA_QuitOnClose = 0,
    WA_KeyboardFocusChange = 0,
    WA_AcceptDrops = 0,
    WA_DropSiteRegistered = 0,
    WA_WindowPropagation = 0,
    WA_NoX11EventCompression = 0,
    WA_TintedBackground = 0,
    WA_X11OpenGLOverlay = 0,
    WA_AlwaysShowToolTips = 0,
    WA_MacOpaqueSizeGrip = 0,
    WA_SetStyle = 0,
    WA_SetLocale = 0,
    WA_MacShowFocusRect = 0,
    WA_MacNormalSize = 0,
    WA_MacSmallSize = 0,
    WA_MacMiniSize = 0,
    WA_LayoutUsesWidgetRect = 0,
    WA_StyledBackground = 0,
    WA_CanHostQMdiSubWindowTitleBar = 0,
    WA_MacAlwaysShowToolWindow = 0,
    WA_StyleSheet = 0,
    WA_ShowWithoutActivating = 0,
    WA_X11BypassTransientForHint = 0,
    WA_NativeWindow = 0,
    WA_DontCreateNativeAncestors = 0,
    WA_DontShowOnScreen = 0,
    WA_X11NetWmWindowTypeDesktop = 0,
    WA_X11NetWmWindowTypeDock = 0,
    WA_X11NetWmWindowTypeToolBar = 0,
    WA_X11NetWmWindowTypeMenu = 0,
    WA_X11NetWmWindowTypeUtility = 0,
    WA_X11NetWmWindowTypeSplash = 0,
    WA_X11NetWmWindowTypeDialog = 0,
    WA_X11NetWmWindowTypeDropDownMenu = 0,
    WA_X11NetWmWindowTypePopupMenu = 0,
    WA_X11NetWmWindowTypeToolTip = 0,
    WA_X11NetWmWindowTypeNotification = 0,
    WA_X11NetWmWindowTypeCombo = 0,
    WA_X11NetWmWindowTypeDND = 0,
    WA_SetWindowModality = 0,
    WA_WState_WindowOpacitySet = 0,
    WA_TranslucentBackground = 0,
    WA_AcceptTouchEvents = 0,
    WA_WState_AcceptedTouchBeginEvent = 0,
    WA_TouchPadAcceptSingleTouchEvents = 0,
    WA_X11DoNotAcceptFocus = 0,
    WA_AlwaysStackOnTop = 0,
    WA_TabletTracking = 0,
    WA_ContentsMarginsRespectsSafeArea = 0,
    WA_StyleSheetTarget = 0
}
---@class Space : Layout
gui.space = {}

---Adds a non-strecthable space with size size to the layout.
---@param size integer size in pixels of the space.
---@return Space
function gui.Space(size) end

---@class Span : Layout
gui.span = {}

---@class SpanOptions
---@field [1] integer The number of columns to span.
---@field [2] Layout The inner layout to span.

---@class SpanOptionsWithRow
---@field [1] integer The number of columns to span.
---@field [2] integer The number of rows to span.
---@field [3] Layout The inner layout.

---@param options SpanOptions|SpanOptionsWithRow
---@return Span
function gui.Span(options) end

---@param col integer The number of columns to span.
---@param layout Layout The inner layout.
---@return Span
function gui.Span(col, layout) end

---@param col integer The number of columns to span.
---@param row integer The number of rows to span.
---@param layout Layout The inner layout.
---@return Span
function gui.Span(col, row, layout) end

---@class Stretch : Layout
gui.stretch = {}

---Adds a stretchable space to the layout.
---@param factor integer The factor by which the space should stretch.
function gui.Stretch(factor) end
return gui
