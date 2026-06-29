unit UDMMovStockUbicaciones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, HYFIBQuery, Dialogs,
  UComponentesBusquedaFiltrada;

type
  TDMMovStockUbicaciones = class(TDataModule)
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
     QMDistribucionENTRADA: TIntegerField;
     QMDistribucionEMPRESA: TIntegerField;
     QMDistribucionEJERCICIO: TIntegerField;
     QMDistribucionSERIE: TFIBStringField;
     QMDistribucionRIG: TIntegerField;
     QMDistribucionLINEA: TIntegerField;
     QMDistribucionARTICULO: TFIBStringField;
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
     QMDistribucionID_D_ST_UBICACION: TIntegerField;
     QMDistribucionTIPO_MOV: TFIBStringField;
     QMDistribucionCANAL: TIntegerField;
     QMDistribucionTITULO: TFIBStringField;
     TUpdate: THYTransaction;
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
     QMLoteUbicacionENTRADA: TIntegerField;
     QMLotes: TFIBTableSet;
     DSQMLotes: TDataSource;
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
     procedure QMLoteUbicacionNewRecord(DataSet: TDataSet);
     procedure QMLoteUbicacionAfterPost(DataSet: TDataSet);
     procedure QMLotesAfterPost(DataSet: TDataSet);
     procedure QMLotesNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     TipoOperacion: string;
     procedure PonArticulo;
     procedure TraspasoATMP(id_a: integer);
     function CompruebaCapacidad(NPeso, NVolumen, NDiametro: double): boolean;
  public
     { Public declarations }
     Almacen: string;
     procedure MuestraUbicacion(empresa, ejercicio, rig, linea, id_a, canal: integer; serie, tipo_mov: string; Unidades: double);
     function InsertaUbicacion: boolean;
     procedure BorraTemporal;
     function DameAlmacen: string;
  end;

var
  DMMovStockUbicaciones : TDMMovStockUbicaciones;
  U_Totales, U_Restantes, U_Anteriores : double;
  Volumen_Max, Peso_Max, Diametro_Max, Peso_Acc, Volumen_Acc, Diametro_Acc, Unidades_Doc : double;
  id_a_ubicacion, Id_Ubicacion, general : integer;
  Composicion, almacen, calle, estanteria, repisa, posicion, SerieDM, Tipo_movDM : string;
  empresaDM, ejercicioDM, CanalDM, RigDM, LineaDM, id_detalles_eDM, id_aDM : integer;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMMovStockUbicaciones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMMovStockUbicaciones.MuestraUbicacion(empresa, ejercicio, rig, linea, id_a, canal: integer; serie, tipo_mov: string; Unidades: double);
var
  Q : THYFIBQuery;
begin
  EmpresaDM := Empresa;
  EjercicioDM := Ejercicio;
  SerieDM := Serie;
  RigDM := Rig;
  LineaDM := Linea;
  id_aDM := id_a;
  Unidades_doc := unidades;
  tipo_movDM := tipo_mov;
  canalDM := canal;

  BorraTemporal;
  TraspasoATMP(id_aDM);
  PonArticulo;
  with QMDistribucion do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     Params.ByName['LINEA'].AsInteger := LineaDM;
     Open;
  end;

  {dji lrk kri - Solo admito ubicaciones de este almacen}
  {Selecciono el almacen de donde sacar las ubicaciones}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     if (tipo_mov = 'E') then
        SQL.Text := 'SELECT ALMACEN_DST AS ALMACEN,TIPO_OPERACION FROM GES_CABECERAS_ST WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND SERIE=?SERIE AND RIG=?RIG';
     if (tipo_mov = 'S') then
        SQL.Text := 'SELECT ALMACEN_ORI AS ALMACEN,TIPO_OPERACION FROM GES_CABECERAS_ST WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND SERIE=?SERIE AND RIG=?RIG';
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     ExecQuery;
     Almacen := FieldByName['ALMACEN'].AsString;
     TipoOperacion := FieldByName['TIPO_OPERACION'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);

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
     {if (TipoOperacion='T') then
    begin
       if (tipo_movDM='E') then
          Params.ByName['TIPO'].AsString := 'E'
       else
          Params.ByName['TIPO'].AsString := 'T';
    end
    else
       Params.ByName['TIPO'].AsString := tipo_movDM;}
     Open;
  end;
