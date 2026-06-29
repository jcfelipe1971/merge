unit UDMProyectos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBQuery, FIBDataSetRO, HYFIBQuery,
  FIBTableDataSetRO;

type
  TDMProyectos = class(TDataModule)
     TLocal: THYTransaction;
     QMProyectos: TFIBTableSet;
     DSQMProyectos: TDataSource;
     QMProyectosCANAL_NULL: TIntegerField;
     QMProyectosCLIENTE_NULL: TIntegerField;
     QMProyectosCOMPRAS: TFloatField;
     QMProyectosVENTAS: TFloatField;
     QMProyectosOTROS: TFloatField;
     QMProyectosBENEFICIOS: TFloatField;
     EntornoBusqueda: TEntornoFind2000;
     QMVentas: TFIBTableSet;
     DSQMVentas: TDataSource;
     QMVentasUNIDADES: TFloatField;
     QMVentasUNI_MAX: TFloatField;
     QMVentasIMPORTE: TFloatField;
     QMVentasTOTAL: TFloatField;
     QMCompras: TFIBTableSet;
     DSQMCompras: TDataSource;
     QMComprasUNIDADES: TFloatField;
     QMComprasUNI_MAX: TFloatField;
     QMComprasIMPORTE: TFloatField;
     QMComprasTOTAL: TFloatField;
     xVisorVentas: TFIBTableSetRO;
     DSxVisorVentas: TDataSource;
     QInserciones: THYFIBQuery;
     xVisorVentasDetalle: TFIBTableSetRO;
     DSxVisorVentasDetalle: TDataSource;
     xVisorCompras: TFIBTableSetRO;
     DSVisorCompras: TDataSource;
     xVisorComprasDetalle: TFIBTableSetRO;
     DSxVisorComprasDetalle: TDataSource;
     DSQMOtros: TDataSource;
     QMOtros: TFIBTableSet;
     QMOtrosUNIDADES: TFloatField;
     QMOtrosIMPORTE: TFloatField;
     QMOtrosTOTAL: TFloatField;
     QMProyectosPROYECTO: TIntegerField;
     QMProyectosFECHA_INICIO: TDateTimeField;
     QMProyectosFECHA_FINAL: TDateTimeField;
     QMProyectosTITULO: TFIBStringField;
     QMProyectosNOTAS: TBlobField;
     QMProyectosCERRADO: TIntegerField;
     QMComprasEJERCICIO: TIntegerField;
     QMComprasCANAL: TIntegerField;
     QMComprasSERIE: TFIBStringField;
     QMComprasTIPO: TFIBStringField;
     QMComprasRIG: TIntegerField;
     QMComprasLINEA: TIntegerField;
     QMComprasARTICULO: TFIBStringField;
     QMComprasTITULO: TFIBStringField;
     QMComprasAFEC_TOTAL: TIntegerField;
     QMVentasEJERCICIO: TIntegerField;
     QMVentasCANAL: TIntegerField;
     QMVentasSERIE: TFIBStringField;
     QMVentasTIPO: TFIBStringField;
     QMVentasRIG: TIntegerField;
     QMVentasLINEA: TIntegerField;
     QMVentasARTICULO: TFIBStringField;
     QMVentasTITULO: TFIBStringField;
     QMVentasAFEC_TOTAL: TIntegerField;
     QMOtrosLINEA: TIntegerField;
     QMOtrosFECHA: TDateTimeField;
     QMOtrosTITULO: TFIBStringField;
     QMOtrosMONEDA: TFIBStringField;
     QMOtrosNOTAS: TBlobField;
     QMProyectosEMPRESA: TIntegerField;
     QMOtrosEMPRESA: TIntegerField;
     QMOtrosPROYECTO: TIntegerField;
     QMComprasEMPRESA: TIntegerField;
     QMComprasPROYECTO: TIntegerField;
     QMVentasEMPRESA: TIntegerField;
     QMVentasPROYECTO: TIntegerField;
     xPlanContableOrigen: TFIBDataSetRO;
     DSxPlanContableOrigen: TDataSource;
     QMProyectosCONTABILIDAD_ANALITICA: TIntegerField;
     QMProyectosPLAN_CONTABLE: TFIBStringField;
     QMProyectosSUFIJO_CONTABLE: TFIBStringField;
     QMProyectosINDICE_SUFIJO: TIntegerField;
     QMProyectosACTUALIZA_ESTRUCTURA_ANALITICA: TIntegerField;
     TUpdate: THYTransaction;
     QMOfertas: TFIBTableSet;
     DSQMOfertas: TDataSource;
     QMOfertasEMPRESA: TIntegerField;
     QMOfertasEJERCICIO: TIntegerField;
     QMOfertasCANAL: TIntegerField;
     QMOfertasSERIE: TFIBStringField;
     QMOfertasTIPO: TFIBStringField;
     QMOfertasRIG: TIntegerField;
     QMOfertasPROYECTO: TIntegerField;
     QMOfertasTOTAL: TFloatField;
     QMOfertasSU_REFERENCIA: TFIBStringField;
     QMOtrosUSUARIO: TIntegerField;
     QMProyectosID_P: TIntegerField;
     QMProyectosCODIGO_INTERNO: TFIBStringField;
     QMProyectosTERCERO_NULL: TIntegerField;
     QMProyectosKILOMETROS_DESTINO: TFloatField;
     QMProyectosDIRECCION_TERCERO_NULL: TIntegerField;
     QMProyectosSERIE: TFIBStringField;
     QMProyectosTITULO_DIRECCION: TFIBStringField;
     QMProyectosCODIGO_POSTAL: TFIBStringField;
     QMProyectosTITULO_LOCALIDAD: TFIBStringField;
     QMProyectosTITULO_PROVINCIA: TFIBStringField;
     QMProyectosTITULO_PAIS: TFIBStringField;
     QMVentasID_DETALLES_S: TIntegerField;
     QMVentasID_S: TIntegerField;
     QMComprasID_DETALLES_E: TIntegerField;
     QMComprasID_E: TIntegerField;
     QMProyectosHORARIO_1_DESDE: TDateTimeField;
     QMProyectosHORARIO_1_HASTA: TDateTimeField;
     QMProyectosHORARIO_2_DESDE: TDateTimeField;
     QMProyectosHORARIO_2_HASTA: TDateTimeField;
     QMReparaciones: TFIBTableSet;
     DSQMReparaciones: TDataSource;
     QMReparacionesEMPRESA: TIntegerField;
     QMReparacionesEJERCICIO: TIntegerField;
     QMReparacionesCANAL: TIntegerField;
     QMReparacionesSERIE: TFIBStringField;
     QMReparacionesREPARACION: TIntegerField;
     QMReparacionesPROYECTO: TIntegerField;
     QMReparacionesFECHA_ENTRADA: TDateTimeField;
     QMReparacionesFECHA_SALIDA: TDateTimeField;
     QMReparacionesARTICULO: TFIBStringField;
     QMReparacionesUNIDADES: TFloatField;
     QMReparacionesPRECIO_VENTA: TFloatField;
     QMReparacionesTOTAL: TFloatField;
     QMReparacionesIDCABREPARAR: TIntegerField;
     QMReparacionesLINEA: TIntegerField;
     QMReparacionesTITULO_ART: TFIBStringField;
     QMOfertasID_S: TIntegerField;
     QMReparacionesTIPO: TIntegerField;
     QMReparacionesTITULO_TIPO: TFIBStringField;
     QMVentasFECHA: TDateTimeField;
     QMComprasFECHA: TDateTimeField;
     QMOrdenes: TFIBTableSet;
     DSQMOrdenes: TDataSource;
     QMOrdenesID_ORDEN: TIntegerField;
     QMOrdenesEMPRESA: TIntegerField;
     QMOrdenesEJERCICIO: TIntegerField;
     QMOrdenesCANAL: TIntegerField;
     QMOrdenesSERIES: TFIBStringField;
     QMOrdenesRIG_OF: TIntegerField;
     QMOrdenesFECHA_ORD: TDateTimeField;
     QMOrdenesCOMPUESTO: TFIBStringField;
     QMOrdenesSITUACION: TIntegerField;
     QMOrdenesTITULO_SITUACION: TStringField;
     QMProyectosAGENTE_NULL: TIntegerField;
     QMProyectosNIF: TFIBStringField;
     QMProyectosNOMBRE_R_SOCIAL: TFIBStringField;
     QMProyectosNOMBRE_AGENTE: TFIBStringField;
     QMProyectosDIRECCION_MANUAL: TMemoField;
     DSQMEmpleados: TDataSource;
     QMEmpleados: TFIBTableSet;
     QMEmpleadosEMPRESA: TIntegerField;
     QMEmpleadosPROYECTO: TIntegerField;
     QMEmpleadosLINEA: TIntegerField;
     QMEmpleadosFECHA: TDateTimeField;
     QMEmpleadosEMPLEADO: TIntegerField;
     QMEmpleadosTITULO: TFIBStringField;
     QMEmpleadosUNIDADES: TFloatField;
     QMEmpleadosIMPORTE: TFloatField;
     QMEmpleadosNOTAS: TMemoField;
     QMEmpleadosID_EMPLEADO: TIntegerField;
     QMEmpleadosTOTAL: TFloatField;
     QMProyectosEMPLEADOS: TFloatField;
     QMVentasTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMVentasFOLIO: TIntegerField;
     QMVentasNIF: TFIBStringField;
     QMComprasRAZON_SOCIAL: TFIBStringField;
     QMVentasRAZON_SOCIAL: TFIBStringField;
     QMOfertasTITULO: TFIBStringField;
     procedure DMProyectosCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMProyectosAfterOpen(DataSet: TDataSet);
     procedure QMProyectosNewRecord(DataSet: TDataSet);
     procedure QMProyectosBeforePost(DataSet: TDataSet);
     procedure xVisorComprasAfterOpen(DataSet: TDataSet);
     procedure xVisorVentasAfterOpen(DataSet: TDataSet);
     procedure QMOtrosBeforePost(DataSet: TDataSet);
     procedure QMOtrosNewRecord(DataSet: TDataSet);
     procedure QMProyectosPLAN_CONTABLEChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMProyectosTERCERO_NULLChange(Sender: TField);
     procedure QMOrdenesCalcFields(DataSet: TDataSet);
     procedure QMEmpleadosNewRecord(DataSet: TDataSet);
     procedure QMEmpleadosBeforePost(DataSet: TDataSet);
     procedure QMEmpleadosEMPLEADOChange(Sender: TField);
  private
     { Private declarations }
     procedure MontaCabeceraDeInsercion(Tipo: char; SQL: TStrings);
  public
     { Public declarations }
     procedure InsDocCompras;
     procedure InsDocVentas;
     procedure InsercionesVentas(Linea: integer);
     procedure InsercionesCompras(Linea: integer);
     procedure BusquedaCompleja;
     procedure DestruyePlanContable;
     procedure RefrescaTabla;
     procedure AbrirPestanya(TabIndex: integer);
     procedure Filtra(Proyecto: integer);
     procedure FiltraVentas(TipoDocumento: string);
     procedure FiltraCompras(TipoDocumento: string);
     procedure AsignaHistorico;
  end;

