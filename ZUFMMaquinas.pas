unit ZUFMMaquinas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, NsDBGrid,
  ULFPageControl, ULFToolBar, ULFPanel, ULFEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFDBEdit, UG2kTBLoc, ULFLabel;

type
  TZFMMaquinas = class(TFPEdit)
     LblMaquina: TLFLabel;
     DBEMaquina: TLFDbedit;
     LblDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     DBCheckActivo: TLFDBCheckBox;
     DBCBTipoMaquina: TDBComboBox;
     DBEDescTipoMaquina: TLFDbedit;
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
  ZFMMaquinas : TZFMMaquinas;

implementation

{$R *.DFM}

uses UDMMain, ZUDMMaquinas, UFormGest, UFMain;

procedure TZFMMaquinas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMMaquinas, ZDMMaquinas);

  NavMain.DataSource := ZDMMaquinas.DSQMMaquinas;
  EPMain.DataSource := ZDMMaquinas.DSQMMaquinas;
  DBGMain.DataSource := ZDMMaquinas.DSQMMaquinas;
  G2kTableLoc.DataSource := ZDMMaquinas.DSQMMaquinas;
  CEMainPMEdit.Teclas := DMMain.teclas;
end;

procedure TZFMMaquinas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(ZDMMaquinas);
end;

procedure TZFMMaquinas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMMaquinas.BusquedaCompleja;
end;

procedure TZFMMaquinas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
