unit udmlstagrupacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_Class,
  Fr_HYReport, FR_DSet, FR_DBSet, FIBQuery, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLSTAgrupaciones = class(TDataModule)
     xAgrupacion: TFIBDataSetRO;
     xClientes: TFIBDataSetRO;
     TLocal: THYTransaction;
     DSxAgrupacion: TDataSource;
     DSxClientes: TDataSource;
     xTerceros: TFIBDataSetRO;
     DSxTerceros: TDataSource;
     DSxCartera: TDataSource;
     xCartera: TFIBDataSetRO;
     frCarteraAgrupacion: TfrHYReport;
     frDBxAgrupacion: TfrDBDataSet;
     frDBxClientes: TfrDBDataSet;
     frDBxTerceros: TfrDBDataSet;
     frDBxCartera: TfrDBDataSet;
     xLocalidad: TFIBDataSetRO;
     DSxLocalidad: TDataSource;
     xAgrupacionTit: TFIBDataSetRO;
     DSxAgrupacionTit: TDataSource;
     SPCarga: THYFIBQuery;
     QAgrupacionDef: THYFIBQuery;
     QDameEjercicio: THYFIBQuery;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     frxCarteraAgrupacion: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMLSTAgrupacionesCreate(Sender: TObject);
     procedure DMLSTAgrupacionesDestroy(Sender: TObject);
     procedure xAgrupacionAfterOpen(DataSet: TDataSet);
     procedure xTercerosAfterScroll(DataSet: TDataSet);
     procedure frCarteraAgrupacionEnterRect(Memo: TStringList; View: TfrView);
     procedure xAgrupacionAfterScroll(DataSet: TDataSet);
     procedure frCarteraAgrupacionGetValue(const ParName: string; var ParValue: variant);
     procedure frxCarteraAgrupacionBeforePrint(Sender: TfrxReportComponent);
     procedure frxCarteraAgrupacionGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     LocalMascaraN: string;
  public
     { Public declarations }
     Cobrado, Impagado, Normal, Remesado: boolean;
     procedure AbrirTablasFiltradas(agrupacion: string; inicio, final: TDateTime);
     procedure MostrarListado(Modo: smallint);
     procedure Titulo(agrupacion: string);
     procedure Recargar(var agrupacion: string; var inicio, final: TDateTime);
     procedure Actualiza_Ejercicio(Fecha: TDateTime; origen: smallint);
     procedure CambiaMoneda(Moneda: string);
     procedure AbreCartera;
  end;

var
  DMLSTAgrupaciones : TDMLSTAgrupaciones;
  ini, fin : TDateTime;
  EstadoD, EstadoH : string;
  Total : double;
  EjerIni, EjerFin : smallint;

implementation

uses UDMMain, UDMListados, UEntorno, UFormGest, UUtiles, DateUtils;

{$R *.DFM}

procedure TDMLSTAgrupaciones.DMLSTAgrupacionesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLSTAgrupaciones.DMLSTAgrupacionesDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLSTAgrupaciones.AbrirTablasFiltradas(agrupacion: string; inicio, final: TDateTime);
begin
  DMListados.Normalizar_Desde_Hasta(inicio, final);  // Normalizar fechas
  ini := Trunc(inicio);
  fin := Trunc(final);

  with xAgrupacion do
  begin
     Close;
     Params.ByName['Agrupacion'].AsString := agrupacion;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Open;
  end;

  with xClientes do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['EjerIni'].AsInteger := EjerIni;
     Params.ByName['EjerFin'].AsInteger := EjerFin;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     if (xAgrupacion.Active) then
        Params.ByName['Cliente'].AsInteger := xAgrupacion.FieldByName('CLIENTE').AsInteger
     else
        Params.ByName['Cliente'].AsInteger := 0;
     Open;
  end;

  xTerceros.Close;
  xTerceros.Open;

  AbreCartera;
end;

procedure TDMLSTAgrupaciones.MostrarListado(Modo: smallint);
var
  str : string;
