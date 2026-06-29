unit UDMIntrastat;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBQuery, HYFIBQuery, FIBDataSet, FIBDatabase,
  UFIBModificados, FIBTableDataSet, FIBDataSetRO;

type
  TDMIntrastat = class(TDataModule)
     QMIntrastat: TFIBTableSet;
     DSQMIntrastat: TDataSource;
     TLocal: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xPeriodos: TFIBDataSetRO;
     xPeriodosEMPRESA: TIntegerField;
     xPeriodosEJERCICIO: TIntegerField;
     xPeriodosPERIODO: TFIBStringField;
     xPeriodosTITULO: TFIBStringField;
     xPeriodosDESDE: TDateTimeField;
     xPeriodosHASTA: TDateTimeField;
     DSxPeriodos: TDataSource;
     QMIntrastatEMPRESA: TIntegerField;
     QMIntrastatEJERCICIO: TIntegerField;
     QMIntrastatCANAL: TIntegerField;
     QMIntrastatPERIODO: TFIBStringField;
     QMIntrastatTIPO: TFIBStringField;
     QMIntrastatCOMENTARIOS: TMemoField;
     QMIntrastatREAL_MOD: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetallePERIODO: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleESTADO_MIEMBRO: TFIBStringField;
     QMDetallePROVINCIA_ORI_DES: TIntegerField;
     QMDetalleCOND_ENTREGA: TFIBStringField;
     QMDetalleNATURALEZA_TRANSACCION: TIntegerField;
     QMDetalleMODALIDAD_TRANSPORTE: TIntegerField;
     QMDetallePUERTO_CARGA_DESCARGA: TFIBStringField;
     QMDetalleCODIGO_MERCANCIA: TFIBStringField;
     QMDetallePAIS_ORIGEN: TFIBStringField;
     QMDetalleREGIMEN_ESTADISTICO: TFIBStringField;
     QMDetalleMASA_NETA: TFloatField;
     QMDetalleUNIDADES_SUPLEMENTARIAS: TFloatField;
     QMDetalleVALOR: TFloatField;
     QMDetalleVALOR_ESTADISTICO: TFloatField;
     QMDetalleIVA_VIES: TFIBStringField;
     TUpdate: THYTransaction;
     xDocumentos: TFIBTableSet;
     DSDocumentos: TDataSource;
     xDocumentosEMPRESA: TIntegerField;
     xDocumentosEJERCICIO: TIntegerField;
     xDocumentosCANAL: TIntegerField;
     xDocumentosSERIE: TFIBStringField;
     xDocumentosTIPO: TFIBStringField;
     xDocumentosRIG: TIntegerField;
     xDocumentosLINEA: TIntegerField;
     xDocumentosID_DOC: TIntegerField;
     xDocumentosID_DETALLES_DOC: TIntegerField;
     xDocumentosPERIODO: TFIBStringField;
     xDocumentosESTADO_MIEMBRO: TFIBStringField;
     xDocumentosPROVINCIA_ORI_DES: TIntegerField;
     xDocumentosCOND_ENTREGA: TFIBStringField;
     xDocumentosNATURALEZA_TRANSACCION: TIntegerField;
     xDocumentosMODALIDAD_TRANSPORTE: TIntegerField;
     xDocumentosPUERTO_CARGA_DESCARGA: TFIBStringField;
     xDocumentosCODIGO_MERCANCIA: TFIBStringField;
     xDocumentosPAIS_ORIGEN: TFIBStringField;
     xDocumentosREGIMEN_ESTADISTICO: TFIBStringField;
     xDocumentosMASA_NETA: TFloatField;
     xDocumentosUNIDADES_SUPLEMENTARIAS: TFloatField;
     xDocumentosVALOR: TFloatField;
     xDocumentosVALOR_ESTADISTICO: TFloatField;
     xDocumentosIVA_VIES: TFIBStringField;
     xDocumentosARTICULO: TFIBStringField;
     QMDetalleI_PORTE_PROPORCIONAL: TFloatField;
     xDocumentosI_PORTE_PROPORCIONAL: TFloatField;
     xDocumentosIGNORAR: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMIntrastatAfterOpen(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMIntrastatBeforeClose(DataSet: TDataSet);
     procedure QMIntrastatAfterScroll(DataSet: TDataSet);
     procedure xDocumentosAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure GeneraIntrastat(Borrar: boolean);
     procedure GeneraFichero(Archivo: string);
  end;

var
  DMIntrastat : TDMIntrastat;

implementation

uses UDMMain, UEntorno, UUtiles, DateUtils;

{$R *.dfm}

procedure TDMIntrastat.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMIntrastat, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDocumentos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xPeriodos, MascaraN, MascaraI, ShortDateFormat);


  QMDetalleMASA_NETA.DisplayFormat := MascaraI;
  QMDetalleUNIDADES_SUPLEMENTARIAS.DisplayFormat := MascaraI;

  xDocumentosMASA_NETA.DisplayFormat := MascaraI;
  xDocumentosUNIDADES_SUPLEMENTARIAS.DisplayFormat := MascaraI;

  DMMain.FiltraTabla(QMIntrastat, '11100', True);
  Posicionar(QMIntrastat, 'PERIODO', format('%.2d', [MonthOf(TODAY) - 1]), False, True);
