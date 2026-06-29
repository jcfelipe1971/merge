unit UDMNomConstantes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery, FIBDataSetRO;

type
  TDMNomConstantes = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMNomConstantes: TDataSource;
     QMNomConstantes: TFIBTableSet;
     DSPeriodos: TDataSource;
     xPeriodos: TFIBTableSet;
     xPeriodosEMPRESA: TIntegerField;
     xPeriodosEJERCICIO: TIntegerField;
     xPeriodosPERIODO: TFIBStringField;
     xPeriodosTITULO: TFIBStringField;
     xPeriodosDESDE: TDateTimeField;
     xPeriodosHASTA: TDateTimeField;
     QMNomConstantesID: TIntegerField;
     QMNomConstantesEMPRESA: TIntegerField;
     QMNomConstantesEJERCICIO: TIntegerField;
     QMNomConstantesCANAL: TIntegerField;
     QMNomConstantesPERIODO: TFIBStringField;
     QMNomConstantesCODIGO: TFIBStringField;
     QMNomConstantesIMPORTE: TFloatField;
     QMNomConstantesDATO_TEXTO: TFIBStringField;
     QMNomConstantesGLOSA: TFIBStringField;
     QMNomConstantesTIPO_DATO: TFIBStringField;
     QMAFPIndicadores: TFIBTableSet;
     QMAFPIndicadoresEMPRESA: TIntegerField;
     QMAFPIndicadoresEJERCICIO: TIntegerField;
     QMAFPIndicadoresCANAL: TIntegerField;
     QMAFPIndicadoresPERIODO: TFIBStringField;
     QMAFPIndicadoresCODIGO: TFIBStringField;
     QMAFPIndicadoresGLOSA: TFIBStringField;
     QMAFPIndicadoresTASA_AFP_DEPENDIENTE: TFloatField;
     QMAFPIndicadoresTASA_SIS_DEPENDIENTE: TFloatField;
     QMAFPIndicadoresTASA_AFP_INDEPENDIENTE: TFloatField;
     DSQMAFPIndicadores: TDataSource;
     xInfoActualizada: TFIBDataSet;
     DSxInfoActualizada: TDataSource;
     QMTramosRenta: TFIBTableSet;
     DSQMTramosRenta: TDataSource;
     QMTramosRentaID: TIntegerField;
     QMTramosRentaEMPRESA: TIntegerField;
     QMTramosRentaEJERCICIO: TIntegerField;
     QMTramosRentaCANAL: TIntegerField;
     QMTramosRentaPERIODO: TFIBStringField;
     QMTramosRentaDESDE: TFloatField;
     QMTramosRentaHASTA: TFloatField;
     QMTramosRentaFACTOR: TFloatField;
     QMTramosRentaREBAJAR: TFloatField;
     QMTramosRentaMAXIMO: TFloatField;
     QMTramosRentaPERIDOCIDAD: TFIBStringField;
     xInfoActualizadaCANTIDAD_EMPLEADOS: TIntegerField;
     xInfoActualizadaNOMINAS_PERIODO: TIntegerField;
     xInfoActualizadaNOMINAS_CERRADAS: TIntegerField;
     xInfoActualizadaNOMINAS_PENDIENTES: TIntegerField;
     xInfoActualizadaTOTAL_LIQUIDO: TFloatField;
     xNominas: TFIBDataSetRO;
     DSxNominas: TDataSource;
     xEmpleadoNomina: TFIBDataSetRO;
     DSxEmpleadoNomina: TDataSource;
     xEmpresa: TFIBDataSetRO;
     DSxEmpresa: TDataSource;
     xContrato: TFIBDataSetRO;
     DSxContrato: TDataSource;
     DSxNomDetHaberes: TDataSource;
     xNomDetHaberes: TFIBDataSetRO;
     xNomDetDescuentos: TFIBDataSetRO;
     xNomDetParametros: TFIBDataSetRO;
     DSxNomDetDescuentos: TDataSource;
     DSxNomDetParametros: TDataSource;
     DSQPagos: TDataSource;
     QPagos: TFIBTableSet;
     QPagosRUT: TFIBStringField;
     QPagosNOMBRE: TFIBStringField;
     QPagosMOD_PAGO: TIntegerField;
     QPagosCORREO: TFIBStringField;
     QPagosPERIODO: TFIBStringField;
     QPagosEJERCICIO: TIntegerField;
     QPagosMONTO: TFloatField;
     QPagosID: TIntegerField;
     QPagosPAGADO: TIntegerField;
     QPagosm: TIntegerField;
     QPagosCTA_EMPLEADO: TFIBStringField;
     QPagosCUENTA_PAGO: TFIBStringField;
     QPagosFECHA_PAGO: TDateTimeField;
     QPagosRIC_PAGO: TIntegerField;
     QPagosEJERCICIO_PAGO: TIntegerField;
     QPagosESTADO: TIntegerField;
     QPagosTOTAL_LIQUIDO_BANCO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMNomConstantesBeforePost(DataSet: TDataSet);
     procedure xPeriodosAfterOpen(DataSet: TDataSet);
     procedure xPeriodosBeforeClose(DataSet: TDataSet);
     procedure QMTramosRentaNewRecord(DataSet: TDataSet);
     procedure xInfoActualizadaCalcFields(DataSet: TDataSet);
     procedure xNominasAfterOpen(DataSet: TDataSet);
     procedure xNominasBeforeClose(DataSet: TDataSet);
     procedure xEmpleadoNominaAfterOpen(DataSet: TDataSet);
     procedure xEmpleadoNominaBeforeClose(DataSet: TDataSet);
     procedure QMNomConstantesIMPORTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure PagaNomina(Id: integer; Fecha: TDateTime; Cuenta: string);
     procedure QPagosCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     procedure InfoActualiza;
     procedure DespagarPago(Id: integer);
  public
     { Public declarations }
     Banco: integer;
     procedure Filtrar(periodo: string);
     procedure CrearConstantes;
     procedure CrearAFP;
     procedure CrearTramos;
     procedure CrearNominas;
     procedure ExportarExcel(Archivo: string; Banco: integer);
     procedure ContabilizaNominas(Estado: integer);
     procedure InicializaNominasEjercicio;
     function DameCajaCompensacion: string;
     function ExistenNominasPeriodo(Periodo: string): boolean;
     procedure AbreNominas;
     procedure CierraNominas;
     function DameImporteParametro(Codigo: string): double;
     function DameImporteHaberes(Codigo: string): double;
     function DameImporteDescuentos(Codigo: string): double;
     procedure DameConstantes(Periodo: string; var UF, UTM, UTSR: double);
     procedure SetConstantes(Periodo: string; Constante: integer; Importe: double);
     function ValorConstantePeriodoAnterior(aPeriodo: string; Constante: integer): double;
     procedure SeleccionarPagos(Seleccion: integer);
     procedure PagarNominasPeriodo(Banco: integer);
     procedure DespagarPagosNominasPeriodo;
     procedure DespagarPagosSeleccionados;
     function HayMarca: boolean;
  end;

