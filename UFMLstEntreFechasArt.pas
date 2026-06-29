{ TODO : Debería heredar de TFPEditListado }

unit UFMLstEntreFechasArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, UFIBDBEditfind, UControlEdit,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, UFormGest, rxToolEdit,
  ULFDBEdit, ULFCheckBox, ULFToolBar, ULFEditFind2000, TFlatCheckBoxUnit,
  ULFLabel, ULFDateEdit, ULFEdit;

type
  TFMLstEntreFechasArt = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtImprimir2: TToolButton;
     TButtPrevisualizar2: TToolButton;
     TButtSalir2: TToolButton;
     GBFechas: TGroupBox;
     LDesdeFecha: TLFLabel;
     LHastaFEcha: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     GBEstado: TGroupBox;
     GBArticulo: TGroupBox;
     EFEstado: TLFEditFind2000;
     CHBTodas: TLFCheckBox;
     LDesdeArticulo: TLFLabel;
     EFArtDesde: TLFEditFind2000;
     EArticuloDesde: TLFEdit;
     LHastaARticulo: TLFLabel;
     EFArtHasta: TLFEditFind2000;
     EArticuloHasta: TLFEdit;
     DBEEstado: TLFDbedit;
     TButtConfRapida: TToolButton;
     GBMoneda: TGroupBox;
     EFMoneda: TLFEditFind2000;
     EMoneda: TLFEdit;
     TButtExportar: TToolButton;
     procedure TButtPrevisualizar2Click(Sender: TObject);
     procedure TButtSalir2Click(Sender: TObject);
     procedure TButtImprimir2Click(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CHBTodasClick(Sender: TObject);
     procedure EFEstadoChange(Sender: TObject);
     procedure EFArtDesdeChange(Sender: TObject);
     procedure EFArtHastaChange(Sender: TObject);
     procedure EFArtDesdeBusqueda(Sender: TObject);
     procedure EFArtHastaBusqueda(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure TButtConfRapidaClick(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure TButtExportarClick(Sender: TObject);
  private
     { Private declarations }
     Almacen: string;
     Tipo: string;
     Serie: string;
     FechaDesde, FechaHasta: TDateTime;
     ArtDesde, ArtHasta: string;
     Estado: integer;
     procedure TomarDatos;
  public
     { Public declarations }
     procedure Muestra(aTipo, aSerie: string; aAlmacen: string);
  end;

var
  FMLstEntreFechasArt : TFMLstEntreFechasArt;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UDMLstEntreFechasArt, UDMLstFacturaProvArt,
  UDMLstFacturaArt, UFMListConfig;

{$R *.DFM}

procedure TFMLstEntreFechasArt.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMLstEntreFechasArt, DMLstEntreFechasArt);
end;

procedure TFMLstEntreFechasArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstEntreFechasArt);
  Action := caFree;
end;

procedure TFMLstEntreFechasArt.Muestra(aTipo, aSerie: string; aAlmacen: string);
var
  f_desde, f_hasta : TDateTime;
begin
  DMLstEntreFechasArt.Rangos(ArtDesde, ArtHasta, f_desde, f_hasta, aTipo, aSerie, aAlmacen);
  Almacen := aAlmacen;
  Tipo := aTipo;
  Serie := aSerie;
  Estado := 9; // Para que muestre todas
  DTPDesde.Date := Trunc(f_desde);
  DTPHasta.Date := Trunc(f_hasta);
  EFArtDesde.Text := ArtDesde;
  EFArtHasta.Text := ArtHasta;
  EFMoneda.Text := REntorno.Moneda;
  ShowModal;
  Free;
end;

procedure TFMLstEntreFechasArt.TButtPrevisualizar2Click(Sender: TObject);
begin
  TomarDatos;

  if (Tipo = 'FAC') then
     DMLstFacturaArt.MostrarListado(FechaDesde, FechaHasta, ArtDesde, ArtHasta, 0, Estado, Serie, EFMoneda.Text)
  else
  if (Tipo = 'FAP') then
     DMLstFacturaProvArt.MostrarListado(FechaDesde, FechaHasta, ArtDesde, ArtHasta, 0, Estado, Serie,
        EFMoneda.Text);
end;

procedure TFMLstEntreFechasArt.TButtSalir2Click(Sender: TObject);
begin
  Close;
end;

procedure TFMLstEntreFechasArt.TButtImprimir2Click(Sender: TObject);
begin
  TomarDatos;

  if (Tipo = 'FAC') then
     DMLstFacturaArt.MostrarListado(FechaDesde, FechaHasta, ArtDesde, ArtHasta, 1, Estado, Serie, EFMoneda.Text)
  else
  if (Tipo = 'FAP') then
     DMLstFacturaProvArt.MostrarListado(FechaDesde, FechaHasta, ArtDesde, ArtHasta, 1, Estado, Serie,
        EFMoneda.Text);
end;

procedure TFMLstEntreFechasArt.CHBTodasClick(Sender: TObject);
begin
  if (CHBTodas.State = cbChecked) then
  begin
     EFEstado.Enabled := False;
     EFEstado.Color := clInfoBk;
     EFEstado.Font.Color := clGrayText;
  end
  else
  begin
     EFEstado.Enabled := True;
     EFEstado.Color := clWindow;
     EFEstado.Font.Color := clWindowText;
     EFEstado.SetFocus;
  end;
end;

procedure TFMLstEntreFechasArt.EFEstadoChange(Sender: TObject);
begin
  Actualiza_EstadoRO(DMLstEntreFechasArt.xEstados, EFEstado.Text);
end;

procedure TFMLstEntreFechasArt.EFArtDesdeChange(Sender: TObject);
begin
  EArticuloDesde.Text := DameTituloArticulo(EFArtDesde.Text);
end;

procedure TFMLstEntreFechasArt.EFArtHastaChange(Sender: TObject);
begin
  EArticuloHasta.Text := DameTituloArticulo(EFArtHasta.Text);
end;

procedure TFMLstEntreFechasArt.EFArtDesdeBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMLstEntreFechasArt.EFArtHastaBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMLstEntreFechasArt.TomarDatos;
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;
  FechaDesde := HourIntoDate(DTPDesde.Date, '00:00:00');
  FechaHasta := HourIntoDate(DTPHasta.Date, '23:59:59');

  ArtDesde := EFArtDesde.Text;
  ArtHasta := EFArtHasta.Text;
  if CHBTodas.Checked then
     Estado := 9
  else
     Estado := StrToIntDef(EFEstado.Text, 0);
end;

procedure TFMLstEntreFechasArt.FormShow(Sender: TObject);
begin
  DTPDesde.SetFocus;
end;

procedure TFMLstEntreFechasArt.TButtConfRapidaClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  if (Tipo = 'FAC') then
     TFMListConfig.Create(Self).Muestra(48, Formato, Cabecera, Copias,
        Pijama, '', DMLstFacturaArt.frFactura)
  else if (Tipo = 'FAP') then
     TFMListConfig.Create(Self).Muestra(48, Formato, Cabecera, Copias,
        Pijama, '', DMLstFacturaprovArt.frFactura);
end;

procedure TFMLstEntreFechasArt.EFMonedaChange(Sender: TObject);
begin
  EMoneda.Text := DameTituloMoneda(EFMoneda.Text);
end;

procedure TFMLstEntreFechasArt.TButtExportarClick(Sender: TObject);
begin
  TomarDatos;

  if (Tipo = 'FAC') then
     DMLstFacturaArt.MostrarListado(FechaDesde, FechaHasta, ArtDesde, ArtHasta, 2, Estado, Serie, EFMoneda.Text)
  else
  if (Tipo = 'FAP') then
     DMLstFacturaProvArt.MostrarListado(FechaDesde, FechaHasta, ArtDesde, ArtHasta, 2, Estado, Serie,
        EFMoneda.Text);
end;

end.
