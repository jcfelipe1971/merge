unit UDMLSTClientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport, frxDBSet;

type
  TDMLSTClientes = class(TDataModule)
     frClientes: TfrHYReport;
     frDSQMClientes: TfrDBDataSet;
     QMClientes: TFIBDataSetRO;
     DSQMClientes: TDataSource;
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
     QSeleccion: THYFIBQuery;
     QAgrupaciones: TFIBDataSetRO;
     DSQAgrupaciones: TDataSource;
     frDSQAgrupaciones: TfrDBDataSet;
     QCliAgrup: TFIBDataSetRO;
     DSCliAgrup: TDataSource;
     frDSCliAgrup: TfrDBDataSet;
     xTerceroAgrupacion: TFIBDataSetRO;
     DSxTerceroagrupacon: TDataSource;
     frDBxTerceroAgrupacion: TfrDBDataSet;
     xAgrupacion: TFIBDataSetRO;
     DSxAgrupacion: TDataSource;
     xMinAgrup: TFIBDataSetRO;
     TLocal: THYTransaction;
     xEtiquetas: TFIBDataSetRO;
     DSxEtiquetas: TDataSource;
     frDBxEtiquetas: TfrDBDataSet;
     xLocalidad: TFIBDataSetRO;
     DSxLocalidad: TDataSource;
     frDBClientesCP: TfrDBDataSet;
     QMClientesCP: TFIBDataSetRO;
     DSQMClientesCP: TDataSource;
     QMCPDesde: TFIBDataSetRO;
     DSQMCPDesde: TDataSource;
     QMCPHasta: TFIBDataSetRO;
     DSQMCPHasta: TDataSource;
     QMinCPostal: THYFIBQuery;
     QMaxCPostal: THYFIBQuery;
     xBancoCliente: TFIBDataSetRO;
     QNombreBanco: THYFIBQuery;
     frDSxBancoCliente: TfrDBDataSet;
     DSxBancoCliente: TDataSource;
     xFacturasMensual: TFIBDataSetRO;
     DSxFacturasMensual: TDataSource;
     xFacturasMensualCompara: TFIBDataSetRO;
     DSxFacturasMensualCompara: TDataSource;
     xClienteTitulo: TFIBDataSetRO;
     DSxClienteTitulo: TDataSource;
     xFacturasAnual: TFIBDataSet;
     DSxFacturasAnual: TDataSource;
     xFacturasAnualCompara: TFIBDataSet;
     DSxFacturasAnualCompara: TDataSource;
     xFacturasAnualC_1: TFIBDataSet;
     DSxFacturasAnualC_1: TDataSource;
     xFacturasAnualC_2: TFIBDataSet;
     DSxFacturasAnualC_2: TDataSource;
     xFacturasAnualC_3: TFIBDataSet;
     DSxFacturasAnualC_3: TDataSource;
     xPrevisionMensual: TFIBDataSet;
     DSxPrevisionMensual: TDataSource;
     DSxPrevisionAnual: TDataSource;
     xPrevisionAnual: TFIBDataSet;
     frxClientes: TfrxHYReport;
     frxDBClientesCP: TfrxDBDataset;
     frLstConsumo: TfrHYReport;
     frDBDetConsumo: TfrDBDataSet;
     xLstDetConsumo: TFIBDataSetRO;
     DSxLstDetConsumo: TDataSource;
     xLstTerceros: TFIBDataSetRO;
     DSxLstTerceros: TDataSource;
     xLstFirmas: TFIBDataSetRO;
     DSxLstFirmas: TDataSource;
     frDBDLstFirmas: TfrDBDataSet;
     xEmpresa: TFIBDataSetRO;
     QMContactos: TFIBDataSetRO;
     DSQMContactos: TDataSource;
     frDSQMContactos: TfrDBDataSet;
     procedure frClientesGetValue(const ParName: string; var ParValue: variant);
     procedure frClientesEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLSTClientesDestroy(Sender: TObject);
     procedure DMLSTClientesCreate(Sender: TObject);
     procedure frxClientesBeforePrint(Sender: TfrxReportComponent);
     procedure frxClientesGetValue(const VarName: string; var Value: variant);
     procedure QMClientesAfterOpen(DataSet: TDataSet);
     procedure QMClientesBeforeClose(DataSet: TDataSet);
     procedure QCliAgrupAfterOpen(DataSet: TDataSet);
     procedure QCliAgrupBeforeClose(DataSet: TDataSet);
     procedure xTerceroAgrupacionAfterOpen(DataSet: TDataSet);
     procedure xTerceroAgrupacionBeforeClose(DataSet: TDataSet);
     procedure QAgrupacionesAfterOpen(DataSet: TDataSet);
     procedure QAgrupacionesBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     NombreBanco, CuentaBancaria: string;
     EnviarEMail, tipo_grafico, ejer: integer;
     ejercicio, ejercicio2: integer;
     procedure RefrescarDatosBancarios;
  public
     { Public declarations }
     procedure DameAgrupacion(var Agrupacion: string);
     procedure TituloAgrupacion(Agrupacion: string);
     procedure MostrarListadoFiltrado(Modo: byte);
     procedure DameMinMax(var Desde, Hasta: integer);
     procedure DameTitulos(var Titulo: string; Cliente: integer);
     procedure MostrarFiltradoFiscal(Modo: byte);
     procedure MostrarFiltradoAgrup(Modo: byte; Agrupacion: string; EMail: boolean; Orden: byte);
     procedure MostrarListadoEti(Tercero, vacias, copias, Modo, direcc: integer);
     // Listado por C.Postales
     procedure MostrarListadoCPostal(const CPMin, CPMax, OrdenTxt: string; Modo: byte);
     procedure RefrescaCPDesde(CP: string);
     procedure RefrescaCPHasta(CP: string);
     procedure DameMinMaxCPostal(var CPMin, CPMax: string);
     //Estadisticas clientes
     procedure MuestraEstadistica(tipo, ejerc, ejerc2, Cliente: integer; Moneda: string; porcentaje: double);
     procedure MuestraCartaLOPD(Modo: byte; Cliente: integer; Archivo: string = '');
  end;

