unit UDMNominas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, Excel2000, Contnrs, OleServer, FIBQuery, HYFIBQuery, ComObj,
  CVBNorma34_14CSB, CVBNorma34_1CSB, CVBNorma34CSB, FIBDataSetRO;

type
  TDMNominas = class(TDataModule)
     DSQMNominas: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMNominas: TFIBTableSet;
     QMNominasID: TIntegerField;
     QMNominasEMPRESA: TIntegerField;
     QMNominasEJERCICIO: TIntegerField;
     QMNominasCANAL: TIntegerField;
     QMNominasEMPLEADO: TIntegerField;
     QMNominasPERIODO: TFIBStringField;
     QMNominasIMP_DEVENGADO: TFloatField;
     QMNominasIMP_RETENCION: TFloatField;
     QMNominasIMP_REMUNERACION: TFloatField;
     QMNominasIMP_SEG_SOCIAL: TFloatField;
     QMNominasIMP_ANTICIPO: TFloatField;
     QMNominasCERRADO: TIntegerField;
     QMNominasRIC_CIERRE: TIntegerField;
     QMNominasPAGADO: TIntegerField;
     QMNominasRIC_PAGO: TIntegerField;
     QMNominasENTRADA: TIntegerField;
     QMNominasNOMBRE_R_SOCIAL: TFIBStringField;
     QMNominasTERCERO: TIntegerField;
     QMNominasUSUARIO: TIntegerField;
     DSQMAnticipos: TDataSource;
     QMAnticipos: TFIBTableSet;
     QMAnticiposID: TIntegerField;
     QMAnticiposEMPRESA: TIntegerField;
     QMAnticiposEJERCICIO: TIntegerField;
     QMAnticiposCANAL: TIntegerField;
     QMAnticiposEMPLEADO: TIntegerField;
     QMAnticiposANTICIPO: TIntegerField;
     QMAnticiposNOMBRE_R_SOCIAL: TFIBStringField;
     QMAnticiposIMPORTE: TFloatField;
     QMAnticiposPAGADO: TIntegerField;
     QMAnticiposRIC_PAGO: TIntegerField;
     QMAnticiposID_NOMINA: TIntegerField;
     QMAnticiposENTRADA: TIntegerField;
     QMAnticiposTERCERO: TIntegerField;
     QMAnticiposUSUARIO: TIntegerField;
     QMNominasEJERCICIO_CIERRE: TIntegerField;
     QMNominasCTA_PAGO: TFIBStringField;
     QMNominasCTA_PAGO_PGC: TIntegerField;
     QMNominasEJERCICIO_PAGO: TIntegerField;
     QMAnticiposEJERCICIO_PAGO: TIntegerField;
     QMAnticiposLIQUIDADO: TIntegerField;
     QMAnticiposRIC_LIQUIDACION: TIntegerField;
     QMAnticiposEJERCICIO_LIQUIDACION: TIntegerField;
     QMAnticiposCTA_PAGO: TFIBStringField;
     QMAnticiposCTA_PAGO_PGC: TIntegerField;
     QMNominasIMP_RETENCION_ESPECIE: TFloatField;
     QMNominasIMP_REMUNERACION_ESPECIE: TFloatField;
     QMNominasIMP_DIETAS: TFloatField;
     QMNominasPERIODO_HACIENDA: TFIBStringField;
     QMNominasSELECCIONADO: TIntegerField;
     Norma34: TCVBNorma34CSB;
     Norma34_1: TCVBNorma34_1CSB;
     Norma34_14: TCVBNorma34_14CSB;
     xBancoOrdPago: TFIBDataSetRO;
     xBancoOrdPagoEMPRESA: TIntegerField;
     xBancoOrdPagoEJERCICIO: TIntegerField;
     xBancoOrdPagoCANAL: TIntegerField;
     xBancoOrdPagoBANCO: TIntegerField;
     xBancoOrdPagoTITULO: TFIBStringField;
     xBancoOrdPagoENTIDAD: TFIBStringField;
     xBancoOrdPagoSUCURSAL: TFIBStringField;
     xBancoOrdPagoCONTROL: TFIBStringField;
     xBancoOrdPagoCUENTA_CORRIENTE: TFIBStringField;
     xBancoOrdPagoRIESGO_CON: TFloatField;
     xBancoOrdPagoRIESGO_UTI: TFloatField;
     xBancoOrdPagoACTIVO: TIntegerField;
     xBancoOrdPagoCUENTA_CONTABLE: TFIBStringField;
     xBancoOrdPagoCUENTA_CC: TFIBStringField;
     xBancoOrdPagoCUENTA_AHORRO: TFIBStringField;
     xBancoOrdPagoCUENTA_DTO: TFIBStringField;
     xBancoOrdPagoSEPARA_APUNTES: TIntegerField;
     xBancoOrdPagoIBAN: TFIBStringField;
     xBancoOrdPagoBIC: TFIBStringField;
     xEmpleado: TFIBDataSetRO;
     xEmpleadoTERCERO: TIntegerField;
     xEmpleadoEMPLEADO: TIntegerField;
     xEmpleadoCODPOSTAL: TFIBStringField;
     xEmpleadoTITULO_LOCALIDAD: TFIBStringField;
     xEmpleadoTITULO_PROVINCIA: TFIBStringField;
     xEmpleadoTITULO_PAIS: TFIBStringField;
     xEmpleadoPAIS_C2: TFIBStringField;
     xEmpleadoPERTENECE_CEE: TIntegerField;
     xEmpleadoENTIDAD: TFIBStringField;
     xEmpleadoSUCURSAL: TFIBStringField;
     xEmpleadoCONTROL: TFIBStringField;
     xEmpleadoCUENTA: TFIBStringField;
     xEmpleadoIBAN: TFIBStringField;
     xEmpleadoBIC: TFIBStringField;
     xEmpleadoNIF: TFIBStringField;
     xEmpleadoNOMBRE_R_SOCIAL: TFIBStringField;
     xEmpleadoDIR_COMPLETA_N: TFIBStringField;
     QMNominasIMP_SEG_SOCIAL_EMPRESA: TFloatField;
     QMNominasRIC_CIERRE_SEG_SOCIAL_EMPRESA: TIntegerField;
     QMAnticiposPERIODO: TFIBStringField;
     QMNominasIMP_OTROS: TFloatField;
     QMNominasIMP_PAGADO: TFloatField;
     QMNominasFECHA_CIERRE: TDateTimeField;
     QMNominasFECHA_PAGO: TDateTimeField;
     QMNominasCODIGO_GESTORIA: TFIBStringField;
     QMAnticiposCODIGO_GESTORIA: TFIBStringField;
     QMNominasIMP_CE_RETA: TFloatField;
     QMNominasIMP_COBROS_ESPECIE: TFloatField;
     QMNominasIMP_ICECES: TFloatField;
     QMAnticiposFECHA_PAGO: TDateTimeField;
     QMNominasIMP_EMBARGO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAnticiposBeforePost(DataSet: TDataSet);
     procedure QMNominasBeforePost(DataSet: TDataSet);
     procedure QMAnticiposNewRecord(DataSet: TDataSet);
     procedure QMNominasNewRecord(DataSet: TDataSet);
     procedure QMNominasEMPLEADOChange(Sender: TField);
     procedure QMNominasAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     LocalMascaraN: string;
     Banco: integer;
     Param_NOMTIPO001: integer;
     Periodo: string;
     Empleado: integer;
     SoloNominasPendientes: boolean;
     SoloAnticiposPendientes: boolean;
     function QuitaPaisDeNIF(NIF: string): string;
     function DameCuentaBanco(Banco: integer): string;
     function DameEmpleadoSegunCodigoGestoria(CodigoGestoria: string): integer;
     function DameEmpleadoSegunNIF(NIF: string): integer;
     function StrExcelToFloat(s: string; IsOpenOffice: boolean): double;
     function ImportacionNominas1(Archivo, PeriodoHacienda: string): boolean;
     function ImportacionNominas2(Archivo, PeriodoHacienda: string): boolean;
     function ImportacionNominas3(Archivo, PeriodoHacienda: string): boolean;
  public
     { Public declarations }
     function ImportacionNominas(Archivo, PeriodoHacienda: string): boolean;
     procedure InsertaNomina(Empleado: integer; Periodo, PeriodoHacienda: string; Imp_devengado, Imp_retencion, Imp_remuneracion, Imp_seg_social, Imp_seg_social_empresa, ImporteCERETA, ImporteCobroEspecieAutonomo, ImporteICECES, ImporteEmbargo: double);
     function ExisteNomina(Empresa, Ejercicio, Canal, Empleado: integer; Periodo: string): boolean;
     procedure FiltraNominasPendientes(Todas: boolean);
     procedure FiltraAnticiposPendientes(Todas: boolean);
     procedure Seleccionar(Todas: boolean);
     procedure ImprimirNorma34(Banco: integer);
     procedure ImprimirNorma34_1(AFormato: integer; ASufijo: string; Banco: integer);
     procedure ImprimirNorma34_14(AFormato: integer; ASufijo: string; Banco: integer);
     procedure ImprimirSEPA(AFormato: integer; ASufijo: string; Banco: integer);
     function SeleccionadasEstanCerradas: boolean;
     function SeleccionadasEstanPagadas: boolean;
     procedure CerrarSeleccionados;
     procedure PagarSeleccionados;
     procedure CambiaBanco(aBanco: integer);
     procedure FiltraPeriodo(aPeriodo: string);
     procedure FiltraEmpleado(aEmpleado: integer);
     procedure FiltraNominas;
     procedure FiltraAnticipos;
  end;

var
  DMNominas : TDMNominas;

