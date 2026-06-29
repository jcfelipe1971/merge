unit UProFMOrdTareaMat;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UHYDescription, ULFHYDBDescription,
  StdCtrls, Mask, DBCtrls, ULFDBEditFind2000, ULFLabel, ULFDBEdit, ULFEdit,
  Buttons;

type
  TProFMOrdTareaMat = class(TFPEditDetalle)
     LTarea: TLFLabel;
     LFase: TLFLabel;
     LOrden: TLFLabel;
     LFDBTarea: TLFDBEditFind2000;
     DescTarea: TLFHYDBDescription;
     LFDBFase: TLFDbedit;
     DBEOrden: TLFDbedit;
     DBEDescripcionFase: TLFDbedit;
     DBEDescOrden: TLFDbedit;
     DBECompuesto: TLFDbedit;
     SBAOrden: TSpeedButton;
     AAOrden: TAction;
     LFCategoryAction1: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure LFDBTareaChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure SBAOrdenDblClick(Sender: TObject);
     procedure AAOrdenExecute(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMOrdTareaMat : TProFMOrdTareaMat;

implementation

uses UProDMOrdTareaMat, UDMMain, UFormGest, UFMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TProFMOrdTareaMat.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMOrdTareaMat, ProDMOrdTareaMat);
  NavMain.DataSource := ProDMOrdTareaMat.DSTareaMatCab;
  DBGMain.DataSource := ProDMOrdTareaMat.DSTareaMatCab;

  DBEOrden.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAOrden, DBEOrden);
end;

procedure TProFMOrdTareaMat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMOrdTareaMat);
end;

procedure TProFMOrdTareaMat.LFDBTareaChange(Sender: TObject);
begin
  inherited;
  DescTarea.ActualizaDatos('ID_TAREA', LFDBTarea.Text);
end;

procedure TProFMOrdTareaMat.SBAOrdenDblClick(Sender: TObject);
begin
  inherited;
  AAOrden.Execute;
end;

procedure TProFMOrdTareaMat.AAOrdenExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProOrden, ProDMOrdTareaMat.QMTareaMatCabID_ORDEN.AsString);
end;

procedure TProFMOrdTareaMat.DBGFDetalleBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end
     else
     if (Trim(TablaABuscar) = 'VER_EMPLEADOS_EF') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND ACTIVO=1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'EMPLEADO';
     end;
  end;

end;

end.
