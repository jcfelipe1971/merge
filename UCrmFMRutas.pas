unit UCrmFMRutas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc,
  ULFLabel, ULFEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000;

type
  TCrmFMRutas = class(TFPEdit)
     LRuta: TLFLabel;
     LTituloRuta: TLFLabel;
     DBETitulo: TLFDbedit;
     DBERuta: TLFDbedit;
     DBEFAgente: TLFDBEditFind2000;
     LAgente: TLFLabel;
     ETituloAgente: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFAgenteChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmFMRutas : TCrmFMRutas;

implementation

uses UCrmDMRutas, UCrmFMReemplazaAmbito, UFormGest, UDMMain, UEntorno, uUtiles, UDameDato;

{$R *.dfm}

procedure TCrmFMRutas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMRutas, CrmDMRutas);
  NavMain.DataSource := CrmDMRutas.DSQMRutas;
  EPMain.DataSource := CrmDMRutas.DSQMRutas;
  DBGMain.DataSource := CrmDMRutas.DSQMRutas;
  G2KTableLoc.DataSource := CrmDMRutas.DSQMRutas;

  // Color campo ID
  ColorCampoID(DBERuta);
end;

procedure TCrmFMRutas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(CrmDMRutas);
end;

procedure TCrmFMRutas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  CRMDMRutas.BusquedaCompleja;
end;

procedure TCrmFMRutas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TCrmFMRutas.DBEFAgenteChange(Sender: TObject);
begin
  inherited;
  ETituloAgente.Text := DameTituloAgente(StrToIntDef(DBEFAgente.Text, 0));
end;

end.
