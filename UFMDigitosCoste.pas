unit UFMDigitosCoste;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, UFormGest,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ComCtrls,
  ToolWin, ExtCtrls, Grids, DBGrids, NsDBGrid, UNavigator, Menus, UTeclas,
  UControlEdit, rxPlacemnt, ULFFormStorage, ULFPanel, ULFToolBar;

type
  TFMDigitosCoste = class(TG2KForm)
     PNMain: TLFPanel;
     TBMain: TLFToolBar;
     TButtConfirmar: TToolButton;
     DBGCentroCoste: TDBGridFind2000;
     NavDigitosCoste: THYMNavigator;
     CEDigitosCoste: TControlEdit;
     CEDigitosCostePMEdit: TPopUpTeclas;
     FSMain: TLFFibFormStorage;
     procedure TButtConfirmarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure DBGCentroCosteBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure IntroduceCoste(var d1, d2, d3, d4, d5: string; var estado: smallint);
     procedure muestra(Id: integer; cuenta: string);
  end;

var
  FMDigitosCoste : TFMDigitosCoste;

implementation

uses UDMMain, UDMDigitosCoste;

{$R *.DFM}

procedure TFMDigitosCoste.IntroduceCoste(var d1, d2, d3, d4, d5: string; var estado: smallint);
begin
  ShowModal;
end;

procedure TFMDigitosCoste.TButtConfirmarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMDigitosCoste.FormCreate(Sender: TObject);
begin
  AbreData(TDMDigitosCoste, DMDigitosCoste);
  NavDigitosCoste.DataSource := DMDigitosCoste.DSQMCentroCoste;
  DBGCentroCoste.DataSource := DMDigitosCoste.DSQMCentroCoste;
end;

procedure TFMDigitosCoste.muestra(Id: integer; cuenta: string);
begin
  DMDigitosCoste.Inicializa(Id);
  Caption := _('C. Costes') + ' ' + Cuenta;
  ShowModal;
end;

procedure TFMDigitosCoste.DBGCentroCosteBusqueda(Sender: TObject);
begin
  if (DBGCentroCoste.ColumnaActual = 'D1') then
     DBGCentroCoste.CondicionBusqueda := 'NUM_DIGITO=1';
  if (DBGCentroCoste.ColumnaActual = 'D2') then
     DBGCentroCoste.CondicionBusqueda := 'NUM_DIGITO=2';
  if (DBGCentroCoste.ColumnaActual = 'D3') then
     DBGCentroCoste.CondicionBusqueda := 'NUM_DIGITO=3';
  if (DBGCentroCoste.ColumnaActual = 'D4') then
     DBGCentroCoste.CondicionBusqueda := 'NUM_DIGITO=4';
  if (DBGCentroCoste.ColumnaActual = 'D5') then
     DBGCentroCoste.CondicionBusqueda := 'NUM_DIGITO=5';
end;

procedure TFMDigitosCoste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMDigitosCoste);
  Action := caFree;
end;

end.
