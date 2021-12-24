unit ContactsForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TContacts = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    inputPk: TEdit;
    inputName: TEdit;
    inputPhone: TEdit;
    inputEmail: TEdit;
    inputObservations: TMemo;
    FDConnection1: TFDConnection;
    FDContacts: TFDTable;
    DataSource1: TDataSource;
    btnNewContact: TButton;
    btnSaveContact: TButton;
    labelStatus: TLabel;
    btnNextContact: TButton;
    btnPreviousContact: TButton;
    btnEditContact: TButton;
    btnDeleteContact: TButton;
    btnCancel: TButton;
    inputSearch: TEdit;
    btnSearch: TButton;
    Label6: TLabel;
    inputContacts: TMemo;
    Contatos: TLabel;
    btnListContacts: TButton;
    procedure FormCreate(Sender: TObject);
    procedure loadContact();
    procedure enableOrDisableInputs();
    procedure clearInputs();
    procedure btnNextContactClick(Sender: TObject);
    procedure btnPreviousContactClick(Sender: TObject);
    procedure btnNewContactClick(Sender: TObject);
    procedure btnSaveContactClick(Sender: TObject);
    procedure FDContactsBeforePost(DataSet: TDataSet);
    procedure btnDeleteContactClick(Sender: TObject);
    procedure btnEditContactClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnListContactsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Contacts: TContacts;

implementation

{$R *.dfm}

procedure TContacts.enableOrDisableInputs;
begin
  inputName.Enabled := not inputName.Enabled;
  inputPhone.Enabled := not inputPhone.Enabled;
  inputEmail.Enabled := not inputEmail.Enabled;
  inputObservations.Enabled := not inputObservations.Enabled;
end;

procedure TContacts.clearInputs;
begin
  inputPk.Text := '';
  inputName.Text := '';
  inputPhone.Text := '';
  inputEmail.Text := '';
  inputObservations.Text := '';
  inputName.SetFocus;
end;

procedure TContacts.btnCancelClick(Sender: TObject);
begin
  clearInputs;
  if inputPk.Text = '' then
    fdcontacts.Prior;
  loadContact;
  enableOrDisableInputs;
end;

procedure TContacts.btnDeleteContactClick(Sender: TObject);
begin
  fdcontacts.Delete;
  loadContact;
end;

procedure TContacts.btnEditContactClick(Sender: TObject);
begin
  fdcontacts.Edit;
  enableOrDisableInputs;
end;

procedure TContacts.btnListContactsClick(Sender: TObject);
  var x: integer;
begin
  inputContacts.Text := '';
  x := 0;
  fdcontacts.First;
  while not fdcontacts.Eof do
  begin
    inputContacts.Lines.Add(fdcontacts.FieldByName('name').Value);
    fdcontacts.Next;
    x := x + 1;
  end;
  inputContacts.Lines.Add('Total de Registros: ' + inttostr(x));
end;

procedure TContacts.btnNewContactClick(Sender: TObject);
begin
  fdcontacts.Insert;
  enableOrDisableInputs;
  clearInputs;
end;

procedure TContacts.btnNextContactClick(Sender: TObject);
begin
  fdcontacts.Next;
  loadContact;
end;

procedure TContacts.btnPreviousContactClick(Sender: TObject);
begin
  fdcontacts.Prior;
  loadContact();
end;

procedure TContacts.btnSaveContactClick(Sender: TObject);
begin
  fdcontacts.Post;
  enableOrDisableInputs;
  showmessage('Contato cadastrado com sucesso');
  fdcontacts.Last;
  loadContact;
end;

procedure TContacts.btnSearchClick(Sender: TObject);
begin
  if not fdcontacts.FindKey([inputSearch.Text]) then
    showmessage('Contato não encontrado.')
  else
    loadContact;
end;

procedure TContacts.FDContactsBeforePost(DataSet: TDataSet);
begin
  fdcontacts.FieldByName('name').Value := inputName.Text;
  fdcontacts.FieldByName('phone').Value := inputPhone.Text;
  fdcontacts.FieldByName('mail').Value := inputEmail.Text;
  fdcontacts.FieldByName('observation').Value := inputObservations.Text;
end;

procedure TContacts.FormCreate(Sender: TObject);
begin
  fdconnection1.Params.Database := GetCurrentDir + '\contacts.mdb';
  fdconnection1.Connected := true;
  fdcontacts.TableName := 'contacts';
  fdcontacts.Active := true;

  if fdconnection1.Connected then
    begin
      labelStatus.Caption := 'Banco de Dados Conectado';
      loadContact();
    end
  else
    labelStatus.Caption := 'Falha ao Conectar com o Banco de Dados';
end;

procedure TContacts.loadContact;
begin
  if fdcontacts.FieldByName('pk').Value <> NULL then
    inputPk.Text := fdcontacts.FieldByName('pk').Value
  else
    inputPk.Text := '';

  if fdcontacts.FieldByName('name').Value <> NULL then
    inputName.Text := fdcontacts.FieldByName('name').Value
  else
    inputName.Text := '';

  if fdcontacts.FieldByName('phone').Value <> NULL then
    inputPhone.Text := fdcontacts.FieldByName('phone').Value
  else
    inputPhone.Text := '';

  if fdcontacts.FieldByName('mail').Value <> NULL then
    inputEmail.Text := fdcontacts.FieldByName('mail').Value
  else
    inputEmail.Text := '';

  if fdcontacts.FieldByName('observation').Value <> Null then
    inputObservations.Text := fdcontacts.FieldByName('observation').Value
  else
    inputObservations.Text := '';
end;

end.
