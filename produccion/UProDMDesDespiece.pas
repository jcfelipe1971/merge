unit UProDMDesDespiece;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TProDMDesDespiece = class(TDataModule)
     TLocal: THYTransaction;
     QMDetDespiece: TFIBTableSet;
     DSCabDespiece: TDataSource;
     DSDetDespiece: TDataSource;
     QMDetDespieceEMPRESA: TIntegerField;
     QMDetDespieceEJERCICIO: TIntegerField;
     QMDetDespieceCANAL: TIntegerField;
     QMDetDespieceSERIE: TFIBStringField;
     QMDetDespieceRIG: TIntegerField;
     QMDetDespieceLINEA: TIntegerField;
     QMDetDespieceFASE: TFIBStringField;
     QMDetDespieceCANTIDAD: TFloatField;
     QMDetDespieceALTO: TFloatField;
     QMDetDespieceANCHO: TFloatField;
     QMDetDespieceGRUESO: TFloatField;
     QMDetDespieceMETROS_DESCONTAR: TFloatField;
     QMDetDespieceID_CAB_DESPIECE: TIntegerField;
     QMDetDespieceID_DET_DESPIECE: TIntegerField;
     xLineaDet: THYFIBQuery;
     QMDetDespieceDescFase: TStringField;
     QMDetDespieceDescTipoPieza: TStringField;
     xDescFase: TFIBDataSetRO;
     xDescTPieza: TFIBDataSetRO;
     xDescFaseTITULO: TFIBStringField;
     xDescTPiezaDESCRIPCION: TFIBStringField;
     QMDetDespieceID_TIPO_PIEZA: TFIBStringField;
     xBuscarIDEsc: TFIBDataSetRO;
     xBuscarIDEscID_ESC: TIntegerField;
     xRecuperarEsc: TFIBDataSetRO;
     xRecuperarEscESCANDALLO: TIntegerField;
     QMDetDespieceCOMPONENTE: TFIBStringField;
     QMDetDespiecePROFUNDIDAD: TFloatField;
     QMDetDespieceID_TIPO_MATERIAL: TFIBStringField;
     QMDetDespieceFORMULA_CALC_ALTURA: TFIBStringField;
     QMDetDespieceFORMULA_CALC_ANCHURA: TFIBStringField;
     QMDetDespieceFORMULA_CALC_PROF: TFIBStringField;
     QMDetDespieceFORMULA_CALC_GRUESO: TFIBStringField;
     QMDetDespieceDescComponente: TStringField;
     QMDetDespieceDescTMaterial: TStringField;
     xDescComponente: TFIBDataSetRO;
     xDescTMaterial: TFIBDataSetRO;
     xDescComponenteTITULO: TFIBStringField;
     xDescTMaterialDESCRIPCION: TFIBStringField;
     xImportarEsc: THYFIBQuery;
     xComprobarImportacionEsc: TFIBDataSetRO;
     xComprobarImportacionEscLINIES: TIntegerField;
     xInsertOF: THYFIBQuery;
     Pro_Traspaso_Tipo_Lanzamiento: THYFIBQuery;
     Pro_Update_Situacion: THYFIBQuery;
     QMCabDespiece: TFIBTableSet;
     QMCabDespieceESCANDALLO: TIntegerField;
     QMCabDespieceEMPRESA: TIntegerField;
     QMCabDespieceEJERCICIO: TIntegerField;
     QMCabDespieceCANAL: TIntegerField;
     QMCabDespieceSERIE: TFIBStringField;
     QMCabDespieceRIG: TIntegerField;
     QMCabDespiecePEDIDO: TIntegerField;
     QMCabDespieceLINEA_PEDIDO: TIntegerField;
     QMCabDespieceFECHA_CREACION: TDateTimeField;
     QMCabDespieceID_ESCANDALLO: TIntegerField;
     QMCabDespieceTIPO_MATERIAL: TFIBStringField;
     QMCabDespieceARTICULO_MAT_PRIMA: TFIBStringField;
     QMCabDespieceCOMENTARIO: TFIBStringField;
     QMCabDespieceALTO: TFloatField;
     QMCabDespieceANCHO: TFloatField;
     QMCabDespiecePROFUNDIDAD: TFloatField;
     QMCabDespieceGRUESO_PRINCIPAL: TFloatField;
     QMCabDespieceNOTAS: TBlobField;
     QMCabDespieceIMAGEN: TIntegerField;
     QMCabDespieceCANTIDAD: TFloatField;
     QMCabDespieceID_DESPIECE: TIntegerField;
     QMCabDespieceID_ORDEN: TIntegerField;
     QMCabDespieceID_SUBORDEN: TIntegerField;
     QMDetDespieceFORMULA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabDespieceNewRecord(DataSet: TDataSet);
     procedure QMDetDespieceNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMCabDespieceAfterOpen(DataSet: TDataSet);
     procedure QMDetDespieceDescFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetDespieceDescTipoPiezaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabDespieceESCANDALLOChange(Sender: TField);
     procedure QMCabDespieceESCANDALLOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetDespieceDescComponenteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetDespieceDescTMaterialGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabDespieceID_ORDENGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabDespieceID_SUBORDENGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabDespieceAfterScroll(DataSet: TDataSet);
     procedure QMCabDespieceTIPO_MATERIALChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure CrearOF;
     procedure CrearSubOrden(IdOrden: integer);
     procedure Update_Situacion(nSituacion, orden: integer);
     procedure Pro_Traspaso_Tipo_Lanzamiento_S(nTipo_Lanzamiento, orden: integer);
     procedure CalculaFormulas;
  end;

