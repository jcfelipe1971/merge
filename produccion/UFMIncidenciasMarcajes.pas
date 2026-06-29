unit UFMIncidenciasMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, DBCtrls,
  ULFDBEdit, StdCtrls, ULFEditFind2000, TFlatCheckBoxUnit, ULFCheckBox,
  ULFLabel, UFormGest, rxToolEdit, ULFDateEdit, ULFEdit;

type
  TFMIncidenciasMarcajes = class(TFPEditSimple)
     PNLFiltros: TPanel;
     LFamilia: TLFLabel;
     CBArticulosBaja: TLFCheckBox;
     EFMaquina: TLFEditFind2000;
     EMaquina: TLFEdit;
     DBGMarca: TDBGridFind2000;
     LFechas: TLFLabel;
     DEFechaDesde: TLFDateEdit;
     DEFechaHasta: TLFDateEdit;
     LTipoIncidencia: TLFLabel;
     EFTipoIncidencia: TLFEditFind2000;
     ETipoIncidenciaTitulo: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFMaquinaChange(Sender: TObject);
     procedure Filtra(Sender: TObject);
     procedure DEFechaDesdeChange(Sender: TObject);
     procedure DEFechaHastaChange(Sender: TObject);
     procedure EFTipoIncidenciaChange(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMIncidenciasMarcajes : TFMIncidenciasMarcajes;

implementation

uses UDMMain, UProDMMarcajesMaq, UFMain, UDameDato;

{$R *.dfm}

procedure TFMIncidenciasMarcajes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMMarcajesMaq, ProDMMarcajesMaq);
  ControlEdit := CEMain;

  NavMain.DataSource := ProDMMarcajesMaq.DSQMProCabMarcaI;
  DBGMarca.DataSource := ProDMMarcajesMaq.DSQMProCabMarcaI;

  ColActual := DBGMarca.Columns[0];

  ProDMMarcajesMaq.FiltraIncidencias(0, 0, 0, '');
end;

procedure TFMIncidenciasMarcajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMMarcajesMaq);
end;

procedure TFMIncidenciasMarcajes.EFMaquinaChange(Sender: TObject);
begin
  EMaquina.Text := DameTituloMaquina(StrToIntDef(EFMaquina.Text, 0));
  Filtra(Sender);
end;

procedure TFMIncidenciasMarcajes.Filtra(Sender: TObject);
begin
  inherited;
  ProDMMarcajesMaq.FiltraIncidencias(StrToIntDef(EFMaquina.Text, 0), DEFechaDesde.Date, DEFechaHasta.Date, EFTipoIncidencia.Text);
end;

procedure TFMIncidenciasMarcajes.DEFechaDesdeChange(Sender: TObject);
begin
  Filtra(Sender);
end;

procedure TFMIncidenciasMarcajes.DEFechaHastaChange(Sender: TObject);
begin
  Filtra(Sender);
end;

procedure TFMIncidenciasMarcajes.EFTipoIncidenciaChange(Sender: TObject);
begin
  ETipoIncidenciaTitulo.Text := DameTituloTipoIncidenciaMaq(EFTipoIncidencia.Text);
  Filtra(Sender);
end;

end.
