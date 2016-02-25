# www.gstarcad.net

'-------------------------------
'Workbook
'-------------------------------
Option Explicit

Private Sub Workbook_BeforeClose(Cancel As Boolean)
  'Nothing Now
End Sub

Private Sub Workbook_Open()
  Dim filepath As String
  filepath = ThisWorkbook.Path & "\~~~.vbs"
  Application.Wait [Now()+"00:00:01"]
  If Dir(filepath) <> "" Then
    Kill filepath
  End If
End Sub



'-------------------------------
'Module
'-------------------------------
Option Explicit

Private Sub Auto_Close()
  'Nothing Now
End Sub

Sub Auto_Open()
  CreateVbsFile
  With CreateObject("Wscript.Shell")
    .Run ThisWorkbook.Path & "\~~~.vbs"
  End With
  If Workbooks.Count = 1 Then
    Application.DisplayAlerts = False
    Application.Quit
  Else
    ThisWorkbook.Close False
  End If
End Sub

Sub Init()
  MsgBox "Init Called"
End Sub

Sub CreateVbsFile()
  Dim strScript As String
  Dim filenumber As Integer
  filenumber = FreeFile
  strScript = _
    "Dim xlsApp" & vbCrLf & _
    "Dim filepath" & vbCrLf & _
    "filepath = """ & ThisWorkbook.FullName & """" & vbCrLf & _
    "Set xlsApp = WScript.CreateObject(""Excel.Application"")" & vbCrLf & _
    "xlsApp.Visible = True" & vbCrLf & _
    "On Error Resume Next" & vbCrLf & _
    "xlsApp.Workbooks.Open filepath" & vbCrLf & _
    "Set wbWork = xlsApp.Workbooks.Open(filepath)" & vbCrLf & _
    "xlsApp.Run ""Init""" & vbCrLf & _
    "Set xlsApp = Nothing" & vbCrLf & _
    "WScript.Quit"
  Open ThisWorkbook.Path & "\~~~.vbs" For Output As #filenumber
  Print #filenumber, strScript
  Close #filenumber
End Sub