var
  ProDMDesDespiece : TProDMDesDespiece;

implementation

uses UDMMain, UEntorno, UFBusca, UFMain, UProFMDesDespiece;

{$R *.dfm}

procedure TProDMDesDespiece.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCabDespiece.Open;

  // DMMain.FiltraTabla (QMCabDespiece, '11110');
end;

procedure TProDMDesDespiece.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMDesDespiece.QMCabDespieceNewRecord(DataSet: TDataSet);
begin
  QMCabDespieceEMPRESA.AsInteger := REntorno.Empresa;
  QMCabDespieceEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabDespieceCANAL.AsInteger := REntorno.Canal;
  QMCabDespieceSERIE.AsString := REntorno.Serie;
  QMCabDespieceFECHA_CREACION.AsDateTime := Date;
  QMCabDespieceID_ORDEN.AsInteger := 0;
  QMCabDespieceID_SUBORDEN.AsInteger := 0;

  //Es posa el codi següent. Es crida al generador de la BDD
  if (DataSet.State = dsInsert) then
     QMCabDespieceID_DESPIECE.AsInteger := DMMain.ContadorGen('PRO_DES_DESPIECE');
end;

procedure TProDMDesDespiece.QMDetDespieceNewRecord(DataSet: TDataSet);
begin
  QMDetDespieceEMPRESA.AsInteger := REntorno.Empresa;
  QMDetDespieceEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetDespieceCANAL.AsInteger := REntorno.Canal;
  QMDetDespieceSERIE.AsString := REntorno.Serie;

  QMDetDespieceID_CAB_DESPIECE.AsInteger := QMCabDespieceID_DESPIECE.AsInteger;

  //Núm. Línea
  xLineaDet.Close;
  xLineaDet.Params.ByName['id_despiece'].AsInteger := QMCabDespieceID_DESPIECE.AsInteger;
  xLineaDet.ExecQuery;
  QMDetDespieceLINEA.AsInteger := xLineaDet.FieldByName['NLinea'].AsInteger + 1;
end;

procedure TProDMDesDespiece.QMCabDespieceAfterOpen(DataSet: TDataSet);
begin
  QMDetDespiece.Open;
end;

procedure TProDMDesDespiece.QMDetDespieceDescFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescFase.Close;
  xDescFase.Open;
  Text := xDescFaseTitulo.Value;
end;

procedure TProDMDesDespiece.QMDetDespieceDescTipoPiezaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescTPieza.Close;
  xDescTPieza.Open;
  Text := xDescTPiezaDescripcion.Value;
end;

procedure TProDMDesDespiece.QMCabDespieceESCANDALLOChange(Sender: TField);
begin
  xBuscarIDEsc.Close;
  xBuscarIDEsc.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  xBuscarIDEsc.Params.ByName['Escandallo'].AsInteger := QMCabDespieceESCANDALLO.AsInteger;
  xBuscarIDEsc.Open;
  QMCabDespieceID_ESCANDALLO.AsInteger := xBuscarIDEscID_ESC.AsInteger;
end;

procedure TProDMDesDespiece.QMCabDespieceESCANDALLOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xRecuperarEsc.Close;
  xRecuperarEsc.Params.ByName['id_esc'].AsInteger := QMCabDespieceID_ESCANDALLO.AsInteger;
  xRecuperarEsc.Open;
  Text := xRecuperarEscEscandallo.AsString;
end;

procedure TProDMDesDespiece.QMDetDespieceDescComponenteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescComponente.Close;
  xDescComponente.Open;
  Text := xDescComponenteTitulo.Value;
end;

