unit ZUDMOfertasArtDet;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TZDMOfertasArtDet = class(TDataModule)
     TLocal: THYTransaction;
     QMOfertasDet: TFIBTableSet;
     xDatosDetalle: TFIBDataSetRO;
     DSQMOfertasDet: TDataSource;
     DSxDatosDetalle: TDataSource;
     QMOfertasDetDescArt: TStringField;
     QMOfertasDetPCoste: TFloatField;
     QMOfertasDetPVenta: TFloatField;
     QMOfertasDetMargen: TFloatField;
     xDatosDetalleP_COSTE: TFloatField;
     xDatosDetalleP_VENTA: TFloatField;
     xDatosDetalleMARGEN: TFloatField;
     xDatosDetalleTITULO_DET: TFIBStringField;
     xDatosDetalleTIPO_ARTICULO_TYC: TFIBStringField;
     xDatosTotal: TFIBDataSetRO;
     DSxDatosTotal: TDataSource;
     QMOfertasDetTIPO_ARTICULO_TYC: TStringField;
     QMOfertasDetID_DETALLES_S: TIntegerField;
     QMOfertasDetDETALLE: TFIBStringField;
     QMOfertasDetESCANDALLO: TIntegerField;
     xDatosTotalP_COSTE: TFloatField;
     xDatosTotalP_VENTA: TFloatField;
     xDatosTotalMARGEN: TFloatField;
     QMOfertasCab: TFIBTableSet;
     DSQMOfertasCab: TDataSource;
     QMOfertasCabID_DETALLES_S: TIntegerField;
     QMOfertasCabLACADO: TFIBStringField;
     QMOfertasCabMOTOR: TIntegerField;
     QMOfertasCabINCR_LACADO_PVP: TIntegerField;
     QMOfertasCabP_INCR_LACADO_PVP: TFloatField;
     xLacado: TFIBDataSetRO;
     QMOfertasCabMODELO: TFIBStringField;
     QMOfertasCabLINEAL: TFloatField;
     QMOfertasCabSALIDA: TFloatField;
     xLonaDet: TFIBDataSetRO;
     xArticulo: TFIBDataSetRO;
     xArticuloARTICULO: TFIBStringField;
     xArticuloTITULO_DET: TFIBStringField;
     xArticuloTITULO_ART: TFIBStringField;
     xArticuloTIPO_ARTICULO_TYC: TFIBStringField;
     xLonaM2: TFIBDataSetRO;
     xLonaM2TOTAL_M2_LONA: TFloatField;
     xTipoArt: TFIBDataSetRO;
     xTipoArtTIPO_ARTICULO_TYC: TFIBStringField;
     xLonaDetARTICULO: TFIBStringField;
     xLonaDetTITULO: TFIBStringField;
     xLineaCalc: TFIBDataSetRO;
     xSalidaCalc: TFIBDataSetRO;
     xLineaCalcLINEA: TIntegerField;
     xLacadoDESCRIPCION: TFIBStringField;
     xLacadoINCREMENTO_PVP: TFloatField;
     xSalidaCalcSALIDA: TIntegerField;
     QMOfertasCabUNIDADES_LONA: TFloatField;
     xDatosDetalleFAMILIA: TFIBStringField;
     DSxLonaM2: TDataSource;
     xLonaDetID_A: TIntegerField;
     xLonaDetZ_LON_TIPO: TFIBStringField;
     QMOfertasDetID_A_DET: TIntegerField;
     QMOfertasDetUNIDADES: TFloatField;
     xEscandallo: TFIBDataSetRO;
     xEscandalloESCANDALLO: TIntegerField;
     QMOfertasCabTOTAL_INC_LACADO: TFloatField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMOfertasDetTIPO_ARTICULO_TYCGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOfertasDetDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOfertasDetPCosteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOfertasDetPVentaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOfertasDetMargenGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMOfertasDetNewRecord(DataSet: TDataSet);
     procedure xDatosDetalleBeforeOpen(DataSet: TDataSet);
     procedure xDatosTotalBeforeOpen(DataSet: TDataSet);
     procedure QMOfertasCabLACADOChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMOfertasDetAfterPost(DataSet: TDataSet);
     procedure QMOfertasDetAfterScroll(DataSet: TDataSet);
     procedure QMOfertasCabLINEALChange(Sender: TField);
     procedure QMOfertasCabSALIDAChange(Sender: TField);
     procedure QMOfertasCabUNIDADES_LONAChange(Sender: TField);
     procedure GrabaDetalle(DataSet: TDataSet);
     procedure QMOfertasDetDETALLEChange(Sender: TField);
     procedure QMOfertasDetBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     CalcLona: boolean;
     procedure EstableceCalcLona;
     procedure ControlaDisponibilidad;
     procedure CambiaPrecios;
  public
     { Public declarations }
     procedure AbreDatos(ID: integer);
     procedure CambiaUnidades;
     procedure CambiaDetalle;
     function HayDetalle: boolean;
  end;

