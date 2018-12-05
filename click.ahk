#NoTrayIcon
setmousedelay -1 
setbatchlines -1

XButton2::
Loop
{
GetKeyState, state,XButton2 , P
if State = U
	break
else
	sleep, 1
	Click 
}
Return
