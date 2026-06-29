unit ZUDMPedidosEsp;

interface

uses {IDIOMA_CODE}
  gnugettext{IDIOMA_CODE}, SysUtils, Classes, DB, FIBDataSet, FIBDatabase,
  UFIBModificados, FIBTableDataSet, FIBDataSetRO, Forms, Windows, ExtCtrls, jpeg,
  GIFImage, Graphics, DBCtrls, ULFDBEdit, FIBQuery, HYFIBQuery, Dialogs;

type
  TZDMPedidosEsp = class(TDataModule)
     QMPedidosCab: TFIBTableSet;
     TLocal: THYTransaction;
     DSPedidosCab: TDataSource;
     QMPedidosCabEMPRESA: TIntegerField;
     QMPedidosCabEJERCICIO: TIntegerField;
     QMPedidosCabRIG: TIntegerField;
     QMPedidosCabCLIENTE: TIntegerField;
     QMPedidosCabFECHA: TDateTimeField;
     QMPedidosCabSU_REFERENCIA: TFIBStringField;
     QMPedidosCabNOTAS: TBlobField;
     QMPedidosCabDIAS_SERVIR: TIntegerField;
     QMPedidosCabFECHA_ENTREGA_PREV: TDateTimeField;
     QMPedidosCabESTADO_PED: TIntegerField;
     QMPedidosCabEMPRESA_D: TIntegerField;
     QMPedidosCabEJERCICIO_D: TIntegerField;
     QMPedidosCabCANAL_D: TIntegerField;
     QMPedidosCabSERIE_D: TFIBStringField;
     QMPedidosCabTIPO_D: TFIBStringField;
     QMPedidosCabRIG_D: TIntegerField;
     QMPedidosCabID_S_D: TIntegerField;
     DSPedidosTipo: TDataSource;
     DSPedidosDet: TDataSource;
     QMPedidosTipo: TFIBTableSet;
     QMPedidosDet: TFIBTableSet;
     QMPedidosTipoEMPRESA: TIntegerField;
     QMPedidosTipoEJERCICIO: TIntegerField;
     QMPedidosTipoRIG: TIntegerField;
     QMPedidosTipoTIPO_ARTICULO_TYC: TFIBStringField;
     QMPedidosTipoLACADO: TFIBStringField;
     QMPedidosTipoCANTIDAD: TIntegerField;
     xModelos: TFIBDataSetRO;
     xModelosDESCRIPCION: TFIBStringField;
     xModelosDIAS_SERVIR: TIntegerField;
     QMPedidosImg: TFIBTableSet;
     DSPedidosImg: TDataSource;
     QMPedidosImgEMPRESA: TIntegerField;
     QMPedidosImgEJERCICIO: TIntegerField;
     QMPedidosImgRIG: TIntegerField;
     QMPedidosImgLINEA: TIntegerField;
     QMPedidosImgRUTA_IMG: TFIBStringField;
     QMPedidosImgDESCRIPCION_IMG: TFIBStringField;
     QMPedidosTipoCONFIG_TIPO: TIntegerField;
     QMPedidosTipoCONFIG_SUBTIPO: TIntegerField;
     xDatosConfig: TFIBDataSetRO;
     xDatosConfigTIPO: TIntegerField;
     xDatosConfigSUBTIPO: TIntegerField;
     xDatosConfigCAMPO: TFIBStringField;
     xDatosConfigVISIBLE: TIntegerField;
     xDatosConfigORDEN: TIntegerField;
     xModelosCONFIG_TIPO: TIntegerField;
     xModelosCONFIG_SUBTIPO: TIntegerField;
     QMPedidosDetEMPRESA: TIntegerField;
     QMPedidosDetEJERCICIO: TIntegerField;
     QMPedidosDetRIG: TIntegerField;
     QMPedidosDetTIPO_ARTICULO_TYC: TFIBStringField;
     QMPedidosDetLINEA: TIntegerField;
     QMPedidosDetLINEAL: TFloatField;
     QMPedidosDetSALIDA: TFloatField;
     QMPedidosDetALTURA: TFloatField;
     QMPedidosDetLACADO: TFIBStringField;
     QMPedidosDetLONA: TFIBStringField;
     QMPedidosDetBAMBALINA: TFIBStringField;
     QMPedidosDetRIBETE: TFIBStringField;
     QMPedidosDetIMG_BAMBALINA: TBlobField;
     QMPedidosDetIMG_RIBETE: TBlobField;
     QMPedidosDetROTULADO: TIntegerField;
     QMPedidosDetROTULADO_COMENTARIO: TFIBStringField;
     QMPedidosDetMANUAL_O_MOTOR: TIntegerField;
     QMPedidosDetMOTOR_LT: TFIBStringField;
     QMPedidosDetMOTOR_EMISOR: TFIBStringField;
     QMPedidosDetMONTAJE: TFIBStringField;
     QMPedidosDetCOLOCACION: TFIBStringField;
     QMPedidosDetTEJADILLO: TFIBStringField;
     QMPedidosDetPORTERIA: TFIBStringField;
     QMPedidosDetPARTIDA_O_ENTERA: TIntegerField;
     QMPedidosDetPARTIDA_DER_IZQ_MED: TFIBStringField;
     QMPedidosDetENTERA_DER_O_IZQ: TFIBStringField;
     QMPedidosDetANCHO: TIntegerField;
     QMPedidosDetALTO_QUEDAR: TIntegerField;
     QMPedidosDetALTO_DOBLA_ABAJO: TIntegerField;
     QMPedidosDetALTO_REFUERZO_ALT: TIntegerField;
     QMPedidosDetALTO_DESDE_ARRIBA: TIntegerField;
     QMPedidosDetLARGO: TIntegerField;
     QMPedidosDetCURRIAS: TFIBStringField;
     QMPedidosDetCARRIL: TFIBStringField;
     QMPedidosDetVARILLA: TFIBStringField;
     QMPedidosDetTIPO_CONFECCION: TFIBStringField;
     QMPedidosDetCONFECCION_DOBLA_ALRED: TIntegerField;
     QMPedidosDetCONFECCION_OLLAOS_PEQ: TIntegerField;
     QMPedidosDetCONFECCION_OLLAOS_GRAN: TIntegerField;
     QMPedidosDetARRIBA_O_ABAJO: TIntegerField;
     QMPedidosDetVELCRO: TIntegerField;
     QMPedidosDetQUEDAR: TIntegerField;
     QMPedidosDetCORTE: TIntegerField;
     QMPedidosDetMONTADO: TIntegerField;
     QMPedidosDetTAPAJUNTAS: TFIBStringField;
     QMPedidosDetArticulo: TStringField;
     QMPedidosDetLineaPed: TIntegerField;
     QMPedidosDetMANUAL_MANIVELA: TFIBStringField;
     xMotores: TFIBDataSetRO;
     xMotoresART_MOTOR: TFIBStringField;
     xMotoresTITULO: TFIBStringField;
     DSxMotores: TDataSource;
     QMPedidosDetCOMPONENTE: TFIBStringField;
     QMPedidosDetMOD_BAMBALINA: TIntegerField;
     QMPedidosDetCANTIDAD: TFloatField;
     QMPedidosTipoMODELO: TFIBStringField;
     QMPedidosDetMODELO: TFIBStringField;
     xModelosCODIGO: TFIBStringField;
     QTyCConfig: TFIBDataSetRO;
     DSTycConfig: TDataSource;
     QTyCConfigLISTADO_PED_ESPECIALES: TIntegerField;
     QMPedidosDetNOTAS: TBlobField;
     xModelosNOTAS: TBlobField;
     QMPedidosTipoNOTAS: TBlobField;
     TUpdate: THYTransaction;
     xModelosIMAGEN: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPedidosCabAfterOpen(DataSet: TDataSet);
     procedure QMPedidosTipoAfterOpen(DataSet: TDataSet);
     procedure QMPedidosCabNewRecord(DataSet: TDataSet);
     procedure QMPedidosTipoNewRecord(DataSet: TDataSet);
     procedure QMPedidosCabBeforePost(DataSet: TDataSet);
     procedure QMPedidosCabAfterScroll(DataSet: TDataSet);
     procedure QMPedidosCabAfterPost(DataSet: TDataSet);
     procedure QMPedidosTipoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMPedidosDetNewRecord(DataSet: TDataSet);
     procedure QMPedidosTipoAfterScroll(DataSet: TDataSet);
     procedure QMPedidosImgNewRecord(DataSet: TDataSet);
     procedure QMPedidosImgAfterOpen(DataSet: TDataSet);
     procedure QMPedidosImgAfterScroll(DataSet: TDataSet);
     procedure QMPedidosDetArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure CompruebaEstado(DataSet: TDataSet);
     procedure QMPedidosDetLineaPedGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPedidosDetLINEALChange(Sender: TField);
     procedure QMPedidosDetSALIDAChange(Sender: TField);
     procedure QMPedidosDetMANUAL_O_MOTORChange(Sender: TField);
     procedure QMPedidosCabCLIENTEChange(Sender: TField);
  private
     { Private declarations }
     procedure RellenaDefecto;
     function DameLineaMinima(Modelo: string; Linea, Salida: integer): integer;
     procedure ControlaLineaMinima;
     procedure ControlaDisponibilidad;
     function DameTipoLona(Lona: string): string;
  public
     { Public declarations }
     Rig: integer;
     //sfg.albert - mala solució perquè quan inserti una linia,
     //depenent de si la bambalina es mostra o no, posar valor 25 (visible=true) o valor=0
     //S'hauria de fer procediment que abans d'insertar posi els valors per defecte
     //a aquells registre que són visibles
     muestra_bambalina: boolean;
     procedure AbreRig;
     procedure AnyadirPestanya(Lacado: string; Cantidad: double; Modelo: string);
     procedure RellenaPestanyas;
     procedure GuardaDetalles;
     procedure Guardar;
     procedure CrearPedidoOrden;
     function TieneEscandallo: boolean;
     //Ver Imagenes
     procedure RefrescarImagen;
     procedure CrearPackingList;
     function DameMinimaLinea(Modelo: string; Linea: integer): integer;
     function DameMinimaSalida(Modelo: string; Linea, Salida: integer): integer;
  end;

