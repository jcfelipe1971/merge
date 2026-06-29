unit UProFMTipoMarcajes;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, Mask, DBCtrls, ULFDBEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFLabel, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid,
  UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel,
  UNavigator, ToolWin, ExtCtrls, ULFPanel;

type
  TProFMTipoMarcajes = class(TFPEdit)
     LFLabel1: TLFLabel;
     LblTitulo: TLFLabel;
     DBCkhBProductivo: TLFDBCheckBox;
     DBETipoMarc: TLFDbedit;
     DBEDescTipoMarc: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     ALstCodBarras: TAction;
     ALstConf: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ALstCodBarrasExecute(Sender: TObject);
     procedure ALstConfExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMTipoMarcajes : TProFMTipoMarcajes;

implementation

uses UProDMTipoMarcajes, UFormGest, UFMListConfig, UDMListados;

{$R *.dfm}

procedure TProFMTipoMarcajes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMTipoMarcajes, ProDMTipoMarcajes);
  NavMain.DataSource := ProDMTipoMarcajes.DSQMProTipoMarc;
  DBGMain.DataSource := ProDMTipoMarcajes.DSQMProTipoMarc;
end;

procedure TProFMTipoMarcajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMTipoMarcajes);
end;

procedure TProFMTipoMarcajes.ALstCodBarrasExecute(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  DMListados.Imprimir(8036, 0, '', str, ProDMTipoMarcajes.FrHYTipoMarcajes, nil);
end;

procedure TProFMTipoMarcajes.ALstConfExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8036, Formato, Cabecera, Copias, Pijama, '', ProDMTipoMarcajes.frHYTipoMarcajes);
end;

procedure TProFMTipoMarcajes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMTipoMarcajes.BusquedaCompleja;
  Continua := False;
end;

end.
