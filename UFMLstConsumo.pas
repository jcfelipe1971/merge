unit UFMLstConsumo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, rxToolEdit, Mask, UHYDescription,
  ULFHYDBDescription, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel, DateUtils, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, ULFEdit, ExtCtrls, ULFPanel,
  UFPEditListadoSimple;

type
  TFMLstConsumo = class(TFPEditListadoSimple)
     LDesdeSerie: TLFLabel;
     EFSerieD: TLFEditFind2000;
     ETituloDesdeSerie: TLFEdit;
     LHastaSerie: TLFLabel;
     EFSerieH: TLFEditFind2000;
     ETituloHastaSerie: TLFEdit;
     LAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     ETituloAgrupacion: TLFEdit;
     LDesdeFecha: TLFLabel;
     DTPFechaD: TLFDateEdit;
     LHastaFecha: TLFLabel;
     DTPFechaH: TLFDateEdit;
     TButtConfig: TToolButton;
     EFClienteH: TLFEditFind2000;
     EFClienteD: TLFEditFind2000;
     ETituloDesdeCliente: TLFEdit;
     ETituloHastaCliente: TLFEdit;
     LHastaCliente: TLFLabel;
     LDesdeCliente: TLFLabel;
     LHastaAgente: TLFLabel;
     LDesdeAgente: TLFLabel;
     ETituloDesdeAgente: TLFEdit;
     ETituloHastaAgente: TLFEdit;
     EFAgenteH: TLFEditFind2000;
     EFAgenteD: TLFEditFind2000;
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EFSerieDChange(Sender: TObject);
     procedure EFSerieHChange(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFAgenteDChange(Sender: TObject);
     procedure EFAgenteHChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMLstConsumo : TFMLstConsumo;

implementation

uses UDMListados, UEntorno, UFormGest,
  UUtiles, UFMListConfig, UDMMain, UFMain, UDMLstConsumo, UDameDato;

{$R *.dfm}

procedure TFMLstConsumo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLSTConsumo, DMLSTConsumo);

  Grupo := 10002;
  DMLSTConsumo.Grupo := Grupo;
  Listado := DMLSTConsumo.frConsumo;

  ARecargar.Execute;
end;

procedure TFMLstConsumo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLSTConsumo);
end;

procedure TFMLstConsumo.ARecargarExecute(Sender: TObject);
var
  year, month, day, dias : word;
begin
  inherited;
  DMLstConsumo.RecargaConsumo;
  EFSerieD.Text := DMLSTConsumo.SerieD;
  EFSerieH.Text := DMLSTConsumo.SerieH;
  EFClienteD.Text := IntToStr(DMLSTConsumo.ClienteD);
  EFClienteH.Text := IntToStr(DMLSTConsumo.ClienteH);
  EFAgrupacion.Text := DMLSTConsumo.Agrupacion;

  if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
  begin
     EFAgenteD.Text := IntToStr(DameAgenteUsuario(REntorno.Usuario));
     EFAgenteH.Text := EFAgenteD.Text;
     EFAgenteD.Enabled := False;
     EFAgenteH.Enabled := False;
  end
  else
  begin
     EFAgenteD.Text := IntToStr(DMLSTConsumo.AgenteD);
     EFAgenteH.Text := IntToStr(DMLSTConsumo.AgenteH);
     EFAgenteD.Enabled := True;
     EFAgenteH.Enabled := True;
  end;

  // Saco la fecha y pongo todos las fecha en todo el mes actual
  DecodeDate(REntorno.FechaTrabSH, Year, Month, Day);
  dias := DaysInMonth(REntorno.FechaTrabSH);

  DTPFechaD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
end;

procedure TFMLstConsumo.APrevExecute(Sender: TObject);
begin
  inherited;
  DMLSTConsumo.MostrarListado(0, EFSerieD.Text, EFSerieH.Text, EFAgrupacion.Text,
     StrToIntDef(EFClienteD.Text, 0), StrToIntDef(EFClienteH.Text, 0), StrToIntDef(EFAgenteD.Text, 0), StrToIntDef(EFAgenteH.Text, 0), DTPFechaD.Date, DTPFechaH.Date);
end;

procedure TFMLstConsumo.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMLSTConsumo.MostrarListado(1, EFSerieD.Text, EFSerieH.Text, EFAgrupacion.Text,
     StrToIntDef(EFClienteD.Text, 0), StrToIntDef(EFClienteH.Text, 0), StrToIntDef(EFAgenteD.Text, 0), StrToIntDef(EFAgenteH.Text, 0), DTPFechaD.Date, DTPFechaH.Date);
end;

procedure TFMLstConsumo.EFSerieDChange(Sender: TObject);
begin
  inherited;
  ETituloDesdeSerie.Text := DameTituloSerie(EFSerieD.Text);
end;

procedure TFMLstConsumo.EFSerieHChange(Sender: TObject);
begin
  inherited;
  ETituloHastaSerie.Text := DameTituloSerie(EFSerieH.Text);
end;

procedure TFMLstConsumo.EFAgrupacionChange(Sender: TObject);
begin
  inherited;
  ETituloAgrupacion.Text := DameTituloAgrupacion('T', EFAgrupacion.Text);
end;

procedure TFMLstConsumo.EFClienteDChange(Sender: TObject);
begin
  inherited;
  ETituloDesdeCliente.Text := DameTituloCliente(StrToIntDef(EFClienteD.Text, 0));
end;

procedure TFMLstConsumo.EFClienteHChange(Sender: TObject);
begin
  inherited;
  ETituloHastaCliente.Text := DameTituloCliente(StrToIntDef(EFClienteH.Text, 0));
end;

procedure TFMLstConsumo.EFAgenteDChange(Sender: TObject);
begin
  inherited;
  ETituloDesdeAgente.Text := DameTituloAgente(StrToIntDef(EFAgenteD.Text, 0));
end;

procedure TFMLstConsumo.EFAgenteHChange(Sender: TObject);
begin
  inherited;
  ETituloDesdeAgente.Text := DameTituloAgente(StrToIntDef(EFAgenteH.Text, 0));
end;

end.
