[Variables]
Temp.Layout=WASD
Temp.Mouse=1

; ---------------------------------------------------------------------------- ;
;                                    Functions                                    ;
; ---------------------------------------------------------------------------- ;

[Export:M]
Measure=String
String=#Layout#
IfMatch=^WASD$
Ifmatchaction=[!SetOption WASD MeterStyle "Set.String:S | Select:S | Selected:S"][!UpdateMEter WASD][!Redraw]
ifnotmatchaction=[!SetOption QWERTY MeterStyle "Set.String:S | Select:S | Selected:S"][!UpdateMEter QWERTY][!Redraw]

[Export2:M]
Measure=String
String=#Temp.Layout# | #Layout#
OnUpdateAction=[!WriteKeyValue Variables "Temp.Layout" "#Layout#" "#SKINSPATH##Skin.Name#\Core\Layout.inc"]
IFMatch=^WASD \| QWERTY$
IfMatchAction=[!WriteKeyValue Variables "Temp.Mouse" "#Mouse#" "#SKINSPATH##Skin.Name#\Core\Layout.inc"][!WriteKeyValue Variables "Mouse" "0" "#Sec.SaveLocation#"]
Ifmatch2=^QWERTY \| WASD$
IfMatchAction2=[!WriteKeyValue Variables "Mouse" "#Temp.Mouse#" "#Sec.SaveLocation#"][!Refresh]



; ---------------------------------------------------------------------------- ;
;                                     Style                                    ;
; ---------------------------------------------------------------------------- ;

[Select:S]
Y=(10*[set.S])
FontFace=Poppins Light
FontSize=(15*[Set.S])
Container=Container
StringAlign=CenterTop
LeftMouseUpAction=[!WriteKeyValue Variables Layout "#CURRENTSECTION#" "#Sec.SaveLocation#"][!UpdateMeasure AUTo_REfresh:M][!Refresh]
[Selected:S]
FontFace=Poppins SemiBold

