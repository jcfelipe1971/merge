unit UFMUbicaciones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFToolBar, ULFPanel, ULFPageControl, ULFLabel, UG2kTBLoc;

type
  TFMUbicaciones = class(TFPEdit)
     GBLectura: TGroupBox;
     Label1: TLFLabel;
     Label2: TLFLabel;
     Label3: TLFLabel;
     Label4: TLFLabel;
     DBEUbicacion: TLFDbedit;
     DBEMaquina: TLFDbedit;
     DBEUsuario: TLFDbedit;
     DBEso: TLFDbedit;
     Label5: TLFLabel;
     DBEDescripcion: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMUbicaciones : TFMUbicaciones;

implementation

uses UFormGest, UDMMain, UDMUbicaciones;

{$R *.DFM}

procedure TFMUbicaciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMUbicaciones, DMUbicaciones);
  NavMain.DataSource := DMUbicaciones.DSQMUbicaciones;
  DBGMain.DataSource := DMUbicaciones.DSQMUbicaciones;
end;

procedure TFMUbicaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMUbicaciones);
end;

procedure TFMUbicaciones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMUbicaciones.BusquedaCompleja;
  Continua := False;
end;

end.
