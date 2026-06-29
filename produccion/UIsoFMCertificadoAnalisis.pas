unit UIsoFMCertificadoAnalisis;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UDBDateTimePicker,
  StdCtrls, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEditFind2000,
  ULFDBEdit, rxToolEdit, RXDBCtrl, UG2kTBLoc, ULFLabel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFComboBox, DbComboBoxValue, ULFDBDateEdit;

type
  TIsoFMCertificadoAnalisis = class(TFPEdit)
     LRIG: TLFLabel;
     DBEID: TLFDbedit;
     LFechaAdq: TLFLabel;
     LBLArticulo: TLFLabel;
     DBEDescripArticulo: TLFDbedit;
     LRevision: TLFLabel;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     LFCategoryAction1: TLFCategoryAction;
     DBDTPFechaAdq: TLFDBDateEdit;
     LFCategoryAction2: TLFCategoryAction;
     LFDBArticulo: TLFDBEditFind2000;
     LResponsable: TLFLabel;
     LFDBResponsable: TLFDBEditFind2000;
     EResponsable: TLFDbedit;
     DBCHKActivo: TLFDBCheckBox;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     LUnidadesEnviadas: TLFLabel;
     LUnidadesTrans: TLFLabel;
     LLoteHomogeneo: TLFLabel;
     DBERevision: TLFDbedit;
     LFDUnidEnv: TLFDbedit;
     LFDUnidTrans: TLFDbedit;
     LFDLoteHom: TLFDbedit;
     DBMDescripcion: TLFDBMemo;
     LBLLote: TLFLabel;
     LFDLote: TLFDbedit;
     ACertificadoAnalisis: TAction;
     ALstConfigCertificado: TAction;
     SplitDescripcion: TSplitter;
     LBLCliente: TLFLabel;
     LFDBCliente: TLFDBEditFind2000;
     DBEDescripCliente: TLFDbedit;
     LBLOrden: TLFLabel;
     LFDOrden: TLFDbedit;
     CEArticulos: TControlEdit;
     CEArticulosPMEdit: TPopUpTeclas;
     TBMarcar: TToolButton;
     TBDesmarcar: TToolButton;
     ADetalle: TLFActionList;
     AMarcar: TAction;
     ADesmarcar: TAction;
     LProducto: TLFLabel;
     LFDBECodigo: TLFDbedit;
     LReferencia: TLFLabel;
     LFDBRef: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LColores: TLFLabel;
     LFDColores: TLFDbedit;
     LNombre: TLFLabel;
     LFDNombreProd: TLFDbedit;
     LAplicPref: TLFLabel;
     LFDAplicPref: TLFDbedit;
     LFDBCarNormaUne: TLFDbedit;
     LBLCarNormaUne: TLFLabel;
     LFDBCHKValor2: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AListCertAnalisisExecute(Sender: TObject);
     procedure ALstConfigFichaExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure TBDesmarcarClick(Sender: TObject);
     procedure ACertificadoAnalisisExecute(Sender: TObject);
     procedure ALstConfigCertificadoExecute(Sender: TObject);
     procedure AMarcarExecute(Sender: TObject);
     procedure ADesmarcarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtra(Filtro: string);
     procedure CrearFicha(id_orden, cliente, id_lote: integer; compuesto: string);
  end;

var
  IsoFMCertificadoAnalisis : TIsoFMCertificadoAnalisis;

implementation

uses UIsoDMCertificadoAnalisis, UFormGest, UDMMain, UFMListconfig,
  UFPregCliente, UUtiles, UEntorno;

{$R *.DFM}

procedure TIsoFMCertificadoAnalisis.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMCertificadoAnalisis, IsoDMCertificadoAnalisis);

  NavMain.DataSource := IsoDMCertificadoAnalisis.DSQMFichaC;
  EPMain.DataSource := IsoDMCertificadoAnalisis.DSQMFichaC;
  DBGMain.DataSource := IsoDMCertificadoAnalisis.DSQMFichaC;
  NavDetalle.DataSource := IsoDMCertificadoAnalisis.DSQMFichaD;
  DBGFDetalle.DataSource := IsoDMCertificadoAnalisis.DSQMFichaD;
  G2KTableLoc.DataSource := IsoDMCertificadoAnalisis.DSQMFichaC;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  LFDBArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TIsoFMCertificadoAnalisis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMCertificadoAnalisis);
end;

procedure TIsoFMCertificadoAnalisis.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMCertificadoAnalisis.BusquedaCompleja;
end;

procedure TIsoFMCertificadoAnalisis.AListCertAnalisisExecute(Sender: TObject);
begin
  IsoDMCertificadoAnalisis.MostrarListado(8064, 0, 0);
end;

procedure TIsoFMCertificadoAnalisis.ALstConfigFichaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8064, Formato, Cabecera, Copias, Pijama, '', IsoDMCertificadoAnalisis.frIsoCertificadoAnalisis);
end;

procedure TIsoFMCertificadoAnalisis.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMCertificadoAnalisis.TBDesmarcarClick(Sender: TObject);
begin
  IsoDMCertificadoAnalisis.DesMarcarTodo;
end;

procedure TIsoFMCertificadoAnalisis.ACertificadoAnalisisExecute(Sender: TObject);
begin
  AbreForm(TFPregCliente, FPregCliente);
end;

procedure TIsoFMCertificadoAnalisis.ALstConfigCertificadoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8065, Formato, Cabecera, Copias, Pijama, '', IsoDMCertificadoAnalisis.frIsoCertificadoAnalisis);
end;

procedure TIsoFMCertificadoAnalisis.AMarcarExecute(Sender: TObject);
begin
  IsoDMCertificadoAnalisis.MarcarTodo;
end;

procedure TIsoFMCertificadoAnalisis.ADesmarcarExecute(Sender: TObject);
begin
  inherited;
  IsoDMCertificadoAnalisis.DesMarcarTodo;
end;

procedure TIsoFMCertificadoAnalisis.Filtra(Filtro: string);
begin
  IsoDMCertificadoAnalisis.Filtra(Filtro);
end;

procedure TIsoFMCertificadoAnalisis.CrearFicha(id_orden, cliente, id_lote: integer; compuesto: string);
begin
  IsoDMCertificadoAnalisis.CrearFicha(id_orden, cliente, id_lote, compuesto);
end;

end.
