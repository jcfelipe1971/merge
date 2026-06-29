unit UFMSectorUbicacion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMSectorUbicacion = class(TFPEdit)
     LSector: TLFLabel;
     DBESector: TLFDbedit;
     DBETitulo: TLFDbedit;
     LBLTitulo: TLFLabel;
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
  FMSectorUbicacion : TFMSectorUbicacion;

implementation

uses UDMSectorUbicacion, UFormGest, UDMMain, uUtiles;

{$R *.dfm}

procedure TFMSectorUbicacion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSectorUbicacion, DMSectorUbicacion);
  NavMain.DataSource := DMSectorUbicacion.DSQMSectorUbicacion;
  DBGMain.DataSource := DMSectorUbicacion.DSQMSectorUbicacion;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  // Color campo ID
  ColorCampoID(DBESector);
end;

procedure TFMSectorUbicacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSectorUbicacion);
end;

procedure TFMSectorUbicacion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMSectorUbicacion.BusquedaCompleja;
  Continua := False;
end;

procedure TFMSectorUbicacion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
