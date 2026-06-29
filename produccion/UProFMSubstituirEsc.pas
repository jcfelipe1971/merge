unit UProFMSubstituirEsc;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UEditPanel, ToolWin, ComCtrls, ULFToolBar, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFEdit,
  ULFLabel, ExtCtrls, ULFPanel, UFormGest, TFlatCheckBoxUnit, ULFCheckBox,
  Grids, DBGrids, NsDBGrid, UNavigator, ActnList, ULFActionList;

type
  TProFMSubstituirEsc = class(TG2KForm)
     PMain: TLFPanel;
     LComponenteOrigen: TLFLabel;
     TBMain: TLFToolBar;
     EPMain: THYMEditPanel;
     ToolButton2: TToolButton;
     LComponenteDestino: TLFLabel;
     PNLSeleccion: TLFPanel;
     PNLComponentes: TLFPanel;
     TBCargar: TToolButton;
     TBSubstituir: TToolButton;
     DBGComp: TDBGridFind2000;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     RGEstado: TRadioGroup;
     LFSubsComp: TLFActionList;
     ACargaDatos: TAction;
     AEjecutarSubs: TAction;
     PNLOrigen: TLFPanel;
     PNLDestino: TLFPanel;
     DBGComponenteOrigen: TDBGridFind2000;
     DBGComponenteDestino: TDBGridFind2000;
     PNLOrigenDestino: TLFPanel;
     TBComponenteOrigen: TLFToolBar;
     TBComponenteDestino: TLFToolBar;
     NavComponenteOrigen: THYMNavigator;
     NavComponenteDestino: THYMNavigator;
     ToolButton3: TToolButton;
     ToolButton4: TToolButton;
     ToolButton5: TToolButton;
     PNLFiltro: TLFPanel;
     LDescripcion: TLFLabel;
     EFiltroDescripcion: TLFEdit;
     AMarcar: TAction;
     ADesmarcar: TAction;
     ToolButton6: TToolButton;
     TBMarcar: TToolButton;
     TBDesmarcar: TToolButton;
     ToolButton1: TToolButton;
     ToolButton7: TToolButton;
     AInicializar: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ACargaDatosExecute(Sender: TObject);
     procedure AEjecutarSubsExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFiltroDescripcionChange(Sender: TObject);
     procedure AMarcarExecute(Sender: TObject);
     procedure ADesmarcarExecute(Sender: TObject);
     procedure AInicializarExecute(Sender: TObject);
     procedure DBGCompCellClick(Column: TColumn);
     procedure DBGCompDblClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
     // procedure SelectorGrid;
     procedure ActivarBotones;
  end;

var
  ProFMSubstituirEsc : TProFMSubstituirEsc;

implementation

uses UDMMain, UEntorno, UProDMSubstituirEsc, UFMain, UUtiles;

{$R *.dfm}

procedure TProFMSubstituirEsc.FormCreate(Sender: TObject);
var
  c : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMSubstituirEsc, ProDMSubstituirEsc);
  RGEstado.ItemIndex := 2;
  c := EncuentraField(DBGComp, '');
  if (c >= 0) then
     DBGComp.Columns[c].Color := REntorno.ColorEnlaceActivo;
end;

procedure TProFMSubstituirEsc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ProDMSubstituirEsc.InicializaDatos;
  CierraData(ProDMSubstituirEsc);
  Action := caFree;
end;

(*
procedure TProFMSubstituirEsc.SelectorGrid;
var
  tipo : integer;
begin
  { TODO -oAlbert : ¿Como se debe inicializar el tipo? }
  ProDMSubstituirEsc.CambiarSeleccion(tipo);
end;
*)

procedure TProFMSubstituirEsc.ACargaDatosExecute(Sender: TObject);
begin
  ProDMSubstituirEsc.RellenaTemporal(RGEstado.ItemIndex);
end;

procedure TProFMSubstituirEsc.AEjecutarSubsExecute(Sender: TObject);
begin
  if (ProDMSubstituirEsc.NingunoMarcado) then
     ShowMessage(_('ERROR: No se ha marcado ningún escandallo'))
  else
  begin
     if MessageDlg(_('Está seguro que desea proceder con la sustitución del componente'),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        Screen.Cursor := crHourGlass;
        try
           ProDMSubstituirEsc.EjecutarReplicacion;
        finally
           Screen.Cursor := crDefault;
        end;
     end;
  end;
end;

procedure TProFMSubstituirEsc.ActivarBotones;
var
  Habilitado : boolean;
begin
  Habilitado := not (ProDMSubstituirEsc.NingunoMarcado);
  ACargaDatos.Enabled := Habilitado;
  AEjecutarSubs.Enabled := Habilitado;
end;

procedure TProFMSubstituirEsc.FormShow(Sender: TObject);
begin
  // ActivarBotones;
end;

procedure TProFMSubstituirEsc.EFiltroDescripcionChange(Sender: TObject);
begin
  ProDMSubstituirEsc.FiltraComp(EFiltroDescripcion.Text);
end;

procedure TProFMSubstituirEsc.AMarcarExecute(Sender: TObject);
begin
  ProDMSubstituirEsc.Marcar(1);
end;

procedure TProFMSubstituirEsc.ADesmarcarExecute(Sender: TObject);
begin
  ProDMSubstituirEsc.Marcar(0);
end;

procedure TProFMSubstituirEsc.AInicializarExecute(Sender: TObject);
begin
  ProDMSubstituirEsc.InicializaDatos;
end;

procedure TProFMSubstituirEsc.DBGCompCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TProFMSubstituirEsc.DBGCompDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ESCANDALLO') then
     FMain.EjecutaAccion(FMain.AProEscandalloSF, 'Escandallo = ''' +
        ProDMSubstituirEsc.QTempSubsEscESCANDALLO.AsString + '''');
end;

end.