var
  DMProyectos : TDMProyectos;

implementation

uses UDMMain, UEntorno, UFSelecProyectosVentas, UFSelecProyectosCompras,
  uFBusca, UFParadaExt, UUtiles, DateUtils, UDameDato;

{$R *.DFM}

procedure TDMProyectos.DMProyectosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  EntornoBusqueda.Empresa := REntorno.Empresa;
  EntornoBusqueda.Ejercicio := REntorno.Ejercicio;

  AsignaDisplayFormat(QMProyectos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCompras, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMVentas, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMOtros, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMEmpleados, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMOfertas, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMReparaciones, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMOrdenes, MascaraN, MascaraI, ShortDateFormat);

  QMProyectosHORARIO_1_DESDE.DisplayFormat := ShortTimeFormat;
  QMProyectosHORARIO_1_HASTA.DisplayFormat := ShortTimeFormat;
  QMProyectosHORARIO_2_DESDE.DisplayFormat := ShortTimeFormat;
  QMProyectosHORARIO_2_HASTA.DisplayFormat := ShortTimeFormat;

  DMMain.FiltraTabla(QMProyectos, '10000', True);
end;

procedure TDMProyectos.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMProyectos.Graba(DataSet: TDataSet);
begin
  RefrescaTabla;
end;

procedure TDMProyectos.QMProyectosAfterOpen(DataSet: TDataSet);
begin
  xPlanContableOrigen.Open;
