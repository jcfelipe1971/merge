unit UDMProrrateoCostes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery;

type
  TDMProrrateoCostes = class(TDataModule)
     xProrrateo: TFIBTableSet;
     xProrrateoEMPRESA: TIntegerField;
     xProrrateoEJERCICIO: TIntegerField;
     xProrrateoCANAL: TIntegerField;
     xProrrateoPRORRATEO: TIntegerField;
     xProrrateoIMPORTE_PRORRATEO: TFloatField;
     xProrrateoRAZON: TFIBStringField;
     DSxProrrateo: TDataSource;
     xProrrateoAlbaranes: TFIBTableSet;
     xProrrateoAlbaranesEMPRESA: TIntegerField;
     xProrrateoAlbaranesEJERCICIO: TIntegerField;
     xProrrateoAlbaranesCANAL: TIntegerField;
     xProrrateoAlbaranesPRORRATEO: TIntegerField;
     xProrrateoAlbaranesEMPRESA_ORI: TIntegerField;
     xProrrateoAlbaranesEJERCICIO_ORI: TIntegerField;
     xProrrateoAlbaranesCANAL_ORI: TIntegerField;
     xProrrateoAlbaranesSERIE_ORI: TFIBStringField;
     xProrrateoAlbaranesTIPO_ORI: TFIBStringField;
     xProrrateoAlbaranesRIG_ORI: TIntegerField;
     xProrrateoAlbaranesFECHA_ORI: TDateTimeField;
     DSxProrrateoAlbaranes: TDataSource;
     xProrrateoLineas: TFIBTableSet;
     DSxProrrateoLineas: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xProrrateoLineasAlb: TFIBTableSet;
     DSxProrrateoLineasAlb: TDataSource;
     xProrrateoLineasAlbEMPRESA: TIntegerField;
     xProrrateoLineasAlbEJERCICIO: TIntegerField;
     xProrrateoLineasAlbCANAL: TIntegerField;
     xProrrateoLineasAlbSERIE: TFIBStringField;
     xProrrateoLineasAlbTIPO: TFIBStringField;
     xProrrateoLineasAlbRIG: TIntegerField;
     xProrrateoLineasAlbPRORRATEO: TIntegerField;
     xProrrateoLineasAlbLINEA: TIntegerField;
     xProrrateoLineasAlbARTICULO: TFIBStringField;
     xProrrateoLineasAlbP_COSTE: TFloatField;
     xProrrateoLineasAlbP_COSTE_PRORRATEO: TFloatField;
     xProrrateoLineasAlbFECHA_ORI: TDateTimeField;
     xProrrateoLineasAlbUNIDADES: TFloatField;
     xProrrateoLineasAlbID_E: TIntegerField;
     xProrrateoLineasAlbID_DETALLES_E: TIntegerField;
     xProrrateoLineasEMPRESA: TIntegerField;
     xProrrateoLineasEJERCICIO: TIntegerField;
     xProrrateoLineasCANAL: TIntegerField;
     xProrrateoLineasPRORRATEO: TIntegerField;
     xProrrateoLineasARTICULO: TFIBStringField;
     xProrrateoLineasP_COSTE: TFloatField;
     xProrrateoLineasP_COSTE_PRORRATEO: TFloatField;
     xProrrateoLineasEMPRESA_ORI: TIntegerField;
     xProrrateoLineasEJERCICIO_ORI: TIntegerField;
     xProrrateoLineasCANAL_ORI: TIntegerField;
     xProrrateoLineasSERIE_ORI: TFIBStringField;
     xProrrateoLineasTIPO_ORI: TFIBStringField;
     xProrrateoLineasRIG_ORI: TIntegerField;
     xProrrateoLineasLINEA_ORI: TIntegerField;
     xProrrateoLineasFECHA_ORI: TDateTimeField;
     xProrrateoLineasID_E_ORI: TIntegerField;
     xProrrateoLineasID_DETALLES_E_ORI: TIntegerField;
     xProrrateoLineasUNIDADES: TFloatField;
     xProrrateoDocOrigen: TFIBTableSet;
     DSxProrrateoDocOrigen: TDataSource;
     xProrrateoDocOrigenEMPRESA: TIntegerField;
     xProrrateoDocOrigenEJERCICIO: TIntegerField;
     xProrrateoDocOrigenCANAL: TIntegerField;
     xProrrateoDocOrigenPRORRATEO: TIntegerField;
     xProrrateoDocOrigenEMPRESA_ORI: TIntegerField;
     xProrrateoDocOrigenEJERCICIO_ORI: TIntegerField;
     xProrrateoDocOrigenCANAL_ORI: TIntegerField;
     xProrrateoDocOrigenSERIE_ORI: TFIBStringField;
     xProrrateoDocOrigenTIPO_ORI: TFIBStringField;
     xProrrateoDocOrigenRIG_ORI: TIntegerField;
     xProrrateoDocOrigenID_E_ORI: TIntegerField;
     xProrrateoDocOrigenIMPORTE_PRORRATEO: TFloatField;
     xProrrateoDocOrigenLIQUIDO: TFloatField;
     xProrrateoDocOrigenTITULO: TFIBStringField;
     xProrrateoDocOrigenNUM_FACTURA: TFIBStringField;
     xProrrateoAlbaranesID_E_ORI: TIntegerField;
     xProrrateoFECHA: TDateTimeField;
     xProrrateoIMPORTE_PREVISTO: TFloatField;
     xProrrateoAlbaranesMONEDA: TFIBStringField;
     xProrrateoAlbaranesPROVEEDOR: TIntegerField;
     xProrrateoDocOrigenLIQUIDO_MONEDA_EMPRESA: TFloatField;
     xProrrateoDocOrigenMONEDA: TFIBStringField;
     xProrrateoAlbaranesNOMBRE_R_SOCIAL: TFIBStringField;
     xProrrateoLineasP_COSTE_UNIT_PRORRATEO: TFloatField;
     xProrrateoLineasP_COSTE_UNIT: TFloatField;
     procedure xProrrateoNewRecord(DataSet: TDataSet);
     procedure xProrrateoBeforePost(DataSet: TDataSet);
     procedure xProrrateoAfterPost(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure xProrrateoAlbaranesNewRecord(DataSet: TDataSet);
     procedure xProrrateoAfterOpen(DataSet: TDataSet);
     procedure xProrrateoBeforeClose(DataSet: TDataSet);
     procedure xProrrateoAlbaranesAfterOpen(DataSet: TDataSet);
     procedure xProrrateoAlbaranesBeforeClose(DataSet: TDataSet);
     procedure xProrrateoDocOrigenNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AsingaImporte;
     procedure LineasTodosAlbaranes(Todas: boolean);
     function DameProvedoorTercero(TipoDoc: string; ID_E: integer): integer;
  end;

var
  DMProrrateoCostes : TDMProrrateoCostes;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMProrrateoCostes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AsignaDisplayFormat(xProrrateo, MascaraN, MascaraI, ShortDateFormat);
  xProrrateoIMPORTE_PRORRATEO.DisplayFormat := MascaraE;
  xProrrateoIMPORTE_PREVISTO.DisplayFormat := MascaraE;

  AsignaDisplayFormat(xProrrateoAlbaranes, MascaraN, MascaraI, ShortDateFormat);

  AsignaDisplayFormat(xProrrateoLineas, MascaraN, MascaraI, ShortDateFormat);
  xProrrateoLineasUNIDADES.DisplayFormat := MascaraI;

  AsignaDisplayFormat(xProrrateoLineasAlb, MascaraN, MascaraI, ShortDateFormat);
  xProrrateoLineasAlbUNIDADES.DisplayFormat := MascaraI;

  AsignaDisplayFormat(xProrrateoDocOrigen, MascaraN, MascaraI, ShortDateFormat);

  xProrrateoFECHA.DisplayFormat := ShortDateFormat + ' hh:nn';

  with xProrrateo do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;

     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMProrrateoCostes.xProrrateoNewRecord(DataSet: TDataSet);
begin
  xProrrateoEMPRESA.AsInteger := REntorno.Empresa;
  xProrrateoEJERCICIO.AsInteger := REntorno.Ejercicio;
  xProrrateoCANAL.AsInteger := REntorno.Canal;
  xProrrateoIMPORTE_PRORRATEO.AsFloat := 0;
  xProrrateoIMPORTE_PREVISTO.AsFloat := 0;
  xProrrateoRAZON.AsString := '';
  xProrrateoFECHA.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMProrrateoCostes.xProrrateoBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     xProrrateoPRORRATEO.AsInteger := DMMain.Contador_EEC('PRR');
end;

procedure TDMProrrateoCostes.xProrrateoAfterPost(DataSet: TDataSet);
begin
  // Refresco datos manteniendo posicion
  Refrescar(xProrrateo, 'PRORRATEO', xProrrateoPRORRATEO.AsInteger, False, True);
end;

procedure TDMProrrateoCostes.xProrrateoAlbaranesNewRecord(DataSet: TDataSet);
begin
  if ((xProrrateo.State = dsInsert) or (xProrrateo.State = dsEdit)) then
     xProrrateo.Post;
  xProrrateoAlbaranesEMPRESA.AsInteger := xProrrateoEMPRESA.AsInteger;
  xProrrateoAlbaranesEJERCICIO.AsInteger := xProrrateoEJERCICIO.AsInteger;
  xProrrateoAlbaranesCANAL.AsInteger := xProrrateoCANAL.AsInteger;
  xProrrateoAlbaranesPRORRATEO.AsInteger := xProrrateoPRORRATEO.AsInteger;
  xProrrateoAlbaranesEMPRESA_ORI.AsInteger := xProrrateoEMPRESA.AsInteger;
  xProrrateoAlbaranesEJERCICIO_ORI.AsInteger := xProrrateoEJERCICIO.AsInteger;
  xProrrateoAlbaranesCANAL_ORI.AsInteger := xProrrateoCANAL.AsInteger;
  xProrrateoAlbaranesTIPO_ORI.AsString := 'ALP';
  xProrrateoAlbaranesFECHA_ORI.AsDateTime := Now; {El trigger lo rellena}
end;

procedure TDMProrrateoCostes.xProrrateoAfterOpen(DataSet: TDataSet);
begin
  xProrrateoAlbaranes.Open;
  xProrrateoDocOrigen.Open;
end;

procedure TDMProrrateoCostes.xProrrateoBeforeClose(DataSet: TDataSet);
begin
  xProrrateoAlbaranes.Close;
  xProrrateoDocOrigen.Close;
end;

procedure TDMProrrateoCostes.xProrrateoAlbaranesAfterOpen(DataSet: TDataSet);
begin
  xProrrateoLineas.Open;
  xProrrateoLineasAlb.Open;
end;

procedure TDMProrrateoCostes.xProrrateoAlbaranesBeforeClose(DataSet: TDataSet);
begin
  xProrrateoLineas.Close;
  xProrrateoLineasAlb.Close;
end;

procedure TDMProrrateoCostes.xProrrateoDocOrigenNewRecord(DataSet: TDataSet);
begin
  //Iniciamos valores
  xProrrateoDocOrigenEMPRESA.AsInteger := xProrrateoEMPRESA.AsInteger;
  xProrrateoDocOrigenEJERCICIO.AsInteger := xProrrateoEJERCICIO.AsInteger;
  xProrrateoDocOrigenCANAL.AsInteger := xProrrateoCANAL.AsInteger;
  xProrrateoDocOrigenPRORRATEO.AsInteger := xProrrateoPRORRATEO.AsInteger;
  xProrrateoDocOrigenEMPRESA_ORI.AsInteger := xProrrateoEMPRESA.AsInteger;
  xProrrateoDocOrigenEJERCICIO_ORI.AsInteger := xProrrateoEJERCICIO.AsInteger;
  xProrrateoDocOrigenCANAL_ORI.AsInteger := xProrrateoCANAL.AsInteger;
  xProrrateoDocOrigenSERIE_ORI.AsString := '';
  xProrrateoDocOrigenTIPO_ORI.AsString := '';
  xProrrateoDocOrigenRIG_ORI.AsInteger := 0;
  xProrrateoDocOrigenID_E_ORI.AsInteger := 0;
  xProrrateoDocOrigenIMPORTE_PRORRATEO.AsFloat := 0;
  xProrrateoIMPORTE_PREVISTO.AsFloat := 0;
  xProrrateoFECHA.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMProrrateoCostes.AsingaImporte;
var
  Importe : double;
begin
  if (xProrrateoDocOrigen.State <> dsBrowse) then
     xProrrateoDocOrigen.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(IMPORTE_PRORRATEO) AS IMPORTE ');
        SQL.Add(' FROM GES_CABECERAS_E_PROR_ORI ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' PRORRATEO = :PRORRATEO ');
        Params.ByName['EMPRESA'].AsInteger := xProrrateoEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xProrrateoEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xProrrateoCANAL.AsInteger;
        Params.ByName['PRORRATEO'].AsInteger := xProrrateoPRORRATEO.AsInteger;
        ExecQuery;
        Importe := FieldByName['IMPORTE'].AsFloat;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xProrrateo.Edit;
  xProrrateoIMPORTE_PRORRATEO.AsFloat := Importe;
  xProrrateo.Post;
  xProrrateo.Refresh;
end;

procedure TDMProrrateoCostes.LineasTodosAlbaranes(Todas: boolean);
begin
  with xProrrateoLineas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT P.*, M.PRECIO P_COSTE_UNIT, M.PRECIO P_COSTE_UNIT_PRORRATEO FROM GES_DETALLES_E_PROR_ALB P ');
     SelectSQL.Add(' JOIN GES_DETALLES_E D ON P.ID_DETALLES_E_ORI = D.ID_DETALLES_E ');
     SelectSQL.Add(' JOIN ART_MOV_STOCKS M ON D.ID_MOV_STOCKS = M.ID_MOV_STOCKS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' P.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' P.EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' P.CANAL = :CANAL AND ');
     SelectSQL.Add(' P.PRORRATEO = :PRORRATEO ');
     if (not Todas) then
     begin
        SelectSQL.Add(' AND ');
        SelectSQL.Add(' P.EMPRESA_ORI = :EMPRESA_ORI AND ');
        SelectSQL.Add(' P.EJERCICIO_ORI = :EJERCICIO_ORI AND ');
        SelectSQL.Add(' P.CANAL_ORI = :CANAL_ORI AND ');
        SelectSQL.Add(' P.SERIE_ORI = :SERIE_ORI AND ');
        SelectSQL.Add(' P.TIPO_ORI = :TIPO_ORI AND ');
        SelectSQL.Add(' P.RIG_ORI = :RIG_ORI ');
     end;

     RefreshSQL.Text := SelectSQL.Text;
     if (not Todas) then
        RefreshSQL.Add(' AND P.LINEA_ORI = :LINEA_ORI ');

     SelectSQL.Add(' ORDER BY P.EJERCICIO_ORI, P.CANAL_ORI, P.SERIE_ORI, P.TIPO_ORI, P.RIG_ORI, P.LINEA_ORI ');
     Open;
  end;
end;

function TDMProrrateoCostes.DameProvedoorTercero(TipoDoc: string; ID_E: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT  ');
        if (TipoDoc = 'FAP') then
           SQL.Add(' PROVEEDOR FROM GES_CABECERAS_E_FAC ');

        if (TipoDoc = 'FCR') then
           SQL.Add(' TERCERO FROM GES_CABECERAS_E_FCR ');

        SQL.Add(' WHERE ');
        SQL.Add(' ID_E = :ID_E_ORI ');

        Params.ByName['ID_E_ORI'].AsInteger := ID_E;
        ExecQuery;
        if (TipoDoc = 'FAP') then
           Result := FieldByName['PROVEEDOR'].AsInteger;

        if (TipoDoc = 'FCR') then
           Result := FieldByName['TERCERO'].AsInteger;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
