unit UProDMMedidas;

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
  TProDMMedidas = class(TDataModule)
     TLocal: THYTransaction;
     QMMedidas: TFIBTableSet;
     DSMedidas: TDataSource;
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
     QMDetMedidasTRASPASAR: TSmallintField;
     QInsertarTemp: THYFIBQuery;
     QExisteixTemp: THYFIBQuery;
     QBorrarTemp: THYFIBQuery;
     QMMedidasNOTAS: TMemoField;
     QModificarTras: THYFIBQuery;
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
     QMMedidasALMACEN: TFIBStringField;
     QMMedidasUNIDADES_PED: TFloatField;
     QMMedidasUNIDADES_OP: TFloatField;
     QMMedidasUNIDADES_OPTIMO_ESC: TFloatField;
     QMMedidasdescalmacen: TStringField;
     xComponentes: TFIBDataSetRO;
     DSxComponentes: TDataSource;
     xComponentesEMPRESA: TIntegerField;
     xComponentesESCANDALLO: TIntegerField;
     xComponentesLINEA_COMP: TIntegerField;
     xComponentesALMACEN: TFIBStringField;
     xComponentesCOMPONENTE: TFIBStringField;
     xComponentesORDEN: TIntegerField;
     xComponentesUNIDADES: TFloatField;
     xComponentesPORCENTAJE: TFloatField;
     xComponentesLINEA_FASE: TIntegerField;
     xComponentesPRE_COS_UNI: TFloatField;
     xComponentesTOTAL_VAR: TFloatField;
     xComponentesPRECIO_FIJO: TFloatField;
     xComponentesTOTAL: TFloatField;
     xComponentesMATESC: TIntegerField;
     xComponentesENTRADA: TIntegerField;
     xComponentesACTUALIZA_MAT: TIntegerField;
     xComponentesTIPO_PRECIO: TIntegerField;
     xComponentesNOTAS: TMemoField;
     xComponentesMEDIDAS: TFIBStringField;
     xComponentesTIPO_PIEZA: TFIBStringField;
     xComponentesNUM_PIEZAS: TFIBStringField;
     xComponentesUNIDAD_ART: TFIBStringField;
     xComponentesUNIDAD_FAB: TFIBStringField;
     xComponentesTIPO: TFIBStringField;
     xComponentesID_ESC: TIntegerField;
     xComponentesID_EQUIVAL: TIntegerField;
     xComponentesDES_TIPO_PIEZA: TFIBStringField;
     xComponentesDES_CANTIDAD_TPIEZA: TFloatField;
     xComponentesDES_ALTO: TFloatField;
     xComponentesDES_ANCHO: TFloatField;
     xComponentesDES_GRUESO: TFloatField;
     xComponentesDES_METROS_DESCONTAR: TFloatField;
     xComponentesDES_TIPO_MATERIAL: TFIBStringField;
     xComponentesMINI_NOTA: TFIBStringField;
     xComponentesPORCENT_SN: TIntegerField;
     xComponentesDENSIDAD: TFloatField;
     xComponentesUNIDADES_DENSIDAD: TFloatField;
     xComponentesLINEA_TAREA: TIntegerField;
     xComponentesMERMA: TFloatField;
     xComponentesRESULTADO_FORMULA: TFloatField;
     xComponentesFORMULA: TIntegerField;
     xComponentesDESACTIVA_TRIGGER: TIntegerField;
     xBorrarMarcados: THYFIBQuery;
     xStockTotalLote: TFIBDataSetRO;
     DSxStockLote: TDataSource;
     xStockTotalLoteTOTAL_STOCK: TFloatField;
     QMMedidasLotes: TFIBTableSet;
     DSMedidasLotes: TDataSource;
     QMMedidasLotesID_PEDIDO: TIntegerField;
     QMMedidasLotesID_MEDIDA: TIntegerField;
     QMMedidasLotesID_LOTE: TIntegerField;
     QMMedidasLotesLOTE: TFIBStringField;
     QMMedidasLotesLINEA: TIntegerField;
     xArticulos: TFIBDataSetRO;
     QMMedidasLotesSTOCK: TFloatField;
     QMMedidasUNIDADES_STOCK: TFloatField;
     QMMedidasUNIDADES_ASIGNADAS_LOTE: TFloatField;
     QMMedidasUNIDADES_FABRICAR_LIBRE: TFloatField;
     QMMedidasID_MEDIDA: TIntegerField;
     QMDetMedidasFORMULA: TIntegerField;
     QMDetMedidasID_TAREA: TIntegerField;
     QMDetMedidasRESULTADO_FORMULA: TFloatField;
     QMDetMedidasUNIDADES: TFloatField;
     QMDetMedidasTIEMPO_UNITARIO: TFloatField;
     QMDetMedidasDescripTarea: TStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMMedidasARTICULOChange(Sender: TField);
     procedure QMMedidasDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMMedidasNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMMedidasBeforePost(DataSet: TDataSet);
     procedure QMMedidasAfterOpen(DataSet: TDataSet);
     procedure QMDetMedidasAfterEdit(DataSet: TDataSet);
     procedure QMDetMedidasCalcFields(DataSet: TDataSet);
     procedure QMDetMedidasTRASPASARChange(Sender: TField);
     procedure QMMedidasdescalmacenGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetMedidasAfterOpen(DataSet: TDataSet);
     procedure xStockLotesTraspasarChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xStockLotesAfterEdit(DataSet: TDataSet);
     procedure QMMedidasLotesNewRecord(DataSet: TDataSet);
     procedure QMMedidasLotesID_LOTEChange(Sender: TField);
     procedure QMMedidasLotesAfterInsert(DataSet: TDataSet);
     procedure QMDetMedidasDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetMedidasUNIDADESChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ComprobarEscPedido;
     procedure InsertarTemporal;
     procedure ActualizaNotas;
     function StockMarcado(entrada: integer): real; //sfg.albert
     procedure Infolotes; //sfg.albert
     procedure TraspasarNotasPedido(id_detalles_s: integer; Notas: string);
     procedure TraspasarNotasMedidas(Notas: string);
  end;

