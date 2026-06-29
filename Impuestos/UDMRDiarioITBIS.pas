unit UDMRDiarioITBIS;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport, StdCtrls, Math, ShellApi;

type
  TDMRDiarioITBIS = class(TDataModule)
     QSPDiarioITBIS: TFIBDataSetRO;
     xVer_Canales_Series: TFIBDataSetRO;
     SPRangos: THYFIBQuery;
     DSQSPDiarioITBIS: TDataSource;
     DSxVer_Canales_Series: TDataSource;
     TLocal: THYTransaction;
     frDiarioITBIS: TfrHYReport;
     frDBQSPDiarioITBIS: TfrDBDataSet;
     QMTotales: TFIBDataSetRO;
     DSQMTotales: TDataSource;
     frDSQMTotales: TfrDBDataSet;
     QMTotalesB_IMPONIBLE: TFloatField;
     QMTotalesI_IVA: TFloatField;
     QMTotalesI_REC: TFloatField;
     QMTotalesMODO_IVA: TIntegerField;
     QMTotalesTIPO_IVA: TIntegerField;
     QMTotalesP_IVA: TFloatField;
     QMTotalesP_REC: TFloatField;
     QMTotalesT_TITULO: TFIBStringField;
     QMTotalesM_TITULO: TFIBStringField;
     frxDiarioITBIS: TfrxHYReport;
     xEmpresa: TFIBDataSetRO;
     xEmpresaNIF: TFIBStringField;
     SPTotalesExportar: THYFIBQuery;
     QSPDiarioITBISREGISTRO: TIntegerField;
     QSPDiarioITBISFECHA_REGISTRO: TDateTimeField;
     QSPDiarioITBISTIPO: TIntegerField;
     QSPDiarioITBISCUENTA: TFIBStringField;
     QSPDiarioITBISTITULO: TFIBStringField;
     QSPDiarioITBISDOC_NUMERO: TIntegerField;
     QSPDiarioITBISDOC_SERIE: TFIBStringField;
     QSPDiarioITBISDOC_FECHA: TDateTimeField;
     QSPDiarioITBISMODO_IVA: TIntegerField;
     QSPDiarioITBISESTATUS: TFIBStringField;
     QSPDiarioITBISCIF: TFIBStringField;
     QSPDiarioITBISDESCRIPCION_CTA: TFIBStringField;
     QSPDiarioITBISTIPO_IVA: TIntegerField;
     QSPDiarioITBISDEDUCIBLE: TIntegerField;
     QSPDiarioITBISB_IMPONIBLE: TFloatField;
     QSPDiarioITBISP_IVA: TFloatField;
     QSPDiarioITBISP_REC: TFloatField;
     QSPDiarioITBISI_IVA: TFloatField;
     QSPDiarioITBISI_REC: TFloatField;
     QSPDiarioITBISNUM_FACTURA: TFIBStringField;
     QSPDiarioITBISRIG_VISIBLE: TIntegerField;
     QSPDiarioITBISNCF: TFIBStringField;
     QSPDiarioITBISNCF_CONTADOR: TFIBStringField;
     QSPDiarioITBISNCF_ORIGEN: TFIBStringField;
     QSPDiarioITBISNCF_ORIGEN_CONTADOR: TFIBStringField;
     QSPDiarioITBISDESCRIPCION_BIENES: TFIBStringField;
     QSPDiarioITBISTIPO_BIENES: TFIBStringField;
     QSPDiarioITBISTIPO_ID: TIntegerField;
     QSPDiarioITBISIMPORTE_RETENCION: TFloatField;
     QSPDiarioITBISFECHA_PAGO: TDateTimeField;
     QSPDiarioITBISIMPORTE_ISR: TFloatField;
     QSPDiarioITBISFORMA_PAGO: TFIBStringField;
     QSPDiarioITBISTIPO_RAZON: TIntegerField;
     QSPDiarioITBISCODIGO_NCF: TFIBStringField;
     procedure DMRDiarioIVACreate(Sender: TObject);
     procedure frDiarioITBISEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRDiarioIVADestroy(Sender: TObject);
     procedure frDiarioITBISGetValue(const ParName: string; var ParValue: variant);
     procedure frxDiarioITBISBeforePrint(Sender: TfrxReportComponent);
     procedure frxDiarioITBISGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     Titulo: string;
     FechaListado: TDateTime;
     SW: integer;
     SQLBase: string;
     SQLTotal: string;
     num_desde_v, num_hasta_v: string;
  public
     { Public declarations }
     Fra_Desde: integer;
     Fra_Hasta: integer;
     Fecha_Desde: TDate;
     Fecha_Hasta: TDate;
     Fecha_Lista: TDate;
     Serie: string;
     sSigno: string;
     sTipo: integer;
     sTitulo: string;
     modo: integer;
     cedula: string;
     cantidad_registros: integer;
     total_monto_facturado: double;
     nif_detalle: string;
     tipo_id_detalle: integer;
     cabecera: string;
     Vencimiento: TDate;
     procedure CalculaInforme(serie, num_desde, num_hasta: string; fecha_desde, fecha_hasta: TDateTime; modo, Orden: integer);
     procedure Rangos(Modelo: integer);
     procedure MostrarInforme(Modo: smallint; aTitulo: string; aFechaListado, f_desde, f_hasta: TDateTime);
     procedure CambiaSerie(Serie: string);
     procedure Exportar(serie, num_desde, num_hasta: string; fecha_desde, fecha_hasta: TDateTime; modo, Orden: integer);
     procedure ExportarExcel(Modo: smallint; Titulo: string; aFechaListado, f_desde, f_hasta: TDateTime; TituloInforme: string);
     function Detalle: string;
  end;

