unit UIsoDMDevolucion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FR_Class,
  Fr_HYReport, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TIsoDMDevolucion = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraRIC: TIntegerField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraCODPROV: TIntegerField;
     QMCabeceraMOTIVO: TFIBStringField;
     QMCabeceraREPONER: TIntegerField;
     QMCabeceraABONAR: TIntegerField;
     QMCabeceraCARGO_REP: TIntegerField;
     QMCabeceraOTROS: TIntegerField;
     QMCabeceraOBSERVACIONES: TBlobField;
     QMCabeceraVB_CALIDAD: TIntegerField;
     QMCabeceraVB_COMPRA_VENTA: TIntegerField;
     QMCabeceraVB_PROVEEDOR: TIntegerField;
     QMCabeceraN_PEDIDO: TFIBStringField;
     QMCabeceraESTADO: TIntegerField;
     xProveedor: TFIBTableSet;
     DSxProveedor: TDataSource;
     xProveedorEMPRESA: TIntegerField;
     xProveedorPROVEEDOR: TIntegerField;
     xProveedorTERCERO: TIntegerField;
     xProveedorTITULO: TFIBStringField;
     QMCabeceraDescProv: TStringField;
     xCodProCli: TFIBTableSet;
     xCodProCliTERCERO: TIntegerField;
     xCodProCliNOMBRE_R_SOCIAL: TFIBStringField;
     DSxCodPro: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleRIC: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleC_PEDIDA: TIntegerField;
     QMDetalleC_RECHAZADA: TIntegerField;
     QMDetalleDescArticulo: TStringField;
     xDescArticulo: TFIBTableSet;
     DSxDescArticulo: TDataSource;
     xDescArticuloEMPRESA: TIntegerField;
     xDescArticuloARTICULO: TFIBStringField;
     xDescArticuloTITULO: TFIBStringField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     xCantidadArt: TFIBTableSet;
     DSxCantidadArt: TDataSource;
     xCantidadArtEMPRESA: TIntegerField;
     xCantidadArtRIC: TIntegerField;
     xCantidadArtLINEA: TIntegerField;
     xCantidadArtARTICULO: TFIBStringField;
     frIsoDevolucion: TfrHYReport;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraURGENTE: TIntegerField;
     QMCabeceraDETECCIONE: TIntegerField;
     QMCabeceraDETECCIONC: TIntegerField;
     QMCabeceraCONTADOR: TFIBStringField;
     SPLineaSegDet: THYFIBQuery;
     QMCabeceraTERCERO: TIntegerField;
     xTercero: TFIBDataSetRO;
     xTerceroTERCERO: TIntegerField;
     DSxTercero: TDataSource;
     xCantidadArtCANTIDAD: TFloatField;
     QMCabeceraRIC_INC: TIntegerField;
     xDSDescTipo: TDataSource;
     xDescTipo: TFIBDataSetRO;
     xDescTipoCONTADOR: TFIBStringField;
     procedure DMIsoDevolucionCreate(Sender: TObject);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraCODPROVChange(Sender: TField);
     procedure QMCabeceraDescProvGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraDETECCIONChange(Sender: TField);
     procedure QMCabeceraDescTerceroGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure Graba(DataSet: TDataSet);
     procedure Graba2(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleARTICULOChange(Sender: TField);
     procedure frIsoDevolucionGetValue(const ParName: string; var ParValue: variant);
     procedure frIsoDevolucionEnterRect(Memo: TStringList; View: TfrView);
     procedure QMCabeceraRIC_INCChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  IsoDMDevolucion : TIsoDMDevolucion;

implementation

uses UIsoFMDevolucion, UDMMain, UEntorno, UUtiles, uFBusca, URecursos;

{$R *.DFM}

procedure TIsoDMDevolucion.DMIsoDevolucionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMCabecera, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMCabecera, '11000', True);
end;

procedure TIsoDMDevolucion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TIsoDMDevolucion.Graba2(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  QMcabecera.Refresh;
end;

procedure TIsoDMDevolucion.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  QMCabeceraTIPO.AsString := Copy(IsoFMDevolucion.DBEFNINC.Text, 0, 1);

  if ((DataSet.State = dsInsert) and (QMCabeceraTIPO.AsString <> '')) then
     QMCabeceraRIC.AsInteger := DMMain.Contador_EE('IDV')
  else
  begin
     ShowMessage(_('Falta informar el núm. INC'));
  end;
end;

procedure TIsoDMDevolucion.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProveedor.Open;
  xCodProCli.Open;
  QMDetalle.Open;
  xDescTipo.Open;
end;

procedure TIsoDMDevolucion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '11000');
end;

