unit UCrmFMAcciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFToolBar, ULFPanel, ULFPageControl, ULFLabel, UG2kTBLoc,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, UHYDescription,
  ULFHYDBDescription;

type
  TCrmFMAcciones = class(TFPEdit)
     LblAccion: TLFLabel;
     LblDescripcion: TLFLabel;
     DBEAccion: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LFDBFinAccion: TLFDBCheckBox;
     LTipoSeguimiento: TLFLabel;
     LFDBTSeg: TLFDBEditFind2000;
     DescTSeg: TLFHYDBDescription;
     LFDBCrearSeg: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure LFDBTSegChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmFMAcciones : TCrmFMAcciones;

implementation

uses UCrmDMAcciones, UDMMain, UFormGest, uUtiles;

{$R *.DFM}

procedure TCrmFMAcciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMAcciones, CrmDMAcciones);

  NavMain.DataSource := CrmDMAcciones.DSQMAcciones;
  DBGMain.DataSource := CrmDMAcciones.DSQMAcciones;
  G2KTableLoc.DataSource := CrmDMAcciones.DSQMAcciones;

  // Color campo ID
  ColorCampoID(DBEAccion);
end;

procedure TCrmFMAcciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(CrmDMAcciones);
end;

procedure TCrmFMAcciones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  CrmDMAcciones.BusquedaCompleja;
  Continua := False;
end;

procedure TCrmFMAcciones.LFDBTSegChange(Sender: TObject);
begin
  inherited;
  DescTSeg.ActualizaDatos('TIPO_SEG', LFDBTSeg.Text);
end;

procedure TCrmFMAcciones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
