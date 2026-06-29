unit UFMPostizos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, UHYDescription, ULFHYDBDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, StdCtrls, ULFLabel,
  Mask, DBCtrls, ULFDBEdit, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid,
  UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel,
  UNavigator, ToolWin, ExtCtrls, ULFPanel;

type
  TFMPostizos = class(TFPEdit)
     DBENumPostizo: TLFDbedit;
     LblNumPostizo: TLFLabel;
     LFLabel2: TLFLabel;
     DBEDescripcion: TLFDbedit;
     DBEFUbicacion: TLFDBEditFind2000;
     DescUbicacion: TLFHYDBDescription;
     LblDescripcion: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFUbicacionChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPostizos : TFMPostizos;

implementation

uses UDMPostizos, UDMMain, UFormGest;

{$R *.dfm}

procedure TFMPostizos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPostizos, DMPostizos);
end;

procedure TFMPostizos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPostizos);
end;

procedure TFMPostizos.DBEFUbicacionChange(Sender: TObject);
begin
  inherited;
  DescUbicacion.ActualizaDatos('ID_UBICACION', DBEFUbicacion.Text);
end;

end.
