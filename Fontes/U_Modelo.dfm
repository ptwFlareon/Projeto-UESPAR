object F_Modelo: TF_Modelo
  Left = 0
  Top = 0
  Caption = 'Modelo'
  ClientHeight = 464
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 41
    Align = alTop
    TabOrder = 0
    object SBNovo: TSpeedButton
      Left = 8
      Top = 8
      Width = 23
      Height = 22
      Hint = 'Inserir Novo Registro'
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNovoClick
    end
    object SBSalvar: TSpeedButton
      Left = 37
      Top = 8
      Width = 23
      Height = 22
      Hint = 'Salvar Registro Atual'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBSalvarClick
    end
    object SBCancelar: TSpeedButton
      Left = 66
      Top = 8
      Width = 23
      Height = 22
      Hint = 'Cancelar Opera'#231#227'o'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBCancelarClick
    end
    object SBExcluir: TSpeedButton
      Left = 95
      Top = 8
      Width = 23
      Height = 22
      Hint = 'Excluir Registro Atual'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBExcluirClick
    end
    object SBEditar: TSpeedButton
      Left = 124
      Top = 8
      Width = 23
      Height = 22
      Hint = 'Editar Registro'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBEditarClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 445
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Alignment = taCenter
        Text = 'Projeto Uespar 1.0'
        Width = 50
      end>
    ExplicitLeft = 336
    ExplicitTop = 384
    ExplicitWidth = 0
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 41
    Width = 584
    Height = 404
    Align = alClient
    TabOrder = 2
    Tabs.Strings = (
      'Cadastro'
      'Consulta')
    TabIndex = 0
    ExplicitTop = 36
  end
end