
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
��Init
̧�ٖ����Z������ǂݎ��
̧�ٖ�����܂��̓t�@�C�������݂��Ȃ��Ȃ��
  ̧�ق��Ȃ��̂ŊJ����?
  �������Ȃ�̧�ٖ��ق�ر
  �͂��Ȃ��
    ̧���޲�۸�Function�Ăяo����̧�ٖ��擾
    ̧�ٖ���̧�ٖ��قɏ�������
  ̧�ٖ����Z������ǂݎ��
  ̧�ٖ�����܂��̓t�@�C�������݂��Ȃ��Ȃ��
    �I��
  ���݂���Ȃ��
    ̧�ق���݂���
    
    ܰ��ޯ�OBJ���擾
  

-----------------------------






��̧���޲�۸�Function
̧���޲�۸