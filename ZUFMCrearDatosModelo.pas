unit ZUFMCrearDatosModelo;

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
  ULFEdit, ImgList, Math, UProDMEscandallo;

type
  TZFMCrearDatosModelo = class(TForm)
     LFPanel1: TLFPanel;
     LFToolBar1: TLFToolBar;
     TBSalir: TToolButton;
     TBCrear: TToolButton;
     GBCaida: TGroupBox;
     GBLinea: TGroupBox;
     Inicial: TLFLabel;
     Final: TLFLabel;
     Cadencia: TLFLabel;
     LFLabel1: TLFLabel;
     LFLabel2: TLFLabel;
     LFLabel3: TLFLabel;
     LFIniSalida: TLFEdit;
     LFFinSalida: TLFEdit;
     LFCadenciaSalida: TLFEdit;
     LFIniLinea: TLFEdit;
     LFFinLinea: TLFEdit;
     LFCadenciaLinea: TLFEdit;
     ToolButton3: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure TBSalirClick(Sender: TObject);
     procedure TBCrearClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMCrearDatosModelo : TZFMCrearDatosModelo;

implementation

uses ZUDMModelos;

{$R *.dfm}

procedure TZFMCrearDatosModelo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TZFMCrearDatosModelo.TBSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TZFMCrearDatosModelo.TBCrearClick(Sender: TObject);
begin
  ZDMModelos.CreaDatosModelo(StrToInt(LFIniLinea.Text),
     StrToInt(LFFinLinea.Text),
     StrToInt(LFCadenciaLinea.Text),
     StrToInt(LFIniSalida.Text),
     StrToInt(LFFinSalida.Text),
     StrToInt(LFCadenciaSalida.Text));
end;

procedure TZFMCrearDatosModelo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
