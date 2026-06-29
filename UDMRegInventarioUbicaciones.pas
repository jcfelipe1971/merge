unit UDMRegInventarioUbicaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, HYFIBQuery, Dialogs,
  UComponentesBusquedaFiltrada;

type
  TDMRegInventarioUbicaciones = class(TDataModule)
     TLocal: THYTransaction;
     xArticulos: TFIBDataSetRO;
     xArticulosID_A: TIntegerField;
     xArticulosPESO: TFloatField;
     xArticulosUBICABLE: TIntegerField;
     xArticulosVOLUMEN_UNIT: TFloatField;
     xArticulosDIAMETRO_UNIT: TFloatField;
     DSxArticulos: TDataSource;
     QMRegInventario: TFIBTableSet;
     DSQMRegInventario: TDataSource;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     QMRegInventarioEMPRESA: TIntegerField;
     QMRegInventarioCANAL: TIntegerField;
     QMRegInventarioRIG: TIntegerField;
     QMRegInventarioLINEA: TIntegerField;
     QMRegInventarioARTICULO: TFIBStringField;
     QMRegInventarioID_A: TIntegerField;
     QMRegInventarioID_UBICACION: TIntegerField;
     QMRegInventarioLINEA_UBICACION: TIntegerField;
     QMRegInventarioUBICACION: TFIBStringField;
     QMRegInventarioUNIDADES: TFloatField;
     QMRegInventarioVOLUMEN: TFloatField;
     QMRegInventarioPESO: TFloatField;
     QMRegInventarioDIAMETRO: TFloatField;
     QMRegInventarioID_A_UBICACION: TIntegerField;
     QMRegInventarioGENERAL: TIntegerField;
     QMRegInventarioALMACEN: TFIBStringField;
     QMRegInventarioCALLE: TFIBStringField;
     QMRegInventarioESTANTERIA: TFIBStringField;
     QMRegInventarioREPISA: TFIBStringField;
     QMRegInventarioPOSICION: TFIBStringField;
     QMRegInventarioID_D_REG_UBICACION: TIntegerField;
     QMRegInventarioID_REG: TIntegerField;
     QMRegInventarioID_REG_DETALLE: TIntegerField;
     QMStockUbi: TFIBDataSetRO;
     DSQMStockUbi: TDataSource;
     QMStockUbiCOMPOSICION: TFIBStringField;
     QMStockUbiENTRADAS: TFloatField;
     QMStockUbiSALIDAS: TFloatField;
     QMStockUbiEXISTENCIAS: TFloatField;
     QMRegInventarioDescUbicacion: TStringField;
     xArticulosUNIDADES: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMRegInventarioBeforePost(DataSet: TDataSet);
     procedure QMRegInventarioUBICACIONChange(Sender: TField);
     procedure QMRegInventarioNewRecord(DataSet: TDataSet);
     procedure QMRegInventarioUNIDADESChange(Sender: TField);
     procedure QMRegInventarioDescUbicacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMRegInventarioUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     // U_Totales, U_Restantes, U_Anteriores : double;
     Volumen_Max, Peso_Max, Diametro_Max, Peso_Acc, Volumen_Acc, Diametro_Acc, Unidades_Doc: double;
     id_a_ubicacion, Id_Ubicacion, general: integer;
     almacen, calle, estanteria, repisa, posicion, SerieDM: string;
     empresaDM, ejercicioDM, CanalDM, RigDM, LineaDM, id_regDM, id_reg_detalleDM, id_aDM: integer;
     procedure PonArticulo;
     function CompruebaCapacidad(NPeso, NVolumen, NDiametro: double): boolean;
  public
     { Public declarations }
     procedure MuestraUbicacion(empresa, ejercicio, canal, rig, linea, id_reg, id_reg_detalle, id_a: integer; serie: string; Unidades: double);
     function InsertaUbicacion: boolean;
     function DameAlmacen: string;
  end;

var
  DMRegInventarioUbicaciones : TDMRegInventarioUbicaciones;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TDMRegInventarioUbicaciones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMRegInventarioUbicaciones.MuestraUbicacion(empresa, ejercicio, canal, rig, linea, id_reg, id_reg_detalle, id_a: integer; serie: string; Unidades: double);
