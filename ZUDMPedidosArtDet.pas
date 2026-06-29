unit ZUDMPedidosArtDet;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, UComponentesBusquedaFiltrada,
  FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery;

type
  TZDMPedidosArtDet = class(TDataModule)
     TLocal: THYTransaction;
     QMPedidosDet: TFIBTableSet;
     xDatosDetalle: TFIBDataSetRO;
     DSQMPedidosDet: TDataSource;
     DSxDatosDetalle: TDataSource;
     QMPedidosDetDescArt: TStringField;
     QMPedidosDetPCoste: TFloatField;
     QMPedidosDetPVenta: TFloatField;
     QMPedidosDetMARGEN: TFloatField;
     xDatosDetalleP_COSTE: TFloatField;
     xDatosDetalleP_VENTA: TFloatField;
     xDatosDetalleMARGEN: TFloatField;
     xDatosDetalleTITULO_DET: TFIBStringField;
     xDatosDetalleTIPO_ARTICULO_TYC: TFIBStringField;
     xDatosTotal: TFIBDataSetRO;
     DSxDatosTotal: TDataSource;
     QMPedidosDetTIPO_ARTICULO_TYC: TStringField;
     QMPedidosDetID_DETALLES_S: TIntegerField;
     QMPedidosDetDETALLE: TFIBStringField;
     QMPedidosDetESCANDALLO: TIntegerField;
     xDatosTotalP_COSTE: TFloatField;
     xDatosTotalP_VENTA: TFloatField;
     xDatosTotalMARGEN: TFloatField;
     QMPedidosCab: TFIBTableSet;
     DSQMPedidosCab: TDataSource;
     QMPedidosCabID_DETALLES_S: TIntegerField;
     QMPedidosCabLACADO: TFIBStringField;
     QMPedidosCabMOTOR: TIntegerField;
     QMPedidosCabINCR_LACADO_PVP: TIntegerField;
     QMPedidosCabP_INCR_LACADO_PVP: TFloatField;
     xLacado: TFIBDataSetRO;
     QMPedidosCabMODELO: TFIBStringField;
     QMPedidosCabLINEAL: TFloatField;
     QMPedidosCabSALIDA: TFloatField;
     xLonaDet: TFIBDataSetRO;
     xArticulo: TFIBDataSetRO;
     xArticuloARTICULO: TFIBStringField;
     xArticuloTITULO_DET: TFIBStringField;
     xArticuloTITULO_ART: TFIBStringField;
     xArticuloTIPO_ARTICULO_TYC: TFIBStringField;
     xLonaM2: TFIBDataSetRO;
     xLonaM2TOTAL_M2_LONA: TFloatField;
     xLonaDetARTICULO: TFIBStringField;
     xLonaDetTITULO: TFIBStringField;
     xLineaCalc: TFIBDataSetRO;
     xSalidaCalc: TFIBDataSetRO;
     xLineaCalcLINEA: TIntegerField;
     xLacadoDESCRIPCION: TFIBStringField;
     xLacadoINCREMENTO_PVP: TFloatField;
     xSalidaCalcSALIDA: TIntegerField;
     QMPedidosCabUNIDADES_LONA: TFloatField;
     xDatosDetalleFAMILIA: TFIBStringField;
     DSxLonaM2: TDataSource;
     xLonaDetID_A: TIntegerField;
     xLonaDetZ_LON_TIPO: TFIBStringField;
     QMPedidosDetID_A_DET: TIntegerField;
     QMPedidosDetUNIDADES: TFloatField;
     xEscandallo: TFIBDataSetRO;
     xEscandalloESCANDALLO: TIntegerField;
     QMPedidosDetMEDIDA: TFIBStringField;
     QMPedidosCabLINEA_PEDIDO_ASOCIADA: TIntegerField;
     xDatosDetalleSUBTIPO_ARTICULO_TYC: TFIBStringField;
     QMPedidosDetSUBTIPO_ARTICULO_TYC: TStringField;
     xDatosDetalleCOM_CORTE: TIntegerField;
     QMPedidosDetCorte: TSmallintField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPedidosDetNewRecord(DataSet: TDataSet);
     procedure xDatosDetalleBeforeOpen(DataSet: TDataSet);
     procedure xDatosTotalBeforeOpen(DataSet: TDataSet);
     procedure QMPedidosCabLACADOChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMPedidosDetAfterPost(DataSet: TDataSet);
     procedure QMPedidosDetAfterScroll(DataSet: TDataSet);
     procedure QMPedidosCabLINEALChange(Sender: TField);
     procedure QMPedidosCabSALIDAChange(Sender: TField);
     procedure QMPedidosCabUNIDADES_LONAChange(Sender: TField);
     procedure GrabaDetalle(DataSet: TDataSet);
     procedure QMPedidosDetDETALLEChange(Sender: TField);
     procedure QMPedidosDetBeforePost(DataSet: TDataSet);
     procedure QMPedidosCabAfterOpen(DataSet: TDataSet);
     procedure QMPedidosCabBeforeClose(DataSet: TDataSet);
     procedure QMPedidosDetCalcFields(DataSet: TDataSet);
     procedure QMPedidosDetBeforeEdit(DataSet: TDataSet);
     procedure QMPedidosDetBeforeInsert(DataSet: TDataSet);
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
     procedure InformaEscandalloCorte;
     function PuedoCerrar: boolean;
  end;

