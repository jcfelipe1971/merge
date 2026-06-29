unit UFPregMargenProductos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, ActnList, Mask, DBCtrls, Grids, DBGrids,
  rxToolEdit, ULFCheckBox, ULFDBEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, ULFEdit,
  ULFLabel, ULFDateEdit, HYFIBQuery, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregMargenProductos = class(TFPEditListadoSimple)
     PNLInventarioStocks: TLFPanel;
     GBArticulo: TGroupBox;
     EFArticulo_D: TLFEditFind2000;
     EFArticulo_H: TLFEditFind2000;
     GBFechas: TGroupBox;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DBEArticuloDesde: TLFDbedit;
     DBEArticuloHasta: TLFDbedit;
     TButtConfiguracionRapida: TToolButton;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     RGModo: TRadioGroup;
     GBMoneda: TGroupBox;
     EFMoneda: TLFEditFind2000;
     DBEMoneda: TLFDbedit;
     GBOpciones: TGroupBox;
     ChkBMostrarCeros: TLFCheckBox;
     LBLFechaListado: TLFLabel;
     LBLComentario: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     GBProveedor: TGroupBox;
     LDesdeProveedor: TLFLabel;
     LHastaProveedor: TLFLabel;
     LFEFDProveedor: TLFEditFind2000;
     LFEFHProveedor: TLFEditFind2000;
     EHProveedor: TLFEdit;
     EDProveedor: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticulo_DChange(Sender: TObject);
     procedure EFArticulo_HChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFArticulo_DBusqueda(Sender: TObject);
     procedure EFArticulo_HBusqueda(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure LFEFDProveedorChange(Sender: TObject);
     procedure LFEFHProveedorChange(Sender: TObject);
  private
     procedure MostrarListado(Modo: smallint);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     function Articulo_Desde: string;
     function Articulo_Hasta: string;
  end;

var
  FPregMargenProductos : TFPregMargenProductos;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UFormGest, UUtiles, UFMListConfig, UDMRMargenProductos,
  UDMListados, UDameDato;

procedure TFPregMargenProductos.FormCreate(Sender: TObject);
var
  Min, Max : integer;
begin
  inherited;

  AbreData(TDMRMargenProductos, DMRMargenProductos);
  ARecargarExecute(Sender); // Calcula los límites

  // Conectar DataSources
  DBEArticuloDesde.DataSource := DMRMargenProductos.DSxArt_Desde;
  DBEArticuloHasta.DataSource := DMRMargenProductos.DSxArt_Hasta;

  Grupo := 504;
  Listado := DMRMargenProductos.frMargenProductos;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  DameMinMax('PRO', Min, Max);
  LFEFDProveedor.Text := IntToStr(Min);
  LFEFHProveedor.Text := IntToStr(Max);

  if (DMMain.EstadoKri(151) = 1) then
  begin
     GBProveedor.Visible := True;
     FPregMargenProductos.ClientHeight := TBMain.Height + GBArticulo.Height + GBProveedor.Height + GBFechas.Height + GBMoneda.Height + GBOpciones.Height;
  end
  else
  begin
     GBProveedor.Visible := False;
     FPregMargenProductos.Height := (TBMain.Height + GBArticulo.Height + GBFechas.Height + GBMoneda.Height + GBOpciones.Height);
  end;
end;

procedure TFPregMargenProductos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRMargenProductos);
end;

procedure TFPregMargenProductos.ARecargarExecute(Sender: TObject);
begin
  inherited;

  DMRMargenProductos.Rangos;
  RGModo.ItemIndex := 0;
  EFArticulo_D.Text := DMRMargenProductos.Articulo_Desde;
  EFArticulo_H.Text := DMRMargenProductos.Articulo_Hasta;
  DTPDesde.Date := DMRMargenProductos.Fecha_Desde;
  DTPHasta.Date := DMRMargenProductos.Fecha_Hasta;
  EFMoneda.Text := REntorno.Moneda;
  ChkBMostrarCeros.Checked := True;
  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
end;

// Previsualizar
procedure TFPregMargenProductos.APrevExecute(Sender: TObject);
begin
end;

// Imprimir
procedure TFPregMargenProductos.MostrarListado(Modo: smallint);
var
  f_desde, f_hasta : TDateTime;
begin
  f_desde := HourIntoDate(DTPDesde.Date, '00:00:00');
  f_hasta := HourIntoDate(DTPHasta.Date, '23:59:59');
  DMListados.DatosInforme(DTPFechaListado.Date, EComentario.Text);
  DMRMargenProductos.MostrarListado(RGModo.ItemIndex, Modo,
     FPregMargenProductos.Articulo_Desde,
     FPregMargenProductos.Articulo_Hasta, f_desde, f_hasta, ChkBMostrarCeros.Checked,
     StrToInt(LFEFDProveedor.Text), StrToInt(LFEFHProveedor.Text));
end;

procedure TFPregMargenProductos.EFArticulo_DChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMRMargenProductos.xArt_Desde, EFArticulo_D.Text);
end;

procedure TFPregMargenProductos.EFArticulo_HChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMRMargenProductos.xArt_Hasta, EFArticulo_H.Text);
end;

procedure TFPregMargenProductos.FormShow(Sender: TObject);
begin
  EFArticulo_D.SetFocus;
end;

function TFPregMargenProductos.Articulo_Desde: string;
begin
  Result := EFArticulo_D.Text;
end;

function TFPregMargenProductos.Articulo_Hasta: string;
begin
  Result := EFArticulo_H.Text;
end;

procedure TFPregMargenProductos.EFArticulo_DBusqueda(Sender: TObject);
begin
  EFArticulo_D.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregMargenProductos.EFArticulo_HBusqueda(Sender: TObject);
begin
  EFArticulo_H.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregMargenProductos.EFMonedaChange(Sender: TObject);
begin
  DMRMargenProductos.CambiaMoneda(EFMoneda.Text);
end;

procedure TFPregMargenProductos.LFEFDProveedorChange(Sender: TObject);
begin
  inherited;
  EDProveedor.Text := DameTituloProveedor(StrToIntDef(LFEFDProveedor.Text, 0));
end;

procedure TFPregMargenProductos.LFEFHProveedorChange(Sender: TObject);
begin
  inherited;
  EHProveedor.Text := DameTituloProveedor(StrToIntDef(LFEFHProveedor.Text, 0));
end;

procedure TFPregMargenProductos.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  MostrarListado(Modo);
end;

end.
