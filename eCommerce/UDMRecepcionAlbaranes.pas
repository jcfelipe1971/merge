unit UDMRecepcionAlbaranes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TDMRecepcionAlbaranes = class(TDataModule)
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     TLocal: THYTransaction;
     xDocumentos: TFIBDataSetRO;
     DSxDocumentos: TDataSource;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     QMCabeceraID_RECEPCION: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraRECEPCION: TIntegerField;
     QMCabeceraALBARAN: TFIBStringField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraENTRADA: TIntegerField;
     QMCabeceraRECEPCIONAR: TIntegerField;
     QMCabeceraID_PROVEEDOR: TIntegerField;
     QMCabeceraCODIGO_PROVEEDOR: TIntegerField;
     QMCabeceraTITULO_PROVEEDOR: TFIBStringField;
     QMCabeceraUSUARIO_ID: TFIBStringField;
     QMCabeceraALMACEN: TFIBStringField;
     QMDetalleID_RECEPCION_LINEA: TIntegerField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO_ART: TFIBStringField;
     QMDetalleCANTIDAD: TFloatField;
     QMDetalleID_A: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleRECEPCION: TIntegerField;
     QMDetalleALBARAN: TFIBStringField;
     QMDetalleFECHA: TDateTimeField;
     QMDetalleID_RECEPCION: TIntegerField;
     QMDetalleID_PROVEEDOR: TIntegerField;
     QMDetalleID_E: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     QMDetalleCANTIDAD_DISTRIBUIDA: TFloatField;
     QMDetalleEMPRESA_E: TIntegerField;
     QMDetalleEJERCICIO_E: TIntegerField;
     QMDetalleCANAL_E: TIntegerField;
     QMDetalleSERIE_E: TFIBStringField;
     QMDetalleTIPO_E: TFIBStringField;
     QMDetalleRIG_E: TIntegerField;
     QMDetalleLINEA_E: TIntegerField;
     QMDetalleCANTIDAD_E: TFloatField;
     TUpdate: THYTransaction;
     procedure DMRecepcionPedidosCreate(Sender: TObject);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     // HacerPost: boolean;
     // Contador: integer;
     SerieFac: string;
     procedure AbreDocumentos(Destino: string; Contador: integer);
     procedure MuestraDocumentos(Destino, ser: string; contador, CanalDestino: integer);
     function AceptaCambioCanal: boolean;
  public
     { Public declarations }
     LocalMascaraL: string;
     procedure MascaraMonedas;
     procedure RefrescaCabecera;
     procedure TraspasaAlbaranes;
     procedure MarcarRecepciones(valor: integer);
     procedure BorraRecepcion;
  end;

var
  DMRecepcionAlbaranes : TDMRecepcionAlbaranes;

implementation

uses UDMMain, UEntorno, UFMAlbaranesAProveedor, {UFMFacturasAProveedor,} UFormGest,
  {UFMControlErroresFactura,} UUtiles, {UFMConfigTraspasoLotes,}
  {UFMRecepcionPedidos,} UFMain, UFMControlAgrupPedidos,
  UFMRecepcionAlbaranes;

{$R *.DFM}

procedure TDMRecepcionAlbaranes.DMRecepcionPedidosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  RefrescaCabecera;
  MascaraMonedas;
end;

procedure TDMRecepcionAlbaranes.RefrescaCabecera;
begin
  QMcabecera.Close;
  QMCabecera.Open;
end;

procedure TDMRecepcionAlbaranes.QMDetalleNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMRecepcionAlbaranes.AbreDocumentos(Destino: string; Contador: integer);
begin
  if (Destino = 'ALP') then
  begin
     FMain.EjecutaAccion(FMain.AAlbaranesProv);
     FMAlbaranesAProveedor.RecepcionPedidos(SerieFac, Contador);
  end;
end;

procedure TDMRecepcionAlbaranes.MascaraMonedas;
begin
  // De momento se pone el la moneda de la empresa
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);
end;

procedure TDMRecepcionAlbaranes.MuestraDocumentos(Destino, ser: string; contador, CanalDestino: integer);
begin
  with xDocumentos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalDestino;
     Params.ByName['SERIE'].AsString := Ser;
     Params.ByName['TIPO'].AsString := destino;
     Params.ByName['CONTADOR'].AsInteger := contador;
     Open;
  end;

  if (REntorno.Canal = CanalDestino) then
  begin
     AbreDocumentos(Destino, Contador);
  end
  else
  if (AceptaCambioCanal) then
  begin
     CierraFormsMenos(FMRecepcionAlbaranes);
     FMain.CambiaEjercicioYCanal(REntorno.Ejercicio, CanalDestino);
     AbreDocumentos(Destino, Contador);
     FMRecepcionAlbaranes.Close;
  end;

  xDocumentos.Close;
end;

procedure TDMRecepcionAlbaranes.TraspasaAlbaranes;
var
  Cantidad, Contador, {d_ejercicio,} d_canal : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM TMP_WEB_RECEPCION WHERE RECEPCIONAR = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Cantidad := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Cantidad > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_RECEPCIONES(:ENTRADA)';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           Contador := FieldByName['PROC_AUTO'].AsInteger;
           SerieFac := FieldByName['D_SERIE'].AsString;
           // d_ejercicio := FieldByName['D_EJERCICIO'].AsInteger;
           d_canal := FieldByName['D_CANAL'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;

        RefrescaCabecera;
        MuestraDocumentos('ALP', SerieFac, Contador, d_canal);
     end;
  end;
end;

procedure TDMRecepcionAlbaranes.MarcarRecepciones(Valor: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_WEB_RECEPCION SET RECEPCIONAR = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := Valor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabecera.Close;
  QMCabecera.Open;
end;

procedure TDMRecepcionAlbaranes.BorraRecepcion;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_WEB_RECEPCION WHERE ID_RECEPCION = :ID_RECEPCION';
        Params.ByName['ID_RECEPCION'].AsInteger := QMCabeceraID_RECEPCION.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaCabecera;
end;

procedure TDMRecepcionAlbaranes.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

function TDMRecepcionAlbaranes.AceptaCambioCanal: boolean;
begin
  AbreForm(TFMControlAgrupPedidos, FMControlAgrupPedidos);
  with FMControlAgrupPedidos do
  begin
     AsignaDataSource(DSxDocumentos);
     Result := Inicializa;
  end;

  CierraForm(FMControlAgrupPedidos);
end;

procedure TDMRecepcionAlbaranes.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
end;

procedure TDMRecepcionAlbaranes.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
end;

end.
