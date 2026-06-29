unit UDMLstOrdenesPedidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  UHYReport, FR_Pars, frxClass, frxDBSet, frxHYReport;

type
  TDMLstOrdenesPedidos = class(TDataModule)
     frOrdenesPedidos: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     frDBdetalle: TfrDBDataSet;
     DSCabecera: TDataSource;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     xImgEmpresa: TFIBDataSetRO;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     xDireccion_Cliente: TFIBDataSetRO;
     frUDPie: TfrUserDataset;
     frUDNotasArt: TfrUserDataset;
     TLocal: THYTransaction;
     xtercero: TFIBDataSetRO;
     DSxTercero: TDataSource;
     QMCabecera: TFIBDataSetRO;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSDetalle: THYReportSource;
     HYRSxCliente: THYReportSource;
     HYRSxDireccionCliente: THYReportSource;
     HYRxTercero: THYReportSource;
     DobleCabecera: TFIBDataSetRO;
     xDobleIva: TFIBDataSetRO;
     DSDobleCabecera: TDataSource;
     xDobFormaPago: TFIBDataSetRO;
     HYRxDobFormaPago: THYReportSource;
     HYRDobleCabecera: THYReportSource;
     HYRSDobleIva: THYReportSource;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     QGen: THYFIBQuery;
     xUpdateaDocumentos: TFIBDataSetRO;
     DSxDobleIva: TDataSource;
     DSxDobFormaPago: TDataSource;
     DSxDireccion_Cliente: TDataSource;
     DSxDireccionFiscal: TDataSource;
     xDireccionFiscal: TFIBDataSetRO;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frDBxArticulos: TfrDBDataSet;
     xMonedasIdiomas: TFIBDataSetRO;
     DSxMonedasIdiomas: TDataSource;
     HYRSxArticulos: THYReportSource;
     QMPromociones: TFIBDataSetRO;
     DSQMPromociones: TDataSource;
     xArticulosPRM: TFIBDataSetRO;
     DSxArticulosPRM: TDataSource;
     frDBxArticulosPRM: TfrDBDataSet;
     frDBPromociones: TfrDBDataSet;
     frUDNotasArtPRM: TfrUserDataset;
     HYRSPromociones: THYReportSource;
     frxUDNotasArtPRM: TfrxUserDataSet;
     frxDBCabecera: TfrxDBDataset;
     frxUDNotasArt: TfrxUserDataSet;
     frxDBDetalle: TfrxDBDataset;
     frxDBPromociones: TfrxDBDataset;
     frxOrdenesPedidos: TfrxHYReport;
     xProyectos: TFIBDataSetRO;
     xProyectosDetalle: TFIBDataSetRO;
     DSxProyectosDetalle: TDataSource;
     DSxOrdenes: TDataSource;
     xOrdenes: TFIBDataSetRO;
     DSxEscandallo: TDataSource;
     xEscandallo: TFIBDataSetRO;
     xFases: TFIBDataSetRO;
     DSxFases: TDataSource;
     xTareas: TFIBDataSetRO;
     DSxTareas: TDataSource;
     frDBTareas: TfrDBDataSet;
     DSxProyectos: TDataSource;
     procedure frOrdenesPedidosGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstPedidosDestroy(Sender: TObject);
     procedure frOrdenesPedidosEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstPedidosCreate(Sender: TObject);
     procedure frUDNotasArtFirst(Sender: TObject);
     procedure frUDNotasArtNext(Sender: TObject);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure xClienteAfterScroll(DataSet: TDataSet);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure frOrdenesPedidosPrintReport;
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure HYReportPrintReport(Sender: THYReport);
     procedure frOrdenesPedidosUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
     procedure QMPromocionesAfterOpen(DataSet: TDataSet);
     procedure QMPromocionesAfterScroll(DataSet: TDataSet);
     procedure frUDNotasArtPRMCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUDNotasArtPRMFirst(Sender: TObject);
     procedure frUDNotasArtPRMNext(Sender: TObject);
     procedure frxOrdenesPedidosGetValue(const VarName: string; var Value: variant);
     procedure frxOrdenesPedidosBeforePrint(Sender: TfrxReportComponent);
     procedure frxOrdenesPedidosPrintReport(Sender: TObject);
     procedure QMDetallePROYECTOChange(Sender: TField);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure xClienteBeforeClose(DataSet: TDataSet);
     procedure DobleCabeceraAfterOpen(DataSet: TDataSet);
     procedure DobleCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMPromocionesBeforeClose(DataSet: TDataSet);
     function frxOrdenesPedidosUserFunction(const MethodName: string; var Params: variant): variant;
  private
     { Private declarations }
     i, x: integer;
     ric, ric_prm: TStringList;
     Pagina: integer;
     IVA: smallint;
     LocalMascaraN, LocalMascaraL: string;
     LocalMascaraNSec, Moneda_Sec: string;
     Serie: string;
  public
     nombreFich, rutaFich: string;
     //  procedure MostrarListadoFiltrado(modo: Byte; Filtro: Integer; serie: String);
     //  procedure MostrarListado(modo, numero: Byte; serie: String; const Ejercicio, ID_S: Integer);
     procedure MostrarListadoEspecial(modo: byte; ID_S: integer);
     procedure UpdateaDocumentos;
     //  procedure MostrarListadoMail(id_s: Integer; serie: String; Modo: Integer; const Ejercicio: Integer);
  end;

