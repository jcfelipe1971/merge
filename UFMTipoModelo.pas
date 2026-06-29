unit UFMTipoModelo;

interface

uses
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
  TFMTipoModelo = class(TFPEdit)
     LFDesc: TLFDbedit;
     LFId: TLFDbedit;
     LbId: TLFLabel;
     LbDesc: TLFLabel;
     LFPrefijoArticulo: TLFDbedit;
     LFPrefijoTituloArt: TLFDbedit;
     LbPrefijoArticulo: TLFLabel;
     LbPrefijoTituloArt: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTipoModelo : TFMTipoModelo;

implementation

uses UDMMain, UEntorno, {UFMain,} UUtiles, UDMTipoModelo;

{$R *.dfm}

procedure TFMTipoModelo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTipoModelo, DMTipoModelo);
end;

procedure TFMTipoModelo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTipoModelo.BusquedaCompleja;
end;

procedure TFMTipoModelo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