var
  DMRDiarioITBIS : TDMRDiarioITBIS;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, DateUtils, UHojaCalc, UParam;

{$R *.DFM}

{Todo : Utilizar TLocal/TUpdate}

procedure TDMRDiarioITBIS.DMRDiarioIVACreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  xVer_Canales_Series.Open;
  xEmpresa.Open;

  SQLBase := QSPDiarioITBIS.SelectSQL.Text;
  SQLTotal := SPTotalesExportar.SQL.Text;
end;

procedure TDMRDiarioITBIS.DMRDiarioIVADestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRDiarioITBIS.CalculaInforme(serie, num_desde, num_hasta: string; fecha_desde, fecha_hasta: TDateTime; modo, Orden: integer);
begin
  Self.Fecha_Desde := HourIntoDate(Fecha_Desde, '00:00:00');
  Self.Fecha_Hasta := HourIntoDate(Fecha_Hasta, '23:59:59');
  num_desde_v := num_desde;
  num_hasta_v := num_hasta;
  with QSPDiarioITBIS do
  begin
     Close;
     if (Orden = 0) then
        if (SSigno = 'R') then
           SelectSQL.Text := SQLBase + ' ORDER BY DOC_FECHA '
        else
           SelectSQL.Text := SQLBase + ' ORDER BY NCF '
     else
        SelectSQL.Text := SQLBase + ' ORDER BY RIG_VISIBLE';

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Params.ByName['SIGNO'].AsString := sSigno;
     Params.ByName['TIPO'].AsInteger := sTipo;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['NUM_DESDE'].AsInteger := StrToIntDef(num_desde, 0);
     Params.ByName['NUM_HASTA'].AsInteger := StrToIntDef(num_hasta, 0);
     Params.ByName['FECHA_DESDE'].AsDateTime := Self.fecha_desde;
     Params.ByName['FECHA_HASTA'].AsDateTime := Self.fecha_hasta;
     Params.ByName['MODO'].AsInteger := Modo;
     Open;
  end;

  with xEmpresa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMRDiarioITBIS.Rangos(Modelo: integer);
