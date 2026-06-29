unit UDMLstComisiones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_DSet, FR_DBSet, FR_Class, DB, FIBDataSet, FIBTableDataSet, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport, ComCtrls;

type
  TDMLstComisiones = class(TDataModule)
     DSComisiones: TDataSource;
     frLstComisiones: TfrHYReport;
     frDBAgentes: TfrDBDataSet;
     xClientes: TFIBDataSetRO;
     QMAgentes: TFIBDataSetRO;
     DSClientes: TDataSource;
     DSAgentes: TDataSource;
     frDBComisiones: TfrDBDataSet;
     frDSQMAgentes: TfrDBDataSet;
     QMAgentesCuentas: TFIBDataSetRO;
     DSQMAgentes: TDataSource;
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
     TLocal: THYTransaction;
     QMComisiones: TFIBDataSetRO;
     frxLstComisiones: TfrxHYReport;
     QMDetallesFactura: TFIBDataSetRO;
     DSDetallesFactura: TDataSource;
     frDBDetallesFactura: TfrDBDataSet;
     QMCalculoComisiones: TFIBDataSetRO;
     DSCalculoComisiones: TDataSource;
     frDBCalculoComisiones: TfrDBDataSet;
     procedure frLstComisionesGetValue(const ParName: string; var ParValue: variant);
     procedure frLstComisionesEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstComisionesDestroy(Sender: TObject);
     procedure DMLstComisionesCreate(Sender: TObject);
     procedure frxLstComisionesBeforePrint(Sender: TfrxReportComponent);
     procedure frxLstComisionesGetValue(const VarName: string; var Value: variant);
     procedure QMAgentesCuentasAfterOpen(DataSet: TDataSet);
     procedure QMAgentesCuentasBeforeClose(DataSet: TDataSet);
     procedure QMComisionesAfterOpen(DataSet: TDataSet);
     procedure QMComisionesBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     TOTAL_TOT: double;
     TOTAL_BASE_TOT: double;
     FechaIni, FechaFin: TDate;
  public
     { Public declarations }
     procedure ListadoAgentes(Modo: byte; Minimo, Maximo: integer);
     procedure MuestraFiltrado(Modo: byte);
     procedure ListadoComisiones(aFechaIni, aFechaFin: TDateTime; Desde, Hasta, Modo: integer; MostrarImporteCero: boolean; Opciones: integer; ListaCanales: TStringList; PBProgreso: TProgressBar);
  end;

var
  DMLstComisiones : TDMLstComisiones;
  SW : integer;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UFMAgentes, UFormGest, UDMListados, UUtiles, UDMMultiSeleccion, UParam, UHojaCalc;

procedure TDMLstComisiones.DMLstComisionesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstComisiones.DMLstComisionesDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstComisiones.ListadoComisiones(aFechaIni, aFechaFin: TDateTime; Desde, Hasta, Modo: integer; MostrarImporteCero: boolean; Opciones: integer; ListaCanales: TStringList; PBProgreso: TProgressBar);
var
  ImporteCero : integer;
  Archivo : string;
  HCalc : THojaCalc;
  a, i, c, f : integer;