begin
  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);

  DMListados.Cargar(57, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frCarteraAgrupacion.LoadFromFIB(REntorno.Formato, str);
     frCarteraAgrupacion.PrepareReport;
     case Modo of
        0: frCarteraAgrupacion.ShowPreparedReport;
        1: frCarteraAgrupacion.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxCarteraAgrupacion.LoadFromFIB(REntorno.Formato, str);
     frxCarteraAgrupacion.PrepareReport;
     case Modo of
        0: frxCarteraAgrupacion.ShowPreparedReport;
        1: frxCarteraAgrupacion.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLSTAgrupaciones.xAgrupacionAfterOpen(DataSet: TDataSet);
begin
  with xClientes do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['EjerIni'].AsInteger := EjerIni;
     Params.ByName['EjerFin'].AsInteger := EjerFin;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     if (xAgrupacion.Active) then
        Params.ByName['Cliente'].AsInteger := xAgrupacion.FieldByName('CLIENTE').AsInteger
     else
        Params.ByName['Cliente'].AsInteger := 0;
     Open;
  end;

  xTerceros.Close;
  xTerceros.Open;

  AbreCartera;
end;

procedure TDMLSTAgrupaciones.xTercerosAfterScroll(DataSet: TDataSet);
begin
  xLocalidad.Close;
  xLocalidad.Open;
end;

procedure TDMLSTAgrupaciones.Titulo(agrupacion: string);
begin
  with xAgrupacionTit do
  begin
     Close;
     Params.ByName['Agrupacion'].AsString := agrupacion;
     Open;
  end;
end;

procedure TDMLSTAgrupaciones.Recargar(var agrupacion: string; var inicio, final: TDateTime);
begin
  with SPCarga do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     ExecQuery;
     inicio := FieldByName['minimo'].AsDateTime;
     final := FieldByName['maximo'].AsDateTime;
     FreeHandle;
  end;

  EjerIni := YearOf(inicio);
  EjerFin := YearOf(final);

  with QAgrupacionDef do
  begin
     Close;
     ExecQuery;
     agrupacion := FieldByName['AGRUPACION'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLSTAgrupaciones.frCarteraAgrupacionEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMLSTAgrupaciones.xAgrupacionAfterScroll(DataSet: TDataSet);
begin
  with xClientes do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['EjerIni'].AsInteger := EjerIni;
     Params.ByName['EjerFin'].AsInteger := EjerFin;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     if (xAgrupacion.Active) then
        Params.ByName['Cliente'].AsInteger := xAgrupacion.FieldByName('CLIENTE').AsInteger
     else
        Params.ByName['Cliente'].AsInteger := 0;
     Open;
  end;
  xTerceros.Close;
  xTerceros.Open;

  AbreCartera;
end;

procedure TDMLSTAgrupaciones.frCarteraAgrupacionGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Importe' then
  begin
     ParValue := DMMain.DameCambio(True, xCartera.FieldByName('MONEDA').AsString, xMonedas.FieldByName('MONEDA').AsString, xCartera.FieldByName('VENCIMIENTO').AsDateTime, xCartera.FieldByName('LIQUIDO').AsFloat);
     Total := Total + ParValue;
  end;

  if ParName = 'Inicializa' then
     Total := 0;

  if ParName = 'Total' then
     ParValue := Total;

  if ParName = 'Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;
end;

procedure TDMLstAgrupaciones.Actualiza_Ejercicio(Fecha: TDateTime; origen: smallint);
var
  AuxEjer : smallint;
begin
  with QDameEjercicio do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     ExecQuery;
     AuxEjer := FieldByName['EJERCICIO'].AsInteger;
     FreeHandle;
  end;
  case origen of
     0: EjerIni := AuxEjer;
     1: EjerFin := AuxEjer;
  end;
end;

procedure TDMLstAgrupaciones.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
end;

procedure TDMLstAgrupaciones.AbreCartera;
var
  C, I, N, R, aux : string;
begin
  C := '';
  I := '';
  N := '';
  R := '';

  with xCartera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := ' SELECT * FROM VER_CARTERA_REMESA     ' +
        ' WHERE                                ' +
        '   EMPRESA = ?EMPRESA AND             ' +
        {'   EJERCICIO_CARTERA >= ?EJERINI AND  '+ dji lrk kri - no debe tener en cuenta los ejercicios
                        '   EJERCICIO_CARTERA <= ?EJERFIN AND  '+                sino los vencimientos - Fercam}
        '   CANAL = ?CANAL AND                 ' +
        '   SIGNO = ''C'' AND                    ' +
        '   COD_CLI_PRO = ?CLIENTE AND         ' +
        '   VENCIMIENTO>=?INICIO AND           ' +
        '   VENCIMIENTO<=?FIN                  ';

     if Cobrado then
     begin
        C := '''C''';
        aux := C;
     end;
     if Impagado then
     begin
        I := '''I''';
        aux := I;
     end;
     if Normal then
     begin
        N := '''N''';
        aux := N;
     end;
     if Remesado then
     begin
        R := '''R''';
        aux := R;
     end;

     if not Cobrado then
        C := aux;
     if not Impagado then
        I := aux;
     if not Normal then
        N := aux;
     if not Remesado then
        R := aux;

     if ((Cobrado) or (Impagado) or (Normal) or (Remesado)) then
     begin
        SelectSQL.Add(' AND ESTADO_RECIBO IN (' + C + ',' + I + ',' + N + ',' + R + ') ');
     end;

     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     if (xAgrupacion.Active) then
        Params.ByName['Cliente'].AsInteger := xAgrupacion.FieldByName('CLIENTE').AsInteger
     else
        Params.ByName['Cliente'].AsInteger := 0;
     Params.ByName['Inicio'].AsDateTime := ini;
     Params.ByName['Fin'].AsDateTime := fin;
     Open;
  end;
end;

procedure TDMLSTAgrupaciones.frxCarteraAgrupacionBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLSTAgrupaciones.frxCarteraAgrupacionGetValue(const VarName: string; var Value: variant);
begin
  frCarteraAgrupacionGetValue(VarName, Value);
end;

end.