end;

procedure TDMProyectos.QMProyectosNewRecord(DataSet: TDataSet);
begin
  with QMProyectos do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('CANAL_NULL').Clear;
     FieldByName('CLIENTE_NULL').Clear;
     FieldByName('AGENTE_NULL').Clear;
     FieldByName('FECHA_INICIO').AsDateTime := REntorno.FechaTrab;
     FieldByName('CERRADO').AsInteger := 0;
     FieldByName('HORARIO_1_DESDE').AsDateTime := EncodeDateTime(2000, 1, 1, 0, 0, 0, 0);
     FieldByName('HORARIO_1_HASTA').AsDateTime := EncodeDateTime(2000, 1, 1, 23, 59, 59, 0);
     FieldByName('HORARIO_2_DESDE').AsDateTime := EncodeDateTime(2000, 1, 1, 0, 0, 0, 0);
     FieldByName('HORARIO_2_HASTA').AsDateTime := EncodeDateTime(2000, 1, 1, 23, 59, 59, 0);
  end;
end;

procedure TDMProyectos.QMProyectosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     if (QMProyectos.FieldByName('PROYECTO').AsInteger = 0) then
        QMProyectos.FieldByName('PROYECTO').AsInteger := DMMain.Contador_E('PRY');
     DMMain.Contador_Gen(DataSet, 'ID_PROYECTO', 'ID_P');
  end;

  if (QMProyectosINDICE_SUFIJO.AsString <= '') then
     QMProyectosINDICE_SUFIJO.AsInteger := 0;

  if (QMProyectosCANAL_NULL.AsString <= '') then
     QMProyectosCANAL_NULL.AsInteger := 0;

  if (QMProyectosCLIENTE_NULL.AsString <= '') then
     QMProyectosCLIENTE_NULL.AsInteger := 0;

  if (QMProyectosAGENTE_NULL.AsString <= '') then
     QMProyectosAGENTE_NULL.AsInteger := 0;

  // La parte fecha siempre será 01/01/200
  QMProyectosHORARIO_1_DESDE.AsDateTime := RecodeDate(QMProyectosHORARIO_1_DESDE.AsDateTime, 2000, 1, 1);
  QMProyectosHORARIO_1_HASTA.AsDateTime := RecodeDate(QMProyectosHORARIO_1_HASTA.AsDateTime, 2000, 1, 1);
  QMProyectosHORARIO_2_DESDE.AsDateTime := RecodeDate(QMProyectosHORARIO_2_DESDE.AsDateTime, 2000, 1, 1);
  QMProyectosHORARIO_2_HASTA.AsDateTime := RecodeDate(QMProyectosHORARIO_2_HASTA.AsDateTime, 2000, 1, 1);
