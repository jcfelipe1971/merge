unit UFMEtiqCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFEdit, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMEtiqCli = class(TFPEdit)
     LBLNRegistro: TLFLabel;
     DBECodigo: TLFDbedit;
     LBLNombreFicha: TLFLabel;
     DBETitulo: TLFDbedit;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     LNroEtiquetasVacias: TLFLabel;
     EdEtiqVacias: TLFEdit;
     PNLDetalle: TLFPanel;
     DBGFClientes: TDBGridFind2000;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     AVisualizarEtiquetas: TAction;
     AImprimirEtiquetas: TAction;
     AListConf: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AAgrupCli: TAction;
     LFCategoryAction2: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFClientesBusqueda(Sender: TObject);
     procedure DBGFClientesColEnter(Sender: TObject);
     procedure AVisualizarEtiquetasExecute(Sender: TObject);
     procedure AImprimirEtiquetasExecute(Sender: TObject);
     procedure AListConfExecute(Sender: TObject);
     procedure AAgrupCliExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEtiqCli : TFMEtiqCli;

implementation

{$R *.DFM}

uses UDMEtiqCli, UDMMain, UEntorno, UFormGest, UFMListConfig, UFPregEtiqAgrup;

procedure TFMEtiqCli.FormCreate(Sender: TObject);
begin
  inherited;
  EdEtiqVacias.Text := '0';
  AbreData(TDMEtiqCli, DMEtiqCli);
  NavMain.DataSource := DMEtiqCli.DSQMEtiqCliCab;
  EPMain.DataSource := DMEtiqCli.DSQMEtiqCliCab;
  DBGMain.DataSource := DMEtiqCli.DSQMEtiqCliCab;
end;

procedure TFMEtiqCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEtiqCli);
end;

procedure TFMEtiqCli.DBGFClientesBusqueda(Sender: TObject);
begin
  if Trim(DBGFClientes.TablaABuscar) = 'VER_CLIENTES' then
  begin
     DBGFClientes.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr +
        ' AND CANAL=' + REntorno.CanalStr;
  end
  else if Trim(DBGFClientes.TablaABuscar) = 'SYS_TERCEROS_DIRECCIONES' then
  begin
     DBGFClientes.CondicionBusqueda := 'TERCERO = ' + DMEtiqCli.DameTercero;
  end;
end;

procedure TFMEtiqCli.DBGFClientesColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

procedure TFMEtiqCli.AVisualizarEtiquetasExecute(Sender: TObject);
begin
  inherited;
  DMEtiqCli.ImprimirEtiquetas(StrToIntDef(EdEtiqVacias.Text, 0), 0);
end;

procedure TFMEtiqCli.AImprimirEtiquetasExecute(Sender: TObject);
begin
  inherited;
  DMEtiqCli.ImprimirEtiquetas(StrToIntDef(EdEtiqVacias.Text, 0), 1);
end;

procedure TFMEtiqCli.AListConfExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(70, formato, cabecera, copias,
     pijama, '', DMEtiqCli.frEtiqCli);
end;

procedure TFMEtiqCli.AAgrupCliExecute(Sender: TObject);
var
  Agrupacion : string;
  Modo : integer;
begin
  inherited;
  Modo := 0;
  UFPregEtiqAgrup.DevuelveValor(Modo, _('Seleccione Agrupación Cliente'), Agrupacion, Self);
  if modo <> -1 then
  begin
     if (Agrupacion = '') then
        raise Exception.Create(_('¡Datos incompletos!'));
     DMEtiqCli.AddAgrupacion(Agrupacion);
  end;
end;

end.
