unit UDMLstFacturaCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery,
  frxClass, frxDBSet, frxHYReport, ComCtrls;

type
  TDMLstFacturaCli = class(TDataModule)
     frFactura: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     DSCabecera: TDataSource;
     TLocal: THYTransaction;
     QMCabecera: TFIBDataSetRO;
     xClientes: TFIBDataSetRO;
     frxDBCabecera: TfrxDBDataset;
     frxFactura: TfrxHYReport;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     frDBDetalle: TfrDBDataSet;
     procedure frFacturaGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstFacturaDestroy(Sender: TObject);
     procedure frFacturaEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstFacturaCliCreate(Sender: TObject);
     procedure frxFacturaGetValue(const VarName: string; var Value: variant);
     procedure frxFacturaBeforePrint(Sender: TfrxReportComponent);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     LocalMascaraN, LocalMascaraL: string;
     Moneda: string;
     FechaDesde, FechaHasta: TDateTime;
     FiltroSerie: boolean;
     MostrarBImponible: smallint;
     MuestraDetalle: boolean;
     Agente: integer;
  public
     { Public declarations }
     procedure MostrarListado(Desde, Hasta, DesdeCon, HastaCon: TDateTime; ClienteDesde, ClienteHasta: integer; Forma, Modo: integer; Serie: string; aFiltroSerie: boolean; SerieDesde, SerieHasta, Moneda_Listado: string; aMostrarBImponible, aMuestraDetalle, MIntraC: boolean; OrdenKri, aAgente: integer; aComentario: string; aFechaListado: TDateTime; UsuarioCreaccion: integer; PBListado: TProgressBar);
     procedure MostrarListadoFiltrado(modo: byte; Filtro: integer; Serie: string);
  end;

var
  DMLstFacturaCli : TDMLstFacturaCli;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UHojaCalc, DateUtils, UParam, UDameDato;

{$R *.DFM}

procedure TDMLstFacturaCli.DMLstFacturaCliCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstFacturaCli.DMLstFacturaDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstFacturaCli.MostrarListado(Desde, Hasta, DesdeCon, HastaCon: TDateTime; ClienteDesde, ClienteHasta: integer; Forma, Modo: integer; Serie: string; aFiltroSerie: boolean; SerieDesde, SerieHasta, Moneda_Listado: string; aMostrarBImponible, aMuestraDetalle, MIntraC: boolean; OrdenKri, aAgente: integer; aComentario: string; aFechaListado: TDateTime; UsuarioCreaccion: integer; PBListado: TProgressBar);
var
  HCalc : THojaCalc;
  f, c, i : integer;
  Archivo : string;
