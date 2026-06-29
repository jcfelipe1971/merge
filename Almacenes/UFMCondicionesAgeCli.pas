unit UFMCondicionesAgeCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, UEditPanel, UNavigator, ToolWin, UControlEdit, Menus,
  UTeclas, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, FIBEditFind, Grids, DBGrids, UHYDBGrid,
  UDBDateTimePicker, UFormGest, NsDBGrid, ULFDBCheckBox, ULFDBEditFind2000,
  ULFPageControl, ULFPanel, ULFDBEdit, ULFToolBar, TFlatCheckBoxUnit,
  ULFCheckBox, ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditSinNavegador, ActnList, ULFActionList;

type
  TFMCondicionesAgeCli = class(TFPEditSinNavegador)
     TSep1: TToolButton;
     PCMain: TLFPageControl;
     TSClientes: TTabSheet;
     TSAgrupaciones: TTabSheet;
     TBClientes: TLFToolBar;
     PCClientes: TLFPageControl;
     TSCli_Ficha: TTabSheet;
     TSCli_Tabla: TTabSheet;
     TBAgrupacion: TLFToolBar;
     PCAgrupacion: TLFPageControl;
     TSAgrup_Ficha: TTabSheet;
     TSAgrup_Tabla: TTabSheet;
     NavAgrupacion: THYMNavigator;
     NavClientes: THYMNavigator;
     PNLAgrup_Ficha: TLFPanel;
     PNLCli_Ficha: TLFPanel;
     EFCliente: TLFDBEditFind2000;
     DBENom_Cliente: TLFDbedit;
     DBEComision_Cli: TLFDbedit;
     DBCHKActivo_Cli: TLFDBCheckBox;
     LBLCliente: TLFLabel;
     LBLComision_Cli: TLFLabel;
     DBGClientes: THYTDBGrid;
     EFAgrupacion: TLFDBEditFind2000;
     DBENom_Agrupacion: TLFDbedit;
     DBEComision_Agrup: TLFDbedit;
     DBCHKActivo_Agrup: TLFDBCheckBox;
     LBLAgrupacion: TLFLabel;
     LBLComision_Agrup: TLFLabel;
     DBGAgrupacion: THYTDBGrid;
     CEAgrupacion: TControlEdit;
     CEAgrupacionPMEdit: TPopUpTeclas;
     PNLAgente: TLFPanel;
     LBLAgente: TLFLabel;
     EFAgente: TLFEditFind2000;
     DBENom_Agente: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFAgenteChange(Sender: TObject);
     procedure TSAgrupacionesShow(Sender: TObject);
     procedure TSClientesShow(Sender: TObject);
     procedure DBGAgrupacionDblClick(Sender: TObject);
     procedure DBGClientesDblClick(Sender: TObject);
     procedure TSAgrup_TablaShow(Sender: TObject);
     procedure TSCli_TablaShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCondicionesAgeCli : TFMCondicionesAgeCli;

implementation

uses UDMCondicionesAgeCli, UDMMain, UEntorno;

{$R *.DFM}

procedure TFMCondicionesAgeCli.FormCreate(Sender: TObject);
begin
  inherited;

  CEMainPMEdit.Teclas := DMMain.Teclas;
  CEMain.Teclas := DMMain.Teclas;
  CEAgrupacionPMEdit.Teclas := DMMain.Teclas;
  CEAgrupacion.Teclas := DMMain.Teclas;

  AbreData(TDMCondicionesAgecli, DMCondicionesAgeCli);

  NavClientes.DataSource := DMCondicionesAgeCli.DSQMCondClientes;
  NavAgrupacion.DataSource := DMCondicionesAgeCli.DSQMCondAgrupacion;
  PCMain.ActivePage := TSClientes;
end;

procedure TFMCondicionesAgeCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCondicionesAgecli);
end;

procedure TFMCondicionesAgeCli.EFAgenteChange(Sender: TObject);
begin
  DMCondicionesAgecli.FiltrarAgente(StrToIntDef(EFAgente.Text, 0));
end;

procedure TFMCondicionesAgeCli.TSAgrupacionesShow(Sender: TObject);
begin
  ControlEdit := CEAgrupacion;
end;

procedure TFMCondicionesAgeCli.TSClientesShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMCondicionesAgeCli.DBGAgrupacionDblClick(Sender: TObject);
begin
  PCAgrupacion.ActivePage := TSAgrup_Ficha;
end;

procedure TFMCondicionesAgeCli.DBGClientesDblClick(Sender: TObject);
begin
  PCClientes.ActivePage := TSCli_Ficha;
end;

procedure TFMCondicionesAgeCli.TSAgrup_TablaShow(Sender: TObject);
begin
  DBGAgrupacion.SetFocus;
end;

procedure TFMCondicionesAgeCli.TSCli_TablaShow(Sender: TObject);
begin
  DBGClientes.SetFocus;
end;

end.
