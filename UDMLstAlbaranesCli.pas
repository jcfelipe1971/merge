unit UDMLstAlbaranesCli;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery,
  frxClass, frxDBSet, frxHYReport, ComCtrls;

type
  TDMLstAlbaranesCli = class(TDataModule)
     frAlbaran: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     DSCabecera: TDataSource;
     TLocal: THYTransaction;
     QMCabecera: TFIBDataSetRO;
     xClientes: TFIBDataSetRO;
     frxDBCabecera: TfrxDBDataset;
     frxAlbaran: TfrxHYReport;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     frDBDetalle: TfrDBDataSet;
     procedure frAlbaranGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstAlbaranescliDestroy(Sender: TObject);
     procedure frAlbaranEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstAlbaranesCliCreate(Sender: TObject);
     procedure frxAlbaranGetValue(const VarName: string; var Value: variant);
     procedure frxAlbaranBeforePrint(Sender: TfrxReportComponent);
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
     procedure MostrarListado(Desde, Hasta, FechaAlb: TDateTime; ClienteDesde, ClienteHasta, Forma, Modo: integer; Serie: string; aFiltroSerie: boolean; SerieDesde, SerieHasta, Moneda_Listado: string; aMostrarBImponible, aMuestraDetalle: boolean; OrdenKri, aAgente: integer; FiltroAlb: boolean; aComentario: string; aFechaListado: TDateTime; UsuarioCreaccion: integer; PBListado: TProgressBar);
     procedure MostrarListadoFiltrado(modo: byte; Filtro: integer; Serie: string);
  end;

var
  DMLstAlbaranesCli : TDMLstAlbaranesCli;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UHojaCalc, DateUtils, UDameDato;

{$R *.DFM}

