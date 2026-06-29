unit UCrmFMAccionesCab;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, {UFPEditDelfos,} rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, DBCtrls,
  ULFDBEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, Mask, rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFLabel, DB,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, FibTableDataSet, UFPEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, UG2kTBLoc, ULFPageControl, ULFEdit;

type

  TCrmFMAccionesCab = class(TFPEdit)
     LblFechaAccionProx: TLFLabel;
     DBDEFechaAccionProx: TLFDBDateEdit;
     DBEFTipoAccion: TLFDBEditFind2000;
     DBEDescripcionAccion: TLFDbedit;
     LblDescripcionAccionProx: TLFLabel;
     LblTipoAccionProx: TLFLabel;
     DBRENotasAccDet: TDBRichEdit;
     LNotas: TLFLabel;
     LblIdContacto: TLFLabel;
     DBEIdContacto: TLFDbedit;
     LFechaPrev: TLFLabel;
     LFDBFechaPrev: TLFDBDateEdit;
     LFechaRealCierre: TLFLabel;
     LFDBFechaReal: TLFDBDateEdit;
     DBComentario: TDBRichEdit;
     LComentario: TLFLabel;
     LNroContactos: TLFLabel;
     DBENroContactos: TLFDbedit;
     DBEFProyecto: TLFDBEditFind2000;
     LProyecto: TLFLabel;
     EProyecto: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEFProyectoChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure NuevaAccion(Proyecto: integer; Descripcion: string);
  end;

var
  CrmFMAccionesCab : TCrmFMAccionesCab;

implementation

uses UCrmDMAccionesCab, UDMMain, UFormGest, uUtiles, UDameDato;

{$R *.dfm}

procedure TCrmFMAccionesCab.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMAccionesCab, CrmDMAccionesCab);
  NavMain.DataSource := CrmDMAccionesCab.DSQMAccionesCab;
  EPMain.DataSource := CrmDMAccionesCab.DSQMAccionesCab;
  DBGMain.DataSource := CrmDMAccionesCab.DSQMAccionesCab;
  G2KTableLoc.DataSource := CrmDMAccionesCab.DSQMAccionesCab;

  // Color campo ID
  ColorCampoID(DBEIdContacto);
end;

procedure TCrmFMAccionesCab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(CrmDMAccionesCab);
end;

procedure TCrmFMAccionesCab.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TCrmFMAccionesCab.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  CrmDMAccionesCab.BusquedaCompleja;
end;

procedure TCrmFMAccionesCab.DBEFProyectoChange(Sender: TObject);
begin
  inherited;
  EProyecto.Text := DameTituloProyecto(StrToIntDef(DBEFProyecto.Text, 0));
end;

procedure TCrmFMAccionesCab.NuevaAccion(Proyecto: integer; Descripcion: string);
begin
  CrmDMAccionesCab.NuevaAccion(Proyecto, Descripcion);
end;

end.
