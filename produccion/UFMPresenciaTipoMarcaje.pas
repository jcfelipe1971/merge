unit UFMPresenciaTipoMarcaje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  RxDBComb, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMPresenciaTipoMarcaje = class(TFPEdit)
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     LIdentificadorTipoMarcaje: TLFLabel;
     DBEIdentificadorTipoMarcaje: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPresenciaTipoMarcaje : TFMPresenciaTipoMarcaje;

implementation

uses UDMPresenciaTipoMarcaje, UFormGest;

{$R *.dfm}

procedure TFMPresenciaTipoMarcaje.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPresenciaTipoMarcaje, DMPresenciaTipoMarcaje);
  NavMain.DataSource := DMPresenciaTipoMarcaje.DSQMTipoPre;
  DBGMain.DataSource := DMPresenciaTipoMarcaje.DSQMTipoPre;
  G2KTableLoc.DataSource := DMPresenciaTipoMarcaje.DSQMTipoPre;
end;

procedure TFMPresenciaTipoMarcaje.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPresenciaTipoMarcaje);
end;

procedure TFMPresenciaTipoMarcaje.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