end;

procedure TDMProyectos.InsDocCompras;
begin
  with xVisorCompras do
  begin
     Close;
     MontaCabeceraDeInsercion('C', SelectSQL);
     Open;
  end;

  TFSelecProyectosCompras.Create(Self).ShowModal;
end;

procedure TDMProyectos.InsDocVentas;
begin
  with xVisorVentas do
  begin
     Close;
     MontaCabeceraDeInsercion('V', SelectSQL);
     Open;
  end;

  TFSelecProyectosVentas.Create(Self).ShowModal;
end;

procedure TDMProyectos.MontaCabeceraDeInsercion(Tipo: char; SQL: TStrings);
var
  Can, Age, Cli : integer;
begin
  SQL.Clear;
  Can := QMProyectos.FieldByName('CANAL_NULL').AsInteger;
  Cli := QMProyectos.FieldByName('CLIENTE_NULL').AsInteger;
  Age := QMProyectos.FieldByName('AGENTE_NULL').AsInteger;

  // Compras
  if (Tipo = 'C') then
  begin
     // Cabeceras
     SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, TIPO, SERIE, RIG, FECHA, PROVEEDOR, NOMBRE_COMERCIAL, S_BASES, ID_E ');
     SQL.Add(' FROM VER_CABECERAS_FACTURA_PROV ');
     SQL.Add(' WHERE ');
     SQL.Add(' EMPRESA = ' + REntorno.EmpresaStr);
     if (Can > 0) then
        SQL.Add(' AND CANAL = ' + QMProyectos.FieldByName('CANAL_NULL').AsString);
     SQL.Add(' UNION ');
     SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, TIPO, SERIE, RIG, FECHA, ACREEDOR PROVEEDOR, NOMBRE_COMERCIAL, S_BASES, ID_E ');
     SQL.Add(' FROM VER_CABECERAS_FACTURA_ACR ');
     SQL.Add(' WHERE ');
     SQL.Add(' EMPRESA = ' + REntorno.EmpresaStr);
     if (Can > 0) then
        SQL.Add(' AND CANAL = ' + QMProyectos.FieldByName('CANAL_NULL').AsString);
     SQL.Add(' ORDER BY 2 /*EJERCICIO*/ DESC, 3 /*CANAL*/, 5 /*SERIE*/, 6 /*RIG*/ DESC, 8/*PROVEEDOR/ACREEDOR*/ ');
  end;

  // Ventas
  if (Tipo = 'V') then
  begin
     SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, TIPO, SERIE, RIG, FECHA, CLIENTE, ');
     SQL.Add(' NOMBRE_COMERCIAL, B_COMISION, ID_S ');
     SQL.Add(' FROM VER_CABECERAS_FACTURA ');
     SQL.Add(' WHERE ');
     SQL.Add(' EMPRESA = ' + REntorno.EmpresaStr);
     if (Can > 0) then
        SQL.Add(' AND CANAL = ' + QMProyectos.FieldByName('CANAL_NULL').AsString);
     if (Cli > 0) then
        SQL.Add(' AND CLIENTE = ' + QMProyectos.FieldByName('CLIENTE_NULL').AsString);
     if (Age > 0) then
        SQL.Add(' AND AGENTE = ' + QMProyectos.FieldByName('AGENTE_NULL').AsString);
     SQL.Add(' ORDER BY EJERCICIO DESC, CANAL, SERIE, RIG DESC, CLIENTE ');
  end;
