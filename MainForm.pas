unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ContactsForm;

type
  TMain = class(TForm)
    MainMenu1: TMainMenu;
    MenuPrincipal1: TMenuItem;
    MenuPrincipal2: TMenuItem;
    Contatos1: TMenuItem;
    procedure MenuPrincipal2Click(Sender: TObject);
    procedure Contatos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.Contatos1Click(Sender: TObject);
begin
  Contacts.show;
end;

procedure TMain.MenuPrincipal2Click(Sender: TObject);
begin
  Main.Close;
end;

end.
