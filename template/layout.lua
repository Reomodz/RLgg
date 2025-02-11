---@alias hand_hourTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias searchMode
---| '"showSearchLabelAsBadge"' #0x04
---| '"showSearchIconAsBadge"' #0x08
---| '"queryRewriteFromData"' #0x10
---| '"queryRewriteFromText"' #0x20

---@alias foregroundTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias direction
---| '"left_to_right"' #0x0
---| '"right_to_left"' #0x1
---| '"top_to_bottom"' #0x0
---| '"bottom_to_top"' #0x2

---@alias zAdjustment
---| '"normal"' #0
---| '"top"' #1
---| '"bottom"' #-1

---@alias windowLayoutInDisplayCutoutMode
---| '"default"' #0
---| '"shortEdges"' #1
---| '"never"' #2
---| '"always"' #3

---@alias thumbPosition
---| '"midpoint"' #0
---| '"inside"' #1

---@alias controllerType
---| '"normal"' #0
---| '"micro"' #1

---@alias inputType
---| '"none"' #0x00000000
---| '"text"' #0x00000001
---| '"textCapCharacters"' #0x00001001
---| '"textCapWords"' #0x00002001
---| '"textCapSentences"' #0x00004001
---| '"textAutoCorrect"' #0x00008001
---| '"textAutoComplete"' #0x00010001
---| '"textMultiLine"' #0x00020001
---| '"textImeMultiLine"' #0x00040001
---| '"textNoSuggestions"' #0x00080001
---| '"textUri"' #0x00000011
---| '"textEmailAddress"' #0x00000021
---| '"textEmailSubject"' #0x00000031
---| '"textShortMessage"' #0x00000041
---| '"textLongMessage"' #0x00000051
---| '"textPersonName"' #0x00000061
---| '"textPostalAddress"' #0x00000071
---| '"textPassword"' #0x00000081
---| '"textVisiblePassword"' #0x00000091
---| '"textWebEditText"' #0x000000a1
---| '"textFilter"' #0x000000b1
---| '"textPhonetic"' #0x000000c1
---| '"textWebEmailAddress"' #0x000000d1
---| '"textWebPassword"' #0x000000e1
---| '"number"' #0x00000002
---| '"numberSigned"' #0x00001002
---| '"numberDecimal"' #0x00002002
---| '"numberPassword"' #0x00000012
---| '"phone"' #0x00000003
---| '"datetime"' #0x00000004
---| '"date"' #0x00000014
---| '"time"' #0x00000024

---@alias gestureStrokeType
---| '"single"' #0
---| '"multiple"' #1

---@alias justificationMode
---| '"none"' #0
---| '"inter_word"' #1

---@alias fontStyle
---| '"normal"' #0
---| '"italic"' #1

---@alias accessibilityFlags
---| '"flagDefault"' #0x00000001
---| '"flagIncludeNotImportantViews"' #0x00000002
---| '"flagRequestTouchExplorationMode"' #0x00000004
---| '"flagRequestEnhancedWebAccessibility"' #0x00000008
---| '"flagReportViewIds"' #0x00000010
---| '"flagRequestFilterKeyEvents"' #0x00000020
---| '"flagRetrieveInteractiveWindows"' #0x00000040
---| '"flagEnableAccessibilityVolume"' #0x00000080
---| '"flagRequestAccessibilityButton"' #0x00000100
---| '"flagRequestFingerprintGestures"' #0x00000200
---| '"flagRequestShortcutWarningDialogSpokenFeedback"' #0x00000400
---| '"flagServiceHandlesDoubleTap"' #0x00000800
---| '"flagRequestMultiFingerGestures"' #0x00001000
---| '"flagSendMotionEvents"' #0x0004000

---@alias alignmentMode
---| '"alignBounds"' #0
---| '"alignMargins"' #1

---@alias drawableTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias calendarViewMode
---| '"holo"' #0
---| '"material"' #1

---@alias secondaryProgressTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias tintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias persistentDrawingCache
---| '"none"' #0x0
---| '"animation"' #0x1
---| '"scrolling"' #0x2
---| '"all"' #0x3

---@alias capitalize
---| '"none"' #0
---| '"sentences"' #1
---| '"words"' #2
---| '"characters"' #3

---@alias displayOptions
---| '"none"' #0
---| '"useLogo"' #0x1
---| '"showHome"' #0x2
---| '"homeAsUp"' #0x4
---| '"showTitle"' #0x8
---| '"showCustom"' #0x10
---| '"disableHome"' #0x20

---@alias descendantFocusability
---| '"beforeDescendants"' #0
---| '"afterDescendants"' #1
---| '"blocksDescendants"' #2

---@alias searchKeyphraseRecognitionFlags
---| '"none"' #0
---| '"voiceTrigger"' #0x1
---| '"userIdentification"' #0x2

---@alias windowSoftInputMode
---| '"stateUnspecified"' #0
---| '"stateUnchanged"' #1
---| '"stateHidden"' #2
---| '"stateAlwaysHidden"' #3
---| '"stateVisible"' #4
---| '"stateAlwaysVisible"' #5
---| '"adjustUnspecified"' #0x00
---| '"adjustResize"' #0x10
---| '"adjustPan"' #0x20
---| '"adjustNothing"' #0x30

---@alias typeface
---| '"normal"' #0
---| '"sans"' #1
---| '"serif"' #2
---| '"monospace"' #3

---@alias stretchMode
---| '"none"' #0
---| '"spacingWidth"' #1
---| '"columnWidth"' #2
---| '"spacingWidthUniform"' #3

---@alias rowEdgeFlags
---| '"top"' #4
---| '"bottom"' #8

---@alias trackTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias dialTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias verticalScrollbarPosition
---| '"defaultPosition"' #0
---| '"left"' #1
---| '"right"' #2

---@alias backgroundTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias indeterminateBehavior
---| '"repeat"' #1
---| '"cycle"' #2

---@alias checkMarkGravity
---| '"left"' #0x03
---| '"right"' #0x05
---| '"start"' #0x00800003
---| '"end"' #0x00800005

---@alias alphabeticModifiers
---| '"META"' #0x10000
---| '"CTRL"' #0x1000
---| '"ALT"' #0x02
---| '"SHIFT"' #0x1
---| '"SYM"' #0x4
---| '"FUNCTION"' #0x8

---@alias thumbTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias drawingCacheQuality
---| '"auto"' #0
---| '"low"' #1
---| '"high"' #2

---@alias layerType
---| '"none"' #0
---| '"software"' #1
---| '"hardware"' #2

---@alias iconTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias textStyle
---| '"normal"' #0
---| '"bold"' #1
---| '"italic"' #2

---@alias numeric
---| '"integer"' #0x01
---| '"signed"' #0x03
---| '"decimal"' #0x05

---@alias scrollbars
---| '"none"' #0x00000000
---| '"horizontal"' #0x00000100
---| '"vertical"' #0x00000200

---@alias scrollbarStyle
---| '"insideOverlay"' #0x0
---| '"insideInset"' #0x01000000
---| '"outsideOverlay"' #0x02000000
---| '"outsideInset"' #0x03000000

---@alias autoLink
---| '"none"' #0x00
---| '"web"' #0x01
---| '"email"' #0x02
---| '"phone"' #0x04
---| '"map"' #0x08
---| '"all"' #0x0f

---@alias scrollIndicators
---| '"none"' #0x00
---| '"top"' #0x01
---| '"bottom"' #0x02
---| '"left"' #0x04
---| '"right"' #0x08
---| '"start"' #0x10
---| '"end"' #0x20

---@alias type
---| '"linear"' #0
---| '"radial"' #1
---| '"sweep"' #2

---@alias hand_secondTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias overScrollMode
---| '"always"' #0
---| '"ifContentScrolls"' #1
---| '"never"' #2

---@alias progressBackgroundTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias ellipsize
---| '"none"' #0
---| '"start"' #1
---| '"middle"' #2
---| '"end"' #3
---| '"marquee"' #4

---@alias hyphenationFrequency
---| '"none"' #0
---| '"normal"' #1
---| '"full"' #2

---@alias menuCategory
---| '"container"' #0x00010000
---| '"system"' #0x00020000
---| '"secondary"' #0x00030000
---| '"alternative"' #0x00040000

---@alias buttonGravity
---| '"top"' #0x30
---| '"bottom"' #0x50

---@alias restrictionType
---| '"hidden"' #0
---| '"bool"' #1
---| '"choice"' #2
---| '"multi-select"' #4
---| '"integer"' #5
---| '"string"' #6
---| '"bundle"' #7
---| '"bundle_array"' #8

---@alias scaleGravity
---| '"top"' #0x30
---| '"bottom"' #0x50
---| '"left"' #0x03
---| '"right"' #0x05
---| '"center_vertical"' #0x10
---| '"fill_vertical"' #0x70
---| '"center_horizontal"' #0x01
---| '"fill_horizontal"' #0x07
---| '"center"' #0x11
---| '"fill"' #0x77
---| '"clip_vertical"' #0x80
---| '"clip_horizontal"' #0x08
---| '"start"' #0x00800003
---| '"end"' #0x00800005

---@alias clipOrientation
---| '"horizontal"' #1
---| '"vertical"' #2

---@alias buttonTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias importantForContentCapture
---| '"auto"' #0
---| '"yes"' #0x1
---| '"no"' #0x2
---| '"yesExcludeDescendants"' #0x4
---| '"noExcludeDescendants"' #0x8

---@alias directionPriority
---| '"none"' #0
---| '"column"' #1
---| '"row"' #2

---@alias choiceMode
---| '"none"' #0
---| '"singleChoice"' #1
---| '"multipleChoice"' #2
---| '"multipleChoiceModal"' #3

---@alias pointerIcon
---| '"none"' #0
---| '"arrow"' #1000
---| '"context_menu"' #1001
---| '"hand"' #1002
---| '"help"' #1003
---| '"wait"' #1004
---| '"cell"' #1006
---| '"crosshair"' #1007
---| '"text"' #1008
---| '"vertical_text"' #1009
---| '"alias"' #1010
---| '"copy"' #1011
---| '"no_drop"' #1012
---| '"all_scroll"' #1013
---| '"horizontal_double_arrow"' #1014
---| '"vertical_double_arrow"' #1015
---| '"top_right_diagonal_double_arrow"' #1016
---| '"top_left_diagonal_double_arrow"' #1017
---| '"zoom_in"' #1018
---| '"zoom_out"' #1019
---| '"grab"' #1020
---| '"grabbing"' #1021

---@alias checkableBehavior
---| '"none"' #0
---| '"all"' #1
---| '"single"' #2

---@alias gravity
---| '"top"' #0x30
---| '"bottom"' #0x50
---| '"left"' #0x03
---| '"right"' #0x05
---| '"center_vertical"' #0x10
---| '"fill_vertical"' #0x70
---| '"center_horizontal"' #0x01
---| '"fill_horizontal"' #0x07
---| '"center"' #0x11
---| '"fill"' #0x77
---| '"clip_vertical"' #0x80
---| '"clip_horizontal"' #0x08
---| '"start"' #0x00800003
---| '"end"' #0x00800005

---@alias voiceSearchMode
---| '"showVoiceSearchButton"' #0x01
---| '"launchWebSearch"' #0x02
---| '"launchRecognizer"' #0x04

---@alias position
---| '"floating"' #0
---| '"atThumb"' #1
---| '"aboveThumb"' #2

---@alias checkMarkTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias numericModifiers
---| '"META"' #0x10000
---| '"CTRL"' #0x1000
---| '"ALT"' #0x02
---| '"SHIFT"' #0x1
---| '"SYM"' #0x4
---| '"FUNCTION"' #0x8

---@alias fastScrollOverlayPosition
---| '"floating"' #0
---| '"atThumb"' #1
---| '"aboveThumb"' #2

---@alias fadingEdge
---| '"none"' #0x00000000
---| '"horizontal"' #0x00001000
---| '"vertical"' #0x00002000

---@alias tickMarkTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias accessibilityFeedbackType
---| '"feedbackSpoken"' #0x00000001
---| '"feedbackHaptic"' #0x00000002
---| '"feedbackAudible"' #0x00000004
---| '"feedbackVisual"' #0x00000008
---| '"feedbackGeneric"' #0x00000010
---| '"feedbackAllMask"' #0xffffffff

---@alias layout_childType
---| '"none"' #0
---| '"widget"' #1
---| '"challenge"' #2
---| '"userSwitcher"' #3
---| '"scrim"' #4
---| '"widgets"' #5
---| '"expandChallengeHandle"' #6
---| '"pageDeleteDropTarget"' #7

---@alias scrollCaptureHint
---| '"auto"' #0
---| '"include"' #0x1
---| '"exclude"' #0x2
---| '"excludeDescendants"' #0x4

