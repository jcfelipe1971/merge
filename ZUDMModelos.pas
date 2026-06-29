unit ZUDMModelos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, jpeg, GIFImage, Graphics, FIBQuery,
  HYFIBQuery, Dialogs, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, Controls;

type
  TZDMModelos = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMModelos: TFIBTableSet;
     DSQMModelos: TDataSource;
     QMModelosDESCRIPCION: TFIBStringField;
     QMModelosNOTAS: TBlobField;
     QMModelosDIAS_SERVIR: TIntegerField;
     QMModelosCONFIG_TIPO: TIntegerField;
     QMModelosCONFIG_SUBTIPO: TIntegerField;
     QMModelosINC_CORTE: TIntegerField;
     QMModelosDEC_BARRAS_MANUAL_ARRIBA: TFloatField;
     QMModelosDEC_BARRAS_MANUAL_ABAJO: TFloatField;
     QMModelosDEC_BARRAS_MOTOR_ARRIBA: TFloatField;
     QMModelosDEC_BARRAS_MOTOR_ABAJO: TFloatField;
     QMModelosDEC_MANUAL_MEDIDA_LONA: TFloatField;
     QMModelosTIPO_AUX: TFIBStringField;
     QMModelosTIPO_CONFECCION: TFIBStringField;
     QMModelosCODIGO: TFIBStringField;
     QMModelosWEB: TIntegerField;
     QMModelosESCANDALLO_DEFECTO: TIntegerField;
     QMModelosBARRA_SUPERIOR: TFIBStringField;
     QMModelosBARRA_INFERIOR: TFIBStringField;
     QMModelosBARRAS_TIENEN_FORMULA: TIntegerField;
     QMModelosEMPRESA: TIntegerField;
     QMModelosENTRADA: TIntegerField;
     QMModelosEJERCICIO: TIntegerField;
     QMModelosORIGEN: TIntegerField;
     QMModelosTIPO_MODELO: TFIBStringField;
     xRegDatosModelos: TFIBDataSetRO;
     DSxRegDatosModelos: TDataSource;
     xRegDatosModelosCOUNT: TIntegerField;
     xTipoModelo: TFIBTableSet;
     DSxTipoModelo: TDataSource;
     xTipoModeloCODIGO: TFIBStringField;
     xTipoModeloDESCRIPCION: TFIBStringField;
     QMModelosDiasColor: TFIBTableSet;
     QMModelosDiasColorCODIGO_MODELO: TFIBStringField;
     QMModelosDiasColorCODIGO_COLOR: TFIBStringField;
     QMModelosDiasColorDIAS_RETRASO: TIntegerField;
     QMModelosDiasColorDESC_COLOR: TStringField;
     xAgrupSon: TFIBDataSetRO;
     DSxAgrupSon: TDataSource;
     xAgrupDisp: TFIBDataSetRO;
     DSxAgrupDisp: TDataSource;
     QMModelosTIPO_LINEA_SALIDA: TIntegerField;
     QMModelosIMAGEN: TIntegerField;
     QMIncrPrecioColor: TFIBTableSet;
     DSIncrPrecioColor: TDataSource;
     QMIncrPrecioColorCODIGO_MODELO: TFIBStringField;
     QMIncrPrecioColorCODIGO_COLOR: TFIBStringField;
     QMIncrPrecioColorINCR_PRECIO: TFloatField;
     QMIncrPrecioColorDESC_COLOR: TStringField;
     QMModelosBULTOS: TIntegerField;
     QMModelosDEC_MOTOR_MEDIDA_LONA: TFloatField;
     QMModelosID: TIntegerField;
     QMModelosCOEFICIENTE_COMPRA: TFloatField;
     QMModelosFAMILIA: TFIBStringField;
     QMModelosSUBFAMILIA: TFIBStringField;
     QMModelosTIEMPO_FASE_CHE: TIntegerField;
     QMModelosTIEMPO_FASE_MON: TIntegerField;
     QMModelosTIEMPO_FASE_PRE: TIntegerField;
     QMModelosTIEMPO_FASE_TER: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMModelosAfterOpen(DataSet: TDataSet);
     procedure QMModelosNewRecord(DataSet: TDataSet);
     procedure QMModelosBeforeInsert(DataSet: TDataSet);
     procedure QMModelosDiasColorNewRecord(DataSet: TDataSet);
     procedure QMModelosBeforeClose(DataSet: TDataSet);
     procedure QMModelosDiasColorDESC_COLORGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMIncrPrecioColorNewRecord(DataSet: TDataSet);
     procedure QMIncrPrecioColorDESC_COLORGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMModelosBeforeEdit(DataSet: TDataSet);
     procedure QMModelosAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     SQLFind: string;
     old_Familia, old_SubFamilia: string;
  public
     { Public declarations }
     procedure CreaDatosModelo(Linea_Ini, Linea_Fin, Linea_Cad, Salida_Ini, Salida_Fin, Salida_Cad: integer);
     procedure BusquedaCompleja;
     procedure BorraModelo(SoloObsoletos: boolean);
     procedure AgrupacionRellena;
     procedure AgrupacionVacia;
  end;

