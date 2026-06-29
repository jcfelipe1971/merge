unit UDMLSTProveedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLSTProveedor = class(TDataModule)
     frProveedor: TfrHYReport;
     frDSQMProveedor: TfrDBDataSet;
     QMProveedor: TFIBDataSetRO;
     DSQMProveedor: TDataSource;
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
     QSeleccion: THYFIBQuery;
     TLocal: THYTransaction;
     xEtiquetas: TFIBDataSetRO;
     DSxEtiquetas: TDataSource;
     frDBxEtiquetas: TfrDBDataSet;
     frDBProvCP: TfrDBDataSet;
     QMProvCP: TFIBDataSetRO;
     DSQMProvCP: TDataSource;
     QMCPDesde: TFIBDataSetRO;
     DSQMCPDesde: TDataSource;
     QMCPHasta: TFIBDataSetRO;
     DSQMCPHasta: TDataSource;
     QMinCPostal: THYFIBQuery;
     QMaxCPostal: THYFIBQuery;
     QMJustificaDIRECCION: TFIBStringField;
     QMJustificaCODPOB: TFIBStringField;
     QMJustificaPROVINCIA: TFIBStringField;
     QMJustificaPAIS: TFIBStringField;
     QMTipoTerceroTIPO: TIntegerField;
     QMTipoTerceroTITULO: TFIBStringField;
     QMProveedorEMPRESA: TIntegerField;
     QMProveedorEJERCICIO: TIntegerField;
     QMProveedorCANAL: TIntegerField;
     QMProveedorPROVEEDOR: TIntegerField;
     QMProveedorTERCERO: TIntegerField;
     QMProveedorDESCUENTO: TFloatField;
     QMProveedorFORMA_PAGO: TFIBStringField;
     QMProveedorDIA_PAGO_1: TIntegerField;
     QMProveedorDIA_PAGO_2: TIntegerField;
     QMProveedorDESCUENTO_PP: TFloatField;
     QMProveedorNOTAS: TBlobField;
     QMProveedorMODO_IVA: TIntegerField;
     QMProveedorCUENTA: TFIBStringField;
     QMProveedorTITULO: TFIBStringField;
     QMProveedorTIPO_IRPF: TIntegerField;
     QMProveedorPAIS: TFIBStringField;
     QMProveedorTIPO: TIntegerField;
     QMProveedorPORTES: TIntegerField;
     QMProveedorNOMBRE_R_SOCIAL: TFIBStringField;
     QMProveedorMONEDA: TFIBStringField;
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
     xEtiquetasNOMBRE: TFIBStringField;
     xEtiquetasDIRECCION: TFIBStringField;
     xEtiquetasCODPOSTAL: TFIBStringField;
     xEtiquetasPOBLACION: TFIBStringField;
     xEtiquetasPROVINCIA: TFIBStringField;
     xEtiquetasPAIS: TFIBStringField;
     QMProvCPEMPRESA: TIntegerField;
     QMProvCPEJERCICIO: TIntegerField;
     QMProvCPCANAL: TIntegerField;
     QMProvCPPROVEEDOR: TIntegerField;
     QMProvCPCUENTA: TFIBStringField;
     QMProvCPNOMBRE: TFIBStringField;
     QMProvCPNIF: TFIBStringField;
     QMProvCPTELEFONO: TFIBStringField;
     QMProvCPDIRECCION: TFIBStringField;
     QMProvCPCOD_POSTAL: TFIBStringField;
     QMProvCPLOCALIDAD: TFIBStringField;
     QMProvCPPROVINCIA: TFIBStringField;
     QMProveedorUSAR_ANTICIPOS: TIntegerField;
     QMProveedorEVAL_FEB: TIntegerField;
     QMProveedorEVAL_FEB_SI: TIntegerField;
     QMProveedorISO9000: TIntegerField;
     QMProveedorFECHA_ISO9000: TDateTimeField;
     xFacturasMensual: TFIBTableSet;
     DSxFacturasMensual: TDataSource;
     xFacturasMensualCompara: TFIBDataSet;
     DSxFacturasMensualCompara: TDataSource;
     DSxFacturasAnual: TDataSource;
     xFacturasAnual: TFIBDataSet;
     xFacturasAnualCompara: TFIBDataSet;
     DSxFacturasAnualCompara: TDataSource;
     DSxPrevisionMensual: TDataSource;
     xPrevisionMensual: TFIBDataSet;
     xPrevisionAnual: TFIBDataSet;
     DSxPrevisionAnual: TDataSource;
     DSxFacturasAnualC_1: TDataSource;
     xFacturasAnualC_1: TFIBDataSet;
     xFacturasAnualC_2: TFIBDataSet;
     DSxFacturasAnualC_2: TDataSource;
     DSxFacturasAnualC_3: TDataSource;
     xFacturasAnualC_3: TFIBDataSet;
     xTituloProveedor: TFIBDataSetRO;
     frxProveedor: TfrxHYReport;
     xMinAgrup: TFIBDataSetRO;
     xAgrupacion: TFIBDataSetRO;
     DSxAgrupacion: TDataSource;
     xAgrupacionAGRUPACION: TFIBStringField;
     xAgrupacionTITULO: TFIBStringField;
     xAgrupacionTIPO: TFIBStringField;
     QAgrupaciones: TFIBDataSetRO;
     QAgrupacionesAGRUPACION: TFIBStringField;
     QAgrupacionesTITULO: TFIBStringField;
     DSQAgrupaciones: TDataSource;
     DSProvAgrup: TDataSource;
     QProvAgrup: TFIBDataSetRO;
     QProvAgrupEMPRESA: TIntegerField;
     QProvAgrupEJERCICIO: TIntegerField;
     QProvAgrupCANAL: TIntegerField;
     QProvAgrupPROVEEDOR: TIntegerField;
     QProvAgrupTERCERO: TIntegerField;
     QProvAgrupTITULO: TFIBStringField;
     QProvAgrupNIF: TFIBStringField;
     QProvAgrupDESCUENTO: TFloatField;
     QProvAgrupFORMA_PAGO: TFIBStringField;
     QProvAgrupDIA_PAGO_1: TIntegerField;
     QProvAgrupDIA_PAGO_2: TIntegerField;
     QProvAgrupDESCUENTO_PP: TFloatField;
     QProvAgrupNOTAS: TBlobField;
     QProvAgrupMODO_IVA: TIntegerField;
     QProvAgrupMONEDA: TFIBStringField;
     QProvAgrupPOR_FINANCIACION: TFloatField;
     QProvAgrupEMPRESA1: TIntegerField;
     QProvAgrupAGRUPACION: TFIBStringField;
     QProvAgrupPROVEEDOR1: TIntegerField;
     frDSQAgrupaciones: TfrDBDataSet;
     frDSProvAgrup: TfrDBDataSet;
     xTerceroAgrupacion: TFIBDataSetRO;
     xTerceroAgrupacionTERCERO: TIntegerField;
     xTerceroAgrupacionNOMBRE_COMERCIAL: TFIBStringField;
     xTerceroAgrupacionNOMBRE_R_SOCIAL: TFIBStringField;
     xTerceroAgrupacionTIPO_RAZON: TFIBStringField;
     xTerceroAgrupacionNIF: TFIBStringField;
     xTerceroAgrupacionDIR_TIPO: TFIBStringField;
     xTerceroAgrupacionDIR_NOMBRE: TFIBStringField;
     xTerceroAgrupacionDIR_NOMBRE_2: TFIBStringField;
     xTerceroAgrupacionDIR_NUMERO: TFIBStringField;
     xTerceroAgrupacionDIR_BLOQUE_ESCALERA: TFIBStringField;
     xTerceroAgrupacionDIR_PISO: TFIBStringField;
     xTerceroAgrupacionDIR_PUERTA: TFIBStringField;
     xTerceroAgrupacionDIR_LOCALIDAD: TFIBStringField;
     xTerceroAgrupacionFECHA_ALTA: TDateTimeField;
     xTerceroAgrupacionNOTAS: TBlobField;
     xTerceroAgrupacionTELEFONO01: TFIBStringField;
     xTerceroAgrupacionTELEFONO02: TFIBStringField;
     xTerceroAgrupacionTELEFAX: TFIBStringField;
     xTerceroAgrupacionEMAIL: TFIBStringField;
     xTerceroAgrupacionWEB: TFIBStringField;
     DSxTerceroagrupacon: TDataSource;
     frDBxTerceroAgrupacion: TfrDBDataSet;
     QMJustificaNUM: TIntegerField;
     QMJustificaCOLONIA: TFIBStringField;
     QMJustificaDIR_NOMBRE_2: TFIBStringField;
     QMJustificaDIR_TELEFONO01: TFIBStringField;
     QMJustificaDIR_TELEFONO02: TFIBStringField;
     QMJustificaDIR_TELEFAX: TFIBStringField;
     QMJustificaEMAIL: TFIBStringField;
     QMJustificaNOTAS: TBlobField;
     procedure frProveedorGetValue(const ParName: string; var ParValue: variant);
     procedure frProveedorEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLSTProveedorDestroy(Sender: TObject);
     procedure DMLSTProveedorCreate(Sender: TObject);
     procedure frxProveedorBeforePrint(Sender: TfrxReportComponent);
     procedure frxProveedorGetValue(const VarName: string; var Value: variant);
     procedure QMProveedorAfterOpen(DataSet: TDataSet);
     procedure QProvAgrupAfterOpen(DataSet: TDataSet);
     procedure QProvAgrupBeforeClose(DataSet: TDataSet);
     procedure QAgrupacionesAfterOpen(DataSet: TDataSet);
     procedure QAgrupacionesBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     tipo_grafico, ejer, ejercicio, ejercicio2: integer;
     EnviarEMail: integer;
  public
     { Public declarations }
     procedure MostrarFiltrado(Modo: byte);
     procedure MostrarFiltradoFiscal(Modo: byte);
     procedure DameTitulos(var Titulo: string; proveedor: integer);
     procedure DameMinMax(var Desde, Hasta: integer);
     procedure MostrarListadoEti(Tercero, vacias, copias, tipo, direcc: integer);
     // Listado por C.Postales
     procedure MostrarListadoCPostal(const CPMin, CPMax, OrdenTxt: string; Modo: byte);
     procedure RefrescaCPDesde(CP: string);
     procedure RefrescaCPHasta(CP: string);
     procedure DameMinMaxCPostal(var CPMin, CPMax: string);
     // Estadisticas de proveedores
     procedure MuestraEstadistica(tipo, ejerc, ejerc2, proveedor: integer; moneda: string; porcent: double);
     procedure DameAgrupacion(var agrupacion: string);
     procedure TituloAgrupacion(Agrupacion: string);
     procedure MostrarFiltradoAgrup(Modo: byte; Agrupacion: string; EMail: boolean; Orden: byte);
  end;