---@alias indeterminateTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias accessibilityEventTypes
---| '"typeViewClicked"' #0x00000001
---| '"typeViewLongClicked"' #0x00000002
---| '"typeViewSelected"' #0x00000004
---| '"typeViewFocused"' #0x00000008
---| '"typeViewTextChanged"' #0x00000010
---| '"typeWindowStateChanged"' #0x00000020
---| '"typeNotificationStateChanged"' #0x00000040
---| '"typeViewHoverEnter"' #0x00000080
---| '"typeViewHoverExit"' #0x00000100
---| '"typeTouchExplorationGestureStart"' #0x00000200
---| '"typeTouchExplorationGestureEnd"' #0x00000400
---| '"typeWindowContentChanged"' #0x00000800
---| '"typeViewScrolled"' #0x000001000
---| '"typeViewTextSelectionChanged"' #0x000002000
---| '"typeAnnouncement"' #0x00004000
---| '"typeViewAccessibilityFocused"' #0x00008000
---| '"typeViewAccessibilityFocusCleared"' #0x00010000
---| '"typeViewTextTraversedAtMovementGranularity"' #0x00020000
---| '"typeGestureDetectionStart"' #0x00040000
---| '"typeGestureDetectionEnd"' #0x00080000
---| '"typeTouchInteractionStart"' #0x00100000
---| '"typeTouchInteractionEnd"' #0x00200000
---| '"typeWindowsChanged"' #0x00400000
---| '"typeContextClicked"' #0x00800000
---| '"typeAssistReadingContext"' #0x01000000
---| '"typeAllMask"' #0xffffffff

---@alias datePickerMode
---| '"spinner"' #1
---| '"calendar"' #2

---@alias showAsAction
---| '"never"' #0
---| '"ifRoom"' #1
---| '"always"' #2
---| '"withText"' #4
---| '"collapseActionView"' #8

---@alias valueType
---| '"floatType"' #0
---| '"intType"' #1
---| '"pathType"' #2
---| '"colorType"' #3

---@alias foregroundGravity
---| '"top"' #0x30
---| '"bottom"' #0x50
---| '"left"' #0x03
---| '"right"' #0x05
---| '"center_vertical"' #0x10
---| '"fill_vertical"' #0x70
---| '"center_horizontal"' #0x01
---| '"fill_horizontal"' #0x07
---| '"center"' #0x11
---| '"fill"' #0x77
---| '"clip_vertical"' #0x80
---| '"clip_horizontal"' #0x08

---@alias transcriptMode
---| '"disabled"' #0
---| '"normal"' #1
---| '"alwaysScroll"' #2

---@alias progressTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias repeatMode
---| '"restart"' #1
---| '"reverse"' #2

---@alias outlineProvider
---| '"background"' #0
---| '"none"' #1
---| '"bounds"' #2
---| '"paddedBounds"' #3

---@alias tileModeX
---| '"disabled"' #-1
---| '"clamp"' #0
---| '"repeat"' #1
---| '"mirror"' #2

---@alias navigationMode
---| '"normal"' #0
---| '"listMode"' #1
---| '"tabMode"' #2

---@alias timePickerMode
---| '"spinner"' #1
---| '"clock"' #2

---@alias orientation
---| '"horizontal"' #0
---| '"vertical"' #1

---@alias opacity
---| '"opaque"' #-1
---| '"transparent"' #-2
---| '"translucent"' #-3

---@alias shape
---| '"rectangle"' #0
---| '"oval"' #1
---| '"line"' #2
---| '"ring"' #3

---@alias hand_minuteTintMode
---| '"src_over"' #3
---| '"src_in"' #5
---| '"src_atop"' #9
---| '"multiply"' #14
---| '"screen"' #15
---| '"add"' #16

---@alias requiresFadingEdge
---| '"none"' #0x00000000
---| '"horizontal"' #0x00001000
---| '"vertical"' #0x00002000

---@alias layoutDirection
---| '"ltr"' #0
---| '"rtl"' #1
---| '"inherit"' #2
---| '"locale"' #3

---@alias ringtoneType
---| '"ringtone"' #1
---| '"notification"' #2
---| '"alarm"' #4
---| '"all"' #7

---@alias bufferType
---| '"normal"' #0
---| '"spannable"' #1
---| '"editable"' #2

---@alias keycode
---| '"KEYCODE_UNKNOWN"' #0
---| '"KEYCODE_SOFT_LEFT"' #1
---| '"KEYCODE_SOFT_RIGHT"' #2
---| '"KEYCODE_HOME"' #3
---| '"KEYCODE_BACK"' #4
---| '"KEYCODE_CALL"' #5
---| '"KEYCODE_ENDCALL"' #6
---| '"KEYCODE_0"' #7
---| '"KEYCODE_1"' #8
---| '"KEYCODE_2"' #9
---| '"KEYCODE_3"' #10
---| '"KEYCODE_4"' #11
---| '"KEYCODE_5"' #12
---| '"KEYCODE_6"' #13
---| '"KEYCODE_7"' #14
---| '"KEYCODE_8"' #15
---| '"KEYCODE_9"' #16
---| '"KEYCODE_STAR"' #17
---| '"KEYCODE_POUND"' #18
---| '"KEYCODE_DPAD_UP"' #19
---| '"KEYCODE_DPAD_DOWN"' #20
---| '"KEYCODE_DPAD_LEFT"' #21
---| '"KEYCODE_DPAD_RIGHT"' #22
---| '"KEYCODE_DPAD_CENTER"' #23
---| '"KEYCODE_VOLUME_UP"' #24
---| '"KEYCODE_VOLUME_DOWN"' #25
---| '"KEYCODE_POWER"' #26
---| '"KEYCODE_CAMERA"' #27
---| '"KEYCODE_CLEAR"' #28
---| '"KEYCODE_A"' #29
---| '"KEYCODE_B"' #30
---| '"KEYCODE_C"' #31
---| '"KEYCODE_D"' #32
---| '"KEYCODE_E"' #33
---| '"KEYCODE_F"' #34
---| '"KEYCODE_G"' #35
---| '"KEYCODE_H"' #36
---| '"KEYCODE_I"' #37
---| '"KEYCODE_J"' #38
---| '"KEYCODE_K"' #39
---| '"KEYCODE_L"' #40
---| '"KEYCODE_M"' #41
---| '"KEYCODE_N"' #42
---| '"KEYCODE_O"' #43
---| '"KEYCODE_P"' #44
---| '"KEYCODE_Q"' #45
---| '"KEYCODE_R"' #46
---| '"KEYCODE_S"' #47
---| '"KEYCODE_T"' #48
---| '"KEYCODE_U"' #49
---| '"KEYCODE_V"' #50
---| '"KEYCODE_W"' #51
---| '"KEYCODE_X"' #52
---| '"KEYCODE_Y"' #53
---| '"KEYCODE_Z"' #54
---| '"KEYCODE_COMMA"' #55
---| '"KEYCODE_PERIOD"' #56
---| '"KEYCODE_ALT_LEFT"' #57
---| '"KEYCODE_ALT_RIGHT"' #58
---| '"KEYCODE_SHIFT_LEFT"' #59
---| '"KEYCODE_SHIFT_RIGHT"' #60
---| '"KEYCODE_TAB"' #61
---| '"KEYCODE_SPACE"' #62
---| '"KEYCODE_SYM"' #63
---| '"KEYCODE_EXPLORER"' #64
---| '"KEYCODE_ENVELOPE"' #65
---| '"KEYCODE_ENTER"' #66
---| '"KEYCODE_DEL"' #67
---| '"KEYCODE_GRAVE"' #68
---| '"KEYCODE_MINUS"' #69
---| '"KEYCODE_EQUALS"' #70
---| '"KEYCODE_LEFT_BRACKET"' #71
---| '"KEYCODE_RIGHT_BRACKET"' #72
---| '"KEYCODE_BACKSLASH"' #73
---| '"KEYCODE_SEMICOLON"' #74
---| '"KEYCODE_APOSTROPHE"' #75
---| '"KEYCODE_SLASH"' #76
---| '"KEYCODE_AT"' #77
---| '"KEYCODE_NUM"' #78
---| '"KEYCODE_HEADSETHOOK"' #79
---| '"KEYCODE_FOCUS"' #80
---| '"KEYCODE_PLUS"' #81
---| '"KEYCODE_MENU"' #82
---| '"KEYCODE_NOTIFICATION"' #83
---| '"KEYCODE_SEARCH"' #84
---| '"KEYCODE_MEDIA_PLAY_PAUSE"' #85
---| '"KEYCODE_MEDIA_STOP"' #86
---| '"KEYCODE_MEDIA_NEXT"' #87
---| '"KEYCODE_MEDIA_PREVIOUS"' #88
---| '"KEYCODE_MEDIA_REWIND"' #89
---| '"KEYCODE_MEDIA_FAST_FORWARD"' #90
---| '"KEYCODE_MUTE"' #91
---| '"KEYCODE_PAGE_UP"' #92
---| '"KEYCODE_PAGE_DOWN"' #93
---| '"KEYCODE_PICTSYMBOLS"' #94
---| '"KEYCODE_SWITCH_CHARSET"' #95
---| '"KEYCODE_BUTTON_A"' #96
---| '"KEYCODE_BUTTON_B"' #97
---| '"KEYCODE_BUTTON_C"' #98
---| '"KEYCODE_BUTTON_X"' #99
---| '"KEYCODE_BUTTON_Y"' #100
---| '"KEYCODE_BUTTON_Z"' #101
---| '"KEYCODE_BUTTON_L1"' #102
---| '"KEYCODE_BUTTON_R1"' #103
---| '"KEYCODE_BUTTON_L2"' #104
---| '"KEYCODE_BUTTON_R2"' #105
---| '"KEYCODE_BUTTON_THUMBL"' #106
---| '"KEYCODE_BUTTON_THUMBR"' #107
---| '"KEYCODE_BUTTON_START"' #108
---| '"KEYCODE_BUTTON_SELECT"' #109
---| '"KEYCODE_BUTTON_MODE"' #110
---| '"KEYCODE_ESCAPE"' #111
---| '"KEYCODE_FORWARD_DEL"' #112
---| '"KEYCODE_CTRL_LEFT"' #113
---| '"KEYCODE_CTRL_RIGHT"' #114
---| '"KEYCODE_CAPS_LOCK"' #115
---| '"KEYCODE_SCROLL_LOCK"' #116
---| '"KEYCODE_META_LEFT"' #117
---| '"KEYCODE_META_RIGHT"' #118
---| '"KEYCODE_FUNCTION"' #119
---| '"KEYCODE_SYSRQ"' #120
---| '"KEYCODE_BREAK"' #121
---| '"KEYCODE_MOVE_HOME"' #122
---| '"KEYCODE_MOVE_END"' #123
---| '"KEYCODE_INSERT"' #124
---| '"KEYCODE_FORWARD"' #125
---| '"KEYCODE_MEDIA_PLAY"' #126
---| '"KEYCODE_MEDIA_PAUSE"' #127
---| '"KEYCODE_MEDIA_CLOSE"' #128
---| '"KEYCODE_MEDIA_EJECT"' #129
---| '"KEYCODE_MEDIA_RECORD"' #130
---| '"KEYCODE_F1"' #131
---| '"KEYCODE_F2"' #132
---| '"KEYCODE_F3"' #133
---| '"KEYCODE_F4"' #134
---| '"KEYCODE_F5"' #135
---| '"KEYCODE_F6"' #136
---| '"KEYCODE_F7"' #137
---| '"KEYCODE_F8"' #138
---| '"KEYCODE_F9"' #139
---| '"KEYCODE_F10"' #140
---| '"KEYCODE_F11"' #141
---| '"KEYCODE_F12"' #142
---| '"KEYCODE_NUM_LOCK"' #143
---| '"KEYCODE_NUMPAD_0"' #144
---| '"KEYCODE_NUMPAD_1"' #145
---| '"KEYCODE_NUMPAD_2"' #146
---| '"KEYCODE_NUMPAD_3"' #147
---| '"KEYCODE_NUMPAD_4"' #148
---| '"KEYCODE_NUMPAD_5"' #149
---| '"KEYCODE_NUMPAD_6"' #150
---| '"KEYCODE_NUMPAD_7"' #151
---| '"KEYCODE_NUMPAD_8"' #152
---| '"KEYCODE_NUMPAD_9"' #153
---| '"KEYCODE_NUMPAD_DIVIDE"' #154
---| '"KEYCODE_NUMPAD_MULTIPLY"' #155
---| '"KEYCODE_NUMPAD_SUBTRACT"' #156
---| '"KEYCODE_NUMPAD_ADD"' #157
---| '"KEYCODE_NUMPAD_DOT"' #158
---| '"KEYCODE_NUMPAD_COMMA"' #159
---| '"KEYCODE_NUMPAD_ENTER"' #160
---| '"KEYCODE_NUMPAD_EQUALS"' #161
---| '"KEYCODE_NUMPAD_LEFT_PAREN"' #162
---| '"KEYCODE_NUMPAD_RIGHT_PAREN"' #163
---| '"KEYCODE_VOLUME_MUTE"' #164
---| '"KEYCODE_INFO"' #165
---| '"KEYCODE_CHANNEL_UP"' #166
---| '"KEYCODE_CHANNEL_DOWN"' #167
---| '"KEYCODE_ZOOM_IN"' #168
---| '"KEYCODE_ZOOM_OUT"' #169
---| '"KEYCODE_TV"' #170
---| '"KEYCODE_WINDOW"' #171
---| '"KEYCODE_GUIDE"' #172
---| '"KEYCODE_DVR"' #173
---| '"KEYCODE_BOOKMARK"' #174
---| '"KEYCODE_CAPTIONS"' #175
---| '"KEYCODE_SETTINGS"' #176
---| '"KEYCODE_TV_POWER"' #177
---| '"KEYCODE_TV_INPUT"' #178
---| '"KEYCODE_STB_POWER"' #179
---| '"KEYCODE_STB_INPUT"' #180
---| '"KEYCODE_AVR_POWER"' #181
---| '"KEYCODE_AVR_INPUT"' #182
---| '"KEYCODE_PROG_GRED"' #183
---| '"KEYCODE_PROG_GREEN"' #184
---| '"KEYCODE_PROG_YELLOW"' #185
---| '"KEYCODE_PROG_BLUE"' #186
---| '"KEYCODE_APP_SWITCH"' #187
---| '"KEYCODE_BUTTON_1"' #188
---| '"KEYCODE_BUTTON_2"' #189
---| '"KEYCODE_BUTTON_3"' #190
---| '"KEYCODE_BUTTON_4"' #191
---| '"KEYCODE_BUTTON_5"' #192
---| '"KEYCODE_BUTTON_6"' #193
---| '"KEYCODE_BUTTON_7"' #194
---| '"KEYCODE_BUTTON_8"' #195
---| '"KEYCODE_BUTTON_9"' #196
---| '"KEYCODE_BUTTON_10"' #197
---| '"KEYCODE_BUTTON_11"' #198
---| '"KEYCODE_BUTTON_12"' #199
---| '"KEYCODE_BUTTON_13"' #200
---| '"KEYCODE_BUTTON_14"' #201
---| '"KEYCODE_BUTTON_15"' #202
---| '"KEYCODE_BUTTON_16"' #203
---| '"KEYCODE_LANGUAGE_SWITCH"' #204
---| '"KEYCODE_MANNER_MODE"' #205
---| '"KEYCODE_3D_MODE"' #206
---| '"KEYCODE_CONTACTS"' #207
---| '"KEYCODE_CALENDAR"' #208
---| '"KEYCODE_MUSIC"' #209
---| '"KEYCODE_CALCULATOR"' #210
---| '"KEYCODE_ZENKAKU_HANKAKU"' #211
---| '"KEYCODE_EISU"' #212
---| '"KEYCODE_MUHENKAN"' #213
---| '"KEYCODE_HENKAN"' #214
---| '"KEYCODE_KATAKANA_HIRAGANA"' #215
---| '"KEYCODE_YEN"' #216
---| '"KEYCODE_RO"' #217
---| '"KEYCODE_KANA"' #218
---| '"KEYCODE_ASSIST"' #219
---| '"KEYCODE_BRIGHTNESS_DOWN"' #220
---| '"KEYCODE_BRIGHTNESS_UP"' #221
---| '"KEYCODE_MEDIA_AUDIO_TRACK"' #222
---| '"KEYCODE_MEDIA_SLEEP"' #223
---| '"KEYCODE_MEDIA_WAKEUP"' #224
---| '"KEYCODE_PAIRING"' #225
---| '"KEYCODE_MEDIA_TOP_MENU"' #226
---| '"KEYCODE_11"' #227
---| '"KEYCODE_12"' #228
---| '"KEYCODE_LAST_CHANNEL"' #229
---| '"KEYCODE_TV_DATA_SERVICE"' #230
---| '"KEYCODE_VOICE_ASSIST"' #231
---| '"KEYCODE_TV_RADIO_SERVICE"' #232
---| '"KEYCODE_TV_TELETEXT"' #233
---| '"KEYCODE_TV_NUMBER_ENTRY"' #234
---| '"KEYCODE_TV_TERRESTRIAL_ANALOG"' #235
---| '"KEYCODE_TV_TERRESTRIAL_DIGITAL"' #236
---| '"KEYCODE_TV_SATELLITE"' #237
---| '"KEYCODE_TV_SATELLITE_BS"' #238
---| '"KEYCODE_TV_SATELLITE_CS"' #239
---| '"KEYCODE_TV_SATELLITE_SERVICE"' #240
---| '"KEYCODE_TV_NETWORK"' #241
---| '"KEYCODE_TV_ANTENNA_CABLE"' #242
---| '"KEYCODE_TV_INPUT_HDMI_1"' #243
---| '"KEYCODE_TV_INPUT_HDMI_2"' #244
---| '"KEYCODE_TV_INPUT_HDMI_3"' #245
---| '"KEYCODE_TV_INPUT_HDMI_4"' #246
---| '"KEYCODE_TV_INPUT_COMPOSITE_1"' #247
---| '"KEYCODE_TV_INPUT_COMPOSITE_2"' #248
---| '"KEYCODE_TV_INPUT_COMPONENT_1"' #249
---| '"KEYCODE_TV_INPUT_COMPONENT_2"' #250
---| '"KEYCODE_TV_INPUT_VGA_1"' #251
---| '"KEYCODE_TV_AUDIO_DESCRIPTION"' #252
---| '"KEYCODE_TV_AUDIO_DESCRIPTION_MIX_UP"' #253
---| '"KEYCODE_TV_AUDIO_DESCRIPTION_MIX_DOWN"' #254
---| '"KEYCODE_TV_ZOOM_MODE"' #255
---| '"KEYCODE_TV_CONTENTS_MENU"' #256
---| '"KEYCODE_TV_MEDIA_CONTEXT_MENU"' #257
---| '"KEYCODE_TV_TIMER_PROGRAMMING"' #258
---| '"KEYCODE_HELP"' #259
---| '"KEYCODE_NAVIGATE_PREVIOUS"' #260
---| '"KEYCODE_NAVIGATE_NEXT"' #261
---| '"KEYCODE_NAVIGATE_IN"' #262
---| '"KEYCODE_NAVIGATE_OUT"' #263
---| '"KEYCODE_STEM_PRIMARY"' #264
---| '"KEYCODE_STEM_1"' #265
---| '"KEYCODE_STEM_2"' #266
---| '"KEYCODE_STEM_3"' #267
---| '"KEYCODE_DPAD_UP_LEFT"' #268
---| '"KEYCODE_DPAD_DOWN_LEFT"' #269
---| '"KEYCODE_DPAD_UP_RIGHT"' #270
---| '"KEYCODE_DPAD_DOWN_RIGHT"' #271
---| '"KEYCODE_MEDIA_SKIP_FORWARD"' #272
---| '"KEYCODE_MEDIA_SKIP_BACKWARD"' #273
---| '"KEYCODE_MEDIA_STEP_FORWARD"' #274
---| '"KEYCODE_MEDIA_STEP_BACKWARD"' #275
---| '"KEYCODE_SOFT_SLEEP"' #276
---| '"KEYCODE_CUT"' #277
---| '"KEYCODE_COPY"' #278
---| '"KEYCODE_PASTE"' #279
---| '"KEYCODE_SYSTEM_NAVIGATION_UP"' #280
---| '"KEYCODE_SYSTEM_NAVIGATION_DOWN"' #281
---| '"KEYCODE_SYSTEM_NAVIGATION_LEFT"' #282
---| '"KEYCODE_SYSTEM_NAVIGATION_RIGHT"' #283
---| '"KEYCODE_ALL_APPS"' #284
---| '"KEYCODE_REFRESH"' #285
---| '"KEYCODE_THUMBS_UP"' #286
---| '"KEYCODE_THUMBS_DOWN"' #287
---| '"KEYCODE_PROFILE_SWITCH"' #288

