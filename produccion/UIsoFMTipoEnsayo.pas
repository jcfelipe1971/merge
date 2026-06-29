unit UIsoFMTipoEnsayo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc, ULFDBEdit, ULFLabel;

type
  TIsoFMTipoEnsayo = class(TFPEdit)
     LCodigo: TLFLabel;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     DBECodigo: TLFDbedit;
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
  IsoFMTipoEnsayo : TIsoFMTipoEnsayo;

implementation

uses UFormGest, UIsoDMTipoEnsayo, UDMMain;

{$R *.DFM}

procedure TIsoFMTipoEnsayo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMTipoEnsayo, IsoDMTipoEnsayo);
  NavMain.DataSource := IsoDMTipoEnsayo.DSQMIsoTipoEnsayo;
  EPMain.DataSource := IsoDMTipoEnsayo.DSQMIsoTipoEnsayo;
  DBGMain.DataSource := IsoDMTipoEnsayo.DSQMIsoTipoEnsayo;
  G2kTableLoc.DataSource := IsoDMTipoEnsayo.DSQMIsoTipoEnsayo;
end;

procedure TIsoFMTipoEnsayo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMTipoEnsayo);
end;

procedure TIsoFMTipoEnsayo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMTipoEnsayo.BusquedaCompleja;
  Continua := False;
end;

procedure TIsoFMTipoEnsayo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