var
  ZDMOfertasArtDet : TZDMOfertasArtDet;

implementation

uses UDMMain, UEntorno, UDMArticulos, Mask, UDMOfertas, UUtiles;

{$R *.dfm}

procedure TZDMOfertasArtDet.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMOfertasCab, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDatosTotal, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMOfertasDet, MascaraN, MascaraI, ShortDateFormat);

  QMOfertasCabP_INCR_LACADO_PVP.DisplayFormat := MascaraP;
  xDatosTotalMARGEN.DisplayFormat := MascaraP;
  QMOfertasDetMargen.DisplayFormat := MascaraP;

  CambiaPrecios;
end;

procedure TZDMOfertasArtDet.AbreDatos(ID: integer);
begin
  with QMOfertasCab do
  begin
     Close;
     Params.ByName['ID_DETALLES_S'].AsInteger := ID;
     Open;
  end;

  with QMOfertasDet do
  begin
     Close;
     Params.ByName['ID_DETALLES_S'].AsInteger := ID;
     Open;
  end;

  EstableceCalcLona;
  CambiaUnidades;
end;

procedure TZDMOfertasArtDet.QMOfertasDetTIPO_ARTICULO_TYCGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDatosDetalle.Close;
  xDatosDetalle.Open;

  Text := xDatosDetalleTIPO_ARTICULO_TYC.AsString;
end;

procedure TZDMOfertasArtDet.QMOfertasDetDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDatosDetalle.Close;
  xDatosDetalle.Open;

  Text := xDatosDetalleTITULO_DET.AsString;
end;

procedure TZDMOfertasArtDet.QMOfertasDetPCosteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDatosDetalle.Close;
  xDatosDetalle.Open;

  Text := FormatFloat(MascaraN, xDatosDetalleP_COSTE.AsFloat);
end;

procedure TZDMOfertasArtDet.QMOfertasDetPVentaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDatosDetalle.Close;
  xDatosDetalle.Open;

  Text := FormatFloat(MascaraN, xDatosDetalleP_VENTA.AsFloat);
end;

procedure TZDMOfertasArtDet.QMOfertasDetMargenGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDatosDetalle.Close;
  xDatosDetalle.Open;

  Text := FormatFloat(MascaraP, xDatosDetalleMARGEN.AsFloat);
end;

procedure TZDMOfertasArtDet.QMOfertasDetNewRecord(DataSet: TDataSet);
begin
  if (QMOfertasCab.State = dsEdit) then
  begin
     QMOfertasCab.Post;
     QMOfertasDet.Edit;
  end;
  QMOfertasDetID_DETALLES_S.AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
  QMOfertasDetUNIDADES.AsFloat := 1;
end;

procedure TZDMOfertasArtDet.CambiaPrecios;
begin
  xDatosTotal.Close;
  xDatosTotal.Open;

  CambiaUnidades;
end;

