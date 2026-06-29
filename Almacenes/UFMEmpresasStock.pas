unit UFMEmpresasStock;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel,
  StdCtrls, Mask, DBCtrls;

type
  TFMEmpresasStock = class(TFPEdit)
     DBGFEmp: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFEmpBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEmpresasStock : TFMEmpresasStock;

implementation

uses UDMMain, UDMEmpresasStock, UFormGest, UEntorno, DB;

{$R *.dfm}

procedure TFMEmpresasStock.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMEmpresasStock, DMEmpresasStock);

  // PCMain.Pages[1].Free;
  TSTabla.TabVisible := False;
  PEdit.Enabled := True;
end;

procedure TFMEmpresasStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEmpresasStock);
end;

procedure TFMEmpresasStock.DBGFEmpBusqueda(Sender: TObject);
begin
  inherited;
  if Trim(DBGFemp.TablaABuscar) = 'SYS_EMPRESAS' then
  begin
     DBGFEmp.CondicionBusqueda := '';
  end;

  if Trim(DBGFEmp.TablaABuscar) = 'GEN_CANALES' then
  begin
     if DBGFEmp.ColumnaActual = 'CANAL' then
        DBGFEmp.CondicionBusqueda := 'EMPRESA=' + DBGFEmp.Columns[0].Field.Text
     else
        DBGFEmp.CondicionBusqueda := 'EMPRESA=' + DBGFEmp.Columns[3].Field.Text;
  end;

  if Trim(DBGFEmp.TablaABuscar) = 'ART_ALMACENES' then
  begin
     if DBGFEmp.ColumnaActual = 'ALMACEN' then
        DBGFEmp.CondicionBusqueda := 'EMPRESA=' + DBGFEmp.Columns[0].Field.Text
     else
        DBGFEmp.CondicionBusqueda := 'EMPRESA=' + DBGFEmp.Columns[3].Field.Text;
  end;
end;

end.
