unit UDMAlbaranesTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMAlbaranes, FIBDatabase, UFIBModificados,
  UComponentesBusquedaFiltrada, FIBQuery, HYFIBQuery, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, UDMTallas_s;

type
  TDMAlbaranesTallas = class(TDMAlbaranes)
     SPActualiza_Precio: THYFIBQuery;
     procedure DMDocsAlbaranCreate(Sender: TObject);
     procedure DMAlbaranesDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);

  private
     { Private declarations }
  public
     { Public declarations }
     dm: TDMTallas_s;
     procedure MascarasMoneda; override;
  end;

var
  DMAlbaranesTallas : TDMAlbaranesTallas;

implementation

uses UFormGest, UDMMain, UEntorno;

{$R *.dfm}

procedure TDMAlbaranesTallas.DMDocsAlbaranCreate(Sender: TObject);
begin
  AbreDataVarias(TDMTallas_s, dm, nil);
  dm.SetDS(DSQMCabecera);
  dm.InfoActualiza := InfoActualiza;
  // DMAlbaranes.DMDocsAlbaranCreate(Sender);
  inherited;
end;

procedure TDMAlbaranesTallas.DMAlbaranesDestroy(Sender: TObject);
begin
  CierraData(dm);
  inherited;
end;

procedure TDMAlbaranesTallas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dm.Abrir;
end;

procedure TDMAlbaranesTallas.MascarasMoneda;
begin
  inherited;
  if dm <> nil then
     dm.MascarasMonedas(LocalMascaraN, LocalMascaraL);
end;

end.
