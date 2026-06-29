unit UFMGasCerrar;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, UFormGest, Buttons,
  ULFEditFind2000, ULFEdit, ULFToolBar, ULFPanel, FIBDatabase,
  UFIBModificados, ULFLabel, TFlatCheckBoxUnit, ULFCheckBox, ULFDBEdit,
  rxToolEdit, RXDBCtrl, UDBDateTimePicker, ULFDBEditFind2000, ULFDateEdit, HYFIBQuery;

type
  TFMGasCerrar = class(TG2KForm)
     PnlCerrar: TLFPanel;
     TBMain: TLFToolBar;
     TBSalir: TToolButton;
     LblRigOrigen: TLFLabel;
     LFERigOrigen: TLFEdit;
     TBCerrar: TToolButton;
     LFechaCierreOrigen: TLFLabel;
     GBOrigen: TGroupBox;
     GBDestino: TGroupBox;
     LFechaInicioDestino: TLFLabel;
     DEFechaCierre: TLFDateEdit;
     DTCierre: TDateTimePicker;
     DEFechaInicioDestino: TLFDateEdit;
     DTInicio: TDateTimePicker;
     GBCopiar: TGroupBox;
     LRIGCopiar: TLFLabel;
     EFIdVenta: TLFEditFind2000;
     ETurno: TLFEdit;
     EOrden: TLFEdit;
     LFCBOrigen: TLFCheckBox;
     LID: TLFLabel;
     LFEIdOrigen: TLFEdit;
     procedure TBSalirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TBCerrarClick(Sender: TObject);
     procedure EFIdVentaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Origen, Destino: string;
     procedure Muestra(Rig: integer; FechaCierre, FechaInicio: TDateTime; Turno: string; IdVenta: integer);
  end;

var
  FMGasCerrar : TFMGasCerrar;

implementation

uses UDMMain, UDMVentasGas;

{$R *.dfm}

procedure TFMGasCerrar.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  DEFechaCierre.Date := Now;
  DTCierre.Date := Now;
end;

procedure TFMGasCerrar.TBSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMGasCerrar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMGasCerrar.Muestra(Rig: integer; FechaCierre, FechaInicio: TDateTime; Turno: string; IdVenta: integer);
begin
  LFERigOrigen.Text := IntToStr(Rig);
  DEFechaCierre.Date := FechaCierre;
  DTCierre.Date := FechaCierre;
  DEFechaInicioDestino.Date := FechaInicio;
  DTInicio.Date := FechaInicio;
  ETurno.Text := Turno;
  // EFIdVenta.Text := IdVenta;
  LFEIdOrigen.Text := IntToStr(IdVenta);
end;

procedure TFMGasCerrar.TBCerrarClick(Sender: TObject);
var
  Origen : integer;
begin
  if (LFCBOrigen.State = cbChecked) then
     Origen := 1
  else
     Origen := 0;

  if ((DEFechaCierre.Text = '') or (DEFechaInicioDestino.Text = '')) then
  begin
     MessageDlg(_('Falta informar la fecha.'), mtWarning, [mbOK], 0);
     Abort;
  end;

  // Pongo la fecha dentro de la hora para pasarla como parametro
  DTCierre.Date := DEFechaCierre.Date;
  DTInicio.Date := DEFechaInicioDestino.Date;

  AbreData(TDMVentasGas, DMVentasGas);
  try
     DMVentasGas.CerrarVenta(DTCierre.Time, DTInicio.Time, ETurno.Text, StrToIntDef(LFEIdOrigen.Text, 0), Origen);
  finally
     CierraData(DMVentasGas);
  end;
  ShowMessage(_('Se ha cerrado correctamente.'));
  Close;
end;

procedure TFMGasCerrar.EFIdVentaChange(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  inherited;
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT TURNO, ORDEN FROM GES_GAS_CAB_VENTA WHERE ID_VENTA = :ID_VENTA ';
     Params.ByName['ID_VENTA'].AsInteger := StrToIntDef(EFIdVenta.Text, 0);
     ExecQuery;
     ETurno.Text := FieldByName['TURNO'].AsString;
     EOrden.Text := FieldByName['ORDEN'].AsString;
     LFEIdOrigen.Text := EFIdVenta.Text;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

end.