var
  DMLSTClientes : TDMLSTClientes;
  SW : integer;

implementation

uses UDMMain, UEntorno, UFMClientes, UFormGest, UDMListados, Clipbrd, ExtCtrls, UDameDato, UImagenes;

{$R *.DFM}

procedure TDMLSTClientes.DMLSTClientesCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLSTClientes.DMLSTClientesDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstClientes.MostrarListadoFiltrado(Modo: byte);
var
  str : string;
begin
  if (FMClientes.SWFIL = 0) then
     if (FMClientes.SWEnlace = 0) then
        DMMain.FiltraRO(QMClientes, '11100', True)
     else
        DMMain.FiltraRO(QMClientes, '10100', True);

  if ((Modo = 0) or (Modo = 1)) then
     DMListados.Cargar(7, '')    // Listado de Clientes
  else
  if ((Modo = 2) or (Modo = 3)) then
     DMListados.Cargar(17, '');  // Listado de Direcciones de Clientes
  if ((Modo = 4) or (Modo = 5)) then {dji lrk kri}
     DMListados.Cargar(2059, '');  // Listado de Etiquetas de Clientes Filtrados

  SW := 1;
  if (REntorno.TipoListado = 'FRF') then
  begin
     frClientes.LoadFromFIB(REntorno.Formato, str);
     frClientes.PrepareReport;
     case Modo of
        0, 2, 4: frClientes.ShowPreparedReport; {dji lrk kri}
        1, 3, 5: frClientes.PrintPreparedReport('', REntorno.Copias); {dji lrk kri}
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxClientes.LoadFromFIB(REntorno.Formato, str);
     frxClientes.PrepareReport;
     case Modo of
        0, 2, 4: frxClientes.ShowPreparedReport; {dji lrk kri}
        1, 3, 5: frxClientes.PrintPreparedReport('', REntorno.Copias); {dji lrk kri}
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstClientes.MostrarFiltradoFiscal(Modo: byte);
var
  str : string;
