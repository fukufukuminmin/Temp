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
      ret = ret And AddValve1(valves.Gat, .材質_弁一般, .配管径_A, .数量_弁ゲート)
      ret = ret And AddValve1(valves.Glb, .材質_弁一般, .配管径_A, .数量_弁グローブ)
      ret = ret And AddValve1(valves.Bal, .材質_弁一般, .配管径_A, .数量_弁ボール)
      'ret = ret And AddValve1(valves.Bat, .材質_弁バタフライ, .配管径_A, .数量_弁バタフライ)
      'ret = ret And AddValve1(valves.Plg, .材質_弁プラグ, .配管径_A, .数量_弁プラグ)
      ret = ret And AddValve1(valves.Dia, .材質_弁ダイヤフラム, .配管径_A, .数量_弁ダイヤフラム)
      ret = ret And AddValve1(valves.Chk, .材質_弁一般, .配管径_A, .数量_弁逆止)
      ret = ret And AddValve2(valves.Oth, .配管径_A, .数量_その他)
      ret = ret And AddValve2(valves.IVa, .配管径_A, .数量_弁計装)
      ret = ret And AddValve2(valves.Flo, .配管径_A, .数量_流量計)
      ret = ret And AddValve2(valves.Ins, .配管径_A, .数量_計器)
    End With
  Next i
End Sub
