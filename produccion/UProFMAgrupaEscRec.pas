unit UProFMAgrupaEscRec;

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
  TProFMAgrupaEscRec = class(TFPEdit)
     LEscandallo: TLFLabel;
     LFase: TLFLabel;
     LRecurso: TLFLabel;
     LPrecio: TLFLabel;
     LFDescEsc: TLFEdit;
     LFDescFase: TLFEdit;
     LFDescRecurso: TLFEdit;
     DBEscandallo: TDBEditFind2000;
     DBFase: TDBEditFind2000;
     DBRecurso: TDBEditFind2000;
     DBPrecio: TLFDbedit;
     procedure DBFaseBusqueda(Sender: TObject);
     procedure DBRecursoBusqueda(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttCompClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CargaEscandallo(id_esc, linea_fase: integer);
  end;

var
  ProFMAgrupaEscRec : TProFMAgrupaEscRec;

implementation

uses UProDMAgrupaEscRec, UEntorno, UDMMain;

{$R *.dfm}

procedure TProFMAgrupaEscRec.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMAgrupaEscRec, ProDMAgrupaEscRec);
end;

procedure TProFMAgrupaEscRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMAgrupaEscRec);
end;

procedure TProFMAgrupaEscRec.DBFaseBusqueda(Sender: TObject);
begin
  inherited;
  DBFase.CondicionBusqueda := 'id_esc=' + DBEscandallo.Text;
  DBFase.Filtros := [obEmpresa];
end;

procedure TProFMAgrupaEscRec.DBRecursoBusqueda(Sender: TObject);
begin
  inherited;
  DBRecurso.Filtros := [obEmpresa];
end;

procedure TProFMAgrupaEscRec.TbuttCompClick(Sender: TObject);
begin
  inherited;
  ProDMAgrupaEscRec.BotonRecalculaPrecio;
end;

procedure TProFMAgrupaEscRec.CargaEscandallo(id_esc, linea_fase: integer);
begin
  ProDMAgrupaEscRec.CargaEscandallo(id_esc, linea_fase);
end;

procedure TProFMAgrupaEscRec.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMAgrupaEscRec.BusquedaCompleja;
  Continua := False;
end;

end.
