unit UOpeFMImputacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  UFIBDBEditfind, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBCheckBox,
  ULFDBEdit, UComponentesBusquedaFiltrada, ULFDBEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, UG2kTBLoc, ULFLabel;

type
  TOpeFMImputacion = class(TFPEdit)
     LImputa: TLFLabel;
     DBEImputa: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescrip: TLFDbedit;
     LTipoImp: TLFLabel;
     DBCBHoraInd: TLFDBCheckBox;
     DBETipoImputa: TLFDbedit;
     LFDBEditFind20001: TLFDBEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  OpeFMImputacion : TOpeFMImputacion;

implementation

uses UFormGest, UDMMain, UOpeDMImputacion;

{$R *.DFM}

procedure TOpeFMImputacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TOpeDMImputacion, OpeDMImputacion);
  NavMain.DataSource := OpeDMImputacion.DSQMImputacion;
  EPMain.DataSource := OpeDMImputacion.DSQMImputacion;
  DBGMain.DataSource := OpeDMImputacion.DSQMImputacion;
end;

procedure TOpeFMImputacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(OpeDMImputacion);
end;

procedure TOpeFMImputacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDMImputacion.BusquedaCompleja;
  Continua := False;
end;

end.
