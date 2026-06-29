unit UDMMultiBalances;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMMultiBalances = class(TDataModule)
     TLocal: THYTransaction;
     DSxMultiBalance: TDataSource;
     xMultiBalance: TFIBTableSet;
     SPRellenarSeleccion: THYFIBQuery;
     QMarcarTodos: THYFIBQuery;
     xMultiBalanceENTRADA: TIntegerField;
     xMultiBalanceEMPRESA: TIntegerField;
     xMultiBalanceEJERCICIO: TIntegerField;
     xMultiBalanceCANAL: TIntegerField;
     xMultiBalancePERIODO: TFIBStringField;
     xMultiBalanceBALANCE: TIntegerField;
     xMultiBalanceMARCADO: TIntegerField;
     xMultiBalanceTITULO_CANAL: TFIBStringField;
     procedure DMMultiBalancesCreate(Sender: TObject);
     procedure xMultiBalanceNewRecord(DataSet: TDataSet);
     procedure xMultiBalanceAfterPost(DataSet: TDataSet);
     procedure xMultiBalanceMARCADOChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MarcarTodos(Marca: smallint);
     procedure RellenarSeleccion(Balance: integer; Periodo: string);
  end;

var
  DMMultiBalances : TDMMultiBalances;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMMultiBalances.DMMultiBalancesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMMultiBalances.RellenarSeleccion(Balance: integer; Periodo: string);
begin
  with SPRellenarSeleccion do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['BALANCE'].AsInteger := Balance;
     Params.ByName['PERIODO'].AsString := Periodo;
     ExecQuery;
     FreeHandle;
  end;

  with xMultiBalance do
  begin
     Close;
     DMMain.FiltraTabla(xMultiBalance, '11000', False);
     Params.ByName['BALANCE'].AsInteger := Balance;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['PERIODO'].AsString := Periodo;
     Open;
  end;
end;

procedure TDMMultiBalances.MarcarTodos(Marca: smallint);
begin
  with QMarcarTodos do
  begin
     Close;
     Params.ByName['MARCA'].AsInteger := Marca;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;

  with xMultiBalance do
  begin
     Close;
     Open;
  end;
end;

procedure TDMMultiBalances.xMultiBalanceNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMMultiBalances.xMultiBalanceAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMMultiBalances.xMultiBalanceMARCADOChange(Sender: TField);
begin
  if (xMultiBalance.State = dsInsert) or (xMultiBalance.State = dsEdit) then
     xMultiBalance.Post;
end;

end.