end;

procedure TDMMovStockUbicaciones.PonArticulo;
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['ID_A'].AsInteger := id_aDM;
     Open;
  end;
end;

procedure TDMMovStockUbicaciones.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMMovStockUbicaciones.QMDistribucionBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_D_ST_UBICACION', 'ID_D_ST_UBICACION');

  if (DataSet.State = dsEdit) then
  begin
     if (DataSet.FieldByName('UNIDADES').AsFloat < 1) and
        (UdsEnteras(DataSet.FieldByName('ID_A').AsInteger)) then
        raise Exception.Create('Las unidades a ubicar no pueden ser menores que 1')
     else if (DataSet.FieldByName('UNIDADES').AsFloat <= 0) and
        (not UdsEnteras(DataSet.FieldByName('ID_A').AsInteger)) then
        raise Exception.Create('Las unidades a ubicar no pueden ser menores que o iguales a cero');
  end;
end;

procedure TDMMovStockUbicaciones.QMDistribucionUBICACIONChange(Sender: TField);
var
  QGen : THYFIBQuery;
  Error : boolean;
  V_Real, D_Real, P_Real : double;
begin
  QGen := THYFIBQuery.Create(nil);

  with QGen do
  begin
     DataBase := DMMain.DataBase;
     {Transaction := TLocal; dji lrk kri - por defecto tiene AutoTrans = True}
     SQL.Text :=
        'select alm.volumen_max as volumen_max,alm.diametro_max as diametro_max,alm.peso_max as peso_max,' +
        'alm.volumen_acc as volumen_acc,alm.diametro_acc as diametro_acc,alm.peso_acc as peso_acc,' +
        'alm.id_ubicacion as id_ubicacion,alm.general as general,art.id_a_ubicacion as id_a_ubicacion,' +
        'alm.almacen as almacen,alm.calle as calle,alm.estanteria as estanteria,alm.repisa as repisa,alm.posicion as posicion,alm.titulo as titulo_ubicacion' +
        ' from art_almacenes_ubicaciones alm' +
        ' left join art_articulos_ubicaciones art' +
        ' on (alm.id_ubicacion = art.id_ubicacion)' +
        ' where alm.empresa = ?empresa and alm.composicion = ?composicion and' +
        ' ((art.id_a = ?id_a) or (art.id_a is null))';
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
              ShowMessage('Las dimensiones exceden de las definidas en la ubicación');
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
  end;
  FreeAndNil(QGen);
end;

procedure TDMMovStockUbicaciones.QMDistribucionNewRecord(DataSet: TDataSet);
var
  QGen : THYFIBQuery;
begin
  QGen := THYFIBQuery.Create(nil);
  with QGen do
  begin
     DataBase := DMMain.DataBase;
     {Transaction := TLocal; dji lrk kri - por defecto tiene AutoTrans = True}
     SQL.Text := 'select max(linea_ubicacion) as l_ubicacion from tmp_ges_detalles_ubicaciones_st' +
        ' where entrada=?entrada and empresa=?empresa and ejercicio = ?ejercicio' +
        ' and serie=?serie and rig=?rig and linea = ?linea';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     Params.ByName['LINEA'].AsInteger := LineaDM;
     ExecQuery;
     QMDistribucionLINEA_UBICACION.AsInteger := FieldByName['L_UBICACION'].AsInteger + 1;
     FreeHandle;
  end;
  FreeAndNil(QGen); {dji lrk kri - Memory Leak}

  QMDistribucionENTRADA.AsInteger := REntorno.Entrada;
  QMDistribucionEMPRESA.AsInteger := EmpresaDM;
  QMDistribucionEJERCICIO.AsInteger := EjercicioDM;
  QMDistribucionSERIE.AsString := SerieDM;
  QMDistribucionRIG.AsInteger := RigDM;
  QMDistribucionLINEA.AsInteger := LineaDM;
  QMDistribucionID_A.AsInteger := id_aDM;
  QMDistribucionPESO.AsFloat := 0;
  QMDistribucionUNIDADES.AsFloat := 0;
  QMDistribucionVOLUMEN.AsFloat := 0;
  QMDistribucionDIAMETRO.AsFloat := 0;
  QMDistribucionARTICULO.AsString := xArticulosARTICULO.AsString;
  QMDistribucionTIPO_MOV.AsString := tipo_movDM;
  QMDistribucionCANAL.AsInteger := canalDM;