procedure TDMLstAlbaranesCli.DMLstAlbaranesCliCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstAlbaranesCli.DMLstAlbaranesCliDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstAlbaranesCli.MostrarListado(Desde, Hasta, FechaAlb: TDateTime; ClienteDesde, ClienteHasta, Forma, Modo: integer; Serie: string; aFiltroSerie: boolean; SerieDesde, SerieHasta, Moneda_Listado: string; aMostrarBImponible, aMuestraDetalle: boolean; OrdenKri, aAgente: integer; FiltroAlb: boolean; aComentario: string; aFechaListado: TDateTime; UsuarioCreaccion: integer; PBListado: TProgressBar);
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

  FechaAlb := HourIntoDate(FechaAlb, '23:59:59');

  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ');
     if (Modo = 2) then
     begin
        // Si cambian los campos verificar las formulas
        SelectSQL.Add(' CAB.FECHA, CAB.SERIE, CAB.RIG, TER.NOMBRE_R_SOCIAL TITULO, CAB.S_BASES, (SELECT SUM(T_COSTE) FROM GES_DETALLES_S WHERE ID_S = CAB.ID_S) T_COSTE, ');
        SelectSQL.Add(' CAB.CLIENTE, CAB.TERCERO, CAB.DIRECCION, CAB.SU_REFERENCIA, CAB.FORMA_PAGO, CAB.ESTADO, CAB.AGENTE, CAB.S_CUOTA_IVA, CAB.S_CUOTA_RE, ');
        SelectSQL.Add(' CAB.DTO_PP, CAB.DTO_CIAL, CAB.I_PORTES, CAB.LIQUIDO, TER.NIF ');
     end
     else
        SelectSQL.Add(' * ');
     SelectSQL.Add(' FROM GES_CABECERAS_S CAB ');
     SelectSQL.Add(' JOIN SYS_TERCEROS TER ON CAB.TERCERO = TER.TERCERO ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S_ALB ALB ON CAB.ID_S = ALB.ID_S ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ALB.EMPRESA = :EMPRESA  AND ');
     SelectSQL.Add(' ALB.CANAL = :CANAL AND ');
     SelectSQL.Add(' CAB.FECHA >= :DESDE  AND ');
     SelectSQL.Add(' CAB.FECHA <= :HASTA AND ');
     SelectSQL.Add(' ALB.TIPO = ''ALB'' AND ');
     SelectSQL.Add(' CAB.CLIENTE >= :C_DESDE AND ');
     SelectSQL.Add(' CAB.CLIENTE <= :C_HASTA ');

     if FiltroSerie then
        SelectSQL.Add(' AND ALB.SERIE >= :DESDE_SERIE AND ALB.SERIE <= :HASTA_SERIE ')
     else
        SelectSQL.Add(' AND ALB.SERIE = :SERIE ');

     if FiltroAlb then
     begin
        // Busco fecha de factura para establecer hasta cuando estuvo abierto el albaran
        SelectSQL.Add(' AND ((CAB.ESTADO = 0) OR ((CAB.ESTADO = 5) AND ');
        SelectSQL.Add(' ((SELECT FIRST 1 CAST(EXTRACT(DAY FROM F.FECHA)||''.''|| EXTRACT(MONTH FROM F.FECHA)||''.''|| EXTRACT(YEAR FROM F.FECHA) AS DATE) ');
        SelectSQL.Add('   FROM GES_CABECERAS_RELACIONES R ');
        SelectSQL.Add('   LEFT JOIN GES_CABECERAS_S F ON F.EMPRESA = R.D_EMPRESA AND F.EJERCICIO = R.D_EJERCICIO AND F.CANAL = R.D_CANAL AND F.SERIE = R.D_SERIE AND F.TIPO = R.D_TIPO AND F.RIG = R.D_RIG ');
        SelectSQL.Add('   WHERE ');
        SelectSQL.Add('   CAB.EMPRESA = R.O_EMPRESA AND ');
        SelectSQL.Add('   CAB.EJERCICIO = R.O_EJERCICIO AND ');
        SelectSQL.Add('   CAB.CANAL = R.O_CANAL AND ');
        SelectSQL.Add('   CAB.SERIE = R.O_SERIE AND ');
        SelectSQL.Add('   CAB.TIPO = R.O_TIPO AND ');
        SelectSQL.Add('   CAB.RIG = R.O_RIG AND ');
        SelectSQL.Add('   R.D_TIPO = ''FAC'') > :FECHA_CIERRE))) ');
     end
     else
     begin
        case Forma of
           1: SelectSQL.Add(' AND CAB.ESTADO = 0 ');   // Filtra por el estado del albarán cuando esta abierto
           2: SelectSQL.Add(' AND CAB.ESTADO = 5 ');   // Filtra por el estado del albarán cuando esta cerrado
        end;
     end;
     if (Agente <> 0) then
        SelectSQL.Add(' AND CAB.AGENTE = :AGENTE ');

     if (UsuarioCreaccion <> 0) then
        SelectSQL.Add(' AND CAB.USUARIO_CREACION = :USUARIO_CREACION ');

     SelectSQL.Add(' ORDER BY CAB.SERIE ');
     case OrdenKri of
        0:
        begin
           if (REntorno.Pais = 'CHL') then
              SelectSQL.Add(' ,ALB.TIPO_DOC_TRIBUTARIO, ALB.FOLIO, CAB.FECHA ')
           else
              SelectSQL.Add(' ,CAB.RIG ');
        end;
        1: SelectSQL.Add(' ,CAB.FECHA, CAB.RIG ');
        2: SelectSQL.Add(' ,CAB.AGENTE, /*CAB.CLIENTE,*/ CAB.FECHA, CAB.RIG ');
        3: SelectSQL.Add(' ,TER.NOMBRE_R_SOCIAL, CAB.RIG ');
        4: SelectSQL.Add(' ,CAB.FORMA_PAGO, CAB.RIG ');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;
     Params.ByName['C_DESDE'].AsInteger := ClienteDesde;
     Params.ByName['C_HASTA'].AsInteger := ClienteHasta;

     if FiltroSerie then
     begin
        Params.ByName['DESDE_SERIE'].AsString := SerieDesde;
        Params.ByName['HASTA_SERIE'].AsString := SerieHasta;
     end
     else
     begin
        Params.ByName['SERIE'].AsString := Serie;
     end;

     if FiltroAlb then
        Params.ByName['FECHA_CIERRE'].AsDateTime := FechaAlb;

     if (Agente <> 0) then
        Params.ByName['AGENTE'].AsInteger := Agente;

     if (UsuarioCreaccion <> 0) then
        Params.ByName['USUARIO_CREACION'].AsInteger := UsuarioCreaccion;
     Open;
  end;


  if (Modo = 2) then
  begin
     // Exportar a Excel
     Archivo := Format(_('ResumenAlbaranes-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMLstAlbaranesCli') then
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
     DMListados.Imprimir(44, 0, Modo, Serie, _('Resumen Albaranes'), frAlbaran, frxAlbaran, nil);
end;

procedure TDMLstAlbaranesCli.MostrarListadoFiltrado(modo: byte; Filtro: integer; Serie: string);
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

  DMListados.Imprimir(44, 0, Modo, Serie, _('Resumen Albaranes Filtrados'), frAlbaran, frxAlbaran, nil);
end;

procedure TDMLstAlbaranesCli.frAlbaranGetValue(const ParName: string; var ParValue: variant);
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

  if ParName = 'Total_Albaran' then
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

procedure TDMLstAlbaranesCli.frAlbaranEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstAlbaranesCli.frxAlbaranGetValue(const VarName: string; var Value: variant);
begin
  frAlbaranGetValue(VarName, Value);
end;

procedure TDMLstAlbaranesCli.frxAlbaranBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstAlbaranesCli.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
  xClientes.Open;
  QMDetalle.Open;
end;

procedure TDMLstAlbaranesCli.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xClientes.Close;
  QMDetalle.Close;
end;

end.