begin
  Fecha_Lista := REntorno.FechaTrabSH;

  if (Modelo = 0) then // 607 VENTAS
     sSigno := 'R'
  else // 606 COMPRAS'
     sSigno := 'S';

  with SPRangos do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Signo'].AsString := sSigno;
     ExecQuery;
     Fecha_Desde := FieldByName['Fecha_Desde'].AsDateTime;
     if Fecha_Desde = 0 then
        Fecha_Desde := REntorno.FechaTrab;
     Fecha_Hasta := FieldByName['Fecha_Hasta'].AsDateTime;
     if Fecha_Hasta = 0 then
        Fecha_Hasta := REntorno.FechaTrab;
     Serie := FieldByName['Serie'].AsString;
     Fra_Desde := FieldByName['Fra_Desde'].AsInteger;
     Fra_Hasta := FieldByName['Fra_Hasta'].AsInteger;
     FreeHandle;
  end;

  xEmpresa.Open;
end;

procedure TDMRDiarioITBIS.MostrarInforme(Modo: smallint; aTitulo: string; aFechaListado, f_desde, f_hasta: TDateTime);
begin
  SW := 1;

  // Guardamos los parametros en variables para meterlo en el fast
  Titulo := aTitulo;
  FechaListado := aFechaListado;
  DMListados.DatosInforme(FechaListado, Titulo);

  DMListados.Imprimir(9011, 0, Modo, '', Titulo, frDiarioITBIS, frxDiarioITBIS, nil, nil);
end;

procedure TDMRDiarioITBIS.frDiarioITBISEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMRDiarioITBIS.frDiarioITBISGetValue(const ParName: string; var ParValue: variant);
var
  fecha : integer;
  num_fact : string;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Titulo' then
     ParValue := Titulo;

  if ParName = 'FechaCab' then
     ParValue := FechaListado;

  if ParName = 'Descripcion' then
     ParValue := Format(_('Ejercicio: %s,  Canal: %s.'), [REntorno.EjercicioStr, REntorno.CanalStr]);

  if ParName = 'FECHA' then
  begin
     if Ssigno = 'S' then
        fecha := Trunc(QSPDiarioITBISFECHA_REGISTRO.AsDateTime)
     else
        fecha := Trunc(QSPDiarioITBISDOC_FECHA.AsDateTime);

     ParValue := fecha;
  end;

  if ParName = 'DESDE' then
     ParValue := Fecha_Desde;

  if ParName = 'HASTA' then
     ParValue := Fecha_Hasta;

  if ParName = 'SIGNO' then
     ParValue := Ssigno;

  if ParName = 'FACTURA' then
  begin
     num_fact := ' ';
     if (QSPDiarioITBISDOC_NUMERO.AsString <> '0') then
     begin
        if ssigno = 'R' then
           num_fact := QSPDiarioITBISDOC_NUMERO.AsString + ' ' +
              QSPDiarioITBISDOC_SERIE.AsString
        else
           num_fact := QSPDiarioITBISNUM_FACTURA.AsString;
     end;

     ParValue := num_fact;
  end;

  if ParName = 'CIF_EMPRESA' then
     ParValue := xEmpresaNIF.AsString;

  if ParName = 'MUESTRA_TOTALES' then
  begin
     with QMTotales do
     begin
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['Canal'].AsInteger := REntorno.Canal;
        Params.ByName['Pais'].AsString := REntorno.Pais;
        Params.ByName['Signo'].AsString := sSigno;
        Params.ByName['Tipo'].AsInteger := sTipo;
        Params.ByName['Serie'].AsString := QSPDiarioITBISDOC_SERIE.AsString;
        Params.ByName['Num_desde'].AsInteger := StrToIntDef(num_desde_v, 0);
        Params.ByName['Num_hasta'].AsInteger := StrToIntDef(num_hasta_v, 0);
        Params.ByName['fecha_desde'].AsDateTime := Self.fecha_desde;
        Params.ByName['fecha_hasta'].AsDateTime := Self.fecha_hasta;
        Params.ByName['Modo'].AsInteger := Modo;
        Open;
     end;
     ParValue := '';
  end;
end;

