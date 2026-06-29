unit UFMSGInformacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, Buttons, Grids, DBGrids, UHYDBGrid, DB,
  UControlEdit, UFormGest, NsDBGrid, ULFToolBar, ExtCtrls, ULFPanel,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UEditPanel;

type
  TFMSGInformacion = class(TFPEditSinNavegador)
     DBGMain: THYTDBGrid;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     function Muestra(Datos: TDataSource): integer;
  end;

var
  FMSGInformacion : TFMSGInformacion;

implementation

// uses UDMMain;

{$R *.DFM}

function TFMSGInformacion.Muestra(Datos: TDataSource): integer;
begin
  DBGMain.DataSource := Datos;
  Result := ShowModal;
end;

procedure TFMSGInformacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
