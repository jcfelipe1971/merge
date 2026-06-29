unit UFMParamArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, Mask, DBCtrls, Buttons, StdCtrls, Spin, UFormGest,
  ULFFormStorage, ActnList, ULFActionList, ULFToolBar, UG2kTBLoc,
  ULFPageControl, ULFPanel, ULFDBEdit, ULFLabel, ULFEdit;

type
  TFMParamArticulos = class(TFPEdit)
     CEDetalle: TControlEdit;
     PCabecera: TLFPanel;
     CECabecera: TControlEdit;
     CECabeceraPMEdit: TPopUpTeclas;
     DBETitulo: TLFDbedit;
     LTitulo: TLFLabel;
     LCodModelo: TLFLabel;
     DBECodigo: TLFDbedit;
     GridDetalle: THYTDBGrid;
     SBBorraTodas: TSpeedButton;
     SBBorraLinea: TSpeedButton;
     SBArriba: TSpeedButton;
     SBAbajo: TSpeedButton;
     PNLBotonera: TLFPanel;
     PNLSeleccion: TLFPanel;
     LDigitos: TLFLabel;
     LTipo: TLFLabel;
     SEEjercicio: TSpinEdit;
     LEjercicio: TLFLabel;
     SETemporada: TSpinEdit;
     LTemporada: TLFLabel;
     LTalla: TLFLabel;
     SETalla: TSpinEdit;
     SEColor: TSpinEdit;
     LColor: TLFLabel;
     LBaseModelo: TLFLabel;
     SEBase: TSpinEdit;
     SELibre: TSpinEdit;
     LTextoLibre: TLFLabel;
     ETexto: TLFEdit;
     LTexto: TLFLabel;
     SBLibre: TSpeedButton;
     SBBase: TSpeedButton;
     SBColor: TSpeedButton;
     SBTalla: TSpeedButton;
     SBTemporada: TSpeedButton;
     SBEjercicio: TSpeedButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure SBEjercicioClick(Sender: TObject);
     procedure SBTemporadaClick(Sender: TObject);
     procedure SBTallaClick(Sender: TObject);
     procedure SBColorClick(Sender: TObject);
     procedure SBBaseClick(Sender: TObject);
     procedure SBLibreClick(Sender: TObject);
     procedure SBBorraTodasClick(Sender: TObject);
     procedure SBBorraLineaClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure SBArribaClick(Sender: TObject);
     procedure SBAbajoClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     ID_MODELO: integer;
     procedure FiltraCodigo(Codigo: string);
  end;

var
  FMParamArticulos : TFMParamArticulos;

implementation

uses UDMMain, UDMParamArticulos, UFBusca, UUtiles;

{$R *.dfm}

procedure TFMParamArticulos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMParamArticulos, DMParamArticulos);

  NavMain.DataSource := DMParamArticulos.DSTMaestro_Estructura;
  DBGMain.DataSource := DMParamArticulos.DSTMaestro_Estructura;
  G2kTableLoc.DataSource := DMParamArticulos.DSTMaestro_Estructura;

  ControlEdit := CECabecera;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(SBArriba, 1, DMMain.ILMain_Ac, 53);
  GetBitmapFromImageList(SBAbajo, 1, DMMain.ILMain_Ac, 52);
  GetBitmapFromImageList(SBBorraLinea, 1, DMMain.ILMain_Ac, 20);
  GetBitmapFromImageList(SBBorraTodas, 1, DMMain.ILMain_Ac, 39);
  GetBitmapFromImageList(SBEjercicio, 1, DMMain.ILMain_Ac, 51);
  GetBitmapFromImageList(SBTemporada, 1, DMMain.ILMain_Ac, 51);
  GetBitmapFromImageList(SBTalla, 1, DMMain.ILMain_Ac, 51);
  GetBitmapFromImageList(SBColor, 1, DMMain.ILMain_Ac, 51);
  GetBitmapFromImageList(SBBase, 1, DMMain.ILMain_Ac, 51);
  GetBitmapFromImageList(SBLibre, 1, DMMain.ILMain_Ac, 51);
end;

procedure TFMParamArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMParamArticulos);
end;

procedure TFMParamArticulos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  TFBusca.Create(Self).SeleccionaBusqueda(
     CEMain, DMParamArticulos.TMaestro_Estructura, '10000');
end;

procedure TFMParamArticulos.SBEjercicioClick(Sender: TObject);
begin
  if (DMParamArticulos.ControlaRepetidos('EJERCICIO') > 0) then
     MessageDlg(_('Ya existe una linea para el campo EJERCICIO'), mtWarning, [mbOK], 0)
  else
     DMParamArticulos.InsertaLinea('EJERCICIO', '', SEEjercicio.Value);
end;

procedure TFMParamArticulos.SBTemporadaClick(Sender: TObject);
begin
  if (DMParamArticulos.ControlaRepetidos('TEMPORADA') > 0) then
     MessageDlg(_('Ya existe una linea para el campo TEMPORADA'), mtWarning, [mbOK], 0)
  else
     DMParamArticulos.InsertaLinea('TEMPORADA', '', SETemporada.Value);
end;

procedure TFMParamArticulos.SBTallaClick(Sender: TObject);
begin
  if (DMParamArticulos.ControlaRepetidos('TALLA') > 0) then
     MessageDlg(_('Ya existe una linea para el campo TALLA'), mtWarning, [mbOK], 0)
  else
     DMParamArticulos.InsertaLinea('TALLA', '', SETalla.Value);
end;

procedure TFMParamArticulos.SBColorClick(Sender: TObject);
begin
  if (DMParamArticulos.ControlaRepetidos('COLOR') > 0) then
     MessageDlg(_('Ya existe una linea para el campo COLOR'), mtWarning, [mbOK], 0)
  else
     DMParamArticulos.InsertaLinea('COLOR', '', SEColor.Value);
end;

procedure TFMParamArticulos.SBBaseClick(Sender: TObject);
begin
  if (DMParamArticulos.ControlaRepetidos('BASE') > 0) then
     MessageDlg(_('Ya existe una linea para el campo BASE'), mtWarning, [mbOK], 0)
  else
     DMParamArticulos.InsertaLinea('BASE', '', SEBase.Value);
end;

procedure TFMParamArticulos.SBLibreClick(Sender: TObject);
begin
  if (Etexto.Text <> '') then
     DMParamArticulos.InsertaLinea('LIBRE', Etexto.Text, SELibre.Value);
end;

procedure TFMParamArticulos.SBBorraTodasClick(Sender: TObject);
begin
  DMParamArticulos.BorraDetalle(2);
end;

procedure TFMParamArticulos.SBBorraLineaClick(Sender: TObject);
begin
  DMParamArticulos.BorraDetalle(1);
end;

procedure TFMParamArticulos.FormShow(Sender: TObject);
begin
  SEEjercicio.Value := 2;
  SETemporada.Value := 2;
  SETalla.Value := 2;
  SEColor.Value := 2;
  SELibre.Value := 2;
  SEBase.Value := 5;
end;

procedure TFMParamArticulos.SBArribaClick(Sender: TObject);
begin
  DMParamArticulos.Reordena(1);
end;

procedure TFMParamArticulos.SBAbajoClick(Sender: TObject);
begin
  DMParamArticulos.Reordena(2);
end;

procedure TFMParamArticulos.FiltraCodigo(Codigo: string);
begin
  DMParamArticulos.FiltraEstructura(Codigo);
end;

procedure TFMParamArticulos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