procedure TDMRDiarioITBIS.CambiaSerie(Serie: string);
begin
  with xVer_Canales_Series do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMRDiarioITBIS.frxDiarioITBISBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMRDiarioITBIS.frxDiarioITBISGetValue(const VarName: string; var Value: variant);
begin
  frDiarioITBISGetValue(VarName, Value);
end;

procedure TDMRDiarioITBIS.Exportar(serie, num_desde, num_hasta: string; fecha_desde, fecha_hasta: TDateTime; modo, Orden: integer);
var
  Archivo : string;       // Nombre del Fichero
  NFic : TextFile;       // Fichero
  sReg : string;         // Registro
begin
  Archivo := Format('Modelo-%s-%d.txt', [sTitulo, REntorno.Ejercicio]);
  if MySaveDialog(Archivo, 'TXT', '', 'DMRDiarioITBIS-Exportar') then
  begin
     AssignFile(NFic, Archivo);
     // Inicializamos el fichero
    {$I+}
     Rewrite(Nfic);
    {$I-}
     // grabamos la cabecera
     Self.Fecha_Desde := HourIntoDate(Fecha_Desde, '00:00:00');
     Self.Fecha_Hasta := HourIntoDate(Fecha_Hasta, '23:59:59');
     num_desde_v := num_desde;
     num_hasta_v := num_hasta;
     with xEmpresa do
     begin
        Close;
        Params.ByName['empresa'].AsInteger := REntorno.Empresa;
        Open;
        cedula := xEmpresaNIF.AsString;
     end;

     with SPTotalesExportar do
     begin
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['Canal'].AsInteger := REntorno.Canal;
        Params.ByName['Pais'].AsString := REntorno.Pais;
        Params.ByName['Signo'].AsString := sSigno;
        Params.ByName['Tipo'].AsInteger := sTipo;
        Params.ByName['Serie'].AsString := serie;
        Params.ByName['Num_desde'].AsInteger := StrToIntDef(num_desde, 0);
        Params.ByName['Num_hasta'].AsInteger := StrToIntDef(num_hasta, 0);
        Params.ByName['fecha_desde'].AsDateTime := Self.fecha_desde;
        Params.ByName['fecha_hasta'].AsDateTime := Self.fecha_hasta;
        Params.ByName['Modo'].AsInteger := Modo;
        ExecQuery;
        cantidad_registros := FieldByName['cantidad_registros'].AsInteger;
        total_monto_facturado := FieldByName['total_monto_facturado'].AsFloat;
        FreeHandle;
     end;

     if (Length(cedula) <> 11) then
        ShowMessage(Format(_('El campo CIF : %s no es correcto'), [Cedula]));

     cabecera := sTitulo + // 606 COMPRAS 607 VENTAS
        ajusta(cedula, 'D', 11, ' ') + // NIF DECLARANTE
        REntorno.EjercicioStr + // PERIODO
        FormatFloat('000000000000', cantidad_registros) + // CANTIDAD_REGISTROS
        StringReplace(FormatFloat('0000000000000.00', total_monto_facturado), ',', '.', []); // MONTO_FACTURADO
     sReg := UpperCase(cabecera);
     WriteLn(NFic, sReg);

     with QSPDiarioITBIS do
     begin
        Close;
        if (Orden = 0) then
           if (SSigno = 'R') then
              SelectSQL.Text := SQLBase + ' order by doc_fecha'
           else
              SelectSQL.Text := SQLBase + ' order by fecha_registro'
        else
           SelectSQL.Text := SQLBase + ' order by rig_visible';

        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['Canal'].AsInteger := REntorno.Canal;
        Params.ByName['Pais'].AsString := REntorno.Pais;
        Params.ByName['Signo'].AsString := sSigno;
        Params.ByName['Tipo'].AsInteger := sTipo;
        Params.ByName['Serie'].AsString := serie;
        Params.ByName['Num_desde'].AsInteger := StrToIntDef(num_desde, 0);
        Params.ByName['Num_hasta'].AsInteger := StrToIntDef(num_hasta, 0);
        Params.ByName['fecha_desde'].AsDateTime := Self.fecha_desde;
        Params.ByName['fecha_hasta'].AsDateTime := Self.fecha_hasta;
        Params.ByName['Modo'].AsInteger := Modo;
        Open;
        nif_detalle := QSPDiarioITBISCIF.AsString;
        tipo_id_detalle := QSPDiarioITBISTIPO.AsInteger;
     end;

     while not QSPDiarioITBIS.EOF do
     begin
        sReg := UpperCase(Detalle);
        WriteLn(NFic, sReg);
        QSPDiarioITBIS.Next;
     end;
     // cerramos el fichero
     CloseFile(NFic);
     ShowMessage(_('Exportación Realizada con Exito'));
  end;