var
  ZDMModelos : TZDMModelos;

implementation

uses UDMMain, ZUFMModelos, UEntorno, UFParada, UFBusca, UUtiles;

{$R *.dfm}

procedure TZDMModelos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMModelos, MascaraN, MascaraI, ShortDateFormat);
  QMModelosIMAGEN.DisplayFormat := '';
  AsignaDisplayFormat(QMIncrPrecioColor, MascaraN, MascaraI, ShortDateFormat);
  QMIncrPrecioColorINCR_PRECIO.DisplayFormat := MascaraP;
  AsignaDisplayFormat(QMModelosDiasColor, MascaraN, MascaraI, ShortDateFormat);

  QMModelos.Open;
  SQLFind := QMModelos.SelectSQL.Text;
end;

procedure TZDMModelos.QMModelosAfterOpen(DataSet: TDataSet);
begin
  xRegDatosModelos.Open;
  QMModelosDiasColor.Open;
  xAgrupDisp.Open;
  xAgrupSon.Open;
  QMIncrPrecioColor.Open;
end;

procedure TZDMModelos.QMModelosNewRecord(DataSet: TDataSet);
begin
  QMModelosCONFIG_TIPO.AsInteger := 1;
  QMModelosTIPO_AUX.AsString := 'TCF';
  QMModelosEMPRESA.AsInteger := REntorno.Empresa;
  QMModelosENTRADA.AsInteger := REntorno.Entrada;
  QMModelosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMModelosIMAGEN.AsInteger := 0;
  QMModelosBULTOS.AsInteger := 1;
  QMModelosID.AsInteger := 0;
end;

procedure TZDMModelos.CreaDatosModelo(Linea_Ini, Linea_Fin, Linea_Cad, Salida_Ini, Salida_Fin, Salida_Cad: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE Z_CREA_DATOS_MODELOS ');
        SQL.Add(' (:COD_MODELO, :EMPRESA, :LINEA_INI, :LINEA_FIN, :LINEA_CAD, :SALIDA_INI, ');
        SQL.Add(' :SALIDA_FIN, :SALIDA_CAD, :EJERCICIO, :CANAL, :ENTRADA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['LINEA_INI'].AsInteger := Linea_Ini;
        Params.ByName['LINEA_FIN'].AsInteger := Linea_Fin;
        Params.ByName['LINEA_CAD'].AsInteger := Linea_Cad;
        Params.ByName['SALIDA_INI'].AsInteger := Salida_Ini;
        Params.ByName['SALIDA_FIN'].AsInteger := Salida_Fin;
        Params.ByName['SALIDA_CAD'].AsInteger := Salida_Cad;
        Params.ByName['COD_MODELO'].AsString := Trim(QMModelosCODIGO.AsString);
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(_('Se han creado los datos modelo correctamente'));
end;

procedure TZDMModelos.QMModelosBeforeInsert(DataSet: TDataSet);
begin
  // Quitamos posibles espacios en blanco
  QMModelosCODIGO.AsString := Trim(QMModelosCODIGO.AsString);
end;

procedure TZDMModelos.BusquedaCompleja;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(QMModelos, '00000', True) = mrAll) then
  begin
     QMModelos.Close;
     QMModelos.SelectSQL.Text := SQLFind;
     QMModelos.Open;
  end;
end;

procedure TZDMModelos.BorraModelo(SoloObsoletos: boolean);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE BORRA_MODELO(:MODELO, :SOLO_OBSOLETOS)';
        Params.ByName['MODELO'].AsString := Trim(QMModelosCODIGO.AsString);
        Params.ByName['SOLO_OBSOLETOS'].AsInteger := BoolToInt(SoloObsoletos);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMModelos, 'CODIGO', QMModelosCODIGO.AsString);
  ShowMessage(_('Proceso de eliminación finalizado'));
