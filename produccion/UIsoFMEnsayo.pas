unit UIsoFMEnsayo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc, ULFDBEdit, ULFLabel,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFEdit;

type
  TIsoFMEnsayo = class(TFPEdit)
     LCodigo: TLFLabel;
     LTipoEnsayo: TLFLabel;
     DBETipo: TLFDbedit;
     DBETipoEnsayo: TLFDBEditFind2000;
     LNormativa: TLFLabel;
     DBEFNormativa: TLFDBEditFind2000;
     ETituloTipoEnsayo: TLFEdit;
     ETituloNormativa: TLFEdit;
     DBEDescripcion: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBETipoEnsayoChange(Sender: TObject);
     procedure DBEFNormativaChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoFMEnsayo : TIsoFMEnsayo;

implementation

uses UFormGest, UIsoDMEnsayo, UDMMain, UDameDato;

{$R *.DFM}

procedure TIsoFMEnsayo.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TIsoDMEnsayo, IsoDMEnsayo);
  NavMain.DataSource := IsoDMEnsayo.DSQMIsoEnsayo;
  EPMain.DataSource := IsoDMEnsayo.DSQMIsoEnsayo;
  DBGMain.DataSource := IsoDMEnsayo.DSQMIsoEnsayo;
  G2kTableLoc.DataSource := IsoDMEnsayo.DSQMIsoEnsayo;
end;

procedure TIsoFMEnsayo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(IsoDMEnsayo);
end;

procedure TIsoFMEnsayo.DBETipoEnsayoChange(Sender: TObject);
begin
  inherited;
  ETituloTipoEnsayo.Text := DameTituloTipoEnsayo(DBETipoEnsayo.Text);
end;

procedure TIsoFMEnsayo.DBEFNormativaChange(Sender: TObject);
begin
  inherited;
  ETituloNormativa.Text := DameTituloNormativa(DBEFNormativa.Text);
end;

procedure TIsoFMEnsayo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
