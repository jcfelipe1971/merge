unit UFMCategoriaCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMCategoriaCliente = class(TFPEdit)
     LCodigo: TLFLabel;
     DBECodigo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMCategoriaCliente : TFMCategoriaCliente;

implementation

uses UDMCategoriaCliente, UFormGest, UDMMain;

{$R *.dfm}

procedure TFMCategoriaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCategoriaCliente, DMCategoriaCliente);
  NavMain.DataSource := DMCategoriaCliente.DSQMCategoriaCliente;
  DBGMain.DataSource := DMCategoriaCliente.DSQMCategoriaCliente;
  G2KTableLoc.DataSource := DMCategoriaCliente.DSQMCategoriaCliente;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMCategoriaCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCategoriaCliente);
end;

procedure TFMCategoriaCliente.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMCategoriaCliente.BusquedaCompleja;
  Continua := False;
end;

procedure TFMCategoriaCliente.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
