unit UFMGas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, DBCtrls, ComCtrls, UDBDateTimePicker, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, UFormGest,
  ExtDlgs, DB, Buttons, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBEditFind2000, ULFDBEdit, ULFDBCheckBox, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBDateEdit, ULFFIBDBEditFind,
  UHYDescription, ULFHYDBDescription, UG2kTBLoc, UFPregTiempo, ULFLabel,
  ULFEdit, ImgList, Math, DbComboBoxValue, ULFEditFind2000, ULFDBDateEdit;

type
  TFMGas = class(TFPEdit)
     TSDetalle: TTabSheet;
     LblGas: TLFLabel;
     DBERig: TLFDbedit;
     LblFecha: TLFLabel;
     DBEFechaInicio: TLFDBDateEdit;
     LblTurno: TLFLabel;
     DBETurno: TLFDBEditFind2000;
     PnlDet: TLFPanel;
     PnlDetGas: TLFPanel;
     PCDetGas: TLFPageControl;
     TSTanque: TTabSheet;
     PCDetEmpleados: TLFPageControl;
     TSDispensador: TTabSheet;
     TSFPago: TTabSheet;
     TBTanque: TLFToolBar;
     DBGFDispensador: TDBGridFind2000;
     DBGFFPago: TDBGridFind2000;
     NavTanque: THYMNavigator;
     DBGFTanque: TDBGridFind2000;
     CETanque: TControlEdit;
     DBCBEstado: TLFDBCheckBox;
     ALstGas: TAction;
     LFCategoryAction2: TLFCategoryAction;
     SBATanque: TSpeedButton;
     TButtInforme: TToolButton;
     DescTurno: TLFHYDBDescription;
     LFLabel2: TLFLabel;
     DBEDifTanqDisp: TLFDbedit;
     TSEmpleado: TTabSheet;
     DBGFEmpleado: TDBGridFind2000;
     LFEmpleado: TLFToolBar;
     NavEmpleado: THYMNavigator;
     TSMonedas: TTabSheet;
     DBGFMonedas: TDBGridFind2000;
     LFMonedas: TLFToolBar;
     NavMonedas: THYMNavigator;
     LFLabel3: TLFLabel;
     DBEFechaCierre: TLFDBDateEdit;
     LFLabel1: TLFLabel;
     DBEDifCobDisp: TLFDbedit;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     CEEmpleadoPMEdit: TPopUpTeclas;
     CEEmpleado: TControlEdit;
     CEDispensadorPMEdit: TPopUpTeclas;
     CEDispensador: TControlEdit;
     CEFPagoPMEdit: TPopUpTeclas;
     CEFPago: TControlEdit;
     CEMonedasPMEdit: TPopUpTeclas;
     CEMonedas: TControlEdit;
     CEMainMifirst1: TMenuItem;
     CEMainMiprior1: TMenuItem;
     CEMainMinext1: TMenuItem;
     CEMainMilast1: TMenuItem;
     CEMainMiinsert1: TMenuItem;
     CEMainMidelete1: TMenuItem;
     CEMainMiedit1: TMenuItem;
     CEMainMipost1: TMenuItem;
     CEMainMicancel1: TMenuItem;
     CEMainMirefresh1: TMenuItem;
     CEMainMiSep1: TMenuItem;
     CEMainMibuscar1: TMenuItem;
     CEMainMiaprox1: TMenuItem;
     CEMainMiexacta1: TMenuItem;
     CEMainMiimprime1: TMenuItem;
     CEMainMirango1: TMenuItem;
     CEMainMireport1: TMenuItem;
     CEMainMicopy1: TMenuItem;
     CEMainMicut1: TMenuItem;
     CEMainMipaste1: TMenuItem;
     CEMainMisalir1: TMenuItem;
     LFTDispensador: TLFToolBar;
     NavDispensador: THYMNavigator;
     TBFPago: TLFToolBar;
     NavFPago: THYMNavigator;
     DBDTInicio: TDBDateTimePicker;
     DBDTCierre: TDBDateTimePicker;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     DBETitSerie: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSTanqueShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSDispensadorShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TSFPagoShow(Sender: TObject);
     procedure ALstGasExecute(Sender: TObject);
     procedure TButtInformeClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGas : TFMGas;

implementation

uses UDMMain, UEntorno, UFmain, UUtiles, UDMGas;

{$R *.dfm}

procedure TFMGas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGas, DMGas);

  // Navegadores
  NavMain.DataSource := DMGas.DSQMGas;
  NavEmpleado.DataSource := DMGas.DSQMEmpleado;
  NavTanque.DataSource := DMGas.DSQMTanque;
  NavDispensador.DataSource := DMGas.DSQMDispensador;
  NavFPago.DataSource := DMGas.DSQMFPago;
  NavMonedas.DataSource := DMGas.DSQMMonedas;
  DBGMain.DataSource := DMGas.DSQMGas;
  DBGFEmpleado.DataSource := DMGas.DSQMEmpleado;
  DBGFTanque.DataSource := DMGas.DSQMTanque;
  DBGFDispensador.DataSource := DMGas.DSQMDispensador;
  DBGFFPago.DataSource := DMGas.DSQMFPago;
  DBGFMonedas.DataSource := DMGas.DSQMMonedas;
  // Page Control
  PCDetGas.ActivePage := TSTanque;
  PCDetEmpleados.ActivePage := TSDispensador;

  G2KTableLoc.DataSource := DMGas.DSQMGas;

end;

procedure TFMGas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGas);
end;


procedure TFMGas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMGas.BusquedaCompleja;
end;

procedure TFMGas.TSTanqueShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CETanque;
end;

procedure TFMGas.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMGas.TSDispensadorShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDispensador;
end;

procedure TFMGas.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMGas.TSFPagoShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEFPago;
end;

procedure TFMGas.ALstGasExecute(Sender: TObject);
begin
  // AbreForm(TFMLstGas, FMLstGas, Sender);
end;


procedure TFMGas.TButtInformeClick(Sender: TObject);
begin
  inherited;
  //AbreData(TDMLstGas, ProDMLstGas);
  //DMLstGas.MostrarListado(0, StrToInt(DBEGas.Text), '0', '0', 0, 0);
  //CierraData(DMLstGas);
end;

end.
