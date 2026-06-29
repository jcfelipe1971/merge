unit UFMGasConstantes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, UHYDBGrid, ComCtrls, UEditPanel, UNavigator,
  ToolWin, UControlEdit, Menus, UTeclas, StdCtrls, DB, UFormGest, NsDBGrid,
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, ULFLabel, ULFEdit, Mask, DBCtrls, ULFDBEdit,
  ULFDBMemo, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  UHYDescription, ULFHYDBDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFEditFind2000;

type
  TFMGasConstantes = class(TG2KForm)
     TBMain: TLFToolBar;
     PCMain: TLFPanel;
     TBSalir: TToolButton;
     CEContadores: TControlEdit;
     CEContadoresPMEdit: TPopUpTeclas;
     NavMain: THYMNavigator;
     ToolButton1: TToolButton;
     CEConfig: TControlEdit;
     CEConfigPMEdit: TPopUpTeclas;
     LFPCMain: TLFPageControl;
     TSGeneral: TTabSheet;
     PNLGeneral: TLFPanel;
     LFLArticulo: TLFLabel;
     LFDBEArticulo: TLFDBEditFind2000;
     EDescripArticulo: TLFEdit;
     TSCuentaSerie: TTabSheet;
     PCCuentaSeries: TLFPageControl;
     TSSerie: TTabSheet;
     TSTabla: TTabSheet;
     LSucursal: TLFLabel;
     DBESerie: TLFDBEditFind2000;
     EDescripcionSerie: TLFEdit;
     LCuentaVenta: TLFLabel;
     DBECtaVenta: TLFDBEditFind2000;
     EDescripcionCtaVenta: TLFEdit;
     LCuentaCaja: TLFLabel;
     DBECtaCaja: TLFDBEditFind2000;
     EDescripcionCtaCaja: TLFEdit;
     LCuentaSobrante: TLFLabel;
     DBECtaSobrante: TLFDBEditFind2000;
     EDescripcionCtaSobrante: TLFEdit;
     LCuentaFaltante: TLFLabel;
     DBECtaFaltante: TLFDBEditFind2000;
     EDescripcionCtaFaltante: TLFEdit;
     DBECtaDistribucion: TLFDBEditFind2000;
     DBECtaCostoSucursal: TLFDBEditFind2000;
     EDescripcionCtaDistribucion: TLFEdit;
     EDescripcionCtaCostoSucursal: TLFEdit;
     NavSeries: THYMNavigator;
     DBGSeries: THYTDBGrid;
     TBCuentaSerie: TLFToolBar;
     PNLCuentaSerie: TLFPanel;
     procedure TBSalirClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFDBEArticuloChange(Sender: TObject);
     procedure DBESerieChange(Sender: TObject);
     procedure DBECtaVentaChange(Sender: TObject);
     procedure DBECtaCajaChange(Sender: TObject);
     procedure DBECtaSobranteChange(Sender: TObject);
     procedure DBECtaFaltanteChange(Sender: TObject);
     procedure DBECtaDistribucionChange(Sender: TObject);
     procedure DBECtaCostoSucursalChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGasConstantes : TFMGasConstantes;

implementation

uses UDMGasConstantes, UDMMain, UDameDato;

{$R *.dfm}

procedure TFMGasConstantes.TBSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMGasConstantes.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMGasConstantes, DMGasConstantes);
  LFPCMain.ActivePage := TSGeneral;
end;

procedure TFMGasConstantes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMGasConstantes);
end;

procedure TFMGasConstantes.LFDBEArticuloChange(Sender: TObject);
begin
  EDescripArticulo.Text := DameTituloArticulo(LFDBEArticulo.Text);
end;

procedure TFMGasConstantes.DBESerieChange(Sender: TObject);
begin
  EDescripcionSerie.Text := DameTituloSerie(DBESerie.Text);
end;

procedure TFMGasConstantes.DBECtaVentaChange(Sender: TObject);
begin
  EDescripcionCtaVenta.Text := DameTituloCuenta(DBECtaVenta.Text);
end;

procedure TFMGasConstantes.DBECtaCajaChange(Sender: TObject);
begin
  EDescripcionCtaCaja.Text := DameTituloCuenta(DBECtaCaja.Text);
end;

procedure TFMGasConstantes.DBECtaSobranteChange(Sender: TObject);
begin
  EDescripcionCtaSobrante.Text := DameTituloCuenta(DBECtaSobrante.Text);
end;

procedure TFMGasConstantes.DBECtaFaltanteChange(Sender: TObject);
begin
  EDescripcionCtaFaltante.Text := DameTituloCuenta(DBECtaFaltante.Text);
end;

procedure TFMGasConstantes.DBECtaDistribucionChange(Sender: TObject);
begin
  EDescripcionCtaDistribucion.Text := DameTituloCuenta(DBECtaDistribucion.Text);
end;

procedure TFMGasConstantes.DBECtaCostoSucursalChange(Sender: TObject);
begin
  EDescripcionCtaCostoSucursal.Text := DameTituloCuenta(DBECtaCostoSucursal.Text);
end;

end.
