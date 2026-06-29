unit UFMPeriodosEmpresa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, DbComboBoxValue, ComCtrls, UDBDateTimePicker,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, DBCtrls, Menus,
  UTeclas, UControlEdit, UEditPanel, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, ExtCtrls, rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBDateEdit;

type
  TFMPeriodosEmpresa = class(TFPEdit)
     DBETitulo: TLFDbedit;
     EFPeriodo: TLFDBEditFind2000;
     DBDTPDesde: TLFDBDateEdit;
     DBDTPHasta: TLFDBDateEdit;
     LblHasta: TLFLabel;
     LblTipo: TLFLabel;
     LblDesde: TLFLabel;
     LblPeriodo: TLFLabel;
     DBETipoPeriodo: TLFDbedit;
     DTPHoraDesde: TDateTimePicker;
     DTPHoraHasta: TDateTimePicker;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EFPeriodoBusqueda(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
     procedure MuestraDTPickers(Habilita: boolean);
  public
     { Public declarations }
  end;

var
  FMPeriodosEmpresa : TFMPeriodosEmpresa;

implementation

uses UDMPeriodosEmpresa, UFormGest, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMPeriodosEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPeriodosEmpresa, DMPeriodosEmpresa);
  NavMain.DataSource := DMPeriodosEmpresa.DSQMPeriodos;
  DBGMain.DataSource := DMPeriodosEmpresa.DSQMPeriodos;
  MuestraDTPickers(DMPeriodosEmpresa.EsTipo5);

  // Color campo ID
  ColorCampoID(EFPeriodo);
end;

procedure TFMPeriodosEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMPeriodosEmpresa);
  Action := caFree;
end;

procedure TFMPeriodosEmpresa.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPeriodosEmpresa.BusquedaCompleja;
  Continua := False;
end;

procedure TFMPeriodosEmpresa.EFPeriodoBusqueda(Sender: TObject);
begin
  EFPeriodo.CondicionBusqueda := 'TIPO=6'; // Sólo deben salir los de tipo usuario
end;

procedure TFMPeriodosEmpresa.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  MuestraDTPickers(DMPeriodosEmpresa.EsTipo5);
end;

procedure TFMPeriodosEmpresa.MuestraDTPickers(Habilita: boolean);
begin
  DBDTPDesde.Visible := Habilita;
  DTPHoraDesde.Visible := Habilita;
  DBDTPHasta.Visible := Habilita;
  DTPHoraHasta.Visible := Habilita;
  LblDesde.Visible := Habilita;
  LblHasta.Visible := Habilita;
end;

end.
