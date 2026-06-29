unit UObrDMPartidasOferta;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, DB, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TObrDMPartidasOferta = class(TDataModule)
     TLocal: TFIBTransaction;
     DSQMCabOferta: TDataSource;
     DSQMCabPlantilla: TDataSource;
     DSQMDetPlantilla: TDataSource;
     QMCabOferta: TFIBTableSet;
     QMCabOfertaRIG: TIntegerField;
     QMCabOfertaID_S: TIntegerField;
     QMCabOfertaFECHA: TDateTimeField;
     QMCabOfertaCLIENTE: TIntegerField;
     QMCabOfertaTITULO: TFIBStringField;
     QMCabPlantilla: TFIBTableSet;
     QMCabPlantillaID_S: TIntegerField;
     QMCabPlantillaLINEA: TIntegerField;
     QMCabPlantillaORDEN: TIntegerField;
     QMCabPlantillaPARTIDA: TFIBStringField;
     QMCabPlantillaDESCRIPCION: TFIBStringField;
     QMCabPlantillaCANTIDAD: TFloatField;
     QMCabPlantillaMEDIDA_1: TFIBStringField;
     QMCabPlantillaMEDIDA_2: TFIBStringField;
     QMCabPlantillaMEDIDA_3: TFIBStringField;
     QMCabPlantillaP_VENTA: TFloatField;
     QMCabPlantillaTOTAL_VENTA: TFloatField;
     QMCabPlantillaP_COSTE: TFloatField;
     QMCabPlantillaTOTAL_COSTE: TFloatField;
     QMCabPlantillaMARGEN_ABS: TFloatField;
     QMCabPlantillaMARGEN_POR: TFloatField;
     QMDetPlantilla: TFIBTableSet;
     xPlantilla: TFIBDataSetRO;
     xPlantillaEMPRESA: TIntegerField;
     xPlantillaCODIGO: TIntegerField;
     xPlantillaPARTIDA: TFIBStringField;
     xPlantillaDESCRIPCION: TFIBStringField;
     xPlantillaCANTIDAD: TFloatField;
     xPlantillaMEDIDA_1: TFIBStringField;
     xPlantillaMEDIDA_2: TFIBStringField;
     xPlantillaMEDIDA_3: TFIBStringField;
     xPlantillaP_VENTA: TFloatField;
     xPlantillaTOTAL_VENTA: TFloatField;
     xPlantillaP_COSTE: TFloatField;
     xPlantillaTOTAL_COSTE: TFloatField;
     xPlantillaMARGEN_ABS: TFloatField;
     xPlantillaMARGEN_POR: TFloatField;
     xPlantillaNOTAS: TBlobField;
     xPlantillaDEFECTO: TIntegerField;
     xLineaCab: TFIBDataSetRO;
     xLineaCabMAX: TIntegerField;
     QMDetPlantillaID_DETALLES_S: TIntegerField;
     QMDetPlantillaID_S: TIntegerField;
     QMDetPlantillaLINEA_PARTIDA: TIntegerField;
     QMDetPlantillaORDEN: TIntegerField;
     QMDetPlantillaARTICULO: TFIBStringField;
     QMDetPlantillaDESCRIPCION: TFIBStringField;
     QMDetPlantillaCANTIDAD: TFloatField;
     QMDetPlantillaMEDIDA_1: TFIBStringField;
     QMDetPlantillaMEDIDA_2: TFIBStringField;
     QMDetPlantillaMEDIDA_3: TFIBStringField;
     QMDetPlantillaP_VENTA: TFloatField;
     QMDetPlantillaDESCUENTO: TFloatField;
     QMDetPlantillaTOTAL_VENTA: TFloatField;
     QMDetPlantillaP_COSTE: TFloatField;
     QMDetPlantillaTOTAL_COSTE: TFloatField;
     QMDetPlantillaMARGEN_ABS: TFloatField;
     QMDetPlantillaMARGEN_POR: TFloatField;
     QMDetPlantillaENTRADA: TIntegerField;
     QInsertarDetalle: THYFIBQuery;
     xInfoActualizada: TFIBDataSetRO;
     DSxInfoActualizada: TDataSource;
     xInfoActualizadaID_S: TIntegerField;
     xInfoActualizadaLINEA: TIntegerField;
     xInfoActualizadaORDEN: TIntegerField;
     xInfoActualizadaPARTIDA: TFIBStringField;
     xInfoActualizadaDESCRIPCION: TFIBStringField;
     xInfoActualizadaCANTIDAD: TFloatField;
     xInfoActualizadaMEDIDA_1: TFIBStringField;
     xInfoActualizadaMEDIDA_2: TFIBStringField;
     xInfoActualizadaMEDIDA_3: TFIBStringField;
     xInfoActualizadaP_VENTA: TFloatField;
     xInfoActualizadaTOTAL_VENTA: TFloatField;
     xInfoActualizadaP_COSTE: TFloatField;
     xInfoActualizadaTOTAL_COSTE: TFloatField;
     xInfoActualizadaMARGEN_ABS: TFloatField;
     xInfoActualizadaMARGEN_POR: TFloatField;
     QBorrarDetalle: THYFIBQuery;
     xDescArticulo: TFIBDataSetRO;
     xDescArticuloTITULO: TFIBStringField;
     QMCabPlantillaNOTAS: TBlobField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure GrabaCabecera(DataSet: TDataSet);
     procedure QMCabOfertaAfterOpen(DataSet: TDataSet);
     procedure QMCabPlantillaAfterOpen(DataSet: TDataSet);
     procedure QMCabPlantillaNewRecord(DataSet: TDataSet);
     procedure QMCabPlantillaBeforePost(DataSet: TDataSet);
     procedure QMCabPlantillaBeforeDelete(DataSet: TDataSet);
     procedure QMDetPlantillaARTICULOChange(Sender: TField);
     procedure QMDetPlantillaNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     ID_S_OFC, CodPlantilla: integer;
     ID_S_OLD, LineaPartidaOLD: integer;
     InsertarDetalle, BorrarDetalle: boolean;
     CheckInsertar, CheckBorrar: boolean;
     procedure AbreOferta(ID_S: integer);
     procedure CambiaPartida(LineaPartida: integer);
     procedure CambiaPlantilla(Plantilla: integer);
  end;

