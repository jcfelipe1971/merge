unit UProFMMaquinasRevisiones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UProFMTipoMaquinas, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid,
  UHYDBGrid, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFToolBar, UG2kTBLoc,
  ComCtrls, ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls,
  ULFPanel, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, ULFLabel, UHYDescription, ULFHYDBDescription,
  ULFDBMemo, ULFEditFind2000, UFPEdit, UFPEditDetalle, ULFEdit;

type
  TProFMMaquinasRevisiones = class(TFPEditDetalle)
     LDenominacion: TLFLabel;
     LFrecuencia: TLFLabel;
     LResponsable: TLFLabel;
     LNotas: TLFLabel;
     MNotas: TLFDBMemo;
     DBEResponsable: TLFDBEditFind2000;
     DBEFrecuencia: TLFDbedit;
     DBETipoRevision: TLFDBEditFind2000;
     LTipoRevision: TLFLabel;
     DBEDenominacion: TLFDbedit;
     DescTipoRevision: TLFHYDBDescription;
     EResponsable: TLFEdit;
     LId: TLFLabel;
     DBEId: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     ARevisionMaquina: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBETipoRevisionChange(Sender: TObject);
     procedure DBEResponsableChange(Sender: TObject);
     procedure ARevisionMaquinaExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMMaquinasRevisiones : TProFMMaquinasRevisiones;

implementation

uses UProDMMaquinasRevisiones, UFormGest, UUtiles, UEntorno, UDMMain, UDameDato;

{$R *.dfm}

procedure TProFMMaquinasRevisiones.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TProDMMaquinasRevisiones, ProDMMaquinasRevisiones);
  NavMain.DataSource := ProDMMaquinasRevisiones.DSQMTiposRevisiones;
  EPMain.DataSource := ProDMMaquinasRevisiones.DSQMTiposRevisiones;
  DBGMain.DataSource := ProDMMaquinasRevisiones.DSQMTiposRevisiones;
  NavDetalle.DataSource := ProDMMaquinasRevisiones.DSQMTipoRevDet;
end;

procedure TProFMMaquinasRevisiones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMMaquinasRevisiones);
end;

procedure TProFMMaquinasRevisiones.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.DataSource := ProDMMaquinasRevisiones.DSQMTiposRevisiones;
  G2KTableLoc.Click;
end;

procedure TProFMMaquinasRevisiones.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMMaquinasRevisiones.BusquedaCompleja;
  Continua := False;
end;

procedure TProFMMaquinasRevisiones.DBETipoRevisionChange(Sender: TObject);
begin
  inherited;
  DescTipoRevision.ActualizaDatos('TIPO_REVISION', DBETipoRevision.Text);
end;

procedure TProFMMaquinasRevisiones.DBEResponsableChange(Sender: TObject);
begin
  inherited;
  EResponsable.Text := DameTituloEmpleado(StrToIntDef(DBEResponsable.Text, 0));
end;

procedure TProFMMaquinasRevisiones.ARevisionMaquinaExecute(Sender: TObject);
begin
  inherited;
  ProDMMaquinasRevisiones.RevisionMaquina;

  ShowMessage(_('Proceso realizado correctamente'));
end;

end.
