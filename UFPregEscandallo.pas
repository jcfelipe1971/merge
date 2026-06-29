unit UFPregEscandallo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, Mask, DBCtrls, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls, ULFDBEdit,
  ULFEdit, ULFCheckBox, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregEscandallo = class(TFPEditListadoSimple)
     LBLEscandallo: TLFLabel;
     LBLArticulo: TLFLabel;
     LBLCantidad: TLFLabel;
     CHKExplosion: TLFCheckBox;
     EFEscandallo: TLFEditFind2000;
     EFArticulo: TLFEditFind2000;
     EDTCantidad: TLFEdit;
     DBETitArticulo: TLFDbedit;
     AConfiguracion: TAction;
     TButtConf: TToolButton;
     CBValorado: TLFCheckBox;
     CBTodos: TLFCheckBox;
     RGOrden: TRadioGroup;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloBusqueda(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure EFEscandalloBusqueda(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra(escandallo, articulo: string);
  end;

var
  FPregEscandallo : TFPregEscandallo;

implementation

uses UDMLstNecesidades, UFormGest, UEntorno, UDMMain, UFMListConfig;

{$R *.DFM}

procedure TFPregEscandallo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstNecesidades, DMLstNecesidades);

  Grupo := 104;
  Listado := DMLstNecesidades.frNecesidades;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  // Inicializamos algunos valores
  EDTCantidad.Text := '1';

  if (DMMain.EstadoKri(132) = 1) then
     RGOrden.ItemIndex := 0;
end;

procedure TFPregEscandallo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstNecesidades);
end;

procedure TFPregEscandallo.Muestra(escandallo, articulo: string);
begin
  EFEscandallo.Text := escandallo;
  EFArticulo.Text := Articulo;
  ShowModal;
end;

procedure TFPregEscandallo.EFArticuloBusqueda(Sender: TObject);
begin
  EFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregEscandallo.EFArticuloChange(Sender: TObject);
begin
  DMLstNecesidades.CambiaTituloArt(EFArticulo.Text);
end;

procedure TFPregEscandallo.EFEscandalloBusqueda(Sender: TObject);
begin
  EFEscandallo.CondicionBusqueda := 'articulo=''' + EFArticulo.Text + '''';
end;

procedure TFPregEscandallo.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  Explosion, Valorado, Todos : integer;
begin
  if (CHKExplosion.Checked) then
     Explosion := 1
  else
     Explosion := 0;

  if (CBValorado.Checked) then
     Valorado := 1
  else
     Valorado := 0;

  if (CBTodos.Checked) then
     Todos := 1
  else
     todos := 0;

  DMLstNecesidades.PreparaListadoEsc(StrToIntDef(EFEscandallo.Text, 0),
     EFArticulo.Text, StrToIntDef(EDTCantidad.Text, 0), Explosion, valorado, Todos, Modo, RGOrden.ItemIndex);
end;

end.
