unit UFMConceptos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMConceptos = class(TFPEdit)
     LBLConcepto: TLFLabel;
     DBEConcepto: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
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
  FMConceptos : TFMConceptos;

implementation

uses UDMConceptos, UFormGest, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMConceptos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMConceptos, DMConceptos);
  NavMain.DataSource := DMConceptos.DSQMConceptos;
  DBGMain.DataSource := DMConceptos.DSQMConceptos;

  // Color campo ID
  ColorCampoID(DBEConcepto);
end;

procedure TFMConceptos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMConceptos);
end;

procedure TFMConceptos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMConceptos.BusquedaCompleja;
  Continua := False;
end;

procedure TFMConceptos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
