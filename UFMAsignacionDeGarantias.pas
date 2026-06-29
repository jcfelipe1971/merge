unit UFMAsignacionDeGarantias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, Grids, DBGrids, ComCtrls, UNavigator, ExtCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, FR_Class, NsDBGrid,
  UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus,
  UTeclas, UControlEdit, UHYDBGrid, ULFToolBar, UG2kTBLoc, ULFPageControl,
  UEditPanel, ToolWin, ULFPanel, ULFLabel, ULFDBEditFind2000, ULFDBEdit;

type
  TFMAsignacionDeGarantias = class(TFPEdit)
     PNLImpresion: TLFPanel;
     LArticulo: TLFLabel;
     LUsuario: TLFLabel;
     DBEUsuario: TLFDBEdit;
     LFechaEmpalaje: TLFLabel;
     DBEFechaEmpalaje: TLFDBEdit;
     LFechaVenta: TLFLabel;
     DBEFechaVenta: TLFDBEdit;
     LCliente: TLFLabel;
     LObservaciones: TLFLabel;
     DBMemoObservaciones: TDBMemo;
     ETituloArticulo: TEdit;
     ETituloCliente: TEdit;
     DBEFArticulo: TLFDBEditFind2000;
     DBEFCliente: TLFDBEditFind2000;
     DBGDetalle: TDBGrid;
     BImprimir1: TButton;
     BDisenar1: TButton;
     CHBPrevisualizar: TCheckBox;
     NavDetalle: THYMNavigator;
     BDuplicar: TButton;
     BuscarReferencia: TEdit;
     BLimpiarReferencia: TButton;
     BBuscarReferencia: TButton;
     LOrdenDeTrabajo: TLFLabel;
     DBEOrdenDeTrabajo: TLFDBEdit;
     LAlbaran: TLFLabel;
     DBEAlbaran: TLFDBEdit;
     BImprimir2: TButton;
     BDisenar2: TButton;
     BImprimir3: TButton;
     BDisenar3: TButton;
     PNLCabeceraFicha: TLFPanel;
     PNLDetalleFicha: TLFPanel;
     PNLCabDetalle: TLFPanel;
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFClienteChange(Sender: TObject);
     procedure DBEFArticuloChange(Sender: TObject);
     procedure HYMNavigator1Click(Sender: TObject; Button: TNavigateBtn);
     procedure BImprimirClick(Sender: TObject);
     procedure BDisenarClick(Sender: TObject);
     procedure BDuplicarClick(Sender: TObject);
     procedure BBuscarReferenciaClick(Sender: TObject);
     procedure BLimpiarReferenciaClick(Sender: TObject);
     procedure BuscarReferenciaKeyPress(Sender: TObject; var Key: char);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAsignacionDeGarantias : TFMAsignacionDeGarantias;

implementation

uses UDMAsignacionDeGarantias, UDMMain, UFormGest, UDameDato;

{$R *.DFM}

procedure TFMAsignacionDeGarantias.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAsignacionDeGarantias, DMAsignacionDeGarantias);

  NavMain.DataSource := DMAsignacionDeGarantias.DSxGarantiaCabecera;
  DBGMain.DataSource := DMAsignacionDeGarantias.DSxGarantiaCabecera;
  G2kTableLoc.DataSource := DMAsignacionDeGarantias.DSxGarantiaCabecera;
end;

procedure TFMAsignacionDeGarantias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsignacionDeGarantias);
end;

procedure TFMAsignacionDeGarantias.FormShow(Sender: TObject);
begin
  inherited;
  PCMain.ActivePage := TSFicha;
end;

procedure TFMAsignacionDeGarantias.DBEFClienteChange(Sender: TObject);
begin
  ETituloCliente.Text := DameTituloCliente(StrToIntDef(DBEFCliente.Text, 0));
end;

procedure TFMAsignacionDeGarantias.DBEFArticuloChange(Sender: TObject);
begin
  ETituloArticulo.Text := DMAsignacionDeGarantias.DameArticuloGarantia(DBEFArticulo.Text);
end;

procedure TFMAsignacionDeGarantias.HYMNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button in [nbInsert, nbEdit] then
  begin
     PCMain.ActivePage := TSFicha;
     DBEFArticulo.SetFocus;
  end;
end;

procedure TFMAsignacionDeGarantias.BImprimirClick(Sender: TObject);
begin
  // Dependiendo del boton que seleccione imprimir elijo un formato u otro.
  DMAsignacionDeGarantias.ImprimirEtiqueta(CHBPrevisualizar.Checked, TButton(Sender).Tag);
end;

procedure TFMAsignacionDeGarantias.BDisenarClick(Sender: TObject);
begin
  with DMAsignacionDeGarantias.frReport1 do
  begin
     // Dependiendo del boton que seleccione imprimir elijo un formato u otro.
     LoadFromFile(Format('LGarantias%d.frf', [TButton(Sender).Tag]));

     DesignReport;
  end;
end;

procedure TFMAsignacionDeGarantias.BDuplicarClick(Sender: TObject);
begin
  DMAsignacionDeGarantias.Repetir;
end;

procedure TFMAsignacionDeGarantias.BBuscarReferenciaClick(Sender: TObject);
begin
  DMAsignacionDeGarantias.FiltraPorReferencia(BuscarReferencia.Text);
end;

procedure TFMAsignacionDeGarantias.BLimpiarReferenciaClick(Sender: TObject);
begin
  BuscarReferencia.Text := '';
  DMAsignacionDeGarantias.FiltraPorReferencia(BuscarReferencia.Text);
end;

procedure TFMAsignacionDeGarantias.BuscarReferenciaKeyPress(Sender: TObject; var Key: char);
begin
  if (Key = #13) then
     DMAsignacionDeGarantias.FiltraPorReferencia(BuscarReferencia.Text);
end;

procedure TFMAsignacionDeGarantias.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
