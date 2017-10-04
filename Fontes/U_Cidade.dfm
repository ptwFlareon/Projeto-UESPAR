inherited F_Cidade: TF_Cidade
  Caption = 'Cadastro de Cidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      ExplicitLeft = 8
      ExplicitTop = 22
      object Label1: TLabel
        Left = 22
        Top = 30
        Width = 47
        Height = 13
        Caption = 'ID Cidade'
      end
      object Label2: TLabel
        Left = 22
        Top = 73
        Width = 78
        Height = 13
        Caption = 'Nome da Cidade'
      end
      object Label3: TLabel
        Left = 22
        Top = 116
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object label4: TLabel
        Left = 22
        Top = 156
        Width = 47
        Height = 13
        Caption = 'ID Estado'
      end
      object Edit1: TEdit
        Left = 22
        Top = 46
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 22
        Top = 89
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 22
        Top = 131
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 22
        Top = 171
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 3
      end
    end
    inherited TabSheet2: TTabSheet
      inherited GroupBox1: TGroupBox
        Caption = 'Filtro'
        object Label5: TLabel
          Left = 30
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
        object Edit5: TEdit
          Left = 30
          Top = 56
          Width = 507
          Height = 21
          TabOrder = 0
          OnChange = Edit5Change
        end
      end
      inherited GroupBox2: TGroupBox
        Caption = 'Resultado da Consulta'
        object DBGrid1: TDBGrid
          Left = 3
          Top = 20
          Width = 537
          Height = 193
          Align = alCustom
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
              FieldName = 'ID_CIDADE'
              Title.Caption = 'ID Cidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CIDADE'
              Title.Caption = 'Nome da Cidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ESTADO'
              Title.Caption = 'ID Estado'
              Visible = True
            end>
        end
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 183
    Top = 320
  end
  object FDQuery1: TFDQuery
    Connection = DM.FDConnection1
    SQL.Strings = (
      'select * from cidade where nome_cidade like :NomeCidade')
    Left = 351
    Top = 320
    ParamData = <
      item
        Name = 'NOMECIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
    object FDQuery1ID_CIDADE: TIntegerField
      FieldName = 'ID_CIDADE'
      Origin = 'ID_CIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1NOME_CIDADE: TStringField
      FieldName = 'NOME_CIDADE'
      Origin = 'NOME_CIDADE'
      Required = True
      Size = 50
    end
    object FDQuery1CEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Required = True
      Size = 10
    end
    object FDQuery1ID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
      Required = True
    end
  end
end
