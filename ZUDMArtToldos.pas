unit ZUDMArtToldos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, UDMArticulos;

type
  TZDMArtToldos = class(TDataModule)
     TLocal: THYTransaction;
     QMToldos: TFIBTableSet;
     QMToldosDet: TFIBTableSet;
     xDatosDetalle: TFIBDataSetRO;
     DSQMToldos: TDataSource;
     DSQMToldosDet: TDataSource;
     DSxDatosDetalle: TDataSource;
     QMToldosTARIFA: TFIBStringField;
     QMToldosMOTOR: TIntegerField;
     QMToldosDetEMPRESA: TIntegerField;
     QMToldosDetARTICULO: TFIBStringField;
     QMToldosDetTARIFA: TFIBStringField;
     QMToldosDetDETALLE: TFIBStringField;
     QMToldosDetID_A: TIntegerField;
     QMToldosDetID_A_DET: TIntegerField;
     QMToldosDetTipoArt: TStringField;
     QMToldosDetDescArt: TStringField;
     QMToldosEMPRESA: TIntegerField;
     QMToldosARTICULO: TFIBStringField;
     QMToldosID_A: TIntegerField;
     QMToldosLONA: TFIBStringField;
     QMToldosDetESCANDALLO_DEF: TIntegerField;
     QMToldosDetPCoste: TFloatField;
     QMToldosDetPVenta: TFloatField;
     QMToldosDetMargen: TFloatField;
     xDatosDetalleP_COSTE: TFloatField;
     xDatosDetalleP_VENTA: TFloatField;
     xDatosDetalleMARGEN: TFloatField;
     xDatosDetalleTITULO_DET: TFIBStringField;
     xDatosDetalleTIPO_ARTICULO_TYC: TFIBStringField;
     xDatosToldo: TFIBDataSetRO;
     DSxDatosToldo: TDataSource;
     xDatosToldoP_COSTE: TFloatField;
     xDatosToldoP_VENTA: TFloatField;
     xDatosToldoMARGEN: TFloatField;
     QMToldosID_A_LONA: TIntegerField;
     QMToldosARMAZON: TFIBStringField;
     QMToldosID_A_ARMAZON: TIntegerField;
     QMToldosDetLONA: TFIBStringField;
     xDatosArmazon: TFIBDataSetRO;
     DSxDatosArmazon: TDataSource;
     xDatosLona: TFIBDataSetRO;
     DSxDatosLona: TDataSource;
     xDatosArmazonP_COSTE: TFloatField;
     xDatosArmazonP_VENTA: TFloatField;
     xDatosArmazonMARGEN: TFloatField;
     xDatosLonaP_COSTE: TFloatField;
     xDatosLonaP_VENTA: TFloatField;
     xDatosLonaMARGEN: TFloatField;
     QMToldosDEFECTO: TIntegerField;
     QMToldosDetVALORAR: TIntegerField;
     QMToldosPCosteToldo: TFloatField;
     QMToldosPVentaToldo: TFloatField;
     QMToldosMargenToldo: TFloatField;
     QMToldosPCosteLona: TFloatField;
     QMToldosPVentaLona: TFloatField;
     QMToldosMargenLona: TFloatField;
     xTipoLona: TFIBDataSetRO;
     DSxTipoLona: TDataSource;
     xCalcLona: TFIBDataSetRO;
     DSxCalcLona: TDataSource;
     xTipoLonaZ_LON_TIPO: TFIBStringField;
     xCalcLonaDESC_TIPO_LONA: TFIBStringField;
     xCalcLonaMULTIPLO: TIntegerField;
     xCalcLonaTOTAL_LINEA: TIntegerField;
     xCalcLonaTOTAL_SALIDA: TIntegerField;
     xCalcLonaTOTAL_M2_LONA: TFloatField;
     xTipoArmazon: TFIBDataSetRO;
     DSxTipoArmazon: TDataSource;
     xTipoArmazonMODELO: TFIBStringField;
     xTipoArmazonLINEA: TIntegerField;
     xTipoArmazonSALIDA: TIntegerField;
     QMToldosMultiploLona: TSmallintField;
     QMToldosTotalLinea: TSmallintField;
     QMToldosTotalSalida: TSmallintField;
     QMToldosM2_Lona: TFloatField;
     QMToldosINCR_LACADO_PVP: TIntegerField;
     QMToldosP_INCR_LACADO_PVP: TFloatField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMToldosDetTipoArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosDetDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosDetPCosteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosDetPVentaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosDetMargenGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosAfterOpen(DataSet: TDataSet);
     procedure QMToldosNewRecord(DataSet: TDataSet);
     procedure QMToldosDetNewRecord(DataSet: TDataSet);
     procedure QMToldosDetAfterPost(DataSet: TDataSet);
     procedure QMToldosDetAfterScroll(DataSet: TDataSet);
     procedure QMToldosPCosteToldoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosPVentaToldoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosMargenToldoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosPCosteLonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosPVentaLonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosMargenLonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosMultiploLonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosTotalLineaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosTotalSalidaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosM2_LonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMToldosDetAfterOpen(DataSet: TDataSet);
     procedure QMToldosDetBeforeClose(DataSet: TDataSet);
     procedure QMToldosBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     DM: TDMArticulos;
  public
     { Public declarations }
     VerIncr: boolean;
     procedure AbreDatos(aDM: TDataModule; Articulo: string);
     function HayDetalle: boolean;
  end;

