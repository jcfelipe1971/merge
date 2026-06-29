unit UProDMMatInc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Dialogs, DBCtrls, URecursos;

type
  TProDMMatInc = class(TDataModule)
     QMProCabInc: TFIBTableSet;
     DSQMProCabInc: TDataSource;
     TLocal: THYTransaction;
     QMProCabIncEMPRESA: TIntegerField;
     QMProCabIncEJERCICIO: TIntegerField;
     QMProCabIncCANAL: TIntegerField;
     QMProCabIncSERIE: TFIBStringField;
     QMProCabIncRIG: TIntegerField;
     QMProCabIncFECHA: TDateTimeField;
     QMProCabIncORDEN: TIntegerField;
     QMProDetInc: TFIBTableSet;
     DSQMProDetInc: TDataSource;
     QMProDetIncEMPRESA: TIntegerField;
     QMProDetIncEJERCICIO: TIntegerField;
     QMProDetIncCANAL: TIntegerField;
     QMProDetIncSERIE: TFIBStringField;
     QMProDetIncRIG_OF: TIntegerField;
     QMProDetIncLINEA: TIntegerField;
     QMProDetIncCOMPONENTE: TFIBStringField;
     QMProDetIncUNDS: TFloatField;
     QMProDetIncPRE_COS_UNI: TFloatField;
     QMProDetIncTOTAL: TFloatField;
     QMProDetIncNOTAS: TBlobField;
     QMProDetIncDescripcion: TStringField;
     QMProCabIncFASES: TFIBStringField;
     QMProCabIncDESCRIPFASE: TStringField;
     QMProCabIncCOMPUESTO: TStringField;
     QMProCabIncID_CIERRE: TIntegerField;
     QMProCabIncSUBORDEN: TIntegerField;
     QMProCabIncLINEA_FASE: TIntegerField;
     QMProCabIncID_ORDEN: TIntegerField;
     QMProCabIncID_INC_C: TIntegerField;
     QMProCabIncALMACEN_SAL: TFIBStringField;
     QMProCabIncALMACEN_LAN: TFIBStringField;
     QMProDetIncID_CIERRE: TIntegerField;
     QMProDetIncID_ORDEN_MAT: TIntegerField;
     QMProDetIncN_MOV_STOCK: TIntegerField;
     QMProDetIncALMACEN: TFIBStringField;
     QMProDetIncID_ORDEN: TIntegerField;
     QMProDetIncID_INC_C: TIntegerField;
     QMProDetIncID_INC_D: TIntegerField;
     QMProDetIncID_ORDEN_MAT_COMPRA: TIntegerField;
     xComprobarOF: TFIBDataSetRO;
     DsxComporbarOF: TDataSource;
     xComprobarOFSITUACION: TIntegerField;
     xTotalDetalle: TFIBDataSetRO;
     DSxTotalDetalle: TDataSource;
     xTotalDetalleTOTALDETALLE: TFloatField;
     TUpdate: THYTransaction;
     QMProCabIncRIG_MOV: TIntegerField;
     QMProDetIncID_UBICACION: TIntegerField;
     QMProDetIncID_NRO_SERIE_KRI: TIntegerField;
     QMProDetIncNRO_SERIE_LOTE: TFIBStringField;
     QMProDetIncTITULO_UBICACION: TStringField;
     QMProDetIncLINEA_MOV: TIntegerField;
     QMProDetIncID_LOTE: TIntegerField;
     QMProDetIncDescLote: TStringField;
     QMProCabIncTITULO: TStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProCabIncAfterOpen(DataSet: TDataSet);
     procedure QMProCabIncNewRecord(DataSet: TDataSet);
     procedure QMProDetIncNewRecord(DataSet: TDataSet);
     procedure QMProDetIncCOMPONENTEChange(Sender: TField);
     procedure QMProDetIncDescripcionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetIncBeforePost(DataSet: TDataSet);
     procedure QMProCabIncAfterScroll(DataSet: TDataSet);
     procedure QMProDetIncAfterPost(DataSet: TDataSet);
     procedure QMProCabIncBeforePost(DataSet: TDataSet);
     procedure QMProDetIncUNDSChange(Sender: TField);
     procedure QMProDetIncPRE_COS_UNIChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMProCabIncID_ORDENChange(Sender: TField);
     procedure QMProCabIncBeforeClose(DataSet: TDataSet);
     procedure QMProDetIncTITULO_UBICACIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetIncDescLoteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetIncID_LOTEChange(Sender: TField);
     procedure QMProCabIncCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     function BuscarFase(Tarea: string): string;
     procedure InsertaCabecera(IdOrden: integer; Fase: string; Linea_fase: integer; AlmSal, AlmLanz: string);
     procedure FiltrarCabecera(id_inc_c: integer);
     procedure ComprobarExisteDetalle(id_inc_c: integer);
     procedure InfoLotes;
     procedure ComprobarOPCerrada;
  end;

