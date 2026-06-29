unit UFMLstEntrefechasAlbArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, ExtCtrls, UFIBDBEditfind, UControlEdit,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, UFormGest, rxToolEdit,
  ULFDBEdit, ULFCheckBox, ULFToolBar, ULFEditFind2000, TFlatCheckBoxUnit,
  ULFLabel;

type
  TFMLstEntrefechasAlbArt = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtImprimir2: TToolButton;
     TButtPrevisualizar2: TToolButton;
     TButtSalir2: TToolButton;
     GBFechas: TGroupBox;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPDesde: TDateEdit;
     DTPHasta: TDateEdit;
     GBEstado: TGroupBox;
     GBArticulo: TGroupBox;
     EFEstado: TLFEditFind2000;
     CHBTodas: TLFCheckBox;
     LDesdeArticulo: TLFLabel;
     EFArtDesde: TLFEditFind2000;
     DBEArticuloDesde: TLFDbedit;
     LHastaArticulo: TLFLabel;
     EFArtHasta: TLFEditFind2000;
     DBEArticuloHasta: TLFDbedit;
     DBEEstado: TLFDbedit;
     TButtConfRapida: TToolButton;
     GBMoneda: TGroupBox;
     EFMoneda: TLFEditFind2000;
     DBEMoneda: TLFDbedit;
     TButtExportar: TToolButton;
     // constructor FormCreate(Sender: TComponent;tipo,serie:string);
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
     Almacen: string;
     Tipo: string;
     Serie: string;
     FechaDesde, FechaHasta: TDateTime;
     ArticuloDesde, ArticuloHasta: string;
     Estado: integer;
     procedure TomarDatos;
  public
     procedure Muestra(aTipo, aSerie, aAlmacen: string);
  end;

var
  FMLstEntrefechasAlbArt : TFMLstEntrefechasAlbArt;

implementation

uses UDMMain, UEntorno, UDMLstEntrefechasAlbArt, UUtiles, UDMLstAlbaranProvArt,
  UDMLstAlbaranArt, UFMListConfig;

{$R *.DFM}

procedure TFMLstEntrefechasAlbArt.Muestra(aTipo, aSerie, aAlmacen: string);
var
  f_desde, f_hasta : TDateTime;
begin
  AbreData(TDMLstEntrefechasAlbArt, DMLstEntrefechasAlbArt);
  DMLstEntrefechasAlbArt.rangos(ArticuloDesde, ArticuloHasta, f_desde, f_hasta, Tipo, Serie, Almacen);
  Almacen := aAlmacen;
  Tipo := aTipo;
  Serie := aSerie;
  Estado := -1; // Para que muestre todas
  DTPDesde.Date := Trunc(f_desde);
  DTPHasta.Date := Trunc(f_hasta);
  EFArtDesde.Text := ArticuloDesde;
  EFArtHasta.Text := ArticuloHasta;
  EFMoneda.Text := REntorno.Moneda;
  ShowModal;
  Free;
end;

procedure TFMLstEntrefechasAlbArt.TButtPrevisualizar2Click(Sender: TObject);
begin
  TomarDatos;

  if (Tipo = 'ALB') then
     DMLstAlbaranArt.MostrarListado(FechaDesde, FechaHasta, ArticuloDesde, ArticuloHasta, 0, Estado, Serie, EFMoneda.Text)
  else
  if (Tipo = 'ALP') then
     DMLstAlbaranProvArt.MostrarListado(FechaDesde, FechaHasta, ArticuloDesde, ArticuloHasta, 0, Estado, Serie, EFMoneda.Text);
end;

procedure TFMLstEntrefechasAlbArt.TButtSalir2Click(Sender: TObject);
begin
  Close;
end;

procedure TFMLstEntrefechasAlbArt.TButtImprimir2Click(Sender: TObject);
begin
  TomarDatos;

  if (Tipo = 'ALB') then
     DMLstAlbaranArt.MostrarListado(FechaDesde, FechaHasta, ArticuloDesde, ArticuloHasta, 1, Estado, Serie, EFMoneda.Text)
  else
  if (Tipo = 'ALP') then
     DMLstAlbaranProvArt.MostrarListado(FechaDesde, FechaHasta, ArticuloDesde, ArticuloHasta, 1, Estado, Serie, EFMoneda.Text);
end;

procedure TFMLstEntrefechasAlbArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstEntrefechasAlbArt);
end;

procedure TFMLstEntrefechasAlbArt.CHBTodasClick(Sender: TObject);
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

procedure TFMLstEntrefechasAlbArt.EFEstadoChange(Sender: TObject);
begin
  Actualiza_EstadoRO(DMLstEntreFechasAlbArt.xEstados, EFEstado.Text);
end;

procedure TFMLstEntrefechasAlbArt.EFArtDesdeChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstEntreFechasAlbArt.xArt_Desde, EFArtDesde.Text);
end;

procedure TFMLstEntrefechasAlbArt.EFArtHastaChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstEntreFechasAlbArt.xArt_Hasta, EFArtHasta.Text);
end;

procedure TFMLstEntrefechasAlbArt.EFArtDesdeBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>"' + REntorno.FamSistema + '"';
end;

procedure TFMLstEntrefechasAlbArt.EFArtHastaBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>"' + REntorno.FamSistema + '"';
end;

procedure TFMLstEntrefechasAlbArt.TomarDatos;
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;

  FechaDesde := HourIntoDate(DTPDesde.Date, '00:00:00');
  FechaHasta := HourIntoDate(DTPHasta.Date, '23:59:59');

  ArticuloDesde := EFArtDesde.Text;
  ArticuloHasta := EFArtHasta.Text;
  if CHBTodas.Checked then
     Estado := -1
  else
     Estado := StrToIntDef(EFEstado.Text, 0);

  {if CBEstado.Text='Facturas Cerradas'
    then estado:=5
    else if CBEstado.Text='Facturas Normales'
           then estado:=0
           else estado:=6;}
end;

procedure TFMLstEntrefechasAlbArt.FormShow(Sender: TObject);
begin
  DTPDesde.SetFocus;
end;

procedure TFMLstEntrefechasAlbArt.TButtConfRapidaClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  if (Tipo = 'ALB') then
     TFMListConfig.Create(Self).Muestra(9001, Formato, Cabecera, Copias,
        Pijama, '', DMLstAlbaranArt.frAlbaran)
  else if (Tipo = 'ALP') then
     TFMListConfig.Create(Self).Muestra(9001, Formato, Cabecera, Copias,
        Pijama, '', DMLstAlbaranProvArt.frAlbaran);
end;

procedure TFMLstEntrefechasAlbArt.EFMonedaChange(Sender: TObject);
begin
  DMLstEntreFechasAlbArt.CambiaMoneda(EFMoneda.Text);
end;

procedure TFMLstEntrefechasAlbArt.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TFMLstEntrefechasAlbArt.TButtExportarClick(Sender: TObject);
begin
  TomarDatos;

  if (Tipo = 'ALB') then
     DMLstAlbaranArt.MostrarListado(FechaDesde, FechaHasta, ArticuloDesde, ArticuloHasta, 2, Estado, Serie, EFMoneda.Text)
  else
  if (Tipo = 'ALP') then
     DMLstAlbaranProvArt.MostrarListado(FechaDesde, FechaHasta, ArticuloDesde, ArticuloHasta, 2, Estado, Serie, EFMoneda.Text);
end;

end.
