;-----------------------------------------
; Mac keyboard to Windows Key Mappings
;=========================================

; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN
;

InstallKeybdHook()
#SingleInstance force
SetTitleMatchMode(2)
SendMode("Input")
#UseHook true

SetCapsLockState("AlwaysOff")

+WheelDown::WheelRight
+WheelUp::WheelLeft


; --------------------------------------------------------------
; Programs which use Widnows key map
; --------------------------------------------------------------

GroupAdd("Terminal", "ahk_class mintty")
GroupAdd("Terminal", "ahk_class Vim")
GroupAdd("Terminal", "ahk_class PuTTY")
GroupAdd("Terminal", "ahk_class VanDyke Software - SecureCRT")
GroupAdd("Terminal", "ahk_class VirtualConsoleClass")
GroupAdd("Terminal", "ahk_class TMobaXtermForm")
;GroupAdd, Terminal, 鈥?Atom ahk_class Chrome_WidgetWin_1

GroupAdd("VSCode", "- Visual Studio Code")


GroupAdd("Jetbrains", "ahk_class SunAwtDialog")
GroupAdd("Jetbrains", "ahk_class SunAwtFrame")


; GroupAdd NeatReader, ahk_exe C:\Program Files (x86)\NeatReader\NeatReader.exe
; GroupAdd NeatReader, ahk_exe C:\PROGRA~1\NeatReader\NeatReader.exe
; GroupAdd NeatReader, ahk_exe NeatReader.exe




InTerminal() {
  return WinActive("ahk_group Terminal")
}

InJetbrainsIDE() {
  return WinActive("ahk_group Jetbrains")
}

InVSCode() {
  return WinActive("ahk_group VSCode")
}

InSecureCRT() {
  return WinActive("ahk_class VanDyke Software - SecureCRT")
}

InOneNote() {
  return WinActive("- OneNote")
}

ToUseCtrlNavi(keyname) {
  if InOneNote()
    if (keyname == "Up") || (keyname == "Down")
    return True
    else
    return False
  else return False
}

; --------------------------------------------------------------
; OS X system shortcuts
; --------------------------------------------------------------

; LWin::
; Return

; Close windows (cmd + q to Alt + F4)


; Remap Windows + Tab to Alt + Tab.
; <^tab::AltTab
; F1::Send, <!>^{Left}
; F2::Send, <!>^{Right}

; F1::Send, {LCtrl up}{LWin down}{LCtrl down}{Left}{LWin up}{LCtrl up}
; F2::Send, {LCtrl up}{LWin down}{LCtrl down}{Right}{LWin up}{LCtrl up}

;;<#CapsLock::ShiftAltTab

;;GroupAdd, ignorewin, ahk_class TMobaXtermForm
;;GroupAdd, ignorewin, ahk_class Emacs
;;GroupAdd, ignorewin, ahk_class SunAwtFrame
;;GroupAdd, ignorewin, ahk_class HwndWrapper[DefaultDomain;;a500c890-4756-4db5-be56-faaf7c47492b]
;;GroupAdd, ignorewin, ahk_class TMobaXtermForm
;;GroupAdd, ignorewin, ahk_class moba/x X rl
;;GroupAdd, ignorewin, ahk_exe devenv.exe
;;GroupAdd, ignorewin, ahk_exe BCompare.exe
;;GroupAdd, ignorewin, ahk_exe CDViewer.exe
;;GroupAdd, ignorewin, ahk_exe Xshell.exe


;=====================================================================o
;                      激活窗口                                        ;|
;---------------------------------o-----------------------------------o
;---------------------------------o-----------------------------------o
Activate(t)
{
  if WinActive(t)
  {
    WinMinimize()
    return
  }
  SetTitleMatchMode(2)
  DetectHiddenWindows(true)
  if WinExist(t)
  {
    WinShow()
    WinActivate()
    return 1
  }
  return 0
}

ActivateAndOpen(t,p)
{
  if Activate(t)==0
  {
    Run(p)
    WinActivate()
    return
  }
}


<!>^q::ActivateAndOpen("- Outlook","outlook.exe")
<!>^w::ActivateAndOpen("- Word","C:\Program Files\Microsoft Office\Office15\WINWORD.EXE")
<!>^e::ActivateAndOpen("- Excel","C:\Program Files\Microsoft Office\Office15\EXCEL.EXE")
<!>^r::ActivateAndOpen("- PowerPoint","C:\Program Files\Microsoft Office\Office15\POWERPNT.EXE")
<!>^t::ActivateAndOpen("ahk_class CASCADIA_HOSTING_WINDOW_CLASS","Windows Terminal")
<!>^y::MsgBox("This is y")
<!>^u::MsgBox("This is u")
<!>^i::MsgBox("This is i")
<!>^o::ActivateAndOpen("- OneNote","ONENOTE.exe")
<!>^p::MsgBox("This is p")


