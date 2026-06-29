unit UDMClientesPotencialesKri;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, StdCtrls, Dialogs,
  FIBDatabase, UFIBModificados, FIBQuery, SysUtils, FIBDataSetRO, HYFIBQuery,
  FIBTableDataSetRO, ComObj, OleServer, Excel2000, Variants;

type
  TDMClientesPotencialesKri = class(TDataModule)
     QMClientes: TFIBTableSet;
     DSQMClientes: TDataSource;
     DSxTerceros: TDataSource;
     DSxAgentes: TDataSource;
     DSxFormasPago: TDataSource;
     DSxTarifas: TDataSource;
     DSxTipoTercero: TDataSource;
     TLocal: THYTransaction;
     xTerceros: TFIBDataSetRO;
     xTercerosNOMBRE_R_SOCIAL: TFIBStringField;
     xAgentes: TFIBDataSetRO;
     xAgentesTITULO: TFIBStringField;
     xTipoTercero: TFIBDataSetRO;
     xTipoTerceroTITULO: TFIBStringField;
     xFormasPago: TFIBDataSetRO;
     xTarifas: TFIBDataSetRO;
     xFormasPagoTITULO: TFIBStringField;
     xFormasPagoFORMA_PAGO: TFIBStringField;
     xMoneda: TFIBDataSetRO;
     DSxMoneda: TDataSource;
     xMonedaMONEDA: TFIBStringField;
     xMonedaTITULO: TFIBStringField;
     xMonedaSIGNO_MONEDA: TFIBStringField;
     xMonedaDEC_VER: TIntegerField;
     xMonedaDEC_CALCULOS: TIntegerField;
     xMonedaDEFECTO: TIntegerField;
     QMClientesEMPRESA: TIntegerField;
     QMClientesCLIENTE: TIntegerField;
     QMClientesTERCERO: TIntegerField;
     QMClientesTARIFA: TFIBStringField;
     QMClientesFORMA_PAGO: TFIBStringField;
     QMClientesDIA_PAGO_1: TIntegerField;
     QMClientesDIA_PAGO_2: TIntegerField;
     QMClientesDESCUENTO_PP: TFloatField;
     QMClientesDESCUENTO_CIAL: TFloatField;
     QMClientesAGENTE: TIntegerField;
     QMClientesNOTAS: TBlobField;
     QMClientesTITULO: TFIBStringField;
     QMClientesPAIS: TFIBStringField;
     QMClientesTIPO: TIntegerField;
     QMClientesPORTES: TIntegerField;
     QMClientesNOMBRE_COMERCIAL: TFIBStringField;
     QMClientesUSAR_ANTICIPOS: TIntegerField;
     QMClientesSU_PROVEEDOR: TFIBStringField;
     QMClientesEVAL_FEB: TIntegerField;
     QMClientesEVAL_FEB_SI: TIntegerField;
     QMClientesMONEDA: TFIBStringField;
     QMClientesFINANCIACION: TIntegerField;
     QMClientesPOR_FINANCIACION: TFloatField;
     xSeries: TFIBQuery;
     QMClientesTRANSPORTISTA: TIntegerField;
     QTransportista: THYFIBQuery;
     QMClientesSU_REFERENCIA: TFIBStringField;
     xBuscoMaxCte: TFIBQuery;
     QMClientesCREDITO_Y_CAUCION: TIntegerField;
     QMClientesNRO_EMPLEADOS: TIntegerField;
     QMClientesFACTURACION_TOTAL: TFloatField;
     QMClientesCONSUMO_MATERIAL: TFloatField;
     QMClientesPROVEEDORES_HABITUALES: TFIBStringField;
     QMClientesRUTA: TIntegerField;
     QMClientesTIPO_CLIENTE: TFIBStringField;
     QMClientesINTRA: TIntegerField;
     QMClientesINTRA_TRANS: TIntegerField;
     xTipoTrans: TFIBDataSetRO;
     xTipoTransTIPO: TIntegerField;
     xTipoTransTITULO: TFIBStringField;
     DSxTipoTrans: TDataSource;
     xPais: TFIBDataSetRO;
     xPaisPAIS: TFIBStringField;
     xPaisTITULO: TFIBStringField;
     xPaisPAIS_C2: TFIBStringField;
     xPaisPAIS_N3: TFIBStringField;
     xPaisCODIGO_TEL: TFIBStringField;
     xPaisIDIOMA: TFIBStringField;
     DSxPais: TDataSource;
     DSQMClientes2: TDataSource;
     QMClientesPOTENCIAL_DE_COMPRA: TFloatField;
     QMClientesPAIS_C2: TFIBStringField;
     QMClientesTIT_LOCALIDAD: TFIBStringField;
     QMClientesCODIGO_POSTAL: TFIBStringField;
     QPaisTercero: THYFIBQuery;
     QMClientesDIAS_ENTREGA: TIntegerField;
     QMClientesIDIOMA: TFIBStringField;
     xIdiomas: TFIBDataSetRO;
     xIdiomasTITULO: TFIBStringField;
     DSxIdiomas: TDataSource;
     xIncidencias: TFIBTableSet;
     DSxIncidencias: TDataSource;
     xIncidenciasEMPRESA: TIntegerField;
     xIncidenciasINCIDENCIA: TIntegerField;
     xIncidenciasTITULO_INCIDENCIA: TFIBStringField;
     xIncidenciasFECHA: TDateTimeField;
     xIncidenciasFECHA_RECEPCION: TDateTimeField;
     xIncidenciasTIPO_TERCERO: TFIBStringField;
     xIncidenciasCOD_CLI_PRO: TIntegerField;
     xIncidenciasTERCERO: TIntegerField;
     xIncidenciasTITULO_TERCERO: TFIBStringField;
     xIncidenciasDATOS_INCIDENCIA: TBlobField;
     xIncidenciasFECHA_RESPUESTA: TDateTimeField;
     xIncidenciasRESPUESTA_INCIDENCIA: TBlobField;
     xIncidenciasID_S: TIntegerField;
     xIncidenciasID_E: TIntegerField;
     xIncidenciasDOC_EJERCICIO: TIntegerField;
     xIncidenciasDOC_SERIE: TFIBStringField;
     xIncidenciasDOC_CANAL: TIntegerField;
     xIncidenciasDOC_TIPO: TFIBStringField;
     xIncidenciasDOC_RIG: TIntegerField;
     QMClientesAPLICAR_PTO_VERDE: TIntegerField;
     QMClientesCOD_CREDITO_Y_CAUCION: TIntegerField;
     QMClientesFRECUENCIA: TIntegerField;
     xAgrupSon: TFIBDataSetRO;
     DSxAgrupSon: TDataSource;
     xAgrupDisp: TFIBDataSetRO;
     DSxAgrupDisp: TDataSource;
     TUpdate: THYTransaction;
     xIncidenciasENTRADA: TIntegerField;
     xIncidenciasDIRECCION: TIntegerField;
     xIncidenciasDIR_NOMBRE: TFIBStringField;
     xIncidenciasAGENTE: TIntegerField;
     xIncidenciasCONTACTO: TIntegerField;
     xIncidenciasTIT_CONTACTO: TFIBStringField;
     xIncidenciasCONTACTO2: TIntegerField;
     xIncidenciasTIT_CONTACTO2: TFIBStringField;
     xIncidenciasCONTACTO3: TIntegerField;
     xIncidenciasTIT_CONTACTO3: TFIBStringField;
     xIncidenciasTIT_AGENTE: TFIBStringField;
     xIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField;
     xIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField;
     xIncidenciasUSUARIO: TIntegerField;
     xIncidenciasNOMBRE_USUARIO: TFIBStringField;
     xIncidenciasHORAS: TFloatField;
     xIncidenciasFINALIZADO: TIntegerField;
     procedure DMClientesPotencialesKriCreate(Sender: TObject);
     procedure QMClientesNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMClientesTERCEROChange(Sender: TField);
     procedure QMClientesAGENTEChange(Sender: TField);
     procedure QMClientesAfterOpen(DataSet: TDataSet);
     procedure QMClientesTARIFAChange(Sender: TField);
     procedure QMClientesTIPOChange(Sender: TField);
     procedure QMClientesBeforeEdit(DataSet: TDataSet);
     procedure DMClientesPotencialesKriDestroy(Sender: TObject);
     procedure QMClientesFORMA_PAGOChange(Sender: TField);
     procedure QMClientesPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMClientesMONEDAChange(Sender: TField);
     procedure QMClientesINTRA_TRANSChange(Sender: TField);
     procedure QMClientesPAIS_C2Change(Sender: TField);
     procedure QMClientesIDIOMAChange(Sender: TField);
     procedure QMClientesBeforePost(DataSet: TDataSet);
  private
     cambiar: boolean;
     // cuentaold: string;
     LocalMascaraN: string;
     FErrores: TextFile;
  public
     SQLBase: TStrings;
     Filtro_Agrupaciones: string;
     HayOR: boolean;
     cancelar_recalculo_riesgo, HayErrores: boolean; {dji lrk kri}
     // procedure Busca( Busca : string ) ;
     function BusquedaCompleja: integer;
     procedure AgrupacionRellena;
     procedure AgrupacionVacia;
     procedure VentasCliente;
     function cliente: integer;
     procedure CambiarTercero(Tercero: integer);
     procedure FiltraSeleccion;
     function HayDetalle: boolean;
     function CreaTercero(nombre_r_social, nombre_comercial, tipo_razon, nif: string; dir_clase: integer; dir_tipo, dir_nombre, dir_nombre_2, dir_localidad, telefono01, telefono02, telefax: string; dir_defecto, ID_LOCAL: integer; DIR_NUMERO, DIR_BLOQUE_ESCALERA, DIR_PISO, DIR_PUERTA, EMAIL: string): integer;
     function DameTerceroNif(NIF: string): integer;
     function DameTerceroTelefono1(Telefono1: string): integer;
     function DameTerceroTelefono2(Telefono2: string): integer;
     function DameTerceroTeleFax(TeleFax: string): integer;
     function DameLocalidad(Pais, localidad, codpos, provincia: string): string;
     function DameIDLocalidad(Localidad, Pais: string): integer;
     function CalculaSimilitud(s1, s2: string): integer;
     procedure CreaTerceroContacto(Tercero, Agente, Direccion, Padre: integer; Notas, Nombre, Apellidos, correo, Movil, Telfono, Fax, Extension, Zona, Departamento: string);
     function CreaClientePotencial(Tercero, Cliente, Agente: integer): integer;
     procedure AsignaAgrupacion(Agrupacion: string; Cliente_Pot: integer);
     function DameDepartamento(Departamento: string): string;
     procedure ImportacionClientesPotenciales;
     function VerificaAgente(Agente: string): integer;
     function VerificaTipoDir(Dir_Tipo: string): string;
  end;