var
  ZDMPedidosArtDet : TZDMPedidosArtDet;

implementation

uses UDMMain, UEntorno, uUtiles, Mask, UDMPedidos;

{$R *.dfm}

procedure TZDMPedidosArtDet.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMPedidosCab, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDatosTotal, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMPedidosDet, MascaraN, MascaraI, ShortDateFormat);

  QMPedidosCabP_INCR_LACADO_PVP.DisplayFormat := MascaraP;
  xDatosTotalMARGEN.DisplayFormat := MascaraP;
  QMPedidosDetMARGEN.DisplayFormat := MascaraP;

  CambiaPrecios;
end;

procedure TZDMPedidosArtDet.AbreDatos(ID: integer);
begin
  with QMPedidosCab do
  begin
     Close;
     Params.ByName['ID_DETALLES_S'].AsInteger := ID;
     Open;
  end;

  with QMPedidosDet do
  begin
     Close;
     Params.ByName['ID_DETALLES_S'].AsInteger := ID;
     Open;
  end;

  EstableceCalcLona;
  CambiaUnidades;
end;

procedure TZDMPedidosArtDet.QMPedidosDetNewRecord(DataSet: TDataSet);
begin
  if (QMPedidosCab.State = dsEdit) then
  begin
     QMPedidosCab.Post;
     QMPedidosDet.Edit;
  end;
  QMPedidosDetID_DETALLES_S.AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
  QMPedidosDetUNIDADES.AsFloat := 1;
end;

procedure TZDMPedidosArtDet.CambiaPrecios;
begin
  xDatosTotal.Close;
  xDatosTotal.Open;

  CambiaUnidades;
end;

