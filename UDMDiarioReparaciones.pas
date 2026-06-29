unit UDMDiarioReparaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet;

type
  TDMDiarioReparaciones = class(TDataModule)
     QMCabReparar: TFIBTableSet;
     TLocal: THYTransaction;
     DSCabReparar: TDataSource;
     TUpdate: THYTransaction;
     QMCabRepararIDCABREPARAR: TIntegerField;
     QMCabRepararNOMBRE_R_SOCIAL_CLIENTE: TFIBStringField;
     QMCabRepararFECHA: TDateTimeField;
     QMCabRepararFECHA_AVISO: TDateTimeField;
     QMCabRepararFECHA_ENTRADA: TDateTimeField;
     QMCabRepararFECHA_PREV_SALIDA: TDateTimeField;
     QMCabRepararFECHA_HORA_CIERRE: TDateTimeField;
     QMCabRepararFECHA_HORA_CIERRE_ITV: TDateTimeField;
     QMCabRepararTIPO: TFIBStringField;
     QMCabRepararSERIE: TFIBStringField;
     QMCabRepararRIG: TIntegerField;
     QMCabRepararFORMA_PAGO: TFIBStringField;
     QMCabRepararS_BASES: TFloatField;
     QMCabRepararS_CUOTA_IVA: TFloatField;
     QMCabRepararMATERIALES: TFloatField;
     QMCabRepararTITULO_EMPLEADOS_TAREAS: TFIBStringField;
     QMCabRepararCLIENTE: TIntegerField;
     QMCabRepararID_S: TIntegerField;
     xDiarioFac: TFIBTableSet;
     DSxDiarioFac: TDataSource;
     xDiarioFacTIPO: TFIBStringField;
     xDiarioFacFECHA: TDateTimeField;
     xDiarioFacEJERCICIO: TIntegerField;
     xDiarioFacSERIE_DOC: TFIBStringField;
     xDiarioFacRIG: TIntegerField;
     xDiarioFacID_S: TIntegerField;
     xDiarioFacSERIE: TFIBStringField;
     xDiarioFacREPARACION: TIntegerField;
     xDiarioFacIDCABREPARAR: TIntegerField;
     xDiarioFacMATRICULA: TFIBStringField;
     xDiarioFacMARCA: TFIBStringField;
     xDiarioFacCLIENTE: TIntegerField;
     xDiarioFacNOMBRE_CLIENTE: TFIBStringField;
     xDiarioFacNIF: TFIBStringField;
     xDiarioFacFECHA_ENTRADA: TDateTimeField;
     xDiarioFacFECHA_SALIDA: TDateTimeField;
     xDiarioFacBASE: TFloatField;
     xDiarioFacS_CUOTA_IVA: TFloatField;
     xDiarioFacTOTAL_FAC: TFloatField;
     xDiarioFacFORMA_PAGO: TFIBStringField;
     xDiarioFacFECHA_RECEPCION: TDateTimeField;
     xDiarioFacESTADO_REP: TIntegerField;
     xDiarioFacTITULO_ESTADO_REP: TFIBStringField;
     xDiarioFacSITUACION_REP: TIntegerField;
     xDiarioFacTITULO_SITUACION_REP: TFIBStringField;
     xDiarioFacCOLOR_SITUACION_REP: TFloatField;
     xDiarioFacTIPO_REPARACION: TIntegerField;
     xDiarioFacTITULO_TIPO_REPARACION: TFIBStringField;
     xDiarioFacTIPO_ACTUALCION: TIntegerField;
     xDiarioFacTITULO_TIPO_ACTUALCION: TFIBStringField;
     QMCabRepararESTADO: TIntegerField;
     QMCabRepararTITULO_ESTADO: TFIBStringField;
     QMCabRepararSITUACION: TIntegerField;
     QMCabRepararTITULO_SITUACION: TFIBStringField;
     QMCabRepararTIPO_ACTUACION: TIntegerField;
     QMCabRepararTITULO_TIPO_ACTUACION: TFIBStringField;
     xTazabilidadCompras: TFIBTableSet;
     DSxTazabilidadCompras: TDataSource;
     xTazabilidadComprasALB_COMPRA: TFIBStringField;
     xTazabilidadComprasID_E: TIntegerField;
     xTazabilidadComprasID_DETALLES_E: TIntegerField;
     xTazabilidadComprasSERIE: TFIBStringField;
     xTazabilidadComprasRIG: TIntegerField;
     xTazabilidadComprasLINEA: TIntegerField;
     xTazabilidadComprasFAMILIA: TFIBStringField;
     xTazabilidadComprasARTICULO: TFIBStringField;
     xTazabilidadComprasTITULO: TFIBStringField;
     xTazabilidadComprasUNIDADES: TFloatField;
     xTazabilidadComprasNUM_ALBARAN: TFIBStringField;
     xTazabilidadComprasPROVEEDOR: TIntegerField;
     xTazabilidadComprasPROVEEDOR1: TFIBStringField;
     xTazabilidadComprasFAC_COMPRA: TFIBStringField;
     xTazabilidadComprasIDCABREPARAR: TIntegerField;
     xTazabilidadComprasID_S: TIntegerField;
     xTazabilidadComprasFAC_VENTA: TFIBStringField;
     QMCabRepararSERIE_DOC: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     DesdeFecha, HastaFecha: TDateTime;
  public
     { Public declarations }
     procedure Filtrar(Serie: string; DFecha, HFecha: TDateTime);
     procedure EnviarTrazabilidadCompras(Destinatarios: string);
     procedure EnviarDiarioFacturacion(Destinatarios: string);
     procedure EnviarInformeCaja(Destinatarios: string);
  end;

