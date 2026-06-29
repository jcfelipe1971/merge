unit UDMDespiece;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Dialogs, FR_DSet,
  FR_DBSet, FR_Class, Fr_HYReport;

type
  TDMDespiece = class(TDataModule)
     TLocal: THYTransaction;
     QMDespieceCab: TFIBTableSet;
     QMDespieceCom: TFIBTableSet;
     QMDespieceTar: TFIBTableSet;
     DSDespieceCab: TDataSource;
     DSDespieceCom: TDataSource;
     DSDespieceTar: TDataSource;
     QMDespieceCabID_DESPIECE_CAB: TIntegerField;
     QMDespieceCabMODELO: TFIBStringField;
     QMDespieceCabMEDIDA_1: TFloatField;
     QMDespieceCabMEDIDA_2: TFloatField;
     QMDespieceCabENTRADA: TIntegerField;
     QMDespieceCabTOTAL_COMPONENTES: TFloatField;
     QMDespieceCabTOTAL_TAREAS: TFloatField;
     QMDespieceCabTOTAL_COSTE: TFloatField;
     QMDespieceCabPRECIO_VENTA: TFloatField;
     QMDespieceCabMARGEN: TFloatField;
     QMDespieceComID_DESPIECE_CAB: TIntegerField;
     QMDespieceComID_DESPIECE_DET: TIntegerField;
     QMDespieceComFASE: TFIBStringField;
     QMDespieceComCOMPONENTE: TFIBStringField;
     QMDespieceComUNIDADES_ART: TFIBStringField;
     QMDespieceComCANTIDAD: TFloatField;
     QMDespieceComPRECIO: TFloatField;
     QMDespieceComTOTAL: TFloatField;
     QMDespieceComLACADO: TFIBStringField;
     QMDespieceComFORMULA: TIntegerField;
     QMDespieceTarID_DESPIECE_CAB: TIntegerField;
     QMDespieceTarID_DESPIECE_TAREA: TIntegerField;
     QMDespieceTarFASE: TFIBStringField;
     QMDespieceTarTIPO_TAREA: TFIBStringField;
     QMDespieceTarRECURSO: TFIBStringField;
     QMDespieceTarFORMULA: TIntegerField;
     QMDespieceTarTIEMPO: TFloatField;
     QMDespieceTarPRECIO_RECURSO: TFloatField;
     QMDespieceTarTOTAL: TFloatField;
     QMDespieceCabLONA_LAMA: TFIBStringField;
     QMDespieceCabCOLOR: TFIBStringField;
     QMDespieceComLINEA_FASE: TIntegerField;
     QMDespieceTarLINEA_FASE: TIntegerField;
     QMDespieceCabMOTOR: TIntegerField;
     QMDespieceComTIPO_FASE: TFIBStringField;
     QMDespieceCabESCANDALLO: TIntegerField;
     QMDespieceComCORTE: TIntegerField;
     QMDespieceComCORTE_MEDIDA1: TFloatField;
     QMDespieceComCORTE_MEDIDA2: TFloatField;
     QMDespieceComCORTE_MEDIDA3: TFloatField;
     QMDespieceComCORTE_MEDIDA4: TFloatField;
     QMDespieceCabMEDIDA_1_MODELO: TFloatField;
     QMDespieceCabMEDIDA_2_MODELO: TFloatField;
     QMDespieceCabTOTAL_VENTA: TFloatField;
     QMDespieceComDescFormula: TStringField;
     QMDespieceTarDescFormula: TStringField;
     QMDespieceTarDescTarea: TStringField;
     QMDespieceTarDescRecurso: TStringField;
     QMDespieceCabTOTAL: TFloatField;
     QMDespieceCabESTADO: TIntegerField;
     QMDespieceCabEMPRESA: TIntegerField;
     QMDespieceCabEJERCICIO: TIntegerField;
     QMDespieceCabCANAL: TIntegerField;
     QMDespieceCabSERIES: TFIBStringField;
     QMDespieceCabID_ORDEN: TIntegerField;
     QMDespieceTarTIPO_FASE: TFIBStringField;
     QMDespieceCabID_ORIGEN: TIntegerField;
     QMDespieceCabID_DETALLE: TIntegerField;
     QMDespieceCabTIPO_ORIGEN: TFIBStringField;
     QMDespieceCabTIPO_MOTOR: TFIBStringField;
     QMDespieceCabTIPO_MEDIDA: TIntegerField;
     QMDespieceCabCAJON: TFIBStringField;
     QMDespieceCabGUIA: TFIBStringField;
     QMDespieceCabCANTIDAD: TFloatField;
     QMDespieceCabDESC_ESCANDALLO: TStringField;
     QMDespieceCabNOTAS: TBlobField;
     QMDespieceComNOTAS: TBlobField;
     QMDespieceTarNOTAS: TBlobField;
     QMDespieceCabTITULO_ESTADO: TStringField;
     TUpdate: THYTransaction;
     QMDespieceCabDOC_ORIGEN: TStringField;
     QMDespieceSFGDatos: TFIBTableSet;
     DSQMDespieceSFGDatos: TDataSource;
     QMDespieceSFGDatosID_DESPIECE_CAB: TIntegerField;
     QMDespieceSFGDatosTIPO: TIntegerField;
     QMDespieceSFGDatosSUBTIPO: TIntegerField;
     QMDespieceSFGDatosCAMPO: TFIBStringField;
     QMDespieceSFGDatosVISIBLE: TIntegerField;
     QMDespieceSFGDatosORDEN: TIntegerField;
     QMDespieceSFGDatosVALOR_STR: TFIBStringField;
     QMDespieceSFGDatosVALOR_FLOAT: TFloatField;
     QMDespieceSFGDatosVALOR_INT: TIntegerField;
     QMDespieceCabTIPO_LONA: TFIBStringField;
     QMDespieceCabTITULO: TStringField;
     QMDespieceCabARTICULO: TFIBStringField;
     QMDespieceTarSECCION: TFIBStringField;
     QMDespieceCabFECHA: TDateTimeField;
     QMDespieceCabUSUARIO: TIntegerField;
     QMDespieceCabENTRADA_AGRUPACION: TIntegerField;
     QMDespieceCabMEDIDA_3: TFloatField;
     QMDespieceCabMEDIDA_4: TFloatField;
     QMDespieceCabSU_REFERENCIA: TFIBStringField;
     QMDespieceCabMANIVELA: TFIBStringField;
     QMDespieceComTITULO: TFIBStringField;
     QMDespieceCabP_MARGEN_MAT: TFloatField;
     QMDespieceCabP_MARGEN_TAR: TFloatField;
     QMDespieceComTOTAL_FABRICACION: TFloatField;
     QMDespieceComCANTIDAD_FABRICACION: TFloatField;
     QMDespieceTarTOTAL_FABRICACION: TFloatField;
     QMDespieceTarTIEMPO_FABRICACION: TFloatField;
     QMDespieceComASIGNAR_A_ORDEN: TIntegerField;
     QMDespieceComFACTOR: TFloatField;
     QMDespieceCabID_IMAGEN: TIntegerField;
     QMDespieceCabTOTAL_PESO: TFloatField;
     QMDespieceCabTOTAL_HORAS: TFloatField;
     QMDespieceComNO_MULTIPLICAR_CABECERA: TIntegerField;
     QMDespieceCabPRECIO_UNITARIO: TFloatField;
     QMDespieceCabP_MARGEN_P_COSTE: TFloatField;
     QMDespieceCabTITULO_LONA_LAMA: TFIBStringField;
     QMDespieceCabCANTIDAD_DESPIECE: TFloatField;
     QMDespieceCabLONA_ATRAVESADA: TIntegerField;
     QMDespieceCabTITULO_MODELO: TFIBStringField;
     QMDespieceCabINC_CORTE_LONA: TFloatField;
     QMDespieceCabDESCUENTO: TFloatField;
     QMDespieceCabCLIENTE: TIntegerField;
     QMDespieceCabTARIFA_TYC: TFIBStringField;
     QMDespieceCabLINEA_PALILLOS_CON_TAPAS: TFloatField;
     QMDespieceCabPORTERIA_CON_JUEGO_CODOS: TIntegerField;
     QMDespieceCabLADO_INCLINACION: TFIBStringField;
     QMDespieceCabTIPO_MOTORIZACION: TFIBStringField;
     QMDespieceCabTERCERA_GUIA: TIntegerField;
     QMDespieceCabSEGUNDO_TIRO_CUERDA: TIntegerField;
     QMDespieceCabTIPO_RULINAS: TFIBStringField;
     QMDespieceCabCORTINA_PARTIDA: TIntegerField;
     QMDespieceCabBAMBALINA_ADICIONAL: TIntegerField;
     QMDespieceCabVENTANA: TIntegerField;
     QMDespieceCabTIPO_CRISTAL_VENTANA: TFIBStringField;
     QMDespieceCabTIPO_CONFECCION_LONA: TFIBStringField;
     QMDespieceCabUBICACION_ETIQUETA: TFIBStringField;
     QMDespieceCabTIPO_GAJO_EXTENDIDO: TFIBStringField;
     QMDespieceCabREGULACION_COFRE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDespieceCabBeforePost(DataSet: TDataSet);
     procedure QMDespieceComBeforePost(DataSet: TDataSet);
     procedure QMDespieceTarBeforePost(DataSet: TDataSet);
     procedure QMDespieceCabNewRecord(DataSet: TDataSet);
     procedure QMDespieceCabAfterOpen(DataSet: TDataSet);
     procedure QMDespieceComNewRecord(DataSet: TDataSet);
     procedure QMDespieceComFASEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDespieceComTIPO_FASEChange(Sender: TField);
     procedure QMDespieceComDescFormulaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDespieceTarDescFormulaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDespieceTarDescTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDespieceTarDescRecursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDespieceTarNewRecord(DataSet: TDataSet);
     procedure QMDespieceCabBeforeClose(DataSet: TDataSet);
     procedure AntesDeEditar(DataSet: TDataSet);
     procedure QMDespieceTarTIPO_FASEChange(Sender: TField);
     procedure QMDespieceCabAfterPost(DataSet: TDataSet);
     procedure QMDespieceCabCalcFields(DataSet: TDataSet);
     procedure QMDespieceCabMODELOChange(Sender: TField);
     procedure QMDespieceCabMEDIDA_1Change(Sender: TField);
     procedure QMDespieceCabMEDIDA_2Change(Sender: TField);
     procedure QMDespieceCabARTICULO_SEGUN_MEDIDASChange(Sender: TField);
     procedure QMDespieceCabTITULOChange(Sender: TField);
     procedure QMDespieceCabCANTIDADChange(Sender: TField);
     procedure QMDespieceCabTIPO_LONAChange(Sender: TField);
     procedure QMDespieceComCOMPONENTEChange(Sender: TField);
     procedure QMDespieceComAfterPost(DataSet: TDataSet);
     procedure QMDespieceTarAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     UtilizaToldosYCortinas: boolean;
     procedure CalculaPrecio;
     procedure ActualizaArticuloSegunMedidas;
  public
     { Public declarations }
     xDetalle: TDataSet;
     procedure CrearDespieceSP;
     procedure CalculoFormulaDesp;
     procedure InsertarProcedencia(Tipo: string; IdDetalle, IdS: integer; DataSet: TFIBTableSet);
     procedure FiltraDespiece(IdDespiece: integer; DataSet: TFIBTableSet);
     procedure PosicionarDespiece(IdDespiece: integer);
     function ComprobarTipoModelo(modelo: string): string;
     procedure CierraDespiece;
     procedure CrearDespieceOP; // sfg.albert
     procedure BusquedaCompleja; //sfg.albert
     procedure RefrescaDatos;
     function Duplicar: integer;
     procedure EliminaLineasVacias;
     function DameTituloLonaInclinacion(Codigo: string): string;
     function DameTituloTipoMotorizacion(Codigo: string): string;
     function DameTituloTipoRulinas(Codigo: string): string;
     function DameTituloTipoGajoExtendido(Codigo: string): string;
     function DameTituloTipoCristalVentana(Codigo: string): string;
     function DameTituloTipoConfeccionLona(Codigo: string): string;
     function DameTituloUbicacionEtiqueta(Codigo: string): string;
     function DameTituloRegulacionCofre(Codigo: string): string;
  end;