var
  ProDMMedidas : TProDMMedidas;

implementation

uses UDMMain, UEntorno, UDMPedidos, UFMIntroduceLotes, UUtiles, UDameDato;

{$R *.dfm}

procedure TProDMMedidas.DataModuleCreate(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  //sfg.albert - S'apliquen màscares

  QMMedidasUNIDADES_PED.DisplayFormat := MascaraN;
  QMMedidasUNIDADES_OP.DisplayFormat := MascaraN;
  QMMedidasUNIDADES_OPTIMO_ESC.DisplayFormat := MascaraN;
  QMMedidasUNIDADES_STOCK.DisplayFormat := MascaraN;
  QMMedidasLotesSTOCK.DisplayFormat := MascaraN;
  QMMedidasUNIDADES_ASIGNADAS_LOTE.DisplayFormat := MascaraN;
  QMMedidasUNIDADES_FABRICAR_LIBRE.DisplayFormat := MascaraN;
  QMDetMedidasCANTIDAD.DisplayFormat := MascaraL;
  QMDetMedidasUNIDADES.DisplayFormat := MascaraN;
  QMDetMedidasTIEMPO_UNITARIO.DisplayFormat := MascaraN;

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  //Es filtra la capçalera
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select id_medida from ges_detalles_s_ped ';
     SQL.Add('where id_detalles_s=?id_detalles_s');
     Params.ByName['id_detalles_s'].AsInteger := DmPedidos.QMDetalleID_DETALLES_S.AsInteger;
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

procedure TProDMMedidas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;

  QMMedidas.Refresh;
end;

procedure TProDMMedidas.QMMedidasARTICULOChange(Sender: TField);
begin
  QMMedidasDescArticulo.AsString := DameTituloArticulo(QMMedidasARTICULO.AsString);
end;

procedure TProDMMedidas.QMMedidasDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMMedidasARTICULO.AsString);
end;