var
  DMClientesPotencialesKri : TDMClientesPotencialesKri;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, uFBusca, UDMLSTClientes, UFPregEtiCliente,
  UFormGest, UFMVentasCli, UFMain, UFMTerceros, UFMClientes;

{$R *.DFM}

procedure TDMClientesPotencialesKri.DMClientesPotencialesKriCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Creamos la sentencia SQL básica para QMClientes
  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);

  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM VER_CLIENTES_POTENCIALES ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' EMPRESA = ?EMPRESA ');
  SQLBase.Add(' ORDER BY CLIENTE ');

  QMClientes.SelectSQL.Assign(SQLbase);

  QMClientesPOTENCIAL_DE_COMPRA.DisplayFormat := LocalMascaraN;

  QMClientesDESCUENTO_PP.DisplayFormat := MascaraP;
  QMClientesPOR_FINANCIACION.DisplayFormat := MascaraP;
  QMClientesDESCUENTO_CIAL.DisplayFormat := MascaraP;

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  if not (FMain.autcliente) then
     DMMain.FiltraTabla(QMClientes, '10000', REntorno.DatosAbiertos);
  Cambiar := False;
end;

procedure TDMClientesPotencialesKri.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMClientesPotencialesKri.QMClientesNewRecord(DataSet: TDataSet);
begin
  QMClientesEMPRESA.AsInteger := REntorno.Empresa;
  QMClientesFORMA_PAGO.AsString := 'CON';
  QMClientesTARIFA.AsString := REntorno.TarifaDefecto;
  QMClientesPAIS.AsString := REntorno.Pais;
  QMClientesAGENTE.AsInteger := 1;
  QMClientesTIPO.AsInteger := 1;
  QMClientesTercero.AsInteger := REntorno.Tercero;
  QMClientesPORTES.AsInteger := 0;
  // Rep. Dominicana no utilizará anticipos
  if (REntorno.Pais = 'DOM') then
     QMClientesUSAR_ANTICIPOS.AsInteger := 0
  else
     QMClientesUSAR_ANTICIPOS.AsInteger := 1;
  QMClientesEVAL_FEB.AsInteger := 0;
  QMClientesEVAL_FEB_SI.AsInteger := 0;
  QMClientesFINANCIACION.AsInteger := 0;
  QMClientesMONEDA.AsString := REntorno.Moneda;
  QMClientesPOR_FINANCIACION.AsFloat := 0;
  QMClientesCREDITO_Y_CAUCION.AsInteger := 0;
  QMClientesAPLICAR_PTO_VERDE.AsInteger := 0;
  cambiar := False;
  with QTransportista do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     ExecQuery;
     QMClientesTRANSPORTISTA.AsInteger := QTransportista.FieldByName['MINIMO'].AsInteger;
     FreeHandle;
  end;
  QMClientesINTRA.AsInteger := 0;
  QMClientesINTRA_TRANS.AsInteger := 0;

  QMClientesPAIS_C2.AsString := DamePaisC2(REntorno.Pais);
end;

procedure TDMClientesPotencialesKri.QMClientesTERCEROChange(Sender: TField);
begin
  with xTerceros do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Sender.AsInteger;
     Open;
  end;
  QMClientesTITULO.AsString := xTercerosNOMBRE_R_SOCIAL.AsString;

  with QPaisTercero do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := QMClientesTERCERO.AsInteger;
     ExecQuery;
     QMClientesPAIS_C2.AsString := FieldByName['PAIS_C2'].AsString;
     FreeHandle;
  end;
end;

procedure TDMClientesPotencialesKri.QMClientesAGENTEChange(Sender: TField);
begin
  with xAgentes do
  begin
     Close;
     Params.ByName['Agente'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

procedure TDMClientesPotencialesKri.QMClientesAfterOpen(DataSet: TDataSet);
begin
  DMMain.FiltraRO(xTarifas, '10000', False);
  DMMain.FiltraRO(xFormasPago, '11100', True);
  xTerceros.Open;
  xAgentes.Open;
  xTarifas.Open;
  xMoneda.Open;
  xTipoTercero.Open;
  xTipoTrans.Open;
  xPais.Open;
  xIdiomas.Open;
  xIncidencias.Open;
  xAgrupSon.Open;
  xAgrupDisp.Open;
end;

procedure TDMClientesPotencialesKri.QMClientesTARIFAChange(Sender: TField);
begin
  with xTarifas do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Tarifa'].AsString := Sender.AsString;
     Open;
  end;
end;

function TDMClientesPotencialesKri.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMClientes, '10000');
end;

procedure TDMClientesPotencialesKri.QMClientesTIPOChange(Sender: TField);
begin
  with xTipoTercero do
  begin
     Close;
     Open;
  end;
end;

procedure TDMClientesPotencialesKri.QMClientesBeforeEdit(DataSet: TDataSet);
begin
  cambiar := True;