procedure TZDMPedidosArtDet.xDatosDetalleBeforeOpen(DataSet: TDataSet);
begin
  with xDatosDetalle do
  begin
     Params.ByName['EMPRESA'].AsInteger := DMPedidos.QMCabeceraEMPRESA.AsInteger;
     Params.ByName['ARTICULO'].AsString := DMPedidos.QMDetalleARTICULO.AsString;
     Params.ByName['LONA'].AsString := xLonaDetARTICULO.AsString;
     Params.ByName['TARIFA'].AsString := DMPedidos.QMCabeceraTARIFA.AsString;
     Params.ByName['DETALLE'].AsString := QMPedidosDetDETALLE.AsString;
     Params.ByName['ID_DETALLES_S'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
  end;
end;

procedure TZDMPedidosArtDet.xDatosTotalBeforeOpen(DataSet: TDataSet);
begin
  with xDatosTotal do
  begin
     Params.ByName['EMPRESA'].AsInteger := DMPedidos.QMCabeceraEMPRESA.AsInteger;
     Params.ByName['ARTICULO'].AsString := DMPedidos.QMDetalleARTICULO.AsString;
     Params.ByName['TARIFA'].AsString := DMPedidos.QMCabeceraTARIFA.AsString;
     Params.ByName['ID_DETALLES_S'].AsInteger := DMPedidos.QMDetalleID_DETALLES_S.AsInteger;
  end;
end;

procedure TZDMPedidosArtDet.QMPedidosCabLACADOChange(Sender: TField);
begin
  xLacado.Close;
  xLacado.Open;

  QMPedidosCabP_INCR_LACADO_PVP.AsFloat := xLacadoINCREMENTO_PVP.AsFloat;
end;

procedure TZDMPedidosArtDet.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;

  QMPedidosDet.Close;
  QMPedidosDet.Open;

  CambiaDetalle;
end;

procedure TZDMPedidosArtDet.QMPedidosDetAfterPost(DataSet: TDataSet);
begin
  GrabaDetalle(DataSet);
  CambiaPrecios;
  CambiaDetalle;
end;

procedure TZDMPedidosArtDet.QMPedidosDetAfterScroll(DataSet: TDataSet);
begin
  CambiaDetalle;
end;

procedure TZDMPedidosArtDet.CambiaDetalle;
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
     Titulo := xArticuloTITULO_ART.AsString + ' ' + xLacadoDESCRIPCION.AsString +
        ' ' + xLonaDetTITULO.AsString +
        ' ' + QMPedidosCabLINEAL.AsString + 'x' + QMPedidosCabSALIDA.AsString;

     // DMPedidos.QMDetalleTITULO.AsString := Copy(Titulo, 1 ,60);
  end
  else if (xArticuloTIPO_ARTICULO_TYC.AsString = 'A') then
  begin
     Titulo := xArticuloTITULO_ART.AsString + ' ' + xLacadoDESCRIPCION.AsString +
        ' ' + QMPedidosCabLINEAL.AsString + 'x' + QMPedidosCabSALIDA.AsString;

     //    DMPedidos.QMDetalleTITULO.AsString := Copy(Titulo, 1, 60);
  end
  else if (xArticuloTIPO_ARTICULO_TYC.AsString = 'L') then
  begin
     Titulo := xArticuloTITULO_ART.AsString + ' ' +
        QMPedidosCabLINEAL.AsString + 'x' + QMPedidosCabSALIDA.AsString;

     //    DMPedidos.QMDetalleTITULO.AsString := Copy(Titulo, 1, 60);
  end;
}
end;

procedure TZDMPedidosArtDet.QMPedidosCabLINEALChange(Sender: TField);
begin
  CambiaUnidades;
end;

procedure TZDMPedidosArtDet.QMPedidosCabSALIDAChange(Sender: TField);
begin
  CambiaUnidades;
end;

procedure TZDMPedidosArtDet.QMPedidosCabUNIDADES_LONAChange(Sender: TField);
begin
  CambiaUnidades;
end;