var
  DMDespiece : TDMDespiece;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UFormGest, UFBusca, UFMDespiece,
  UDMOfertas, UDMPedidos, UParam;

{$R *.dfm}

{ TDMDespiece }

procedure TDMDespiece.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  xDetalle := nil;
  UtilizaToldosYCortinas := (LeeParametro('MODREST015') = 'S');

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Mascaras
  AsignaDisplayFormat(QMDespieceCab, MascaraN, MascaraI, ShortDateFormat);
  QMDespieceCabP_MARGEN_MAT.DisplayFormat := MascaraP;
  QMDespieceCabP_MARGEN_TAR.DisplayFormat := MascaraP;
  QMDespieceCabP_MARGEN_P_COSTE.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMDespieceCom, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDespieceTar, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDespieceSFGDatos, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMDespieceCab, '101000');
end;

procedure TDMDespiece.RefrescaDatos;
var
  marcaCom, marcaTar : TBookmark;
begin
  marcaCom := QMDespieceCom.GetBookmark;
  marcaTar := QMDespieceTar.GetBookmark;
  try
     QMDespieceCab.Refresh;
     QMDespieceCom.GotoBookmark(marcaCom);
     QMDespieceTar.GotoBookmark(marcaTar);
  finally
     QMDespieceCom.FreeBookmark(marcaCom);
     QMDespieceTar.FreeBookmark(marcaTar);
  end;
