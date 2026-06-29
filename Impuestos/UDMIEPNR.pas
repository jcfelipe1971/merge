unit UDMIEPNR;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBQuery, HYFIBQuery, FIBDataSet, FIBDatabase,
  UFIBModificados, FIBTableDataSet, FIBDataSetRO;

type
  TDMIEPNR = class(TDataModule)
     QMAsientos: TFIBTableSet;
     DSQMAsientos: TDataSource;
     TLocal: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xPeriodos: TFIBTableSet;
     xPeriodosEMPRESA: TIntegerField;
     xPeriodosEJERCICIO: TIntegerField;
     xPeriodosPERIODO: TFIBStringField;
     xPeriodosTITULO: TFIBStringField;
     xPeriodosDESDE: TDateTimeField;
     xPeriodosHASTA: TDateTimeField;
     DSxPeriodos: TDataSource;
     QMAsientosEMPRESA: TIntegerField;
     QMAsientosEJERCICIO: TIntegerField;
     QMAsientosCANAL: TIntegerField;
     QMAsientosPERIODO: TFIBStringField;
     TUpdate: THYTransaction;
     QMAsientosDESCRIPCION: TFIBStringField;
     QMAsientosASIENTO: TIntegerField;
     QMAsientosCONCEPTO: TFIBStringField;
     QMAsientosCLAVE_PRODUCTO: TFIBStringField;
     QMAsientosFECHA: TDateTimeField;
     QMAsientosJUSTIFICANTE: TFIBStringField;
     QMAsientosKILOGRAMOS: TFloatField;
     QMAsientosKILOGRAMOS_NO_RECICLADOS: TFloatField;
     QMAsientosREGIMEN_FISCAL: TFIBStringField;
     QMAsientosPROVEEDOR_DESTINATARIO: TFIBStringField;
     QMAsientosPROVEEDOR_DESTINATARIO_DOC: TFIBStringField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     QMDetalleID_E: TIntegerField;
     QMDetallePERIODO: TFIBStringField;
     QMDetalleASIENTO: TIntegerField;
     QMDetalleCONCEPTO: TFIBStringField;
     QMDetalleCLAVE_PRODUCTO: TFIBStringField;
     QMDetalleKILOGRAMOS: TFloatField;
     QMDetalleKILOGRAMOS_NO_RECICLADOS: TFloatField;
     QMDetalleREGIMEN_FISCAL: TFIBStringField;
     QMDetallePROVEEDOR_DESTINATARIO: TFIBStringField;
     QMDetallePROVEEDOR_DESTINATARIO_DOC: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleFECHA: TDateTimeField;
     QMDetallePROVEEDOR: TIntegerField;
     QMDetalleUNIDADES: TFloatField;
     QMDeclaracion: TFIBDataSetRO;
     DSQMDeclaracion: TDataSource;
     QMDeclaracionCIP: TFIBStringField;
     QMDeclaracionEPIGRAFE: TFIBStringField;
     QMDeclaracionCANTIDAD: TFloatField;
     QMDeclaracionBASE_IMPONIBLE: TFloatField;
     QMDeclaracionTIPO_IMPOSITIVO: TFloatField;
     QMDeclaracionCUOTA_INTEGRA: TFloatField;
     QMDeclaracionDEDUCCION: TFloatField;
     QMDeclaracionCOMPENSACION: TFloatField;
     QMDeclaracionCUOTA_INTEGRA_TOTAL: TFloatField;
     QMDetallePROVEEDOR_DESTINATARIO_TDOC: TFIBStringField;
     QMAsientosOBSERVACIONES: TFIBStringField;
     QMAsientosPROVEEDOR_DESTINATARIO_TDOC: TFIBStringField;
     QMDetalleART_CLAVE_PRODUCTO: TFIBStringField;
     QMDetalleART_KILOGRAMOS: TFloatField;
     QMDetalleART_KILOGRAMOS_NO_RECICLADOS: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xPeriodosAfterOpen(DataSet: TDataSet);
     procedure xPeriodosBeforeClose(DataSet: TDataSet);
     procedure QMDetalleCLAVE_PRODUCTOChange(Sender: TField);
  private
     { Private declarations }
     CIP: string;
  public
     { Public declarations }
     procedure GeneraIEPNR(Borrar: boolean);
     procedure GeneraFicheroAsientos(Archivo: string);
     procedure GeneraFicheroDeclaracion(Archivo: string);
     procedure FiltraDetalles(Todos: boolean; Proveedor: integer);
     procedure SetCIP(Valor: string);
     procedure RefrescarDeclaracion;
  end;

