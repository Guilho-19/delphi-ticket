program Project1;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmLogin},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDMConexao in 'uDMConexao.pas' {dmConexao: TDataModule},
  uCadastro in 'uCadastro.pas' {frmRegistro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmRegistro, frmRegistro);
  Application.Run;
end.
