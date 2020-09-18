en := "qwertyuiopasdfghjkl;'zxcvbnm,./"
he := "/'קראטוןםפשדגכעיחלךף,זסבהנמצתץ."

#If GetKeyState("LWin", "P")
Alt & Space::
    if !LangID := GetKeyboardLanguage() {
        MsgBox, % "GetKeyboardLayout function failed " ErrorLevel
    	return
    }

    translated := ""
    OldClipboard := Clipboard
    send, ^c

    if (LangID = 0x0409) {
        SetDefaultKeyboard(0x040D)
        langChars := en
        translatedChars := he
    } else if (LangID = 0x040D) {
        SetDefaultKeyboard(0x0409)
        langChars := he
        translatedChars := en
    }

    loop, parse, Clipboard
    {
        charPos := InStr(langChars, A_LoopField, false)
		if (charPos = 0)
			translatedChar := A_LoopField
        else
			translatedChar := SubStr(translatedChars, charPos, 1)
        translated := translated . translatedChar
    }

	Clipboard := translated
	Sleep, 600 
	send, ^v
	Sleep, 600
    return
    
GetKeyboardLanguage()
{
	if !KBLayout := DllCall("user32.dll\GetKeyboardLayout")
		return false
	return KBLayout & 0xFFFF
}
    
SetDefaultKeyboard(LocaleID)
{
	Global
	SPI_SETDEFAULTINPUTLANG := 0x005A
	SPIF_SENDWININICHANGE := 2
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 1)
	VarSetCapacity(Lan%LocaleID%, 4, 0)
	NumPut(LocaleID, Lan%LocaleID%)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &Lan%LocaleID%, "UInt", SPIF_SENDWININICHANGE)
	PostMessage 0x50, 0, %Lan%,, A
}
