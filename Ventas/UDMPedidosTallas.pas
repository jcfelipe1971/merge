unit UDMPedidosTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMPedidos, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBQuery, HYFIBQuery, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, UDMTallas_s;

type
  TDMPedidosTallas = class(TDMPedidos)
     procedure DMDocsPedidoCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     dm: TDMTallas_s;
     procedure MascarasMoneda; override;
  end;

var
  DMPedidosTallas : TDMPedidosTallas;

implementation

uses UFormGest, UDMMain, UEntorno;

{$R *.dfm}

procedure TDMPedidosTallas.DMDocsPedidoCreate(Sender: TObject);
begin
  AbreDataVarias(TDMTallas_s, dm, nil);
  dm.SetDS(DSQMCabecera);
  dm.InfoActualiza := InfoActualiza;
  inherited;
end;

procedure TDMPedidosTallas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(dm);
  inherited;
end;

procedure TDMPedidosTallas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dm.Abrir;
end;

procedure TDMPedidosTallas.MascarasMoneda;
begin
  inherited;
  if dm <> nil then
     dm.MascarasMonedas(LocalMascaraN, LocalMascaraL);
end;

end.
