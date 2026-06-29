unit UCrmFMCorreos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc, ULFLabel, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TCrmFMCorreos = class(TFPEdit)
     LblEMail: TLFLabel;
     DBEDirEMail: TLFDbedit;
     DBEIdEmail: TLFDbedit;
     DBChkBActivo: TLFDBCheckBox;
     pDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBGFDetalle: TDBGridFind2000;
     LFCategoryAction1: TLFCategoryAction;
     AImportar: TAction;
     AExportar: TAction;
     AImportarContactos: TAction;
     AImportarPersonas: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AImportarExecute(Sender: TObject);
     procedure AExportarExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AImportarPersonasExecute(Sender: TObject);
     procedure AImportarContactosExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmFMCorreos : TCrmFMCorreos;

implementation

uses
  UFormGest, UDMMain, UCrmDMCorreos, UCrmFMExportarEMail;

{$R *.dfm}

procedure TCrmFMCorreos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMCorreos, CrmDMCorreos);
  NavMain.DataSource := CrmDMCorreos.DSQMCabecera;
  DBGMain.DataSource := CrmDMCorreos.DSQMCabecera;
  NavDetalle.DataSource := CrmDMCorreos.DSQMDetalle;
  DBGFDetalle.DataSource := CrmDMCorreos.DSQMDetalle;
end;

procedure TCrmFMCorreos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(CrmDMCorreos);
end;

procedure TCrmFMCorreos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  CrmDMCorreos.BusquedaCompleja;
end;

procedure TCrmFMCorreos.AImportarExecute(Sender: TObject);
begin
  inherited;
  CrmDMCorreos.Importar;
end;

procedure TCrmFMCorreos.AExportarExecute(Sender: TObject);
begin
  inherited;
  with TCrmFMExportarEMail.Create(Self) do
  begin
     ShowModal;
     Free;
  end;
end;

procedure TCrmFMCorreos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TCrmFMCorreos.AImportarContactosExecute(Sender: TObject);
begin
  inherited;
  CrmDMCorreos.ImportarCorreos('C');
end;

procedure TCrmFMCorreos.AImportarPersonasExecute(Sender: TObject);
begin
  inherited;
  CrmDMCorreos.ImportarCorreos('P');
end;

end.
