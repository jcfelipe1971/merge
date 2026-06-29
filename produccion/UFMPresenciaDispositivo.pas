unit UFMPresenciaDispositivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  RxDBComb, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMPresenciaDispositivo = class(TFPEdit)
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     LId: TLFLabel;
     DBEId: TLFDbedit;
     LIdentificadorInicidencia: TLFLabel;
     DBEIdentificadorInicidencia: TLFDbedit;
     LComportamiento: TLFLabel;
     LBolsaHoras: TLFLabel;
     DBELatitud: TLFDbedit;
     DBELongitud: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPresenciaDispositivo : TFMPresenciaDispositivo;

implementation

uses UDMPresenciaDispositivo, UFormGest;

{$R *.dfm}

procedure TFMPresenciaDispositivo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPresenciaDispositivo, DMPresenciaDispositivo);
  NavMain.DataSource := DMPresenciaDispositivo.DSQMDisPre;
  DBGMain.DataSource := DMPresenciaDispositivo.DSQMDisPre;
  G2KTableLoc.DataSource := DMPresenciaDispositivo.DSQMDisPre;
end;

procedure TFMPresenciaDispositivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPresenciaDispositivo);
end;

procedure TFMPresenciaDispositivo.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button <> nbInsert) then
  begin
     DBEId.Color := clInfoBk;
     DBEId.Enabled := False;
     DBEId.TabStop := False;
  end
  else
  begin
     DBEId.Color := clWindow;
     DBEId.Enabled := True;
     DBEId.TabStop := True;
  end;
end;

procedure TFMPresenciaDispositivo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
