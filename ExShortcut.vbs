Option Explicit

Dim oShell,oFSO,oSoruce,oDest,oTarget,oDesktop,oStream
Dim sString

Set oShell = WScript.CreateObject("WScript.Shell")
Set oFSO   = WScript.CreateObject("Scripting.FileSystemObject")

If WScript.Arguments.Count <> 1 Then
    WScript.Quit
End If

sString = WScript.Arguments.Item(0)
If oFSO.FolderExists(sString) = False Then
    MsgBox sString & "  はフォルダではありません"
    WScript.Quit
End If

'ソースフォルダオブジェクト作成
Set oSoruce = oFSO.GetFolder(sString)

'デスクトップパスを取得
sString = oShell.SpecialFolders("Desktop")

'特別リンク用のフォルダを作成し,そのフォルダオブジェクトを取得
Set oDest = oFSO.CreateFolder(sString & "\Z_" & oSoruce.Name)

'target.lnkのオブエクト取得
Set oTarget = oShell.CreateShortcut(oDest.Path & "\target.lnk")
oTarget.TargetPath = oSoruce.Path
oTarget.save

'desktop.iniのテキストストリームオブジェクトを作成し内容を書き込む
sString = oDest.Path & "\desktop.ini"
Set oStream = oFSO.OpenTextFile(sString, 2, True)
oStream.WriteLine "[.ShellClassInfo]"
oStream.WriteLine "CLSID2={0AFACED1-E828-11D1-9187-B532F1E9575D}"
oStream.WriteLine "Flags=2"
oStream.Close

'属性を読み取り専用にする
Set oDesktop = oFSO.GetFile(sString)
oDesktop.Attributes = 2 + 4 'Hidden+System
oDest.Attributes = 1 'ReadOnly

Set oStream  = Nothing
Set oDesktop = Nothing
Set oTarget  = Nothing
Set oDest    = Nothing
Set oSoruce  = Nothing
Set oShell   = Nothing
Set oFSO     = Nothing
