unit UOpeFMTiposImputacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBCheckBox, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, UG2kTBLoc, ULFLabel;

type
  TOpeFMTiposImputacion = class(TFPEdit)
     LTipoImputa: TLFLabel;
     DBETipoImputa: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     DBCBHoras: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMTiposImputacion : TOpeFMTiposImputacion;

implementation

uses UFormGest, UDMMain, UOpeDMTiposImputacion;

{$R *.DFM}

procedure TOpeFMTiposImputacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMTiposImputacion, OpeDMTiposImputacion);
  NavMain.DataSource := OpeDMTiposImputacion.DSQMTipoImputa;
  EPMain.DataSource := OpeDMTiposImputacion.DSQMTipoImputa;
  DBGMain.DataSource := OpeDMTiposImputacion.DSQMTipoImputa;
end;

procedure TOpeFMTiposImputacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMTiposImputacion);
end;

procedure TOpeFMTiposImputacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDMTiposImputacion.BusquedaCompleja;
  Continua := False;
end;

end.
