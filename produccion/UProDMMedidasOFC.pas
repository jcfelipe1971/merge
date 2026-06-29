unit UProDMMedidasOFC;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, DB, FIBDataSetRO, FIBQuery, HYFIBQuery,
  Windows, Messages, Variants, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, UFormGest, ExtCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Menus, rxPlacemnt, {IdGlobal,}
  UFPEdit, ULFDBEdit, ULFToolBar, DateUtils, FIBDataSetRW;

type
  TProDMMedidasOFC = class(TDataModule)
     TLocal: THYTransaction;
     QMMedidas: TFIBTableSet;
     DSMedidas: TDataSource;
     QMMedidasID_MEDIDA: TIntegerField;
     QMMedidasTIPO: TFIBStringField;
     QMMedidasMEDIDA_1: TFloatField;
     QMMedidasMEDIDA_2: TFloatField;
     QMMedidasMEDIDA_3: TFloatField;
     QMMedidasMEDIDA_4: TFloatField;
     QMMedidasARTICULO: TFIBStringField;
     QMMedidasDescArticulo: TStringField;
     QMMedidasID_ESCANDALLO: TIntegerField;
     DSDetMedidas: TDataSource;
     QMDetMedidas: TFIBTableSet;
     QMDetMedidasEMPRESA: TIntegerField;
     QMDetMedidasESCANDALLO: TIntegerField;
     QMDetMedidasLINEA_FASE: TIntegerField;
     QMDetMedidasLINEA_TAREA: TIntegerField;
     QMDetMedidasTAREA: TFIBStringField;
     QMDetMedidasORDEN: TIntegerField;
     QMDetMedidasTIPOTAREA: TFIBStringField;
     QMDetMedidasCOMENTARIO: TMemoField;
     QMDetMedidasRECURSO: TFIBStringField;
     QMDetMedidasCANTIDAD: TFloatField;
     QMDetMedidasPRE_COS_UNI: TFloatField;
     QMDetMedidasTOTAL_VAR: TFloatField;
     QMDetMedidasPRECIO_FIJO: TFloatField;
     QMDetMedidasTOTAL: TFloatField;
     QMDetMedidasENTRADA: TIntegerField;
     QMDetMedidasACTUALIZA_REC: TIntegerField;
     QMDetMedidasID_UTILLAJES: TFIBStringField;
     QMDetMedidasDESC_UTILLAJE: TFIBStringField;
     QMDetMedidasTIPO: TFIBStringField;
     QMDetMedidasID_ESC: TIntegerField;
     QMDetMedidasTIEMPO: TFloatField;
     QMDetMedidasOPERACIONES_NUM: TIntegerField;
     QMDetMedidasOPERACIONES_TIEMPO: TIntegerField;
     QMDetMedidasTraspasar: TSmallintField;
     QMMedidasNOTAS: TMemoField;
     QMMedidasTRASPASAR_NOTAS_PEDIDO: TIntegerField;
     QBuscarMarcats: TFIBDataSetRO;
     QBuscarMarcatsTAREA: TFIBStringField;
     DSEscandallo: TDataSource;
     QEscandallo: TFIBTableSet;
     QEscandalloEMPRESA: TIntegerField;
     QEscandalloESCANDALLO: TIntegerField;
     QEscandalloCOMPUESTO: TFIBStringField;
     QEscandalloUNIDAD: TFIBStringField;
     QEscandalloUNIDADES: TFloatField;
     QEscandalloMEDIDA_1: TFloatField;
     QEscandalloMEDIDA_2: TFloatField;
     QEscandalloMEDIDA_3: TFloatField;
     QEscandalloCOSTE_FIJO: TFloatField;
     QEscandalloCOSTE_MATER: TFloatField;
     QEscandalloCOSTE_MOBRA: TFloatField;
     QEscandalloCOSTE_MAQUI: TFloatField;
     QEscandalloCOSTE_TEXTE: TFloatField;
     QEscandalloCOSTE_VAR: TFloatField;
     QEscandalloCOSTE_TOTAL: TFloatField;
     QEscandalloFECHA_CREAC: TDateTimeField;
     QEscandalloESTADO: TIntegerField;
     QEscandalloNOTAS: TMemoField;
     QEscandalloDIBUJO: TMemoField;
     QEscandalloACTUALIZA_REC: TIntegerField;
     QEscandalloACTUALIZA_MAT: TIntegerField;
     QEscandalloDEFECTO: TIntegerField;
     QEscandalloALMACEN_ENT: TFIBStringField;
     QEscandalloALMACEN_LAN: TFIBStringField;
     QEscandalloENTRADA: TIntegerField;
     QEscandalloAUTO_CALC: TIntegerField;
     QEscandalloTIPO_PRECIO: TIntegerField;
     QEscandalloAUTO_ENTRADA: TIntegerField;
     QEscandalloGENERA_OF: TIntegerField;
     QEscandalloISO_APROBADO: TIntegerField;
     QEscandalloISO_VERIFICADO: TIntegerField;
     QEscandalloISO_VALIDADO: TIntegerField;
     QEscandalloALMACEN_SAL: TFIBStringField;
     QEscandalloTIPO: TFIBStringField;
     QEscandalloID_ESC: TIntegerField;
     QEscandalloID_DETALLES_OFERTAS_V: TIntegerField;
     QEscandalloMEDIDA_4: TFloatField;
     QEscandalloDESCRIPCION: TFIBStringField;
     QEscandalloMARGEN_MAQUI: TFloatField;
     QEscandalloMARGEN_MATER: TFloatField;
     QEscandalloMARGEN_OPE: TFloatField;
     QEscandalloMARGEN_VAR: TFloatField;
     QEscandalloMARGEN_TRAB: TFloatField;
     QEscandalloCLIENTE: TIntegerField;
     QEscandalloUSA_P_OPTIMO: TIntegerField;
     QEscandalloTIPO_CONTROL: TIntegerField;
     QEscandalloUNIDADES_PORCENT: TFloatField;
     QEscandalloID_DETALLES_PEDIDOS_V: TIntegerField;
     QEscandalloRESPONSABLE: TIntegerField;
     QMDetMedidasFORMULA: TIntegerField;
     QMDetMedidasID_TAREA: TIntegerField;
     QMDetMedidasRESULTADO_FORMULA: TFloatField;
     QMDetMedidasUNIDADES: TFloatField;
     QMDetMedidasTIEMPO_UNITARIO: TFloatField;
     QMMedidasID_ESC_GENERADO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMMedidasARTICULOChange(Sender: TField);
     procedure QMMedidasDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMMedidasNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMMedidasBeforePost(DataSet: TDataSet);
     procedure QMMedidasAfterOpen(DataSet: TDataSet);
     procedure QMDetMedidasAfterEdit(DataSet: TDataSet);
     procedure QMDetMedidasCalcFields(DataSet: TDataSet);
     procedure QMDetMedidasTraspasarChange(Sender: TField);
     procedure QMDetMedidasUNIDADESChange(Sender: TField);
     procedure QMDetMedidasTAREAGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     gest_ofe_trabajar_esc_ofe: integer; //sfg.albert
     procedure ComprobarEscPedido;
     procedure InsertarTemporal;
     procedure ActualizaNotas;
     procedure GenerarEscandallo; //sfg.albert
     procedure TraspasarNotasPedido(id_detalles_s: integer; Notas: string);
     procedure TraspasarNotasMedidas(Notas: string);
     function ExisteEscandallo: boolean;
  end;

