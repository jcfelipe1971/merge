unit UFMRegistroFitosanitario;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, UHYDescription,
  ULFHYDBDescription, ULFLabel, DBCtrls, ULFDBEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFFIBDBEditFind,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, DbComboBoxValue, ULFDBComboBoxValue,
  ULFDBMemo;

type
  TFMRegistroFitosanitario = class(TFPEdit)
     LId: TLFLabel;
     DBEID: TLFDbedit;
     DBEjercicio: TLFDbedit;
     LEjercicio: TLFLabel;
     LCanal: TLFLabel;
     DBEFCanal: TLFDBEditFind2000;
     LTipo: TLFLabel;
     DBTipo: TLFDbedit;
     LSerie: TLFLabel;
     DBSerie: TLFDbedit;
     LRIG: TLFLabel;
     DBRig: TLFDbedit;
     LLinea: TLFLabel;
     DBLinea: TLFDbedit;
     LTipoRegistroFitosanitario: TLFLabel;
     DBCBTipoRegistro: TLFDBComboBoxValue;
     DBDTPFecha: TLFDBDateEdit;
     LFecha: TLFLabel;
     DBEFArticulo: TLFFibDBEditFind;
     LArticulo: TLFLabel;
     LTitulo: TLFLabel;
     DBDescripcion: TLFDbedit;
     LLote: TLFLabel;
     DBELote: TLFDbedit;
     LCantidad: TLFLabel;
     DBCantidad: TLFDbedit;
     LNIF: TLFLabel;
     DBENIF: TLFDbedit;
     LNombre: TLFLabel;
     DBENombre: TLFDbedit;
     LDireccion: TLFLabel;
     DBEDireccion: TLFDbedit;
     LCodigoRegistro: TLFLabel;
     DBECOD_REG_FITOSANITARIO: TLFDbedit;
     DBECodigoPostal: TLFDbedit;
     LCodPostal: TLFLabel;
     LLocalidad: TLFLabel;
     DBELocalidad: TLFDbedit;
     LCarnetAplicador: TLFLabel;
     DBECarnetAplicador: TLFDbedit;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     DBDTPFechaValidezCarnet: TLFDBDateEdit;
     LFechaValidezCarnet: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBECarnetAplicadorChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AsignaDocumento(aTipo: string; aIdDet: integer);
  end;

var
  FMRegistroFitosanitario : TFMRegistroFitosanitario;

implementation

uses
  UDMMain, UDMRegistroFitosanitario, UFormGest, UEntorno, UUtiles;

{$R *.dfm}

procedure TFMRegistroFitosanitario.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRegistroFitosanitario, DMRegistroFitosanitario);

  NavMain.DataSource := DMRegistroFitosanitario.DSQMRegistroFitosanitario;
  DBGMain.DataSource := DMRegistroFitosanitario.DSQMRegistroFitosanitario;
  G2kTableLoc.DataSource := DMRegistroFitosanitario.DSQMRegistroFitosanitario;

  DBECarnetAplicadorChange(nil);

  // Color campo ID
  ColorCampoID(DBEID);
end;

procedure TFMRegistroFitosanitario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRegistroFitosanitario);
end;

procedure TFMRegistroFitosanitario.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMRegistroFitosanitario.BusquedaCompleja;
end;

procedure TFMRegistroFitosanitario.AsignaDocumento(aTipo: string; aIdDet: integer);
begin
  DMRegistroFitosanitario.AsignaDocumento(aTipo, aIdDet);
  DBECarnetAplicadorChange(nil);
end;

procedure TFMRegistroFitosanitario.DBECarnetAplicadorChange(Sender: TObject);
begin
  inherited;
  if (Trim(DBECarnetAplicador.Text) = '') then
     ColorError(DBECarnetAplicador)
  else
     ColorEdicion(DBECarnetAplicador);
end;

end.
