unit UDMExtraeArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, HYFIBQuery, Dialogs,
  UComponentesBusquedaFiltrada;

type
  TDMExtraeArticulos = class(TDataModule)
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
     TUpdate: THYTransaction;
     QMLotesDisponibles: TFIBTableSet;
     DSQMLotesDisponibles: TDataSource;
     QMLotesDisponiblesCANTIDAD: TIntegerField;
     QMLotesDisponiblesEMPRESA: TIntegerField;
     QMLotesDisponiblesARTICULO: TFIBStringField;
     QMLotesDisponiblesLOTE: TFIBStringField;
     QMLotesDisponiblesCADUCIDAD: TDateTimeField;
     QMLotesDisponiblesID_UBICACION: TIntegerField;
     QMLotesDisponiblesALMACEN: TFIBStringField;
     QMLotesDisponiblesCALLE: TFIBStringField;
     QMLotesDisponiblesESTANTERIA: TFIBStringField;
     QMLotesDisponiblesREPISA: TFIBStringField;
     QMLotesDisponiblesPOSICION: TFIBStringField;
     QMLotesDisponiblesTITULO: TFIBStringField;
     QMLotesDisponiblesEJERCICIO: TIntegerField;
     QMLotesDisponiblesCANAL: TIntegerField;
     QMLotesDisponiblesSERIE: TFIBStringField;
     QMLotesDisponiblesRIG: TIntegerField;
     QMLotesDisponiblesLINEA: TIntegerField;
     QMLotesDisponiblesENTRADA: TIntegerField;
     QMLotesDisponiblesCANT_SELECCIONAR: TIntegerField;
     QMLotesSeleccionados: TFIBTableSet;
     DSQMLotesSeleccionados: TDataSource;
     QMLotesSeleccionadosCANTIDAD: TIntegerField;
     QMLotesSeleccionadosEMPRESA: TIntegerField;
     QMLotesSeleccionadosARTICULO: TFIBStringField;
     QMLotesSeleccionadosLOTE: TFIBStringField;
     QMLotesSeleccionadosCADUCIDAD: TDateTimeField;
     QMLotesSeleccionadosID_UBICACION: TIntegerField;
     QMLotesSeleccionadosALMACEN: TFIBStringField;
     QMLotesSeleccionadosCALLE: TFIBStringField;
     QMLotesSeleccionadosESTANTERIA: TFIBStringField;
     QMLotesSeleccionadosREPISA: TFIBStringField;
     QMLotesSeleccionadosPOSICION: TFIBStringField;
     QMLotesSeleccionadosTITULO: TFIBStringField;
     QMLotesSeleccionadosEJERCICIO: TIntegerField;
     QMLotesSeleccionadosCANAL: TIntegerField;
     QMLotesSeleccionadosSERIE: TFIBStringField;
     QMLotesSeleccionadosRIG: TIntegerField;
     QMLotesSeleccionadosLINEA: TIntegerField;
     QMLotesSeleccionadosENTRADA: TIntegerField;
     QMLotesSeleccionadosCANT_SELECCIONAR: TIntegerField;
     QMLotesUbicacionDisponibles: TFIBTableSet;
     DSQMLotesUbicacionDisponibles: TDataSource;
     QMLotesUbicacionDisponiblesCANTIDAD: TIntegerField;
     QMLotesUbicacionDisponiblesEMPRESA: TIntegerField;
     QMLotesUbicacionDisponiblesARTICULO: TFIBStringField;
     QMLotesUbicacionDisponiblesLOTE: TFIBStringField;
     QMLotesUbicacionDisponiblesCADUCIDAD: TDateTimeField;
     QMLotesUbicacionDisponiblesID_UBICACION: TIntegerField;
     QMLotesUbicacionDisponiblesALMACEN: TFIBStringField;
     QMLotesUbicacionDisponiblesCALLE: TFIBStringField;
     QMLotesUbicacionDisponiblesESTANTERIA: TFIBStringField;
     QMLotesUbicacionDisponiblesREPISA: TFIBStringField;
     QMLotesUbicacionDisponiblesPOSICION: TFIBStringField;
     QMLotesUbicacionDisponiblesTITULO: TFIBStringField;
     QMLotesUbicacionDisponiblesEJERCICIO: TIntegerField;
     QMLotesUbicacionDisponiblesCANAL: TIntegerField;
     QMLotesUbicacionDisponiblesSERIE: TFIBStringField;
     QMLotesUbicacionDisponiblesRIG: TIntegerField;
     QMLotesUbicacionDisponiblesLINEA: TIntegerField;
     QMLotesUbicacionDisponiblesENTRADA: TIntegerField;
     QMLotesUbicacionDisponiblesCANT_SELECCIONAR: TIntegerField;
     QMLotesUbicacionSeleccionados: TFIBTableSet;
     DSQMLotesUbicacionSeleccionados: TDataSource;
     QMLotesUbicacionSeleccionadosCANTIDAD: TIntegerField;
     QMLotesUbicacionSeleccionadosEMPRESA: TIntegerField;
     QMLotesUbicacionSeleccionadosARTICULO: TFIBStringField;
     QMLotesUbicacionSeleccionadosLOTE: TFIBStringField;
     QMLotesUbicacionSeleccionadosCADUCIDAD: TDateTimeField;
     QMLotesUbicacionSeleccionadosID_UBICACION: TIntegerField;
     QMLotesUbicacionSeleccionadosALMACEN: TFIBStringField;
     QMLotesUbicacionSeleccionadosCALLE: TFIBStringField;
     QMLotesUbicacionSeleccionadosESTANTERIA: TFIBStringField;
     QMLotesUbicacionSeleccionadosREPISA: TFIBStringField;
     QMLotesUbicacionSeleccionadosPOSICION: TFIBStringField;
     QMLotesUbicacionSeleccionadosTITULO: TFIBStringField;
     QMLotesUbicacionSeleccionadosEJERCICIO: TIntegerField;
     QMLotesUbicacionSeleccionadosCANAL: TIntegerField;
     QMLotesUbicacionSeleccionadosSERIE: TFIBStringField;
     QMLotesUbicacionSeleccionadosRIG: TIntegerField;
     QMLotesUbicacionSeleccionadosLINEA: TIntegerField;
     QMLotesUbicacionSeleccionadosENTRADA: TIntegerField;
     QMLotesUbicacionSeleccionadosCANT_SELECCIONAR: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMDistribucionBeforePost(DataSet: TDataSet);
     procedure QMDistribucionUBICACIONChange(Sender: TField);
     procedure QMDistribucionNewRecord(DataSet: TDataSet);
     procedure QMDistribucionUNIDADESChange(Sender: TField);
     procedure QMLotesBeforePost(DataSet: TDataSet);
     procedure RefrescaDataSetLotes(DataSet: TDataSet);
     procedure QMLotesSeleccionadosAfterDelete(DataSet: TDataSet);
     procedure QMLotesUbicacionSeleccionadosAfterDelete(DataSet: TDataSet);
     procedure QMLotesDisponiblesAfterPost(DataSet: TDataSet);
     procedure QMLotesUbicacionDisponiblesAfterPost(DataSet: TDataSet);
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
     procedure MuestraUbicacion(empresa, ejercicio, canal, rig, linea, id_detalles, id_a: integer; serie, tipo: string; Unidades: double);
     function InsertaUbicacion: boolean;
     procedure BorraTemporal;
     function DameAlmacen: string;
     procedure SeleccionaTodosLosLotes;
     procedure QuitaTodosLosLotes;
     procedure SeleccionaTodosLosLotesUbicacion;
     procedure QuitaTodosLosLotesUbicacion;
  end;

