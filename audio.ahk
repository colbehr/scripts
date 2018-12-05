#Persistent			; This keeps the script running permanently.
#SingleInstance		; Only allows one instance of the script to run.
#NoTrayIcon
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Win+A to change Audio Playback Device
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#a::
	toggle++ 
	toggle:= Mod(toggle, 2) ; This toggles the variable between 0,1 or 2
	if (toggle = 0)
	{
		Run nircmd setdefaultsounddevice "Speakers"
		soundToggleBox("Speakers")
	} 
	else
	{
		Run nircmd setdefaultsounddevice "Headphones"
		soundToggleBox("Headphones")
	}
Return

; Display sound toggle GUI
soundToggleBox(Device)
{
	IfWinExist, soundToggleWin
	{
		Gui, destroy
	}
	
	Gui, +ToolWindow -Caption +alwaysontop
	Gui, Add, text, x35 y8, %Device%
	SysGet, screenx, 0
	SysGet, screeny, 1
	xpos:=screenx-175
	ypos:=screeny-100
	Gui, Show, NoActivate x%xpos% y%ypos% h30 w150, soundToggleWin
	
	SetTimer,soundToggleClose, 1000
}
soundToggleClose:
    SetTimer,soundToggleClose, off
    Gui, destroy
Return
