unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL, Data.DB,
  FireDAC.Comp.Client, Data.Win.ADODB, Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    ADOConnection1: TADOConnection;
    edtUser: TEdit;
    edtPassword: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    btnLogin: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  if (edtUser.Text = '') or (edtPassword.Text = '') then
    begin
      ShowMessage('O usuário e senha precisam ser preenchidos!');
    end;

  ADOQuery1.SQL.Text := 'select Password from Users where Username = :pUsername';
  ADOQuery1.Parameters.ParamByName('pUsername').Value := edtUser.Text;

  try
    ADOQuery1.Open;
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao consultrar o banco: ' + E.Message);
        Exit;
      end;
  end;

  if ADOQuery1.IsEmpty then
  begin
    ShowMessage('Usuário não cadastrado!');
    edtUser.SetFocus;
  end
  else
  begin
    if ADOQuery1.FieldByName('Password').AsString = edtPassword.Text then
    begin
      ShowMessage('Loggado com Sucesso!');
      frmPrincipal.Show;
      Self.Hide;
    end
    else
    begin
      ShowMessage('Senha incorreta!');
      edtPassword.Clear;
      edtPassword.SetFocus;
    end;
  end;


end;

end.