end;

procedure TDMClientesPotencialesKri.AgrupacionRellena;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'execute procedure e_agrupaciones_rellena_pot(?agrupacion,?empresa,?cliente)';
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Cliente'].AsInteger := QMClientesCLIENTE.AsInteger;
        Params.ByName['Agrupacion'].AsString := xAgrupDisp.FieldByName('Agrupacion').AsString;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

procedure TDMClientesPotencialesKri.AgrupacionVacia;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'delete from emp_agrupaciones_pot ' +
           'where(agrupacion=?agrupacion)and(empresa=?empresa)and(cliente=?cliente)';
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Cliente'].AsInteger := QMClientesCLIENTE.AsInteger;
        Params.ByName['Agrupacion'].AsString := xAgrupSon.FieldByName('Agrupacion').AsString;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

procedure TDMClientesPotencialesKri.DMClientesPotencialesKriDestroy(Sender: TObject);
begin
  SQLbase.Free; // Destruimos la sentencia SQL base
end;

function TDMClientesPotencialesKri.cliente: integer;
begin
  Result := QMClientesTercero.AsInteger;
end;

procedure TDMClientesPotencialesKri.VentasCliente;
begin
  TFMVentasCli.Create(Self).MuestraCliente(QMClientesCLIENTE.AsInteger, 2);
end;

procedure TDMClientesPotencialesKri.QMClientesFORMA_PAGOChange(Sender: TField);
begin
  with xFormasPago do
  begin
     Close;
     Open;
  end;
end;

procedure TDMClientesPotencialesKri.QMClientesPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMClientes.State = dsInsert then
     QMClientesCLIENTE.Clear;
end;

procedure TDMClientesPotencialesKri.CambiarTercero(Tercero: integer);
var
  NewSQL : TStringList;
begin
  NewSQL := TStringList.Create;

  NewSQL.Text := 'SELECT * FROM VER_CLIENTES_POTENCIALES ' +
     'WHERE EMPRESA=?EMPRESA AND CLIENTE < -1 ORDER BY CLIENTE';

  QMClientes.Close;
  QMClientes.SelectSQL.Clear;
  QMClientes.SelectSQL.Add(NewSQL.Text);
  NewSQL.Free;
  DMMain.FiltraTabla(QMClientes, '10000', True);
  QMClientes.Insert;
  QMClientesTERCERO.AsInteger := Tercero;
end;

procedure TDMClientesPotencialesKri.QMClientesMONEDAChange(Sender: TField);
begin
  with xMoneda do
  begin
     Close;
     Params.ByName['Moneda'].AsString := QMClientesMONEDA.AsString;
     Open;
  end;
end;

procedure TDMClientesPotencialesKri.FiltraSeleccion;
var
  old_order, plan : string;
begin
  QMClientes.Close;
  plan := QMClientes.Plan.Text;
  QMClientes.Plan.Clear;
  old_order := QMClientes.OrdenadoPor;
  QMClientes.Ordenar('');
  QMClientes.SelectSQL.Text := QMClientes.SelectSQL.Text +
     'and (cliente in(select agt.cliente from tmp_clientes_agrupacion_tmp agt where agt.entrada=' +
     REntorno.EntradaStr + ')';
  if (HayOR = True) then
     QMClientes.SelectSQL.Text := QMClientes.SelectSQL.Text +
        ' or (cliente in(select ag.cliente from tmp_clientes_agrupacion ag' +
        ' where (ag.entrada=' + REntorno.EntradaStr + ')))';
  QMClientes.SelectSQL.Add(')');

  QMClientes.Ordenar(old_order);
  if ExisteParametro(QMClientes, 'EMPRESA') then
     QMClientes.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  if ExisteParametro(QMClientes, 'EJERCICIO') then
     QMClientes.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
  if ExisteParametro(QMClientes, 'CANAL') then
     QMClientes.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  QMClientes.Open;
  QMClientes.Plan.Text := plan;
end;

procedure TDMClientesPotencialesKri.QMClientesINTRA_TRANSChange(Sender: TField);
begin
  with xTipoTrans do
  begin
     Close;
     Open;
  end;
end;

procedure TDMClientesPotencialesKri.QMClientesPAIS_C2Change(Sender: TField);
begin
  with xPais do
  begin
     Close;
     Open;
  end;
end;

procedure TDMClientesPotencialesKri.QMClientesIDIOMAChange(Sender: TField);
begin
  with xIdiomas do
  begin
     Close;
     Open;
  end;
end;

function TDMClientesPotencialesKri.HayDetalle: boolean;
begin
  Result := (xIncidencias.FieldByName('INCIDENCIA').AsInteger <> 0);
end;

procedure TDMClientesPotencialesKri.QMClientesBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMClientesCLIENTE.AsInteger = 0)) then
     QMClientesCLIENTE.AsInteger := DMMain.Contador_E('XCP');
end;

function TDMClientesPotencialesKri.CreaTercero(nombre_r_social, nombre_comercial, tipo_razon, nif: string; dir_clase: integer; dir_tipo, dir_nombre, dir_nombre_2, dir_localidad, telefono01, telefono02, telefax: string; dir_defecto, ID_LOCAL: integer; DIR_NUMERO, DIR_BLOQUE_ESCALERA, DIR_PISO, DIR_PUERTA, EMAIL: string): integer;
var
  Q : THYFIBQuery;
  Tercero, Existe : integer;
