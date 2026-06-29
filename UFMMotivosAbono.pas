unit UFMMotivosAbono;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBEdit;

type
  TFMMotivosAbono = class(TFPEdit)
     DBEEntidad: TLFDbedit;
     DBETitulo: TLFDbedit;
     LCodigo: TLFLabel;
     LTitulo: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMotivosAbono : TFMMotivosAbono;

implementation

uses UDMMotivosAbono, UFormGest, UDMMain, UUtiles;

{$R *.DFM}

procedure TFMMotivosAbono.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMotivosAbono, DMMotivosAbono);
  NavMain.DataSource := DMMotivosAbono.DSQMMotivosAbono;
  EPMain.DataSource := DMMotivosAbono.DSQMMotivosAbono;
  DBGMain.DataSource := DMMotivosAbono.DSQMMotivosAbono;
end;

procedure TFMMotivosAbono.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMotivosAbono);
end;

procedure TFMMotivosAbono.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMMotivosAbono.BusquedaCompleja;
end;

end.