end;

function TDMRDiarioITBIS.Detalle: string;
var
  mes, dia : string;
begin
  dia := Copy(QSPDiarioITBISDOC_FECHA.AsString, 1, 2);
  mes := Copy(QSPDiarioITBISDOC_FECHA.AsString, 4, 2);
  Result := ajusta(QSPDiarioITBISCIF.AsString, 'I', 11, ' ') + // CIF OPERADOR
     IntToStr(QSPDiarioITBISTIPO.AsInteger) + // TIPO
     QSPDiarioITBISNCF.AsString + QSPDiarioITBISNCF_CONTADOR.AsString + // NCF
     ajusta(QSPDiarioITBISNCF_ORIGEN.AsString +
     QSPDiarioITBISNCF_ORIGEN_CONTADOR.AsString, 'I', 19, ' ') + // NCF RECT.
     IntToStr(YearOf(QSPDiarioITBISDOC_FECHA.AsDateTime)) + mes + dia + // FECHA VENTA
     StringReplace(FormatFloat('000000000.00', QSPDiarioITBISI_IVA.AsFloat), ',', '.', []) + // ITBIS
     StringReplace(FormatFloat('000000000.00', QSPDiarioITBISB_IMPONIBLE.AsFloat), ',', '.', []); // MONTO FACTURA
end;

procedure TDMRDiarioITBIS.ExportarExcel(Modo: smallint; Titulo: string; aFechaListado, f_desde, f_hasta: TDateTime; TituloInforme: string);
var
  Archivo : string;
  HCalc : THojaCalc;
  f, c, Columna : integer;
  ColumnasOcultas : array of string;

  function StrInArray(const Valor: string; const ArrayOfString: array of string): boolean;
  var
     i : integer;
  begin
     // Devuelve TRUE si [Valor] existe dentro del Array
     Result := False;
     for i := 0 to Length(ArrayOfString) - 1 do
     begin
        if (ArrayOfString[i] = Valor) then
        begin
           Result := True;
           Exit;
        end;
     end;
  end;

