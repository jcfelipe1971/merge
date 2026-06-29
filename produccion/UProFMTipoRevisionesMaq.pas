unit UProFMTipoRevisionesMaq;

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
  TProFMTipoRevisionesMaq = class(TFPEdit)
     LTipo: TLFLabel;
     LTitulo: TLFLabel;
     LFDBTipo: TLFDbedit;
     LFDBTitulo: TLFDbedit;
     LNotas: TLFLabel;
     LFDBNotas: TLFDBMemo;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMTipoRevisionesMaq : TProFMTipoRevisionesMaq;

implementation

uses UProDMTipoRevisionesMaq, UFormGest, UDMMain;

{$R *.dfm}

procedure TProFMTipoRevisionesMaq.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMTipoRevionesMaq, ProDMTipoRevionesMaq);
  NavMain.DataSource := ProDMTipoRevionesMaq.DSTipoRevisionesMaq;
  DBGMain.DataSource := ProDMTipoRevionesMaq.DSTipoRevisionesMaq;
end;

procedure TProFMTipoRevisionesMaq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMTipoRevionesMaq);
end;

procedure TProFMTipoRevisionesMaq.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TProFMTipoRevisionesMaq.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMTipoRevionesMaq.BusquedaCompleja;
end;

end.
