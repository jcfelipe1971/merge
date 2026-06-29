unit UFMAgrupacionFac;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  rxToolEdit, RXDBCtrl, rxPlacemnt, NsDBGrid, ULFDBCheckBox, ULFDBEdit,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ULFDBDateEdit,
  UG2kTBLoc;

type
  TFMAgrupacionFac = class(TFPEdit)
     DBECodigo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LCodigo: TLFLabel;
     LTitulo: TLFLabel;
     PNLDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     DBGDetalle: TDBGridFind2000;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBDTFecha: TLFDBDateEdit;
     DBEReferencia: TLFDbedit;
     LReferencia: TLFLabel;
     LFecha: TLFLabel;
     DBCBCerrar: TLFDBCheckBox;
     ANITempo: TAnimate;
     LBProceso: TLFLabel;
     AProcesarFacturas: TAction;
     LFCategoryAction1: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBGDetalleColEnter(Sender: TObject);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AProcesarFacturasExecute(Sender: TObject);
  private
     { Private declarations }
     procedure Animacion(Activo: boolean);
  public
     { Public declarations }
  end;

var
  FMAgrupacionFac : TFMAgrupacionFac;

implementation

uses UFMain, UDMMain, UFormGest, UEntorno, UDMAgrupacionFac, UFSelecAgrupFac,
  UUtiles;

{$R *.DFM}

procedure TFMAgrupacionFac.FormCreate(Sender: TObject);
begin
  inherited;
  LBProceso.Visible := False;
  AbreData(TDMAgrupacionFac, DMAgrupacionFac);
  NavMain.DataSource := DMAgrupacionFac.DSQMAgrupacionFac;
  EPMain.DataSource := DMAgrupacionFac.DSQMAgrupacionFac;
  DBGMain.DataSource := DMAgrupacionFac.DSQMAgrupacionFac;
end;

procedure TFMAgrupacionFac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAgrupacionFac);
end;

procedure TFMAgrupacionFac.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if Button = nbEdit then
  begin
     DBECodigo.ReadOnly := True;
     DBECodigo.Enabled := False;
     DBECodigo.Color := clInfoBk;
  end
  else
  begin
     DBECodigo.ReadOnly := False;
     DBECodigo.Enabled := True;
     DBECodigo.Color := clwindow;
  end;
end;

procedure TFMAgrupacionFac.DBGDetalleColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
end;

procedure TFMAgrupacionFac.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  // Abrimos la venta de selección de Facturas
  if (Button = nbInsert) then
  begin
     FSelecAgrupFac := TFSelecAgrupFac.Create(Self);
     FSelecAgrupFac.ShowModal;
     FSelecAgrupFac.Free;
     ControlEdit := CEDetalle;
  end;
end;

procedure TFMAgrupacionFac.Animacion(Activo: boolean);
begin
  AniTempo.Visible := Activo;
  AniTempo.Active := Activo;
end;

procedure TFMAgrupacionFac.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMAgrupacionFac.Busqueda;
end;

procedure TFMAgrupacionFac.AProcesarFacturasExecute(Sender: TObject);
var
  puntero : TCursor;
begin
  inherited;
  if Confirma then
     if ConfirmaGrave then
     begin
        puntero := Screen.Cursor;
        Screen.Cursor := crHourGlass;
        LBProceso.Visible := True;
        Application.ProcessMessages;
        Animacion(True);
        try
           DMAgrupacionFac.ProcesarFacturas;
        finally
           Screen.Cursor := puntero;
           Animacion(False);
           LBProceso.Visible := False;
        end;
     end;
end;

end.
