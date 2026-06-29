unit UFVerBalances;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, ExtCtrls, Grids, DBGrids, UHYDBGrid,
  StdCtrls, Mask, DBCtrls, Buttons, UControlEdit, UFormGest, FIBDataSetRO,
  UNavigator, NsDBGrid, ULFEdit, ULFPanel, ULFLabel, ToolWin, ComCtrls,
  ULFToolBar, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UEditPanel, FIBDatabase, UFIBModificados;

type
  TFVerBalances = class(TFPEditSimple)
     DBGMain: THYTDBGrid;
     xVerBalance: TFIBDataSetRO;
     DSxVerBalance: TDataSource;
     xVerBalanceCLAVE: TFIBStringField;
     xVerBalanceTIPO: TFIBStringField;
     xVerBalanceGRUPO: TFIBStringField;
     xVerBalanceANTERIOR: TFloatField;
     xVerBalanceACTUAL: TFloatField;
     xVerBalanceDIFERENCIA: TFloatField;
     xVerBalancePORCENTUAL: TFloatField;
     PDesc: TLFPanel;
     LBalance: TLFLabel;
     LPeriodo: TLFLabel;
     EBal_cod: TLFEdit;
     EBal_Tit: TLFEdit;
     EPer_Cod: TLFEdit;
     EPer_Tit: TLFEdit;
     xVerBalanceACTIVO: TIntegerField;
     xVerBalanceEMPRESA: TIntegerField;
     xVerBalanceCANAL: TIntegerField;
     xVerBalanceEJERCICIO: TIntegerField;
     xVerBalancePERIODO: TFIBStringField;
     xVerBalanceBALANCE: TIntegerField;
     xVerBalanceORDEN: TIntegerField;
     xVerBalanceTITULO: TFIBStringField;
     TLocal: THYTransaction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGMainDblClick(Sender: TObject);
     procedure DBGMainKeyPress(Sender: TObject; var Key: char);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     Filtra: boolean;
     Balance: string;
     Periodo: string;
     Query_B: string;
     Query_N: string;
     Query_F: string;
     LocalMascaraN: string;
     // LocalMascaraL: string;
     MonedaBalance: string;
     procedure MuestraDetalleCuenta;
  public
     { Public declarations }
     procedure Muestra;
     procedure Carga(B_cod, P_cod, B_tit, P_tit, Moneda: string);
  end;

var
  FVerBalances : TFVerBalances;

implementation

uses UDMMain, UEntorno, UFVerBalancesCuentas, UFMain, UUtiles;

{$R *.DFM}

procedure TFVerBalances.FormCreate(Sender: TObject);
begin
  inherited;
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
  FMain.AddComponenteReturn(DBGMain);
  Query_B := 'SELECT * FROM VER_BALANCES_CONTENIDO ' +
     'WHERE ' +
     'EMPRESA=?EMPRESA AND ' +
     'CANAL=?CANAL AND ' +
     'EJERCICIO=?EJERCICIO AND ' +
     'PERIODO=?PERIODO AND ' +
     'BALANCE=?BALANCE ';
  Query_N := Query_B + 'ORDER BY CLAVE';
  Query_F := Query_B + 'AND ((ACTUAL <> 0) OR (ANTERIOR <> 0)) ORDER BY CLAVE';

  xVerBalancePORCENTUAL.DisplayFormat := MascaraP;
  DBGMain.DataSource := DSxVerBalance;
end;

procedure TFVerBalances.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponenteReturn(DBGMain);
  if (TLocal.InTransaction) then
     TLocal.Commit;
  Action := caFree;
end;

procedure TFVerBalances.Carga(B_cod, P_cod, B_tit, P_tit, Moneda: string);
begin
  Balance := B_cod;
  Periodo := P_cod;
  EBal_cod.Text := B_cod;
  EBal_Tit.Text := B_tit;
  EPer_Cod.Text := P_cod;
  EPer_Tit.Text := P_tit;

  MonedaBalance := Moneda;

  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  // LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);
  xVerBalanceANTERIOR.DisplayFormat := LocalMascaraN;
  xVerBalanceACTUAL.DisplayFormat := LocalMascaraN;
  xVerBalanceDIFERENCIA.DisplayFormat := LocalMascaraN;

  Muestra;
  Self.Show;
end;

procedure TFVerBalances.Muestra;
begin
  with xVerBalance do
  begin
     Close;
     if Filtra then
        SelectSQL.Text := Query_F
     else
        SelectSQL.Text := Query_N;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Balance'].AsInteger := StrToIntDef(Balance, 0);
     Params.ByName['Periodo'].AsString := Periodo;
     Open;
  end;
end;

procedure TFVerBalances.DBGMainDblClick(Sender: TObject);
begin
  MuestraDetalleCuenta;
end;

procedure TFVerBalances.DBGMainKeyPress(Sender: TObject; var Key: char);
var
  dummy : boolean;
begin
  dummy := True;
  if (Key = #13) then
     MuestraDetalleCuenta;
  if (Key = #27) then
     Close;
  if (Key = #10) then
     EPMainClickReport(Sender, dummy);
end;

procedure TFVerBalances.MuestraDetalleCuenta;
begin
  if (xVerBalanceTIPO.AsString = 'L') then
  begin
     if Assigned(FVerBalancesCuentas) then
        FreeAndNil(FVerBalancesCuentas);

     FVerBalancesCuentas := TFVerBalancesCuentas.Create(Self);
     FVerBalancesCuentas.Moneda := MonedaBalance;
     FVerBalancesCuentas.ShowModal;
     FreeAndNil(FVerBalancesCuentas);
  end;
end;

procedure TFVerBalances.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  Filtra := not Filtra;
  Muestra;
end;

end.
