unit UCrmFMAmbitos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc,
  ULFLabel;

type
  TCrmFMAmbitos = class(TFPEdit)
     LblAmbito: TLFLabel;
     LblDescAmbito: TLFLabel;
     LblNumEMails: TLFLabel;
     DBECodigo: TLFDBEdit;
     DBEDescripcion: TLFDbedit;
     DBENumMails: TLFDbedit;
     LNumContacto: TLFLabel;
     DBENumContactos: TLFDbedit;
     AReemplazar: TAction;
     LFCategoryAction1: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AReemplazarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmFMAmbitos : TCrmFMAmbitos;

implementation

uses UCrmDMAmbitos, UCrmFMReemplazaAmbito, UFormGest, UDMMain, uUtiles;

{$R *.dfm}

procedure TCrmFMAmbitos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMAmbitos, CrmDMAmbitos);
  NavMain.DataSource := CrmDMAmbitos.DSQMAmbitos;
  EPMain.DataSource := CrmDMAmbitos.DSQMAmbitos;
  DBGMain.DataSource := CrmDMAmbitos.DSQMAmbitos;
  G2KTableLoc.DataSource := CrmDMAmbitos.DSQMAmbitos;

  // Color campo ID
  ColorCampoID(DBECodigo);
end;

procedure TCrmFMAmbitos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(CrmDMAmbitos);
end;

procedure TCrmFMAmbitos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  CRMDMAmbitos.BusquedaCompleja;
end;

procedure TCrmFMAmbitos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TCrmFMAmbitos.AReemplazarExecute(Sender: TObject);
begin
  inherited;
  with TCrmFMReemplazaAmbito.Create(Self) do
  begin
     ShowModal;
     Free;
  end;
end;

end.