var
  DMLSTProveedor : TDMLSTProveedor;
  SW : integer;

implementation

uses UDMMain, UEntorno, UFMProveedores, UDMListados, UFormGest, ClipBrd;

{$R *.DFM}

procedure TDMLSTProveedor.DMLSTProveedorCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLSTProveedor.DMLSTProveedorDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstProveedor.MostrarFiltrado(Modo: byte);
var
  str : string;
begin
  QMProveedor.Close;
  QMProveedor.Open;

  if (FMProveedores.SWFil = 0) then
     if (FMProveedores.SWEnlace = 0) then
        DMMain.FiltraRO(QMProveedor, '11100', True)
     else
        DMMain.FiltraRO(QMProveedor, '10100', True);

  SW := 1;

  if ((Modo = 0) or (Modo = 1)) then
     DMListados.Cargar(9, '')    // Listados de Proveedores

  else
     DMListados.Cargar(62, '');  // Listados de Direcciones de Prov.

  if (REntorno.TipoListado = 'FRF') then
  begin
     frProveedor.LoadFromFIB(REntorno.Formato, str);
     frProveedor.PrepareReport;
     case Modo of
        0, 2: frProveedor.ShowPreparedReport;
        1, 3: frProveedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxProveedor.LoadFromFIB(REntorno.Formato, str);
     frxProveedor.PrepareReport;
     case Modo of
        0, 2: frxProveedor.ShowPreparedReport;
        1, 3: frxProveedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstProveedor.MostrarFiltradoFiscal(Modo: byte);
