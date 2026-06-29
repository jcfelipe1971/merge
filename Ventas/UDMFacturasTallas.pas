unit UDMFacturasTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMFacturas, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBQuery, HYFIBQuery, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, UDMTallas_s;

type
  TDMFacturasTallas = class(TDMFacturas)
     procedure DMDocsFacturaCreate(Sender: TObject);
     procedure DMFacturasDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     dm: TDMTallas_s;
     procedure MascarasMoneda; override;
     { Public declarations }
  end;

var
  DMFacturasTallas : TDMFacturasTallas;

implementation

uses UFormGest, UDMMain;

{$R *.dfm}

procedure TDMFacturasTallas.DMDocsFacturaCreate(Sender: TObject);
begin
  AbreDataVarias(TDMTallas_s, dm, nil);
  dm.SetDS(DSQMCabecera);
  dm.InfoActualiza := InfoActualiza;
  inherited;
end;

procedure TDMFacturasTallas.DMFacturasDestroy(Sender: TObject);
begin
  inherited;
  CierraData(dm);
end;

procedure TDMFacturasTallas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dm.Abrir;
end;

procedure TDMFacturasTallas.MascarasMoneda;
begin
  inherited;
  if dm <> nil then
     dm.MascarasMonedas(LocalMascaraN, LocalMascaraL);
end;

end.
