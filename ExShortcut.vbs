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
    MsgBox sString & "  �̓t�H���_�ł͂���܂���"
    WScript.Quit
End If

'�\�[�X�t�H���_�I�u�W�F�N�g�쐬
Set oSoruce = oFSO.GetFolder(sString)

'�f�X�N�g�b�v�p�X���擾
sString = oShell.SpecialFolders("Desktop")

'���ʃ����N�p�̃t�H���_���쐬��,���̃t�H���_�I�u�W�F�N�g���擾
Set oDest = oFSO.CreateFolder(sString & "\Z_" & oSoruce.Name)

'target.lnk�̃I�u�G�N�g�擾
Set oTarget = oShell.CreateShortcut(oDest.Path & "\target.lnk")
oTarget.TargetPath = oSoruce.Path
oTarget.save

'desktop.ini�̃e�L�X�g�X�g���[���I�u�W�F�N�g���쐬�����e����������
sString = oDest.Path & "\desktop.ini"
Set oStream = oFSO.OpenTextFile(sString, 2, True)
oStream.WriteLine "[.ShellClassInfo]"
oStream.WriteLine "CLSID2={0AFACED1-E828-11D1-9187-B532F1E9575D}"
oStream.WriteLine "Flags=2"
oStream.Close

'������ǂݎ���p�ɂ���
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
