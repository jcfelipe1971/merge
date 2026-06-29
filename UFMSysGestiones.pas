unit UFMSysGestiones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, DBCtrls, StdCtrls,
  dbcgrids, Mask, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt,
  NsDBGrid, ULFDBCtrlGrid, ULFDBEditFind2000, ULFDBEdit, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel,
  UG2kTBLoc;

type

  TFMSysGestiones = class(TFPEdit)
     PNLPaises: TLFPanel;
     Label1: TLFLabel;
     DBLBPGC: TDBLookupComboBox;
     Label7: TLFLabel;
     Label3: TLFLabel;
     DBETitulo: TLFDbedit;
     DBEGestion: TLFDbedit;
     DBGFGestiones: TDBGridFind2000;
     DBEPais: TLFDbedit;
     LFLabel1: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFGestionesDblClick(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSysGestiones : TFMSysGestiones;

implementation

uses UDMSysGestiones, UDMMain, UFormGest, UEntorno, uUtiles;

{$R *.DFM}

procedure TFMSysGestiones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSysGestiones, DMSysGestiones);
  DBLBPGC.KeyValue := REntorno.PGC;
  NavMain.DataSource := DMSysGestiones.DSGestiones;

  // Color campo ID
  ColorCampoID(DBEGestion);
end;

procedure TFMSysGestiones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSysGestiones);
end;

procedure TFMSysGestiones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMSysGestiones.BusquedaCompleja;
  Continua := False;
end;

procedure TFMSysGestiones.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbInsert]) then
     if (PCMain.ActivePage = TSFicha) then
     begin
        DBEGestion.Enabled := True;
        DBEGestion.SetFocus;
     end
     else if (PCMain.ActivePage = TSTabla) then
        DBGFGestiones.SetFocus;

  if (Button in [nbEdit]) then
     if (PCMain.ActivePage = TSFicha) then
     begin
        DBEGestion.Enabled := False;
        DBETitulo.SetFocus;
     end
     else if (PCMain.ActivePage = TSTabla) then
        DBGFGestiones.SetFocus;

  if (not (Button in [nbInsert, nbEdit])) then
  begin
     DBEGestion.Enabled := False;
  end;
end;

procedure TFMSysGestiones.DBGFGestionesDblClick(Sender: TObject);
begin
  inherited;
  TSFicha.Show;
end;

procedure TFMSysGestiones.TSTablaShow(Sender: TObject);
begin
  inherited;
  DBGFGestiones.SetFocus;
end;

end.