var
  ProDMMatInc : TProDMMatInc;

implementation

uses UEntorno, UDMMain, UDameDato, UFBusca, UProFMMatInc, Mask, UFMIntroduceLotes,
  UUtiles;

{$R *.dfm}

procedure TProDMMatInc.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Es mas rapido hacerlo antes de abrir las tablas
  QMProDetIncUNDS.DisplayFormat := MascaraN;
  QMProDetIncPRE_COS_UNI.DisplayFormat := MascaraN;
  QMProDetIncTOTAL.DisplayFormat := MascaraN;
  xTotalDetalleTOTALDETALLE.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMProCabInc, '11110');
end;

procedure TProDMMatInc.QMProCabIncAfterOpen(DataSet: TDataSet);
begin
  QMProDetInc.Open;
  xComprobarOF.Open;
  xTotalDetalle.Open;

  // Es comprova si està tancada per deshabilitar objectes
  ComprobarOPCerrada;
end;

procedure TProDMMatInc.QMProCabIncBeforeClose(DataSet: TDataSet);
begin
  QMProDetInc.Close;
  xComprobarOF.Close;
  xTotalDetalle.Close;
end;

procedure TProDMMatInc.QMProCabIncNewRecord(DataSet: TDataSet);
begin
  QMProCabIncEMPRESA.AsInteger := REntorno.Empresa;
  QMProCabIncEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMProCabIncCANAL.AsInteger := REntorno.Canal;
  QMProCabIncSERIE.AsString := REntorno.Serie;
  QMProCabIncFECHA.AsDateTime := REntorno.FechaTrab;
  QMProCabIncALMACEN_LAN.AsString := REntorno.AlmacenDefecto;
  QMProCabIncALMACEN_SAL.AsString := REntorno.AlmacenDefecto;
end;

procedure TProDMMatInc.QMProDetIncNewRecord(DataSet: TDataSet);
begin
  QMProDetIncEMPRESA.AsInteger := REntorno.Empresa;
  QMProDetIncEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMProDetIncCANAL.AsInteger := REntorno.Canal;
  QMProDetIncSERIE.AsString := REntorno.Serie;
  QMProDetIncRIG_OF.AsInteger := QMProCabIncRIG.AsInteger;
  {dji lrk kri - Para que funcionen las busquedas por ubicacion, nro serie, lote}
  QMProDetIncALMACEN.AsString := QMProCabIncALMACEN_SAL.AsString;

  QMProDetIncID_LOTE.AsInteger := 0;
  QMProDetIncID_UBICACION.AsInteger := 0;
end;