[KeyB:S] 
X=((50+#KeyPadding#)*[Set.S])r
Y=r
Shape=Rectangle (-50/2),(-50/2),50,50,(#Corner#*5),(#Corner#*5) | StrokeWidth 0 | Extend Fill | Scale [Set.S],[Set.S]
Fill=Fill Color #DefaultColor#,#DefaultOpacity#
DynamicVariables=1
Container=PreviewContainer
[Key2Style]
Shape=Rectangle (-(75)/2),(-50/2),(75),(50),(#Corner#*5),(#Corner#*5) | StrokeWidth 0 | Extend Fill | Scale [Set.S],[Set.S]
[Key3style]
Shape=Rectangle (-(50*3+#KeyPadding#*2)/2),(-50/4),(50*3+#KeyPadding#*2),(50/2),(#Corner#*5),(#Corner#*5) | StrokeWidth 0 | Extend Fill | Scale [Set.S],[Set.S]

[KeyFullboard:S]
X=((50+#KeyPadding#)*[Set.S])r
Y=r
Shape=Rectangle (-50/2),(-50/2),50,50,(#Corner#*5),(#Corner#*5) | StrokeWidth 0 | Extend Fill | Scale [Set.S],[Set.S]
Fill=Fill Color #DefaultColor#,#DefaultOpacity#
DynamicVariables=1
LeftMouseUpAction=[!CommandMeasure Script:M "Toggle('#CURRENTSECTION#')"]
Container=PreviewContainer

[Key:S]
X=r
Y=r
FontFace=#Font#
FontWeight=#Weight#
FontSize=(20*[Set.S])
Antialias=1
FontColor=#DefaultFontColor#
DynamicVariables=1
StringAlign=CenterCenter
Container=PreviewContainer
[KeyNo:S]
X=r
Y=r
FontFace=#Font#
FontWeight=#Weight#
FontSize=(20*[Set.S])
Antialias=1
FontColor=#DefaultFontColor#,150
DynamicVariables=1
StringAlign=CenterCenter
Container=PreviewContainer

; ---------------------------------------------------------------------------- ;
;                                    Content                                   ;
; ---------------------------------------------------------------------------- ;

[Container]
Meter=Shape
Shape=Rectangle 0,0,([ContentContainer:W]),(500*[Set.S]),#Set.R# | StrokeWidth 0
X=([Header:X])
Y=([Header:Y]+50*[Set.S])
DynamicVariables=1

[Background]
Meter=Shape
Shape=Rectangle 0,0,([ContentContainer:W]),(500*[Set.S]),#Set.R# | StrokeWidth 0 | Fill LIneargradient This
This=45 | #Set.Accent_color#,150 ; 0.0 | #Set.Accent_color_2#,150 ; 1.0
DynamicVariables=1
Container=Container

[WASD]
MEter=String
Text=Movement
X=([ContentContainer:W]*0.4)
MeterStyle=Set.String:S | Select:S

[PreviewContainer]
Meter=String
MeterStyle=#Layout#Container:S
[WASDContainer:S]
W=((310-(1-#Circ#)*100)*[Set.S])
H=(200*[Set.S])
X=([ContentContainer:X]+[ContentContainer:W]/2-((310-(1-#Circ#)*100)*[Set.S])/2+#Set.P#)
Y=((500+200/2)*[Set.S]/2)
DynamicVariables=1
SolidColor=255,255,255
[QWERTYContainer:S]
W=((600+(#Circ#)*200)*[Set.S])
H=(230*[Set.S])
X=([ContentContainer:X]+[ContentContainer:W]/2-((600+(#Circ#)*200)*[Set.S])/2+#Set.P#)
Y=((500)*[Set.S]/2)
DynamicVariables=1
SolidColor=255,255,255

[QWERTY]
MEter=String
Text=Fullboard
X=([ContentContainer:W]*0.6)
MeterStyle=Set.String:S | Select:S

; ---------------------------------------------------------------------------- ;
;                                  Option list                                 ;
; ---------------------------------------------------------------------------- ;

[Option10]
Meter=String
X=(30*[Set.S])
Y=(570*[Set.S])r
Text=Keyboard layout
FontColor=255,255,255,(255-150*[&Func:returnBool('Layout', 'WASD', '0', '1')])
MeterStyle=Set.String:S | Set.OptionName:S
[Set.Div:S19s138kb]
Meter=Shape
MeterStyle=Set.Div:S
Hidden=[&Func:returnBool('Layout', 'WASD', '0', '1')]

[Option11]
Meter=String
Text=Mouse accelerometer
MeterStyle=Set.String:S | Set.OptionName:S
[Set.Div:S19s138]
Meter=Shape
MeterStyle=Set.Div:S
[Option12]
Meter=String
Text=Mouse buttons
FontColor=255,255,255,(255-150*[&Func:returnBool('Layout', 'WASD', '0', '1')])
MeterStyle=Set.String:S | Set.OptionName:S

; ---------------------------------------------------------------------------- ;
;                                     Input                                    ;
; ---------------------------------------------------------------------------- ;

; ---------------------- Keyboard Layout Dropdown Style ---------------------- ;
[KBLayoutSelect:S]
FontFace=Poppins Light
FontSize=(10*[Set.S])
FontColor=255,255,255,200
StringAlign=Center
Antialias=1
DynamicVariables=1
LeftMouseUpAction=[!WriteKeyValue Variables KeyboardLayout "#CURRENTSECTION#" "#Sec.SaveLocation#"][!CommandMeasure Script:M "Generate()"]
[KBLayoutSelected:S]
FontFace=Poppins SemiBold
FontColor=255,255,255,255

; ----------------------- Keyboard Layout Selector UI ------------------------ ;
[KeyboardLayoutSelector]
Meter=Shape
Shape=Rectangle 0,0,(180*[Set.S]),(25*[Set.S]),(5*[Set.S]),(5*[Set.S]) | StrokeWidth 0 | Fill Color 255,255,255,30
X=([ContentContainer:W]-210*[Set.S])
Y=([Option10:Y]-#Set.P#+(-25/2+8)*[Set.S])
DynamicVariables=1
Hidden=[&Func:returnBool('Layout', 'WASD', '0', '1')]

[KBLayoutLabel]
Meter=String
Text=#KeyboardLayout#
X=(90*[Set.S])r
Y=(12.5*[Set.S])r
FontFace=Poppins SemiBold
FontSize=(10*[Set.S])
FontColor=255,255,255
StringAlign=CenterCenter
Antialias=1
DynamicVariables=1
LeftMouseUpAction=[!ToggleMeter KBLayoutDropdown][!ToggleMeterGroup KBLayoutItems][!UpdateMeter *][!Redraw]
Hidden=[&Func:returnBool('Layout', 'WASD', '0', '1')]

[KBLayoutDropdown]
Meter=Shape
Shape=Rectangle 0,0,(180*[Set.S]),(175*[Set.S]),(5*[Set.S]),(5*[Set.S]) | StrokeWidth 0 | Fill Color 40,40,40,240
X=([KeyboardLayoutSelector:X])
Y=([KeyboardLayoutSelector:Y]+27*[Set.S])
DynamicVariables=1
Hidden=1

[QWERTY_KB]
Meter=String
Text=QWERTY
MeterStyle=Set.String:S | KBLayoutSelect:S | [&Func:returnBool('KeyboardLayout', 'QWERTY', 'KBLayoutSelected:S', '')]
X=(90*[Set.S])r
Y=(15*[Set.S])r
Group=KBLayoutItems
Hidden=1
LeftMouseUpAction=[!WriteKeyValue Variables KeyboardLayout "QWERTY" "#Sec.SaveLocation#"][!SetVariable KeyboardLayout "QWERTY"][!HideMeter KBLayoutDropdown][!HideMeterGroup KBLayoutItems][!CommandMeasure Script:M "Generate()"]

[Dvorak]
Meter=String
Text=Dvorak
MeterStyle=Set.String:S | KBLayoutSelect:S | [&Func:returnBool('KeyboardLayout', 'Dvorak', 'KBLayoutSelected:S', '')]
X=r
Y=(20*[Set.S])r
Group=KBLayoutItems
Hidden=1
LeftMouseUpAction=[!WriteKeyValue Variables KeyboardLayout "Dvorak" "#Sec.SaveLocation#"][!SetVariable KeyboardLayout "Dvorak"][!HideMeter KBLayoutDropdown][!HideMeterGroup KBLayoutItems][!CommandMeasure Script:M "Generate()"]

[Colemak]
Meter=String
Text=Colemak
MeterStyle=Set.String:S | KBLayoutSelect:S | [&Func:returnBool('KeyboardLayout', 'Colemak', 'KBLayoutSelected:S', '')]
X=r
Y=(20*[Set.S])r
Group=KBLayoutItems
Hidden=1
LeftMouseUpAction=[!WriteKeyValue Variables KeyboardLayout "Colemak" "#Sec.SaveLocation#"][!SetVariable KeyboardLayout "Colemak"][!HideMeter KBLayoutDropdown][!HideMeterGroup KBLayoutItems][!CommandMeasure Script:M "Generate()"]

[ColemakDH]
Meter=String
Text=Colemak DH
MeterStyle=Set.String:S | KBLayoutSelect:S | [&Func:returnBool('KeyboardLayout', 'ColemakDH', 'KBLayoutSelected:S', '')]
X=r
Y=(20*[Set.S])r
Group=KBLayoutItems
Hidden=1
LeftMouseUpAction=[!WriteKeyValue Variables KeyboardLayout "ColemakDH" "#Sec.SaveLocation#"][!SetVariable KeyboardLayout "ColemakDH"][!HideMeter KBLayoutDropdown][!HideMeterGroup KBLayoutItems][!CommandMeasure Script:M "Generate()"]

[Workman]
Meter=String
Text=Workman
MeterStyle=Set.String:S | KBLayoutSelect:S | [&Func:returnBool('KeyboardLayout', 'Workman', 'KBLayoutSelected:S', '')]
X=r
Y=(20*[Set.S])r
Group=KBLayoutItems
Hidden=1
LeftMouseUpAction=[!WriteKeyValue Variables KeyboardLayout "Workman" "#Sec.SaveLocation#"][!SetVariable KeyboardLayout "Workman"][!HideMeter KBLayoutDropdown][!HideMeterGroup KBLayoutItems][!CommandMeasure Script:M "Generate()"]

[Norman]
Meter=String
Text=Norman
MeterStyle=Set.String:S | KBLayoutSelect:S | [&Func:returnBool('KeyboardLayout', 'Norman', 'KBLayoutSelected:S', '')]
X=r
Y=(20*[Set.S])r
Group=KBLayoutItems
Hidden=1
LeftMouseUpAction=[!WriteKeyValue Variables KeyboardLayout "Norman" "#Sec.SaveLocation#"][!SetVariable KeyboardLayout "Norman"][!HideMeter KBLayoutDropdown][!HideMeterGroup KBLayoutItems][!CommandMeasure Script:M "Generate()"]

[AZERTY]
Meter=String
Text=AZERTY
MeterStyle=Set.String:S | KBLayoutSelect:S | [&Func:returnBool('KeyboardLayout', 'AZERTY', 'KBLayoutSelected:S', '')]
X=r
Y=(20*[Set.S])r
Group=KBLayoutItems
Hidden=1
LeftMouseUpAction=[!WriteKeyValue Variables KeyboardLayout "AZERTY" "#Sec.SaveLocation#"][!SetVariable KeyboardLayout "AZERTY"][!HideMeter KBLayoutDropdown][!HideMeterGroup KBLayoutItems][!CommandMeasure Script:M "Generate()"]

[Circ]
Meter=Shape
MeterStyle=Set.Bool:S
Y=([Option11:Y]-#Set.P#+(-20/2+8)*[Set.S])
[Mouse]
Meter=Shape
MeterStyle=Set.Bool:S
Y=([Option12:Y]-#Set.P#+(-20/2+8)*[Set.S])
Hidden=[&Func:returnBool('Layout', 'WASD', '0', '1')]

; ---------------------------------------------------------------------------- ;
;                                    Preview                                   ;
; ---------------------------------------------------------------------------- ;

@includePreviews=#SKINSPATH##SKIN.NAME#\@Resources\Previews\#Layout#.inc