begin
  // Campos que no deben salir en el Excel
  if (TituloInforme = '606') then
  begin
     SetLength(ColumnasOcultas, 7);
     ColumnasOcultas[0] := 'ESTATUS';
     ColumnasOcultas[1] := 'DESCRIPCION_CTA';
     ColumnasOcultas[2] := 'I_REC';
     ColumnasOcultas[3] := 'NCF_CONTADOR';
     ColumnasOcultas[4] := 'NCF_ORIGEN_CONTADOR';
     ColumnasOcultas[5] := 'TIPO_ID';
     ColumnasOcultas[6] := 'IMPORTE_ISR';
  end
  else if (TituloInforme = '607') then
  begin
     SetLength(ColumnasOcultas, 16);
     ColumnasOcultas[0] := 'FECHA_REGISTRO';
     ColumnasOcultas[1] := 'CUENTA';
     ColumnasOcultas[2] := 'ESTATUS';
     ColumnasOcultas[3] := 'DESCRIPCION_CTA';
     ColumnasOcultas[4] := 'TIPO_IVA';
     ColumnasOcultas[5] := 'DEDUCIBLE';
     ColumnasOcultas[6] := 'P_IVA';
     ColumnasOcultas[7] := 'P_REC';
     ColumnasOcultas[8] := 'I_IVA';
     ColumnasOcultas[9] := 'NCF';
     ColumnasOcultas[10] := 'NCF_CONTADOR';
     ColumnasOcultas[11] := 'NCF_ORIGEN';
     ColumnasOcultas[12] := 'NCF_ORIGEN_CONTADOR';
     ColumnasOcultas[13] := 'DESCRIPCION_BIENES';
     ColumnasOcultas[14] := 'TIPO_BIENES';
     ColumnasOcultas[15] := 'TIPO_ID';
  end;

  Archivo := Format('Modelo-%s-%d.xls', [sTitulo, REntorno.Ejercicio]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMRDiarioITBIS-ExportarExcel') then
  begin
     DMMain.Log('Exportacion Excel');
     if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
     begin
        DMMain.Log('HCalc := THojaCalc.Create(thcExcel, True)');
        HCalc := THojaCalc.Create(thcExcel, False);
     end
     else
     begin
        DMMain.Log('HCalc := THojaCalc.Create(thcOpenOffice, True)');
        HCalc := THojaCalc.Create(thcOpenOffice, False);
     end;

     try
        DMMain.Log('HCalc.FileName = ' + Archivo);
        HCalc.FileName := Archivo; //Needs a file name before you SaveDoc!

        // Exportacion de datos de Parte de Movimientos
        HCalc.ActivateSheetByIndex(1);
        HCalc.ActiveSheetName := _('Registros');

        with QSPDiarioITBIS do
        begin
           First;

           // Titulos de columnas
           DMMain.Log('Titulos de columnas');
           f := 1;
           Columna := 1;
           for c := 0 to FieldCount - 1 do
           begin
              if not StrInArray(Fields[c].FieldName, ColumnasOcultas) then
              begin
                 HCalc.Bold(f, Columna);
                 HCalc.CellText[f, Columna] := Fields[c].FieldName;
                 Columna := Columna;
              end;
           end;
           Inc(f);

           // Relleno celdas de cada linea
           DMMain.LogIni('Recorro lineas');
           while not EOF do
           begin
              Columna := 1;
              for c := 0 to FieldCount - 1 do
              begin
                 if not StrInArray(Fields[c].FieldName, ColumnasOcultas) then
                 begin
                    if (Fields[c].AsString <> '') then
                    begin
                       if Fields[c].DataType in [ftSmallint, ftInteger, ftWord] then
                          HCalc.SendNumber(f, Columna, Fields[c].AsInteger)
                       else
                       if Fields[c].DataType in [ftFloat, ftCurrency] then
                          HCalc.SendNumber(f, Columna, Fields[c].AsFloat)
                       else
                       if Fields[c].DataType in [ftDateTime, ftDate, ftTime] then
                          HCalc.SendDate(f, Columna, Fields[c].AsDateTime)
                       else
                          HCalc.CellText[f, Columna] := Fields[c].AsString;
                    end;

                    Inc(Columna);
                 end;
              end;

              Inc(f);
              Next;
           end;
           DMMain.LogFin('Recorro lineas');

           // Asigno formato a columnas del Excel
           DMMain.Log('Asigno formato a columnas del Excel');
           Columna := 1;
           for c := 0 to FieldCount - 1 do
           begin
              if not StrInArray(Fields[c].FieldName, ColumnasOcultas) then
              begin
                 // Campo tipo String
                 if (Fields[c] is TStringField) then
                    HCalc.AutoFit(Columna);

                 // Formato de columna
                 if (Fields[c] is TFloatField) then
                    if (HCalc.IsOpenOffice) then
                       HCalc.ColNumberFormat(Columna, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

                 Inc(Columna);
              end;
           end;
        end;

        DMMain.Log('HCalc.SaveDocAs');
        HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     finally
        DMMain.Log('Liberar Excel');
        HCalc.Free;
     end;

     ShowMessage(_('Exportación Realizada con Exito'));
  end;
end;

end.