var
  ZDMPedidosEsp : TZDMPedidosEsp;

implementation

uses
  UDMMain, UEntorno, ZUFMPedidosEsp, ComCtrls, UProDMOrden, UFormGest;

{$R *.dfm}

procedure TZDMPedidosEsp.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Rig := 0;
  muestra_bambalina := False; // sfg.albert
  DMMain.FiltraTabla(QMPedidosCab, '11000');
end;

procedure TZDMPedidosEsp.QMPedidosCabAfterOpen(DataSet: TDataSet);
begin
  QMPedidosImg.Close;
  QMPedidosImg.Open;

  QMPedidosTipo.Close;
  QMPedidosTipo.Open;

  if (QMPedidosTipoRIG.AsInteger <> 0) then
     RellenaPestanyas;

  if (QMPedidosTipoTIPO_ARTICULO_TYC.AsString = 'T') or (QMPedidosTipoTIPO_ARTICULO_TYC.AsString = 'A') then
     RefrescarImagen;

  // sfg.albert
  QTyCConfig.Close;
  QTyCConfig.Open;
end;

procedure TZDMPedidosEsp.QMPedidosTipoAfterOpen(DataSet: TDataSet);
begin
  QMPedidosDet.Close;
  QMPedidosDet.Open;

  xDatosConfig.Close;
  xDatosConfig.Open;