var
  DMLstOrdenesPedidos : TDMLstOrdenesPedidos;
  SW, ID_S_AUX, FiltroGen, tipolistado : integer;
  SerieGen : string;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, PsFR_E_PDF;

{$R *.DFM}

procedure TDMLstOrdenesPedidos.DMLstPedidosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  ric := TStringList.Create;
  ric_prm := TStringList.Create;

  with xImgEmpresa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;

  frxOrdenesPedidos.AddFunction('function DAME_TEXTO_IDIOMA(i: integer; Bandera: string = ''''): string', 'Merge', 'Devuelve el texto en el idioma del documento');
end;

procedure TDMLstOrdenesPedidos.DMLstPedidosDestroy(Sender: TObject);
begin
  ric.Free;
  ric_prm.Free;
  CierraData(DMListados);
  if (TLocal.InTransaction) then
     TLocal.Commit;
  Application.ProcessMessages;
end;

procedure TDMLstOrdenesPedidos.frOrdenesPedidosGetValue(const ParName: string; var ParValue: variant);
var
  cambio : extended;
begin
  DMListados.GetValue(ParName, ParValue);

  cambio := 0;
  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if ParName = 'Pedido' then
  begin
     // Actualizar las máscaras para el pedido actual
     LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

     // Se comprueba la segunda moneda emplear
     if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
        Moneda_Sec := REntorno.Moneda_Sec
     else
        Moneda_Sec := REntorno.Moneda;

     LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);

     // Refrescar la Doble Cabecera
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        Open;
     end;
  end;

  if ParName = 'Fecha' then
     ParValue := QMCabecera.FieldByName('FECHA').AsDateTime;

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

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Titulo_Moneda' then
  begin
     if (QMCabecera.FieldByName('IDIOMA').AsString = 'CAS') then
     begin
        with xMonedas do
        begin
           Close;
           Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
           Open;
           ParValue := xMonedas.FieldByName('TITULO').AsString;
        end;
     end
     else
     begin
        with xMonedasIdiomas do
        begin
           Close;
           Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
           Open;
           ParValue := xMonedasIdiomas.FieldByName('TITULO').AsString;
        end;
     end;
  end;

  if ParName = 'Moneda_Sec' then
     ParValue := Moneda_Sec;

  if ParName = 'TotalMonSec' then
     ParValue := DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('LIQUIDO').AsFloat, Cambio);

  if ParName = 'PieVisible' then
     if ((not QMCabecera.EOF) and (DobleCabecera.Active) and (QMCabecera.FieldByName('ID_S').AsInteger = DobleCabecera.FieldByName('ID_S').AsInteger)) then
        ParValue := 0
     else
        ParValue := 1;

  //Promociones
  if ParName = 'Articulo_prm' then
     if (QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) then
        ParValue := ' '
     else
        ParValue := QMPromociones.FieldByName('ARTICULO').AsString;

  if ParName = 'Unidadesprm' then
  begin
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
     begin
        if (xArticulosPRM.FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger <> 0) then
           ParValue := TrimRight(FormatFloat(MascaraI, QMPromociones.FieldByName('UNIDADES_SEC').AsFloat) +
              ' ' + DMMain.DameSignoUnidadArticulo(QMPromociones.FieldByName('ARTICULO').AsString))
        else
           ParValue := TrimRight(FormatFloat(MascaraI,
              QMPromociones.FieldByName('UNIDADES').AsFloat) + ' ' + DMMain.DameSignoUnidadArticulo(QMPromociones.FieldByName('ARTICULO').AsString));
     end;
  end;

  if ParName = 'DetalleVisible' then
     ParValue := not (QMDetalle.EOF);
end;

procedure TDMLstOrdenesPedidos.frOrdenesPedidosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if memo[0] = '[NotasArt]' then
        memo[0] := ric.Strings[i];

     if memo[0] = 'CANTIDADES' then
        SW := 1;

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraNSec]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraNSec;
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

     // if (QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and (Memo[0] <> '[Titulo]') and (not Notas) then Memo.Text := '';
     if (Memo[0] = '[ImgArticulo]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, View);

     if (Memo[0] = '[ImgArticuloPRM]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulosPRM.FieldByName('IMAGEN').AsInteger, View);

     if memo[0] = '[NotasArtPRM]' then
     begin
        memo[0] := ric_prm.Strings[x];
     end;
  end;
end;

procedure TDMLstOrdenesPedidos.frUDNotasArtFirst(Sender: TObject);
begin
  i := 0;
end;

procedure TDMLstOrdenesPedidos.frUDNotasArtNext(Sender: TObject);
begin
  i := i + 1;
end;

procedure TDMLstOrdenesPedidos.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
     ric.Assign(QMDetalle.FieldByName('NOTAS'));
  //if QMDetalle.Eof then QMDetalle.Close;
  {xArticulos.Close;
  xArticulos.Open;}
end;

procedure TDMLstOrdenesPedidos.frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric.Count = i);
end;

procedure TDMLstOrdenesPedidos.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xProyectos.Open;
end;

procedure TDMLstOrdenesPedidos.xClienteAfterScroll(DataSet: TDataSet);
begin
  {xTercero.Close;
  xTercero.Open;}

  with xDireccionFiscal do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
     Open;
  end;
end;

procedure TDMLstOrdenesPedidos.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
begin
  if Source = '[FECHA_CABECERA]' then
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA').AsDateTime);

  if Source = '[PAGINA]' then
  begin
     Pagina := Pagina + 1;
     Source := IntToStr(Pagina);
  end;

  if Source = '[UNIDADES]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(MascaraI, QMDetalle.FieldByName('UNIDADES').AsFloat);

  if Source = '[PRECIO_DETALLE]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMDetalle.FieldByName('PRECIO').AsFloat);

  if Source = '[DTO]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO').AsFloat);

  if Source = '[FECHA_ENTREGA_PREV]' then
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA_ENTREGA_PREV').AsDateTime);

  // Activamos la doble cabecera
  if Source = '[ACTIVAR]' then
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        Open;
        Source := '';
        IVA := 1;

        // Actualizar las máscaras para el pedido actual
        LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
        LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);
     end;

  // Activamos el IVA para un pedido con 2 páginas.
  if Source = '[ACTIVA_IVA]' then
  begin
     xDobleIva.Close;
     xDobleIva.Open;
     Source := '';
     IVA := 1;
  end;

  if Source = '[NEXT_IVA]' then
  begin
     IVA := IVA + 1;
     xDobleIva.Next;
     if IVA > xDobleIva.RecordCount then
        IVA := -100;
     Source := ' ';
  end;

  if Source = '[PORTES]' then
     if (DobleCabecera.FieldByName('PORTES').AsInteger = 0) then
        Source := 'DEBIDOS'
     else
        Source := 'PAGADOS';

  if Source = '[DOBLE_I_PP]' then
  begin
     if (IVA > 0) then
        Source := FormatFloat(LocalMascaraN, xDobleIVA.FieldByName('I_DTO_PP').AsFloat)
     else
        Source := '';
  end;

  if Source = '[DOBLE_I_IVA]' then
  begin
     if (IVA > 0) then
        Source := FormatFloat(LocalMascaraN, xDobleIVA.FieldByName('I_IVA').AsFloat)
     else
        Source := '';
  end;

  if Source = '[NOTAS]' then
     Source := DobleCabecera.FieldByName('NOTAS').AsString;

  if Source = ' ' then
     Source := '';

  // Promociones
  if Source = '[UNIDADES_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(MascaraI, QMPromociones.FieldByName('UNIDADES').AsFloat);

  if Source = '[PRECIO_DETALLE_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMPromociones.FieldByName('PRECIO').AsFloat);

  if Source = '[DTO_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMPromociones.FieldByName('DESCUENTO').AsFloat);

  if Source = '[FECHA_ENTREGA_PREV_PRM]' then
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA_ENTREGA_PREV').AsDateTime);
end;

procedure TDMLstOrdenesPedidos.UpdateaDocumentos;
var
  ID_S : integer;
begin
  with xUpdateaDocumentos do
  begin
     Close;
     SelectSQL.Text := QMCabecera.SelectSQL.Text;
     Plan.Text := QMCabecera.Plan.Text;
     if (id_s_aux = 0) then
        Params.ByName['SERIE'].AsString := serie
     else
        Params.ByName['ID_S'].AsInteger := ID_S_AUX;
     Open;
     if (id_s_aux = 0) then
        if (FiltroGen = 0) then
        begin
           DMMain.FiltraRO(QMCabecera, '11110', False);
           Params.ByName['SERIE'].AsString := serie;
           Open;
        end;
     First;
     ID_S := FieldByName('ID_S').AsInteger;
     while not EOF do
     begin
        ModificaDoc(QGen, ID_S, 2, 0);
        Next;
        ID_S := FieldByName('ID_S').AsInteger;
     end;
     Close;
  end;
end;

procedure TDMLstOrdenesPedidos.frOrdenesPedidosPrintReport;
begin
  // UpdateaDocumentos;
end;

procedure TDMLstOrdenesPedidos.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  QMPromociones.Open;
  xArticulos.Open;
  xProyectosDetalle.Open;
end;

procedure TDMLstOrdenesPedidos.HYReportPrintReport(Sender: THYReport);
begin
  UpdateaDocumentos;
end;

procedure TDMLstOrdenesPedidos.frOrdenesPedidosUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
var
  Idioma : string;
  Grupo : integer;
  Parser : TfrParser;
  Bandera : string;
begin
  if (Name = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Parser.Calc(p1);
     // Bandera = D el memo está en el pie de pagina y ha de cojer los valores de la doble cabecera
     Bandera := Parser.Calc(p2);
     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Val := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

// Nuevo

procedure TDMLstOrdenesPedidos.QMPromocionesAfterOpen(DataSet: TDataSet);
begin
  xArticulosPRM.Open;
end;

procedure TDMLstOrdenesPedidos.QMPromocionesAfterScroll(DataSet: TDataSet);
begin
  if ((QMPromociones.RecordCount > 0) and (ric_prm <> nil)) then
     ric_prm.Assign(QMPromociones.FieldByName('NOTAS'));
  // if QMDetalle.Eof then QMDetalle.Close;
  {xArticulosPRM.Close;
  xArticulosPRM.Open;}
end;

procedure TDMLstOrdenesPedidos.frUDNotasArtPRMCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric_prm.Count = x);
end;

procedure TDMLstOrdenesPedidos.frUDNotasArtPRMFirst(Sender: TObject);
begin
  x := 0;
end;

procedure TDMLstOrdenesPedidos.frUDNotasArtPRMNext(Sender: TObject);
begin
  x := x + 1;
end;

procedure TDMLstOrdenesPedidos.frxOrdenesPedidosGetValue(const VarName: string; var Value: variant);
begin
  frOrdenesPedidosGetValue(VarName, Value);
end;

procedure TDMLstOrdenesPedidos.frxOrdenesPedidosBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if memo[0] = '[NotasArt]' then
              memo[0] := ric.Strings[i];

           if memo[0] = 'CANTIDADES' then
              SW := 1;

           if (Pos('[MascaraN]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if (Pos('[MascaraNSec]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := LocalMascaraNSec;
              DisplayFormat.Kind := fkNumeric;
           end;
           if (Pos('[MascaraP]', Memo[0]) > 0) then
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
                 (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
                 Memo[0] := ''
              else
              begin
                 DisplayFormat.FormatStr := MascaraP;
                 DisplayFormat.Kind := fkNumeric;
              end;

           if (Pos('[MascaraL]', Memo[0]) > 0) then
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
                 (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
                 Memo[0] := ''
              else
              begin
                 DisplayFormat.FormatStr := LocalMascaraL;
                 DisplayFormat.Kind := fkNumeric;
              end;

           // if (QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and (Memo[0] <> '[Titulo]') and (not Notas) then Memo.Text := '';
           if memo[0] = '[NotasArtPRM]' then
           begin
              memo[0] := ric_prm.Strings[x];
           end;
        end;

  if (Sender is TfrxPictureView) then
  begin
     if (TfrxPictureView(Sender).TagStr = 'ImgArticulo') then
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));

     if (TfrxPictureView(Sender).TagStr = 'ImgArticuloPRM') then
        DMListados.MostrarImagen(xArticulosPRM.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
  end;
end;

procedure TDMLstOrdenesPedidos.frxOrdenesPedidosPrintReport(Sender: TObject);
begin
  // UpdateaDocumentos;
end;

procedure TDMLstOrdenesPedidos.QMDetallePROYECTOChange(Sender: TField);
begin
  xProyectosDetalle.Close;
  xProyectosDetalle.Open;
end;

procedure TDMLstOrdenesPedidos.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xProyectos.Close;
end;

procedure TDMLstOrdenesPedidos.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  QMPromociones.Close;
  xArticulos.Close;
  xProyectosDetalle.Close;
end;

procedure TDMLstOrdenesPedidos.xClienteAfterOpen(DataSet: TDataSet);
begin
  xTercero.Open;
end;

procedure TDMLstOrdenesPedidos.xClienteBeforeClose(DataSet: TDataSet);
begin
  xTercero.Close;
end;

procedure TDMLstOrdenesPedidos.DobleCabeceraAfterOpen(DataSet: TDataSet);
begin
  xDobleIva.Open;
  xDobFormaPago.Open;
end;

procedure TDMLstOrdenesPedidos.DobleCabeceraBeforeClose(DataSet: TDataSet);
begin
  xDobleIva.Close;
  xDobFormaPago.Close;
end;

procedure TDMLstOrdenesPedidos.QMPromocionesBeforeClose(DataSet: TDataSet);
begin
  xArticulosPRM.Close;
end;

procedure TDMLstOrdenesPedidos.MostrarListadoEspecial(modo: byte; ID_S: integer);
var
  str : string;
  {i, grupo: Integer;
  Listado: SmallInt;}
begin
  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;
  Serie := QMCabecera.FieldByName('SERIE').AsString;

  with QMDetalle do
  begin
     Close;
     Open;
  end;

  with xOrdenes do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := QMDetalle.FieldByName('ID_ORDEN').AsInteger;
     Open;
  end;

  with xTareas do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := xOrdenes.FieldByName('ID_ORDEN').AsInteger;
     Open;
  end;

  DMListados.Cargar(8053, REntorno.Serie);
  if (REntorno.TipoListado = 'FRF') then
  begin
     frOrdenesPedidos.LoadFromFIB(REntorno.Formato, str);
     frOrdenesPedidos.PrepareReport;
     case modo of
        0: frOrdenesPedidos.ShowPreparedReport;
        1: frOrdenesPedidos.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

function TDMLstOrdenesPedidos.frxOrdenesPedidosUserFunction(const MethodName: string; var Params: variant): variant;
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

end.
