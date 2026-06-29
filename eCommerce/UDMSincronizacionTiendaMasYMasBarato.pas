unit UDMSincronizacionTiendaMasYMasBarato;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, ADODB, FIBDataSet,
  FIBTableDataSet;

type
  TDMSincronizacionTiendaMasYMasBarato = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     MSSQLConnection: TADOConnection;
     QMSSQL: TADOQuery;
     QMConfiguracion: TFIBTableSet;
     DSQMConfPrestaShop: TDataSource;
     QMConfiguracionDSN: TFIBStringField;
     QMConfiguracionEMPRESA: TIntegerField;
     QMConfiguracionCANAL: TIntegerField;
     QMConfiguracionFORMA_PAGO: TFIBStringField;
     QMConfiguracionSERIE: TFIBStringField;
     QMConfiguracionACTIVO: TIntegerField;
     QMConfiguracionALMACEN: TFIBStringField;
     QMConfiguracionAGENTE: TIntegerField;
     QMConfiguracionULT_FACTURA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMConfiguracionNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     DSN: string;
     procedure EstableceConexionMSSQL;
  public
     { Public declarations }
     procedure Sincronizar(Archivo: string);
     procedure Log(s: string);
     procedure Prueba;
  end;

var
  DMSincronizacionTiendaMasYMasBarato : TDMSincronizacionTiendaMasYMasBarato;

implementation

uses UDMMain, Dialogs, HYFIBQuery, UEntorno, DateUtils, UUtiles, UFMSincronizacionTiendaMasYMasBarato, Forms,
  UDMFacturas, UFormGest;

{$R *.dfm}

procedure TDMSincronizacionTiendaMasYMasBarato.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMConfiguracion, '101000');

  if (QMConfiguracionEMPRESA.AsInteger <> REntorno.Empresa) then
  begin
     QMConfiguracion.Insert;
     QMConfiguracion.Delete;
  end;
end;

