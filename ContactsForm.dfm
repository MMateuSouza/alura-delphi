object Contacts: TContacts
  Left = 0
  Top = 0
  ClientHeight = 421
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 12
    Height = 13
    Caption = 'PK'
  end
  object Label2: TLabel
    Left = 8
    Top = 64
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 8
    Top = 120
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label4: TLabel
    Left = 8
    Top = 176
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object Label5: TLabel
    Left = 8
    Top = 232
    Width = 63
    Height = 13
    Caption = 'Observa'#231#245'es'
  end
  object labelStatus: TLabel
    Left = 200
    Top = 8
    Width = 3
    Height = 13
  end
  object Label6: TLabel
    Left = 275
    Top = 64
    Width = 108
    Height = 13
    Caption = 'Buscar Contato por PK'
  end
  object Contatos: TLabel
    Left = 275
    Top = 120
    Width = 108
    Height = 13
    Caption = 'Contatos Cadastrados'
  end
  object inputPk: TEdit
    Left = 8
    Top = 27
    Width = 75
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object inputName: TEdit
    Left = 8
    Top = 83
    Width = 185
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object inputPhone: TEdit
    Left = 8
    Top = 139
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object inputEmail: TEdit
    Left = 8
    Top = 195
    Width = 185
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object inputObservations: TMemo
    Left = 8
    Top = 251
    Width = 185
    Height = 89
    Enabled = False
    TabOrder = 4
  end
  object btnNewContact: TButton
    Left = 40
    Top = 355
    Width = 57
    Height = 25
    Caption = 'Novo'
    TabOrder = 5
    OnClick = btnNewContactClick
  end
  object btnSaveContact: TButton
    Left = 103
    Top = 355
    Width = 57
    Height = 25
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = btnSaveContactClick
  end
  object btnNextContact: TButton
    Left = 166
    Top = 371
    Width = 25
    Height = 25
    Caption = '>'
    TabOrder = 7
    OnClick = btnNextContactClick
  end
  object btnPreviousContact: TButton
    Left = 8
    Top = 371
    Width = 25
    Height = 25
    Caption = '<'
    TabOrder = 8
    OnClick = btnPreviousContactClick
  end
  object btnEditContact: TButton
    Left = 39
    Top = 386
    Width = 57
    Height = 25
    Caption = 'Editar'
    TabOrder = 9
    OnClick = btnEditContactClick
  end
  object btnDeleteContact: TButton
    Left = 103
    Top = 386
    Width = 57
    Height = 25
    Caption = 'Excluir'
    TabOrder = 10
    OnClick = btnDeleteContactClick
  end
  object btnCancel: TButton
    Left = 197
    Top = 371
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 11
    OnClick = btnCancelClick
  end
  object inputSearch: TEdit
    Left = 275
    Top = 83
    Width = 183
    Height = 21
    TabOrder = 12
  end
  object btnSearch: TButton
    Left = 464
    Top = 81
    Width = 89
    Height = 25
    Caption = 'Buscar'
    TabOrder = 13
    OnClick = btnSearchClick
  end
  object inputContacts: TMemo
    Left = 275
    Top = 139
    Width = 278
    Height = 201
    TabOrder = 14
  end
  object btnListContacts: TButton
    Left = 464
    Top = 112
    Width = 89
    Height = 25
    Caption = 'Listar Contatos'
    TabOrder = 15
    OnClick = btnListContactsClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Mateus\Documents\Embarcadero\Studio\Projects\W' +
        'in32\Debug\contacts.mdb'
      'DriverID=MSAcc')
    Left = 608
  end
  object FDContacts: TFDTable
    BeforePost = FDContactsBeforePost
    Connection = FDConnection1
    Left = 608
    Top = 48
  end
  object DataSource1: TDataSource
    Left = 608
    Top = 96
  end
end