implementation

uses UDMMain, Variants, UUtiles, UEntorno, StrUtils, UHojaCalc, UFMSeleccion, UParam, SEPA, DateUtils, UDameDato;

{$R *.dfm}

procedure TDMNominas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  // Tipo de Importacion de Nómina
  // 1: Micamol
  // 2: Tubos Paris
  Param_NOMTIPO001 := StrToIntDef(LeeParametro('NOMTIPO001', ''), 1);

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);

  AsignaDisplayFormat(QMNominas, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMAnticipos, LocalMascaraN, MascaraI, ShortDateFormat);

  Banco := -1;
  Periodo := '00';
  SoloNominasPendientes := True;
  FiltraNominas;

  SoloAnticiposPendientes := True;
  FiltraAnticipos;
end;

function TDMNominas.ImportacionNominas(Archivo, PeriodoHacienda: string): boolean;
begin
  case Param_NOMTIPO001 of
     1: ImportacionNominas1(Archivo, PeriodoHacienda);
     2: ImportacionNominas2(Archivo, PeriodoHacienda);
     3: ImportacionNominas3(Archivo, PeriodoHacienda);
  end;
end;

function TDMNominas.StrExcelToFloat(s: string; IsOpenOffice: boolean): double;
begin
  Result := 0;
  DMMain.Log(format('Importe RAW: %s', [s]));
  if (IsOpenOffice) then
  begin
     if (Trim(s) > '') then
        // Result := Abs(StrToFloatDec(s, '.'));
        Result := StrToFloatDec(s, '.');
  end
  else
  begin
     s := StringReplace(s, '.', '', [rfReplaceAll]);
     DMMain.Log(format('Importe ThousandSeparator modificado: %s', [s]));
     s := StringReplace(s, ',', DecimalSeparator, []);
     DMMain.Log(format('Importe DecimalSeparator modificado: %s', [s]));

     if (Trim(s) > '') then
        // Result := Abs(StrToFloat(s));
        Result := StrToFloat(s);
  end;
end;

function TDMNominas.ImportacionNominas1(Archivo, PeriodoHacienda: string): boolean;
const
  Columna_Periodo = 1;
  Fila_Periodo = 4;
  Primera_Fila_Datos = 10;
  ColumnaTrabajador = 4; // MICAMOL - NIF del empleado
  ColumnaImporteDevengado = 7;
  ColumnaImporteSeguridadSocial = 12;
  ColumnaImporteRetencion = 8;
  ColumnaImporteRemuneracion = 13;
  ColumnaImporteSeguridadSocialEmpresa = 14;
  ColumnaImporteCERETA = 9;
  ColumnaImporteCobroEspecieAutonomo = 10;
  ColumnaImporteICECES = 11;
var
  HCalc : THojaCalc;
  Fila, Empleado : integer;
  aLastRow, aLastCol : integer;
  s, Periodo, Trabajador : string;
  ImporteDevengado, ImporteSeguridadSocial, ImporteRetencion, ImporteRemuneracion, ImporteSeguridadSocialEmpresa : double;
  ImporteCERETA, ImporteCobroEspecieAutonomo, ImporteICECES, ImporteEmbargo : double;