---@alias layout_gravity
---| '"top"' #0x30
---| '"bottom"' #0x50
---| '"left"' #0x03
---| '"right"' #0x05
---| '"center_vertical"' #0x10
---| '"fill_vertical"' #0x70
---| '"center_horizontal"' #0x01
---| '"fill_horizontal"' #0x07
---| '"center"' #0x11
---| '"fill"' #0x77
---| '"clip_vertical"' #0x80
---| '"clip_horizontal"' #0x08
---| '"start"' #0x00800003
---| '"end"' #0x00800005

---@alias paddingMode
---| '"nest"' #0
---| '"stack"' #1

---@alias showDividers
---| '"none"' #0
---| '"beginning"' #1
---| '"middle"' #2
---| '"end"' #4

---@alias tileModeY
---| '"disabled"' #-1
---| '"clamp"' #0
---| '"repeat"' #1
---| '"mirror"' #2

---@alias scaleType
---| '"matrix"' #0
---| '"fitXY"' #1
---| '"fitStart"' #2
---| '"fitCenter"' #3
---| '"fitEnd"' #4
---| '"center"' #5
---| '"centerCrop"' #6
---| '"centerInside"' #7

---@alias tileMode
---| '"disabled"' #-1
---| '"clamp"' #0
---| '"repeat"' #1
---| '"mirror"' #2

---@alias importantForAutofill
---| '"auto"' #0
---| '"yes"' #0x1
---| '"no"' #0x2
---| '"yesExcludeDescendants"' #0x4
---| '"noExcludeDescendants"' #0x8

---@alias layoutMode
---| '"clipBounds"' #0
---| '"opticalBounds"' #1

---@alias breakStrategy
---| '"simple"' #0
---| '"high_quality"' #1
---| '"balanced"' #2

---@alias animationOrder
---| '"normal"' #0
---| '"reverse"' #1
---| '"random"' #2

---@alias imeOptions
---| '"normal"' #0x00000000
---| '"actionUnspecified"' #0x00000000
---| '"actionNone"' #0x00000001
---| '"actionGo"' #0x00000002
---| '"actionSearch"' #0x00000003
---| '"actionSend"' #0x00000004
---| '"actionNext"' #0x00000005
---| '"actionDone"' #0x00000006
---| '"actionPrevious"' #0x00000007
---| '"flagNoPersonalizedLearning"' #0x1000000
---| '"flagNoFullscreen"' #0x2000000
---| '"flagNavigatePrevious"' #0x4000000
---| '"flagNavigateNext"' #0x8000000
---| '"flagNoExtractUi"' #0x10000000
---| '"flagNoAccessoryAction"' #0x20000000
---| '"flagNoEnterAction"' #0x40000000
---| '"flagForceAscii"' #0x80000000

---@alias visibility
---| '"visible"' #0
---| '"invisible"' #1
---| '"gone"' #2

---@alias keyEdgeFlags
---| '"left"' #1
---| '"right"' #2

---@class layout
---@field textSize dimension
---@field fontFamily string
---@field typeface typeface
---@field textStyle textStyle
---@field textColor reference|color
---@field textColorHighlight reference|color
---@field textColorHint reference|color
---@field textColorLink reference|color
---@field textCursorDrawable reference
---@field textIsSelectable boolean
---@field ellipsize ellipsize
---@field inputType inputType
---@field imeOptions imeOptions
---@field x dimension
---@field y dimension
---@field gravity gravity
---@field autoLink autoLink
---@field entries reference
---@field layout_gravity layout_gravity
---@field orientation orientation
---@field alignmentMode alignmentMode
---@field keycode keycode
---@field layout_childType layout_childType
---@field lockPatternStyle reference
---@field iconfactoryIconSize dimension
---@field iconfactoryBadgeSize dimension
---@field lStar float

