unit UIsoFMIncTipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc, ULFDBEdit, ULFLabel;

type
  TIsoFMIncTipo = class(TFPEdit)
     LblTipo: TLFLabel;
     LblDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     DBETipo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoFMIncTipo : TIsoFMIncTipo;

implementation

uses UFormGest, UIsoDMIncTipo, UDMMain;

{$R *.DFM}

procedure TIsoFMIncTipo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMIncTipo, IsoDMIncTipo);
end;

procedure TIsoFMIncTipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMIncTipo);
end;

procedure TIsoFMIncTipo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMIncTipo.BusquedaCompleja;
  Continua := False;
end;

end.
