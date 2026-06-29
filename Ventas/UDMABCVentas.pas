unit UDMABCVentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDatabase, UFIBModificados, FIBDataSet, FIBTableDataSet, FIBQuery,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMABCVentas = class(TDataModule)
     TLocal: THYTransaction;
     xTmp_Abc_Agentes: TFIBDataSetRO;
     DSxTmp_Abc_Agentes: TDataSource;
     frAbc: TfrHYReport;
     xAgrupacionCli: TFIBDataSetRO;
     DSxAgrupacionCli: TDataSource;
     xTmp_Abc_Clientes: TFIBDataSetRO;
     DSxTmp_Abc_Clientes: TDataSource;
     frDBxTmp_Abc_Clientes: TfrDBDataSet;
     xTmp_Abc_Articulos: TFIBDataSetRO;
     DSxTmp_Abc_Articulos: TDataSource;
     frDBxTmp_Abc_Articulos: TfrDBDataSet;
     xAgrupacionAge: TFIBDataSetRO;
     DSxAgrupacionAge: TDataSource;
     xAgrupacionArt: TFIBDataSetRO;
     DSxAgrupacionArt: TDataSource;
     xAgrupArtTitu: TFIBDataSetRO;
     DSxAgrupArtTitu: TDataSource;
     xAgrupArtTituTITULO: TFIBStringField;
     xAgrupCliTitu: TFIBDataSetRO;
     DSxAgrupCliTitu: TDataSource;
     xAgrupAgeTitu: TFIBDataSetRO;
     DSxAgrupAgeTitu: TDataSource;
     xAgrupAgeTituTITULO: TFIBStringField;
     xTmp_abc_agentes_fam: TFIBDataSetRO;
     DSxTmp_abc_agentes_fam: TDataSource;
     frDBxTmp_abc_agentes_fam: TfrDBDataSet;
     xTmp_agentes_art: TFIBDataSetRO;
     DSxTmp_agentes_art: TDataSource;
     frDBxTmp_agentes_art: TfrDBDataSet;
     xTmp_Abc_Clientes_Art: TFIBDataSetRO;
     DSxTmp_Abc_Clientes_Art: TDataSource;
     frDBxTmp_Abc_Clientes_Art: TfrDBDataSet;
     xTmp_Abc_Clientes_Fam: TFIBDataSetRO;
     DSxTmp_Abc_Clientes_Fam: TDataSource;
     frDBxTmp_Abc_Clientes_Fam: TfrDBDataSet;
     xTmp_Abc_familias: TFIBDataSetRO;
     DSxTmp_Abc_familias: TDataSource;
     frDBxTmp_Abc_familias: TfrDBDataSet;
     xAgrupacionCliH: TFIBDataSetRO;
     DSxAgrupacionCliH: TDataSource;
     xAgrupacionCliHTITULO: TFIBStringField;
     xAgrupacionAgeH: TFIBDataSetRO;
     DSxAgrupacionAgeH: TDataSource;
     xAgrupacionAgeHTITULO: TFIBStringField;
     xTmp_Abc_Clientes_cli: TFIBDataSetRO;
     DSxTmp_Abc_Clientes_cli: TDataSource;
     frDBxTmp_Abc_Clientes_cli: TfrDBDataSet;
     xAgrupacionArtH: TFIBDataSetRO;
     DSxAgrupacionArtH: TDataSource;
     frxAbc: TfrxHYReport;
     TUpdate: THYTransaction;
     xLstCliente: TFIBDataSetRO;
     DSxLstCliente: TDataSource;
     procedure DMABCVentasCreate(Sender: TObject);
     procedure DMABCVentasDestroy(Sender: TObject);
     procedure frAbcGetValue(const ParName: string; var ParValue: variant);
     procedure frAbcEnterRect(Memo: TStringList; View: TfrView);
     procedure xTmp_Abc_ArticulosAfterScroll(DataSet: TDataSet);
     procedure xTmp_Abc_AgentesAfterScroll(DataSet: TDataSet);
     procedure frxAbcBeforePrint(Sender: TfrxReportComponent);
     procedure frxAbcGetValue(const VarName: string; var Value: variant);
     procedure xTmp_Abc_ClientesAfterOpen(DataSet: TDataSet);
  private
     FechaDesde, FechaHasta: TDateTime;
     clas, Por_art, Por_fam: integer;
     RangoABCAge, RangoABCCli, RangoABCArt, RangoArt, RangoABCFam, RangoABCZona: string;
     procedure LimpiaTemporales;
  public
     art_agrupado, cli_agrupado, age_agrupado: smallint;
     DesglosaCli, DesglosaAge: boolean;
     procedure AcumulaAge(Canal: integer; ArtD, ArtH, FamD, FamH, SubFamD, SubFamH, ZonaD, ZonaH, Serie: string; Alcance: smallint; Agente, AgenteH, Por_Articulos, Por_Familias: integer; agrupacion, agrupacionh: string; Modo: integer; Borrar: boolean; FechaD, FechaH: TDateTime; PrecioCero, Albaran, AlbaranAbierto, AlbaranCerrado, FacturaAbierta, FacturaCerrada, DetallaAgentes: boolean; DCampana, HCampana: integer);
     procedure AcumulaCli(Canal: integer; ArtD, ArtH, FamD, FamH, SubFamD, SubFamH, ZonaD, ZonaH, Serie: string; Alcance: smallint; Cliente, clienteh, Por_Familias, Por_Articulos: integer; agrupacion: string; Modo: integer; Borrar: boolean; FechaD, FechaH: TDateTime; AgrupacionH: string; precio_cero, Albaran, AlbaranAbierto, AlbaranCerrado, FacturaAbierta, FacturaCerrada, DetallaClientes: boolean; DCampana, HCampana: integer);
     procedure AcumulaArt(Canal: integer; ArtD, ArtH, FamD, FamH, SubFamD, SubFamH, ZonaD, ZonaH, Serie: string; Alcance: smallint; Agrupacion, AgrupacionH: string; Modo: integer; Borrar: boolean; FechaD, FechaH: TDateTime; PrecioCero, Albaran, AlbaranAbierto, AlbaranCerrado, FacturaAbierta, FacturaCerrada: boolean);
     procedure Muestra(Modo, Clase, Orden, Agrup: smallint; aFechaDesde, aFechaHasta: TDateTime; SufijoArchivo: string = '');
     procedure CambiaAgrupacionCli(Agrupacion: string);
     procedure CambiaAgrupacionAge(Agrupacion: string);
     procedure CambiaAgrupacionAgeH(Agrupacion: string);
     procedure CambiaAgrupacionArt(Agrupacion: string);
     procedure CambiaAgrupacionArtH(Agrupacion: string);
     procedure CambiaAgrupacionCliH(Agrupacion: string);
  end;

