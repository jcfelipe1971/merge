unit UIsoFMNormativas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc, ULFDBEdit, ULFLabel,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFDBMemo;

type
  TIsoFMNormativas = class(TFPEdit)
     LCodigo: TLFLabel;
     LLey: TLFLabel;
     DBELey: TLFDbedit;
     DBECodigo: TLFDbedit;
     LDescripcion: TLFLabel;
     DBMDescripcion: TLFDBMemo;
     LFechaVigor: TLFLabel;
     DBDEFechaVigor: TLFDBDateEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoFMNormativas : TIsoFMNormativas;

implementation

uses UFormGest, UIsoDMNormativas, UDMMain;

{$R *.DFM}

procedure TIsoFMNormativas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMNormativas, IsoDMNormativas);
  NavMain.DataSource := IsoDMNormativas.DSQMIsoNormativas;
  EPMain.DataSource := IsoDMNormativas.DSQMIsoNormativas;
  DBGMain.DataSource := IsoDMNormativas.DSQMIsoNormativas;
  G2kTableLoc.DataSource := IsoDMNormativas.DSQMIsoNormativas;
end;

procedure TIsoFMNormativas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMNormativas);
end;

procedure TIsoFMNormativas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMNormativas.BusquedaCompleja;
  Continua := False;
end;

procedure TIsoFMNormativas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