procedure TProDMDesDespiece.QMDetDespieceDescTMaterialGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescTMaterial.Close;
  xDescTMaterial.Open;
  Text := xDescTMaterialDESCRIPCION.Value;
end;

procedure TProDMDesDespiece.QMCabDespieceID_ORDENGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // if (QMCabDespieceID_ORDEN.AsInteger = 0) then
  //   text:='';
end;

procedure TProDMDesDespiece.QMCabDespieceID_SUBORDENGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  // if (QMCabDespieceID_SUBORDEN.AsInteger = 0) then
  //   text:='';
end;

procedure TProDMDesDespiece.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabDespiece, '11110');
end;

procedure TProDMDesDespiece.CrearOF;
var
  Compuesto : string;
  IdOrden : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COMPUESTO FROM PRO_ESCANDALLO WHERE ID_ESC = :ID_ESCANDALLO';
        Params.ByName['ID_ESCANDALLO'].AsInteger := QMCabDespieceID_ESCANDALLO.AsInteger;
        ExecQuery;
        Compuesto := FieldByName['COMPUESTO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  IdOrden := DMMain.Contador_E('ZOP');

  with xInsertOF do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIES'].AsString := REntorno.Serie;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Params.ByName['ALMACEN_SAL'].AsString := '000';
     Params.ByName['ALMACEN_LAN'].AsString := '000';
     Params.ByName['ALMACEN_ENT'].AsString := '000';
     Params.ByName['FECHA_ORD'].AsDateTime := Date;
     Params.ByName['CLIENTE'].AsInteger := -1;
     Params.ByName['ARTICULO'].AsString := Compuesto;
     Params.ByName['ESCANDALLO'].AsInteger := StrToInt(ProFMDesDespiece.LFDBEFEscandallo.Text); // QMCabDespieceESCANDALLO.AsInteger;
     Params.ByName['PEDIDO'].AsInteger := 0;
     Params.ByName['LINEA_PED'].AsInteger := 0;
     Params.ByName['FECHA_PED'].AsDateTime := Date;
     Params.ByName['UNI_PEDID'].AsInteger := 0;
     Params.ByName['UNI_MANUAL'].AsInteger := 1;
     Params.ByName['SUBORDEN'].AsInteger := 0;
     ExecQuery;
     FreeHandle;
  end;

  // Es posa el valor del ID_Orden a la capçalera
  QMCabDespiece.Edit;
  QMCabDespieceID_ORDEN.AsInteger := IdOrden;
  QMCabDespiece.Post;

  // S'assigna el id_despiece a la OF
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD ');
        SQL.Add(' SET ');
        SQL.Add(' ID_DESPIECE = :ID_DESPIECE ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_ORDEN = :ID_ORDEN ');
        Params.ByName['ID_DESPIECE'].AsInteger := QMCabDespieceID_DESPIECE.AsInteger;
        Params.ByName['ID_ORDEN'].AsInteger := QMCabDespieceID_ORDEN.AsInteger;
        ExecQuery;
        Compuesto := FieldByName['COMPUESTO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // S'inserten els fases i tareas a través del trigger
  Pro_Traspaso_Tipo_Lanzamiento_S(420, QMCabDespieceID_ORDEN.AsInteger);
  Update_Situacion(1, QMCabDespieceID_ORDEN.AsInteger);

  // Es mostra la OF
  FMain.EjecutaAccion(FMain.AProOrden, QMCabDespieceID_ORDEN.AsString);
end;

procedure TProDMDesDespiece.Update_Situacion(nSituacion, orden: integer);
begin
  with Pro_Update_Situacion do
  begin
     Params.ByName['SITUACION'].AsInteger := nSituacion;
     Params.ByName['Id_Orden'].AsInteger := orden;
     ExecQuery;
     Transaction.CommitRetaining;
     FreeHandle;
  end;
end;

procedure TProDMDesDespiece.Pro_Traspaso_Tipo_Lanzamiento_S(nTipo_Lanzamiento, orden: integer);
begin

  with Pro_Traspaso_Tipo_Lanzamiento do
  begin
     Params.ByName['Tipo_Lanzamiento'].AsInteger := nTipo_Lanzamiento;
     Params.ByName['Id_Orden'].AsInteger := orden;
     ExecQuery;
  end;
end;

procedure TProDMDesDespiece.CrearSubOrden(IdOrden: integer);
var
  Compuesto : string;
  IdSubOrden : integer;
begin
  // Busco el compost del escandall
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COMPUESTO FROM PRO_ORD WHERE ID_ORDEN = :ID_ORDEN';
        Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
        ExecQuery;
        Compuesto := FieldByName['COMPUESTO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  IdSubOrden := DMMain.Contador_E('ZOP');

  with xInsertOF do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIES'].AsString := REntorno.Serie;
     Params.ByName['ID_ORDEN'].AsInteger := IdSubOrden;
     Params.ByName['ALMACEN_SAL'].AsString := '000';
     Params.ByName['ALMACEN_LAN'].AsString := '000';
     Params.ByName['ALMACEN_ENT'].AsString := '000';
     Params.ByName['FECHA_ORD'].AsDateTime := Date;
     Params.ByName['CLIENTE'].AsInteger := -1;
     Params.ByName['ARTICULO'].AsString := Compuesto; //'DES';//QMCabDespieceARTICULO_MAT_PRIMA.AsString;
     Params.ByName['ESCANDALLO'].AsInteger := StrToInt(ProFMDesDespiece.LFDBEFEscandallo.Text); //QMCabDespieceESCANDALLO.AsInteger;
     Params.ByName['PEDIDO'].AsInteger := 0;
     Params.ByName['LINEA_PED'].AsInteger := 0;
     Params.ByName['FECHA_PED'].AsDateTime := Date;
     Params.ByName['UNI_PEDID'].AsInteger := 0;
     Params.ByName['UNI_MANUAL'].AsInteger := 1;
     Params.ByName['SUBORDEN'].AsInteger := IdOrden;

     ExecQuery;
     FreeHandle;
  end;

  // Es posa el valor del ID_Orden a la capçalera
  QMCabDespiece.Edit;
  QMCabDespieceID_ORDEN.AsInteger := IdOrden;
  QMCabDespieceID_SUBORDEN.AsInteger := IdSubOrden;
  QMCabDespiece.Post;

  // S'assigna el id_despiece a la OF
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD ');
        SQL.Add(' SET ');
        SQL.Add(' ID_DESPIECE = :ID_DESPIECE ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_ORDEN = :ID_ORDEN ');
        Params.ByName['ID_DESPIECE'].AsInteger := QMCabDespieceID_DESPIECE.AsInteger;
        Params.ByName['ID_ORDEN'].AsInteger := QMCabDespieceID_SUBORDEN.AsInteger;
        ExecQuery;
        Compuesto := FieldByName['COMPUESTO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // S'inserten els fases i tareas a través del trigger
  Pro_Traspaso_Tipo_Lanzamiento_S(420, QMCabDespieceID_SUBORDEN.AsInteger);
  Update_Situacion(1, QMCabDespieceID_SUBORDEN.AsInteger);

  // Es mostra la OF
  FMain.EjecutaAccion(FMain.AProOrden, QMCabDespieceID_SUBORDEN.AsString);
end;

procedure TProDMDesDespiece.QMCabDespieceAfterScroll(DataSet: TDataSet);
begin
  // Control del menú
  if (ProDMDesDespiece.QMCabDespieceID_ORDEN.AsInteger <> 0) then
  begin
     ProFMDesDespiece.AACrearOF.Enabled := False;
     ProFMDesDespiece.AACrearSuborden.Enabled := False;
     ProFMDesDespiece.AAImportarEsc.Enabled := False;
  end
  else
  begin
     ProFMDesDespiece.AACrearOF.Enabled := True;
     ProFMDesDespiece.AACrearSuborden.Enabled := True;
     ProFMDesDespiece.AAImportarEsc.Enabled := True;
  end;
end;

procedure TProDMDesDespiece.QMCabDespieceTIPO_MATERIALChange(Sender: TField);
begin
  // Buscar l'article per defecte
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DET.ARTICULO FROM PRO_DES_DET_MATERIAL DET ');
        SQL.Add(' LEFT JOIN PRO_DES_CAB_MATERIAL CAB ON (CAB.ID = DET.ID_CAB) ');
        SQL.Add(' WHERE ');
        SQL.Add(' DET.POR_DEFECTO = 1 AND ');
        SQL.Add(' CAB.TIPO = :TIPO ');
        Params.ByName['TIPO'].AsString := QMCabDespieceTIPO_MATERIAL.AsString; // LFDBTMaterial.Text;
        ExecQuery;
        QMCabDespieceARTICULO_MAT_PRIMA.AsString := FieldByName['ARTICULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMDesDespiece.CalculaFormulas;
begin
  // Calculamos las formulas del despiece
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_DAME_CALCULO_FORMULA(:ID_DESPIECE, 0, 3)';
        Params.ByName['ID_DESPIECE'].AsInteger := QMCabDespieceID_DESPIECE.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabDespiece.Refresh;
end;

end.
