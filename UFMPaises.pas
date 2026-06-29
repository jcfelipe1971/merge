unit UFMPaises;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFDBCheckBox, ULFDBEdit, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, UG2kTBLoc, ULFEdit;

type
  TFMPaises = class(TFPEdit)
     DBEPais: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBEClave2: TLFDbedit;
     DBEN3: TLFDbedit;
     DBECodTel: TLFDbedit;
     LPais: TLFLabel;
     LNombre: TLFLabel;
     LClave2C: TLFLabel;
     LClaveN: TLFLabel;
     LPrefijoTelefonico: TLFLabel;
     DBChkBCEE: TLFDBCheckBox;
     ETituloIdioma: TLFEdit;
     LBIdioma: TLFLabel;
     DBEFIdioma: TLFDBEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFIdiomaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPaises : TFMPaises;

implementation

uses UDMPoblaciones, UFormGest, UDMMain, UFBusca, UDameDato;

{$R *.DFM}

procedure TFMPaises.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPoblaciones, DMPoblaciones);
  NavMain.DataSource := DMPoblaciones.DSQMPaises;
  DBGMain.DataSource := DMPoblaciones.DSQMPaises;
  G2kTableLoc.DataSource := DMPoblaciones.DSQMPaises;
end;

procedure TFMPaises.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPoblaciones);
end;

procedure TFMPaises.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMPoblaciones.BCPaises;
  Continua := False;
end;

procedure TFMPaises.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMPaises.DBEFIdiomaChange(Sender: TObject);
begin
  inherited;
  ETituloIdioma.Text := DameTituloIdioma(DBEFIdioma.Text);
end;

end.
