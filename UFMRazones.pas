unit UFMRazones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc,
  ULFEdit;

type
  TFMRazones = class(TFPEdit)
     LRazon: TLFLabel;
     DBERazon: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     ETituloTipoIdentificacion: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBETipoChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMRazones : TFMRazones;

implementation

uses UFormGest, UDMMain, UDMRazones, UEntorno;

{$R *.DFM}

procedure TFMRazones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRazones, DMRazones);
  NavMain.DataSource := DMRazones.DSRazones;
  DBGMain.DataSource := DMRazones.DSRazones;
  G2KTableLoc.DataSource := DMRazones.DSRazones;

  LTipo.Visible := False;
  DBETipo.Visible := False;
  if (REntorno.Pais = 'DOM') then
  begin
     LTipo.Visible := True;
     DBETipo.Visible := True;
  end;
end;

procedure TFMRazones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRazones);
end;

procedure TFMRazones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMRazones.BusquedaCompleja;
  Continua := False;
end;

procedure TFMRazones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMRazones.DBETipoChange(Sender: TObject);
begin
  inherited;
  case StrToIntDef(DBETipo.Text, 0) of
     0: ETituloTipoIdentificacion.Text := _('Sin definir');
     1: ETituloTipoIdentificacion.Text := _('RNC');
     2: ETituloTipoIdentificacion.Text := _('Cédula');
     3: ETituloTipoIdentificacion.Text := _('Pasaporte');
  end;
end;

end.
