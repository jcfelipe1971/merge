unit UDMLstInfFacProveedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FR_Class, Fr_HYReport,
  FR_DSet, FR_DBSet, FIBTableDataSet, FIBQuery, UHYReport, HYFIBQuery,
  FIBDataSetRO, frxClass, frxHYReport, FR_Pars, frxDBSet, UHYReportMail;

type
  TDMLstInfFacProveedor = class(TDataModule)
     TLocal: THYTransaction;
     DSCabecera: TDataSource;
     frDBCabecera: TfrDBDataSet;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     frDBDetalle: TfrDBDataSet;
     frDBxProv: TfrDBDataSet;
     xDirProv: TFIBDataSetRO;
     DSxDirProv: TDataSource;
     frDBxDirProv: TfrDBDataSet;
     xFormaPago: TFIBDataSetRO;
     DSxFormaPago: TDataSource;
     frDBxFormaPago: TfrDBDataSet;
     xNombreIva: TFIBDataSetRO;
     DSxNombreIva: TDataSource;
     frDBxNombreIva: TfrDBDataSet;
     xDatosIva: TFIBDataSetRO;
     DSxDatosIva: TDataSource;
     frDBxDatosIva: TfrDBDataSet;
     xProv: TFIBDataSetRO;
     DSxProv: TDataSource;
     frFactura: TfrHYReport;
     frUDPie: TfrUserDataset;
     SPDame_factor: THYFIBQuery;
     QSPProcedencia: TFIBDataSetRO;
     DSQSPProcedencia: TDataSource;
     frDBQSPProcedencia: TfrDBDataSet;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSDetalle: THYReportSource;
     HYRSxProv: THYReportSource;
     HYRSxDirProv: THYReportSource;
     HYRSxNombreIva: THYReportSource;
     HYRSxDatosIva: THYReportSource;
     frUDNotasArt: TfrUserDataset;
     xDatosBancarios: TFIBDataSetRO;
     DSxDatosBancarios: TDataSource;
     frDBxDatosBancarios: TfrDBDataSet;
     xEntidad: TFIBDataSetRO;
     DSxEntidad: TDataSource;
     frDBxEntidad: TfrDBDataSet;
     frUserNotasCab: TfrUserDataset;
     QMCabecera: TFIBDataSetRO;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     QLoteKri: TFIBDataSetRO;
     QNroSerieKri: TFIBDataSetRO;
     DSxArticuloKri: TDataSource;
     xArticuloKri: TFIBDataSetRO;
     QGen: THYFIBQuery;
     xUpdateaDocumentos: TFIBDataSetRO;
     DSDobleCabecera: TDataSource;
     DobleCabecera: TFIBDataSetRO;
     xDobFormaPago: TFIBDataSetRO;
     DSxDobFormaPago: TDataSource;
     xDobleIva: TFIBDataSetRO;
     DSxDobleIva: TDataSource;
     HYRSDobleCabecera: THYReportSource;
     HYRSxDobDatosIva: THYReportSource;
     HYRSxDobFormaPago: THYReportSource;
     xLotes: TFIBDataSetRO;
     DSxLotes: TDataSource;
     frDBxLotes: TfrDBDataSet;
     xNroSerie: TFIBDataSetRO;
     DSxNroSerie: TDataSource;
     frDBxNroSerie: TfrDBDataSet;
     HYRSxNroSerie: THYReportSource;
     HYRSxLotes: THYReportSource;
     HYRSxArticulos: THYReportSource;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frDBxArticulos: TfrDBDataSet;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     xProyectosDetalle: TFIBDataSetRO;
     DSxProyectosDetalle: TDataSource;
     frxFactura: TfrxHYReport;
     frxUDPie: TfrxUserDataSet;
     frxUDNotasArt: TfrxUserDataSet;
     frxUserNotasCab: TfrxUserDataSet;
     xArticulosIdioma: TFIBDataSetRO;
     DSxArticulosIdioma: TDataSource;
     QMDetalleUE: TFIBDataSetRO;
     DSDetalleUE: TDataSource;
     frDBGrupoTalla: TfrDBDataSet;
     DSGrupoTalla: TDataSource;
     HYRSGrupoTalla: THYReportSource;
     QMGrupoTalla: TFIBDataSetRO;
     HYRMGrupoTalla: THYReportMailSource;
     frxDBGrupoTalla: TfrxDBDataset;
     frDBTituloTalla: TfrDBDataSet;
     DSTituloTalla: TDataSource;
     HYRSTituloTalla: THYReportSource;
     QMTituloTalla: TFIBDataSetRO;
     HYRMTituloTalla: THYReportMailSource;
     frxDBTituloTalla: TfrxDBDataset;
     frDBDetalleTallas: TfrDBDataSet;
     DSDetalleTallas: TDataSource;
     HYRSDetalleTallas: THYReportSource;
     QMDetalleTallas: TFIBDataSetRO;
     HYRMDetalleTallas: THYReportMailSource;
     frxDBDetalleTallas: TfrxDBDataset;
     QMArticuloTallas: TFIBDataSetRO;
     DSArticuloTallas: TDataSource;
     xEmpresa: TFIBDataSetRO;
     frxDBxEmpresa: TfrxDBDataset;
     DSxEmpresa: TDataSource;
     frDBxEmpresa: TfrDBDataSet;
     procedure DMLstInfFacProveedorCreate(Sender: TObject);
     procedure DMLstInfFacProveedorDestroy(Sender: TObject);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure xProvAfterScroll(DataSet: TDataSet);
     procedure frFacturaEnterRect(Memo: TStringList; View: TfrView);
     procedure frFacturaGetValue(const ParName: string; var ParValue: variant);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure frUDNotasArtFirst(Sender: TObject);
     procedure frUDNotasArtNext(Sender: TObject);
     procedure frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
     procedure xDatosBancariosAfterScroll(DataSet: TDataSet);
     procedure frUserNotasCabCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUserNotasCabFirst(Sender: TObject);
     procedure frUserNotasCabNext(Sender: TObject);
     procedure frFacturaPrintReport;
     procedure DobleCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure HYReportPrintReport(Sender: THYReport);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure frxFacturaBeforePrint(Sender: TfrxReportComponent);
     procedure frxFacturaGetValue(const VarName: string; var Value: variant);
     procedure frxFacturaPrintReport(Sender: TObject);
     procedure frFacturaUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     function frxFacturaUserFunction(const MethodName: string; var Params: variant): variant;
     procedure QMGrupoTallaAfterOpen(DataSet: TDataSet);
     procedure QMGrupoTallaBeforeClose(DataSet: TDataSet);
     procedure QMDetalleTallasAfterOpen(DataSet: TDataSet);
     procedure QMDetalleTallasBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     subtotal: double;
     ric, NotasCab: TStringList;
     j, indNotas: integer;
     LocalMascaraN, LocalMascaraL: string;
     LocalMascaraNSec, Moneda_Sec: string;
     FacturaAnt, LineaAnt: integer;
     nro_serie: string;
     Param_MODREST017: boolean;
  public
     { Public declarations }
     nombreFich, rutaFich: string;
     procedure MostrarInforme(serie: string; rig, id_e: integer; Modo: integer; ejercicio: integer);
     function Total_Euros: double;
     procedure MostrarListadoDiario(serie: string);
     procedure MostrarInformesFiltrados(Modo: byte; Filtro: integer; serie: string);
     procedure UpdateaDocumentos;
     procedure MostrarListadoMail(id_e: integer; serie: string; Modo: integer; const Ejercicio: integer);
  end;

