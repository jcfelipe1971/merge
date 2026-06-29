unit UDMLstFactura_Prov;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery,
  frxClass, frxHYReport, ComCtrls;

type
  TDMLstFactura_Prov = class(TDataModule)
     frFactura: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     QMCabecera: TFIBDataSetRO;
     DSCabecera: TDataSource;
     xProveedores: TFIBDataSetRO;
     TLocal: THYTransaction;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xEstados: TFIBDataSetRO;
     xEstadosTITULO: TFIBStringField;
     DSxEstado: TDataSource;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     frxFactura: TfrxHYReport;
     procedure frFacturaGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstFactura_ProvDestroy(Sender: TObject);
     procedure frFacturaEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstFactura_ProvCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure frxFacturaBeforePrint(Sender: TfrxReportComponent);
     procedure frxFacturaGetValue(const VarName: string; var Value: variant);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     FechaDesde, FechaHasta, FechaConDesde, FechaConHasta: TDateTime;
     Moneda: string;
     LocalMascaraN, LocalMascaraL: string;
     MostrarBImponible: smallint;
  public
     Estado: integer;
     procedure MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
     procedure MostrarListado(Desde, Hasta, DesdeCon, HastaCon: TDateTime; ProveedorDesde, ProveedorHasta, Modo, sin: integer; Serie, Moneda_Listado: string; Ord, aMostrarBImponible, AgruparPorProveedor: boolean; aComentario: string; aFechaListado: TDateTime; PBListado: TProgressBar);
     // procedure MostrarListadoDiario(Serie: string);
  end;

var
  DMLstFactura_Prov : TDMLstFactura_Prov;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UHojaCalc, DateUtils;

{$R *.DFM}

procedure TDMLstFactura_Prov.DMLstFactura_ProvCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  Estado := -1;
end;

procedure TDMLstFactura_Prov.DMLstFactura_ProvDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstFactura_Prov.MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
begin
  MostrarBImponible := 1;
  SW := 1;

  with QMCabecera do
  begin
     Close;
     Open;
     if (Filtro = 0) then
     begin
        DMMain.FiltraRO(QMCabecera, '11110', False);
        Params.ByName['SERIE'].AsString := Serie;
        Open;
     end;
  end;

  Moneda := REntorno.Moneda;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Imprimir(41, 0, Modo, Serie, '', frFactura, frxFactura, nil, nil);
end;

procedure TDMLstFactura_Prov.MostrarListado(Desde, Hasta, DesdeCon, HastaCon: TDateTime; ProveedorDesde, ProveedorHasta, Modo, sin: integer; Serie, Moneda_Listado: string; Ord, aMostrarBImponible, AgruparPorProveedor: boolean; aComentario: string; aFechaListado: TDateTime; PBListado: TProgressBar);
var
  Orden, Separador : string;
  Grupo : integer;
  HCalc : THojaCalc;
  f, c, i : integer;
  Archivo : string;