; <!>^a::ActivateAndOpen("NeatReader","C:\Program Files (x86)\NeatReader\NeatReader.exe")
<!>^s::ActivateAndOpen("WeLink","") ;WeLink
;;<!>^s::ActivateAndOpen("- Microsoft Edge","microsoft-edge")
<!>^d::ActivateAndOpen("- Adobe Acrobat Reader DC","C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe")
<!>^f::ActivateAndOpen("Total Commander","")
; <!>^f::ActivateAndOpen("ahk_class CabinetWClass","explorer")
<!>^g::ActivateAndOpen("- Microsof","")
<!>^h::ActivateAndOpen("ahk_class SunAwtFrame","C:\Program Files\JetBrains\PyCharm 2020.3.2\bin\pycharm64.exe")
<!>^j::ActivateAndOpen("IntelliJ IDEA 2017.1","D:\APP\JetBrains\IntelliJ IDEA 2017.1\bin\idea64.exe")
<!>^k::ActivateAndOpen("- GoLand","D:\APP\JetBrains\GoLand 182.3569.26\bin\goland64.exe")
; <!>^l::ActivateAndOpen("- PyCharm","D:\APP\JetBrains\PyCharm 2018.1.4\bin\pycharm64.exe")
<!>^l::ActivateAndOpen("- Google Chrome","C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")


; <!>^z::ActivateAndOpen("ahk_exe NeatReader.exe","zotero.exe")
; <!>^x::ActivateAndOpen("- Mozilla Firefox","C:\Program Files\Mozilla Firefox\firefox.exe")
<!>^x::ActivateAndOpen("- Dynalist","C:\Program Files (x86)\Google\Chrome\Application\chrome_proxy.exe  --profile-directory=Default --app-id=jgikgglfcplknofghgafpbiomphkjiif")
; <!>^c::ActivateAndOpen("Neat Reader","C:\Program Files (x86)\NeatReader\NeatReader.exe")
<!>^c::ActivateAndOpen("- Visual Studio Code", "")
; <!>^c::ActivateAndOpen("Cmder","D:\Home\App\cmder\Cmder.exe")
; <!>^v::ActivateAndOpen("- Visio Professional", "C:\Program Files\Microsoft Office\Office15\VISIO.EXE")
; <!>^v::ActivateAndOpen("- Enterprise Architect", "C:\Program Files (x86)\EdrawSoft\EdrawMax\EdrawMax.exe")
<!>^v::ActivateAndOpen("ahk_class Qt5QWindowIcon", "C:\Program Files (x86)\EdrawSoft\EdrawMax\EdrawMax.exe")
<!>^b::ActivateAndOpen("- Mozilla Firefox","C:\Program Files\Mozilla Firefox\firefox.exe")
; <!>^m::ActivateAndOpen("Postman", "Postman.exe")
<!>^n::MsgBox("This is n")




;=====================================================================o
;                      导航                                           ;|
;---------------------------------o-----------------------------------o

>^h::MySendNavigator("Left")
>^l::MySendNavigator("Right")
>^j::MySendNavigator("Down")
>^k::MySendNavigator("Up")
>^;::MySendNavigator("Home")
>^'::MySendNavigator("End")
>^g::MyDeleteLine()
>^[::Send("^+{Tab}")
>^]::Send("^{Tab}")



;=====================================================================o
;                     Navigator Function
;-----------------------------------o---------------------------------o
MySendNavigator(keyname){
  if GetKeyState("LWin") = 0
  {
    if GetKeyState("alt") = 0
      if ToUseCtrlNavi(keyname)
        Send("^{" keyname "}")
      else
        Send("{" keyname "}")
    else
      Send("!{" keyname "}")
    return
  }
  else {
    if GetKeyState("alt") = 0
      Send("{" keyname "}")
    else
      Send("!{" keyname "}")
    return
  }
  return
}

MySendNavigatorShift(keyname){
  if GetKeyState("LWin") = 0
  {
    if GetKeyState("alt") = 0
      Send("+{" keyname "}")
    else
      Send("+!{" keyname "}")
    return
  }
  else {
    if GetKeyState("alt") = 0
      Send("^{" keyname "}")
    else
      Send("^!{" keyname "}")
    return
  }
  return
}

MyDeleteLine(){
  if GetKeyState("control") = 0
  {
    if GetKeyState("alt") = 0
        Send("{home}+{end}^c")
    else
        Send("{home}+{end}^c")
    return
  }
  else {
    if GetKeyState("alt") = 0
        Send("{home}+{end}^c")
    else
        Send("{home}+{end}^c")
    return
  }
  return
}
