unit UDMTercerosCuentas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  UComponentesBusquedaFiltrada, HYFIBQuery, FIBDataSetRO;

type
  TDMTercerosCuentas = class(TDataModule)
     TLocal: THYTransaction;
     SPCueTerUna: THYFIBQuery;
     SPCueTerTot: THYFIBQuery;
     SPBorraTot: THYFIBQuery;
     QBorraUna: THYFIBQuery;
     QMTercerosCuentas: TFIBTableSet;
     QMTercerosCuentasEMPRESA: TIntegerField;
     QMTercerosCuentasCANAL: TIntegerField;
     QMTercerosCuentasCUENTA: TFIBStringField;
     QMTercerosCuentasTITULO: TFIBStringField;
     QMTercerosCuentasTERCERO: TIntegerField;
     QMTercerosCuentasGESTION: TIntegerField;
     DSQMTercerosCuentas: TDataSource;
     xTerceros: TFIBDataSetRO;
     xTercerosTERCERO: TIntegerField;
     xTercerosNOMBRE_R_SOCIAL: TFIBStringField;
     xTercerosNIF: TFIBStringField;
     xTercerosDIR_COMPLETA: TFIBStringField;
     DSxTerceros: TDataSource;
     EFTerCuentas: TEntornoFind2000;
     SPAltaCuenta: THYFIBQuery;
     QGestCuentas: THYFIBQuery;
     xVerSaldos: TFIBDataSetRO;
     xVerSaldosEMPRESA: TIntegerField;
     xVerSaldosEJERCICIO: TIntegerField;
     xVerSaldosCANAL: TIntegerField;
     xVerSaldosCUENTA: TFIBStringField;
     xVerSaldosTITULO: TFIBStringField;
     xVerSaldosTERCERO: TIntegerField;
     xVerSaldosGESTION: TIntegerField;
     xVerSaldosPERIODO: TFIBStringField;
     xVerSaldosDEBE: TFloatField;
     xVerSaldosHABER: TFloatField;
     xVerSaldosSALDO: TFloatField;
     DSxVerSaldos: TDataSource;
     xPeriodos: TFIBDataSetRO;
     DSxPeriodos: TDataSource;
     TUpdate: THYTransaction;
     procedure DMTercerosCuentasCreate(Sender: TObject);
     procedure xTercerosAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure xPeriodosAfterOpen(DataSet: TDataSet);
  private
  public
     procedure RellenaCuentasTercerosUna;
     procedure RellenaCuentasTercerosTot;
     procedure BorraUna;
     procedure BorraTot;
     procedure PosicionaTercero(Tercero: integer);
     procedure InsertaCuenta(Cuenta: string);
     procedure BorraCuenta;
     procedure VerSaldos;
  end;

var
  DMTercerosCuentas : TDMTercerosCuentas;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMTercerosCuentas.DMTercerosCuentasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  EFTerCuentas.Empresa := REntorno.Empresa;
  EFTerCuentas.Ejercicio := REntorno.Ejercicio;
  EFTerCuentas.Canal := REntorno.Canal;
  EFTerCuentas.Pgc := REntorno.Pgc;
  xVerSaldosDEBE.DisplayFormat := MascaraN;
  xVerSaldosHABER.DisplayFormat := MascaraN;
  xVerSaldosSALDO.DisplayFormat := MascaraN;

  DMMain.FiltraRO(xPeriodos, '11000', True);
end;

procedure TDMTercerosCuentas.RellenaCuentasTercerosUna;
begin
  Screen.Cursor := crHourGlass;
  with SPCueTerUna do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     FreeHandle;
  end;
  Screen.Cursor := crDefault;
end;

procedure TDMTercerosCuentas.RellenaCuentasTercerosTot;
begin
  Screen.Cursor := crHourGlass;
  with SPCueTerTot do
  begin
     Close;
     ExecQuery;
     FreeHandle;
  end;
  Screen.Cursor := crDefault;
end;

procedure TDMTercerosCuentas.BorraUna;
begin
  Screen.Cursor := crHourGlass;
  with QBorraUna do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     FreeHandle;
  end;
  Screen.Cursor := crDefault;
end;

procedure TDMTercerosCuentas.BorraTot;
begin
  Screen.Cursor := crHourGlass;
  with SPBorraTot do
  begin
     Close;
     ExecQuery;
     FreeHandle;
  end;
  Screen.Cursor := crDefault;
end;

procedure TDMTercerosCuentas.PosicionaTercero(Tercero: integer);
begin
  with xTerceros do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;
end;

procedure TDMTercerosCuentas.xTercerosAfterOpen(DataSet: TDataSet);
begin
  with QMTercerosCuentas do
  begin
     Close;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Open;
  end;
  Self.VerSaldos;
end;

procedure TDMTercerosCuentas.InsertaCuenta(Cuenta: string);
var
  Gestion : smallint;
begin
  if (Application.MessageBox(PChar('Confirme la inserción de la cuenta ' + Cuenta),
     'Confirmación',
     mb_iconstop + mb_yesno) = id_yes) then
  begin
     with QGestCuentas do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := Cuenta;
        ExecQuery;
        Gestion := FieldByName['GESTION'].AsInteger;
        FreeHandle;
     end;
     with SPAltaCuenta do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := xTercerosTERCERO.AsInteger;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := Cuenta;
        Params.ByName['GESTION'].AsInteger := Gestion;
        ExecQuery;
        FreeHandle;
        QMTercerosCuentas.Close;
        QMTercerosCuentas.Open;
     end;
  end;
end;

procedure TDMTercerosCuentas.BorraCuenta;
begin
  QMTercerosCuentas.Delete;
end;

procedure TDMTercerosCuentas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMTercerosCuentas.VerSaldos;
begin
  with xVerSaldos do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := xTercerosTERCERO.AsInteger;
     Open;
  end;
end;

procedure TDMTercerosCuentas.xPeriodosAfterOpen(DataSet: TDataSet);
begin
  xVerSaldos.Open;
end;

end.
