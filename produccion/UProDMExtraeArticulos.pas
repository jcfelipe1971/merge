unit UProDMExtraeArticulos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, HYFIBQuery, Dialogs,
  UComponentesBusquedaFiltrada;

type
  TProDMExtraeArticulos = class(TDataModule)
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
     QMDistribucionCANAL: TIntegerField;
     QMDistribucionSERIE: TFIBStringField;
     QMDistribucionTIPO: TFIBStringField;
     QMDistribucionRIG: TIntegerField;
     QMDistribucionLINEA: TIntegerField;
     QMDistribucionID_A: TIntegerField;
     QMDistribucionID_ORDEN: TIntegerField;
     QMDistribucionID_UBICACION: TIntegerField;
     QMDistribucionLINEA_UBICACION: TIntegerField;
     QMDistribucionUBICACION: TFIBStringField;
     QMDistribucionUNIDADES: TFloatField;
     QMDistribucionVOLUMEN: TFloatField;
     QMDistribucionPESO: TFloatField;
     QMDistribucionDIAMETRO: TFloatField;
     QMDistribucionID_D_UBICACION: TIntegerField;
     QMDistribucionID_A_UBICACION: TIntegerField;
     QMDistribucionGENERAL: TIntegerField;
     QMDistribucionALMACEN: TFIBStringField;
     QMDistribucionCALLE: TFIBStringField;
     QMDistribucionESTANTERIA: TFIBStringField;
     QMDistribucionREPISA: TFIBStringField;
     QMDistribucionPOSICION: TFIBStringField;
     QMDistribucionARTICULO: TFIBStringField;
     QMDistribucionTITULO: TFIBStringField;
     ZxAlmacenMat: TFIBDataSetRO;
     ZxAlmacenMatALMACEN: TFIBStringField;
     ZxAlmacenOrd: TFIBDataSetRO;
     ZxAlmacenOrdALMACEN_ENT: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMDistribucionBeforePost(DataSet: TDataSet);
     procedure QMDistribucionUBICACIONChange(Sender: TField);
     procedure QMDistribucionNewRecord(DataSet: TDataSet);
     procedure QMDistribucionUNIDADESChange(Sender: TField);
  private
     { Private declarations }
     procedure PonArticulo;
     procedure TraspasoATMP(tipo: string);
     function CompruebaCapacidad(NPeso, NVolumen, NDiametro: double): boolean;
  public
     { Public declarations }
     procedure MuestraUbicacion(empresa, ejercicio, canal, rig, linea, id_orden, id_a: integer; serie, tipo: string; Unidades: double);
     function InsertaUbicacion(tipo: string): boolean;
     procedure BorraTemporal;
  end;

var
  ProDMExtraeArticulos : TProDMExtraeArticulos;
  U_Totales, U_Restantes, U_Anteriores : double;
  Volumen_Max, Peso_Max, Diametro_Max, Peso_Acc, Volumen_Acc, Diametro_Acc, Unidades_Doc : double;
  id_a_ubicacion, Id_Ubicacion, general : integer;
  Composicion, almacen, calle, estanteria, repisa, posicion, SerieDM, TipoDM : string;
  empresaDM, ejercicioDM, CanalDM, RigDM, LineaDM, id_orden_DM, id_aDM : integer;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TProDMExtraeArticulos.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMExtraeArticulos.MuestraUbicacion(empresa, ejercicio, canal, rig, linea, id_orden, id_a: integer; serie, tipo: string; Unidades: double);
begin
  EmpresaDM := Empresa;
  EjercicioDM := Ejercicio;
  CanalDM := Canal;
  SerieDM := Serie;
  TipoDM := Tipo;
  RigDM := Rig;
  LineaDM := Linea;
  id_orden_DM := id_orden;
  id_aDM := id_a;
  Unidades_doc := unidades;

  BorraTemporal;
  TraspasoATMP(tipo);
  PonArticulo;
  with QMDistribucion do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['ID_ORDEN'].AsInteger := id_orden_DM;
     Open;
  end;
end;

procedure TProDMExtraeArticulos.PonArticulo;
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['ID_A'].AsInteger := id_aDM;
     Open;
  end;
end;

procedure TProDMExtraeArticulos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMExtraeArticulos.QMDistribucionBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_D_S_UBICACION', 'ID_D_UBICACION');

  if (DataSet.State = dsEdit) then
  begin
     if (DataSet.FieldByName('UNIDADES').AsFloat < 0) then
        raise Exception.Create('Las unidades a ubicar no pueden ser menores que 0');
  end;
end;

procedure TProDMExtraeArticulos.QMDistribucionUBICACIONChange(Sender: TField);
var
  QGen : THYFIBQuery;
  Error : boolean;
  V_Real, D_Real, P_Real : double;
begin
  QGen := THYFIBQuery.Create(nil);

  with QGen do
  begin
     DataBase := DMMain.DataBase;
     Transaction := TLocal;
     SQL.Text :=
        'select alm.volumen_max as volumen_max,alm.diametro_max as diametro_max,alm.peso_max as peso_max,' +
        'alm.volumen_acc as volumen_acc,alm.diametro_acc as diametro_acc,alm.peso_acc as peso_acc,' +
        'alm.id_ubicacion as id_ubicacion,alm.general as general,art.id_a_ubicacion as id_a_ubicacion,' +
        'alm.almacen as almacen,alm.calle as calle,alm.estanteria as estanteria,alm.repisa as repisa,alm.posicion as posicion,' +
        'alm.titulo as titulo_ubicacion' +
        ' from art_almacenes_ubicaciones alm' +
        ' join art_articulos_ubicaciones art' +
        ' on (alm.id_ubicacion = art.id_ubicacion)' +
        ' where alm.empresa = ?empresa and alm.composicion = ?composicion and' +
        ' art.id_a = ?id_a';
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