var
  DMExtraeArticulos : TDMExtraeArticulos;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMExtraeArticulos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMExtraeArticulos.MuestraUbicacion(empresa, ejercicio, canal, rig, linea, id_detalles, id_a: integer; serie, tipo: string; Unidades: double);
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

  with QMLotesDisponibles do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['ARTICULO'].AsString := xArticulosARTICULO.AsString;
     Open;
  end;

  with QMLotesSeleccionados do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['ARTICULO'].AsString := xArticulosARTICULO.AsString;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['CANAL'].AsInteger := CanalDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     Params.ByName['LINEA'].AsInteger := LineaDM;
     Open;
  end;

  with QMLotesUbicacionDisponibles do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['ARTICULO'].AsString := xArticulosARTICULO.AsString;
     Open;
  end;

  with QMLotesUbicacionSeleccionados do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['ARTICULO'].AsString := xArticulosARTICULO.AsString;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['CANAL'].AsInteger := CanalDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     Params.ByName['LINEA'].AsInteger := LineaDM;
     Open;
  end;
end;

procedure TDMExtraeArticulos.PonArticulo;
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['ID_A'].AsInteger := id_aDM;
     Open;
  end;
end;

procedure TDMExtraeArticulos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMExtraeArticulos.QMDistribucionBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'ID_D_S_UBICACION', 'ID_D_UBICACION');
  end;
  if (DataSet.State = dsEdit) then
  begin
     if (DataSet.FieldByName('UNIDADES').AsFloat < 1) and
        (UdsEnteras(DataSet.FieldByName('ID_A').AsInteger)) then
        raise Exception.Create('Las unidades a ubicar no pueden ser menores que 1')
     else if (DataSet.FieldByName('UNIDADES').AsFloat <= 0) and
        (not UdsEnteras(DataSet.FieldByName('ID_A').AsInteger)) then
        raise Exception.Create(_('Las unidades a ubicar no pueden ser menores que o iguales a cero'));
  end;
