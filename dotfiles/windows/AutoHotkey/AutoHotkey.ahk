#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetNumLockState, AlwaysOn
!1::Numpad1
!2::Numpad2
!3::Numpad3
!4::Numpad4
!5::Numpad5
!6::Numpad6
!7::Numpad7
!8::Numpad8
!9::Numpad9
!0::Numpad0

#Enter::
Sleep, 150
Run, wt
; Run, C:\Users\david\AppData\Local\Microsoft\WindowsApps\wt.exe,,, process_id
; Send, %process_id%
; Send, %process_id%
; WinWait, ahk_id %process_id%
; WinActivate, ahk_id %process_id%
; WinWait, ahk_exe wt.exe
; WinActivate, ahk_exe wt.exe
return
exit