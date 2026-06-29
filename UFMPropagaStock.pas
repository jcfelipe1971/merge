unit UFMPropagaStock;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, NsDBGrid, UHYDescription,
  rxPlacemnt, ULFDBCheckBox, ULFDBEditFind2000, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFHYDBDescription,
  TFlatCheckBoxUnit, ULFCheckBox, ULFFIBDBEditFind, ULFLabel, UG2kTBLoc;

type
  TFMPropagaStock = class(TFPEdit)
     GBOrigen: TGroupBox;
     GBDestino: TGroupBox;
     DBEFEmpresa: TLFFibDBEditFind;
     DBEFAlmacen: TLFFibDBEditFind;
     DBEFCanal: TLFFibDBEditFind;
     LBLEmpresa: TLFLabel;
     LBLAlmacen: TLFLabel;
     LBLCanal: TLFLabel;
     LBLEmpresaDestino: TLFLabel;
     LBLAlmacenDestino: TLFLabel;
     LBLCanalDestino: TLFLabel;
     DBEFEmpresaDestino: TLFDBEditFind2000;
     DBEFAlmacenDestino: TLFDBEditFind2000;
     DBEFCanalDestino: TLFDBEditFind2000;
     HYDBDEmpresa: TLFHYDBDescription;
     HYDBDCanal: TLFHYDBDescription;
     HYDBDAlmacen: TLFHYDBDescription;
     HYDBDAlmacenD: TLFHYDBDescription;
     HYDBDCanalD: TLFHYDBDescription;
     HYDBDEmpresaD: TLFHYDBDescription;
     DBCBStock: TLFDBCheckBox;
     DBCBPmp: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFCanalBusqueda(Sender: TObject);
     procedure DBEFCanalDestinoBusqueda(Sender: TObject);
     procedure DBEFAlmacenBusqueda(Sender: TObject);
     procedure DBEFAlmacenDestinoBusqueda(Sender: TObject);
     procedure DBEFEmpresaChange(Sender: TObject);
     procedure DBEFCanalChange(Sender: TObject);
     procedure DBEFAlmacenChange(Sender: TObject);
     procedure DBEFEmpresaDestinoChange(Sender: TObject);
     procedure DBEFCanalDestinoChange(Sender: TObject);
     procedure DBEFAlmacenDestinoChange(Sender: TObject);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
  public
  end;

var
  FMPropagaStock : TFMPropagaStock;

implementation

uses UDMMain, UFormGest, UEntorno, UDMPropagaStock, UUtiles;

{$R *.DFM}

procedure TFMPropagaStock.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMPropagaStock, DMPropagastock);
  NavMain.DataSource := DMPropagaStock.DSQMPropaga;
  DBGMain.DataSource := DMPropagaStock.DSQMpropaga;
  ControlEdit := CEMain;
end;

procedure TFMPropagaStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMPropagaStock);
  action := caFree;
end;

procedure TFMPropagaStock.DBEFCanalBusqueda(Sender: TObject);
begin
  DBEFCanal.CondicionBusqueda := 'empresa=' + DBEFEmpresa.Text + ' and activo=1';
end;

procedure TFMPropagaStock.DBEFCanalDestinoBusqueda(Sender: TObject);
begin
  DBEFCanalDestino.CondicionBusqueda := 'empresa=' + DBEFEmpresaDestino.Text +
     ' and activo=1';
end;

procedure TFMPropagaStock.DBEFAlmacenBusqueda(Sender: TObject);
begin
  DBEFAlmacen.CondicionBusqueda := 'empresa=' + DBEFEmpresa.Text;
end;

procedure TFMPropagaStock.DBEFAlmacenDestinoBusqueda(Sender: TObject);
begin
  DBEFAlmacenDestino.CondicionBusqueda := 'empresa=' + DBEFEmpresaDestino.Text;
end;

procedure TFMPropagaStock.DBEFEmpresaChange(Sender: TObject);
begin
  HYDBDEmpresa.ActualizaDatos('EMPRESA', DBEFEmpresa.Text);
end;

procedure TFMPropagaStock.DBEFCanalChange(Sender: TObject);
begin
  HYDBDCanal.ActualizaDatos('CANAL', DBEFCanal.Text);
end;

procedure TFMPropagaStock.DBEFAlmacenChange(Sender: TObject);
begin
  HYDBDAlmacen.ActualizaDatos('ALMACEN', DBEFAlmacen.Text);
end;

procedure TFMPropagaStock.DBEFEmpresaDestinoChange(Sender: TObject);
begin
  HYDBDEmpresaD.ActualizaDatos('EMPRESA', DBEFEmpresaDestino.Text);
end;

procedure TFMPropagaStock.DBEFCanalDestinoChange(Sender: TObject);
begin
  HYDBDCanalD.ActualizaDatos('CANAL', DBEFCanalDestino.Text);
end;

procedure TFMPropagaStock.DBEFAlmacenDestinoChange(Sender: TObject);
begin
  HYDBDAlmacenD.ActualizaDatos('ALMACEN', DBEFAlmacenDestino.Text);
end;

procedure TFMPropagaStock.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  color1, color2 : TColor;
begin
  inherited;

  if (Button = nbEdit) then
  begin
     color1 := clInfoBk;
     color2 := clGrayText;
  end
  else
  begin
     color1 := clWindow;
     color2 := clWindowText;
  end;

  DBEFEmpresa.Color := color1;
  DBEFEmpresa.Font.Color := color2;
  DBEFCanal.Color := color1;
  DBEFCanal.Font.Color := color2;
  DBEFAlmacen.Color := color1;
  DBEFAlmacen.Font.Color := color2;

  DBEFEmpresaDestino.Color := color1;
  DBEFEmpresaDestino.Font.Color := color2;
  DBEFCanalDestino.Color := color1;
  DBEFCanalDestino.Font.Color := color2;
  DBEFAlmacenDestino.Color := color1;
  DBEFAlmacenDestino.Font.Color := color2;
end;

end.
