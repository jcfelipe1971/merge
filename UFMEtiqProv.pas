unit UFMEtiqProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, rxPlacemnt, NsDBGrid,
  ULFEdit, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMEtiqProv = class(TFPEdit)
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     LBLNRegistro: TLFLabel;
     DBECodigo: TLFDbedit;
     LBLNombreFicha: TLFLabel;
     DBETitulo: TLFDbedit;
     LNroEtiquetasVacias: TLFLabel;
     EdEtiqVacias: TLFEdit;
     PNLDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     DBGFProv: TDBGridFind2000;
     NavDetalle: THYMNavigator;
     AVisualizarEtiquetas: TAction;
     AImprimirEtiquetas: TAction;
     AListConf: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AAgrupPro: TAction;
     LFCategoryAction2: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFProvColEnter(Sender: TObject);
     procedure AVisualizarEtiquetasExecute(Sender: TObject);
     procedure AImprimirEtiquetasExecute(Sender: TObject);
     procedure AListConfExecute(Sender: TObject);
     procedure AAgrupProExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEtiqProv : TFMEtiqProv;

implementation

{$R *.DFM}

uses UDMEtiqProv, UDMMain, UEntorno, UFormGest, UFMListConfig, UFPregEtiqAgrup;

procedure TFMEtiqProv.FormCreate(Sender: TObject);
begin
  inherited;
  EdEtiqVacias.Text := '0';
  AbreData(TDMEtiqProv, DMEtiqProv);
  NavMain.DataSource := DMEtiqProv.DSQMEtiqProvCab;
  EPMain.DataSource := DMEtiqProv.DSQMEtiqProvCab;
  DBGMain.DataSource := DMEtiqProv.DSQMEtiqProvCab;
end;

procedure TFMEtiqProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEtiqProv);
end;

procedure TFMEtiqProv.DBGFProvColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

procedure TFMEtiqProv.AVisualizarEtiquetasExecute(Sender: TObject);
begin
  inherited;
  DMEtiqProv.ImprimirEtiquetas(StrToIntDef(EdEtiqVacias.Text, 0), 0);
end;

procedure TFMEtiqProv.AImprimirEtiquetasExecute(Sender: TObject);
begin
  inherited;
  DMEtiqProv.ImprimirEtiquetas(StrToIntDef(EdEtiqVacias.Text, 0), 1);
end;

procedure TFMEtiqProv.AListConfExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(71, formato, cabecera, copias,
     pijama, '', DMEtiqProv.frEtiqProv);
end;

procedure TFMEtiqProv.AAgrupProExecute(Sender: TObject);
var
  Agrupacion : string;
  Modo : integer;
begin
  inherited;
  Modo := 1;
  UFPregEtiqAgrup.DevuelveValor(Modo, _('Seleccione Agrupación Proveedor'), Agrupacion, Self);
  if (modo <> -1) then
  begin
     if (Agrupacion = '') then
        raise Exception.Create(_('¡Datos incompletos!'));
     DMEtiqProv.AddAgrupacion(Agrupacion);
  end;
end;

end.
