unit UFPregCodBarras;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, UControlEdit,
  ULFActionList, ULFToolBar, ULFEdit, ULFPanel, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, Mask, rxToolEdit,
  ULFDateEdit, UFPEditListado, rxPlacemnt, ULFFormStorage, ULFPageControl, UDMLstEtiquetas,
  UFPEditListadoSimple;

type
  TFPregCodBarras = class(TFPEditListadoSimple)
     CBValorado: TLFCheckBox;
     LEtiqutasVacias: TLFLabel;
     ECantidadEtiquetas: TLFEdit;
     LEtiquetasEnBlanco: TLFLabel;
     ECantidadEtiquetsEnBlanco: TLFEdit;
     EFTarifa: TLFEditFind2000;
     CBUnidadesBultos: TLFCheckBox;
     DEFecha: TLFDateEdit;
     LTexto3: TLFLabel;
     ETexto2: TLFEdit;
     LTexto2: TLFLabel;
     ETexto1: TLFEdit;
     LTexto1: TLFLabel;
     PNLValoracion: TLFPanel;
     TButtConfRapida: TToolButton;
     LIdioma: TLFLabel;
     EIdioma: TLFEditFind2000;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBValoradoChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     TipoListado: integer;
     dm: TDMLstEtiquetas;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestrate(var Tipo, CantidadEtiquetas, CantidadEtiquetsEnBlanco, Origen, Valorado, UsarBultos: integer; var Tarifa, Texto1, Texto2, Texto3, Idioma: string);
  end;

var
  FPregCodBarras : TFPregCodBarras;

implementation

uses UFMListConfig, UDMMain, UUtiles, UEntorno, UFormGest;

{$R *.DFM}

procedure TFPregCodBarras.FormCreate(Sender: TObject);
begin
  AbreData(TDMLstEtiquetas, dm);
  ARecargar.Visible := False;
  Listado := dm.frArticulos;
  ListadoFR3 := dm.frxArticulos;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregCodBarras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(dm);
end;

procedure TFPregCodBarras.Muestrate(var Tipo, CantidadEtiquetas, CantidadEtiquetsEnBlanco, Origen, Valorado, UsarBultos: integer; var Tarifa, Texto1, Texto2, Texto3, Idioma: string);
begin
  {Origen:
        1 - Desde articulos
        2 - Desde MovStock
        3 - Albaranes de Compra
  }

  if (Origen >= 2) then
  begin
     ECantidadEtiquetsEnBlanco.Visible := False;
     ECantidadEtiquetas.Visible := False;
  end;

  if (Origen <> 3) then
     CBUnidadesBultos.Enabled := False;

  TipoListado := 0;
  ECantidadEtiquetas.Text := '1';

  ETexto1.Text := '0';
  ETexto2.Text := '';
  DEFecha.Date := REntorno.FechaTrabSH;
  EIdioma.Text := REntorno.IdiomaCanal;

  // Para recargar Grupo de listado y visibilida de campos
  CBValoradoChange(Self);

  ShowModal;

  Tipo := TipoListado;
  CantidadEtiquetas := StrToIntDef(ECantidadEtiquetas.Text, 0);
  CantidadEtiquetsEnBlanco := StrToIntDef(ECantidadEtiquetsEnBlanco.Text, 0);
  Tarifa := EFTarifa.Text;

  Valorado := BoolToInt(CBValorado.Checked);
  UsarBultos := BoolToInt(CBUnidadesBultos.Checked);

  Texto1 := ETexto1.Text;
  Texto2 := ETexto2.Text;
  Texto3 := DateToStr(DEFecha.Date);
  Idioma := EIdioma.Text;
end;

procedure TFPregCodBarras.CBValoradoChange(Sender: TObject);
begin
  EFTarifa.Visible := (CBValorado.Checked);
end;

procedure TFPregCodBarras.ASalirExecute(Sender: TObject);
begin
  TipoListado := 2;
  inherited;
end;

procedure TFPregCodBarras.AConfigurarExecute(Sender: TObject);
begin
  if (CBValorado.Checked) then
     Grupo := 63
  else
     Grupo := 196;

  inherited;
end;

procedure TFPregCodBarras.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  if Modo = 1 then
     TipoListado := 1
  else
     TipoListado := 0;

  inherited;
  Close;
end;

end.
