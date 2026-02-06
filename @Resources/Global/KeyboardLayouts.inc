; ---------------------------------------------------------------------------- ;
;                           Keyboard Layout Mappings                          ;
; ---------------------------------------------------------------------------- ;
; This file defines the key label mappings for different keyboard layouts
; The physical key position uses QWERTY as the base (Row1-4, position in row)
; The displayed label changes based on the selected KeyboardLayout
;
; Supported layouts:
;   - QWERTY (default)
;   - Dvorak
;   - Colemak
;   - ColemakDH (Colemak Mod-DH)
;   - Workman
;   - Norman
;   - AZERTY
;
; ---------------------------------------------------------------------------- ;

[Variables]
; Row 1: Number row (same across all layouts)
Layout.QWERTY.Row1=1|2|3|4|5|6|7|8|9|0
Layout.Dvorak.Row1=1|2|3|4|5|6|7|8|9|0
Layout.Colemak.Row1=1|2|3|4|5|6|7|8|9|0
Layout.ColemakDH.Row1=1|2|3|4|5|6|7|8|9|0
Layout.Workman.Row1=1|2|3|4|5|6|7|8|9|0
Layout.Norman.Row1=1|2|3|4|5|6|7|8|9|0
Layout.AZERTY.Row1=1|2|3|4|5|6|7|8|9|0

; Row 2: Top letter row
Layout.QWERTY.Row2=Q|W|E|R|T|Y|U|I|O|P
Layout.Dvorak.Row2='|,|.|P|Y|F|G|C|R|L
Layout.Colemak.Row2=Q|W|F|P|G|J|L|U|Y|;
Layout.ColemakDH.Row2=Q|W|F|P|B|J|L|U|Y|;
Layout.Workman.Row2=Q|D|R|W|B|J|F|U|P|;
Layout.Norman.Row2=Q|W|D|F|K|J|U|R|L|;
Layout.AZERTY.Row2=A|Z|E|R|T|Y|U|I|O|P

; Row 3: Home row
Layout.QWERTY.Row3=A|S|D|F|G|H|J|K|L
Layout.Dvorak.Row3=A|O|E|U|I|D|H|T|N
Layout.Colemak.Row3=A|R|S|T|D|H|N|E|I
Layout.ColemakDH.Row3=A|R|S|T|G|M|N|E|I
Layout.Workman.Row3=A|S|H|T|G|Y|N|E|O
Layout.Norman.Row3=A|S|E|T|G|Y|N|I|O
Layout.AZERTY.Row3=Q|S|D|F|G|H|J|K|L

; Row 4: Bottom letter row
Layout.QWERTY.Row4=Z|X|C|V|B|N|M
Layout.Dvorak.Row4=;|Q|J|K|X|B|M
Layout.Colemak.Row4=Z|X|C|V|B|K|M
Layout.ColemakDH.Row4=Z|X|C|D|V|K|H
Layout.Workman.Row4=Z|X|M|C|V|K|L
Layout.Norman.Row4=Z|X|C|V|B|H|M
Layout.AZERTY.Row4=W|X|C|V|B|N|M
