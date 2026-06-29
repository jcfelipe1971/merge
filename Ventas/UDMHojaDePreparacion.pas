unit UDMHojaDePreparacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, HYFIBQuery, FIBDataSetRO, FIBQuery;

type
  TDMHojaDePreparacion = class(TDataModule)
     QMCabecera: TFIBTableSet;
     QMDetalle: TFIBTableSet;
     DSQMCabecera: TDataSource;
     DSQMDetalle: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCabeceraID: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraHOJA: TIntegerField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraNOMBRE_R_SOCIAL: TFIBStringField;
     QMCabeceraFECHA_INICIO: TDateTimeField;
     QMCabeceraFECHA_FIN: TDateTimeField;
     QMCabeceraCOMENTARIO: TFIBStringField;
     QMCabeceraTOTAL_UNIDADES: TFloatField;
     QMCabeceraTOTAL_UNIDADES_LOGISTICAS: TFloatField;
     QMCabeceraDIRECCION: TIntegerField;
     QMCabeceraDIR_COMPLETA_N: TFIBStringField;
     QMDetalleID: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleHOJA: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA_PED: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES_PED: TFloatField;
     QMDetalleUNIDADES: TFloatField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     QMDetallePICO: TFloatField;
     QMDetallePUNTOS: TFloatField;
     QMDetallePESO: TFloatField;
     QMDetallePREPARACION: TIntegerField;
     QMDetalleID_HOJA: TIntegerField;
     QMDetalleID_S: TIntegerField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleLINEA_UBICACION: TIntegerField;
     QMDetalleUNIDADES_UBICACION: TFloatField;
     QMDetalleID_UBICACION: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleCALLE: TFIBStringField;
     QMDetalleESTANTERIA: TFIBStringField;
     QMDetalleREPISA: TFIBStringField;
     QMDetallePOSICION: TFIBStringField;
     QMDetalleTITULO_UBICACION: TFIBStringField;
     QMDetalleCOMPOSICION: TFIBStringField;
     QMDetalleGENERAL: TIntegerField;
     QMDetalleID_HOJA_UBICACION: TIntegerField;
     QMDetalleLOTE: TFIBStringField;
     QMDetallePre: TFIBTableSet;
     DSQMDetallePre: TDataSource;
     QMDetalleUbicacion: TFIBTableSet;
     DSQMDetalleUbicacion: TDataSource;
     QMDetalleUbicacionEMPRESA: TIntegerField;
     QMDetalleUbicacionHOJA: TIntegerField;
     QMDetalleUbicacionLINEA: TIntegerField;
     QMDetalleUbicacionLINEA_UBICACION: TIntegerField;
     QMDetalleUbicacionUNIDADES: TFloatField;
     QMDetalleUbicacionALMACEN: TFIBStringField;
     QMDetalleUbicacionCALLE: TFIBStringField;
     QMDetalleUbicacionESTANTERIA: TFIBStringField;
     QMDetalleUbicacionREPISA: TFIBStringField;
     QMDetalleUbicacionPOSICION: TFIBStringField;
     QMDetalleUbicacionVOLUMEN: TFloatField;
     QMDetalleUbicacionPESO: TFloatField;
     QMDetalleUbicacionDIAMETRO: TFloatField;
     QMDetalleUbicacionID: TIntegerField;
     QMDetalleUbicacionID_HOJA: TIntegerField;
     QMDetalleUbicacionID_HOJA_DET: TIntegerField;
     QMDetalleUbicacionID_A: TIntegerField;
     QMDetalleUbicacionID_DETALLES_S: TIntegerField;
     QMDetalleUbicacionID_UBICACION: TIntegerField;
     QMDetalleUbicacionID_A_UBICACION: TIntegerField;
     QMDetalleUbicacionID_D_S_UBICACION: TIntegerField;
     QMDetalleUbicacionLOTE: TFIBStringField;
     QMDetallePreEMPRESA: TIntegerField;
     QMDetallePreHOJA: TIntegerField;
     QMDetallePreLINEA: TIntegerField;
     QMDetallePreEJERCICIO: TIntegerField;
     QMDetallePreCANAL: TIntegerField;
     QMDetallePreSERIE: TFIBStringField;
     QMDetallePreTIPO: TFIBStringField;
     QMDetallePreRIG: TIntegerField;
     QMDetallePreLINEA_PED: TIntegerField;
     QMDetallePreALMACEN: TFIBStringField;
     QMDetallePreARTICULO: TFIBStringField;
     QMDetallePreUNIDADES_PED: TFloatField;
     QMDetallePreTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetallePreUNIDADES_LOGISTICAS: TFloatField;
     QMDetallePreUNIDADES: TFloatField;
     QMDetallePrePICO: TFloatField;
     QMDetallePrePUNTOS: TFloatField;
     QMDetallePrePESO: TFloatField;
     QMDetallePrePREPARACION: TIntegerField;
     QMDetallePreID: TIntegerField;
     QMDetallePreID_HOJA: TIntegerField;
     QMDetallePreID_S: TIntegerField;
     QMDetallePreID_DETALLES_S: TIntegerField;
     QMDetallePreID_A: TIntegerField;
     QMCabeceraRESPONSABLE: TIntegerField;
     QMCabeceraTITUTLO_RESPONSABLE: TFIBStringField;
     QMCabeceraID_EMPLEADO: TIntegerField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraTITULO_ESTADO: TStringField;
     QMCabeceraGENERAR_ALBARAN: TIntegerField;
     xPeso: TFIBDataSetRO;
     DSxPeso: TDataSource;
     xPesoPESO: TFloatField;
     xPesoPESO_TOTAL: TFloatField;
     QMDetallePreUNIDADES_A_SERVIR: TFloatField;
     QMDetallePreCAJAS: TIntegerField;
     QMCabeceraTOTAL_PUNTOS: TFloatField;
     QMDetalleUbicacionID_LOTE: TIntegerField;
     QMCabeceraCP: TFIBStringField;
     QMCabeceraLOCALIDAD: TFIBStringField;
     QMCabeceraPROVINCIA: TFIBStringField;
     QMCabeceraPAIS: TFIBStringField;
     QMDetalleUbicacionTITULO_UBICACION_SIMPLE: TStringField;
     QMDetallePreTITULO: TStringField;
     QMDetallePrePREPARABLE: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetallePreAfterOpen(DataSet: TDataSet);
     procedure QMDetallePreBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleUbicacionNewRecord(DataSet: TDataSet);
     procedure QMDetalleUbicacionAfterPost(DataSet: TDataSet);
     procedure QMCabeceraCLIENTEChange(Sender: TField);
     procedure QMDetalleUbicacionBeforePost(DataSet: TDataSet);
     procedure QMDetalleUbicacionCalcFields(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMDetallePreCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Refrescar;
     procedure GeneraAlbaran;
     procedure CambiaEstado(Direccion: integer);
     procedure DatosStocks(var Articulo, Almacen: string);
     procedure Infolotes;
     function ComprobarUnicadesUb: boolean;
     procedure FiltraHojas(Filtro: string);
     procedure BusquedaCompleja;
  end;

var
  DMHojaDePreparacion : TDMHojaDePreparacion;

implementation

uses UDMMain, UEntorno, UFMIntroduceLotes, UUtiles, UDameDato, UFBusca;

{$R *.dfm}

procedure TDMHojaDePreparacion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  with QMCabecera do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMHojaDePreparacion.DataModuleDestroy(Sender: TObject);
begin
  QMCabecera.Close;
end;

procedure TDMHojaDePreparacion.DatosStocks(var Articulo, Almacen: string);
begin
  Articulo := QMDetalleARTICULO.AsString;
  Almacen := QMDetalleALMACEN.AsString;
end;

procedure TDMHojaDePreparacion.GeneraAlbaran;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_HOJA_A_OTRO (?EMPRESA, ?HOJA, ?FECHA, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['HOJA'].AsInteger := QMCabeceraHOJA.AsInteger;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMHojaDePreparacion.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  QMDetallePre.Open;
end;

procedure TDMHojaDePreparacion.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  QMDetallePre.Close;
end;

procedure TDMHojaDePreparacion.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_HOJA_PREPARACION', 'ID');
end;

procedure TDMHojaDePreparacion.Refrescar;
begin
  UUtiles.Refrescar(QMCabecera, 'ID', QMCabeceraID.AsInteger);
end;

procedure TDMHojaDePreparacion.QMDetallePreAfterOpen(DataSet: TDataSet);
begin
  QMDetalleUbicacion.Open;
end;

procedure TDMHojaDePreparacion.QMDetallePreBeforeClose(DataSet: TDataSet);
begin
  QMDetalleUbicacion.Close;
end;

procedure TDMHojaDePreparacion.QMCabeceraTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  case QMCabeceraESTADO.AsInteger of
     0: Text := _('Normal');
     1: Text := _('Listado');
     2: Text := _('Preparado');
     3: Text := _('Listo albaranar');
     4: Text := _('Albaranado');
  end;
end;

procedure TDMHojaDePreparacion.CambiaEstado(Direccion: integer);
begin
  if ((not QMCabecera.IsEmpty) and (QMCabecera.Active)) then
  begin
     if ((Direccion = -1) and (QMCabeceraESTADO.AsInteger > 0)) or
        ((Direccion = 1) and (QMCabeceraESTADO.AsInteger < 4)) then
     begin
        QMCabecera.Edit;
        QMCabeceraESTADO.AsInteger := QMCabeceraESTADO.AsInteger + Direccion;
        QMCabecera.Post;
     end;
  end;
end;

procedure TDMHojaDePreparacion.QMDetalleUbicacionNewRecord(DataSet: TDataSet);
begin
  QMDetalleUbicacionID_HOJA.AsInteger := QMCabeceraID.AsInteger;
  QMDetalleUbicacionID_HOJA_DET.AsInteger := QMDetallePreID.AsInteger;
  QMDetalleUbicacionEMPRESA.AsInteger := QMDetallePreEmpresa.AsInteger;
  QMDetalleUbicacionHOJA.AsInteger := QMDetallePreHoja.AsInteger;
  QMDetalleUbicacionLINEA.AsInteger := QMDetallePreLINEA.AsInteger;
  QMDetalleUbicacionLINEA_UBICACION.AsInteger := 0; //Lo calcula el trigger
  QMDetalleUbicacionALMACEN.AsString := QMDetallePreALMACEN.AsString;

  // Buscamos linea subdetalle
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA_UBICACION)  AS LINEA_UBICACION FROM GES_DETALLES_S_PRE_UBICACIONES WHERE ID_HOJA_DET = ?ID_HOJA_DET';
        Params.ByName['ID_HOJA_DET'].AsInteger := QMDetalleUbicacionID_HOJA_DET.AsInteger;
        ExecQuery;
        QMDetalleUbicacionLINEA_UBICACION.AsInteger := FieldByName['LINEA_UBICACION'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMHojaDePreparacion.QMDetalleUbicacionAfterPost(DataSet: TDataSet);
begin
  // sfg.albert - Es comproben les unitats totals de les ubicacions. Si n'hi ha menys
  // que les unitats de pedido, no permetrà tirar endavant l'estat.
  // S'hauria de cridar des del formulari (PREGUNTAR DUILIO)
  // dji lrk kri - FMHojaDepreparacion.ComprobarUnicadesUb;

  // Refresca informacion de id_ubicaciones
  // QMDetalleUbicacion.Close;
  // QMDetalleUbicacion.Open;
end;

procedure TDMHojaDePreparacion.QMCabeceraCLIENTEChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT STD.DIRECCION, STD.DIR_COMPLETA_N FROM EMP_CLIENTES EC ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES STD ');
        SQL.Add(' ON EC.TERCERO = STD.TERCERO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EC.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EC.CLIENTE = ?CLIENTE AND ');
        SQL.Add(' STD.DIR_DEFECTO = 1 ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
        ExecQuery;
        QMCabeceraDIRECCION.AsInteger := FieldByName['DIRECCION'].AsInteger;
        QMCabeceraDIR_COMPLETA_N.AsString := FieldByName['DIR_COMPLETA_N'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMHojaDePreparacion.Infolotes;
var
  IntroduceLotes : TFMIntroduceLotes;
begin
  if (ArticuloLoteable(QMDetallePreARTICULO.AsString)) then
  begin
     if (QMDetalleUbicacion.State = dsBrowse) then
        QMDetalleUbicacion.Edit;
     IntroduceLotes := TFMIntroduceLotes.Create(Self);
     try
        with IntroduceLotes do
        begin
           QMDetalleUbicacionID_LOTE.AsInteger := AsignaArticulo('PRE', QMDetallePreSERIE.AsString,
              QMDetallePreARTICULO.AsString, QMDetallePreEJERCICIO.AsInteger,
              QMDetallePreHOJA.AsInteger,
              QMDetallePreLINEA.AsInteger, QMDetalleUbicacionUNIDADES.AsFloat,
              QMDetallePreALMACEN.AsString,
              QMDetallePreALMACEN.AsString, QMDetallePreCANAL.AsInteger,
              QMDetallePreCANAL.AsInteger, True, QMDetallePreID_A.AsInteger,
              QMDetallePreID_HOJA.AsInteger, 0, False);
        end;
     finally
        IntroduceLotes.Free;
     end;
  end;
end;

procedure TDMHojaDePreparacion.QMDetalleUbicacionBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(QMDetalleUbicacion, 'ID_HOJA_PREPARACION_UB', 'ID');
end;

function TDMHojaDePreparacion.ComprobarUnicadesUb: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM (UNIDADES) FROM GES_DETALLES_S_PRE_UBICACIONES WHERE ID_HOJA_DET = :ID_HOJA_DET';
        Params.ByName['ID_HOJA_DET'].AsInteger := QMDetalleUbicacionID_HOJA_DET.AsInteger;
        ExecQuery;
        Result := (FieldByName['SUM'].AsFloat < QMDetalleUNIDADES.AsFloat);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMHojaDePreparacion.QMDetalleUbicacionCalcFields(DataSet: TDataSet);
begin
  QMDetalleUbicacionTITULO_UBICACION_SIMPLE.AsString := DameTituloUbicacionSimple(QMDetalleUbicacionID_UBICACION.AsInteger);
end;

procedure TDMHojaDePreparacion.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TDMHojaDePreparacion.QMDetallePreCalcFields(DataSet: TDataSet);
begin
  QMDetallePreTITULO.AsString := DameTituloArticulo(QMDetallePreARTICULO.AsString);
end;

procedure TDMHojaDePreparacion.FiltraHojas(Filtro: string);
begin
  with QMCabecera do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_S_PRE ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' ESTADO < 4 ');
     if (Filtro > '') then
        SelectSQL.Add(' AND (' + Filtro + ')');
     SelectSQL.Add(' ORDER BY HOJA ');

     DMMain.FiltraTabla(QMCabecera, '10000');
  end;
end;

procedure TDMHojaDePreparacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '10000');
end;

end.
