object Main: TMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 8
  ClientWidth = 169
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
  object MainMenu1: TMainMenu
    Left = 144
    object MenuPrincipal1: TMenuItem
      Caption = 'Menu Principal'
      object Contatos1: TMenuItem
        Caption = 'Contatos'
        OnClick = Contatos1Click
      end
    end
    object MenuPrincipal2: TMenuItem
      Caption = 'Sair'
      OnClick = MenuPrincipal2Click
    end
  end
end