end;

procedure TDMMovStockUbicaciones.TraspasoATMP(id_a: integer);
var
  QGen : THYFIBQuery;
begin
  QGen := THYFIBQuery.Create(nil);
  with QGen do
  begin
     DataBase := DMMain.DataBase;
     {Transaction := TLocal; dji lrk kri - por defecto tiene AutoTrans = True}
     SQL.Text := 'execute procedure g_traspasa_tmp_ubicaciones_st(?entrada,?empresa,?ejercicio,?serie,?rig,?linea,?tipo_mov,0,?id_a)';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     Params.ByName['LINEA'].AsInteger := LineaDM;
     Params.ByName['Tipo_mov'].AsString := Tipo_movDM;
     Params.ByName['ID_A'].AsInteger := id_a;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(QGen);
end;

procedure TDMMovStockUbicaciones.QMDistribucionUNIDADESChange(Sender: TField);
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
        ShowMessage('Las dimensiones exceden de las definidas en la ubicación');
  end;
end;

function TDMMovStockUbicaciones.InsertaUbicacion: boolean;
var
  QGen : THYFIBQuery;
  Total : real;
begin
  // Result := False;
  // Traspaso de temporal a ges_detalles_e_ubicaciones
  QGen := THYFIBQuery.Create(nil);
  with QGen do
  begin
     DataBase := DMMain.DataBase;
     {Transaction := TLocal; dji lrk kri - por defecto tiene AutoTrans = True}
     SQL.Text :=
        'select sum(unidades) as total from tmp_ges_detalles_ubicaciones_st where entrada = ?entrada and' +
        ' empresa=?empresa and ejercicio=?ejercicio and serie=?serie and rig=?rig and linea=?linea';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     Params.ByName['LINEA'].AsInteger := LineaDM;
     ExecQuery;
     Total := FieldByName['TOTAL'].AsFloat;
     FreeHandle;
  end;
  FreeAndNil(QGen);

  if (Total <> Unidades_Doc) then
     raise Exception.Create('Las unidades ubicadas difieren de las unidades del documento')
  else
  begin
     QGen := THYFIBQuery.Create(nil);
     with QGen do
     begin
        DataBase := DMMain.DataBase;
        //Traspasamos todo a ges_detalles_st_ubicaciones
        SQL.Text := 'execute procedure g_traspasa_tmp_ubicaciones_st(?entrada,?empresa,?ejercicio,?serie,?rig,?linea,?tipo,1,?id_a)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
        Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
        Params.ByName['SERIE'].AsString := SerieDM;
        Params.ByName['RIG'].AsInteger := RigDM;
        Params.ByName['LINEA'].AsInteger := LineaDM;
        Params.ByName['TIPO'].AsString := Tipo_movDM;
        Params.ByName['ID_A'].AsInteger := id_aDM;
        ExecQuery;
        Result := True;
        FreeHandle;
     end;
     FreeAndNil(QGen);
  end;
end;

procedure TDMMovStockUbicaciones.BorraTemporal;
var
  QGen : THYFIBQuery;