var
  DMNomConstantes : TDMNomConstantes;
  Periodo : string;

implementation

uses UDMMain, UFBusca, Controls, UEntorno, DateUtils, UUtiles, UHojaCalc, Graphics,
  UDMNominasCabecera, UFormGest, UFMNomConstantes, UFMSeleccion, UDameDato;

{$R *.dfm}

procedure TDMNomConstantes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xPeriodos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QPagos, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(xPeriodos, '11000', True);
  Posicionar(xPeriodos, 'PERIODO', Format('%2.2d', [MonthOf(Today)]));

  Banco := -1;
end;

procedure TDMNomConstantes.CrearAFP;
var
  Ejercicio : integer;
  Periodo : string;
begin
  /// Copia los valores del periodo anterior (si existe) a este periodo.

  if (xPeriodosPERIODO.AsString > '01') then
  begin
     Ejercicio := xPeriodosEJERCICIO.AsInteger;
     Periodo := Format('%2.2d', [StrToInt(xPeriodosPERIODO.AsString) - 1]);
  end
  else
  begin
     Ejercicio := xPeriodosEJERCICIO.AsInteger - 1;
     Periodo := '12';
  end;

  // Primero creo las AFP que no existan
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO EMP_AFP_INDICADORES ( ');
        SQL.Add(' EMPRESA, EJERCICIO, CANAL, PERIODO, CODIGO_AFP) ');
        SQL.Add(' SELECT :EMPRESA, :EJERCICIO, :CANAL, :PERIODO, E.CODIGO ');
        SQL.Add(' FROM SYS_EQUIVALENCIAS_PREVIRED E ');
        SQL.Add(' WHERE ');
        SQL.Add(' E.ID_CLASIFICACION = 10 AND ');
        SQL.Add(' NOT EXISTS(SELECT CODIGO_AFP ');
        SQL.Add('            FROM EMP_AFP_INDICADORES ');
        SQL.Add('            WHERE ');
        SQL.Add('            EMPRESA = :EMPRESA AND ');
        SQL.Add('            EJERCICIO = :EJERCICIO AND ');
        SQL.Add('            CANAL = :CANAL AND ');
        SQL.Add('            PERIODO = :PERIODO AND ');
        SQL.Add('            CODIGO_AFP = E.CODIGO)');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Ahora relleno valores del periodo anterior
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_AFP_INDICADORES C ');
        SQL.Add(' SET ');
        SQL.Add(' C.TASA_AFP_DEPENDIENTE = COALESCE((SELECT TASA_AFP_DEPENDIENTE ');
        SQL.Add('                                    FROM EMP_AFP_INDICADORES ');
        SQL.Add('                                    WHERE ');
        SQL.Add('                                    EMPRESA = C.EMPRESA AND ');
        SQL.Add('                                    EJERCICIO = :EJERCICIO_ORI AND ');
        SQL.Add('                                    CANAL = C.CANAL AND ');
        SQL.Add('                                    PERIODO = :PERIODO_ORI AND ');
        SQL.Add('                                    CODIGO_AFP = C.CODIGO_AFP), 0), ');
        SQL.Add(' C.TASA_SIS_DEPENDIENTE = COALESCE((SELECT TASA_SIS_DEPENDIENTE ');
        SQL.Add('                                    FROM EMP_AFP_INDICADORES ');
        SQL.Add('                                    WHERE ');
        SQL.Add('                                    EMPRESA = C.EMPRESA AND ');
        SQL.Add('                                    EJERCICIO = :EJERCICIO_ORI AND ');
        SQL.Add('                                    CANAL = C.CANAL AND ');
        SQL.Add('                                    PERIODO = :PERIODO_ORI AND ');
        SQL.Add('                                    CODIGO_AFP = C.CODIGO_AFP), 0), ');
        SQL.Add(' C.TASA_AFP_INDEPENDIENTE = COALESCE((SELECT TASA_AFP_INDEPENDIENTE ');
        SQL.Add('                                    FROM EMP_AFP_INDICADORES ');
        SQL.Add('                                    WHERE ');
        SQL.Add('                                    EMPRESA = C.EMPRESA AND ');
        SQL.Add('                                    EJERCICIO = :EJERCICIO_ORI AND ');
        SQL.Add('                                    CANAL = C.CANAL AND ');
        SQL.Add('                                    PERIODO = :PERIODO_ORI AND ');
        SQL.Add('                                    CODIGO_AFP = C.CODIGO_AFP), 0) ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' C.CANAL = :CANAL AND ');
        SQL.Add(' C.PERIODO = :PERIODO ');
        Params.ByName['EMPRESA'].AsInteger := xPeriodosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xPeriodosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
        Params.ByName['EJERCICIO_ORI'].AsInteger := Ejercicio;
        Params.ByName['PERIODO_ORI'].AsString := Periodo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMAFPIndicadores.Close;
  QMAFPIndicadores.Open;
end;

procedure TDMNomConstantes.CrearTramos;

begin
  //Elimina si existe en el periodo las constantes y luego inserta con el Procedimiento INICIALIZA_CONSTANTES
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE INICIALIZA_TRAMOS(?EMPRESA, ?EJERCICIO, ?CANAL, ?PERIODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMTramosRenta.Close;
  QMTramosRenta.Open;
end;

procedure TDMNomConstantes.CrearConstantes;
begin
  //Elimina si existe en el periodo y luego inserta tramos con el Procedimiento INICIALIZA_TRAMOS
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE INICIALIZA_CONSTANTES(?EMPRESA, ?EJERCICIO, ?CANAL, ?PERIODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xPeriodos.Refresh;
end;

procedure TDMNomConstantes.Filtrar(periodo: string);
begin
  Posicionar(xPeriodos, 'PERIODO', periodo);
end;

procedure TDMNomConstantes.QMNomConstantesBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(QMNomConstantes, 'ID_SYS_NOMINAS_CONCEPTOS', 'ID');
end;

procedure TDMNomConstantes.xPeriodosAfterOpen(DataSet: TDataSet);
begin
  QMNomConstantes.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  QMNomConstantes.Open;
  QMAFPIndicadores.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  QMAFPIndicadores.Open;
  xInfoActualizada.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  xInfoActualizada.Open;
  QMTramosRenta.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  QMTramosRenta.Open;
  QPagos.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  QPagos.Open;
end;

procedure TDMNomConstantes.xPeriodosBeforeClose(DataSet: TDataSet);
begin
  QMNomConstantes.Close;
  QMAFPIndicadores.Close;
  xInfoActualizada.Close;
  QMTramosRenta.Close;
  QPagos.Open;

  xNominas.Close;
  xEmpresa.Close;
end;

procedure TDMNomConstantes.CrearNominas;
begin
  // Creacion masiva de todas las nominas en el periodo seleccionado en VER_EMP_NOMINAS_CABECERA
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO VER_EMP_NOMINAS_CABECERA ( ');
        SQL.Add(' EMPRESA, EJERCICIO, CANAL, EMPLEADO, PERIODO, CERRADO, EJERCICIO_CIERRE, ENTRADA, FECHA_INI_PERIODO, ESTADO, FECHA, ');
        SQL.Add(' FECHA_FIN_PERIODO, TDEVENGO, TDEDUCCION, PERCIBIR) ');
        SQL.Add(' SELECT :EMPRESA, :EJERCICIO, :CANAL, C.EMPLEADO, :PERIODO, 0 AS CERRADO, 0 AS EJERCICIO_CIERRE, :ENTRADA, ');
        SQL.Add('        P.DESDE AS FECHA_INI_PERIODO, 0 AS ESTADO, :FECHA, P.HASTA AS FECHA_FIN_PERIODO, 0 AS TDEVENGO, 0 AS TDEDUCCION, ');
        SQL.Add('        0 AS PERCIBIR ');
        SQL.Add(' FROM VER_EMPLEADOS_CUENTAS C ');
        SQL.Add(' JOIN VER_PERIODOS P ON C.EMPRESA = P.EMPRESA AND C.EJERCICIO = P.EJERCICIO ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' C.CANAL = :CANAL AND ');
        SQL.Add(' C.ACTIVO = 1 AND ');
        SQL.Add(' P.PERIODO = :PERIODO AND ');
        SQL.Add(' NOT EXISTS(SELECT EMPLEADO ');
        SQL.Add('            FROM VER_EMP_NOMINAS_CABECERA ');
        SQL.Add('            WHERE ');
        SQL.Add('            EMPRESA = C.EMPRESA AND ');
        SQL.Add('            EJERCICIO = C.EJERCICIO AND ');
        SQL.Add('            CANAL = C.CANAL AND ');
        SQL.Add('            PERIODO = P.PERIODO AND ');
        SQL.Add('            EMPLEADO = C.EMPLEADO) ');
        Params.ByName['EMPRESA'].AsInteger := xPeriodosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xPeriodosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
        Params.ByName['FECHA'].AsDateTime := xPeriodosHASTA.AsDateTime;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QPagos.Close;
  QPagos.Open;
  InfoActualiza;
end;

procedure TDMNomConstantes.QMTramosRentaNewRecord(DataSet: TDataSet);
begin
  QMTramosRentaEMPRESA.AsInteger := REntorno.Empresa;
  QMTramosRentaEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMTramosRentaCANAL.AsInteger := REntorno.Canal;
  QMTramosRentaPERIODO.AsString := xPeriodosPERIODO.AsString;
end;

procedure TDMNomConstantes.InicializaNominasEjercicio;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE INICIALIZA_NOMINAS (?EMPRESA, ?EJERCICIO, ?CANAL, ?PERIODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  InfoActualiza;
end;

procedure TDMNomConstantes.ContabilizaNominas(Estado: integer);
var
  DS : TFIBDataSet;
begin
  DS := TFIBDataSet.Create(nil);
  try
     AbreData(TDMNominasCabecera, DMNominasCabecera);
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           // Filtro las nominas del ejercicio-periodo
           SelectSQL.Add(' SELECT ID FROM EMP_NOMINAS_CABECERA ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' PERIODO = :PERIODO AND ');
           if (Estado = 1) then
              SelectSQL.Add(' ESTADO <> 5  ')
           else
              SelectSQL.Add(' ESTADO = 5  ');

           SelectSQL.Add(' ORDER BY ID ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
           Open;
           while not EOF do
           begin
              if (Estado = 1) then
              begin
                 DMNominasCabecera.SetCierreNomina(FieldByName('ID').AsInteger, 1); // Cierra Nomina y contabiliza
                 DMNominasCabecera.SetEstadoNomina(FieldByName('ID').AsInteger, 5);
              end
              else
              begin
                 DMNominasCabecera.SetCierreNomina(FieldByName('ID').AsInteger, 0); // descontabiliza y Abre todas las nomina
                 DMNominasCabecera.SetEstadoNomina(FieldByName('ID').AsInteger, 0);
              end;

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
     CierraData(DMNominasCabecera);
  end;
end;


function TDMNomConstantes.DameCajaCompensacion: string;
var
  R : TStrings;
  DS : TFIBDataSet;
begin
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT CODIGO, GLOSA FROM SYS_EQUIVALENCIAS_PREVIRED ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_CLASIFICACION = 18 ');
           Open;
           if RecordCount > 0 then
           begin
              R := TStringList.Create;
              while not EOF do
              begin
                 R.Add(FieldByName('CODIGO').AsString + ' - ' + FieldByName('GLOSA').AsString);
                 Next;
              end;
              Result := R.Text;
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

end;


procedure TDMNomConstantes.xInfoActualizadaCalcFields(DataSet: TDataSet);
begin
  xInfoActualizadaNOMINAS_PENDIENTES.AsInteger := xInfoActualizadaNOMINAS_PERIODO.AsInteger - xInfoActualizadaNOMINAS_CERRADAS.AsInteger;
end;

procedure TDMNomConstantes.InfoActualiza;
begin
  with xInfoActualizada do
  begin
     Close;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMNomConstantes.ExportarExcel(Archivo: string; Banco: integer);
var
  Fila : integer;
  HCalc : THojaCalc;
  DS : TFIBDataSet;
  i : integer;

  procedure DestacaFila(aFila: integer; Color: TColor);
  var
     c : integer;
  begin
     for c := 1 to 8 do
     begin
        HCalc.Bold(aFila, c);
        HCalc.BackgroundColor(aFila, c, Color);
     end;
  end;

begin
  DMMain.Log('Exportando Nóminas al Banco en Excel : ' + Archivo);

  // Verifico si es excel o OpenOffice
  if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
     HCalc := THojaCalc.Create(thcExcel, False)
  else
     HCalc := THojaCalc.Create(thcOpenOffice, False);

  try
     HCalc.FileName := Archivo;

     HCalc.ActivateSheetByIndex(1);

     // Cabecera
     Fila := 1;
     HCalc.CellText[Fila, 2] := DameTituloEmpresa(REntorno.Empresa);
     Inc(Fila);
     HCalc.CellText[Fila, 2] := _('EXPORTACION DE NOMINAS PARA EL BANCO');
     Inc(Fila);
     HCalc.CellText[Fila, 2] := format(_('Periodo: %d-%s'), [REntorno.Ejercicio, xPeriodosPERIODO.AsString]);
     Inc(Fila);
     Inc(Fila);
     HCalc.CellText[Fila, 1] := _('RUT');
     HCalc.CellText[Fila, 2] := _('NOMBRE');
     HCalc.CellText[Fila, 3] := _('MOD_PAGO'); // ??? no se de donde sacarlo
     HCalc.CellText[Fila, 4] := _('COD_BCO');
     HCalc.CellText[Fila, 5] := _('CTA_CTE');
     HCalc.CellText[Fila, 6] := _('MONTO');
     HCalc.CellText[Fila, 7] := _('CORREO');
     HCalc.CellText[Fila, 8] := _('GLOSA');
     DestacaFila(Fila, clYellow);

     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              // Filtro las nominas del ejercicio-periodo
              SelectSQL.Add('SELECT N.ID, N.PAGADO, T.NIF AS RUT, T.NOMBRE_R_SOCIAL AS NOMBRE, 3 AS MOD_PAGO, B.CUENTA AS CTA_EMPLEADO, ');
              SelectSQL.Add('N.CUENTA_PAGO, N.FECHA_PAGO, T.EMAIL AS CORREO, N.PERIODO, N.EJERCICIO, N.RIC_PAGO, N.EJERCICIO_PAGO, N.ESTADO, ');
              SelectSQL.Add('(SELECT IMPORTE ');
              SelectSQL.Add(' FROM EMP_NOMINAS_DET_HABERES ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' ID_CABECERA = N.ID AND ');
              SelectSQL.Add(' CODIGO = ''H020'') AS MONTO  ');
              SelectSQL.Add(' FROM EMP_NOMINAS_CABECERA N ');
              SelectSQL.Add(' JOIN OPE_EMPLEADO E ON N.EMPRESA = E.EMPRESA AND N.EMPLEADO = E.EMPLEADO ');
              SelectSQL.Add(' JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO ');
              SelectSQL.Add(' LEFT JOIN SYS_TERCEROS_BANCOS B ON T.TERCERO = B.TERCERO AND B.BANCO = :BANCO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' N.EMPRESA = :EMPRESA AND  ');
              SelectSQL.Add(' N.EJERCICIO = :EJERCICIO AND  ');
              SelectSQL.Add(' N.CANAL = :CANAL AND ');
              SelectSQL.Add(' N.PERIODO = :PERIODO AND  ');
              SelectSQL.Add(' N.ESTADO = 5 ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
              Params.ByName['BANCO'].AsInteger := Banco;
              Open;
              while not EOF do
              begin
                 Inc(Fila);
                 HCalc.CellText[Fila, 1] := FieldByName('RUT').AsString;
                 HCalc.CellText[Fila, 2] := FieldByName('NOMBRE').AsString;
                 HCalc.CellText[Fila, 3] := FieldByName('MOD_PAGO').AsString;
                 HCalc.CellText[Fila, 4] := '1';
                 HCalc.CellText[Fila, 5] := FieldByName('CTA_EMPLEADO').AsString;
                 HCalc.SendNumber(Fila, 6, FieldByName('MONTO').AsFloat);
                 HCalc.CellText[Fila, 7] := FieldByName('CORREO').AsString;
                 HCalc.CellText[Fila, 8] := Format(_('Remuneraciones periodo %d-%s'), [FieldByName('EJERCICIO').AsInteger, FieldByName('PERIODO').AsString]);
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

     // Formato
     HCalc.ColNumberFormat(3, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
     HCalc.ColNumberFormat(6, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

     // Tamaño automático de columnas
     // En este punto porque luego se insertan textos largos...
     for i := 1 to 8 do
        HCalc.AutoFit(i);

     HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     Sleep(1000);
  finally
     HCalc.Free;
  end;
end;


function TDMNomConstantes.ExistenNominasPeriodo(Periodo: string): boolean;
var
  DS : TFIBDataSet;
begin
  //Result := False;
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT ID FROM EMP_NOMINAS_CABECERA ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' PERIODO = :PERIODO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           Open;
           Result := RecordCount > 0;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

procedure TDMNomConstantes.AbreNominas;
begin
  xNominas.Open;
  // Leo todos los registros para tener la cantidad de registros de la tabla
  xNominas.FetchAll;
  xEmpresa.Open;
end;

procedure TDMNomConstantes.CierraNominas;
begin
  xNominas.Close;
  xEmpresa.Close;
end;

procedure TDMNomConstantes.xNominasAfterOpen(DataSet: TDataSet);
begin
  xEmpleadoNomina.Open;
  xNomDetHaberes.Open;
  xNomDetDescuentos.Open;
  xNomDetParametros.Open;

  // Leo todos los registros para tenerlos en memoria
  xNomDetDescuentos.FetchAll;
  xNomDetHaberes.FetchAll;
  xNomDetParametros.FetchAll;
end;

procedure TDMNomConstantes.xNominasBeforeClose(DataSet: TDataSet);
begin
  xEmpleadoNomina.Close;
  xNomDetHaberes.Close;
  xNomDetDescuentos.Close;
  xNomDetParametros.Close;
end;

procedure TDMNomConstantes.xEmpleadoNominaAfterOpen(DataSet: TDataSet);
begin
  xContrato.Open;
end;

procedure TDMNomConstantes.xEmpleadoNominaBeforeClose(DataSet: TDataSet);
begin
  xContrato.Close;
end;

function TDMNomConstantes.DameImporteParametro(Codigo: string): double;
begin
  Result := 0;
  with xNomDetParametros do
  begin
     First;
     while not EOF do
     begin
        if (xNomDetParametros.FieldByName('CODIGO').AsString = Codigo) then
        begin
           Result := xNomDetParametros.FieldByName('IMPORTE').AsFloat;
           Last;
        end;

        Next;
     end;
  end;
end;

function TDMNomConstantes.DameImporteHaberes(Codigo: string): double;
begin
  Result := 0;
  with xNomDetHaberes do
  begin
     First;
     while not EOF do
     begin
        if (xNomDetHaberes.FieldByName('CODIGO').AsString = Codigo) then
        begin
           Result := xNomDetHaberes.FieldByName('IMPORTE').AsFloat;
           Last;
        end;

        Next;
     end;
  end;
end;

function TDMNomConstantes.DameImporteDescuentos(Codigo: string): double;
begin
  Result := 0;
  with xNomDetDescuentos do
  begin
     First;
     while not EOF do
     begin
        if (xNomDetDescuentos.FieldByName('CODIGO').AsString = Codigo) then
        begin
           Result := xNomDetDescuentos.FieldByName('IMPORTE').AsFloat;
           Last;
        end;

        Next;
     end;
  end;
end;

procedure TDMNomConstantes.DameConstantes(Periodo: string; var UF, UTM, UTSR: double);
var
  DS : TFIBDataSet;
begin
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT CODIGO, IMPORTE ');
           SelectSQL.Add(' FROM EMP_NOMINAS_CONSTANTES ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' PERIODO = :PERIODO AND ');
           SelectSQL.Add(' CODIGO IN (''C001'', ''C000'', ''CS00'') ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           Open;
           while not EOF do
           begin
              if (FieldByName('CODIGO').AsString = 'C001') then
                 UF := FieldByName('IMPORTE').AsFloat;
              if (FieldByName('CODIGO').AsString = 'C000') then
                 UTM := FieldByName('IMPORTE').AsFloat;
              if (FieldByName('CODIGO').AsString = 'CS00') then
                 UTSR := FieldByName('IMPORTE').AsFloat;

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
end;

procedure TDMNomConstantes.SetConstantes(Periodo: string; Constante: integer; Importe: double);
begin
  /// Modifica el importe de una constante para nominas chilenas
  /// Constantes:
  /// 1 - C001 - Valor de U.F.
  /// 2 - C000 - Valor de U.T.M.
  /// 3 - CS00 - AFP - % Seg. Invalidez y Sobreviv. (SIS)

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_NOMINAS_CONSTANTES ');
        SQL.Add(' SET ');
        SQL.Add(' IMPORTE = :IMPORTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' PERIODO = :PERIODO AND');
        SQL.Add(' CODIGO = :CODIGO');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := Periodo;
        Params.ByName['IMPORTE'].AsFloat := Importe;
        case Constante of
           1: Params.ByName['CODIGO'].AsString := 'C001';
           2: Params.ByName['CODIGO'].AsString := 'C000';
           3: Params.ByName['CODIGO'].AsString := 'CS00';
        end;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMNomConstantes, 'CODIGO', QMNomConstantesCODIGO.AsString);
  InfoActualiza;
end;

function TDMNomConstantes.ValorConstantePeriodoAnterior(aPeriodo: string; Constante: integer): double;
var
  DS : TFIBDataSet;
  Ejercicio : integer;
  Periodo : string;
begin
  /// Devuelve el valor de la constante en el periodo anterior.
  /// Se utiliza para saber si hubo cambio con respecto al periodo anterior

  if (aPeriodo > '01') then
  begin
     Ejercicio := xPeriodosEJERCICIO.AsInteger;
     Periodo := Format('%2.2d', [StrToInt(aPeriodo) - 1]);
  end
  else
  begin
     Ejercicio := xPeriodosEJERCICIO.AsInteger - 1;
     Periodo := '12';
  end;

  Result := -1;
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT IMPORTE FROM EMP_NOMINAS_CONSTANTES ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' PERIODO = :PERIODO AND ');
           SelectSQL.Add(' CODIGO = :CODIGO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           case Constante of
              1: Params.ByName['CODIGO'].AsString := 'C001';
              2: Params.ByName['CODIGO'].AsString := 'C000';
              3: Params.ByName['CODIGO'].AsString := 'CS00';
           end;

           Open;

           if (RecordCount > 0) and (FieldByName('IMPORTE').AsFloat > 0) then
              Result := FieldByName('IMPORTE').AsFloat;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

procedure TDMNomConstantes.QMNomConstantesIMPORTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  SeparadorDecimal, SeparadorMiles : char;
begin
  if Sender.AsString <> '' then
  begin
     if (QMNomConstantesCODIGO.AsString = 'C000') or (QMNomConstantesCODIGO.AsString = 'C001') or
        (QMNomConstantesCODIGO.AsString = 'C006') or (QMNomConstantesCODIGO.AsString = 'C007') or
        (QMNomConstantesCODIGO.AsString = 'C008') or (QMNomConstantesCODIGO.AsString = 'C009') then
     begin
        SeparadorDecimal := DecimalSeparator;
        SeparadorMiles := ThousandSeparator;
        DecimalSeparator := '.';
        ThousandSeparator := ',';

        Text := FormatFloat('#,##.##', Sender.AsFloat);

        DecimalSeparator := SeparadorDecimal;
        ThousandSeparator := SeparadorMiles;
     end
     else
        Text := Sender.AsString;
  end;
end;

procedure TDMNomConstantes.SeleccionarPagos(Seleccion: integer);
//var
//Id : integer;
begin
  // Marca o desmarca todas las filas del grid de pagos
  with QPagos do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (FieldByName('MARCA').AsInteger <> Seleccion) then
           begin
              // No selecciono los que ya estan pagados
              if not ((Seleccion = 1) and (FieldByName('PAGADO').AsInteger = 1)) then
              begin
                 Edit;
                 FieldByName('MARCA').AsInteger := Seleccion;
                 Post;
              end;
           end;

           Next;
        end;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMNomConstantes.PagarNominasPeriodo(Banco: integer);
var
  FechaPago : TDateTime;
  CuentaPago : string;
  Id : integer;
begin
  FechaPago := REntorno.FechaTrab;
  if PideDato('DAT', FechaPago, _('Fecha de Pago')) then
  begin
     Id := QPagosID.AsInteger;
     CuentaPago := DMMain.DameCuentaBanco(Banco);
     with QPagos do
     begin
        DisableControls;
        try
           First;
           while not EOF do
           begin
              if (FieldByName('MARCA').AsInteger = 1) and (FieldByName('PAGADO').AsInteger = 0) then
                 PagaNomina(FieldByName('ID').AsInteger, FechaPago, CuentaPago);
              Next;
           end;
           First;
        finally
           EnableControls;
        end;
     end;

     // Refresco tabla
     Refrescar(QPagos, 'ID', Id);
  end;
end;

procedure TDMNomConstantes.DespagarPagosNominasPeriodo;
var
  Id : integer;
begin
  Id := QPagosID.AsInteger;
  with QPagos do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           DespagarPago(FieldByName('ID').AsInteger);
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;
  // Refresco tabla 
  Refrescar(QPagos, 'ID', Id);
end;


procedure TDMNomConstantes.DespagarPagosSeleccionados;
var
  Id : integer;
begin
  Id := QPagosID.AsInteger;
  with QPagos do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (FieldByName('MARCA').AsInteger = 1) and (FieldByName('RIC_PAGO').AsInteger <> 0) then
              DespagarPago(FieldByName('ID').AsInteger);
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;
  // Refresco tabla 
  Refrescar(QPagos, 'ID', Id);
end;

procedure TDMNomConstantes.DespagarPago(Id: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE EMP_NOMINA_DESPAGO(?ID)';
        Params.ByName['ID'].AsInteger := Id;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMNomConstantes.HayMarca: boolean;
begin
  Result := False;
  with QPagos do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (FieldByName('MARCA').AsInteger = 1) and (FieldByName('RIC_PAGO').AsInteger <> 0) then
           begin
              Result := True;
              Exit;
           end;
           Next;
        end;
        First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMNomConstantes.PagaNomina(Id: integer; Fecha: TDateTime; Cuenta: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE EMP_NOMINA_PAGA(?ID, ?ENTRADA, ?FECHA_PAGO, ?CUENTA_PAGO)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID'].AsInteger := Id;
        Params.ByName['FECHA_PAGO'].AsDateTime := Fecha;
        Params.ByName['CUENTA_PAGO'].AsString := Cuenta;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;


procedure TDMNomConstantes.QPagosCalcFields(DataSet: TDataSet);
var
  i : integer;
  c : double;
begin
  c := 0;
  for i := 1 to QPagos.RecordCount - 1 do
     if QPagosM.AsInteger = 1 then
        c := c + QPagosMONTO.AsFloat;

  QPagosTOTAL_LIQUIDO_BANCO.Value := c;
end;

end.