procedure TProDMMedidas.QMMedidasNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMMedidasTIPO.AsString := DMPedidos.QMCabeceraTIPO.AsString;
  QMMedidasARTICULO.AsString := DMPedidos.QMDetalleARTICULO.AsString;
  QMMedidasALMACEN.AsString := DMPedidos.QMDetalleALMACEN.AsString;
  QMMedidasUNIDADES_PED.AsFloat := DMPedidos.QMDetalleUNIDADES.AsFloat;
  QMMedidasUNIDADES_STOCK.AsFloat := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, QMMedidasARTICULO.AsString, QMMedidasALMACEN.AsString);

  //S'assigna l'escandall assignat a la comanda, si en té
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select id_esc from ges_detalles_s_ped';
     SQL.Add('where id_detalles_s=?id_detalles_s');
     Params.ByName['id_detalles_s'].AsInteger := DmPedidos.QMDetalleID_DETALLES_S.AsInteger;
     ExecQuery;
     QMMedidasID_ESCANDALLO.AsInteger := Fields[0].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  //Es busca el lote óptimo de l'escandall
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select lote_optimo from pro_escandallo';
     SQL.Add('where empresa=?empresa and escandallo=?escandallo');
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['escandallo'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
     ExecQuery;
     QMMedidasUNIDADES_OPTIMO_ESC.AsFloat := Fields[0].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TProDMMedidas.QMMedidasBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  // Generamos el contador de procesos automaticos
  DMMain.Contador_Gen(DataSet, 'PRO_MEDIDAS', 'ID_MEDIDA');

  if (DataSet.State = dsInsert) then
  begin
     //Assignar el ID de la medida al detall de la comanda
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'update ges_detalles_s_ped set id_medida=?id_medida ';
           SQL.Add('where id_detalles_s=?id_detalles_s');
           Params.ByName['id_medida'].AsInteger := QMMedidasID_MEDIDA.AsInteger;
           Params.ByName['id_detalles_s'].AsInteger := DmPedidos.QMDetalleID_DETALLES_S.AsInteger;
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     QMDetMedidas.Close;
     QMDetMedidas.Params.ByName['id_escandallo'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
     QMDetMedidas.Open;
  end;
end;

procedure TProDMMedidas.QMMedidasAfterOpen(DataSet: TDataSet);
begin
  if (QMMedidasID_ESCANDALLO.AsInteger <> 0) then
  begin
     QMDetMedidas.Close;
     QMDetMedidas.Params.ByName['id_escandallo'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
     QMDetMedidas.Open;
  end;

  QMMedidasLotes.Close;
  QMMedidasLotes.Params.ByName['id_pedido'].AsInteger := DMPedidos.QMCabeceraID_S.AsInteger;
  QMMedidasLotes.Params.ByName['id_medida'].AsInteger := QMMedidasID_MEDIDA.AsInteger;
  QMMedidasLotes.Open;

  xArticulos.Close;
  xArticulos.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  xArticulos.Params.ByName['articulo'].AsString := QMMedidasARTICULO.AsString;
  xArticulos.Open;
end;

procedure TProDMMedidas.ComprobarEscPedido;
var
  Q, E : THYFIBQuery;
begin
  // S'assigna l'escandall assignat a la comanda, si en té
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select id_esc from ges_detalles_s_ped';
        SQL.Add('where id_detalles_s=?id_detalles_s');
        Params.ByName['id_detalles_s'].AsInteger := DmPedidos.QMDetalleID_DETALLES_S.AsInteger;
        ExecQuery;
        if (QMMedidasID_ESCANDALLO.AsInteger <> Fields[0].AsInteger) then
        begin
           E := THYFIBQuery.Create(nil);
           try
              with E do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'update pro_medidas set id_escandallo=?id_escandallo';
                 SQL.Add('where id_medida=?id_medida');
                 Params.ByName['id_escandallo'].AsInteger := Q.Fields[0].AsInteger;
                 Params.ByName['id_medida'].AsInteger := QMMedidasID_MEDIDA.AsInteger;
                 ExecQuery;
                 FreeHandle;
                 Graba(QMMedidas);

                 // S'obra el detall
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

procedure TProDMMedidas.QMDetMedidasAfterEdit(DataSet: TDataSet);
begin
  // if (QMDetMedidas.State = dsEdit) then
  //    QMDetMedidas.post;
end;

procedure TProDMMedidas.InsertarTemporal;
begin
  if (QMDetMedidasTRASPASAR.AsInteger = 0) then
  begin
     // sfg.albert - S'elimina, si existeix, el registre que es vol modificar
     with QBorrarTemp do
     begin
        Close;
        Params.ByName['id_detalles'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
        Params.ByName['id_esc'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
        Params.ByName['linea_tarea'].AsInteger := QMDetMedidasLINEA_TAREA.AsInteger;
        Prepare;
        ExecQuery;
     end;
  end
  else
  begin
     // sfg.albert - S'inserta a la taula temporal
     with QInsertarTemp do
     begin
        Close;
        Params.ByName['id_detalles_ped'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
        Params.ByName['id_esc_ped'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
        Params.ByName['empresa_tar'].AsInteger := QMDetMedidasEMPRESA.AsInteger;
        Params.ByName['escandallo_tar'].AsInteger := QMDetMedidasESCANDALLO.AsInteger;
        Params.ByName['linea_fase_tar'].AsInteger := QMDetMedidasLINEA_FASE.AsInteger;
        Params.ByName['linea_tarea_tar'].AsInteger := QMDetMedidasLINEA_TAREA.AsInteger;
        Params.ByName['tarea'].AsString := QMDetMedidasTAREA.AsString;
        Params.ByName['tipo_tar'].AsString := QMDetMedidasTIPO.AsString;
        Params.ByName['traspasada'].AsInteger := 0;
        Prepare;
        ExecQuery;
        FreeHandle;
     end;
  end;
end;

procedure TProDMMedidas.QMDetMedidasCalcFields(DataSet: TDataSet);
begin
  // Marco els checks de la taula temporal. Aquests registres sempre hi seran que la OF
  // no s'hagi llançat. Un cop llançada, es borraran les dades.

  with QExisteixTemp do
  begin
     Close;
     Params.ByName['id_detalles'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
     Params.ByName['id_esc'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
     Params.ByName['linea_tarea'].AsInteger := QMDetMedidasLINEA_TAREA.AsInteger;
     Prepare;
     ExecQuery;
  end;

  if (QExisteixTemp.Fields[0].AsInteger <> 0) then
     QMDetMedidasTRASPASAR.AsInteger := 1;
end;

procedure TProDMMedidas.QMDetMedidasTRASPASARChange(Sender: TField);
begin
  InsertarTemporal;
end;

procedure TProDMMedidas.ActualizaNotas;
begin

end;

procedure TProDMMedidas.QMMedidasdescalmacenGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloAlmacen(QMMedidasALMACEN.AsString);
end;

procedure TProDMMedidas.QMDetMedidasAfterOpen(DataSet: TDataSet);
begin
  //Components
  xComponentes.Close;
  xComponentes.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  xComponentes.Params.ByName['escandallo'].AsInteger := QMMedidasID_ESCANDALLO.AsInteger;
  xComponentes.Open;
end;

procedure TProDMMedidas.xStockLotesTraspasarChange(Sender: TField);
{var
  Q : THYFIBQuery;}
begin
  { if (xStockLotes.state <> dsEdit) then
     xStockLotes.Edit;

  if ((xStockLotesTraspasar.AsInteger = 1) and (xStockLotes.State = dsEdit)) then
     xStockLotesMARCADO_MEDIDAS.AsInteger := REntorno.Entrada
  else
     xStockLotesMARCADO_MEDIDAS.AsInteger := 0;

  xStockLotes.Post;

  //Suma els stoks seleccionats
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'update pro_medidas';
     SQL.Add('set unidades_stock_lote=' + FloatToStr(StockMarcado(REntorno.Entrada)));
     SQL.Add('where id_medida=' + QMMedidasID_MEDIDA.AsString);
     ExecQuery;
     QMMedidas.Refresh;
     FreeHandle;
     Free;
  end;}
end;

procedure TProDMMedidas.DataModuleDestroy(Sender: TObject);
{var
  Q : THYFIBQuery;}
begin
  { //sfg.albert - Es posa a 0 el camp marcados_medidas
  xBorrarMarcados.Close;
  xBorrarMarcados.Params.ByName['entrada'].AsInteger := REntorno.Entrada;
  xBorrarMarcados.Prepare;
  xBorrarMarcados.ExecQuery;

  //Posa a 0 la capçalera (unitats stock)
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'update pro_medidas';
     SQL.Add('set unidades_stock=0');
     SQL.Add('where id_medida=' + QMMedidasID_MEDIDA.AsString);
     ExecQuery;
     FreeHandle;
     Free;
  end;
   }
end;

procedure TProDMMedidas.xStockLotesAfterEdit(DataSet: TDataSet);
begin
  // if (xStockLotes.state = dsEdit) then
  //    xStockLotes.post;
end;

//sfg.albert
function TProDMMedidas.StockMarcado(entrada: integer): real;
begin
  with xStockTotalLote do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['articulo'].AsString := QMMedidasARTICULO.AsString;
     Params.ByName['canal'].AsInteger := REntorno.Canal;
     Params.ByName['entrada'].AsInteger := entrada;
     Prepare;
     Open;
  end;

  Result := xStockTotalLoteTOTAL_STOCK.AsFloat;
end;

procedure TProDMMedidas.QMMedidasLotesNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMMedidasLotesID_PEDIDO.AsInteger := DMPedidos.QMCabeceraID_S.AsInteger;
  QMMedidasLotesID_MEDIDA.AsInteger := QMMedidasID_MEDIDA.AsInteger;

  // Linia
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('select max(linea) from pro_medidas_lotes');
        SQL.Add('where id_pedido=' + DMPedidos.QMCabeceraID_S.AsString + ' and id_medida=' + QMMedidasID_MEDIDA.AsString);
        ExecQuery;
        QMMedidasLotesLINEA.AsInteger := Q.Fields[0].AsInteger + 1;
        FreeHandle;
     end;
  finally
     Free;
  end;
end;

procedure TProDMMedidas.QMMedidasLotesID_LOTEChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  if (QMMedidasLotesID_LOTE.AsInteger <> 0) then
  begin
     //Lote
     QMMedidasLotesLOTE.AsString := DameLote(QMMedidasLotesID_LOTE.AsInteger);

     //Stock
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select stock from sof_a_art_stock_lotes(?empresa,?canal,?almacen,?id_lote)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := QMMedidasALMACEN.AsString;
        Params.ByName['ID_LOTE'].AsInteger := QMMedidasLotesID_LOTE.AsInteger;
        ExecQuery;
        QMMedidasLotesSTOCK.AsFloat := FieldByName['STOCK'].AsFloat;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TProDMMedidas.Infolotes;
var
  IntroduceLotes : TFMIntroduceLotes;
begin
  if (ArticuloLoteable(QMMedidasARTICULO.AsString)) then
  begin
     if (QMMedidasLotes.State = dsBrowse) then
        QMMedidasLotes.Edit;
     IntroduceLotes := TFMIntroduceLotes.Create(Self);
     try
        with IntroduceLotes do
        begin
           QMMedidasLotesID_LOTE.AsInteger := AsignaArticulo('MED', REntorno.Serie,
              QMMedidasARTICULO.AsString, REntorno.Ejercicio,
              QMMedidasLotesID_Pedido.AsInteger,
              QMMedidasLotesLINEA.AsInteger, {unidades}0,
              QMMedidasALMACEN.AsString,
              QMMedidasALMACEN.AsString, REntorno.Canal,
              REntorno.Canal, True, DMPedidos.QMDetalleID_A.AsInteger,
              QMMedidasLotesID_MEDIDA.AsInteger, 0, False);

           {Informo la ubicacion seleccionada en la seleccion de lote}
           { if (FArticuloUbicable) then
           begin
              if ((QMCabeceraTIPO_OPERACION.AsString = 'E') or (QMCabeceraTIPO_OPERACION.AsString = 'T')) then
                 QMDetalleID_UBICACION_E.AsInteger := IntroduceLotes.IDUbicacion;
              if ((QMCabeceraTIPO_OPERACION.AsString = 'S') or (QMCabeceraTIPO_OPERACION.AsString = 'T')) then
                 QMDetalleID_UBICACION_S.AsInteger := IntroduceLotes.IDUbicacion;
           end; }
        end;
     finally
        IntroduceLotes.Free;
     end;
  end;
end;

procedure TProDMMedidas.QMMedidasLotesAfterInsert(DataSet: TDataSet);
{var
  Q : THYFIBQuery;
  total_stock_assignat : real;}
begin
  {   Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select sum(stock) as total from pro_medidas_lotes';
        SQL.Add('where id_medida=?id_medida and id_pedido=?id_pedido');
        Params.ByName['id_medida'].AsInteger:=QMMedidasID_MEDIDA.AsInteger;
        Params.ByName['id_pedido'].AsInteger:=DMPedidos.QMCabeceraID_S.AsInteger;
        ExecQuery;
        total_stock_assignat := FieldByName['TOTAL'].AsFloat;
        FreeHandle;
     end;

     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'update pro_medidas';
        SQL.Add('set unidades_asignadas_lote=?stock');
        SQL.Add('where id_medida=?id_medida');
        Params.ByName['id_medida'].AsInteger:=QMMedidasID_MEDIDA.AsInteger;
        Params.ByName['stock'].AsFloat:=total_stock_assignat;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);}
end;

procedure TProDMMedidas.QMDetMedidasDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloTarea(QMDetMedidasTIPOTAREA.AsString);
end;

procedure TProDMMedidas.QMDetMedidasUNIDADESChange(Sender: TField);
begin
  // if ((QMDetMedidasUNIDADES.AsFloat<>0) and (QMDetMedidasTIEMPO_UNITARIO.AsFloat<>0)) then
  //   QMDetMedidasTRASPASAR.AsInteger:=1;
end;

procedure TProDMMedidas.TraspasarNotasPedido(id_detalles_s: integer; Notas: string);
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
        SQL.Text := 'UPDATE VER_DETALLE_PEDIDO SET NOTAS=?NOTAS, CRC_NOTAS=?CRC_NOTAS WHERE ID_DETALLES_S = ?ID_DETALLES_S';
        Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
        Params.ByName['NOTAS'].AsString := Notas;
        Params.ByName['CRC_NOTAS'].AsString := CalcCRC32Str(Notas);
        ExecQuery;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMMedidas.TraspasarNotasMedidas(Notas: string);
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

end.