begin
  QGen := THYFIBQuery.Create(nil);
  with QGen do
  begin
     DataBase := DMMain.DataBase;
     {Transaction := TLocal; dji lrk kri - por defecto tiene AutoTrans = True}
     SQL.Text :=
        'delete from tmp_ges_detalles_ubicaciones_st where entrada = ?entrada and empresa=?empresa' +
        ' and ejercicio=?ejercicio and serie=?serie and rig=?rig and linea=?linea';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     Params.ByName['LINEA'].AsInteger := LineaDM;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(QGen);

  QGen := THYFIBQuery.Create(nil);
  with QGen do
  begin
     DataBase := DMMain.DataBase;
     {Transaction := TLocal; dji lrk kri - por defecto tiene AutoTrans = True}
     SQL.Text :=
        'delete from tmp_nro_serie_kri where entrada = ?entrada and empresa=?empresa' +
        ' and ejercicio=?ejercicio and serie=?serie and rig=?rig and linea=?linea';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := EmpresaDM;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioDM;
     Params.ByName['SERIE'].AsString := SerieDM;
     Params.ByName['RIG'].AsInteger := RigDM;
     Params.ByName['LINEA'].AsInteger := LineaDM;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(QGen);
end;

function TDMMovStockUbicaciones.CompruebaCapacidad(NPeso, NVolumen, NDiametro: double): boolean;

var
  QGen : THYFIBQuery;
begin
  QGen := THYFIBQuery.Create(Self);

  with QGen do
  begin
     DataBase := DMMain.DataBase;
     {Transaction := TLocal; dji lrk kri - por defecto tiene AutoTrans = True}
     SQL.Text := 'select volumen_acc,peso_acc,diametro_acc,volumen_max,peso_max,diametro_max,general' +
        ' from art_almacenes_ubicaciones' +
        ' where id_ubicacion = ?id_ubicacion';
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
  end;
  FreeAndNil(QGen); {dji lrk kri - Memory Leak}
end;

procedure TDMMovStockUbicaciones.QMLoteUbicacionNewRecord(DataSet: TDataSet);
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

procedure TDMMovStockUbicaciones.QMLoteUbicacionAfterPost(DataSet: TDataSet);
var
  id_ubicacion : integer;
  lote : string;
begin
  with QMLoteUbicacion do
  begin
     DisableControls;
     id_ubicacion := QMLoteUbicacionID_UBICACION.AsInteger;
     lote := QMLoteUbicacionLOTE.AsString;
     Close;
     Open;
     while ((lote <> QMLoteUbicacionLOTE.AsString) and (id_ubicacion <> QMLoteUbicacionID_UBICACION.AsInteger) and (not EOF)) do
        Next;
     EnableControls;
  end;
end;

procedure TDMMovStockUbicaciones.QMLotesAfterPost(DataSet: TDataSet);
var
  id_ubicacion : integer;
  lote : string;
begin
  with QMLotes do
  begin
     DisableControls;
     id_ubicacion := QMLotesID_UBICACION.AsInteger;
     lote := QMLotesLOTE.AsString;
     Close;
     Open;
     while ((lote <> QMLotesLOTE.AsString) and (id_ubicacion <> QMLotesID_UBICACION.AsInteger) and (not EOF)) do
        Next;
     EnableControls;
  end;
end;

procedure TDMMovStockUbicaciones.QMLotesNewRecord(DataSet: TDataSet);
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

function TDMMovStockUbicaciones.DameAlmacen: string;
begin
  with THYFIBQuery.Create(nil) do
     try
        Database := DMMain.DataBase;
        SQL.Text := 'select almacen_ori, almacen_dst from ges_cabeceras_st ' +
           ' where empresa =' + IntToStr(EmpresaDM) +
           ' and ejercicio=' + IntToStr(EjercicioDM) +
           ' and serie=''' + SerieDM + '''' +
           ' and rig=' + IntToStr(RigDM);
        ExecQuery;
        if (tipo_movDM = 'E') then
           Result := FieldByName['ALMACEN_DST'].AsString
        else
           Result := FieldByName['ALMACEN_ORI'].AsString;
     finally
        Free;
     end;
end;

end.
