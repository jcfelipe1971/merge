unit UFMZonas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TFMZonas = class(TFPEdit)
     LZona: TLFLabel;
     DBEZona: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBCBDefecto: TLFDBCheckBox;
     LCalendario: TLFLabel;
     DBEFCalendario: TLFDBEditFind2000;
     ECalendario: TLFEdit;
     DBCBAutogeneraRutaAlbaran: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFCalendarioChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMZonas : TFMZonas;

implementation

uses UDMZonas, UFormGest, UDMMain, UDameDato;

{$R *.dfm}

procedure TFMZonas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMZonas, DMZonas);
  NavMain.DataSource := DMZonas.DSQMZonas;
  DBGMain.DataSource := DMZonas.DSQMZonas;
  G2KTableLoc.DataSource := DMZonas.DSQMZonas;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMZonas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMZonas);
end;

procedure TFMZonas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMZonas.BusquedaCompleja;
  Continua := False;
end;

procedure TFMZonas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMZonas.DBEFCalendarioChange(Sender: TObject);
begin
  inherited;
  ECalendario.Text := DameTituloCalendario(StrToIntDef(DBEFCalendario.Text, 0));
end;

end.
