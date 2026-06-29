unit UFMLoteSimpleCreaRango;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, ULFEditFind2000;

type
  TFMLoteSimpleCreaRango = class(TFPEditSinNavegador)
     LLoteDesde: TLFLabel;
     ELoteDesde: TLFEdit;
     LFamilia: TLFLabel;
     EFFamilia: TLFEditFind2000;
     ETitFamilia: TLFEdit;
     LArticulo: TLFLabel;
     EFArticulo: TLFEditFind2000;
     ETitArticulo: TLFEdit;
     LLoteHasta: TLFLabel;
     ELoteHasta: TLFEdit;
     BCrearLotes: TButton;
     LFLabel1: TLFLabel;
     EPrefijo: TLFEdit;
     LLongitud: TLFLabel;
     ELongitud: TLFEdit;
     LEjemploDesde: TLFLabel;
     EEjemploDesde: TLFEdit;
     LEjemploHasta: TLFLabel;
     EEjemploHasta: TLFEdit;
     procedure ELoteDesdeChange(Sender: TObject);
     procedure ELoteHastaChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure BCrearLotesClick(Sender: TObject);
     procedure ELongitudChange(Sender: TObject);
     procedure EPrefijoChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CreaEjemplo;
  end;

var
  FMLoteSimpleCreaRango : TFMLoteSimpleCreaRango;

implementation

uses
  UDMLoteSimple, UDMMain, UEntorno, UUtiles;

  {$R *.dfm}

procedure TFMLoteSimpleCreaRango.ELoteDesdeChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(ELoteDesde.Text, -1) = -1) or (Abs(StrToIntDef(ELoteDesde.Text, -1)) > 2147483647) then
     ColorError(ELoteDesde)
  else
     ColorEdicion(ELoteDesde);

  CreaEjemplo;
end;

procedure TFMLoteSimpleCreaRango.ELoteHastaChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(ELoteHasta.Text, -1) = -1) or (Abs(StrToIntDef(ELoteHasta.Text, -1)) > 2147483647) then
     ColorError(ELoteHasta)
  else
     ColorEdicion(ELoteHasta);

  CreaEjemplo;
end;

procedure TFMLoteSimpleCreaRango.FormCreate(Sender: TObject);
begin
  inherited;
  ELoteDesdeChange(Sender);
  ELoteHastaChange(Sender);
end;

procedure TFMLoteSimpleCreaRango.BCrearLotesClick(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(ELoteDesde.Text, -1) <> -1) and (StrToIntDef(ELoteHasta.Text, -1) <> -1) then
  begin
     DMLoteSimple.CreaRango(EPrefijo.Text, StrToIntDef(ELoteDesde.Text, -1), StrToIntDef(ELoteHasta.Text, -1), StrToIntDef(ELongitud.Text, -1), EFArticulo.Text, EFFamilia.Text);
  end;
end;

procedure TFMLoteSimpleCreaRango.ELongitudChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(ELongitud.Text, -1) = -1) or (Abs(StrToIntDef(ELongitud.Text, -1)) > 20) then
     ColorError(ELongitud)
  else
     ColorEdicion(ELongitud);

  CreaEjemplo;
end;

procedure TFMLoteSimpleCreaRango.CreaEjemplo;
begin
  try
     EEjemploDesde.Text := Trim(EPrefijo.Text) + Ajusta(IntToStr(StrToIntDef(ELoteDesde.Text, -1)), 'I', StrToIntDef(ELongitud.Text, -1), '0');

     ColorInfo(EEjemploDesde);
  except
     ColorError(EEjemploDesde);
  end;

  try
     EEjemploHasta.Text := Trim(EPrefijo.Text) + Ajusta(IntToStr(StrToIntDef(ELoteHasta.Text, -1)), 'I', StrToIntDef(ELongitud.Text, -1), '0');

     ColorInfo(EEjemploHasta);
  except
     ColorError(EEjemploHasta);
  end;
end;

procedure TFMLoteSimpleCreaRango.EPrefijoChange(Sender: TObject);
begin
  inherited;
  CreaEjemplo;
end;

end.