var
  DMIEPNR : TDMIEPNR;

implementation

uses UDMMain, UEntorno, UUtiles, DateUtils, Dialogs;

{$R *.dfm}

procedure TDMIEPNR.DataModuleCreate(Sender: TObject);
var
  DevolucionMensual : boolean;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  CIP := '';

  AsignaDisplayFormat(xPeriodos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMAsientos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDeclaracion, MascaraN, MascaraI, ShortDateFormat);
  QMDeclaracionCANTIDAD.DisplayFormat := ',0.000';
  QMDeclaracionBASE_IMPONIBLE.DisplayFormat := ',0.000';
  QMDeclaracionBASE_IMPONIBLE.DisplayFormat := ',0.000';
  QMDeclaracionTIPO_IMPOSITIVO.DisplayFormat := ',0.000';
  QMAsientosKILOGRAMOS_NO_RECICLADOS.DisplayFormat := ',0.000';
  QMDetalleKILOGRAMOS.DisplayFormat := ',0.000##';
  QMDetalleKILOGRAMOS_NO_RECICLADOS.DisplayFormat := ',0.000##';

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DEVOLUCION_MENSUAL_M592 FROM EMP_MODELOS_HACIENDA';
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        DevolucionMensual := (FieldByName['DEVOLUCION_MENSUAL_M592'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xPeriodos do
  begin
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_PERIODOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     if DevolucionMensual then
        SelectSQL.Add(' PERIODO BETWEEN ''01'' AND ''12'' ')
     else
        SelectSQL.Add(' PERIODO BETWEEN ''13'' AND ''16'' ');
     SelectSQL.Add(' ORDER BY PERIODO ');
  end;

  DMMain.FiltraTabla(xPeriodos, '11000', True);
  if DevolucionMensual then
     Posicionar(xPeriodos, 'PERIODO', format('%.2d', [MonthOf(TODAY) - 1]), False, True)
  else
     Posicionar(xPeriodos, 'PERIODO', format('%.2d', [13 + ((MonthOf(TODAY) div 3))]), False, True);
end;

procedure TDMIEPNR.xPeriodosAfterOpen(DataSet: TDataSet);
begin
  with QMAsientos do
  begin
     Close;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  with QMDetalle do
  begin
     Close;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  RefrescarDeclaracion;
end;

procedure TDMIEPNR.xPeriodosBeforeClose(DataSet: TDataSet);
begin
  QMAsientos.Close;
  QMDetalle.Close;
end;

procedure TDMIEPNR.GeneraIEPNR(Borrar: boolean);
var
  ExistenAsientosPosteriores : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 ASIENTO FROM CON_MODELO_592 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' PERIODO > :PERIODO  ');
        Params.ByName['EMPRESA'].AsInteger := xPeriodosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xPeriodosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
        ExecQuery;
        ExistenAsientosPosteriores := (FieldByName['ASIENTO'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ExistenAsientosPosteriores then
     ShowMessage(_('Existen asientos en periodos posteriores no se puede regenerar datos de modelo'))
  else
  begin
     if Borrar then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' DELETE FROM CON_MODELO_592 ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' EJERCICIO = :EJERCICIO AND ');
              SQL.Add(' CANAL = :CANAL AND ');
              SQL.Add(' PERIODO = :PERIODO  ');
              Params.ByName['EMPRESA'].AsInteger := xPeriodosEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := xPeriodosEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_GENERA_IEPNR(:EMPRESA, :EJERCICIO, :CANAL, :PERIODO)';
           Params.ByName['EMPRESA'].AsInteger := xPeriodosEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xPeriodosEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := xPeriodosPERIODO.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMAsientos.Close;
     QMAsientos.Open;
     QMDetalle.Close;
     QMDetalle.Open;

     RefrescarDeclaracion;
  end;
end;

procedure TDMIEPNR.GeneraFicheroAsientos(Archivo: string);
var
  sl : TStrings;
  s : string;
  Separador : string;
begin
  {
  FUENTE: https://www2.agenciatributaria.gob.es/static_files/common/internet/dep/aduanas/es/aeat/adsi/lico/plastico/documentacion/impfichero/plastico_doc_impfichero.pdf?fventana=S

  Formato CSV
  Separador = ";"
  Entrecomillado de strings = NO.
  Formato de Fecha = "dd/mm/yyyy"
  formato de campos "Kilogramos" y "Kilogramos no reciclados" = '0.000' (Separador decimal = ",")
  Campos:
  Número Asiento;Fecha Hecho Contabilizado;Concepto;Clave Producto;Descripción Producto;Régimen Fiscal;Justificante;Prov./Dest.: Tipo Documento;Prov./Dest.: Nº documento;Prov./Dest.: Razón social;Kilogramos;Kilogramos No Reciclados;Observaciones
  }

  Separador := ';';
  sl := TStringList.Create;
  try
     // Cabeceras
     sl.Add('Número Asiento;Fecha Hecho Contabilizado;Concepto;Clave Producto;Descripción Producto;Régimen Fiscal;Justificante;Prov./Dest.: Tipo Documento;Prov./Dest.: Nº documento;Prov./Dest.: Razón social;Kilogramos;Kilogramos No Reciclados;Observaciones');

     QMAsientos.First;
     while not QMAsientos.EOF do
     begin
        s := '';
{
Ejemplo:
--------
Número Asiento;Fecha Hecho Contabilizado;Concepto;Clave Producto;Descripción Producto;Régimen Fiscal;Justificante    ;Prov./Dest.: Tipo Documento;Prov./Dest.: Nº documento;Prov./Dest.: Razón social;Kilogramos    ;Kilogramos No Reciclados;Observaciones
Asiento 1     ;01/07/2022               ;2       ;B            ;TAPONES R16          ;A             ;JUSFITICANTE 001;1                          ;DOC00001                 ;DESTINATARIO PRUEBA 001  ;100,55        ;100                     ;Prueba con texto algo más largo y espaciado
0002          ;02/07/2022               ;2       ;C            ;BOTELLAS V12         ;B             ;JUSFITICANTE 002;1                          ;DOC00002                 ;DESTINATARIO PRUEBA 002  ;1234,33       ;20,5                    ;Observación prueba
cfa-3344      ;03/07/2022               ;2       ;B            ;AA_BRX               ;C             ;JUSFITICANTE 003;3                          ;DOC00003                 ;PROVEEDOR PRUEBA 001     ;11.222,33     ;1.000,55                ;AAAAAA BBBBBB
AA 333-24R    ;04/07/2022               ;2       ;B            ;V12-2                ;D             ;JUSFITICANTE 004;2                          ;DOC00004                 ;PROVEEDOR PRUEBA 002     ;111.111.111,40;3333333,88              ;
}
        s := s + format('%.4d', [QMAsientosASIENTO.AsInteger]) + Separador;
        s := s + FormatDateTime('dd/mm/yyyy', QMAsientosFECHA.AsDateTime) + Separador;
        s := s + QMAsientosCONCEPTO.AsString + Separador;
        s := s + QMAsientosCLAVE_PRODUCTO.AsString + Separador;
        s := s + '' + Separador; // Descripción Producto - Se ignora - Unicamente para establecimientos que fabrican
        s := s + QMAsientosREGIMEN_FISCAL.AsString + Separador;  // Opcional
        s := s + QMAsientosJUSTIFICANTE.AsString + Separador;

        {Tipos de Documentos
        1 NIF ó NIE español
        2 NIF IVA intracomunitario
        3 Otros
        }
        s := s + QMAsientosPROVEEDOR_DESTINATARIO_TDOC.AsString + Separador;

        s := s + QMAsientosPROVEEDOR_DESTINATARIO_DOC.AsString + Separador;
        s := s + Trim(QMAsientosPROVEEDOR_DESTINATARIO.AsString) + Separador;
        s := s + FormatFloat('0.000', QMAsientosKILOGRAMOS.AsFloat) + Separador;
        s := s + FormatFloat('0.000', QMAsientosKILOGRAMOS_NO_RECICLADOS.AsFloat) + Separador;
        s := s + ''; // Opcional - Observaciones

        sl.Add(s);

        QMAsientos.Next;
     end;

     sl.SaveToFile(Archivo);
  finally
     sl.Free;
  end;
end;

procedure TDMIEPNR.GeneraFicheroDeclaracion(Archivo: string);
var
  sl : TStrings;
  s : string;
  Separador : string;
begin
  {
  Formato CSV
  Separador = ";"
  Entrecomillado de strings = NO.
  Formato de Fecha = "dd/mm/yyyy"
  formato de campos = Separador decimal = "."
  Campos:
  CIP; Epigrafe; Cantidad; Base Imponible; Tipo Impositivo; Cuota Integra; Deduccion; Compensacion; Cuota Integra Total
  }

  Separador := ';';
  sl := TStringList.Create;
  try
     QMDeclaracion.First;
     while not QMDeclaracion.EOF do
     begin
        s := '';
        s := s + QMDeclaracionCIP.AsString + Separador;
        s := s + QMDeclaracionEPIGRAFE.AsString + Separador;
        s := s + FloatToStrDec(QMDeclaracionCANTIDAD.AsFloat, '.', '0.000') + Separador;
        s := s + FloatToStrDec(QMDeclaracionBASE_IMPONIBLE.AsFloat, '.', '0.000') + Separador;
        s := s + FloatToStrDec(QMDeclaracionTIPO_IMPOSITIVO.AsFloat, '.', '0.000') + Separador;
        s := s + FloatToStrDec(QMDeclaracionCUOTA_INTEGRA.AsFloat, '.', '0.00') + Separador;
        s := s + FloatToStrDec(QMDeclaracionDEDUCCION.AsFloat, '.', '0.00') + Separador;
        s := s + FloatToStrDec(QMDeclaracionCOMPENSACION.AsFloat, '.', '0.00') + Separador;
        s := s + FloatToStrDec(QMDeclaracionCUOTA_INTEGRA_TOTAL.AsFloat, '.', '0.00');

        sl.Add(s);

        QMDeclaracion.Next;
     end;

     sl.SaveToFile(Archivo);
  finally
     sl.Free;
  end;
end;

procedure TDMIEPNR.FiltraDetalles(Todos: boolean; Proveedor: integer);
begin
  with QMDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_DETALLE_ALBARAN_IEPNR ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' PERIODO = :PERIODO ');
     if not Todos then
        SelectSQL.Add('   AND ((TRIM(CLAVE_PRODUCTO) > '''') OR (TRIM(ART_CLAVE_PRODUCTO) > '''')) ');
     if (Proveedor <> 0) then
        SelectSQL.Add('   AND PROVEEDOR = ' + IntToStr(Proveedor));
     SelectSQL.Add(' ORDER BY SERIE, RIG, LINEA ');

     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMIEPNR.QMDetalleCLAVE_PRODUCTOChange(Sender: TField);
begin
  if (Trim(QMDetalleCLAVE_PRODUCTO.AsString) > '') then
  begin
     QMDetalleKILOGRAMOS.AsFloat := QMDetalleUNIDADES.AsFloat * QMDetalleart_KILOGRAMOS.AsFloat;
     QMDetalleKILOGRAMOS_NO_RECICLADOS.AsFloat := QMDetalleUNIDADES.AsFloat * QMDetalleart_KILOGRAMOS_NO_RECICLADOS.AsFloat;
  end
  else
  begin
     QMDetalleKILOGRAMOS.AsFloat := 0;
     QMDetalleKILOGRAMOS_NO_RECICLADOS.AsFloat := 0;
  end;
end;

procedure TDMIEPNR.SetCIP(Valor: string);
begin
  CIP := Valor;
  RefrescarDeclaracion;
end;

procedure TDMIEPNR.RefrescarDeclaracion;
begin
  with QMDeclaracion do
  begin
     Close;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CIP'].AsString := CIP;
     Params.ByName['EPIGRAFE'].AsString := 'P0';
     Params.ByName['TIPO_IMPOSITIVO'].AsFloat := 0.45;
     Params.ByName['DEDUCCION'].AsFloat := 0;
     Params.ByName['COMPENSACION'].AsFloat := 0;
     Open;
  end;
end;

end.