begin
  FechaIni := HourIntoDate(aFechaIni, '00:00:00');
  FechaFin := HourIntoDate(aFechaFin, '23:59:59');

  ImporteCero := 0;
  if (MostrarImporteCero) then
     ImporteCero := -1;

  DMListados.Normalizar_Desde_Hasta(Desde, Hasta);

  with QMAgentes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['DESDE'].AsInteger := Desde;
     Params.ByName['HASTA'].AsInteger := Hasta;
     Open;
  end;

  with QMDetallesFactura do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_DETALLE_FACTURA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_S = :ID_S ');
     if (Opciones <= 1) then
     begin
        if (not MostrarImporteCero) then
           SelectSQL.Add(' AND I_COMISION <> 0 ');
     end;

     SelectSQL.Add(' ORDER BY ORDEN ');
  end;

  with QMComisiones do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM ');
     if (Opciones = 0) then
     begin
        SelectSQL.Add(' GES_CABECERAS_S CAB ');
        SelectSQL.Add(' JOIN GES_CABECERAS_S_FAC FAC ON (CAB.ID_S = FAC.ID_S) ');
        // Filtrar por fecha de vencimiento.
        if (LeeParametro('LSTAGEC001') = 'S') then
        begin
           SelectSQL.Add(' JOIN EMP_CARTERA CAR ON ( ');
           SelectSQL.Add(' CAR.EMPRESA = FAC.EMPRESA AND ');
           SelectSQL.Add(' CAR.EJERCICIO = FAC.EJERCICIO AND ');
           SelectSQL.Add(' CAR.CANAL = FAC.CANAL AND ');
           SelectSQL.Add(' CAR.REGISTRO = FAC.CAC AND ');
           SelectSQL.Add(' CAR.SIGNO = ''C'') ');
           SelectSQL.Add(' JOIN EMP_CARTERA_DETALLE DET ON (CAR.ID_CARTERA = DET.ID_CARTERA) ');
        end;
     end;

     if (Opciones = 1) then
        SelectSQL.Add(' LST_COMISIONES_AGRUP (?EMPRESA, ?CANAL, ''FAC'', ?AGENTE, ?F_INI, ?F_FIN)');
     if (Opciones = 2) then
        SelectSQL.Add(' LST_COMISIONES_TOTALES (?EMPRESA, ?CANAL, ''FAC'', ?AGENTE, ?F_INI, ?F_FIN,' + IntToStr(ImporteCero) + ')');

     if (Opciones < 1) then
     begin
        AbreData(TDMMultiSeleccion, DMMultiSeleccion);
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ((CAB.EMPRESA = ?EMPRESA) ');
        SelectSQL.Add(DMMultiSeleccion.WhereCanales(ListaCanales) + ' AND ');
        SelectSQL.Add(' (CAB.TIPO = ''FAC'') AND ');
        SelectSQL.Add(' (CAB.AGENTE = ?AGENTE) AND ');
        if (LeeParametro('LSTAGEC001') = 'S') then
        begin
           SelectSQL.Add(' (CAR.PAGADO = 1) AND ');
           SelectSQL.Add(' (DET.VENCIMIENTO >= ?F_INI) AND ');
           SelectSQL.Add(' (DET.VENCIMIENTO <= ?F_FIN) ) AND ');
           SelectSQL.Add(' (DET.ID_CARTERA_DETALLE = (SELECT FIRST 1 ID_CARTERA_DETALLE FROM EMP_CARTERA_DETALLE WHERE CAR.ID_CARTERA = ID_CARTERA ORDER BY VENCIMIENTO DESC)) AND ');
        end
        else
        begin
           SelectSQL.Add(' (CAB.FECHA >= ?F_INI) AND ');
           SelectSQL.Add(' (CAB.FECHA <= ?F_FIN) ) AND ');
        end;
        SelectSQL.Add(' (((FAC.ID_RECT = 0) AND (FAC.RECT = 0)) OR ((FAC.ID_RECT <> 0) AND (FAC.RECT = 1))) ');
        CierraData(DMMultiSeleccion);
     end;

     if ((not MostrarImporteCero) and (Opciones < 1)) then
        SelectSQL.Add(' AND (CAB.I_COMISION <> 0) ');

     if ((not MostrarImporteCero) and (Opciones = 1)) then
        SelectSQL.Add(' WHERE (I_COMISION <> 0) ');

     if (Opciones < 1) then
        SelectSQL.Add(' ORDER BY CAB.FECHA, CAB.SERIE, CAB.RIG ')
     else
        SelectSQL.Add(' ORDER BY FECHA, SERIE, RIG ');

     if (Opciones > 0) then
        Params.ByName['CANAL'].AsInteger := 0;
     Params.ByName['F_INI'].AsDateTime := FechaIni;
     Params.ByName['F_FIN'].AsDateTime := FechaFin;
  end;

  if (Modo = 2) then
  begin
     // Exportar a Excel
     Archivo := Format(_('ComisionesAgente-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMLstComisiones-ListadoComisiones') then
     begin
        /// Exporta en formato Excel
        /// Solo exporta las columnas visibles.

        if (UpperCase(ExtractFileExt(Archivo)) = '.ODS') then
           HCalc := THojaCalc.Create(thcOpenOffice, False) //OpenOffice doc if possible, please
        else
           HCalc := THojaCalc.Create(thcExcel, False);

        PBProgreso.Visible := True;
        PBProgreso.Position := 0;
        try
           DMMain.LogIni(format('ListadoComisiones(%s)', [Archivo]));
           HCalc.FileName := Archivo; //Needs a file name before you SaveDoc!

           a := 0;
           QMAgentes.Last;
           PBProgreso.Max := QMAgentes.RecordCount;
           QMAgentes.First;
           QMComisiones.Open;
           while not QMAgentes.EOF do
           begin
              Inc(a);
              PBProgreso.Position := a;
              DMMain.Log(format('CountSheets = %d', [HCalc.CountSheets]));
              if (HCalc.CountSheets < a) then
              begin
                 HCalc.AddNewSheet(QMAgentes.FieldByName('TITULO').AsString);
                 HCalc.ActivateSheetByIndex(a);
              end
              else
              begin
                 HCalc.ActivateSheetByIndex(a);
                 HCalc.ActiveSheetName := (QMAgentes.FieldByName('TITULO').AsString);
              end;
              DMMain.Log(format('ActiveSheetName = %s (%d)', [QMAgentes.FieldByName('TITULO').AsString, a]));

              with QMComisiones do
              begin
                 // Hago los campos invisibles para luego hacer visibles los que se exportaran
                 for c := 0 to FieldCount - 1 do
                    Fields[c].Visible := False;

                 FieldByName('EJERCICIO').Visible := True;
                 FieldByName('SERIE').Visible := True;
                 FieldByName('TIPO').Visible := True;
                 FieldByName('RIG').Visible := True;
                 FieldByName('MONEDA').Visible := True;
                 FieldByName('FECHA').Visible := True;
                 FieldByName('CLIENTE').Visible := True;
                 FieldByName('SU_REFERENCIA').Visible := True;
                 FieldByName('FORMA_PAGO').Visible := True;
                 FieldByName('ESTADO').Visible := True;
                 FieldByName('S_BASES').Visible := True;
                 FieldByName('AGENTE').Visible := True;
                 FieldByName('S_CUOTA_IVA').Visible := True;
                 FieldByName('S_CUOTA_RE').Visible := True;
                 FieldByName('DTO_PP').Visible := True;
                 FieldByName('DTO_CIAL').Visible := True;
                 FieldByName('B_COMISION').Visible := True;
                 FieldByName('I_COMISION').Visible := True;
                 FieldByName('I_DTO_PP').Visible := True;
                 FieldByName('I_DTO_CIAL').Visible := True;
                 FieldByName('B_DTO_LINEAS').Visible := True;
                 FieldByName('I_PORTES').Visible := True;
                 FieldByName('POR_PORTES').Visible := True;
                 FieldByName('TIPO_PORTES').Visible := True;
                 FieldByName('PEDIDO_CLIENTE').Visible := True;
                 FieldByName('Z_OBSERVACION').Visible := True;
                 FieldByName('TRANSPORTISTA').Visible := True;
                 FieldByName('LIQUIDO').Visible := True;
                 FieldByName('FECHA_CON').Visible := True;
                 FieldByName('Z_PREFIJO_NCF').Visible := True;
                 FieldByName('Z_CONTADOR_NCF').Visible := True;
                 FieldByName('Z_TIPO_NCF').Visible := True;
                 FieldByName('SFV_AUTORIZACION').Visible := True;
                 FieldByName('SFV_CODIGO_CONTROL').Visible := True;
                 FieldByName('SFV_NUM_DOSIFICACION').Visible := True;
                 FieldByName('FOLIO').Visible := True;
                 FieldByName('PERIODO_FACTURACION_INI').Visible := True;
                 FieldByName('PERIODO_FACTURACION_FIN').Visible := True;

                 DisableControls;

                 try
                    First;

                    f := 0;
                    Inc(f);

                    // Primera linea son los titulos de los campos
                    c := 0;
                    for i := 0 to FieldCount - 1 do
                    begin
                       if (Fields[i].Visible) then
                       begin
                          DMMain.Log(format('Fields[%d].Name = %s', [i, Fields[i].FieldName]));
                          HCalc.CellText[f, c + 1] := Fields[i].FieldName;

                          Inc(c);
                       end;
                    end;

                    while not EOF do
                    begin
                       Inc(f);
                       // DMMain.Log(format('ExportarExcel-Fila:%d',[f]));
                       c := 0;
                       for i := 0 to FieldCount - 1 do
                       begin
                          if (Fields[i].Visible) then
                          begin
                             // Campo tipo String
                             if (Fields[i] is TStringField) then
                                HCalc.CellText[f, c + 1] := Trim(Fields[i].AsString)
                             else
                             // Campo tipo Float
                             if (Fields[i] is TFloatField) then
                                HCalc.SendNumber(f, c + 1, Fields[i].AsFloat)
                             else
                             // Campo tipo Integer
                             if (Fields[i] is TIntegerField) then
                                HCalc.SendNumber(f, c + 1, Fields[i].AsInteger)
                             else
                             // Campo tipo Fecha
                             if (Fields[i] is TDateTimeField) then
                             begin
                                // HCalc.SendDate(f, c + 1, Fields[c].AsDateTime)
                                if (HCalc.IsOpenOffice) then
                                   HCalc.CellText[f, c + 1] := DateToStr(Fields[i].AsDateTime)
                                else
                                   HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', Fields[i].AsDateTime));
                             end
                             else
                             // Campo tipo Blob
                             // Los blobs exportan solo caracteres basicos.
                             if (Fields[i] is TBlobField) then
                             begin
                                try
                                   HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(TBlobField(Fields[i]).AsString));
                                except
                                   HCalc.CellText[f, c + 1] := 'BLOB';
                                end;
                             end;

                             Inc(c);
                          end;
                       end;

                       Next;
                       // Application.ProcessMessages;
                    end;

                    c := 0;
                    for i := 0 to FieldCount - 1 do
                    begin
                       if (Fields[i].Visible) then
                       begin
                          // Campo tipo String
                          if (Fields[i] is TStringField) then
                             HCalc.AutoFit(c + 1);

                          // Formato de columna
                          if (Fields[i] is TFloatField) then
                             if (HCalc.IsOpenOffice) then
                                HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

                          Inc(c);
                       end;
                    end;
                 finally
                    EnableControls;
                 end;
              end;

              QMAgentes.Next;
           end;

           HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
        finally
           PBProgreso.Visible := False;
           PBProgreso.Position := 0;
           Sleep(1000);
           Application.ProcessMessages;
           HCalc.Free;
           DMMain.LogFin('');
        end;
     end;
  end
  else
  begin
     SW := 1;
     QMComisiones.Open;
     DMListados.Imprimir(15, 0, Modo, '', 'Listado Comisiones', frLstComisiones, frxLstComisiones, nil, nil);
  end;
end;

procedure TDMLstComisiones.ListadoAgentes(Modo: byte; Minimo, Maximo: integer);
var
  Archivo : string;
begin
  DMListados.Normalizar_Desde_Hasta(Minimo, Maximo);
  with QMAgentesCuentas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['MAXIMO'].AsInteger := Maximo;
     Params.ByName['MINIMO'].AsInteger := Minimo;
     Open;
  end;

  SW := 1;
  if (Modo = 2) then
  begin
     // Exportar a Excel
     Archivo := Format(_('Agentes-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMLstComisiones-ListadoAgentes') then
     begin
        ExportarExcel(Archivo, DSQMAgentes, True, True);
     end;
  end
  else
     DMListados.Imprimir(13, 0, Modo, '', 'Listado Agentes', frLstComisiones, frxLstComisiones, nil, nil);
end;

procedure TDMLstComisiones.MuestraFiltrado(Modo: byte);
begin
  QMAgentesCuentas.Close;
  QMAgentesCuentas.Open;

  if (FMAgentes.SWFil = 0) then
     if (FMAgentes.SWEnlace = 0) then
        DMMain.FiltraRO(QMAgentesCuentas, '11100', True)
     else
        DMMain.FiltraRO(QMAgentesCuentas, '10100', True);

  SW := 1;
  DMListados.Imprimir(13, 0, Modo, '', 'Listado Agentes', frLstComisiones, frxLstComisiones, nil, nil);
end;

procedure TDMLstComisiones.frLstComisionesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'DESDE' then
     ParValue := QMComisiones.Params.ByName['f_ini'].AsDateTime;
  if ParName = 'HASTA' then
     ParValue := QMComisiones.Params.ByName['f_FIN'].AsDateTime;
  if ParName = 'ACUM' then
  begin
     TOTAL_TOT := TOTAL_TOT + QMComisiones.FieldByName('I_COMISION').AsFloat;
     TOTAL_BASE_TOT := TOTAL_BASE_TOT + QMComisiones.FieldByName('B_COMISION').AsFloat;
  end;
  if ParName = 'TOTAL_TOT' then
     ParValue := TOTAL_TOT;
  if ParName = 'TOTAL_BASE_TOT' then
     ParValue := TOTAL_BASE_TOT;
  if ParName = 'INICIALIZA' then
  begin
     TOTAL_TOT := 0;
     TOTAL_BASE_TOT := 0;
  end;
end;

procedure TDMLstComisiones.frLstComisionesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if memo[0] = 'Nº' then
        SW := 1;
  end;
end;

procedure TDMLstComisiones.frxLstComisionesBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstComisiones.frxLstComisionesGetValue(const VarName: string; var Value: variant);
begin
  frLstComisionesGetValue(VarName, Value);
end;

procedure TDMLstComisiones.QMAgentesCuentasAfterOpen(DataSet: TDataSet);
begin
  QMTerceros.Close;
  QMJustifica.Close;
  QMTerceros.Open;
  QMJustifica.Open;
end;

procedure TDMLstComisiones.QMAgentesCuentasBeforeClose(DataSet: TDataSet);
begin
  QMTerceros.Close;
  QMJustifica.Close;
end;

procedure TDMLstComisiones.QMComisionesAfterOpen(DataSet: TDataSet);
begin
  xClientes.Close;
  xClientes.Open;
  QMDetallesFactura.Close;
  QMDetallesFactura.Open;
  QMCalculoComisiones.Close;
  QMCalculoComisiones.Open;
end;

procedure TDMLstComisiones.QMComisionesBeforeClose(DataSet: TDataSet);
begin
  xClientes.Close;
  QMDetallesFactura.Close;
  QMCalculoComisiones.Close;
end;

end.