begin
  QMClientes.Close;
  QMClientes.Open;

  if (FMClientes.SWFIL = 0) then
     if (FMClientes.SWEnlace = 0) then
        DMMain.FiltraRO(QMClientes, '11100', True)
     else
        DMMain.FiltraRO(QMClientes, '10100', True);

  SW := 1;
  DMListados.Cargar(8, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frClientes.LoadFromFIB(REntorno.Formato, str);
     frClientes.PrepareReport;
     case Modo of
        0: frClientes.ShowPreparedReport;
        1: frClientes.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxClientes.LoadFromFIB(REntorno.Formato, str);
     frxClientes.PrepareReport;
     case Modo of
        0: frxClientes.ShowPreparedReport;
        1: frxClientes.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTClientes.frClientesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'NombreBanco' then
  begin
     RefrescarDatosBancarios;
     ParValue := NombreBanco;
  end;

  if ParName = 'TipoGrafico' then
     ParValue := Tipo_grafico;

  if ParName = 'Ejercicio' then
     ParValue := ejer;

  if ParName = 'Ejercicio2' then
     ParValue := ejercicio2;

  if ParName = 'CuentaBancaria' then
     ParValue := CuentaBancaria;

  if ParName = 'EnviarEMail' then
     ParValue := EnviarEMail;

  if ParName = 'CPostalD' then
  begin
     if QMCPDesde.Active then
        ParValue := QMCPDesde.FieldByName('CODIGO_POSTAL').AsString
     else
        ParValue := '';
  end;

  if ParName = 'CPostalH' then
  begin
     if QMCPHasta.Active then
        ParValue := QMCPHasta.FieldByName('CODIGO_POSTAL').AsString
     else
        ParValue := '';
  end;

  if ParName = 'PoblacionD' then
  begin
     if QMCPDesde.Active then
        ParValue := QMCPDesde.FieldByName('TITULO').AsString
     else
        ParValue := '';
  end;

  if ParName = 'PoblacionH' then
  begin
     if QMCPHasta.Active then
        ParValue := QMCPHasta.FieldByName('TITULO').AsString
     else
        ParValue := '';
  end;
end;

procedure TDMLSTClientes.frClientesEnterRect(Memo: TStringList; View: TfrView);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if Memo[0] = 'Nº' then
        SW := 1;
     if (Pos('AGRUPACIÓN', Memo[0]) > 0) then
        SW := 1;

     // Las variables de firma tendrán el formato [Firma-n] donde 'n' es un numero
     s := Trim(Memo[0]);
     if ((Pos('[Firma-', s) > 0) and (View is TfrPictureView)) then
     begin
        // Obtengo numero de firma
        s := Copy(s, 8, Length(s) - Pos(']', s) + 1);
        NumeroFirma := StrToIntDef(s, -1);

        // Recorro firmas hasta encontrar la deseada
        if not xLstFirmas.Active then
           xLstFirmas.Open
        else
           xLstFirmas.First;

        while ((xLstFirmas.RecNo < NumeroFirma) and (not xLstFirmas.EOF)) do
           xLstFirmas.Next;

        // Si existe cargo la imagen en el Memo.
        if (xLstFirmas.RecNo = NumeroFirma) then
        begin
           Imagen := TImage.Create(nil);
           try
              RefrescarImagenFirma(Imagen, xLstFirmas.FieldByName('ID_FIRMA').AsInteger);
              TfrPictureView(View).Picture.Assign(Imagen.Picture);
           finally
              Imagen.Free;
           end;
        end;
     end;
  end;

  // Estadisticas
  if (SW = 100) then
  begin
     if Clipboard.HasFormat(CF_BITMAP) then
     begin
        (frClientes.FindObject('Grafica') as TfrPictureView).Picture.Bitmap.Assign(Clipboard);
     end;
  end;
end;

// Refrescar los Datos Bancarios para el listado
procedure TDMLstClientes.RefrescarDatosBancarios;
begin
  NombreBanco := '';
  CuentaBancaria := '';
  with xBancoCliente do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := QMClientes.FieldByName('TERCERO').AsInteger;
     Open;
     if (RecordCount > 0) then
     begin
        First;

        CuentaBancaria := xBancoCliente.FieldByName('ENTIDAD').AsString + ' ' +
           xBancoCliente.FieldByName('SUCURSAL').AsString + ' ' +
           xBancoCliente.FieldByName('CONTROL').AsString + ' ' +
           xBancoCliente.FieldByName('CUENTA').AsString;

        // Nombre Banco
        with QNombreBanco do
        begin
           Close;
           Params.ByName['PAIS'].AsString := xBancoCliente.FieldByName('PAIS').AsString;
           Params.ByName['ENTIDAD'].AsString := xBancoCliente.FieldByName('ENTIDAD').AsString;
           ExecQuery;
           NombreBanco := FieldByName['TITULO'].AsString;
           FreeHandle;
        end;
     end;
  end;
end;

procedure TDMLstClientes.DameMinMax(var Desde, Hasta: integer);
begin
  with QSeleccion do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT MIN(CLIENTE) AS MINIMO,MAX(CLIENTE) AS MAXIMO FROM VER_CLIENTES_CUENTAS');
     SQL.Add('WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND');
     SQL.Add('EJERCICIO =' + REntorno.EjercicioStr + ' AND');
     SQL.Add('CANAL =' + REntorno.CanalStr);
     ExecQuery;
     Desde := FieldByName['MINIMO'].AsInteger;
     Hasta := FieldByName['MAXIMO'].AsInteger;
     FreeHandle;
  end;
end;

procedure TDMLstClientes.DameTitulos(var Titulo: string; Cliente: integer);
begin
  with QSeleccion do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT TITULO FROM VER_CLIENTES_CUENTAS');
     SQL.Add('WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND');
     SQL.Add('EJERCICIO =' + REntorno.EjercicioStr + ' AND');
     SQL.Add('CANAL =' + REntorno.CanalStr);
     SQL.Add('AND CLIENTE =' + IntToStr(Cliente));
     ExecQuery;
     Titulo := FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLstClientes.MostrarFiltradoAgrup(Modo: byte; Agrupacion: string; EMail: boolean; Orden: byte);
var
  StrOrden : string;
begin
  if (EMail) then
     EnviarEMail := 1
  else
     EnviarEMail := 0;

  case Orden of
     0: StrOrden := 'v.Cliente';
     1: StrOrden := 'v.Titulo';
     2: StrOrden := 't.titulo_localidad'; //sfg_rsl
  end;

  with QAgrupaciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Params.ByName['TIPO'].AsString := 'C';
     Open;
  end;

  with QCliAgrup do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CLIENTES V ');
     SelectSQL.Add(' JOIN EMP_AGRUPACIONES_CLI E ');
     SelectSQL.Add(' ON V.EMPRESA = E.EMPRESA AND V.CLIENTE = E.CLIENTE ');
     SelectSQL.Add(' JOIN VER_TERCEROS_DIRECCION T '); // SFG_RSL Afegir llistat ordenat per direccio
     SelectSQL.Add(' ON V.TERCERO = T.TERCERO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' E.EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' V.EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' V.CANAL = ?CANAL AND ');
     SelectSQL.Add(' E.AGRUPACION = ?AGRUPACION ');
     if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
        SelectSQL.Add(' AND V.AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
     SelectSQL.Add(' ORDER BY ' + StrOrden);
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  SW := 1;
  DMListados.Imprimir(16, 0, Modo, '', '', frClientes, frxClientes, nil, nil);
end;

procedure TDMLSTClientes.TituloAgrupacion(Agrupacion: string);
begin
  with xAgrupacion do
  begin
     Close;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMLSTClientes.DameAgrupacion(var Agrupacion: string);
begin
  xMinAgrup.Close;
  xMinAgrup.Open;
  Agrupacion := xMinAgrup.FieldByName('AGRUPACION').AsString;
end;

procedure TDMLstClientes.MostrarListadoEti(Tercero, vacias, copias, modo, direcc: integer);
begin
  with xEtiquetas do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Params.ByName['DIRECCION'].AsInteger := direcc;
     Params.ByName['VACIAS'].AsInteger := vacias;
     Params.ByName['COPIAS'].AsInteger := copias;
     Open;
  end;

  DMListados.Imprimir(59, 0, Modo, '', '', frClientes, frxClientes, nil, nil);
end;

procedure TDMLstClientes.MostrarListadoCPostal(const CPMin, CPMax, OrdenTxt: string; Modo: byte);
begin
  with QMClientesCP do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CLIENTES_CPOSTAL ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' COD_POSTAL >= ?CP_MIN AND ');
     SelectSQL.Add(' COD_POSTAL <= ?CP_MAX ');
     if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
        SelectSQL.Add(' AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
     SelectSQL.Add(' ORDER BY ' + OrdenTxt);
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CP_MIN'].AsString := CPMin;
     Params.ByName['CP_MAX'].AsString := CPMax;
  end;

  SW := 1;
  DMListados.Imprimir(81, 0, Modo, '', '', frClientes, frxClientes, nil, nil);
end;

procedure TDMLstClientes.RefrescaCPDesde(CP: string);
begin
  with QMCPDesde do
  begin
     Close;
     Params.ByName['CP'].AsString := CP;
     Open;
  end;
end;

procedure TDMLstClientes.RefrescaCPHasta(CP: string);
begin
  with QMCPHasta do
  begin
     Close;
     Params.ByName['CP'].AsString := CP;
     Open;
  end;
end;

procedure TDMLstClientes.DameMinMaxCPostal(var CPMin, CPMax: string);
begin
  with QMinCPostal do
  begin
     Close;
     ExecQuery;
     if (HayDatos) then
        CPMin := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxCPostal do
  begin
     Close;
     ExecQuery;
     if (HayDatos) then
        CPMax := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLSTClientes.MuestraEstadistica(tipo, ejerc, ejerc2, Cliente: integer; Moneda: string; porcentaje: double);
var
  str : string;
begin
  tipo_grafico := tipo;
  ejer := ejerc;
  str := '';
  ejercicio := ejerc;
  ejercicio2 := ejerc2;

  with xClienteTitulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;

  with xFacturasAnual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := 'FAC';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualCompara do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := 'FAC';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualC_1 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 1;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := 'FAC';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualC_2 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := 'FAC';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualC_3 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 3;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := 'FAC';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasMensual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := 'FAC';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xFacturasMensualCompara do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['TIPO'].AsString := 'FAC';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xPrevisionMensual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['PORCENTAJE_VENTAS'].AsDouble := Porcentaje;
     Params.ByName['TIPO'].AsString := 'FAC';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xPrevisionAnual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['PORCENTAJE_VENTAS'].AsDouble := Porcentaje;
     Params.ByName['TIPO'].AsString := 'FAC';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  SW := 100;
  DMListados.Imprimir(197, 0, 0 {Modo Preview}, '', '', frClientes, frxClientes, nil, nil);
end;

procedure TDMLSTClientes.frxClientesBeforePrint(Sender: TfrxReportComponent);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
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
           if Pos('AGRUPACION', Memo[0]) > 0 then
              SW := 1;
        end;

  // Tratamiento de las Imagenes
  if (Sender is TfrxPictureView) then
  begin
     s := TfrxPictureView(Sender).TagStr;

     // Las variables de firma tendrán el formato [Firma-n] donde 'n' es un numero
     if (Pos('Firma-', s) > 0) then
     begin
        // Obtengo numero de firma
        s := Copy(s, 7, Length(s));
        NumeroFirma := StrToIntDef(s, -1);

        // Recorro firmas hasta encontrar la deseada
        if not xLstFirmas.Active then
           xLstFirmas.Open
        else
           xLstFirmas.First;

        while ((xLstFirmas.RecNo < NumeroFirma) and (not xLstFirmas.EOF)) do
           xLstFirmas.Next;

        // Si existe cargo la imagen en el Memo.
        if (xLstFirmas.RecNo = NumeroFirma) then
        begin
           Imagen := TImage.Create(nil);
           try
              Imagen.Transparent := True;
              RefrescarImagenFirma(Imagen, xLstFirmas.FieldByName('ID_FIRMA').AsInteger);
              TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
           finally
              Imagen.Free;
           end;
        end;
     end;
  end;

  // Estadisticas
  if (SW = 100) then
     if Clipboard.HasFormat(CF_BITMAP) then
     begin
        (frxClientes.FindObject('Grafica') as TfrxPictureView).Picture.Bitmap.Assign(Clipboard);
     end;
end;

procedure TDMLSTClientes.frxClientesGetValue(const VarName: string; var Value: variant);
begin
  frClientesGetValue(VarName, Value);
end;

procedure TDMLSTClientes.QMClientesAfterOpen(DataSet: TDataSet);
begin
  QMTerceros.Close;
  QMTerceros.Open;
  QMJustifica.Close;
  QMJustifica.Open;
  QMTipoTercero.Close;
  QMTipoTercero.Open;
  QMIRPF.Close;
  QMIRPF.Open;
  QMIvaModos.Close;
  QMIvaModos.Open;
  QMFormasdePago.Close;
  QMFormasdePago.Open;
  QMContactos.Open;
end;

procedure TDMLSTClientes.QMClientesBeforeClose(DataSet: TDataSet);
begin
  QMTerceros.Close;
  QMJustifica.Close;
  QMTipoTercero.Close;
  QMIRPF.Close;
  QMIvaModos.Close;
  QMFormasdePago.Close;
  QMContactos.Close;
end;

procedure TDMLSTClientes.QCliAgrupAfterOpen(DataSet: TDataSet);
begin
  xTerceroAgrupacion.Close;
  xTerceroAgrupacion.Open;
end;

procedure TDMLSTClientes.QCliAgrupBeforeClose(DataSet: TDataSet);
begin
  xTerceroAgrupacion.Close;
end;

procedure TDMLSTClientes.xTerceroAgrupacionAfterOpen(DataSet: TDataSet);
begin
  xLocalidad.Close;
  xLocalidad.Open;
end;

procedure TDMLSTClientes.xTerceroAgrupacionBeforeClose(DataSet: TDataSet);
begin
  xLocalidad.Close;
end;

procedure TDMLSTClientes.QAgrupacionesAfterOpen(DataSet: TDataSet);
begin
  QCliAgrup.Close;
  QCliAgrup.Open;
end;

procedure TDMLSTClientes.QAgrupacionesBeforeClose(DataSet: TDataSet);
begin
  QCliAgrup.Close;
end;

procedure TDMLSTClientes.MuestraCartaLOPD(Modo: byte; Cliente: integer; Archivo: string);
begin
  DMMain.FiltraRO(xEmpresa, '10000', True);

  with QMClientes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CLIENTES_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' CLIENTE = :CLIENTE ');

     DMMain.FiltraRO(QMClientes, '11100', False);

     Params.ByName['CLIENTE'].AsInteger := Cliente;

     Open;
  end;

  with xLstFirmas do
  begin
     Close;
     Params.ByName['TIPO_FIRMA'].AsString := 'LOC';
     Open;
  end;

  DMListados.Imprimir(2016, 0, Modo, '', '', frClientes, frxClientes, nil, Archivo);
end;

end.
