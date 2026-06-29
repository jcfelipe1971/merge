unit UProFMRecursoEmp;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, DB, rxPlacemnt,
  NsDBGrid, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, ULFDBEditFind2000, ULFDBEdit, UG2kTBLoc,
  UHYDescription, ULFHYDBDescription, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox,
  ULFLabel;

type
  TProFMRecursoEmp = class(TFPEdit)
     LblRecurso: TLFLabel;
     LblTitulo: TLFLabel;
     LblUnidad: TLFLabel;
     LblTipoRec: TLFLabel;
     DBERecurso: TLFDbedit;
     LblImporte: TLFLabel;
     DBEImporte: TLFDbedit;
     DBEFTipoRecurso: TLFDBEditFind2000;
     DBEFUnidad: TLFDBEditFind2000;
     DBETitulo: TLFDbedit;
     PDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     ControlEdit1: TControlEdit;
     ControlEdit1PMEdit: TPopUpTeclas;
     DescUnidad: TLFHYDBDescription;
     DescTipoRecurso: TLFHYDBDescription;
     LblCapacidad: TLFLabel;
     DBECapacidad: TLFDbedit;
     LblPorcentaje: TLFLabel;
     DBCBPlanificable: TLFDBCheckBox;
     DBEFHorario: TLFDBEditFind2000;
     LblHorario: TLFLabel;
     DBEDescripHorario: TLFDbedit;
     LblRendimiento: TLFLabel;
     DBEOperacionesNum: TLFDbedit;
     DBEOperacionesTiempo: TLFDbedit;
     LblOperaciones: TLFLabel;
     LblSegundo: TLFLabel;
     LblImporteOperacion: TLFLabel;
     DBEImporteOperacion: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     ALstRecursosCodBar: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ALstCfgRecursosCodBarras: TAction;
     LFase: TLFLabel;
     DBEFase: TLFDBEditFind2000;
     DescFase: TLFHYDBDescription;
     LMaquina: TLFLabel;
     DescMaquinas: TLFHYDBDescription;
     DBECodMaq: TDBEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFUnidadChange(Sender: TObject);
     procedure DBEFTipoRecursoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure ALstRecursosCodBarExecute(Sender: TObject);
     procedure ALstCfgRecursosCodBarrasExecute(Sender: TObject);
     procedure DBEFaseChange(Sender: TObject);
     procedure DBECodMaqChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMRecursoEmp : TProFMRecursoEmp;

implementation

uses UProDMRecursoEmp, UDMMain, UFormGest, UFMListconfig, UDMListados;

{$R *.dfm}

procedure TProFMRecursoEmp.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMRecursoEmp, ProDMRecursoEmp);
  AbreData(TDMListados, DMListados);
  NavMain.DataSource := ProDMRecursoEmp.DSQMProRecursos;
  DBGMain.DataSource := ProDMRecursoEmp.DSQMProRecursos;
end;

procedure TProFMRecursoEmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMRecursoEmp);
end;

procedure TProFMRecursoEmp.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMRecursoEmp.BusquedaCompleja;
end;

procedure TProFMRecursoEmp.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbEdit then
  begin
     DBERecurso.Enabled := False;
     DBERecurso.Color := clInfoBk;
  end
  else
  begin
     DBERecurso.Enabled := True;
     DBERecurso.Color := clWindow;
  end;
end;

procedure TProFMRecursoEmp.DBEFUnidadChange(Sender: TObject);
begin
  inherited;
  DescUnidad.ActualizaDatos('UNIDAD', DBEFUnidad.Text);
end;

procedure TProFMRecursoEmp.DBEFTipoRecursoChange(Sender: TObject);
begin
  inherited;
  DescTipoRecurso.ActualizaDatos('TIPORECURSO', DBEFTipoRecurso.Text);
end;

procedure TProFMRecursoEmp.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TProFMRecursoEmp.ALstRecursosCodBarExecute(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';
  DMListados.Imprimir(8039, 0, '', str, ProDMRecursoEmp.frProRecursos, nil);
end;

procedure TProFMRecursoEmp.ALstCfgRecursosCodBarrasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8039, Formato, Cabecera, Copias, Pijama, '', ProDMRecursoEmp.frProRecursos);
end;

procedure TProFMRecursoEmp.DBEFaseChange(Sender: TObject);
begin
  inherited;
  DescFase.ActualizaDatos('FASE', DBEFase.Text);
end;

procedure TProFMRecursoEmp.DBECodMaqChange(Sender: TObject);
begin
  inherited;
  DescMaquinas.ActualizaDatos('CODMAQ', DBECodMaq.Text);
end;

end.
