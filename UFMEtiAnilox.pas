unit UFMEtiAnilox;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBEdit;

type
  TFMEtiAnilox = class(TFPEdit)
     DBEId_Anilox: TLFDbedit;
     DBETitulo: TLFDbedit;
     LId: TLFLabel;
     LTitulo: TLFLabel;
     LValor: TLFLabel;
     DBEValor: TLFDbedit;
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
  FMEtiAnilox : TFMEtiAnilox;

implementation

uses UDMEtiAnilox, UFormGest, UDMMain, UUtiles;

{$R *.DFM}

procedure TFMEtiAnilox.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEtiAnilox, DMEtiAnilox);
  NavMain.DataSource := DMEtiAnilox.DSQMEtiAnilox;
  EPMain.DataSource := DMEtiAnilox.DSQMEtiAnilox;
  DBGMain.DataSource := DMEtiAnilox.DSQMEtiAnilox;

  // Color campo ID
  ColorCampoID(DBEId_Anilox);
end;

procedure TFMEtiAnilox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEtiAnilox);
end;

procedure TFMEtiAnilox.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMEtiAnilox.BusquedaCompleja;
end;

procedure TFMEtiAnilox.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