begin
  FiltroSerie := aFiltroSerie;
  MostrarBImponible := BoolToInt(aMostrarBImponible);
  MuestraDetalle := aMuestraDetalle;
  Agente := aAgente;
  FechaDesde := Desde;
  FechaHasta := Hasta;
  DMListados.Normalizar_Desde_Hasta(Desde, Hasta);
  DMListados.Normalizar_Desde_Hasta(DesdeCon, HastaCon);
  DMListados.Normalizar_Desde_Hasta(ClienteDesde, ClienteHasta);

  DMListados.DatosInforme(aFechaListado, aComentario);

  Moneda := Moneda_Listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ');
     if (Modo = 2) then
     begin
        // Si cambian los campos verificar las formulas
        SelectSQL.Add(' CAB.FECHA, CAB.SERIE, CAB.RIG, CAB.TITULO, CAB.S_BASES, (SELECT SUM(T_COSTE) FROM GES_DETALLES_S WHERE ID_S = CAB.ID_S) T_COSTE, ');
        SelectSQL.Add(' CAB.CLIENTE, CAB.TERCERO, CAB.DIRECCION, CAB.SU_REFERENCIA, CAB.FORMA_PAGO, CAB.ESTADO, CAB.AGENTE, CAB.S_CUOTA_IVA, CAB.S_CUOTA_RE, ');
        SelectSQL.Add(' CAB.DTO_PP, CAB.DTO_CIAL, CAB.I_PORTES, CAB.LIQUIDO, CAB.NIF ');
     end
     else
        SelectSQL.Add(' * ');
     SelectSQL.Add(' FROM VER_CABECERAS_FACTURA CAB ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' CAB.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CAB.CANAL = :CANAL AND ');
     if (FiltroSerie) then
        SelectSQL.Add(' CAB.SERIE >= :DESDE_SERIE AND CAB.SERIE <= :HASTA_SERIE AND ')
     else
        SelectSQL.Add(' CAB.SERIE = :SERIE AND ');

     SelectSQL.Add(' ((CAB.FECHA >= ?FECHA_DESDE) AND (CAB.FECHA <= ?FECHA_HASTA)) AND ');

     case Forma of
        1: SelectSQL.Add(' ((CAB.ESTADO = 0) OR ((CAB.FECHA_CON >= ?FECHA_DESDE_CON) AND (CAB.FECHA_CON <= ?FECHA_HASTA_CON))) AND ');
        2: SelectSQL.Add(' ((CAB.FECHA_CON >= ?FECHA_DESDE_CON) AND (CAB.FECHA_CON <= ?FECHA_HASTA_CON)) AND ');
        3: SelectSQL.Add(' ((CAB.ESTADO = 0) OR ((CAB.FECHA_CON >= ?FECHA_DESDE_CON) AND (CAB.FECHA_CON <= ?FECHA_HASTA_CON))) AND ');
     end;

     SelectSQL.Add(' CAB.CLIENTE >= :C_DESDE AND ');
     SelectSQL.Add(' CAB.CLIENTE <= :C_HASTA ');
     case Forma of
        1: SelectSQL.Add(' AND CAB.ESTADO = 0 ');
        2: SelectSQL.Add(' AND CAB.ESTADO = 5 ');
     end;

     // Mostrar Fac. Intracomunitarias
     if (not MIntraC) then
        SelectSQL.Add(' AND CAB.ESTADO <> 6 ');

     if (Agente <> 0) then
        SelectSQL.Add(' AND CAB.AGENTE = :AGENTE ');

     if (UsuarioCreaccion <> 0) then
        SelectSQL.Add(' AND CAB.USUARIO_CREACION = :USUARIO_CREACION ');

     SelectSQL.Add(' ORDER BY CAB.SERIE ');
     case OrdenKri of
        0:
        begin
           if (REntorno.Pais = 'CHL') then
              SelectSQL.Add(' ,CAB.TIPO_DOC_TRIBUTARIO, CAB.FOLIO, CAB.FECHA ')
           else
              SelectSQL.Add(' ,CAB.RIG ');
        end;
        1: SelectSQL.Add(' ,CAB.FECHA, CAB.RIG ');
        2: SelectSQL.Add(' ,CAB.AGENTE, /*CAB.CLIENTE,*/ CAB.FECHA, CAB.RIG ');
        3: SelectSQL.Add(' ,CAB.TITULO, CAB.RIG ');
        4: SelectSQL.Add(' ,CAB.FORMA_PAGO, CAB.RIG ');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (FiltroSerie) then
     begin
        Params.ByName['DESDE_SERIE'].AsString := SerieDesde;
        Params.ByName['HASTA_SERIE'].AsString := SerieHasta;
     end
     else
        Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA_DESDE'].AsDateTime := Desde;
     Params.ByName['FECHA_HASTA'].AsDateTime := Hasta;
     Params.ByName['FECHA_DESDE_CON'].AsDateTime := DesdeCon;
     Params.ByName['FECHA_HASTA_CON'].AsDateTime := HastaCon;
     Params.ByName['C_DESDE'].AsInteger := ClienteDesde;
     Params.ByName['C_HASTA'].AsInteger := ClienteHasta;
     if (Agente <> 0) then
        Params.ByName['AGENTE'].AsInteger := Agente;
     if (UsuarioCreaccion <> 0) then
        Params.ByName['USUARIO_CREACION'].AsInteger := UsuarioCreaccion;
     Open;
  end;

  if (Modo = 2) then
  begin
     // Exportar a Excel
     Archivo := Format(_('ResumenFacturas-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMLstFacturaCli') then
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

           // Titulos de Formulas
           HCalc.CellText[f, c + QMCabecera.FieldCount] := 'Beneficio';
           HCalc.Bold(f, c + QMCabecera.FieldCount);
           HCalc.CellText[f, c + QMCabecera.FieldCount + 1] := 'Margen';
           HCalc.Bold(f, c + QMCabecera.FieldCount + 1);

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

                 // Formulas
                 HCalc.CellFormula[f, c + QMCabecera.FieldCount] := Format('=(E%d-F%d)', [f, f]);
                 HCalc.CellFormula[f, c + QMCabecera.FieldCount + 1] := Format('=((E%d-F%d)*100)/E%d', [f, f, f]);
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
     DMListados.Imprimir(47, 0, Modo, Serie, _('Resumen Facturas'), frFactura, frxFactura, nil);
end;

procedure TDMLstFacturaCli.MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
begin
  MostrarBImponible := 1;
  with QMCabecera do
  begin
     Close;
     if (Filtro = 0) then
     begin
        DMMain.FiltraRO(QMCabecera, '11110', False);
        Params.ByName['SERIE'].AsString := Serie;
     end;
     Open;
  end;

  Moneda := REntorno.Moneda;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Imprimir(47, 0, Modo, Serie, _('Resumen Facturas Filtradas'), frFactura, frxFactura, nil);
end;

procedure TDMLstFacturaCli.frFacturaGetValue(const ParName: string; var ParValue: variant);
var
  Cambio : extended;
begin
  DMListados.GetValue(ParName, ParValue);

  Cambio := 0;
  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     Cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if ParName = 'Desde' then
     ParValue := FechaDesde;
  if ParName = 'Hasta' then
     ParValue := FechaHasta;

  if ParName = 'Fecha' then
     ParValue := QMCabecera.FieldByName('FECHA').AsDateTime;

  if ParName = 'BaseImponible' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('S_BASES').AsFloat, Cambio);

  if ParName = 'Total_Factura' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat, Cambio);

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'Titulo_Moneda' then
     ParValue := DameTituloMoneda(Moneda);

  if ((ParName = 'MBI') or (ParName = 'MostrarBImponible')) then // Se encarga de mostrar o no la columna de la Base Imponible
     ParValue := MostrarBImponible;

  if ParName = 'FiltroSerie' then
     ParValue := FiltroSerie;

  if ParName = 'MuestraDetalle' then
     ParValue := MuestraDetalle;

  if ParName = 'Agente' then
     ParValue := Agente;

  if ParName = 'TituloAgente' then
     ParValue := DameTituloAgente(Agente);
end;

procedure TDMLstFacturaCli.frFacturaEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMLstFacturaCli.frxFacturaGetValue(const VarName: string; var Value: variant);
begin
  frFacturaGetValue(VarName, Value);
end;

procedure TDMLstFacturaCli.frxFacturaBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxMemoView) then
     with (Sender as TfrxMemoView) do
        if (Memo.Count > 0) then
        begin
           if (Pos('[MascaraN]', Memo[0]) > 0) then
              DisplayFormat.FormatStr := LocalMascaraN;
           if (Pos('[MascaraL]', Memo[0]) > 0) then
              DisplayFormat.FormatStr := LocalMascaraL;
        end;
end;

procedure TDMLstFacturaCli.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
  xClientes.Open;
  QMDetalle.Open;
end;

procedure TDMLstFacturaCli.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xClientes.Close;
  QMDetalle.Close;
end;

end.