var
  DMABCVentas : TDMABCVentas;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, IdGlobalProtocols; // UFPregABCVentas;

{$R *.DFM}

procedure TDMABCVentas.DMABCVentasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  // Inicializar Rangos de los Listados
  RangoABCAge := '';
  RangoABCCli := '';
  RangoABCArt := '';
  RangoABCFam := '';
  RangoABCZona := '';
end;

procedure TDMABCVentas.DMABCVentasDestroy(Sender: TObject);
begin
  LimpiaTemporales;

  CierraData(DMListados);
end;

procedure TDMABCVentas.CambiaAgrupacionCli(Agrupacion: string);
begin
  with xAgrupacionCli do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMABCVentas.AcumulaAge(Canal: integer; ArtD, ArtH, FamD, FamH, SubFamD, SubFamH, ZonaD, ZonaH, Serie: string; Alcance: smallint; Agente, AgenteH, Por_Articulos, Por_Familias: integer; agrupacion, agrupacionh: string; Modo: integer; Borrar: boolean; FechaD, FechaH: TDateTime; PrecioCero, Albaran, AlbaranAbierto, AlbaranCerrado, FacturaAbierta, FacturaCerrada, DetallaAgentes: boolean; DCampana, HCampana: integer);
begin
  DMListados.Normalizar_Desde_Hasta(Agente, AgenteH);
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  FechaDesde := HourIntoDate(FechaD, '00:00:00');
  FechaHasta := HourIntoDate(FechaH, '23:59:59');
  DMListados.Normalizar_Desde_Hasta(ArtD, ArtH);
  DMListados.Normalizar_Desde_Hasta(FamD, FamH);
  DMListados.Normalizar_Desde_Hasta(Agrupacion, AgrupacionH);
  Por_art := Por_articulos;
  Por_fam := Por_familias;
  DesglosaAge := DetallaAgentes;

  RangoArt := Format(_('De la familia %s-%s a la familia %s-%s' + #13#10 + 'Del artículo %s al artículo %s'), [FamD, SubFamD, FamH, SubFamH, ArtD, ArtH]);

  // Actualizar el Rango del Listado
  if (Modo = 0) then
  begin
     RangoABCAge := Format(_('Del agente %d al agente %d'), [Agente, AgenteH]);
     Agrupacion := '';
  end
  else
     RangoABCAge := Format(_('Por agrupación desde %s hasta %s'), [Agrupacion, AgrupacionH]);

  RangoABCAge := RangoABCAge + #13#10 + RangoArt;
  RangoABCZona := Format(_('Por zona desde %s hasta %s'), [ZonaD, ZonaH]);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_VENTAS_ABC_AGENTE(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :AGENTED, :AGENTEH, :AGRUPACION, :FECHAD, ');
        SQL.Add(' :FECHAH, :BORRAR, :MODO, :ALCANCE, :ENTRADA, :CANALCAL, :ARTICULOD, :ARTICULOH, :FAMILIAD, :FAMILIAH, :SUBFAMILIAD, ');
        SQL.Add(' :SUBFAMILIAH, :POR_FAMILIAS, :POR_ARTICULOS, :AGRUPACIONH, :PRECIOCERO, 0, :DCAMPANA, :HCAMPANA, :FACTURAABIERTA, :FACTURACERRADA, ');
        SQL.Add(' :ALBARANABIERTO, :ALBARANCERRADO, :ALBARAN, :DESGLOSA_AGE, :DESDE_ZONA, :HASTA_ZONA) ');

        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Serie'].AsString := Serie;
        Params.ByName['AgenteD'].AsInteger := Agente;
        Params.ByName['AgenteH'].AsInteger := AgenteH;
        Params.ByName['Agrupacion'].AsString := Agrupacion;
        Params.ByName['FechaD'].AsDateTime := FechaDesde;
        Params.ByName['FechaH'].AsDateTime := FechaHasta;
        Params.ByName['Borrar'].AsInteger := BoolToInt(Borrar);
        Params.ByName['Modo'].AsInteger := Modo;
        Params.ByName['Alcance'].AsInteger := Alcance;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['CanalCal'].AsInteger := REntorno.Canal;
        Params.ByName['ArticuloD'].AsString := ArtD;
        Params.ByName['ArticuloH'].AsString := ArtH;
        Params.ByName['FamiliaD'].AsString := FamD;
        Params.ByName['FamiliaH'].AsString := FamH;
        Params.ByName['SubFamiliaD'].AsString := SubFamD;
        Params.ByName['subFamiliaH'].AsString := SubFamH;
        Params.ByName['Por_Familias'].AsInteger := Por_familias;
        Params.ByName['Por_Articulos'].AsInteger := Por_Articulos;
        Params.ByName['Agrupacionh'].AsString := AgrupacionH;
        Params.ByName['PrecioCero'].AsInteger := BoolToInt(PrecioCero);
        Params.ByName['facturaabierta'].AsInteger := BoolToInt(facturaabierta);
        Params.ByName['facturacerrada'].AsInteger := BoolToInt(facturacerrada);
        Params.ByName['albaranabierto'].AsInteger := BoolToInt(albaranabierto);
        Params.ByName['albarancerrado'].AsInteger := BoolToInt(albarancerrado);
        Params.ByName['albaran'].AsInteger := BoolToInt(albaran);
        Params.ByName['DESGLOSA_AGE'].AsInteger := BoolToInt(DetallaAgentes);
        Params.ByName['DCampana'].AsInteger := DCampana;
        Params.ByName['HCampana'].AsInteger := HCampana;
        Params.ByName['DESDE_ZONA'].AsString := ZonaD;
        Params.ByName['HASTA_ZONA'].AsString := ZonaH;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMABCVentas.AcumulaCli(Canal: integer; ArtD, ArtH, FamD, FamH, SubFamD, SubFamH, ZonaD, ZonaH, Serie: string; Alcance: smallint; Cliente, clienteh, Por_familias, Por_Articulos: integer; agrupacion: string; Modo: integer; Borrar: boolean; FechaD, FechaH: TDateTime; AgrupacionH: string; precio_cero, Albaran, AlbaranAbierto, AlbaranCerrado, FacturaAbierta, FacturaCerrada, DetallaClientes: boolean; DCampana, HCampana: integer);
begin
  DMListados.Normalizar_Desde_Hasta(Cliente, ClienteH);
  DMListados.Normalizar_Desde_Hasta(Agrupacion, AgrupacionH);
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  FechaDesde := HourIntoDate(FechaD, '00:00:00');
  FechaHasta := HourIntoDate(FechaH, '23:59:59');
  DMListados.Normalizar_Desde_Hasta(ArtD, ArtH);
  DMListados.Normalizar_Desde_Hasta(FamD, FamH);

  Por_art := Por_articulos;
  Por_fam := Por_familias;
  DesglosaCli := DetallaClientes;

  RangoArt := Format(_('De la familia %s-%s a la familia %s-%s' + #13#10 + 'Del artículo %s al artículo %s'), [FamD, SubFamD, FamH, SubFamH, ArtD, ArtH]);

  // Actualizar el Rango del Listado
  if (Modo = 0) then
  begin
     RangoABCCli := Format(_('Del cliente %d al cliente %d'), [Cliente, ClienteH]);
     Agrupacion := '';
  end
  else
     RangoABCCli := Format(_('Por agrupación desde %s hasta %s'), [Agrupacion, AgrupacionH]);

  RangoABCCli := RangoABCCli + #13#10 + RangoArt;
  RangoABCZona := Format(_('Por zona desde %s hasta %s'), [ZonaD, ZonaH]);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_VENTAS_ABC_CLIENTE( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CLIENTED, :CLIENTEH, :AGRUPACION, :FECHAD, ');
        SQL.Add(' :FECHAH, :BORRAR, :MODO, :ALCANCE, :ENTRADA, :CANALCAL, :ARTICULOD, :ARTICULOH, ');
        SQL.Add(' :FAMILIAD, :FAMILIAH, :SUBFAMILIAD, :SUBFAMILIAH, :POR_FAMILIAS, :POR_ARTICULOS, ');
        SQL.Add(' :AGRUPACIONH, :PRECIO_CERO, 0, :DCAMPANA, :HCAMPANA, ');
        SQL.Add(' :FACTURAABIERTA,  :FACTURACERRADA, :ALBARANABIERTO, :ALBARANCERRADO, :ALBARAN, ');
        SQL.Add(' :DESGLOSA_CLI, :DESDE_ZONA, :HASTA_ZONA) ');
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Serie'].AsString := Serie;
        Params.ByName['ClienteD'].AsInteger := Cliente;
        Params.ByName['ClienteH'].AsInteger := Clienteh;
        Params.ByName['Agrupacion'].AsString := Agrupacion;
        Params.ByName['FechaD'].AsDateTime := FechaDesde;
        Params.ByName['FechaH'].AsDateTime := FechaHasta;
        Params.ByName['Borrar'].AsInteger := BoolToInt(Borrar);
        Params.ByName['Modo'].AsInteger := Modo;
        Params.ByName['Alcance'].AsInteger := Alcance;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['CanalCal'].AsInteger := REntorno.Canal;
        Params.ByName['ArticuloD'].AsString := ArtD;
        Params.ByName['ArticuloH'].AsString := ArtH;
        Params.ByName['FamiliaD'].AsString := FamD;
        Params.ByName['FamiliaH'].AsString := FamH;
        Params.ByName['SubFamiliaD'].AsString := SubFamD;
        Params.ByName['SubFamiliaH'].AsString := SubFamH;
        Params.ByName['Por_Familias'].AsInteger := Por_familias;
        Params.ByName['Por_Articulos'].AsInteger := Por_Articulos;
        Params.ByName['AgrupacionH'].AsString := AgrupacionH;
        Params.ByName['precio_cero'].AsInteger := BoolToInt(precio_cero);
        Params.ByName['facturaabierta'].AsInteger := BoolToInt(facturaabierta);
        Params.ByName['facturacerrada'].AsInteger := BoolToInt(facturacerrada);
        Params.ByName['albaranabierto'].AsInteger := BoolToInt(albaranabierto);
        Params.ByName['albarancerrado'].AsInteger := BoolToInt(albarancerrado);
        Params.ByName['albaran'].AsInteger := BoolToInt(albaran);
        Params.ByName['DESGLOSA_CLI'].AsInteger := BoolToInt(DetallaClientes);
        Params.ByName['DCampana'].AsInteger := DCampana;
        Params.ByName['HCampana'].AsInteger := HCampana;
        Params.ByName['DESDE_ZONA'].AsString := ZonaD;
        Params.ByName['HASTA_ZONA'].AsString := ZonaH;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMABCVentas.AcumulaArt(Canal: integer; ArtD, ArtH, FamD, FamH, SubFamD, SubFamH, ZonaD, ZonaH, Serie: string; Alcance: smallint; Agrupacion, AgrupacionH: string; Modo: integer; Borrar: boolean; FechaD, FechaH: TDateTime; PrecioCero, Albaran, AlbaranAbierto, AlbaranCerrado, FacturaAbierta, FacturaCerrada: boolean);
begin
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);
  FechaDesde := HourIntoDate(FechaD, '00:00:00');
  FechaHasta := HourIntoDate(FechaH, '23:59:59');
  DMListados.Normalizar_Desde_Hasta(ArtD, ArtH);
  DMListados.Normalizar_Desde_Hasta(FamD, FamH);
  DMListados.Normalizar_Desde_Hasta(SubFamD, SubFamH);
  DMListados.Normalizar_Desde_Hasta(ZonaD, ZonaH);
  DMListados.Normalizar_desde_hasta(Agrupacion, AgrupacionH);

  if (Modo in [0, 2]) then // Por Artículos
  begin
     // Actualizar el Rango del Listado
     RangoABCArt := Format(_('De la familia %s a la familia %s'), [FamD, FamH]) + #13#10;
     if ((SubFamD <> '') and (SubFamH <> '')) then
        RangoABCArt := RangoABCArt + Format(_('De la subfamilia %s a la subfamilia %s'), [SubFamD, SubFamH]) + #13#10;
     RangoABCArt := RangoABCArt + Format(_('Del artículo %s al artículo %s'), [ArtD, ArtH]);
     Agrupacion := '';
     RangoABCFam := RangoABCArt;
  end
  else
     RangoABCArt := Format(_('Por agrupación desde %s hasta %s'), [Agrupacion, AgrupacionH]);

  RangoABCZona := Format(_('Por zona desde %s hasta %s'), [ZonaD, ZonaH]);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_VENTAS_ABC_ARTICULO( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ARTICULOD, :ARTICULOH, ');
        SQL.Add(' :AGRUPACION, :FAMILIAD, :FAMILIAH, :SUBFAMILIAD, :SUBFAMILIAH, :FECHAD, :FECHAH, ');
        SQL.Add(' :BORRAR, :ALCANCE, :ENTRADA, :CANALCAL, :MODO, :AGRUPACIONH, ');
        SQL.Add(' :PRECIO_CERO, 0, :FACTURAABIERTA, :FACTURACERRADA, :ALBARANABIERTO, :ALBARANCERRADO, ');
        SQL.Add(' :ALBARAN, :DESDE_ZONA, :HASTA_ZONA) ');
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
        Params.ByName['Canal'].AsInteger := Canal;
        Params.ByName['Serie'].AsString := Serie;
        Params.ByName['ArticuloD'].AsString := ArtD;
        Params.ByName['ArticuloH'].AsString := ArtH;
        Params.ByName['Agrupacion'].AsString := Agrupacion;
        Params.ByName['FamiliaD'].AsString := FamD;
        Params.ByName['FamiliaH'].AsString := FamH;
        Params.ByName['SubFamiliaD'].AsString := SubFamD;
        Params.ByName['SubFamiliaH'].AsString := SubFamH;
        Params.ByName['FechaD'].AsDateTime := FechaDesde;
        Params.ByName['FechaH'].AsDateTime := FechaHasta;
        Params.ByName['Borrar'].AsInteger := BoolToInt(Borrar);
        Params.ByName['Alcance'].AsInteger := Alcance;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['CanalCal'].AsInteger := REntorno.Canal;
        Params.ByName['modo'].AsInteger := Modo;
        Params.ByName['agrupacionh'].AsString := agrupacionh;
        Params.ByName['precio_cero'].AsInteger := BoolToInt(PrecioCero);
        Params.ByName['FACTURAABIERTA'].AsInteger := BoolToInt(facturaabierta);
        Params.ByName['FACTURACERRADA'].AsInteger := BoolToInt(facturacerrada);
        Params.ByName['ALBARANABIERTO'].AsInteger := BoolToInt(albaranabierto);
        Params.ByName['ALBARANCERRADO'].AsInteger := BoolToInt(albarancerrado);
        Params.ByName['ALBARAN'].AsInteger := BoolToInt(albaran);
        Params.ByName['DESDE_ZONA'].AsString := ZonaD;
        Params.ByName['HASTA_ZONA'].AsString := ZonaH;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMABCVentas.Muestra(Modo, Clase, Orden, Agrup: smallint; aFechaDesde, aFechaHasta: TDateTime; SufijoArchivo: string = '');
var
  str, TituloListado, Archivo : string;
  Grupo : integer;
  DS : TDataSource;
begin
  DMMain.Log('DMABCVentas.Muestra');

  sw := 1;
  clas := Clase;
  FechaDesde := aFechaDesde;
  FechaHasta := aFechaHasta;
  Grupo := 64;

  case Clase of
     0:
     begin
        DS := DSxTmp_Abc_Agentes;
        Archivo := 'ABC_Venta_Agentes';
        Grupo := 64;
        TituloListado := Format(_('ABC de Ventas de %s'), [_('agente')]);

        case Orden of
           0: str := 'AGENTE';
           1: str := 'AGENTE DESC';
           2: str := 'MARGEN';
           3: str := 'MARGEN DESC';
           4: str := 'VENTAS';
           5: str := 'VENTAS DESC';
           6: str := 'NOMBRE';
           7: str := 'NOMBRE DESC';
        end;

        with xTmp_Abc_Agentes do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM TMP_ABC_AGENTE ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ENTRADA = ' + REntorno.EntradaStr);
           SelectSQL.Add(' AND TIPO_REGISTROS = 1 ');
           if (Agrup <> 0) then
              SelectSQL.Add(' AND AGRUPACION <> '''' ');
           SelectSQL.Add(' ORDER BY ' + str);
           Open;
        end;
     end;
     1:
     begin
        DS := DSxTmp_Abc_Clientes;
        Archivo := 'ABC_Venta_Clientes';
        Grupo := 65;
        TituloListado := Format(_('ABC de Ventas de %s'), [_('cliente')]);

        case Orden of
           0: str := 'CLIENTE, AGRUPACION';
           1: str := 'CLIENTE DESC, AGRUPACION DESC';
           2: str := 'MARGEN';
           3: str := 'MARGEN DESC';
           4: str := 'VENTAS';
           5: str := 'VENTAS DESC';
           6: str := 'NOMBRE';
           7: str := 'NOMBRE DESC';
        end;

        with xTmp_Abc_Clientes do
        begin
           Close;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT * FROM TMP_ABC_CLIENTE ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ENTRADA = ' + REntorno.EntradaStr);
           SelectSQL.Add(' AND TIPO_REGISTROS = 1 ');
           if (Agrup <> 0) then
              SelectSQL.Add(' AND AGRUPACION <> '''' ');
           SelectSQL.Add(' ORDER BY ' + str);
           Open;

           if (DesglosaCli) then
           begin
              xTmp_Abc_Clientes_cli.Close;
              xTmp_Abc_Clientes_cli.Open;
           end;

           DMMain.Log(SelectSQL.Text);
        end;
     end;
     2:
     begin
        case Orden of
           0: if Agrup <> 2 then
                 str := 'ARTICULO'
              else
                 str := 'FAMILIA';
           1: if Agrup <> 2 then
                 str := 'ARTICULO DESC'
              else
                 str := 'FAMILIA DESC';
           2: str := 'MARGEN';
           3: str := 'MARGEN DESC';
           4: str := 'VENTAS';
           5: str := 'VENTAS DESC';
           6: if Agrup <> 2 then
                 str := 'NOMBRE'
              else
                 str := 'TITULO';
           7: if Agrup <> 2 then
                 str := 'NOMBRE DESC'
              else
                 str := 'TITULO DESC';
        end;

        if Agrup = 2 then
        begin
           DS := DSxTmp_Abc_familias;
           Archivo := 'ABC_Venta_Familias';
           Grupo := 514;
           TituloListado := Format(_('ABC de Ventas de %s'), [_('familia')]);

           with xTmp_abc_familias do
           begin
              Close;
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT * FROM TMP_ABC_FAMILIA ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' ENTRADA = ' + REntorno.EntradaStr);
              SelectSQL.Add(' ORDER BY ' + str);
              Open;
           end;
        end
        else
        begin
           DS := DSxTmp_Abc_Articulos;
           Archivo := 'ABC_Venta_Articulos';
           Grupo := 66;
           TituloListado := Format(_('ABC de Ventas de %s'), [_('articulo')]);

           with xTmp_Abc_ARTICULOS do
           begin
              Close;
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT * FROM TMP_ABC_ARTICULO ');
              SelectSQL.Add(' WHERE ENTRADA=' + REntorno.EntradaStr);
              if (Agrup <> 0) then
                 SelectSQL.Add(' AND AGRUPACION <> '''' ');
              SelectSQL.Add(' ORDER BY ' + str);
              Open;
           end;
        end;
     end;
  end;

  DMMain.Log('DMListados.Imprimir');
  if (Modo = 2) then
  begin
     Archivo := Format(Archivo + '-%s.xls', [FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMABCVentas') then
        with DS.DataSet do
        begin
           ExportarExcel(Archivo, DS);
        end;
  end
  else
     try
        if (SufijoArchivo <> '') then
        begin
           DMListados.Imprimir(Grupo, 0, 2{Modo (a PDF)}, '', TituloListado, frAbc, frxAbc, nil, nil, Archivo + SufijoArchivo + '.pdf');
           CopyFileTo(DameTempPath + Archivo + SufijoArchivo + '.pdf', IncludeTrailingPathDelimiter(GetSpecialFolderPath(05, False)) + Archivo + SufijoArchivo + '.pdf');
        end
        else
           DMListados.Imprimir(Grupo, 0, Modo, '', TituloListado, frAbc, frxAbc, nil, nil);
     except
        on E: Exception do
        begin
           DMMain.Log('Exception: ' + #13#10 + E.Message);
           ShowMessage('Exception: ' + #13#10 + E.Message);
        end;
     end;
end;

procedure TDMABCVentas.frAbcGetValue(const ParName: string; var ParValue: variant);
begin
  DMMain.Log(format('frAbcGetValue(%s, ParValue)', [ParName]));

  DMListados.GetValue(ParName, ParValue);

  if ParName = 'FECHA1' then
     ParValue := FechaDesde;
  if ParName = 'FECHA2' then
     ParValue := FechaHasta;
  if ParName = 'TITULO' then
     ParValue := '';
  if ParName = 'RangoABCAge' then
     ParValue := RangoABCAge;
  if ParName = 'RangoABCCli' then
     ParValue := RangoABCCli;
  if ParName = 'RangoABCArt' then
     ParValue := RangoABCArt;
  if ParName = 'AgrupVisibleArt' then
     ParValue := art_agrupado;
  if ParName = 'AgrupVisibleAge' then
     ParValue := age_agrupado;
  if ParName = 'AgrupVisibleCli' then
     ParValue := cli_agrupado;
  if ParName = 'RangoABCFam' then
     ParValue := RangoABCFam;
  if ParName = 'DesglosaCli' then
     ParValue := DesglosaCli;
  if ParName = 'DesglosaAge' then
     ParValue := DesglosaAge;
  if ParName = 'RangoABCZona' then
     ParValue := RangoABCZona;
end;

procedure TDMABCVentas.frAbcEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMABCVentas.CambiaAgrupacionAge(Agrupacion: string);
begin
  with xAgrupacionAge do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMABCVentas.CambiaAgrupacionArt(Agrupacion: string);
begin
  with xAgrupacionArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMABCVentas.xTmp_Abc_ArticulosAfterScroll(DataSet: TDataSet);
begin
  with xAgrupArtTitu do
  begin
     Close;
     Open;
  end;
end;

procedure TDMABCVentas.xTmp_Abc_AgentesAfterScroll(DataSet: TDataSet);
begin
  with xAgrupAgeTitu do
  begin
     Close;
     Open;
  end;
end;

procedure TDMABCVentas.CambiaAgrupacionCliH(Agrupacion: string);
begin
  with xAgrupacionCliH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMABCVentas.CambiaAgrupacionAgeH(Agrupacion: string);
begin
  with xAgrupacionAgeH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMABCVentas.CambiaAgrupacionArtH(Agrupacion: string);
begin
  with xAgrupacionArtH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agrupacion'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMABCVentas.frxAbcBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMABCVentas.frxAbcGetValue(const VarName: string; var Value: variant);
begin
  frAbcGetValue(VarName, Value);
end;

procedure TDMABCVentas.xTmp_Abc_ClientesAfterOpen(DataSet: TDataSet);
begin
  with xAgrupCliTitu do
  begin
     Close;
     Open;
  end;

  with xLstCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMABCVentas.LimpiaTemporales;
var
  i : integer;
  Tablas : TStrings;
begin
  Tablas := TStringList.Create;
  try
     with Tablas do
     begin
        Add('TMP_ABC_AGENTE');
        Add('TMP_ABC_ARTICULO');
        Add('TMP_ABC_CLIENTE');
        Add('TMP_ABC_FAMILIA');
     end;

     for i := 0 to Tablas.Count - 1 do
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := format('DELETE FROM %s WHERE ENTRADA = %d', [Tablas[i], REntorno.Entrada]);
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  finally
     Tablas.Free;
  end;
end;

end.
