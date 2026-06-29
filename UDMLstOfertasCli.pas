unit UDMLstOfertasCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery,
  frxClass, frxHYReport, frxDBSet, ComCtrls;

type
  TDMLstOfertasCli = class(TDataModule)
     DSCabecera: TDataSource;
     frOferta: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     xClientes: TFIBDataSetRO;
     TLocal: THYTransaction;
     QMCabecera: TFIBDataSetRO;
     frxDBCabecera: TfrxDBDataset;
     frxOferta: TfrxHYReport;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     frDBDetalle: TfrDBDataSet;
     procedure frOfertaGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstOfertaDestroy(Sender: TObject);
     procedure frOfertaEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstOfertasCliCreate(Sender: TObject);
     procedure frxOfertaGetValue(const VarName: string; var Value: variant);
     procedure frxOfertaBeforePrint(Sender: TfrxReportComponent);
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
     procedure MostrarListado(Desde, Hasta: TDateTime; ClienteDesde, ClienteHasta, Forma, Modo: integer; Serie: string; aFiltroSerie: boolean; SerieDesde, SerieHasta, Moneda_Listado: string; aMostrarBImponible, aMuestraDetalle: boolean; OrdenKri, aAgente: integer; aComentario: string; aFechaListado: TDateTime; UsuarioCreaccion: integer; PBListado: TProgressBar);
     procedure MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
  end;

var
  DMLstOfertasCli : TDMLstOfertasCli;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles, UHojaCalc, DateUtils, UDameDato;

{$R *.DFM}

procedure TDMLstOfertasCli.DMLstOfertasCliCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstOfertasCli.DMLstOfertaDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstOfertasCli.MostrarListado(Desde, Hasta: TDateTime; ClienteDesde, ClienteHasta, Forma, Modo: integer; Serie: string; aFiltroSerie: boolean; SerieDesde, SerieHasta, Moneda_Listado: string; aMostrarBImponible, aMuestraDetalle: boolean; OrdenKri, aAgente: integer; aComentario: string; aFechaListado: TDateTime; UsuarioCreaccion: integer; PBListado: TProgressBar);
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
        SelectSQL.Add(' CAB.DTO_PP, CAB.DTO_CIAL, CAB.I_PORTES, CAB.LIQUIDO ');
     end
     else
        SelectSQL.Add(' * ');
     SelectSQL.Add(' FROM VER_CABECERAS_OFERTA_C CAB');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' CAB.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CAB.CANAL = :CANAL AND ');
     if (FiltroSerie) then
        SelectSQL.Add(' CAB.SERIE >= :DESDE_SERIE AND CAB.SERIE <= :HASTA_SERIE AND ')
     else
        SelectSQL.Add(' CAB.SERIE = :SERIE AND ');
     SelectSQL.Add(' CAB.FECHA >= :DESDE AND ');
     SelectSQL.Add(' CAB.FECHA <= :HASTA AND ');
     SelectSQL.Add(' CAB.CLIENTE >= :C_DESDE AND ');
     SelectSQL.Add(' CAB.CLIENTE <= :C_HASTA ');
     case Forma of
        1: SelectSQL.Add(' AND CAB.ESTADO = 0 ');
        2: SelectSQL.Add(' AND CAB.ESTADO = 5 ');
     end;
     if (Agente <> 0) then
        SelectSQL.Add(' AND CAB.AGENTE = :AGENTE ');

     if (UsuarioCreaccion <> 0) then
        SelectSQL.Add(' AND CAB.USUARIO_CREACION = :USUARIO_CREACION ');

     SelectSQL.Add(' ORDER BY CAB.SERIE ');
     case OrdenKri of
        0: SelectSQL.Add(' ,CAB.RIG ');
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
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
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
     Archivo := Format(_('ResumenOfertas-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMLstOfertasCli') then
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
           QMCabecera.First;
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
     DMListados.Imprimir(46, 0, Modo, Serie, _('Resumen Ofertas'), frOferta, frxOferta, nil);
end;

procedure TDMLstOfertasCli.MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
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

  DMListados.Imprimir(46, 0, Modo, Serie, _('Resumen Ofertas Filtradas'), frOferta, frxOferta, nil);
end;

procedure TDMLstOfertasCli.frOfertaGetValue(const ParName: string; var ParValue: variant);
var
  cambio : extended;
begin
  DMListados.GetValue(ParName, ParValue);

  cambio := 0;
  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if ParName = 'Desde' then
     ParValue := FechaDesde;
  if ParName = 'Hasta' then
     ParValue := FechaHasta;

  if ParName = 'Fecha' then
     ParValue := QMCabecera.FieldByName('FECHA').AsDateTime;

  if ParName = 'BaseImponible' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('S_BASES').AsFloat, Cambio);

  if ParName = 'Total_Oferta' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('LIQUIDO').AsFloat, Cambio);

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
     ParValue := UDameDato.DameTituloAgente(Agente);
end;

procedure TDMLstOfertasCli.frOfertaEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMLstOfertasCli.frxOfertaGetValue(const VarName: string; var Value: variant);
begin
  frOfertaGetValue(VarName, Value);
end;

procedure TDMLstOfertasCli.frxOfertaBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstOfertasCli.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
  xClientes.Open;
  QMDetalle.Open;
end;

procedure TDMLstOfertasCli.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xClientes.Close;
  QMDetalle.Close;
end;

end.
