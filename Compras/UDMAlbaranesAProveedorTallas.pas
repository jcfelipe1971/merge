unit UDMAlbaranesAProveedorTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMAlbaranesAProveedor, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBQuery, HYFIBQuery, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, FIBEvents, UDMTallas_e;

type
  TDMAlbaranesAProveedorTallas = class(TDMAlbaranesAProveedor)
     {    QMCabeceraID_E: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     QMDetalleID_E: TIntegerField;}
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure DMDocsAlbaranAProvCreate(Sender: TObject);
     procedure DMAlbaranesAProveedorDestroy(Sender: TObject);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure MascarasMoneda; override;
  private
     { Private declarations }
  public
     dm: TDMTallas_e;
     { Public declarations }
  end;

var
  DMAlbaranesAProveedorTallas : TDMAlbaranesAProveedorTallas;

implementation

uses UDMMain, UFormGest;

{$R *.dfm}

procedure TDMAlbaranesAProveedorTallas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dm.Abrir;
end;

procedure TDMAlbaranesAProveedorTallas.DMDocsAlbaranAProvCreate(Sender: TObject);
begin
  AbreDataVarias(TDMTallas_e, dm, nil);
  dm.SetDS(DSQMCabecera);
  dm.InfoActualiza := InfoActualiza;
  inherited;
end;

procedure TDMAlbaranesAProveedorTallas.DMAlbaranesAProveedorDestroy(Sender: TObject);
begin
  CierraData(dm);
  inherited;
end;

procedure TDMAlbaranesAProveedorTallas.QMDetalleBeforePost(DataSet: TDataSet);
begin
  inherited;
  {  DMMain.Contador_GEN(Dataset, 'ID_GES_DETALLES_E', 'ID_DETALLES_E');}
end;

procedure TDMAlbaranesAProveedorTallas.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  inherited;
  {  DMMain.Contador_GEN(Dataset, 'ID_GES_CABECERAS_E', 'ID_E');}
end;

procedure TDMAlbaranesAProveedorTallas.MascarasMoneda;
begin
  inherited;
  if dm <> nil then
     dm.MascarasMonedas(LocalMascaraN, LocalMascaraL);
end;

end.