---@class Theme_layout:layout
---@field isLightTheme boolean
---@field colorForeground color
---@field colorForegroundInverse color
---@field colorBackground color
---@field colorBackgroundFloating color
---@field colorBackgroundCacheHint color
---@field colorPressedHighlight color
---@field colorLongPressedHighlight color
---@field colorFocusedHighlight color
---@field colorActivatedHighlight color
---@field colorMultiSelectHighlight color
---@field autofilledHighlight reference
---@field autofillDatasetPickerMaxWidth reference
---@field autofillDatasetPickerMaxHeight reference
---@field autofillSaveCustomSubtitleMaxHeight reference
---@field disabledAlpha float
---@field primaryContentAlpha float
---@field secondaryContentAlpha float
---@field colorError reference|color
---@field backgroundDimAmount float
---@field backgroundDimEnabled boolean
---@field windowBlurBehindRadius dimension
---@field windowBlurBehindEnabled boolean
---@field colorPopupBackground color
---@field colorListDivider color
---@field opacityListDivider color
---@field textAppearance reference
---@field textAppearanceInverse reference
---@field textColorPrimary reference|color
---@field textColorSecondary reference|color
---@field textColorTertiary reference|color
---@field textColorPrimaryInverse reference|color
---@field textColorSecondaryInverse reference|color
---@field textColorTertiaryInverse reference|color
---@field textColorHintInverse reference|color
---@field textColorPrimaryDisableOnly reference|color
---@field textColorPrimaryInverseDisableOnly reference|color
---@field textColorPrimaryNoDisable reference|color
---@field textColorSecondaryNoDisable reference|color
---@field textColorPrimaryInverseNoDisable reference|color
---@field textColorSecondaryInverseNoDisable reference|color
---@field textColorPrimaryActivated reference|color
---@field textColorSecondaryActivated reference|color
---@field textColorSearchUrl reference|color
---@field textColorHighlightInverse reference|color
---@field textColorLinkInverse reference|color
---@field textColorAlertDialogListItem reference|color
---@field searchWidgetCorpusItemBackground reference|color
---@field textAppearanceLarge reference
---@field textAppearanceMedium reference
---@field textAppearanceSmall reference
---@field textAppearanceLargeInverse reference
---@field textAppearanceMediumInverse reference
---@field textAppearanceSmallInverse reference
---@field textAppearanceSearchResultTitle reference
---@field textAppearanceSearchResultSubtitle reference
---@field textAppearanceButton reference
---@field textAppearanceLargePopupMenu reference
---@field textAppearanceSmallPopupMenu reference
---@field textAppearancePopupMenuHeader reference
---@field textAppearanceEasyCorrectSuggestion reference
---@field textAppearanceMisspelledSuggestion reference
---@field textAppearanceAutoCorrectionSuggestion reference
---@field textAppearanceGrammarErrorSuggestion reference
---@field textUnderlineColor reference|color
---@field textUnderlineThickness reference|dimension
---@field editTextColor reference|color
---@field editTextBackground reference
---@field errorMessageBackground reference
---@field errorMessageAboveBackground reference
---@field candidatesTextStyleSpans reference|string
---@field textCheckMark reference
---@field textCheckMarkInverse reference
---@field listChoiceIndicatorMultiple reference
---@field listChoiceIndicatorSingle reference
---@field listChoiceBackgroundIndicator reference
---@field activatedBackgroundIndicator reference
---@field buttonStyle reference
---@field buttonStyleSmall reference
---@field buttonStyleInset reference
---@field buttonStyleToggle reference
---@field galleryItemBackground reference
---@field listPreferredItemHeight dimension
---@field listPreferredItemHeightSmall dimension
---@field listPreferredItemHeightLarge dimension
---@field searchResultListItemHeight dimension
---@field listPreferredItemPaddingLeft dimension
---@field listPreferredItemPaddingRight dimension
---@field textAppearanceListItem reference
---@field textAppearanceListItemSecondary reference
---@field textAppearanceListItemSmall reference
---@field listDivider reference
---@field listDividerAlertDialog reference
---@field listSeparatorTextViewStyle reference
---@field expandableListPreferredItemPaddingLeft dimension
---@field expandableListPreferredChildPaddingLeft dimension
---@field expandableListPreferredItemIndicatorLeft dimension
---@field expandableListPreferredItemIndicatorRight dimension
---@field expandableListPreferredChildIndicatorLeft dimension
---@field expandableListPreferredChildIndicatorRight dimension
---@field dropdownListPreferredItemHeight dimension
---@field listPreferredItemPaddingStart dimension
---@field listPreferredItemPaddingEnd dimension
---@field windowBackground reference|color
---@field windowBackgroundFallback reference|color
---@field windowBackgroundBlurRadius dimension
---@field windowFrame reference
---@field windowNoTitle boolean
---@field windowFullscreen boolean
---@field windowOverscan boolean
---@field windowIsFloating boolean
---@field windowIsTranslucent boolean
---@field windowShowWallpaper boolean
---@field windowContentOverlay reference
---@field windowTitleSize dimension
---@field windowTitleStyle reference
---@field windowTitleBackgroundStyle reference
---@field windowAnimationStyle reference
---@field windowActionBar boolean
---@field windowActionBarOverlay boolean
---@field windowActionModeOverlay boolean
---@field windowSoftInputMode windowSoftInputMode
---@field windowDisablePreview boolean
---@field windowNoDisplay boolean
---@field windowEnableSplitTouch boolean
---@field windowCloseOnTouchOutside boolean
---@field windowTranslucentStatus boolean
---@field windowTranslucentNavigation boolean
---@field windowSwipeToDismiss boolean
---@field windowContentTransitions boolean
---@field windowContentTransitionManager reference
---@field windowActivityTransitions boolean
---@field windowEnterTransition reference
---@field windowReturnTransition reference
---@field windowExitTransition reference
---@field windowReenterTransition reference
---@field windowSharedElementEnterTransition reference
---@field windowSharedElementReturnTransition reference
---@field windowSharedElementExitTransition reference
---@field windowSharedElementReenterTransition reference
---@field windowAllowEnterTransitionOverlap boolean
---@field windowAllowReturnTransitionOverlap boolean
---@field windowSharedElementsUseOverlay boolean
---@field windowActionBarFullscreenDecorLayout reference
---@field windowTransitionBackgroundFadeDuration integer
---@field floatingToolbarCloseDrawable reference
---@field floatingToolbarForegroundColor reference|color
---@field floatingToolbarItemBackgroundBorderlessDrawable reference
---@field floatingToolbarItemBackgroundDrawable reference
---@field floatingToolbarOpenDrawable reference
---@field floatingToolbarPopupBackgroundDrawable reference
---@field floatingToolbarDividerColor reference
---@field alertDialogStyle reference
---@field alertDialogButtonGroupStyle reference
---@field alertDialogCenterButtons boolean
---@field detailsElementBackground reference
---@field fingerprintAuthDrawable reference
---@field panelBackground reference|color
---@field panelFullBackground reference|color
---@field panelColorForeground reference|color
---@field panelColorBackground reference|color
---@field panelTextAppearance reference
---@field panelMenuIsCompact boolean
---@field panelMenuListWidth dimension
---@field panelMenuListTheme reference
---@field absListViewStyle reference
---@field autoCompleteTextViewStyle reference
---@field checkboxStyle reference
---@field checkedTextViewStyle reference
---@field dropDownListViewStyle reference
---@field editTextStyle reference
---@field expandableListViewStyle reference
---@field expandableListViewWhiteStyle reference
---@field galleryStyle reference
---@field gestureOverlayViewStyle reference
---@field gridViewStyle reference
---@field imageButtonStyle reference
---@field imageWellStyle reference
---@field listMenuViewStyle reference
---@field listViewStyle reference
---@field listViewWhiteStyle reference
---@field popupWindowStyle reference
---@field progressBarStyle reference
---@field progressBarStyleHorizontal reference
---@field progressBarStyleSmall reference
---@field progressBarStyleSmallTitle reference
---@field progressBarStyleLarge reference
---@field progressBarStyleInverse reference
---@field progressBarStyleSmallInverse reference
---@field progressBarStyleLargeInverse reference
---@field seekBarStyle reference
---@field ratingBarStyle reference
---@field ratingBarStyleIndicator reference
---@field ratingBarStyleSmall reference
---@field radioButtonStyle reference
---@field scrollViewStyle reference
---@field horizontalScrollViewStyle reference
---@field spinnerStyle reference
---@field dropDownSpinnerStyle reference
---@field actionDropDownStyle reference
---@field actionButtonStyle reference
---@field starStyle reference
---@field tabWidgetStyle reference
---@field textViewStyle reference
---@field webTextViewStyle reference
---@field webViewStyle reference
---@field dropDownItemStyle reference
---@field spinnerDropDownItemStyle reference
---@field dropDownHintAppearance reference
---@field spinnerItemStyle reference
---@field mapViewStyle reference
---@field quickContactBadgeOverlay reference
---@field quickContactBadgeStyleWindowSmall reference
---@field quickContactBadgeStyleWindowMedium reference
---@field quickContactBadgeStyleWindowLarge reference
---@field quickContactBadgeStyleSmallWindowSmall reference
---@field quickContactBadgeStyleSmallWindowMedium reference
---@field quickContactBadgeStyleSmallWindowLarge reference
---@field textSelectHandleWindowStyle reference
---@field textSuggestionsWindowStyle reference
---@field listPopupWindowStyle reference
---@field popupMenuStyle reference
---@field contextPopupMenuStyle reference
---@field stackViewStyle reference
---@field magnifierStyle reference
---@field fragmentBreadCrumbsStyle reference
---@field numberPickerStyle reference
---@field calendarViewStyle reference
---@field timePickerStyle reference
---@field timePickerDialogTheme reference
---@field datePickerStyle reference
---@field datePickerDialogTheme reference
---@field activityChooserViewStyle reference
---@field toolbarStyle reference
---@field fastScrollThumbDrawable reference
---@field fastScrollPreviewBackgroundRight reference
---@field fastScrollPreviewBackgroundLeft reference
---@field fastScrollTrackDrawable reference
---@field fastScrollOverlayPosition fastScrollOverlayPosition
---@field fastScrollTextColor color
---@field actionBarTabStyle reference
---@field actionBarTabBarStyle reference
---@field actionBarTabTextStyle reference
---@field actionOverflowButtonStyle reference
---@field actionOverflowMenuStyle reference
---@field actionBarPopupTheme reference
---@field actionBarStyle reference
---@field actionBarSplitStyle reference
---@field actionBarTheme reference
---@field actionBarWidgetTheme reference
---@field actionBarSize dimension
---@field actionBarDivider reference
---@field actionBarItemBackground reference
---@field actionMenuTextAppearance reference
---@field actionMenuTextColor color|reference
---@field actionModeStyle reference
---@field actionModeCloseButtonStyle reference
---@field actionModeBackground reference
---@field actionModeSplitBackground reference
---@field actionModeCloseDrawable reference
---@field actionModeCutDrawable reference
---@field actionModeCopyDrawable reference
---@field actionModePasteDrawable reference
---@field actionModeSelectAllDrawable reference
---@field actionModeShareDrawable reference
---@field actionModeFindDrawable reference
---@field actionModeWebSearchDrawable reference
---@field actionModePopupWindowStyle reference
---@field preferenceScreenStyle reference
---@field preferenceActivityStyle reference
---@field preferenceFragmentStyle reference
---@field preferenceCategoryStyle reference
---@field preferenceStyle reference
---@field preferenceInformationStyle reference
---@field checkBoxPreferenceStyle reference
---@field yesNoPreferenceStyle reference
---@field dialogPreferenceStyle reference
---@field editTextPreferenceStyle reference
---@field seekBarDialogPreferenceStyle reference
---@field ringtonePreferenceStyle reference
---@field preferenceLayoutChild reference
---@field preferencePanelStyle reference
---@field preferenceHeaderPanelStyle reference
---@field preferenceListStyle reference
---@field preferenceFragmentListStyle reference
---@field preferenceFragmentPaddingSide dimension
---@field switchPreferenceStyle reference
---@field seekBarPreferenceStyle reference
---@field textSelectHandleLeft reference
---@field textSelectHandleRight reference
---@field textSelectHandle reference
---@field textEditPasteWindowLayout reference
---@field textEditNoPasteWindowLayout reference
---@field textEditSidePasteWindowLayout reference
---@field textEditSideNoPasteWindowLayout reference
---@field textEditSuggestionItemLayout reference
---@field textEditSuggestionContainerLayout reference
---@field textEditSuggestionHighlightStyle reference
---@field dialogTheme reference
---@field dialogTitleIconsDecorLayout reference
---@field dialogCustomTitleDecorLayout reference
---@field dialogTitleDecorLayout reference
---@field dialogPreferredPadding dimension
---@field dialogCornerRadius dimension
---@field alertDialogTheme reference
---@field alertDialogIcon reference
---@field presentationTheme reference
---@field dividerVertical reference
---@field dividerHorizontal reference
---@field buttonBarStyle reference
---@field buttonBarButtonStyle reference
---@field buttonBarPositiveButtonStyle reference
---@field buttonBarNegativeButtonStyle reference
---@field buttonBarNeutralButtonStyle reference
---@field buttonCornerRadius dimension
---@field progressBarCornerRadius dimension
---@field searchViewStyle reference
---@field segmentedButtonStyle reference
---@field selectableItemBackground reference
---@field selectableItemBackgroundBorderless reference
---@field borderlessButtonStyle reference
---@field toastFrameBackground reference
---@field tooltipFrameBackground reference
---@field tooltipForegroundColor reference|color
---@field tooltipBackgroundColor reference|color
---@field searchDialogTheme reference
---@field homeAsUpIndicator reference
---@field preferenceFrameLayoutStyle reference
---@field switchStyle reference
---@field mediaRouteButtonStyle reference
---@field accessibilityFocusedDrawable reference
---@field findOnPageNextDrawable reference
---@field findOnPagePreviousDrawable reference
---@field colorPrimary color
---@field colorPrimaryDark color
---@field colorSecondary color
---@field colorAccent color
---@field colorAccentPrimary color
---@field colorAccentSecondary color
---@field colorAccentTertiary color
---@field colorAccentPrimaryVariant color
---@field textColorOnAccent color
---@field colorAccentSecondaryVariant color
---@field colorAccentTertiaryVariant color
---@field colorControlNormal color
---@field colorControlActivated color
---@field colorControlHighlight color
---@field colorButtonNormal color
---@field colorSwitchThumbNormal color
---@field colorProgressBackgroundNormal color
---@field colorEdgeEffect color
---@field colorSurface color
---@field colorSurfaceHighlight color
---@field colorSurfaceVariant color
---@field colorSurfaceHeader color
---@field effectColor color
---@field lightY dimension
---@field lightZ dimension
---@field lightRadius dimension
---@field ambientShadowAlpha float
---@field spotShadowAlpha float
---@field forceDarkAllowed boolean

