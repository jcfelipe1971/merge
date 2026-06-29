unit UFMProdProduccion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBMemo, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMProdProduccion = class(TFPEdit)
     DBEProceso: TLFDbedit;
     DBETitulo: TLFDbedit;
     LBLProceso: TLFLabel;
     Label2: TLFLabel;
     TSNotas: TTabSheet;
     TBNotas: TLFToolBar;
     PNLNotas: TLFPanel;
     DBEProcesosNot: TLFDbedit;
     DBEDesNotas: TLFDbedit;
     NavNotas: THYMNavigator;
     PNLENotas: TLFPanel;
     DBMNotas: TLFDBMemo;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     DBEDuracion: TLFDbedit;
     LBLDuracion: TLFLabel;
     Label1: TLFLabel;
     LBLPrecio: TLFLabel;
     DBEPrecio: TLFDbedit;
     ToolButton1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSNotasShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure DBEDuracionKeyPress(Sender: TObject; var Key: char);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMProdProduccion : TFMProdProduccion;

implementation

uses UDMProdProduccion, UDMMain, UFormGest;

{$R *.DFM}

procedure TFMProdProduccion.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMProdProduccion, DMProdProduccion);
  NavMain.DataSource := DMProdProduccion.DSQMProcesos;
  DBGMain.DataSource := DMPRodProduccion.DSQMProcesos;
  PCMain.ActivePageIndex := 0;
end;

procedure TFMProdProduccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMProdProduccion);
  action := caFree;
end;

procedure TFMProdProduccion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMPRodProduccion.BusquedaCompleja;
  Continua := False;
end;

procedure TFMProdProduccion.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CENotas;
end;

procedure TFMProdProduccion.TSFichaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMProdProduccion.DBEDuracionKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8, '-', ThousandSeparator, DecimalSeparator]) then
     Key := #0;
end;

end.
