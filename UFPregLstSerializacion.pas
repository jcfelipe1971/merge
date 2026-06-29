unit UFPregLstSerializacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, Mask, DBCtrls, ULFDBEdit, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel,
  rxToolEdit, ULFEdit, ExtCtrls, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFPregLstSerializacion = class(TFPEditListadoSimple)
     GBArticulo: TGroupBox;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     EFArticuloDesde: TLFEditFind2000;
     EFArticuloHasta: TLFEditFind2000;
     DBTituloArticuloD: TLFDbedit;
     DBTituloArticuloH: TLFDbedit;
     DBSeries: TGroupBox;
     LDesdeSerie: TLFLabel;
     LHastaSerie: TLFLabel;
     EFSerieDesde: TLFEditFind2000;
     EFSerieHasta: TLFEditFind2000;
     DBTituloSerieH: TLFDbedit;
     DBTituloSerieD: TLFDbedit;
     TButtConfiguracion: TToolButton;
     AConfRapida: TAction;
     PNLDatosListado: TLFPanel;
     LComentario: TLFLabel;
     LFechaListado: TLFLabel;
     EComentario: TLFEdit;
     TDPFechaListado: TLFDateEdit;
     RGMostrar: TRadioGroup;
     procedure EFArticuloDesdeChange(Sender: TObject);
     procedure EFArticuloHastaChange(Sender: TObject);
     procedure EFArticuloDesdeBusqueda(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure EFSerieDesdeChange(Sender: TObject);
     procedure EFSerieDesdeBusqueda(Sender: TObject);
     procedure EFSerieHastaBusqueda(Sender: TObject);
     procedure EFSerieHastaChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     artdesde, arthasta: string;
  end;

var
  FPregLstSerializacion : TFPregLstSerializacion;

implementation

uses UDMLstSerializacion, UEntorno, UFormGest, UDMArtSerializacion,
  UDMListados, UFMListConfig;

{$R *.dfm}

procedure TFPregLstSerializacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstSerializacion, DMLstSerializacion);
end;

procedure TFPregLstSerializacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstSerializacion);
end;

procedure TFPregLstSerializacion.EFArticuloDesdeChange(Sender: TObject);
begin
  inherited;
  DMLstSerializacion.RefrescaArt(DMLstSerializacion.xArtDesde, EFArticuloDesde.Text);
end;

procedure TFPregLstSerializacion.EFArticuloHastaChange(Sender: TObject);
begin
  inherited;
  DMLstSerializacion.RefrescaArt(DMLstSerializacion.xArtHasta, EFArticuloHasta.Text);
end;

procedure TFPregLstSerializacion.EFArticuloDesdeBusqueda(Sender: TObject);
begin
  inherited;
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregLstSerializacion.EFSerieDesdeChange(Sender: TObject);
begin
  inherited;
  DMLstSerializacion.RefrescaSerie(DMLstSerializacion.xSerieDesde, EFSerieDesde.Text,
     DMArtSerializacion.QMArtSerializacionCANAL.AsString,
     DMArtSerializacion.QMArtSerializacionALMACEN.AsString,
     EFArticuloDesde.Text);
end;

procedure TFPregLstSerializacion.EFSerieDesdeBusqueda(Sender: TObject);
begin
  inherited;
  artdesde := EFArticuloDesde.Text;
  arthasta := EFArticuloHasta.Text;
  DMListados.Normalizar_Desde_Hasta(ArtDesde, ArtHasta);

  EFSerieDesde.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
     ' AND CANAL = ' + REntorno.CanalStr +
     ' AND ARTICULO between ' + '''' + ArtDesde + ''' ' + ' and ' + '''' + ArtHasta + '''' + // ''' + EFArticuloDesde.Text +''' '+
     ' AND ALMACEN =''' + REntorno.AlmacenDefecto + '''' +
     ' AND ACTIVO = 1 ';
end;

procedure TFPregLstSerializacion.EFSerieHastaBusqueda(Sender: TObject);
begin
  inherited;
  artdesde := EFArticuloDesde.Text;
  arthasta := EFArticuloHasta.Text;
  DMListados.Normalizar_Desde_Hasta(ArtDesde, ArtHasta);

  EFSerieHasta.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
     ' AND CANAL = ' + REntorno.CanalStr +
     ' AND ARTICULO between ' + '''' + ArtDesde + ''' ' + ' and ' + '''' + ArtHasta + '''' + // ''' + EFArticuloHasta.Text +''' '+
     ' AND ALMACEN =''' + REntorno.AlmacenDefecto + '''' +
     ' AND ACTIVO = 1';
end;

procedure TFPregLstSerializacion.EFSerieHastaChange(Sender: TObject);
begin
  inherited;
  DMLstSerializacion.RefrescaSerie(DMLstSerializacion.xSerieHasta, EFSerieHasta.Text,
     DMArtSerializacion.QMArtSerializacionCANAL.AsString,
     DMArtSerializacion.QMArtSerializacionALMACEN.AsString,
     EFArticuloHasta.Text);
end;


procedure TFPregLstSerializacion.APrevExecute(Sender: TObject);
var
  nseriedesde, nseriehasta : string;
begin
  inherited;
  nseriedesde := EFSerieDesde.Text;
  nseriehasta := EFSerieHasta.Text;
  DMListados.Normalizar_Desde_Hasta(nseriedesde, nseriehasta);

  DMLstSerializacion.FechaListado := TDPFechaListado.Date;
  DMLstSerializacion.Comentario := EComentario.Text;
  DMLstSerializacion.RangoSeries := Format('Desde Artículo: %s Hasta Artículo: %s - Desde Serie: %s Hasta Serie: %s', [EFArticuloDesde.Text, EFArticuloHasta.Text, EFSerieDesde.Text, EFSerieHasta.Text]);
  DMLstSerializacion.MostrarListado(0, RGMostrar.ItemIndex, REntorno.Empresa, REntorno.Canal, ArtDesde, ArtHasta,
     nseriedesde, nseriehasta, REntorno.AlmacenDefecto);
end;

procedure TFPregLstSerializacion.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  if (RGMostrar.ItemIndex = 0) then //Entradas y Salidas
     TFMListConfig.Create(Self).Muestra(8210, Formato, Cabecera, Copias, Pijama, '', DMLstSerializacion.frSerializacion)
  else if (RGMostrar.ItemIndex = 1) then //Stock
     TFMListConfig.Create(Self).Muestra(8211, Formato, Cabecera, Copias, Pijama, '', DMLstSerializacion.frSerializacion);
end;

procedure TFPregLstSerializacion.AImprimirExecute(Sender: TObject);
var
  nseriedesde, nseriehasta : string;
begin
  inherited;
  nseriedesde := EFSerieDesde.Text;
  nseriehasta := EFSerieHasta.Text;
  DMListados.Normalizar_Desde_Hasta(nseriedesde, nseriehasta);

  DMLstSerializacion.FechaListado := TDPFechaListado.Date;
  DMLstSerializacion.Comentario := EComentario.Text;
  DMLstSerializacion.RangoSeries := Format('Desde Artículo: %s Hasta Artículo: %s - Desde Serie: %s Hasta Serie: %s', [EFArticuloDesde.Text, EFArticuloHasta.Text, EFSerieDesde.Text, EFSerieHasta.Text]);
  DMLstSerializacion.MostrarListado(1, RGMostrar.ItemIndex, REntorno.Empresa, REntorno.Canal, ArtDesde, ArtHasta,
     nseriedesde, nseriehasta, REntorno.AlmacenDefecto);
end;

end.
