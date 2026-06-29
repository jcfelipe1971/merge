unit ZUFMMarcajeManual;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UDBDateTimePicker, UHYDescription,
  ULFHYDBDescription, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, rxToolEdit, RXDBCtrl, ULFDBDateEdit, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, UFPEditDetalle;

type
  TZFMMarcajeManual = class(TFPEditDetalle)
     LPedido: TLFLabel;
     DBEPedido: TLFDbedit;
     DBESuReferencia: TLFDbedit;
     LSuReferencia: TLFLabel;
     LCliente: TLFLabel;
     DBECliente: TLFDbedit;
     DBEDescCliente: TLFDbedit;
     LFechaCorte: TLFLabel;
     DBDECorte: TLFDBDateEdit;
     LOperarioCorte: TLFLabel;
     DBEFCorte: TLFDBEditFind2000;
     DescOpeCorte: TLFHYDBDescription;
     LUnion: TLFLabel;
     DBDEUnion: TLFDBDateEdit;
     LOperarioUnion: TLFLabel;
     DBEFUnion: TLFDBEditFind2000;
     DescOpeUnion: TLFHYDBDescription;
     LMacarron: TLFLabel;
     DBDEMacarron: TLFDBDateEdit;
     LOperarioMacarron: TLFLabel;
     DBEFMacarron: TLFDBEditFind2000;
     DescOpeMacarron: TLFHYDBDescription;
     LMontaje: TLFLabel;
     DBDEMontaje: TLFDBDateEdit;
     LOperarioMontaje: TLFLabel;
     DBEFMontaje: TLFDBEditFind2000;
     DescOpeMontaje: TLFHYDBDescription;
     LTerminado: TLFLabel;
     DBDETerminado: TLFDBDateEdit;
     LOperarioTerminado: TLFLabel;
     DBEFTerminado: TLFDBEditFind2000;
     DescOpeTerminado: TLFHYDBDescription;
     DBDTCorte: TDBDateTimePicker;
     DBDTUnion: TDBDateTimePicker;
     DBDTMacarron: TDBDateTimePicker;
     DBDTMontaje: TDBDateTimePicker;
     DBDTTerminado: TDBDateTimePicker;
     DBDTPreparado: TDBDateTimePicker;
     DBDEPreparado: TLFDBDateEdit;
     LPreparado: TLFLabel;
     LOperarioPreparado: TLFLabel;
     DBEFPreparado: TLFDBEditFind2000;
     DescOpePreparado: TLFHYDBDescription;
     LCodigoBarra: TLFLabel;
     DBECodBarr: TLFDbedit;
     LMotor: TLFLabel;
     DBMotor: TLFDBDateEdit;
     DBTMotor: TDBDateTimePicker;
     LOperarioMotor: TLFLabel;
     DBEFMotor: TLFDBEditFind2000;
     DescOpeMotor: TLFHYDBDescription;
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFCorteChange(Sender: TObject);
     procedure DBEFUnionChange(Sender: TObject);
     procedure DBEFMacarronChange(Sender: TObject);
     procedure DBEFMontajeChange(Sender: TObject);
     procedure DBEFTerminadoChange(Sender: TObject);
     procedure DBEFPreparadoChange(Sender: TObject);
     procedure DBEFMotorChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMMarcajeManual : TZFMMarcajeManual;

implementation

uses ZUDMMarcajeManual, UDMMain, UFormGest;

{$R *.dfm}

procedure TZFMMarcajeManual.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMMarcajeManual.BusquedaCompleja;
end;

procedure TZFMMarcajeManual.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMMarcajeManual, ZDMMarcajeManual);
  DBGMain.DataSource := ZDMMarcajeManual.DSMMarcajes;
  NavMain.DataSource := ZDMMarcajeManual.DSMMarcajes;
  DBGFDetalle.DataSource := ZDMMarcajeManual.DSDetMarcajes;
  NavDetalle.DataSource := ZDMMarcajeManual.DSMMarcajes;
end;

procedure TZFMMarcajeManual.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMMarcajeManual);
end;

procedure TZFMMarcajeManual.DBEFCorteChange(Sender: TObject);
begin
  inherited;
  DescOpeCorte.ActualizaDatos('OPERARIO_CORTE', DBEFCorte.Text);
end;

procedure TZFMMarcajeManual.DBEFUnionChange(Sender: TObject);
begin
  inherited;
  DescOpeUnion.ActualizaDatos('OPERARIO_UNION', DBEFUnion.Text);
end;

procedure TZFMMarcajeManual.DBEFMacarronChange(Sender: TObject);
begin
  inherited;
  DescOpeMacarron.ActualizaDatos('OPERARIO_MACARRON', DBEFMacarron.Text);
end;

procedure TZFMMarcajeManual.DBEFMontajeChange(Sender: TObject);
begin
  inherited;
  DescOpeMontaje.ActualizaDatos('OPERARIO_MONTAJE', DBEFMontaje.Text);
end;

procedure TZFMMarcajeManual.DBEFTerminadoChange(Sender: TObject);
begin
  inherited;
  DescOpeTerminado.ActualizaDatos('OPERARIO_TERMINADO', DBEFTerminado.Text);
end;

procedure TZFMMarcajeManual.DBEFPreparadoChange(Sender: TObject);
begin
  inherited;
  DescOpePreparado.ActualizaDatos('OPERARIO_PREPARADO', DBEFPreparado.Text);
end;

procedure TZFMMarcajeManual.DBEFMotorChange(Sender: TObject);
begin
  inherited;
  DescOpeMotor.ActualizaDatos('OPERARIO_MOTOR', DBEFMotor.Text);
end;

procedure TZFMMarcajeManual.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