var
  DMLstInfFacProveedor : TDMLstInfFacProveedor;
  SW, id_s_aux, filtrogen, tipolistado : integer;
  seriegen : string;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UDameDato, UParam;

procedure TDMLstInfFacProveedor.DMLstInfFacProveedorCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  // Crear StringLists para las notas por artículo y para la cabecera
  ric := TStringList.Create;
  NotasCab := TStringList.Create;

  Param_MODREST017 := (LeeParametro('MODREST017') = 'S');

  FacturaAnt := -1000;
  LineaAnt := -1000;

  frxFactura.AddFunction('function DAME_TEXTO_IDIOMA(i: integer; Bandera: string = ''''): string', 'Merge', 'Devuelve el texto en el idioma del documento');
end;

procedure TDMLstInfFacProveedor.DMLstInfFacProveedorDestroy(Sender: TObject);
begin
  // Liberar recursos
  ric.Free;
  NotasCab.Free;

  CierraData(DMListados);
end;

procedure TDMLstInfFacProveedor.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  xProv.Close;
  xProv.Open;
  xFormaPago.Close;
  xFormaPago.Open;
  xDatosIva.Close;
  xDatosIva.Open;

  if ((QMCabecera.RecordCount > 0) and (NotasCab <> nil)) then
     NotasCab.Assign(QMCabecera.FieldByName('NOTAS'));
end;

procedure TDMLstInfFacProveedor.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
     ric.Assign(QMDetalle.FieldByName('NOTAS'));
  {dji lrk kri}
  xArticuloKri.Close;
  xArticuloKri.Open;

  QSPProcedencia.Close;
  QSPProcedencia.Open;
  xArticulos.Close;
  xArticulos.Open;

  nro_serie := '';
  QNroSerieKri.Close;
  QNroSerieKri.Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
  QNroSerieKri.Params.ByName['EJERCICIO_S'].AsInteger :=
     QSPProcedencia.FieldByName('EJERCICIO_O').AsInteger;
  QNroSerieKri.Params.ByName['CANAL'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
  QNroSerieKri.Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
  QNroSerieKri.Params.ByName['ARTICULO'].AsString := QMDetalle.FieldByName('ARTICULO').AsString;
  QNroSerieKri.Params.ByName['RIG_S'].AsInteger := QSPProcedencia.FieldByName('RIG_O').AsInteger;
  if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALP' then
     QNroSerieKri.Params.ByName['LINEA_S'].AsInteger := QSPProcedencia.FieldByName('LINEA_O').AsInteger
  else
     QNroSerieKri.Params.ByName['LINEA_S'].AsInteger := -1;
  QNroSerieKri.Open;

  QLoteKri.Close;
  QLoteKri.Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
  QLoteKri.Params.ByName['EJERCICIO_S'].AsInteger := QSPProcedencia.FieldByName('EJERCICIO_O').AsInteger;
  QLoteKri.Params.ByName['CANAL'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
  QLoteKri.Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
  QLoteKri.Params.ByName['ARTICULO'].AsString := QMDetalle.FieldByName('ARTICULO').AsString;
  QLoteKri.Params.ByName['RIG_S'].AsInteger := QSPProcedencia.FieldByName('RIG_O').AsInteger;
  if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALP' then
     QLoteKri.Params.ByName['LINEA_S'].AsInteger := QSPProcedencia.FieldByName('LINEA_O').AsInteger
  else
     QLoteKri.Params.ByName['LINEA_S'].AsInteger := -1;
  QLoteKri.Open;
  if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
  begin
     ric.Assign(QMDetalle.FieldByName('NOTAS'));
     if (not QNroSerieKri.EOF) then
     begin
        if (QNroSerieKRI.FieldByName('NRO_SERIE').AsString <> '') then
           nro_serie := QNroSerieKRI.FieldByName('NRO_SERIE').AsString;
        QNroSerieKri.Next;
     end;
     while (not QNroSerieKri.EOF) do
     begin
        if (QNroSerieKRI.FieldByName('NRO_SERIE').AsString <> '') then
           nro_serie := nro_serie + ' - ' + QNroSerieKRI.FieldByName('NRO_SERIE').AsString;
        QNroSerieKri.Next;
     end;
     if (nro_serie <> '') then
        ric.Insert(0, _('Nro. de Serie') + ' : ' + nro_serie);

     while (not QloteKri.EOF) do
     begin
        if (QLoteKri.FieldByName('LOTE').AsString <> '') then
        begin
           ric.Insert(0, _('Lote') + ' : ' + QLoteKri.FieldByName('LOTE').AsString + ' ' + _('Caducidad') + ' : ' +
              QLoteKri.FieldByName('CADUCIDAD').AsString + ' x ' + QLoteKri.FieldByName('COUNT').AsString);

           if (Length(nro_serie) > 0) then
              nro_serie := nro_serie + #13;
           nro_serie := nro_serie + _('Lote') + ' : ' + QLoteKri.FieldByName('LOTE').AsString + ' ' + _('Caducidad') + ' : ' +
              QLoteKri.FieldByName('CADUCIDAD').AsString + ' x ' + QLoteKri.FieldByName('COUNT').AsString;
        end;
        QLoteKri.Next;
     end;
  end;
end;

procedure TDMLstInfFacProveedor.xProvAfterScroll(DataSet: TDataSet);
begin
  xDatosBancarios.Close;
  xDatosBancarios.Open;
  with xDirProv do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := xProv.FieldByName('TERCERO').AsInteger;
     Params.ByName['Direccion'].AsInteger := 1; // QMCabecera.FieldByName('DIRECCION').AsInteger
     Open;
  end;
end;

procedure TDMLstInfFacProveedor.MostrarInforme(serie: string; rig, id_e: integer; Modo: integer; ejercicio: integer);
var
  Titulo : string;
  Grupo, Listado : integer;
begin
  id_s_aux := id_e;
  seriegen := serie;
  tipolistado := 0;
  SW := 1;
  with QMCabecera do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_CABECERAS_FACTURA_PROV_LST WHERE ID_E = ?ID_E';
     Params.ByName['ID_E'].AsInteger := id_e;

     Open;
  end;

  Grupo := 73;
  Listado := 0;
  Titulo := _('FacturaProveedor') + '_' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '-' + QMCabecera.FieldByName('RIG').AsString;
  DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frFactura, frxFactura, HYReport, nil);
end;

procedure TDMLstInfFacProveedor.frFacturaEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraArt]', Memo[0]) > 0) then
        View.FormatStr := CalculaMascara(DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES').AsString), False);

     if (Pos('[MascaraArtT]', Memo[0]) > 0) then
        View.FormatStr := CalculaMascara(DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES').AsString), False);

     if memo[0] = '[NotasArt]' then
        memo[0] := ric.Strings[j];

     if memo[0] = '[NotasCabecera]' then
        memo[0] := NotasCab.Strings[indNotas];

     if (Pos('[Notas]', Memo[0]) > 0) then
     begin
        if QMCabecera.FieldByName('NOTAS').Value = '' then
        begin
           view.Visible := False;
           view.Parent.dy := 0;
        end
        else
        begin
           if Copy(QMCabecera.FieldByName('NOTAS').Value, 1, 4) = #$D#$A#$D#$A then
              view.Parent.dy := 0
           else
           begin
              view.Parent.dy := 34;
              view.Visible := True;
           end;
        end;
     end;

     if (memo[0] = 'CANTIDADES') then
        SW := 1;
     if (Memo[0] = '[L]') then
     begin
        if (SW = 0) and (REntorno.Pijama = 1) then
        begin
           SW := 1;
           view.Visible := True;
        end
        else
        begin
           SW := 0;
           view.Visible := False;
        end;
     end;

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraNSec]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraNSec;
     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';

     if (Pos('[MascaraP]', Memo[0]) > 0) then
        if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
           (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
           Memo[0] := ''
        else
           View.FormatStr := MascaraP;

     if (Pos('[MascaraL]', Memo[0]) > 0) then
        if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
           (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
           Memo[0] := ''
        else
           View.FormatStr := LocalMascaraL;

     if (Memo[0] = '[ImgArticulo]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, View);
  end;
end;

procedure TDMLstInfFacProveedor.frFacturaGetValue(const ParName: string; var ParValue: variant);
var
  i : integer;
  s : string;
  Cambio : extended;

  function DameVencimientos(id_e, Linea: integer): string;
  begin
     Result := '';
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT LINEA1, LINEA2 FROM DAME_VENCIMIENTOS_P(:TIPO, :ID_E)';
           Params.ByName['TIPO'].AsString := 'FAP';
           Params.ByName['ID_E'].AsInteger := id_e;
           ExecQuery;
           case Linea of
              1: Result := FieldByName['LINEA1'].AsString;
              2: Result := FieldByName['LINEA2'].AsString;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  DMListados.GetValue(ParName, ParValue);
  Cambio := 0;

  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     Cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if ParName = 'Factura' then
  begin
     // Actualizar las máscaras para la factura actual
     LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

     // Se comprueba la segunda moneda emplear
     if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
        Moneda_Sec := REntorno.Moneda_Sec
     else
        Moneda_Sec := REntorno.Moneda;

     LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);

     if (QMCabecera.FieldByName('RIG').AsInteger <> FacturaAnt) or
        ((QMCabecera.FieldByName('RIG').AsInteger = FacturaAnt) and (QMDetalle.FieldByName('LINEA').AsInteger = LineaAnt)) then
     begin
        subtotal := 0;
        FacturaAnt := QMCabecera.FieldByName('RIG').AsInteger;
        LineaAnt := QMDetalle.FieldByName('LINEA').AsInteger;
     end;

     // Refrescar la Doble Cabecera
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_E'].AsInteger := QMCabecera.FieldByName('ID_E').AsInteger;
        Open;
     end;
  end;

  if ParName = 'FacTitulo' then
  begin
     if (QMCabecera.FieldByName('DEVOLUCION').AsInteger = 1) then
        ParValue := _('Factura Devolución')
     else if (QMCabecera.FieldByName('SIN_DETALLE').AsInteger = 1) then
        ParValue := _('Factura Abono')
     else
        ParValue := _('Factura');
  end;

  {  if parname='Fecha' then
    subtotal:=0;}

  if ParName = 'Nombre_tipo_iva' then
     ParValue := DMMain.DameNombreIva(REntorno.Pais, xDatosIva.FieldByName('TIPO_IVA').AsInteger, QMCabecera.FieldByName('IDIOMA').AsString);

  if ParName = 'Base' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM DAME_BASES_POR_IVA_E(:ID_E) WHERE TIPO_IVA = :TIPO_IVA';
           Params.ByName['ID_E'].AsInteger := QMCabecera.FieldByName('ID_E').AsInteger;
           Params.ByName['TIPO_IVA'].AsInteger := xDatosIva.FieldByName('TIPO_IVA').AsInteger;
           ExecQuery;
           ParValue := FieldByName['BASE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Total_FacturaE' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, 'EUR', QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_FACTURA').AsFloat, Cambio);

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Titulo_Moneda' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
        Open;
        ParValue := xMonedas.FieldByName('TITULO').AsString;
     end;

  if ParName = 'Imp_dto_Cial' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM DAME_BASES_POR_IVA_E(:ID_E) WHERE TIPO_IVA = :TIPO_IVA';
           Params.ByName['ID_E'].AsInteger := QMCabecera.FieldByName('ID_E').AsInteger;
           Params.ByName['TIPO_IVA'].AsInteger := xDatosIva.FieldByName('TIPO_IVA').AsInteger;
           ExecQuery;
           ParValue := (QMCabecera.FieldByName('DTO_CIAL').Value * FieldByName['BASE'].AsFloat / 100);
           ;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Total' then
  begin
     subtotal := subtotal + QMDetalle.FieldByName('B_DTO_LINEA').AsFloat;
     ParValue := QMDetalle.FieldByName('B_DTO_LINEA').AsFloat;
  end;

  if ParName = 'Subtotal' then
     ParValue := subtotal;

  if ParName = 'Articulo' then
     if (QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) then
        ParValue := ' '
     else
        ParValue := QMDetalle.FieldByName('ARTICULO').AsString;

  if ParName = 'Unidades' then
  begin
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
     begin
        if ((xArticulos.FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger <> 0) and
           (QMDetalle.FieldByName('APLICA_UNIDADES_SECUNDARIAS').AsInteger <> 0)) then
           ParValue := TrimRight(FormatFloat(MascaraI, QMDetalle.FieldByName('UNIDADES_SEC').AsFloat) +
              ' ' + DMMain.DameSignoUnidadArticulo(QMDetalle.FieldByName('ARTICULO').AsString))
        else
           ParValue := TrimRight(FormatFloat(MascaraI,
              QMDetalle.FieldByName('UNIDADES').AsFloat) + ' ' + DMMain.DameSignoUnidadArticulo(QMDetalle.FieldByName('ARTICULO').AsString));
     end;
  end;

  if ParName = 'UnidadesSF' then
     //Sin Formato, para poder utilizarlo en cálculos internos del listado
  begin
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
        ParValue := QMDetalle.FieldByName('UNIDADES').AsFloat;
  end;

  if ParName = 'Procedencia' then
     if QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC' then
        ParValue := Format(_('Pedido %d Linea %d Fecha Ped. %s'), [QSPProcedencia.FieldByName('RIG_O').AsInteger, QSPProcedencia.FieldByName('LINEA_O').AsInteger, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
     else
        ParValue := Format(_('Albarán %d Linea %d Fecha Alb. %s'), [QSPProcedencia.FieldByName('RIG_O').AsInteger, QSPProcedencia.FieldByName('LINEA_O').AsInteger, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)]);

  // Vencimientos
  if ParName = 'Venc_Linea1' then
     ParValue := DameVencimientos(QMCabecera.FieldByName('ID_E').AsInteger, 1);

  if ParName = 'Venc_Linea2' then
     ParValue := DameVencimientos(QMCabecera.FieldByName('ID_E').AsInteger, 2);

  if ParName = 'Moneda_Sec' then
     ParValue := Moneda_Sec;

  if ParName = 'TotalMonSec' then
     ParValue := DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_FACTURA').AsFloat, Cambio);

  if ParName = 'PrecioUdPtoVerde' then
  begin
     ParValue := xArticulos.FieldByName('PTO_VERDE').AsFloat;
     ParValue := DMMain.DameCambio(False, REntorno.Moneda, QMCabecera.FieldByName('MONEDA').AsString, QMCabecera.FieldByName('FECHA').AsDateTime, ParValue, QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat);
  end;

  if ParName = 'PieVisible' then
     if ((not QMCabecera.EOF) and (DobleCabecera.Active) and (QMCabecera.FieldByName('ID_E').AsInteger = DobleCabecera.FieldByName('ID_E').AsInteger)) then
        ParValue := 0
     else
        ParValue := 1;

  if ParName = 'NroSerie' then
     ParValue := nro_serie;

  if ParName = 'Barras' then
     ParValue := DameCodigoBarras(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'NombreUsuarioKri' then
     ParValue := DameNombreCorreoUsuario(DameUsuarioSegunEntrada(QMCabecera.FieldByName('ENTRADA').AsInteger));

  if ParName = 'CodigoProveedor' then
     ParValue := DameCodigoProveedor(QMCabecera.FieldByName('PROVEEDOR').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'TituloArticuloProveedor' then
     ParValue := DameTituloArticuloProveedor(QMCabecera.FieldByName('PROVEEDOR').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString);

  // Portes en documentos
  if ParName = 'PorteVisible' then
     ParValue := not (QMCabecera.FieldByName('TIPO_PORTES').AsInteger = 0);

  if ParName = 'DoblePorteVisible' then
     ParValue := not (DobleCabecera.FieldByName('TIPO_PORTES').AsInteger = 0);

  if ParName = 'DescPortes' then
     ParValue := DameTituloPorte(QMCabecera.FieldByName('TIPO_PORTES').AsInteger);

  if ParName = 'DobleDescPortes' then
     ParValue := DameTituloPorte(DobleCabecera.FieldByName('TIPO_PORTES').AsInteger);

  // Variables PIVA[1..9] - Porcentaje de IVA
  if Copy(UpperCase(ParName), 1, 4) = 'PIVA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 5, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('P_IVA').AsFloat;
     end;
  end;

  // Variables PIVAR[1..9] o PRE[1..9] - Porcentaje de Recargo por equivalencia
  if (Copy(UpperCase(ParName), 1, 5) = 'PIVAR') or (Copy(UpperCase(ParName), 1, 3) = 'PRE') then
  begin
     i := 0;
     if (Copy(UpperCase(ParName), 1, 5) = 'PIVAR') then
        i := StrToIntDef(Copy(UpperCase(ParName), 6, 1), 0);
     if (Copy(UpperCase(ParName), 1, 3) = 'PRE') then
        i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);

     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_RE').IsNull then
           ParValue := xDobleIva.FieldByName('P_RE').AsFloat;
     end;
  end;

  // Variables BI[1..9] - Base Imponible
  if Copy(UpperCase(ParName), 1, 2) = 'BI' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 3, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('S_BASES_DTO').IsNull then
           ParValue := xDobleIva.FieldByName('S_BASES_DTO').AsFloat;
     end;
  end;

  // Variables IIVA[1..9] - Importe de IVA
  if Copy(UpperCase(ParName), 1, 4) = 'IIVA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 5, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('I_IVA').AsFloat;
     end;
  end;

  // Variables IIVAR[1..9] - Importe de Recargo por equivalencia
  if (Copy(UpperCase(ParName), 1, 5) = 'IIVAR') or (Copy(UpperCase(ParName), 1, 3) = 'IRE') then
  begin
     i := 0;
     if (Copy(UpperCase(ParName), 1, 5) = 'IIVAR') then
        i := StrToIntDef(Copy(UpperCase(ParName), 6, 1), 0);
     if (Copy(UpperCase(ParName), 1, 3) = 'IRE') then
        i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);

     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_RE').IsNull then
           ParValue := xDobleIva.FieldByName('I_RE').AsFloat;
     end;
  end;

  // Variables PIA[1..9] - Porcentaje Impuesto Adicional
  if Copy(UpperCase(ParName), 1, 3) = 'PIA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_IMPUESTO_ADICIONAL').IsNull then
           ParValue := xDobleIva.FieldByName('P_IMPUESTO_ADICIONAL').AsFloat;
     end;
  end;

  // Variables IIA[1..9] - Importe Impuesto Adicional
  if Copy(UpperCase(ParName), 1, 3) = 'IIA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_IMPUESTO_ADICIONAL').IsNull then
           ParValue := xDobleIva.FieldByName('I_IMPUESTO_ADICIONAL').AsFloat;
     end;
  end;

  // Variables IVA_RE[1..9] - Importe IVA + Recargo por equivalencia
  if Copy(UpperCase(ParName), 1, 6) = 'IVA_RE' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 7, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_RE').IsNull and not xDobleIva.FieldByName('I_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('I_RE').AsFloat + xDobleIva.FieldByName('I_IVA').AsFloat;
     end;
  end;

  if UpperCase(ParName) = 'FORMA_PAGO_IDIOMA' then
     ParValue := DameTituloFormaPago(QMCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProv.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloFormaPago(DobleCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProv.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'FORMA_PAGO_IDIOMA_LARGO' then
     ParValue := DameTituloLargoFormaPago(QMCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProv.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA_LARGO' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloLargoFormaPago(DobleCabecera.FieldByName('FORMA_DE_PAGO').AsString, xProv.FieldByName('IDIOMA').AsString);

  if ParName = 'NroSerieLista' then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT S.ARTICULO, A.TITULO_LARGO AS TITULO, LIST(S.NSERIE, '', '') ');
              SelectSQL.Add(' FROM VER_DETALLE_SERIALIZACION S ');
              SelectSQL.Add(' JOIN ART_ARTICULOS A ON S.EMPRESA = A.EMPRESA AND S.ARTICULO = A.ARTICULO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' S.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' S.EJERCICIO = :EJERCICIO AND ');
              SelectSQL.Add(' S.CANAL = :CANAL AND ');
              SelectSQL.Add(' S.SERIE = :SERIE AND ');
              SelectSQL.Add(' S.TIPO = :TIPO AND ');
              SelectSQL.Add(' S.RIG = :RIG AND ');
              SelectSQL.Add(' S.LINEA = :LINEA ');
              SelectSQL.Add(' GROUP BY S.ARTICULO, A.TITULO_LARGO ');
              Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
              Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
              Params.ByName['TIPO'].AsString := QMDetalle.FieldByName('TIPO').AsString;
              Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
              Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
              Open;

              // Salto de linea antes de cada registro, excepto el primero.
              s := '';
              ParValue := '';
              while not EOF do
              begin
                 ParValue := ParValue + s + FieldByName('ARTICULO').AsString + ' - ' + FieldByName('TITULO').AsString;
                 s := #13#10;
                 ParValue := ParValue + s + FieldByName('LIST').AsString;
                 Next;
              end;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'LotesLista' then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT LIST(LOTE, '', '') ');
              SelectSQL.Add(' FROM GES_DETALLES_E_LOTES ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' ID_DETALLES_E = :ID_DETALLES_E ');
              Params.ByName['ID_DETALLES_E'].AsInteger := QMDetalle.FieldByName('ID_DETALLES_E').AsInteger;
              Open;

              ParValue := FieldByName('LIST').AsString;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'RECTIFICACION' then
  begin
     ParValue := '';
     if (QMCabecera.FieldByName('RECT').AsInteger = 1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_E WHERE ID_E = :ID_RECT';
              Params.ByName['ID_RECT'].AsInteger := QMCabecera.FieldByName('ID_RECT').AsInteger;
              ExecQuery;
              ParValue := Format(_('Rectificación de la Factura: %s-%s/%s'), [IntToStr(FieldByName['EJERCICIO'].AsInteger), IntToStr(FieldByName['RIG'].AsInteger), FieldByName['SERIE'].AsString]);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  if ParName = 'DOB_RECTIFICACION' then
  begin
     ParValue := '';
     if (DobleCabecera.FieldByName('RECT').AsInteger = 1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_E WHERE ID_E = :ID_RECT';
              Params.ByName['ID_RECT'].AsInteger := DobleCabecera.FieldByName('ID_RECT').AsInteger;
              ExecQuery;
              ParValue := Format(_('Rectificación de la Factura: %s-%s/%s'), [IntToStr(FieldByName['EJERCICIO'].AsInteger), IntToStr(FieldByName['RIG'].AsInteger), FieldByName['SERIE'].AsString]);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  if ParName = 'Stock' then
     ParValue := DMMain.DameStockArticulo(QMDetalle.FieldByName('EMPRESA').AsInteger, QMDetalle.FieldByName('CANAL').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString, QMDetalle.FieldByName('ALMACEN').AsString);

  if ParName = 'TituloFamilia' then
     ParValue := DameTituloFamilia(xArticulos.FieldByName('FAMILIA').AsString);
end;

procedure TDMLstInfFacProveedor.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
var
  Cambio : extended;
begin
  // CABECERA
  Cambio := 0;
  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     Cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if Source = '[EMPRESA]' then
  begin
     Source := REntorno.NombreEmpresa;
  end;
  if Source = '[NIF_EMPRESA]' then
  begin
     Source := REntorno.CifEmpresa;
  end;
  if Source = '[DIR_EMPRESA]' then
  begin
     Source := REntorno.DirEmpresa + #13#10 + REntorno.PobEmpresa + ' (' +
        REntorno.ProvEmpresa + ' - ' + REntorno.Pais + ')';
  end;
  if Source = '[DIR_PROV]' then
  begin
     xDirProv.Close;
     xDirProv.Open;
     Source := xDirProv.FieldByName('DIRECCION').AsString + #13#10 +
        xDirProv.FieldByName('CODPOB').AsString + ' (' +
        xDirProv.FieldByName('PROVINCIA').AsString + ' - ' +
        xDirProv.FieldByName('PAIS').AsString + ')';
  end;

  if Source = '[FECHA_CABECERA]' then
  begin
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA').AsDateTime);
  end;

  if Source = '[TIPO_FACTURA]' then
  begin
     if (QMCabecera.FieldByName('DEVOLUCION').AsInteger = 1) then
        Source := 'DEVOLUCION'
     else if (QMCabecera.FieldByName('SIN_DETALLE').AsInteger = 1) then
        Source := 'ABONO'
     else
        Source := '';
  end;

  // DETALLE

  if Source = '[ARTICULO]' then
     if QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre then
        Source := ' '
     else
        Source := QMDetalle.FieldByName('ARTICULO').AsString;

  if Source = '[UNIDADES]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := IntToStr(QMDetalle.FieldByName('UNIDADES').AsInteger);

  if Source = '[DTO]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO').AsFloat);

  if Source = '[PRECIO_DETALLE]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMDetalle.FieldByName('P_COSTE').AsFloat);

  if Source = '[TOTAL_LINEA]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMDetalle.FieldByName('B_DTO_LINEA').AsFloat);

  // IMPUESTOS

  if Source = '[POR_IVA]' then
  begin
     Source := FormatFloat(MascaraP, xDatosIva.FieldByName('P_IVA').AsFloat);
  end;
  if Source = '[IMP_IVA]' then
  begin
     Source := FormatFloat(LocalMascaraN, xDatosIva.FieldByName('I_IVA').AsFloat);
  end;
  if Source = '[POR_RE]' then
  begin
     Source := FormatFloat(MascaraP, xDatosIva.FieldByName('P_RE').AsFloat);
  end;
  if Source = '[IMP_RE]' then
  begin
     Source := FormatFloat(LocalMascaraN, xDatosIva.FieldByName('I_RE').AsFloat);
  end;
  if Source = '[TOTAL_IMPUESTOS]' then
  begin
     Source := FormatFloat(LocalMascaraN, xDatosIva.FieldByName('I_IVA').AsFloat + xDatosIva.FieldByName('I_RE').AsFloat);
  end;

  // PIE

  if Source = '[DTO_PP]' then
  begin
     Source := FormatFloat(MascaraP, QMCabecera.FieldByName('DTO_PP').AsFloat);
  end;
  if Source = '[IMP_DTO_PP]' then
  begin
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('I_DTO_PP').AsFloat);
  end;
  if Source = '[DTO_CIAL]' then
  begin
     Source := FormatFloat(MascaraP, QMCabecera.FieldByName('DTO_CIAL').AsFloat);
  end;
  if Source = '[IMP_DTO_CIAL]' then
  begin
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('I_DTO_CIAL').AsFloat);
  end;
  if Source = '[BASE_IMPONIBLE]' then
  begin
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('B_DTO_LINEAS').AsFloat);
  end;
  if Source = '[TOTAL_FACTURA]' then
  begin
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('TOTAL_FACTURA').AsFloat);
  end;

  if Source = '[TOTAL_FACTURAE]' then
  begin
     if (QMCabecera.FieldByName('MONEDA').AsString = 'EUR') then
        Source := ' '
     else
        Source := FormatFloat(MascaraE, DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, 'EUR', QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_FACTURA').AsFloat, Cambio));
  end;

  if Source = '[MONEDA]' then
  begin
     // Actualizar las máscaras para la factura actual
     LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
        Open;
        Source := 'Moneda: ' + xMonedas.FieldByName('TITULO').AsString;
     end;

     // Se comprueba la segunda moneda emplear
     if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
        Moneda_Sec := REntorno.Moneda_Sec
     else
        Moneda_Sec := REntorno.Moneda;

     LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);
  end;

  if Source = 'Total En Euros:' then
     if (QMCabecera.FieldByName('MONEDA').AsString = 'EUR') then
        Source := ' ';

  if Source = '[I_TOTALMONSEC]' then
  begin
     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := FormatFloat(MascaraE, DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_FACTURA').AsFloat, Cambio))
     else
        Source := ' ';
  end;

  if Source = '[TOTAL_MONEDA_SEC]' then
  begin
     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := _('Total') + ' ' + Moneda_Sec + ':'
     else
        Source := ' ';
  end;

  //Portes
  if Source = '[PORTES]' then
  begin
     if (QMCabecera.FieldByName('TIPO_PORTES').AsInteger = 0) then
        Source := ' '
     else
        Source := _('Portes') + ': ' + DameTituloPorte(QMCabecera.FieldByName('TIPO_PORTES').AsInteger);
  end;

  if Source = '[DOBLE_PORTES]' then
  begin
     if (DobleCabecera.FieldByName('TIPO_PORTES').AsInteger = 0) then
        Source := ' '
     else
        Source := _('Portes') + ': ' + DameTituloPorte(DobleCabecera.FieldByName('TIPO_PORTES').AsInteger);
  end;

  if Source = '[I_PORTES]' then
     Source := FormatFloat(MascaraN, QMCabecera.FieldByName('I_PORTES').AsFloat);

  if Source = '[I_PORTES_CANAL]' then
     Source := FormatFloat(MascaraN, QMCabecera.FieldByName('I_PORTES_CANAL').AsFloat);

  if Source = '[I_DOBLEPORTES]' then
     Source := FormatFloat(MascaraN, DobleCabecera.FieldByName('I_PORTES').AsFloat);

  if Source = '[I_DOBLEPORTES_CANAL]' then
     Source := FormatFloat(MascaraN, DobleCabecera.FieldByName('I_PORTES_CANAL').AsFloat);

  if Source = ' ' then
     Source := '';
end;

function TDMLstInfFacProveedor.Total_Euros: double;
begin
  with SPDame_Factor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
     Params.ByName['FECHA'].AsDateTime := QMCabecera.FieldByName('FECHA').AsDateTime;
     ExecQuery;
     Result := QMCabecera.FieldByName('TOTAL_FACTURA').AsFloat / FieldByName['FACTOR'].AsFloat;
     FreeHandle;
  end;
end;

procedure TDMLstInfFacProveedor.frUDNotasArtFirst(Sender: TObject);
begin
  j := 0;
end;

procedure TDMLstInfFacProveedor.frUDNotasArtNext(Sender: TObject);
begin
  j := j + 1;
end;

procedure TDMLstInfFacProveedor.frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric.Count = j);
end;

procedure TDMLstInfFacProveedor.xDatosBancariosAfterScroll(DataSet: TDataSet);
begin
  xEntidad.Close;
  xEntidad.Open;
end;

procedure TDMLstInfFacProveedor.frUserNotasCabCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (NotasCab.Count = indNotas);
end;

procedure TDMLstInfFacProveedor.frUserNotasCabFirst(Sender: TObject);
begin
  indNotas := 0;
end;

procedure TDMLstInfFacProveedor.frUserNotasCabNext(Sender: TObject);
begin
  indNotas := indNotas + 1;
end;

procedure TDMLstInfFacProveedor.MostrarListadoDiario(serie: string);
var
  str : string;
begin
  tipolistado := 1;
  seriegen := serie;
  id_s_aux := 0;

  SW := 1;
  with QMCabecera do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_CABECERAS_FACTURA_PROV' +
        ' where empresa=?empresa and canal=?canal' +
        ' and serie=?serie and Fecha>=?FECHA1 and Fecha<=?FECHA2' +
        ' order by rig';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['FECHA1'].AsDateTime := REntorno.FechaTrabSH;
     Params.ByName['FECHA2'].AsDateTime := REntorno.FechaTrabSH + 1;
     Open;
  end;

  DMListados.Cargar(73, serie);
  if (REntorno.TipoListado = 'FRF') then
  begin
     frFactura.LoadFromFIB(REntorno.Formato, str);
     frFactura.PrepareReport;
     frFactura.ShowPreparedReport;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     HYReport.Preview;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxFactura.LoadFromFIB(REntorno.Formato, str);
     frxFactura.PrepareReport;
     frxFactura.ShowPreparedReport;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstInfFacProveedor.MostrarInformesFiltrados(Modo: byte; Filtro: integer; serie: string);
var
  str : string;
  i : integer;
begin
  filtrogen := filtro;
  seriegen := serie;
  id_s_aux := 0;
  SW := 1;

  with QMCabecera do
  begin
     Close;
     Open;
     if (Filtro = 0) then
     begin
        DMMain.FiltraRO(QMCabecera, '11110', False);
        Params.ByName['SERIE'].AsString := serie;
        Open;
     end;
  end;

  DMListados.Cargar(73, serie);
  if (REntorno.TipoListado = 'FRF') then
  begin
     frfactura.LoadFromFIB(REntorno.Formato, str);
     frFactura.PrepareReport;
     case Modo of
        0: frFactura.ShowPreparedReport;
        1: frFactura.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     case Modo of
        0: HYReport.Preview;
        1: for i := 1 to REntorno.Copias do
              HYReport.Print(REntorno.NombreMatricial);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxfactura.LoadFromFIB(REntorno.Formato, str);
     frxFactura.PrepareReport;
     case Modo of
        0: frxFactura.ShowPreparedReport;
        1: frxFactura.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstInfFacProveedor.UpdateaDocumentos;
var
  ID_S : integer;
begin
  case tipolistado of
     0:
     begin
        with xUpdateaDocumentos do
        begin
           Close;
           SelectSQL.Text := QMCabecera.SelectSQL.Text;
           Plan.Text := QMCabecera.Plan.Text;
           if (id_s_aux = 0) then
              Params.ByName['SERIE'].AsString := seriegen
           else
              Params.ByName['ID_E'].AsInteger := id_s_aux;
           Open;
           if (id_s_aux = 0) then
              if (FiltroGen = 0) then
              begin
                 DMMain.FiltraRO(xUpdateaDocumentos, '11110', False);
                 Params.ByName['SERIE'].AsString := serieGen;
                 Open;
              end;
           First;
           ID_S := FieldByName('ID_E').AsInteger;
           while not EOF do
           begin
              ModificaDoc(QGen, ID_S, 5, 1);
              Next;
              ID_S := FieldByName('ID_E').AsInteger;
           end;
        end;
     end;
     1:
     begin
        with xUpdateaDocumentos do
        begin
           Close;
           SelectSQL.Text := QMCabecera.SelectSQL.Text;
           Plan.Text := QMCabecera.Plan.Text;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := serieGen;
           Params.ByName['FECHA1'].AsDateTime := REntorno.FechaTrabSH;
           Params.ByName['FECHA2'].AsDateTime := REntorno.FechaTrabSH + 1;
           Open;
           First;
           ID_S := FieldByName('ID_E').AsInteger;
           while not EOF do
           begin
              ModificaDoc(QGen, ID_S, 5, 1);
              Next;
              ID_S := FieldByName('ID_E').AsInteger;
           end;
        end;
     end;
  end;
end;

procedure TDMLstInfFacProveedor.frFacturaPrintReport;
begin
  UpdateaDocumentos;
end;

procedure TDMLstInfFacProveedor.DobleCabeceraAfterScroll(DataSet: TDataSet);
begin
  xDobFormaPago.Close;
  xDobFormaPago.Open;
  xDobleIva.Close;
  xDobleIva.Open;
end;

procedure TDMLstInfFacProveedor.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  QSPProcedencia.Open;
  xLotes.Open;
  xNroSerie.Open;
  xArticulos.Open;
  with xArticulosIdioma do
  begin
     Close;
     Params.ByName['IDIOMA'].AsString := xProv.FieldByName('IDIOMA').AsString;
     Open;
  end;
  xProyectosDetalle.Open;
  QMDetalleUE.Open;
end;

procedure TDMLstInfFacProveedor.HYReportPrintReport(Sender: THYReport);
begin
  UpdateaDocumentos;
end;

procedure TDMLstInfFacProveedor.MostrarListadoMail(id_e: integer; serie: string; Modo: integer; const Ejercicio: integer);
var
  str : string;
begin
  id_s_aux := id_e;
  seriegen := serie;
  tipolistado := 0;
  SW := 1;
  with QMCabecera do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_CABECERAS_FACTURA_PROV WHERE ID_E = ?ID_E';
     Params.ByName['ID_E'].AsInteger := id_e;
     Open;
  end;

  nombreFich := format('%s_%d-%s-%.5d.pdf', [_('Factura'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]);

  DMListados.CargarMail(73, serie);

  if (REntorno.TipoListado = 'FRF') then
  begin
     frFactura.LoadFromFIB(REntorno.Formato, str);
     frFactura.PrepareReport;
     case modo of
        0: frFactura.ShowPreparedReport;
        1: frFactura.PrintPreparedReport(' ', REntorno.Copias);
        2: rutaFich := ExportarPDF(frFactura, nombreFich);
     end;
  end;

  if (REntorno.TipoListado = 'FR3') then
  begin
     frxFactura.LoadFromFIB(REntorno.Formato, str);
     frxFactura.PrepareReport;
     case Modo of
        0: frxFactura.ShowPreparedReport;
        1: frxFactura.PrintPreparedReport(' ', REntorno.Copias);
        2: rutaFich := ExportarPDF(frxFactura, nombreFich);
     end;
  end;

  if (REntorno.TipoListado = 'HYR') then
  begin
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     HYReport.Preview;
  end
  else
  if ((REntorno.TipoListado <> 'FRF') and (REntorno.TipoListado <> 'FR3') and (modo = 2)) then
  begin
     MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 + 'El listado debe ser del tipo FRF.'),
        mtWarning, [mbOK], 0);
     raise Exception.Create('');
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstInfFacProveedor.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProv.Open;
  xDirProv.Open;
  xFormaPago.Open;
  xDatosIva.Open;
  xProyectos.Open;
  QMDetalle.Open;
  xEmpresa.Open;

  if Param_MODREST017 and (not QMGrupoTalla.Active) then
     QMGrupoTalla.Open;
end;

procedure TDMLstInfFacProveedor.frxFacturaBeforePrint(Sender: TfrxReportComponent);
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
           if Pos('[MascaraNSec]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraNSec;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraE]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := '###,###,##0.00';
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
                 (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
                 Memo[0] := ''
              else
              begin
                 DisplayFormat.FormatStr := LocalMascaraL;
                 DisplayFormat.Kind := fkNumeric;
              end;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
                 (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
                 Memo[0] := ''
              else
              begin
                 DisplayFormat.FormatStr := MascaraP;
                 DisplayFormat.Kind := fkNumeric;
              end;
           end;
           if Pos('[NotasArt]', Memo[0]) > 0 then
           begin
              if (ric.Strings[j] > '') then
                 Memo[0] := ric.Strings[j]
              else
                 Memo[0] := '0';
           end;
           if Pos('[NotasCabecera]', Memo[0]) > 0 then
           begin
              Memo[0] := NotasCab.Strings[indNotas];
           end;
           if Pos('CANTIDADES', Memo[0]) > 0 then
           begin
              SW := 1;
           end;
           if Pos('[Notas]', Memo[0]) > 0 then
           begin
              if QMCabecera.FieldByName('NOTAS').Value = '' then
              begin
                 Visible := False;
                 Parent.Height := 34;
              end
              else
              begin
                 if Copy(QMCabecera.FieldByName('NOTAS').Value, 1, 4) = #$D#$A#$D#$A then
                 begin
                    Visible := False;
                    Parent.Height := 0;
                 end;
              end;
           end;
           if Pos('[L]', Memo[0]) > 0 then
           begin
              if (SW = 0) and (REntorno.Pijama = 1) then
              begin
                 SW := 1;
                 Visible := True;
              end
              else
              begin
                 SW := 0;
                 Visible := False;
              end;
           end;
        end;

  if (Sender is TfrxPictureView) then
  begin
     if (TfrxPictureView(Sender).TagStr = 'ImgArticulo') then
     begin
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := True;
     end;
  end;
end;

procedure TDMLstInfFacProveedor.frxFacturaGetValue(const VarName: string; var Value: variant);
begin
  frFacturaGetValue(VarName, Value);
end;

procedure TDMLstInfFacProveedor.frxFacturaPrintReport(Sender: TObject);
begin
  UpdateaDocumentos;
end;

procedure TDMLstInfFacProveedor.frFacturaUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
var
  Idioma : string;
  Grupo : integer;
  Parser : TfrParser;
  Bandera : string;
begin
  if (Name = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Parser.Calc(p1);
     Idioma := xProv.FieldByName('IDIOMA').AsString;
     // Bandera = D el memo está en el pie de pagina y ha de cojer los valores de la doble cabecera
     Bandera := Parser.Calc(p2);
     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Val := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

procedure TDMLstInfFacProveedor.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xProv.Close;
  xDirProv.Close;
  xFormaPago.Close;
  xDatosIva.Close;
  QMGrupoTalla.Close;
  xEmpresa.Close;
end;

procedure TDMLstInfFacProveedor.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xLotes.Close;
  xNroSerie.Close;
  xArticulos.Close;
  xArticulosIdioma.Close;
  xProyectosDetalle.Close;
  QMDetalleUE.Close;
end;

function TDMLstInfFacProveedor.frxFacturaUserFunction(const MethodName: string; var Params: variant): variant;
var
  Idioma : string;
  Grupo : integer;
  // Parser : TfrxParser;
  Bandera : string;
begin
  if (MethodName = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Params[0];

     Bandera := '';
     Bandera := Params[1];
     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Result := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

procedure TDMLstInfFacProveedor.QMGrupoTallaAfterOpen(DataSet: TDataSet);
begin
  QMTituloTalla.Open;
  QMDetalleTallas.Open;
end;

procedure TDMLstInfFacProveedor.QMGrupoTallaBeforeClose(DataSet: TDataSet);
begin
  QMTituloTalla.Close;
  QMDetalleTallas.Close;
end;

procedure TDMLstInfFacProveedor.QMDetalleTallasAfterOpen(DataSet: TDataSet);
begin
  QMArticuloTallas.Open;
end;

procedure TDMLstInfFacProveedor.QMDetalleTallasBeforeClose(DataSet: TDataSet);
begin
  QMArticuloTallas.Close;
end;

end.
