unit UProFMTControlPauta;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  ULFDBMemo;

type
  TProFMTControlPauta = class(TFPEdit)
     LTipo: TLFLabel;
     LTitulo: TLFLabel;
     LFDTipo: TLFDbedit;
     LFDBTitulo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMTControlPauta : TProFMTControlPauta;

implementation

uses UProDMTControlPauta, UFormGest;

{$R *.dfm}

procedure TProFMTControlPauta.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMTControlPauta, ProDMTControlPauta);
  NavMain.DataSource := ProDMTControlPauta.DSTControlPauta;
  DBGMain.DataSource := ProDMTControlPauta.DSTControlPauta;
end;

procedure TProFMTControlPauta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMTControlPauta);
end;

procedure TProFMTControlPauta.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMTControlPauta.BusquedaCompleja;
end;

end.
