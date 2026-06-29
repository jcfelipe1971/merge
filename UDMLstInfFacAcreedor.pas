unit UDMLstInfFacAcreedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBQuery, FR_DSet, FR_Class,
  Fr_HYReport, FIBDataSet, FR_DBSet, FIBTableDataSet, HYFIBQuery,
  FIBDataSetRO, UHYReport, frxClass, frxHYReport, FR_Pars;

type
  TDMLstInfFacAcreedor = class(TDataModule)
     TLocal: THYTransaction;
     DSCabecera: TDataSource;
     frDBCabecera: TfrDBDataSet;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     frDBDetalle: TfrDBDataSet;
     xAcr: TFIBDataSetRO;
     DSxAcr: TDataSource;
     frDBxAcr: TfrDBDataSet;
     xDirAcr: TFIBDataSetRO;
     DSxDirAcr: TDataSource;
     frDBxDirAcr: TfrDBDataSet;
     xFormaPago: TFIBDataSetRO;
     DSxFormaPago: TDataSource;
     frDBxFormaPago: TfrDBDataSet;
     xDatosIva: TFIBDataSetRO;
     DSxDatosIva: TDataSource;
     frDBxDatosIva: TfrDBDataSet;
     xNombreIva: TFIBDataSetRO;
     DSxNombreIva: TDataSource;
     frDBxNombreIva: TfrDBDataSet;
     frFactura: TfrHYReport;
     frUDPie: TfrUserDataset;
     frDBQSPProcedencia: TfrDBDataSet;
     DSQSPProcedencia: TDataSource;
     QSPProcedencia: TFIBDataSetRO;
     frUDNotasArt: TfrUserDataset;
     QMCabecera: TFIBDataSetRO;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSDetalle: THYReportSource;
     HYRSxAcreedor: THYReportSource;
     HYRSxDireccionAcreedor: THYReportSource;
     HYRxFormaPago: THYReportSource;
     HYRxDatosIva: THYReportSource;
     HYRxNombreIva: THYReportSource;
     HYRxProcedencia: THYReportSource;
     QGen: THYFIBQuery;
     xUpdateaDocumentos: TFIBDataSetRO;
     DSDobleCabecera: TDataSource;
     DobleCabecera: TFIBDataSetRO;
     xDobFormaPago: TFIBDataSetRO;
     DSxDobFormaPago: TDataSource;
     xDobleIva: TFIBDataSetRO;
     DSxDobleIva: TDataSource;
     HYRSDobleCabecera: THYReportSource;
     HYRSxDobFormaPago: THYReportSource;
     HYRSxDobDatosIva: THYReportSource;
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
     procedure DMLstInfFacAcreedorCreate(Sender: TObject);
     procedure DMLstInfFacAcreedorDestroy(Sender: TObject);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure xAcrAfterScroll(DataSet: TDataSet);
     procedure frFacturaEnterRect(Memo: TStringList; View: TfrView);
     procedure frFacturaGetValue(const ParName: string; var ParValue: variant);
     procedure frUDNotasArtFirst(Sender: TObject);
     procedure frUDNotasArtNext(Sender: TObject);
     procedure frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure frFacturaPrintReport;
     procedure DobleCabeceraAfterScroll(DataSet: TDataSet);
     procedure HYReportPrintReport(Sender: THYReport);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure frxFacturaBeforePrint(Sender: TfrxReportComponent);
     procedure frxFacturaPrintReport(Sender: TObject);
     procedure frxFacturaGetValue(const VarName: string; var Value: variant);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure frFacturaUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
     function frxFacturaUserFunction(const MethodName: string; var Params: variant): variant;
  private
     { Private declarations }
     subtotal: double;
     ric: TStringList;
     j: integer;
     LocalMascaraN, LocalMascaraL: string;
     LocalMascaraNSec, Moneda_Sec: string;
     FacturaAnt, LineaAnt: integer;
     Pagina: integer;
  public
     { Public declarations }
     nombreFich, rutaFich: string;
     procedure MostrarInforme(serie: string; rig, id_e: integer; Modo: integer; ejercicio: integer);
     procedure MostrarInformesFiltrados(Modo: byte; Filtro: integer; serie: string);
     procedure UpdateaDocumentos;
     procedure MostrarListadoMail(id_e: integer; serie: string; Modo: integer; const Ejercicio: integer);
  end;

var
  DMLstInfFacAcreedor : TDMLstInfFacAcreedor;
  SW, filtrogen, id_s_aux : integer;
  seriegen : string;