end;

procedure TDMExtraeArticulos.QMDistribucionUBICACIONChange(Sender: TField);
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
        SQL.Add(' JOIN ART_ARTICULOS_UBICACIONES ART ON (ALM.ID_UBICACION = ART.ID_UBICACION) ');
        SQL.Add(' WHERE ');
        SQL.Add(' ALM.EMPRESA = :EMPRESA AND ');
        SQL.Add(' ALM.COMPOSICION = :COMPOSICION AND ');
        SQL.Add(' ART.ID_A = :ID_A ');
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

procedure TDMExtraeArticulos.QMDistribucionNewRecord(DataSet: TDataSet);
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
        FreeHandle;
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
  QMDistribucionARTICULO.AsString := xArticulosARTICULO.AsString;
end;

procedure TDMExtraeArticulos.TraspasoATMP(id_a: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Transaction := TLocal;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASA_TMP_UBICACIONES(:ENTRADA, :ID_DETALLES, 0, :ID_A)';
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

procedure TDMExtraeArticulos.QMDistribucionUNIDADESChange(Sender: TField);
begin
  if (QMDistribucionUNIDADES.AsFloat > 0) then
  begin
     QMDistribucionPESO.AsFloat := xArticulosPESO.AsFloat * QMDistribucionUNIDADES.AsFloat;
     QMDistribucionVOLUMEN.AsFloat := xArticulosVOLUMEN_UNIT.AsFloat *
        QMDistribucionUNIDADES.AsFloat;
     QMDistribucionDIAMETRO.AsFloat := xArticulosDIAMETRO_UNIT.AsFloat *
        QMDistribucionUNIDADES.AsFloat;
     if not (CompruebaCapacidad(QMDistribucionPESO.AsFloat,
        QMDistribucionVOLUMEN.AsFloat, QMDistribucionDIAMETRO.AsFloat)) then
        ShowMessage(_('Las dimensiones exceden de las definidas en la ubicación'));
  end;
end;

function TDMExtraeArticulos.InsertaUbicacion: boolean;
var
  Unidades : real;
begin
  // Si esta insertando/editando debo grabar antes
  if ((QMDistribucion.State = dsInsert) or (QMDistribucion.State = dsEdit)) then
     QMDistribucion.Post;

  // Traspaso de temporal a ges_detalles_e_ubicaciones
  if (xArticulosUBICABLE.AsInteger = 1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SUM(UNIDADES) FROM TMP_GES_DETALLES_UBICACIONES WHERE ENTRADA = :ENTRADA AND ID_DETALLES = :ID_DETALLES';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['ID_DETALLES'].AsInteger := id_detalles_eDM;
           ExecQuery;
           Unidades := FieldByName['SUM'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
     if (Unidades <> Unidades_Doc) then
        raise Exception.Create(_('Las unidades ubicadas difieren de las unidades del documento'));
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        //Traspasamos todo a ges_detalles_e_ubicaciones
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASA_TMP_UBICACIONES(:ENTRADA, :ID_DETALLES, 2, :ID_A)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_DETALLES'].AsInteger := id_detalles_eDM;
        Params.ByName['ID_A'].AsInteger := id_aDM;
        ExecQuery;
        Result := True;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMExtraeArticulos.BorraTemporal;
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

function TDMExtraeArticulos.CompruebaCapacidad(NPeso, NVolumen, NDiametro: double): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT VOLUMEN_ACC, PESO_ACC, DIAMETRO_ACC, VOLUMEN_MAX, PESO_MAX, DIAMETRO_MAX, GENERAL ');
        SQL.Add(' FROM ART_ALMACENES_UBICACIONES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_UBICACION = ?ID_UBICACION ');
        Params.ByName['ID_UBICACION'].AsInteger := QMDistribucionID_UBICACION.AsInteger;
        ExecQuery;
        //Comprobamos que lo que tenemos acumulado mas lo que vamos a acumular quepa en la ubicacion
        //se le resta 1 para controlar que si son iguales no salte la excepcion
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
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMExtraeArticulos.DameAlmacen: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT ALMACEN FROM GES_DETALLES_S WHERE ID_DETALLES_S=' + IntToStr(id_detalles_eDM);
        ExecQuery;
        Result := FieldByName['ALMACEN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMExtraeArticulos.QMLotesBeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
     FieldByName('EJERCICIO').AsInteger := EjercicioDM;
     FieldByName('CANAL').AsInteger := CanalDM;
     FieldByName('SERIE').AsString := SerieDM;
     FieldByName('RIG').AsInteger := RigDM;
     FieldByName('LINEA').AsInteger := LineaDM;
  end;
end;

procedure TDMExtraeArticulos.RefrescaDataSetLotes(DataSet: TDataSet);
var
  id_ubicacion : integer;
  lote : string;
begin
  with DataSet do
  begin
     DisableControls;
     id_ubicacion := FieldByName('ID_UBICACION').AsInteger;
     lote := FieldByName('LOTE').AsString;
     Close;
     Open;
     while ((lote <> FieldByName('LOTE').AsString) and (id_ubicacion <> FieldByName('ID_UBICACION').AsInteger) and (not EOF)) do
        Next;
     if ((lote <> FieldByName('LOTE').AsString) and (id_ubicacion <> FieldByName('ID_UBICACION').AsInteger)) then
        First;
     EnableControls;
  end;
end;

procedure TDMExtraeArticulos.QMLotesSeleccionadosAfterDelete(DataSet: TDataSet);
begin
  RefrescaDataSetLotes(QMLotesDisponibles);
  RefrescaDataSetLotes(DataSet);
end;

procedure TDMExtraeArticulos.QMLotesUbicacionSeleccionadosAfterDelete(DataSet: TDataSet);
begin
  RefrescaDataSetLotes(QMLotesUbicacionDisponibles);
  RefrescaDataSetLotes(DataSet);
end;

procedure TDMExtraeArticulos.QMLotesDisponiblesAfterPost(DataSet: TDataSet);
begin
  RefrescaDataSetLotes(QMLotesSeleccionados);
  RefrescaDataSetLotes(DataSet);
end;

procedure TDMExtraeArticulos.QMLotesUbicacionDisponiblesAfterPost(DataSet: TDataSet);
begin
  RefrescaDataSetLotes(QMLotesUbicacionSeleccionados);
  RefrescaDataSetLotes(DataSet);
end;

procedure TDMExtraeArticulos.SeleccionaTodosLosLotes;
begin
  with QMLotesDisponibles do
  begin
     Edit;
     QMLotesDisponiblesCANT_SELECCIONAR.AsFloat := QMLotesDisponiblesCANTIDAD.AsFloat;
     Post;
  end;
end;

procedure TDMExtraeArticulos.QuitaTodosLosLotes;
begin
  QMLotesSeleccionados.Delete;
end;

procedure TDMExtraeArticulos.SeleccionaTodosLosLotesUbicacion;
begin
  with QMLotesUbicacionDisponibles do
  begin
     Edit;
     QMLotesUbicacionDisponiblesCANT_SELECCIONAR.AsFloat := QMLotesUbicacionDisponiblesCANTIDAD.AsFloat;
     Post;
  end;
end;

procedure TDMExtraeArticulos.QuitaTodosLosLotesUbicacion;
begin
  QMLotesUbicacionSeleccionados.Delete;
end;

end.
