object frmRegistro: TfrmRegistro
  Left = 0
  Top = 0
  Caption = 'Novo Usu'#225'rio'
  ClientHeight = 211
  ClientWidth = 408
  Color = clLightgray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 17
  object pnlCardCadastro: TPanel
    Left = -5
    Top = -16
    Width = 493
    Height = 480
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblNewUser: TLabel
      Left = 138
      Top = 27
      Width = 121
      Height = 28
      Alignment = taCenter
      Caption = 'Novo Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnSalvar: TButton
      Left = 146
      Top = 186
      Width = 75
      Height = 35
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object edtConfirmPassword: TEdit
      Left = 194
      Top = 139
      Width = 111
      Height = 25
      PasswordChar = '*'
      TabOrder = 1
      TextHint = 'Confirmar Senha'
    end
    object edtPassword: TEdit
      Left = 194
      Top = 108
      Width = 111
      Height = 25
      PasswordChar = '*'
      TabOrder = 2
      TextHint = 'Senha'
    end
    object edtUser: TEdit
      Left = 194
      Top = 77
      Width = 111
      Height = 25
      TabOrder = 3
      TextHint = 'Usu'#225'rio'
    end
    object StaticText2: TStaticText
      Left = 95
      Top = 81
      Width = 52
      Height = 21
      Caption = 'Usu'#225'rio:'
      TabOrder = 4
    end
    object StaticText3: TStaticText
      Left = 95
      Top = 112
      Width = 42
      Height = 21
      Caption = 'Senha:'
      TabOrder = 5
    end
    object StaticText1: TStaticText
      Left = 95
      Top = 143
      Width = 88
      Height = 21
      Caption = 'Repetir Senha:'
      TabOrder = 6
    end
  end
end
