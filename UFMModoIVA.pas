unit UFMModoIva;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, DBCtrls, Mask, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt,
  NsDBGrid, ULFDBEditFind2000, ULFDBCheckBox, ULFDBEdit, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc;

type
  TFMModoIva = class(TFPEdit)
     LBLModo: TLFLabel;
     DBEModo: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBCHKIva: TLFDBCheckBox;
     DBCHKRecargo: TLFDBCheckBox;
     DBCHKDeducible: TLFDBCheckBox;
     LBLTransaccion: TLFLabel;
     DBEFTipoTransaccion: TLFDBEditFind2000;
     DBETituloTransaccion: TLFDbedit;
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
  FMModoIva : TFMModoIva;

implementation

uses UDMModoIVA, UFormGest, UDMMain;

{$R *.DFM}

procedure TFMModoIva.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMModoIVA, DMModoIVA);
  NavMain.DataSource := DMModoIVA.DSQMModoIva;
  DBGMain.DataSource := DMModoIVA.DSQMModoIva;
end;

procedure TFMModoIva.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMModoIVA);
end;

procedure TFMModoIva.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMModoIVA.BusquedaCompleja;
  Continua := False;
end;

procedure TFMModoIva.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
