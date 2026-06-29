unit UProFMLstEtiOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ComCtrls, StdCtrls, ExtCtrls,
  ToolWin, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, DBCtrls,
  Grids, DBGrids, rxToolEdit, Math, ULFActionList, ULFPageControl, ULFToolBar,
  ULFComboBox, ULFEdit, ULFPanel, ULFEditFind2000, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage;

type
  TProFMLstEtiOrden = class(TFPEditListadoSfg)
     PanelCentral: TLFPanel;
     LNroEtiquetas: TLFLabel;
     LabelOrd: TLFLabel;
     EEtiquetasVacias: TLFEdit;
     EEtiquetas: TLFEdit;
     LUnidadesPorCaja: TLFLabel;
     EUnidadesPorCaja: TLFEdit;
     LCajasPorBulto: TLFLabel;
     ECajasPorBulto: TLFEdit;
     LUnidades: TLFLabel;
     EUnidades: TLFEdit;
     BUnidades: TButton;
     BCajas: TButton;
     BBultos: TButton;
     LUnidadesXBulto: TLFLabel;
     EUnidadesXBulto: TLFEdit;
     EPrimeraEtiqueta: TLFEdit;
     LPrimeraEtiqueta: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure BUnidadesClick(Sender: TObject);
     procedure BCajasClick(Sender: TObject);
     procedure BBultosClick(Sender: TObject);
  private
     { Private declarations }
     IdOrden, NumCopias: integer;
     Etiquetas, EtiquetasVacias, PrimeraEtiqueta: integer;
     UnidadesPorCaja, CajasPorBulto: double;
     procedure Recarga;
     procedure TomarDatos;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra(aIdOrden, aNumCopias: integer; aUnidadesPorCaja, aCajasPorBulto: double);
  end;

var
  ProFMLstEtiOrden : TProFMLstEtiOrden;

implementation

uses UDMMain, UProDMLSTEtiOrden, UEntorno, UFormGest;

{$R *.dfm}

procedure TProFMLstEtiOrden.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLSTEtiOrden, ProDMLSTEtiOrden);
  ARecargar.Execute;
  ProDMLstEtiOrden.Capsalera := 1;

  ImprimirPrevisualizar := MyImprimirPrevisualizar;
  Listado := ProDMLSTEtiOrden.frEtiOrdenes;
  Grupo := 8047;
end;

procedure TProFMLstEtiOrden.Recarga;
begin
  EEtiquetasVacias.Text := '0';
  EPrimeraEtiqueta.Text := '1';
  EEtiquetas.Text := IntToStr(NumCopias);
end;

procedure TProFMLstEtiOrden.FormDestroy(Sender: TObject);
begin
  inherited;
  CierraData(ProDMLSTEtiOrden);
end;

procedure TProFMLstEtiOrden.ARecargarExecute(Sender: TObject);
begin
  inherited;
  Recarga;
end;

procedure TProFMLstEtiOrden.TomarDatos;
begin
  EtiquetasVacias := StrToIntDef(EEtiquetasVacias.Text, 0);
  PrimeraEtiqueta := StrToIntDef(EPrimeraEtiqueta.Text, 0);
  Etiquetas := StrToIntDef(EEtiquetas.Text, 0);
end;

procedure TProFMLstEtiOrden.Muestra(aIdOrden, aNumCopias: integer; aUnidadesPorCaja, aCajasPorBulto: double);
begin
  NumCopias := aNumCopias;
  UnidadesPorCaja := aUnidadesPorCaja;
  CajasPorBulto := aCajasPorBulto;
  if (UnidadesPorCaja = 0) then
     UnidadesPorCaja := 1;
  if (CajasPorBulto = 0) then
     CajasPorBulto := 1;

  IdOrden := aIdOrden;
  EEtiquetasVacias.Text := '0';
  EEtiquetas.Text := IntToStr(NumCopias);
  EUnidades.Text := IntToStr(NumCopias);
  EUnidadesPorCaja.Text := FloatToStr(UnidadesPorCaja);
  ECajasPorBulto.Text := FloatToStr(CajasPorBulto);

  EUnidadesXBulto.Text := FloatToStr(NumCopias / NumCopias);

  ShowModal;
end;

procedure TProFMLstEtiOrden.BUnidadesClick(Sender: TObject);
begin
  inherited;
  EEtiquetas.Text := IntToStr(NumCopias);
  EUnidadesXBulto.Text := FloatToStr(NumCopias / NumCopias);
end;

procedure TProFMLstEtiOrden.BCajasClick(Sender: TObject);
begin
  inherited;
  EEtiquetas.Text := IntToStr(Ceil(NumCopias / UnidadesPorCaja));
  EUnidadesXBulto.Text := FloatToStr(NumCopias / (NumCopias / UnidadesPorCaja));
end;

procedure TProFMLstEtiOrden.BBultosClick(Sender: TObject);
begin
  inherited;
  EEtiquetas.Text := IntToStr(Ceil(NumCopias / UnidadesPorCaja / CajasPorBulto));
  EUnidadesXBulto.Text := FloatToStr(NumCopias / (NumCopias / UnidadesPorCaja / CajasPorBulto));
end;

procedure TProFMLstEtiOrden.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  TomarDatos;
  ProDMLstEtiOrden.MostrarListado(Grupo, Modo, IdOrden, EtiquetasVacias, Etiquetas, PrimeraEtiqueta, StrToFloat(EUnidadesXBulto.Text));
end;

end.
