unit UIsoFMCursos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  ULFDBMemo;

type
  TIsoFMCursos = class(TFPEdit)
     LCurso: TLFLabel;
     LFDBCurso: TLFDbedit;
     LDescripcion: TLFLabel;
     LFDDesc: TLFDbedit;
     LHoras: TLFLabel;
     LFDBHoras: TLFDbedit;
     TSNotas: TTabSheet;
     LFPanelNotas: TLFPanel;
     TBNotas: TLFToolBar;
     NavNotas: THYMNavigator;
     LFDBNotas: TLFDBMemo;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     LProfesor: TLFLabel;
     LFDProfesor: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     ALstCertificado: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ALstConfigCertificado: TAction;
     procedure FormCreate(Sender: TObject);
     procedure ALstConfigCertificadoExecute(Sender: TObject);
     procedure ALstCertificadoExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoFMCursos : TIsoFMCursos;

implementation

uses UIsoDMCursos, UDMListados, UDMMain, UFormGest, UIsoDMPlanning, UFMListconfig;

{$R *.dfm}

procedure TIsoFMCursos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMCursos, IsoDMCursos);
  AbreData(TDMListados, DMListados);
end;

procedure TIsoFMCursos.ALstConfigCertificadoExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8035, Formato, Cabecera, Copias, Pijama, '', IsoDMCursos.frCertificado);
end;

procedure TIsoFMCursos.ALstCertificadoExecute(Sender: TObject);
var
  str : string;
begin
  inherited;
  str := '';

  DMListados.Imprimir(8035, 0, '', str, IsoDMCursos.frCertificado, nil);
end;

procedure TIsoFMCursos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMCursos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMCursos.BusquedaCompleja;
end;

end.