end;

procedure TZDMPedidosEsp.QMPedidosCabNewRecord(DataSet: TDataSet);
var
  i : smallint;
begin
  for i := 0 to ZFMPedidosEsp.PCModelosArt.PageCount - 1 do
     ZFMPedidosEsp.PCModelosArt.Pages[i].TabVisible := False;

  QMPedidosCabEMPRESA.AsInteger := REntorno.Empresa;
  QMPedidosCabEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMPedidosCabFECHA.AsDateTime := REntorno.FechaTrabSH;
  QMPedidosCabFECHA_ENTREGA_PREV.AsDateTime := REntorno.FechaTrabSH;
  QMPedidosCabSERIE_D.AsString := REntorno.Serie;
end;

procedure TZDMPedidosEsp.QMPedidosTipoNewRecord(DataSet: TDataSet);
begin
  QMPedidosTipoEMPRESA.AsInteger := QMPedidosCabEMPRESA.AsInteger;
  QMPedidosTipoEJERCICIO.AsInteger := QMPedidosCabEJERCICIO.AsInteger;
  QMPedidosTipoRIG.AsInteger := QMPedidosCabRIG.AsInteger;
  QMPedidosTipoTIPO_ARTICULO_TYC.AsString := ZFMPedidosEsp.TipoG;
  QMPedidosTipoMODELO.AsString := ZFMPedidosEsp.ModeloG;
  QMPedidosTipoCONFIG_TIPO.AsString := ZFMPedidosEsp.ConfigTipoG;
  QMPedidosTipoCONFIG_SUBTIPO.AsString := ZFMPedidosEsp.ConfigSubtipoG;

  QMPedidosTipoLACADO.AsString := 'BL';
  QMPedidosTipoCANTIDAD.AsInteger := 1;
end;