begin
  EmpresaDM := Empresa;
  EjercicioDM := Ejercicio;
  CanalDM := Canal;
  SerieDM := Serie;
  RigDM := Rig;
  LineaDM := Linea;
  id_regDM := id_reg;
  id_reg_detalleDM := id_reg_detalle;
  id_aDM := id_a;
  Unidades_doc := unidades;

  PonArticulo;
  with QMRegInventario do
  begin
     Close;
     Params.ByName['ID_REG_DETALLE'].AsInteger := id_reg_detalleDM;
     Open;
  end;

  with QMStockUbi do
  begin
     Close;
     Params.ByName['ID_A'].AsInteger := id_aDM;
     Open;
  end;
end;

procedure TDMRegInventarioUbicaciones.PonArticulo;
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['ID_A'].AsInteger := id_aDM;
     Open;
  end;
end;

procedure TDMRegInventarioUbicaciones.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMRegInventarioUbicaciones.QMRegInventarioBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     QMRegInventarioID_D_REG_UBICACION.AsInteger := DMMain.Contador_Gen(QMRegInventario, 'CONTA_ID_D_REG_UBICACION', 'ID_D_REG_UBICACION');

     with THYFIBQuery.Create(nil) do
     begin
        try
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(LINEA_UBICACION) FROM ART_REG_INVENTARIO_DET_UBI WHERE ID_REG_DETALLE = :ID_REG_DETALLE';
           Params.ByName['ID_REG_DETALLE'].AsInteger := id_reg_detalleDM;
           ExecQuery;
           QMRegInventarioLINEA_UBICACION.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (DataSet.State = dsEdit) then
  begin
     if (DataSet.FieldByName('UNIDADES').AsFloat < 1) and
        (UdsEnteras(DataSet.FieldByName('ID_A').AsInteger)) then
        raise Exception.Create(_('Las unidades a ubicar no pueden ser menores que 1'))
     else if (DataSet.FieldByName('UNIDADES').AsFloat <= 0) and
        (not UdsEnteras(DataSet.FieldByName('ID_A').AsInteger)) then
        raise Exception.Create(_('Las unidades a ubicar no pueden ser menores que o iguales a cero'));
  end;
end;

procedure TDMRegInventarioUbicaciones.QMRegInventarioUBICACIONChange(Sender: TField);
var
  Error : boolean;
  V_Real, D_Real, P_Real : double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT ALM.VOLUMEN_MAX AS VOLUMEN_MAX, ALM.DIAMETRO_MAX AS DIAMETRO_MAX, ALM.PESO_MAX AS PESO_MAX, ');
        SQL.Add(' ALM.VOLUMEN_ACC AS VOLUMEN_ACC, ALM.DIAMETRO_ACC AS DIAMETRO_ACC, ALM.PESO_ACC AS PESO_ACC, ');
        SQL.Add(' ALM.ID_UBICACION AS ID_UBICACION, ALM.GENERAL AS GENERAL, ART.ID_A_UBICACION AS ID_A_UBICACION, ');
        SQL.Add(' ALM.ALMACEN AS ALMACEN, ALM.CALLE AS CALLE, ALM.ESTANTERIA AS ESTANTERIA, ALM.REPISA AS REPISA, ');
        SQL.Add(' ALM.POSICION AS POSICION, ALM.TITULO AS TITULO_UBICACION ');
        SQL.Add(' FROM ART_ALMACENES_UBICACIONES ALM ');
        SQL.Add(' JOIN ART_ARTICULOS_UBICACIONES ART ON (ALM.ID_UBICACION = ART.ID_UBICACION) ');
        SQL.Add(' WHERE ');
        SQL.Add(' ALM.EMPRESA = :EMPRESA AND ');
        SQL.Add(' ALM.COMPOSICION = :COMPOSICION AND ');
        SQL.Add(' ART.ID_A = :ID_A ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COMPOSICION'].AsString := QMRegInventarioUBICACION.AsString;
        Params.ByName['ID_A'].AsInteger := QMRegInventarioID_A.AsInteger;
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
              if (V_Real + QMRegInventarioVOLUMEN.AsFloat > Volumen_Max) then
                 Error := True
              else if (P_Real + QMRegInventarioPESO.AsFloat > Peso_Max) then
                 Error := True
              else if (D_Real + QMRegInventarioDIAMETRO.AsFloat > Diametro_Max) then
                 Error := True;

              if (Error) then
                 ShowMessage(_('Las dimensiones exceden de las definidas en la ubicación'));
           end;
           QMRegInventarioID_UBICACION.AsInteger := id_ubicacion;
           QMRegInventarioID_A_UBICACION.AsInteger := Id_a_ubicacion;
           QMRegInventarioGENERAL.AsInteger := General;
           QMRegInventarioALMACEN.AsString := Almacen;
           QMRegInventarioCALLE.AsString := Calle;
           QMRegInventarioESTANTERIA.AsString := Estanteria;
           QMRegInventarioREPISA.AsString := Repisa;
           QMRegInventarioPOSICION.AsString := Posicion;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRegInventarioUbicaciones.QMRegInventarioNewRecord(DataSet: TDataSet);