var
  DMDiarioReparaciones : TDMDiarioReparaciones;

implementation

uses UDMMain, UEntorno, UUtiles, DateUtils, UParam, UHojaCalc, UDMListados, UFormGest, Dialogs, UDameDato;

{$R *.dfm}

procedure TDMDiarioReparaciones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMCabReparar, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(xDiarioFac, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(xTazabilidadCompras, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
end;

procedure TDMDiarioReparaciones.EnviarDiarioFacturacion(Destinatarios: string);
var
  HCalc : THojaCalc;
  f, c, i, InicioFilaDatos : integer;
  Archivo, Descripcion : string;
  BodyMail : TStrings;
  Extension : string;
  SerieExportacion : string;

  function CreaCabecera(HCalc: THojaCalc; DS: TDataSet): integer;
  var
     i : integer;
  begin
     // Devuelve la ultima linea creada

     // Titulos de columna
     f := 1;
     c := 1;
     HCalc.CellText[f, c] := Descripcion;
     HCalc.CellText[f, c + 1] := DameTituloSerie(SerieExportacion);
     Inc(f);
     HCalc.CellText[f, c] := _('Desde');
     HCalc.CellText[f, c + 1] := FormatDateTime(ShortDateFormat, DesdeFecha);
     Inc(f);
     HCalc.CellText[f, c] := _('Hasta');
     HCalc.CellText[f, c + 1] := FormatDateTime(ShortDateFormat, HastaFecha);
     Inc(f);

     Inc(f);
     for i := 0 to DS.FieldCount - 1 do
     begin
        HCalc.CellText[f, c + i] := DS.Fields[i].FieldName;
        // HCalc.FontSize(f, c+i, 14);
        HCalc.Bold(f, c + i);
     end;

     Result := f;
  end;

  procedure CreaTotales(HCalc: THojaCalc; DS: TDataSet);
  var
     i : integer;
  begin
     // Totales
     Inc(f);
     c := 1;
     for i := 0 to DS.FieldCount - 1 do
     begin
        if (DS.Fields[i].Visible) then
        begin
           if (DS.Fields[i].FieldName = 'S_BASES') or
              (DS.Fields[i].FieldName = 'S_CUOTA_IVA') or
              (DS.Fields[i].FieldName = 'MATERIALES') then
           begin
              if (DS.Fields[i] is TFloatField) or (DS.Fields[i] is TIntegerField) then
                 HCalc.CellFormula[f, c + i] := format('=SUM(%s%d:%s%d)', [ExcelColumnName(c + i), InicioFilaDatos, ExcelColumnName(c + i), f - 1]);
           end;
        end;
     end;
  end;

  procedure Autofit(HCalc: THojaCalc);
  var
     c, i : integer;
  begin
     c := 1;
     for i := 0 to QMCabReparar.FieldCount - 1 do
     begin
        if (QMCabReparar.Fields[i] is TStringField) then
           HCalc.AutoFit(c + i);
     end;
  end;

begin
  Extension := '.xls';
  BodyMail := TStringList.Create;
  try
     // Exportar a Excel
     Descripcion := _('Diario de Facturacion');
     Archivo := IncludeTrailingPathDelimiter(DameTempPath) + Format(_('DiarioFacturacion_%s-%s'), [FormatDateTime('yyyymmdd', DesdeFecha), FormatDateTime('yyyymmdd', HastaFecha)]) + Extension;

     if FileExists(Archivo) then
        DeleteFile(Archivo);

     {
     if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
        HCalc := THojaCalc.Create(thcExcel, False)
     else
     }
     HCalc := THojaCalc.Create(thcOpenOffice, False);

     try
        HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

        // Datos
        QMCabReparar.Last;
        QMCabReparar.First;

        SerieExportacion := QMCabRepararSERIE.AsString;

        if (Trim(SerieExportacion) = '') then
        begin
           HCalc.AddNewSheet('SIN_SERIE', True {RemoveDummySheets});
           HCalc.ActivateSheetByName('SIN_SERIE', True);
        end
        else
        begin
           HCalc.AddNewSheet(SerieExportacion, True {RemoveDummySheets});
           HCalc.ActivateSheetByName(SerieExportacion, True);
        end;

        f := CreaCabecera(HCalc, QMCabReparar);

        InicioFilaDatos := f + 1;
        while not QMCabReparar.EOF do
        begin
           if (SerieExportacion <> QMCabRepararSERIE.AsString) then
           begin
              CreaTotales(HCalc, QMCabReparar);

              Autofit(HCalc);

              SerieExportacion := QMCabRepararSERIE.AsString;
              HCalc.ActivateSheetByIndex(HCalc.CountSheets);
              HCalc.AddNewSheet(SerieExportacion);
              // HCalc.ActivateSheetByName(SerieExportacion, True);

              f := CreaCabecera(HCalc, QMCabReparar);
           end;

           Inc(f);
           c := 1;
           for i := 0 to QMCabReparar.FieldCount - 1 do
           begin
              if (QMCabReparar.Fields[i].Visible) then
              begin
                 {Campo tipo String}
                 // Reemplazado: xxxReemplazo comilla doble por dos comillas simples si se entrecomillan los stringsxxx
                 // Reemplazo comilla doble por dos comillas dobles si se entrecomillan los strings
                 if (QMCabReparar.Fields[i] is TStringField) and (Trim(QMCabReparar.Fields[i].AsString) > '') then
                    HCalc.CellText[f, c + i] := QMCabReparar.Fields[i].AsString;

                 if (QMCabReparar.Fields[i] is TFloatField) and (QMCabReparar.Fields[i].AsFloat <> 0) then
                    HCalc.SendNumber(f, c + i, QMCabReparar.Fields[i].AsFloat);
                 // FormatFloat('0.000', QMCabecera.Fields[i].AsFloat);

                 if (QMCabReparar.Fields[i] is TIntegerField) and (QMCabReparar.Fields[i].AsInteger <> 0) then
                    HCalc.SendNumber(f, c + i, QMCabReparar.Fields[i].AsInteger);
                 // Trim(QMCabecera.Fields[i].AsString);

                 // El formato será el del sistema en que se ejecute
                 if (QMCabReparar.Fields[i] is TDateTimeField) and (YearOf(QMCabReparar.Fields[i].AsDateTime) > 1900) then
                    HCalc.CellText[f, c + i] := DateToStr(QMCabReparar.Fields[i].AsDateTime);
              end;
           end;

           QMCabReparar.Next;
        end;

        CreaTotales(HCalc, QMCabReparar);

        Autofit(HCalc);

        HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     finally
        HCalc.Free;
     end;

     BodyMail.Text := Descripcion;
     AbreData(TDMListados, DMListados);
     try
        DMMain.LogProduccion('SendMailPDF(' + Destinatarios + ', ' + Archivo + ', ' + Descripcion + ', "", DLF)');
        DMListados.SendMailPDF(Destinatarios, BodyMail, Archivo, Archivo, Descripcion, '', 'DLF');
     finally
        CierraData(DMListados);
     end;
  finally
     BodyMail.Free;
  end;
end;

procedure TDMDiarioReparaciones.EnviarInformeCaja(Destinatarios: string);
var
  HCalc : THojaCalc;
  f, c, i, InicioFilaDatos : integer;
  Archivo, Descripcion : string;
  BodyMail : TStrings;
  Extension : string;
  SerieExportacion : string;

  function CreaCabecera(HCalc: THojaCalc; DS: TDataSet): integer;
  var
     i : integer;
  begin
     // Devuelve la ultima linea creada

     // Titulos de columna
     f := 1;
     c := 1;
     HCalc.CellText[f, c] := Descripcion;
     HCalc.CellText[f, c + 1] := DameTituloSerie(SerieExportacion);
     Inc(f);
     HCalc.CellText[f, c] := _('Desde');
     HCalc.CellText[f, c + 1] := FormatDateTime(ShortDateFormat, DesdeFecha);
     Inc(f);
     HCalc.CellText[f, c] := _('Hasta');
     HCalc.CellText[f, c + 1] := FormatDateTime(ShortDateFormat, HastaFecha);
     Inc(f);

     Inc(f);
     for i := 0 to DS.FieldCount - 1 do
     begin
        HCalc.CellText[f, c + i] := DS.Fields[i].FieldName;
        // HCalc.FontSize(f, c+i, 14);
        HCalc.Bold(f, c + i);
     end;

     Result := f;
  end;

  procedure CreaTotales(HCalc: THojaCalc; DS: TDataSet);
  var
     i : integer;
  begin
     // Totales
     Inc(f);
     c := 1;
     for i := 0 to DS.FieldCount - 1 do
     begin
        if (DS.Fields[i].Visible) then
        begin
           if (DS.Fields[i].FieldName = 'BASE') or
              (DS.Fields[i].FieldName = 'S_CUOTA_IVA') or
              (DS.Fields[i].FieldName = 'TOTAL_FAC') then
           begin
              if (DS.Fields[i] is TFloatField) or (DS.Fields[i] is TIntegerField) then
                 HCalc.CellFormula[f, c + i] := format('=SUM(%s%d:%s%d)', [ExcelColumnName(c + i), InicioFilaDatos, ExcelColumnName(c + i), f - 1]);
           end;
        end;
     end;
  end;

  procedure Autofit(HCalc: THojaCalc);
  var
     c, i : integer;
  begin
     c := 1;
     for i := 0 to xDiarioFac.FieldCount - 1 do
     begin
        if (xDiarioFac.Fields[i] is TStringField) then
           HCalc.AutoFit(c + i);
     end;
  end;

begin
  Extension := '.xls';
  BodyMail := TStringList.Create;
  try
     // Exportar a Excel
     Descripcion := _('Informe de Caja');
     Archivo := IncludeTrailingPathDelimiter(DameTempPath) + Format(_('InformeCaja_%s-%s'), [FormatDateTime('yyyymmdd', DesdeFecha), FormatDateTime('yyyymmdd', HastaFecha)]) + Extension;

     if FileExists(Archivo) then
        DeleteFile(Archivo);

     {
     if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
        HCalc := THojaCalc.Create(thcExcel, False)
     else
     }
     HCalc := THojaCalc.Create(thcOpenOffice, False);

     try
        HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

        // Datos
        xDiarioFac.Last;
        xDiarioFac.First;

        SerieExportacion := xDiarioFacSERIE.AsString;

        if (Trim(SerieExportacion) = '') then
        begin
           HCalc.AddNewSheet('SIN_SERIE', True {RemoveDummySheets});
           HCalc.ActivateSheetByName('SIN_SERIE', True);
        end
        else
        begin
           HCalc.AddNewSheet(SerieExportacion, True {RemoveDummySheets});
           HCalc.ActivateSheetByName(SerieExportacion, True);
        end;

        f := CreaCabecera(HCalc, xDiarioFac);

        InicioFilaDatos := f + 1;
        while not xDiarioFac.EOF do
        begin
           if (SerieExportacion <> xDiarioFacSERIE.AsString) then
           begin
              CreaTotales(HCalc, xDiarioFac);

              Autofit(HCalc);

              SerieExportacion := xDiarioFacSERIE.AsString;
              HCalc.ActivateSheetByIndex(HCalc.CountSheets);
              HCalc.AddNewSheet(SerieExportacion);
              // HCalc.ActivateSheetByName(SerieExportacion, True);

              f := CreaCabecera(HCalc, xDiarioFac);
           end;

           Inc(f);
           c := 1;
           for i := 0 to xDiarioFac.FieldCount - 1 do
           begin
              if (xDiarioFac.Fields[i].Visible) then
              begin
                 {Campo tipo String}
                 // Reemplazado: xxxReemplazo comilla doble por dos comillas simples si se entrecomillan los stringsxxx
                 // Reemplazo comilla doble por dos comillas dobles si se entrecomillan los strings
                 if (xDiarioFac.Fields[i] is TStringField) and (Trim(xDiarioFac.Fields[i].AsString) > '') then
                    HCalc.CellText[f, c + i] := xDiarioFac.Fields[i].AsString;

                 if (xDiarioFac.Fields[i] is TFloatField) and (xDiarioFac.Fields[i].AsFloat <> 0) then
                    HCalc.SendNumber(f, c + i, xDiarioFac.Fields[i].AsFloat);
                 // FormatFloat('0.000', QMCabecera.Fields[i].AsFloat);

                 if (xDiarioFac.Fields[i] is TIntegerField) and (xDiarioFac.Fields[i].AsInteger <> 0) then
                    HCalc.SendNumber(f, c + i, xDiarioFac.Fields[i].AsInteger);
                 // Trim(QMCabecera.Fields[i].AsString);

                 // El formato será el del sistema en que se ejecute
                 if (xDiarioFac.Fields[i] is TDateTimeField) and (YearOf(xDiarioFac.Fields[i].AsDateTime) > 1900) then
                    HCalc.CellText[f, c + i] := DateToStr(xDiarioFac.Fields[i].AsDateTime);
              end;
           end;

           xDiarioFac.Next;
        end;

        CreaTotales(HCalc, xDiarioFac);

        Autofit(HCalc);

        HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     finally
        HCalc.Free;
     end;

     BodyMail.Text := Descripcion;
     AbreData(TDMListados, DMListados);
     try
        DMMain.LogProduccion('SendMailPDF(' + Destinatarios + ', ' + Archivo + ', ' + Descripcion + ', "", DLF)');
        DMListados.SendMailPDF(Destinatarios, BodyMail, Archivo, Archivo, Descripcion, '', 'DLF');
     finally
        CierraData(DMListados);
     end;
  finally
     BodyMail.Free;
  end;
end;

procedure TDMDiarioReparaciones.EnviarTrazabilidadCompras(Destinatarios: string);
var
  HCalc : THojaCalc;
  f, c, i, InicioFilaDatos : integer;
  Archivo, Descripcion : string;
  BodyMail : TStrings;
  Extension : string;
  SerieExportacion : string;

  function CreaCabecera(HCalc: THojaCalc; DS: TDataSet): integer;
  var
     i : integer;
  begin
     // Devuelve la ultima linea creada

     // Titulos de columna
     f := 1;
     c := 1;
     HCalc.CellText[f, c] := Descripcion;
     HCalc.CellText[f, c + 1] := DameTituloSerie(SerieExportacion);
     Inc(f);
     HCalc.CellText[f, c] := _('Desde');
     HCalc.CellText[f, c + 1] := FormatDateTime(ShortDateFormat, DesdeFecha);
     Inc(f);
     HCalc.CellText[f, c] := _('Hasta');
     HCalc.CellText[f, c + 1] := FormatDateTime(ShortDateFormat, HastaFecha);
     Inc(f);

     Inc(f);
     for i := 0 to DS.FieldCount - 1 do
     begin
        HCalc.CellText[f, c + i] := DS.Fields[i].FieldName;
        // HCalc.FontSize(f, c+i, 14);
        HCalc.Bold(f, c + i);
     end;

     Result := f;
  end;

  procedure CreaTotales(HCalc: THojaCalc; DS: TDataSet);
  var
     i : integer;
  begin
     // Totales
     Inc(f);
     c := 1;
     for i := 0 to DS.FieldCount - 1 do
     begin
        if (DS.Fields[i].Visible) then
        begin
           if (DS.Fields[i].FieldName = 'UNIDADES') then
           begin
              if (DS.Fields[i] is TFloatField) or (DS.Fields[i] is TIntegerField) then
                 HCalc.CellFormula[f, c + i] := format('=SUM(%s%d:%s%d)', [ExcelColumnName(c + i), InicioFilaDatos, ExcelColumnName(c + i), f - 1]);
           end;
        end;
     end;
  end;

  procedure Autofit(HCalc: THojaCalc);
  var
     c, i : integer;
  begin
     c := 1;
     for i := 0 to xTazabilidadCompras.FieldCount - 1 do
     begin
        if (xTazabilidadCompras.Fields[i] is TStringField) then
           HCalc.AutoFit(c + i);
     end;
  end;

begin
  Extension := '.xls';
  BodyMail := TStringList.Create;
  try
     // Exportar a Excel
     Descripcion := _('Tazabilidad de Compras');
     Archivo := IncludeTrailingPathDelimiter(DameTempPath) + Format(_('TazabilidadCompras_%s-%s'), [FormatDateTime('yyyymmdd', DesdeFecha), FormatDateTime('yyyymmdd', HastaFecha)]) + Extension;

     if FileExists(Archivo) then
        DeleteFile(Archivo);

     {
     if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
        HCalc := THojaCalc.Create(thcExcel, False)
     else
     }
     HCalc := THojaCalc.Create(thcOpenOffice, False);

     try
        HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

        // Datos
        xTazabilidadCompras.Last;
        xTazabilidadCompras.First;

        SerieExportacion := xTazabilidadComprasSERIE.AsString;

        if (Trim(SerieExportacion) = '') then
        begin
           HCalc.AddNewSheet('SIN_SERIE', True {RemoveDummySheets});
           HCalc.ActivateSheetByName('SIN_SERIE', True);
        end
        else
        begin
           HCalc.AddNewSheet(SerieExportacion, True {RemoveDummySheets});
           HCalc.ActivateSheetByName(SerieExportacion, True);
        end;

        f := CreaCabecera(HCalc, xTazabilidadCompras);

        InicioFilaDatos := f + 1;
        while not xTazabilidadCompras.EOF do
        begin
           if (SerieExportacion <> xTazabilidadComprasSERIE.AsString) then
           begin
              CreaTotales(HCalc, xTazabilidadCompras);

              Autofit(HCalc);

              SerieExportacion := xTazabilidadComprasSERIE.AsString;
              HCalc.ActivateSheetByIndex(HCalc.CountSheets);
              HCalc.AddNewSheet(SerieExportacion);
              // HCalc.ActivateSheetByName(SerieExportacion, True);

              f := CreaCabecera(HCalc, xTazabilidadCompras);
           end;

           Inc(f);
           c := 1;
           for i := 0 to xTazabilidadCompras.FieldCount - 1 do
           begin
              if (xTazabilidadCompras.Fields[i].Visible) then
              begin
                 {Campo tipo String}
                 // Reemplazado: xxxReemplazo comilla doble por dos comillas simples si se entrecomillan los stringsxxx
                 // Reemplazo comilla doble por dos comillas dobles si se entrecomillan los strings
                 if (xTazabilidadCompras.Fields[i] is TStringField) and (Trim(xTazabilidadCompras.Fields[i].AsString) > '') then
                    HCalc.CellText[f, c + i] := xTazabilidadCompras.Fields[i].AsString;

                 if (xTazabilidadCompras.Fields[i] is TFloatField) and (xTazabilidadCompras.Fields[i].AsFloat <> 0) then
                    HCalc.SendNumber(f, c + i, xTazabilidadCompras.Fields[i].AsFloat);
                 // FormatFloat('0.000', QMCabecera.Fields[i].AsFloat);

                 if (xTazabilidadCompras.Fields[i] is TIntegerField) and (xTazabilidadCompras.Fields[i].AsInteger <> 0) then
                    HCalc.SendNumber(f, c + i, xTazabilidadCompras.Fields[i].AsInteger);
                 // Trim(QMCabecera.Fields[i].AsString);

                 // El formato será el del sistema en que se ejecute
                 if (xTazabilidadCompras.Fields[i] is TDateTimeField) and (YearOf(xTazabilidadCompras.Fields[i].AsDateTime) > 1900) then
                    HCalc.CellText[f, c + i] := DateToStr(xTazabilidadCompras.Fields[i].AsDateTime);
              end;
           end;

           xTazabilidadCompras.Next;
        end;

        CreaTotales(HCalc, xTazabilidadCompras);

        Autofit(HCalc);

        HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     finally
        HCalc.Free;
     end;

     DMMain.LogIni('Envio Correo ' + Descripcion);
     DMMain.Log('BodyMail');
     BodyMail.Text := Descripcion;
     DMMain.Log('AbreData');
     AbreData(TDMListados, DMListados);
     try
        DMMain.LogProduccion('SendMailPDF(' + Destinatarios + ', ' + Archivo + ', ' + Descripcion + ', "", DLF)');
        DMListados.SendMailPDF(Destinatarios, BodyMail, Archivo, Archivo, Descripcion, '', 'DLF');
     finally
        DMMain.Log('CierraData');
        CierraData(DMListados);
     end;
     DMMain.LogFin('Envio Correo ' + Descripcion);
  finally
     BodyMail.Free;
  end;
end;

procedure TDMDiarioReparaciones.Filtrar(Serie: string; DFecha, HFecha: TDateTime);
begin
  DesdeFecha := RecodeTime(DFecha, 0, 0, 0, 0);
  HastaFecha := RecodeTime(HFecha, 23, 59, 59, 999);

  with QMCabReparar do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
     Open;
  end;

  with xDiarioFac do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
     Open;
  end;

  with xTazabilidadCompras do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
     Open;
  end;
end;

end.