var
  ObrDMPartidasOferta : TObrDMPartidasOferta;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TObrDMPartidasOferta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  InsertarDetalle := False;
  BorrarDetalle := False;
  CheckInsertar := True;
  CheckBorrar := True;

  xInfoActualizadaP_VENTA.DisplayFormat := MascaraN;
  xInfoActualizadaTOTAL_VENTA.DisplayFormat := MascaraN;
  xInfoActualizadaP_COSTE.DisplayFormat := MascaraN;
  xInfoActualizadaTOTAL_COSTE.DisplayFormat := MascaraN;

  QMDetPlantillaP_VENTA.DisplayFormat := MascaraN;
  QMDetPlantillaDESCUENTO.DisplayFormat := MascaraP;
  QMDetPlantillaTOTAL_VENTA.DisplayFormat := MascaraN;
  QMDetPlantillaP_COSTE.DisplayFormat := MascaraN;
  QMDetPlantillaTOTAL_COSTE.DisplayFormat := MascaraN;
end;

procedure TObrDMPartidasOferta.AbreOferta(ID_S: integer);
begin
  ID_S_OFC := ID_S;
  with QMCabOferta do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT RIG, ID_S, FECHA, CLIENTE, TITULO FROM VER_CABECERAS_OFERTA_C ');
     SelectSQL.Add('WHERE ');
     if (ID_S = 0) then
     begin
        SelectSQL.Add('EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add('EJERCICIO = ?EJERCICIO AND ');
        SelectSQL.Add('CANAL = ?CANAL AND ');
        SelectSQL.Add('SERIE = ?SERIE ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
     end
     else
     begin
        SelectSQL.Add('ID_S = ?ID_S ');
        Params.ByName['ID_S'].AsInteger := ID_S;
     end;
     SelectSQL.Add('ORDER BY RIG ');
     Open;
  end;
end;

procedure TObrDMPartidasOferta.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  if (QMCabPlantilla.RecordCount > 0) then
     xInfoActualizada.Refresh;
end;

procedure TObrDMPartidasOferta.GrabaCabecera(DataSet: TDataSet);
begin
  Graba(DataSet);

  if (InsertarDetalle) and (CheckInsertar) {(ObrFMPartidasOferta.InsertarDetalle)} then
  begin //comentar
     with QInsertarDetalle do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CODIGO'].AsInteger := CodPlantilla;
        Params.ByName['ID_S'].AsInteger := QMCabPlantillaID_S.AsInteger;
        Params.ByName['LINEA'].AsInteger := QMCabPlantillaLINEA.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Transaction.CommitRetaining;
        FreeHandle;
     end;

     InsertarDetalle := False;
  end;

  if (BorrarDetalle) then
  begin
     // if(ObrFMPartidasOferta.BorrarDetalle) then
     if (CheckBorrar) then
        // ELIMINAMOS DESDE LA VISTA, ASI TAMBIEN ELIMINARA LA LINEA DE LA OFERTA
        QBorrarDetalle.SQL.Text := 'delete from obr_ver_partida_ofc_det ' +
           ' where id_s=?id_s and linea_partida=?linea'
     else
        // ELIMINAMOS DESDE LA TABLA, ASI NO ELIMINARA LA LINEA DE LA OFERTA
        QBorrarDetalle.SQL.Text := 'delete from obr_partida_ofc_det ' +
           ' where id_s=?id_s and linea_partida=?linea';

     with QBorrarDetalle do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := ID_S_OLD;
        Params.ByName['LINEA'].AsInteger := LineaPartidaOLD;
        ExecQuery;
        Transaction.CommitRetaining;
        FreeHandle;
     end;

     BorrarDetalle := False;
  end;
end;

procedure TObrDMPartidasOferta.QMCabOfertaAfterOpen(DataSet: TDataSet);
begin
  QMCabPlantilla.Close;
  QMCabPlantilla.Open;
end;

procedure TObrDMPartidasOferta.QMCabPlantillaAfterOpen(DataSet: TDataSet);
begin
  QMDetPlantilla.Close;
  QMDetPlantilla.Open;

  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TObrDMPartidasOferta.QMCabPlantillaNewRecord(DataSet: TDataSet);
begin
  QMCabPlantillaID_S.AsInteger := QMCabOfertaID_S.AsInteger;

  xLineaCab.Close;
  xLineaCab.Open;
  QMCabPlantillaLINEA.AsInteger := xLineaCabMAX.AsInteger + 1;
  QMCabPlantillaORDEN.AsInteger := QMCabPlantillaLINEA.AsInteger;
end;

procedure TObrDMPartidasOferta.QMDetPlantillaNewRecord(DataSet: TDataSet);
begin
  QMDetPlantillaID_S.AsInteger := QMCabPlantillaID_S.AsInteger;
  QMDetPlantillaLINEA_PARTIDA.AsInteger := QMCabPlantillaLINEA.AsInteger;
  QMDetPlantillaENTRADA.AsInteger := REntorno.Entrada;
end;

procedure TObrDMPartidasOferta.QMCabPlantillaBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     InsertarDetalle := True;
end;

procedure TObrDMPartidasOferta.QMCabPlantillaBeforeDelete(DataSet: TDataSet);
begin
  BorrarDetalle := True;
  LineaPartidaOLD := QMCabPlantillaLINEA.AsInteger;
  ID_S_OLD := QMCabPlantillaID_S.AsInteger;
end;

procedure TObrDMPartidasOferta.QMDetPlantillaARTICULOChange(Sender: TField);
begin
  xDescArticulo.Close;
  xDescArticulo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xDescArticulo.Params.ByName['ARTICULO'].AsString := QMDetPlantillaARTICULO.AsString;
  xDescArticulo.Open;

  QMDetPlantillaDESCRIPCION.AsString := xDescArticuloTITULO.AsString;
end;

procedure TObrDMPartidasOferta.CambiaPartida(LineaPartida: integer);
begin
  with QMDetPlantilla do
  begin
     Close;
     SelectSQL.Clear;
     if (LineaPartida = 0) then
     begin
        SelectSQL.Add(' SELECT * FROM OBR_VER_PARTIDA_OFC_DET ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ID_S = ?ID_S AND ');
        SelectSQL.Add(' LINEA_PARTIDA IS NULL ');
        Params.ByName['ID_S'].AsInteger := QMCabOfertaID_S.AsInteger;
        Open;
     end
     else
     begin
        SelectSQL.Add(' SELECT * FROM OBR_VER_PARTIDA_OFC_DET ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ID_S = ?ID_S AND ');
        SelectSQL.Add(' LINEA_PARTIDA = ?LINEA ');

        QMCabPlantilla.Close;
        QMCabPlantilla.Open;
     end;

     if (not Active) then
        Open;
  end;
end;

procedure TObrDMPartidasOferta.CambiaPlantilla(Plantilla: integer);
begin
  if (QMCabPlantilla.State = dsInsert) then
  begin
     CodPlantilla := Plantilla;

     xPlantilla.Close;
     xPlantilla.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     xPlantilla.Params.ByName['CODIGO'].AsInteger := Plantilla;
     xPlantilla.Open;

     QMCabPlantillaPARTIDA.AsString := xPlantillaPARTIDA.AsString;
     QMCabPlantillaDESCRIPCION.AsString := xPlantillaDESCRIPCION.AsString;
     QMCabPlantillaCANTIDAD.AsFloat := xPlantillaCANTIDAD.AsFloat;
     QMCabPlantillaMEDIDA_1.AsString := xPlantillaMEDIDA_1.AsString;
     QMCabPlantillaMEDIDA_2.AsString := xPlantillaMEDIDA_2.AsString;
     QMCabPlantillaMEDIDA_3.AsString := xPlantillaMEDIDA_3.AsString;
  end;
end;

end.
