unit UFPregModelo303;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, Grids,
  DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UHYDBGrid,
  NsDBGrid, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar, ULFLabel,
  ShellApi, HYFIBQuery, TFlatCheckBoxUnit, ULFCheckBox, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple, UNavigator, ULFEdit,
  ULFEditFind2000;

type
  TFPregModelo303 = class(TFPEditListadoSimple)
     PNLDatos: TLFPanel;
     LblMod303: TLFLabel;
     DBGFModelo303: THYTDBGrid;
     TButtConfigurar: TToolButton;
     TButtModeloOficial: TToolButton;
     TButtInstrucciones: TToolButton;
     AmodeloOficial: TAction;
     AInstrucciones: TAction;
     TBExportar: TToolButton;
     AExportarMod303: TAction;
     CBSinActividad: TLFCheckBox;
     RGTipoDeclaracion: TRadioGroup;
     PNLTitulo: TLFPanel;
     PCDatosModelo: TLFPageControl;
     TSDatosModelo: TTabSheet;
     TSCasillas: TTabSheet;
     TBCasillas: TLFToolBar;
     NavCasillas: THYMNavigator;
     TSep1: TToolButton;
     TButtRecargarCasillas: TToolButton;
     PCCasillas: TLFPageControl;
     TSCasillas_0103: TTabSheet;
     DBGCasillas_0103: THYTDBGrid;
     TSep2: TToolButton;
     PNLPeriodo: TLFPanel;
     EFPeriodo: TLFEditFind2000;
     LPeriodo: TLFLabel;
     EPeriodo: TLFEdit;
     TSCasillas_0406: TTabSheet;
     DBGCasillas_0406: THYTDBGrid;
     TSCasillas_0709: TTabSheet;
     DBGCasillas_0709: THYTDBGrid;
     TSCasillas_1011: TTabSheet;
     DBGCasillas_1011: THYTDBGrid;
     TSCasillas_1213: TTabSheet;
     DBGCasillas_1213: THYTDBGrid;
     TSCasillas_1415: TTabSheet;
     DBGCasillas_1415: THYTDBGrid;
     TSCasillas_2829: TTabSheet;
     DBGCasillas_2829: THYTDBGrid;
     TSCasillas_3031: TTabSheet;
     DBGCasillas_3031: THYTDBGrid;
     TSCasillas_3233: TTabSheet;
     DBGCasillas_3233: THYTDBGrid;
     TSCasillas_3637: TTabSheet;
     DBGCasillas_3637: THYTDBGrid;
     TSCasillas_4041: TTabSheet;
     DBGCasillas_4041: THYTDBGrid;
     TSCasillas_59: TTabSheet;
     DBGCasillas_59: THYTDBGrid;
     TSCasillas_60: TTabSheet;
     TSCasillas_61: TTabSheet;
     DBGCasillas_60: THYTDBGrid;
     DBGCasillas_61: THYTDBGrid;
     CBEjercicio: TComboBox;
     CBExoneradoPresentacionMod390: TComboBox;
     LExoneradoPresentacionMod390: TLFLabel;
     LVolumenAnual: TLFLabel;
     CBVolumenAnual: TComboBox;
     LEActividadPrincipal: TLFLabel;
     EActividadPrincipal: TLFEdit;
     LEEpigrafeIAEPrincipal: TLFLabel;
     EEpigrafeIAEPrincipal: TLFEdit;
     LActividadPrincipal: TLFLabel;
     LActividadOtras: TLFLabel;
     LFLabel1: TLFLabel;
     EActividad1: TLFEdit;
     LFLabel2: TLFLabel;
     EEpigrafeIAE1: TLFEdit;
     EActividad2: TLFEdit;
     EEpigrafeIAE2: TLFEdit;
     EActividad3: TLFEdit;
     EEpigrafeIAE3: TLFEdit;
     EActividad4: TLFEdit;
     EEpigrafeIAE4: TLFEdit;
     EActividad5: TLFEdit;
     EEpigrafeIAE5: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AmodeloOficialExecute(Sender: TObject);
     procedure AInstruccionesExecute(Sender: TObject);
     procedure AExportarMod303Execute(Sender: TObject);
     procedure TSCasillas_0103Show(Sender: TObject);
     procedure TSCasillasShow(Sender: TObject);
     procedure EFPeriodoChange(Sender: TObject);
     procedure TButtRecargarCasillasClick(Sender: TObject);
     procedure TSCasillas_0406Show(Sender: TObject);
     procedure TSCasillas_0709Show(Sender: TObject);
     procedure TSCasillas_1011Show(Sender: TObject);
     procedure TSCasillas_1213Show(Sender: TObject);
     procedure TSCasillas_1415Show(Sender: TObject);
     procedure TSCasillas_2829Show(Sender: TObject);
     procedure TSCasillas_3031Show(Sender: TObject);
     procedure TSCasillas_3233Show(Sender: TObject);
     procedure TSCasillas_3637Show(Sender: TObject);
     procedure TSCasillas_4041Show(Sender: TObject);
     procedure TSCasillas_59Show(Sender: TObject);
     procedure TSCasillas_60Show(Sender: TObject);
     procedure TSCasillas_61Show(Sender: TObject);
     procedure CBEjercicioChange(Sender: TObject);
  private
     { Private declarations }
     TituloFormulario: string;
  public
     { Public declarations }
  end;

var
  FPregModelo303 : TFPregModelo303;

implementation

uses UDMRModelosHacienda, UFormGest, UDMMain, UFMListConfig, UEntorno, UDameDato;

{$R *.DFM}