procedure TZDMPedidosEsp.AnyadirPestanya(Lacado: string; Cantidad: double; Modelo: string);
begin
  if QMPedidosCab.State in [dsInsert, dsEdit] then
     QMPedidosCab.Post;

  if QMPedidosTipo.State = dsEdit then
     QMPedidosTipo.Post;

  QMPedidosTipo.Insert;
  if Lacado <> '' then
     QMPedidosTipoLACADO.AsString := Lacado;
  if Cantidad > 0 then
     QMPedidosTipoCANTIDAD.AsFloat := Cantidad;

  // Busca las notas del modelo
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT NOTAS FROM Z_SYS_MODELOS WHERE CODIGO = :MODELO';
        Params.ByName['MODELO'].AsString := Trim(Modelo);
        ExecQuery;
        QMPedidosTipoNOTAS.AsString := FieldByName['NOTAS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMPedidosTipo.Post;

  AbreRig;
end;

procedure TZDMPedidosEsp.RellenaPestanyas;
var
  contador, i : integer;
begin
  QMPedidosTipo.First;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM Z_GES_TIPO_PED WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND RIG=?RIG';
        Params.ByName['EMPRESA'].AsInteger := QMPedidosTipoEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPedidosTipoEJERCICIO.AsInteger;
        Params.ByName['RIG'].AsInteger := QMPedidosTipoRIG.AsInteger;
        ExecQuery;
        contador := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  i := 1;

  // while not QMPedidosTipo.EOF do
  while ((i <= contador) and (contador <> 0)) do
  begin
     ZFMPedidosEsp.CreaPestanya(QMPedidosTipoTIPO_ARTICULO_TYC.AsString, QMPedidosTipoMODELO.AsString, QMPedidosTipoCONFIG_TIPO.AsString, QMPedidosTipoCONFIG_SUBTIPO.AsString);

     QMPedidosTipo.Next;
     Inc(i);
  end;
  QMPedidosTipo.First;
  ZFMPedidosEsp.TipoG := QMPedidosTipoTIPO_ARTICULO_TYC.AsString;
  ZFMPedidosEsp.ModeloG := Trim(QMPedidosTipoMODELO.AsString);
  ZFMPedidosEsp.ConfigTipoG := QMPedidosTipoCONFIG_TIPO.AsString;
  ZFMPedidosEsp.ConfigSubtipoG := QMPedidosTipoCONFIG_SUBTIPO.AsString;
end;

procedure TZDMPedidosEsp.QMPedidosCabBeforePost(DataSet: TDataSet);
begin
  if QMPedidosCab.State = dsInsert then
  begin
     QMPedidosCabRIG.AsInteger := DMMain.Contador_EE('ZPE');
  end;
end;

procedure TZDMPedidosEsp.QMPedidosCabAfterScroll(DataSet: TDataSet);
begin
  ZFMPedidosEsp.EstadoPed(QMPedidosCabESTADO_PED.AsInteger);
end;

procedure TZDMPedidosEsp.QMPedidosCabAfterPost(DataSet: TDataSet);
begin
  Rig := QMPedidosCabRIG.AsInteger;
end;

procedure TZDMPedidosEsp.QMPedidosTipoPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  QMPedidosTipo.Cancel;
end;

procedure TZDMPedidosEsp.AbreRig;
begin
  QMPedidosCab.Close;
  QMPedidosCab.Params.ByName['RIG'].AsInteger := Rig;
  QMPedidosCab.Open;
end;

procedure TZDMPedidosEsp.RefrescarImagen;
(*
var
  m : TStream;
  I, J : integer;
  Tipo, Modelo : string;
*)
begin
  { TODO : La imagen del modelo ahora es un blob. Habrá que cambiar este código. }
  (*
  if xImagenes.Active then
  begin
     xImagenes.Close;
     xImagenes.Params.ByName['IMAGEN'].AsInteger := xModelosIMAGEN.AsInteger;
     xImagenes.Open;

     Tipo := QMPedidosTipoTIPO_ARTICULO_TYC.AsString;
     Modelo := Trim(QMPedidosTipoMODELO.AsString);
     for I := 0 to ZFMPedidosEsp.PCModelosArt.PageCount - 1 do
     begin
        if (ZFMPedidosEsp.PCModelosArt.Pages[I].Name = 'TS' + Tipo + Modelo) then
        begin
           for J := 0 to ZFMPedidosEsp.PCModelosArt.Pages[I].ComponentCount - 1 do
              if (ZFMPedidosEsp.PCModelosArt.Pages[I].Components[J] is TImage) and
                 ((ZFMPedidosEsp.PCModelosArt.Pages[I].Components[J] as TImage).Name = 'Image' + Tipo + Modelo) then
                 Break;
           Break;
        end;
     end;

     if (xImagenesORIGEN.AsInteger = 1) then //Desde Archivo
     begin
        ZFMPedidosEsp.AbrirArchivo(xImagenesRUTA.AsString,
           (ZFMPedidosEsp.PCModelosArt.Pages[I].Components[J] as TImage));
     end
     else //Desde la Base de Datos
     begin
        if xImagenesIMAGEN.IsNull then
           (ZFMPedidosEsp.PCModelosArt.Pages[I].Components[J] as TImage).Picture := nil
        else
        begin
           if xImagenesFORMATO.AsString = 'BMP' then
              (ZFMPedidosEsp.PCModelosArt.Pages[I].Components[J] as TImage).Picture.Graphic := TBitmap.Create
           else if xImagenesFORMATO.AsString = 'JPG' then
              (ZFMPedidosEsp.PCModelosArt.Pages[I].Components[J] as TImage).Picture.Graphic := TJpegImage.Create
           else if xImagenesFORMATO.AsString = 'GIF' then
              (ZFMPedidosEsp.PCModelosArt.Pages[I].Components[J] as TImage).Picture.Graphic := TGIFImage.Create
           else
              Exit;
           m := xImagenes.CreateBlobStream(xImagenesIMAGEN, bmRead);
           (ZFMPedidosEsp.PCModelosArt.Pages[I].Components[J] as TImage).Picture.Graphic.LoadFromStream(m);
           m.Free;
        end;
     end;
  end;
*)
end;

procedure TZDMPedidosEsp.QMPedidosDetNewRecord(DataSet: TDataSet);
begin
  QMPedidosDetEMPRESA.AsInteger := QMPedidosTipoEMPRESA.AsInteger;
  QMPedidosDetEJERCICIO.AsInteger := QMPedidosTipoEJERCICIO.AsInteger;
  QMPedidosDetRIG.AsInteger := QMPedidosTipoRIG.AsInteger;
  QMPedidosDetTIPO_ARTICULO_TYC.AsString := QMPedidosTipoTIPO_ARTICULO_TYC.AsString;
  QMPedidosDetMODELO.AsString := Trim(QMPedidosTipoMODELO.AsString);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(LINEA) FROM Z_GES_DETALLES_S_PED ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' RIG = :RIG AND ');
        SQL.Add(' TIPO_ARTICULO_TYC = :TIPO_ARTICULO_TYC AND ');
        SQL.Add(' MODELO = :MODELO ');
        Params.ByName['EMPRESA'].AsInteger := QMPedidosDetEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPedidosDetEJERCICIO.AsInteger;
        Params.ByName['RIG'].AsInteger := QMPedidosDetRIG.AsInteger;
        Params.ByName['TIPO_ARTICULO_TYC'].AsString := QMPedidosDetTIPO_ARTICULO_TYC.AsString;
        Params.ByName['MODELO'].AsString := QMPedidosDetMODELO.AsString;
        ExecQuery;
        QMPedidosDetLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMPedidosDetCANTIDAD.AsInteger := 1;
  QMPedidosDetLACADO.AsString := QMPedidosTipoLACADO.AsString;
  // sfg.albert - mala solució. S'hauria de fer procediment, com indico a la creació
  // de la variable
  if (muestra_bambalina = True) then
     QMPedidosDetMOD_BAMBALINA.AsInteger := 25
  else
     QMPedidosDetMOD_BAMBALINA.AsInteger := 0;

  QMPedidosDetRIBETE.AsString := 'IND';
  QMPedidosDetBAMBALINA.AsString := 'IND';
