program ContactsProject;

uses
  Vcl.Forms,
  ContactsForm in 'ContactsForm.pas' {Contacts},
  MainForm in 'MainForm.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TContacts, Contacts);
  Application.Run;
end.
