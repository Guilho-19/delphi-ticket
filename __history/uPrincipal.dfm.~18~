object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 462
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 851
    Height = 462
    Align = alClient
    TabOrder = 0
    Tabs.Strings = (
      'Vis'#227'o Geral'
      'Meus Chamados'
      'Configura'#231#245'es')
    TabIndex = 0
    OnChange = TabControl1Change
    object pnlDashboard: TPanel
      Left = 4
      Top = 26
      Width = 843
      Height = 432
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 294
      ExplicitTop = 168
      ExplicitWidth = 185
      ExplicitHeight = 41
    end
    object pnlListaChamados: TPanel
      Left = 4
      Top = 26
      Width = 843
      Height = 432
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      ExplicitLeft = 274
      ExplicitTop = 155
      ExplicitWidth = 185
      ExplicitHeight = 41
      object btnRefresh: TButton
        Left = 8
        Top = 13
        Width = 75
        Height = 25
        Caption = '&Atualizar'
        TabOrder = 0
        OnClick = btnRefreshClick
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 80
        Width = 843
        Height = 352
        Align = alBottom
        DataSource = dmConexao.DataSource1
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Responsavel'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Titulo'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Modulo'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'empresa'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Prioridade'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Data'
            Width = 90
            Visible = True
          end>
      end
      object edtPesquisaTicketsEmpresa: TEdit
        Left = 389
        Top = 48
        Width = 121
        Height = 23
        TabOrder = 2
        TextHint = 'Empresa'
        OnChange = edtPesquisaTicketsEmpresaChange
      end
      object edtPesquisaTicketsID: TEdit
        Left = 8
        Top = 48
        Width = 121
        Height = 23
        TabOrder = 3
        TextHint = 'ID'
        OnChange = edtPesquisaTicketsIDChange
      end
      object edtPesquisaTicketsModulo: TEdit
        Left = 516
        Top = 48
        Width = 121
        Height = 23
        TabOrder = 4
        TextHint = 'Modulo'
        OnChange = edtPesquisaTicketsModuloChange
      end
      object edtPesquisaTicketsResponsavel: TEdit
        Left = 135
        Top = 48
        Width = 121
        Height = 23
        TabOrder = 5
        TextHint = 'Respons'#225'vel'
        OnChange = edtPesquisaTicketsResponsavelChange
      end
      object edtPesquisaTicketsTitulo: TEdit
        Left = 262
        Top = 48
        Width = 121
        Height = 23
        TabOrder = 6
        TextHint = 'T'#237'tulo'
        OnChange = edtPesquisaTicketsTituloChange
      end
    end
  end
end
