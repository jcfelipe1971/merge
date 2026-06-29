unit UDMImportacionVending;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, FIBDataSet, UFIBModificados, DB,
  FIBDataSetRO, RxMemDS, FIBTableDataSet;

type
  TDMImportacionVending = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     RXMDDatosImportacion: TRxMemoryData;
     RXMDDatosImportacionUNIDADES: TFloatField;
     RXMDDatosImportacionCENTRO_COSTE: TStringField;
     RXMDDatosImportacionCODIGO_EXTERNO: TStringField;
     RXMDDatosImportacionCODIGO_PERSONA: TStringField;
     RXMDDatosImportacionDESCRIPCION_MAQUINA: TStringField;
     RXMDDatosImportacionDESCRIPCION_PRODUCTO: TStringField;
     RXMDDatosImportacionUBICACION: TStringField;
     RXMDDatosImportacionCLIENTE_VENDING: TStringField;
     RXMDDatosImportacionFECHA: TDateField;
     RXMDDatosImportacionINDENTIFICADOR_PERSONA: TIntegerField;
     RXMDDatosImportacionMAQUINA: TIntegerField;
     RXMDDatosImportacionPRODUCTO: TStringField;
     RXMDDatosImportacionEXISTE_ARTICULO: TIntegerField;
     RXMDDatosImportacionEXISTE_CLIENTE: TIntegerField;
     DSRXMDDatosImportacion: TDataSource;
     QMMaquinas: TFIBTableSet;
     QMMaquinasID_MAQUINA: TIntegerField;
     QMMaquinasEMPRESA: TIntegerField;
     QMMaquinasMAQUINA: TIntegerField;
     QMMaquinasTITULO: TFIBStringField;
     QMMaquinasID_CLIENTE: TIntegerField;
     QMMaquinasCLIENTE: TIntegerField;
     QMMaquinasACTIVO: TIntegerField;
     QMMaquinasPARAMETRO_CLIENTE: TFIBStringField;
     QMMaquinasPARAMETRO_MAQUINA: TFIBStringField;
     DSQMMaquinas: TDataSource;
     xCliente: TFIBTableSet;
     DSCliente: TDataSource;
     xClienteEMPRESA: TIntegerField;
     xClienteCLIENTE: TIntegerField;
     QMMaquinasPARAMETRO_UBICACION: TFIBStringField;
     xClientePARAMETRO_UBICACION: TFIBStringField;
     xClientePARAMETRO_DOMINIO: TFIBStringField;
     xMaquinasImportar: TFIBTableSet;
     DSxMaquinasImportar: TDataSource;
     xMaquinasImportarID_MAQUINA: TIntegerField;
     xMaquinasImportarEMPRESA: TIntegerField;
     xMaquinasImportarMAQUINA: TIntegerField;
     xMaquinasImportarTITULO: TFIBStringField;
     xMaquinasImportarID_CLIENTE: TIntegerField;
     xMaquinasImportarCLIENTE: TIntegerField;
     xMaquinasImportarACTIVO: TIntegerField;
     xMaquinasImportarPARAMETRO_CLIENTE: TFIBStringField;
     xMaquinasImportarPARAMETRO_MAQUINA: TFIBStringField;
     xMaquinasImportarPARAMETRO_UBICACION: TFIBStringField;
     xMaquinasImportarPARAMETRO_DOMINIO: TFIBStringField;
     QMMaquinasPARAMETRO_DOMINIO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure xClienteBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ProcesarCSV(CSV, Ubicacion: string);
     procedure CrearAlbaranes(DesdeFecha, HastaFecha, FechaAlbaran: TDateTime; URL, Almacen, Serie: string);
     procedure LeerMaquina(DesdeFecha, HastaFecha: TDateTime; URL, Dominio, Cliente, Maquina, Ubicacion: string);
     procedure MarcarTodasMaquinas(Marcar: boolean);
  end;

var
  DMImportacionVending : TDMImportacionVending;

implementation

uses UDMMain, UEntorno, Dialogs, DateUtils, UUtiles, IdHttp, WinInet, Forms, HYFIBQuery,
  UFMain, UFMSeleccion, UFMImportacionVending, UFMAlbaranes, UDameDato;

