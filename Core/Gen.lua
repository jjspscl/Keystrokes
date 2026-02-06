array1 = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'}
array2 = {'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'}
array3 = {'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'}
array4 = {'Z', 'X', 'C', 'V', 'B', 'N', 'M'}

keyboardLayouts = {
    QWERTY = {
        row1 = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'},
        row2 = {'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'},
        row3 = {'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'},
        row4 = {'Z', 'X', 'C', 'V', 'B', 'N', 'M'}
    },
    Dvorak = {
        row1 = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'},
        row2 = {"'", ',', '.', 'P', 'Y', 'F', 'G', 'C', 'R', 'L'},
        row3 = {'A', 'O', 'E', 'U', 'I', 'D', 'H', 'T', 'N'},
        row4 = {';', 'Q', 'J', 'K', 'X', 'B', 'M'}
    },
    Colemak = {
        row1 = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'},
        row2 = {'Q', 'W', 'F', 'P', 'G', 'J', 'L', 'U', 'Y', ';'},
        row3 = {'A', 'R', 'S', 'T', 'D', 'H', 'N', 'E', 'I'},
        row4 = {'Z', 'X', 'C', 'V', 'B', 'K', 'M'}
    },
    ColemakDH = {
        row1 = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'},
        row2 = {'Q', 'W', 'F', 'P', 'B', 'J', 'L', 'U', 'Y', ';'},
        row3 = {'A', 'R', 'S', 'T', 'G', 'M', 'N', 'E', 'I'},
        row4 = {'Z', 'X', 'C', 'D', 'V', 'K', 'H'}
    },
    Workman = {
        row1 = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'},
        row2 = {'Q', 'D', 'R', 'W', 'B', 'J', 'F', 'U', 'P', ';'},
        row3 = {'A', 'S', 'H', 'T', 'G', 'Y', 'N', 'E', 'O'},
        row4 = {'Z', 'X', 'M', 'C', 'V', 'K', 'L'}
    },
    Norman = {
        row1 = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'},
        row2 = {'Q', 'W', 'D', 'F', 'K', 'J', 'U', 'R', 'L', ';'},
        row3 = {'A', 'S', 'E', 'T', 'G', 'Y', 'N', 'I', 'O'},
        row4 = {'Z', 'X', 'C', 'V', 'B', 'H', 'M'}
    },
    AZERTY = {
        row1 = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'},
        row2 = {'A', 'Z', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'},
        row3 = {'Q', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'},
        row4 = {'W', 'X', 'C', 'V', 'B', 'N', 'M'}
    }
}

label1 = array1
label2 = array2
label3 = array3
label4 = array4

function Initialize()
    r1 = SKIN:GetVariable('Row1')
    r2 = SKIN:GetVariable('Row2')
    r3 = SKIN:GetVariable('Row3')
    r4 = SKIN:GetVariable('Row4')
    saveLocation = SKIN:GetVariable('Sec.SaveLocation')
    root = SKIN:GetVariable('ROOTCONFIGPATH')
    
    local kbLayout = SKIN:GetVariable('KeyboardLayout') or 'QWERTY'
    if keyboardLayouts[kbLayout] then
        label1 = keyboardLayouts[kbLayout].row1
        label2 = keyboardLayouts[kbLayout].row2
        label3 = keyboardLayouts[kbLayout].row3
        label4 = keyboardLayouts[kbLayout].row4
    else
        -- Default to QWERTY if invalid layout
        label1 = keyboardLayouts['QWERTY'].row1
        label2 = keyboardLayouts['QWERTY'].row2
        label3 = keyboardLayouts['QWERTY'].row3
        label4 = keyboardLayouts['QWERTY'].row4
    end
end

function Generate()
    print("Generating...")
    
    local kbLayout = SKIN:GetVariable('KeyboardLayout') or 'QWERTY'
    if keyboardLayouts[kbLayout] then
        label1 = keyboardLayouts[kbLayout].row1
        label2 = keyboardLayouts[kbLayout].row2
        label3 = keyboardLayouts[kbLayout].row3
        label4 = keyboardLayouts[kbLayout].row4
    else
        label1 = keyboardLayouts['QWERTY'].row1
        label2 = keyboardLayouts['QWERTY'].row2
        label3 = keyboardLayouts['QWERTY'].row3
        label4 = keyboardLayouts['QWERTY'].row4
    end
    
    local File = io.open(SKIN:GetVariable('SKINSPATH')..'Keystrokes\\Main\\Styles\\QWERTY.inc','w')
    File:write(
        '[Background]\n'
        ,'Meter=Shape\n'
        ,'Shape=Rectangle 0,0,(#Scale#*555+(#KeyPadding#-5)*11),(#Scale#*170),(#Corner#*5),(#Corner#*5) | StrokeWidth 0 | Fill Color #BackgroundColor#,#BackgroundOpacity#\n'
    )
    -- -------------------------------------------------------------------------- --
    --                                     One                                    --
    -- -------------------------------------------------------------------------- --
    bool = tonumber(r1:sub(1, 1))
    if bool == 1 then
        ShapeString = ''
        LabelString = '#RGB#'
    else
        ShapeString = 'No'
        LabelString = 'No'
    end
    File:write(
        '['..array1[1]..'Shape]\n'
        ,'Meter=Shape\n'
        ,'MeterStyle=KeyB'..ShapeString..':S\n'
        ,'X=(((#Circ#)*110+(50/2+#KeyPadding#))*#Scale#)\n'
        ,'Y=((50/2+#KeyPadding#)*#Scale#)\n'
        ,'['..array1[1]..'Label]\n'
        ,'Meter=String\n'
        ,'MeterStyle=Key'..LabelString..':S\n'
        ,'Text='..label1[1]..'\n'
    )

    for i=2, 10 do
        bool = tonumber(r1:sub(i, i))
        if bool == 1 then
            ShapeString = ''
            LabelString = '#RGB#'
        else
            ShapeString = 'No'
            LabelString = 'No'
        end
        File:write(
            '['..array1[i]..'Shape]\n'
            ,'Meter=Shape\n'
            ,'MeterStyle=KeyB'..ShapeString..':S\n'
            ,'['..array1[i]..'Label]\n'
            ,'Meter=String\n'
            ,'MeterStyle=Key'..LabelString..':S\n'
            ,'Text='..label1[i]..'\n'
        )
    end
    -- -------------------------------------------------------------------------- --
    --                                     TWo                                    --
    -- -------------------------------------------------------------------------- --
    bool = tonumber(r2:sub(1, 1))
    if bool == 1 then
        ShapeString = ''
        LabelString = '#RGB#'
    else
        ShapeString = 'No'
        LabelString = 'No'
    end
    File:write(
        '['..array2[1]..'Shape]\n'
        ,'Meter=Shape\n'
        ,'MeterStyle=KeyB'..ShapeString..':S\n'
        ,'X=(((#Circ#)*110+(50+#KeyPadding#))*#Scale#)\n'
        ,'Y=((50+#KeyPadding#)*#Scale#)r\n'
        ,'['..array2[1]..'Label]\n'
        ,'Meter=String\n'
        ,'MeterStyle=Key'..LabelString..':S\n'
        ,'Text='..label2[1]..'\n'
    )

    for i=2, 10 do
        bool = tonumber(r2:sub(i, i))
        if bool == 1 then
            ShapeString = ''
            LabelString = '#RGB#'
        else
            ShapeString = 'No'
            LabelString = 'No'
        end
        File:write(
            '['..array2[i]..'Shape]\n'
            ,'Meter=Shape\n'
            ,'MeterStyle=KeyB'..ShapeString..':S\n'
            ,'['..array2[i]..'Label]\n'
            ,'Meter=String\n'
            ,'MeterStyle=Key'..LabelString..':S\n'
            ,'Text='..label2[i]..'\n'
        )
    end
    -- -------------------------------------------------------------------------- --
    --                                    Three                                   --
    -- -------------------------------------------------------------------------- --
    bool = tonumber(r3:sub(1, 1))
    if bool == 1 then
        ShapeString = ''
        LabelString = '#RGB#'
    else
        ShapeString = 'No'
        LabelString = 'No'
    end
    File:write(
        '['..array3[1]..'Shape]\n'
        ,'Meter=Shape\n'
        ,'MeterStyle=KeyB'..ShapeString..':S\n'
        ,'X=(((#Circ#)*110+(50*1.5+#KeyPadding#))*#Scale#)\n'
        ,'Y=((50+#KeyPadding#)*#Scale#)r\n'
        ,'['..array3[1]..'Label]\n'
        ,'Meter=String\n'
        ,'MeterStyle=Key'..LabelString..':S\n'
        ,'Text='..label3[1]..'\n'
    )

    for i=2, 9 do
        bool = tonumber(r3:sub(i, i))
        if bool == 1 then
            ShapeString = ''
            LabelString = '#RGB#'
        else
            ShapeString = 'No'
            LabelString = 'No'
        end
        File:write(
            '['..array3[i]..'Shape]\n'
            ,'Meter=Shape\n'
            ,'MeterStyle=KeyB'..ShapeString..':S\n'
            ,'['..array3[i]..'Label]\n'
            ,'Meter=String\n'
            ,'MeterStyle=Key'..LabelString..':S\n'
            ,'Text='..label3[i]..'\n'
        )
    end
    -- -------------------------------------------------------------------------- --
    --                                    Four                                    --
    -- -------------------------------------------------------------------------- --
    bool = tonumber(r4:sub(1, 1))
    if bool == 1 then
        ShapeString = ''
        LabelString = '#RGB#'
    else
        ShapeString = 'No'
        LabelString = 'No'
    end
    File:write(
        '['..array4[1]..'Shape]\n'
        ,'Meter=Shape\n'
        ,'MeterStyle=KeyB'..ShapeString..':S\n'
        ,'X=(((#Circ#)*110+(50*2+#KeyPadding#))*#Scale#)\n'
        ,'Y=((50+#KeyPadding#)*#Scale#)r\n'
        ,'['..array4[1]..'Label]\n'
        ,'Meter=String\n'
        ,'MeterStyle=Key'..LabelString..':S\n'
        ,'Text='..label4[1]..'\n'
    )

    for i=2, 7 do
        bool = tonumber(r4:sub(i, i))
        if bool == 1 then
            ShapeString = ''
            LabelString = '#RGB#'
        else
            ShapeString = 'No'
            LabelString = 'No'
        end
        File:write(
            '['..array4[i]..'Shape]\n'
            ,'Meter=Shape\n'
            ,'MeterStyle=KeyB'..ShapeString..':S\n'
            ,'['..array4[i]..'Label]\n'
            ,'Meter=String\n'
            ,'MeterStyle=Key'..LabelString..':S\n'
            ,'Text='..label4[i]..'\n'
        )
    end
    File:close()
    -- -------------------------------------------------------------------------- --
    --                              Generate measures                             --
    -- -------------------------------------------------------------------------- --
    local File = io.open(SKIN:GetVariable('SKINSPATH')..'Keystrokes\\@Resources\\Global\\KeyQWERTY.inc','w')
    for i=1, 10 do
        bool = tonumber(r1:sub(i, i))
        if bool == 1 then
            File:write(
                '['..array1[i]..'keyMeasure]\n'
                ,'Measure=Plugin\n'
                ,'Plugin=HotKey\n'
                ,'HotKey='..array1[i]..'\n'
                ,'KeyDownAction=[!SetOption '..array1[i]..'Shape Fill "Fill Color #PressedColor#,#PressedOpacity#"][!SetOption '..array1[i]..'Label MeterStyle "Key#RGBOverride#Over:S"][!UpdateMeter '..array1[i]..'Label][!UpdateMeter '..array1[i]..'Shape][!Redraw]\n'
                ,'KeyUpAction=[!SetOption '..array1[i]..'Shape Fill "Fill Color #DefaultColor#,#DefaultOpacity#"][!SetOption '..array1[i]..'Label MeterStyle "Key#RGB#:S"][!UpdateMeter '..array1[i]..'Label][!UpdateMeter '..array1[i]..'Shape][!Redraw]\n'
            )
        end
    end
    for i=1, 10 do
        bool = tonumber(r2:sub(i, i))
        if bool == 1 then
            File:write(
                '['..array2[i]..'keyMeasure]\n'
                ,'Measure=Plugin\n'
                ,'Plugin=HotKey\n'
                ,'HotKey='..array2[i]..'\n'
                ,'KeyDownAction=[!SetOption '..array2[i]..'Shape Fill "Fill Color #PressedColor#,#PressedOpacity#"][!SetOption '..array2[i]..'Label MeterStyle "Key#RGBOverride#Over:S"][!UpdateMeter '..array2[i]..'Label][!UpdateMeter '..array2[i]..'Shape][!Redraw]\n'
                ,'KeyUpAction=[!SetOption '..array2[i]..'Shape Fill "Fill Color #DefaultColor#,#DefaultOpacity#"][!SetOption '..array2[i]..'Label MeterStyle "Key#RGB#:S"][!UpdateMeter '..array2[i]..'Label][!UpdateMeter '..array2[i]..'Shape][!Redraw]\n'
            )
        end
    end
    for i=1, 9 do
        bool = tonumber(r3:sub(i, i))
        if bool == 1 then
            File:write(
                '['..array3[i]..'keyMeasure]\n'
                ,'Measure=Plugin\n'
                ,'Plugin=HotKey\n'
                ,'HotKey='..array3[i]..'\n'
                ,'KeyDownAction=[!SetOption '..array3[i]..'Shape Fill "Fill Color #PressedColor#,#PressedOpacity#"][!SetOption '..array3[i]..'Label MeterStyle "Key#RGBOverride#Over:S"][!UpdateMeter '..array3[i]..'Label][!UpdateMeter '..array3[i]..'Shape][!Redraw]\n'
                ,'KeyUpAction=[!SetOption '..array3[i]..'Shape Fill "Fill Color #DefaultColor#,#DefaultOpacity#"][!SetOption '..array3[i]..'Label MeterStyle "Key#RGB#:S"][!UpdateMeter '..array3[i]..'Label][!UpdateMeter '..array3[i]..'Shape][!Redraw]\n'
            )
        end
    end
    for i=1, 7 do
        bool = tonumber(r4:sub(i, i))
        if bool == 1 then
            File:write(
                '['..array4[i]..'keyMeasure]\n'
                ,'Measure=Plugin\n'
                ,'Plugin=HotKey\n'
                ,'HotKey='..array4[i]..'\n'
                ,'KeyDownAction=[!SetOption '..array4[i]..'Shape Fill "Fill Color #PressedColor#,#PressedOpacity#"][!SetOption '..array4[i]..'Label MeterStyle "Key#RGBOverride#Over:S"][!UpdateMeter '..array4[i]..'Label][!UpdateMeter '..array4[i]..'Shape][!Redraw]\n'
                ,'KeyUpAction=[!SetOption '..array4[i]..'Shape Fill "Fill Color #DefaultColor#,#DefaultOpacity#"][!SetOption '..array4[i]..'Label MeterStyle "Key#RGB#:S"][!UpdateMeter '..array4[i]..'Label][!UpdateMeter '..array4[i]..'Shape][!Redraw]\n'
            )
        end
    end
    SKIN:Bang('!UpdateMeasure', 'Auto_Refresh:M')
    SKIN:Bang('!Refresh')
end






























function Toggle(key)
    -- -------------------------------- functions ------------------------------- --
    local function has_value (tab, val)
        for index, value in ipairs(tab) do
            if value == val then
                return true
            end
        end
    
        return false
    end
    local function replace_char(pos, str, r)
        return str:sub(1, pos-1) .. r .. str:sub(pos+1)
    end
    -- ---------------------------------- Code ---------------------------------- --
    local key = key:gsub('Shape$', '')
    -- ----------------- find which array the key is located in ----------------- --
    if has_value(array1, key) then
        row = r1
        rowN = '1'
        array = array1
    elseif has_value(array2, key) then
        row = r2
        rowN = '2'
        array = array2
    elseif has_value(array3, key) then
        row = r3
        rowN = '3'
        array = array3
    else
        row = r4
        rowN = '4'
        array = array4
    end
    -- ------------ find which index the key is located in the array ------------ --
    local index={}
    for k,v in pairs(array) do
    index[v]=k
    end
    -- ------------------------------ writing work ------------------------------ --
    local position = index[key]
    local bool = tonumber(row:sub(position, position))
    if bool == 0 then
        row = replace_char(position, row, '1')
        SKIN:Bang('!SetOption', key..'Label', 'MeterStyle', 'Key:S')
        SKIN:Bang('!WriteKeYvalue', key..'Label', 'MeterStyle', 'Key:S', SKIN:GetVariable('SKINSPATH')..'Keystrokes'..'\\@Resources\\Previews\\QWERTY.inc')
    else
        row = replace_char(position, row, '0')
        SKIN:Bang('!SetOption', key..'Label', 'MeterStyle', 'KeyNo:S')
        SKIN:Bang('!WriteKeYvalue', key..'Label', 'MeterStyle', 'KeyNo:S', SKIN:GetVariable('SKINSPATH')..'Keystrokes'..'\\@Resources\\Previews\\QWERTY.inc')
    end
    SKIN:Bang('!WriteKeyValue', 'Variables', 'Row'..rowN, row, saveLocation)
    SKIN:Bang('!SetVariable', 'Row'..rowN, row)
    SKIN:Bang('!UpdateMeter', '*')
    SKIN:Bang('!Redraw')
    
    r1 = SKIN:GetVariable('Row1')
    r2 = SKIN:GetVariable('Row2')
    r3 = SKIN:GetVariable('Row3')
    r4 = SKIN:GetVariable('Row4')
end

function GetKeyLabel(row, position)
    local kbLayout = SKIN:GetVariable('KeyboardLayout') or 'QWERTY'
    local layout = keyboardLayouts[kbLayout] or keyboardLayouts['QWERTY']
    
    if row == 1 and position >= 1 and position <= 10 then
        return layout.row1[position]
    elseif row == 2 and position >= 1 and position <= 10 then
        return layout.row2[position]
    elseif row == 3 and position >= 1 and position <= 9 then
        return layout.row3[position]
    elseif row == 4 and position >= 1 and position <= 7 then
        return layout.row4[position]
    end
    return ''
end

function GetSupportedLayouts()
    local layouts = {}
    for k, v in pairs(keyboardLayouts) do
        table.insert(layouts, k)
    end
    return table.concat(layouts, '|')
end