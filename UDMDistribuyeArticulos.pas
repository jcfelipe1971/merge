unit UDMDistribuyeArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, HYFIBQuery, Dialogs,
  UComponentesBusquedaFiltrada;

type
  TDMDistribuyeArticulos = class(TDataModule)
     TLocal: THYTransaction;
     xArticulos: TFIBDataSetRO;
     xArticulosID_A: TIntegerField;
     xArticulosPESO: TFloatField;
     xArticulosUBICABLE: TIntegerField;
     xArticulosVOLUMEN_UNIT: TFloatField;
     xArticulosDIAMETRO_UNIT: TFloatField;
     DSxArticulos: TDataSource;
     QMDistribucion: TFIBTableSet;
     DSQMDistribucion: TDataSource;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     QMDistribucionEMPRESA: TIntegerField;
     QMDistribucionEJERCICIO: TIntegerField;
     QMDistribucionCANAL: TIntegerField;
     QMDistribucionSERIE: TFIBStringField;
     QMDistribucionTIPO: TFIBStringField;
     QMDistribucionRIG: TIntegerField;
     QMDistribucionLINEA: TIntegerField;
     QMDistribucionID_A: TIntegerField;
     QMDistribucionID_UBICACION: TIntegerField;
     QMDistribucionLINEA_UBICACION: TIntegerField;
     QMDistribucionUBICACION: TFIBStringField;
     QMDistribucionUNIDADES: TFloatField;
     QMDistribucionVOLUMEN: TFloatField;
     QMDistribucionPESO: TFloatField;
     QMDistribucionDIAMETRO: TFloatField;
     QMDistribucionID_A_UBICACION: TIntegerField;
     QMDistribucionGENERAL: TIntegerField;
     QMDistribucionALMACEN: TFIBStringField;
     QMDistribucionCALLE: TFIBStringField;
     QMDistribucionESTANTERIA: TFIBStringField;
     QMDistribucionREPISA: TFIBStringField;
     QMDistribucionPOSICION: TFIBStringField;
     QMDistribucionENTRADA: TIntegerField;
     QMDistribucionID_DETALLES: TIntegerField;
     QMDistribucionID_D_UBICACION: TIntegerField;
     QMDistribucionARTICULO: TFIBStringField;
     QMDistribucionTITULO: TFIBStringField;
     QMLoteUbicacion: TFIBTableSet;
     DSQMLoteUbicacion: TDataSource;
     QMLoteUbicacionCANTIDAD: TIntegerField;
     QMLoteUbicacionEMPRESA: TIntegerField;
     QMLoteUbicacionARTICULO: TFIBStringField;
     QMLoteUbicacionLOTE: TFIBStringField;
     QMLoteUbicacionCADUCIDAD: TDateTimeField;
     QMLoteUbicacionID_UBICACION: TIntegerField;
     QMLoteUbicacionALMACEN: TFIBStringField;
     QMLoteUbicacionCALLE: TFIBStringField;
     QMLoteUbicacionESTANTERIA: TFIBStringField;
     QMLoteUbicacionREPISA: TFIBStringField;
     QMLoteUbicacionPOSICION: TFIBStringField;
     QMLoteUbicacionTITULO: TFIBStringField;
     QMLoteUbicacionEJERCICIO: TIntegerField;
     QMLoteUbicacionCANAL: TIntegerField;
     QMLoteUbicacionSERIE: TFIBStringField;
     QMLoteUbicacionRIG: TIntegerField;
     QMLoteUbicacionLINEA: TIntegerField;
     TUpdate: THYTransaction;
     QMLotes: TFIBTableSet;
     DSQMLotes: TDataSource;
     xArticulosSERIALIZADO_KRI: TIntegerField;
     xArticulosLOTES_KRI: TIntegerField;
     QMLoteUbicacionENTRADA: TIntegerField;
     QMLotesCANTIDAD: TIntegerField;
     QMLotesEMPRESA: TIntegerField;
     QMLotesARTICULO: TFIBStringField;
     QMLotesLOTE: TFIBStringField;
     QMLotesCADUCIDAD: TDateTimeField;
     QMLotesID_UBICACION: TIntegerField;
     QMLotesALMACEN: TFIBStringField;
     QMLotesCALLE: TFIBStringField;
     QMLotesESTANTERIA: TFIBStringField;
     QMLotesREPISA: TFIBStringField;
     QMLotesPOSICION: TFIBStringField;
     QMLotesTITULO: TFIBStringField;
     QMLotesEJERCICIO: TIntegerField;
     QMLotesCANAL: TIntegerField;
     QMLotesSERIE: TFIBStringField;
     QMLotesRIG: TIntegerField;
     QMLotesLINEA: TIntegerField;
     QMLotesENTRADA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMDistribucionBeforePost(DataSet: TDataSet);
     procedure QMDistribucionUBICACIONChange(Sender: TField);
     procedure QMDistribucionNewRecord(DataSet: TDataSet);
     procedure QMDistribucionUNIDADESChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMLoteUbicacionNewRecord(DataSet: TDataSet);
     procedure QMLoteUbicacionAfterPost(DataSet: TDataSet);
     procedure QMLotesNewRecord(DataSet: TDataSet);
     procedure QMLotesAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     Volumen_Max, Peso_Max, Diametro_Max, Peso_Acc, Volumen_Acc, Diametro_Acc, Unidades_Doc: double;
     id_a_ubicacion, Id_Ubicacion, general: integer;
     almacen, calle, estanteria, repisa, posicion, SerieDM, TipoDM: string;
     empresaDM, ejercicioDM, CanalDM, RigDM, LineaDM, id_detalles_eDM, id_aDM: integer;
     procedure PonArticulo;
     procedure TraspasoATMP(id_a: integer);
     function CompruebaCapacidad(NPeso, NVolumen, NDiametro: double): boolean;
  public
     { Public declarations }
     procedure MuestraUbicacion(Empresa, Ejercicio, Canal, Rig, Linea, id_detalles, id_a: integer; Serie, Tipo: string; Unidades: double);
     function InsertaUbicacion: boolean;
     procedure BorraTemporal;
     function DameAlmacen: string;
  end;

