unit UFMJornada;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, Grids, DBGrids,
  NsDBGrid, UHYDBGrid, UNavigator;

type
  TFMJornada = class(TFPEditSinNavegador)
     PNLIncapacidad: TLFPanel;
     TBCCostos: TLFToolBar;
     NavCCostos: THYMNavigator;
     DBGCCostos: THYTDBGrid;
     GBCcostos: TGroupBox;
     SplitterJornada: TSplitter;
     GBJornada: TGroupBox;
     LFPanel1: TLFPanel;
     TBJornada: TLFToolBar;
     NavJornada: THYMNavigator;
     DBGJornada: THYTDBGrid;
     SplitterTipoJornada: TSplitter;
     GBTipoJornada: TGroupBox;
     LFPanel2: TLFPanel;
     TBTipoJornada: TLFToolBar;
     NavTipoJornada: THYMNavigator;
     DBGTipoJornada: THYTDBGrid;
     Splitter1: TSplitter;
     GBAreas: TGroupBox;
     LFPanel3: TLFPanel;
     TBAreas: TLFToolBar;
     NavAreas: THYMNavigator;
     DBGAreas: THYTDBGrid;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMJornada : TFMJornada;

implementation

uses UDMJornada, UFormGest;

{$R *.dfm}

procedure TFMJornada.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMJornada, DMJornada);

  NavJornada.DataSource := DMJornada.DSQMjornada;
  DBGJornada.DataSource := DMJornada.DSQMjornada;
  NavTipoJornada.DataSource := DMJornada.DSQMTipojornada;
  DBGTipoJornada.DataSource := DMJornada.DSQMTipojornada;
  NavAreas.DataSource := DMJornada.DSQMAreas;
  DBGAreas.DataSource := DMJornada.DSQMAreas;
  NavCCostos.DataSource := DMJornada.DSQMCCostos;
  DBGCCostos.DataSource := DMJornada.DSQMCCostos;
end;

procedure TFMJornada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMJornada);
end;

end.