begin
  QMRegInventarioEMPRESA.AsInteger := EmpresaDM;
  QMRegInventarioCANAL.AsInteger := CanalDM;
  QMRegInventarioRIG.AsInteger := RigDM;
  QMRegInventarioLINEA.AsInteger := LineaDM;
  QMRegInventarioID_REG.AsInteger := id_regDM;
  QMRegInventarioID_REG_DETALLE.AsInteger := id_reg_detalleDM;
  QMRegInventarioID_A.AsInteger := id_aDM;
  QMRegInventarioPESO.AsFloat := 0;
  QMRegInventarioUNIDADES.AsFloat := 0;
  QMRegInventarioVOLUMEN.AsFloat := 0;
  QMRegInventarioDIAMETRO.AsFloat := 0;
  QMRegInventarioARTICULO.AsString := xArticulosARTICULO.AsString;
end;

procedure TDMRegInventarioUbicaciones.QMRegInventarioUNIDADESChange(Sender: TField);
begin
  if (QMRegInventarioUNIDADES.AsFloat > 0) then
  begin
     QMRegInventarioPESO.AsFloat := xArticulosPESO.AsFloat * QMRegInventarioUNIDADES.AsFloat;
     QMRegInventarioVOLUMEN.AsFloat := xArticulosVOLUMEN_UNIT.AsFloat *
        QMRegInventarioUNIDADES.AsFloat;
     QMRegInventarioDIAMETRO.AsFloat := xArticulosDIAMETRO_UNIT.AsFloat *
        QMRegInventarioUNIDADES.AsFloat;
     if not (CompruebaCapacidad(QMRegInventarioPESO.AsFloat,
        QMRegInventarioVOLUMEN.AsFloat, QMRegInventarioDIAMETRO.AsFloat)) then
        ShowMessage(_('Las dimensiones exceden de las definidas en la ubicación'));
  end;
end;

function TDMRegInventarioUbicaciones.InsertaUbicacion: boolean;
begin
  Result := False;
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(UNIDADES) FROM ART_REG_INVENTARIO_DET_UBI WHERE ID_REG_DETALLE = :ID_REG_DETALLE';
        Params.ByName['ID_REG_DETALLE'].AsInteger := id_reg_detalleDM;
        ExecQuery;
        if (FieldByName['SUM'].AsFloat <> Unidades_Doc) then
           raise Exception.Create(_('Las unidades ubicadas difieren de las unidades del documento'))
        else
           Result := True;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMRegInventarioUbicaciones.CompruebaCapacidad(NPeso, NVolumen, NDiametro: double): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT VOLUMEN_ACC, PESO_ACC, DIAMETRO_ACC, VOLUMEN_MAX, PESO_MAX, DIAMETRO_MAX, GENERAL ');
        SQL.Add(' FROM ART_ALMACENES_UBICACIONES ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_UBICACION = :ID_UBICACION ');
        Params.ByName['ID_UBICACION'].AsInteger := QMRegInventarioID_UBICACION.AsInteger;
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
     finally
        Free;
     end;
  end;
end;

function TDMRegInventarioUbicaciones.DameAlmacen: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT ALMACEN FROM ART_REG_INVENTARIO WHERE ID_REG = ' + IntToStr(id_regDM);
        ExecQuery;
        Result := FieldByName['ALMACEN'].AsString;
     finally
        Free;
     end;
  end;
end;

procedure TDMRegInventarioUbicaciones.QMRegInventarioDescUbicacionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloUbicacion(QMRegInventarioID_UBICACION.AsInteger);
end;

procedure TDMRegInventarioUbicaciones.QMRegInventarioUNIDADESGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DMMain.DameUnidadesConFormato(QMRegInventarioARTICULO.AsString, QMRegInventarioUNIDADES.AsFloat);
end;

end.