var
  DMDistribuyeArticulos : TDMDistribuyeArticulos;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMDistribuyeArticulos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMDistribuyeArticulos.MuestraUbicacion(Empresa, Ejercicio, Canal, Rig, Linea, id_detalles, id_a: integer; Serie, Tipo: string; Unidades: double);
begin
  EmpresaDM := Empresa;
  EjercicioDM := Ejercicio;
  CanalDM := Canal;
  SerieDM := Serie;
  TipoDM := Tipo;
  RigDM := Rig;
  LineaDM := Linea;
  id_detalles_eDM := id_detalles;
  id_aDM := id_a;
  Unidades_doc := unidades;

  BorraTemporal;
  TraspasoATMP(id_aDM);
  PonArticulo;

  with QMDistribucion do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['ID_DETALLES'].AsInteger := id_detalles_eDM;
     Open;
  end;

  with QMLoteUbicacion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['CANAL'].AsInteger := CanalDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     Params.ByName['LINEA'].AsInteger := LineaDM;
     Params.ByName['ARTICULO'].AsString := xArticulosARTICULO.AsString;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with QMLotes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['CANAL'].AsInteger := CanalDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     Params.ByName['LINEA'].AsInteger := LineaDM;
     Params.ByName['ARTICULO'].AsString := xArticulosARTICULO.AsString;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMDistribuyeArticulos.PonArticulo;
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['ID_A'].AsInteger := id_aDM;
     Open;
  end;
end;

procedure TDMDistribuyeArticulos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMDistribuyeArticulos.QMDistribucionBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     QMDistribucionID_D_UBICACION.AsInteger := DMMain.ContadorGen('ID_D_E_UBICACION');
  end;

  if (DataSet.State = dsEdit) then
  begin
     {dji lrk kri - Ubico tambien unidades negativas
    if (DataSet.FieldByName('UNIDADES').AsFloat < 1) and
       (UdsEnteras(DataSet.FieldByName('ID_A').AsInteger)) then
      raise Exception.Create('Las unidades a ubicar no pueden ser menores que 1')
    else if (DataSet.FieldByName('UNIDADES').AsFloat <= 0) and
            (not UdsEnteras(DataSet.FieldByName('ID_A').AsInteger)) then
      raise Exception.Create('Las unidades a ubicar no pueden ser menores que o iguales a cero');}
  end;
end;