begin
  SW := 1;

  MostrarBImponible := BoolToInt(aMostrarBImponible);
  FechaDesde := Desde;
  FechaHasta := Hasta;
  FechaConDesde := DesdeCon;
  FechaConHasta := HastaCon;

  DMListados.Normalizar_Desde_Hasta(Desde, Hasta);
  DMListados.Normalizar_Desde_Hasta(DesdeCon, HastaCon);
  DMListados.Normalizar_Desde_Hasta(ProveedorDesde, ProveedorHasta);

  DMListados.DatosInforme(aFechaListado, aComentario);

  Moneda := Moneda_Listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  Grupo := 41;
  Orden := '';
  Separador := '';

  if AgruparPorProveedor then
  begin
     Orden := 'C.PROVEEDOR';
     Separador := ', ';
     Grupo := 541;
  end;

  if Ord then
     Orden := Orden + Separador + 'C.SERIE, C.RIG'
  else
  if (REntorno.Pais = 'CHL') then
     Orden := Orden + Separador + 'C.TIPO_DOC_TRIBUTARIO, C.FECHA'
  else
     Orden := Orden + Separador + 'C.FECHA, C.SERIE, C.RIG';

  with QMCabecera do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ');
     if ((Modo = 2) and (REntorno.Pais = 'CHL')) then
     begin
        // Si cambian los campos verificar las formulas
        SelectSQL.Add(' C.TIPO_DOC_TRIBUTARIO, C.FECHA_CON, C.NIF, C.NOMBRE_COMERCIAL, C.FOLIO, C.FECHA, ');
        SelectSQL.Add(' (SELECT SUM(B_IMPONIBLE) ');
        SelectSQL.Add('  FROM GES_DETALLES_E ');
        SelectSQL.Add('  WHERE ');
        SelectSQL.Add('  ID_E = C.ID_E AND ');
        SelectSQL.Add('  TIPO_IVA IN (0)) AS IMPORTE_EX, ');
        SelectSQL.Add(' (SELECT SUM(B_IMPONIBLE) AS IMPORTE ');
        SelectSQL.Add('  FROM GES_DETALLES_E ');
        SelectSQL.Add('  WHERE ');
        SelectSQL.Add('  ID_E = C.ID_E AND ');
        SelectSQL.Add('  TIPO_IVA IN (1)) AS IMPORTE_NETO, C.S_CUOTA_IVA, C.CUENTA_GASTOS_PROV ');
     end
     else
        SelectSQL.Add(' * ');

     SelectSQL.Add(' FROM VER_CABECERAS_FACTURA_PROV_LST C');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' C.CANAL = ?CANAL AND ');
     if (Serie <> '') then
        SelectSQL.Add(' C.SERIE = ?SERIE AND ');
     if (Estado >= 0) then
        SelectSQL.Add(' C.ESTADO = ?ESTADO AND ');
     SelectSQL.Add(' ((C.FECHA >= ?FECHA_DESDE) AND (C.FECHA <= ?FECHA_HASTA)) AND ');
     SelectSQL.Add(' ((C.FECHA_CON >= ?FECHA_DESDE_CON) AND (C.FECHA_CON <= ?FECHA_HASTA_CON)) AND ');
     SelectSQL.Add(' ((C.PROVEEDOR >= ?PROVEEDOR_DESDE) AND (C.PROVEEDOR <= ?PROVEEDOR_HASTA)) ');
     SelectSQL.Add(' ORDER BY ' + Orden);

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Estado >= 0) then
        Params.ByName['ESTADO'].AsInteger := Estado;
     Params.ByName['FECHA_DESDE'].AsDateTime := Desde;
     Params.ByName['FECHA_HASTA'].AsDateTime := Hasta;
     Params.ByName['FECHA_DESDE_CON'].AsDateTime := DesdeCon;
     Params.ByName['FECHA_HASTA_CON'].AsDateTime := HastaCon;
     Params.ByName['PROVEEDOR_DESDE'].AsInteger := ProveedorDesde;
     Params.ByName['PROVEEDOR_HASTA'].AsInteger := ProveedorHasta;
     Open;
  end;

  if (Modo = 2) then
  begin
     // Exportar a Excel
     Archivo := Format(_('ResumenFacturas-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMLstFactura_Prov') then
     begin
        if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
           HCalc := THojaCalc.Create(thcExcel, False)
        else
           HCalc := THojaCalc.Create(thcOpenOffice, False);

        PBListado.Visible := True;
        try
           HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

           HCalc.ActivateSheetByIndex(1);
           HCalc.ActiveSheetName := _('Resumen');

           // Titulos de columna
           f := 1;
           c := 1;
           for i := 0 to QMCabecera.FieldCount - 1 do
           begin
              HCalc.CellText[f, c + i] := QMCabecera.Fields[i].FieldName;
              // HCalc.FontSize(f, c+i, 14);
              HCalc.Bold(f, c + i);
           end;

           {
           // Titulos de Formulas
           HCalc.CellText[f, c + QMCabecera.FieldCount] := 'Beneficio';
           HCalc.Bold(f, c + QMCabecera.FieldCount);
           HCalc.CellText[f, c + QMCabecera.FieldCount + 1] := 'Margen';
           HCalc.Bold(f, c + QMCabecera.FieldCount + 1);
           }

           // Datos
           QMCabecera.Last;
           PBListado.Max := QMCabecera.RecordCount;
           PBListado.Position := 0;

           // Abro y cierro porque es unidireccional
           QMCabecera.Close;
           QMCabecera.Open;
           while not QMCabecera.EOF do
           begin
              PBListado.Position := f;
              Inc(f);
              c := 1;
              for i := 0 to QMCabecera.FieldCount - 1 do
              begin
                 if (QMCabecera.Fields[i].Visible) then
                 begin
                    {Campo tipo String}
                    // Reemplazado: xxxReemplazo comilla doble por dos comillas simples si se entrecomillan los stringsxxx
                    // Reemplazo comilla doble por dos comillas dobles si se entrecomillan los strings
                    if (QMCabecera.Fields[i] is TStringField) and (Trim(QMCabecera.Fields[i].AsString) > '') then
                       HCalc.CellText[f, c + i] := QMCabecera.Fields[i].AsString;

                    if (QMCabecera.Fields[i] is TFloatField) and (QMCabecera.Fields[i].AsFloat <> 0) then
                       HCalc.SendNumber(f, c + i, QMCabecera.Fields[i].AsFloat);
                    // FormatFloat('0.000', QMCabecera.Fields[i].AsFloat);

                    if (QMCabecera.Fields[i] is TIntegerField) and (QMCabecera.Fields[i].AsInteger <> 0) then
                       HCalc.SendNumber(f, c + i, QMCabecera.Fields[i].AsInteger);
                    // Trim(QMCabecera.Fields[i].AsString);

                    // El formato será el del sistema en que se ejecute
                    if (QMCabecera.Fields[i] is TDateTimeField) and (YearOf(QMCabecera.Fields[i].AsDateTime) > 1900) then
                       HCalc.CellText[f, c + i] := DateToStr(QMCabecera.Fields[i].AsDateTime);
                 end;

                 {
                 // Formulas
                 HCalc.CellFormula[f, c + QMCabecera.FieldCount] := Format('=(E%d-F%d)', [f, f]);
                 HCalc.CellFormula[f, c + QMCabecera.FieldCount + 1] := Format('=((E%d-F%d)*100)/E%d', [f, f, f]);
                 }
              end;

              QMCabecera.Next;
           end;

           for i := 0 to QMCabecera.FieldCount - 1 do
           begin
              if (QMCabecera.Fields[i] is TStringField) then
                 HCalc.AutoFit(c + i);
           end;

           HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
        finally
           HCalc.Free;
           PBListado.Visible := False;
        end;
     end;
  end
  else
     DMListados.Imprimir(Grupo, 0, Modo, Serie, '', frFactura, frxFactura, nil, nil);
end;

{
procedure TDMLstFactura_Prov.MostrarListadoDiario(Serie: string);
var
  str:string;
begin
  SW := 1;
  fdesde := REntorno.FechaTrabSH ;
  fhasta := REntorno.FechaTrabSH + 1 ;

  with QMCabecera do
    begin
      Close;
      SelectSQL.Text:='SELECT * FROM VER_CABECERAS_FACTURA_PROV'+
            ' where empresa=?empresa and canal=?canal'+
            ' and serie=?serie and Fecha>=?FECHA1 and Fecha<=?FECHA2'+
            ' order by rig' ;
      Params.ByName['EMPRESA'   ].AsInteger  := REntorno.Empresa;
      Params.ByName['CANAL'     ].AsInteger  := REntorno.Canal;
      Params.ByName['SERIE'     ].AsString   := serie ;
      Params.ByName['FECHA1'    ].AsDatetime := fdesde;
      Params.ByName['FECHA2'    ].AsDatetime := fhasta;
      Open;
    end;

  with xProveedores do
    begin
      Close;
      Open;
    end;

  DMListados.Cargar(73,serie);
  frFactura.LoadFromFIB(REntorno.Formato,str);
  frFactura.PrepareReport;
  frFactura.ShowPreparedReport;
  DMListados.LimpiaEntorno;
end;
}

procedure TDMLstFactura_Prov.frFacturaGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Desde' then
     ParValue := FechaDesde;
  if ParName = 'Hasta' then
     ParValue := FechaHasta;

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'Titulo_Moneda' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := Moneda;
        Open;
        ParValue := xMonedas.FieldByName('TITULO').AsString;
     end;

  if ParName = 'BaseImponible' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('S_BASES').AsFloat);

  if ParName = 'Total_Factura' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_FACTURA').AsFloat);

  if ParName = 'MBI' then // Se encarga de mostrar o no la columna de la Base Imponible
     ParValue := MostrarBImponible;
end;

procedure TDMLstFactura_Prov.frFacturaEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraL]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraL;
  end;
end;

procedure TDMLstFactura_Prov.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
  xProveedores.Open;
  xEstados.Open;
end;

procedure TDMLstFactura_Prov.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xProveedores.Close;
  xEstados.Close;
end;

procedure TDMLstFactura_Prov.frxFacturaBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLstFactura_Prov.frxFacturaGetValue(const VarName: string; var Value: variant);
begin
  frFacturaGetValue(VarName, Value);
end;

end.