procedure TProDMExtraeArticulos.QMDistribucionNewRecord(DataSet: TDataSet);
var
  QGen : THYFIBQuery;
begin
  QGen := THYFIBQuery.Create(nil);
  with QGen do
  begin
     DataBase := DMMain.DataBase;
     Transaction := TLocal;
     SQL.Text := 'select max(linea_ubicacion) as l_ubicacion from pro_tmp_orden_ubicaciones' +
        ' where entrada=?entrada and id_orden = ?id_orden';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['ID_ORDEN'].AsInteger := id_orden_DM;
     ExecQuery;
     QMDistribucionLINEA_UBICACION.AsInteger := FieldByName['L_UBICACION'].AsInteger + 1;
     FreeHandle;
  end;
  QMDistribucionENTRADA.AsInteger := REntorno.Entrada;
  QMDistribucionEMPRESA.AsInteger := EmpresaDM;
  QMDistribucionEJERCICIO.AsInteger := EjercicioDM;
  QMDistribucionCANAL.AsInteger := CanalDM;
  QMDistribucionSERIE.AsString := SerieDM;
  QMDistribucionTIPO.AsString := TipoDM;
  QMDistribucionRIG.AsInteger := RigDM;
  QMDistribucionLINEA.AsInteger := LineaDM;
  QMDistribucionID_ORDEN.AsInteger := id_orden_DM;
  QMDistribucionID_A.AsInteger := id_aDM;
  QMDistribucionPESO.AsFloat := 0;
  QMDistribucionUNIDADES.AsFloat := 0;
  QMDistribucionVOLUMEN.AsFloat := 0;
  QMDistribucionDIAMETRO.AsFloat := 0;
  QMDistribucionARTICULO.AsString := xArticulosARTICULO.AsString;
end;

procedure TProDMExtraeArticulos.TraspasoATMP(tipo: string);
var
  QGen : THYFIBQuery;
begin
  //sfg.albert Es crea un procediment a la BDD igual però només per la producció
  //ZOM -> Components Ordre de fabricació
  //ZOR -> Compost Ordre de fabricació

  QGen := THYFIBQuery.Create(nil);
  with QGen do
  begin
     DataBase := DMMain.DataBase;
     Transaction := TLocal;
     if (tipo = 'ZOM') then
        SQL.Text := 'execute procedure pro_g_traspasa_tmp_ubicaciones(?entrada,?id_orden,0,''ZOM'')'
     else if (tipo = 'ZOR') then
        SQL.Text := 'execute procedure pro_g_traspasa_tmp_ubicaciones(?entrada,?id_orden,1,''ZOR'')';

     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['ID_ORDEN'].AsInteger := id_orden_DM;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(QGen);
end;

procedure TProDMExtraeArticulos.QMDistribucionUNIDADESChange(Sender: TField);
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

function TProDMExtraeArticulos.InsertaUbicacion(tipo: string): boolean;
var
  QGen : THYFIBQuery;
begin
  // Result := False;
  // Traspaso de temporal a ges_detalles_e_ubicaciones
  QGen := THYFIBQuery.Create(nil);
  with QGen do
  begin
     DataBase := DMMain.DataBase;
     Transaction := TLocal;
     SQL.Text :=
        'select sum(unidades) as total from pro_tmp_orden_ubicaciones where entrada = ?entrada and id_orden = ?id_orden';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['ID_ORDEN'].AsInteger := id_orden_DM;
     ExecQuery;
     if (FieldByName['TOTAL'].AsFloat <> Unidades_Doc) then
        raise Exception.Create('Las unidades ubicadas difieren de las unidades del documento')
     else
     begin
        //Traspasamos todo a ges_detalles_e_ubicaciones
        //SQL.Clear;
        if (tipo = 'ZOM') then
           SQL.Text := 'execute procedure pro_g_traspasa_tmp_ubicaciones(?entrada,?id_orden,2,''ZOM'')'
        else if (tipo = 'ZOR') then
           SQL.Text := 'execute procedure pro_g_traspasa_tmp_ubicaciones(?entrada,?id_orden,3,''ZOR'')';

        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_ORDEN'].AsInteger := id_orden_DM;
        ExecQuery;
        Result := True;
     end;
     FreeHandle;
  end;
  FreeAndNil(QGen);
end;

procedure TProDMExtraeArticulos.BorraTemporal;
var
  QGen : THYFIBQuery;
begin
  QGen := THYFIBQuery.Create(nil);
  with QGen do
  begin
     DataBase := DMMain.DataBase;
     Transaction := TLocal;
     Close;
     SQL.Text :=
        'delete from pro_tmp_orden_ubicaciones where entrada = ?entrada and id_orden = ?id_orden';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['ID_ORDEN'].AsInteger := id_orden_DM;
     ExecQuery;
     Close;
     FreeHandle;
  end;
  FreeAndNil(QGen);
end;

function TProDMExtraeArticulos.CompruebaCapacidad(NPeso, NVolumen, NDiametro: double): boolean;
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

end.