procedure TDMDistribuyeArticulos.QMDistribucionUBICACIONChange(Sender: TField);
var
  Error : boolean;
  V_Real, D_Real, P_Real : double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Transaction := TLocal;
        SQL.Add(' SELECT ALM.VOLUMEN_MAX AS VOLUMEN_MAX, ALM.DIAMETRO_MAX AS DIAMETRO_MAX, ALM.PESO_MAX AS PESO_MAX, ');
        SQL.Add('        ALM.VOLUMEN_ACC AS VOLUMEN_ACC, ALM.DIAMETRO_ACC AS DIAMETRO_ACC, ALM.PESO_ACC AS PESO_ACC, ');
        SQL.Add('        ALM.ID_UBICACION AS ID_UBICACION, ALM.GENERAL AS GENERAL, ART.ID_A_UBICACION AS ID_A_UBICACION, ');
        SQL.Add('        ALM.ALMACEN AS ALMACEN, ALM.CALLE AS CALLE, ALM.ESTANTERIA AS ESTANTERIA, ALM.REPISA AS REPISA, ');
        SQL.Add('        ALM.POSICION AS POSICION, ALM.TITULO AS TITULO_UBICACION ');
        SQL.Add(' FROM ART_ALMACENES_UBICACIONES ALM ');
        SQL.Add(' LEFT JOIN ART_ARTICULOS_UBICACIONES ART ON (ALM.ID_UBICACION = ART.ID_UBICACION) ');
        SQL.Add(' WHERE ');
        SQL.Add(' ALM.EMPRESA = :EMPRESA AND ');
        SQL.Add(' ALM.COMPOSICION = :COMPOSICION AND ');
        SQL.Add(' ((ART.ID_A = :ID_A) OR (ART.ID_A IS NULL)) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COMPOSICION'].AsString := QMDistribucionUBICACION.AsString;
        Params.ByName['ID_A'].AsInteger := QMDistribucionID_A.AsInteger;
        ExecQuery;
        if (HayDatos) then
        begin
           Volumen_Max := FieldByName['VOLUMEN_MAX'].AsFloat;
           Diametro_Max := FieldByName['DIAMETRO_MAX'].AsFloat;
           Peso_Max := FieldByName['PESO_MAX'].AsFloat;
           Volumen_Acc := FieldByName['VOLUMEN_ACC'].AsFloat;
           Diametro_Acc := FieldByName['DIAMETRO_ACC'].AsFloat;
           Peso_Acc := FieldByName['PESO_ACC'].AsFloat;
           Id_Ubicacion := FieldByName['ID_UBICACION'].AsInteger;
           general := FieldByName['GENERAL'].AsInteger;
           id_a_ubicacion := FieldByName['ID_A_UBICACION'].AsInteger;
           almacen := FieldByName['ALMACEN'].AsString;
           calle := FieldByName['CALLE'].AsString;
           estanteria := FieldByName['ESTANTERIA'].AsString;
           repisa := FieldByName['REPISA'].AsString;
           posicion := FieldByName['POSICION'].AsString;
           if (General = 0) then
           begin
              V_Real := Volumen_Max - Volumen_Acc;
              P_Real := Peso_Max - Peso_Acc;
              D_Real := Diametro_Max - Diametro_Acc;

              Error := False;
              if (V_Real + QMDistribucionVOLUMEN.AsFloat > Volumen_Max) then
                 Error := True
              else if (P_Real + QMDistribucionPESO.AsFloat > Peso_Max) then
                 Error := True
              else if (D_Real + QMDistribucionDIAMETRO.AsFloat > Diametro_Max) then
                 Error := True;

              if (Error) then
                 ShowMessage(_('Las dimensiones exceden de las definidas en la ubicación'));
           end;
           QMDistribucionID_UBICACION.AsInteger := id_ubicacion;
           QMDistribucionID_A_UBICACION.AsInteger := Id_a_ubicacion;
           QMDistribucionGENERAL.AsInteger := General;
           QMDistribucionALMACEN.AsString := Almacen;
           QMDistribucionCALLE.AsString := Calle;
           QMDistribucionESTANTERIA.AsString := Estanteria;
           QMDistribucionREPISA.AsString := Repisa;
           QMDistribucionPOSICION.AsString := Posicion;
           QMDistribucionTITULO.AsString := FieldByName['TITULO_UBICACION'].AsString;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDistribuyeArticulos.QMDistribucionNewRecord(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Transaction := TLocal;
        SQL.Text := 'SELECT MAX(LINEA_UBICACION) FROM TMP_GES_DETALLES_UBICACIONES WHERE ENTRADA = :ENTRADA AND ID_DETALLES = :ID_DETALLES';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_DETALLES'].AsInteger := id_detalles_eDM;
        ExecQuery;
        QMDistribucionLINEA_UBICACION.AsInteger := FieldByName['MAX'].AsInteger + 1;
     finally
        Free;
     end;
  end;

  QMDistribucionENTRADA.AsInteger := REntorno.Entrada;
  QMDistribucionEMPRESA.AsInteger := EmpresaDM;
  QMDistribucionEJERCICIO.AsInteger := EjercicioDM;
  QMDistribucionCANAL.AsInteger := CanalDM;
  QMDistribucionSERIE.AsString := SerieDM;
  QMDistribucionTIPO.AsString := TipoDM;
  QMDistribucionRIG.AsInteger := RigDM;
  QMDistribucionLINEA.AsInteger := LineaDM;
  QMDistribucionID_DETALLES.AsInteger := id_detalles_eDM;
  QMDistribucionID_A.AsInteger := id_aDM;
  QMDistribucionPESO.AsFloat := 0;
  QMDistribucionUNIDADES.AsFloat := 0;
  QMDistribucionVOLUMEN.AsFloat := 0;
  QMDistribucionDIAMETRO.AsFloat := 0;
  QMDistribucionDIAMETRO.AsFloat := 0;
  QMDistribucionARTICULO.AsString := xArticulosARTICULO.AsString;
end;

procedure TDMDistribuyeArticulos.TraspasoATMP(id_a: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASA_TMP_UBICACIONES(:ENTRADA, :ID_DETALLES, 1, :ID_A)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_DETALLES'].AsInteger := id_detalles_eDM;
        Params.ByName['ID_A'].AsInteger := id_a;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDistribuyeArticulos.QMDistribucionUNIDADESChange(Sender: TField);
begin
  if (QMDistribucionUNIDADES.AsFloat > 0) then
  begin
     QMDistribucionPESO.AsFloat := xArticulosPESO.AsFloat * QMDistribucionUNIDADES.AsFloat;
     QMDistribucionVOLUMEN.AsFloat := xArticulosVOLUMEN_UNIT.AsFloat * QMDistribucionUNIDADES.AsFloat;
     QMDistribucionDIAMETRO.AsFloat := xArticulosDIAMETRO_UNIT.AsFloat * QMDistribucionUNIDADES.AsFloat;

     if not (CompruebaCapacidad(QMDistribucionPESO.AsFloat,
        QMDistribucionVOLUMEN.AsFloat, QMDistribucionDIAMETRO.AsFloat)) then
        ShowMessage(_('Las dimensiones exceden de las definidas en la ubicación'));
  end;
end;

function TDMDistribuyeArticulos.InsertaUbicacion: boolean;
var
  Unidades : real;
begin
  // Si es ubicable verifico que las unidades ubicadas sean iguales a las unidades del documento
  if (xArticulosUBICABLE.AsInteger = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUM(UNIDADES) AS TOTAL FROM TMP_GES_DETALLES_UBICACIONES ');
           SQL.Add(' WHERE ');
           SQL.Add(' ENTRADA = :ENTRADA AND ');
           SQL.Add(' ID_DETALLES = :ID_DETALLES ');
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['ID_DETALLES'].AsInteger := id_detalles_eDM;
           ExecQuery;
           Unidades := FieldByName['TOTAL'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (Unidades <> Unidades_Doc) then
        raise Exception.Create(_('Las unidades ubicadas difieren de las unidades del documento'));
  end;

  // Traspaso de temporal a ges_detalles_e_ubicaciones
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASA_TMP_UBICACIONES(:ENTRADA, :ID_DETALLES, 3, :ID_A)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_DETALLES'].AsInteger := id_detalles_eDM;
        Params.ByName['ID_A'].AsInteger := id_aDM;
        try
           ExecQuery;
           Result := True;
        finally
           FreeHandle;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMDistribuyeArticulos.BorraTemporal;
begin
  // Lo hago desde un SP porque si falla puede quedar un semaforo abierto
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Close;
        SQL.Text := 'EXECUTE PROCEDURE BORRA_TMP_UBICACIONES(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?ENTRADA,?ID_DETALLES)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
        Params.ByName['CANAL'].AsInteger := CanalDM;
        Params.ByName['SERIE'].AsString := SerieDM;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_DETALLES'].AsInteger := id_detalles_eDM;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMDistribuyeArticulos.CompruebaCapacidad(NPeso, NVolumen, NDiametro: double): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        {Transaction := TLocal; dji lrk kri - por defecto tiene AutoTrans = True}
        SQL.Add(' SELECT VOLUMEN_ACC, PESO_ACC, DIAMETRO_ACC, VOLUMEN_MAX, PESO_MAX, DIAMETRO_MAX, GENERAL ');
        SQL.Add(' FROM ART_ALMACENES_UBICACIONES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_UBICACION = :ID_UBICACION ');
        Params.ByName['ID_UBICACION'].AsInteger := QMDistribucionID_UBICACION.AsInteger;
        ExecQuery;
        // Comprobamos que lo que tenemos acumulado mas lo que vamos a acumular quepa en la ubicacion
        // se le resta 1 para controlar que si son iguales no salte la excepcion
        if (FieldByName['GENERAL'].AsInteger = 0) then
        begin
           if (FieldByName['VOLUMEN_MAX'].AsFloat <=
              (FieldByName['VOLUMEN_ACC'].AsFloat + (NVolumen - 1))) then
              Result := False
           else if (FieldByName['PESO_MAX'].AsFloat <=
              (FieldByName['PESO_ACC'].AsFloat + (NPeso - 1))) then
              Result := False
           else if (FieldByName['DIAMETRO_MAX'].AsFloat <=
              (FieldByName['DIAMETRO_ACC'].AsFloat + (NDiametro - 1))) then
              Result := False
           else
              Result := True;
        end
        else
           Result := True;
     finally
        Free;
     end;
  end;
end;

function TDMDistribuyeArticulos.DameAlmacen: string;
begin
  with THYFIBQuery.Create(nil) do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT ALMACEN FROM GES_DETALLES_E WHERE ID_DETALLES_E=' +
           IntToStr(id_detalles_eDM);
        ExecQuery;
        Result := FieldByName['ALMACEN'].AsString;
     finally
        Free;
     end;
end;

procedure TDMDistribuyeArticulos.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMDistribuyeArticulos.QMLoteUbicacionNewRecord(DataSet: TDataSet);
begin
  with QMLoteUbicacion do
  begin
     Close;
     QMLoteUbicacionEMPRESA.AsInteger := EmpresaDM;
     QMLoteUbicacionEJERCICIO.AsInteger := EjercicioDM;
     QMLoteUbicacionCANAL.AsInteger := CanalDM;
     QMLoteUbicacionSERIE.AsString := SerieDM;
     QMLoteUbicacionRIG.AsInteger := RigDM;
     QMLoteUbicacionLINEA.AsInteger := LineaDM;
     QMLoteUbicacionARTICULO.AsString := xArticulosARTICULO.AsString;
     QMLoteUbicacionLOTE.AsString := 'SIN_ASIGNAR';
     QMLoteUbicacionCADUCIDAD.AsDateTime := Now;
     QMLoteUbicacionID_UBICACION.AsInteger := 0;
     Open;
  end;
end;

procedure TDMDistribuyeArticulos.QMLoteUbicacionAfterPost(DataSet: TDataSet);
var
  id_ubicacion : integer;
  lote : string;
begin
  with QMLoteUbicacion do
  begin
     DisableControls;
     try
        id_ubicacion := QMLoteUbicacionID_UBICACION.AsInteger;
        lote := QMLoteUbicacionLOTE.AsString;
        Close;
        Open;

        while ((lote <> QMLoteUbicacionLOTE.AsString) and (id_ubicacion <> QMLoteUbicacionID_UBICACION.AsInteger) and (not EOF)) do
           Next;

        if ((lote <> QMLoteUbicacionLOTE.AsString) and (id_ubicacion <> QMLoteUbicacionID_UBICACION.AsInteger)) then
           First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMDistribuyeArticulos.QMLotesNewRecord(DataSet: TDataSet);
begin
  with QMLotes do
  begin
     Close;
     QMLotesEMPRESA.AsInteger := EmpresaDM;
     QMLotesEJERCICIO.AsInteger := EjercicioDM;
     QMLotesCANAL.AsInteger := CanalDM;
     QMLotesSERIE.AsString := SerieDM;
     QMLotesRIG.AsInteger := RigDM;
     QMLotesLINEA.AsInteger := LineaDM;
     QMLotesARTICULO.AsString := xArticulosARTICULO.AsString;
     QMLotesLOTE.AsString := 'SIN_ASIGNAR';
     QMLotesCADUCIDAD.AsDateTime := Now;
     QMLotesID_UBICACION.AsInteger := 0;
     Open;
  end;
end;

procedure TDMDistribuyeArticulos.QMLotesAfterPost(DataSet: TDataSet);
var
  id_ubicacion : integer;
  lote : string;
begin
  with QMLotes do
  begin
     DisableControls;
     try
        id_ubicacion := QMLotesID_UBICACION.AsInteger;
        lote := QMLotesLOTE.AsString;
        Close;
        Open;

        while ((lote <> QMLotesLOTE.AsString) and (id_ubicacion <> QMLotesID_UBICACION.AsInteger) and (not EOF)) do
           Next;

        if ((lote <> QMLotesLOTE.AsString) and (id_ubicacion <> QMLotesID_UBICACION.AsInteger)) then
           First;
     finally
        EnableControls;
     end;
  end;
end;

end.