end;

procedure TDMIntrastat.GeneraIntrastat(Borrar: boolean);
begin
  if Borrar then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           if (QMIntrastatTIPO.AsString = 'COM') then
              SQL.Add(' DELETE FROM GES_DETALLES_E_FAC_INTRASTAT ')
           else
              SQL.Add(' DELETE FROM GES_DETALLES_S_FAC_INTRASTAT ');
           SQL.Add(' WHERE ');
           SQL.Add('   EMPRESA = :EMPRESA AND ');
           SQL.Add('   EJERCICIO = :EJERCICIO AND ');
           SQL.Add('   CANAL = :CANAL AND ');
           SQL.Add('   PERIODO = :PERIODO AND ');
           SQL.Add('   TIPO = :TIPO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := QMIntrastatPERIODO.AsString;
           Params.ByName['TIPO'].AsString := QMIntrastatTIPO.AsString;
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
           SQL.Add(' DELETE FROM CON_INTRASTAT_DETALLE ');
           SQL.Add(' WHERE ');
           SQL.Add('   EMPRESA = :EMPRESA AND ');
           SQL.Add('   EJERCICIO = :EJERCICIO AND ');
           SQL.Add('   CANAL = :CANAL AND ');
           SQL.Add('   PERIODO = :PERIODO AND ');
           SQL.Add('   TIPO = :TIPO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERIODO'].AsString := QMIntrastatPERIODO.AsString;
           Params.ByName['TIPO'].AsString := QMIntrastatTIPO.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_GENERA_INTRASTAT (:EMPRESA, :EJERCICIO, :CANAL, :PERIODO, :TIPO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := QMIntrastatPERIODO.AsString;
        Params.ByName['TIPO'].AsString := QMIntrastatTIPO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si está vacio se debe refrescar completamente.
  // Quiere decir que se ha calculado para todos los periodos
  if (QMIntrastatTIPO.AsString = '') then
  begin
     QMIntrastat.Close;
     QMIntrastat.Open;
  end;

  QMDetalle.Close;
  QMDetalle.Open;
  xDocumentos.Close;
  xDocumentos.Open;
end;

procedure TDMIntrastat.QMIntrastatAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xPeriodos.Open;
end;

procedure TDMIntrastat.QMIntrastatBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xPeriodos.Close;
end;

procedure TDMIntrastat.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetalleCANAL.AsInteger := REntorno.Canal;
  QMDetalleTIPO.AsString := QMIntrastatTIPO.AsString;
  QMDetallePERIODO.AsString := QMIntrastatPERIODO.AsString;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CON_INTRASTAT_D_LINEA(:EMPRESA, :EJERCICIO, :CANAL, :PERIODO, :TIPO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PERIODO'].AsString := QMIntrastatPERIODO.AsString;
        Params.ByName['TIPO'].AsString := QMIntrastatTIPO.AsString;
        ExecQuery;
        QMDetalleLINEA.AsInteger := FieldByName['LINEA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMIntrastat.QMIntrastatAfterScroll(DataSet: TDataSet);
begin
  with xDocumentos do
  begin
     Close;

     SelectSQL.Clear;
     UpdateSQL.Clear;
     InsertSQL.Clear;
     DeleteSQL.Clear;
     RefreshSQL.Clear;

     if (QMIntrastatTIPO.AsString = 'COM') then
        SelectSQL.Add(' SELECT * FROM GES_DETALLES_E_FAC_INTRASTAT ')
     else
        SelectSQL.Add(' SELECT * FROM GES_DETALLES_S_FAC_INTRASTAT ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add('   EMPRESA = :EMPRESA AND ');
     SelectSQL.Add('   EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add('   CANAL = :CANAL AND ');
     SelectSQL.Add('   PERIODO = :PERIODO AND ');
     SelectSQL.Add('   TIPO = :TIPO ');
     SelectSQL.Add(' ORDER BY SERIE, RIG, LINEA ');

     if (QMIntrastatTIPO.AsString = 'COM') then
        UpdateSQL.Add(' UPDATE GES_DETALLES_E_FAC_INTRASTAT ')
     else
        UpdateSQL.Add(' UPDATE GES_DETALLES_S_FAC_INTRASTAT ');
     UpdateSQL.Add(' SET ');
     UpdateSQL.Add('   ARTICULO=?ARTICULO ');
     UpdateSQL.Add('   ,ESTADO_MIEMBRO=?ESTADO_MIEMBRO ');
     UpdateSQL.Add('   ,PROVINCIA_ORI_DES=?PROVINCIA_ORI_DES ');
     UpdateSQL.Add('   ,COND_ENTREGA=?COND_ENTREGA ');
     UpdateSQL.Add('   ,NATURALEZA_TRANSACCION=?NATURALEZA_TRANSACCION ');
     UpdateSQL.Add('   ,MODALIDAD_TRANSPORTE=?MODALIDAD_TRANSPORTE ');
     UpdateSQL.Add('   ,PUERTO_CARGA_DESCARGA=?PUERTO_CARGA_DESCARGA ');
     UpdateSQL.Add('   ,CODIGO_MERCANCIA=?CODIGO_MERCANCIA ');
     UpdateSQL.Add('   ,PAIS_ORIGEN=?PAIS_ORIGEN ');
     UpdateSQL.Add('   ,REGIMEN_ESTADISTICO=?REGIMEN_ESTADISTICO ');
     UpdateSQL.Add('   ,MASA_NETA=?MASA_NETA ');
     UpdateSQL.Add('   ,UNIDADES_SUPLEMENTARIAS=?UNIDADES_SUPLEMENTARIAS ');
     UpdateSQL.Add('   ,VALOR=?VALOR ');
     UpdateSQL.Add('   ,VALOR_ESTADISTICO=?VALOR_ESTADISTICO ');
     UpdateSQL.Add('   ,IVA_VIES=?IVA_VIES ');
     UpdateSQL.Add('   ,I_PORTE_PROPORCIONAL=?I_PORTE_PROPORCIONAL ');
     UpdateSQL.Add('   ,IGNORAR=?IGNORAR ');
     UpdateSQL.Add(' WHERE ');
     UpdateSQL.Add('   ID_DETALLES_DOC=?ID_DETALLES_DOC ');

     if (QMIntrastatTIPO.AsString = 'COM') then
        InsertSQL.Add(' INSERT INTO  GES_DETALLES_E_FAC_INTRASTAT ')
     else
        InsertSQL.Add(' INSERT INTO  GES_DETALLES_S_FAC_INTRASTAT ');
     InsertSQL.Add('   (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ARTICULO,ID_DOC,ID_DETALLES_DOC,PERIODO, ');
     InsertSQL.Add('   ESTADO_MIEMBRO,PROVINCIA_ORI_DES,COND_ENTREGA,NATURALEZA_TRANSACCION, ');
     InsertSQL.Add('   MODALIDAD_TRANSPORTE,PUERTO_CARGA_DESCARGA,CODIGO_MERCANCIA,PAIS_ORIGEN, ');
     InsertSQL.Add('   REGIMEN_ESTADISTICO,MASA_NETA,UNIDADES_SUPLEMENTARIAS,VALOR,VALOR_ESTADISTICO,IVA_VIES, ');
     InsertSQL.Add('   I_PORTE_PROPORCIONAL,IGNORAR) ');
     InsertSQL.Add(' VALUES ');
     InsertSQL.Add('   (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ARTICULO,?ID_DOC,?ID_DETALLES_DOC,?PERIODO, ');
     InsertSQL.Add('   ?ESTADO_MIEMBRO,?PROVINCIA_ORI_DES,?COND_ENTREGA,?NATURALEZA_TRANSACCION, ');
     InsertSQL.Add('   ?MODALIDAD_TRANSPORTE,?PUERTO_CARGA_DESCARGA,?CODIGO_MERCANCIA,?PAIS_ORIGEN, ');
     InsertSQL.Add('   ?REGIMEN_ESTADISTICO,?MASA_NETA,?UNIDADES_SUPLEMENTARIAS,?VALOR,?VALOR_ESTADISTICO,?IVA_VIES, ');
     InsertSQL.Add('   ?I_PORTE_PROPORCIONAL,?IGNORAR) ');

     if (QMIntrastatTIPO.AsString = 'COM') then
        DeleteSQL.Add(' DELETE FROM GES_DETALLES_E_FAC_INTRASTAT ')
     else
        DeleteSQL.Add(' DELETE FROM GES_DETALLES_S_FAC_INTRASTAT ');
     DeleteSQL.Add(' WHERE ');
     DeleteSQL.Add('   ID_DETALLES_DOC=?old_ID_DETALLES_DOC ');

     if (QMIntrastatTIPO.AsString = 'COM') then
        RefreshSQL.Add(' SELECT * FROM GES_DETALLES_E_FAC_INTRASTAT ')
     else
        RefreshSQL.Add(' SELECT * FROM GES_DETALLES_S_FAC_INTRASTAT ');
     RefreshSQL.Add(' WHERE ');
     RefreshSQL.Add('   ID_DETALLES_DOC=?ID_DETALLES_DOC ');

     Open;
  end;
end;

procedure TDMIntrastat.xDocumentosAfterPost(DataSet: TDataSet);
begin
  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TDMIntrastat.GeneraFichero(Archivo: string);
var
  sl : TStrings;
  s : string;
begin
  sl := TStringList.Create;
  try
     QMDetalle.First;
     while not QMDetalle.EOF do
     begin
        s := '';
        s := s + QMDetalleESTADO_MIEMBRO.AsString + ';';
        s := s + QMDetallePROVINCIA_ORI_DES.AsString + ';';
        s := s + QMDetalleCOND_ENTREGA.AsString + ';';
        s := s + QMDetalleNATURALEZA_TRANSACCION.AsString + ';';
        s := s + QMDetalleMODALIDAD_TRANSPORTE.AsString + ';';
        s := s + QMDetallePUERTO_CARGA_DESCARGA.AsString + ';';
        s := s + Trim(QMDetalleCODIGO_MERCANCIA.AsString) + ';';
        s := s + QMDetallePAIS_ORIGEN.AsString + ';';
        s := s + QMDetalleREGIMEN_ESTADISTICO.AsString + ';';

        if (QMDetalleMASA_NETA.AsFloat < 1) then
           s := s + FormatFloat('0.000', QMDetalleMASA_NETA.AsFloat) + ';'
        else
           s := s + FormatFloat('0', QMDetalleMASA_NETA.AsFloat) + ';';

        s := s + FormatFloat('0.###', QMDetalleUNIDADES_SUPLEMENTARIAS.AsFloat) + ';';
        s := s + FormatFloat('0.##', QMDetalleVALOR.AsFloat) + ';';
        s := s + FormatFloat('0.##', QMDetalleVALOR_ESTADISTICO.AsFloat) + ';';

        s := s + Trim(QMDetalleIVA_VIES.AsString);

        sl.Add(s);

        QMDetalle.Next;
     end;

     sl.SaveToFile(Archivo);
  finally
     sl.Free;
  end;
end;

end.
