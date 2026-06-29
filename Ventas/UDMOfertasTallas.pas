unit UDMOfertasTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMOfertas, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBQuery, HYFIBQuery, FIBDataSetRO, DB,
  FIBDataSet, FIBTableDataSet, UDMTallas_s;

type
  TDMOfertasTallas = class(TDMOfertas)
     SPActualiza_Precio: THYFIBQuery;
     procedure DMDocsOfertaCCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     dm: TDMTallas_s;
     procedure MascarasMoneda; override;
     { Public declarations }
  end;

var
  DMOfertasTallas : TDMOfertasTallas;

implementation

uses UFormGest, UDMMain, UEntorno;

{$R *.dfm}

procedure TDMOfertasTallas.DMDocsOfertaCCreate(Sender: TObject);
begin
  AbreDataVarias(TDMTallas_s, dm, nil);
  dm.SetDS(DSCabecera);
  dm.InfoActualiza := InfoActualiza;
  inherited;
end;

procedure TDMOfertasTallas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(dm);
  inherited;
end;

procedure TDMOfertasTallas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dm.abrir;
end;

procedure TDMOfertasTallas.MascarasMoneda;
begin
  inherited;
  if dm <> nil then
     dm.MascarasMonedas(LocalMascaraN, LocalMascaraL);
end;

end.