procedure TProDMMatInc.QMProDetIncCOMPONENTEChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  /// Las incidencias de materiales informan el precio de ultima entrada y si es nulo el
  /// precio de coste en lugar del precio de entrada para el precio unitario de la incidencia.

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT A.TITULO, COALESCE(P.PRECIO_ULT_ENTRADA, A.P_COSTE) AS P_COSTE ');
        SQL.Add(' FROM ART_ARTICULOS A ');
        SQL.Add(' LEFT JOIN ART_ARTICULOS_PRECIOS P ON (P.ID_A = A.ID_A) ');
        SQL.Add(' WHERE ');
        SQL.Add(' A.EMPRESA = :EMPRESA AND ');
        SQL.Add(' A.ARTICULO = :COMPONENTE ');
        Params.ByName['EMPRESA'].AsInteger := QMProDetIncEMPRESA.AsInteger;
        Params.ByName['COMPONENTE'].AsString := QMProDetIncCOMPONENTE.AsString;
        ExecQuery;
        QMProDetIncPRE_COS_UNI.Value := FieldByName['P_COSTE'].AsFloat;
        QMProDetIncDescripcion.Value := FieldByName['TITULO'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMMatInc.QMProDetIncDescripcionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMProDetIncCOMPONENTE.AsString);
end;

procedure TProDMMatInc.QMProDetIncBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMProDetIncTOTAL.Value := QMProDetIncPRE_COS_UNI.Value * QMProDetIncUNDS.Value;

  { Busco la última linea }
  if (QMProDetInc.State = dsInsert) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select max(linea) From PRO_MAT_INC_D ' +
           'where ((empresa=?empresa) and (ejercicio=?ejercicio) and ' +
           '(canal=?canal) and (serie=?serie) and (rig_of=?rig_of))';
        Params.ByName['EMPRESA'].AsInteger := QMProCabIncEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMProCabIncEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMProCabIncCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMProCabIncSERIE.AsString;
        Params.ByName['RIG_OF'].AsInteger := QMProCabIncRIG.AsInteger;
        ExecQuery;
        QMProDetIncLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;

  { Si no es ubicable ID_UBICACION=0 }
  if (not ArticuloUbicable(QMProDetIncCOMPONENTE.AsString)) then
     QMProDetIncID_UBICACION.AsInteger := 0;

  { Si no tiene Lote o Nro. de Serie lo vacio }
  if ((not ArticuloLoteable(QMProDetIncCOMPONENTE.AsString)) and (not ArticuloSerializado(QMProDetIncCOMPONENTE.AsString))) then
  begin
     QMProDetIncNRO_SERIE_LOTE.AsString := '';
     QMProDetIncID_NRO_SERIE_KRI.AsInteger := 0;
  end;
end;

procedure TProDMMatInc.QMProCabIncAfterScroll(DataSet: TDataSet);
begin
  // Es comprova si està tancada per deshabilitar objectes
  ComprobarOPCerrada;
end;

procedure TProDMMatInc.QMProDetIncAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMMatInc.QMProCabIncBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     QMProCabIncRig.AsInteger := DMMain.Contador_EECS(QMProCabIncSERIE.AsString, 'ZIM');
  end;
end;

procedure TProDMMatInc.QMProDetIncUNDSChange(Sender: TField);
begin
  QMProDetIncTOTAL.Value := QMProDetIncUNDS.Value * QMProDetIncPRE_COS_UNI.Value;
end;

procedure TProDMMatInc.QMProDetIncPRE_COS_UNIChange(Sender: TField);
begin
  QMProDetIncTOTAL.Value := QMProDetIncUNDS.Value * QMProDetIncPRE_COS_UNI.Value;
end;

procedure TProDMMatInc.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProCabInc, '11110');
end;

