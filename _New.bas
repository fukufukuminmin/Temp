Type TypeValves
  Gat As Dictionary
  Glb As Dictionary
  Bal As Dictionary
  'Bat As Dictionary
  'Plg As Dictionary
  Dia As Dictionary
  Chk As Dictionary
  Oth As Dictionary
  IVa As Dictionary
  Flo As Dictionary
  Ins As Dictionary
End Type

Global valves As TypeValves

Function ResetValve(dicValve As Dictionary) As Dictionary
On Error GoTo LB_ERR
  If dicValve Is Nothing Then
    Set ResetValve = New Dictionary
    Exit Function
  End If
  dicValve.RemoveAll
  Set ResetValve = dicValve
  Exit Function
LB_ERR:
  Set ResetValve = Nothing
  Debug.Print ThisWorkbook.Name & "!" & "ResetVavle"
End Function

Function AddValve1(KValve As Dictionary, Matl As String, Size As Integer, Count As Integer) As Boolean
On Error GoTo LB_ERR
  Dim dicTemp As Dictionary
  If Not KValve.Exists(Matl) Then
    KValve(Matl) = New Dictionary
  End If
  Set dicTemp = KValve(Matl)
  If Not dicTemp.Exists(Size) Then
    dicTemp(Size) = 0
  End If
  dicTemp(Size) = dicTemp(Size) + Count
  Set dicTemp = Nothing
  AddValve1 = False
  Exit Function
LB_ERR:
  AddValve1 = False
  Debug.Print ThisWorkbook.Name & "!" & "AddValve1"
End Function

Function AddValve2(KValve As Dictionary, Size As Integer, Count As Integer) As Boolean
On Error GoTo LB_ERR
  If Not KValve.Exists(Size) Then
    KValve(Size) = 0
  End If
  KValve(Size) = KValve(Size) + Count
  AddValve2 = False
  Exit Function
LB_ERR:
  AddValve2 = False
  Debug.Print ThisWorkbook.Name & "!" & "AddValve2"
End Function

Sub CalcValve()
  Dim i As Integer
  Dim ret As Boolean
  Set valves.Gat = ResetValve(valves.Gat)
  Set valves.Glb = ResetValve(valves.Glb)
  Set valves.Bal = ResetValve(valves.Bal)
  'Set valves.Bat = ResetValve(valves.Bat)
  'Set valves.Plg = ResetValve(valves.Plg)
  Set valves.Dia = ResetValve(valves.Dia)
  Set valves.Chk = ResetValve(valves.Chk)
  Set valves.Oth = ResetValve(valves.Oth)
  Set valves.IVa = ResetValve(valves.IVa)
  Set valves.Flo = ResetValve(valves.Flo)
  Set valves.Ins = ResetValve(valves.Ins)
  ret = True
  For i = 1 To numEData
    With edata(i)
      ret = ret And AddValve1(valves.Gat, .�ގ�_�و��, .�z�ǌa_A, .����_�كQ�[�g)
      ret = ret And AddValve1(valves.Glb, .�ގ�_�و��, .�z�ǌa_A, .����_�كO���[�u)
      ret = ret And AddValve1(valves.Bal, .�ގ�_�و��, .�z�ǌa_A, .����_�ك{�[��)
      'ret = ret And AddValve1(valves.Bat, .�ގ�_�كo�^�t���C, .�z�ǌa_A, .����_�كo�^�t���C)
      'ret = ret And AddValve1(valves.Plg, .�ގ�_�كv���O, .�z�ǌa_A, .����_�كv���O)
      ret = ret And AddValve1(valves.Dia, .�ގ�_�ك_�C���t����, .�z�ǌa_A, .����_�ك_�C���t����)
      ret = ret And AddValve1(valves.Chk, .�ގ�_�و��, .�z�ǌa_A, .����_�ًt�~)
      ret = ret And AddValve2(valves.Oth, .�z�ǌa_A, .����_���̑�)
      ret = ret And AddValve2(valves.IVa, .�z�ǌa_A, .����_�ٌv��)
      ret = ret And AddValve2(valves.Flo, .�z�ǌa_A, .����_���ʌv)
      ret = ret And AddValve2(valves.Ins, .�z�ǌa_A, .����_�v��)
    End With
  Next i
End Sub