var
  ZDMArtToldos : TZDMArtToldos;

implementation

uses UDMMain, UEntorno, ZUFMArtToldos, UUtiles;

{$R *.dfm}

procedure TZDMArtToldos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMToldos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDatosArmazon, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDatosLona, MascaraN, MascaraI, ShortDateFormat);

  QMToldosP_INCR_LACADO_PVP.DisplayFormat := MascaraP;
  xDatosToldoMARGEN.DisplayFormat := MascaraP;
  xDatosArmazonMARGEN.DisplayFormat := MascaraP;
  xDatosLonaMARGEN.DisplayFormat := MascaraP;
end;

procedure TZDMArtToldos.AbreDatos(aDM: TDataModule; Articulo: string);
begin
  DM := TDMArticulos(aDM);

  with QMToldos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

procedure TZDMArtToldos.QMToldosDetTipoArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosDetalle.Close;
  xDatosDetalle.Open;
  }
  Text := xDatosDetalleTIPO_ARTICULO_TYC.AsString;
end;

procedure TZDMArtToldos.QMToldosDetDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosDetalle.Close;
  xDatosDetalle.Open;
  }
  Text := xDatosDetalleTITULO_DET.AsString;
end;

procedure TZDMArtToldos.QMToldosDetPCosteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosDetalle.Close;
  xDatosDetalle.Open;
  }
  Text := FormatFloat(MascaraN, xDatosDetalleP_COSTE.AsFloat);
end;

procedure TZDMArtToldos.QMToldosDetPVentaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosDetalle.Close;
  xDatosDetalle.Open;
  }
  Text := FormatFloat(MascaraN, xDatosDetalleP_VENTA.AsFloat);
end;

procedure TZDMArtToldos.QMToldosDetMargenGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosDetalle.Close;
  xDatosDetalle.Open;
  }
  Text := FormatFloat(MascaraP, xDatosDetalleMARGEN.AsFloat);
end;

procedure TZDMArtToldos.QMToldosAfterOpen(DataSet: TDataSet);
begin
  QMToldosDet.Open;
  xDatosArmazon.Open;
  xDatosLona.Open;
  xDatosToldo.Open;
  xTipoLona.Open;
  xTipoArmazon.Open;
end;

procedure TZDMArtToldos.QMToldosBeforeClose(DataSet: TDataSet);
begin
  QMToldosDet.Close;
  xDatosArmazon.Close;
  xDatosLona.Close;
  xDatosToldo.Close;
  xTipoLona.Close;
  xTipoArmazon.Close;
end;

procedure TZDMArtToldos.QMToldosNewRecord(DataSet: TDataSet);
begin
  QMToldosEMPRESA.AsInteger := DM.QMArticulosEMPRESA.AsInteger;
  QMToldosARTICULO.AsString := DM.QMArticulosARTICULO.AsString;
  QMToldosARMAZON.AsString := DM.QMArticulosZ_ARMAZON.AsString;
end;

procedure TZDMArtToldos.QMToldosDetNewRecord(DataSet: TDataSet);
begin
  QMToldosDetEMPRESA.AsInteger := QMToldosEMPRESA.AsInteger;
  QMToldosDetARTICULO.AsString := QMToldosARTICULO.AsString;
  QMToldosDetID_A.AsString := QMToldosID_A.AsString;
  QMToldosDetLONA.AsString := QMToldosLONA.AsString;
  QMToldosDetTARIFA.AsString := QMToldosTARIFA.AsString;
end;

procedure TZDMArtToldos.QMToldosDetAfterPost(DataSet: TDataSet);
begin
  QMToldos.Refresh;

  xDatosToldo.Close;
  xDatosToldo.Open;
end;

procedure TZDMArtToldos.QMToldosDetAfterScroll(DataSet: TDataSet);
begin
  {
  xDatosToldo.Close;
  xDatosToldo.Open;
  }
end;

procedure TZDMArtToldos.QMToldosPCosteToldoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosToldo.Close;
  xDatosToldo.Open;
  }
  Text := FormatFloat(MascaraN, xDatosToldoP_COSTE.AsFloat);