function TProDMMatInc.BuscarFase(Tarea: string): string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FASE FROM PRO_SYS_TAREAS WHERE TAREA = :TAREA';
        Params.ByName['TAREA'].AsInteger := StrToInt(Tarea);
        ExecQuery;
        Result := FieldByName['FASE'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMMatInc.QMProCabIncID_ORDENChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  inherited;
  if (QMProCabInc.State = dsInsert) then
  begin
     { Establesco los almacenes segun la orden de produccion }
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ALMACEN_SAL, ALMACEN_LAN FROM PRO_ORD WHERE ID_ORDEN = :ID_ORDEN';
           Params.ByName['ID_ORDEN'].AsInteger := QMProCabIncID_ORDEN.AsInteger;
           ExecQuery;
           QMProCabIncALMACEN_SAL.AsString := FieldByName['ALMACEN_SAL'].AsString;
           QMProCabIncALMACEN_LAN.AsString := FieldByName['ALMACEN_LAN'].AsString;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

procedure TProDMMatInc.InsertaCabecera(IdOrden: integer; Fase: string; Linea_fase: integer; AlmSal, AlmLanz: string);
begin
  inherited;
  QMProCabInc.Insert;
  QMProCabIncID_ORDEN.AsInteger := IdOrden;
  QMProCabIncFASES.AsString := Fase;
  QMProCabIncLINEA_FASE.AsInteger := Linea_fase;
  QMProCabIncALMACEN_SAL.AsString := AlmSal;
  QMProCabIncALMACEN_LAN.AsString := AlmLanz;
  QMProCabInc.Post;
end;

procedure TProDMMatInc.FiltrarCabecera(id_inc_c: integer);
begin
  QMProCabInc.Close;
  QMProCabInc.SelectSQL.Clear;
  QMProCabInc.SelectSQL.Text := 'SELECT * FROM PRO_MAT_INC_C';
  QMProCabInc.SelectSQL.Add('where id_inc_c=' + IntToStr(id_inc_c));
  QMProCabInc.Open;
end;

procedure TProDMMatInc.Graba(DataSet: TDataSet);
var
  Mark : TBookmark;
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  {dji lrk kri - Porqué dos refresh?}
  QMProCabInc.Refresh;
  xTotalDetalle.Close;
  xTotalDetalle.Open;

  if (ProFMMatInc.origen = 'produccion') then
  begin
     with TFIBDataSetRO(ProFMMatInc.Moduldades.FindComponent('xInfoIncMaterial')) do
     begin
        mark := GetBookmark;
        try
           DisableControls;
           Close;
           Open;
           GotoBookmark(mark);
        finally
           EnableControls;
           FreeBookmark(mark);
        end;
     end;
  end;
end;

// Es borra la capçalera si no hi han dades al registre detall
procedure TProDMMatInc.ComprobarExisteDetalle(id_inc_c: integer);
var
  Q : THYFIBQuery;
  SinDetalle : boolean;
begin
  // Comprobamos cuantas lineas de detalle tiene esta cabecera
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM PRO_MAT_INC_D WHERE ID_INC_C = :ID_INC_C';
        Params.ByName['ID_INC_C'].AsInteger := id_inc_c;
        ExecQuery;
        SinDetalle := (FieldByName['COUNT'].AsInteger = 0);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if (SinDetalle) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM PRO_MAT_INC_C WHERE ID_INC_C = :ID_INC_C';
           Params.ByName['ID_INC_C'].AsInteger := id_inc_c;
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     ShowMessage(_('ADVERTENCIA: Se ha borrado el parte al no contener artículos en el detalle'));
  end;
end;

procedure TProDMMatInc.QMProDetIncTITULO_UBICACIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloUbicacion(QMProDetIncID_UBICACION.AsInteger);
end;

procedure TProDMMatInc.InfoLotes;
var
  IntroduceLotes : TFMIntroduceLotes;
begin
  if (ArticuloLoteable(QMProDetIncCOMPONENTE.AsString)) then
  begin
     if (QMProDetInc.State = dsBrowse) then
        QMProDetInc.Edit;
     IntroduceLotes := TFMIntroduceLotes.Create(Self);
     try
        with IntroduceLotes do
        begin
           QMProDetIncID_LOTE.AsInteger := AsignaArticulo('INM', QMProDetIncSERIE.AsString,
              QMProDetIncCOMPONENTE.AsString, QMProDetIncEJERCICIO.AsInteger,
              QMProCabIncORDEN.AsInteger,
              QMProDetIncLINEA.AsInteger, QMProDetIncUNDS.AsFloat,
              QMProCabIncALMACEN_SAL.AsString,
              QMProCabIncALMACEN_SAL.AsString, QMProCabIncCANAL.AsInteger,
              QMProCabIncCANAL.AsInteger, True, DameIDArticulo(QMProDetIncCOMPONENTE.AsString),
              QMProDetIncID_INC_D.AsInteger, 0, False);

           {Informo la ubicacion seleccionada en la seleccion de lote}
           if (ArticuloUbicable(QMProDetIncCOMPONENTE.AsString)) then
              QMProDetIncID_UBICACION.AsInteger := IntroduceLotes.IDUbicacion;
        end;
     finally
        IntroduceLotes.Free;
     end;
  end;
end;

procedure TProDMMatInc.ComprobarOPCerrada;
begin
  // Es comprova si està tancada per deshabilitar objectes
  if (xComprobarOFSITUACION.AsInteger >= 3) then
  begin
     ProFMMatInc.DBGMateriales.Enabled := False;
     ProFMMatInc.NavDetalle.VisibleButtons :=
        ProFMMatInc.NavDetalle.VisibleButtons - [nbInsert, nbDelete, nbEdit, nbCancel, nbPost];
     ProFMMatInc.NavDetalle.Width := 100;
  end
  else
  begin
     ProFMMatInc.NavDetalle.VisibleButtons :=
        ProFMMatInc.NavDetalle.VisibleButtons + [nbInsert, nbDelete, nbEdit, nbCancel, nbPost];
     ProFMMatInc.DBGMateriales.Enabled := True;
     ProFMMatInc.NavDetalle.Width := 200;
  end;
end;

procedure TProDMMatInc.QMProDetIncDescLoteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameLote(QMProDetIncID_LOTE.AsInteger);
end;

procedure TProDMMatInc.QMProDetIncID_LOTEChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  // Si esta marcada la opcio de que agafa el preu del lote, posar-lo
  if (DMMain.DameConstanteProduccion('OF_USAR_PRECIO_LOTE') = 1) then
  begin
     if (QMProDetIncCOMPONENTE.AsString <> '') then
     begin
        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              {
              SQL.Text := 'SELECT PRECIO FROM ART_ARTICULOS_LOTES WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO AND LOTE = :LOTE';
              Params.ByName['EMPRESA'].AsInteger := QMProDetIncEMPRESA.AsInteger;
              Params.ByName['ARTICULO'].AsString := QMProDetIncCOMPONENTE.AsString;
              Params.ByName['LOTE'].AsString := DameLote(QMProDetIncID_LOTE.AsInteger);
              }
              SQL.Text := 'SELECT PRECIO FROM ART_ARTICULOS_LOTES WHERE ID_LOTE = :ID_LOTE';
              Params.ByName['ID_LOTE'].AsInteger := QMProDetIncID_LOTE.AsInteger;
              ExecQuery;
              if (FieldByName['PRECIO'].AsFloat <> 0) then
                 QMProDetIncPRE_COS_UNI.AsFloat := FieldByName['PRECIO'].AsFloat;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
     end;
  end;
end;

procedure TProDMMatInc.QMProCabIncCalcFields(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COMPUESTO FROM PRO_ORD WHERE ID_ORDEN = :ID_ORDEN';
        Params.ByName['ID_ORDEN'].AsInteger := QMProCabIncID_ORDEN.AsInteger;
        ExecQuery;
        QMProCabIncCOMPUESTO.AsString := FieldByName['COMPUESTO'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMProCabIncTITULO.AsString := DameTituloArticulo(QMProCabIncCOMPUESTO.AsString);

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FASE FROM PRO_ORD_FASES WHERE ID_ORDEN = :ID_ORDEN AND LINEA_FASE = :LINEA_FASE';
        Params.ByName['ID_ORDEN'].AsInteger := QMProCabIncID_ORDEN.AsInteger;
        Params.ByName['LINEA_FASE'].AsInteger := QMProCabIncLINEA_FASE.AsInteger;
        ExecQuery;
        QMProCabIncDESCRIPFASE.AsString := FieldByName['FASE'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

end.
