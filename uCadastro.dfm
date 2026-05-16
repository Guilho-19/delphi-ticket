object frmRegistro: TfrmRegistro
  Left = 0
  Top = 0
  Caption = 'Novo Usu'#225'rio'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object edtUser: TEdit
    Left = 64
    Top = 72
    Width = 121
    Height = 23
    TabOrder = 0
    TextHint = 'Usu'#225'rio'
  end
  object edtPassword: TEdit
    Left = 64
    Top = 101
    Width = 121
    Height = 23
    PasswordChar = '*'
    TabOrder = 1
    TextHint = 'Senha'
  end
  object edtConfirmPassword: TEdit
    Left = 64
    Top = 130
    Width = 121
    Height = 23
    PasswordChar = '*'
    TabOrder = 2
    TextHint = 'Confirmar Senha'
  end
  object btnSalvar: TButton
    Left = 88
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
  end
end
