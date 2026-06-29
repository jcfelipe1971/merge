unit UFMPGCEquivalencias;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFComboBox, ULFLabel, ULFDBMemo, UFIBDBEditfind,
  UComponentesBusquedaFiltrada;

type
  TFMPGCEquivalencias = class(TFPEdit)
     LFPanel1: TLFPanel;
     DBLCBOPGC: TDBLookupComboBox;
     LBLFlecha: TLFLabel;
     DBLCBDPGC: TDBLookupComboBox;
     ToolButton1: TToolButton;
     DBGFEquivalencias: TDBGridFind2000;
     GBOrigen: TGroupBox;
     LBLOCuenta: TLFLabel;
     LBLOTitulo: TLFLabel;
     DBEOCuenta: TLFDbedit;
     DBEOTitulo: TLFDbedit;
     GBDestino: TGroupBox;
     LBLDCuenta: TLFLabel;
     LBLDTitulo: TLFLabel;
     DBEDCuenta: TLFDbedit;
     DBEDTitulo: TLFDbedit;
     LFDBNotas: TLFDBMemo;
     procedure FormCreate(Sender: TObject);
     procedure AOpenExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure ToolButton1Click(Sender: TObject);
     procedure TSTablaEditShow(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFEquivalenciasDblClick(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPGCEquivalencias : TFMPGCEquivalencias;

implementation

uses UFormGest, UDMPGCEquivalencias, UDMMain, UEntorno;

{$R *.dfm}

procedure TFMPGCEquivalencias.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPGCEquivalencias, DMPGCEquivalencias);
  CEMainPMEdit.Teclas := DMMain.Teclas;
  NavMain.DataSource := DMPGCEquivalencias.DSQMEquivalencias;
  ControlEdit := CEMain;
  DBLCBOPGC.KeyValue := REntorno.PGC;
  DBLCBDPGC.KeyValue := REntorno.PGC;
end;

procedure TFMPGCEquivalencias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPGCEquivalencias);
end;

procedure TFMPGCEquivalencias.AOpenExecute(Sender: TObject);
begin
  inherited;
  if (DBLCBOPGC.KeyValue = DBLCBDPGC.KeyValue) then
     raise Exception.CreateFmt('Debe seleccionar planes contables diferentes', []);
  DMPGCEquivalencias.Abrir(DBLCBOPGC.KeyValue, DBLCBDPGC.KeyValue);
end;

procedure TFMPGCEquivalencias.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPGCEquivalencias.BusquedaCompleja(DBLCBOPGC.KeyValue, DBLCBDPGC.KeyValue);
  Continua := False;
end;

procedure TFMPGCEquivalencias.ToolButton1Click(Sender: TObject);
begin
  inherited;
  if (DBLCBOPGC.KeyValue = DBLCBDPGC.KeyValue) then
     raise Exception.CreateFmt('Debe seleccionar planes contables diferentes', []);
  DMPGCEquivalencias.Abrir(DBLCBOPGC.KeyValue, DBLCBDPGC.KeyValue);
  Caption := Caption + ' (' + DBLCBOPGC.Text + ' >> ' + DBLCBDPGC.Text + ' )';
end;

procedure TFMPGCEquivalencias.TSTablaEditShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMPGCEquivalencias.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbInsert, nbEdit]) then
     if (PCMain.ActivePage = TSFicha) then
        DBEOCuenta.SetFocus
     else if (PCMain.ActivePage = TSTabla) then
        DBGFEquivalencias.SetFocus;
end;

procedure TFMPGCEquivalencias.DBGFEquivalenciasDblClick(Sender: TObject);
begin
  inherited;
  TSFicha.Show;
end;

procedure TFMPGCEquivalencias.TSTablaShow(Sender: TObject);
begin
  inherited;
  DBGFEquivalencias.SetFocus;
end;

end.