var
  str : string;
begin
  QMProveedor.Close;
  QMProveedor.Open;

  if (FMProveedores.SWFil = 0) then
     if (FMProveedores.SWEnlace = 0) then
        DMMain.FiltraRO(QMProveedor, '11100', True)
     else
        DMMain.FiltraRO(QMProveedor, '10100', True);

  SW := 1;
  DMListados.Cargar(10, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frProveedor.LoadFromFIB(REntorno.Formato, str);
     frProveedor.PrepareReport;
     case Modo of
        0: frProveedor.ShowPreparedReport;
        1: frProveedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxProveedor.LoadFromFIB(REntorno.Formato, str);
     frxProveedor.PrepareReport;
     case Modo of
        0: frxProveedor.ShowPreparedReport;
        1: frxProveedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTProveedor.frProveedorGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TipoGrafico' then
     ParValue := Tipo_grafico;

  if ParName = 'Ejercicio' then
     ParValue := ejer;

  if ParName = 'Ejercicio2' then
     ParValue := ejercicio2;

  if ParName = 'EnviarEMail' then
     ParValue := EnviarEMail;

  if ParName = 'CPostalD' then
     ParValue := QMCPDesde.FieldByName('CODIGO_POSTAL').AsString;

  if ParName = 'CPostalH' then
     ParValue := QMCPHasta.FieldByName('CODIGO_POSTAL').AsString;

  if ParName = 'PoblacionD' then
     ParValue := QMCPDesde.FieldByName('TITULO').AsString;

  if ParName = 'PoblacionH' then
     ParValue := QMCPHasta.FieldByName('TITULO').AsString;
end;

procedure TDMLSTProveedor.frProveedorEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if Memo[0] = 'Nº' then
        SW := 1;
  end;

  //Estadisticas

  if (SW = 100) then
  begin
     if Clipboard.HasFormat(CF_BITMAP) then
     begin
        (frProveedor.FindObject('Grafica') as TfrPictureView).Picture.Bitmap.Assign(Clipboard);
     end;
  end;
end;

procedure TDMLstProveedor.DameMinMax(var Desde, Hasta: integer);
begin
  with QSeleccion do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT MIN(PROVEEDOR) AS MINIMO,MAX(PROVEEDOR) AS MAXIMO FROM VER_PROVEEDORES_CUENTAS');
     SQL.Add('WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND');
     SQL.Add('EJERCICIO =' + REntorno.EjercicioStr + ' AND');
     SQL.Add('CANAL =' + REntorno.CanalStr);
     ExecQuery;
     Desde := FieldByName['MINIMO'].AsInteger;
     Hasta := FieldByName['MAXIMO'].AsInteger;
     FreeHandle;
  end;
end;

procedure TDMLstProveedor.DameTitulos(var Titulo: string; proveedor: integer);
begin
  with QSeleccion do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT TITULO FROM VER_PROVEEDORES_CUENTAS');
     SQL.Add('WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND');
     SQL.Add('EJERCICIO =' + REntorno.EjercicioStr + ' AND');
     SQL.Add('CANAL =' + REntorno.CanalStr);
     SQL.Add('AND PROVEEDOR =' + IntToStr(proveedor));
     ExecQuery;
     Titulo := FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
end;

// Mostrar Etiquetas de Proveedor
procedure TDMLSTProveedor.MostrarListadoEti(Tercero, vacias, copias, tipo, direcc: integer);
var
  str : string;
begin
  with xEtiquetas do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := Tercero;
     Params.ByName['Direccion'].AsInteger := direcc;
     Params.ByName['Vacias'].AsInteger := vacias;
     Params.ByName['Copias'].AsInteger := copias;
     Open;
  end;
  DMListados.Cargar(61, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frProveedor.LoadFromFIB(REntorno.Formato, str);
     frProveedor.PrepareReport;
     case tipo of
        0: frProveedor.ShowPreparedReport;
        1: frProveedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxProveedor.LoadFromFIB(REntorno.Formato, str);
     frxProveedor.PrepareReport;
     case tipo of
        0: frxProveedor.ShowPreparedReport;
        1: frxProveedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTProveedor.MostrarListadoCPostal(const CPMin, CPMax, OrdenTxt: string; Modo: byte);
var
  str : string;
begin
  with QMProvCP do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_PROVEEDORES_CPOSTAL WHERE ((EMPRESA=?EMPRESA) AND ' +
        '(EJERCICIO=?EJERCICIO) AND (CANAL=?CANAL) AND (COD_POSTAL>=?CP_MIN) AND ' +
        '(COD_POSTAL<=?CP_MAX)) ORDER BY ' + OrdenTxt;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CP_MIN'].AsString := CPMin;
     Params.ByName['CP_MAX'].AsString := CPMax;
  end;

  SW := 1;
  DMListados.Cargar(82, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frProveedor.LoadFromFIB(REntorno.Formato, str);
     frProveedor.PrepareReport;
     case Modo of
        0: frProveedor.ShowPreparedReport;
        1: frProveedor.PrintPreparedReport('', 1);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxProveedor.LoadFromFIB(REntorno.Formato, str);
     frxProveedor.PrepareReport;
     case Modo of
        0: frxProveedor.ShowPreparedReport;
        1: frxProveedor.PrintPreparedReport('', 1);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTProveedor.RefrescaCPDesde(CP: string);
begin
  with QMCPDesde do
  begin
     Close;
     Params.ByName['CP'].AsString := CP;
     Open;
  end;
end;

procedure TDMLSTProveedor.RefrescaCPHasta(CP: string);
begin
  with QMCPHasta do
  begin
     Close;
     Params.ByName['CP'].AsString := CP;
     Open;
  end;
end;

procedure TDMLSTProveedor.DameMinMaxCPostal(var CPMin, CPMax: string);
begin
  with QMinCPostal do
  begin
     Close;
     ExecQuery;
     if (HayDatos) then
        CPMin := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxCPostal do
  begin
     Close;
     ExecQuery;
     if (HayDatos) then
        CPMax := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLSTProveedor.MuestraEstadistica(tipo, ejerc, ejerc2, proveedor: integer; moneda: string; porcent: double);
var
  str : string;
begin
  str := '';
  SW := 100;
  tipo_grafico := tipo;
  ejer := ejerc;
  str := '';
  ejercicio := ejerc;
  ejercicio2 := ejerc2;

  with xTituloProveedor do
  begin
     Close;
     Params.ByName['PROVEEDOR'].AsInteger := proveedor;
     Open;
  end;
  with xFacturasMensual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := proveedor;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FAP';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xFacturasMensualCompara do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := proveedor;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FAP';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xFacturasAnual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FAP';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xFacturasAnualCompara do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FAP';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xFacturasAnualC_1 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 1;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FAP';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xFacturasAnualC_2 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FAP';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xFacturasAnualC_3 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 3;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FAP';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xPrevisionMensual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['PORCENTAJE_VENTAS'].AsDouble := Porcent;
     Params.ByName['TIPO'].AsString := 'FAP';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xPrevisionAnual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['PORCENTAJE_VENTAS'].AsDouble := Porcent;
     Params.ByName['TIPO'].AsString := 'FAP';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  DMListados.Cargar(198, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frProveedor.LoadFromFIB(REntorno.Formato, str);
     frProveedor.PrepareReport;
     frProveedor.ShowPreparedReport;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxProveedor.LoadFromFIB(REntorno.Formato, str);
     frxProveedor.PrepareReport;
     frxProveedor.ShowPreparedReport;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTProveedor.frxProveedorBeforePrint(Sender: TfrxReportComponent);
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
           if Pos('AGRUPACION', Memo[0]) > 0 then
              SW := 1;
        end;

  //Estadisticas
  if (SW = 100) then
     if Clipboard.HasFormat(CF_BITMAP) then
     begin
        (frxProveedor.FindObject('Grafica') as TfrxPictureView).Picture.Bitmap.Assign(Clipboard);
     end;
end;

procedure TDMLSTProveedor.frxProveedorGetValue(const VarName: string; var Value: variant);
begin
  frProveedorGetValue(VarName, Value);
end;

procedure TDMLSTProveedor.DameAgrupacion(var agrupacion: string);
begin
  xMinAgrup.Close;
  xMinAgrup.Open;
  agrupacion := xMinAgrup.FieldByName('AGRUPACION').AsString;
end;

procedure TDMLSTProveedor.TituloAgrupacion(Agrupacion: string);
begin
  with xAgrupacion do
  begin
     Close;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMLSTProveedor.MostrarFiltradoAgrup(Modo: byte; Agrupacion: string; EMail: boolean; Orden: byte);
var
  str, StrOrden : string;
begin
  if (EMail) then
     EnviarEMail := 1
  else
     EnviarEMail := 0;

  case Orden of
     0: StrOrden := 'v.Proveedor';
     1: StrOrden := 'v.Titulo';
  end;

  with QAgrupaciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Params.ByName['TIPO'].AsString := 'P';
     Open;
  end;

  with QProvAgrup do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM ver_proveedores v JOIN emp_agrupaciones_prov e ' +
        'ON ((v.empresa=e.empresa and v.proveedor=e.proveedor)) ' +
        'WHERE ((e.empresa=?empresa) and (v.ejercicio=?ejercicio) and (v.canal=?canal) and ' +
        '(e.agrupacion=?agrupacion)) ORDER BY ' + StrOrden;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  SW := 1;
  DMListados.Cargar(1021, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frProveedor.LoadFromFIB(REntorno.Formato, str);
     frProveedor.PrepareReport;
     case Modo of
        0: frProveedor.ShowPreparedReport;
        1: frProveedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxProveedor.LoadFromFIB(REntorno.Formato, str);
     frxProveedor.PrepareReport;
     case Modo of
        0: frxProveedor.ShowPreparedReport;
        1: frxProveedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTProveedor.QMProveedorAfterOpen(DataSet: TDataSet);
begin
  QMTerceros.Close;
  QMJustifica.Close;
  QMTipoTercero.Close;
  QMIRPF.Close;
  QMIvaModos.Close;
  QMFormasdePago.Close;

  QMTerceros.Open;
  QMJustifica.Open;
  QMTipoTercero.Open;
  QMIRPF.Open;
  QMIvaModos.Open;
  QMFormasdePago.Open;
end;

procedure TDMLSTProveedor.QProvAgrupAfterOpen(DataSet: TDataSet);
begin
  xTerceroAgrupacion.Close;
  xTerceroAgrupacion.Open;
end;

procedure TDMLSTProveedor.QProvAgrupBeforeClose(DataSet: TDataSet);
begin
  xTerceroAgrupacion.Close;
end;

procedure TDMLSTProveedor.QAgrupacionesAfterOpen(DataSet: TDataSet);
begin
  QProvAgrup.Close;
  QProvAgrup.Open;
end;

procedure TDMLSTProveedor.QAgrupacionesBeforeClose(DataSet: TDataSet);
begin
  QProvAgrup.Close;
end;

end.