{$R *.dfm}

procedure TDMImportacionVending.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(xMaquinasImportar, '10000', True);

  // Cantidad, CentroCoste, CodigoExterno, CodigoPersona, DescripcionMaquina, DescripcionProducto,
  // Direccion, Empresa(este es el campo cliente), Fecha, IdentificadorPersona, Maquina, Producto
  // 1,,132820103,1351,"MAGNA MIRRORS","PAR GUANTES 500G2P URETAN GRIS 7",,001,2019/02/18,4,1,132820103
  // 1,,132820102,1352,"MAGNA MIRRORS","PAR GUANTES 500G2P URETAN GRIS 6",,001,2019/02/18,5,1,132820102
  // 1,,132820103,1355,"MAGNA MIRRORS","PAR GUANTES 500G2P URETAN GRIS 7",,001,2019/02/18,8,1,132820103
  with RXMDDatosImportacion do
  begin
     Close;
     EmptyTable;
     Open;
  end;
end;

procedure TDMImportacionVending.DataModuleDestroy(Sender: TObject);
begin
  with RXMDDatosImportacion do
  begin
     Close;
     EmptyTable;
  end;
end;

procedure TDMImportacionVending.ProcesarCSV(CSV, Ubicacion: string);
var
  i, j : integer;
  slCSV, slCSVLine : TStrings;

  function DameNombreCampo(i: integer): string;
  begin
     // Nombre de los campos que llegan en el CSV.
     // No todos se utilizan

     case i of
        0: Result := 'Apellidos';
        1: Result := 'Cantidad';
        2: Result := 'CentroCoste';
        3: Result := 'Codigo';
        4: Result := 'CodigoExterno';
        5: Result := 'Codigo_Offline';
        6: Result := 'Colectivo';
        7: Result := 'Contrata';
        8: Result := 'Departamento';
        9: Result := 'DescripcionColectivo';
        10: Result := 'DescripcionMaquina';
        11: Result := 'DescripcionProducto';
        12: Result := 'Empresa';
        13: Result := 'Fecha';
        14: Result := 'Id1';
        15: Result := 'Maquina';
        16: Result := 'Nombre';
        17: Result := 'NumeroPedido';
        18: Result := 'Persona';
        19: Result := 'Precio';
        20: Result := 'Producto';
        21: Result := 'Responsable';
        22: Result := 'Tarjeta';
        23: Result := 'Tipo_Ctb';
        24: Result := 'Ubicacion';
        else
           Result := '???';
     end;
  end;

