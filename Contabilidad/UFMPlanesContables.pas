unit UFMPlanesContables;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMPlanesContables = class(TFPEdit)
     LBLCodigo: TLFLabel;
     LBLTitulo: TLFLabel;
     DBECodigo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     AListadoPlanContable: TAction;
     ATraspasarPlan: TAction;
     LFCategoryAction2: TLFCategoryAction;
     DBCBPreguntar: TLFDBCheckBox;
     ARecontruyePlanAnalitico: TAction;
     LFLProyecto: TLFLabel;
     DBEFProyecto: TLFDBEditFind2000;
     DBETitProyecto: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AListadoPlanContableExecute(Sender: TObject);
     procedure ATraspasarPlanExecute(Sender: TObject);
     procedure ARecontruyePlanAnaliticoExecute(Sender: TObject);
     procedure DBEFProyectoBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPlanesContables : TFMPlanesContables;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno, UDMPlanesContables, UFormGest, UFPregAnaPlan, UFPregTraspasaPlan;

procedure TFMPlanesContables.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPlanesContables, DMPlanesContables);
  NavMain.DataSource := DMPlanesContables.DSQMPlanesContables;
  EPMain.DataSource := DMPlanesContables.DSQMPlanesContables;
  DBGMain.DataSource := DMPlanesContables.DSQMPlanesContables;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMPlanesContables.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPlanesContables);
end;

procedure TFMPlanesContables.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPlanesContables.BusquedaCompleja;
end;

procedure TFMPlanesContables.AListadoPlanContableExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregAnaPlan, FPregAnaPlan);
end;

procedure TFMPlanesContables.ATraspasarPlanExecute(Sender: TObject);
var
  FPregTrasp : TFPregTraspasaPlan;
begin
  inherited;
  FPregTrasp := TFPregTraspasaPlan.Create(Self);
  with FPregTrasp do
     try
        ShowModal;
        if (ModalResult = mrOk) then
        begin
           DMPlanesContables.TraspasaPlan(Empresa, Ejercicio, Canal);
           ShowMessage('Traspaso realizado con éxito');
        end;
     finally
        Free;
     end;
end;

procedure TFMPlanesContables.ARecontruyePlanAnaliticoExecute(Sender: TObject);
begin
  DMPlanesContables.ReConstruye;
end;

procedure TFMPlanesContables.DBEFProyectoBusqueda(Sender: TObject);
begin
  DBEFProyecto.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

end.