procedure TIsoDMDevolucion.QMCabeceraCODPROVChange(Sender: TField);
begin
  with xProveedor do
  begin
     Close;
     Params.ByName['codprov'].AsInteger := Sender.AsInteger;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Open;
  end;

  {  //Es busca el tercer
  xTercero.Close;
  xTercero.Open;
  QMCabeceraTERCERO.AsInteger:=xTerceroTERCERO.AsInteger;
}
end;

procedure TIsoDMDevolucion.QMCabeceraDescProvGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xProveedor do
  begin
     Close;
     Params.ByName['codprov'].AsInteger := QMCabeceraCODPROV.AsInteger;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Open;
  end;
  Text := xProveedorTITULO.AsString;
end;

procedure TIsoDMDevolucion.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  //ost: como no esta enlazado le pasamos un tipo por defecto
  // QMCabeceraTIPO.AsString := 'F';

  QMCabeceraFECHA.AsDateTime := REntorno.FechaTrabSH;
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraREPONER.AsInteger := 0;
  QMCabeceraOTROS.AsInteger := 0;
  QMCabeceraABONAR.AsInteger := 0;
  QMCabeceraCARGO_REP.AsInteger := 0;
  QMCabeceraVB_CALIDAD.AsInteger := 0;
  QMCabeceraVB_COMPRA_VENTA.AsInteger := 0;
  QMCabeceraVB_PROVEEDOR.AsInteger := 0;
  QMCabeceraESTADO.AsInteger := 0;
  QMCabeceraDETECCIONE.AsInteger := 0;
  QMCabeceraDETECCIONC.AsInteger := 0;
  QMCabeceraURGENTE.AsInteger := 0;
end;

procedure TIsoDMDevolucion.QMCabeceraDETECCIONChange(Sender: TField);
begin
  with xCodProCli do
  begin
     Close;
     Params.ByName['deteccion'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

procedure TIsoDMDevolucion.QMCabeceraDescTerceroGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {With xCodProCli do
    begin
      Close ;
      Params.ByName['deteccion'].AsInteger := QMCabeceraDETECCION.AsInteger;
      Open ;
    end ;
    Text := xCodProCliNOMBRE_R_SOCIAL.AsString;}
end;

procedure TIsoDMDevolucion.QMDetalleDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xDescArticulo do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['articulo'].AsString := QMDetalleARTICULO.AsString;
     Open;
  end;
  Text := xDescArticuloTITULO.AsString;
end;

procedure TIsoDMDevolucion.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xDescArticulo.Open;
  xCantidadArt.Open;
end;

procedure TIsoDMDevolucion.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMCabecera.State = dsInsert) or (QMCabecera.State = dsEdit)) then
  begin
     QMCabecera.Post;
     IsoFMDevolucion.NavMain.BtnClick(nbRefresh);
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetalleRIC.AsInteger := QMCabeceraRIC.AsInteger;

  //Obtenemos el numero de linea más alto del detalle
  with SPLineaSegDet do
  begin
     Close;
     Params.ByName['Ric'].AsInteger := QMCabeceraRIC.AsInteger;
     ExecQuery;
     QMDetalleLINEA.AsInteger := SPLineaSegDet.FieldByName['LINEA'].AsInteger + 1;
     FreeHandle;
  end;
end;

procedure TIsoDMDevolucion.QMDetalleARTICULOChange(Sender: TField);
begin

  with xCantidadArt do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['contador'].AsString := QMCabeceraCONTADOR.AsString;
     Params.ByName['articulo'].AsString := Sender.AsString;
     Open;
  end;
  QMDetalleC_PEDIDA.AsInteger := xCantidadArtCANTIDAD.AsInteger;

  with xDescArticulo do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['articulo'].AsString := Sender.AsString;
     Open;
  end;
  QMDetalleDescArticulo.AsString := xDescArticuloTITULO.AsString;
end;

//************************ Fermin ****************************
procedure TIsoDMDevolucion.frIsoDevolucionGetValue(const ParName: string; var ParValue: variant);
begin
  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;
end;

procedure TIsoDMDevolucion.frIsoDevolucionEnterRect(Memo: TStringList; View: TfrView);
begin
  if (memo.Count > 0) then
  begin
     if (Memo[0] = '[Imagen]') and (View is TfrPictureView) then
     begin
        // TfrPictureView(View).Picture.Assign(REntorno.ImagenEmpresa);
        View.Visible := True;
     end;
  end;
end;
//*************************************************************

procedure TIsoDMDevolucion.QMCabeceraRIC_INCChange(Sender: TField);
begin
  xDescTipo.Close;
  xDescTipo.Params.ByName['empresa'].AsInteger := QMCabeceraEMPRESA.AsInteger;
  xDescTipo.Params.ByName['ric_inc'].AsInteger := QMCabeceraRIC_INC.AsInteger;
  xDescTipo.Open;

  QMCabeceraCONTADOR.AsString := xDescTipoCONTADOR.AsString;
end;

end.
