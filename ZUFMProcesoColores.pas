unit ZUFMProcesoColores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ToolWin, ComCtrls, ULFToolBar, TFlatCheckBoxUnit,
  ULFCheckBox, StdCtrls, Mask, rxToolEdit, ULFDateEdit, ULFLabel, ExtCtrls,
  ULFPanel, ActnList, ULFActionList, UEditPanel;

type
  TZFMProcesoColores = class(TG2KForm)
     PNLMain: TLFPanel;
     LDescripcion: TLFLabel;
     LFechaInicio: TLFLabel;
     LFechaFin: TLFLabel;
     LFDateIni: TLFDateEdit;
     LFDateFin: TLFDateEdit;
     LFCBEliminar: TLFCheckBox;
     TBMain: TLFToolBar;
     TBEjecutar: TToolButton;
     ZLFAProceso: TLFActionList;
     AProcesoColores: TAction;
     ToolButton1: TToolButton;
     HYMEditPanel1: THYMEditPanel;
     procedure AProcesoColoresExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMProcesoColores : TZFMProcesoColores;

implementation

uses UDMMain, ZUDMModelosFechas;

{$R *.dfm}

procedure TZFMProcesoColores.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TZFMProcesoColores.AProcesoColoresExecute(Sender: TObject);
begin
  if ((LFDateIni.Date = 0) or (LFDateFin.Date = 0)) then
     ShowMessage(_('ERROR: No se puede ejecutar el proceso porque falta indicar las fechas'))
  else
  begin
     ZDMModelosFechas.ProcesoColores(LFDateIni.Date, LFDateFin.Date, LFCBEliminar.Checked);
     ShowMessage(_('Proceso realizado con éxito'));
     Close;
  end;
end;

procedure TZFMProcesoColores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
