unit UFMMatriculas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit, UG2kTBLoc,
  ULFEdit;

type
  TFMMatriculas = class(TFPEdit)
     LBLNaturaleza: TLFLabel;
     DBEMatriculas: TLFDBEdit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDBEdit;
     DBEFTransportista: TLFDBEditFind2000;
     ETransportista: TLFEdit;
     LTransportista: TLFLabel;
     DBCBDefecto: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFTransportistaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMatriculas : TFMMatriculas;

implementation

uses UDMMatriculas, UFormGest, UDMMain, UDameDato;

{$R *.DFM}

procedure TFMMatriculas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMatriculas, DMMatriculas);
  NavMain.DataSource := DMMatriculas.DSQMMatriculas;
  DBGMain.DataSource := DMMatriculas.DSQMMatriculas;
  G2kTableLoc.DataSource := DMMatriculas.DSQMMatriculas;
end;

procedure TFMMatriculas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMatriculas);
end;

procedure TFMMatriculas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMMatriculas.BusquedaCompleja;
  Continua := False;
end;

procedure TFMMatriculas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMMatriculas.DBEFTransportistaChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(DBEFTransportista.Text, 0) = 0) then
     ETransportista.Text := DameTituloAcreedor(StrToIntDef(DBEFTransportista.Text, 0))
  else
     ETransportista.Text := _('Todos');
end;

end.
