unit UFMTipoIVA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, DBCtrls, Mask, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc;

type
  TFMTipoIva = class(TFPEdit)
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LPorIVA: TLFLabel;
     DBEP_Iva: TLFDbedit;
     LPorRecargo: TLFLabel;
     DBEP_Recargo: TLFDbedit;
     DBCBActivo: TLFDBCheckBox;
     DBCBDefecto: TLFDBCheckBox;
     DBEFRegimen: TLFDBEditFind2000;
     LRegimen: TLFLabel;
     DBETitTipoRegimen: TLFDbedit;
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
  FMTipoIva : TFMTipoIva;

implementation

uses UDMTipoIVA, UFormGest, UDMMain;

{$R *.DFM}

procedure TFMTipoIva.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMTipoIVA, DMTipoIVA);
  NavMain.DataSource := DMTipoIVA.DSQMTipoIva;
  DBGMain.DataSource := DMTipoIVA.DSQMTipoIva;
end;

procedure TFMTipoIva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMTipoIVA);
end;

procedure TFMTipoIva.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTipoIVA.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTipoIva.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
