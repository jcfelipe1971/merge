unit UFMConfigTraspasoLotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, ULFToolBar, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, UFormGest, Menus, UTeclas, UControlEdit, UNavigator,
  ULFLabel, ULFEdit, ULFPanel, UFPEditSinNavegador, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, UEditPanel;

type
  TFMConfigTraspasoLotes = class(TFPEditSinNavegador)
     DBGFLotes: TDBGridFind2000;
     EArticulo: TLFEdit;
     ETituloArticulo: TLFEdit;
     LBArticulo: TLFLabel;
     TBSep2: TToolButton;
     TButtLotes: TToolButton;
     TBNav: TLFToolBar;
     NavMain: THYMNavigator;
     TButtAceptar: TToolButton;
     TBParametrizacion: TToolButton;
     TSep1: TToolButton;
     DBEUnidadesRestantes: TLFDbedit;
     PNLArticulo: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure TButtLotesClick(Sender: TObject);
     procedure TButtAceptarClick(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBParametrizacionClick(Sender: TObject);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     IdA, Proveedor: integer;
     Almacen: string;
     Aceptar: boolean;
  public
     { Public declarations }
     procedure AsignaLote(TipoDoc, Serie, Articulo, aAlmacen: string; Ejercicio, RIG, Canal, aIdA, IdDetalles, aProveedor: integer; Unidades: double);
  end;

var
  FMConfigTraspasoLotes : TFMConfigTraspasoLotes;

implementation

uses UDMConfigTraspasoLotes, UDMMain, UEntorno, UDameDato, UFMInfoLotesTraspaso, UFMParametrizacionLotes;

{$R *.dfm}

procedure TFMConfigTraspasoLotes.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMConfigTraspasoLotes, DMConfigTraspasoLotes);
  ControlEdit := CEMain;
  Aceptar := False;
end;

procedure TFMConfigTraspasoLotes.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if (not Aceptar) then
     DMConfigTraspasoLotes.Cancela;
end;

procedure TFMConfigTraspasoLotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMConfigTraspasoLotes);
end;

procedure TFMConfigTraspasoLotes.AsignaLote(TipoDoc, Serie, Articulo, aAlmacen: string; Ejercicio, RIG, Canal, aIdA, IdDetalles, aProveedor: integer; Unidades: double);
begin
  EArticulo.Text := Articulo;
  ETituloArticulo.Text := DameTituloArticulo(Articulo);
  IdA := aIdA;
  Almacen := aAlmacen;
  Proveedor := aProveedor;

  DMConfigTraspasoLotes.InsertaPrimerLote(TipoDoc, Serie, Articulo, Almacen,
     Ejercicio, Canal, IDA, RIG, IdDetalles, Unidades);

  // El boton para crear lotes segun parametros se activa solo durante la recepcion de pedidos de compra (JVV)
  TBParametrizacion.Visible := (TipoDoc = 'PEP');

  Hide;
  ShowModal;
end;

procedure TFMConfigTraspasoLotes.TButtLotesClick(Sender: TObject);
begin
  DMConfigTraspasoLotes.FiltraLotes(IdA, Proveedor, Almacen);
  TFMInfoLotesTraspaso.Create(Self).ShowModal;
end;

procedure TFMConfigTraspasoLotes.TButtAceptarClick(Sender: TObject);
begin
  Aceptar := False;
  if not DMConfigTraspasoLotes.CompruebaSalida then
     raise Exception.Create(_('El total de unidades no coincide el total a servir'))
  else
  begin
     Aceptar := True;
     Close;
  end;
end;

procedure TFMConfigTraspasoLotes.TBParametrizacionClick(Sender: TObject);
begin
  TFMParametrizacionLotes.Create(Self).ShowModal;
  DMConfigTraspasoLotes.RefrescaUnidadesEtiquetar;
end;

procedure TFMConfigTraspasoLotes.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  inherited;
  Aceptar := False;
end;

end.
