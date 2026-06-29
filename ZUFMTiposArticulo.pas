unit ZUFMTiposArticulo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, DBCtrls, ComCtrls, UDBDateTimePicker, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, UFormGest,
  ExtDlgs, DB, Buttons, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBEditFind2000, ULFDBEdit, ULFDBCheckBox, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBDateEdit, ULFFIBDBEditFind,
  UHYDescription, ULFHYDBDescription, UG2kTBLoc, UFPregTiempo, ULFLabel,
  ULFEdit, ImgList, Math;

type
  TZFMTiposArticulo = class(TFPEdit)
     LFDesc: TLFDbedit;
     LFId: TLFDbedit;
     LbId: TLFLabel;
     LbDesc: TLFLabel;
     LFCadInicio: TLFDbedit;
     LbCadenaInicio: TLFLabel;
     TSSubtipos: TTabSheet;
     TBSubtipo: TLFToolBar;
     NavSubtipo: THYMNavigator;
     DBGFSubtipo: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFIdChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMTiposArticulo : TZFMTiposArticulo;

implementation

uses UDMMain, UEntorno, UFmain, UUtiles, ZUDMTiposArticulo;

{$R *.dfm}

procedure TZFMTiposArticulo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMTiposArticulo, ZDMTiposArticulo);
  NavMain.DataSource := ZDMTiposArticulo.DSQMTiposArticulo;
  DBGMain.DataSource := ZDMTiposArticulo.DSQMTiposArticulo;
  G2kTableLoc.DataSource := ZDMTiposArticulo.DSQMTiposArticulo;
end;

procedure TZFMTiposArticulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMTiposArticulo);
end;

procedure TZFMTiposArticulo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMTiposArticulo.BusquedaCompleja;
end;

procedure TZFMTiposArticulo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TZFMTiposArticulo.LFIdChange(Sender: TObject);
begin
  inherited;

  if ((LFId.Text = 'T') or
     (LFId.Text = 'L') or
     (LFId.Text = 'K') or
     (LFId.Text = 'A')) then
  begin
     LFCadInicio.Visible := True;
     LbCadenaInicio.Visible := True;
  end
  else
  begin
     LFCadInicio.Visible := False;
     LbCadenaInicio.Visible := False;
  end;
end;

end.