end;

procedure TDMProyectos.InsercionesVentas(Linea: integer);
begin
  if (Linea <> 0) then
     Linea := xVisorVentasDetalle.FieldByName('LINEA').AsInteger;

  with QInserciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['PROYECTO'].AsInteger := QMProyectos.FieldByName('PROYECTO').AsInteger;
     Params.ByName['EJERCICIO'].AsInteger :=
        xVisorVentas.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := xVisorVentas.FieldByName('CANAL').AsInteger;
     Params.ByName['SERIE'].AsString := xVisorVentas.FieldByName('SERIE').AsString;
     Params.ByName['TIPO'].AsString := xVisorVentas.FieldByName('TIPO').AsString;
     Params.ByName['RIG'].AsInteger := xVisorVentas.FieldByName('RIG').AsInteger;
     Params.ByName['LINEA'].AsInteger := Linea;
     Params.ByName['ID'].AsInteger := xVisorVentas.FieldByName('ID_S').AsInteger;
     ExecQuery;
     FreeHandle;
  end;

  QMProyectos.Refresh;

  if (Linea <> 0) then
     Posicionar(QMVentas, 'ID_DETALLES_S', xVisorVentasDetalle.FieldByName('ID_DETALLES_S').AsInteger)
  else
     Posicionar(QMVentas, 'ID_S', xVisorVentas.FieldByName('ID_S').AsInteger);
end;

procedure TDMProyectos.InsercionesCompras(Linea: integer);
begin
  if (Linea <> 0) then
     Linea := xVisorComprasDetalle.FieldByName('LINEA').AsInteger;

  with QInserciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['PROYECTO'].AsInteger := QMProyectos.FieldByName('PROYECTO').AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := xVisorCompras.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := xVisorCompras.FieldByName('CANAL').AsInteger;
     Params.ByName['SERIE'].AsString := xVisorCompras.FieldByName('SERIE').AsString;
     Params.ByName['TIPO'].AsString := xVisorCompras.FieldByName('TIPO').AsString;
     Params.ByName['RIG'].AsInteger := xVisorCompras.FieldByName('RIG').AsInteger;
     Params.ByName['LINEA'].AsInteger := Linea;
     Params.ByName['ID'].AsInteger := xVisorCompras.FieldByName('ID_E').AsInteger;
     ExecQuery;
     FreeHandle;
  end;

  QMProyectos.Refresh;

  if (Linea <> 0) then
     Posicionar(QMCompras, 'ID_DETALLES_E', xVisorComprasDetalle.FieldByName('ID_DETALLES_E').AsInteger)
  else
     Posicionar(QMCompras, 'ID_E', xVisorCompras.FieldByName('ID_E').AsInteger);
end;

