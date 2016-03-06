Function CheckAndReadInputData() As Boolean '数値入力部分のチェック
On Error GoTo LB_ERR
  Dim r As Integer
  Dim c As Integer
  Dim d As Variant
  CheckAndReadInputData = True
  For r = 1 To numData
    c = 3 '読み込みを開始する列の前の列番号を設定
    With data(r)
      .MsgError = ""
      .MsgWaring = ""
      c = c + 1: .複雑度 = rngInput.Cells(r, c)                     '複雑度
      c = c + 1: .エリア区分 = rngInput.Cells(r, c)                 'エリア区分
      c = c + 1
      c = c + 1
      c = c + 1: d = rngInput.Cells(r, c)                           '配管径_A
        If IsNumeric(d) Then
          .配管径_A = d
        Else
          .MsgError = .MsgError & "配管径" & vbCrLf
        End If
      c = c + 1
      c = c + 1: .溶接区分 = rngInput.Cells(r, c)                   '溶接区分
      c = c + 1 '---------------------------------------------------【材質】
      c = c + 1: .材質_配管 = rngInput.Cells(r, c)                  '材質_配管
      c = c + 1: .材質_フランジ = rngInput.Cells(r, c)              '材質_フランジ
      c = c + 1: .材質_弁一般 = rngInput.Cells(r, c)                '材質_弁一般
      c = c + 1: .材質_弁ダイヤフラム = rngInput.Cells(r, c)        '材質_弁ダイヤフラム
      c = c + 1 '---------------------------------------------------【管長】
      c = c + 1: d = rngInput.Cells(r, c)                           '配管長
        If IsNumeric(d) Then
          .配管長 = d
        Else
          .MsgError = .MsgError & "配管長" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '配管長_火気
        If IsNumeric(d) Then
          .配管長_火気 = d
        Else
          .MsgError = .MsgError & "配管長_火気" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '配管長_高所
        If IsNumeric(d) Then
          .配管長_高所 = d
        Else
          .MsgError = .MsgError & "配管長_高所" & vbCrLf
        End If
      c = c + 1 '---------------------------------------------------【フィッティング数量】
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_フランジ
        If IsNumeric(d) Then
          .数量_フランジ = d
        Else
          .MsgError = .MsgError & "数量_フランジ" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_エルボ
        If IsNumeric(d) Then
          .数量_エルボ = d
        Else
          .MsgError = .MsgError & "数量_エルボ" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_ティー
        If IsNumeric(d) Then
          .数量_ティー = d
        Else
          .MsgError = .MsgError & "数量_ティー" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_レデューサ
        If IsNumeric(d) Then
          .数量_レデューサ = d
        Else
          .MsgError = .MsgError & "数量_レデューサ" & vbCrLf
        End If
'      c = c + 1: d = rngInput.Cells(r, c)                           '数量_クロス
'        If IsNumeric(d) Then
'          .数量_クロス = d
'        Else
'          .MsgError = .MsgError & "数量_クロス" & vbCrLf
'        End If
      c = c + 1
      c = c + 1 '---------------------------------------------------【弁数量】
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_弁ゲート
        If IsNumeric(d) Then
          .数量_弁ゲート = d
        Else
          .MsgError = .MsgError & "数量_弁ゲート" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_弁グローブ
        If IsNumeric(d) Then
          .数量_弁グローブ = d
        Else
          .MsgError = .MsgError & "数量_弁グローブ" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_弁ボール
        If IsNumeric(d) Then
          .数量_弁ボール = d
        Else
          .MsgError = .MsgError & "数量_弁ボール" & vbCrLf
        End If
'      c = c + 1: d = rngInput.Cells(r, c)                           '数量_弁バタフライ
'        If IsNumeric(d) Then
'          .数量_弁バタフライ = d
'        Else
'          .MsgError = .MsgError & "数量_弁ボール" & vbCrLf
'        End If
'      c = c + 1: d = rngInput.Cells(r, c)                           '数量_弁プラグ
'        If IsNumeric(d) Then
'          .数量_弁プラグ = d
'        Else
'          .MsgError = .MsgError & "数量_弁プラグ" & vbCrLf
'        End If
      c = c + 1
      c = c + 1
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_弁ダイヤフラム
        If IsNumeric(d) Then
          .数量_弁ダイヤフラム = d
        Else
          .MsgError = .MsgError & "数量_弁ダイヤフラム" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_弁逆止
        If IsNumeric(d) Then
          .数量_弁逆止 = d
        Else
          .MsgError = .MsgError & "数量_弁逆止" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_その他
        If IsNumeric(d) Then
          .数量_その他 = d
        Else
          .MsgError = .MsgError & "数量_その他" & vbCrLf
        End If
      c = c + 1 '---------------------------------------------------【計装品数量】
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_計装弁
        If IsNumeric(d) Then
          .数量_計装弁 = d
        Else
          .MsgError = .MsgError & "数量_計装弁" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_流量計
        If IsNumeric(d) Then
          .数量_流量計 = d
        Else
          .MsgError = .MsgError & "数量_流量計" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '数量_計器
        If IsNumeric(d) Then
          .数量_計器 = d
        Else
          .MsgError = .MsgError & "数量_計器" & vbCrLf
        End If
      c = c + 1 '---------------------------------------------------【断熱】
      c = c + 1: .断熱_用途 = rngInput.Cells(r, c)                  '断熱_用途
      c = c + 1: d = rngInput.Cells(r, c)                           '断熱_温度
        If IsNumeric(d) Then
          .断熱_温度 = d
        Else
          .MsgError = .MsgError & "断熱_温度" & vbCrLf
        End If
      c = c + 1: .断熱_材 = rngInput.Cells(r, c)                    '断熱_材
      c = c + 1: d = rngInput.Cells(r, c)                           '断熱_厚さ
        If IsNumeric(d) Then
          .断熱_厚さ = d
        Else
          .MsgError = .MsgError & "断熱_厚さ" & vbCrLf
        End If
      c = c + 1 '---------------------------------------------------【塗装】
      c = c + 1: .塗装_ケレン = rngInput.Cells(r, c)                '塗装_ケレン
      c = c + 1: d = rngInput.Cells(r, c)                           '塗装_下回数
        If IsNumeric(d) Then
          .塗装_下回数 = d
        Else
          .MsgError = .MsgError & "塗装_下回数" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '塗装_上回数
        If IsNumeric(d) Then
          .塗装_上回数 = d
        Else
          .MsgError = .MsgError & "塗装_上回数" & vbCrLf
        End If
      If .MsgError <> "" Then
        .IsError = True
        CheckAndReadInputData = False
      End If
    End With
  Next r
  Exit Function
LB_ERR:
  CheckAndReadInputData = False
  Debug.Print ThisWorkbook.Name & "!" & "CheckAndReadInputData" & " : " & r
End Function
