unit UFMLstOfertasEstado;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, Mask, UHYDescription, ULFHYDBDescription,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  ULFLabel, ComCtrls, ActnList, ULFActionList, ULFPageControl, ToolWin,
  ULFToolBar, rxToolEdit, DateUtils, ULFEdit, ULFDateEdit, ExtCtrls, ULFPanel,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFMLstOfertasEstado = class(TFPEditListadoSimple)
     LDesdeSerie: TLFLabel;
     EFSerieD: TLFEditFind2000;
     LHastaSerie: TLFLabel;
     EFSerieH: TLFEditFind2000;
     LDesdeAgrupacion: TLFLabel;
     EFAgrD: TLFEditFind2000;
     LHastaAgrupacion: TLFLabel;
     EFAgrH: TLFEditFind2000;
     GBTipo: TGroupBox;
     ToolButton1: TToolButton;
     RBAceptadas: TRadioButton;
     RBAnuladas: TRadioButton;
     RBTodas: TRadioButton;
     RBPendiente: TRadioButton;
     LDesdeFecha: TLFLabel;
     DTPFechaD: TLFDateEdit;
     LHastaFecha: TLFLabel;
     DTPFechaH: TLFDateEdit;
     EDesdeSerie: TLFEdit;
     EHastaSerie: TLFEdit;
     EDesdeAgrupacion: TLFEdit;
     EHastaAgrupacion: TLFEdit;
     PNLFiltro: TLFPanel;
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFSerieDChange(Sender: TObject);
     procedure EFSerieHChange(Sender: TObject);
     procedure EFAgrDChange(Sender: TObject);
     procedure EFAgrHChange(Sender: TObject);
  private
     { Private declarations }
     procedure Imprimir(Modo: integer);
  public
     { Public declarations }
  end;

var
  FMLstOfertasEstado : TFMLstOfertasEstado;

implementation

uses UEntorno, UFormGest, UUtiles, UDMLstOfertasEstado, UDMMain, UFMain, UDameDato;

{$R *.dfm}

procedure TFMLstOfertasEstado.ARecargarExecute(Sender: TObject);
var
  Year, Month, Day, Dias : word;
  MinSerie, MaxSerie, MinAgr, MaxAgr : string;
begin
  inherited;
  DMLstOfertasEstado.RecargaOfertas(MinSerie, MaxSerie, MinAgr, MaxAgr);
  EFSerieD.Text := MinSerie;
  EFSerieH.Text := MaxSerie;
  EFAgrD.Text := MinAgr;
  EFAgrH.Text := MaxAgr;

  // Saco la fecha y pongo todos las fecha en todo el mes actual
  DecodeDate(REntorno.FechaTrabSH, Year, Month, Day);
  Dias := DaysInMonth(REntorno.FechaTrabSH);

  DTPFechaD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DTPFechaH.Date := RecodeDay(REntorno.FechaTrabSH, Dias);
end;

procedure TFMLstOfertasEstado.Imprimir(Modo: integer);
var
  TipoServido : integer;
begin
  inherited;
  TipoServido := -1;
  if (RBPendiente.Checked) then
     TipoServido := 0; // Mostrará sólo los pendientes de servir
  if (RBAceptadas.Checked) then
     TipoServido := 5; // Mostrará sólo los servidos
  if (RBAnuladas.Checked) then
     TipoServido := 2; // Mostrará sólo los servidos
  if (RBTodas.Checked) then
     TipoServido := -1; // Los mostrará todos
  DMLstOfertasEstado.MostrarListado(Modo, EFSerieD.Text, EFSerieH.Text, EFAgrD.Text, EFAgrH.Text,
     TipoServido, DTPFechaD.Date, DTPFechaH.Date);
end;

procedure TFMLstOfertasEstado.APrevExecute(Sender: TObject);
begin
  inherited;
  Imprimir(0);
end;

procedure TFMLstOfertasEstado.AImprimirExecute(Sender: TObject);
begin
  inherited;
  Imprimir(1);
end;

procedure TFMLstOfertasEstado.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstOfertasEstado, DMLstOfertasEstado);
  ARecargar.Execute;
  Grupo := 638;
  Listado := DMLstOfertasEstado.frOfertas;
end;

procedure TFMLstOfertasEstado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstOfertasEstado);
end;

procedure TFMLstOfertasEstado.EFSerieDChange(Sender: TObject);
begin
  inherited;
  EDesdeSerie.Text := DameTituloSerie(EFSerieD.Text);
end;

procedure TFMLstOfertasEstado.EFSerieHChange(Sender: TObject);
begin
  inherited;
  EHastaSerie.Text := DameTituloSerie(EFSerieH.Text);
end;

procedure TFMLstOfertasEstado.EFAgrDChange(Sender: TObject);
begin
  inherited;
  EDesdeAgrupacion.Text := DameTituloAgrupacion('C', EFAgrD.Text);
end;

procedure TFMLstOfertasEstado.EFAgrHChange(Sender: TObject);
begin
  inherited;
  EHastaAgrupacion.Text := DameTituloAgrupacion('C', EFAgrH.Text);
end;

end.
