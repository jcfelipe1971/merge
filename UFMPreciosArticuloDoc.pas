unit UFMPreciosArticuloDoc;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UControlEdit, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, Menus, UTeclas,
  ExtCtrls, UNavigator, UEditPanel, UFormGest, StdCtrls, Mask, DBCtrls,
  NsDBGrid, ULFDBEdit, ULFPanel, ULFToolBar, ULFLabel, UFPEditSimple,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList;

type
  TFMPreciosArticuloDoc = class(TFPEditSimple)
     DBGFTarifas: TDBGridFind2000;
     PNLMoneda: TLFPanel;
     LMoneda: TLFLabel;
     DBMoneda: TLFDbedit;
     DBTitMoneda: TLFDbedit;
     TBSep1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGFTarifasDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPreciosArticuloDoc : TFMPreciosArticuloDoc;
  TipoDoc : byte;

function DevuelvePrecio(Tipo: byte; Articulo, Almacen: string; var Bueno: boolean; Moneda: string; Fecha: TDateTime; id_a: integer): double;

implementation

uses UDMMain, UDMPreciosArticuloDoc, UFMain, URecursos;

{$R *.DFM}

function DevuelvePrecio(Tipo: byte; Articulo, Almacen: string; var Bueno: boolean; Moneda: string; Fecha: TDateTime; id_a: integer): double;
begin
  Bueno := False;
  Result := 0;
  TipoDoc := Tipo;
  FMPreciosArticuloDoc := TFMPreciosArticuloDoc.Create(Application);
  DMPreciosArticuloDoc.Filtra(Articulo, Almacen, Moneda, Fecha, id_a);
  if (FMPreciosArticuloDoc.ShowModal = mrOk) and (TipoDoc = 1) then
  begin
     Result := DMPreciosArticuloDoc.QMTarifasPVP.AsFloat;
     Bueno := True;
  end;
  CierraData(DMPreciosArticuloDoc);
  // FMPreciosArticuloDoc.Free;
end;

procedure TFMPreciosArticuloDoc.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPreciosArticuloDoc, DMPreciosArticuloDoc);
  OwnerDrawMenus(Self);
  SalirConEscape;
end;

procedure TFMPreciosArticuloDoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFMPreciosArticuloDoc.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  ModalResult := mrCancel;
end;

procedure TFMPreciosArticuloDoc.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  DMPreciosArticuloDoc.Devuelve_pvp;
  ModalResult := mrOk;
end;

procedure TFMPreciosArticuloDoc.DBGFTarifasDblClick(Sender: TObject);
begin
  DMPreciosArticuloDoc.Devuelve_pvp;
  ModalResult := mrOk;
end;

end.