procedure TZDMPedidosArtDet.CambiaUnidades;
begin
  if (CalcLona) then
  begin
     if (xArticuloTIPO_ARTICULO_TYC.AsString = 'T') then
     begin
        xLineaCalc.Close;
        xLineaCalc.Params.ByName['MODELO'].AsString := QMPedidosCabMODELO.AsString;
        xLineaCalc.Params.ByName['LINEA'].AsInteger := Trunc(QMPedidosCabLINEAL.AsFloat);
        xLineaCalc.Open;

        xSalidaCalc.Close;
        xSalidaCalc.Params.ByName['MODELO'].AsString := QMPedidosCabMODELO.AsString;
        xSalidaCalc.Params.ByName['LINEA'].AsInteger := xLineaCalcLINEA.AsInteger;
        xSalidaCalc.Params.ByName['SALIDA'].AsInteger := Trunc(QMPedidosCabSALIDA.AsFloat);
        xSalidaCalc.Open;

        xLonaM2.Close;
        xLonaM2.SelectSQL.Text := 'SELECT TOTAL_M2_LONA FROM Z_DAME_CALCULO_LONA (?MODELO, ?LINEA, ?SALIDA, ?TIPO_LONA, 0)';
        xLonaM2.Params.ByName['MODELO'].AsString := QMPedidosCabMODELO.AsString;
        xLonaM2.Params.ByName['LINEA'].AsInteger := xLineaCalcLINEA.AsInteger;
        xLonaM2.Params.ByName['SALIDA'].AsInteger := xSalidaCalcSALIDA.AsInteger;
        xLonaM2.Params.ByName['TIPO_LONA'].AsString := xLonaDetZ_LON_TIPO.AsString;
        xLonaM2.Open;
     end
     else if (xArticuloTIPO_ARTICULO_TYC.AsString = 'L') then
     begin
        xLonaM2.Close;
        xLonaM2.SelectSQL.Text := 'SELECT TOTAL_M2_LONA FROM Z_DAME_CALCULO_LONA_SIMPLE (?MODELO, ?LINEA, ?SALIDA, ?ID_LONA)';
        xLonaM2.Params.ByName['MODELO'].AsString := QMPedidosCabMODELO.AsString;
        xLonaM2.Params.ByName['LINEA'].AsInteger := Trunc(QMPedidosCabLINEAL.AsFloat);
        xLonaM2.Params.ByName['SALIDA'].AsInteger := Trunc(QMPedidosCabSALIDA.AsFloat);
        xLonaM2.Params.ByName['ID_LONA'].AsInteger := xLonaDetID_A.AsInteger; // DMPedidos.QMDetalleID_A.AsInteger;
        xLonaM2.Open;
     end;
  end;
end;

