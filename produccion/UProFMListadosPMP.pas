unit UProFMListadosPMP;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  ULFDateEdit, StdCtrls, ULFComboBox, ULFEdit, ULFLabel, ExtCtrls,
  ULFPanel, ComCtrls, ULFPageControl, ToolWin, ULFToolBar, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, Fr_HYReport, rxPlacemnt,
  ULFFormStorage;

type
  TProFMListadosPMP = class(TFPEditListadoSfg)
     TSFicha: TTabSheet;
     LTipoTarea: TLFLabel;
     EFTareas: TLFEditFind2000;
     DescTarea: TLFEdit;
     LOperario: TLFLabel;
     EFOperario: TLFEditFind2000;
     DescOperario: TLFEdit;
     RGFiltro: TRadioGroup;
     TSEtiquetas: TTabSheet;
     LPlanificacion: TLFLabel;
     EPlanificacion: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure EFTareasChange(Sender: TObject);
     procedure EFOperarioChange(Sender: TObject);
     procedure RGFiltroClick(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure EFTareasBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  ProFMListadosPMP : TProFMListadosPMP;

implementation

uses UProDMListadosPMP, UFormGest, UDMMain, UDMPlanMaestroProduccion, UFMListConfig, UEntorno, UDameDato;

{$R *.dfm}

procedure TProFMListadosPMP.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMListadosPMP, ProDMListadosPMP);
  PCMain.ActivePageIndex := 0;

  Grupo := 9909;
  Listado := ProDMListadosPmp.frListadoPMPMat;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  RGFiltroClick(Sender);
  PCMainChange(Sender);

  EPlanificacion.Text := DMPlanMaestroProduccion.QMCabeceraPLANIFICACION.AsString;
end;

procedure TProFMListadosPMP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMListadosPMP);
end;

procedure TProFMListadosPMP.EFTareasChange(Sender: TObject);
begin
  inherited;
  DescTarea.Text := DameTituloTarea(EFTareas.Text);
end;

procedure TProFMListadosPMP.EFTareasBusqueda(Sender: TObject);
begin
  inherited;
  EFTareas.CondicionBusqueda := 'PLANIFICACION = ' + DMPlanMaestroProduccion.QMCabeceraID_PLANIFICACION.AsString;
end;

procedure TProFMListadosPMP.EFOperarioChange(Sender: TObject);
begin
  inherited;
  DescOperario.Text := DameTituloEmpleado(StrToIntDef(EFOperario.Text, 0));
end;

procedure TProFMListadosPMP.RGFiltroClick(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSFicha) then
  begin
     if (RGFiltro.ItemIndex = 0) then
     begin
        Grupo := 9911;
        Listado := ProDMListadosPmp.frListadoPMP;
     end
     else if (RGFiltro.ItemIndex = 1) then
     begin
        Grupo := 9909;
        Listado := ProDMListadosPmp.frListadoPMPMat;
     end
     else if (RGFiltro.ItemIndex = 2) then
     begin
        Grupo := 9910;
        Listado := ProDMListadosPmp.frListadoPMPMaq;
     end;
  end;
end;

procedure TProFMListadosPMP.PCMainChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSEtiquetas) then // Etiquetas
  begin
     Grupo := 9912;
     Listado := ProDMListadosPmp.frListadoPMPEti;
  end
  else
  begin
     Grupo := 9909;
     Listado := ProDMListadosPmp.frListadoPMPMat;
  end;
end;

procedure TProFMListadosPMP.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  with ProDMListadosPmp do
  begin
     Tarea := DescTarea.Text;
     Operario := DescOperario.Text;
     Comentario := EComentario.Text;
     Planificacion := StrToIntDef(EPlanificacion.Text, 0);

     MostrarListado(Modo, PCMain.ActivePageIndex, DMPlanMaestroProduccion.QMCabeceraID_PLANIFICACION.AsInteger, EFTareas.Text, RGFiltro.ItemIndex, DMPlanMaestroProduccion.QMOPLanzadasCOPIAS_PMP.AsInteger);
  end;
end;

procedure TProFMListadosPMP.ARecargarExecute(Sender: TObject);
begin
  inherited;
  RGFiltro.ItemIndex := 0;
  EFTareas.Text := '';
  EFOperario.Text := '';
  EPlanificacion.Text := DMPlanMaestroProduccion.QMCabeceraPLANIFICACION.AsString;
end;

end.