---@class Window_layout:layout
---@field windowMinWidthMajor dimension|fraction
---@field windowMinWidthMinor dimension|fraction
---@field windowFixedWidthMajor dimension|fraction
---@field windowFixedHeightMinor dimension|fraction
---@field windowFixedWidthMinor dimension|fraction
---@field windowFixedHeightMajor dimension|fraction
---@field windowOutsetBottom dimension
---@field windowDrawsSystemBarBackgrounds boolean
---@field statusBarColor color
---@field navigationBarColor color
---@field navigationBarDividerColor color
---@field enforceStatusBarContrast boolean
---@field enforceNavigationBarContrast boolean
---@field windowElevation dimension
---@field windowClipToOutline boolean
---@field windowLightStatusBar boolean
---@field windowSplashscreenContent reference
---@field windowLightNavigationBar boolean
---@field windowLayoutInDisplayCutoutMode windowLayoutInDisplayCutoutMode
---@field windowSplashScreenBackground color
---@field windowSplashScreenAnimatedIcon reference
---@field windowSplashScreenAnimationDuration integer
---@field windowSplashScreenBrandingImage reference
---@field windowSplashScreenIconBackgroundColor color

---@class AlertDialog_layout:layout
---@field fullDark reference|color
---@field topDark reference|color
---@field centerDark reference|color
---@field bottomDark reference|color
---@field fullBright reference|color
---@field topBright reference|color
---@field centerBright reference|color
---@field bottomBright reference|color
---@field bottomMedium reference|color
---@field centerMedium reference|color
---@field buttonPanelSideLayout reference
---@field listLayout reference
---@field multiChoiceItemLayout reference
---@field singleChoiceItemLayout reference
---@field listItemLayout reference
---@field progressLayout reference
---@field horizontalProgressLayout reference
---@field showTitle boolean
---@field needsDefaultBackgrounds boolean
---@field controllerType controllerType
---@field selectionScrollOffset dimension

---@class ButtonBar_layout:Linear_layout

---@class FragmentAnimation_layout:layout
---@field fragmentOpenEnterAnimation reference
---@field fragmentOpenExitAnimation reference
---@field fragmentCloseEnterAnimation reference
---@field fragmentCloseExitAnimation reference
---@field fragmentFadeEnterAnimation reference
---@field fragmentFadeExitAnimation reference

---@class WindowAnimation_layout:layout
---@field windowEnterAnimation reference
---@field windowExitAnimation reference
---@field windowShowAnimation reference
---@field windowHideAnimation reference
---@field activityOpenEnterAnimation reference
---@field activityOpenExitAnimation reference
---@field activityCloseEnterAnimation reference
---@field activityCloseExitAnimation reference
---@field taskOpenEnterAnimation reference
---@field taskOpenExitAnimation reference
---@field launchTaskBehindTargetAnimation reference
---@field launchTaskBehindSourceAnimation reference
---@field taskCloseEnterAnimation reference
---@field taskCloseExitAnimation reference
---@field taskToFrontEnterAnimation reference
---@field taskToFrontExitAnimation reference
---@field taskToBackEnterAnimation reference
---@field taskToBackExitAnimation reference
---@field wallpaperOpenEnterAnimation reference
---@field wallpaperOpenExitAnimation reference
---@field wallpaperCloseEnterAnimation reference
---@field wallpaperCloseExitAnimation reference
---@field wallpaperIntraOpenEnterAnimation reference
---@field wallpaperIntraOpenExitAnimation reference
---@field wallpaperIntraCloseEnterAnimation reference
---@field wallpaperIntraCloseExitAnimation reference
---@field activityOpenRemoteViewsEnterAnimation reference

---@class View_layout:layout
---@field id reference
---@field tag string
---@field scrollX dimension
---@field scrollY dimension
---@field background reference|color
---@field padding dimension
---@field paddingHorizontal dimension
---@field paddingVertical dimension
---@field paddingLeft dimension
---@field paddingTop dimension
---@field paddingRight dimension
---@field paddingBottom dimension
---@field paddingStart dimension
---@field paddingEnd dimension
---@field focusable boolean|enum
---@field autofillHints string|reference
---@field importantForAutofill importantForAutofill
---@field importantForContentCapture importantForContentCapture
---@field scrollCaptureHint scrollCaptureHint
---@field focusableInTouchMode boolean
---@field visibility visibility
---@field fitsSystemWindows boolean
---@field scrollbars scrollbars
---@field scrollbarStyle scrollbarStyle
---@field isScrollContainer boolean
---@field fadeScrollbars boolean
---@field scrollbarFadeDuration integer
---@field scrollbarDefaultDelayBeforeFade integer
---@field scrollbarSize dimension
---@field scrollbarThumbHorizontal reference
---@field scrollbarThumbVertical reference
---@field scrollbarTrackHorizontal reference
---@field scrollbarTrackVertical reference
---@field scrollbarAlwaysDrawHorizontalTrack boolean
---@field scrollbarAlwaysDrawVerticalTrack boolean
---@field fadingEdge fadingEdge
---@field requiresFadingEdge requiresFadingEdge
---@field fadingEdgeLength dimension
---@field nextFocusLeft reference
---@field nextFocusRight reference
---@field nextFocusUp reference
---@field nextFocusDown reference
---@field nextFocusForward reference
---@field clickable boolean
---@field longClickable boolean
---@field contextClickable boolean
---@field saveEnabled boolean
---@field filterTouchesWhenObscured boolean
---@field drawingCacheQuality drawingCacheQuality
---@field keepScreenOn boolean
---@field duplicateParentState boolean
---@field soundEffectsEnabled boolean
---@field hapticFeedbackEnabled boolean
---@field contentDescription string
---@field accessibilityTraversalBefore integer
---@field accessibilityTraversalAfter integer
---@field onClick string
---@field overScrollMode overScrollMode
---@field alpha float
---@field elevation dimension
---@field translationX dimension
---@field translationY dimension
---@field translationZ dimension
---@field transformPivotX dimension
---@field transformPivotY dimension
---@field rotation float
---@field rotationX float
---@field rotationY float
---@field scaleX float
---@field scaleY float
---@field verticalScrollbarPosition verticalScrollbarPosition
---@field layerType layerType
---@field layoutDirection layoutDirection
---@field textDirection integer
---@field textAlignment integer
---@field importantForAccessibility integer
---@field accessibilityLiveRegion integer
---@field labelFor reference
---@field transitionName string
---@field nestedScrollingEnabled boolean
---@field stateListAnimator reference
---@field backgroundTint color
---@field backgroundTintMode backgroundTintMode
---@field outlineProvider outlineProvider
---@field foreground reference|color
---@field foregroundGravity foregroundGravity
---@field foregroundInsidePadding boolean
---@field foregroundTint color
---@field foregroundTintMode foregroundTintMode
---@field scrollIndicators scrollIndicators
---@field pointerIcon pointerIcon
---@field forceHasOverlappingRendering boolean
---@field tooltipText string
---@field keyboardNavigationCluster boolean
---@field __removed0 boolean
---@field nextClusterForward reference
---@field __removed1 reference
---@field focusedByDefault boolean
---@field defaultFocusHighlightEnabled boolean
---@field screenReaderFocusable boolean
---@field accessibilityPaneTitle string
---@field accessibilityHeading boolean
---@field allowClickWhenDisabled boolean
---@field outlineSpotShadowColor color
---@field outlineAmbientShadowColor color
---@field forceDarkAllowed boolean
---@field clipToOutline boolean

---@class ViewTag_layout:layout

---@class Include_layout:layout

---@class ViewGroup_layout:View_layout
---@field animateLayoutChanges boolean
---@field clipChildren boolean
---@field clipToPadding boolean
---@field layoutAnimation reference
---@field animationCache boolean
---@field persistentDrawingCache persistentDrawingCache
---@field alwaysDrawnWithCache boolean
---@field addStatesFromChildren boolean
---@field descendantFocusability descendantFocusability
---@field touchscreenBlocksFocus boolean
---@field splitMotionEvents boolean
---@field layoutMode layoutMode
---@field transitionGroup boolean
---@field layout_width dimension
---@field layout_height dimension

---@class ViewStub_layout:View_layout
---@field layout reference
---@field inflatedId reference

---@class ViewGroup_Margin_layout:layout
---@field layout_margin dimension
---@field layout_marginLeft dimension
---@field layout_marginTop dimension
---@field layout_marginRight dimension
---@field layout_marginBottom dimension
---@field layout_marginStart dimension
---@field layout_marginEnd dimension
---@field layout_marginHorizontal dimension
---@field layout_marginVertical dimension

---@class InputMethod_layout:layout
---@field settingsActivity string
---@field isDefault boolean
---@field supportsSwitchingToNextInputMethod boolean
---@field isVrOnly boolean
---@field __removed2 boolean
---@field supportsInlineSuggestions boolean
---@field suppressesSpellChecker boolean
---@field showInInputMethodPicker boolean

---@class InputMethod_Subtype_layout:layout
---@field imeSubtypeLocale string
---@field imeSubtypeMode string
---@field isAuxiliary boolean
---@field overridesImplicitlyEnabledSubtype boolean
---@field imeSubtypeExtraValue string
---@field subtypeId integer
---@field isAsciiCapable boolean
---@field languageTag string

---@class SpellChecker_layout:layout

---@class SpellChecker_Subtype_layout:layout
---@field subtypeLocale string
---@field subtypeExtraValue string

---@class AccessibilityService_layout:layout
---@field accessibilityEventTypes accessibilityEventTypes
---@field packageNames string
---@field accessibilityFeedbackType accessibilityFeedbackType
---@field notificationTimeout integer
---@field nonInteractiveUiTimeout integer
---@field interactiveUiTimeout integer
---@field accessibilityFlags accessibilityFlags
---@field canRetrieveWindowContent boolean
---@field canRequestTouchExplorationMode boolean
---@field canRequestEnhancedWebAccessibility boolean
---@field canRequestFilterKeyEvents boolean
---@field canControlMagnification boolean
---@field canPerformGestures boolean
---@field canRequestFingerprintGestures boolean
---@field canTakeScreenshot boolean
---@field isAccessibilityTool boolean
---@field animatedImageDrawable reference
---@field htmlDescription reference

---@class AccessibilityShortcutTarget_layout:layout
---@field animatedImageDrawable reference
---@field htmlDescription reference

---@class PrintService_layout:layout
---@field addPrintersActivity string
---@field advancedPrintOptionsActivity string
---@field vendor string

---@class HostApduService_layout:layout
---@field requireDeviceUnlock boolean
---@field apduServiceBanner reference
---@field requireDeviceScreenOn boolean

---@class OffHostApduService_layout:layout
---@field secureElementName string

---@class AidGroup_layout:layout
---@field category string

---@class AidFilter_layout:layout

---@class AidPrefixFilter_layout:layout

---@class HostNfcFService_layout:layout

---@class SystemCodeFilter_layout:layout

---@class Nfcid2Filter_layout:layout

---@class T3tPmmFilter_layout:layout

---@class ActionMenuItemView_layout:layout

---@class AbsListView_layout:layout
---@field listSelector color|reference
---@field drawSelectorOnTop boolean
---@field stackFromBottom boolean
---@field scrollingCache boolean
---@field textFilterEnabled boolean
---@field transcriptMode transcriptMode
---@field cacheColorHint color
---@field fastScrollEnabled boolean
---@field fastScrollStyle reference
---@field smoothScrollbar boolean
---@field choiceMode choiceMode
---@field fastScrollAlwaysVisible boolean

---@class RecycleListView_layout:layout
---@field paddingBottomNoButtons dimension
---@field paddingTopNoTitle dimension

---@class AbsSpinner_layout:layout

---@class AnalogClock_layout:View_layout
---@field dial reference
---@field hand_hour reference
---@field hand_minute reference
---@field hand_second reference
---@field timeZone string
---@field dialTint color
---@field dialTintMode dialTintMode
---@field hand_hourTint color
---@field hand_hourTintMode hand_hourTintMode
---@field hand_minuteTint color
---@field hand_minuteTintMode hand_minuteTintMode
---@field hand_secondTint color
---@field hand_secondTintMode hand_secondTintMode

