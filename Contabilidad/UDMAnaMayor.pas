unit UDMAnaMayor;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, StdCtrls, FIBQuery, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FIBTableDataSetRO, HYFIBQuery,
  FIBDataSetRW, DateUtils;

type
  TDMAnaMayor = class(TDataModule)
     xMayor: TFIBTableSetRO;
     xCentrosCoste: TFIBTableSetRO;
     DSxCentrosCoste: TDataSource;
     DSxMayor: TDataSource;
     xSaldos: TFIBDataSetRO;
     DSxSaldos: TDataSource;
     TLocal: THYTransaction;
     xmayor_cc_periodo: TFIBDataSetRO;
     DSxmayor_cc_periodo: TDataSource;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xCanales: TFIBDataSetRO;
     QTipoAsiento: THYFIBQuery;
     xCentrosCosteEMPRESA: TIntegerField;
     xCentrosCosteEJERCICIO: TIntegerField;
     xCentrosCosteCANAL: TIntegerField;
     xCentrosCostePLAN_CONTABLE: TFIBStringField;
     xCentrosCosteCENTRO_COSTE: TFIBStringField;
     xCentrosCosteTITULO: TFIBStringField;
     xCentrosCosteNIVEL: TIntegerField;
     xCentrosCosteDISTRIBUCION_POSTERIOR: TIntegerField;
     xCentrosCosteCENTRO_COSTE_PADRE: TFIBStringField;
     xCentrosCosteID_P: TIntegerField;
     xCentrosCosteID_CC: TIntegerField;
     xCentrosCosteID_CC_PADRE: TIntegerField;
     xMayorRIC: TIntegerField;
     xMayorLINEA: TIntegerField;
     xMayorFECHA: TDateTimeField;
     xMayorTEXTO: TFIBStringField;
     xMayorDEBE: TFloatField;
     xMayorHABER: TFloatField;
     xMayorSALDO: TFloatField;
     xMayorD_NUMERO: TIntegerField;
     xMayorD_SERIE: TFIBStringField;
     xMayorD_FECHA: TDateTimeField;
     xMayorASIENTO: TIntegerField;
     xMayorCANAL: TIntegerField;
     xMayorTIPO: TFIBStringField;
     xMayorCENTRO_COSTE: TFIBStringField;
     xMayorTITULO_CC: TFIBStringField;
     xMayorCUENTA: TFIBStringField;
     xMayorTITULO_CUENTA: TFIBStringField;
     xMayorIMPORTE: TFloatField;
     xmayor_cc_periodoPERIODO: TFIBStringField;
     xmayor_cc_periodoTIT_PER: TFIBStringField;
     xmayor_cc_periodoDEBE: TFloatField;
     xmayor_cc_periodoHABER: TFloatField;
     xmayor_cc_periodoSALDO: TFloatField;
     xSaldosDEBE: TFloatField;
     xSaldosHABER: TFloatField;
     xSaldosSALDO: TFloatField;
     xSaldosDEBE_A: TFloatField;
     xSaldosHABER_A: TFloatField;
     xSaldosSALDO_A: TFloatField;
     xSaldosSALDO_RNG: TFloatField;
     TUpdate: THYTransaction;
     procedure DMAnaMayorCreate(Sender: TObject);
     procedure xCentrosCosteAfterOpen(DataSet: TDataSet);
  private
  public
     Desde: TDateTime;
     Hasta: TDateTime;
     Moneda: string;
     LocalMascaraN: string;
     Alcance: integer;
     Canal: integer;
     PlanContable: string;
     procedure Filtra;
     procedure Refresca;
     function DameRicStr: string;
     function DameRic: integer;
     function DameTipoAsiento: string;
     procedure LanzaListado;
     procedure ListadoMayor(nCanal: integer; CCDesde, CCHasta: string; nFechaD, nFechaH: TDateTime; nMoneda: string; nAlcance, Modo: integer; PlanContable: string);
     procedure ListadoMayorOrdCC(nCanal: integer; CCDesde, CCHasta: string; nFechaD, nFechaH: TDateTime; nMoneda: string; nAlcance, Modo: integer; PlanContable: string);
     procedure BusquedaCompleja;
     procedure CambiaMascara(Moneda: string);
     procedure CalculaFechas;
     procedure CambiaTituloMoneda(monedatemp: string; modo: boolean);
     // function RellenaCanales: TStringList;
     procedure FiltraPeriodo;
     function HayDatos: boolean;
     function DameCanal: smallint;
     procedure FiltradoInicial;
     procedure FiltraCC(CentroCoste: string);
     procedure RellenaPlanesContables(Lista: TStrings);
     function DameLinea: integer;
     procedure BorraImputacion;
  end;

var
  DMAnaMayor : TDMAnaMayor;

const
  LargoCentroCoste = 10;

implementation

uses UDMMain, UUtiles, UEntorno, uFBuscaRO, UDMRAnaMayor, UFormGest;

{$R *.DFM}