procedure TDMProyectos.xVisorComprasAfterOpen(DataSet: TDataSet);
begin
  xVisorComprasDetalle.Open;
end;

procedure TDMProyectos.xVisorVentasAfterOpen(DataSet: TDataSet);
begin
  xVisorVentasDetalle.Open;
end;

procedure TDMProyectos.QMOtrosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMOtros.FieldByName('LINEA').AsInteger := DMMain.Contador_GEN(DataSet, 'CONTA_PRY_OTROS', 'LINEA');
end;

procedure TDMProyectos.QMOtrosNewRecord(DataSet: TDataSet);
begin
  with QMOtros do
  begin
     FieldByName('EMPRESA').AsInteger := QMProyectos.FieldByName('EMPRESA').AsInteger;
     FieldByName('PROYECTO').AsInteger := QMProyectos.FieldByName('PROYECTO').AsInteger;
     FieldByName('MONEDA').AsString := REntorno.Moneda;
     FieldByName('FECHA').AsDateTime := REntorno.FechaTrabSH;
     FieldByName('USUARIO').AsInteger := REntorno.Usuario;
     FieldByName('UNIDADES').AsFloat := 1;
  end;
end;

procedure TDMProyectos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProyectos, '10000');
end;

procedure TDMProyectos.QMProyectosPLAN_CONTABLEChange(Sender: TField);
begin
  xPlanContableOrigen.Close;
  xPlanContableOrigen.Open;
end;

procedure TDMProyectos.DestruyePlanContable;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := '  EXECUTE PROCEDURE ANA_DESTRUYE_CONT_PROYECTO (:EMPRESA, :PROYECTO)';
        Params.ByName['EMPRESA'].AsInteger := QMProyectosEMPRESA.AsInteger;
        Params.ByName['PROYECTO'].AsInteger := QMProyectosPROYECTO.AsInteger;
        with TFParadaExt.Create(Self) do
        begin
           try
              repeat
              until ExecQuery(Q, _('Atención:'), 30000);
           finally
              Free;
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMProyectos.RefrescaTabla;
var
  LineaOtros : integer;
  LineaEmpleados : integer;
  IdDetalleCompras : integer;
  IdDetalleVenta : integer;
  IdReparaciones : integer;
  IdOrden : integer;
  IdOferta : integer;
begin
  LineaOtros := QMOtrosLINEA.AsInteger;
  LineaEmpleados := QMEmpleadosLINEA.AsInteger;
  IdDetalleCompras := QMComprasID_DETALLES_E.AsInteger;
  IdDetalleVenta := QMVentasID_DETALLES_S.AsInteger;
  IdReparaciones := QMReparacionesIDCABREPARAR.AsInteger;
  IdOrden := QMOrdenesID_ORDEN.AsInteger;
  IdOferta := QMOfertasID_S.AsInteger;

  Refrescar(QMProyectos, 'PROYECTO', QMProyectosPROYECTO.AsInteger);

  if (QMOtros.Active) then
     Refrescar(QMOtros, 'LINEA', LineaOtros);
  if (QMCompras.Active) then
     Refrescar(QMCompras, 'ID_DETALLES_E', IdDetalleCompras);
  if (QMVentas.Active) then
     Refrescar(QMVentas, 'ID_DETALLES_S', IdDetalleVenta);
  if (QMReparaciones.Active) then
     Refrescar(QMReparaciones, 'IDCABREPARAR', IdReparaciones);
  if (QMOrdenes.Active) then
     Refrescar(QMOrdenes, 'ID_ORDEN', IdOrden);
  if (QMOfertas.Active) then
     Refrescar(QMOfertas, 'ID_S', IdOferta);
  if (QMEmpleados.Active) then
     Refrescar(QMEmpleados, 'LINEA', LineaEmpleados);
end;

procedure TDMProyectos.AbrirPestanya(TabIndex: integer);
begin
  QMOfertas.Close;
  QMVentas.Close;
  QMCompras.Close;
  QMOtros.Close;
  QMEmpleados.Close;
  QMReparaciones.Close;
  QMOrdenes.Close;

  case (TabIndex) of
     1: QMOfertas.Open;
     2: QMCompras.Open;
     3: QMVentas.Open;
     4: QMOtros.Open;
     5: QMReparaciones.Open;
     6: QMOrdenes.Open;
     7: QMEmpleados.Open;
  end;