end;

procedure TDMDespiece.QMDespieceCabBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMDespieceCabID_DESPIECE_CAB.AsInteger := DMMain.ContadorGen('PRO_ID_DESPIECE_CAB');
end;

procedure TDMDespiece.QMDespieceComBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMDespieceComID_DESPIECE_DET.AsInteger := DMMain.ContadorGen('PRO_ID_DESPIECE_DET');
end;

procedure TDMDespiece.QMDespieceTarBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMDespieceTarID_DESPIECE_TAREA.AsInteger := DMMain.ContadorGen('PRO_ID_DESPIECE_TAREA');
end;

procedure TDMDespiece.CrearDespieceSP;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_CREAR_DESPIECE(?ID_DESPIECE_CAB, ?EMPRESA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_DESPIECE_CAB'].AsInteger := QMDespieceCabID_DESPIECE_CAB.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMDespiece.QMDespieceCabNewRecord(DataSet: TDataSet);
var
  Margen : double;
begin
  QMDespieceCabENTRADA.AsInteger := REntorno.Entrada;
  QMDespieceCabCOLOR.AsString := 'BL';
  QMDespieceCabLONA_LAMA.AsString := '';
  QMDespieceCabESCANDALLO.AsInteger := 0;
  QMDespieceCabESTADO.AsInteger := 0;
  QMDespieceCabID_IMAGEN.AsInteger := 0;
  // Espero un texto con numeros separados con un punto decimal para los margenes por defecto.
  try
     Margen := StrToFloatDec(LeeParametro('DESMARG001'), '.');
  except
     Margen := 0;
  end;
  QMDespieceCabP_MARGEN_MAT.AsFloat := Margen;

  try
     Margen := StrToFloatDec(LeeParametro('DESMARG002'), '.');
  except
     Margen := 0;
  end;
  QMDespieceCabP_MARGEN_TAR.AsFloat := Margen;

  QMDespieceCabP_MARGEN_P_COSTE.AsFloat := 0;
  QMDespieceCabEMPRESA.AsInteger := REntorno.Empresa;
  QMDespieceCabEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDespieceCabCANAL.AsInteger := REntorno.Canal;
  QMDespieceCabSERIES.AsString := REntorno.Serie;
  QMDespieceCabID_ORDEN.AsInteger := 0;
  QMDespieceCabMOTOR.AsInteger := 0;
  QMDespieceCabCANTIDAD.AsInteger := 1;
  QMDespieceCabTIPO_MEDIDA.AsInteger := 0;
  QMDespieceCabTIPO_LONA.AsString := '';
  QMDespieceCabFECHA.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMDespiece.QMDespieceCabBeforeClose(DataSet: TDataSet);
begin
  QMDespieceCom.Close;
  QMDespieceTar.Close;
  QMDespieceSFGDatos.Close;
end;

procedure TDMDespiece.QMDespieceCabAfterOpen(DataSet: TDataSet);
begin
  QMDespieceCom.Open;
  QMDespieceTar.Open;
  QMDespieceSFGDatos.Open;
end;

procedure TDMDespiece.QMDespieceComNewRecord(DataSet: TDataSet);
begin
  if ((QMDespieceCab.State = dsInsert) or (QMDespieceCab.State = dsEdit)) then
  begin
     QMDespieceCab.Post;
     QMDespieceCom.Edit;
  end;

  QMDespieceComID_DESPIECE_CAB.AsInteger := QMDespieceCabID_DESPIECE_CAB.AsInteger;
  QMDespieceComFACTOR.AsFloat := 1;
  QMDespieceComNO_MULTIPLICAR_CABECERA.AsInteger := 0;
end;

procedure TDMDespiece.QMDespieceComFASEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloFase(QMDespieceComTIPO_FASE.AsString);
end;

procedure TDMDespiece.QMDespieceComTIPO_FASEChange(Sender: TField);
begin
  QMDespieceComFASE.AsString := DameTituloFase(QMDespieceComTIPO_FASE.AsString);
end;

procedure TDMDespiece.QMDespieceComDescFormulaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMDespieceComFORMULA.AsInteger <> 0) then
     Text := DameTituloFormula(QMDespieceComFORMULA.AsInteger)
  else
     Text := _('Sin Formula');
