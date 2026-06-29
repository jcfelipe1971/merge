unit UDMLstAgente;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery, StdCtrls,
  ULFComboBox, frxClass, frxHYReport;

type
  TDMLSTAgente = class(TDataModule)
     frAgente: TfrHYReport;
     frDSQMAcreedor: TfrDBDataSet;
     QMAgente: TFIBDataSetRO;
     DSQMAcreedor: TDataSource;
     QMTerceros: TFIBDataSetRO;
     DSQMTerceros: TDataSource;
     frDSQMTerceros: TfrDBDataSet;
     frDSQMJustifica: TfrDBDataSet;
     DSQMJustifica: TDataSource;
     QMJustifica: TFIBDataSetRO;
     QMFormasdePago: TFIBDataSetRO;
     DSFormasdePago: TDataSource;
     frDSQMFormasdePago: TfrDBDataSet;
     frDSQMIvaModos: TfrDBDataSet;
     DSIvaModos: TDataSource;
     QMIvaModos: TFIBDataSetRO;
     QMIRPF: TFIBDataSetRO;
     DSIRPF: TDataSource;
     frDSQMIRPF: TfrDBDataSet;
     frDSQMTipoTerceros: TfrDBDataSet;
     DSTipoTerceros: TDataSource;
     QMTipoTercero: TFIBDataSetRO;
     QMTipodeProv: TFIBDataSetRO;
     DSQMlstTipodeProv: TDataSource;
     frQMDSQMlstTipodeProv: TfrDBDataSet;
     QSeleccion: THYFIBQuery;
     TLocal: THYTransaction;
     QMTercerosTERCERO: TIntegerField;
     QMTercerosNOMBRE_COMERCIAL: TFIBStringField;
     QMTercerosNOMBRE_R_SOCIAL: TFIBStringField;
     QMTercerosTIPO_RAZON: TFIBStringField;
     QMTercerosNIF: TFIBStringField;
     QMTercerosDIR_TIPO: TFIBStringField;
     QMTercerosDIR_NOMBRE: TFIBStringField;
     QMTercerosDIR_NOMBRE_2: TFIBStringField;
     QMTercerosDIR_NUMERO: TFIBStringField;
     QMTercerosDIR_BLOQUE_ESCALERA: TFIBStringField;
     QMTercerosDIR_PISO: TFIBStringField;
     QMTercerosDIR_PUERTA: TFIBStringField;
     QMTercerosDIR_LOCALIDAD: TFIBStringField;
     QMTercerosFECHA_ALTA: TDateTimeField;
     QMTercerosNOTAS: TBlobField;
     QMTercerosTELEFONO01: TFIBStringField;
     QMTercerosTELEFONO02: TFIBStringField;
     QMTercerosTELEFAX: TFIBStringField;
     QMTercerosEMAIL: TFIBStringField;
     QMTercerosWEB: TFIBStringField;
     QMTipodeProvTIPO: TIntegerField;
     QMTipodeProvTITULO: TFIBStringField;
     QMFormasdePagoEMPRESA: TIntegerField;
     QMFormasdePagoEJERCICIO: TIntegerField;
     QMFormasdePagoCANAL: TIntegerField;
     QMFormasdePagoFORMA_PAGO: TFIBStringField;
     QMFormasdePagoCUENTA_PAGO: TFIBStringField;
     QMFormasdePagoTITULO: TFIBStringField;
     QMFormasdePagoPLAZOS: TIntegerField;
     QMFormasdePagoDIAS_1_PLAZO: TIntegerField;
     QMFormasdePagoDIAS_E_PLAZOS: TIntegerField;
     QMFormasdePagoTIPO_EFECTO: TFIBStringField;
     QMFormasdePagoREMESAR: TIntegerField;
     QMFormasdePagoPRONTO_PAGO: TIntegerField;
     QMFormasdePagoPAGO_AUTOMATICO: TIntegerField;
     QMIvaModosMODO: TIntegerField;
     QMIvaModosTITULO: TFIBStringField;
     QMIvaModosIVA: TIntegerField;
     QMIvaModosRECARGO: TIntegerField;
     QMIvaModosDEDUCIBLE: TIntegerField;
     QMIvaModosTIPO_TRANSACCION: TIntegerField;
     QMIRPFPAIS: TFIBStringField;
     QMIRPFTIPO: TIntegerField;
     QMIRPFTITULO: TFIBStringField;
     QMIRPFP_IRPF: TFloatField;
     QMIRPFBASE: TIntegerField;
     QMTipoTerceroTIPO: TIntegerField;
     QMTipoTerceroTITULO: TFIBStringField;
     QMJustificaDIRECCION: TFIBStringField;
     QMJustificaCODPOB: TFIBStringField;
     QMJustificaPROVINCIA: TFIBStringField;
     QMJustificaPAIS: TFIBStringField;
     xCarga: TFIBDataSetRO;
     DSxCarga: TDataSource;
     frDBxCarga: TfrDBDataSet;
     xAgente: TFIBDataSetRO;
     xAgenteH: TFIBDataSetRO;
     xClienteH: TFIBDataSetRO;
     DSxClienteH: TDataSource;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     DSxAgente: TDataSource;
     DSxAgenteH: TDataSource;
     QGeneral: THYFIBQuery;
     xSeries: TFIBQuery;
     xCanales: TFIBQuery;
     xAgenteTITULO: TFIBStringField;
     xClienteTITULO: TFIBStringField;
     xAgenteHTITULO: TFIBStringField;
     xClienteHTITULO: TFIBStringField;
     QMAgenteEMPRESA: TIntegerField;
     QMAgenteEJERCICIO: TIntegerField;
     QMAgenteCANAL: TIntegerField;
     QMAgenteAGENTE: TIntegerField;
     QMAgenteP_COMISION: TFloatField;
     QMAgenteTERCERO: TIntegerField;
     QMAgenteNOTAS: TBlobField;
     QMAgenteCUENTA: TFIBStringField;
     QMAgenteTITULO: TFIBStringField;
     xCargaAGENTE: TIntegerField;
     xCargaTITULO_AGENTE: TFIBStringField;
     xCargaRIG: TIntegerField;
     xCargaMONEDA: TFIBStringField;
     xCargaCLIENTE: TIntegerField;
     xCargaTITULO_CLIENTE: TFIBStringField;
     xCargaFECHA: TDateTimeField;
     xCargaLINEA: TIntegerField;
     xCargaARTICULO: TFIBStringField;
     xCargaTITULO: TFIBStringField;
     xCargaUNIDADES: TFloatField;
     xCargaPRECIO: TFloatField;
     xCargaBULTOS: TIntegerField;
     xCargaPIEZAS: TIntegerField;
     xCargaTIPO_IVA: TIntegerField;
     xCargaDESC1: TFloatField;
     xCargaDESC2: TFloatField;
     xCargaDESC3: TFloatField;
     xCargaTOTAL_LINEA: TFloatField;
     xCargaCANALD: TIntegerField;
     xCargaSERIED: TFIBStringField;
     frxAgente: TfrxHYReport;
     QMJustificaNUM: TIntegerField;
     QMJustificaCOLONIA: TFIBStringField;
     QMJustificaDIR_NOMBRE_2: TFIBStringField;
     QMJustificaDIR_TELEFONO01: TFIBStringField;
     QMJustificaDIR_TELEFONO02: TFIBStringField;
     QMJustificaDIR_TELEFAX: TFIBStringField;
     QMJustificaEMAIL: TFIBStringField;
     QMJustificaNOTAS: TBlobField;
     procedure frAgenteGetValue(const ParName: string; var ParValue: variant);
     procedure frAgenteEnterRect(Memo: TStringList; View: TfrView);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frxAgenteBeforePrint(Sender: TfrxReportComponent);
     procedure frxAgenteGetValue(const VarName: string; var Value: variant);
     procedure QMAgenteAfterOpen(DataSet: TDataSet);
     procedure QMAgenteBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     ClienteD, ClienteH, AgenteD, AgenteH, Canal, facturados: integer;
     FechaD, FechaH: TDateTime;
     serie: string;
     procedure MostrarFiltrado(Modo: byte);
     procedure MostrarFiltradoFiscal(Modo: byte);
     procedure DameTitulos(var Titulo: string; Agente: integer);
     procedure DameMinMax(var Desde, Hasta: integer);
     procedure CambiaClienteH(cliHasta: integer);
     procedure CambiaclienteD(cliDesde: integer);
     procedure CambiaAgenteD(agedesde: integer);
     procedure CambiaAgenteH(agehasta: integer);
     procedure MostrarCarga(Modo: byte);
     procedure recargaAgenteCarga;
     procedure cargarcombos(var CBCanal, CBSerie: TLFComboBox);
  end;

