unit UFMBancos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBEdit,
  ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TFMBancos = class(TFPEdit)
     DBEEntidad: TLFDbedit;
     DBETitulo: TLFDbedit;
     LEntidad: TLFLabel;
     LTitulo: TLFLabel;
     LPais: TLFLabel;
     DBEFPais: TLFDBEditFind2000;
     EPais: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFPaisChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMBancos : TFMBancos;

implementation

uses UDMBancos, UFormGest, UDMMain, UUtiles, UDameDato;

{$R *.DFM}

procedure TFMBancos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMBancos, DMBancos);
  NavMain.DataSource := DMBancos.DSQMBancos;
  EPMain.DataSource := DMBancos.DSQMBancos;
  DBGMain.DataSource := DMBancos.DSQMBancos;
end;

procedure TFMBancos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMBancos);
end;

procedure TFMBancos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMBancos.BusquedaCompleja;
end;

procedure TFMBancos.DBEFPaisChange(Sender: TObject);
begin
  inherited;
  EPais.Text := DameTituloPais(DBEFPais.Text);
end;

end.