begin
  // StringList para lineas
  slCSV := TStringList.Create;
  try
     slCSV.Text := CSV;

     for i := 0 to slCSV.Count - 1 do
     begin
        // StringList para campos de la linea
        slCSVLine := TStringList.Create;
        try
           slCSVLine.CommaText := slCSV[i];

           DMMain.LogIni(Format('Linea: %d - Ubicacion: %s.', [i, Ubicacion]));
           for j := 0 to slCSVLine.Count - 1 do
              DMMain.Log(Format('Campo: %2d %-20s - Valor: %s.', [j, DameNombreCampo(j), slCSVLine[j]]));
           DMMain.LogFin('');

           // Si ubicacion no es vacia
           // Solo inserto los registros que corresponden con la ubicacion
           // Campo 25 es Ubicacion
           if ((Ubicacion = '') or (Ubicacion = Trim(Copy(slCSVLine[24], 1, 20)))) then
           begin
              // Creo nuevo registro
              RXMDDatosImportacion.Insert;

              for j := 0 to slCSVLine.Count - 1 do
              begin
                 // Para WebService GetSalesMachineCsv.php (http://delfos-online.com/webServiceLogicart/GetSalesMachineCsv.php)
                 // YA NO SE UTILIZA
                { Ejemplo de formato de CSV recibido
                   Cantidad, CentroCoste, CodigoExterno, CodigoPersona, DescripcionMaquina, DescripcionProducto,
                   Direccion, Empresa(este es el campo cliente), Fecha, IdentificadorPersona, Maquina, Producto
                   1,,132820103,1351,"MAGNA MIRRORS","PAR GUANTES 500G2P URETAN GRIS 7",,001,2019/02/18,4,1,132820103

                // Para WebService GetDetalleMovimientosCsv.php
                { Ejemplo de formato de CSV recibido
                "Mellado Daza",1,,394652,149400105,0,1500,,,"ACCESO TOTAL ","AGRO PALAU","GUANTES 440P NAILON GRIS P/PVC 9",010,"2020-01-08 16:23:49",70,17,Isabel,0,6004,0,149400105,,6004,301,PALAU

                Array
                (
                    0 [Apellidos] => Mellado Daza
                    1 [Cantidad] => 1
                    2 [CentroCoste] =>
                    3 [Codigo] => 394652
                    4 [CodigoExterno] => 149400105
                    5 [Codigo_Offline] => 0
                    6 [Colectivo] => 1500
                    7 [Contrata] =>
                    8 [Departamento] =>
                    9 [DescripcionColectivo] => ACCESO TOTAL
                   10 [DescripcionMaquina] => AGRO PALAU
                   11 [DescripcionProducto] => GUANTES 440P NAILON GRIS P/PVC 9
                   12 [Empresa] => 010
                   13 [Fecha] => 2020-01-08 16:23:49
                   14 [Id1] => 70
                   15 [Maquina] => 17
                   16 [Nombre] => Isabel
                   17 [NumeroPedido] => 0
                   18 [Persona] => 6004
                   19 [Precio] => 0
                   20 [Producto] => 149400105
                   21 [Responsable] =>
                   22 [Tarjeta] => 6004
                   23 [Tipo_Ctb] => 301
                   24 [Ubicacion] => PALAU
                )
                }
                 case j of
                    1: RXMDDatosImportacionUNIDADES.AsFloat := StrToFloatDef(slCSVLine[j], 0);
                    2: RXMDDatosImportacionCENTRO_COSTE.AsString := Trim(Copy(slCSVLine[j], 1, 15));
                    4:
                    begin
                       RXMDDatosImportacionCODIGO_EXTERNO.AsString := Trim(Copy(slCSVLine[j], 1, 15));
                       if (DameIDArticulo(RXMDDatosImportacionCODIGO_EXTERNO.AsString) > 0) then
                          RXMDDatosImportacionEXISTE_ARTICULO.AsInteger := 1
                       else
                          RXMDDatosImportacionEXISTE_ARTICULO.AsInteger := 0;
                    end;
                    18: RXMDDatosImportacionCODIGO_PERSONA.AsString := Trim(Copy(slCSVLine[j], 1, 15));
                    10: RXMDDatosImportacionDESCRIPCION_MAQUINA.AsString := Trim(Copy(slCSVLine[j], 1, 60));
                    11: RXMDDatosImportacionDESCRIPCION_PRODUCTO.AsString := Trim(Copy(slCSVLine[j], 1, 60));
                    24: RXMDDatosImportacionUBICACION.AsString := Trim(Copy(slCSVLine[j], 1, 20));
                    12:
                    begin
                       RXMDDatosImportacionCLIENTE_VENDING.AsString := Trim(Copy(slCSVLine[j], 1, 15));
                       RXMDDatosImportacionEXISTE_CLIENTE.AsInteger := 1;
                    end;
                    13: RXMDDatosImportacionFECHA.AsDateTime := (EncodeDate(StrToIntDef(Copy(slCSVLine[j], 1, 4), 0), StrToIntDef(Copy(slCSVLine[j], 6, 2), 0), StrToIntDef(Copy(slCSVLine[j], 9, 2), 0)));
                    22: RXMDDatosImportacionINDENTIFICADOR_PERSONA.AsInteger := StrToIntDef(slCSVLine[j], 0);
                    15: RXMDDatosImportacionMAQUINA.AsInteger := StrToIntDef(slCSVLine[j], 0);
                    20: RXMDDatosImportacionPRODUCTO.AsString := Trim(Copy(slCSVLine[j], 1, 15));
                    {
                    else
                       raise Exception.Create(_('Existen campos extra sin identificar'));
                    }
                 end;
              end;
           end;
        finally
           slCSVLine.Free
        end;

        // Si se insertó algo debo hacer Post
        if (RXMDDatosImportacion.State <> dsBrowse) then
           RXMDDatosImportacion.Post;
     end;
  finally
     slCSV.Free
  end;
end;

procedure TDMImportacionVending.LeerMaquina(DesdeFecha, HastaFecha: TDateTime; URL, Dominio, Cliente, Maquina, Ubicacion: string);
var
  HTMLBody : string;
  IdHTTP : TIdHTTP;
begin
  /// Descarga CSV e inserta registros en tabla en memoria con los campos que nos interesan.
  /// Si ubicacion no está vacia, solo se insertan los registros con ese dato.

  HTMLBody := '';

  // http://delfos-online.com/webServiceLogicart/GetDetalleMovimientosCsv.php?fecha_inicial=2019-12-01&fecha_final=2019-12-31&cliente=002&maquina=2004
  {
  Version anterior (< 13/03/2020) - http://delfos-online.com/webServiceLogicart/GetSalesMachineCsv.php?fecha_inicial=2019/12/01&fecha_final=2019/12/31&cliente=002&maquina=2004
                                  - Fechas separadas con "/".
  }
  URL := URL + '?fecha_inicial=' + FormatDateTime('yyyy-mm-dd', DesdeFecha);
  URL := URL + '&fecha_final=' + FormatDateTime('yyyy-mm-dd', HastaFecha);
  URL := URL + '&cliente=' + Trim(Cliente);
  URL := URL + '&maquina=' + Trim(Maquina);
  URL := URL + '&dominio=' + Trim(Dominio);

  // ¿Estamos conectados a Internet?
  if WinInet.InternetGetConnectedState(nil, 0) then
  begin
     IdHTTP := TIdHTTP.Create(Application);
     try
        try
           HTMLBody := IdHTTP.Get(URL);
        except
           on e: Exception do
           begin
              ShowMessage(e.message);
           end;
        end;

        // Modifico fin de linea
        HTMLBody := StringReplace(HTMLBody, #10, #13#10, [rfReplaceAll]);

        { Version anterior (< 13/03/2020)
        // Ejemplo GetSalesMachineCsv
        // Cantidad, CentroCoste, CodigoExterno, CodigoPersona, DescripcionMaquina, DescripcionProducto, Direccion, Empresa(este es el campo cliente), Fecha, IdentificadorPersona, Maquina, Producto
        // 1,,132820103,1351,"MAGNA MIRRORS","PAR GUANTES 500G2P URETAN GRIS 7",,001,2019/02/18,4,1,132820103
        // 1,,132820102,1352,"MAGNA MIRRORS","PAR GUANTES 500G2P URETAN GRIS 6",,001,2019/02/18,5,1,132820102
        // 1,,132820103,1355,"MAGNA MIRRORS","PAR GUANTES 500G2P URETAN GRIS 7",,001,2019/02/18,8,1,132820103
        }

        // Ejemplo GetDetalleMovimientosCsv
        // "Mellado Daza",1,,394652,149400105,0,1500,,,"ACCESO TOTAL ","AGRO PALAU","GUANTES 440P NAILON GRIS P/PVC 9",010,"2020-01-08 16:23:49",70,17,Isabel,0,6004,0,149400105,,6004,301,PALAU
     finally
        IdHTTP.Free;
     end;
  end;

  ProcesarCSV(HTMLBody, Ubicacion);
end;

procedure TDMImportacionVending.CrearAlbaranes(DesdeFecha, HastaFecha, FechaAlbaran: TDateTime; URL, Almacen, Serie: string);
var
  Articulo, ArticuloInexistente : string;
  Unidades : double;
  IdDoc, Proceso_auto : integer;
  //dummy : integer;

  procedure InsertarLinea(IdDoc, IDArticulo: integer; Unidades: double);
  {var
     dummy : integer;
  }
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT ID_DETALLES_S FROM WEB_INS_DETALLE_VENTA(:TIPO, :ID_S, :ID_A, :TITULO, :UNIDADES, :NOTAS, :PRECIO, :DESCUENTO) ');
           Params.ByName['TIPO'].AsString := 'ALB';
           Params.ByName['ID_S'].AsInteger := IdDoc;
           Params.ByName['ID_A'].AsInteger := IDArticulo;
           Params.ByName['TITULO'].AsString := '';
           Params.ByName['UNIDADES'].AsFloat := Unidades;
           Params.ByName['NOTAS'].AsString := '';
           Params.ByName['PRECIO'].AsFloat := 0;
           Params.ByName['DESCUENTO'].AsFloat := 0;
           ExecQuery;
           //dummy := FieldByName['ID_DETALLES_S'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

  end;

begin
  /// +-- Recorre los clientes. DISTINCT EMPRESA, CLIENTE, PARAMETRO_UBICACION FROM EMP_MAQUINAS_VENDING
  /// |   +-- Para cada cliente-ubicacion se recorren las (maquina-ubicacion)
  /// |   |   Para cada maquina-ubicacion se leen los CSV rellenando una tabla en memoria (RXMDDatosImportacion)
  /// |   |   Se crea cabecera de albaran.
  /// |   |   Se recorre la tabla en memoria agrupando por artículo, creando líneas de albaran
  /// |   +--
  /// +--

  // Recorro los diferentes clientes
  DMMain.FiltraTabla(xCliente, '10000', True);
  Proceso_auto := DMMain.ContadorGen('CONTA_TMP_PROC_AUTO');

  DMMain.LogIni(Format('CrearAlbaranes - Proceso Auto: %d', [Proceso_auto]));
  try
     while not xCliente.EOF do
     begin
        DMMain.Log('Vacio tabla temporal');
        // Vacio datos antes de importar
        with RXMDDatosImportacion do
        begin
           Close;
           EmptyTable;
           Open;
        end;

        // Leo datos de las maquinas acumulando todas las maquinas del cliente
        DMMain.Log(Format(_('Cliente: %s, Maquina: %s - Leyendo datos'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString]));
        FMImportacionVending.Progreso(Format(_('Cliente: %s, Maquina: %s - Leyendo datos'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString]));
        RXMDDatosImportacion.DisableControls;
        try
           with QMMaquinas do
           begin
              First;
              while not EOF do
              begin
                 DMMain.Log(Format(_('LeerMaquina: %s - Ubicacion: %s.'), [QMMaquinasPARAMETRO_MAQUINA.AsString, QMMaquinasPARAMETRO_UBICACION.AsString]));
                 LeerMaquina(DesdeFecha, HastaFecha, URL, QMMaquinasPARAMETRO_DOMINIO.AsString, QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString, QMMaquinasPARAMETRO_UBICACION.AsString);
                 Next;
              end;
           end;
        finally
           RXMDDatosImportacion.EnableControls;
        end;

        // Recorrer registros y creo albaran
        // debe agrupar por articulo
        with RXMDDatosImportacion do
        begin
           DisableControls;
           try
              if (RecordCount > 0) then
              begin
                 FMImportacionVending.Progreso(Format(_('Cliente: %s, Maquina: %s - Creando cabecera de albaran'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString]));
                 DMMain.Log(Format(_('Cliente: %s, Maquina: %s - Creando cabecera de albaran'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString]));
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT ID_S, RIG ');
                       SQL.Add(' FROM WEB_INS_CABECERA_VENTA_7(:USUARIOID, :TIPO, :CLIENTE, :REFERENCIA, :ENTRADA, ');
                       SQL.Add(' :ALMACEN, :FECHA_DOC, :AGENTE, :SERIE, :RIG_IN, :EMPRESA, :CANAL, :LISTO_PARA_PREPARAR, :DIRECCION) ');
                       Params.ByName['USUARIOID'].AsString := REntorno.Nombre;
                       Params.ByName['TIPO'].AsString := 'ALB';
                       Params.ByName['CLIENTE'].AsInteger := xClienteCLIENTE.AsInteger;
                       if (Trim(QMMaquinasPARAMETRO_UBICACION.AsString) = '') then
                          Params.ByName['REFERENCIA'].AsString := Format('%s - %s', [DateToStr(DesdeFecha), DateToStr(HastaFecha)])
                       else
                          Params.ByName['REFERENCIA'].AsString := Copy(Format('%s - %s (%s)', [DateToStr(DesdeFecha), DateToStr(HastaFecha), Trim(QMMaquinasPARAMETRO_UBICACION.AsString)]), 1, 40);
                       Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                       Params.ByName['ALMACEN'].AsString := Almacen;
                       Params.ByName['FECHA_DOC'].AsDateTime := FechaAlbaran;
                       Params.ByName['AGENTE'].AsInteger := 0;
                       Params.ByName['SERIE'].AsString := Serie;
                       Params.ByName['RIG_IN'].AsInteger := 0;
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                       Params.ByName['LISTO_PARA_PREPARAR'].AsInteger := 1;
                       Params.ByName['DIRECCION'].AsInteger := 0;
                       ExecQuery;
                       IdDoc := FieldByName['ID_S'].AsInteger;
                       //dummy := FieldByName['RIG'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' INSERT INTO TMP_PROCESOS_AUTO ( ');
                       SQL.Add(' CONTADOR, ENTRADA, EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG) ');
                       SQL.Add(' SELECT :PROCESO_AUTO, :ENTRADA, EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG ');
                       SQL.Add(' FROM GES_CABECERAS_S ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_S = :ID_S ');
                       Params.ByName['ID_S'].AsInteger := IdDoc;
                       Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                       Params.ByName['PROCESO_AUTO'].AsInteger := Proceso_auto;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 SortOnFields('EXISTE_ARTICULO;CODIGO_EXTERNO;MAQUINA');

                 // Verifico que existan los articulos
                 FMImportacionVending.Progreso(Format(_('Cliente: %s, Maquina: %s - Verificando articulos'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString]));
                 DMMain.Log(Format(_('Cliente: %s, Maquina: %s - Verificando articulos'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString]));
                 First;
                 while not EOF do
                 begin
                    if (RXMDDatosImportacionEXISTE_ARTICULO.AsInteger <> 1) then
                    begin
                       DMMain.Log(Format(_('Cliente: %s, Maquina: %s - Articulo %s no existe'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString, RXMDDatosImportacionCODIGO_EXTERNO.AsString]));
                       FMImportacionVending.Progreso(Format(_('Cliente: %s, Maquina: %s - Articulo "%s" no existe (%s)'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString, RXMDDatosImportacionCODIGO_EXTERNO.AsString, RXMDDatosImportacionDESCRIPCION_PRODUCTO.AsString]));
                       ArticuloInexistente := RXMDDatosImportacionCODIGO_EXTERNO.AsString;
                       if PideDato('ART', Articulo, Format(_('"%s" no existe. Articulo para reemplazar. (Vacio cancela importacion)'), [ArticuloInexistente])) then
                       begin
                          First;
                          while not EOF do
                          begin
                             if (RXMDDatosImportacionCODIGO_EXTERNO.AsString = ArticuloInexistente) then
                             begin
                                Edit;
                                RXMDDatosImportacionCODIGO_EXTERNO.AsString := Articulo;
                                RXMDDatosImportacionEXISTE_ARTICULO.AsInteger := 1;
                                Post;
                             end;

                             Next;
                          end;

                          First;
                       end
                       else
                       begin
                          raise Exception.Create(_('Importacion cancelada'));
                       end;
                    end;

                    Next;
                 end;

                 // Primer registro
                 First;
                 Unidades := RXMDDatosImportacionUNIDADES.AsFloat;
                 Articulo := RXMDDatosImportacionCODIGO_EXTERNO.AsString;
                 Next;

                 // Siguientes
                 FMImportacionVending.Progreso(Format(_('Cliente: %s, Maquina: %s - Creando lineas %s'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString, Articulo]));
                 DMMain.Log(Format(_('Cliente: %s, Maquina: %s - Creando lineas %s'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString, Articulo]));
                 while not EOF do
                 begin
                    if (Articulo = RXMDDatosImportacionCODIGO_EXTERNO.AsString) then
                       Unidades := Unidades + RXMDDatosImportacionUNIDADES.AsFloat
                    else
                    begin
                       // Crear linea
                       // ShowMessage(Format('Art: %s Uds: %f',[Articulo, Unidades]));

                       {$IFNDEF Debug}
                       DMMain.Log(Format(_('InsertarLinea: Art %s, Uds: %7.2f - %d'), [Articulo, Unidades, DameIDArticulo(Articulo)]));
                       InsertarLinea(IdDoc, DameIDArticulo(Articulo), Unidades);
                       {$ENDIF}

                       {$IFDEF Debug}
                       try
                         DMMain.Log(Format(_('InsertarLinea: Art %s, Uds: %7.2f - %d'), [Articulo, Unidades, DameIDArticulo(Articulo)]));
                         InsertarLinea(IdDoc, DameIDArticulo(Articulo), Unidades);
                       except
                         with THYFIBQuery.Create(nil) do
                         begin
                            try
                               Close;
                               DataBase := DMMain.DataBase;
                               SQL.Add(' EXECUTE PROCEDURE CREAR_DETALLES_ST (1, 2019,''CAS'', 235, :ARTICULO , :UNIDADES , :ENTRADA, 0 , 0, 0) ');
                               Params.ByName['ARTICULO'].AsString := Articulo;
                               Params.ByName['UNIDADES'].AsFloat := Unidades;
                               Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                               ExecQuery;
                               FreeHandle;
                            finally
                               Free;
                            end;
                         end;
                         InsertarLinea(IdDoc, DameIDArticulo(Articulo), Unidades);
                       end;
                       {$ENDIF}

                       Unidades := RXMDDatosImportacionUNIDADES.AsFloat;
                       Articulo := RXMDDatosImportacionCODIGO_EXTERNO.AsString;
                       FMImportacionVending.Progreso(Format(_('Cliente: %s, Maquina: %s - Creando lineas %s'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString, Articulo]));
                    end;

                    Next;
                 end;

                 // Crear ultima linea
                 // ShowMessage(Format('Art: %s Uds: %f',[Articulo, Unidades]));
                 InsertarLinea(IdDoc, DameIDArticulo(Articulo), Unidades);
              end;
           finally
              EnableControls;
           end;
        end;

        xCliente.Next;
     end;

     FMain.EjecutaAccion(FMain.AAlbaranes);
     FMAlbaranes.AgrupacionPedidos(Serie, Proceso_auto);
  except
     on e: Exception do
     begin
        DMMain.Log(Format(_('Cliente: %s, Maquina: %s - Error. Importacion cancelada'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString]));
        DMMain.Log(e.Message);
        FMImportacionVending.Progreso(Format(_('Cliente: %s, Maquina: %s - Error. Importacion cancelada'), [QMMaquinasPARAMETRO_CLIENTE.AsString, QMMaquinasPARAMETRO_MAQUINA.AsString]));
        ShowMessage(e.Message);
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' DELETE FROM VER_CABECERAS_ALBARAN ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_S IN (SELECT C.ID_S ');
              SQL.Add('          FROM TMP_PROCESOS_AUTO T ');
              SQL.Add('          JOIN GES_CABECERAS_S C ON T.EMPRESA = C.EMPRESA AND T.EJERCICIO = C.EJERCICIO AND T.CANAL = C.CANAL AND T.SERIE = C.SERIE AND T.TIPO = C.TIPO AND T.RIG = C.RIG ');
              SQL.Add('          WHERE ');
              SQL.Add('          T.CONTADOR = :PROCESO_AUTO) ');
              Params.ByName['PROCESO_AUTO'].AsInteger := Proceso_auto;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
  FMImportacionVending.Progreso('');
  DMMain.LogFin(Format('CrearAlbaranes - Proceso Auto: %d', [Proceso_auto]));
end;

procedure TDMImportacionVending.xClienteAfterOpen(DataSet: TDataSet);
begin
  QMMaquinas.Open;
end;

procedure TDMImportacionVending.xClienteBeforeClose(DataSet: TDataSet);
begin
  QMMaquinas.Close;
end;

procedure TDMImportacionVending.MarcarTodasMaquinas(Marcar: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE EMP_MAQUINAS_VENDING SET ACTIVO = :ACTIVO WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ACTIVO'].AsInteger := BoolToInt(Marcar);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(xMaquinasImportar, 'MAQUINA', xMaquinasImportarMAQUINA.AsInteger);
end;

end.