end;

procedure TZDMModelos.QMModelosDiasColorNewRecord(DataSet: TDataSet);
begin
  QMModelosDiasColorCODIGO_MODELO.AsString := QMModelosCODIGO.AsString;
end;

procedure TZDMModelos.QMModelosBeforeClose(DataSet: TDataSet);
begin
  xRegDatosModelos.Close;
  QMModelosDiasColor.Close;
  xAgrupDisp.Close;
  xAgrupSon.Close;
  QMIncrPrecioColor.Close;
end;

procedure TZDMModelos.QMModelosDiasColorDESC_COLORGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DMMain.DameDescripcionColor(QMModelosDiasColorCODIGO_COLOR.AsString);
end;

procedure TZDMModelos.AgrupacionRellena;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_AGRUPACIONES_RELLENA_MOD(?AGRUPACION, ?EMPRESA, ?CODIGO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CODIGO'].AsString := QMModelosCODIGO.AsString;
        Params.ByName['AGRUPACION'].AsString := xAgrupDisp.FieldByName('AGRUPACION').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

procedure TZDMModelos.AgrupacionVacia;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM EMP_AGRUPACIONES_MOD WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION AND CODIGO=?CODIGO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CODIGO'].AsString := QMModelosCODIGO.AsString;
        Params.ByName['AGRUPACION'].AsString := xAgrupSon.FieldByName('AGRUPACION').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

procedure TZDMModelos.QMIncrPrecioColorNewRecord(DataSet: TDataSet);
begin
  QMIncrPrecioColorCODIGO_MODELO.AsString := QMModelosCODIGO.AsString;
end;

procedure TZDMModelos.QMIncrPrecioColorDESC_COLORGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DMMain.DameDescripcionColor(QMIncrPrecioColorCODIGO_COLOR.AsString);
end;

procedure TZDMModelos.QMModelosBeforeEdit(DataSet: TDataSet);
begin
  old_Familia := QMModelosFAMILIA.AsString;
  old_SubFamilia := QMModelosSUBFAMILIA.AsString;
end;

procedure TZDMModelos.QMModelosAfterPost(DataSet: TDataSet);
var
  IdA : integer;
begin
  if ((old_Familia <> QMModelosFAMILIA.AsString) or
     (old_SubFamilia <> QMModelosSUBFAMILIA.AsString)) then
  begin
     if ConfirmaMensajeCaption(_('La familia/subfamilia a cambiado. Desea modificar los articulos asociados al modelo?'), _('Familia/Subfamilia modificada')) then
     begin
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Add(' SELECT A.ID_A, A.ARTICULO, SM.FAMILIA, SM.SUBFAMILIA, A.TITULO_LARGO ');
                 SelectSQL.Add(' FROM ART_ARTICULOS A ');
                 SelectSQL.Add(' JOIN Z_ART_ARTICULOS_TOLDO T ON A.ID_A = T.ID_A ');
                 SelectSQL.Add(' JOIN Z_ART_ARTICULOS_ARMAZON AR ON T.ID_A_ARMAZON = AR.ID_A ');
                 SelectSQL.Add(' JOIN Z_SYS_MODELOS_DET M ON AR.MODELO = M.CODIGO AND AR.LINEA = M.LINEA AND AR.SALIDA = M.SALIDA ');
                 SelectSQL.Add(' JOIN Z_SYS_MODELOS SM ON M.CODIGO = SM.CODIGO ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' A.EMPRESA = :EMPRESA AND ');
                 SelectSQL.Add(' SM.CODIGO = :CODIGO AND ');
                 SelectSQL.Add(' ((SM.FAMILIA <> A.FAMILIA) or (SM.SUBFAMILIA <> A.SUBFAMILIA)) ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['CODIGO'].AsString := QMModelosCODIGO.AsString;
                 Open;
                 while not EOF do
                 begin
                    IdA := FieldByName('ID_A').AsInteger;

                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'UPDATE ART_ARTICULOS SET FAMILIA = :FAMILIA, SUBFAMILIA = :SUBFAMILIA WHERE ID_A = :ID_A';
                          Params.ByName['ID_A'].AsInteger := IdA;
                          Params.ByName['FAMILIA'].AsString := QMModelosFAMILIA.AsString;
                          Params.ByName['SUBFAMILIA'].AsString := QMModelosSUBFAMILIA.AsString;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    Next;
                 end;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;

        ShowMessage(_('Familia/Subfamilia modificada'));
     end;
  end;
end;

end.