var
  ProDMMedidasOFC : TProDMMedidasOFC;

implementation

uses UDMMain, UEntorno, UDMOfertas, UUtiles, UDameDato, UFMain, UProFMEscandallo;

{$R *.dfm}

procedure TProDMMedidasOFC.DataModuleCreate(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Mascaras
  QMDetMedidasCANTIDAD.DisplayFormat := MascaraL;
  QMDetMedidasUNIDADES.DisplayFormat := MascaraN;
  QMDetMedidasTIEMPO_UNITARIO.DisplayFormat := MascaraN;

  gest_ofe_trabajar_esc_ofe := DMMain.DameConstanteProduccion('GEST_OFE_TRABAJAR_ESC_OFE');

  // Es filtra la capçalera
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Add('select id_medida from ges_detalles_s_ofc ');
     SQL.Add('where id_detalles_s = ?id_detalles_s ');
     Params.ByName['id_detalles_s'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
     ExecQuery;
     QMMedidas.Params.ByName['id_medida'].AsInteger := Fields[0].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  QMMedidas.Open;

  if (QMMedidas.Params.ByName['id_medida'].AsInteger <> 0) then
     ComprobarEscPedido;

  QEscandallo.Close;
  QEscandallo.Params.ByName['id_escandallo'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
  QEscandallo.Open;
end;

procedure TProDMMedidasOFC.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMMedidasOFC.QMMedidasARTICULOChange(Sender: TField);
begin
  QMMedidasDescArticulo.AsString := DameTituloArticulo(QMMedidasARTICULO.AsString);
end;

procedure TProDMMedidasOFC.QMMedidasDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMMedidasARTICULO.AsString);
end;

procedure TProDMMedidasOFC.QMMedidasNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMMedidasTIPO.AsString := DMOfertas.QMCabeceraTIPO.AsString;
  QMMedidasARTICULO.AsString := DMOfertas.QMDetalleARTICULO.AsString;

  //S'assigna l'escandall assignat a la comanda a las medidas, si en té
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select id_esc,id_oferta_esc from ges_detalles_s_ofc';
     SQL.Add('where id_detalles_s=?id_detalles_s');
     Params.ByName['id_detalles_s'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
     ExecQuery;

     if (gest_ofe_trabajar_esc_ofe = 0) then //escandallo
        QMMedidasID_ESCANDALLO.AsInteger := Fields[0].AsInteger
     else if (gest_ofe_trabajar_esc_ofe = 1) then //oferta escandallo
        QMMedidasID_ESCANDALLO.AsInteger := Fields[1].AsInteger;

     FreeHandle;
  end;

  // S'agafen les medidas
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Add('select medida_1, medida_2, medida_3, medida_4 from pro_escandallo ');
     SQL.Add('where id_esc = ?id_esc ');
     Params.ByName['id_esc'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
     ExecQuery;
     QMMedidasMEDIDA_1.AsInteger := Fields[0].AsInteger;
     QMMedidasMEDIDA_2.AsInteger := Fields[1].AsInteger;
     QMMedidasMEDIDA_3.AsInteger := Fields[2].AsInteger;
     QMMedidasMEDIDA_4.AsInteger := Fields[3].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TProDMMedidasOFC.QMMedidasBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  // Generamos el contador de procesos automaticos
  DMMain.Contador_Gen(DataSet, 'PRO_MEDIDAS', 'ID_MEDIDA');

  if (DataSet.State = dsInsert) then
  begin
     //Assignar el ID de la medida al detall de la comanda
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update ges_detalles_s_ofc set id_medida=?id_medida ';
        SQL.Add('where id_detalles_s=?id_detalles_s');
        Params.ByName['id_medida'].AsInteger := QMMedidasID_MEDIDA.AsInteger;
        Params.ByName['id_detalles_s'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);

     QMDetMedidas.Close;
     QMDetMedidas.Params.ByName['id_escandallo'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
     QMDetMedidas.Open;
  end;

  //sfg.albert - Es mira si s'ha modificat 
end;

procedure TProDMMedidasOFC.QMMedidasAfterOpen(DataSet: TDataSet);
begin
  if (QMMedidasID_ESCANDALLO.AsInteger <> 0) then
  begin
     QMDetMedidas.Close;
     QMDetMedidas.Params.ByName['id_escandallo'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
     QMDetMedidas.Open;
  end;
end;

procedure TProDMMedidasOFC.ComprobarEscPedido;
var
  Q, E : THYFIBQuery;
begin
  //S'assigna l'escandall assignat a la comanda, si en té
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        if (gest_ofe_trabajar_esc_ofe = 0) then //escandall
           SQL.Add('select id_esc from ges_detalles_s_ofc ')
        else if (gest_ofe_trabajar_esc_ofe = 1) then //oferta escandall
           SQL.Add('select id_oferta_esc from ges_detalles_s_ofc ');

        SQL.Add('where id_detalles_s=?id_detalles_s ');
        Params.ByName['id_detalles_s'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        ExecQuery;
        // if (QMMedidasID_ESCANDALLO.AsInteger <> Fields[0].AsInteger) then
        if (QMMedidasID_ESCANDALLO.AsInteger = 0) then
        begin
           E := THYFIBQuery.Create(nil);
           try
              with E do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add('update pro_medidas set id_escandallo=?id_escandallo ');
                 SQL.Add('where id_medida=?id_medida');
                 Params.ByName['id_escandallo'].AsInteger := Q.Fields[0].AsInteger;
                 Params.ByName['id_medida'].AsInteger := QMMedidasID_MEDIDA.AsInteger;
                 ExecQuery;
                 FreeHandle;
                 Graba(QMMedidas);
                 //S'obra el detall
                 QMMedidasAfterOpen(QMDetMedidas);
              end;
           finally
              FreeAndNil(E);
           end;
        end;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMMedidasOFC.QMDetMedidasAfterEdit(DataSet: TDataSet);
begin
  //  if (QMDetMedidas.State = dsEdit) then
  //     QMDetMedidas.post;
end;

procedure TProDMMedidasOFC.InsertarTemporal;
var
  Q : THYFIBQuery;
begin
  // sfg.albert - S'elimina, si existeix, el registre que es vol modificar
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('delete from pro_tareas_medidas ');
        SQL.Add('where ');
        SQL.Add('id_detalles_ped = ?id_detalles and ');
        SQL.Add('id_esc_ped = ?id_esc and ');
        SQL.Add('linea_tarea_tar = ?linea_tarea ');
        Params.ByName['id_detalles'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        Params.ByName['id_esc'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
        Params.ByName['linea_tarea'].AsInteger := QMDetMedidasLINEA_TAREA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if (QMDetMedidasTraspasar.AsInteger <> 0) then
  begin
     //sfg.albert - S'inserta a la taula temporal
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('insert into pro_tareas_medidas ');
           SQL.Add('(id_detalles_ped, id_esc_ped,empresa_tar, escandallo_tar, linea_fase_tar, linea_tarea_tar, tarea, tipo_tar, traspasada, unidades, tiempo_unitario) ');
           SQL.Add('values ');
           SQL.Add('(?id_detalles_ped, ?id_esc_ped, ?empresa_tar, ?escandallo_tar, ?linea_fase_tar, ?linea_tarea_tar, ?tarea, ?tipo_tar, ?traspasada, ?unidades, ?tiempo_unitario)');
           Params.ByName['id_detalles_ped'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
           Params.ByName['id_esc_ped'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
           Params.ByName['empresa_tar'].AsInteger := QMDetMedidasEMPRESA.AsInteger;
           Params.ByName['escandallo_tar'].AsInteger := QMDetMedidasESCANDALLO.AsInteger;
           Params.ByName['linea_fase_tar'].AsInteger := QMDetMedidasLINEA_FASE.AsInteger;
           Params.ByName['linea_tarea_tar'].AsInteger := QMDetMedidasLINEA_TAREA.AsInteger;
           if (QMDetMedidasTAREA.AsString <> '') then
              Params.ByName['tarea'].AsString := QMDetMedidasTAREA.AsString
           else
              Params.ByName['tarea'].AsString := DameTituloTarea(QMDetMedidasTIPOTAREA.AsString);

           Params.ByName['tipo_tar'].AsString := QMDetMedidasTIPO.AsString;
           Params.ByName['traspasada'].AsInteger := 0;
           Params.ByName['unidades'].AsFloat := QMDetMedidasUNIDADES.AsFloat;
           Params.ByName['tiempo_unitario'].AsFloat := QMDetMedidasTIEMPO_UNITARIO.AsFloat;
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

procedure TProDMMedidasOFC.QMDetMedidasCalcFields(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  // Marco els checks de la taula temporal. Aquests registres sempre hi seran que la OF
  // no s'hagi llançat. Un cop llançada, es borraran les dades???.

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('select count(*) from pro_tareas_medidas ');
        SQL.Add('where ');
        SQL.Add('id_detalles_ped = ?id_detalles and ');
        SQL.Add('id_esc_ped = ?id_esc and ');
        SQL.Add('linea_tarea_tar = ?linea_tarea and ');
        SQL.Add('linea_fase_tar = ?linea_fase');
        Params.ByName['id_detalles'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        Params.ByName['id_esc'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
        Params.ByName['linea_tarea'].AsInteger := QMDetMedidasLINEA_TAREA.AsInteger;
        Params.ByName['linea_fase'].AsInteger := QMDetMedidasLINEA_FASE.AsInteger;
        ExecQuery;
        if (Fields[0].AsInteger <> 0) then
           QMDetMedidasTraspasar.AsInteger := 1
        else
           QMDetMedidasTraspasar.AsInteger := 0;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMMedidasOFC.QMDetMedidasTraspasarChange(Sender: TField);
begin
  InsertarTemporal;
end;

procedure TProDMMedidasOFC.ActualizaNotas;
begin
end;

procedure TProDMMedidasOFC.GenerarEscandallo;
var
  Q : THYFIBQuery;
  escandallo, escandallo_generado : integer;
  tipo : string;
begin
  if (QMDetMedidas.State = dsEdit) then
     QMDetMedidas.Post;

  if (gest_ofe_trabajar_esc_ofe = 0) then //escandallo
     tipo := 'EPR'
  else if (gest_ofe_trabajar_esc_ofe = 1) then //oferta escandallo
     tipo := 'OFE';

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select escandallo from pro_escandallo where id_esc=?id_escandallo';
        Params.ByName['id_escandallo'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
        ExecQuery;
        escandallo := Q.Fields[0].AsInteger;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'execute procedure pro_duplicar_escandallo(?empresa, ?tipo_ori, ?escandallo_ori, ?tipo_dest, ?compuesto_dest, ?id_detalles_ofertas_v, ?id_detalles_pedido_v, ?entrada)';
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Tipo_ori'].AsString := tipo;
        Params.ByName['Escandallo_ori'].AsInteger := escandallo;
        Params.ByName['Tipo_dest'].AsString := tipo;
        Params.ByName['Compuesto_dest'].AsString := QMMedidasARTICULO.AsString;
        Params.ByName['id_detalles_ofertas_v'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        Params.ByName['id_detalles_pedido_v'].AsInteger := 0;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        ExecQuery;
     end;
     escandallo_generado := Q.FieldByName['ID_ESCANDALLO'].AsInteger;
  finally
     FreeAndNil(Q);
  end;

  // Marco la linia com a traspasada
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update pro_tareas_medidas set traspasada = 1 where id_detalles_ped = ?id_detalles';
        Params.ByName['id_detalles'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        ExecQuery;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Asigno el escandallo generado al detalle de la oferta
  // SEGONS OFE O EPR EL ID_ESC_GENERADO HAURÀ DE SER UN ALTRE CAMP
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        // Escandallo produccion
        if (gest_ofe_trabajar_esc_ofe = 0) then
           SQL.Text := 'update ges_detalles_s_ofc set id_esc = :id_escandallo where id_detalles_s = ?id_detalles_s';
        // Escandallo oferta
        if (gest_ofe_trabajar_esc_ofe = 1) then
           SQL.Text := 'update ges_detalles_s_ofc set id_oferta_esc = :id_escandallo where id_detalles_s = ?id_detalles_s';

        Params.ByName['id_detalles_s'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        Params.ByName['id_escandallo'].AsInteger := escandallo_generado;
        ExecQuery;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update pro_medidas set id_esc_generado = ?id_esc_generado where id_medida = ?id_medida';
        Params.ByName['id_esc_generado'].AsInteger := escandallo_generado;
        Params.ByName['id_medida'].AsInteger := QMMedidasID_MEDIDA.AsInteger;
        ExecQuery;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMMedidas.Refresh;
  ShowMessage(Format(_('Se ha generado el escandallo núm.: %d'), [escandallo_generado]));

  {Abrimos el formulario y calculamos las formulas del escandallo de oferta}
  if (gest_ofe_trabajar_esc_ofe = 1) then
  begin
     FMain.EjecutaAccion(FMain.AProOfertasE, 'id_esc = ' + IntToStr(escandallo_generado));
     ProFMEscandallo.CalculaFormulas;
  end;
end;

procedure TProDMMedidasOFC.TraspasarNotasPedido(id_detalles_s: integer; Notas: string);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
  notas_original : string;
begin
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := TLocal;
        SelectSQL.Text := 'SELECT NOTAS FROM GES_DETALLES_S WHERE ID_DETALLES_S = ?ID_DETALLES_S';
        Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
        Open;
        notas_original := Fields[0].AsString;
     end;
  finally
     FreeAndNil(DS);
  end;

  { TODO -oAlbert : Esto puede ser RichText, por lo que debería asignarse a un TRichEdit y luego agregarle líneas }
  // if (notas_original <> '') then
  //    Notas := notas_original + Notas;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE VER_DETALLE_OFERTA_C SET NOTAS=?NOTAS, CRC_NOTAS=?CRC_NOTAS WHERE ID_DETALLES_S = ?ID_DETALLES_S';
        Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
        Params.ByName['NOTAS'].AsString := Notas;
        Params.ByName['CRC_NOTAS'].AsString := CalcCRC32Str(Notas);
        ExecQuery;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMMedidasOFC.TraspasarNotasMedidas(Notas: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE PRO_MEDIDAS SET NOTAS=?NOTAS WHERE ID_MEDIDA = ?ID_MEDIDA';
        Params.ByName['ID_MEDIDA'].AsInteger := QMMedidasID_MEDIDA.AsInteger;
        Params.ByName['NOTAS'].AsString := Notas;
        ExecQuery;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TProDMMedidasOFC.ExisteEscandallo: boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select id_esc from ges_detalles_s_ofc where id_detalles_s = ?id_detalles_s';
        Params.ByName['id_detalles_s'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        ExecQuery;
        Result := (Fields[0].AsInteger <> 0);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMMedidasOFC.QMDetMedidasUNIDADESChange(Sender: TField);
begin
  QMDetMedidasTraspasar.AsInteger := 0;
end;

procedure TProDMMedidasOFC.QMDetMedidasTAREAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloTarea(QMDetMedidasTIPOTAREA.AsString);
end;

end.