end;

procedure TZDMArtToldos.QMToldosPVentaToldoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosToldo.Close;
  xDatosToldo.Open;
  }
  Text := FormatFloat(MascaraN, xDatosToldoP_VENTA.AsFloat);
end;

procedure TZDMArtToldos.QMToldosMargenToldoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosToldo.Close;
  xDatosToldo.Open;
  }
  Text := FormatFloat(MascaraP, xDatosToldoMARGEN.AsFloat);
end;

procedure TZDMArtToldos.QMToldosPCosteLonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosLona.Close;
  xDatosLona.Open;
  }
  Text := FormatFloat(MascaraN, xDatosLonaP_COSTE.AsFloat);
end;

procedure TZDMArtToldos.QMToldosPVentaLonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosLona.Close;
  xDatosLona.Open;
  }
  Text := FormatFloat(MascaraN, xDatosLonaP_VENTA.AsFloat);
end;

procedure TZDMArtToldos.QMToldosMargenLonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xDatosLona.Close;
  xDatosLona.Open;
  }
  Text := FormatFloat(MascaraP, xDatosLonaMARGEN.AsFloat);
end;

procedure TZDMArtToldos.QMToldosMultiploLonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xTipoArmazon.Close;
  xTipoArmazon.Open;
  xTipoLona.Close;
  xTipoLona.Open;
  }
  with xCalcLona do
  begin
     Close;
     Params.ByName['CODIGO'].AsString := xTipoArmazonMODELO.AsString;
     Params.ByName['LINEA'].AsInteger := xTipoArmazonLINEA.AsInteger;
     Params.ByName['SALIDA'].AsInteger := xTipoArmazonSALIDA.AsInteger;
     Params.ByName['LONA_TIPO'].AsString := xTipoLonaZ_LON_TIPO.AsString;
     Open;
  end;

  Text := xCalcLonaMULTIPLO.AsString;
end;

procedure TZDMArtToldos.QMToldosTotalLineaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xTipoArmazon.Close;
  xTipoArmazon.Open;
  xTipoLona.Close;
  xTipoLona.Open;
  }
  with xCalcLona do
  begin
     Close;
     Params.ByName['CODIGO'].AsString := xTipoArmazonMODELO.AsString;
     Params.ByName['LINEA'].AsInteger := xTipoArmazonLINEA.AsInteger;
     Params.ByName['SALIDA'].AsInteger := xTipoArmazonSALIDA.AsInteger;
     Params.ByName['LONA_TIPO'].AsString := xTipoLonaZ_LON_TIPO.AsString;
     Open;
  end;

  Text := xCalcLonaTOTAL_LINEA.AsString;
end;

procedure TZDMArtToldos.QMToldosTotalSalidaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xTipoArmazon.Close;
  xTipoArmazon.Open;
  xTipoLona.Close;
  xTipoLona.Open;
  }
  with xCalcLona do
  begin
     Close;
     Params.ByName['CODIGO'].AsString := xTipoArmazonMODELO.AsString;
     Params.ByName['LINEA'].AsInteger := xTipoArmazonLINEA.AsInteger;
     Params.ByName['SALIDA'].AsInteger := xTipoArmazonSALIDA.AsInteger;
     Params.ByName['LONA_TIPO'].AsString := xTipoLonaZ_LON_TIPO.AsString;
     Open;
  end;

  Text := xCalcLonaTOTAL_SALIDA.AsString;
end;

procedure TZDMArtToldos.QMToldosM2_LonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {
  xTipoArmazon.Close;
  xTipoArmazon.Open;
  xTipoLona.Close;
  xTipoLona.Open;
  }
  with xCalcLona do
  begin
     Close;
     Params.ByName['CODIGO'].AsString := xTipoArmazonMODELO.AsString;
     Params.ByName['LINEA'].AsInteger := xTipoArmazonLINEA.AsInteger;
     Params.ByName['SALIDA'].AsInteger := xTipoArmazonSALIDA.AsInteger;
     Params.ByName['LONA_TIPO'].AsString := xTipoLonaZ_LON_TIPO.AsString;
     Open;
  end;

  Text := FormatFloat(MascaraN, xCalcLonaTOTAL_M2_LONA.AsFloat);
end;

procedure TZDMArtToldos.QMToldosDetAfterOpen(DataSet: TDataSet);
begin
  xDatosToldo.Open;
  xDatosDetalle.Open;
end;

procedure TZDMArtToldos.QMToldosDetBeforeClose(DataSet: TDataSet);
begin
  xDatosToldo.Close;
  xDatosDetalle.Close;
end;

function TZDMArtToldos.HayDetalle: boolean;
begin
  Result := (QMToldosDet.FieldByName('ID_A').AsInteger <> 0);
end;

end.