---@class Button_layout:TextView_layout

---@class Chronometer_layout:TextView_layout
---@field format string
---@field countDown boolean

---@class CompoundButton_layout:layout
---@field checked boolean
---@field button reference
---@field buttonTint color
---@field buttonTintMode buttonTintMode

---@class CheckedTextView_layout:TextView_layout
---@field checkMark reference
---@field checkMarkTint color
---@field checkMarkTintMode checkMarkTintMode
---@field checkMarkGravity checkMarkGravity

---@class EditText_layout:layout

---@class FastScroll_layout:layout
---@field thumbDrawable reference
---@field thumbMinWidth dimension
---@field thumbMinHeight dimension
---@field trackDrawable reference
---@field backgroundRight reference
---@field backgroundLeft reference
---@field position position
---@field thumbPosition thumbPosition

---@class Frame_layout:ViewGroup_layout

---@class ExpandableListView_layout:ListView_layout
---@field groupIndicator reference
---@field childIndicator reference
---@field indicatorLeft dimension
---@field indicatorRight dimension
---@field childIndicatorLeft dimension
---@field childIndicatorRight dimension
---@field childDivider reference|color
---@field indicatorStart dimension
---@field indicatorEnd dimension
---@field childIndicatorStart dimension
---@field childIndicatorEnd dimension

---@class Gallery_layout:AbsSpinner_layout
---@field animationDuration integer
---@field spacing dimension
---@field unselectedAlpha float

---@class GridView_layout:AbsListView_layout
---@field horizontalSpacing dimension
---@field verticalSpacing dimension
---@field stretchMode stretchMode
---@field columnWidth dimension
---@field numColumns integer

---@class ImageSwitcher_layout:layout

---@class ImageView_layout:View_layout
---@field src reference|color
---@field scaleType scaleType
---@field adjustViewBounds boolean
---@field maxWidth dimension
---@field maxHeight dimension
---@field tint color
---@field baselineAlignBottom boolean
---@field cropToPadding boolean
---@field baseline dimension
---@field drawableAlpha integer

---@class ToggleButton_layout:CompoundButton_layout
---@field textOn string
---@field textOff string

---@class Relative_layout:ViewGroup_layout
---@field ignoreGravity reference

---@class Linear_layout:ViewGroup_layout
---@field baselineAligned boolean
---@field baselineAlignedChildIndex integer
---@field weightSum float
---@field measureWithLargestChild boolean
---@field showDividers showDividers
---@field dividerPadding dimension

---@class Grid_layout:ViewGroup_layout
---@field rowCount integer
---@field columnCount integer
---@field useDefaultMargins boolean
---@field rowOrderPreserved boolean
---@field columnOrderPreserved boolean

---@class ListView_layout:AbsListView_layout
---@field divider reference|color
---@field dividerHeight dimension
---@field headerDividersEnabled boolean
---@field footerDividersEnabled boolean
---@field overScrollHeader reference|color
---@field overScrollFooter reference|color

---@class PreferenceFrame_layout:layout
---@field borderTop dimension
---@field borderBottom dimension
---@field borderLeft dimension
---@field borderRight dimension

---@class PreferenceFrame_layout:layout

---@class MenuView_layout:layout
---@field itemTextAppearance reference
---@field horizontalDivider reference
---@field verticalDivider reference
---@field headerBackground color|reference
---@field itemBackground color|reference
---@field itemIconDisabledAlpha float
---@field preserveIconSpacing boolean
---@field subMenuArrow reference

---@class IconMenuView_layout:layout
---@field rowHeight dimension
---@field maxRows integer
---@field maxItemsPerRow integer
---@field maxItems integer
---@field moreIcon reference

---@class ProgressBar_layout:View_layout
---@field min integer
---@field max integer
---@field progress integer
---@field secondaryProgress integer
---@field indeterminate boolean
---@field indeterminateOnly boolean
---@field indeterminateDrawable reference
---@field progressDrawable reference
---@field indeterminateDuration integer
---@field indeterminateBehavior indeterminateBehavior
---@field minWidth dimension
---@field minHeight dimension
---@field interpolator reference
---@field animationResolution integer
---@field mirrorForRtl boolean
---@field progressTint color
---@field progressTintMode progressTintMode
---@field progressBackgroundTint color
---@field progressBackgroundTintMode progressBackgroundTintMode
---@field secondaryProgressTint color
---@field secondaryProgressTintMode secondaryProgressTintMode
---@field indeterminateTint color
---@field indeterminateTintMode indeterminateTintMode

---@class SeekBar_layout:layout
---@field thumb reference
---@field thumbOffset dimension
---@field splitTrack boolean
---@field useDisabledAlpha boolean
---@field thumbTint color
---@field thumbTintMode thumbTintMode
---@field tickMark reference
---@field tickMarkTint color
---@field tickMarkTintMode tickMarkTintMode

---@class StackView_layout:AdapterViewAnimator_layout
---@field resOutColor color
---@field clickColor color

---@class RatingBar_layout:layout
---@field numStars integer
---@field rating float
---@field stepSize float
---@field isIndicator boolean

---@class RadioGroup_layout:Linear_layout
---@field checkedButton integer

---@class Table_layout:Linear_layout
---@field stretchColumns string
---@field shrinkColumns string
---@field collapseColumns string

---@class TableRow_layout:Linear_layout

---@class TableRow_Cell_layout:layout
---@field layout_column integer
---@field layout_span integer

---@class TabWidget_layout:Linear_layout
---@field tabStripEnabled boolean
---@field tabStripLeft reference
---@field tabStripRight reference
---@field tabLayout reference

---@class TextAppearance_layout:layout
---@field textLocale string
---@field textAllCaps boolean
---@field shadowColor color
---@field shadowDx float
---@field shadowDy float
---@field shadowRadius float
---@field elegantTextHeight boolean
---@field fallbackLineSpacing boolean
---@field letterSpacing float
---@field fontFeatureSettings string
---@field fontVariationSettings string

---@class TextClock_layout:TextView_layout
---@field format12Hour string
---@field format24Hour string
---@field timeZone string

---@class TextSwitcher_layout:layout

---@class TextView_layout:View_layout
---@field bufferType bufferType
---@field text string
---@field hint string
---@field textScaleX float
---@field textFontWeight integer
---@field textLocale string
---@field cursorVisible boolean
---@field maxLines integer
---@field lines integer
---@field height dimension
---@field minLines integer
---@field maxEms integer
---@field ems integer
---@field width dimension
---@field minEms integer
---@field scrollHorizontally boolean
---@field password boolean
---@field singleLine boolean
---@field enabled boolean
---@field selectAllOnFocus boolean
---@field includeFontPadding boolean
---@field maxLength integer
---@field linksClickable boolean
---@field numeric numeric
---@field digits string
---@field phoneNumber boolean
---@field inputMethod string
---@field capitalize capitalize
---@field autoText boolean
---@field editable boolean
---@field freezesText boolean
---@field drawableTop reference|color
---@field drawableBottom reference|color
---@field drawableLeft reference|color
---@field drawableRight reference|color
---@field drawableStart reference|color
---@field drawableEnd reference|color
---@field drawablePadding dimension
---@field drawableTint color
---@field drawableTintMode drawableTintMode
---@field lineSpacingExtra dimension
---@field lineSpacingMultiplier float
---@field lineHeight dimension
---@field firstBaselineToTopHeight dimension
---@field lastBaselineToBottomHeight dimension
---@field marqueeRepeatLimit integer
---@field allowUndo boolean
---@field privateImeOptions string
---@field imeActionLabel string
---@field imeActionId integer
---@field editorExtras reference
---@field fallbackLineSpacing boolean
---@field breakStrategy breakStrategy
---@field hyphenationFrequency hyphenationFrequency
---@field autoSizeTextType enum
---@field autoSizeStepGranularity dimension
---@field autoSizeMinTextSize dimension
---@field autoSizeMaxTextSize dimension
---@field justificationMode justificationMode

---@class TextViewAppearance_layout:layout

---@class SelectionModeDrawables_layout:layout

---@class SuggestionSpan_layout:layout

---@class InputExtras_layout:layout

---@class AutoCompleteTextView_layout:layout
---@field completionHint string
---@field completionHintView reference
---@field completionThreshold integer
---@field dropDownSelector reference|color
---@field dropDownAnchor reference
---@field dropDownWidth dimension
---@field dropDownHeight dimension

---@class PopupWindow_layout:layout
---@field popupBackground reference|color
---@field popupElevation dimension
---@field popupAnimationStyle reference
---@field overlapAnchor boolean
---@field popupEnterTransition reference
---@field popupExitTransition reference

---@class ListPopupWindow_layout:layout
---@field dropDownVerticalOffset dimension
---@field dropDownHorizontalOffset dimension

---@class ViewAnimator_layout:Frame_layout
---@field inAnimation reference
---@field outAnimation reference
---@field animateFirstView boolean

---@class ViewFlipper_layout:ViewAnimator_layout
---@field flipInterval integer
---@field autoStart boolean

---@class AdapterViewAnimator_layout:layout
---@field loopViews boolean

---@class AdapterViewFlipper_layout:AdapterViewAnimator_layout

---@class ViewSwitcher_layout:ViewAnimator_layout

---@class ScrollView_layout:Frame_layout

---@class HorizontalScrollView_layout:Frame_layout

---@class Spinner_layout:AbsSpinner_layout
---@field prompt reference
---@field spinnerMode enum
---@field popupPromptView reference
---@field disableChildrenWhenDisabled boolean

---@class DatePicker_layout:Frame_layout
---@field minDate string
---@field maxDate string
---@field spinnersShown boolean
---@field calendarViewShown boolean
---@field internalLayout reference
---@field headerTextColor color
---@field yearListItemTextAppearance reference
---@field yearListItemActivatedTextAppearance reference
---@field calendarTextColor color
---@field datePickerMode datePickerMode
---@field startYear integer
---@field endYear integer
---@field headerMonthTextAppearance reference
---@field headerDayOfMonthTextAppearance reference
---@field headerYearTextAppearance reference
---@field dayOfWeekBackground color
---@field dayOfWeekTextAppearance reference
---@field yearListSelectorColor color
---@field dialogMode boolean

---@class TwoLineListItem_layout:Relative_layout

---@class SlidingDrawer_layout:ViewGroup_layout
---@field handle reference
---@field content reference
---@field bottomOffset dimension
---@field topOffset dimension
---@field allowSingleTap boolean
---@field animateOnClick boolean

---@class GestureOverlayView_layout:layout
---@field gestureStrokeWidth float
---@field gestureColor color
---@field uncertainGestureColor color
---@field fadeOffset integer
---@field fadeDuration integer
---@field gestureStrokeType gestureStrokeType
---@field gestureStrokeLengthThreshold float
---@field gestureStrokeSquarenessThreshold float
---@field gestureStrokeAngleThreshold float
---@field eventsInterceptionEnabled boolean
---@field fadeEnabled boolean

---@class QuickContactBadge_layout:ImageView_layout

---@class Absolute_layout:ViewGroup_layout
---@field layout_x dimension
---@field layout_y dimension

---@class Linear_layout:ViewGroup_layout
---@field layout_weight float

---@class Grid_layout:ViewGroup_layout
---@field layout_row integer
---@field layout_rowSpan integer
---@field layout_rowWeight float
---@field layout_columnSpan integer
---@field layout_columnWeight float

---@class Frame_layout:ViewGroup_layout

---@class Relative_layout:ViewGroup_layout
---@field layout_toLeftOf reference
---@field layout_toRightOf reference
---@field layout_above reference
---@field layout_below reference
---@field layout_alignBaseline reference
---@field layout_alignLeft reference
---@field layout_alignTop reference
---@field layout_alignRight reference
---@field layout_alignBottom reference
---@field layout_alignParentLeft boolean
---@field layout_alignParentTop boolean
---@field layout_alignParentRight boolean
---@field layout_alignParentBottom boolean
---@field layout_centerInParent boolean
---@field layout_centerHorizontal boolean
---@field layout_centerVertical boolean
---@field layout_alignWithParentIfMissing boolean
---@field layout_toStartOf reference
---@field layout_toEndOf reference
---@field layout_alignStart reference
---@field layout_alignEnd reference
---@field layout_alignParentStart boolean
---@field layout_alignParentEnd boolean

---@class VerticalSlider_layout:layout

---@class WeightedLinear_layout:layout
---@field majorWeightMin float
---@field minorWeightMin float
---@field majorWeightMax float
---@field minorWeightMax float

