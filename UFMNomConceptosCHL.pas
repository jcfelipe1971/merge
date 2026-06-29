unit UFMNomConceptosCHL;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, ULFToolBar, UNavigator, StdCtrls,
  ULFLabel, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFPanel, UFPEditSinNavegador, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  UEditPanel, ULFPageControl;

type
  TFMNomConceptosCHL = class(TFPEditSinNavegador)
     PNLHaberes: TLFPanel;
     TBHaberes: TLFToolBar;
     NAVHaberes: THYMNavigator;
     PNLParametros: TLFPanel;
     TBParametros: TLFToolBar;
     NavParametros: THYMNavigator;
     PNLDescuentos: TLFPanel;
     TBDescuentos: TLFToolBar;
     NAVDescuentos: THYMNavigator;
     DBGFHaberes: TDBGridFind2000;
     DBGFDescuentos: TDBGridFind2000;
     PCMain: TLFPageControl;
     TSParametros: TTabSheet;
     TSHaberes: TTabSheet;
     TSDescuentos: TTabSheet;
     DBGFParametros: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFHaberesBusqueda(Sender: TObject);
     procedure DBGFDescuentosBusqueda(Sender: TObject);
     procedure DBGFParametrosBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMNomConceptosCHL : TFMNomConceptosCHL;

implementation

uses UDMMain, UEntorno, UFMain, UUtiles, UParam, UFormGest, UDMNomConceptosCHL;

{$R *.dfm}

procedure TFMNomConceptosCHL.FormCreate(Sender: TObject);
begin
  AbreData(TDMNomConceptosCHL, DMNomConceptosCHL);

  DBGFParametros.DataSource := DMNomConceptosCHL.DSQMParametro;
  DBGFHaberes.DataSource := DMNomConceptosCHL.DSQMHaber;
  DBGFDescuentos.DataSource := DMNomConceptosCHL.DSQMDescuento;

  NAVParametros.DataSource := DMNomConceptosCHL.DSQMParametro;
  NAVHaberes.DataSource := DMNomConceptosCHL.DSQMHaber;
  NAVDescuentos.DataSource := DMNomConceptosCHL.DSQMDescuento;

  PCMain.ActivePage := TSParametros;
end;

procedure TFMNomConceptosCHL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMNomConceptosCHL);
end;

procedure TFMNomConceptosCHL.DBGFHaberesBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'CON_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND PGC=' + IntToStr(REntorno.Pgc) + ' AND NIVEL = ' + IntToStr(REntorno.NivelesCont);
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CUENTA';
     end;
  end;
end;

procedure TFMNomConceptosCHL.DBGFDescuentosBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'CON_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND PGC=' + IntToStr(REntorno.Pgc) + ' AND NIVEL = ' + IntToStr(REntorno.NivelesCont);
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CUENTA';
     end;
  end;
end;

procedure TFMNomConceptosCHL.DBGFParametrosBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'CON_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND PGC=' + IntToStr(REntorno.Pgc) + ' AND NIVEL = ' + IntToStr(REntorno.NivelesCont);
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CUENTA';
     end;
  end;
end;

end.
