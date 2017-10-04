inherited F_Estado: TF_Estado
  Caption = 'Cadastro de Estado'
  ClientWidth = 604
  ExplicitWidth = 620
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 604
    ExplicitWidth = 604
  end
  inherited StatusBar1: TStatusBar
    Width = 604
    ExplicitTop = 437
    ExplicitWidth = 604
  end
  inherited PageControl1: TPageControl
    Width = 604
    ExplicitWidth = 604
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 596
      object Label4: TLabel
        Left = 9
        Top = 21
        Width = 47
        Height = 13
        Caption = 'ID Estado'
      end
      object Label5: TLabel
        Left = 9
        Top = 62
        Width = 78
        Height = 13
        Caption = 'Nome do Estado'
      end
      object Label6: TLabel
        Left = 9
        Top = 103
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object Edit1: TEdit
        Left = 9
        Top = 36
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 9
        Top = 77
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 9
        Top = 118
        Width = 121
        Height = 21
        TabOrder = 2
      end
    end
    inherited TabSheet2: TTabSheet
      ExplicitWidth = 596
      inherited GroupBox1: TGroupBox
        Caption = 'Filtro'
        object Label1: TLabel
          Left = 19
          Top = 31
          Width = 67
          Height = 19
          Caption = 'Pesquisar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Edit4: TEdit
          Left = 19
          Top = 56
          Width = 534
          Height = 21
          TabOrder = 0
          OnChange = Edit4Change
        end
      end
      inherited GroupBox2: TGroupBox
        Caption = 'Resultado da Consulta'
        object DBGrid1: TDBGrid
          Left = 19
          Top = 32
          Width = 526
          Height = 185
          DataSource = DataSource1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ESTADO'
              Title.Caption = 'ID Estado'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_ESTADO'
              Title.Caption = 'Nome do Estado'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SIGLA_ESTADO'
              Title.Caption = 'Sigla do Estado'
              Visible = True
            end>
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 231
    Top = 316
  end
  object FDQuery1: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from estado where nome_estado like :NomeEstado')
    Left = 391
    Top = 316
    ParamData = <
      item
        Name = 'NOMEESTADO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
    object FDQuery1ID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1NOME_ESTADO: TStringField
      FieldName = 'NOME_ESTADO'
      Origin = 'NOME_ESTADO'
      Required = True
      Size = 50
    end
    object FDQuery1SIGLA_ESTADO: TStringField
      FieldName = 'SIGLA_ESTADO'
      Origin = 'SIGLA_ESTADO'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object FDQuery2: TFDQuery
    Left = 408
    Top = 336
  end
end
