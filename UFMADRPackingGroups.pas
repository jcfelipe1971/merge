unit UFMADRPackingGroups;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBEdit;

type
  TFMADRPackingGroups = class(TFPEdit)
     DBEGrupoEmbalaje: TLFDbedit;
     DBETitulo: TLFDbedit;
     LGrupoEmbalaje: TLFLabel;
     LTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMADRPackingGroups : TFMADRPackingGroups;

implementation

uses UDMADRPackingGroups, UFormGest, UDMMain, UUtiles;

{$R *.DFM}

procedure TFMADRPackingGroups.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMADRPackingGroups, DMADRPackingGroups);
  NavMain.DataSource := DMADRPackingGroups.DSQMADRPackingGroups;
  EPMain.DataSource := DMADRPackingGroups.DSQMADRPackingGroups;
  DBGMain.DataSource := DMADRPackingGroups.DSQMADRPackingGroups;

  // Color campo ID
  ColorCampoID(DBEGrupoEmbalaje);
end;

procedure TFMADRPackingGroups.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMADRPackingGroups);
end;

procedure TFMADRPackingGroups.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMADRPackingGroups.BusquedaCompleja;
end;

procedure TFMADRPackingGroups.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
