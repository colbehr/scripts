#NoTrayIcon
*XButton1::
Loop
{
	GetKeyState, state,XButton1 , P
	if State = U
		break
	else
		Send, {Space}
		Sleep, 1
}
return