procedure TZDMPedidosArtDet.GrabaDetalle(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TZDMPedidosArtDet.EstableceCalcLona;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO_ARTICULO_TYC FROM ART_ARTICULOS WHERE ID_A = ?ID_A';
        Params.ByName['ID_A'].AsInteger := DMPedidos.QMDetalleID_A.AsInteger;
        ExecQuery;
        CalcLona := ((FieldByName['TIPO_ARTICULO_TYC'].AsString = 'L') or (FieldByName['TIPO_ARTICULO_TYC'].AsString = 'T'));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TZDMPedidosArtDet.HayDetalle: boolean;
begin
  Result := (QMPedidosDet.FieldByName('ID_DETALLES_S').AsInteger <> 0);
end;

procedure TZDMPedidosArtDet.QMPedidosDetDETALLEChange(Sender: TField);
begin
  with xEscandallo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['DETALLE'].AsString := QMPedidosDetDETALLE.AsString;
     Open;
  end;

  QMPedidosDetESCANDALLO.AsInteger := xEscandalloESCANDALLO.AsInteger;
end;

procedure TZDMPedidosArtDet.QMPedidosDetBeforePost(DataSet: TDataSet);
begin
  if (QMPedidosCab.State = dsEdit) then
  begin
     QMPedidosCab.Post;
  end;
  ControlaDisponibilidad;
end;

procedure TZDMPedidosArtDet.ControlaDisponibilidad;
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
        Params.ByName['DETALLE'].AsString := QMPedidosDetDETALLE.AsString;
        ExecQuery;

        if ((FieldByName['DISPONIBILIDAD'].AsInteger = 0) or (FieldByName['DISPONIBILIDAD'].AsInteger = 3)) then
        begin
           Application.MessageBox(PChar(string(_('Artículo no disponible para su venta'))), PChar(string(_('Error'))), mb_iconstop);

           QMPedidosDet.Cancel;
        end;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMPedidosArtDet.QMPedidosCabAfterOpen(DataSet: TDataSet);
begin
  xArticulo.Open;
  xLonaDet.Open;
  xLacado.Open;
end;

procedure TZDMPedidosArtDet.QMPedidosCabBeforeClose(DataSet: TDataSet);
begin
  xArticulo.Close;
  xLonaDet.Close;
  xLacado.Close;
end;

procedure TZDMPedidosArtDet.QMPedidosDetCalcFields(DataSet: TDataSet);
begin
  xDatosDetalle.Close;
  xDatosDetalle.Open;

  QMPedidosDetDescArt.AsString := xDatosDetalleTITULO_DET.AsString;
  QMPedidosDetTIPO_ARTICULO_TYC.AsString := xDatosDetalleTIPO_ARTICULO_TYC.AsString;
  QMPedidosDetSUBTIPO_ARTICULO_TYC.AsString := xDatosDetalleSUBTIPO_ARTICULO_TYC.AsString;
  QMPedidosDetCorte.AsInteger := xDatosDetalleCOM_CORTE.AsInteger;
  QMPedidosDetPCoste.AsFloat := xDatosDetalleP_COSTE.AsFloat;
  QMPedidosDetPVenta.AsFloat := xDatosDetalleP_VENTA.AsFloat;
  QMPedidosDetMargen.AsFloat := xDatosDetalleMARGEN.AsFloat;
end;

procedure TZDMPedidosArtDet.QMPedidosDetBeforeEdit(DataSet: TDataSet);
begin
  if (QMPedidosCab.State = dsEdit) then
  begin
     QMPedidosCab.Post;
  end;
end;

procedure TZDMPedidosArtDet.QMPedidosDetBeforeInsert(DataSet: TDataSet);
begin
  if (QMPedidosCab.State = dsEdit) then
  begin
     QMPedidosCab.Post;
  end;
end;

procedure TZDMPedidosArtDet.InformaEscandalloCorte;
var
  id_a : integer;
begin
  // Asignacion comoda del escandallo tipo corte
  if ((QMPedidosDetTIPO_ARTICULO_TYC.AsString = 'C') and (QMPedidosDetCorte.AsInteger = 1)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST(1) ESCANDALLO FROM PRO_ESCANDALLO ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' SUBTIPO = ''COR'' AND ');
           SQL.Add(' TIPO = ''EPR'' AND ');
           SQL.Add(' DEFECTO = 1 AND ');
           SQL.Add(' ESTADO = 1 ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           ExecQuery;

           // id_a para posicionar posteriormente
           Id_a := QMPedidosDetID_A_DET.AsInteger;
           if (QMPedidosCab.State = dsEdit) then
              QMPedidosCab.Post;

           Posicionar(QMPedidosDet, 'ID_A_DET', Id_a);

           if (QMPedidosDet.State <> dsEdit) then
              QMPedidosDet.Edit;
           QMPedidosDetESCANDALLO.AsInteger := FieldByName['ESCANDALLO'].AsInteger;
           QMPedidosDet.Post;

           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     ShowMessage(Format(_('El artículo %s no es un componente de tipo corte.'), [QMPedidosDetDETALLE.AsString]));
end;

function TZDMPedidosArtDet.PuedoCerrar: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 D.ID_DETALLES_S ');
        SQL.Add(' FROM Z_GES_DETALLES_S_PED_DET D ');
        SQL.Add(' JOIN ART_ARTICULOS A ON A.ID_A = D.ID_A_DET ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.ESCANDALLO = 0 AND ');
        SQL.Add(' A.TIPO_ARTICULO_TYC = ''C'' AND ');
        SQL.Add(' A.Z_COM_CORTE = 1 AND ');
        SQL.Add(' D.ID_DETALLES_S = :ID_DETALLES_S ');
        Params.ByName['ID_DETALLES_S'].AsInteger := QMPedidosCabID_DETALLES_S.AsInteger;
        ExecQuery;
        Result := (FieldByName['ID_DETALLES_S'].AsInteger = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
