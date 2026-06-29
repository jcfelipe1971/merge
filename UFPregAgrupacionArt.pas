unit UFPregAgrupacionArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls,
  Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFActionList, ULFPageControl, ULFToolBar, ULFDBEdit, ULFEditFind2000,
  ULFPanel, ULFLabel, rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregAgrupacionArt = class(TFPEditListadoSimple)
     PNLAgrupacion: TLFPanel;
     LBLAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     DBETitulo: TLFDbedit;
     RGOrden: TRadioGroup;
     ToolButton1: TToolButton;
     procedure EFAgrupacionChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPregAgrupacionArt : TFPregAgrupacionArt;

implementation

uses UFMListConfig, UDMLstArticulos;

{$R *.dfm}

procedure TFPregAgrupacionArt.FormCreate(Sender: TObject);
begin
  inherited;

  ARecargar.Execute;
  ShowModal;
  Grupo := 155;
  Listado := DMLstArticulos.frArticulos;
end;

procedure TFPregAgrupacionArt.EFAgrupacionChange(Sender: TObject);
begin
  DMLstArticulos.TituloAgrupacion(EFAgrupacion.Text);
end;

procedure TFPregAgrupacionArt.FormShow(Sender: TObject);
begin
  EFAgrupacion.SetFocus;
end;

procedure TFPregAgrupacionArt.APrevExecute(Sender: TObject);
begin
  DMLstArticulos.MostrarFiltradoAgrup(0, EFAgrupacion.Text, RGOrden.ItemIndex);
end;

procedure TFPregAgrupacionArt.AImprimirExecute(Sender: TObject);
begin
  DMLstArticulos.MostrarFiltradoAgrup(1, EFAgrupacion.Text, RGOrden.ItemIndex);
end;

procedure TFPregAgrupacionArt.ARecargarExecute(Sender: TObject);
var
  agrupacion : string;
begin
  DMLstArticulos.DameAgrupacion(agrupacion);
  EFAgrupacion.Text := agrupacion;
  RGOrden.ItemIndex := 0;
end;

end.
