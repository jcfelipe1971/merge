unit ZUDMLstPedEntrega;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet, FR_DSet,
  FR_DBSet, FIBDataSetRO, FR_Class, Fr_HYReport, FIBQuery, HYFIBQuery;

type
  TZDMLstPedEntrega = class(TDataModule)
     TLocal: THYTransaction;
     frPedEntrega: TfrHYReport;
     QMListado: TFIBDataSetRO;
     DSListado: TDataSource;
     FrDBPedEntrega: TfrDBDataSet;
     QMListadoTRANSPORTISTA: TIntegerField;
     QMListadoNOMBRE_TRANSPORTISTA: TFIBStringField;
     QMListadoFECHA_CORTE: TDateTimeField;
     QMListadoFECHA_UNION: TDateTimeField;
     QMListadoFECHA_MACARRON: TDateTimeField;
     QMListadoFECHA_MONTAJE: TDateTimeField;
     QMListadoFECHA_TERMINADO: TDateTimeField;
     QMListadoCLIENTE: TIntegerField;
     QMListadoTITULO: TFIBStringField;
     QMListadoNOMBRE_COMERCIAL: TFIBStringField;
     QMListadoRIG: TIntegerField;
     QMListadoZ_COD_BARRAS_PED: TIntegerField;
     QMListadoFECHA: TDateTimeField;
     QMListadoFECHA_ENTREGA_PREV: TDateTimeField;
     QMListadoFECHA_REC_CAB: TDateTimeField;
     QMListadoSU_REFERENCIA: TFIBStringField;
     QMListadoLIQUIDO: TFloatField;
     xClienteD: TFIBDataSetRO;
     xClienteDTITULO: TFIBStringField;
     xClienteH: TFIBDataSetRO;
     xClienteHTITULO: TFIBStringField;
     DSclienteH: TDataSource;
     DSClienteD: TDataSource;
     QGeneral: THYFIBQuery;
     xTransportistaD: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     xTransportistaH: TFIBDataSetRO;
     FIBStringField2: TFIBStringField;
     DSTransportistaH: TDataSource;
     DSTransportistaD: TDataSource;
     QMListadoDIAS_ENTREGA: TIntegerField;
     xClienteDNOMBRE_COMERCIAL: TFIBStringField;
     xClienteHNOMBRE_COMERCIAL: TFIBStringField;
     QMListadoARTICULO: TFIBStringField;
     QMListadoDESC_ARTICULO: TFIBStringField;
     xCanalDesde: TFIBDataSetRO;
     xCanalDesdeTITULO: TFIBStringField;
     xCanalDesdeCANAL: TIntegerField;
     DSxCanalDesde: TDataSource;
     DSxCanalHasta: TDataSource;
     xCanalHasta: TFIBDataSetRO;
     xCanalHastaTITULO: TFIBStringField;
     xCanalHastaCANAL: TIntegerField;
     SPCanal: THYFIBQuery;
     xAgrupacionD: TFIBDataSetRO;
     xAgrupacionH: TFIBDataSetRO;
     DSAgrupacionD: TDataSource;
     DSAgrupacionH: TDataSource;
     xAgrupacionDTITULO: TFIBStringField;
     xAgrupacionHTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPedEntregaGetValue(const ParName: string; var ParValue: variant);
     procedure frPedEntregaBeforePrint(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
     DesdeC, HastaC, TransportistaD, TransportistaH, DiaD, DiaH: integer;
     DesdeF, HastaF, DesdeFPrev, HastaFPrev: TDateTime;
  public
     { Public declarations }
     CliMin, CliMax: string;
     TranspMin, TranspMax: string;
     DiaMin, DiaMax, CanalMin, CanalMax: string;
     AgrupMin, AgrupMax: string;
     Comentario: string;
     Valorar: boolean;
     procedure CambiaclienteD(cliente: integer);
     procedure CambiaclienteH(cliente: integer);
     procedure CambiaTransportistaD(transportista: integer);
     procedure CambiaTransportistaH(transportista: integer);
     procedure MostrarListado(modo: integer; Serie: string; min_fecha, max_fecha, min_fecha_prev, max_fecha_prev, fecha_listado: TDateTime; min_cliente, max_cliente, min_transp, max_transp, min_dias, max_dias: integer; canald, canalh: integer; agrupacion_D, agrupacion_H: string);
     procedure RecargarDatos(const Resultado: string; tipo: integer);
     procedure Recargar;
     procedure ActualizaAgrupacion(agrupacion, tipo: string);
  end;

var
  ZDMLstPedEntrega : TZDMLstPedEntrega;

implementation

uses UDMMain, UDMListados, UFormGest, ZUFPregPedEntrega, UEntorno, UUtiles;

{$R *.dfm}

procedure TZDMLstPedEntrega.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMLstPedEntrega.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMLstPedEntrega.frPedEntregaGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if Trim(ParName) = 'Valorar' then
     ParValue := Valorar;
  if Trim(ParName) = 'Comentario' then
     ParValue := Comentario;
  if Trim(ParName) = 'FechaListado' then
     ParValue := ZFPregPedEntrega.TDPFechaListado.Date;
  if Trim(ParName) = 'Orden' then
     ParValue := ZFPregPedEntrega.CBOrden.Items[ZFPregPedEntrega.CBOrden.ItemIndex];

  if Trim(ParName) = 'Estado' then
  begin
     if ((TransportistaD = 7067) and (TransportistaH = 7067)) then //RECOGE
        ParValue := _('RECOGE')
     else if ((TransportistaD = 7068) and (TransportistaH = 7068)) then //CAMION
        ParValue := _('CAMIÓN')
     else
        ParValue := _('ENVIO');
  end;

  if Trim(ParName) = 'TFiltro' then
     ParValue := 'Desde Cliente: ' + IntToStr(DesdeC) + ' Hasta Cliente: ' +
        IntToStr(HastaC) +
        ' Desde Fecha: ' + DateToStr(DesdeF) + ' Hasta Fecha: ' + DateToStr(HastaF) +
        ' Desde Fecha Prev.: ' + DateToStr(DesdeFPrev) + ' Hasta Fecha Prev: ' + DateToStr(HastaFPrev);
end;

procedure TZDMLstPedEntrega.frPedEntregaBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TZDMLstPedEntrega.MostrarListado(modo: integer; Serie: string; min_fecha, max_fecha, min_fecha_prev, max_fecha_prev, fecha_listado: TDateTime; min_cliente, max_cliente, min_transp, max_transp, min_dias, max_dias: integer; canald, canalh: integer; agrupacion_D, agrupacion_H: string);
var
  str : string;
begin
  TransportistaD := min_transp;
  TransportistaH := max_transp;
  DiaD := min_dias;
  DiaH := max_dias;
  DesdeC := min_cliente;
  HastaC := max_cliente;
  DesdeF := min_fecha;
  HastaF := max_fecha;
  DesdeFPrev := Min_fecha_prev;
  HastaFPrev := Max_fecha_prev;
  Min_fecha := HourIntoDate(Min_fecha, '00:00:00');
  Max_fecha := HourIntoDate(Max_fecha, '23:59:59');
  Min_fecha_prev := HourIntoDate(Min_fecha_prev, '00:00:00');
  Max_fecha_prev := HourIntoDate(Max_fecha_prev, '23:59:59');

  DMListados.Normalizar_Desde_Hasta(Min_fecha, Max_fecha);
  DMListados.Normalizar_Desde_Hasta(Min_fecha_prev, Max_fecha_prev);
  DMListados.Normalizar_Desde_Hasta(min_cliente, max_cliente);
  DMListados.Normalizar_Desde_Hasta(min_transp, max_transp);
  DMListados.Normalizar_Desde_Hasta(min_dias, max_dias);

  with QMListado do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := Serie;
     Params.ByName['FechaD'].AsDateTime := min_fecha;
     Params.ByName['FechaH'].AsDateTime := max_fecha;
     Params.ByName['FechaPrevD'].AsDateTime := min_fecha_prev;
     Params.ByName['FechaPrevH'].AsDateTime := max_fecha_prev;
     Params.ByName['ClienteD'].AsInteger := min_cliente;
     Params.ByName['ClienteH'].AsInteger := max_cliente;
     Params.ByName['TransportistaD'].AsInteger := min_transp;
     Params.ByName['TransportistaH'].AsInteger := max_transp;
     Params.ByName['CanalD'].AsInteger := canald;
     Params.ByName['CanalH'].AsInteger := canalh;
     Params.ByName['AgrupacionD'].AsString := agrupacion_D;
     Params.ByName['AgrupacionH'].AsString := agrupacion_H;

     if (min_dias > -99) then
     begin
        Params.ByName['DiasD'].AsInteger := min_dias;
        Params.ByName['DiasH'].AsInteger := max_dias;
     end;
     Open;
  end;

  DMListados.Cargar(9005, '');
  frPedEntrega.LoadFromFIB(REntorno.Formato, str);
  frPedEntrega.PrepareReport;
  // frPedEntrega.DesignReport;
  case modo of
     0: frPedEntrega.ShowPreparedReport;
     1: frPedEntrega.PrintPreparedReport(' ', REntorno.Copias);
  end;
  DMListados.LimpiaEntorno;
end;

procedure TZDMLstPedEntrega.CambiaClienteD(Cliente: integer);
begin
  with xClienteD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Cliente'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TZDMLstPedEntrega.CambiaClienteH(Cliente: integer);
begin
  with xClienteH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Cliente'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TZDMLstPedEntrega.Recargar;
begin
  //Min cliente
  RecargarDatos('MIN(CLIENTE) AS MIN_CLIENTE', 1);
  QGeneral.ExecQuery;
  CliMin := QGeneral.FieldByName['MIN_CLIENTE'].AsString;

  //Max cliente
  RecargarDatos('MAX(CLIENTE) AS MAX_CLIENTE', 1);
  QGeneral.ExecQuery;
  CliMax := QGeneral.FieldByName['MAX_CLIENTE'].AsString;

  //Min transportista
  RecargarDatos('MIN(ACREEDOR) AS MIN_TRANSPORTISTA', 2);
  QGeneral.ExecQuery;
  TranspMin := QGeneral.FieldByName['MIN_TRANSPORTISTA'].AsString;

  //Max transportista
  RecargarDatos('MAX(ACREEDOR) AS MAX_TRANSPORTISTA', 2);
  QGeneral.ExecQuery;
  TranspMax := QGeneral.FieldByName['MAX_TRANSPORTISTA'].AsString;

  //Min dia de entrega
  RecargarDatos('MIN(DIAS_ENTREGA) AS MIN_DIA', 1);
  QGeneral.ExecQuery;
  DiaMin := QGeneral.FieldByName['MIN_DIA'].AsString;

  //Max dia de entrega
  RecargarDatos('MAX(DIAS_ENTREGA) AS MAX_DIA', 1);
  QGeneral.ExecQuery;
  DiaMax := QGeneral.FieldByName['MAX_DIA'].AsString;

  //Min canal
  SPCanal.Close;
  SPCanal.SQL.Clear;
  SPCanal.SQL.Text := 'SELECT MIN(CANAL) AS MINIMO FROM VER_CANALES_ACTIVOS';
  SPCanal.ExecQuery;
  CanalMin := SPCanal.FieldByName['MINIMO'].AsString;

  //Max canal
  SPCanal.Close;
  SPCanal.SQL.Clear;
  SPCanal.SQL.Text := 'SELECT MAX(CANAL) AS MAXIMO FROM VER_CANALES_ACTIVOS';
  SPCanal.ExecQuery;
  CanalMax := SPCanal.FieldByName['MAXIMO'].AsString;
  SPCanal.FreeHandle;

  with QGeneral do
  begin
     Close;
     SQL.Text := 'SELECT min(agrupacion) as agrupmin, max(agrupacion) as agrupmax from sys_agrupaciones';
     ExecQuery;
     AgrupMax := FieldByName['AGRUPMAX'].AsString;
     AgrupMin := FieldByName['AGRUPMIN'].AsString;
  end;
end;

procedure TZDMLstPedEntrega.RecargarDatos(const Resultado: string; tipo: integer);
begin
  case tipo of
     1:
     begin
        with QGeneral do
        begin
           Close;
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM EMP_CLIENTES ' +
              'WHERE EMPRESA=?EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        end;
     end;

     2:
     begin
        with QGeneral do
        begin
           Close;
           SQL.Text := 'SELECT ' + Resultado + ' ' +
              'FROM EMP_ACREEDORES ' +
              'WHERE EMPRESA=?EMPRESA AND TIPO=7';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        end;
     end;
  end;
end;

procedure TZDMLstPedEntrega.CambiaTransportistaD(Transportista: integer);
begin
  with xTransportistaD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Transportista'].AsInteger := Transportista;
     Open;
  end;
end;

procedure TZDMLstPedEntrega.CambiaTransportistaH(Transportista: integer);
begin
  with xTransportistaH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Transportista'].AsInteger := Transportista;
     Open;
  end;
end;

procedure TZDMLstPedEntrega.ActualizaAgrupacion(agrupacion, tipo: string);
begin
  if (tipo = 'D') then
  begin
     xAgrupacionD.Close;
     xAgrupacionD.Params.ByName['agrupacion'].AsString := agrupacion;
     xAgrupacionD.Open;
  end
  else if (tipo = 'H') then
  begin
     xAgrupacionH.Close;
     xAgrupacionH.Params.ByName['agrupacion'].AsString := agrupacion;
     xAgrupacionH.Open;
  end;
end;

end.
