
Function IsDataFileActive() As Boolean
On Error GoTo LB_ERR
  IsDataFileActive = False
  If wbDataFile Is Nothing Then Exit Function
  If wbDataFile.FullName <> "" Then:
  If Workbooks(wbDataFile.Name).FullName = wbDataFile.FullName Then
    IsDataFileActive = True
  End If
  Exit Function
LB_ERR:

End Function

-----------------------------
■Init
ﾌｧｲﾙ名をセルから読み取り
ﾌｧｲﾙ名が空またはファイルが存在しないならば
  ﾌｧｲﾙがないので開くか?
  いいえならﾌｧｲﾙ名ｾﾙをｸﾘｱ
  はいならば
    ﾌｧｲﾙﾀﾞｲｱﾛｸﾞFunction呼び出してﾌｧｲﾙ名取得
    ﾌｧｲﾙ名をﾌｧｲﾙ名ｾﾙに書き込み
  ﾌｧｲﾙ名をセルから読み取り
  ﾌｧｲﾙ名が空またはファイルが存在しないならば
    終了
  存在するならば
    ﾌｧｲﾙをｵｰﾌﾟﾝする
    
    ﾜｰｸﾌﾞｯｸOBJを取得
  

-----------------------------






■ﾌｧｲﾙﾀﾞｲｱﾛｸﾞFunction
ﾌｧｲﾙﾀﾞｲｱﾛｸﾞ