procedure TDMAnaMayor.LanzaListado;
begin
  AbreData(TDMRAnaMayor, DMRAnaMayor);
  DMRAnaMayor.MostrarListado(Canal, xCentrosCosteCENTRO_COSTE.AsString,
     xCentrosCosteCENTRO_COSTE.AsString, Desde, Hasta, Moneda, Alcance,
     xSaldosDEBE_A.AsFloat, xSaldosHABER_A.AsFloat, True, 0, PlanContable);
  CierraData(DMRAnaMayor);
end;

procedure TDMAnaMayor.ListadoMayor(nCanal: integer; CCDesde, CCHasta: string; nFechaD, nFechaH: TDateTime; nMoneda: string; nAlcance, Modo: integer; PlanContable: string);
begin
  DMRAnaMayor.MostrarListado(nCanal, CCDesde, CCHasta, nFechaD, nFechaH,
     nMoneda, nAlcance, xSaldosDEBE_A.AsFloat, xSaldosHABER_A.AsFloat, False,
     Modo, PlanContable);
end;

procedure TDMAnaMayor.ListadoMayorOrdCC(nCanal: integer; CCDesde, CCHasta: string; nFechaD, nFechaH: TDateTime; nMoneda: string; nAlcance, Modo: integer; PlanContable: string);
begin
  DMRAnaMayor.MostrarListadoOrdCC(nCanal, CCDesde, CCHasta, nFechaD, nFechaH,
     nMoneda, nAlcance, xSaldosDEBE_A.AsFloat, xSaldosHABER_A.AsFloat, False,
     Modo, PlanContable);
end;

procedure TDMAnaMayor.DMAnaMayorCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMAnaMayor.Filtra;
begin
  if not (xCentrosCoste.Active) then
     xCentrosCoste.Open;
  with xMayor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := PlanContable;
     Params.ByName['CENTRO_COSTE'].AsString := xCentrosCosteCENTRO_COSTE.AsString;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Params.ByName['ID_CC'].AsInteger := xCentrosCosteID_CC.AsInteger;
     Open;
  end;

  with xSaldos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['PLAN_CONTABLE'].AsString := PlanContable;
     Params.ByName['CENTRO_COSTE'].AsString := xCentrosCosteCENTRO_COSTE.AsString;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['ALCANCE'].AsInteger := Alcance;
     Params.ByName['ID_CC'].AsInteger := xCentrosCosteID_CC.AsInteger;
     Open;
  end;
end;

procedure TDMAnaMayor.Refresca;
var
  marca1, marca2, marca3 : TBookmark;
begin
  Marca1 := xCentrosCoste.GetBookmark;
  Marca2 := xMayor.GetBookmark;
  Marca3 := xSaldos.GetBookmark;
  try
     xCentrosCoste.Close;
     xCentrosCoste.Open;
     xCentrosCoste.GotoBookmark(Marca1);
     xMayor.GotoBookmark(Marca2);
     xSaldos.GotoBookmark(Marca3);
  finally
     xCentrosCoste.FreeBookmark(Marca1);
     xMayor.FreeBookmark(Marca2);
     xSaldos.FreeBookmark(Marca3);
  end;
end;

function TDMAnaMayor.DameRicStr: string;
begin
  Result := xMayorRIC.AsString;
end;

function TDMAnaMayor.DameTipoAsiento: string;
begin
  {with QTipoAsiento do
  begin
    Params.ByName['EMPRESA'].AsInteger   := REntorno.Empresa;
    Params.ByName['CANAL'].AsInteger     := REntorno.Canal;
    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
    Params.ByName['RIC'].AsInteger       := xMayorRIC.AsInteger;
    ExecQuery;
    Result := FieldByName['TIPO'].AsString;
    FreeHandle;
  end;}
  Result := xMayorTIPO.AsString;
end;

procedure TDMAnaMayor.BusquedaCompleja;
// var
//   Orden : string;
begin
  {  with xCuentas do
  begin
    DisableControls;
    Close;
    Orden := OrdenadoPor;
    Ordenar('');
    TFBuscaRO.Create(Self).SeleccionaBusqueda(xCuentas, '11000', False);
    SelectSQL.Add('AND TIPO=5 AND CANAL=?CANAL');
    Ordenar(Orden);
    Open;
    EnableControls;
  end;}
end;

procedure TDMAnaMayor.xCentrosCosteAfterOpen(DataSet: TDataSet);
begin
  Hasta := RecodeTime(hasta, 23, 59, 59, 999);
  Filtra;
end;

procedure TDMAnaMayor.CambiaMascara(Moneda: string);
begin
  LocalMascaraN := DMMain.MascaraMoneda(Moneda);
  xMayorDEBE.DisplayFormat := LocalMascaraN;
  xMayorHABER.DisplayFormat := LocalMascaraN;
  xMayorSALDO.DisplayFormat := LocalMascaraN;
  xMayorIMPORTE.DisplayFormat := LocalMascaraN;
  xMayor_cc_PeriodoDEBE.DisplayFormat := LocalMascaraN;
  xMayor_cc_PeriodoHABER.DisplayFormat := LocalMascaraN;
  xMayor_cc_PeriodoSALDO.DisplayFormat := LocalMascaraN;
  xSaldosDEBE.DisplayFormat := LocalMascaraN;
  xSaldosHABER.DisplayFormat := LocalMascaraN;
  xSaldosSALDO.DisplayFormat := LocalMascaraN;
  xSaldosDEBE_A.DisplayFormat := LocalMascaraN;
  xSaldosHABER_A.DisplayFormat := LocalMascaraN;
  xSaldosSALDO_A.DisplayFormat := LocalMascaraN;
  xSaldosSALDO_RNG.DisplayFormat := LocalMascaraN;