end;

procedure TZDMPedidosEsp.QMPedidosTipoAfterScroll(DataSet: TDataSet);
begin
  ZFMPedidosEsp.BuscaPestanya(QMPedidosTipoTIPO_ARTICULO_TYC.AsString, Trim(QMPedidosTipoMODELO.AsString));
end;

procedure TZDMPedidosEsp.GuardaDetalles;
begin
  if (QMPedidosDet.State in [dsInsert, dsEdit]) then
     QMPedidosDet.Post;
end;

procedure TZDMPedidosEsp.QMPedidosImgNewRecord(DataSet: TDataSet);
begin
  QMPedidosImgEMPRESA.AsInteger := QMPedidosCabEMPRESA.AsInteger;
  QMPedidosImgEJERCICIO.AsInteger := QMPedidosCabEJERCICIO.AsInteger;
  QMPedidosImgRIG.AsInteger := QMPedidosCabRIG.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM Z_GES_IMAGENES_PED WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND RIG = :RIG';
        Params.ByName['EMPRESA'].AsInteger := QMPedidosCabEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPedidosCabEJERCICIO.AsInteger;
        Params.ByName['RIG'].AsInteger := QMPedidosCabRIG.AsInteger;
        ExecQuery;
        QMPedidosImgLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMPedidosEsp.QMPedidosImgAfterOpen(DataSet: TDataSet);
begin
  ZFMPedidosEsp.AbrirArchivo(QMPedidosImgRUTA_IMG.AsString, ZFMPedidosEsp.ImagenFax);
end;

procedure TZDMPedidosEsp.QMPedidosImgAfterScroll(DataSet: TDataSet);
begin
  ZFMPedidosEsp.AbrirArchivo(QMPedidosImgRUTA_IMG.AsString, ZFMPedidosEsp.ImagenFax);
