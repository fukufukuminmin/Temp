Function CheckAndReadInputData() As Boolean '���l���͕����̃`�F�b�N
On Error GoTo LB_ERR
  Dim r As Integer
  Dim c As Integer
  Dim d As Variant
  CheckAndReadInputData = True
  For r = 1 To numData
    c = 3 '�ǂݍ��݂��J�n�����̑O�̗�ԍ���ݒ�
    With data(r)
      .MsgError = ""
      .MsgWaring = ""
      c = c + 1: .���G�x = rngInput.Cells(r, c)                     '���G�x
      c = c + 1: .�G���A�敪 = rngInput.Cells(r, c)                 '�G���A�敪
      c = c + 1
      c = c + 1
      c = c + 1: d = rngInput.Cells(r, c)                           '�z�ǌa_A
        If IsNumeric(d) Then
          .�z�ǌa_A = d
        Else
          .MsgError = .MsgError & "�z�ǌa" & vbCrLf
        End If
      c = c + 1
      c = c + 1: .�n�ڋ敪 = rngInput.Cells(r, c)                   '�n�ڋ敪
      c = c + 1 '---------------------------------------------------�y�ގ��z
      c = c + 1: .�ގ�_�z�� = rngInput.Cells(r, c)                  '�ގ�_�z��
      c = c + 1: .�ގ�_�t�����W = rngInput.Cells(r, c)              '�ގ�_�t�����W
      c = c + 1: .�ގ�_�و�� = rngInput.Cells(r, c)                '�ގ�_�و��
      c = c + 1: .�ގ�_�ك_�C���t���� = rngInput.Cells(r, c)        '�ގ�_�ك_�C���t����
      c = c + 1 '---------------------------------------------------�y�ǒ��z
      c = c + 1: d = rngInput.Cells(r, c)                           '�z�ǒ�
        If IsNumeric(d) Then
          .�z�ǒ� = d
        Else
          .MsgError = .MsgError & "�z�ǒ�" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '�z�ǒ�_�΋C
        If IsNumeric(d) Then
          .�z�ǒ�_�΋C = d
        Else
          .MsgError = .MsgError & "�z�ǒ�_�΋C" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '�z�ǒ�_����
        If IsNumeric(d) Then
          .�z�ǒ�_���� = d
        Else
          .MsgError = .MsgError & "�z�ǒ�_����" & vbCrLf
        End If
      c = c + 1 '---------------------------------------------------�y�t�B�b�e�B���O���ʁz
      c = c + 1: d = rngInput.Cells(r, c)                           '����_�t�����W
        If IsNumeric(d) Then
          .����_�t�����W = d
        Else
          .MsgError = .MsgError & "����_�t�����W" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '����_�G���{
        If IsNumeric(d) Then
          .����_�G���{ = d
        Else
          .MsgError = .MsgError & "����_�G���{" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '����_�e�B�[
        If IsNumeric(d) Then
          .����_�e�B�[ = d
        Else
          .MsgError = .MsgError & "����_�e�B�[" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '����_���f���[�T
        If IsNumeric(d) Then
          .����_���f���[�T = d
        Else
          .MsgError = .MsgError & "����_���f���[�T" & vbCrLf
        End If
'      c = c + 1: d = rngInput.Cells(r, c)                           '����_�N���X
'        If IsNumeric(d) Then
'          .����_�N���X = d
'        Else
'          .MsgError = .MsgError & "����_�N���X" & vbCrLf
'        End If
      c = c + 1
      c = c + 1 '---------------------------------------------------�y�ِ��ʁz
      c = c + 1: d = rngInput.Cells(r, c)                           '����_�كQ�[�g
        If IsNumeric(d) Then
          .����_�كQ�[�g = d
        Else
          .MsgError = .MsgError & "����_�كQ�[�g" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '����_�كO���[�u
        If IsNumeric(d) Then
          .����_�كO���[�u = d
        Else
          .MsgError = .MsgError & "����_�كO���[�u" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '����_�ك{�[��
        If IsNumeric(d) Then
          .����_�ك{�[�� = d
        Else
          .MsgError = .MsgError & "����_�ك{�[��" & vbCrLf
        End If
'      c = c + 1: d = rngInput.Cells(r, c)                           '����_�كo�^�t���C
'        If IsNumeric(d) Then
'          .����_�كo�^�t���C = d
'        Else
'          .MsgError = .MsgError & "����_�ك{�[��" & vbCrLf
'        End If
'      c = c + 1: d = rngInput.Cells(r, c)                           '����_�كv���O
'        If IsNumeric(d) Then
'          .����_�كv���O = d
'        Else
'          .MsgError = .MsgError & "����_�كv���O" & vbCrLf
'        End If
      c = c + 1
      c = c + 1
      c = c + 1: d = rngInput.Cells(r, c)                           '����_�ك_�C���t����
        If IsNumeric(d) Then
          .����_�ك_�C���t���� = d
        Else
          .MsgError = .MsgError & "����_�ك_�C���t����" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '����_�ًt�~
        If IsNumeric(d) Then
          .����_�ًt�~ = d
        Else
          .MsgError = .MsgError & "����_�ًt�~" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '����_���̑�
        If IsNumeric(d) Then
          .����_���̑� = d
        Else
          .MsgError = .MsgError & "����_���̑�" & vbCrLf
        End If
      c = c + 1 '---------------------------------------------------�y�v���i���ʁz
      c = c + 1: d = rngInput.Cells(r, c)                           '����_�v����
        If IsNumeric(d) Then
          .����_�v���� = d
        Else
          .MsgError = .MsgError & "����_�v����" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '����_���ʌv
        If IsNumeric(d) Then
          .����_���ʌv = d
        Else
          .MsgError = .MsgError & "����_���ʌv" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '����_�v��
        If IsNumeric(d) Then
          .����_�v�� = d
        Else
          .MsgError = .MsgError & "����_�v��" & vbCrLf
        End If
      c = c + 1 '---------------------------------------------------�y�f�M�z
      c = c + 1: .�f�M_�p�r = rngInput.Cells(r, c)                  '�f�M_�p�r
      c = c + 1: d = rngInput.Cells(r, c)                           '�f�M_���x
        If IsNumeric(d) Then
          .�f�M_���x = d
        Else
          .MsgError = .MsgError & "�f�M_���x" & vbCrLf
        End If
      c = c + 1: .�f�M_�� = rngInput.Cells(r, c)                    '�f�M_��
      c = c + 1: d = rngInput.Cells(r, c)                           '�f�M_����
        If IsNumeric(d) Then
          .�f�M_���� = d
        Else
          .MsgError = .MsgError & "�f�M_����" & vbCrLf
        End If
      c = c + 1 '---------------------------------------------------�y�h���z
      c = c + 1: .�h��_�P���� = rngInput.Cells(r, c)                '�h��_�P����
      c = c + 1: d = rngInput.Cells(r, c)                           '�h��_����
        If IsNumeric(d) Then
          .�h��_���� = d
        Else
          .MsgError = .MsgError & "�h��_����" & vbCrLf
        End If
      c = c + 1: d = rngInput.Cells(r, c)                           '�h��_���
        If IsNumeric(d) Then
          .�h��_��� = d
        Else
          .MsgError = .MsgError & "�h��_���" & vbCrLf
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