end;

procedure TDMAnaMayor.CalculaFechas;
begin
  DameMinMax('EJE', Desde, Hasta);
end;

procedure TDMAnaMayor.CambiaTituloMoneda(monedatemp: string; modo: boolean);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Monedatemp;
     Open;
  end;

  if modo then
  begin
     moneda := monedatemp;
     CambiaMascara(monedatemp);
     Filtra;
  end;
end;

{function TDMAnaMayor.RellenaCanales: TStringList;
begin
  Result := TStringList.Create;
  Result.Add('0-Todos los Canales');
  with xCanales do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Open;
     while not EOF do
     begin
        Canal := FieldByName('canal').AsInteger;
        Result.Add('Canal ' + IntToStr(Canal));
        Next;
     end;
     Close;
  end;
end;}

procedure TDMAnaMayor.FiltraPeriodo;
begin
  with xMayor_cc_periodo do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := Canal;
     Params.ByName['PlanContable'].AsString := PlanContable;
     Params.ByName['CentroCoste'].AsString := xCentrosCosteCENTRO_COSTE.AsString;
     Params.ByName['Moneda'].AsString := moneda;
     Params.ByName['Alcance'].AsInteger := alcance;
     Open;
  end;
end;

function TDMAnaMayor.HayDatos: boolean;
begin
  Result := xMayor.RecordCount <> 0;
end;

function TDMAnaMayor.DameCanal: smallint;
begin
  Result := xMayorCANAL.AsInteger;
end;

procedure TDMAnaMayor.FiltradoInicial;
begin
  with xCentrosCoste do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := Canal;
     Params.ByName['PlanContable'].AsString := PlanContable;
  end;
end;

procedure TDMAnaMayor.FiltraCC(CentroCoste: string);
begin
  with xCentrosCoste do
  begin
     Close;
     SelectSQL.Text := 'select * from ana_centros_coste ' +
        ' where empresa=?empresa and' +
        ' ejercicio=?ejercicio and canal=?canal and' +
        ' plan_contable=?plancontable and' +
        ' upper(centro_coste) like ''' + UpperCase(CentroCoste) + '%''';
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := Canal;
     Params.ByName['PlanContable'].AsString := PlanContable;
     Open;
  end;
end;

procedure TDMAnaMayor.RellenaPlanesContables(Lista: TStrings);
var
  DS : TFIBDataSet;
begin
  Lista.Clear;
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
           end;
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add('select plan_contable,titulo from ana_plan_contable ');
           SelectSQL.Add('where empresa=?empresa and ejercicio=?ejercicio and ');
           SelectSQL.Add('canal=?canal ');
           SelectSQL.Add('order by plan_contable ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Open;
           while not EOF do
           begin
              Lista.AddObject(FieldByName('PLAN_CONTABLE').AsString + ' - ' + FieldByName('TITULO').AsString, Pointer(0));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;

  { dji lrk kri - Memory Leak
var
  Ro: TFIBDataSetRO;
begin
  Ro := TFIBDataSetRO.Create(Self);
  with Ro do
    try
      Database := DMMain.DataBase;
      SelectSQL.Text :=
                  'select plan_contable,titulo from ana_plan_contable' +
                  ' where empresa=?empresa and ejercicio=?ejercicio and'  +
                  ' canal=?canal';
      Params.ByName['Empresa'].AsInteger   := REntorno.Empresa;
      Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
      Params.ByName['Canal'].AsInteger     := Canal;
      Open;

      Result := TStringList.Create;
      while not EOF do
      begin
        Result.Add(FieldByName('PLAN_CONTABLE').AsString + ' - ' +
                   FieldByName('TITULO').AsString);
        Next;
      end;
    finally
      Free;
    end;
}
end;

function TDMAnaMayor.DameRic: integer;
begin
  Result := xMayorRIC.AsInteger;
end;

function TDMAnaMayor.DameLinea: integer;
begin
  Result := xMayorLINEA.AsInteger;
end;

procedure TDMAnaMayor.BorraImputacion;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  with Q do
     try
        Database := DMMain.Database;
        SQL.Text := 'delete from ana_apuntes_cc where empresa=?empresa and' +
           ' ejercicio=?ejercicio and canal=?canal and ric=?ric and' +
           ' linea=?linea';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := xMayorCANAL.AsInteger;
        Params.ByName['RIC'].AsInteger := xMayorRIC.AsInteger;
        Params.ByName['LINEA'].AsInteger := xMayorLINEA.AsInteger;
        ExecQuery;
        Filtra;
     finally
        Q.Free;
     end;
end;

end.