---@class CalendarView_layout:Frame_layout
---@field firstDayOfWeek integer
---@field monthTextAppearance reference
---@field weekDayTextAppearance reference
---@field dateTextAppearance reference
---@field daySelectorColor color
---@field dayHighlightColor color
---@field calendarViewMode calendarViewMode
---@field showWeekNumber boolean
---@field shownWeekCount integer
---@field selectedWeekBackgroundColor color|reference
---@field focusedMonthDateColor color|reference
---@field unfocusedMonthDateColor color|reference
---@field weekNumberColor color|reference
---@field weekSeparatorLineColor color|reference
---@field selectedDateVerticalBar reference

---@class NumberPicker_layout:Linear_layout
---@field solidColor color|reference
---@field selectionDivider reference
---@field selectionDividerHeight dimension
---@field selectionDividersDistance dimension
---@field internalMinHeight dimension
---@field internalMaxHeight dimension
---@field internalMinWidth dimension
---@field internalMaxWidth dimension
---@field virtualButtonPressedDrawable reference
---@field hideWheelUntilFocused boolean

---@class TimePicker_layout:Frame_layout
---@field legacyLayout reference
---@field numbersTextColor color
---@field numbersInnerTextColor color
---@field numbersBackgroundColor color
---@field numbersSelectorColor color
---@field timePickerMode timePickerMode
---@field headerAmPmTextAppearance reference
---@field headerTimeTextAppearance reference
---@field amPmTextColor color
---@field amPmBackgroundColor color

---@class Drawable_layout:layout
---@field visible boolean
---@field autoMirrored boolean

---@class DrawableWrapper_layout:Drawable_layout

---@class StateListDrawable_layout:layout
---@field variablePadding boolean
---@field constantSize boolean
---@field dither boolean
---@field enterFadeDuration integer
---@field exitFadeDuration integer

---@class AnimatedStateListDrawable_layout:StateListDrawable_layout

---@class StateListDrawableItem_layout:layout

---@class AnimatedStateListDrawableItem_layout:layout

---@class AnimatedStateListDrawableTransition_layout:layout
---@field fromId reference
---@field toId reference
---@field reversible boolean

---@class AnimationDrawable_layout:layout
---@field oneshot boolean

---@class AnimationDrawableItem_layout:layout
---@field duration integer
---@field drawable reference

---@class StateListAnimatorItem_layout:layout

---@class ColorStateListItem_layout:layout
---@field lStar float

---@class AnimationScaleListDrawable_layout:layout

---@class AnimationScaleListDrawableItem_layout:layout

---@class GradientDrawable_layout:Drawable_layout
---@field shape shape
---@field innerRadiusRatio float
---@field thicknessRatio float
---@field innerRadius dimension
---@field thickness dimension

---@class GradientDrawableSize_layout:layout

---@class GradientDrawableGradient_layout:layout
---@field startColor color
---@field centerColor color
---@field endColor color
---@field useLevel boolean
---@field angle float
---@field type type
---@field centerX float|fraction
---@field centerY float|fraction
---@field gradientRadius float|fraction|dimension

---@class GradientDrawableSolid_layout:layout

---@class GradientDrawableStroke_layout:layout
---@field dashWidth dimension
---@field dashGap dimension

---@class DrawableCorners_layout:layout
---@field radius dimension
---@field topLeftRadius dimension
---@field topRightRadius dimension
---@field bottomLeftRadius dimension
---@field bottomRightRadius dimension

---@class GradientDrawablePadding_layout:layout
---@field left dimension
---@field top dimension
---@field right dimension
---@field bottom dimension

---@class LayerDrawable_layout:Drawable_layout
---@field opacity opacity
---@field paddingMode paddingMode

---@class LayerDrawableItem_layout:layout
---@field start dimension
---@field end dimension

---@class LevelListDrawableItem_layout:layout
---@field minLevel integer
---@field maxLevel integer

---@class RotateDrawable_layout:DrawableWrapper_layout
---@field fromDegrees float
---@field toDegrees float
---@field pivotX float|fraction
---@field pivotY float|fraction

---@class AnimatedRotateDrawable_layout:DrawableWrapper_layout
---@field frameDuration integer
---@field framesCount integer

---@class MaterialProgressDrawable_layout:layout

---@class InsetDrawable_layout:DrawableWrapper_layout
---@field inset fraction|dimension
---@field insetLeft fraction|dimension
---@field insetRight fraction|dimension
---@field insetTop fraction|dimension
---@field insetBottom fraction|dimension

---@class AnimatedImageDrawable_layout:layout

---@class BitmapDrawable_layout:Drawable_layout
---@field antialias boolean
---@field filter boolean
---@field tileMode tileMode
---@field tileModeX tileModeX
---@field tileModeY tileModeY
---@field mipMap boolean
---@field tintMode tintMode

---@class NinePatchDrawable_layout:Drawable_layout

---@class ColorDrawable_layout:Drawable_layout

---@class AdaptiveIconDrawableLayer_layout:layout

---@class RippleDrawable_layout:LayerDrawable_layout

---@class ScaleDrawable_layout:DrawableWrapper_layout
---@field scaleWidth string
---@field scaleHeight string
---@field scaleGravity scaleGravity
---@field level integer
---@field useIntrinsicSizeAsMinimum boolean

---@class ClipDrawable_layout:DrawableWrapper_layout
---@field clipOrientation clipOrientation

---@class ShapeDrawablePadding_layout:layout

---@class ShapeDrawable_layout:Drawable_layout

---@class VectorDrawable_layout:Drawable_layout
---@field viewportWidth float
---@field viewportHeight float
---@field opticalInsetLeft dimension
---@field opticalInsetTop dimension
---@field opticalInsetRight dimension
---@field opticalInsetBottom dimension

---@class VectorDrawableGroup_layout:layout
---@field translateX float
---@field translateY float

---@class VectorDrawablePath_layout:layout
---@field strokeWidth float
---@field strokeColor color
---@field strokeAlpha float
---@field fillColor color
---@field fillAlpha float
---@field pathData string
---@field trimPathStart float
---@field trimPathEnd float
---@field trimPathOffset float
---@field strokeLineCap enum
---@field strokeLineJoin enum
---@field strokeMiterLimit float
---@field fillType enum

---@class VectorDrawableClipPath_layout:layout

---@class AnimatedVectorDrawable_layout:Drawable_layout

---@class AnimatedVectorDrawableTarget_layout:layout

---@class Animation_layout:layout
---@field fillEnabled boolean
---@field fillBefore boolean
---@field fillAfter boolean
---@field startOffset integer
---@field repeatCount integer
---@field repeatMode repeatMode
---@field zAdjustment zAdjustment
---@field detachWallpaper boolean
---@field showWallpaper boolean
---@field hasRoundedCorners boolean

---@class AnimationSet_layout:layout
---@field shareInterpolator boolean

---@class RotateAnimation_layout:layout

---@class ScaleAnimation_layout:layout
---@field fromXScale float|fraction|dimension
---@field toXScale float|fraction|dimension
---@field fromYScale float|fraction|dimension
---@field toYScale float|fraction|dimension

---@class TranslateAnimation_layout:layout
---@field fromXDelta float|fraction
---@field toXDelta float|fraction
---@field fromYDelta float|fraction
---@field toYDelta float|fraction

---@class AlphaAnimation_layout:layout
---@field fromAlpha float
---@field toAlpha float

---@class ClipRectAnimation_layout:layout
---@field fromLeft fraction
---@field fromTop fraction
---@field fromRight fraction
---@field fromBottom fraction
---@field toLeft fraction
---@field toTop fraction
---@field toRight fraction
---@field toBottom fraction

---@class _layout:layout
---@field delay float|fraction
---@field animation reference
---@field animationOrder animationOrder

---@class Grid_layout:ViewGroup_layout
---@field columnDelay float|fraction
---@field rowDelay float|fraction
---@field direction direction
---@field directionPriority directionPriority

---@class AccelerateInterpolator_layout:layout

---@class DecelerateInterpolator_layout:layout

---@class CycleInterpolator_layout:layout

---@class AnticipateInterpolator_layout:layout

---@class OvershootInterpolator_layout:layout

---@class AnticipateOvershootInterpolator_layout:layout
---@field extraTension float

---@class PathInterpolator_layout:layout
---@field controlX1 float
---@field controlY1 float
---@field controlX2 float
---@field controlY2 float

---@class Transition_layout:layout
---@field startDelay integer
---@field matchOrder string

---@class EpicenterTranslateClipReveal_layout:layout
---@field interpolatorX reference
---@field interpolatorY reference
---@field interpolatorZ reference

---@class Fade_layout:layout

---@class Slide_layout:layout

---@class VisibilityTransition_layout:layout

---@class TransitionTarget_layout:layout
---@field targetId reference
---@field excludeId reference
---@field excludeClass string
---@field targetName string
---@field excludeName string

---@class TransitionSet_layout:layout

---@class ChangeTransform_layout:layout
---@field reparentWithOverlay boolean
---@field reparent boolean

---@class ChangeBounds_layout:layout

---@class TransitionManager_layout:layout
---@field transition reference
---@field fromScene reference
---@field toScene reference

---@class ArcMotion_layout:layout
---@field minimumHorizontalAngle float
---@field minimumVerticalAngle float
---@field maximumAngle float

---@class PatternPathMotion_layout:layout

---@class Animator_layout:layout
---@field valueFrom float|integer|color|dimension|string
---@field valueTo float|integer|color|dimension|string
---@field valueType valueType
---@field removeBeforeMRelease integer

---@class PropertyValuesHolder_layout:layout

---@class Keyframe_layout:layout
---@field fraction float

---@class PropertyAnimator_layout:layout
---@field propertyName string
---@field propertyXName string
---@field propertyYName string

---@class AnimatorSet_layout:layout

---@class DrawableStates_layout:layout
---@field state_focused boolean
---@field state_window_focused boolean
---@field state_enabled boolean
---@field state_checkable boolean
---@field state_checked boolean
---@field state_selected boolean
---@field state_pressed boolean
---@field state_activated boolean
---@field state_active boolean
---@field state_single boolean
---@field state_first boolean
---@field state_middle boolean
---@field state_last boolean
---@field state_accelerated boolean
---@field state_hovered boolean
---@field state_drag_can_accept boolean
---@field state_drag_hovered boolean
---@field state_accessibility_focused boolean

---@class ViewDrawableStates_layout:layout

---@class MenuItemCheckedState_layout:layout

---@class MenuItemUncheckedState_layout:layout

---@class MenuItemCheckedFocusedState_layout:layout

---@class MenuItemUncheckedFocusedState_layout:layout

---@class ExpandableListChildIndicatorState_layout:layout

---@class ExpandableListGroupIndicatorState_layout:layout
---@field state_expanded boolean
---@field state_empty boolean

---@class PopupWindowBackgroundState_layout:layout

---@class TextViewMultiLineBackgroundState_layout:layout

---@class Searchable_layout:layout
---@field searchButtonText string
---@field searchMode searchMode
---@field voiceSearchMode voiceSearchMode
---@field voiceLanguageModel string
---@field voicePromptText string
---@field voiceLanguage string
---@field voiceMaxResults integer
---@field searchSuggestAuthority string
---@field searchSuggestPath string
---@field searchSuggestSelection string
---@field searchSuggestIntentAction string
---@field searchSuggestIntentData string
---@field searchSuggestThreshold integer
---@field includeInGlobalSearch boolean
---@field queryAfterZeroResults boolean
---@field searchSettingsDescription string
---@field autoUrlDetect boolean

---@class SearchableActionKey_layout:layout
---@field queryActionMsg string
---@field suggestActionMsg string
---@field suggestActionMsgColumn string

---@class MapView_layout:layout

---@class Menu_layout:layout

---@class MenuGroup_layout:layout
---@field menuCategory menuCategory
---@field orderInCategory integer
---@field checkableBehavior checkableBehavior

---@class MenuItem_layout:layout
---@field title string
---@field titleCondensed string
---@field iconTint color
---@field iconTintMode iconTintMode
---@field alphabeticShortcut string
---@field alphabeticModifiers alphabeticModifiers
---@field numericShortcut string
---@field numericModifiers numericModifiers
---@field checkable boolean
---@field showAsAction showAsAction
---@field actionLayout reference
---@field actionViewClass string
---@field actionProviderClass string
---@field contentDescription string
---@field tooltipText string

---@class ActivityChooserView_layout:ViewGroup_layout
---@field initialActivityCount string
---@field expandActivityOverflowButtonDrawable reference

---@class PreferenceGroup_layout:layout

---@class PreferenceHeader_layout:layout
---@field summary string
---@field breadCrumbTitle string
---@field breadCrumbShortTitle string
---@field fragment string

---@class Preference_layout:layout
---@field key string
---@field order integer
---@field widgetLayout reference
---@field selectable boolean
---@field dependency string
---@field defaultValue string|boolean|integer|reference|float
---@field shouldDisableView boolean
---@field recycleEnabled boolean
---@field singleLineTitle boolean
---@field iconSpaceReserved boolean

---@class CheckBoxPreference_layout:layout
---@field summaryOn string
---@field summaryOff string
---@field disableDependentsState boolean

