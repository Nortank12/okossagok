Dim objShell, RegLocate, RegLocate1
Set objShell = WScript.CreateObject("WScript.Shell")

winver = objShell.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductName")
result = MsgBox(winver&" észlelve. Megkezded az aktiválást?", vbOKCancel+vbQuestion, "Win10 auto-aktiváló")

If result = 1  Then
    p_key = ""
    If winver = "Windows 10 Home" Then
        p_key = "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
    ElseIf winver = "Windows 10 Home N" Then
        p_key = "3KHY7-WNT83-DGQKR-F7HPR-844BM"
    ElseIf winver = "Windows 10 Pro" Then
        p_key = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
    ElseIf winver = "Windows 10 Pro N" Then
        p_key = "MH37W-N47XK-V7XM9-C7227-GCQG9"
    ElseIf winver = "Windows 10 Education" Then
        p_key = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
    ElseIf winver = "Windows 10 Education N" Then
        p_key = "2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
    ElseIf winver = "Windows 10 Enterprise" Then
        p_key = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
    ElseIf winver = "Windows 10 Enterprise N" Then
        p_key = "DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"
    End If
    
    com_1 = "cscript ""%windir%\system32\slmgr.vbs"" /ipk "&p_key
    com_2 = "&cscript ""%windir%\system32\slmgr.vbs"" /skms kms.digiboy.ir"
    com_3 = "&cscript ""%windir%\system32\slmgr.vbs"" /ato"
    
    Set objShell = CreateObject("Shell.Application")
    objShell.ShellExecute "cmd", "/K @echo off&"&com_1&com_2&com_3&"&pause&exit", "", "runas", 1
End If