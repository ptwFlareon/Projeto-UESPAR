object F_Principal: TF_Principal
  Left = 0
  Top = 0
  Align = alCustom
  Caption = 'Menu Principal'
  ClientHeight = 516
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 344
    Top = 280
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Edit1: TEdit
    Left = 184
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object MainMenu1: TMainMenu
    Left = 408
    Top = 256
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Estado1: TMenuItem
        Caption = 'Estado'
        OnClick = Estado1Click
      end
      object Cidade1: TMenuItem
        Caption = 'Cidade'
        OnClick = Cidade1Click
      end
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
    end
  end
end