var
  DMLSTAgente : TDMLSTAgente;
  SW : integer;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UFMAgentes, UFormGest, UDMListados, UUtiles, UDameDato;

procedure TDMLSTAgente.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLSTAgente.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLSTAgente.MostrarFiltrado(Modo: byte);
var
  str : string;
begin
  QMAgente.Close;
  QMAgente.Open;
  if (FMAgentes.SWFil = 0) then
     if (FMAgentes.SWEnlace = 0) then
        DMMain.FiltraRO(QMAgente, '11100', True)
     else
        DMMain.FiltraRO(QMAgente, '10100', True);

  SW := 1;

  if ((Modo = 0) or (Modo = 1)) then  // Listado Filtrado
     DMListados.Cargar(11, '')
  else                                  // Listado de Direcciones
     DMListados.Cargar(80, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAgente.LoadFromFIB(REntorno.Formato, str);
     frAgente.PrepareReport;
     case Modo of
        0, 2: frAgente.ShowPreparedReport;
        1, 3: frAgente.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxAgente.LoadFromFIB(REntorno.Formato, str);
     frxAgente.PrepareReport;
     case Modo of
        0, 2: frxAgente.ShowPreparedReport;
        1, 3: frxAgente.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTAgente.MostrarFiltradoFiscal(Modo: byte);
var
  str : string;
begin
  QMAgente.Close;
  QMAgente.Open;
  if (FMAgentes.SWFil = 0) then
     if (FMAgentes.SWEnlace = 0) then
        DMMain.FiltraRO(QMAgente, '11100', True)
     else
        DMMain.FiltraRO(QMAgente, '10100', True);

  SW := 1;
  DMListados.Cargar(12, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAgente.LoadFromFIB(REntorno.Formato, str);
     frAgente.PrepareReport;
     case Modo of
        0: frAgente.ShowPreparedReport;
        1: frAgente.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxAgente.LoadFromFIB(REntorno.Formato, str);
     frxAgente.PrepareReport;
     case Modo of
        0: frxAgente.ShowPreparedReport;
        1: frxAgente.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTAgente.DameTitulos(var Titulo: string; Agente: integer);
begin
  with QSeleccion do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT TITULO FROM VER_AGENTES_CUENTAS');
     SQL.Add('WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND');
     SQL.Add('EJERCICIO =' + REntorno.EjercicioStr + ' AND');
     SQL.Add('CANAL =' + REntorno.CanalStr);
     SQL.Add('AND AGENTE =' + IntToStr(Agente));
     ExecQuery;
     Titulo := FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLSTAgente.DameMinMax(var Desde, Hasta: integer);
begin
  with QSeleccion do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT MIN(AGENTE) AS MINIMO,MAX(AGENTE) AS MAXIMO FROM VER_AGENTES_CUENTAS');
     SQL.Add('WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND');
     SQL.Add('EJERCICIO =' + REntorno.EjercicioStr + ' AND');
     SQL.Add('CANAL =' + REntorno.CanalStr);
     ExecQuery;
     Desde := FieldByName['MINIMO'].AsInteger;
     Hasta := FieldByName['MAXIMO'].AsInteger;
     FreeHandle;
  end;
end;

procedure TDMLSTAgente.MostrarCarga(Modo: byte);
var
  str : string;
begin
  with xCarga do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['AGENTED'].AsInteger := AgenteD;
     Params.ByName['AGENTEH'].AsInteger := AgenteH;
     Params.ByName['FECHAd'].AsDateTime := FechaD;
     Params.ByName['FECHAh'].AsDateTime := FechaH;
     Params.ByName['CLIENTED'].AsInteger := ClienteD;
     Params.ByName['CLIENTEH'].AsInteger := ClienteH;
     Params.ByName['FACTURADOS'].AsInteger := Facturados;
     Open;
  end;

  DMListados.Cargar(120, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAgente.LoadFromFIB(REntorno.Formato, str);
     frAgente.PrepareReport;
     case Modo of
        0: frAgente.ShowPreparedReport;
        1: frAgente.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxAgente.LoadFromFIB(REntorno.Formato, str);
     frxAgente.PrepareReport;
     case Modo of
        0: frxAgente.ShowPreparedReport;
        1: frxAgente.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTAgente.recargaAgenteCarga;
begin
  with QgeneraL do
  begin
     if Open then
        Close;
     SQL.Clear;
     SQL.Add('SELECT MIN(CLIENTE) as mincli, MAX(CLIENTE) as maxcli, ');
     SQL.Add('MIN(FECHA) as minfecha, MAX(FECHA) as maxfecha FROM GES_CABECERAS_S ');
     SQL.Add('WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND TIPO=''ALB'' AND ESTADO=0 ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.ejercicio;
     ExecQuery;
     ClienteD := FieldByName['MINCLI'].AsInteger;
     ClienteH := FieldByName['MAXCLI'].AsInteger;
     if (FieldByName['MINFECHA'].AsString = '') then
     begin
        FechaD := REntorno.FechaTrabSH;
        FechaH := REntorno.FechaTrabSH;
     end
     else
     begin
        FechaD := FieldByName['MINFECHA'].AsDateTime;
        FechaH := FieldByName['MAXFECHA'].AsDateTime;
     end;
     SQL.Clear;
     //COMBOS DE AGENTES
     if Open then
        Close;
     SQL.Add('SELECT MIN(AGENTE) as minage, MAX(AGENTE) as maxage ');
     SQL.Add('FROM GES_CABECERAS_S ');
     SQL.Add('WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     AgenteD := FieldByName['MINAGE'].AsInteger;
     AgenteH := FieldByName['MAXAGE'].AsInteger;
  end;
end;

procedure TDMLSTAgente.CargarCombos(var CBCanal, CBSerie: TLFComboBox);
begin
  CBCanal.items.Clear;
  CBCanal.Items.Add('0 - Todos los canales');
  CBSerie.items.Clear;
  CBSerie.Items.Add('0 - Todas las series');

  with xCanales do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     while not EOF do
     begin
        CBCanal.items.Add(FieldByName['CANAL'].AsString + ' - ' +
           FieldByName['TITULO'].AsString);
        Next;
     end;
  end;
  with xSeries do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     while not EOF do
     begin
        cbSerie.items.Add(FieldByName['SERIE'].AsString + ' - ' +
           FieldByName['TITULO'].AsString);
        Next;
     end;
     Close;
  end;
end;

procedure TDMLSTAgente.CambiaclienteD(cliDesde: integer);
begin
  with xCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := CliDesde;
     Open;
     ClienteD := CliDesde;
  end;
end;

procedure TDMLSTAgente.CambiaClienteH(cliHasta: integer);
begin
  with xClienteH do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CLIENTE'].AsInteger := CliHasta;
     Open;
     ClienteH := cliHasta;
  end;
end;

procedure TDMLSTAgente.CambiaAgenteD(AgeDesde: integer);
begin
  with xAgente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGENTE'].AsInteger := AgeDesde;
     Open;
     AgenteD := AgeDesde;
  end;
end;

procedure TDMLSTAgente.CambiaAgenteH(AgeHasta: integer);
begin
  with xAgenteH do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGENTE'].AsInteger := AgeHasta;
     Open;
     AgenteH := AgeHasta;
  end;
end;

procedure TDMLSTAgente.frAgenteGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'age1' then
     ParValue := IntToStr(AgenteD) + ' ' + xAgenteTITULO.AsString;
  if ParName = 'age2' then
     ParValue := IntToStr(AgenteH) + ' ' + xAgenteHTITULO.AsString;
  if ParName = 'cliente1' then
     ParValue := IntToStr(clienteD) + ' ' +
        xClienteTITULO.AsString;
  if ParName = 'cliente2' then
     ParValue := IntToStr(clienteH) + ' ' +
        xClienteHTITULO.AsString;
  if ParName = 'fecha1' then
     ParValue := FechaD;
  if ParName = 'fecha2' then
     ParValue := FechaH;
  if ParName = 'Canal' then
     if canal = 0 then
        ParValue := 'Todos'
     else
        ParValue := xCargaCANALD.AsString;
  if ParName = 'serie' then
     if serie = ' ' then
        ParValue := 'Todas'
     else
        ParValue := DameTituloSerie(Serie); {dji lrk kri}
end;

procedure TDMLSTAgente.frAgenteEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if Memo[0] = 'Nº' then
        SW := 1;
  end;
end;

procedure TDMLSTAgente.frxAgenteBeforePrint(Sender: TfrxReportComponent);
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
           if Pos('Nº', Memo[0]) > 0 then
              SW := 1;
        end;
end;

procedure TDMLSTAgente.frxAgenteGetValue(const VarName: string; var Value: variant);
begin
  frAgenteGetValue(VarName, Value);
end;

procedure TDMLSTAgente.QMAgenteAfterOpen(DataSet: TDataSet);
begin
  QMTerceros.Close;
  QMTerceros.Open;
  QMTipodeProv.Close;
  QMTipodeProv.Open;
  QMFormasdePago.Close;
  QMFormasdePago.Open;
  QMIvaModos.Close;
  QMIvaModos.Open;
  QMIRPF.Close;
  QMIRPF.Open;
  QMTipoTercero.Close;
  QMTipoTercero.Open;
  QMJustifica.Close;
  QMJustifica.Open;
end;

procedure TDMLSTAgente.QMAgenteBeforeClose(DataSet: TDataSet);
begin
  QMTerceros.Close;
  QMTipodeProv.Close;
  QMFormasdePago.Close;
  QMIvaModos.Close;
  QMIRPF.Close;
  QMTipoTercero.Close;
  QMJustifica.Close;
end;

end.