procedure TDMSincronizacionTiendaMasYMasBarato.EstableceConexionMSSQL;
begin
  // Conecto si no está conectada
  with MSSQLConnection do
  begin
     try
        if (not Connected) then
        begin
           ConnectionString := 'DSN=' + DSN;
           Open;
           Log(_('Conectado a Tienda Virtual'));
        end;
     except
        on e: Exception do
           Log(_('(1) Error al abrir conexion MSSQL') + #13#10 + e.Message);
     end;
  end;
end;

(*
procedure TDMSincronizacionTiendaMasYMasBarato.Sincronizar(Archivo : string);
var
  Q : THYFIBQuery;
  FacturasASincronizar : TStrings;
  // Factura
  idComanda : integer;
  idFactura : integer;
  Data : TDateTime;
  Trama : integer;
  // Comanda Cabecera
  DataComanda : TDateTime;
  afNom : string;
  afCognoms : string;
  afEmpresa : string;
  afNIF : string;
  afAdreca1 : string;
  afAdreca2 : string;
  afCP : string;
  afPoblcacion : string;
  afProvincia : string;
  Email : string;
  Telefon : string;
  aeNom : string;
  aeCognoms : string;
  aeAdreca1 : string;
  aeAdreca2 : string;
  aeCP : string;
  aePoblacion : string;
  aeProvincia : string;
  aiNom : string;
  aiCognoms : string;
  aiAdreca1 : string;
  aiAdreca2 : string;
  aiCP : string;
  aiPoblacion : string;
  aiProvincia : string;
  aiEmail : string;
  aiTelefon : string;
  OpcioTransport : integer;
  ConfirmatClient : integer;
  ConfirmatPagament : integer;
  PassatProveidors : integer;
  ComandaRebuda : integer;
  idSeguimentTransportista : string;
  Incidencia : integer;
  idIncidencia : integer;
  idClient : integer;
  idPagament : integer;
  BISumaMercaderies : double;
  IVAMercaderies : double;
  TotalMercaderies : double;
  BITransport : double;
  IVATransport : double;
  TotalTransport : double;
  BIPagament : double;
  IVAPagament : double;
  TOTALPagament : double;
  BITotal : double;
  IVATotal : double;
  TotalPagar : double;
  idSessio : string;
  // Comanda Linea
  TipusLinia : integer;
  proveidor : double;
  producto_num : string;
  nombre : string;
  // descripcion : string;
  // cod_categoria_1 : string;
  // ean : string;
  portes : double;
  unidades : integer;
  coste : double;
  venta : double;
  // Para crear factura
  Tercero, Cliente : integer;
  Direccion : integer;
  Tarifa : string;
  TarifaIVAIncluido : boolean;
  Transportista : integer;
  i, id_a, id_s, id_detalles_s : integer;
  EjercicioCliente, Ejercicio, RIG : integer;
  Estado : integer;
  Serie : string;
  Almacen : string;
  PorcentajeIVA : double;
  TipoIVA : integer;
  TipoIVAFamilia : integer;
  NIF : string;
  dir_localidad : string;
  CtaDtoPP : string;
  PaisC2 : string;
  ModoIVACanal : integer;
  Cuenta : string;
  CodigoBarra, ArticuloConMismoCodigoBarra : string;
  nombre_producto : string;
  codigo_mayorista : string;
  descripcion : string;
  cod_categoria_1 : string;
  categoria_1 : string;
  cod_categoria_2 : string;
  categoria_2 : string;
  marca : string;
  ean : string;
  ean_producto : string;
  pvp : double;
  QProducto : TADOQuery;
  Pais : string;
  CtaCompras : string;
  CtaVentas : string;
  CtaDevolucionCompras : string;
  CtaDevolucionVentas : string;
  CtaAbonoCompras : string;
  CtaAbonoVentas : string;
  Disponibilidad : integer;
  Error : boolean;
  Articulo : string;
  PCoste : double;
  s : string;
begin
  if (QMConfiguracion.State in [dsInsert, dsEdit]) then
     QMConfiguracion.Post;

  Serie := QMConfiguracionSERIE.AsString;
  Almacen := QMConfiguracionALMACEN.AsString;
  PorcentajeIVA := 21;

  Log(_('Inicio Sinctronizacion'));
  Log(DateTimeToStr(Now));
  Log('--------------------------------------------------');
  Log(_('Serie') + ' ' + Serie);
  Log(_('Almacen') + ' ' + Almacen);
  Log(Format(_('Porcentaje IVA %f'), [PorcentajeIVA]));

  Error := False;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MODO_IVA FROM EMP_CANALES WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        ModoIVACanal := FieldByName['MODO_IVA'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  Log(Format(_('Modo IVA Canal %d'), [ModoIVACanal]));

  EstableceConexionMSSQL;

  if (MSSQLConnection.Connected) then
  begin
     FacturasASincronizar := TStringList.Create;
     try
        // Obtengo la lista de facturas a sincronizar
        with QMSSQL do
        begin
           try
              Connection := MSSQLConnection;
              if (Active) then
                 Close;
              SQL.Clear;
              SQL.Add(' SELECT [idFactura] ');
              SQL.Add('   FROM [masymasbarato].[dbo].[Facturas] ');
              SQL.Add('  WHERE [idFactura] > :UltimaidFacturaImportada ');
              SQL.Add('  ORDER BY [idFactura] ');

              // PrepareStatement;
              Parameters.FindParam('UltimaidFacturaImportada').Value := QMConfiguracionULT_FACTURA.AsInteger;

              Open;
              while not EOF do
              begin
                 FacturasASincronizar.Add(QMSSQL.FieldByName('idFactura').AsString);
                 Log(Format('Agrego a la lista de Factura a Importar: %s', [QMSSQL.FieldByName('idFactura').AsString]));

                 Next;
              end;
           except
              on e: Exception do
              begin
                 Error := True;
                 Log(_('(2) Error al obtener Facturas de MSSQL') + #13#10 + e.Message);
              end;
           end;
        end;

        while ((not Error) and (FacturasASincronizar.Count > 0)) do
        begin
           DMMain.LogIni(Format('Comienzo a tratar la factura %s', [FacturasASincronizar[0]]));

           Log('--------------------------------------------------');
           Log(Format('Comienzo a tratar la factura %s', [FacturasASincronizar[0]]));
           Log('--------------------------------------------------');
           idFactura := StrToInt(FacturasASincronizar[0]);
           idComanda := 0;
           Data := Now;

           Log(_('Datos de Factura'));
           Log('--------------------------------------------------');
           // Obtengo datos de la factura
           with QMSSQL do
           begin
              try
                 Connection := MSSQLConnection;
                 if (Active) then
                    Close;
                 SQL.Clear;
                 SQL.Add(' SELECT [idComanda] ');
                 SQL.Add('       ,[Data] ');
                 SQL.Add('       ,[Trama] ');
                 SQL.Add('   FROM [masymasbarato].[dbo].[Facturas] ');
                 SQL.Add('  WHERE [idFactura] = :Factura ');

                 // PrepareStatement;
                 Parameters.FindParam('Factura').Value := idFactura;

                 Open;
                 idComanda := QMSSQL.FieldByName('idComanda').AsInteger;
                 Log(Format('idComanda: %d', [idComanda]));
                 Data := QMSSQL.FieldByName('Data').AsDateTime;
                 Log(Format('Data: %s', [DateTimeToStr(Data)]));
                 Trama := QMSSQL.FieldByName('Trama').AsInteger;
                 Log(Format('Trama: %d', [Trama]));
              except
                 on e: Exception do
                 begin
                    Error := True;
                    Log('************************************************************');
                    Log(Format(_('(3) Error al obtener datos de la Factura %d'), [idFactura]) + #13#10 + e.Message);
                 end;
              end;
           end;

           id_s := 0;
           if (not Error) then
           begin
              Log(_('Datos de Cabecera de Pedido'));
              Log('--------------------------------------------------');

              // Parte 1
              with QMSSQL do
              begin
                 try
                    Connection := MSSQLConnection;

                    if (Active) then
                       Close;

                    SQL.Clear;
                    SQL.Add(' SELECT [DataComanda] ');
                    SQL.Add('       ,[afNom] ');
                    SQL.Add('       ,[afCognoms] ');
                    SQL.Add('       ,[afEmpresa] ');
                    SQL.Add('       ,[afNIF] ');
                    SQL.Add('       ,[afAdreca1] ');
                    SQL.Add('       ,[afAdreca2] ');
                    SQL.Add('       ,[afCP] ');
                    SQL.Add('       ,[afPoblcacion] ');
                    SQL.Add('       ,[afProvincia] ');
                    SQL.Add('       ,[Email] ');
                    SQL.Add('       ,[Telefon] ');
                    SQL.Add('       ,[aeNom] ');
                    SQL.Add('       ,[aeCognoms] ');
                    SQL.Add('       ,[aeAdreca1] ');
                    SQL.Add('       ,[aeAdreca2] ');
                    SQL.Add('       ,[aeCP] ');
                    SQL.Add('       ,[aePoblacion] ');
                    SQL.Add('       ,[aeProvincia] ');
                    SQL.Add('       ,[aiNom] ');
                    SQL.Add('       ,[aiCognoms] ');
                    SQL.Add('       ,[aiAdreca1] ');
                    SQL.Add('       ,[aiAdreca2] ');
                    SQL.Add('       ,[aiCP] ');
                    SQL.Add('       ,[aiPoblacion] ');
                    SQL.Add('       ,[aiProvincia] ');
                    SQL.Add('       ,[aiEmail] ');
                    SQL.Add('       ,[aiTelefon] ');
                    {
                    SQL.Add('       ,[OpcioTransport] ');
                    SQL.Add('       ,[ConfirmatClient] ');
                    SQL.Add('       ,[ConfirmatPagament] ');
                    SQL.Add('       ,[PassatProveidors] ');
                    SQL.Add('       ,[ComandaRebuda] ');
                    SQL.Add('       ,[idSeguimentTransportista] ');
                    SQL.Add('       ,[Incidencia] ');
                    SQL.Add('       ,[idIncidencia] ');
                    SQL.Add('       ,[idClient] ');
                    SQL.Add('       ,[idPagament] ');
                    SQL.Add('       ,[BISumaMercaderies] ');
                    SQL.Add('       ,[IVAMercaderies] ');
                    SQL.Add('       ,[TotalMercaderies] ');
                    SQL.Add('       ,[BITransport] ');
                    SQL.Add('       ,[IVATransport] ');
                    SQL.Add('       ,[TotalTransport] ');
                    SQL.Add('       ,[BIPagament] ');
                    SQL.Add('       ,[IVAPagament] ');
                    SQL.Add('       ,[TOTALPagament] ');
                    SQL.Add('       ,[BITotal] ');
                    SQL.Add('       ,[IVATotal] ');
                    SQL.Add('       ,[TotalPagar] ');
                    SQL.Add('       ,[idSessio] ');
                    }
                    SQL.Add('   FROM [masymasbarato].[dbo].[ComandaClient_cap] ');
                    // SQL.Add('  WHERE [idComanda] = ' + IntToStr(idComanda));
                    SQL.Add('  WHERE [idComanda] = :ComandaFacturada ');

                    // PrepareStatement;
                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Param');
                    Parameters.FindParam('ComandaFacturada').Value := idComanda;

                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Open');
                    Open;
                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Opened');
                    Application.ProcessMessages;

                    if (IsEmpty) then
                    begin
                       DMMain.Log('DMSincronizacionTiendaMasYMasBarato.IsEmpty');
                       Error := True;
                       Log('************************************************************');
                       Log(Format(_('No se encuentra el pedido %d asociado a la factura %d.'), [idComanda, idFactura]));
                    end
                    else
                    begin
                       DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Is Not Empty');
                       Log('Datos Comanda (1)');
                       DataComanda := QMSSQL.FieldByName('DataComanda').AsDateTime;
                       Log(Format('DataComanda: %s', [DateTimeToStr(DataComanda)]));
                       afNom := QMSSQL.FieldByName('afNom').AsString;
                       Log(Format('afNom: %s', [afNom]));
                       afCognoms := QMSSQL.FieldByName('afCognoms').AsString;
                       Log(Format('afCognoms: %s', [afCognoms]));
                       afEmpresa := QMSSQL.FieldByName('afEmpresa').AsString;
                       Log(Format('afEmpresa: %s', [afEmpresa]));
                       afNIF := QMSSQL.FieldByName('afNIF').AsString;
                       Log(Format('afNIF: %s', [afNIF]));
                       afAdreca1 := QMSSQL.FieldByName('afAdreca1').AsString;
                       Log(Format('afAdreca1: %s', [afAdreca1]));
                       afAdreca2 := QMSSQL.FieldByName('afAdreca2').AsString;
                       Log(Format('afAdreca2: %s', [afAdreca2]));
                       afCP := QMSSQL.FieldByName('afCP').AsString;
                       Log(Format('afCP: %s', [afCP]));
                       afPoblcacion := QMSSQL.FieldByName('afPoblcacion').AsString;
                       Log(Format('afPoblcacion: %s', [afPoblcacion]));
                       afProvincia := QMSSQL.FieldByName('afProvincia').AsString;
                       Log(Format('afProvincia: %s', [afProvincia]));
                       Email := QMSSQL.FieldByName('Email').AsString;
                       Log(Format('Email: %s', [Email]));
                       Telefon := Trim(QMSSQL.FieldByName('Telefon').AsString);
                       Log(Format('Telefon: %s', [Telefon]));
                       aeNom := QMSSQL.FieldByName('aeNom').AsString;
                       aeCognoms := QMSSQL.FieldByName('aeCognoms').AsString;
                       aeAdreca1 := QMSSQL.FieldByName('aeAdreca1').AsString;
                       aeAdreca2 := QMSSQL.FieldByName('aeAdreca2').AsString;
                       aeCP := QMSSQL.FieldByName('aeCP').AsString;
                       aePoblacion := QMSSQL.FieldByName('aePoblacion').AsString;
                       aeProvincia := QMSSQL.FieldByName('aeProvincia').AsString;
                       aiNom := QMSSQL.FieldByName('aiNom').AsString;
                       aiCognoms := QMSSQL.FieldByName('aiCognoms').AsString;
                       aiAdreca1 := QMSSQL.FieldByName('aiAdreca1').AsString;
                       aiAdreca2 := QMSSQL.FieldByName('aiAdreca2').AsString;
                       aiCP := QMSSQL.FieldByName('aiCP').AsString;
                       aiPoblacion := QMSSQL.FieldByName('aiPoblacion').AsString;
                       aiProvincia := QMSSQL.FieldByName('aiProvincia').AsString;
                       aiEmail := QMSSQL.FieldByName('aiEmail').AsString;
                       aiTelefon := Trim(QMSSQL.FieldByName('aiTelefon').AsString);
                       {
                       OpcioTransport := QMSSQL.FieldByName('OpcioTransport').AsInteger;
                       ConfirmatClient := QMSSQL.FieldByName('ConfirmatClient').AsInteger;
                       ConfirmatPagament := QMSSQL.FieldByName('ConfirmatPagament').AsInteger;
                       PassatProveidors := QMSSQL.FieldByName('PassatProveidors').AsInteger;
                       ComandaRebuda := QMSSQL.FieldByName('ComandaRebuda').AsInteger;
                       idSeguimentTransportista := QMSSQL.FieldByName('idSeguimentTransportista').AsString;
                       Incidencia := QMSSQL.FieldByName('Incidencia').AsInteger;
                       idIncidencia := QMSSQL.FieldByName('idIncidencia').AsInteger;
                       idClient := QMSSQL.FieldByName('idClient').AsInteger;
                       Log(Format('idClient: %d', [idClient]));
                       idPagament := QMSSQL.FieldByName('idPagament').AsInteger;
                       BISumaMercaderies := QMSSQL.FieldByName('BISumaMercaderies').AsFloat;
                       Log(Format('BISumaMercaderies: %10.2f', [BISumaMercaderies]));
                       IVAMercaderies := QMSSQL.FieldByName('IVAMercaderies').AsFloat;
                       Log(Format('IVAMercaderies: %10.2f', [IVAMercaderies]));
                       TotalMercaderies := QMSSQL.FieldByName('TotalMercaderies').AsFloat;
                       Log(Format('TotalMercaderies: %10.2f', [TotalMercaderies]));
                       BITransport := QMSSQL.FieldByName('BITransport').AsFloat;
                       Log(Format('BITransport: %10.2f', [BITransport]));
                       IVATransport := QMSSQL.FieldByName('IVATransport').AsFloat;
                       Log(Format('IVATransport: %10.2f', [IVATransport]));
                       TotalTransport := QMSSQL.FieldByName('TotalTransport').AsFloat;
                       Log(Format('TotalTransport: %10.2f', [TotalTransport]));
                       BIPagament := QMSSQL.FieldByName('BIPagament').AsFloat;
                       Log(Format('BIPagament: %10.2f', [BIPagament]));
                       IVAPagament := QMSSQL.FieldByName('IVAPagament').AsFloat;
                       Log(Format('IVAPagament: %10.2f', [IVAPagament]));
                       TOTALPagament := QMSSQL.FieldByName('TOTALPagament').AsFloat;
                       Log(Format('TOTALPagament: %10.2f', [TOTALPagament]));
                       BITotal := QMSSQL.FieldByName('BITotal').AsFloat;
                       Log(Format('BITotal: %10.2f', [BITotal]));
                       IVATotal := QMSSQL.FieldByName('IVATotal').AsFloat;
                       Log(Format('IVATotal: %10.2f', [IVATotal]));
                       TotalPagar := QMSSQL.FieldByName('TotalPagar').AsFloat;
                       Log(Format('TotalPagar: %10.2f', [TotalPagar]));
                       idSessio := QMSSQL.FieldByName('idSessio').AsString;
                       Log(Format('idSessio: %s', [idSessio]));
                       }
                    end;
                 except
                    on e: Exception do
                    begin
                       Error := True;
                       Log('************************************************************');
                       Log(Format(_('(4) Error al obtener datos de la Factura %d'), [idFactura]) + #13#10 + e.Message);
                    end;
                 end;
              end;

              // Parte 2
              with QMSSQL do
              begin
                 try
                    Connection := MSSQLConnection;

                    if (Active) then
                       Close;

                    SQL.Clear;
                    {
                    SQL.Add(' SELECT [DataComanda] ');
                    SQL.Add('       ,[afNom] ');
                    SQL.Add('       ,[afCognoms] ');
                    SQL.Add('       ,[afEmpresa] ');
                    SQL.Add('       ,[afNIF] ');
                    SQL.Add('       ,[afAdreca1] ');
                    SQL.Add('       ,[afAdreca2] ');
                    SQL.Add('       ,[afCP] ');
                    SQL.Add('       ,[afPoblcacion] ');
                    SQL.Add('       ,[afProvincia] ');
                    SQL.Add('       ,[Email] ');
                    SQL.Add('       ,[Telefon] ');
                    SQL.Add('       ,[aeNom] ');
                    SQL.Add('       ,[aeCognoms] ');
                    SQL.Add('       ,[aeAdreca1] ');
                    SQL.Add('       ,[aeAdreca2] ');
                    SQL.Add('       ,[aeCP] ');
                    SQL.Add('       ,[aePoblacion] ');
                    SQL.Add('       ,[aeProvincia] ');
                    SQL.Add('       ,[aiNom] ');
                    SQL.Add('       ,[aiCognoms] ');
                    SQL.Add('       ,[aiAdreca1] ');
                    SQL.Add('       ,[aiAdreca2] ');
                    SQL.Add('       ,[aiCP] ');
                    SQL.Add('       ,[aiPoblacion] ');
                    SQL.Add('       ,[aiProvincia] ');
                    SQL.Add('       ,[aiEmail] ');
                    SQL.Add('       ,[aiTelefon] ');
                    }
                    SQL.Add(' SELECT [OpcioTransport] ');
                    SQL.Add('       ,[ConfirmatClient] ');
                    SQL.Add('       ,[ConfirmatPagament] ');
                    SQL.Add('       ,[PassatProveidors] ');
                    SQL.Add('       ,[ComandaRebuda] ');
                    SQL.Add('       ,[idSeguimentTransportista] ');
                    SQL.Add('       ,[Incidencia] ');
                    SQL.Add('       ,[idIncidencia] ');
                    SQL.Add('       ,[idClient] ');
                    SQL.Add('       ,[idPagament] ');
                    SQL.Add('       ,[BISumaMercaderies] ');
                    SQL.Add('       ,[IVAMercaderies] ');
                    SQL.Add('       ,[TotalMercaderies] ');
                    SQL.Add('       ,[BITransport] ');
                    SQL.Add('       ,[IVATransport] ');
                    SQL.Add('       ,[TotalTransport] ');
                    SQL.Add('       ,[BIPagament] ');
                    SQL.Add('       ,[IVAPagament] ');
                    SQL.Add('       ,[TOTALPagament] ');
                    SQL.Add('       ,[BITotal] ');
                    SQL.Add('       ,[IVATotal] ');
                    SQL.Add('       ,[TotalPagar] ');
                    SQL.Add('       ,[idSessio] ');
                    SQL.Add('   FROM [masymasbarato].[dbo].[ComandaClient_cap] ');
                    // SQL.Add('  WHERE [idComanda] = ' + IntToStr(idComanda));
                    SQL.Add('  WHERE [idComanda] = :ComandaFacturada ');

                    // PrepareStatement;
                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Param');
                    Parameters.FindParam('ComandaFacturada').Value := idComanda;

                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Open');
                    Open;
                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Opened');
                    Application.ProcessMessages;

                    if (IsEmpty) then
                    begin
                       DMMain.Log('DMSincronizacionTiendaMasYMasBarato.IsEmpty');
                       Error := True;
                       Log('************************************************************');
                       Log(Format(_('No se encuentra el pedido %d asociado a la factura %d.'), [idComanda, idFactura]));
                    end
                    else
                    begin
                       DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Is Not Empty');
                       Log('Datos Comanda (2)');
                       {
                       DataComanda := QMSSQL.FieldByName('DataComanda').AsDateTime;
                       Log(Format('DataComanda: %s', [DateTimeToStr(DataComanda)]));
                       afNom := QMSSQL.FieldByName('afNom').AsString;
                       Log(Format('afNom: %s', [afNom]));
                       afCognoms := QMSSQL.FieldByName('afCognoms').AsString;
                       Log(Format('afCognoms: %s', [afCognoms]));
                       afEmpresa := QMSSQL.FieldByName('afEmpresa').AsString;
                       Log(Format('afEmpresa: %s', [afEmpresa]));
                       afNIF := QMSSQL.FieldByName('afNIF').AsString;
                       Log(Format('afNIF: %s', [afNIF]));
                       afAdreca1 := QMSSQL.FieldByName('afAdreca1').AsString;
                       Log(Format('afAdreca1: %s', [afAdreca1]));
                       afAdreca2 := QMSSQL.FieldByName('afAdreca2').AsString;
                       Log(Format('afAdreca2: %s', [afAdreca2]));
                       afCP := QMSSQL.FieldByName('afCP').AsString;
                       Log(Format('afCP: %s', [afCP]));
                       afPoblcacion := QMSSQL.FieldByName('afPoblcacion').AsString;
                       Log(Format('afPoblcacion: %s', [afPoblcacion]));
                       afProvincia := QMSSQL.FieldByName('afProvincia').AsString;
                       Log(Format('afProvincia: %s', [afProvincia]));
                       Email := QMSSQL.FieldByName('Email').AsString;
                       Log(Format('Email: %s', [Email]));
                       Telefon := Trim(QMSSQL.FieldByName('Telefon').AsString);
                       Log(Format('Telefon: %s', [Telefon]));
                       aeNom := QMSSQL.FieldByName('aeNom').AsString;
                       aeCognoms := QMSSQL.FieldByName('aeCognoms').AsString;
                       aeAdreca1 := QMSSQL.FieldByName('aeAdreca1').AsString;
                       aeAdreca2 := QMSSQL.FieldByName('aeAdreca2').AsString;
                       aeCP := QMSSQL.FieldByName('aeCP').AsString;
                       aePoblacion := QMSSQL.FieldByName('aePoblacion').AsString;
                       aeProvincia := QMSSQL.FieldByName('aeProvincia').AsString;
                       aiNom := QMSSQL.FieldByName('aiNom').AsString;
                       aiCognoms := QMSSQL.FieldByName('aiCognoms').AsString;
                       aiAdreca1 := QMSSQL.FieldByName('aiAdreca1').AsString;
                       aiAdreca2 := QMSSQL.FieldByName('aiAdreca2').AsString;
                       aiCP := QMSSQL.FieldByName('aiCP').AsString;
                       aiPoblacion := QMSSQL.FieldByName('aiPoblacion').AsString;
                       aiProvincia := QMSSQL.FieldByName('aiProvincia').AsString;
                       aiEmail := QMSSQL.FieldByName('aiEmail').AsString;
                       aiTelefon := Trim(QMSSQL.FieldByName('aiTelefon').AsString);
                       }
                       OpcioTransport := QMSSQL.FieldByName('OpcioTransport').AsInteger;
                       ConfirmatClient := QMSSQL.FieldByName('ConfirmatClient').AsInteger;
                       ConfirmatPagament := QMSSQL.FieldByName('ConfirmatPagament').AsInteger;
                       PassatProveidors := QMSSQL.FieldByName('PassatProveidors').AsInteger;
                       ComandaRebuda := QMSSQL.FieldByName('ComandaRebuda').AsInteger;
                       idSeguimentTransportista := QMSSQL.FieldByName('idSeguimentTransportista').AsString;
                       Incidencia := QMSSQL.FieldByName('Incidencia').AsInteger;
                       idIncidencia := QMSSQL.FieldByName('idIncidencia').AsInteger;
                       idClient := QMSSQL.FieldByName('idClient').AsInteger;
                       Log(Format('idClient: %d', [idClient]));
                       idPagament := QMSSQL.FieldByName('idPagament').AsInteger;
                       BISumaMercaderies := QMSSQL.FieldByName('BISumaMercaderies').AsFloat;
                       Log(Format('BISumaMercaderies: %10.2f', [BISumaMercaderies]));
                       IVAMercaderies := QMSSQL.FieldByName('IVAMercaderies').AsFloat;
                       Log(Format('IVAMercaderies: %10.2f', [IVAMercaderies]));
                       TotalMercaderies := QMSSQL.FieldByName('TotalMercaderies').AsFloat;
                       Log(Format('TotalMercaderies: %10.2f', [TotalMercaderies]));
                       BITransport := QMSSQL.FieldByName('BITransport').AsFloat;
                       Log(Format('BITransport: %10.2f', [BITransport]));
                       IVATransport := QMSSQL.FieldByName('IVATransport').AsFloat;
                       Log(Format('IVATransport: %10.2f', [IVATransport]));
                       TotalTransport := QMSSQL.FieldByName('TotalTransport').AsFloat;
                       Log(Format('TotalTransport: %10.2f', [TotalTransport]));
                       BIPagament := QMSSQL.FieldByName('BIPagament').AsFloat;
                       Log(Format('BIPagament: %10.2f', [BIPagament]));
                       IVAPagament := QMSSQL.FieldByName('IVAPagament').AsFloat;
                       Log(Format('IVAPagament: %10.2f', [IVAPagament]));
                       TOTALPagament := QMSSQL.FieldByName('TOTALPagament').AsFloat;
                       Log(Format('TOTALPagament: %10.2f', [TOTALPagament]));
                       BITotal := QMSSQL.FieldByName('BITotal').AsFloat;
                       Log(Format('BITotal: %10.2f', [BITotal]));
                       IVATotal := QMSSQL.FieldByName('IVATotal').AsFloat;
                       Log(Format('IVATotal: %10.2f', [IVATotal]));
                       TotalPagar := QMSSQL.FieldByName('TotalPagar').AsFloat;
                       Log(Format('TotalPagar: %10.2f', [TotalPagar]));
                       idSessio := QMSSQL.FieldByName('idSessio').AsString;
                       Log(Format('idSessio: %s', [idSessio]));
                    end;
                 except
                    on e: Exception do
                    begin
                       Error := True;
                       Log('************************************************************');
                       Log(Format(_('(4) Error al obtener datos de la Factura %d'), [idFactura]) + #13#10 + e.Message);
                    end;
                 end;
              end;

              if (not Error) then
              begin
                 Tercero := -1;
                 // Cliente := -1;
                 Direccion := 1;
                 Tarifa := '';
                 Transportista := 0;
                 Ejercicio := YearOf(Data);

                 // Debo verificar si el cliente existe segun el NIF

                 // Limpio el NIF
                 NIF := '';
                 for i := 1 to Length(afNIF) do
                    if (afNIF[i] in ['A'..'Z', 'a'..'z', '0'..'9']) then
                       NIF := NIF + UpperCase(afNIF[i]);

                 if (NIF = '') then
                 begin
                    if (idClient > 0) then
                       NIF := 'WEB' + Ajusta(IntToStr(idClient), 'I', 10, '0')
                    else
                       NIF := 'WEB' + Telefon;

                    // Quito caracteres que no se aceptan
                    s := NIF;
                    NIF := '';
                    for i := 1 to Length(s) do
                       if (s[i] in ['A'..'Z', 'a'..'z', '0'..'9']) then
                          NIF := NIF + UpperCase(s[i]);

                    Log(Format(_('Ejercicio %d'), [Ejercicio]));
                    Log(Format(_('NIF (Limpio) %s'), [NIF]));
                 end;

                 // Si el NIF contiene algo busco un cliente. De lo contrario se utilizará "Terceros Varios"
                 if (NIF <> '') then
                 begin
                    // Busco un tercero con ese NIF
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'SELECT TERCERO FROM SYS_TERCEROS WHERE NIF = :NIF';
                          Params.ByName['NIF'].AsString := NIF;
                          ExecQuery;
                          Tercero := FieldByName['TERCERO'].AsInteger;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end;

                 // Si no existe lo creo
                 if (Tercero = 0) then
                 begin
                    // Averiguo DIR_LOCALIDAD en base al codigo postal, la ciudad y el pais
                    // El pais no viene indicado, por lo que suponemos España
                    {
                    Pais := DamePais(afPais?);
                    if (Pais = '') then
                       dir_localidad := '99999999'
                    else
                    begin
                    }
                    // Busco una coincidencia total
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE (PAIS=:PAIS AND CODIGO_POSTAL=:CODIGO_POSTAL AND TITULO=:TITULO) OR LOCALIDAD=''99999999'' ORDER BY LOCALIDAD');
                          Params.ByName['PAIS'].AsString := REntorno.Pais;
                          Params.ByName['CODIGO_POSTAL'].AsString := Copy(afCP, 1, 10);
                          Params.ByName['TITULO'].AsString := Copy(UpperCase(afPoblcacion), 1, 40);
                          ExecQuery;
                          dir_localidad := FieldByName['LOCALIDAD'].AsString;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                    // Si no encuentro, busco coincidencia de pais y codigo postal
                    if (dir_localidad = '99999999') then
                    begin
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE (PAIS=:PAIS AND CODIGO_POSTAL=:CODIGO_POSTAL) OR LOCALIDAD=''99999999'' ORDER BY LOCALIDAD');
                             Params.ByName['PAIS'].AsString := REntorno.Pais;
                             Params.ByName['CODIGO_POSTAL'].AsString := Copy(afCP, 1, 10);
                             ExecQuery;
                             dir_localidad := FieldByName['LOCALIDAD'].AsString;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;
                    end;
                    // Si no encuentro, busco coincidencia de pais y los dos primeros digitos del codigo postal (Provincia en el caso de España)
                    if (REntorno.Pais = 'ESP') then
                    begin
                       if (dir_localidad = '99999999') then
                       begin
                          Q := THYFIBQuery.Create(nil);
                          try
                             with Q do
                             begin
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE (PAIS=:PAIS AND CODIGO_POSTAL STARTING WITH :CODIGO_POSTAL) OR LOCALIDAD=''99999999'' ORDER BY LOCALIDAD');
                                Params.ByName['PAIS'].AsString := REntorno.Pais;
                                Params.ByName['CODIGO_POSTAL'].AsString := Copy(afCP, 1, 2);
                                ExecQuery;
                                dir_localidad := FieldByName['LOCALIDAD'].AsString;
                                FreeHandle;
                             end;
                          finally
                             FreeAndNil(Q);
                          end;
                       end;
                    end;
                    // Si no encuentro, busco coincidencia de pais
                    if (dir_localidad = '99999999') then
                    begin
                       Q := THYFIBQuery.Create(nil);
                       try
                          with Q do
                          begin
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add('SELECT LOCALIDAD FROM SYS_LOCALIDADES WHERE (PAIS=:PAIS) OR LOCALIDAD=''99999999'' ORDER BY LOCALIDAD');
                             Params.ByName['PAIS'].AsString := REntorno.Pais;
                             ExecQuery;
                             dir_localidad := FieldByName['LOCALIDAD'].AsString;
                             FreeHandle;
                          end;
                       finally
                          FreeAndNil(Q);
                       end;
                    end;
                    // end;

                    // Inserto el tercero
                    Tercero := DMMain.ContadorGen('CONTA_TERCEROS');
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO VER_TERCEROS_EDICION ');
                          SQL.Add(' (TERCERO, NOMBRE_R_SOCIAL, NIF, EMAIL, TIPO_RAZON, DIR_DEFECTO, NOTAS, ');
                          SQL.Add(' DIR_LOCALIDAD, DIR_NOMBRE, DIR_NOMBRE_2, TELEFONO01, CODIGO_POSTAL ) ');
                          SQL.Add(' VALUES ');
                          SQL.Add(' (:TERCERO, :NOMBRE_R_SOCIAL, :NIF, :EMAIL, :TIPO_RAZON, :DIR_DEFECTO, :NOTAS, ');
                          SQL.Add(' :DIR_LOCALIDAD, :DIR_NOMBRE, :DIR_NOMBRE_2, :TELEFONO01, :CODIGO_POSTAL) ');
                          Params.ByName['TERCERO'].AsInteger := Tercero;
                          if (afEmpresa > '') then
                             Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(afEmpresa, 1, 60)
                          else
                             Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(afNom + ' ' + afCognoms, 1, 60);
                          if (Trim(Params.ByName['NOMBRE_R_SOCIAL'].AsString) = '') then
                             Params.ByName['NOMBRE_R_SOCIAL'].AsString := _('SIN NOMBRE');
                          Params.ByName['NIF'].AsString := NIF;
                          Params.ByName['TIPO_RAZON'].AsString := 'DE';
                          Params.ByName['EMAIL'].AsString := Email;
                          Params.ByName['DIR_DEFECTO'].AsInteger := 1;
                          Params.ByName['DIR_LOCALIDAD'].AsString := dir_localidad;
                          Params.ByName['DIR_NOMBRE'].AsString := afAdreca1;
                          Params.ByName['DIR_NOMBRE_2'].AsString := afAdreca2;
                          Params.ByName['TELEFONO01'].AsString := Telefon;
                          Params.ByName['CODIGO_POSTAL'].AsString := afCP;
                          Params.ByName['NOTAS'].AsString := afEmpresa + #13#10 + afNom + ' ' + afCognoms + #13#10 + afAdreca1 + #13#10 + afAdreca2 + #13#10 + afCP + ' ' + afPoblcacion + #13#10 + afProvincia + #13#10 + Email + #13#10 + Telefon;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                    Log(Format(_('Tercero creado %d'), [Tercero]));
                 end;

                 // Busco un cliente con ese tercero
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT CLIENTE FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND TERCERO = :TERCERO ORDER BY CLIENTE DESC';
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['TERCERO'].AsInteger := Tercero;
                       ExecQuery;
                       Cliente := FieldByName['CLIENTE'].AsInteger;
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;

                 // Si no existe el cliente lo creo
                 if (Cliente = 0) then
                 begin
                    // Datos por defecto para insertar clientes
                    CtaDtoPP := DMMain.DameCuentaGestion(15, 1, REntorno.Empresa);
                    PaisC2 := DamePaisC2(REntorno.Pais);
                    Cliente := DMMain.Contador_E('XCL');
                    Cuenta := ExpandirCadena(DMMain.DameSemillaCuentaGestion(SemClientes, 1) + IntToStr(Cliente), REntorno.DigitosSub);
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add('INSERT INTO VER_CLIENTES_CUENTAS ');
                          SQL.Add('(EMPRESA, EJERCICIO, CANAL, CLIENTE, TERCERO, PAIS, PAIS_C2, TARIFA, AGENTE, CUENTA, FORMA_PAGO, CUENTA_DTOPP, PERFIL, CODIGO_INCOTERM, MODO_IVA, TIPO, NOTAS) ');
                          SQL.Add('VALUES ');
                          SQL.Add('(:EMPRESA, :EJERCICIO, :CANAL, :CLIENTE, :TERCERO, :PAIS, :PAIS_C2, :TARIFA, :AGENTE, :CUENTA, :FORMA_PAGO, :CUENTA_DTOPP, :PERFIL, :CODIGO_INCOTERM, :MODO_IVA, :TIPO, :NOTAS) ');
                          Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                          Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                          Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                          Params.ByName['CLIENTE'].AsInteger := Cliente;
                          Params.ByName['TERCERO'].AsInteger := Tercero;
                          Params.ByName['PAIS'].AsString := REntorno.Pais;
                          Params.ByName['PAIS_C2'].AsString := PaisC2;
                          Params.ByName['TARIFA'].AsString := REntorno.TarifaDefecto;
                          Params.ByName['AGENTE'].AsInteger := QMConfiguracionAGENTE.AsInteger;
                          Params.ByName['CUENTA'].AsString := Cuenta;
                          Params.ByName['FORMA_PAGO'].AsString := QMConfiguracionFORMA_PAGO.AsString;
                          Params.ByName['CUENTA_DTOPP'].AsString := CtaDtoPP;
                          Params.ByName['PERFIL'].AsString := REntorno.Perfil;
                          Params.ByName['CODIGO_INCOTERM'].AsString := 'EXW';
                          Params.ByName['MODO_IVA'].AsInteger := ModoIVACanal;
                          Params.ByName['TIPO'].AsInteger := 1;
                          Params.ByName['NOTAS'].AsString := 'ID Web' + IntToStr(idClient) + #13#10 + afEmpresa + #13#10 + afNom + ' ' + afCognoms + #13#10 + afAdreca1 + #13#10 + afAdreca2 + #13#10 + afCP + ' ' + afPoblcacion + #13#10 + afProvincia + #13#10 + Email + #13#10 + Telefon;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                    Log(Format(_('Cliente creado %d/%d'), [Ejercicio, Cliente]));
                 end;

                 // Busco los datos del cliente en el ejercicio
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT FIRST 1 EJERCICIO, CUENTA FROM CON_CUENTAS_GES_CLI WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL AND CLIENTE = :CLIENTE ORDER BY EJERCICIO DESC';
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                       Params.ByName['CLIENTE'].AsInteger := Cliente;
                       ExecQuery;
                       EjercicioCliente := FieldByName['EJERCICIO'].AsInteger;
                       Cuenta := FieldByName['CUENTA'].AsString;
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;

                 // Si no existe el cliente creo una cuenta
                 // Si existe en otro ejercicio, copio la cuenta
                 if (Ejercicio < Ejercicio) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO CON_CUENTAS_GES_CLI ( ');
                          SQL.Add(' EMPRESA, EJERCICIO, CANAL, CLIENTE, CUENTA, TIPO_IRPF, PAIS, FORMA_PAGO, CUENTA_DTOPP) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :CLIENTE, :CUENTA, :TIPO_IRPF, :PAIS, :FORMA_PAGO, :CUENTA_DTOPP) ');
                          Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                          Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                          Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                          Params.ByName['CLIENTE'].AsInteger := Cliente;
                          if (EjercicioCliente = 0) then
                             Params.ByName['CUENTA'].AsString := ExpandirCadena(DMMain.DameSemillaCuentaGestion(SemClientes, 1) + '.' + IntToStr(Cliente))
                          else
                             Params.ByName['CUENTA'].AsString := Cuenta;
                          Params.ByName['TIPO_IRPF'].AsInteger := DMMain.DameMinIRPF;
                          Params.ByName['PAIS'].AsString := REntorno.Pais;
                          Params.ByName['FORMA_PAGO'].AsString := QMConfiguracionFORMA_PAGO.AsString;
                          Params.ByName['CUENTA_DTOPP'].AsString := DMMain.DameCuentaGestion(15, 1);
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                    Log(Format(_('Cuenta de Cliente %d creada en el ejercicio %d'), [Cliente, Ejercicio]));
                 end;

                 // Creo la cabecera del pedido
                 DMMain.Log(_('Creo Cabecera de Pedido'));

                 // Tarifa del cliente
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT TARIFA, TRANSPORTISTA FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['CLIENTE'].AsInteger := Cliente;
                       ExecQuery;
                       Tarifa := FieldByName['TARIFA'].AsString;
                       Transportista := FieldByName['TRANSPORTISTA'].AsInteger;
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;

                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT IVA_INCLUIDO FROM ART_TARIFAS_C WHERE EMPRESA = :EMPRESA AND TARIFA = :TARIFA';
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['TARIFA'].AsString := Tarifa;
                       ExecQuery;
                       TarifaIvaIncluido := (FieldByName['IVA_INCLUIDO'].AsInteger = 1);
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;

                 id_s := DMMain.ContadorGen('ID_GES_CABECERAS_S');
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Clear;
                       SQL.Add(' INSERT INTO VER_CABECERAS_FACTURA ');
                       SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, FECHA, ');
                       SQL.Add(' ALMACEN, CLIENTE, DIRECCION, ENTRADA, ID_S, SU_REFERENCIA, TARIFA, ');
                       SQL.Add(' TIPO_PORTES, I_PORTES, TRANSPORTISTA)');
                       SQL.Add(' VALUES ');
                       SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :FECHA, ');
                       SQL.Add(' :ALMACEN, :CLIENTE, :DIRECCION, :ENTRADA, :ID_S, :SU_REFERENCIA, :TARIFA, ');
                       SQL.Add(' :TIPO_PORTES, :I_PORTES, :TRANSPORTISTA)');
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                       Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                       Params.ByName['SERIE'].AsString := Serie;
                       Params.ByName['TIPO'].AsString := 'FAC';
                       Params.ByName['RIG'].AsInteger := 0;
                       Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
                       Params.ByName['ALMACEN'].AsString := Almacen;
                       Params.ByName['CLIENTE'].AsInteger := Cliente;
                       Params.ByName['DIRECCION'].AsInteger := Direccion;
                       Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                       Params.ByName['SU_REFERENCIA'].AsString := Format(_('Factura: %d'), [idFactura]);
                       Params.ByName['ID_S'].AsInteger := id_s;
                       Params.ByName['TARIFA'].AsString := Tarifa;
                       Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
                       // Params.ByName['CONTACTO'].AsInteger := Contacto;
                       Params.ByName['TIPO_PORTES'].AsInteger := 0;
                       Params.ByName['I_PORTES'].AsFloat := 0;

                       ExecQuery;
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;

                 // Obtengo RIG para poder hacer los inserts en el detalle y la tarifa para ver si es IVA incluido o no
                 Q := THYFIBQuery.Create(nil);
                 try
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Clear;
                       SQL.Text := 'SELECT ESTADO, RIG FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
                       Params.ByName['ID_S'].AsInteger := id_s;
                       ExecQuery;
                       RIG := FieldByName['RIG'].AsInteger;
                       Estado := FieldByName['ESTADO'].AsInteger;
                       FreeHandle;
                    end;
                 finally
                    FreeAndNil(Q);
                 end;
                 Log(Format(_('Cabecera de Factura creada en %d-%s/%d. (id %d)'), [Ejercicio, Serie, RIG, id_s]));

                 if (Cliente < 0) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Clear;
                          SQL.Add(' INSERT INTO GES_CABECERAS_S_FAC_NIF ( ');
                          SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, NOMBRE, NIF, DIRECCION, C_POSTAL, PROVINCIA, ID_S, PAIS, LOCALIDAD, ');
                          SQL.Add('  TELEFONO01, TELEFONO02, TELEFAX, EMAIL, NOTAS, COLONIA) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :NOMBRE, :NIF, :DIRECCION, :C_POSTAL, :PROVINCIA, :ID_S, :PAIS, :LOCALIDAD, ');
                          SQL.Add('  :TELEFONO01, :TELEFONO02, :TELEFAX, :EMAIL, :NOTAS, :COLONIA) ');
                          Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                          Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                          Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                          Params.ByName['SERIE'].AsString := Serie;
                          Params.ByName['TIPO'].AsString := 'FAC';
                          Params.ByName['RIG'].AsInteger := RIG;
                          Params.ByName['ID_S'].AsInteger := id_s;
                          if (afEmpresa > '') then
                             Params.ByName['NOMBRE'].AsString := Copy(afEmpresa, 1, 60)
                          else
                             Params.ByName['NOMBRE'].AsString := Copy(afNom + ' ' + afCognoms, 1, 60);
                          Params.ByName['NIF'].AsString := NIF;
                          Params.ByName['DIRECCION'].AsString := Copy(afAdreca1 + ' ' + afAdreca2, 1, 100);
                          Params.ByName['C_POSTAL'].AsString := afCP;
                          Params.ByName['PROVINCIA'].AsString := Copy(afProvincia, 1, 40);
                          Params.ByName['PAIS'].AsString := REntorno.Pais;
                          Params.ByName['LOCALIDAD'].AsString := Copy(afPoblcacion, 1, 40);
                          Params.ByName['TELEFONO01'].AsString := Telefon;
                          Params.ByName['TELEFONO02'].AsString := '';
                          Params.ByName['TELEFAX'].AsString := '';
                          Params.ByName['EMAIL'].AsString := Copy(Email, 1, 100);
                          Params.ByName['NOTAS'].AsString := afEmpresa + #13#10 + afNom + ' ' + afCognoms + #13#10 + afAdreca1 + #13#10 + afAdreca2 + #13#10 + afCP + ' ' + afPoblcacion + #13#10 + afProvincia + #13#10 + Email + #13#10 + Telefon;
                          Params.ByName['COLONIA'].AsString := '';

                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;
                 end;

                 // Creo la lineas de pedido
                 DMMain.Log(_('Creo Lineas de Pedido'));
                 with QMSSQL do
                 begin
                    try
                       Connection := MSSQLConnection;
                       if (Active) then
                          Close;
                       SQL.Clear;
                       SQL.Add(' SELECT [TipusLinia] ');
                       SQL.Add('       ,[proveidor] ');
                       SQL.Add('       ,[producto_num] ');
                       SQL.Add('       ,[nombre] ');
                       // SQL.Add('       ,[descripcion] *** Falta agregar. Lo agregará dentro de poco. ');
                       // SQL.Add('       ,[cod_categoria_1] *** Falta agregar. Lo agregará dentro de poco. ');
                       SQL.Add('       ,[ean] ');
                       SQL.Add('       ,[portes] ');
                       SQL.Add('       ,[unidades] ');
                       SQL.Add('       ,[coste] ');
                       SQL.Add('       ,[venta] ');
                       SQL.Add('   FROM [masymasbarato].[dbo].[ComandaClient_lin] ');
                       SQL.Add('  WHERE [idComanda] = :ComandaFacturada ');
                       SQL.Add(' ORDER BY [TipusLinia] ');

                       // PrepareStatement;
                       Parameters.FindParam('ComandaFacturada').Value := idComanda;

                       Open;

                       if (IsEmpty) then
                       begin
                          Error := True;
                          Log('************************************************************');
                          Log(Format(_('La factura %d no tiene lineas.'), [idComanda]));
                       end
                       else
                       begin
                          while not QMSSQL.EOF do
                          begin
                             Log('Datos de la linea de pedido');
                             Log('--------------------------------------------------');
                             TipusLinia := QMSSQL.FieldByName('TipusLinia').AsInteger;
                             Log(Format('TipusLinia: %d', [TipusLinia]));
                             DMMain.Log(Format('TipusLinia: %d', [TipusLinia]));
                             proveidor := QMSSQL.FieldByName('proveidor').AsFloat;
                             Log(Format('proveidor: %f', [proveidor]));
                             producto_num := QMSSQL.FieldByName('producto_num').AsString;
                             Log(Format('producto_num: %s', [producto_num]));
                             nombre := QMSSQL.FieldByName('nombre').AsString;
                             Log(Format('nombre: %s', [nombre]));
                             // descripcion := QMSSQL.FieldByName('descripcion').AsString;
                             // cod_categoria_1 := QMSSQL.FieldByName('cod_categoria_1').AsString;
                             ean := QMSSQL.FieldByName('ean').AsString;
                             Log(Format('ean: %s', [ean]));
                             portes := QMSSQL.FieldByName('portes').AsFloat;
                             Log(Format('portes: %.f', [portes]));
                             unidades := QMSSQL.FieldByName('unidades').AsInteger;
                             Log(Format('unidades: %d', [unidades]));
                             coste := QMSSQL.FieldByName('coste').AsFloat;
                             Log(Format('coste: %f', [coste]));
                             venta := QMSSQL.FieldByName('venta').AsFloat;
                             Log(Format('venta: %f', [venta]));

                             case TipusLinia of
                                1:
                                begin
                                   {
                                   En el caso de ([TipusLinia] = 1) creo el artículo si no existe (código [producto_num]).
                                   [proveidor] va a piñon. 1=Carrera, 2=Viser
                                   [cod_categoria_1] se relaciona con la tabla [Categoria].[cod_categoria_1]
                                   [portes] es el transportista
                                   }

                                   QProducto := TADOQuery.Create(nil);
                                   try
                                      with QProducto do
                                      begin
                                         Connection := MSSQLConnection;
                                         SQL.Clear;
                                         SQL.Add(' SELECT [ArticulosCategorias].[nombre] ');
                                         SQL.Add('       ,[ArticulosCategorias].[cod_categoria_1] ');
                                         SQL.Add('       ,[Categoria].[categoria_1] ');
                                         SQL.Add('       ,[ArticulosCategorias].[cod_categoria_2] ');
                                         SQL.Add('       ,[ArticulosCategorias].[ean] ');
                                         SQL.Add('       ,[ArticulosCategorias].[coste] ');
                                         SQL.Add('   FROM [masymasbarato].[dbo].[ArticulosCategorias] ');
                                         SQL.Add('   JOIN [masymasbarato].[dbo].[Categoria] ');
                                         SQL.Add('   ON [Categoria].[cod_categoria_1] = [ArticulosCategorias].[cod_categoria_1] ');
                                         SQL.Add('   WHERE [ArticulosCategorias].[producto_num] = :producto_num ');

                                         // PrepareStatement;
                                         Parameters.FindParam('producto_num').Value := producto_num;

                                         Open;

                                         if (QProducto.IsEmpty) then
                                         begin
                                            Log('************************************************************');
                                            Log(Format(_('No se encuentra el producto %s'), [producto_num]));
                                            Error := True;
                                         end
                                         else
                                         begin
                                            Log('Datos del producto');
                                            Log('--------------------------------------------------');
                                            // codigo_mayorista := Copy(FieldByName('codigo_mayorista').AsString, 1, 15);
                                            // Log(Format('codigo_mayorista: %s', [codigo_mayorista]));
                                            nombre_producto := Copy(FieldByName('nombre').AsString, 1, 60);
                                            Log(Format('nombre_producto: %s', [nombre_producto]));
                                            // descripcion := FieldByName('descripcion').AsString;
                                            // Log(Format('descripcion: %s', [descripcion]));
                                            cod_categoria_1 := Copy(FieldByName('cod_categoria_1').AsString, 1, 5);
                                            Log(Format('cod_categoria_1: %s', [cod_categoria_1]));
                                            categoria_1 := Copy(FieldByName('categoria_1').AsString, 1, 40);
                                            Log(Format('categoria_1: %s', [categoria_1]));
                                            cod_categoria_2 := FieldByName('cod_categoria_2').AsString;
                                            Log(Format('cod_categoria_2: %s', [cod_categoria_2]));
                                            ean_producto := Copy(FieldByName('ean').AsString, 1, 20);
                                            Log(Format('cod_categoria_2: %s', [cod_categoria_2]));
                                            PCoste := FieldByName('coste').AsFloat;
                                            Log(Format('cod_categoria_2: %f', [PCoste]));
                                            // categoria_2 := Copy(FieldByName('categoria_2').AsString, 1, 40);
                                            // Log(Format('categoria_2: %s', [categoria_2]));
                                            // marca := Copy(FieldByName('marca').AsString, 1, 40);
                                            // Log(Format('marca: %s', [marca]));
                                         end;

                                         Close;
                                      end;
                                   finally
                                      QProducto.Free;
                                   end;

                                   if (not Error) then
                                   begin
                                      // Articulo := codigo_mayorista;
                                      Articulo := producto_num;

                                      if (DameTituloArticulo(Articulo) = '') then
                                      begin
                                         // Creo el articulo
                                         // producto_num := REntorno.ArtTextoLibre;
                                         id_a := DMMain.ContadorGen('ID_ARTICULOS');

                                         // Obtengo la familia o la creo si no existe
                                         if (DMMain.DameTituloFamilia(cod_categoria_1) = '') then
                                         begin
                                            Q := THYFIBQuery.Create(nil);
                                            try
                                               with Q do
                                               begin
                                                  Close;
                                                  DataBase := DMMain.DataBase;
                                                  SQL.Add(' INSERT INTO VER_FAMILIAS_CUENTAS ( ');
                                                  SQL.Add(' EMPRESA, EJERCICIO, CANAL, FAMILIA, TITULO, PAIS, TIPO_IVA, CTA_COMPRAS, CTA_VENTAS, CTA_DEVOLUCION_COMPRAS, ');
                                                  SQL.Add('  CTA_DEVOLUCION_VENTAS, CTA_ABONO_COMPRAS, CTA_ABONO_VENTAS, VENTA, PTO_VERDE, MARGEN, TIPO_REDONDEO, ACT_TAR_AUTOM, ');
                                                  SQL.Add('  WEB) ');
                                                  SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, :FAMILIA, :TITULO, PAIS, TIPO_IVA, CTA_COMPRAS, CTA_VENTAS, CTA_DEVOLUCION_COMPRAS, ');
                                                  SQL.Add('        CTA_DEVOLUCION_VENTAS, CTA_ABONO_COMPRAS, CTA_ABONO_VENTAS, 1, PTO_VERDE, MARGEN, TIPO_REDONDEO, ');
                                                  SQL.Add('        ACT_TAR_AUTOM, 1 ');
                                                  SQL.Add(' FROM VER_FAMILIAS_CUENTAS ');
                                                  SQL.Add(' WHERE ');
                                                  SQL.Add(' EMPRESA = :EMPRESA AND ');
                                                  SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                                                  SQL.Add(' CANAL = :CANAL AND ');
                                                  SQL.Add(' FAMILIA = ''VAR'' ');
                                                  Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                                  Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                                  Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                                  Params.ByName['FAMILIA'].AsString := cod_categoria_1;
                                                  Params.ByName['TITULO'].AsString := categoria_1;
                                                  ExecQuery;
                                                  FreeHandle;
                                               end;
                                            finally
                                               FreeAndNil(Q);
                                            end;
                                         end;
                                         Log(Format(_('Creada la familia %s en el ejercicio %d'), [cod_categoria_1, Ejercicio]));

                                         // Datos por defecto para insertar articulos
                                         Q := THYFIBQuery.Create(nil);
                                         try
                                            with Q do
                                            begin
                                               Close;
                                               DataBase := DMMain.DataBase;
                                               SQL.Add(' SELECT * FROM VER_FAMILIAS_CUENTAS ');
                                               SQL.Add(' WHERE ');
                                               SQL.Add(' EMPRESA = :EMPRESA AND ');
                                               SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                                               SQL.Add(' CANAL = :CANAL AND ');
                                               SQL.Add(' FAMILIA = :FAMILIA ');
                                               Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                               Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                               Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                               Params.ByName['FAMILIA'].AsString := cod_categoria_1;
                                               ExecQuery;
                                               Pais := FieldByName['PAIS'].AsString;
                                               TipoIVAFamilia := FieldByName['TIPO_IVA'].AsInteger;
                                               CtaCompras := FieldByName['CTA_COMPRAS'].AsString;
                                               CtaVentas := FieldByName['CTA_VENTAS'].AsString;
                                               CtaDevolucionCompras := FieldByName['CTA_DEVOLUCION_COMPRAS'].AsString;
                                               CtaDevolucionVentas := FieldByName['CTA_DEVOLUCION_VENTAS'].AsString;
                                               CtaAbonoCompras := FieldByName['CTA_ABONO_COMPRAS'].AsString;
                                               CtaAbonoVentas := FieldByName['CTA_ABONO_VENTAS'].AsString;
                                               FreeHandle;
                                            end;
                                         finally
                                            FreeAndNil(Q);
                                         end;

                                         // Comprar y Vender
                                         Disponibilidad := 1;

                                         Q := THYFIBQuery.Create(nil);
                                         try
                                            with Q do
                                            begin
                                               Close;
                                               DataBase := DMMain.DataBase;
                                               SQL.Add('INSERT INTO VER_ARTICULOS_CUENTAS (EMPRESA,EJERCICIO,CANAL,ARTICULO,TITULO,FAMILIA,PESO, ');
                                               SQL.Add('CTA_COMPRAS,CTA_VENTAS,ENTRADA,PAIS,CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS, ');
                                               SQL.Add('CTA_ABONO_COMPRAS,CTA_ABONO_VENTAS,UNIDADES,CONTROL_STOCK,TIPO_IVA,DISPONIBILIDAD,ID_A,WEB, ');
                                               SQL.Add('ALFA_1,ALFA_2,ALFA_3,ALFA_4,ALFA_5,ALFA_6,P_COSTE,NOTAS) ');
                                               SQL.Add('VALUES (:EMPRESA,:EJERCICIO,:CANAL,:ARTICULO,:TITULO,:FAMILIA,:PESO, ');
                                               SQL.Add(':CTA_COMPRAS,:CTA_VENTAS,:ENTRADA,:PAIS,:CTA_DEVOLUCION_COMPRAS,:CTA_DEVOLUCION_VENTAS, ');
                                               SQL.Add(':CTA_ABONO_COMPRAS,:CTA_ABONO_VENTAS,:UNIDADES,:CONTROL_STOCK,:TIPO_IVA,:DISPONIBILIDAD,:ID_A,:WEB, ');
                                               SQL.Add(':ALFA_1,:ALFA_2,:ALFA_3,:ALFA_4,:ALFA_5,:ALFA_6,:P_COSTE,:NOTAS) ');
                                               Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                               Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                               Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                               Params.ByName['ARTICULO'].AsString := Articulo;
                                               Params.ByName['TITULO'].AsString := nombre_producto;
                                               Params.ByName['FAMILIA'].AsString := cod_categoria_1;
                                               Params.ByName['P_COSTE'].AsFloat := PCoste;
                                               Params.ByName['PESO'].AsFloat := 0;
                                               Params.ByName['CTA_COMPRAS'].AsString := CtaCompras;
                                               Params.ByName['CTA_VENTAS'].AsString := CtaVentas;
                                               Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                               Params.ByName['TIPO_IVA'].AsInteger := TipoIVAFamilia;
                                               Params.ByName['PAIS'].AsString := Pais;
                                               Params.ByName['CTA_DEVOLUCION_COMPRAS'].AsString := CtaDevolucionCompras;
                                               Params.ByName['CTA_DEVOLUCION_VENTAS'].AsString := CtaDevolucionVentas;
                                               Params.ByName['CTA_ABONO_COMPRAS'].AsString := CtaAbonoCompras;
                                               Params.ByName['CTA_ABONO_VENTAS'].AsString := CtaAbonoVentas;
                                               Params.ByName['UNIDADES'].AsString := '-';
                                               Params.ByName['CONTROL_STOCK'].AsInteger := 1;
                                               Params.ByName['DISPONIBILIDAD'].AsInteger := Disponibilidad;
                                               Params.ByName['ID_A'].AsInteger := id_a;
                                               Params.ByName['WEB'].AsInteger := 1;
                                               Params.ByName['ALFA_1'].AsString := '';
                                               Params.ByName['ALFA_2'].AsString := '';
                                               Params.ByName['ALFA_3'].AsString := cod_categoria_1;
                                               Params.ByName['ALFA_4'].AsString := cod_categoria_2;
                                               Params.ByName['ALFA_5'].AsString := marca;
                                               Params.ByName['ALFA_6'].AsString := ean_producto;
                                               Params.ByName['NOTAS'].AsString := descripcion;
                                               ExecQuery;
                                               FreeHandle;
                                            end;
                                         finally
                                            FreeAndNil(Q);
                                         end;

                                         Log(Format(_('Creado el articulo %s en el ejercicio %d'), [Articulo, Ejercicio]));
                                      end;

                                      id_a := DameIDArticulo(Articulo);

                                      if (ean_producto > '0') then
                                      begin
                                         // Verifico si ya tiene un codigo de barra EAN13 asignado
                                         Q := THYFIBQuery.Create(nil);
                                         try
                                            with Q do
                                            begin
                                               Close;
                                               DataBase := DMMain.DataBase;
                                               SQL.Text := 'SELECT FIRST (1) BARRAS FROM ART_ARTICULOS_BARRAS WHERE ID_A = :ID_A AND TIPO = :TIPO';
                                               Params.ByName['ID_A'].AsInteger := id_a;
                                               Params.ByName['TIPO'].AsInteger := 3;
                                               ExecQuery;
                                               CodigoBarra := Trim(FieldByName['BARRAS'].AsString);
                                               FreeHandle;
                                            end;
                                         finally
                                            FreeAndNil(Q);
                                         end;

                                         // Verifico si otro artículo está utilizando el mismo código de barras
                                         Q := THYFIBQuery.Create(nil);
                                         try
                                            with Q do
                                            begin
                                               Close;
                                               DataBase := DMMain.DataBase;
                                               SQL.Text := 'SELECT FIRST (1) ARTICULO FROM ART_ARTICULOS_BARRAS WHERE ID_A <> :ID_A AND EMPRESA = :EMPRESA AND BARRAS = :BARRAS';
                                               Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
                                               Params.ByName['ID_A'].AsInteger := id_a;
                                               Params.ByName['BARRAS'].AsString := ean_producto;
                                               ExecQuery;
                                               ArticuloConMismoCodigoBarra := Trim(FieldByName['ARTICULO'].AsString);
                                               FreeHandle;
                                            end;
                                         finally
                                            FreeAndNil(Q);
                                         end;

                                         if (ArticuloConMismoCodigoBarra > '') then
                                         begin
                                            DMMain.Log('WARNING sincronizando articulos');
                                            DMMain.Log('  ean13 : ' + ean_producto);
                                            DMMain.Log('  Hay otro articulo que utiliza el mimsmo codigo de barras EAN13:');
                                            DMMain.Log('  ' + ArticuloConMismoCodigoBarra);
                                         end
                                         else
                                         begin
                                            // Si tiene codigo de barra y es distinto del de PrestaShop, lo actualizo
                                            if ((CodigoBarra <> ean_producto) and (CodigoBarra > '')) then
                                            begin
                                               Q := THYFIBQuery.Create(nil);
                                               try
                                                  with Q do
                                                  begin
                                                     Close;
                                                     DataBase := DMMain.DataBase;
                                                     SQL.Text := 'UPDATE ART_ARTICULOS_BARRAS SET BARRAS = :NEWBARRAS WHERE ID_A = :ID_A AND TIPO = :TIPO AND BARRAS = :OLDBARRAS';
                                                     Params.ByName['ID_A'].AsInteger := id_a;
                                                     Params.ByName['TIPO'].AsInteger := 3;
                                                     Params.ByName['NEWBARRAS'].AsString := ean_producto;
                                                     Params.ByName['OLDBARRAS'].AsString := CodigoBarra;
                                                     ExecQuery;
                                                     FreeHandle;
                                                  end;
                                               finally
                                                  FreeAndNil(Q);
                                               end;
                                            end;

                                            // Si NO tiene codigo de barra, lo creo
                                            if ((CodigoBarra <> ean_producto) and (CodigoBarra = '')) then
                                            begin
                                               Q := THYFIBQuery.Create(nil);
                                               try
                                                  with Q do
                                                  begin
                                                     Close;
                                                     DataBase := DMMain.DataBase;
                                                     SQL.Add(' INSERT INTO ART_ARTICULOS_BARRAS ');
                                                     SQL.Add(' (EMPRESA, BARRAS, ARTICULO, TIPO, FUNCION, ID_A, TITULO) ');
                                                     SQL.Add(' VALUES ');
                                                     SQL.Add(' (:EMPRESA, :BARRAS, :ARTICULO, :TIPO, :FUNCION, :ID_A, :TITULO) ');
                                                     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                                     Params.ByName['BARRAS'].AsString := ean_producto;
                                                     Params.ByName['ARTICULO'].AsString := Articulo;
                                                     Params.ByName['TIPO'].AsInteger := 3;
                                                     Params.ByName['FUNCION'].AsInteger := 0;
                                                     Params.ByName['ID_A'].AsInteger := id_a;
                                                     Params.ByName['TITULO'].AsString := nombre;
                                                     ExecQuery;
                                                     FreeHandle;
                                                  end;
                                               finally
                                                  FreeAndNil(Q);
                                               end;
                                            end;
                                         end;
                                      end;

                                      // Creo linea
                                      id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');

                                      // Obtengo el Tipo de IVA para el articulo
                                      Q := THYFIBQuery.Create(nil);
                                      try
                                         with Q do
                                         begin
                                            Close;
                                            DataBase := DMMain.DataBase;
                                            SQL.Text := 'SELECT TIPO FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND P_IVA = :P_IVA';
                                            Params.ByName['PAIS'].AsString := REntorno.Pais;
                                            Params.ByName['P_IVA'].AsFloat := PorcentajeIVA;
                                            ExecQuery;
                                            if (Q.HayDatos) then
                                               TipoIVA := FieldByName['TIPO'].AsInteger
                                            else
                                               TipoIVA := -1;
                                            FreeHandle;
                                         end;
                                      finally
                                         FreeAndNil(Q);
                                      end;

                                      if (TipoIVA >= 0) then
                                      begin
                                         Q := THYFIBQuery.Create(nil);
                                         try
                                            with Q do
                                            begin
                                               Close;
                                               DataBase := DMMain.DataBase;
                                               SQL.Clear;
                                               SQL.Add(' INSERT INTO VER_DETALLE_FACTURA ');
                                               SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ALMACEN, ARTICULO, TITULO, UNIDADES, PRECIO, ENTRADA, ID_S, ID_DETALLES_S, ');
                                               SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA, P_COSTE) ');
                                               SQL.Add(' VALUES ');
                                               SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ALMACEN, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
                                               SQL.Add(' ''GRNL'', :TIPO_IVA, :P_COSTE) ');
                                               Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                               Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                               Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                               Params.ByName['SERIE'].AsString := Serie;
                                               Params.ByName['TIPO'].AsString := 'FAC';
                                               Params.ByName['RIG'].AsInteger := RIG;
                                               Params.ByName['LINEA'].AsInteger := 0;
                                               Params.ByName['ALMACEN'].AsString := Almacen;
                                               Params.ByName['ARTICULO'].AsString := Articulo;
                                               Params.ByName['TITULO'].AsString := nombre;
                                               Params.ByName['UNIDADES'].AsFloat := unidades;
                                               if (TarifaIvaIncluido) then
                                                  Params.ByName['PRECIO'].AsFloat := venta + ((venta * PorcentajeIVA) / 100)
                                               else
                                                  Params.ByName['PRECIO'].AsFloat := venta;
                                               Params.ByName['P_COSTE'].AsFloat := coste;
                                               Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                               Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                               Params.ByName['ID_S'].AsInteger := id_s;
                                               Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                               ExecQuery;
                                               FreeHandle;
                                            end;
                                         finally
                                            FreeAndNil(Q);
                                         end;
                                      end
                                      else
                                      begin
                                         Error := True;
                                         Log('************************************************************');
                                         Log(Format(_('No se pudo determinar el IVA a aplciar (%3.2f) en factura %d'), [PorcentajeIVA, idFactura]));
                                      end;
                                   end;
                                end;
                                2:
                                begin
                                   {
                                   En el caso de ([TipusLinia] = 2)
                                   [proveidor] es el transoportista de la tabla [Transportistes]
                                   [portes] ???
                                   }

                                   id_a := DameIDArticulo(REntorno.ArtTextoLibre);

                                   // Creo linea
                                   id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');

                                   // Obtengo el Tipo de IVA Excento
                                   Q := THYFIBQuery.Create(nil);
                                   try
                                      with Q do
                                      begin
                                         Close;
                                         DataBase := DMMain.DataBase;
                                         SQL.Text := 'SELECT TIPO FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND P_IVA = :P_IVA';
                                         Params.ByName['PAIS'].AsString := REntorno.Pais;
                                         Params.ByName['P_IVA'].AsFloat := 0;
                                         ExecQuery;
                                         if (Q.HayDatos) then
                                            TipoIVA := FieldByName['TIPO'].AsInteger
                                         else
                                            TipoIVA := -1;
                                         FreeHandle;
                                      end;
                                   finally
                                      FreeAndNil(Q);
                                   end;

                                   if (TipoIVA >= 0) then
                                   begin
                                      Q := THYFIBQuery.Create(nil);
                                      try
                                         with Q do
                                         begin
                                            Close;
                                            DataBase := DMMain.DataBase;
                                            SQL.Clear;
                                            SQL.Add(' INSERT INTO VER_DETALLE_FACTURA ');
                                            SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, ENTRADA, ID_S, ID_DETALLES_S, ');
                                            SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA, P_COSTE) ');
                                            SQL.Add(' VALUES ');
                                            SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
                                            SQL.Add(' ''GRNL'', :TIPO_IVA, :P_COSTE) ');
                                            Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                            Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                            Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                            Params.ByName['SERIE'].AsString := Serie;
                                            Params.ByName['TIPO'].AsString := 'FAC';
                                            Params.ByName['RIG'].AsInteger := RIG;
                                            Params.ByName['LINEA'].AsInteger := 0;
                                            Params.ByName['ARTICULO'].AsString := REntorno.ArtTextoLibre;
                                            Params.ByName['TITULO'].AsString := nombre;
                                            Params.ByName['UNIDADES'].AsFloat := unidades;
                                            Params.ByName['PRECIO'].AsFloat := venta;
                                            Params.ByName['P_COSTE'].AsFloat := coste;
                                            Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                            Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                            Params.ByName['ID_S'].AsInteger := id_s;
                                            Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                            ExecQuery;
                                            FreeHandle;
                                         end;
                                      finally
                                         FreeAndNil(Q);
                                      end;
                                   end
                                   else
                                   begin
                                      Error := True;
                                      Log('************************************************************');
                                      Log(Format(_('No se pudo determinar el IVA a aplciar (%3.2f) en factura %d'), [0, idFactura]));
                                   end;
                                end;
                                3:
                                begin
                                   {
                                   En el caso de ([TipusLinia] = 3)
                                   [proveidor] es el tipo de pago 1=Ingreso a cuenta, 2=Tarjeta de Crédito, 3=PayPal
                                   [portes] = 0
                                   }

                                   id_a := DameIDArticulo(REntorno.ArtTextoLibre);

                                   // Creo linea
                                   id_detalles_s := DMMain.ContadorGen('ID_GES_DETALLES_S');

                                   // Obtengo el Tipo de IVA
                                   Q := THYFIBQuery.Create(nil);
                                   try
                                      with Q do
                                      begin
                                         Close;
                                         DataBase := DMMain.DataBase;
                                         SQL.Text := 'SELECT TIPO FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND P_IVA = :P_IVA';
                                         Params.ByName['PAIS'].AsString := REntorno.Pais;
                                         Params.ByName['P_IVA'].AsFloat := PorcentajeIVA;
                                         ExecQuery;
                                         if (Q.HayDatos) then
                                            TipoIVA := FieldByName['TIPO'].AsInteger
                                         else
                                            TipoIVA := -1;
                                         FreeHandle;
                                      end;
                                   finally
                                      FreeAndNil(Q);
                                   end;

                                   if (TipoIVA >= 0) then
                                   begin
                                      Q := THYFIBQuery.Create(nil);
                                      try
                                         with Q do
                                         begin
                                            Close;
                                            DataBase := DMMain.DataBase;
                                            SQL.Clear;
                                            SQL.Add(' INSERT INTO VER_DETALLE_FACTURA ');
                                            SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, ENTRADA, ID_S, ID_DETALLES_S, ');
                                            SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA, P_COSTE) ');
                                            SQL.Add(' VALUES ');
                                            SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
                                            SQL.Add(' ''GRNL'', :TIPO_IVA, :P_COSTE) ');
                                            Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                            Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                            Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                            Params.ByName['SERIE'].AsString := Serie;
                                            Params.ByName['TIPO'].AsString := 'FAC';
                                            Params.ByName['RIG'].AsInteger := RIG;
                                            Params.ByName['LINEA'].AsInteger := 0;
                                            Params.ByName['ARTICULO'].AsString := REntorno.ArtTextoLibre;
                                            Params.ByName['TITULO'].AsString := nombre;
                                            Params.ByName['UNIDADES'].AsFloat := unidades;
                                            if (TarifaIvaIncluido) then
                                               Params.ByName['PRECIO'].AsFloat := venta + ((venta * PorcentajeIVA) / 100)
                                            else
                                               Params.ByName['PRECIO'].AsFloat := venta;
                                            Params.ByName['P_COSTE'].AsFloat := coste;
                                            Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                            Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                            Params.ByName['ID_S'].AsInteger := id_s;
                                            Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
                                            ExecQuery;
                                            FreeHandle;
                                         end;
                                      finally
                                         FreeAndNil(Q);
                                      end;
                                   end
                                   else
                                   begin
                                      Error := True;
                                      Log('************************************************************');
                                      Log(Format(_('No se pudo determinar el IVA a aplciar (%3.2f) en factura %d'), [0, idFactura]));
                                   end;
                                end;
                                else
                                begin
                                   Error := True;
                                   Log('************************************************************');
                                   Log(Format(_('Tipo de linea desconocido (%d) en factura %d'), [TipusLinia, idFactura]));
                                end;
                             end;
                             QMSSQL.Next;
                          end;
                       end;
                    except
                       on e: Exception do
                       begin
                          Error := True;
                          Log('************************************************************');
                          Log(Format(_('Error al obtener datos de la linea del pedido. (Factura %d)'), [idFactura]) + #13#10 + e.Message);
                       end;
                    end;
                 end;
              end;
           end;

           DMMain.LogFin(Format('Factura tratada. (%s)', [FacturasASincronizar[0]]));
           if (not Error) then
           begin
              Log(Format('Factura tratada. (%s)', [FacturasASincronizar[0]]));

              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Clear;
                    SQL.Add(' UPDATE SYS_CONF_MAS_Y_MAS_BARATO SET ULT_FACTURA = :ULT_FACTURA WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['ULT_FACTURA'].AsInteger := idFactura;
                    ExecQuery;
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;

              FacturasASincronizar.Delete(0);
           end
           else
           begin
              // Si hubo error, borro la factura generada para no dejar documentos a medias
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Clear;
                    SQL.Add(' DELETE FROM VER_CABECERAS_FACTURA WHERE ID_S = :ID_S ');
                    Params.ByName['ID_S'].AsInteger := id_s;
                    ExecQuery;
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;
        end;
     finally
        FacturasASincronizar.Free;
     end;
  end
  else
  begin
     Log('************************************************************');
     Log(_('No se ha podido conectar con Tienda Virtual.'));
  end;

  Log('--------------------------------------------------');
  Log(_('Sincronizacion finalizada'));
  Log(DateTimeToStr(Now));
  Log('--------------------------------------------------');

  QMConfiguracion.Refresh;
end;
*)

(*
1)
Selecciono de [Facturas] desde el último [idFactura] importado.

SELECT [idComanda]
      ,[idFactura]
      ,[Data]
      ,[Trama]
  FROM [masymasbarato].[dbo].[Facturas]
WHERE [idFactura] > ?UltimaidFacturaImprotada
ORDER BY [idFactura]

Los [idComanda] devueltos son las comandas que debo importar a la aplcación.


2)
Selecciono de [ComandaClient_cap] la comanda a importar, para obtener datos de la comanda, el cliente y totales.

SELECT [idComanda]
      ,[DataComanda]
      ,[afNom]
      ,[afCognoms]
      ,[afEmpresa]
      ,[afNIF]
      ,[afAdreca1]
      ,[afAdreca2]
      ,[afCP]
      ,[afPoblcacion]
      ,[afProvincia]
      ,[Email]
      ,[Telefon]
      ,[aeNom]
      ,[aeCognoms]
      ,[aeAdreca1]
      ,[aeAdreca2]
      ,[aeCP]
      ,[aePoblacion]
      ,[aeProvincia]
      ,[aiNom]
      ,[aiCognoms]
      ,[aiAdreca1]
      ,[aiAdreca2]
      ,[aiCP]
      ,[aiPoblacion]
      ,[aiProvincia]
      ,[aiEmail]
      ,[aiTelefon]
      ,[OpcioTransport]
      ,[ConfirmatClient]
      ,[ConfirmatPagament]
      ,[PassatProveidors]
      ,[ComandaRebuda]
      ,[idSeguimentTransportista]
      ,[Incidencia]
      ,[idIncidencia]
      ,[idClient]
      ,[idPagament]
      ,[BISumaMercaderies]
      ,[IVAMercaderies]
      ,[TotalMercaderies]
      ,[BITransport]
      ,[IVATransport]
      ,[TotalTransport]
      ,[BIPagament]
      ,[IVAPagament]
      ,[TOTALPagament]
      ,[BITotal]
      ,[IVATotal]
      ,[TotalPagar]
      ,[idSessio]
  FROM [masymasbarato].[dbo].[ComandaClient_cap]
 WHERE [idComanda] = ?idComandaFacturada

Con estos datos creo el cliente si no existe.
[af...] son datos de direccion de facturacion
[ae...] son datos de direccion de entrega
[ai...] son datos de direccion de intermediaria (aparentemente no se utilizará)

Con estos datos creo la cabecera de pedido en la aplicación en la serie "WEB".


3)
Selecciono de [ComandaClient_lin] las líneas de la comanda.

SELECT [idComanda]
      ,[TipusLinia]
      ,[proveidor]
      ,[producto_num]
      ,[nombre]
      ,[descripcion] *** Falta agregar. Lo agregará dentro de poco.
      ,[cod_categoria_1] *** Falta agregar. Lo agregará dentro de poco.
      ,[ean]
      ,[portes]
      ,[unidades]
      ,[coste]
      ,[venta]
  FROM [masymasbarato].[dbo].[ComandaClient_lin]
 WHERE [idComanda] = ?idComandaFacturada
ORDER BY [TipusLinia]

En el caso de ([TipusLinia] = 1) creo el artículo si no existe (código [producto_num]).
[proveidor] va a piñon. 1=Carrera, 2=Viser
[cod_categoria_1] se relaciona con la tabla [Categoria].[cod_categoria_1]
[portes] es el transportista

En el caso de ([TipusLinia] = 2)
[proveidor] es el transoportista de la tabla [Transportistes]
[portes] ???

En el caso de ([TipusLinia] = 3)
[proveidor] es el tipo de pago 1=Ingreso a cuenta, 2=Tarjeta de Crédito, 3=PayPal
[portes] = 0





El resto se importan como Portes o articulos varios según corresponda.


4)
Para crear un artículo tomo los datos de [ArtProvImportacio1] donde [ArtProvImportacio1].[producto_num] es el [ComandaClient_lin].[producto_num].

SELECT [generated]
      ,[producto_num]
      ,[codigo_mayorista]
      ,[part_number]
      ,[nombre]
      ,[ean]
      ,[descripcion]
      ,[cod_categoria_1]
      ,[categoria_1]
      ,[cod_categoria_2]
      ,[categoria_2]
      ,[marca]
      ,[precio]
      ,[pvp]
      ,[margen]
      ,[disponibilidad]
      ,[stock]
      ,[imagen]
      ,[portes]
  FROM [masymasbarato].[dbo].[ArtProvImportacio1]
 WHERE [producto_num] = ?producto_num


No logro ver la relacion entre las tablas [Categoria] y [SubCategoria] y la tabla [ArtProvImportacio1].

Como ultimo punto debe generar una factura de proveedor con la misma información que la de compra.

Crear un almacen WEB para todos los movimientos

Crear forma de pago WEB que funcione como un contado.
*)
procedure TDMSincronizacionTiendaMasYMasBarato.QMConfiguracionNewRecord(DataSet: TDataSet);
begin
  QMConfiguracionEMPRESA.AsInteger := REntorno.Empresa;
  QMConfiguracionCANAL.AsInteger := REntorno.Canal;
end;

procedure TDMSincronizacionTiendaMasYMasBarato.Log(s: string);
begin
  FMSincronizacionTiendaMasYMasBarato.Log(s);
end;

procedure TDMSincronizacionTiendaMasYMasBarato.Prueba;
var
  // Q : THYFIBQuery;
  FacturasASincronizar : TStrings;
  // Factura
  idComanda : integer;
  idFactura : integer;
  Data : TDateTime;
  Trama : integer;
  // Comanda Cabecera
  // DataComanda : TDateTime;
  // afNom : string;
  // afCognoms : string;
  // afEmpresa : string;
  // afNIF : string;
  // afAdreca1 : string;
  // afAdreca2 : string;
  // afCP : string;
  // afPoblcacion : string;
  // afProvincia : string;
  // Email : string;
  // Telefon : string;
  // aeNom : string;
  // aeCognoms : string;
  // aeAdreca1 : string;
  // aeAdreca2 : string;
  // aeCP : string;
  // aePoblacion : string;
  // aeProvincia : string;
  // aiNom : string;
  // aiCognoms : string;
  // aiAdreca1 : string;
  // aiAdreca2 : string;
  // aiCP : string;
  // aiPoblacion : string;
  // aiProvincia : string;
  // aiEmail : string;
  // aiTelefon : string;
  // OpcioTransport : integer;
  // ConfirmatClient : integer;
  // ConfirmatPagament : integer;
  // PassatProveidors : integer;
  // ComandaRebuda : integer;
  // idSeguimentTransportista : string;
  // Incidencia : integer;
  // idIncidencia : integer;
  // idClient : integer;
  // idPagament : integer;
  // BISumaMercaderies : double;
  // IVAMercaderies : double;
  // TotalMercaderies : double;
  // BITransport : double;
  // IVATransport : double;
  // TotalTransport : double;
  // BIPagament : double;
  // IVAPagament : double;
  // TOTALPagament : double;
  // BITotal : double;
  // IVATotal : double;
  // TotalPagar : double;
  // idSessio : string;
  // Comanda Linea
  // TipusLinia : integer;
  // proveidor : double;
  // producto_num : string;
  // nombre : string;
  // descripcion : string;
  // cod_categoria_1 : string;
  // ean : string;
  // portes : double;
  // unidades : integer;
  // coste : double;
  // venta : double;
  // Para crear factura
  // Tercero, Cliente : integer;
  // Direccion : integer;
  // Tarifa : string;
  // TarifaIVAIncluido : boolean;
  // Transportista : integer;
  // i, id_a, id_s, id_detalles_s : integer;
  // EjercicioCliente, Ejercicio, RIG : integer;
  // Estado : integer;
  // Serie : string;
  // Almacen : string;
  // PorcentajeIVA : double;
  // TipoIVA : integer;
  // TipoIVAFamilia : integer;
  // NIF : string;
  // dir_localidad : string;
  // CtaDtoPP : string;
  // PaisC2 : string;
  // ModoIVACanal : integer;
  // Cuenta : string;
  // CodigoBarra, ArticuloConMismoCodigoBarra : string;
  // nombre_producto : string;
  // codigo_mayorista : string;
  // descripcion : string;
  // cod_categoria_1 : string;
  // categoria_1 : string;
  // cod_categoria_2 : string;
  // categoria_2 : string;
  // marca : string;
  // ean : string;
  // ean_producto : string;
  // pvp : double;
  // QProducto : TADOQuery;
  // Pais : string;
  // CtaCompras : string;
  // CtaVentas : string;
  // CtaDevolucionCompras : string;
  // CtaDevolucionVentas : string;
  // CtaAbonoCompras : string;
  // CtaAbonoVentas : string;
  // Disponibilidad : integer;
  Error : boolean;
  // Articulo : string;
  // PCoste : double;
  // s : string;
begin
  EstableceConexionMSSQL;

  if (MSSQLConnection.Connected) then
  begin
     Error := False;
     FacturasASincronizar := TStringList.Create;
     try
        // Obtengo la lista de facturas a sincronizar
        with QMSSQL do
        begin
           try
              Connection := MSSQLConnection;
              if (Active) then
                 Close;
              SQL.Clear;
              SQL.Add(' SELECT [idFactura] ');
              SQL.Add('   FROM [masymasbarato].[dbo].[Facturas] ');
              SQL.Add('  WHERE [idFactura] > :UltimaidFacturaImportada ');
              SQL.Add('  ORDER BY [idFactura] ');

              // PrepareStatement;
              Parameters.FindParam('UltimaidFacturaImportada').Value := QMConfiguracionULT_FACTURA.AsInteger;

              Open;
              while not EOF do
              begin
                 FacturasASincronizar.Add(QMSSQL.FieldByName('idFactura').AsString);
                 Log(Format('Agrego a la lista de Factura a Importar: %s', [QMSSQL.FieldByName('idFactura').AsString]));

                 Next;
              end;
           except
              on e: Exception do
              begin
                 Error := True;
                 Log(_('(2) Error al obtener Facturas de MSSQL') + #13#10 + e.Message);
              end;
           end;
        end;

        while ((not Error) and (FacturasASincronizar.Count > 0)) do
        begin
           Log('--------------------------------------------------');
           Log(Format('Comienzo a tratar la factura %s', [FacturasASincronizar[0]]));
           Log('--------------------------------------------------');
           idFactura := StrToInt(FacturasASincronizar[0]);
           idComanda := 0;

           Log(_('Datos de Factura'));
           Log('--------------------------------------------------');
           // Obtengo datos de la factura
           with QMSSQL do
           begin
              try
                 Connection := MSSQLConnection;
                 if (Active) then
                    Close;
                 SQL.Clear;
                 SQL.Add(' SELECT [idComanda] ');
                 SQL.Add('       ,[Data] ');
                 SQL.Add('       ,[Trama] ');
                 SQL.Add('   FROM [masymasbarato].[dbo].[Facturas] ');
                 SQL.Add('  WHERE [idFactura] = :Factura ');

                 // PrepareStatement;
                 Parameters.FindParam('Factura').Value := idFactura;

                 Open;
                 idComanda := QMSSQL.FieldByName('idComanda').AsInteger;
                 Log(Format('idComanda: %d', [idComanda]));
                 Data := QMSSQL.FieldByName('Data').AsDateTime;
                 Log(Format('Data: %s', [DateTimeToStr(Data)]));
                 Trama := QMSSQL.FieldByName('Trama').AsInteger;
                 Log(Format('Trama: %d', [Trama]));
              except
                 on e: Exception do
                 begin
                    Error := True;
                    Log('************************************************************');
                    Log(Format(_('(3) Error al obtener datos de la Factura %d'), [idFactura]) + #13#10 + e.Message);
                 end;
              end;
           end;

           if (not Error) then
           begin
              Log(_('Datos de Cabecera de Pedido'));
              Log('--------------------------------------------------');
              with QMSSQL do
              begin
                 try
                    Connection := MSSQLConnection;
                    if (Active) then
                       Close;
                    SQL.Clear;
                    SQL.Text :=
                       'SELECT ' +
                       '[TotalMercaderies],[BITransport],[IVATransport],[TotalTransport],[BIPagament] ' +
                       ',[IVAPagament],[TOTALPagament],[BITotal],[IVATotal],[TotalPagar],[idSessio] ' +
                       ',[DataComanda],[afNom],[afCognoms],[afEmpresa],[afNIF],[afAdreca1] ' +
                       ',[afAdreca2],[afCP],[afPoblcacion],[afProvincia],[Email],[Telefon],[aeNom] ' +
                       ',[aeCognoms],[aeAdreca1],[aeAdreca2],[aeCP],[aePoblacion],[aeProvincia] ' +
                       ',[aiNom],[aiCognoms],[aiAdreca1],[aiAdreca2],[aiCP],[aiPoblacion],[aiProvincia] ' +
                       ',[aiEmail],[aiTelefon],[OpcioTransport],[ConfirmatClient],[ConfirmatPagament] ' +
                       ',[PassatProveidors],[ComandaRebuda],[idSeguimentTransportista],[Incidencia] ' +
                       ',[idIncidencia],[idClient],[idPagament],[BISumaMercaderies],[IVAMercaderies] ' +

                       'FROM [masymasbarato].[dbo].[ComandaClient_cap] ' +
                       'WHERE [idComanda] = :ComandaFacturada ';

                    Log(SQL.Text);

                    // PrepareStatement;
                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Param');
                    Parameters.FindParam('ComandaFacturada').Value := idComanda;

                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Open');
                    Open;
                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Opened');
                    Application.ProcessMessages;

                    {
                    idComanda := QMSSQL.FieldByName('idComanda').AsInteger;
                    Log(Format('idComanda: %d', [idComanda]));
                    Data := QMSSQL.FieldByName('Data').AsDateTime;
                    Log(Format('Data: %s', [DateTimeToStr(Data)]));
                    Trama := QMSSQL.FieldByName('Trama').AsInteger;
                    Log(Format('Trama: %d', [Trama]));
                    }
                 except
                    on e: Exception do
                    begin
                       Error := True;
                       Log('************************************************************');
                       Log(Format(_('(3) Error al obtener datos de la Factura %d'), [idFactura]) + #13#10 + e.Message);
                    end;
                 end;
              end;
              (*
              // Obtengo datos de cabecera de pedido
              with QMSSQL do
              begin
                 try
                    Connection := MSSQLConnection;

                    if (Active) then
                       Close;

                    SQL.Clear;
                    SQL.Add(' SELECT [DataComanda] ');
                    SQL.Add('       ,[afNom] ');
                    SQL.Add('       ,[afCognoms] ');
                    SQL.Add('       ,[afEmpresa] ');
                    SQL.Add('       ,[afNIF] ');
                    SQL.Add('       ,[afAdreca1] ');
                    SQL.Add('       ,[afAdreca2] ');
                    SQL.Add('       ,[afCP] ');
                    SQL.Add('       ,[afPoblcacion] ');
                    SQL.Add('       ,[afProvincia] ');
                    SQL.Add('       ,[Email] ');
                    SQL.Add('       ,[Telefon] ');
                    SQL.Add('       ,[aeNom] ');
                    SQL.Add('       ,[aeCognoms] ');
                    SQL.Add('       ,[aeAdreca1] ');
                    SQL.Add('       ,[aeAdreca2] ');
                    SQL.Add('       ,[aeCP] ');
                    SQL.Add('       ,[aePoblacion] ');
                    SQL.Add('       ,[aeProvincia] ');
                    SQL.Add('       ,[aiNom] ');
                    SQL.Add('       ,[aiCognoms] ');
                    SQL.Add('       ,[aiAdreca1] ');
                    SQL.Add('       ,[aiAdreca2] ');
                    SQL.Add('       ,[aiCP] ');
                    SQL.Add('       ,[aiPoblacion] ');
                    SQL.Add('       ,[aiProvincia] ');
                    SQL.Add('       ,[aiEmail] ');
                    SQL.Add('       ,[aiTelefon] ');
                    SQL.Add('       ,[OpcioTransport] ');
                    SQL.Add('       ,[ConfirmatClient] ');
                    SQL.Add('       ,[ConfirmatPagament] ');
                    SQL.Add('       ,[PassatProveidors] ');
                    SQL.Add('       ,[ComandaRebuda] ');
                    SQL.Add('       ,[idSeguimentTransportista] ');
                    SQL.Add('       ,[Incidencia] ');
                    SQL.Add('       ,[idIncidencia] ');
                    SQL.Add('       ,[idClient] ');
                    SQL.Add('       ,[idPagament] ');
                    SQL.Add('       ,[BISumaMercaderies] ');
                    SQL.Add('       ,[IVAMercaderies] ');
                    SQL.Add('       ,[TotalMercaderies] ');
                    SQL.Add('       ,[BITransport] ');
                    SQL.Add('       ,[IVATransport] ');
                    SQL.Add('       ,[TotalTransport] ');
                    SQL.Add('       ,[BIPagament] ');
                    SQL.Add('       ,[IVAPagament] ');
                    SQL.Add('       ,[TOTALPagament] ');
                    SQL.Add('       ,[BITotal] ');
                    SQL.Add('       ,[IVATotal] ');
                    SQL.Add('       ,[TotalPagar] ');
                    SQL.Add('       ,[idSessio] ');
                    SQL.Add('   FROM [masymasbarato].[dbo].[ComandaClient_cap] ');
                    // SQL.Add('  WHERE [idComanda] = ' + IntToStr(idComanda));
                    SQL.Add('  WHERE [idComanda] = :ComandaFacturada ');

SQL.Text := StringReplace(SQL.Text, '  ', ' ', [rfReplaceAll]);
SQL.Text := StringReplace(SQL.Text, '  ', ' ', [rfReplaceAll]);
SQL.Text := StringReplace(SQL.Text, '  ', ' ', [rfReplaceAll]);
Log(SQL.Text);

                    // PrepareStatement;
                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Param');
                    Parameters.FindParam('ComandaFacturada').Value := idComanda;

                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Open');
                    Open;
                    DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Opened');
                    Application.ProcessMessages;

                    if (IsEmpty) then
                    begin
                       DMMain.Log('DMSincronizacionTiendaMasYMasBarato.IsEmpty');
                       Error := True;
                       Log('************************************************************');
                       Log(Format(_('No se encuentra el pedido %d asociado a la factura %d.'), [idComanda, idFactura]));
                    end
                    else
                    begin
                       DMMain.Log('DMSincronizacionTiendaMasYMasBarato.Is Not Empty');
                       Log('Datos Comanda');
                       DataComanda := QMSSQL.FieldByName('DataComanda').AsDateTime;
                       Log(Format('DataComanda: %s', [DateTimeToStr(DataComanda)]));
                       afNom := QMSSQL.FieldByName('afNom').AsString;
                       Log(Format('afNom: %s', [afNom]));
                       afCognoms := QMSSQL.FieldByName('afCognoms').AsString;
                       Log(Format('afCognoms: %s', [afCognoms]));
                       afEmpresa := QMSSQL.FieldByName('afEmpresa').AsString;
                       Log(Format('afEmpresa: %s', [afEmpresa]));
                       afNIF := QMSSQL.FieldByName('afNIF').AsString;
                       Log(Format('afNIF: %s', [afNIF]));
                       afAdreca1 := QMSSQL.FieldByName('afAdreca1').AsString;
                       Log(Format('afAdreca1: %s', [afAdreca1]));
                       afAdreca2 := QMSSQL.FieldByName('afAdreca2').AsString;
                       Log(Format('afAdreca2: %s', [afAdreca2]));
                       afCP := QMSSQL.FieldByName('afCP').AsString;
                       Log(Format('afCP: %s', [afCP]));
                       afPoblcacion := QMSSQL.FieldByName('afPoblcacion').AsString;
                       Log(Format('afPoblcacion: %s', [afPoblcacion]));
                       afProvincia := QMSSQL.FieldByName('afProvincia').AsString;
                       Log(Format('afProvincia: %s', [afProvincia]));
                       Email := QMSSQL.FieldByName('Email').AsString;
                       Log(Format('Email: %s', [Email]));
                       Telefon := Trim(QMSSQL.FieldByName('Telefon').AsString);
                       Log(Format('Telefon: %s', [Telefon]));
                       aeNom := QMSSQL.FieldByName('aeNom').AsString;
                       aeCognoms := QMSSQL.FieldByName('aeCognoms').AsString;
                       aeAdreca1 := QMSSQL.FieldByName('aeAdreca1').AsString;
                       aeAdreca2 := QMSSQL.FieldByName('aeAdreca2').AsString;
                       aeCP := QMSSQL.FieldByName('aeCP').AsString;
                       aePoblacion := QMSSQL.FieldByName('aePoblacion').AsString;
                       aeProvincia := QMSSQL.FieldByName('aeProvincia').AsString;
                       aiNom := QMSSQL.FieldByName('aiNom').AsString;
                       aiCognoms := QMSSQL.FieldByName('aiCognoms').AsString;
                       aiAdreca1 := QMSSQL.FieldByName('aiAdreca1').AsString;
                       aiAdreca2 := QMSSQL.FieldByName('aiAdreca2').AsString;
                       aiCP := QMSSQL.FieldByName('aiCP').AsString;
                       aiPoblacion := QMSSQL.FieldByName('aiPoblacion').AsString;
                       aiProvincia := QMSSQL.FieldByName('aiProvincia').AsString;
                       aiEmail := QMSSQL.FieldByName('aiEmail').AsString;
                       aiTelefon := Trim(QMSSQL.FieldByName('aiTelefon').AsString);
                       OpcioTransport := QMSSQL.FieldByName('OpcioTransport').AsInteger;
                       ConfirmatClient := QMSSQL.FieldByName('ConfirmatClient').AsInteger;
                       ConfirmatPagament := QMSSQL.FieldByName('ConfirmatPagament').AsInteger;
                       PassatProveidors := QMSSQL.FieldByName('PassatProveidors').AsInteger;
                       ComandaRebuda := QMSSQL.FieldByName('ComandaRebuda').AsInteger;
                       idSeguimentTransportista := QMSSQL.FieldByName('idSeguimentTransportista').AsString;
                       Incidencia := QMSSQL.FieldByName('Incidencia').AsInteger;
                       idIncidencia := QMSSQL.FieldByName('idIncidencia').AsInteger;
                       idClient := QMSSQL.FieldByName('idClient').AsInteger;
                       Log(Format('idClient: %d', [idClient]));
                       idPagament := QMSSQL.FieldByName('idPagament').AsInteger;
                       BISumaMercaderies := QMSSQL.FieldByName('BISumaMercaderies').AsFloat;
                       Log(Format('BISumaMercaderies: %10.2f', [BISumaMercaderies]));
                       IVAMercaderies := QMSSQL.FieldByName('IVAMercaderies').AsFloat;
                       Log(Format('IVAMercaderies: %10.2f', [IVAMercaderies]));
                       TotalMercaderies := QMSSQL.FieldByName('TotalMercaderies').AsFloat;
                       Log(Format('TotalMercaderies: %10.2f', [TotalMercaderies]));
                       BITransport := QMSSQL.FieldByName('BITransport').AsFloat;
                       Log(Format('BITransport: %10.2f', [BITransport]));
                       IVATransport := QMSSQL.FieldByName('IVATransport').AsFloat;
                       Log(Format('IVATransport: %10.2f', [IVATransport]));
                       TotalTransport := QMSSQL.FieldByName('TotalTransport').AsFloat;
                       Log(Format('TotalTransport: %10.2f', [TotalTransport]));
                       BIPagament := QMSSQL.FieldByName('BIPagament').AsFloat;
                       Log(Format('BIPagament: %10.2f', [BIPagament]));
                       IVAPagament := QMSSQL.FieldByName('IVAPagament').AsFloat;
                       Log(Format('IVAPagament: %10.2f', [IVAPagament]));
                       TOTALPagament := QMSSQL.FieldByName('TOTALPagament').AsFloat;
                       Log(Format('TOTALPagament: %10.2f', [TOTALPagament]));
                       BITotal := QMSSQL.FieldByName('BITotal').AsFloat;
                       Log(Format('BITotal: %10.2f', [BITotal]));
                       IVATotal := QMSSQL.FieldByName('IVATotal').AsFloat;
                       Log(Format('IVATotal: %10.2f', [IVATotal]));
                       TotalPagar := QMSSQL.FieldByName('TotalPagar').AsFloat;
                       Log(Format('TotalPagar: %10.2f', [TotalPagar]));
                       idSessio := QMSSQL.FieldByName('idSessio').AsString;
                       Log(Format('idSessio: %s', [idSessio]));
                    end;
                 except
                    on e: Exception do
                    begin
                       Error := True;
                       Log('************************************************************');
                       Log(Format(_('(4) Error al obtener datos de la Factura %d'), [idFactura]) + #13#10 + e.Message);
                    end;
                 end;
              end;
*)
           end;

           DMMain.LogFin(Format('Factura tratada. (%s)', [FacturasASincronizar[0]]));
           if (not Error) then
           begin
              Log(Format('Factura tratada. (%s)', [FacturasASincronizar[0]]));

              FacturasASincronizar.Delete(0);
           end
           else
           begin
              // Si hubo error, borro la factura generada para no dejar documentos a medias
           end;
        end;
     finally
        FacturasASincronizar.Free;
     end;
  end
  else
  begin
     Log('************************************************************');
     Log(_('No se ha podido conectar con Tienda Virtual.'));
  end;

  Log('--------------------------------------------------');
  Log(_('Sincronizacion finalizada'));
  Log(DateTimeToStr(Now));
  Log('--------------------------------------------------');

end;

procedure TDMSincronizacionTiendaMasYMasBarato.Sincronizar(Archivo: string);
var
  Serie : string;
  Almacen : string;
  FormaPago : string;
  Agente : integer;
  PorcentajeIVA : double;
  // ModoIVACanal : integer;
  FacturasASincronizar, LineaASincronizar, Lineas, Resumen : TStrings;
  Error : boolean;
  s : string;
  ID_S : integer;

  // Cabecera
  FechaPedido : TDateTime;
  FechaPago : TDateTime;
  // FechaEnvio : TDateTime;
  NroPedido : string;
  Nombre : string;
  NIF : string;
  Direccion : string;
  CodigoPostal : string;
  Poblacion : string;
  Provincia : string;
  Email : string;
  Idioma : string;
  Telefono : string;
  NroFactura : string;
  NombreFacturacion : string;
  EmpresaFacturacion : string;
  NIFFacturacion : string;
  DireccionFacturacion : string;
  CodigoPostalFacturacion : string;
  PoblacionFacturacion : string;
  ProvinciaFacturacion : string;
  TipoPago : string;
  Estado : string;
  Contabilizado : string;
  Facturado : string;
  ZonaPortes : string;
  // BaseImponibleTotal : double;
  BaseImponiblePortes : double;
  // BaseImponibleComision : double;
  IdPais : string;
  ConIVA : string;
  // NroPedidoInicial : string;

  // Detalle
  TituloArticulo : string;
  TituloMultiproducto : string;
  ProveedorReferencia : string;
  Cantidad : double;
  // Peso : double;
  // Volumen : double;
  Precio : double;
  TipoArticulo : string;
  PertenecePack : string;
  CodigoBarras : string;

  // Descuentos

begin
  Serie := QMConfiguracionSERIE.AsString;
  Almacen := QMConfiguracionALMACEN.AsString;
  FormaPago := QMConfiguracionFORMA_PAGO.AsString;
  Agente := QMConfiguracionAGENTE.AsInteger;
  PorcentajeIVA := 21;

  Log(_('Inicio Sinctronizacion'));
  Log(DateTimeToStr(Now));
  Log('--------------------------------------------------');
  Log(_('Archivo') + ' ' + Archivo);
  Log(_('Serie') + ' ' + Serie);
  Log(_('Almacen') + ' ' + Almacen);
  Log(Format(_('Porcentaje IVA %f'), [PorcentajeIVA]));


  // Cierro formularios y dejo solo abierto el de sincronizacion
  CierraFormsMenos(FMSincronizacionTiendaMasYMasBarato);

  // Abro DataModule de facturas
  AbreData(TDMFacturas, DMFacturas);
  try
     DMFacturas.CambiaSerie(Serie);

     {
  CLIENTE;21/05/2017 23:17;21/05/2017 23:19;;000000001199;MIGUEL MOGEDAS VAZQUEZ;;C- Manresa n- 9-15 esc- B 1--1a;08630;ABRERA;BARCELONA;mam_2103@yahoo.es;es;653934448;;;;;;;;;TPV;pagado;0;0;0;Espana - Recoger en tienda en Molins de Rei 08750 BCN;112,86;0,0;0,0;ES;S
  ARTICULO;;VINOTECA CAVANOVA CV012M 12BOTELLAS;;cad-220138;1;61,0;0,5;112,86;producto;;8437008797823
  }

     Error := False;
     FacturasASincronizar := TStringList.Create;
     LineaASincronizar := TStringList.Create;
     Lineas := TStringList.Create;
     Resumen := TStringList.Create;
     ID_S := 0;
     try
        with FacturasASincronizar do
        begin
           LoadFromFile(Archivo);
           while (FacturasASincronizar.Count > 0) do
           begin
              // Relleno lista de valores separados por ";"
              {
              LineaASincronizar.Delimiter := ';';
              LineaASincronizar.DelimitedText := FacturasASincronizar[0];
              }
              LineaASincronizar.Clear;
              s := FacturasASincronizar[0];
              while Pos(';', s) > 0 do
              begin
                 LineaASincronizar.Add(Copy(s, 1, Pos(';', s) - 1));
                 s := Copy(s, Pos(';', s) + 1, Length(s));
              end;
              LineaASincronizar.Add(s);

              if (LineaASincronizar[0] = 'CLIENTE') then
              begin
                 {
              CLIENTE -> hace refencia a que esa linia es un pedido
                  CLIENTE; fecha pedido;     fecha pago;       fecha envio;      numero pedido; nombre; nif;     direccion; codigo postal; poblacion; provincia; email; idioma; telefono; num factura; nombre facturacion; empresa facturacion; nif facturacion;
                  direccion facturacion; codigo postal facturacion; poblacion facturacion; tipo pago (TPV|Paypal|Pago Contrareembolso| Pago a plazos|Pago por transferencia); estado; contabilizado; facturado;0; zona portes; base imponible total; base imponible portes;
                  base imponible comision; id pais; con iva (S = si); num pedido inicial
                  ejemplo: CLIENTE; 13/03/2017 22:00; 13/03/2017 22:02; 16/03/2017 10:36; 158881; Josep Serrat; xxxxxxxx; direccion ; 8570; Torello; Barcelona; xxxxxxxx@xxxxx; es; 6xxxxxxxxx; 17-10-006222-OT; ; xxxxxxxx; ; ; ; TPV; enviado; 1; 1; 0; Espana - Peninsula; 23,76;  0; 0; ES; S; 158881
                           0        1                 2                 3                 4       5             6         7           8     9        10         11              12  13          14              15 16       17 18 19 20 21       22 23 24 25                 26      27 28 29  30  31
              }

                 // Datos que iran a las notas de cabecera
                 Lineas.Clear;
                 Lineas.Add(Format(_('Fecha Pedido: %s'), [LineaASincronizar[1]]));
                 Lineas.Add(Format(_('Fecha Pago: %s'), [LineaASincronizar[2]]));
                 Lineas.Add(Format(_('Fecha Envio: %s'), [LineaASincronizar[3]]));
                 Lineas.Add(Format(_('Nro. Pedido: %s'), [LineaASincronizar[4]]));
                 Lineas.Add(Format(_('Nombre: %s'), [LineaASincronizar[5]]));
                 Lineas.Add(Format(_('NIF: %s'), [LineaASincronizar[6]]));
                 Lineas.Add(Format(_('Direccion: %s'), [LineaASincronizar[7]]));
                 Lineas.Add(Format(_('Codigo Postal: %s'), [LineaASincronizar[8]]));
                 Lineas.Add(Format(_('Poblacion: %s'), [LineaASincronizar[9]]));
                 Lineas.Add(Format(_('Provincia: %s'), [LineaASincronizar[10]]));
                 Lineas.Add(Format(_('Email: %s'), [LineaASincronizar[11]]));
                 Lineas.Add(Format(_('Idioma: %s'), [LineaASincronizar[12]]));
                 Lineas.Add(Format(_('Telefono: %s'), [LineaASincronizar[13]]));
                 Lineas.Add(Format(_('???: %s'), [LineaASincronizar[14]]));
                 Lineas.Add(Format(_('Nro. Factura: %s'), [LineaASincronizar[15]]));
                 Lineas.Add(Format(_('Nombre Facturacion: %s'), [LineaASincronizar[16]]));
                 Lineas.Add(Format(_('Empresa Facturacion: %s'), [LineaASincronizar[17]]));
                 Lineas.Add(Format(_('NIF Facturacion: %s'), [LineaASincronizar[18]]));
                 Lineas.Add(Format(_('Direccion Facturacion: %s'), [LineaASincronizar[19]]));
                 Lineas.Add(Format(_('Codigo Postal Facturacion: %s'), [LineaASincronizar[20]]));
                 Lineas.Add(Format(_('Poblacion Facturacion: %s'), [LineaASincronizar[21]]));
                 // Lineas.Add(Format(_('Provincia Facturacion: %s'), [ LineaASincronizar[21]]));
                 Lineas.Add(Format(_('Tipo Pago: %s'), [LineaASincronizar[22]]));
                 Lineas.Add(Format(_('Estado: %s'), [LineaASincronizar[23]]));
                 Lineas.Add(Format(_('Contabilizado: %s'), [LineaASincronizar[24]]));
                 Lineas.Add(Format(_('Facturado: %s'), [LineaASincronizar[25]]));
                 Lineas.Add(Format(_('0: %s'), [LineaASincronizar[26]]));
                 Lineas.Add(Format(_('Zona Portes: %s'), [LineaASincronizar[27]]));
                 Lineas.Add(Format(_('Base Imponible Total: %s'), [LineaASincronizar[28]]));
                 Lineas.Add(Format(_('Base Imponible Portes: %s'), [LineaASincronizar[29]]));
                 Lineas.Add(Format(_('Base Imponible Comision: %s'), [LineaASincronizar[30]]));
                 Lineas.Add(Format(_('Id Pais: %s'), [LineaASincronizar[31]]));
                 Lineas.Add(Format(_('Con IVA: %s'), [LineaASincronizar[32]]));

                 // Log
                 Log('--------');
                 Log(_('Cabecera'));
                 Log('--------');
                 Log(Lineas.Text);

                 FechaPedido := StrToDateTime(LineaASincronizar[1]);
                 FechaPago := FechaPedido;
                 if (LineaASincronizar[2] <> '') then
                    FechaPago := StrToDateTime(LineaASincronizar[2]);
                 {
                 FechaEnvio := FechaPedido;
                 if (LineaASincronizar[3] <> '') then
                    FechaEnvio := StrToDateTime(LineaASincronizar[3]);
                 }
                 NroPedido := LineaASincronizar[4];

                 Nombre := Trim(Copy(LineaASincronizar[5], 1, 60));
                 NIF := UpperCase(Copy(Trim(LineaASincronizar[6]), 1, 20));
                 Direccion := Copy(LineaASincronizar[7], 1, 100);
                 CodigoPostal := Copy(LineaASincronizar[8], 1, 10);
                 Poblacion := Copy(LineaASincronizar[9], 1, 40);
                 Provincia := Copy(LineaASincronizar[10], 1, 40);
                 Email := Copy(LineaASincronizar[11], 1, 100);
                 Idioma := LineaASincronizar[12];
                 Telefono := Copy(LineaASincronizar[13], 1, 15);
                 // ??? := LineaASincronizar[14];
                 NroFactura := LineaASincronizar[15];

                 NombreFacturacion := Trim(Copy(LineaASincronizar[16], 1, 60));
                 EmpresaFacturacion := Trim(Copy(LineaASincronizar[17], 1, 60));
                 NIFFacturacion := UpperCase(Copy(Trim(LineaASincronizar[18]), 1, 20));
                 DireccionFacturacion := Copy(LineaASincronizar[19], 1, 100);
                 CodigoPostalFacturacion := Copy(LineaASincronizar[20], 1, 10);
                 PoblacionFacturacion := Copy(LineaASincronizar[21], 1, 40);
                 // ProvinciaFacturacion := Copy(LineaASincronizar[21],1,40);

                 TipoPago := LineaASincronizar[22];
                 Estado := LineaASincronizar[23];
                 Contabilizado := LineaASincronizar[24];
                 Facturado := LineaASincronizar[25];
                 // 0 := LineaASincronizar[26];
                 ZonaPortes := LineaASincronizar[27];
                 {
                 BaseImponibleTotal := StrToFloatDef(LineaASincronizar[28], 0);
                 }
                 BaseImponiblePortes := StrToFloatDef(LineaASincronizar[29], 0);
                 {
                 BaseImponibleComision := StrToFloatDef(LineaASincronizar[30], 0);
                 }
                 IdPais := LineaASincronizar[31];
                 ConIVA := LineaASincronizar[32];

                 // Verifico si ya ha sido importada la factura.
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT ID_S FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SERIE = :SERIE AND TIPO = :TIPO AND SU_REFERENCIA = :SU_REFERENCIA';
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                       Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                       Params.ByName['SERIE'].AsString := Serie;
                       Params.ByName['TIPO'].AsString := 'FAC';
                       Params.ByName['SU_REFERENCIA'].AsString := Format('MYMB-%s', [NroPedido]);
                       ExecQuery;
                       ID_S := FieldByName['ID_S'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (ID_S = 0) then
                 begin
                    try
                       with DMFacturas.QMCabecera do
                       begin
                          Insert;
                          FieldByName('SU_REFERENCIA').AsString := Format('MYMB-%s', [NroPedido]);
                          FieldByName('CLIENTE').AsInteger := -1;
                          FieldByName('AGENTE').AsInteger := Agente;
                          FieldByName('FECHA').AsDateTime := FechaPago;
                          FieldByName('ALMACEN').AsString := Almacen;
                          FieldByName('FORMA_PAGO').AsString := FormaPago;
                          FieldByName('NOTAS').AsString := Lineas.Text;
                          if (BaseImponiblePortes > 0) then
                          begin
                             FieldByName('TIPO_PORTES').AsInteger := 4;
                             FieldByName('I_PORTES').AsFloat := BaseImponiblePortes;
                          end;
                          Post;
                          ID_S := FieldByName('ID_S').AsInteger;
                       end;

                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Clear;
                             SQL.Add(' INSERT INTO GES_CABECERAS_S_FAC_NIF ( ');
                             SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, NOMBRE, NIF, DIRECCION, C_POSTAL, PROVINCIA, PAIS, LOCALIDAD, ');
                             SQL.Add(' TELEFONO01, TELEFONO02, TELEFAX, EMAIL, NOTAS, COLONIA) ');
                             SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, :NOMBRE, :NIF, :DIRECCION, :C_POSTAL, :PROVINCIA, :PAIS, ');
                             SQL.Add('        :LOCALIDAD, :TELEFONO01, :TELEFONO02, :TELEFAX, :EMAIL, :NOTAS, :COLONIA ');
                             SQL.Add(' FROM GES_CABECERAS_S ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_S = :ID_S  ');
                             Params.ByName['ID_S'].AsInteger := ID_S;

                             if (NombreFacturacion > '') then
                             begin
                                Params.ByName['NOMBRE'].AsString := NombreFacturacion;
                                Params.ByName['NIF'].AsString := NIFFacturacion;
                                Params.ByName['DIRECCION'].AsString := DireccionFacturacion;
                                Params.ByName['C_POSTAL'].AsString := CodigoPostalFacturacion;
                                Params.ByName['PROVINCIA'].AsString := ProvinciaFacturacion;
                                Params.ByName['PAIS'].AsString := REntorno.Pais;
                                Params.ByName['LOCALIDAD'].AsString := PoblacionFacturacion;
                                Params.ByName['TELEFONO01'].AsString := '';
                                Params.ByName['TELEFONO02'].AsString := '';
                                Params.ByName['TELEFAX'].AsString := '';
                                Params.ByName['EMAIL'].AsString := '';
                             end
                             else
                             begin
                                Params.ByName['NOMBRE'].AsString := Nombre;
                                Params.ByName['NIF'].AsString := NIF;
                                Params.ByName['DIRECCION'].AsString := Direccion;
                                Params.ByName['C_POSTAL'].AsString := CodigoPostal;
                                Params.ByName['PROVINCIA'].AsString := Provincia;
                                Params.ByName['PAIS'].AsString := REntorno.Pais;
                                Params.ByName['LOCALIDAD'].AsString := Poblacion;
                                Params.ByName['TELEFONO01'].AsString := Telefono;
                                Params.ByName['TELEFONO02'].AsString := '';
                                Params.ByName['TELEFAX'].AsString := '';
                                Params.ByName['EMAIL'].AsString := Email;
                             end;
                             // Params.ByName['NOTAS'].AsString := afEmpresa + #13#10 + afNom + ' ' + afCognoms + #13#10 + afAdreca1 + #13#10 + afAdreca2 + #13#10 + afCP + ' ' + afPoblcacion + #13#10 + afProvincia + #13#10 + Email + #13#10 + Telefon;
                             Params.ByName['COLONIA'].AsString := '';

                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    except
                       on E: Exception do
                       begin
                          Resumen.Add(Format('*** Error importando pedido %s', [NroPedido]));
                          Resumen.Add(E.Message);

                          Error := True;
                          Log(E.Message);
                       end;
                    end;
                 end
                 else
                 begin
                    Resumen.Add(Format('Pedido ya importado %s', [NroPedido]));
                    Log(Format(_('Pedido ya importado : "%s"'), [Format('MYMB-%s', [NroPedido])]));
                    ID_S := -1;
                 end;
              end
              else
              if (LineaASincronizar[0] = 'ARTICULO') then
              begin
                 if (ID_S > 0) then
                 begin
                    {
                 ARTICULO -> hace referencia a las lineas del pedido
                     ARTICULO; titulo producto; titulo multiprod; proveedor - referencia; cantidad; peso; volumen; precio; tipo prod (producto | multiple | pack); pertenece pack; codigo barras
                     ejemplo: ARTICULO; kit de bisagras; ; CTR-31030001; 6; 1,5; 0,001495; 9,48; producto;  ;8422502800803
                 En caso de que tenga algun codigo promocional se añadira una linia como si fuese una linia del pedido, los descuentos de cada producto ya vienen aplicados
                     ARTICULO; DTO; Descuento; Descuento; DTO-DTO; 1;0; 0; - base imponible descuento
                     ejemplo: ARTICULO; DTO; Descuento; Descuento; DTO-DTO; 1; 0; 0; -2,64
                 }

                    if (LineaASincronizar[1] = 'DTO') then
                    begin
                       Log(_('Linea Descuento ???'));

                       {
                    Descuento := LineaASincronizar[1];
                    Descuento := LineaASincronizar[2];
                    Descuento := LineaASincronizar[3];
                    Descuento := LineaASincronizar[4];
                    ??? := LineaASincronizar[5];
                    ??? := LineaASincronizar[6];
                    ??? := LineaASincronizar[7];
                    BaseImponibleDescuento := LineaASincronizar[8];

                    Log(_('Linea Descuento'));
                    Log(Format(_('Descuento: %s', [LineaASincronizar[1])));

                    }
                    end
                    else
                    begin
                       Lineas.Clear;
                       Lineas.Add(Format(_('Titulo Articulo: %s'), [LineaASincronizar[1]]));
                       Lineas.Add(Format(_('Titulo Multiproducto: %s'), [LineaASincronizar[2]]));
                       Lineas.Add(Format(_('???: %s'), [LineaASincronizar[3]]));
                       Lineas.Add(Format(_('Proveedor Referencia: %s'), [LineaASincronizar[4]]));
                       Lineas.Add(Format(_('Cantidad: %s'), [LineaASincronizar[5]]));
                       Lineas.Add(Format(_('Peso: %s'), [LineaASincronizar[6]]));
                       Lineas.Add(Format(_('Volumen: %s'), [LineaASincronizar[7]]));
                       Lineas.Add(Format(_('Precio: %s'), [LineaASincronizar[8]]));
                       Lineas.Add(Format(_('Tipo Articulo: %s'), [LineaASincronizar[9]]));
                       Lineas.Add(Format(_('Pertenece Pack: %s'), [LineaASincronizar[10]]));
                       Lineas.Add(Format(_('Codigo Barras: %s'), [LineaASincronizar[11]]));

                       // Log
                       Log('-----');
                       Log(_('Linea'));
                       Log('-----');
                       Log(Lineas.Text);

                       TituloArticulo := Trim(LineaASincronizar[2]);
                       TituloMultiproducto := Trim(LineaASincronizar[2]);
                       // ??? := LineaASincronizar[3];
                       ProveedorReferencia := LineaASincronizar[4];
                       Cantidad := StrToFloatDef(LineaASincronizar[5], 0);
                       {
                       Peso := StrToFloatDef(LineaASincronizar[6], 0);
                       Volumen := StrToFloatDef(LineaASincronizar[7], 0);
                       }
                       Precio := StrToFloatDef(LineaASincronizar[8], 0);
                       TipoArticulo := LineaASincronizar[9];
                       PertenecePack := LineaASincronizar[10];
                       CodigoBarras := LineaASincronizar[11];

                       if (TituloArticulo <> '') then
                          TituloArticulo := Copy(TituloArticulo, 1, 60)
                       else
                          TituloArticulo := Copy(TituloMultiproducto, 1, 60);

                       try
                          with DMFacturas.QMDetalle do
                          begin
                             Insert;
                             FieldByName('ARTICULO').AsString := REntorno.ArtTextoLibre;
                             FieldByName('TITULO').AsString := TituloArticulo;
                             FieldByName('UNIDADES').AsFloat := Cantidad;
                             FieldByName('PRECIO').AsFloat := Precio;
                             Post;
                             Edit;
                             FieldByName('NOTAS').AsString := Lineas.Text;
                             Post;
                          end;
                       except
                          on E: Exception do
                          begin
                             Resumen.Add(Format('*** Error importando linea de pedido %s', [NroPedido]));
                             Resumen.Add(E.Message);
                             Error := True;
                             Log(E.Message);
                          end;
                       end;
                    end;
                 end;
              end
              else
              begin
                 Resumen.Add(Format('*** Error importando linea de pedido %s', [NroPedido]));
                 Resumen.Add(Format(_('Tipo de linea incorrecta : "%s"'), [LineaASincronizar[0]]));
                 Error := True;
                 Log(Format(_('Tipo de linea incorrecta : "%s"'), [LineaASincronizar[0]]));
              end;

              FacturasASincronizar.Delete(0);

              if (Error) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'DELETE FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
                       Params.ByName['ID_S'].AsInteger := ID_S;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 Log(_('Borrando factura'));

                 ID_S := -1;
                 Error := False;
              end;
           end;
           if (Resumen.Count > 0) then
           begin
              Log('-------');
              Log(_('Resumen'));
              Log('-------');
              Log(Resumen.Text);
           end;
           Log(_('Importacion finalizada'));
        end;
     finally
        FacturasASincronizar.Free;
        LineaASincronizar.Free;
        Lineas.Free;
        Resumen.Free;
     end;
  finally
     CierraData(DMFacturas);
  end;
end;

end.
