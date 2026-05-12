unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMain, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    ADOQuery2: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    btnRefresh: TButton;
    procedure btnRefreshClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnRefreshClick(Sender: TObject);
begin
  ADOQuery2.SQL.Text := 'select id, responsible as Responsavel, title as Titulo, type as Modulo, requester as empresa, priority as Prioridade, columnId as Status, createdAt as Data from Tickets order by Data desc';
  ADOQuery2.Open;
end;

procedure TfrmPrincipal.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  begin
    if not (gdSelected in State) then
      if (DBGrid1.DataSource.DataSet.RecNo mod 2 = 0) then
        DBGrid1.Canvas.Brush.Color := clWhite
      else
        DBGrid1.Canvas.Brush.Color := $00F5F5F5;
  end;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;



end.
