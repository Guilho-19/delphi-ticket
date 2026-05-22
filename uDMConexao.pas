unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmConexao = class(TDataModule)
    DataSource1: TDataSource;
    qryTickets: TADOQuery;
    ADOConnection2: TADOConnection;
    ADOConnection1: TADOConnection;
    qryLogin: TADOQuery;
    qryExec: TADOQuery;
    qryDashboard: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