end;

procedure TZDMPedidosEsp.CrearPedidoOrden;
var
  i : integer;
  tsIdOrden : TStringList;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_G_PEDIDO_ESP_A_PEDIDO (?EMPRESA, ?EJERCICIO, ?RIG, ?CANAL, ?SERIE, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := QMPedidosCabEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPedidosCabEJERCICIO.AsInteger;
        Params.ByName['RIG'].AsInteger := QMPedidosCabRIG.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMPedidosCabSERIE_D.AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMPedidosCab.Refresh;
  ZFMPedidosEsp.EstadoPed(QMPedidosCabESTADO_PED.AsInteger);

  // Creo las ordenes según el pedido y calculo las formulas
  if (TieneEscandallo) then
  begin
     tsIdOrden := TStringList.Create;
     try
        with TFIBDataSet.Create(nil) do
        begin
           try
              Transaction := TFIBTransaction.Create(nil);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    // La transaccion debe ser de lectura/escritura
                    TRParams.Add('read_committed');
                    TRParams.Add('rec_version');
                    TRParams.Add('nowait');
                    if (not InTransaction) then
                       StartTransaction;
                 end;
                 SelectSQL.Add('SELECT ID_ORDEN FROM Z_PRO_CREAR_ORDEN_PEDIDO (?ID_S, ?FECHA, ?ENTRADA)');
                 Params.ByName['ID_S'].AsInteger := QMPedidosCabID_S_D.AsInteger;
                 Params.ByName['FECHA'].AsDateTime := QMPedidosCabFECHA.AsDateTime;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Open;
                 // Guardo los id_orden en una lista
                 while not EOF do
                 begin
                    tsIdOrden.Add(FieldByName('ID_ORDEN').AsString);
                    Next;
                 end;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;

        // Calculo las formulas de las ordenes generadas
        AbreData(TProDMOrden, ProDMOrden);
        for i := 0 to (tsIdOrden.Count - 1) do
           ProDMOrden.CalculaFormulas(StrToInt(tsIdOrden[i]));
        CierraData(ProDMOrden);
     finally
        tsIdOrden.Free
     end;
  end;
end;

function TZDMPedidosEsp.DameMinimaLinea(Modelo: string; Linea: integer): integer;
begin
  /// Devuelve la minima linea para ese modelo que puede utilizar para la linea pedida

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST (1) LINEA FROM Z_SYS_MODELOS_DET ');
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO = :MODELO AND ');
        SQL.Add(' LINEA >= :LINEA AND ');
        SQL.Add(' OBSOLETO = 0 ');
        SQL.Add(' ORDER BY LINEA ');
        Params.ByName['MODELO'].AsString := Modelo;
        Params.ByName['LINEA'].AsInteger := Linea;
        ExecQuery;
        Result := FieldByName['LINEA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPedidosEsp.DameMinimaSalida(Modelo: string; Linea, Salida: integer): integer;
begin
  /// Devuelve la minima salida para ese modelo que puede utilizar para la linea pedida

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST (1) SALIDA, LINEA_MINIMA FROM Z_SYS_MODELOS_DET ');
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO = :MODELO AND ');
        SQL.Add(' LINEA = :LINEA AND ');
        SQL.Add(' SALIDA >= :SALIDA AND ');
        SQL.Add(' OBSOLETO = 0 ');
        SQL.Add(' ORDER BY SALIDA ');
        Params.ByName['MODELO'].AsString := Modelo;
        Params.ByName['LINEA'].AsInteger := Linea;
        Params.ByName['SALIDA'].AsInteger := Salida;
        ExecQuery;
        Result := FieldByName['SALIDA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPedidosEsp.DameLineaMinima(Modelo: string; Linea, Salida: integer): integer;
begin
  /// Devuelve la minima salida para ese modelo que puede utilizar para la linea pedida

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT LINEA_MINIMA FROM Z_SYS_MODELOS_DET ');
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO = :MODELO AND ');
        SQL.Add(' LINEA = :LINEA AND ');
        SQL.Add(' SALIDA = :SALIDA AND ');
        SQL.Add(' OBSOLETO = 0 ');
        SQL.Add(' ORDER BY SALIDA ');
        Params.ByName['MODELO'].AsString := Modelo;
        Params.ByName['LINEA'].AsInteger := Linea;
        Params.ByName['SALIDA'].AsInteger := Salida;
        ExecQuery;
        Result := FieldByName['LINEA_MINIMA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMPedidosEsp.QMPedidosDetArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
//var
//tipo_lona : string;
begin
  Text := '';
  if (QMPedidosDetTIPO_ARTICULO_TYC.AsString = 'T') or (QMPedidosDetTIPO_ARTICULO_TYC.AsString = 'A') then
  begin
     Text := DMMain.DameArticuloSegunMedidas(QMPedidosDetMODELO.AsString, DameTipoLona(QMPedidosDetLONA.AsString), QMPedidosDetLINEAL.AsFloat, QMPedidosDetSALIDA.AsFloat);
  end;
end;

function TZDMPedidosEsp.DameTipoLona(Lona: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST (1) LON.Z_LON_TIPO');
        SQL.Add(' FROM ART_ARTICULOS LON ');
        SQL.Add(' WHERE ');
        SQL.Add(' LON.EMPRESA = :EMPRESA AND ');
        SQL.Add(' LON.ARTICULO = :LONA ');
        SQL.Add(' ORDER BY LON.ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['LONA'].AsString := Lona;
        ExecQuery;
        Result := Trim(FieldByName['Z_LON_TIPO'].AsString);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMPedidosEsp.CompruebaEstado(DataSet: TDataSet);
begin
  if (QMPedidosCabESTADO_PED.AsInteger = 1) then
  begin
     ShowMessage(_('No se puede borrar o modificar. El pedido ya esta procesado.'));
     DataSet.Cancel;
     Abort;
  end;
end;

procedure TZDMPedidosEsp.QMPedidosDetLineaPedGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DET.LINEA FROM Z_GES_DETALLES_S_PED Z ');
        SQL.Add(' JOIN GES_DETALLES_S DET ON (DET.ID_DETALLES_S = Z.ID_DETALLES_S_D) ');
        SQL.Add(' WHERE ');
        SQL.Add(' Z.EMPRESA = :EMPRESA AND ');
        SQL.Add(' Z.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' Z.RIG = :RIG AND ');
        SQL.Add(' Z.TIPO_ARTICULO_TYC = :TIPO_ARTICULO_TYC AND ');
        SQL.Add(' Z.MODELO = :MODELO AND ');
        SQL.Add(' Z.LINEA = :LINEA ');
        Params.ByName['EMPRESA'].AsInteger := QMPedidosDetEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPedidosDetEJERCICIO.AsInteger;
        Params.ByName['RIG'].AsInteger := QMPedidosDetRIG.AsInteger;
        Params.ByName['TIPO_ARTICULO_TYC'].AsString := QMPedidosDetTIPO_ARTICULO_TYC.AsString;
        Params.ByName['MODELO'].AsString := QMPedidosDetMODELO.AsString;
        Params.ByName['LINEA'].AsInteger := QMPedidosDetLINEA.AsInteger;
        ExecQuery;
        Text := FieldByName['LINEA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMPedidosEsp.QMPedidosDetLINEALChange(Sender: TField);
begin
  RellenaDefecto;
end;

procedure TZDMPedidosEsp.QMPedidosDetSALIDAChange(Sender: TField);
begin
  RellenaDefecto;
end;

procedure TZDMPedidosEsp.QMPedidosDetMANUAL_O_MOTORChange(Sender: TField);
begin
  RellenaDefecto;
end;

procedure TZDMPedidosEsp.RellenaDefecto;
var
  Linea, Salida : integer;
  Articulo, Prefijo : string;
begin
  Linea := DameMinimaLinea(QMPedidosDetMODELO.AsString, Trunc(QMPedidosDetLINEAL.AsFloat));
  Salida := DameMinimaSalida(QMPedidosDetMODELO.AsString, Linea, Trunc(QMPedidosDetSALIDA.AsFloat));

  Prefijo := 'A';
  Articulo := Prefijo + QMPedidosDetMODELO.AsString + IntToStr(Linea) + IntToStr(Salida);
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST (1) MAT.COMPONENTE ');
        SQL.Add(' FROM PRO_ESCANDALLO ESC ');
        SQL.Add(' JOIN PRO_MAT_ESC MAT ON (MAT.EMPRESA = ESC.EMPRESA AND MAT.ESCANDALLO = ESC.ESCANDALLO) ');
        SQL.Add(' JOIN ART_ARTICULOS ART ON (ART.EMPRESA = MAT.EMPRESA AND ART.ARTICULO = MAT.COMPONENTE) ');
        SQL.Add(' WHERE ');
        SQL.Add(' ESC.EMPRESA = :EMPRESA AND ');
        SQL.Add(' ESC.COMPUESTO = :ARTICULO AND ');
        SQL.Add(' ESC.ESTADO = 1 AND ');
        SQL.Add(' ART.TIPO_ARTICULO_TYC = ''C'' AND ');
        SQL.Add(' ART.FAMILIA = ''1'' ');
        SQL.Add(' ORDER BY ESC.DEFECTO DESC, ESC.ESCANDALLO DESC ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        QMPedidosDetMANUAL_MANIVELA.AsString := FieldByName['COMPONENTE'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Prefijo := DMMain.DamePrefijoArticulo(QMPedidosDetMODELO.AsString);
  Articulo := Prefijo + QMPedidosDetMODELO.AsString + IntToStr(Linea) + IntToStr(Salida);
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST (1) ART_MOTOR ');
        SQL.Add(' FROM Z_VER_MOTORES_ARTICULO(:EMPRESA, :ARTICULO, :LONA, :TARIFA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['LONA'].AsString := QMPedidosDetLONA.AsString;
        Params.ByName['TARIFA'].AsString := REntorno.TarifaDefecto;
        ExecQuery;
        QMPedidosDetMOTOR_EMISOR.AsString := FieldByName['ART_MOTOR'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPedidosEsp.TieneEscandallo: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Clear;
        SQL.Add(' SELECT FIRST 1 D.ID_DETALLES_S FROM GES_DETALLES_S D ');
        SQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.ID_S = :ID_S AND ');
        SQL.Add(' ((A.TIPO_ARTICULO_TYC = ''T'') OR ');
        SQL.Add('  (EXISTS(SELECT EMPRESA ');
        SQL.Add('          FROM PRO_ESCANDALLO ');
        SQL.Add('          WHERE ');
        SQL.Add('          EMPRESA = D.EMPRESA AND ');
        SQL.Add('          COMPUESTO = D.ARTICULO AND ');
        SQL.Add('          ESTADO = 1))) ');
        Params.ByName['ID_S'].AsInteger := QMPedidosCabID_S_D.AsInteger;
        ExecQuery;
        Result := (FieldByName['ID_DETALLES_S'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMPedidosEsp.QMPedidosCabCLIENTEChange(Sender: TField);
begin
  if (DMMain.ClienteBloqueado(QMPedidosCabCLIENTE.AsInteger)) then
     QMPedidosCab.Cancel;
end;

procedure TZDMPedidosEsp.ControlaDisponibilidad;
begin
  if ((QMPedidosDetTIPO_ARTICULO_TYC.AsString = 'L') or (QMPedidosDetTIPO_ARTICULO_TYC.AsString = 'T') and (QMPedidosDetLONA.AsString <> '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT DISPONIBILIDAD FROM CON_CUENTAS_GES_ART ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' ARTICULO = ?LONA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['LONA'].AsString := QMPedidosDetLONA.AsString;
           ExecQuery;
           if ((FieldByName['DISPONIBILIDAD'].AsInteger = 0) or (FieldByName['DISPONIBILIDAD'].AsInteger = 3)) then
           begin
              Application.MessageBox(PChar(string(_('Lona no disponible para su venta'))), PChar(string(_('Error'))), mb_iconstop);   //IDIOMA_CODE

              QMPedidosDet.Cancel;
           end;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TZDMPedidosEsp.ControlaLineaMinima;
var
  Linea, Salida, LineaMinima : integer;
begin
  if (QMPedidosDetTIPO_ARTICULO_TYC.AsString = 'T') or (QMPedidosDetTIPO_ARTICULO_TYC.AsString = 'A') then
  begin
     Linea := DameMinimaLinea(QMPedidosDetMODELO.AsString, Trunc(QMPedidosDetLINEAL.AsFloat));
     Salida := DameMinimaSalida(QMPedidosDetMODELO.AsString, Linea, Trunc(QMPedidosDetSALIDA.AsFloat));
     LineaMinima := DameLineaMinima(QMPedidosDetMODELO.AsString, Linea, Salida);

     if ((LineaMinima > 0) and (LineaMinima > Trunc(QMPedidosDetLINEAL.AsFloat))) then
        MessageDlg(_('ATENCIÓN: La linea minima es superior a la linea pedida.'), mtWarning, [mbOK], 0);
  end;
end;

// sfg_rsl -end- Es comprova si hi ha restriccions per clients
procedure TZDMPedidosEsp.CrearPackingList;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_GENERAR (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S)';
        Params.ByName['EMPRESA'].AsInteger := QMPedidosCabEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPedidosCabEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := QMPedidosCabSERIE_D.AsString;
        Params.ByName['TIPO'].AsString := QMPedidosCabTIPO_D.AsString;
        Params.ByName['RIG'].AsInteger := QMPedidosCabRIG_D.AsInteger;
        Params.ByName['ID_S'].AsInteger := QMPedidosCabID_S_D.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMPedidosEsp.Guardar;
begin
  ControlaDisponibilidad;

  if (QMPedidosDet.State in [dsInsert, dsEdit]) then
     QMPedidosDet.Post;

  QMPedidosCab.Refresh;
  QMPedidosTipo.Refresh;

  ControlaLineaMinima;
end;

end.