begin
  Tercero := 0;

  if tipo_razon = '' then
     tipo_razon := 'DE';
  {Vemos si existe Tipo razon}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT COUNT (*) EXISTE FROM SYS_TERCEROS_RAZONES WHERE RAZON = ?RAZON';
     Params.ByName['RAZON'].AsString := tipo_razon;
     ExecQuery;
     Existe := FieldByName['EXISTE'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (existe < 1) then
  begin
     Append(FErrores);
     WriteLn(FErrores, 'Creando tercero ' + nombre_r_social + ', ' + nombre_comercial);
     WriteLn(FErrores, 'El tipo de Razon: ' + tipo_razon + ' en el Archivo de Excel no existe');
     WriteLn(FErrores, '----------------------------------------------------------------------');
     CloseFile(FErrores);
     tipo_razon := 'DE';
  end;

  try
     Tercero := DMMain.ContadorGen('CONTA_TERCEROS');
  except
     on e: Exception do
     begin
        Append(FErrores);
        WriteLn(FErrores, 'Creando tercero ' + nombre_r_social + ', ' + nombre_comercial);
        WriteLn(FErrores, 'No se pudo obtener el nro de tercero');
        WriteLn(FErrores, e.Message);
        WriteLn(FErrores, '----------------------------------------------------------------------');
        CloseFile(FErrores);
        HayErrores := True;
     end;
  end;

  if (not HayErrores) then
  begin
     {Insertamos Tercero}
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'insert into ver_terceros_edicion (tercero,nombre_r_social,nombre_comercial,tipo_razon,nif, ' +
           'dir_clase,dir_tipo,dir_nombre,dir_nombre_2,dir_localidad,telefono01,telefono02,telefax,dir_defecto,ID_LOCAL,DIR_NUMERO,DIR_BLOQUE_ESCALERA,DIR_PISO,DIR_PUERTA,EMAIL)        ' +
           'values (?tercero, ?nombre_r_social, ?nombre_comercial, ?tipo_razon, ?nif, ?dir_clase, ?dir_tipo, ?dir_nombre, ?dir_nombre_2, ?dir_localidad, ?telefono01, ?telefono02, ' +
           '?telefax, ?dir_defecto, ?ID_LOCAL, ?DIR_NUMERO, ?DIR_BLOQUE_ESCALERA, ?DIR_PISO, ?DIR_PUERTA,?EMAIL)';
        try
           Params.ByName['tercero'].AsInteger := Tercero;
           Params.ByName['nombre_r_social'].AsString := Trim(Copy(nombre_r_social, 1, 60));
           Params.ByName['nombre_comercial'].AsString := Trim(Copy(nombre_comercial, 1, 60));
           Params.ByName['tipo_razon'].AsString := Tipo_razon;
           Params.ByName['nif'].AsString := Trim(nif);
           Params.ByName['dir_clase'].AsInteger := dir_clase;
           Params.ByName['dir_tipo'].AsString := dir_tipo;
           Params.ByName['dir_nombre'].AsString := Trim(Copy(dir_nombre, 1, 40));
           Params.ByName['dir_nombre_2'].AsString := Trim(Copy(dir_nombre_2, 1, 40));
           Params.ByName['dir_localidad'].AsString := Trim(Copy(dir_localidad, 1, 8));
           Params.ByName['telefono01'].AsString := Trim(Copy(telefono01, 1, 20));
           Params.ByName['telefono02'].AsString := Trim(Copy(telefono02, 1, 20));
           Params.ByName['telefax'].AsString := Trim(Copy(telefax, 1, 20));
           Params.ByName['dir_defecto'].AsInteger := dir_defecto;
           Params.ByName['ID_LOCAL'].AsInteger := ID_LOCAL;
           Params.ByName['DIR_NUMERO'].AsString := Trim(Copy(DIR_NUMERO, 1, 15));
           Params.ByName['DIR_BLOQUE_ESCALERA'].AsString := Trim(Copy(DIR_BLOQUE_ESCALERA, 1, 4));
           Params.ByName['DIR_PISO'].AsString := Trim(Copy(DIR_PISO, 1, 2));
           Params.ByName['DIR_PUERTA'].AsString := Trim(Copy(DIR_PUERTA, 1, 6));
           Params.ByName['EMAIL'].AsString := Trim(Copy(EMAIL, 1, 100));

           ExecQuery;
        except
           on e: Exception do
           begin
              Append(FErrores);
              WriteLn(FErrores, 'Creando tercero ' + nombre_r_social + ', ' + nombre_comercial);
              WriteLn(FErrores, 'No se pudo Insertar el tercero : ' + IntToStr(Tercero));
              WriteLn(FErrores, e.Message);
              WriteLn(FErrores, '----------------------------------------------------------------------');
              CloseFile(FErrores);
              HayErrores := True;
           end;
        end;
        FreeHandle;
     end;
     FreeAndNil(Q);
     Append(FErrores);
     WriteLn(FErrores, 'Se ha insertado el tercero : ' + IntToStr(Tercero) + ', ' + nombre_r_social + ', ' + nombre_comercial);
     WriteLn(FErrores, '----------------------------------------------------------------------');
     CloseFile(FErrores);
  end;
  Result := Tercero;
end;

function TDMClientesPotencialesKri.DameTerceroNif(NIF: string): integer;
var
  Q : THYFIBQuery;
  Cantidad : integer;
begin
  Result := 0;

  {Verificamos si el tercero existe}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT COUNT(*) FROM SYS_TERCEROS WHERE NIF = ?NIF';
     Params.ByName['NIF'].AsString := NIF;
     ExecQuery;
     Cantidad := FieldByName['COUNT'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (Cantidad > 1) then
     Result := -1;

  if (Cantidad = 0) then
     Result := 0;

  if (Cantidad = 1) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TERCERO FROM SYS_TERCEROS WHERE NIF = ?NIF';
        Params.ByName['NIF'].AsString := NIF;
        ExecQuery;
        Result := FieldByName['TERCERO'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

function TDMClientesPotencialesKri.DameTerceroTelefono1(Telefono1: string): integer;
var
  Q : THYFIBQuery;
  Cantidad : integer;
begin
  Result := 0;

  {Verificamos si el tercero existe}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT COUNT(*) FROM SYS_TERCEROS WHERE TELEFONO01 = ?TELEFONO01';
     Params.ByName['TELEFONO01'].AsString := Telefono1;
     ExecQuery;
     Cantidad := FieldByName['COUNT'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (Cantidad > 1) then
     Result := -1;

  if (Cantidad = 0) then
     Result := 0;

  if (Cantidad = 1) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TERCERO FROM SYS_TERCEROS WHERE TELEFONO01 = ?TELEFONO01';
        Params.ByName['TELEFONO01'].AsString := Telefono1;
        ExecQuery;
        Result := FieldByName['TERCERO'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

function TDMClientesPotencialesKri.DameTerceroTelefono2(Telefono2: string): integer;
var
  Q : THYFIBQuery;
  Cantidad : integer;
begin
  Result := 0;

  {Verificamos si el tercero existe}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT COUNT(*) FROM SYS_TERCEROS WHERE TELEFONO02 = ?TELEFONO02';
     Params.ByName['TELEFONO02'].AsString := Telefono2;
     ExecQuery;
     Cantidad := FieldByName['COUNT'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (Cantidad > 1) then
     Result := -1;

  if (Cantidad = 0) then
     Result := 0;

  if (Cantidad = 1) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TERCERO FROM SYS_TERCEROS WHERE TELEFONO02 = ?TELEFONO02';
        Params.ByName['TELEFONO02'].AsString := Telefono2;
        ExecQuery;
        Result := FieldByName['TERCERO'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

function TDMClientesPotencialesKri.DameTerceroTeleFax(TeleFax: string): integer;
var
  Q : THYFIBQuery;
  Cantidad : integer;
begin
  Result := 0;

  {Verificamos si el tercero existe}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT COUNT(*) FROM SYS_TERCEROS WHERE TELEFAX = ?TELEFAX';
     Params.ByName['TELEFAX'].AsString := TeleFax;
     ExecQuery;
     Cantidad := FieldByName['COUNT'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (Cantidad > 1) then
     Result := -1;

  if (Cantidad = 0) then
     Result := 0;

  if (Cantidad = 1) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TERCERO FROM SYS_TERCEROS WHERE TELEFAX = ?TELEFAX';
        Params.ByName['TELEFAX'].AsString := TeleFax;
        ExecQuery;
        Result := FieldByName['TERCERO'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

function TDMClientesPotencialesKri.DameLocalidad(Pais, localidad, codpos, provincia: string): string;
var
  Q : THYFIBQuery;
  QT : TFIBQuery;
  cantidad, similitud : integer;
  x, s, l, p : string;
begin
  Result := '99999999';
  Cantidad := 0;
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select count(*) as cantidad from sys_localidades where pais=''' + Pais + ''' and codigo_postal=''' + Trim(codpos) + '''';
     try
        ExecQuery;
        cantidad := FieldByName['CANTIDAD'].AsInteger;
     except
        on e: Exception do
        begin
           Result := '99999999';
           Append(FErrores);
           WriteLn(FErrores, 'No se pudo obtener la cantidad de localidades con Cod. Postal: ' + CodPos + ' - Localidad: ' + Localidad + ' - Pais: ' + Pais);
           WriteLn(FErrores, e.Message);
           WriteLn(FErrores, '----------------------------------------------------------------------');
           CloseFile(FErrores);
           HayErrores := True;
        end;
     end;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (cantidad = 1) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select localidad from sys_localidades where pais=''' + Pais + ''' and codigo_postal=''' + Trim(codpos) + '''';
        try
           ExecQuery;
           Result := Trim(FieldByName['LOCALIDAD'].AsString);
        except
           on e: Exception do
           begin
              Result := '99999999';
              Append(FErrores);
              WriteLn(FErrores, 'No se pudo obtener la localidad con Cod. Postal: ' + CodPos + ' - Localidad: ' + Localidad + ' - Pais: ' + Pais);
              WriteLn(FErrores, e.Message);
              WriteLn(FErrores, '----------------------------------------------------------------------');
              CloseFile(FErrores);
           end;
        end;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end
  else
  begin
     if (cantidad = 0) then
     begin
        Result := '99999999';

        Append(FErrores);
        WriteLn(FErrores, 'No hay localidad con Cod. Postal: ' + CodPos + ' - Localidad: ' + Localidad + ' - Pais: ' + Pais);
        CloseFile(FErrores);

        p := '.';
        if (Trim(Provincia) > '') then
           p := Provincia;
        s := '          Busco Provincia con titulo: ' + p + ' - Pais: ' + Pais;

        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select provincia from sys_provincias where pais=''' + Pais + ''' and titulo=''' + Trim(p) + '''';
           try
              ExecQuery;
              p := Trim(FieldByName['PROVINCIA'].AsString);
              s := s + #13#10 + '          Encuentro provincia: ' + p + ' - Pais: ' + Pais;
           except
              p := '';

              Append(FErrores);
              WriteLn(FErrores, 'No se pudo obtener la localidad con Cod. Postal: ' + CodPos + ' - Localidad: ' + Localidad + ' - Pais: ' + Pais);
              WriteLn(FErrores, '----------------------------------------------------------------------');
              CloseFile(FErrores);
           end;
           FreeHandle;
        end;
        FreeAndNil(Q);

        if (p = '') then
        begin
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'select provincia from sys_provincias where pais=''' + Pais + ''' and provincia=''01''';
              try
                 ExecQuery;
                 p := Trim(FieldByName['PROVINCIA'].AsString);
                 s := s + #13#10 + '          Busco provincia: 01 - Pais: ' + Pais + ' y encuentro: ' + p;
              except
                 p := '';

                 Append(FErrores);
                 WriteLn(FErrores, 'No se pudo obtener la localidad con Cod. Postal: ' + CodPos + ' - Localidad: ' + Localidad + ' - Pais: ' + Pais);
                 WriteLn(FErrores, '----------------------------------------------------------------------');
                 CloseFile(FErrores);
              end;
              FreeHandle;
           end;
           FreeAndNil(Q);
        end;

        if (p = '') then
        begin
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'insert into sys_provincias (pais,provincia,titulo,codigo_tel,ine) values (''' + Pais + ''',''01'',''' + p + ''','''',''  '' ';
              try
                 ExecQuery;
                 p := '01';
                 s := s + #13#10 + '          Se inserto la provincia: 01 - ' + p + ' - Pais: ' + Pais;
              except
                 p := '';

                 Append(FErrores);
                 WriteLn(FErrores, 'No se pudo obtener la localidad con Cod. Postal: ' + CodPos + ' - Localidad: ' + Localidad + ' - Pais: ' + Pais);
                 WriteLn(FErrores, '----------------------------------------------------------------------');
                 CloseFile(FErrores);
              end;
              FreeHandle;
           end;
           FreeAndNil(Q);
        end;

        if (p > '') then
        begin
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'select max(localidad) as localidad from sys_localidades where pais=''' + Pais + ''' and localidad starting with ''' + pais + '''';
              try
                 ExecQuery;
                 x := FieldByName['LOCALIDAD'].AsString;
                 s := s + #13#10 + '          Busco max localidad ' + Pais + 'XXXXX: - Pais: ' + Pais;
                 s := s + #13#10 + '          Ecuentro localidad: ' + x + ' - Pais: ' + Pais;
                 x := IntToStr(StrToIntDef(Copy(x, 4, 5), 0) + 1);
                 while Length(x) < 5 do
                    x := '0' + x;
                 x := Pais + x;
                 Result := x;
                 s := s + #13#10 + '          Siguiente localidad: ' + x + ' - Pais: ' + Pais;
              except
                 Result := '99999999';

                 Append(FErrores);
                 WriteLn(FErrores, 'No se pudo obtener la localidad : ' + Pais + '00000');
                 WriteLn(FErrores, '----------------------------------------------------------------------');
                 CloseFile(FErrores);
              end;
              FreeHandle;
           end;
           FreeAndNil(Q);
           if localidad = '' then
              localidad := '99999999';
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'insert into sys_localidades (localidad,titulo,codigo_postal,pais,provincia) values (''' + x + ''',?localidad,''' + codpos + ''',''' + Pais + ''',''' + p + ''')';
              try
                 Params.ByName['LOCALIDAD'].AsString := localidad;
                 ExecQuery;
                 s := s + #13#10 + '          Se inserto la localidad: ' + x + ' - ' + localidad + ' - provincia: ' + p + ' - Pais: ' + Pais;
              except
                 p := '';
                 Append(FErrores);
                 WriteLn(FErrores, 'No se pudo insertar la localidad ' + x + ' - ' + localidad + ' - provincia: ' + p + ' - Pais: ' + Pais);
                 WriteLn(FErrores, '----------------------------------------------------------------------');
                 CloseFile(FErrores);
              end;
              FreeHandle;
           end;
           FreeAndNil(Q);
        end;
        Append(FErrores);
        WriteLn(FErrores, s);
        WriteLn(FErrores, '----------------------------------------------------------------------');
        CloseFile(FErrores);
     end
     else
     begin
        s := '          Varias localidades: Cod. Postal: ' + CodPos + ' - Localidad: ' + Localidad + ' - Pais: ' + Pais;

        QT := TFIBQuery.Create(nil);
        with QT do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'select localidad,titulo from sys_localidades where pais=''' + Pais + ''' and codigo_postal=''' + Trim(codpos) + '''';
              try
                 ExecQuery;
                 Result := Trim(FieldByName['LOCALIDAD'].AsString);
                 similitud := CalculaSimilitud(Trim(FieldByName['TITULO'].AsString), Trim(Localidad));
                 l := Trim(FieldByName['TITULO'].AsString);
                 while not EOF do
                 begin
                    if (similitud < CalculaSimilitud(Trim(FieldByName['TITULO'].AsString), Trim(Localidad))) then
                    begin
                       Result := Trim(FieldByName['LOCALIDAD'].AsString);
                       similitud := CalculaSimilitud(Trim(FieldByName['TITULO'].AsString), Trim(Localidad));
                       l := Trim(FieldByName['TITULO'].AsString);
                    end;
                    s := s + #13#10 + '                    ' + Trim(FieldByName['TITULO'].AsString);
                    Next;
                 end;
                 Append(FErrores);
                 WriteLn(FErrores, s + '          Elegido : ');
                 WriteLn(FErrores, '----------------------------------------------------------------------');
                 CloseFile(FErrores);
              except
                 Result := '99999999';
                 Append(FErrores);
                 WriteLn(FErrores, 'No se pudo obtener la localidad con Cod. Postal: ' + CodPos + ' - Localidad: ' + Localidad + ' - Pais: ' + Pais);
                 WriteLn(FErrores, '----------------------------------------------------------------------');
                 CloseFile(FErrores);
              end;
           finally
              Transaction.Free;
           end;
        end;
        FreeAndNil(QT);
     end;
  end;
end;

function TDMClientesPotencialesKri.DameIDLocalidad(Localidad, Pais: string): integer;
var
  Q : THYFIBQuery;
begin
  Result := 0;
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select id_local from sys_localidades where localidad=''' + Localidad + ''' and pais=''' + Pais + '''';
        try
           ExecQuery;
           Result := FieldByName['ID_LOCAL'].AsInteger;
        except
           on e: Exception do
           begin
              Append(FErrores);
              WriteLn(FErrores, 'No se pudo obtener ID_LOCAL de la localidad ' + Localidad + ' - Pais ' + Pais);
              WriteLn(FErrores, e.Message);
              WriteLn(FErrores, '----------------------------------------------------------------------');
              CloseFile(FErrores);
              HayErrores := True;
           end;
        end;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMClientesPotencialesKri.CreaTerceroContacto(Tercero, Agente, Direccion, Padre: integer; Notas, Nombre, Apellidos, correo, Movil, Telfono, Fax, Extension, Zona, Departamento: string);
var
  Q : THYFIBQuery;
  Contacto, Existe : integer;
begin
  {Verificamos si el contacto ya existe}
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM SYS_TERCEROS_CONTACTOS ' +
           'WHERE TERCERO = ?TERCERO AND NOMBRE = ?NOMBRE AND ' +
           'APELLIDOS = ?APELLIDOS';
        Params.ByName['TERCERO'].AsInteger := Tercero;
        Params.ByName['NOMBRE'].AsString := Nombre;
        Params.ByName['APELLIDOS'].AsString := Apellidos;
        ExecQuery;
        Existe := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if (Existe = 0) then
  begin
     {Buscamos ID Contacto}
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE COD_TERCERO_AUX(?TERCERO, ?MODO)';
        Params.ByName['TERCERO'].AsInteger := Tercero;
        Params.ByName['MODO'].AsInteger := 2;
        ExecQuery;
        Contacto := FieldByName['Cont'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);

     {Insertamos Contacto en Tercero}
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;

        SQL.Text := 'INSERT INTO SYS_TERCEROS_CONTACTOS ' +
           '(NOTAS,TERCERO,CONTACTO,NOMBRE,APELLIDOS,CORREO,MOVIL,TELEFONO,FAX,EXTENSION,AGENTE,ZONA,DIRECCION,PADRE,DEPARTAMENTO)' +
           'VALUES ' +
           '(?NOTAS,?TERCERO,?CONTACTO,?NOMBRE,?APELLIDOS,?CORREO,?MOVIL,?TELEFONO,?FAX,?EXTENSION,?AGENTE,?ZONA,?DIRECCION,?PADRE,?DEPARTAMENTO)';
        try
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Params.ByName['CONTACTO'].AsInteger := Contacto;
           Params.ByName['AGENTE'].AsInteger := Agente;
           Params.ByName['DIRECCION'].AsInteger := Direccion;
           Params.ByName['PADRE'].AsInteger := Padre;
           // Params.ByName['NOTAS'].AsString := Notas;
           Params.ByName['NOMBRE'].AsString := Nombre;
           Params.ByName['APELLIDOS'].AsString := Apellidos;
           Params.ByName['CORREO'].AsString := correo;
           Params.ByName['MOVIL'].AsString := Movil;
           Params.ByName['TELEFONO'].AsString := Telfono;
           Params.ByName['FAX'].AsString := Fax;
           Params.ByName['EXTENSION'].AsString := Extension;
           Params.ByName['ZONA'].AsString := Zona;
           Params.ByName['DEPARTAMENTO'].AsString := Departamento;
           ExecQuery;
        except
           on e: Exception do
           begin
              Append(FErrores);
              WriteLn(FErrores, 'No se pudo Insertar el Contacto: ' + IntToStr(Contacto) + ' Tercero: ' + IntToStr(Tercero) + ' Nombre: ' + Nombre + ' ' + Apellidos);
              WriteLn(FErrores, e.Message);
              WriteLn(FErrores, '----------------------------------------------------------------------');
              CloseFile(FErrores);
           end;
        end;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

function TDMClientesPotencialesKri.CalculaSimilitud(s1, s2: string): integer;
var
  i : integer;
begin
  if (s1 = s2) then
     Result := 1000
  else
  begin
     Result := 0;
     for i := 1 to Length(s1) do
     begin
        if (Pos(s1[i], s2) > 0) then
           Inc(Result);
     end;
     if (Length(s1) > 2) then
        for i := 1 to Length(s1) - 1 do
        begin
           if (Pos(s1[i] + s1[i + 1], s2) > 0) then
              Inc(Result, 2);
        end;
     if (Length(s1) > 3) then
        for i := 1 to Length(s1) - 2 do
        begin
           if (Pos(s1[i] + s1[i + 1] + s1[i + 2], s2) > 0) then
              Inc(Result, 3);
        end;
     if (Length(s1) > 4) then
        for i := 1 to Length(s1) - 3 do
        begin
           if (Pos(s1[i] + s1[i + 1] + s1[i + 2] + s1[i + 3], s2) > 0) then
              Inc(Result, 4);
        end;
     if (Length(s1) > 5) then
        for i := 1 to Length(s1) - 4 do
        begin
           if (Pos(s1[i] + s1[i + 1] + s1[i + 2] + s1[i + 3] + s1[i + 4], s2) > 0) then
              Inc(Result, 5);
        end;
  end;
end;

function TDMClientesPotencialesKri.CreaClientePotencial(Tercero, Cliente, Agente: integer): integer;
var
  Q : THYFIBQuery;
  {NOMBRE_COMERCIAL, TARIFA : string;}
begin
  Result := 0;

  {Busco Datos Tercero}
  {Q := THYFIBQuery.Create(nil);
   with Q do
   begin
      Close;
      DataBase := DMMain.DataBase ;
      SQL.Text := 'SELECT NOMBRE_COMERCIAL FROM SYS_TERCEROS WHERE TERCERO = ?TERCERO';
      Params.ByName['TERCERO'].AsInteger := Tercero;
      ExecQuery;
      NOMBRE_COMERCIAL := FieldByName['NOMBRE_COMERCIAL'].AsString;
      FreeHandle ;
   end;
   FreeAndNil(Q);}

  {Insertamos Cliente Potencial}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'INSERT INTO VER_CLIENTES_POTENCIALES (EMPRESA,TERCERO,CLIENTE, TARIFA,AGENTE,PAIS,PAIS_C2, TIPO,PORTES,MONEDA,NOMBRE_COMERCIAL) ' +
        'VALUES ' +
        '(?EMPRESA,?TERCERO,?CLIENTE, ?TARIFA,?AGENTE,?PAIS,?PAIS_C2,?TIPO,?PORTES,?MONEDA,?NOMBRE_COMERCIAL)';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Params.ByName['TARIFA'].AsString := 'NOR';
     Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['PAIS'].AsString := 'ESP';
     Params.ByName['PAIS_C2'].AsString := 'ES';
     Params.ByName['TIPO'].AsInteger := 1;
     Params.ByName['PORTES'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := REntorno.Moneda;
     Params.ByName['NOMBRE_COMERCIAL'].AsString := '';
     try
        ExecQuery;
        FreeHandle;
        Result := Cliente;
        Append(FErrores);
        WriteLn(FErrores, 'Se ha insertado el Cliente Potencial: ' + IntToStr(Cliente) + ', Tercero: ' + IntToStr(Tercero) + ', Agente: ' + IntToStr(Agente));
        WriteLn(FErrores, '----------------------------------------------------------------------');
        CloseFile(FErrores);
     except
        on e: Exception do
        begin
           Append(FErrores);
           WriteLn(FErrores, 'No se ha insertado el Cliente Potencial: ' + IntToStr(Cliente) + ', Tercero: ' + IntToStr(Tercero) + ', Agente: ' + IntToStr(Agente));
           WriteLn(FErrores, e.Message);
           WriteLn(FErrores, '----------------------------------------------------------------------');
           CloseFile(FErrores);
        end;
     end;
  end;
  FreeAndNil(Q);
end;

procedure TDMClientesPotencialesKri.AsignaAgrupacion(Agrupacion: string; Cliente_Pot: integer);
var
  Q : THYFIBQuery;
  Existe : integer;
begin
  { Verificamos si existe agrupación }
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT COUNT(*) FROM SYS_AGRUPACIONES WHERE AGRUPACION = ?AGRUPACION';
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     ExecQuery;
     Existe := FieldByName['COUNT'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if Existe <> 0 then
  begin
     {Insertamos registro en EMP_AGRUPACIONES_POT}
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO EMP_AGRUPACIONES_POT (EMPRESA, AGRUPACION,CLIENTE) VALUES (?EMPRESA, ?AGRUPACION, ?CLIENTE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['AGRUPACION'].AsString := Agrupacion;
        Params.ByName['CLIENTE'].AsInteger := Cliente_Pot;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);
     Append(FErrores);
     WriteLn(FErrores, 'Se ha insertado la Agrupación :' + Agrupacion + ' en el cliente potencial :' + IntToStr(Cliente_Pot));
     WriteLn(FErrores, '----------------------------------------------------------------------');
     CloseFile(FErrores);
  end
  else
  begin
     Append(FErrores);
     WriteLn(FErrores, 'NO se ha insertado la Agrupación :' + Agrupacion + ' en el cliente potencial :' + IntToStr(Cliente_Pot));
     WriteLn(FErrores, 'La agrupacion no existe');
     WriteLn(FErrores, '----------------------------------------------------------------------');
     CloseFile(FErrores);
  end;
end;

function TDMClientesPotencialesKri.DameDepartamento(Departamento: string): string;
var
  Q : THYFIBQuery;
  Titulo : string;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT TITULO FROM SYS_DEPARTAMENTOS WHERE DEPARTAMENTO = ?DEPARTAMENTO';
     Params.ByName['DEPARTAMENTO'].AsString := DEPARTAMENTO;
     ExecQuery;
     Titulo := FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (Trim(Titulo) = '') then
  begin
     Append(FErrores);
     WriteLn(FErrores, 'El Departamento ' + Departamento + ' no Existe');
     WriteLn(FErrores, '----------------------------------------------------------------------');
     CloseFile(FErrores);
  end;

  Result := Departamento;
end;

procedure TDMClientesPotencialesKri.ImportacionClientesPotenciales;
var
  {Total,} Fila, NIF, Telefono1, Telefono2, Telefax{, NIF_Existe, Telefono1_Existe, Telefono2_Existe} : integer;
  Tercero, ID_Localidad, Agente, CLiente_Pot, {i,} Vacios, c, Existe : integer;
  Localidad, Departamento{, TituloLocalidad}, Dir_Tipo : string;
  xls{, Sheet} : olevariant;
  Q : THYFIBQuery;
  Archivo : string;
begin
  {Creamos Log de importacion}
  AssignFile(FErrores, DameTempPath + 'ImpClientesPotenciales.log');
  if FileExists('ImpClientesPotenciales.log') then
     Append(FErrores)
  else
     Rewrite(FErrores);

  WriteLn(FErrores, '********************************');
  WriteLn(FErrores, 'Importación Clientes Potenciales');
  WriteLn(FErrores, '  ' + DateTimeToStr(Now));
  WriteLn(FErrores, '********************************');
  CloseFile(FErrores);

  NIF := 7;
  Telefono1 := 15;
  Telefono2 := 16;
  Telefax := 17;
  Fila := 4;

  Archivo := '';
  if MyOpenDialog(Archivo, 'XLS,ODS', '', 'DMClientesPotencialesKri-ImportacionClientesPotenciales') then
  begin
     xls := CreateOleObject('Excel.Application');
     // xls.Workbooks.ReadOnly;
     xls.Workbooks.Open(Archivo);
     xls.Visible := False;

     {Cuando encuentro 100 lineas vacias paro la importación}
     vacios := 0;
     while vacios < 100 do
     begin
        c := StrToIntDef(xls.WorkSheets[1].Cells[Fila, 1].Value, 0);
        if c = 0 then
           Inc(vacios)
        else
        begin
           vacios := 0;

           Append(FErrores);
           WriteLn(FErrores, '**********************************************************************');
           WriteLn(FErrores, 'Insertando Cliente Potencial');
           WriteLn(FErrores, 'Cliente Potencial: ' + IntToStr(xls.WorkSheets[1].Cells[Fila, 1].Value));
           WriteLn(FErrores, 'Agente: ' + IntToStr(xls.WorkSheets[1].Cells[Fila, 2].Value));
           WriteLn(FErrores, 'Nombre:' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, 5].Value)));
           WriteLn(FErrores, 'NIF: ' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, NIF].Value)));
           WriteLn(FErrores, '----------------------------------------------------------------------');
           CloseFile(FErrores);

           //Tercero := 0;
           {Verificamos si el Cliente Potencial ya existe}
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT COUNT(*) FROM VER_CLIENTES_POTENCIALES WHERE CLIENTE = ?CLIENTE';
              Params.ByName['CLIENTE'].AsInteger := xls.WorkSheets[1].Cells[Fila, 1].Value;
              ExecQuery;
              Existe := FieldByName['COUNT'].AsInteger;
              FreeHandle;
           end;
           FreeAndNil(Q);
           if (Existe = 0) then
           begin
              {Si tiene NIF busco si existe}
              if (Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, NIF].Value)) > '') then
              begin
                 Tercero := DameTerceroNIF(Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, NIF].Value)));

                 if (Tercero = -1) then
                 begin
                    Append(FErrores);
                    WriteLn(FErrores, 'El NIF pertence a mas de un tercero - ' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, NIF].Value)));
                    WriteLn(FErrores, '----------------------------------------------------------------------');
                    CloseFile(FErrores);
                 end;
              end
              else
              begin
                 {Si no tiene NIF busco si existe por nombre}
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT TERCERO FROM SYS_TERCEROS WHERE NOMBRE_R_SOCIAL = ?NOMBRE_R_SOCIAL';
                    Params.ByName['NOMBRE_R_SOCIAL'].AsString := Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, 5].Value));
                    ExecQuery;
                    Tercero := FieldByName['TERCERO'].AsInteger;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);

                 if (Tercero > 0) then
                 begin
                    Append(FErrores);
                    WriteLn(FErrores, 'Existe el tercero ' + IntToStr(Tercero) + ' con el nombre ' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, 5].Value)));
                    WriteLn(FErrores, '----------------------------------------------------------------------');
                    CloseFile(FErrores);
                 end
                 else
                 begin
                    {Busco por telefono}
                    Tercero := DameTerceroTelefono1(Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, Telefono1].Value)));
                    if (Tercero > 0) then
                    begin
                       Append(FErrores);
                       WriteLn(FErrores, 'Existe el tercero ' + IntToStr(Tercero) + ' con el teléfono ' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, Telefono1].Value)));
                       WriteLn(FErrores, '----------------------------------------------------------------------');
                       CloseFile(FErrores);
                    end
                    else
                       {Busco por telefono 2}
                    begin
                       Tercero := DameTerceroTelefono2(Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, Telefono2].Value)));
                       if (Tercero > 0) then
                       begin
                          Append(FErrores);
                          WriteLn(FErrores, 'Existe el tercero ' + IntToStr(Tercero) + ' con el teléfono ' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, Telefono2].Value)));
                          WriteLn(FErrores, '----------------------------------------------------------------------');
                          CloseFile(FErrores);
                       end
                       else
                          {Busco por Fax}
                       begin
                          if Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, Telefax].Value)) <> '' then
                          begin
                             Tercero := DameTerceroTelefax(Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, Telefax].Value)));
                             if (Tercero > 0) then
                             begin
                                Append(FErrores);
                                WriteLn(FErrores, 'Existe el tercero ' + IntToStr(Tercero) + ' con el Tele-Fax ' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, Telefax].Value)));
                                WriteLn(FErrores, '----------------------------------------------------------------------');
                                CloseFile(FErrores);
                             end;
                          end;
                       end;
                    end;
                 end;

                 if (Tercero = 0) then
                 begin
                    Append(FErrores);
                    WriteLn(FErrores, 'No existe el tercero con el nombre ' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, 5].Value)));
                    WriteLn(FErrores, 'Ni con el telefono ' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, Telefono1].Value)));
                    WriteLn(FErrores, 'Ni con el telefono ' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, Telefono2].Value)));
                    WriteLn(FErrores, '----------------------------------------------------------------------');
                    CloseFile(FErrores);
                    Tercero := 0;
                 end;
              end;

              if (Tercero = 0) then
              begin
                 {Busco Localidad e ID_Localidad}
                 Localidad := DameLocalidad
                    ('ESP', VarToStr(xls.WorkSheets[1].Cells[Fila, 20].Value), VarToStr(xls.WorkSheets[1].Cells[Fila, 19].Value),
                    Copy(VarToStr(xls.WorkSheets[1].Cells[Fila, 19].Value), 2, 2));

                 {Verifico si el Tipo_Dir ya existe}
                 Dir_Tipo := VerificaTipoDir(Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, 9].Value)));
                 if (Dir_tipo = '') then
                 begin
                    Dir_tipo := 'CL';
                    Append(FErrores);
                    WriteLn(FErrores, 'No existe el Tipo de dirección ' + Trim(VarToStr(xls.WorkSheets[1].Cells[Fila, 9].Value)));
                    CloseFile(FErrores);
                 end;
                 if (not HayErrores) then
                 begin
                    ID_Localidad := DameIDLocalidad(Localidad, 'ESP');

                    if (not HayErrores) then
                    begin
                       {Creamos Tercero}
                       Tercero := CreaTercero
                          (VarToStr(xls.WorkSheets[1].Cells[Fila, 4].Value){nombre_r_social}, VarToStr(xls.WorkSheets[1].Cells[Fila, 5].Value){nombre_comercial}, VarToStr(xls.WorkSheets[1].Cells[Fila, 6].Value){tipo_razon},
                          xls.WorkSheets[1].Cells[Fila, NIF].Value{nif}, 1{ dir_clase}, Dir_tipo{ dir_tipo}, VarToStr(xls.WorkSheets[1].Cells[Fila, 10].Value){dir_nombre}, VarToStr(xls.WorkSheets[1].Cells[Fila, 8].Value){dir_nombre_2},
                          Localidad{dir_localidad}, VarToStr(xls.WorkSheets[1].Cells[Fila, Telefono1].Value){telefono01}, VarToStr(xls.WorkSheets[1].Cells[Fila, Telefono2].Value){Telefono02}, VarToStr(xls.WorkSheets[1].Cells[Fila, Telefax].Value){Telefax},
                          1{dir_defecto}, ID_Localidad{ID_LOCAL}, VarToStr(xls.WorkSheets[1].Cells[Fila, 11].Value){DIR_NUMERO}, VarToStr(xls.WorkSheets[1].Cells[Fila, 12].Value){ DIR_BLOQUE_ESCALERA}, VarToStr(xls.WorkSheets[1].Cells[Fila, 13].Value){DIR_Piso},
                          VarToStr(xls.WorkSheets[1].Cells[Fila, 14].Value){DIR_PUERTA}, VarToStr(xls.WorkSheets[1].Cells[Fila, 18].Value){EMAIL});
                    end;
                 end;
                 if (HayErrores) then
                    Tercero := 0;
              end;

              if (Tercero > 0) then
              begin
                 { Verificamos Agente}
                 if VarToStr(VerificaAgente(Trim(xls.WorkSheets[1].Cells[Fila, 2].Value))) = '' then
                 begin
                    Append(FErrores);
                    WriteLn(FErrores, 'El Agente no existe ' + VarToStr(xls.WorkSheets[1].Cells[Fila, 2].Value));
                    WriteLn(FErrores, '----------------------------------------------------------------------');
                    CloseFile(FErrores);
                    Agente := 1;
                 end
                 else
                    Agente := VerificaAgente(Trim(xls.WorkSheets[1].Cells[Fila, 2].Value));

                 {Insertamos registros a SYS_TERCEROS_CONTACTOS}
                 {Contacto1}
                 if (Trim(xls.WorkSheets[1].Cells[Fila, 27].Value) > '') then
                 begin
                    Departamento := DameDepartamento(VarToStr(xls.WorkSheets[1].Cells[Fila, 33].Value));
                    CreaTerceroContacto(Tercero,
                       Agente,
                       {Direccion Defecto}1,{Padre}0,{Notas}'',
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 27].Value){Nombre},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 26].Value){Apellidos},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 28].Value){correo},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 32].Value){Movil},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 29].Value){Telefono},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 31].Value){Fax},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 30].Value){Extension},
                       ''{Zona},
                       Departamento);
                 end;

                 {Contacto2}
                 if (Trim(xls.WorkSheets[1].Cells[Fila, 35].Value) > '') then
                 begin
                    Departamento := DameDepartamento(VarToStr(xls.WorkSheets[1].Cells[Fila, 41].Value));
                    CreaTerceroContacto(Tercero,
                       Agente, {Direccion Defecto}1,{Padre}0,{Notas}'',
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 35].Value){Nombre},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 34].Value){Apellidos},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 36].Value){correo},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 40].Value){Movil},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 37].Value){Telefono},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 39].Value){Fax},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 38].Value){Extension},
                       ''{Zona},
                       Departamento);
                 end;

                 {Contacto3}
                 if (Trim(xls.WorkSheets[1].Cells[Fila, 43].Value) > '') then
                 begin
                    Departamento := DameDepartamento(VarToStr(xls.WorkSheets[1].Cells[Fila, 49].Value));
                    CreaTerceroContacto(Tercero,
                       Agente, {Direccion Defecto}1,{Padre}0,{Notas}'',
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 43].Value){Nombre},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 42].Value){Apellidos},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 44].Value){correo},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 48].Value){Movil},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 45].Value){Telefono},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 47].Value){Fax},
                       VarToStr(xls.WorkSheets[1].Cells[Fila, 46].Value){Extension},
                       ''{Zona},
                       Departamento);
                 end;

                 {Creamos Cliente Potencial}
                 Cliente_Pot := CreaClientePotencial(Tercero, xls.WorkSheets[1].Cells[Fila, 1].Value, Agente);

                 {Insertemos Agrupaciones}
                 AsignaAgrupacion(VarToStr(xls.WorkSheets[1].Cells[Fila, 22].Value), Cliente_Pot);
                 AsignaAgrupacion(VarToStr(xls.WorkSheets[1].Cells[Fila, 23].Value), Cliente_Pot);
                 AsignaAgrupacion(VarToStr(xls.WorkSheets[1].Cells[Fila, 24].Value), Cliente_Pot);
                 AsignaAgrupacion(VarToStr(xls.WorkSheets[1].Cells[Fila, 25].Value), Cliente_Pot);
              end;
           end
           else
           begin
              Append(FErrores);
              WriteLn(FErrores, 'El Cliente Potencial ' + VarToStr(xls.WorkSheets[1].Cells[Fila, 1].Value) + ' ya existe');
              WriteLn(FErrores, '----------------------------------------------------------------------');
              CloseFile(FErrores);
           end;
        end;
        Fila := Fila + 1;
     end;
     xls.Quit;
     ShowMessage(_('Importación de Clientes Potenciales Finalizada'));
  end;
end;

function TDMClientesPotencialesKri.VerificaAgente(Agente: string): integer;
var
  Count, Agente1 : integer;
  Q : THYFIBQuery;
begin
  Result := 1;
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*), AGENTE FROM EMP_AGENTES ' +
           'WHERE EMPRESA = ?EMPRESA AND AGENTE = ?AGENTE ' +
           'GROUP BY AGENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['AGENTE'].AsInteger := StrToInt(Agente);
        ExecQuery;
        Count := FieldByName['COUNT'].AsInteger;
        Agente1 := FieldByName['AGENTE'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  if Count = 1 then
     Result := Agente1;
  if Count = 0 then
     Result := 1;
end;

function TDMClientesPotencialesKri.VerificaTipoDir(Dir_Tipo: string): string;
var
  Q : THYFIBQuery;
  Count : integer;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*), TIPO FROM SYS_TIPO_DIRECCION ' +
           'WHERE TIPO = ?TIPO GROUP BY TIPO';
        Params.ByName['TIPO'].AsString := Dir_Tipo;
        ExecQuery;
        Count := FieldByName['COUNT'].AsInteger;
        Result := FieldByName['TIPO'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  if Count = 0 then
     Result := '';
end;

end.