procedure TZDMOfertasArtDet.xDatosDetalleBeforeOpen(DataSet: TDataSet);
begin
  xDatosDetalle.Params.ByName['EMPRESA'].AsInteger := DMOfertas.QMCabeceraEMPRESA.AsInteger;
  xDatosDetalle.Params.ByName['ARTICULO'].AsString := DMOfertas.QMDetalleARTICULO.AsString;
  xDatosDetalle.Params.ByName['LONA'].AsString := xLonaDetARTICULO.AsString;
  xDatosDetalle.Params.ByName['TARIFA'].AsString := DMOfertas.QMCabeceraTARIFA.AsString;
  xDatosDetalle.Params.ByName['DETALLE'].AsString := QMOfertasDetDETALLE.AsString;
  xDatosDetalle.Params.ByName['ID_DETALLES_S'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
end;

procedure TZDMOfertasArtDet.xDatosTotalBeforeOpen(DataSet: TDataSet);
begin
  xDatosTotal.Params.ByName['EMPRESA'].AsInteger := DMOfertas.QMCabeceraEMPRESA.AsInteger;
  xDatosTotal.Params.ByName['ARTICULO'].AsString := DMOfertas.QMDetalleARTICULO.AsString;
  xDatosTotal.Params.ByName['TARIFA'].AsString := DMOfertas.QMCabeceraTARIFA.AsString;
  xDatosTotal.Params.ByName['ID_DETALLES_S'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
end;

procedure TZDMOfertasArtDet.QMOfertasCabLACADOChange(Sender: TField);
begin
  xLacado.Close;
  xLacado.Open;

  QMOfertasCabP_INCR_LACADO_PVP.AsFloat := xLacadoINCREMENTO_PVP.AsFloat;
end;

procedure TZDMOfertasArtDet.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;

  QMOfertasDet.Close;
  QMOfertasDet.Open;

  CambiaDetalle;
end;

procedure TZDMOfertasArtDet.QMOfertasDetAfterPost(DataSet: TDataSet);
begin
  GrabaDetalle(DataSet);
  CambiaPrecios;
  CambiaDetalle;
end;

procedure TZDMOfertasArtDet.QMOfertasDetAfterScroll(DataSet: TDataSet);
begin
  // CambiaPrecios;
  CambiaDetalle;
end;

procedure TZDMOfertasArtDet.CambiaDetalle;
{
var
  Titulo : string;
  }
begin
  { Esto no hace nada util. Se comenta.
  xArticulo.Close;
  xArticulo.Open;

  if (xArticuloTIPO_ARTICULO_TYC.AsString = 'T') then
  begin
     xLonaDet.Close;
     xLonaDet.Open;

     xLacado.Close;
     xLacado.Open;

     Titulo := xArticuloTITULO_ART.AsString + ' ' + xLacadoDESCRIPCION.AsString +
        ' ' + xLonaDetTITULO.AsString +
        ' ' + QMOfertasCabLINEAL.AsString + 'x' + QMOfertasCabSALIDA.AsString;

     // DMOfertas.QMDetalleTITULO.AsString := Copy(Titulo , 1, 60);
  end
  else if (xArticuloTIPO_ARTICULO_TYC.AsString = 'A') then
  begin
     xLacado.Close;
     xLacado.Open;

     Titulo := xArticuloTITULO_ART.AsString + ' ' + xLacadoDESCRIPCION.AsString +
        ' ' + QMOfertasCabLINEAL.AsString + 'x' + QMOfertasCabSALIDA.AsString;

     // DMOfertas.QMDetalleTITULO.AsString := Copy(Titulo , 1, 60);
  end
  else if (xArticuloTIPO_ARTICULO_TYC.AsString = 'L') then
  begin
     xLonaDet.Close;
     xLonaDet.Open;

     Titulo := xArticuloTITULO_ART.AsString + ' ' +
        QMOfertasCabLINEAL.AsString + 'x' + QMOfertasCabSALIDA.AsString;

     // DMOfertas.QMDetalleTITULO.AsString := Copy(Titulo , 1, 60);
  end;
  }
end;

procedure TZDMOfertasArtDet.QMOfertasCabLINEALChange(Sender: TField);
begin
  CambiaUnidades;
end;

procedure TZDMOfertasArtDet.QMOfertasCabSALIDAChange(Sender: TField);
begin
  CambiaUnidades;
end;

procedure TZDMOfertasArtDet.QMOfertasCabUNIDADES_LONAChange(Sender: TField);
begin
  CambiaUnidades;
end;

procedure TZDMOfertasArtDet.CambiaUnidades;
begin
  if (CalcLona) then
  begin
     if (xArticuloTIPO_ARTICULO_TYC.AsString = 'T') then
     begin
        xLineaCalc.Close;
        xLineaCalc.Params.ByName['MODELO'].AsString := QMOfertasCabMODELO.AsString;
        xLineaCalc.Params.ByName['LINEA'].AsInteger := QMOfertasCabLINEAL.AsInteger;
        xLineaCalc.Open;

        xSalidaCalc.Close;
        xSalidaCalc.Params.ByName['MODELO'].AsString := QMOfertasCabMODELO.AsString;
        xSalidaCalc.Params.ByName['LINEA'].AsInteger := xLineaCalcLINEA.AsInteger;
        xSalidaCalc.Params.ByName['SALIDA'].AsInteger := QMOfertasCabSALIDA.AsInteger;
        xSalidaCalc.Open;

        xLonaM2.Close;
        xLonaM2.SelectSQL.Text := 'select total_m2_lona from z_dame_calculo_lona (?modelo, ?linea, ?salida, ?tipo_lona, 0)';
        xLonaM2.Params.ByName['MODELO'].AsString := QMOfertasCabMODELO.AsString;
        xLonaM2.Params.ByName['LINEA'].AsInteger := xLineaCalcLINEA.AsInteger;
        xLonaM2.Params.ByName['SALIDA'].AsInteger := xSalidaCalcSALIDA.AsInteger;
        xLonaM2.Params.ByName['TIPO_LONA'].AsString := xLonaDetZ_LON_TIPO.AsString;
        xLonaM2.Open;
     end
     else if (xArticuloTIPO_ARTICULO_TYC.AsString = 'L') then
     begin
        xLonaM2.Close;
        xLonaM2.SelectSQL.Text := 'select total_m2_lona from z_dame_calculo_lona_simple (?modelo, ?linea, ?salida, ?id_lona)';
        xLonaM2.Params.ByName['MODELO'].AsString := QMOfertasCabMODELO.AsString;
        xLonaM2.Params.ByName['LINEA'].AsInteger := QMOfertasCabLINEAL.AsInteger;
        xLonaM2.Params.ByName['SALIDA'].AsInteger := QMOfertasCabSALIDA.AsInteger;
        xLonaM2.Params.ByName['ID_LONA'].AsInteger := xLonaDetID_A.AsInteger;
        xLonaM2.Open;
     end;
  end;
end;

procedure TZDMOfertasArtDet.GrabaDetalle(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TZDMOfertasArtDet.EstableceCalcLona;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO_ARTICULO_TYC FROM ART_ARTICULOS WHERE ID_A = ?ID_A';
        Params.ByName['ID_A'].AsInteger := DMOfertas.QMDetalleID_A.AsInteger;
        ExecQuery;
        CalcLona := ((FieldByName['TIPO_ARTICULO_TYC'].AsString = 'L') or (FieldByName['TIPO_ARTICULO_TYC'].AsString = 'T'));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMOfertasArtDet.HayDetalle: boolean;
begin
  Result := (QMOfertasDet.FieldByName('ID_DETALLES_S').AsInteger <> 0);
end;

procedure TZDMOfertasArtDet.QMOfertasDetDETALLEChange(Sender: TField);
begin
  with xEscandallo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['DETALLE'].AsString := QMOfertasDetDETALLE.AsString;
     Open;
  end;

  QMOfertasDetESCANDALLO.AsInteger := xEscandalloESCANDALLO.AsInteger;
end;

procedure TZDMOfertasArtDet.QMOfertasDetBeforePost(DataSet: TDataSet);
begin
  ControlaDisponibilidad;
end;

procedure TZDMOfertasArtDet.ControlaDisponibilidad;
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
        SQL.Add(' ARTICULO = ?DETALLE ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['DETALLE'].AsString := QMOfertasDetDETALLE.AsString;
        ExecQuery;

        if ((FieldByName['DISPONIBILIDAD'].AsInteger = 0) or (FieldByName['DISPONIBILIDAD'].AsInteger = 3)) then
        begin
           Application.MessageBox(PChar(string(_('Artículo no disponible para su venta'))), PChar(string(_('Error'))), mb_iconstop);   //IDIOMA_CODE

           QMOfertasDet.Cancel;
        end;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