---@class DialogPreference_layout:layout
---@field dialogTitle string
---@field dialogMessage string
---@field dialogIcon reference
---@field positiveButtonText string
---@field negativeButtonText string
---@field dialogLayout reference

---@class ListPreference_layout:layout
---@field entryValues reference

---@class MultiSelectListPreference_layout:layout

---@class RingtonePreference_layout:layout
---@field ringtoneType ringtoneType
---@field showDefault boolean
---@field showSilent boolean

---@class VolumePreference_layout:layout

---@class InputMethodService_layout:layout
---@field imeFullscreenBackground reference|color
---@field imeExtractEnterAnimation reference
---@field imeExtractExitAnimation reference

---@class VoiceInteractionSession_layout:layout

---@class KeyboardView_layout:layout
---@field keyboardViewStyle reference
---@field keyBackground reference
---@field keyTextSize dimension
---@field labelTextSize dimension
---@field keyTextColor color
---@field keyPreviewLayout reference
---@field keyPreviewOffset dimension
---@field keyPreviewHeight dimension
---@field verticalCorrection dimension
---@field popupLayout reference

---@class KeyboardViewPreviewState_layout:layout

---@class Keyboard_layout:Linear_layout
---@field keyWidth dimension|fraction
---@field keyHeight dimension|fraction
---@field horizontalGap dimension|fraction
---@field verticalGap dimension|fraction

---@class Keyboard_Row_layout:layout
---@field rowEdgeFlags rowEdgeFlags
---@field keyboardMode reference

---@class Keyboard_Key_layout:layout
---@field codes integer|string
---@field popupKeyboard reference
---@field popupCharacters string
---@field keyEdgeFlags keyEdgeFlags
---@field isModifier boolean
---@field isSticky boolean
---@field isRepeatable boolean
---@field iconPreview reference
---@field keyOutputText string
---@field keyLabel string
---@field keyIcon reference

---@class AppWidgetProviderInfo_layout:layout
---@field minResizeWidth dimension
---@field minResizeHeight dimension
---@field maxResizeWidth dimension
---@field maxResizeHeight dimension
---@field targetCellWidth integer
---@field targetCellHeight integer
---@field updatePeriodMillis integer
---@field initialLayout reference
---@field initialKeyguardLayout reference
---@field configure string
---@field previewImage reference
---@field previewLayout reference
---@field autoAdvanceViewId reference
---@field resizeMode integer
---@field widgetCategory integer
---@field widgetFeatures integer

---@class WallpaperPreviewInfo_layout:layout

---@class Fragment_layout:layout
---@field fragmentExitTransition reference
---@field fragmentEnterTransition reference
---@field fragmentSharedElementEnterTransition reference
---@field fragmentReturnTransition reference
---@field fragmentSharedElementReturnTransition reference
---@field fragmentReenterTransition reference
---@field fragmentAllowEnterTransitionOverlap reference
---@field fragmentAllowReturnTransitionOverlap reference

---@class DeviceAdmin_layout:layout

---@class Wallpaper_layout:layout
---@field thumbnail reference
---@field author reference
---@field contextUri reference
---@field contextDescription reference
---@field showMetadataInPreview boolean
---@field supportsAmbientMode boolean
---@field shouldUseDefaultUnfoldTransition boolean
---@field settingsSliceUri string
---@field supportsMultipleDisplays boolean

---@class Dream_layout:layout

---@class TrustAgent_layout:layout
---@field unlockProfile boolean

---@class AccountAuthenticator_layout:layout
---@field accountType string
---@field smallIcon reference
---@field accountPreferences reference
---@field customTokens boolean

---@class SyncAdapter_layout:layout
---@field contentAuthority string
---@field userVisible boolean
---@field supportsUploading boolean
---@field allowParallelSyncs boolean
---@field isAlwaysSyncable boolean

---@class AutofillService_layout:layout
---@field passwordsActivity string
---@field supportsInlineSuggestions boolean

---@class AutofillService_CompatibilityPackage_layout:layout
---@field maxLongVersionCode string

---@class OnDeviceRecognitionService_layout:layout

---@class ContentCaptureService_layout:layout

---@class TranslationService_layout:layout

---@class Icon_layout:layout

---@class IconDefault_layout:layout

---@class ContactsDataKind_layout:layout
---@field summaryColumn string
---@field detailColumn string
---@field detailSocialSummary boolean
---@field allContactsName string

---@class SlidingTab_layout:layout

---@class GlowPadView_layout:layout
---@field targetDescriptions reference
---@field directionDescriptions reference

---@class SettingInjectorService_layout:layout
---@field userRestriction string

---@class LockPatternView_layout:layout
---@field aspect string
---@field pathColor color|reference
---@field regularColor color|reference
---@field errorColor color|reference
---@field successColor color|reference
---@field dotColor color|reference

---@class QuickAccessWalletService_layout:layout
---@field settingsActivity string
---@field targetActivity string

---@class RecognitionService_layout:layout
---@field selectableAsDefault boolean

---@class VoiceInteractionService_layout:layout
---@field sessionService string
---@field recognitionService string
---@field supportsAssist boolean
---@field supportsLaunchVoiceAssistFromKeyguard boolean
---@field supportsLocalInteraction boolean
---@field hotwordDetectionService string

---@class VoiceEnrollmentApplication_layout:layout
---@field searchKeyphraseId integer
---@field searchKeyphrase string
---@field searchKeyphraseSupportedLocales string
---@field searchKeyphraseRecognitionFlags searchKeyphraseRecognitionFlags

---@class ActionBar_layout:layout
---@field navigationMode navigationMode
---@field displayOptions displayOptions
---@field subtitle string
---@field titleTextStyle reference
---@field subtitleTextStyle reference
---@field backgroundStacked reference|color
---@field backgroundSplit reference|color
---@field customNavigationLayout reference
---@field homeLayout reference
---@field indeterminateProgressStyle reference
---@field progressBarPadding dimension
---@field itemPadding dimension
---@field hideOnContentScroll boolean
---@field contentInsetStart dimension
---@field contentInsetEnd dimension
---@field contentInsetLeft dimension
---@field contentInsetRight dimension
---@field contentInsetStartWithNavigation dimension
---@field contentInsetEndWithActions dimension

---@class ActionMode_layout:layout
---@field closeItemLayout reference

---@class SearchView_layout:Linear_layout
---@field iconifiedByDefault boolean
---@field queryHint string
---@field defaultQueryHint string
---@field closeIcon reference
---@field goIcon reference
---@field searchIcon reference
---@field searchHintIcon reference
---@field voiceIcon reference
---@field commitIcon reference
---@field suggestionRowLayout reference
---@field queryBackground reference
---@field submitBackground reference

---@class Switch_layout:CompoundButton_layout
---@field track reference
---@field trackTint color
---@field trackTintMode trackTintMode
---@field thumbTextPadding dimension
---@field switchTextAppearance reference
---@field switchMinWidth dimension
---@field switchPadding dimension
---@field showText boolean

---@class Pointer_layout:layout
---@field pointerIconArrow reference
---@field pointerIconSpotHover reference
---@field pointerIconSpotTouch reference
---@field pointerIconSpotAnchor reference
---@field pointerIconContextMenu reference
---@field pointerIconHand reference
---@field pointerIconHelp reference
---@field pointerIconWait reference
---@field pointerIconCell reference
---@field pointerIconCrosshair reference
---@field pointerIconText reference
---@field pointerIconVerticalText reference
---@field pointerIconAlias reference
---@field pointerIconCopy reference
---@field pointerIconNodrop reference
---@field pointerIconAllScroll reference
---@field pointerIconHorizontalDoubleArrow reference
---@field pointerIconVerticalDoubleArrow reference
---@field pointerIconTopRightDiagonalDoubleArrow reference
---@field pointerIconTopLeftDiagonalDoubleArrow reference
---@field pointerIconZoomIn reference
---@field pointerIconZoomOut reference
---@field pointerIconGrab reference
---@field pointerIconGrabbing reference

---@class PointerIcon_layout:layout
---@field bitmap reference
---@field hotSpotX dimension
---@field hotSpotY dimension

---@class Storage_layout:layout
---@field mountPoint string
---@field storageDescription string
---@field primary boolean
---@field removable boolean
---@field emulated boolean
---@field mtpReserve integer
---@field allowMassStorage boolean
---@field maxFileSize integer

---@class SwitchPreference_layout:layout
---@field switchTextOn string
---@field switchTextOff string

---@class SeekBarPreference_layout:layout
---@field adjustable boolean
---@field showSeekBarValue boolean

---@class PreferenceFragment_layout:layout

---@class PreferenceScreen_layout:layout
---@field screenLayout reference

---@class PreferenceActivity_layout:layout
---@field headerLayout reference
---@field headerRemoveIconIfEmpty boolean

---@class TextToSpeechEngine_layout:layout

---@class Keyboard_layout:Linear_layout
---@field keyboardLayout reference
---@field locale string
---@field vendorId integer
---@field productId integer

---@class MediaRouteButton_layout:View_layout
---@field externalRouteEnabledDrawable reference
---@field mediaRouteTypes integer

---@class PagedView_layout:layout
---@field pageSpacing dimension
---@field scrollIndicatorPaddingLeft dimension
---@field scrollIndicatorPaddingRight dimension

---@class KeyguardGlowStripView_layout:layout
---@field dotSize dimension
---@field numDots integer
---@field glowDot reference
---@field leftToRight boolean

---@class FragmentBreadCrumbs_layout:ViewGroup_layout
---@field itemLayout reference
---@field itemColor color|reference

---@class Toolbar_layout:ViewGroup_layout
---@field titleTextAppearance reference
---@field subtitleTextAppearance reference
---@field titleMargin dimension
---@field titleMarginStart dimension
---@field titleMarginEnd dimension
---@field titleMarginTop dimension
---@field titleMarginBottom dimension
---@field maxButtonHeight dimension
---@field navigationButtonStyle reference
---@field buttonGravity buttonGravity
---@field collapseIcon reference
---@field collapseContentDescription string
---@field popupTheme reference
---@field navigationIcon reference
---@field navigationContentDescription string
---@field logoDescription string
---@field titleTextColor color
---@field subtitleTextColor color

---@class Toolbar_layout:ViewGroup_layout

---@class ActionBar_layout:layout

---@class EdgeEffect_layout:layout

---@class TvInputService_layout:layout
---@field setupActivity string
---@field canRecord boolean
---@field tunerCount integer
---@field canPauseRecording boolean

---@class RatingSystemDefinition_layout:layout
---@field country string

---@class RatingDefinition_layout:layout
---@field contentAgeHint integer

---@class ResolverDrawer_layout:layout
---@field maxCollapsedHeight dimension
---@field maxCollapsedHeightSmall dimension
---@field showAtTop boolean

---@class MessagingLinear_layout:layout

---@class DateTimeView_layout:TextView_layout

---@class ResolverDrawer_layout:layout
---@field layout_alwaysShow boolean
---@field layout_ignoreOffset boolean
---@field layout_hasNestedScrollIndicator boolean
---@field layout_maxHeight dimension

---@class Lighting_layout:layout

---@class RestrictionEntry_layout:layout
---@field restrictionType restrictionType

---@class GradientColor_layout:layout
---@field startX float
---@field startY float
---@field endX float
---@field endY float

---@class GradientColorItem_layout:layout
---@field offset float

---@class ActivityTaskDescription_layout:layout

---@class Shortcut_layout:layout
---@field shortcutId string
---@field shortcutShortLabel reference
---@field shortcutLongLabel reference
---@field shortcutDisabledMessage reference
---@field splashScreenTheme reference

---@class ShortcutCategories_layout:layout

---@class FontFamilyFont_layout:layout
---@field fontStyle fontStyle
---@field font reference
---@field fontWeight integer
---@field ttcIndex integer
---@field fontVariationSettings string

---@class FontFamily_layout:layout
---@field fontProviderAuthority string
---@field fontProviderPackage string
---@field fontProviderQuery string
---@field fontProviderCerts reference
---@field fontProviderSystemFontFamily string

---@class VideoView2_layout:layout
---@field enableControlView boolean
---@field enableSubtitle boolean
---@field viewType enum

---@class RecyclerView_layout:ViewGroup_layout
---@field layoutManager string
---@field spanCount integer
---@field reverseLayout boolean
---@field stackFromEnd boolean

---@class NotificationTheme_layout:layout
---@field notificationHeaderStyle reference
---@field notificationHeaderTextAppearance reference
---@field notificationHeaderIconSize dimension
---@field notificationHeaderAppNameVisibility enum

---@class Magnifier_layout:layout
---@field magnifierWidth dimension
---@field magnifierHeight dimension
---@field magnifierZoom float
---@field magnifierElevation dimension
---@field magnifierVerticalOffset dimension
---@field magnifierHorizontalOffset dimension
---@field magnifierColorOverlay color