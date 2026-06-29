unit UDMPedidosAProveedorTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMPedidosAProveedor, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBQuery, HYFIBQuery, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, UDMTallas_e;

type
  TDMPedidosAProveedorTallas = class(TDMPedidosAProveedor)
     procedure DMDocsPedidoAProvCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     dm: TDMTallas_e;
     procedure MascarasMoneda; override;
  end;

var
  DMPedidosAProveedorTallas : TDMPedidosAProveedorTallas;

implementation

uses UFormGest, UDMMain;

{$R *.dfm}

procedure TDMPedidosAProveedorTallas.DMDocsPedidoAProvCreate(Sender: TObject);
begin
  AbreDataVarias(TDMTallas_e, dm, nil);
  dm.SetDS(DSCabecera);
  dm.InfoActualiza := InfoActualiza;
  inherited;
end;

procedure TDMPedidosAProveedorTallas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(dm);
  inherited;
end;

procedure TDMPedidosAProveedorTallas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dm.Abrir;
end;

procedure TDMPedidosAProveedorTallas.QMDetalleBeforePost(DataSet: TDataSet);
begin
  inherited;
  //  DMMain.Contador_GEN(Dataset,'SEQ_DETALLES_E','ID_DETALLES_E');
end;

procedure TDMPedidosAProveedorTallas.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  inherited;
  //  DMMain.Contador_GEN(Dataset,'SEQ_CABECERAS_E','ID_E');
end;

procedure TDMPedidosAProveedorTallas.MascarasMoneda;
begin
  inherited;
  if dm <> nil then
     dm.MascarasMonedas(LocalMascaraN, LocalMascaraL);
end;

end.
