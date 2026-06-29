unit UFPregCodBarrasDevol;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, DBCtrls, ULFDBEdit, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, Mask,
  rxToolEdit, ULFLabel, ExtCtrls, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFEdit, ULFDateEdit, rxPlacemnt, ULFFormStorage;

type
  TFPregCodBarrasDevol = class(TFPEditListadoSimple)
     PNFechas: TLFPanel;
     GBFechas: TGroupBox;
     Label7: TLFLabel;
     DTPFechaD: TLFDateEdit;
     Label8: TLFLabel;
     DTPFechaH: TLFDateEdit;
     PNSeries: TLFPanel;
     GBSeries: TGroupBox;
     LBLSerieD: TLFLabel;
     LBLSerieH: TLFLabel;
     EFSerieD: TLFEditFind2000;
     EFSerieH: TLFEditFind2000;
     PNAlmacenes: TLFPanel;
     GBAlmacenes: TGroupBox;
     Label5: TLFLabel;
     EFAlmacen_D: TLFEditFind2000;
     DBEAlmacenDesde: TLFDbedit;
     Label6: TLFLabel;
     EFAlmacen_H: TLFEditFind2000;
     DBEAlmacenHasta: TLFDbedit;
     LFPanel1: TLFPanel;
     GBOpciones: TGroupBox;
     LFLnBlanco: TLFLabel;
     LFEnBlanco: TLFEdit;
     LFDesglosar: TLFCheckBox;
     LFEFTarifa: TLFEditFind2000;
     ToolButton1: TToolButton;
     AConfRapida: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);

     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure EFAlmacen_DChange(Sender: TObject);
     procedure EFAlmacen_HChange(Sender: TObject);
     procedure LFDesglosarChange(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
  private
     { Private declarations }
     Valorado: integer;
  public
     { Public declarations }
  end;

var
  FPregCodBarrasDevol : TFPregCodBarrasDevol;

implementation

uses UFormGest, UEntorno, UUtiles, UDMPregCodBarrasDevol, UDMLstEtiquetas,
  UDMLstArticulos, UFMListConfig;

{$R *.dfm}

procedure TFPregCodBarrasDevol.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPregCodBarrasDevol, DMPregCodBarrasDevol);
  ARecargarExecute(Sender);
end;

procedure TFPregCodBarrasDevol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPregCodBarrasDevol);
end;

procedure TFPregCodBarrasDevol.ARecargarExecute(Sender: TObject);
begin
  DTPFechaD.Date := Date;
  DTPFechaH.Date := Date;
  EFAlmacen_D.Text := REntorno.AlmacenDefecto;
  EFAlmacen_H.Text := REntorno.AlmacenDefecto;
  EFSerieD.Text := REntorno.Serie;
  EFSerieH.Text := REntorno.Serie;
  LFEnBlanco.Text := '0';
  LFDesglosar.Checked := True;
  Valorado := 1;
  LFEFTarifa.Text := REntorno.TarifaDefecto;
end;

procedure TFPregCodBarrasDevol.APrevExecute(Sender: TObject);
begin
  AbreData(TDMLstEtiquetas, DMLstEtiquetas);
  DMLstEtiquetas.MostrarLstCodBarrasDevol(EFSerieD.Text, EFSerieH.Text, EFAlmacen_D.Text,
     EFAlmacen_H.Text, DTPFechaD.Date, DTPFechaH.Date, StrToIntDef(LFEnBlanco.Text, 0),
     Valorado, 0, LFEFTarifa.Text);
  CierraData(DMLstEtiquetas);
end;

procedure TFPregCodBarrasDevol.EFAlmacen_DChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(DMPregCodBarrasDevol.xAlmacen_Desde, EFAlmacen_D.Text);
end;

procedure TFPregCodBarrasDevol.EFAlmacen_HChange(Sender: TObject);
begin
  Actualiza_AlmacenRO(DMPregCodBarrasDevol.xAlmacen_Hasta, EFAlmacen_H.Text);
end;

procedure TFPregCodBarrasDevol.LFDesglosarChange(Sender: TObject);
begin
  if (LFDesglosar.Checked) then
  begin
     Valorado := 1;
     LFEFTarifa.Visible := True;
  end
  else
  begin
     Valorado := 0;
     LFEFTarifa.Visible := False;
  end;
end;

procedure TFPregCodBarrasDevol.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama, Grupo : integer;
begin
  if (LFDesglosar.Checked) then
     Grupo := 63
  else
     Grupo := 196;
  AbreData(TDMLstEtiquetas, DMLstEtiquetas);
  TFMListConfig.Create(Self).Muestra(grupo, Formato, Cabecera, Copias,
     Pijama, '', DMLstEtiquetas.frArticulos);
  CierraData(DMLstEtiquetas);
end;

end.
