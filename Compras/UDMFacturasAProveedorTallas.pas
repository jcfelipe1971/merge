unit UDMFacturasAProveedorTallas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMFacturasAProveedor, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBQuery, HYFIBQuery, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, UDMTallas_e;

type
  TDMFacturasAProveedorTallas = class(TDMFacturasAProveedor)
     {    QMCabeceraI_FINANCIACION_CANAL: TFloatField;
    QMCabeceraID_E: TIntegerField;
    QMDetalleID_DETALLES_E: TIntegerField;
    QMDetalleID_E: TIntegerField;}
     procedure DMFacturasAProveedorCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure DMFacturasAProveedorDestroy(Sender: TObject);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     dm: TDmTallas_e;
     procedure MascarasMoneda; override;
     { Public declarations }
  end;

var
  DMFacturasAProveedorTallas : TDMFacturasAProveedorTallas;

implementation

uses UFormGest, UDMMain;

{$R *.dfm}

procedure TDMFacturasAProveedorTallas.DMFacturasAProveedorCreate(Sender: TObject);
begin
  AbreDataVarias(TDMTallas_e, dm, nil);
  dm.SetDS(DSQMCabecera);
  dm.InfoActualiza := InfoActualiza;
  inherited;
end;

procedure TDMFacturasAProveedorTallas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dm.Abrir;
end;

procedure TDMFacturasAProveedorTallas.DMFacturasAProveedorDestroy(Sender: TObject);
begin
  CierraData(dm);
  inherited;
end;

procedure TDMFacturasAProveedorTallas.QMDetalleBeforePost(DataSet: TDataSet);
begin
  inherited;
  {  DMMain.Contador_GEN(Dataset, 'ID_GES_DETALLES_E', 'ID_DETALLES_E');}
end;

procedure TDMFacturasAProveedorTallas.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  inherited;
  {  DMMain.Contador_GEN(Dataset, 'ID_GES_CABECERAS_E', 'ID_E');}
end;

procedure TDMFacturasAProveedorTallas.MascarasMoneda;
begin
  inherited;
  if dm <> nil then
     dm.MascarasMonedas(LocalMascaraN, LocalMascaraL);
end;

end.
