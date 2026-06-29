unit UProFMConfigRecMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxToolEdit,
  RXDBCtrl, StdCtrls, Mask, DBCtrls, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc,
  ULFDBEditFind2000, ULFLabel, ULFDBDateEdit;

type
  TProFMConfigRecMarcajes = class(TFPEdit)
     LblRutaOri: TLFLabel;
     DBERuta: TLFDbedit;
     ButtOrigen: TButton;
     DBDFecha: TLFDBDateEdit;
     LblFecha: TLFLabel;
     LblCodigo: TLFLabel;
     DBECodigo: TLFDbedit;
     LblDescripcion: TLFLabel;
     DBEDescrip: TLFDbedit;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     PnlDet: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGDetall: TDBGridFind2000;
     LblRutaInc: TLFLabel;
     DBERutaInc: TLFDbedit;
     ButtInc: TButton;
     LblRutaDest: TLFLabel;
     ButtDest: TButton;
     DBERutaDest: TLFDbedit;
     DBRGTMarcaje: TDBRadioGroup;
     TButtExportarConfig: TToolButton;
     ButtConfig: TButton;
     DBERutaConfig: TLFDbedit;
     LblRutaConfig: TLFLabel;
     LblTipoRec: TLFLabel;
     DBEFTipoRec: TLFDBEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ButtOrigenClick(Sender: TObject);
     procedure ButtIncClick(Sender: TObject);
     procedure ButtDestClick(Sender: TObject);
     procedure TButtExportarConfigClick(Sender: TObject);
     procedure ButtConfigClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMConfigRecMarcajes : TProFMConfigRecMarcajes;

implementation

uses UDMMain, UProDMConfigRecMarcajes, UEntorno, UFormGest, FileCtrl, UUtiles;

{$R *.dfm}

//sfg.albert
procedure TProFMConfigRecMarcajes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMConfigRecMarcajes, ProDMConfigRecMarcajes);
  ProDMConfigRecMarcajes.FormConfig := True;
  ProDMConfigRecMarcajes.InsertarTablas;

  NavMain.DataSource := ProDMConfigRecMarcajes.DSConfigCabMarca;
  DBGMain.DataSource := ProDMConfigRecMarcajes.DSConfigCabMarca;
  G2KTableLoc.DataSource := ProDMConfigRecMarcajes.DSConfigCabMarca;

  NavDetalle.DataSource := ProDMConfigRecMarcajes.DSConfigDetMarca;
  DBGDetall.DataSource := ProDMConfigRecMarcajes.DSConfigDetMarca;
end;

procedure TProFMConfigRecMarcajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMConfigRecMarcajes);
end;

procedure TProFMConfigRecMarcajes.ButtOrigenClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  Directorio := DBERuta.Text;
  if MySelectDirectory(Directorio, 'ProFMConfigRecMarcajes-Origen') then
     ProDMConfigRecMarcajes.QMConfigCabMarcaRUTA.AsString := Directorio;
end;

procedure TProFMConfigRecMarcajes.ButtIncClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  Directorio := DBERutaInc.Text;
  if MySelectDirectory(Directorio, 'ProFMConfigRecMarcajes-Inc') then
     ProDMConfigRecMarcajes.QMConfigCabMarcaRUTAINC.AsString := Directorio;
end;

procedure TProFMConfigRecMarcajes.ButtDestClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  Directorio := DBERutaDest.Text;
  if MySelectDirectory(Directorio, 'ProFMConfigRecMarcajes-Dest') then
     ProDMConfigRecMarcajes.QMConfigCabMarcaRUTADEST.AsString := Directorio;
end;

procedure TProFMConfigRecMarcajes.ButtConfigClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  Directorio := DBERutaConfig.Text;
  if MySelectDirectory(Directorio, 'ProFMConfigRecMarcajes-Config') then
     ProDMConfigRecMarcajes.QMConfigCabMarcaRUTACONFIG.AsString := Directorio;
end;

procedure TProFMConfigRecMarcajes.TButtExportarConfigClick(Sender: TObject);
begin
  inherited;
  ProDMConfigRecMarcajes.ExportarConfig;
end;

procedure TProFMConfigRecMarcajes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMConfigRecMarcajes.BusquedaCompleja;
  Continua := False;
end;

procedure TProFMConfigRecMarcajes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