procedure TFPregModelo303.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRModelosHacienda, DMRModelosHacienda);

  TituloFormulario := _('MODELO 303. IVA');
  if (DMRModelosHacienda.xDatosModelosHaciendaDEVOLUCION_MENSUAL_M303.AsInteger = 1) then
     TituloFormulario := TituloFormulario + ' ' + _('MENSUAL')
  else
     TituloFormulario := TituloFormulario + ' ' + _('TRIMESTRAL');
  LblMod303.Caption := TituloFormulario + ' - ' + _('NO ACTUALIZADO');

  Grupo := 5107;
  Listado := DMRModelosHacienda.frModelo303;

  with DBGFModelo303 do
  begin
     if (REntorno.Ejercicio < 2014) then
     begin
        Columns[1].FieldName := 'C21';
        Columns[2].FieldName := 'C37';
        Columns[3].FieldName := 'C38';
        Columns[4].FieldName := 'C46';
        Columns[5].Visible := False;
        Columns[6].Visible := False;
        Columns[7].Visible := False;
     end
     else
     if (REntorno.Ejercicio <= 2012) then
     begin
        Columns[1].FieldName := 'C27';
        Columns[2].FieldName := 'C45';
        Columns[3].FieldName := 'C46';
        Columns[4].FieldName := 'C67';
        Columns[5].FieldName := 'C71';
        Columns[6].Visible := False;
        Columns[7].Visible := False;
     end
     else
     if (REntorno.Ejercicio <= 3000) then
     begin
        Columns[1].FieldName := 'C27';
        Columns[2].FieldName := 'C45';
        Columns[3].FieldName := 'C46';
        Columns[4].FieldName := 'C71';
        Columns[5].FieldName := 'C110';
        Columns[6].FieldName := 'C78';
        Columns[7].FieldName := 'C87';
     end;
  end;

  DMRModelosHacienda.RecargaCombo(CBEjercicio);
  EFPeriodo.Text := '01';
  CBEjercicioChange(Sender);

  PCDatosModelo.ActivePage := TSDatosModelo;
end;

procedure TFPregModelo303.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRModelosHacienda);
end;

procedure TFPregModelo303.APrevExecute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.Previsualizar303(0);
end;

procedure TFPregModelo303.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.Previsualizar303(1);
end;

procedure TFPregModelo303.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.ReCalcular303(StrToIntDef(CBEjercicio.Text, 0));
  LblMod303.Caption := TituloFormulario;
end;

procedure TFPregModelo303.AmodeloOficialExecute(Sender: TObject);
begin
  DMRModelosHacienda.GeneraModeloOficial_303;
end;

procedure TFPregModelo303.AInstruccionesExecute(Sender: TObject);
begin
  {dji lrk kri - Cambio la ruta, relativa al exe}
  if ShellExecute(Application.Handle, nil, PChar(REntorno.RutaEXE + 'ModelosHacienda\instr_303.pdf'), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la búsqueda de la ayuda'));
end;

procedure TFPregModelo303.AExportarMod303Execute(Sender: TObject);
begin
  DMRModelosHacienda.ExportarMod303(RGTipoDeclaracion.ItemIndex,
     EActividadPrincipal.Text, EEpigrafeIAEPrincipal.Text,
     EActividad1.Text, EEpigrafeIAE1.Text,
     EActividad2.Text, EEpigrafeIAE2.Text,
     EActividad3.Text, EEpigrafeIAE3.Text,
     EActividad4.Text, EEpigrafeIAE4.Text,
     EActividad5.Text, EEpigrafeIAE5.Text, (CBExoneradoPresentacionMod390.ItemIndex = 1), (CBVolumenAnual.ItemIndex = 1));
end;

procedure TFPregModelo303.TSCasillasShow(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.AbreCasillasModelo303(StrToIntDef(CBEjercicio.Text, 0), EFPeriodo.Text);
end;

procedure TFPregModelo303.EFPeriodoChange(Sender: TObject);
begin
  inherited;
  EPeriodo.Text := DameTituloPeriodo(EFPeriodo.Text);
  DMRModelosHacienda.AbreCasillasModelo303(StrToIntDef(CBEjercicio.Text, 0), EFPeriodo.Text);
end;

procedure TFPregModelo303.TButtRecargarCasillasClick(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.AbreCasillasModelo303(StrToIntDef(CBEjercicio.Text, 0), EFPeriodo.Text);
end;

procedure TFPregModelo303.TSCasillas_0103Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C0103;
end;

procedure TFPregModelo303.TSCasillas_0406Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C0406;
end;

procedure TFPregModelo303.TSCasillas_0709Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C0709;
end;

procedure TFPregModelo303.TSCasillas_1011Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C1011;
end;

procedure TFPregModelo303.TSCasillas_1213Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C1213;
end;

procedure TFPregModelo303.TSCasillas_1415Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C1415;
end;

procedure TFPregModelo303.TSCasillas_2829Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C2829;
end;

procedure TFPregModelo303.TSCasillas_3031Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C3031;
end;

procedure TFPregModelo303.TSCasillas_3233Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C3233;
end;

procedure TFPregModelo303.TSCasillas_3637Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C3637;
end;

procedure TFPregModelo303.TSCasillas_4041Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C4041;
end;

procedure TFPregModelo303.TSCasillas_59Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C59;
end;

procedure TFPregModelo303.TSCasillas_60Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C60;
end;

procedure TFPregModelo303.TSCasillas_61Show(Sender: TObject);
begin
  inherited;
  NavCasillas.DataSource := DMRModelosHacienda.DSQMModelo303_C61;
end;

procedure TFPregModelo303.CBEjercicioChange(Sender: TObject);
begin
  inherited;
  DMRModelosHacienda.AbrirMod303(StrToIntDef(CBEjercicio.Text, 0));
end;

end.