begin
  /// Importacion Micamol
  /// Datos en filas

  DMMain.LogIni('ImportacionNominas *1* ' + Archivo);
  try
     Result := True;

     HCalc := THojaCalc.Create(Archivo, True);
     with HCalc do
     begin
        try
           FileName := Archivo; //Needs a file name before you SaveDoc!

           // Establezco pestaña activa para que funcione LastRow/LasCol
           ActivateSheetByIndex(1);
           aLastRow := LastRow;
           aLastCol := LastCol;
           DMMain.Log(format('LastRow: %d', [aLastRow]));
           DMMain.Log(format('LastCol: %d', [aLastCol]));
           if (IsOpenOffice) then
              DMMain.Log('IsOpenOffice')
           else
              DMMain.Log('IsExcel');

           try
              Periodo := Trim(CellText[Fila_Periodo, Columna_Periodo]);
              DMMain.Log(format('Periodo: %s', [Periodo]));
           except
              on E: Exception do
                 ShowMessage('Error Periodo' + #13#10 + Periodo + #13#10 + E.Message);
           end;

           for Fila := Primera_Fila_Datos to LastRow - 1 do
           begin
              DMMain.LogIni(format(' Fila: %d de %d', [Fila, LastRow]));
              try
                 // Obtengo datos del Trabajador
                 try
                    Trabajador := Trim(CellText[Fila, ColumnaTrabajador]);
                    DMMain.Log(format('Trabajador RAW: %s', [Trabajador]));

                    // Elimino comilla inicial, si la tiene
                    if (Copy(Trabajador, 1, 1) = '''') then
                    begin
                       DMMain.Log('Limpiando comilla inicial de Trabajador');
                       Trabajador := StringReplace(Trabajador, '''', '', []);
                    end;

                    Trabajador := Trim(Trabajador);
                    DMMain.Log(format('Trabajador STR: %s', [Trabajador]));
                 except
                    on E: Exception do
                       ShowMessage('Error Trabajador' + #13#10 + Trabajador + #13#10 + E.Message);
                 end;

                 // Si el campo esta en blanco no se importa la linea
                 if (Trabajador > '') then
                 begin
                    // Empleado := DameEmpleadoSegunCodigoGestoria(Trabajador);
                    // MICAMOL - Busco el empleado que tenga el NIF que viene en esta columna
                    Empleado := DameEmpleadoSegunNIF(Trabajador);
                    DMMain.Log(format('Empleado: %d', [Empleado]));

                    // Si existe el empleado
                    if (Empleado > 0) then
                    begin
                       // Inicializo datos
                       Trabajador := '';
                       ImporteDevengado := 0;
                       ImporteSeguridadSocial := 0;
                       ImporteRetencion := 0;
                       ImporteRemuneracion := 0;
                       ImporteSeguridadSocialEmpresa := 0;
                       ImporteCERETA := 0;
                       ImporteCobroEspecieAutonomo := 0;
                       ImporteICECES := 0;

                       try
                          ImporteDevengado := StrExcelToFloat(CellText[Fila, ColumnaImporteDevengado], IsOpenOffice);
                          DMMain.Log(format('Importe Devengado: %f', [ImporteDevengado]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Devengado' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteSeguridadSocial := StrExcelToFloat(CellText[Fila, ColumnaImporteSeguridadSocial], IsOpenOffice);
                          DMMain.Log(format('Importe Seguridad Social: %f', [ImporteSeguridadSocial]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Seguridad Social' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteRetencion := StrExcelToFloat(CellText[Fila, ColumnaImporteRetencion], IsOpenOffice);
                          DMMain.Log(format('Importe Retencion: %f', [ImporteRetencion]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Retencion' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteSeguridadSocialEmpresa := StrExcelToFloat(CellText[Fila, ColumnaImporteSeguridadSocialEmpresa], IsOpenOffice);
                          DMMain.Log(format('Importe Seguridad Social Empresa: %f', [ImporteSeguridadSocialEmpresa]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Seguridad Social Empresa' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          // MICAMOL tiene una formula y OpenOffice la devuelve en vez del valor.
                          if (IsOpenOffice) then
                             ImporteRemuneracion := (ImporteDevengado - ImporteRetencion - ImporteSeguridadSocial)
                          else
                             ImporteRemuneracion := StrExcelToFloat(CellText[Fila, ColumnaImporteRemuneracion], IsOpenOffice);
                          DMMain.Log(format('Importe Remuneracion: %f', [ImporteRemuneracion]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Remuneracion' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteCERETA := StrExcelToFloat(CellText[Fila, ColumnaImporteCERETA], IsOpenOffice);
                          DMMain.Log(format('Importe CRETA: %f', [ImporteCERETA]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe CRETA' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteCobroEspecieAutonomo := StrExcelToFloat(CellText[Fila, ColumnaImporteCobroEspecieAutonomo], IsOpenOffice);
                          DMMain.Log(format('Importe Cobro Especie Autonomo: %f', [ImporteCobroEspecieAutonomo]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Cobro Especie Autonomo' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteICECES := StrExcelToFloat(CellText[Fila, ColumnaImporteICECES], IsOpenOffice);
                          DMMain.Log(format('Importe ICECES: %f', [ImporteICECES]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe ICECES' + #13#10 + s + #13#10 + E.Message);
                       end;

                       ImporteEmbargo := 0;

                       // Si existe la nómina
                       if not ExisteNomina(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, Empleado, Periodo
{$IFDEF Debug}+ '-'+IntToStr(Fila){$ENDIF}
                          ) then
                       begin
                          InsertaNomina(Empleado, Periodo, PeriodoHacienda
{$IFDEF Debug}+ '-'+IntToStr(Fila){$ENDIF}
                             , ImporteDevengado, ImporteRetencion, ImporteRemuneracion, ImporteSeguridadSocial, ImporteSeguridadSocialEmpresa, ImporteCERETA, ImporteCobroEspecieAutonomo, ImporteICECES, ImporteEmbargo);
                          DMMain.Log(format('Inserta Nomina. Empleado: %d Periodo: %s', [Empleado, Periodo]));
                       end
                       else
                       begin
                          DMMain.Log(format('Ya existe nomina para Empleado: %d - Periodo: %s', [Empleado, Periodo]));
                       end;
                    end
                    else
                    begin
                       ShowMessage(format(_('No se encuentra empleado para "%s."'), [Trabajador]));
                       DMMain.Log(format('No se encuentra empleado para trabajador %s', [Trabajador]));
                    end;
                 end;
              finally
                 DMMain.LogFin('');
              end;
           end;
        finally
           DMMain.Log('Sleep');
           Sleep(5000);
           DMMain.Log('Free.');
           Free;
        end;
     end;

     DMMain.Log('QMNominas.Close');
     QMNominas.Close;
     DMMain.Log('QMNominas.Open');
     QMNominas.Open;
  finally
     DMMain.LogFin('');
  end;
end;

function TDMNominas.ImportacionNominas2(Archivo, PeriodoHacienda: string): boolean;
const
  Columna_Periodo = 1;
  Fila_Periodo = 4;
  Primera_Columna_Datos = 4;
  FilaTrabajador = 4; // Codigo de gestoria

var
  // FilaImporteDevengado : integer;
  FilaImporteDevengadoIni : integer; // Desde colA = CONCEPTO
  FilaImporteDevengadoFin : integer; // Hasta colA = TOTAL BRUTO
  FilaImporteSeguridadSocialIni : integer; // 34+35+36
  FilaImporteSeguridadSocialFin : integer; // 34+35+36
  FilaImporteDeduccionesIni : integer;
  FilaImporteDeduccionesFin : integer;
  FilaImporteRetencion : integer;
  FilaImporteRemuneracionBruto : integer;
  FilaImporteRemuneracionDeducciones : integer;
  FilaImporteRemuneracion : integer;
  FilaImporteSeguridadSocialEmpresa : integer;
  FilaImporteCERETA : integer;
  FilaImporteCobroEspecieAutonomo : integer;
  FilaImporteICECES : integer;
  FilaImporteEmbargo : integer;
  FilaImporteAnticipo : integer;

  HCalc : THojaCalc;
  i, Columna, Empleado : integer;
  aLastRow, aLastCol : integer;
  s, Periodo, Trabajador : string;
  CodigoConcepto : string;
  ImporteDevengado, ImporteDeducido, ImporteSeguridadSocial, ImporteRetencion, ImporteRemuneracion, ImporteSeguridadSocialEmpresa : double;
  ImporteCERETA, ImporteCobroEspecieAutonomo, ImporteICECES, ImporteEmbargo : double;

begin
  /// Importacion Tubos Paris
  /// Datos en columnas
  ///
  /// A4 = Periodo de nomina. Ej. "DEL 01/12/21 AL 31/12/21"
  /// A partir de la columna D empiezan los empleados.
  /// D4 = Código gestoria
  /// D5..7 = Apellidos y Nombre
  /// Fila 29: A = "TOTAL BRUTO".             D.. = Importe 6400
  /// Fila 31: B=703                          D.. = Importe 465 (Embargo)
  /// Fila 31: B=730                          D.. = Importe ?
  /// Fila 31: B=789                          D.. = Importe ?
  /// Fila 34: B=995                          D.. = Importe 476
  /// Fila 35: B=996                          D.. = Importe 476
  /// Fila 36: B=997                          D.. = Importe 476
  /// Fila 37: B=999                          D.. = Importe 475100001
  /// Fila 43: A=SEGURIDAD SOCIAL EMPRESA     D.. = Importe ?
  /// Fila 43: A=SEGURIDAD SOCIAL TRABAJADOR  D.. = Importe ?


  DMMain.LogIni('ImportacionNominas *2* ' + Archivo);
  try
     Result := True;

     HCalc := THojaCalc.Create(Archivo, True);
     with HCalc do
     begin
        try
           FileName := Archivo; //Needs a file name before you SaveDoc!

           // Establezco pestaña activa para que funcione LastRow/LasCol
           ActivateSheetByIndex(1);
           aLastRow := LastRow;
           aLastCol := LastCol;
           DMMain.Log(format('LastRow: %d', [aLastRow]));
           DMMain.Log(format('LastCol: %d', [aLastCol]));
           if (IsOpenOffice) then
              DMMain.Log('IsOpenOffice')
           else
              DMMain.Log('IsExcel');

           try
              Periodo := Trim(CellText[Fila_Periodo, Columna_Periodo]);
              DMMain.Log(format('Periodo: %s', [Periodo]));
           except
              on E: Exception do
                 ShowMessage('Error Periodo' + #13#10 + Periodo + #13#10 + E.Message);
           end;

           FilaImporteDevengadoIni := 1;
           FilaImporteDevengadoFin := 1;
           FilaImporteDeduccionesIni := 1;
           FilaImporteDeduccionesFin := 1;
           FilaImporteSeguridadSocialIni := 1;
           FilaImporteSeguridadSocialFin := 1;
           FilaImporteRetencion := 1;
           FilaImporteRemuneracionBruto := 1;
           FilaImporteRemuneracionDeducciones := 1;
           FilaImporteRemuneracion := 1;
           FilaImporteSeguridadSocialEmpresa := 1;
           FilaImporteCERETA := 1;
           FilaImporteCobroEspecieAutonomo := 1;
           FilaImporteICECES := 1;
           FilaImporteEmbargo := 1;

           for i := 1 to LastRow do
           begin
              CodigoConcepto := CellText[i, 1];

              if (CodigoConcepto = 'CONCEPTO') or (CodigoConcepto = 'CONCEPTE') then
                 FilaImporteDevengadoIni := i + 1;

              if (CodigoConcepto = 'TOTAL BRUTO') or (CodigoConcepto = 'TOTAL BRUT') then
                 FilaImporteDevengadoFin := i - 1;

              if (CodigoConcepto = 'TOTAL BRUTO') or (CodigoConcepto = 'TOTAL BRUT') then
                 FilaImporteRemuneracionBruto := i;

              if (CodigoConcepto = 'TOTAL DEDUCCIONES') or (CodigoConcepto = 'TOTAL DEDUCCIONS') then
                 FilaImporteRemuneracionDeducciones := i;

              if (CodigoConcepto = 'SEGURIDAD SOCIAL EMPRESA') or (CodigoConcepto = 'SEGURETAT SOCIAL EMPRESA') then
                 FilaImporteSeguridadSocialEmpresa := i;

              CodigoConcepto := CellText[i, 2];
              if (CodigoConcepto = '703') then
                 FilaImporteEmbargo := i;

              if (CodigoConcepto = '705') then
                 FilaImporteAnticipo := i;

              // Las lineas 700 - 994 excepto la 703 (embargo) y 705 (anticipo). Se restan de la remuneracion
              FilaImporteDeduccionesIni := FilaImporteDevengadoFin + 2;
              if (CodigoConcepto >= '995') then
                 if (FilaImporteDeduccionesFin = 1) then
                    FilaImporteDeduccionesFin := i - 1;

              if (CodigoConcepto = '995') then
                 FilaImporteSeguridadSocialIni := i;
              if (CodigoConcepto = '997') then
                 FilaImporteSeguridadSocialFin := i;

              if (CodigoConcepto = '999') then
                 FilaImporteRetencion := i;
           end;

           Trabajador := 'INICIO';
           Columna := Primera_Columna_Datos;
           while (Trabajador > '') do
           begin
              DMMain.LogIni(format('Columna: %d de %d', [Columna, LastCol]));
              try
                 // Obtengo datos del Trabajador
                 try
                    Trabajador := Trim(CellText[FilaTrabajador, Columna]);
                    DMMain.Log(format('Trabajador RAW: %s', [Trabajador]));

                    Trabajador := Trim(LimpiaCeldaExcel(Trabajador));

                    DMMain.Log(format('Trabajador: %s', [Trabajador]));
                 except
                    on E: Exception do
                    begin
                       ShowMessage('Error Trabajador' + #13#10 + Trabajador + #13#10 + E.Message);
                       Trabajador := '';
                    end;
                 end;

                 // Si el campo esta en blanco no se importa la linea
                 if (Trabajador > '') then
                 begin
                    Empleado := DameEmpleadoSegunCodigoGestoria(Trabajador);
                    // Empleado := DameEmpleadoSegunNIF(Trabajador);
                    DMMain.Log(format('Empleado: %d', [Empleado]));

                    // Si existe el empleado
                    if (Empleado > 0) then
                    begin
                       // Inicializo datos
                       ImporteDevengado := 0;
                       ImporteDeducido := 0;
                       ImporteSeguridadSocial := 0;
                       ImporteRetencion := 0;
                       ImporteRemuneracion := 0;
                       ImporteSeguridadSocialEmpresa := 0;
                       ImporteCERETA := 0;
                       ImporteCobroEspecieAutonomo := 0;
                       ImporteICECES := 0;
                       ImporteEmbargo := 0;

                       try
                          // Es una formula (=SUMA(D11:D26)) y debo simularla
                          // ImporteDevengado := StrExcelToFloat(CellText[FilaImporteDevengado, Columna], IsOpenOffice);
                          for i := FilaImporteDevengadoIni to FilaImporteDevengadoFin do
                             ImporteDevengado := ImporteDevengado + StrExcelToFloat(CellText[i, Columna], IsOpenOffice);
                          DMMain.Log(format('Importe Devengado: %f', [ImporteDevengado]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Devengado' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          // ImporteSeguridadSocial := StrExcelToFloat(CellText[FilaImporteSeguridadSocial, Columna], IsOpenOffice);
                          for i := FilaImporteDeduccionesIni to FilaImporteDeduccionesFin do
                          begin
                             if (i <> FilaImporteEmbargo) and (i <> FilaImporteAnticipo) then
                                ImporteDeducido := ImporteDeducido + StrExcelToFloat(CellText[i, Columna], IsOpenOffice);
                          end;
                          DMMain.Log(format('Importe Deducido: %f', [ImporteDeducido]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Deducido' + #13#10 + s + #13#10 + E.Message);
                       end;

                       ImporteDevengado := ImporteDevengado - ImporteDeducido;
                       DMMain.Log(format('Importe Devengado = (Devengado-Deducido): %f', [ImporteDevengado]));

                       try
                          for i := FilaImporteSeguridadSocialIni to FilaImporteSeguridadSocialFin do
                             ImporteSeguridadSocial := ImporteSeguridadSocial + StrExcelToFloat(CellText[i, Columna], IsOpenOffice);
                          DMMain.Log(format('Importe Seguridad Social: %f', [ImporteSeguridadSocial]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Seguridad Social' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteRetencion := StrExcelToFloat(CellText[FilaImporteRetencion, Columna], IsOpenOffice);
                          DMMain.Log(format('Importe Retencion: %f', [ImporteRetencion]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Retencion' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteSeguridadSocialEmpresa := StrExcelToFloat(CellText[FilaImporteSeguridadSocialEmpresa, Columna], IsOpenOffice);
                          DMMain.Log(format('Importe Seguridad Social Empresa: %f', [ImporteSeguridadSocialEmpresa]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Seguridad Social Empresa' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteEmbargo := StrExcelToFloat(CellText[FilaImporteEmbargo, Columna], IsOpenOffice);
                          DMMain.Log(format('Importe Embargo: %f', [ImporteEmbargo]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Embargo' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteRemuneracion := (ImporteDevengado - ImporteRetencion - ImporteSeguridadSocial - ImporteEmbargo);
                          {
                          // Tiene una formula (=(D29-D39)) y OpenOffice la devuelve en vez del valor.
                          if (IsOpenOffice) then
                             ImporteRemuneracion := (ImporteDevengado - ImporteRetencion - ImporteSeguridadSocial)
                          else
                             ImporteRemuneracion := StrExcelToFloat(CellText[FilaImporteRemuneracion, Columna], IsOpenOffice);
                          }
                          DMMain.Log(format('Importe Remuneracion: %f', [ImporteRemuneracion]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Remuneracion' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteCERETA := StrExcelToFloat(CellText[FilaImporteCERETA, Columna], IsOpenOffice);
                          DMMain.Log(format('Importe CRETA: %f', [ImporteCERETA]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe CRETA' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteCobroEspecieAutonomo := StrExcelToFloat(CellText[FilaImporteCobroEspecieAutonomo, Columna], IsOpenOffice);
                          DMMain.Log(format('Importe Cobro Especie Autonomo: %f', [ImporteCobroEspecieAutonomo]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Cobro Especie Autonomo' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteICECES := StrExcelToFloat(CellText[FilaImporteICECES, Columna], IsOpenOffice);
                          DMMain.Log(format('Importe ICECES: %f', [ImporteICECES]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe ICECES' + #13#10 + s + #13#10 + E.Message);
                       end;

                       // Si existe la nómina
                       if not ExisteNomina(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, Empleado, Periodo) then
                       begin
                          DMMain.Log(format('Inserta Nomina. Empleado: %d - Periodo: %s', [Empleado, Periodo]));
                          InsertaNomina(Empleado, Periodo, PeriodoHacienda, ImporteDevengado, ImporteRetencion, ImporteRemuneracion, ImporteSeguridadSocial, ImporteSeguridadSocialEmpresa, ImporteCERETA, ImporteCobroEspecieAutonomo, ImporteICECES, ImporteEmbargo);
                       end
                       else
                       begin
                          DMMain.Log(format('Ya existe nomina para Empleado: %d - Periodo: %s', [Empleado, Periodo]));
                       end;
                    end
                    else
                    begin
                       ShowMessage(format(_('No se encuentra empleado para trabajador %s.'), [Trabajador]));
                       DMMain.Log(format('No se encuentra empleado para trabajador %s.', [Trabajador]));
                    end;
                 end;
              finally
                 DMMain.LogFin('');
              end;

              Inc(Columna);
           end;
        finally
           DMMain.Log('Sleep');
           Sleep(2500);
           DMMain.Log('Free.');
           Free;
        end;
     end;

     DMMain.Log('QMNominas.Close');
     QMNominas.Close;
     DMMain.Log('QMNominas.Open');
     QMNominas.Open;
  finally
     DMMain.LogFin('');
  end;
end;

function TDMNominas.ImportacionNominas3(Archivo, PeriodoHacienda: string): boolean;
const
  Columna_Periodo = 1;
  Fila_Periodo = 4;
  Primera_Fila_Datos = 10;
  ColumnaCodGestoria = 2;
  ColumnaTrabajador = 4;                     // NIF del empleado
  ColumnaTipoPaga = 5;                       // Tipo Paga
  ColumnaImporteDevengado = 7;               // Bruto
  ColumnaImporteSeguridadSocial = 15;        // Prest.SS
  ColumnaImporteRetencion = 9;               // IRPF
  ColumnaImporteRemuneracion = 10;           // Neto
  ColumnaImporteSeguridadSocialEmpresa = 14; // Prest.Emp
  ColumnaImporteCERETA = 20;                 // ??
  ColumnaImporteCobroEspecieAutonomo = 20;   // ??
  ColumnaImporteICECES = 20;                 // ??
var
  HCalc : THojaCalc;
  SheetNo : integer;
  Fila, Empleado : integer;
  aLastRow, aLastCol : integer;
  s, Periodo, TipoPaga, Trabajador : string;
  ImporteDevengado, ImporteSeguridadSocial, ImporteRetencion, ImporteRemuneracion, ImporteSeguridadSocialEmpresa : double;
  ImporteCERETA, ImporteCobroEspecieAutonomo, ImporteICECES, ImporteEmbargo : double;
begin
  /// Importacion de Nominas Kenned.
  /// Una solapa por centro
  ///
  /// A4 Periodo de nomina = "DEL 01/02/2022 AL 28/02/2022"
  /// A6 Centro = "Centro:    1-KENNED GROUP S.L."; "Centro:    1-KENNED GROUP S.L."; etc.
  /// Los datos empiezan en fila 9
  /// Los datos terminan cuando An = "TOTAL CENTRO"
  /// B = Codigo Gestoria
  /// C = Nombre
  /// D = NIF
  /// E = Tipo Paga = "MENSUAL"; "ATRASOS"; "FINIQUITO"; ???
  /// E = Fec. Cobro
  /// G-S = Importes

  DMMain.LogIni('ImportacionNominas *3* ' + Archivo);
  try
     Result := True;

     HCalc := THojaCalc.Create(Archivo, True);
     with HCalc do
     begin
        try
           FileName := Archivo; //Needs a file name before you SaveDoc!

           // Recorro solapas. Hay una por centro.
           for SheetNo := 1 to CountSheets do
           begin
              ActivateSheetByIndex(SheetNo);
              DMMain.Log(format('ActivateSheetByIndex: %d', [SheetNo]));

              aLastRow := LastRow;
              aLastCol := LastCol;
              DMMain.Log(format('LastRow: %d', [aLastRow]));
              DMMain.Log(format('LastCol: %d', [aLastCol]));

              if (IsOpenOffice) then
                 DMMain.Log('IsOpenOffice')
              else
                 DMMain.Log('IsExcel');

              try
                 Periodo := Trim(CellText[Fila_Periodo, Columna_Periodo]);
                 DMMain.Log(format('Periodo: %s', [Periodo]));
              except
                 on E: Exception do
                    ShowMessage('Error Periodo' + #13#10 + Periodo + #13#10 + E.Message);
              end;

              Fila := Primera_Fila_Datos;
              while (Trim(CellText[Fila, 1]) = '') do
              begin
                 // Obtengo datos del Trabajador (NIF del trabajador)
                 Trabajador := Trim(CellText[Fila, ColumnaTrabajador]);
                 DMMain.Log(format('Trabajador RAW: %s', [Trabajador]));

                 Trabajador := Trim(LimpiaCeldaExcel(Trabajador));
                 DMMain.Log(format('Trabajador STR: %s', [Trabajador]));

                 // Si el campo esta en blanco no se importa la linea
                 if (Trabajador > '') then
                 begin
                    // Empleado := DameEmpleadoSegunCodigoGestoria(Trabajador);
                    Empleado := DameEmpleadoSegunNIF(Trabajador);
                    DMMain.Log(format('Empleado: %d', [Empleado]));

                    // Si existe el empleado
                    if (Empleado > 0) then
                    begin
                       // Inicializo datos
                       Trabajador := '';
                       TipoPaga := '';
                       ImporteDevengado := 0;
                       ImporteSeguridadSocial := 0;
                       ImporteRetencion := 0;
                       ImporteRemuneracion := 0;
                       ImporteSeguridadSocialEmpresa := 0;
                       ImporteCERETA := 0;
                       ImporteCobroEspecieAutonomo := 0;
                       ImporteICECES := 0;

                       try
                          TipoPaga := Trim(CellText[Fila, ColumnaTipoPaga]);
                          DMMain.Log(format('TipoPaga: %s', [TipoPaga]));
                       except
                          on E: Exception do
                             ShowMessage('Error TipoPaga' + #13#10 + TipoPaga + #13#10 + E.Message);
                       end;

                       try
                          ImporteDevengado := StrExcelToFloat(CellText[Fila, ColumnaImporteDevengado], IsOpenOffice);
                          DMMain.Log(format('Importe Devengado: %f', [ImporteDevengado]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Devengado' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteSeguridadSocial := StrExcelToFloat(CellText[Fila, ColumnaImporteSeguridadSocial], IsOpenOffice);
                          DMMain.Log(format('Importe Seguridad Social: %f', [ImporteSeguridadSocial]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Seguridad Social' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteRetencion := StrExcelToFloat(CellText[Fila, ColumnaImporteRetencion], IsOpenOffice);
                          DMMain.Log(format('Importe Retencion: %f', [ImporteRetencion]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Retencion' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteSeguridadSocialEmpresa := StrExcelToFloat(CellText[Fila, ColumnaImporteSeguridadSocialEmpresa], IsOpenOffice);
                          DMMain.Log(format('Importe Seguridad Social Empresa: %f', [ImporteSeguridadSocialEmpresa]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Seguridad Social Empresa' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteRemuneracion := StrExcelToFloat(CellText[Fila, ColumnaImporteRemuneracion], IsOpenOffice);
                          DMMain.Log(format('Importe Remuneracion: %f', [ImporteRemuneracion]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Remuneracion' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteCERETA := StrExcelToFloat(CellText[Fila, ColumnaImporteCERETA], IsOpenOffice);
                          DMMain.Log(format('Importe CRETA: %f', [ImporteCERETA]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe CRETA' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteCobroEspecieAutonomo := StrExcelToFloat(CellText[Fila, ColumnaImporteCobroEspecieAutonomo], IsOpenOffice);
                          DMMain.Log(format('Importe Cobro Especie Autonomo: %f', [ImporteCobroEspecieAutonomo]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Cobro Especie Autonomo' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteICECES := StrExcelToFloat(CellText[Fila, ColumnaImporteICECES], IsOpenOffice);
                          DMMain.Log(format('Importe ICECES: %f', [ImporteICECES]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe ICECES' + #13#10 + s + #13#10 + E.Message);
                       end;

                       ImporteEmbargo := 0;

                       // Si existe la nómina
                       DMMain.Log(format('ExisteNomina(Empleado: %d Periodo: %s)', [Empleado, Trim(Periodo + ' ' + TipoPaga)]));
                       if not ExisteNomina(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, Empleado, Trim(Periodo + ' ' + TipoPaga)) then
                       begin
                          InsertaNomina(Empleado, Trim(Periodo + ' ' + TipoPaga), PeriodoHacienda, ImporteDevengado, ImporteRetencion, ImporteRemuneracion, ImporteSeguridadSocial, ImporteSeguridadSocialEmpresa, ImporteCERETA, ImporteCobroEspecieAutonomo, ImporteICECES, ImporteEmbargo);
                          DMMain.Log(format('Inserta Nomina. Empleado: %d Periodo: %s', [Empleado, Trim(Periodo + ' ' + TipoPaga)]));
                       end
                       else
                       begin
                          DMMain.Log(format('Ya existe nomina para Empleado: %d - Periodo: %s', [Empleado, Trim(Periodo + ' ' + TipoPaga)]));
                       end;
                    end
                    else
                    begin
                       ShowMessage(format(_('No se encuentra empleado para "%s."'), [Trabajador]));
                       DMMain.Log(format('No se encuentra empleado para trabajador %s', [Trabajador]));
                    end;
                 end;

                 Inc(Fila);

              end;
           end;
           (*
           // Establezco pestaña activa para que funcione LastRow/LasCol
           ActivateSheetByIndex(1);
           aLastRow := LastRow;
           aLastCol := LastCol;
           DMMain.Log(format('LastRow: %d', [aLastRow]));
           DMMain.Log(format('LastCol: %d', [aLastCol]));
           if (IsOpenOffice) then
              DMMain.Log('IsOpenOffice')
           else
              DMMain.Log('IsExcel');

           try
              Periodo := Trim(CellText[Fila_Periodo, Columna_Periodo]);
              DMMain.Log(format('Periodo: %s', [Periodo]));
           except
              on E: Exception do
                 ShowMessage('Error Periodo' + #13#10 + Periodo + #13#10 + E.Message);
           end;

           for Fila := Primera_Fila_Datos to LastRow - 1 do
           begin
              DMMain.LogIni(format(' Fila: %d de %d', [Fila, LastRow]));
              try
                 // Obtengo datos del Trabajador
                 try
                    Trabajador := Trim(CellText[Fila, ColumnaTrabajador]);
                    DMMain.Log(format('Trabajador RAW: %s', [Trabajador]));

                    // Elimino comilla inicial, si la tiene
                    if (Copy(Trabajador, 1, 1) = '''') then
                    begin
                       DMMain.Log('Limpiando comilla inicial de Trabajador');
                       Trabajador := StringReplace(Trabajador, '''', '', []);
                    end;

                    Trabajador := Trim(Trabajador);
                    DMMain.Log(format('Trabajador STR: %s', [Trabajador]));
                 except
                    on E: Exception do
                       ShowMessage('Error Trabajador' + #13#10 + Trabajador + #13#10 + E.Message);
                 end;

                 // Si el campo esta en blanco no se importa la linea
                 if (Trabajador > '') then
                 begin
                    // Empleado := DameEmpleadoSegunCodigoGestoria(Trabajador);
                    // MICAMOL - Busco el empleado que tenga el NIF que viene en esta columna
                    Empleado := DameEmpleadoSegunNIF(Trabajador);
                    DMMain.Log(format('Empleado: %d', [Empleado]));

                    // Si existe el empleado
                    if (Empleado > 0) then
                    begin
                       // Inicializo datos
                       Trabajador := '';
                       ImporteDevengado := 0;
                       ImporteSeguridadSocial := 0;
                       ImporteRetencion := 0;
                       ImporteRemuneracion := 0;
                       ImporteSeguridadSocialEmpresa := 0;
                       ImporteCERETA := 0;
                       ImporteCobroEspecieAutonomo := 0;
                       ImporteICECES := 0;

                       try
                          ImporteDevengado := StrExcelToFloat(CellText[Fila, ColumnaImporteDevengado], IsOpenOffice);
                          DMMain.Log(format('Importe Devengado: %f', [ImporteDevengado]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Devengado' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteSeguridadSocial := StrExcelToFloat(CellText[Fila, ColumnaImporteSeguridadSocial], IsOpenOffice);
                          DMMain.Log(format('Importe Seguridad Social: %f', [ImporteSeguridadSocial]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Seguridad Social' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteRetencion := StrExcelToFloat(CellText[Fila, ColumnaImporteRetencion], IsOpenOffice);
                          DMMain.Log(format('Importe Retencion: %f', [ImporteRetencion]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Retencion' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteSeguridadSocialEmpresa := StrExcelToFloat(CellText[Fila, ColumnaImporteSeguridadSocialEmpresa], IsOpenOffice);
                          DMMain.Log(format('Importe Seguridad Social Empresa: %f', [ImporteSeguridadSocialEmpresa]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Seguridad Social Empresa' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          // MICAMOL tiene una formula y OpenOffice la devuelve en vez del valor.
                          if (IsOpenOffice) then
                             ImporteRemuneracion := (ImporteDevengado - ImporteRetencion - ImporteSeguridadSocial)
                          else
                             ImporteRemuneracion := StrExcelToFloat(CellText[Fila, ColumnaImporteRemuneracion], IsOpenOffice);
                          DMMain.Log(format('Importe Remuneracion: %f', [ImporteRemuneracion]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Remuneracion' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteCERETA := StrExcelToFloat(CellText[Fila, ColumnaImporteCERETA], IsOpenOffice);
                          DMMain.Log(format('Importe CRETA: %f', [ImporteCERETA]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe CRETA' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteCobroEspecieAutonomo := StrExcelToFloat(CellText[Fila, ColumnaImporteCobroEspecieAutonomo], IsOpenOffice);
                          DMMain.Log(format('Importe Cobro Especie Autonomo: %f', [ImporteCobroEspecieAutonomo]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe Cobro Especie Autonomo' + #13#10 + s + #13#10 + E.Message);
                       end;

                       try
                          ImporteICECES := StrExcelToFloat(CellText[Fila, ColumnaImporteICECES], IsOpenOffice);
                          DMMain.Log(format('Importe ICECES: %f', [ImporteICECES]));
                       except
                          on E: Exception do
                             ShowMessage('Error Importe ICECES' + #13#10 + s + #13#10 + E.Message);
                       end;

                       ImporteEmbargo := 0;

                       // Si existe la nómina
                       if not ExisteNomina(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, Empleado, Periodo
{$IFDEF Debug}+ '-'+IntToStr(Fila){$ENDIF}
                          ) then
                       begin
                          InsertaNomina(Empleado, Periodo, PeriodoHacienda
{$IFDEF Debug}+ '-'+IntToStr(Fila){$ENDIF}
                             , ImporteDevengado, ImporteRetencion, ImporteRemuneracion, ImporteSeguridadSocial, ImporteSeguridadSocialEmpresa, ImporteCERETA, ImporteCobroEspecieAutonomo, ImporteICECES, ImporteEmbargo);
                          DMMain.Log(format('Inserta Nomina. Empleado: %d Periodo: %s', [Empleado, Periodo]));
                       end
                       else
                       begin
                          DMMain.Log(format('Ya existe nomina para Empleado: %d - Periodo: %s', [Empleado, Periodo]));
                       end;
                    end
                    else
                    begin
                       ShowMessage(format(_('No se encuentra empleado para "%s."'), [Trabajador]));
                       DMMain.Log(format('No se encuentra empleado para trabajador %s', [Trabajador]));
                    end;
                 end;
              finally
                 DMMain.LogFin('');
              end;
           end;
        *)
        finally
           DMMain.Log('Sleep');
           Sleep(5000);
           DMMain.Log('Free.');
           Free;
        end;
     end;

     DMMain.Log('QMNominas.Close');
     QMNominas.Close;
     DMMain.Log('QMNominas.Open');
     QMNominas.Open;
  finally
     DMMain.LogFin('');
  end;
end;

function TDMNominas.DameEmpleadoSegunCodigoGestoria(CodigoGestoria: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPLEADO FROM OPE_EMPLEADO WHERE EMPRESA = :EMPRESA AND CODIGO_GESTORIA = :CODIGO_GESTORIA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CODIGO_GESTORIA'].AsString := Copy(CodigoGestoria, 1, 25);
        ExecQuery;
        Result := FieldByName['EMPLEADO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMNominas.DameEmpleadoSegunNIF(NIF: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT E.EMPLEADO FROM OPE_EMPLEADO E ');
        SQL.Add(' JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO ');
        SQL.Add(' WHERE ');
        SQL.Add(' E.EMPRESA = :EMPRESA AND ');
        SQL.Add(' T.NIF = :NIF ');
        SQL.Add(' ORDER BY E.EMPLEADO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['NIF'].AsString := Copy(NIF, 1, 20);
        ExecQuery;
        Result := FieldByName['EMPLEADO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMNominas.InsertaNomina(Empleado: integer; Periodo, PeriodoHacienda: string; Imp_devengado, Imp_retencion, Imp_remuneracion, Imp_seg_social, Imp_seg_social_empresa, ImporteCERETA, ImporteCobroEspecieAutonomo, ImporteICECES, ImporteEmbargo: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO EMP_NOMINAS ');
        SQL.Add(' (EMPRESA, EJERCICIO, CANAL, EMPLEADO, PERIODO, PERIODO_HACIENDA, ');
        SQL.Add(' IMP_DEVENGADO, IMP_RETENCION, IMP_REMUNERACION, IMP_SEG_SOCIAL, ');
        SQL.Add(' IMP_SEG_SOCIAL_EMPRESA, IMP_CE_RETA, IMP_COBROS_ESPECIE, IMP_ICECES, IMP_EMBARGO, ENTRADA) ');
        SQL.Add(' VALUES ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :EMPLEADO, :PERIODO, :PERIODO_HACIENDA, ');
        SQL.Add(' :IMP_DEVENGADO, :IMP_RETENCION, :IMP_REMUNERACION, :IMP_SEG_SOCIAL, ');
        SQL.Add(' :IMP_SEG_SOCIAL_EMPRESA, :IMP_CE_RETA, :IMP_COBROS_ESPECIE, :IMP_ICECES, :IMP_EMBARGO, :ENTRADA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['EMPLEADO'].AsInteger := Empleado;
        Params.ByName['PERIODO'].AsString := Periodo;
        Params.ByName['PERIODO_HACIENDA'].AsString := PeriodoHacienda;
        Params.ByName['IMP_DEVENGADO'].AsDouble := Imp_devengado;
        Params.ByName['IMP_RETENCION'].AsDouble := Imp_retencion;
        Params.ByName['IMP_REMUNERACION'].AsDouble := Imp_remuneracion;
        Params.ByName['IMP_SEG_SOCIAL'].AsDouble := Imp_seg_social;
        Params.ByName['IMP_SEG_SOCIAL_EMPRESA'].AsDouble := Imp_seg_social_empresa;
        Params.ByName['IMP_CE_RETA'].AsDouble := ImporteCERETA;
        Params.ByName['IMP_COBROS_ESPECIE'].AsDouble := ImporteCobroEspecieAutonomo;
        Params.ByName['IMP_ICECES'].AsDouble := ImporteICECES;
        Params.ByName['IMP_EMBARGO'].AsDouble := ImporteEmbargo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMNominas.ExisteNomina(Empresa, Ejercicio, Canal, Empleado: integer; Periodo: string): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID FROM EMP_NOMINAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' EMPLEADO = :EMPLEADO AND ');
        SQL.Add(' PERIODO = :PERIODO ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['EMPLEADO'].AsInteger := Empleado;
        Params.ByName['PERIODO'].AsString := Periodo;
        ExecQuery;
        Result := (FieldByName['ID'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMNominas.QMAnticiposBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMAnticiposANTICIPO.AsInteger = 0)) then
     QMAnticiposANTICIPO.AsInteger := DMMain.Contador_EEC('ANE');

  if (QMAnticiposPAGADO.AsInteger = 1) then
     QMAnticiposEJERCICIO_PAGO.AsInteger := REntorno.Ejercicio;

  if (QMAnticiposCTA_PAGO_PGC.AsInteger = 0) then
     QMAnticiposCTA_PAGO_PGC.AsInteger := REntorno.PGC;

  QMAnticiposENTRADA.AsInteger := REntorno.Entrada;

  QMNominasCTA_PAGO.AsString := ExpandirCadena(Trim(QMNominasCTA_PAGO.AsString), REntorno.DigitosSub);
end;

procedure TDMNominas.QMNominasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(QMNominas, 'CONTA_NOMINAS', 'ID');

  if ((QMNominasCERRADO.AsInteger = 1) and (QMNominasEJERCICIO_CIERRE.AsInteger <= 0)) then
     QMNominasEJERCICIO_CIERRE.AsInteger := REntorno.Ejercicio;

  if ((QMNominasPAGADO.AsInteger = 1) and (QMNominasEJERCICIO_PAGO.AsInteger <= 0)) then
     QMNominasEJERCICIO_PAGO.AsInteger := REntorno.Ejercicio;

  if ((QMNominasPAGADO.AsInteger = 1) and (QMNominasCTA_PAGO.AsString = '')) then
     QMNominasCTA_PAGO.AsString := DameCuentaBanco(Banco);

  QMNominasENTRADA.AsInteger := REntorno.Entrada;

  QMNominasCTA_PAGO.AsString := ExpandirCadena(Trim(QMNominasCTA_PAGO.AsString), REntorno.DigitosSub);
end;

procedure TDMNominas.QMAnticiposNewRecord(DataSet: TDataSet);
begin
  QMAnticiposEMPRESA.AsInteger := REntorno.Empresa;
  QMAnticiposEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMAnticiposCANAL.AsInteger := REntorno.Canal;
  QMAnticiposANTICIPO.AsInteger := 0;
  QMAnticiposLIQUIDADO.AsInteger := 0;
  QMAnticiposEJERCICIO_LIQUIDACION.AsInteger := 0;
  QMAnticiposPAGADO.AsInteger := 0;
  QMAnticiposEJERCICIO_PAGO.AsInteger := 0;
  QMAnticiposID_NOMINA.AsInteger := 0;
  QMAnticiposCTA_PAGO_PGC.AsInteger := REntorno.PGC;
end;

procedure TDMNominas.QMNominasNewRecord(DataSet: TDataSet);
begin
  QMNominasEMPRESA.AsInteger := REntorno.Empresa;
  QMNominasEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMNominasCANAL.AsInteger := REntorno.Canal;
  QMAnticiposCTA_PAGO_PGC.AsInteger := REntorno.PGC;
  QMNominasPERIODO_HACIENDA.AsString := '  ';
end;

procedure TDMNominas.FiltraAnticiposPendientes(Todas: boolean);
begin
  SoloAnticiposPendientes := not Todas;
  FiltraAnticipos;
end;

procedure TDMNominas.FiltraAnticipos;
begin
  with QMAnticipos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_NOMINAS_ANTICIPOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL ');
     if (SoloAnticiposPendientes) then
        SelectSQL.Add(' AND LIQUIDADO = 0 ');
     if (Periodo <> '00') then
        SelectSQL.Add(' AND PERIODO = ''' + Periodo + ''' ');
     if (Empleado <> 0) then
        SelectSQL.Add(' AND EMPLEADO = ' + IntToStr(Empleado));
     SelectSQL.Add(' ORDER BY ANTICIPO DESC ');
  end;

  DMMain.FiltraTabla(QMAnticipos, '11100');
end;

procedure TDMNominas.FiltraNominasPendientes(Todas: boolean);
begin
  SoloNominasPendientes := not Todas;
  FiltraNominas;
end;

procedure TDMNominas.Seleccionar(Todas: boolean);
var
  Marca : integer;
begin
  Marca := 0;
  if Todas then
     Marca := REntorno.Entrada;

  with QMNominas do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (QMNominasSELECCIONADO.AsInteger <> Marca) then
           begin
              Edit;
              QMNominasSELECCIONADO.AsInteger := Marca;
              Post;
           end;
           Next;
        end;
     finally
        EnableControls;
     end;
  end;
end;

function TDMNominas.SeleccionadasEstanCerradas: boolean;
begin
  Result := True;
  with QMNominas do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if ((QMNominasSELECCIONADO.AsInteger = REntorno.Entrada) and (QMNominasCERRADO.AsInteger = 0)) then
              Result := False;
           Next;
        end;
     finally
        EnableControls;
     end;

     if Result then
        First;
  end;
end;

function TDMNominas.SeleccionadasEstanPagadas: boolean;
begin
  Result := False;
  with QMNominas do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if ((QMNominasSELECCIONADO.AsInteger = REntorno.Entrada) and (QMNominasPAGADO.AsInteger = 1)) then
              Result := True;
           Next;
        end;
     finally
        EnableControls;
     end;

     if Result then
        First;
  end;
end;

procedure TDMNominas.ImprimirNorma34(Banco: integer);
begin
  with QMNominas do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (QMNominasSELECCIONADO.AsInteger = REntorno.Entrada) then
           begin
              // Utilizar este registro para orden de pago

           end;
           Next;
        end;

        First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMNominas.ImprimirNorma34_1(AFormato: integer; ASufijo: string; Banco: integer);
begin

end;

procedure TDMNominas.ImprimirNorma34_14(AFormato: integer; ASufijo: string; Banco: integer);
var
  Procesados : integer;
  Archivo : string;
  // EmitirSiempreTransferencia : boolean;
begin
  {Aformato se utilizara si hay bancos que pida diferencias con este formato}

  // Si EmitirSiempreTransferencia = ture, no tiene en cuenta el tipo de efecto
  // para decidir si hace transferencia o cheque
  // EmitirSiempreTransferencia := True;

  if (REntorno.Moneda <> 'EUR') then
     raise Exception.Create(_('La Norma 34 no está definida para esta moneda'));

  // Archivo := Format('OrdenPago_%s.txt', [FormatDateTime('yyyymmdd-hhnnss', Now)]);
  Archivo := Format('OrdenPago_Nominas-%d-%s.txt', [QMNominasEJERCICIO.AsInteger, QMNominasPERIODO_HACIENDA.AsString]);
  if MySaveDialog(Archivo, 'TXT', '', 'DMNominas') then
  begin
     // Datos del banco de la empresa
     with xBancoOrdPago do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.canal;
        Params.ByName['BANCO'].AsInteger := Banco;
        Open;
     end;

     // Datos del empleado
     xEmpleado.Open;

     Norma34_14.NomFichero := Archivo;
     Norma34_14.Modalidad := CVBNorma34_14CSB.moTransfer; {puede ser tambien moCheques}
     Norma34_14.Depura := False; {Si es true no genera exception y genera los registros que puede}
     Norma34_14.Formato := AFormato;

     Norma34_14.Abrir;

     {Cabecera de ordenante}
     Norma34_14.Ordenante := Copy(REntorno.CifEmpresa, 3, 9); {9}
     Norma34_14.Sufijo := ASufijo;
     Norma34_14.FecEnvSoporte := Now;
     Norma34_14.FecEmiOrdenes := REntorno.FechaTrab;
     Norma34_14.IBAN := xBancoOrdPagoIBAN.AsString;
     Norma34_14.BIC := xBancoOrdPagoBIC.AsString;
     Norma34_14.EntOrd := xBancoOrdPagoENTIDAD.AsString; {4}
     Norma34_14.SucOrd := xBancoOrdPagoSUCURSAL.AsString; {4}
     Norma34_14.cccOrd := xBancoOrdPagoCONTROL.AsString; {2 - Creo que es el dígito de control}
     Norma34_14.CtaOrd := xBancoOrdPagoCUENTA_CORRIENTE.AsString; {10}

     Norma34_14.NomOrd := REntorno.NombreEmpresa;
     Norma34_14.DomOrd := REntorno.DirEmpresa;
     Norma34_14.PlzOrd := REntorno.PobEmpresa;
     Norma34_14.ProvOrd := REntorno.ProvEmpresa;
     Norma34_14.PaisOrd := DamePaisC2(REntorno.Pais);
     Norma34_14.Concepto := '1'; // Nomina

     Norma34_14.DetallCgo := '0';
     Norma34_14.TipoPersonaOrd := '1'; // Ordenante puede ser 1-Organizacion 2-Persona

     Norma34_14.CompCabecera;

     { Introducimos datos de los recibos nacionales }

     Procesados := 0; {cuento los procesados para saber si tengo que hacer un registro de totales o no}

     with QMNominas do
     begin
        First;

        {Avanzo hasta encontrar un recibo a zona SEPA (España, intracomunitario, Noruega, Lichtenstein, Suiza e Islandia), NO cheque}
        while (not EOF) and
           (
              (not ((xEmpleadoPERTENECE_CEE.AsInteger = 1) or
              (xEmpleadoPAIS_C2.AsString = 'NO') or
              (xEmpleadoPAIS_C2.AsString = 'LI') or
              (xEmpleadoPAIS_C2.AsString = 'CH') or
              (xEmpleadoPAIS_C2.AsString = 'IC')))
           ) do
           Next;
     end;

     {Registro de cabecera ordenante de transferencias SEPA (Paises EURO)}
     if (not QMNominas.EOF) then
        Norma34_14.CompCabeceraSEPA;

     {Registros de beneficiario de transferencia SEPA}
     while (not QMNominas.EOF) do
     begin
        if (QMNominasSELECCIONADO.AsInteger = REntorno.Entrada) then
        begin
           // Marco la nomina como pagada en el banco seleccinoado
           QMNominas.Edit;
           QMNominasCTA_PAGO.AsString := xBancoOrdPagoCUENTA_CONTABLE.AsString;
           QMNominasPAGADO.AsInteger := 1;
           QMNominas.Post;

           Norma34_14.Gastos := '1'; {1 - 1 Ordenante, 2 Beneficiario, 3 compartidos}
           Norma34_14.Concepto := '1'; {1 - 1 Nomina, 8 Pension o 9 Otros Conceptos}
           Norma34_14.InstruccionOrden := '1'; {1 - Instruccion de orden de abono directo por cuenta, 1 si, 2 no}
           Norma34_14.PaisBen := xEmpleadoPAIS_C2.AsString;

           Norma34_14.DNIBen := QuitaPaisDeNIF(xEmpleadoNIF.AsString); {9}
           Norma34_14.NomBen := xEmpleadoNOMBRE_R_SOCIAL.AsString; {70}
           Norma34_14.NIdBen := ''; {18}
           Norma34_14.Referencia := xEmpleadoNIF.AsString; {12 - Debe ser el nif}
           Norma34_14.DomBen := xEmpleadoDIR_COMPLETA_N.AsString; {50}
           Norma34_14.CPTLPlzBen := xEmpleadoCODPOSTAL.AsString + ' ' + xEmpleadoTITULO_LOCALIDAD.AsString; {36}
           Norma34_14.ProvBen := xEmpleadoTITULO_PROVINCIA.AsString; {36}
           Norma34_14.EntBen := xEmpleadoENTIDAD.AsString; {4}
           Norma34_14.SucBen := xEmpleadoSUCURSAL.AsString; {4}
           Norma34_14.cccBen := xEmpleadoCONTROL.AsString; {2 - Dígito de control}
           Norma34_14.CtaBen := xEmpleadoCUENTA.AsString; {10}
           Norma34_14.IBAN := xEmpleadoIBAN.AsString;
           Norma34_14.BIC := xEmpleadoBIC.AsString;
           Norma34_14.Importe := QMNominasIMP_PAGADO.AsCurrency;
           Norma34_14.ConcepBen := _('Nómina') + ' ' + QMNominasPERIODO.AsString; {36}

           Norma34_14.CompRegistroSEPA;
           Inc(Procesados);
        end;

        QMNominas.Next;

        {Avanzo hasta encontrar un recibo a zona SEPA (España, intracomunitario, Noruega, Lichtenstein, Suiza e Islandia), NO cheque}
        while (not QMNominas.EOF) and
           (
              (not ((xEmpleadoPERTENECE_CEE.AsInteger = 1) or
              (xEmpleadoPAIS_C2.AsString = 'NO') or
              (xEmpleadoPAIS_C2.AsString = 'LI') or
              (xEmpleadoPAIS_C2.AsString = 'CH') or
              (xEmpleadoPAIS_C2.AsString = 'IC')))
           ) do
           QMNominas.Next;
     end; {while not EOF}

     if (Procesados > 0) then
        Norma34_14.CerrarSEPA;

     { TODO : Faltan pagos 'NO zona SEPA y NO cheque'}
     { TODO : Faltan pagos 'Cheque' }

     Norma34_14.Cerrar;

     ShowMessage(_('Se ha creado la norma 34.14'));
  end;

  xBancoOrdPago.Close;
  xEmpleado.Close;

  QMNominas.First;
end;

procedure TDMNominas.ImprimirSEPA(AFormato: integer; ASufijo: string; Banco: integer);
var
  // Procesados : integer;
  EmitirSiempreTransferencia : boolean;
  x : TSEPA;
  aux : string;
  OrderId : string;
  Pais : string;
  i : integer;
  SubType : string;
  CtgyPurpCd : string;
  Concepto : string;
  Archivo : string;
  Continuar : boolean;
  FechaPago : TDateTime;
begin
  // AFormato se utilizara si hay bancos que pida diferencias con este formato

  // Verifico que todos los empleados tengan IBAN informado
  Continuar := True;
  try
     QMNominas.DisableControls;
     QMNominas.First;
     xEmpleado.Open;
     while Continuar and (not QMNominas.EOF) do
     begin
        if (QMNominasSELECCIONADO.AsInteger = REntorno.Entrada) then
        begin
           if (Trim(xEmpleadoIBAN.AsString) <= ' ') then
           begin
              ShowMessage(format(_('El empleado %s no tiene cuenta IBAN informada'), [xEmpleadoNOMBRE_R_SOCIAL.AsString]));
              Continuar := False;
           end;
        end;

        if Continuar then
           QMNominas.Next;
     end;
     xEmpleado.Close;
  finally
     QMNominas.EnableControls;
  end;

  {
  Inicia(...);
  AddPmtInf(...);
  AddTxInf(...);
  Finaliza;
  }

  if Continuar and (REntorno.Moneda <> 'EUR') then
     raise Exception.Create(_('La Norma no está definida para esta moneda'));

  // Si EmitirSiempreTransferencia = ture, no tiene en cuenta el tipo de efecto
  // para decidir si hace transferencia o cheque
  EmitirSiempreTransferencia := True;

  FechaPago := REntorno.FechaTrab;
  Continuar := PideDato('DAT', FechaPago, _('Fecha de Pago'));

  Archivo := Format('OrdenPago_Nominas-%d-%s.xml', [QMNominasEJERCICIO.AsInteger, QMNominasPERIODO_HACIENDA.AsString]);
  if Continuar and MySaveDialog(Archivo, 'XML', '', 'DMNominas') then
  begin
     with xBancoOrdPago do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := Banco;
        Open;
     end;

     x := TSEPA.Create(Self);
     try
        with x do
        begin
           Fichero := ChangeFileExt(Archivo, '.xml');

           // En el caso de ordenes de pago es NIF(9) Sufijo(3)
           Pais := DamePaisC2(REntorno.Pais);
           if (Length(REntorno.CifEmpresa) = 9) then
              OrderId := REntorno.CifEmpresa
           else
           if ((Length(REntorno.CifEmpresa) = 11) and (Copy(REntorno.CifEmpresa, 1, 2) = 'ES')) then
              OrderId := Copy(REntorno.CifEmpresa, 3, 9);
           aux := '';
           for i := 1 to Length(OrderId) do
              if ((OrderId[i] in ['A'..'Z', '0'..'9'])) then
                 aux := aux + OrderId[i];

           OrderId := aux + ASufijo;

           {
           Inicia(Tipo, Nombre, IBAN, BIC, OrderId, MsgId: string; IsOrg : boolean);
           }
           Inicia
           ('CT',
              REntorno.NombreEmpresa,
              xBancoOrdPago.FieldByName('IBAN').AsString,
              xBancoOrdPago.FieldByName('BIC').AsString,
              OrderId,
              Format('NOM%s', [FormatDateTime('yymmddhhnn', Now)]),
              False);

           // Datos del empleado
           xEmpleado.Open;

           with QMNominas do
           begin
              First;

              {Avanzo hasta encontrar un recibo a zona SEPA (España, intracomunitario, Noruega, Lichtenstein, Suiza e Islandia), NO cheque}
              while (not EOF) and
                 (
                    (not ((xEmpleadoPERTENECE_CEE.AsInteger = 1) or
                    (xEmpleadoPAIS_C2.AsString = 'NO') or
                    (xEmpleadoPAIS_C2.AsString = 'LI') or
                    (xEmpleadoPAIS_C2.AsString = 'CH') or
                    (xEmpleadoPAIS_C2.AsString = 'IC')))
                 ) do
                 Next;
           end;

           while (not QMNominas.EOF) do
           begin
              if (QMNominasSELECCIONADO.AsInteger = REntorno.Entrada) then
              begin
                 // Marco la nomina como pagada en el banco seleccinoado
                 QMNominas.Edit;
                 QMNominasFECHA_PAGO.AsDateTime := FechaPago;
                 QMNominasCTA_PAGO.AsString := xBancoOrdPagoCUENTA_CONTABLE.AsString;
                 QMNominasPAGADO.AsInteger := 1;
                 QMNominas.Post;

                 {
              AddPmtInf(SubType, SeqTp: string; TxSepa: boolean; ReqdDt: TDateTime; CtgyPurpCd, ChrgBr: string);
              // SubType :
              //    "TRF"  : Transferencia
              //    "CHK"  : Cheque bancario o cheque-nómina
              }
                 CtgyPurpCd := '';
                 if ((EmitirSiempreTransferencia) {or (xRecibosTIPO_EFECTO.AsString <> 'TAL')}) then
                 begin
                    SubType := 'TRF';

                    // PaymentTypeInformation, CategoryPurpose, Code
                    // Es opcional pero CatalunyaCaixa lo requiere
                    // Si otros bancos no se quejan asignaremos la categoria "OTHR (OTROS)" a la transaccion.
                    // SALA (Salary) y PENS (Pension) se utilizarian en el caso de nominas.
                    CtgyPurpCd := 'SALA';
                 end
                 else
                    SubType := 'CHK';

                 Concepto := _('Nómina') + ' ' + QMNominasPERIODO.AsString;

                 // El anteultimo parámetro también podría ser 'SUPP' (pagos a proveedores) u 'OTHR' (otros) o varios tipos mas.
                 AddPmtInf(SubType, 'NONE', True, Today, CtgyPurpCd, 'SLEV');
              {
              AddPmtInf(SubType, SeqTp: string; TxSepa: boolean; ReqdDt: TDateTime; CtgyPurpCd, ChrgBr: string);
              }
              {

              {
              AddTxInf(SubType, SeqTp: string; TxSepa: boolean; ReqdDt: TDateTime; CtgyPurpCd, Id: string; InstdAmt: double; Nombre, IBAN, BIC, RmtInf, MndtId: string; MndtSgntr: TDateTime; BBAN, Country, AdrLine1, AdrLine2: string);
              }
                 AddTxInf(
                    SubType,
                    'NONE',
                    True,
                    Today,
                    CtgyPurpCd,
                    '',
                    QMNominasIMP_PAGADO.AsCurrency,
                    xEmpleadoNOMBRE_R_SOCIAL.AsString,
                    xEmpleadoIBAN.AsString,
                    xEmpleadoBIC.AsString,
                    Concepto,
                    Concepto,
                    Now,
                    xEmpleadoENTIDAD.AsString + xEmpleadoSUCURSAL.AsString + xEmpleadoCONTROL.AsString + xEmpleadoCUENTA.AsString,
                    xEmpleadoPAIS_C2.AsString,
                    xEmpleadoDIR_COMPLETA_N.AsString,
                    xEmpleadoCODPOSTAL.AsString + ' ' + xEmpleadoTITULO_LOCALIDAD.AsString);
              end;

              QMNominas.Next;

              {Avanzo hasta encontrar un recibo a zona SEPA (España, intracomunitario, Noruega, Lichtenstein, Suiza e Islandia), NO cheque}
              while (not QMNominas.EOF) and
                 (
                    (not ((xEmpleadoPERTENECE_CEE.AsInteger = 1) or
                    (xEmpleadoPAIS_C2.AsString = 'NO') or
                    (xEmpleadoPAIS_C2.AsString = 'LI') or
                    (xEmpleadoPAIS_C2.AsString = 'CH') or
                    (xEmpleadoPAIS_C2.AsString = 'IC')))
                 ) do
                 QMNominas.Next;
           end;

           Finaliza;
        end;
     finally
        x.Free;
     end;

     xBancoOrdPago.Close;
     xEmpleado.Close;

     QMNominas.First;
  end;
end;

function TDMNominas.QuitaPaisDeNIF(NIF: string): string;
begin
  if (Length(NIF) = 9) then
     Result := NIF
  else
  begin
     Result := Copy(NIF, Length(NIF) - 9 + 1, 9);
  end;
end;

procedure TDMNominas.CerrarSeleccionados;
var
  FechaCierre : TDateTime;
begin
  FechaCierre := REntorno.FechaTrab;
  if PideDato('DAT', FechaCierre, _('Fecha de Cierre')) then
  begin
     with QMNominas do
     begin
        DisableControls;
        try
           First;
           while not EOF do
           begin
              if ((QMNominasSELECCIONADO.AsInteger = REntorno.Entrada) and (QMNominasCERRADO.AsInteger = 0)) then
              begin
                 Edit;
                 QMNominasFECHA_CIERRE.AsDateTime := FechaCierre;
                 QMNominasCERRADO.AsInteger := 1;
                 Post;
              end;
              Next;
           end;

           First;
        finally
           EnableControls;
        end;
     end;
  end;
end;

function TDMNominas.DameCuentaBanco(Banco: integer): string;
begin
  Result := '';
  if (Banco > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT CUENTA_CC FROM CON_CUENTAS_GES_BAN WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND BANCO=?BANCO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['BANCO'].AsInteger := Banco;
           ExecQuery;
           Result := FieldByName['CUENTA_CC'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMNominas.PagarSeleccionados;
var
  Cuenta : string;
  FechaPago : TDateTime;
begin
  FechaPago := REntorno.FechaTrab;
  if PideDato('DAT', FechaPago, _('Fecha de Pago')) then
  begin
     Cuenta := DameCuentaBanco(Banco);
     with QMNominas do
     begin
        DisableControls;
        try
           First;
           while not EOF do
           begin
              if ((QMNominasSELECCIONADO.AsInteger = REntorno.Entrada) and (QMNominasPAGADO.AsInteger = 0)) then
              begin
                 Edit;
                 QMNominasFECHA_PAGO.AsDateTime := FechaPago;
                 QMNominasCTA_PAGO.AsString := Cuenta;
                 QMNominasPAGADO.AsInteger := 1;
                 Post;
              end;
              Next;
           end;

           First;
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TDMNominas.QMNominasEMPLEADOChange(Sender: TField);
begin
  QMNominasNOMBRE_R_SOCIAL.AsString := DameTituloEmpleado(QMNominasEMPLEADO.AsInteger);
end;

procedure TDMNominas.CambiaBanco(aBanco: integer);
begin
  Banco := aBanco;
end;

procedure TDMNominas.QMNominasAfterPost(DataSet: TDataSet);
begin
  Refrescar(QMAnticipos, 'ID', QMAnticiposID.AsInteger);
end;

procedure TDMNominas.FiltraNominas;
begin
  with QMNominas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_NOMINAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL ');
     if (SoloNominasPendientes) then
        SelectSQL.Add(' AND PAGADO = 0 ');
     if (Periodo <> '00') then
        SelectSQL.Add(' AND PERIODO_HACIENDA = ''' + Periodo + ''' ');
     if (Empleado <> 0) then
        SelectSQL.Add(' AND EMPLEADO = ' + IntToStr(Empleado));
     SelectSQL.Add(' ORDER BY PERIODO_HACIENDA DESC, EMPLEADO ');
  end;

  DMMain.FiltraTabla(QMNominas, '11100');
end;

procedure TDMNominas.FiltraPeriodo(aPeriodo: string);
begin
  Periodo := aPeriodo;
  FiltraNominas;
  FiltraAnticipos;
end;

procedure TDMNominas.FiltraEmpleado(aEmpleado: integer);
begin
  Empleado := aEmpleado;
  FiltraNominas;
  FiltraAnticipos;
end;

end.
