unit UFMNotas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFLabel, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UFPEditDetalle;

type
  TFMNotas = class(TFPEditDetalle)
     LBLNota: TLFLabel;
     DBNota: TLFDbedit;
     LBLFecha: TLFLabel;
     DBFecha: TLFDbedit;
     LBLAsiento: TLFLabel;
     DBAsiento: TLFDbedit;
     DBMNotas: TLFDBMemo;
     DBCHKVisible: TLFDBCheckBox;
     BRenumera: TToolButton;
     PNLDatosAsiento: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BRenumeraClick(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
  private
     { Private declarations }
     Asiento, Ric, Empresa, Ejercicio, Canal: integer;
     Fecha: TDateTime;
  public
     { Public declarations }
     procedure AbreNotas(aAsiento, aRic, aEmpresa, aEjercicio, aCanal: integer; aFecha: TDateTime);
  end;

var
  FMNotas : TFMNotas;

implementation

uses UDMMain, UDMNotas, UFormGest;

{$R *.dfm}

procedure TFMNotas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMNotas, DMNotas);
  ControlEdit := CEMain;
  NavMain.DataSource := DMNotas.DSQMNotas;
  DBGMain.DataSource := DMNotas.DSQMNotas;
  NavDetalle.DataSource := DMNotas.DSQMNotasDetalle;
  DBGFDetalle.DataSource := DMNotas.DSQMNotasDetalle;
end;

procedure TFMNotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMNotas);
end;

procedure TFMNotas.AbreNotas(aAsiento, aRic, aEmpresa, aEjercicio, aCanal: integer; aFecha: TDateTime);
begin
  Asiento := aAsiento;
  Fecha := aFecha;
  Ric := aRic;
  Empresa := aEmpresa;
  Ejercicio := aEjercicio;
  Canal := aCanal;

  DMNotas.AbreNotas(Asiento, Ric, Empresa, Ejercicio, Canal, Fecha);
  ShowModal;
end;

procedure TFMNotas.BRenumeraClick(Sender: TObject);
begin
  inherited;
  DMNotas.Renumerar;
end;

procedure TFMNotas.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  DBGFDetalle.CondicionBusqueda := 'EMPRESA=' + IntToStr(Empresa) +
     ' AND EJERCICIO=' + IntToStr(Ejercicio) + ' AND CANAL=' + IntToStr(Canal) +
     ' AND RIC=' + IntToStr(Ric);
end;

procedure TFMNotas.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

end.
