unit UFMProcesosKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, ULFDBEdit, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFLabel, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel,
  rxToolEdit, RXDBCtrl, ULFDBMemo, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, ULFEdit, ULFDBDateEdit;

type
  TFMProcesosKri = class(TFPEdit)
     PNLEdit: TLFPanel;
     LProceso: TLFLabel;
     LTitulo: TLFLabel;
     DBEID: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     ALanzaAvisos: TAction;
     DBETitulo: TLFDbedit;
     PNLDetalle: TLFPanel;
     LBLAviso: TLFLabel;
     LBLUsuario: TLFLabel;
     LBLTercero: TLFLabel;
     LBLDirigido: TLFLabel;
     LBLFechaActual: TLFLabel;
     DBCKUrgente: TLFDBCheckBox;
     DBEAviso: TLFDbedit;
     DBEFUsuarioFin: TLFDBEditFind2000;
     DBEFTercero: TLFDBEditFind2000;
     DBMMensaje: TLFDBMemo;
     DBDEFechaIni: TLFDBDateEdit;
     DBEUsuario: TLFDbedit;
     ETitUsuario: TLFEdit;
     ETitUsuarioFin: TLFEdit;
     ETitTercero: TLFEdit;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     procedure DBEUsuarioChange(Sender: TObject);
     procedure DBEFUsuarioFinChange(Sender: TObject);
     procedure DBEFTerceroChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ALanzaAvisosExecute(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMProcesosKri : TFMProcesosKri;

implementation

uses UDMProcesosKri, UDMMain, UFormGest, UDameDato;

{$R *.dfm}

procedure TFMProcesosKri.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMProcesosKri, DMProcesosKri);
  CEMain.DataSource := DMProcesosKri.DSQMProcesosCabecera;
  NavMain.DataSource := DMProcesosKri.DSQMProcesosCabecera;
  DBGMain.DataSource := DMProcesosKri.DSQMProcesosCabecera;
  NavDetalle.DataSource := DMProcesosKri.DSQMProcesosDetalle;
end;

procedure TFMProcesosKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMProcesosKri);
end;

procedure TFMProcesosKri.DBEUsuarioChange(Sender: TObject);
begin
  inherited;
  ETitUsuario.Text := DameTituloUsuario(StrToIntDef(DBEUsuario.Text, 0));
end;

procedure TFMProcesosKri.DBEFUsuarioFinChange(Sender: TObject);
begin
  inherited;
  ETitUsuarioFin.Text := DameTituloUsuario(StrToIntDef(DBEFUsuarioFin.Text, 0));
end;

procedure TFMProcesosKri.DBEFTerceroChange(Sender: TObject);
begin
  inherited;
  ETitTercero.Text := DameTituloTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TFMProcesosKri.ALanzaAvisosExecute(Sender: TObject);
begin
  inherited;
  DMProcesosKri.LanzaAvisos;
end;

procedure TFMProcesosKri.PCMainChange(Sender: TObject);
begin
  inherited;
  PNLDetalle.Visible := TSFicha.Visible;
end;

end.
