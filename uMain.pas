unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    pnlLogin: TPanel;
    btnLogin: TButton;
    btnSignUp: TButton;
    edtPassword: TEdit;
    edtUser: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    pnlCadastro: TPanel;
    lblNewUser: TLabel;
    edtCadastroUser: TEdit;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    edtCadastroPassword: TEdit;
    edtCadastroConfirmPassword: TEdit;
    StaticText6: TStaticText;
    btnSalvar: TButton;
    btnCadastroCancelar: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure btnSignUpClick(Sender: TObject);
    procedure btnCadastroCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uPrincipal, uDMConexao, uCadastro;

procedure TfrmLogin.btnCadastroCancelarClick(Sender: TObject);
begin
  pnlCadastro.Visible := False;
  pnlLogin.Visible := True;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  if (edtUser.Text = '') or (edtPassword.Text = '') then
    begin
      ShowMessage('O usuário e senha precisam ser preenchidos!');
      Exit;
    end;

  dmConexao.qryLogin.SQL.Text := 'select Password from Users where Username = :pUsername';
  dmConexao.qryLogin.Parameters.ParamByName('pUsername').Value := edtUser.Text;

  try
    dmConexao.qryLogin.Open;
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao consultrar o banco: ' + E.Message);
        Exit;
      end;
  end;

  if dmConexao.qryLogin.IsEmpty then
  begin
    ShowMessage('Usuário não cadastrado!');
    edtUser.SetFocus;
  end
  else
  begin
    if dmConexao.qryLogin.FieldByName('Password').AsString = edtPassword.Text then
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

procedure TfrmLogin.btnSalvarClick(Sender: TObject);
begin
  if (Trim(edtCadastroUser.Text) = '') or (Trim(edtCadastroPassword.Text) = '') then
  begin
    ShowMessage('Por favor, preencha o usuário e a senha!');
    edtCadastroUser.SetFocus;
    Exit;
  end;

  if (edtCadastroPassword.Text <> edtCadastroConfirmPassword.Text) then
  begin
    ShowMessage('As senhas digitadas devem ser iguais');
    edtCadastroConfirmPassword.Clear;
    edtCadastroConfirmPassword.SetFocus;
    Exit;
  end;

  dmConexao.qryExec.Close;
  dmConexao.qryExec.SQL.Clear;
  dmConexao.qryExec.SQL.Add('insert into Users (username, password, role) values (:pUsername, :pPassword, ''NORMAL'')');

  dmConexao.qryExec.Parameters.ParamByName('pUsername').Value := Trim(edtCadastroUser.Text);
  dmConexao.qryExec.Parameters.ParamByName('pPassword').Value := Trim(edtCadastroPassword.Text);

  try
    dmConexao.qryExec.ExecSQL;

    ShowMessage('Usuário cadastrado com sucesso!');
    ModalResult := mrOk;

    pnlCadastro.Visible := False;
    pnlLogin.Visible := True;

    except
      on E: Exception do
      begin
        ShowMessage('Erro ao salvar no banco de dados: ' + E.Message);
      end;
  end;

end;

procedure TfrmLogin.btnSignUpClick(Sender: TObject);
begin
  //frmRegistro.ShowModal;

  pnlLogin.Visible := False;
  pnlCadastro.Visible := True;
end;






end.