implementation

{$R *.DFM}

uses UDMMain, UUtiles, UEntorno, UDameDato, UFormGest, UDMListados;

procedure TDMLstInfFacAcreedor.DMLstInfFacAcreedorCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  ric := TStringList.Create;
  FacturaAnt := -1000;
  LineaAnt := -1000;

  frxFactura.AddFunction('function DAME_TEXTO_IDIOMA(i: integer; Bandera: string = ''''): string', 'Merge', 'Devuelve el texto en el idioma del documento');
end;

procedure TDMLstInfFacAcreedor.DMLstInfFacAcreedorDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  ric.Free; {dji lrk kri - Memory Leak}
  Application.ProcessMessages;
end;

procedure TDMLstInfFacAcreedor.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  xAcr.Close;
  xAcr.Open;
  xFormaPago.Close;
  xFormaPago.Open;
  xDatosIva.Close;
  xDatosIva.Open;
end;

procedure TDMLstInfFacAcreedor.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
     ric.Assign(QMDetalle.FieldByName('NOTAS'));
  QSPProcedencia.Close;
  QSPProcedencia.Open;
  xArticulos.Close;
  xArticulos.Open;
end;

procedure TDMLstInfFacAcreedor.xAcrAfterScroll(DataSet: TDataSet);
begin
  with xDirAcr do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := xAcr.FieldByName('TERCERO').AsInteger;
     Params.ByName['DIRECCION'].AsInteger := 1; //QMCabeceraDIRECCION.AsInteger
     Open;
  end;
end;

procedure TDMLstInfFacAcreedor.MostrarInforme(serie: string; rig, id_e: integer; Modo: integer; ejercicio: integer);
var
  Titulo : string;
  Grupo, Listado : integer;
begin
  SerieGen := Serie;
  id_s_aux := id_e;

  SW := 1;
  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_E'].AsInteger := id_e;
     Open;
  end;

  Grupo := 74;
  Listado := 0;
  Titulo := _('FacturaAcreedor') + '_' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '-' + QMCabecera.FieldByName('RIG').AsString;
  DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frFactura, frxFactura, HYReport, nil);
end;

procedure TDMLstInfFacAcreedor.MostrarInformesFiltrados(Modo: byte; Filtro: integer; serie: string);
var
  str : string;
  i : integer;
begin
  FiltroGen := Filtro;
  id_s_aux := 0;
  serieGen := Serie;
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

  DMListados.Cargar(74, serie);
  if (REntorno.TipoListado = 'FRF') then
  begin
     frFactura.LoadFromFIB(REntorno.Formato, str);
     frFactura.PrepareReport;
     case Modo of
        0: frFactura.ShowPreparedReport;
        1: frFactura.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     Pagina := 0;
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
     frxFactura.LoadFromFIB(REntorno.Formato, str);
     frxFactura.PrepareReport;
     case Modo of
        0: frxFactura.ShowPreparedReport;
        1: frxFactura.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstInfFacAcreedor.frFacturaEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if memo[0] = '[NotasArt]' then
        memo[0] := ric.Strings[j];

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
     DMListados.BeforePrint(Memo, View);
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
  end;
end;

procedure TDMLstInfFacAcreedor.frFacturaGetValue(const ParName: string; var ParValue: variant);
var
  i : integer;
  Cambio : extended;
begin
  DMListados.GetValue(ParName, ParValue);

  Cambio := 0;
  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     Cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

  if (QMCabecera.FieldByName('ACREEDOR').AsInteger <= -1) then {Datos Acreedor -1}
  begin
     if (ParName = 'Acreedor') then
     begin
        ParValue := DameNombreTercerosVarios(QMCabecera.FieldByName('TIPO').AsString, QMCabecera.FieldByName('ID_E').AsInteger);
     end;
     if (ParName = 'Cif') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT NIF FROM GES_CABECERAS_E_FAC_NIF WHERE EMPRESA=' + QMCabecera.FieldByName('EMPRESA').AsString + ' AND ' +
                 'EJERCICIO=' + QMCabecera.FieldByName('EJERCICIO').AsString + ' AND CANAL=' + QMCabecera.FieldByName('CANAL').AsString +
                 ' AND SERIE=''' + QMCabecera.FieldByName('SERIE').AsString + ''' AND TIPO=''FCR'' AND RIG=' + QMCabecera.FieldByName('RIG').AsString;
              ExecQuery;
              ParValue := FieldByName['NIF'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if (ParName = 'Direccion') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT DIRECCION FROM GES_CABECERAS_E_FAC_NIF WHERE EMPRESA=' + QMCabecera.FieldByName('EMPRESA').AsString + ' AND ' +
                 'EJERCICIO=' + QMCabecera.FieldByName('EJERCICIO').AsString + ' AND CANAL=' + QMCabecera.FieldByName('CANAL').AsString +
                 ' AND SERIE=''' + QMCabecera.FieldByName('SERIE').AsString + ''' AND TIPO=''FCR'' AND RIG=' + QMCabecera.FieldByName('RIG').AsString;
              ExecQuery;
              ParValue := FieldByName['DIRECCION'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if (ParName = 'CodPostal') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT C_POSTAL,PROVINCIA FROM GES_CABECERAS_E_FAC_NIF WHERE EMPRESA=' + QMCabecera.FieldByName('EMPRESA').AsString + ' AND ' +
                 'EJERCICIO=' + QMCabecera.FieldByName('EJERCICIO').AsString + ' AND CANAL=' + QMCabecera.FieldByName('CANAL').AsString +
                 ' AND SERIE=''' + QMCabecera.FieldByName('SERIE').AsString + ''' AND TIPO=''FCR'' AND RIG=' + QMCabecera.FieldByName('RIG').AsString;
              ExecQuery;
              ParValue := FieldByName['C_POSTAL'].AsString + ' ' + FieldByName['PROVINCIA'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     if (ParName = 'Provincia') then
     begin
        ParValue := '';
     end;

     if (ParName = 'Pais') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT PAIS FROM GES_CABECERAS_E_FAC_NIF WHERE EMPRESA=' + QMCabecera.FieldByName('EMPRESA').AsString + ' AND ' +
                 'EJERCICIO=' + QMCabecera.FieldByName('EJERCICIO').AsString + ' AND CANAL=' + QMCabecera.FieldByName('CANAL').AsString +
                 ' AND SERIE=''' + QMCabecera.FieldByName('SERIE').AsString + ''' AND TIPO=''FCR'' AND RIG=' + QMCabecera.FieldByName('RIG').AsString;
              ExecQuery;
              ParValue := FieldByName['PAIS'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end; {Datos Acreedor -1}

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
        ParValue := FieldByName('TITULO').AsString;
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
           ParValue := ((QMCabecera.FieldByName('DTO_CIAL').AsFloat * FieldByName['BASE'].AsFloat) / 100);
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
        ParValue := TrimRight(FormatFloat(MascaraI,
           QMDetalle.FieldByName('UNIDADES').AsFloat) + ' ' + DMMain.DameSignoUnidadArticulo(QMDetalle.FieldByName('ARTICULO').AsString));
  end;

  if ParName = 'Procedencia' then
     if QSPProcedencia.FieldByName('TIPO_O').AsString = 'TAC' then
        ParValue := Format(_('Ticket: %d Linea: %d, Fecha: %s'), [QSPProcedencia.FieldByName('RIG_O').AsInteger, QSPProcedencia.FieldByName('LINEA_O').AsInteger, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
     else
        ParValue := '';

  if ParName = 'Moneda_Sec' then
     ParValue := Moneda_Sec;

  if ParName = 'TotalMonSec' then
     ParValue := DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_FACTURA').AsFloat, Cambio);

  if ParName = 'PieVisible' then
     if ((not QMCabecera.EOF) and (DobleCabecera.Active) and (QMCabecera.FieldByName('ID_E').AsInteger = DobleCabecera.FieldByName('ID_E').AsInteger)) then
        ParValue := 0
     else
        ParValue := 1;

  if ParName = 'NombreUsuarioKri' then
     ParValue := DameNombreCorreoUsuario(DameUsuarioSegunEntrada(QMCabecera.FieldByName('ENTRADA').AsInteger));

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
     ParValue := DameTituloFormaPago(QMCabecera.FieldByName('FORMA_DE_PAGO').AsString, xAcr.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloFormaPago(DobleCabecera.FieldByName('FORMA_DE_PAGO').AsString, xAcr.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'FORMA_PAGO_IDIOMA_LARGO' then
     ParValue := DameTituloLargoFormaPago(QMCabecera.FieldByName('FORMA_DE_PAGO').AsString, xAcr.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA_LARGO' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloLargoFormaPago(DobleCabecera.FieldByName('FORMA_DE_PAGO').AsString, xAcr.FieldByName('IDIOMA').AsString);

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
     if DobleCabecera.Active and (DobleCabecera.FieldByName('RECT').AsInteger = 1) then
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
end;

procedure TDMLstInfFacAcreedor.frUDNotasArtFirst(Sender: TObject);
begin
  j := 0;
end;

procedure TDMLstInfFacAcreedor.frUDNotasArtNext(Sender: TObject);
begin
  j := j + 1;
end;

procedure TDMLstInfFacAcreedor.frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric.Count = j);
end;

procedure TDMLstInfFacAcreedor.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
begin
  if Source = ' ' then
     Source := '';
end;

procedure TDMLstInfFacAcreedor.UpdateaDocumentos;
var
  ID_S : integer;
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
        ModificaDoc(QGen, ID_S, 4, 1);
        Next;
        ID_S := FieldByName('ID_E').AsInteger;
     end;
  end;
end;

procedure TDMLstInfFacAcreedor.frFacturaPrintReport;
begin
  UpdateaDocumentos;
end;

procedure TDMLstInfFacAcreedor.DobleCabeceraAfterScroll(DataSet: TDataSet);
begin
  xDobFormaPago.Close;
  xDobFormaPago.Open;
  xDobleIva.Close;
  xDobleIva.Open;
end;

procedure TDMLstInfFacAcreedor.HYReportPrintReport(Sender: THYReport);
begin
  UpdateaDocumentos;
end;

procedure TDMLstInfFacAcreedor.MostrarListadoMail(id_e: integer; serie: string; Modo: integer; const Ejercicio: integer);
var
  str : string;
  i : integer;
begin
  id_s_aux := id_e;
  seriegen := serie;
  SW := 1;

  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_E'].AsInteger := id_e;
     Open;
  end;

  nombreFich := format('%s_%d-%s-%.5d.pdf', [_('Factura'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]);

  with QSPProcedencia do
  begin
     Close;
     Open;
  end;

  DMListados.CargarMail(74, serie);

  if (REntorno.TipoListado = 'FRF') then
  begin
     frFactura.LoadFromFIB(REntorno.Formato, str);
     frFactura.PrepareReport;
     case Modo of
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
     Pagina := 0;
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     case Modo of
        0: HYReport.Preview;
        1: for i := 1 to REntorno.Copias do
              HYReport.Print(REntorno.NombreMatricial);
     end;
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

procedure TDMLstInfFacAcreedor.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  QSPProcedencia.Open;
  xArticulos.Open;
  xProyectosDetalle.Open;
end;

procedure TDMLstInfFacAcreedor.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xAcr.Open;
  xDirAcr.Open;
  xFormaPago.Open;
  xDatosIva.Open;
  xProyectos.Open;
  QMDetalle.Open;
end;

procedure TDMLstInfFacAcreedor.frxFacturaBeforePrint(Sender: TfrxReportComponent);
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
           if Pos('CANTIDADES', Memo[0]) > 0 then
           begin
              SW := 1;
           end;
           if Pos('[Notas]', Memo[0]) > 0 then
           begin
              if QMCabecera.FieldByName('NOTAS').Value = '' then
              begin
                 Visible := False;
                 Parent.Height := 0;
              end
              else
              begin
                 if Copy(QMCabecera.FieldByName('NOTAS').Value, 1, 4) = #$D#$A#$D#$A then
                    Parent.Height := 0
                 else
                 begin
                    Parent.Height := 34;
                    Visible := True;
                 end;
              end;
           end;
        end;
end;

procedure TDMLstInfFacAcreedor.frxFacturaPrintReport(Sender: TObject);
begin
  UpdateaDocumentos;
end;

procedure TDMLstInfFacAcreedor.frxFacturaGetValue(const VarName: string; var Value: variant);
begin
  frFacturaGetValue(VarName, Value);
end;

procedure TDMLstInfFacAcreedor.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xAcr.Close;
  xFormaPago.Close;
  xDatosIva.Close;
end;

procedure TDMLstInfFacAcreedor.frFacturaUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
var
  Idioma : string;
  Grupo : integer;
  Parser : TfrParser;
  Bandera : string;
begin
  if (Name = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Parser.Calc(p1);
     Idioma := xAcr.FieldByName('IDIOMA').AsString;
     // Bandera = D el memo está en el pie de pagina y ha de cojer los valores de la doble cabecera
     Bandera := Parser.Calc(p2);

     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Val := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

function TDMLstInfFacAcreedor.frxFacturaUserFunction(const MethodName: string; var Params: variant): variant;
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
