unit UFPregNecesidades;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, Mask, DBCtrls, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls, ULFDBEdit,
  ULFEdit, ULFCheckBox, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregNecesidades = class(TFPEditListadoSimple)
     LBLOrden: TLFLabel;
     LBLArticulo: TLFLabel;
     LBLCantidad: TLFLabel;
     CHKExplosion: TLFCheckBox;
     EFOrdenProduccion: TLFEditFind2000;
     EFArticulo: TLFEditFind2000;
     EDTCantidad: TLFEdit;
     DBETitArticulo: TLFDbedit;
     AConfiguracion: TAction;
     TButtConf: TToolButton;
     LSerieKri: TLFLabel;
     EFSerieKRI: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloBusqueda(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure EFOrdenProduccionChange(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregNecesidades : TFPregNecesidades;

implementation

uses UDMLstNecesidades, UFormGest, UEntorno, UDMMain, UFMListConfig;

{$R *.DFM}

procedure TFPregNecesidades.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstNecesidades, DMLstNecesidades);

  Grupo := 85;
  Listado := DMLstNecesidades.frNecesidades;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  // Inicializamos algunos valores
  EDTCantidad.Text := '1';
  //EFOrdenProduccion.SetFocus;
end;

procedure TFPregNecesidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstNecesidades);
end;

procedure TFPregNecesidades.EFArticuloBusqueda(Sender: TObject);
begin
  EFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregNecesidades.EFArticuloChange(Sender: TObject);
begin
  DMLstNecesidades.CambiaTituloArt(EFArticulo.Text);
end;

procedure TFPregNecesidades.EFOrdenProduccionChange(Sender: TObject);
var
  Articulo : string;
  Cantidad : real;
begin
  Cantidad := 0;
  if (EFOrdenProduccion.Text <> '') then
  begin
     DMLstNecesidades.DameDatosOrden(EFSerieKRI.Text,
        (StrToIntDef(EFOrdenProduccion.Text, 0)), Articulo, Cantidad);
     EFArticulo.Text := Articulo;
     EFArticulo.Enabled := False;
     EFArticulo.Color := clInfoBk;
     EFArticulo.Font.Color := clGrayText;
     EDTCantidad.Text := FloatToStr(Cantidad);
  end
  else
  begin
     EFArticulo.Enabled := True;
     EFArticulo.Color := clWindow;
     EFArticulo.Font.Color := clWindowText;
  end;
end;

procedure TFPregNecesidades.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstNecesidades.PreparaListado(EFSerieKRI.Text,
     StrToIntDef(EFOrdenProduccion.Text, 1),
     EFArticulo.Text, StrToIntDef(EDTCantidad.Text, 0), CHKExplosion.Checked, Modo);
end;

end.