end;

procedure TDMProyectos.QMProyectosTERCERO_NULLChange(Sender: TField);
begin
  QMProyectosDIRECCION_TERCERO_NULL.AsInteger := DameDireccionDefecto(QMProyectosTERCERO_NULL.AsInteger);
end;

procedure TDMProyectos.Filtra(Proyecto: integer);
begin
  // Filtro el SQL
  with QMProyectos do
  begin
     if Active then
        Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_EMP_PROYECTOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' PROYECTO = ?PROYECTO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['PROYECTO'].AsInteger := Proyecto;
     Open;
  end;
end;

procedure TDMProyectos.AsignaHistorico;
var
  CuantasVentas, CuantasCompras : integer;
begin
  // Ventas
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CUANTOS FROM E_PROYECTOS_ASIGNA_HISTORICO (:EMPRESA, 1) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        CuantasVentas := FieldByName['CUANTOS'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Compras
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CUANTOS FROM E_PROYECTOS_ASIGNA_HISTORICO (:EMPRESA, 2) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        CuantasCompras := FieldByName['CUANTOS'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(Format(_('Proceso de asignación de histórico de proyectos finalizado.') + #13#10 + _('Asignación nuevas en detalles de ventas: %d') + #13#10 + _('Asignación nuevas en detalles de compras: %d'), [CuantasVentas, CuantasCompras]));

  RefrescaTabla;
end;

procedure TDMProyectos.FiltraVentas(TipoDocumento: string);
begin
  with QMVentas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_PRY_VENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' PROYECTO = ?PROYECTO ');
     if (TipoDocumento <> 'ALL') then
        SelectSQL.Add(' AND TIPO = :DOCTIPO ');
     SelectSQL.Add(' ORDER BY EMPRESA, CANAL, EJERCICIO DESC, TIPO, SERIE, RIG DESC, LINEA ');
     Params.ByName['EMPRESA'].AsInteger := QMProyectosEMPRESA.AsInteger;
     Params.ByName['PROYECTO'].AsInteger := QMProyectosPROYECTO.AsInteger;
     if (TipoDocumento <> 'ALL') then
        Params.ByName['DOCTIPO'].AsString := TipoDocumento;
     Open;
  end;
end;

procedure TDMProyectos.FiltraCompras(TipoDocumento: string);
begin
  with QMCompras do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_PRY_COMPRAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' PROYECTO = ?PROYECTO ');
     if (TipoDocumento <> 'ALL') then
        SelectSQL.Add(' AND TIPO = :DOCTIPO ');
     SelectSQL.Add(' ORDER BY EMPRESA, CANAL, EJERCICIO DESC, TIPO, SERIE, RIG DESC, LINEA ');
     Params.ByName['EMPRESA'].AsInteger := QMProyectosEMPRESA.AsInteger;
     Params.ByName['PROYECTO'].AsInteger := QMProyectosPROYECTO.AsInteger;
     if (TipoDocumento <> 'ALL') then
        Params.ByName['DOCTIPO'].AsString := TipoDocumento;
     Open;
  end;
end;

procedure TDMProyectos.QMOrdenesCalcFields(DataSet: TDataSet);
begin
  QMOrdenesTITULO_SITUACION.AsString := DameTituloSituacionProduccion(QMOrdenesSITUACION.AsInteger);
end;

procedure TDMProyectos.QMEmpleadosNewRecord(DataSet: TDataSet);
begin
  with QMEmpleados do
  begin
     FieldByName('EMPRESA').AsInteger := QMProyectos.FieldByName('EMPRESA').AsInteger;
     FieldByName('PROYECTO').AsInteger := QMProyectos.FieldByName('PROYECTO').AsInteger;
     FieldByName('FECHA').AsDateTime := REntorno.FechaTrabSH;
     FieldByName('UNIDADES').AsFloat := 1;
  end;
end;

procedure TDMProyectos.QMEmpleadosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMEmpleados.FieldByName('LINEA').AsInteger := DMMain.Contador_GEN(DataSet, 'CONTA_PRY_EMPLEADOS', 'LINEA');
end;

procedure TDMProyectos.QMEmpleadosEMPLEADOChange(Sender: TField);
begin
  QMEmpleadosTITULO.AsString := DameTituloEmpleado(QMEmpleadosEMPLEADO.AsInteger);
end;

end.
