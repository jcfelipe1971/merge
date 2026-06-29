unit UIsoFMFichaTecnica;

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
  TIsoFMFichaTecnica = class(TFPEdit)
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
     AFichaTecnica: TAction;
     DBDTPFechaAdq: TLFDBDateEdit;
     ALstConfigFicha: TAction;
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
     SplitDescripcion: TSplitter;
     TSArticulos: TTabSheet;
     HYMNavigator1: THYMNavigator;
     CEArticulos: TControlEdit;
     CEArticulosPMEdit: TPopUpTeclas;
     TBArticulos: TLFToolBar;
     NavArticulos: THYMNavigator;
     DBFGArticulos: TDBGridFind2000;
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
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AFichaTecnicaExecute(Sender: TObject);
     procedure ALstConfigFichaExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure TBDesmarcarClick(Sender: TObject);
     procedure ACertificadoAnalisisExecute(Sender: TObject);
     procedure ALstConfigCertificadoExecute(Sender: TObject);
     procedure TSArticulosShow(Sender: TObject);
     procedure AMarcarExecute(Sender: TObject);
     procedure ADesmarcarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtra(Filtro: string);
  end;

var
  IsoFMFichaTecnica : TIsoFMFichaTecnica;

implementation

uses UIsoDMFichaTecnica, UFormGest, UDMMain, UFMListconfig,
  UFPregCliente, UUtiles, UEntorno;

{$R *.DFM}

procedure TIsoFMFichaTecnica.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMFichaTecnica, IsoDMFichaTecnica);

  NavMain.DataSource := IsoDMFichaTecnica.DSQMFichaC;
  EPMain.DataSource := IsoDMFichaTecnica.DSQMFichaC;
  DBGMain.DataSource := IsoDMFichaTecnica.DSQMFichaC;
  NavDetalle.DataSource := IsoDMFichaTecnica.DSQMFichaD;
  DBGFDetalle.DataSource := IsoDMFichaTecnica.DSQMFichaD;
  G2KTableLoc.DataSource := IsoDMFichaTecnica.DSQMFichaC;
  CEMainPMEdit.Teclas := DMMain.teclas;
  NavArticulos.DataSource := IsoDMFichaTecnica.DSQMFichaArt;
  DBFGArticulos.DataSource := IsoDMFichaTecnica.DSQMFichaArt;
  LFDBArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TIsoFMFichaTecnica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMFichaTecnica);
end;

procedure TIsoFMFichaTecnica.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMFichaTecnica.BusquedaCompleja;
end;

procedure TIsoFMFichaTecnica.AFichaTecnicaExecute(Sender: TObject);
begin
  IsoDMFichaTecnica.MostrarListado(8064, 0, 0);
end;

procedure TIsoFMFichaTecnica.ALstConfigFichaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8064, Formato, Cabecera, Copias, Pijama, '', IsoDMFichaTecnica.frIsoFichaTecnica);
end;

procedure TIsoFMFichaTecnica.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMFichaTecnica.TBDesmarcarClick(Sender: TObject);
begin
  IsoDMFichaTecnica.DesMarcarTodo;
end;

procedure TIsoFMFichaTecnica.ACertificadoAnalisisExecute(Sender: TObject);
begin
  AbreForm(TFPregCliente, FPregCliente);
end;

procedure TIsoFMFichaTecnica.ALstConfigCertificadoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8065, Formato, Cabecera, Copias, Pijama, '', IsoDMFichaTecnica.frIsoFichaTecnica);
end;

procedure TIsoFMFichaTecnica.TSArticulosShow(Sender: TObject);
begin
  inherited;
  NavArticulos.ControlEdit := CEArticulos;
  NavArticulos.DataSource := IsoDMFichaTecnica.DSQMFichaArt;
  DBFGArticulos.DataSource := IsoDMFichaTecnica.DSQMFichaArt;
end;

procedure TIsoFMFichaTecnica.AMarcarExecute(Sender: TObject);
begin
  IsoDMFichaTecnica.MarcarTodo;
end;

procedure TIsoFMFichaTecnica.ADesmarcarExecute(Sender: TObject);
begin
  inherited;
  IsoDMFichaTecnica.DesMarcarTodo;
end;

procedure TIsoFMFichaTecnica.Filtra(Filtro: string);
begin
  IsoDMFichaTecnica.Filtra(Filtro);
end;

end.