end;

procedure TDMDespiece.QMDespieceTarDescFormulaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMDespieceComFORMULA.AsInteger <> 0) then
     Text := DameTituloFormula(QMDespieceTarFORMULA.AsInteger)
  else
     Text := _('Sin Formula');
end;

procedure TDMDespiece.QMDespieceTarDescTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloTarea(QMDespieceTarTIPO_TAREA.AsString);
end;

procedure TDMDespiece.QMDespieceTarDescRecursoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloRecurso(QMDespieceTarRECURSO.AsString);
end;

procedure TDMDespiece.QMDespieceTarNewRecord(DataSet: TDataSet);
begin
  if ((QMDespieceCab.State = dsInsert) or (QMDespieceCab.State = dsEdit)) then
  begin
     QMDespieceCab.Post;
     QMDespieceCom.Edit;
  end;

  QMDespieceTarID_DESPIECE_CAB.AsInteger := QMDespieceCabID_DESPIECE_CAB.AsInteger;
  QMDespieceTarTIPO_FASE.AsString := QMDespieceComTIPO_FASE.AsString;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SECCION FROM OPE_SECCIONES WHERE EMPRESA = :EMPRESA AND SECCION = ''DES'' ';
        Params.ByName['EMPRESA'].AsInteger := QMDespieceCabEMPRESA.AsInteger;
        ExecQuery;
        QMDespieceTarSECCION.AsString := FieldByName['SECCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDespiece.CalculoFormulaDesp;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_DAME_CALCULO_FORMULA(?ID_CAB, 0, 3)';
        Params.ByName['ID_CAB'].AsInteger := QMDespieceCabID_DESPIECE_CAB.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMDespiece.InsertarProcedencia(Tipo: string; IdDetalle, IdS: integer; DataSet: TFIBTableSet);
var
  art_armazon, Articulo : string;
begin
  if ((Tipo = 'OFC') or (Tipo = 'PEC')) then
  begin
     xDetalle := DataSet;

     if (xDetalle.State in [dsEdit, dsInsert]) then
        xDetalle.Post;

     QMDespieceCab.Insert;

     QMDespieceCabID_ORIGEN.AsInteger := IdS;
     QMDespieceCabID_DETALLE.AsInteger := IdDetalle;
     QMDespieceCabTIPO_ORIGEN.AsString := Tipo;

     // Buscamos articulo, modelo, lineal y salida
     Articulo := '';
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;

           SQL.Text := 'SELECT A.ARTICULO, A.Z_TOL_ARMAZON FROM GES_DETALLES_S D JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A WHERE D.ID_DETALLES_S = :ID_DETALLES_S';
           Params.ByName['ID_DETALLES_S'].AsInteger := IdDetalle;
           ExecQuery;
           art_armazon := FieldByName['Z_TOL_ARMAZON'].AsString;
           Articulo := FieldByName['ARTICULO'].AsString;
           FreeHandle;
           Close;
        finally
           Free;
        end;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;

           Close;
           SQL.Text := 'SELECT Z_ARM_MODELO, Z_ARM_LINEA, Z_ARM_SALIDA FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARMAZON';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARMAZON'].AsString := art_armazon;
           ExecQuery;
           QMDespieceCabMODELO.AsString := FieldByName['Z_ARM_MODELO'].AsString;
           QMDespieceCabMEDIDA_1.AsFloat := FieldByName['Z_ARM_LINEA'].AsInteger;
           QMDespieceCabMEDIDA_2.AsFloat := FieldByName['Z_ARM_SALIDA'].AsInteger;
           FreeHandle;
           Close;
        finally
           Free;
        end;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;

           SQL.Text := 'SELECT ESCANDALLO FROM PRO_ESCANDALLO WHERE EMPRESA = :EMPRESA AND COMPUESTO = :COMPUESTO AND DEFECTO = 1 AND ESTADO = 1';

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;

           // Si utiliza toldos y cortinas usamos art_armazon
           if UtilizaToldosYCortinas then
              Params.ByName['COMPUESTO'].AsString := art_armazon
           else
              Params.ByName['COMPUESTO'].AsString := Articulo;

           ExecQuery;
           QMDespieceCabESCANDALLO.AsInteger := FieldByName['ESCANDALLO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMDespieceCabARTICULO.AsString := Articulo;

     // Toldos y Cortinas generara la descripcion del articulo y unidades
     if (not UtilizaToldosYCortinas) then
     begin
        QMDespieceCabTITULO.AsString := xDetalle.FieldByName('TITULO').AsString;
        QMDespieceCabCANTIDAD.AsFloat := xDetalle.FieldByName('UNIDADES').AsFloat;
     end;
  end;
end;

procedure TDMDespiece.FiltraDespiece(IdDespiece: integer; DataSet: TFIBTableSet);
begin
  xDetalle := DataSet;
  with QMDespieceCab do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM PRO_DESPIECE_CAB ');
     if (IdDespiece <> 0) then
        SelectSQL.Add(' WHERE ID_DESPIECE_CAB = :ID_DESPIECE_CAB ');
     SelectSQL.Add(' ORDER BY ID_DESPIECE_CAB ');

     if (IdDespiece <> 0) then
        Params.ByName['ID_DESPIECE_CAB'].AsInteger := IdDespiece;
     Open;
  end;
end;

function TDMDespiece.ComprobarTipoModelo(Modelo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO_MODELO FROM Z_SYS_MODELOS WHERE CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Modelo;
        ExecQuery;
        Result := FieldByName['TIPO_MODELO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDespiece.CierraDespiece;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_CIERRA_ABRE_DESPIECE(:ID_DESPIECE_CAB, :CIERRA, :ENTRADA)';

        Params.ByName['ID_DESPIECE_CAB'].AsInteger := QMDespieceCabID_DESPIECE_CAB.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;

        if (QMDespieceCabESTADO.AsInteger = 0) then
           Params.ByName['CIERRA'].AsInteger := 1 // Cerrar despiece
        else
        if (QMDespieceCabESTADO.AsInteger = 5) then
           Params.ByName['CIERRA'].AsInteger := 0; // Abrir despiece

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMDespiece.AntesDeEditar(DataSet: TDataSet);
begin
  if ((QMDespieceCabESTADO.AsInteger = 5)) then
  begin
     raise Exception.Create(_('Documento Bloqueado'));
     DataSet.Cancel;
  end;
end;

procedure TDMDespiece.CrearDespieceOP;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_DESPIECE_CREAR_OP(:ID_DESPIECE, :ENTRADA)';
        Params.ByName['ID_DESPIECE'].AsInteger := QMDespieceCabID_DESPIECE_CAB.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDespiece.QMDespieceTarTIPO_FASEChange(Sender: TField);
begin
  QMDespieceTarFASE.AsString := DameTituloFase(QMDespieceTarTIPO_FASE.AsString);
end;

procedure TDMDespiece.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMDespieceCab, '00000', True);
  // Hay que filtrar SERIES a mano, porque el campo no lleva el nombre correcto (SERIE)
  // QMDespieceCab.Params.ByName['SERIES'].AsString := REntorno.Serie;
  // QMDespieceCab.Open;
end;

procedure TDMDespiece.QMDespieceCabAfterPost(DataSet: TDataSet);
begin
  if (QMDespieceCabID_DETALLE.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE GES_DETALLES_S SET ID_DESPIECE = :ID_DESPIECE WHERE ID_DETALLES_S = :ID_DETALLES_S AND ID_DESPIECE <> :ID_DESPIECE';
           Params.ByName['ID_DESPIECE'].AsInteger := QMDespieceCabID_DESPIECE_CAB.AsInteger;
           Params.ByName['ID_DETALLES_S'].AsInteger := QMDespieceCabID_DETALLE.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  RefrescaDatos;
end;

procedure TDMDespiece.QMDespieceCabCalcFields(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (QMDespieceCabID_DETALLE.AsInteger = 0) then
        begin
           SQL.Text := 'SELECT TIPO||'' ''||EJERCICIO||''-''||SERIE||''/''||RIG AS DOCUMENTO FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := QMDespieceCabID_ORIGEN.AsInteger;
        end
        else
        begin
           SQL.Text := 'SELECT TIPO||'' ''||EJERCICIO||''-''||SERIE||''/''||RIG||''.''||LINEA AS DOCUMENTO FROM GES_DETALLES_S WHERE ID_DETALLES_S = :ID_DETALLES_S';
           Params.ByName['ID_DETALLES_S'].AsInteger := QMDespieceCabID_DETALLE.AsInteger;
        end;
        ExecQuery;
        QMDespieceCabDOC_ORIGEN.AsString := FieldByName['DOCUMENTO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDespieceCabTITULO_ESTADO.AsString := DameTituloEstado(QMDespieceCabESTADO.AsInteger);
  QMDespieceCabDESC_ESCANDALLO.AsString := DameTituloEscandalloProduccion(QMDespieceCabESCANDALLO.AsInteger);
  QMDespieceCabPRECIO_UNITARIO.AsFloat := QMDespieceCabTOTAL_VENTA.AsFloat / QMDespieceCabCANTIDAD.AsFloat;
  ActualizaArticuloSegunMedidas;

  if (QMDespieceCabTITULO.AsString = '') then
     QMDespieceCabTITULO.AsString := DameTituloArticulo(QMDespieceCabARTICULO.AsString);

  // Agrego descripcion de color, si es Toldos y cortinas
  if (UtilizaToldosYCortinas) then
  begin
     // Se calcula titulo de articulo segun medidas
     QMDespieceCabTITULO.AsString := DameTituloArticulo(QMDespieceCabARTICULO.AsString);

     if (Trim(QMDespieceCabCOLOR.AsString) > '') then
        QMDespieceCabTITULO.AsString := Copy(QMDespieceCabTITULO.AsString + ' ' + DMMain.DameDescripcionColor(QMDespieceCabCOLOR.AsString), 1, 60);

     // Agrego descripcion de tipo lona, si es Toldos y cortinas
     if (Trim(QMDespieceCabTIPO_LONA.AsString) > '') then
        QMDespieceCabTITULO.AsString := Copy(QMDespieceCabTITULO.AsString + ' REF. ' + DameTituloTipoLona(QMDespieceCabTIPO_LONA.AsString), 1, 60);

     // Agrego medidas, si es Toldos y cortinas
     QMDespieceCabTITULO.AsString := Copy(QMDespieceCabTITULO.AsString + ' ' + IntToStr(QMDespieceCabMEDIDA_1.AsInteger) + 'x' + IntToStr(QMDespieceCabMEDIDA_2.AsInteger), 1, 60);
  end;
end;

procedure TDMDespiece.QMDespieceCabMODELOChange(Sender: TField);
begin
  ActualizaArticuloSegunMedidas;
  CalculaPrecio;
end;

procedure TDMDespiece.QMDespieceCabMEDIDA_1Change(Sender: TField);
begin
  ActualizaArticuloSegunMedidas;
  CalculaPrecio;
end;

procedure TDMDespiece.QMDespieceCabMEDIDA_2Change(Sender: TField);
begin
  ActualizaArticuloSegunMedidas;
  CalculaPrecio;
end;

procedure TDMDespiece.QMDespieceCabARTICULO_SEGUN_MEDIDASChange(Sender: TField);
begin
  QMDespieceCabTITULO.AsString := DameTituloArticulo(QMDespieceCabARTICULO.AsString);

  if Assigned(xDetalle) and UtilizaToldosYCortinas then
  begin
     with xDetalle do
     begin
        if (State = dsBrowse) then
           Edit;
        FieldByName('ARTICULO').AsString := QMDespieceCabARTICULO.AsString;
        FieldByName('TITULO').AsString := QMDespieceCabTITULO.AsString;
     end;
  end;
end;

procedure TDMDespiece.QMDespieceCabTITULOChange(Sender: TField);
begin
  if Assigned(xDetalle) and UtilizaToldosYCortinas then
  begin
     with xDetalle do
     begin
        if (State = dsBrowse) then
           Edit;
        FieldByName('TITULO').AsString := QMDespieceCabTITULO.AsString;
     end;
  end;
end;

procedure TDMDespiece.ActualizaArticuloSegunMedidas;
var
  Articulo : string;
begin
  Articulo := DMMain.DameArticuloSegunMedidas(QMDespieceCabMODELO.AsString, QMDespieceCabTIPO_LONA.AsString, Trunc(QMDespieceCabMEDIDA_1.AsFloat), Trunc(QMDespieceCabMEDIDA_2.AsFloat));
  if (Articulo > '') then
     QMDespieceCabARTICULO.AsString := Articulo;
end;

procedure TDMDespiece.QMDespieceCabCANTIDADChange(Sender: TField);
begin
  if Assigned(xDetalle) and UtilizaToldosYCortinas then
  begin
     with xDetalle do
     begin
        if (State = dsBrowse) then
           Edit;
        FieldByName('UNIDADES').AsFloat := QMDespieceCabCANTIDAD.AsFloat;
     end;
  end;
end;

procedure TDMDespiece.QMDespieceCabTIPO_LONAChange(Sender: TField);
begin
  CalculaPrecio;
end;

procedure TDMDespiece.CalculaPrecio;
var
  Tarifa : string;
  PrecioVenta : double;
begin
  // Obtengo datos del documento origen para calculos posteriores
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TARIFA FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := QMDespieceCabID_ORIGEN.AsInteger;
        ExecQuery;
        Tarifa := FieldByName['TARIFA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT P_VENTA FROM Z_MODELOS_PRECIOS_DET ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' MODELO = :MODELO AND ');
        SQL.Add(' TIPO_LONA = :TIPO_LONA AND ');
        SQL.Add(' TARIFA = :TARIFA AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' COLOR = :COLOR ');
        Params.ByName['EMPRESA'].AsInteger := QMDespieceCabEMPRESA.AsInteger;
        Params.ByName['MODELO'].AsString := QMDespieceCabMODELO.AsString;
        Params.ByName['TIPO_LONA'].AsString := QMDespieceCabTIPO_LONA.AsString;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['ARTICULO'].AsString := QMDespieceCabARTICULO.AsString;
        Params.ByName['COLOR'].AsInteger := 0;
        ExecQuery;
        PrecioVenta := FieldByName['P_VENTA'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Pongo los precios establecidos en el despiece
  if Assigned(xDetalle) and UtilizaToldosYCortinas then
  begin
     with xDetalle do
     begin
        if (State = dsBrowse) then
           Edit;
        FieldByName('PRECIO').AsFloat := PrecioVenta;
        FieldByName('DESCUENTO').AsFloat := 0;
        FieldByName('DESCUENTO_2').AsFloat := 0;
        FieldByName('DESCUENTO_3').AsFloat := 0;
     end;
  end;
end;

procedure TDMDespiece.QMDespieceComCOMPONENTEChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FORMULA_DEFECTO, UNIDADES, TITULO_LARGO FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := QMDespieceCabEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMDespieceComCOMPONENTE.AsString;
        ExecQuery;
        QMDespieceComFORMULA.AsInteger := FieldByName['FORMULA_DEFECTO'].AsInteger;
        QMDespieceComUNIDADES_ART.AsString := FieldByName['UNIDADES'].AsString;
        QMDespieceComTITULO.AsString := FieldByName['TITULO_LARGO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDespiece.QMDespieceComAfterPost(DataSet: TDataSet);
begin
  // CalculoFormulaDesp mantiene la posicion despues de refrescar.
  CalculoFormulaDesp;
end;

procedure TDMDespiece.QMDespieceTarAfterPost(DataSet: TDataSet);
begin
  // CalculoFormulaDesp mantiene la posicion despues de refrescar.
  CalculoFormulaDesp;
end;

function TDMDespiece.Duplicar: integer;
begin
  /// Duplica el despiece y devuelve el nuevo ID.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_DUPLICAR_DESPIECE(:ID_DESPIECE, :ID_S, :TIPO, :ID_DETALLES_S, :ENTRADA)';
        Params.ByName['ID_DESPIECE'].AsInteger := QMDespieceCabID_DESPIECE_CAB.AsInteger;
        Params.ByName['ID_S'].AsInteger := 0;
        Params.ByName['TIPO'].AsString := '';
        Params.ByName['ID_DETALLES_S'].AsInteger := 0;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := FieldByName['ID_DESPIECE_DESTINO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDespiece.PosicionarDespiece(IdDespiece: integer);
begin
  Posicionar(QMDespieceCab, 'ID_DESPIECE_CAB', IdDespiece);
end;

procedure TDMDespiece.EliminaLineasVacias;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM PRO_DESPIECE_DET_COMPONENTE WHERE ID_DESPIECE_CAB = :ID_DESPIECE_CAB AND ABS(CANTIDAD) <= 0.001';
        Params.ByName['ID_DESPIECE_CAB'].AsInteger := QMDespieceCabID_DESPIECE_CAB.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM PRO_DESPIECE_DET_TAREA WHERE ID_DESPIECE_CAB = :ID_DESPIECE_CAB AND ABS(TIEMPO) <= 0.001';
        Params.ByName['ID_DESPIECE_CAB'].AsInteger := QMDespieceCabID_DESPIECE_CAB.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

function TDMDespiece.DameTituloLonaInclinacion(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''LIC'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMDespiece.DameTituloTipoMotorizacion(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''TMO'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMDespiece.DameTituloTipoRulinas(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''TRU'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMDespiece.DameTituloTipoGajoExtendido(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''GAJ'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMDespiece.DameTituloTipoCristalVentana(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''CRI'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMDespiece.DameTituloTipoConfeccionLona(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''LCS'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMDespiece.DameTituloUbicacionEtiqueta(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''UBE'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMDespiece.DameTituloRegulacionCofre(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''RGC'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
