unit UFCreaPlanContProy;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, ToolWin, ComCtrls, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, UNavigator, Menus,
  UTeclas, UControlEdit, ULFActionList, NsDBGrid, ULFPanel, ULFToolBar,
  ULFDBEditFind2000, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  ULFEditFind2000, ULFEdit;

type

  TFCreaPlanContProy = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtCrearPlan: TToolButton;
     PMain: TLFPanel;
     TButtSalir: TToolButton;
     ALMain: TLFActionList;
     ACrearPlan: TAction;
     ASalir: TAction;
     TBSeparador: TToolButton;
     GBPlanContOrigen: TGroupBox;
     LFLPlanCont: TLFLabel;
     LFLSufContOrigen: TLFLabel;
     LFLIndiceSufOrigen: TLFLabel;
     DBESufijoContOrigen: TLFDbedit;
     DBEIndiceSufOrigen: TLFDbedit;
     DBEFPlanContable: TLFEditFind2000;
     DBETitPlanContable: TLFDbedit;
     LFLSufCont: TLFLabel;
     LFLIndFuf: TLFLabel;
     LFESufijoCont: TLFEdit;
     FPMain: TLFPanel;
     LFLProyecto: TLFLabel;
     DBEFProyecto: TLFDBEditFind2000;
     DBETitProyecto: TLFDbedit;
     LFEIndiceSuf: THYGRightEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ASalirExecute(Sender: TObject);
     procedure DBEFPlanContableChange(Sender: TObject);
     procedure ACrearPlanExecute(Sender: TObject);
  private
     { Private declarations }
     Canal, Proyecto, Actualiza_estructura_analitica: integer;
     mrOk: boolean;
  public
     function Mostrar(vproyecto, vactualiza_estructura: integer): boolean;
  end;

var
  FCreaPlanContProy : TFCreaPlanContProy;

implementation

uses UDMCreaPlanContProy, UDMMain, UEntorno, FIBQuery, HYFIBQuery;

{$R *.DFM}

procedure TFCreaPlanContProy.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMCreaPlanContProy, DMCreaPlanContProy);
  Canal := REntorno.Canal;
  Actualiza_estructura_analitica := 1;
  Proyecto := 0;
  mrOk := False;
end;

function TFCreaPlanContProy.Mostrar(vproyecto, vactualiza_estructura: integer): boolean;
begin
  proyecto := vproyecto;
  Actualiza_estructura_analitica := vactualiza_estructura;
  DBEFProyecto.Text := IntToStr(proyecto);
  DBETitProyecto.Text := DMCreaPlanContProy.DameNombreProyecto(proyecto);
  DBEFPlanContable.Text := DMCreaPlanContProy.DameMinPlanContable;
  ShowModal;
  Result := mrOk;
end;

procedure TFCreaPlanContProy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCreaPlanContProy);
  Action := caFree;
end;

procedure TFCreaPlanContProy.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFCreaPlanContProy.DBEFPlanContableChange(Sender: TObject);
begin
  DMCreaPlanContProy.Actualiza(DBEFPlanContable.Text);
  LFESufijoCont.Text := DBESufijoContOrigen.Text;
  LFEIndiceSuf.Text := DBEIndiceSufOrigen.Text;
end;

procedure TFCreaPlanContProy.ACrearPlanExecute(Sender: TObject);
var
  IndiceSuf : integer;
  SufijoCont : string;
begin
  //Si el indice es 0, el sufijo contable no tendra valor.
  IndiceSuf := 0;

  if (LFEIndiceSuf.Text > '') then
  begin
     IndiceSuf := StrToInt(LFEIndiceSuf.Text);
     SufijoCont := LFESufijoCont.Text;
  end;

  DMCreaPlanContProy.CreaPlanContable(canal, proyecto, indiceSuf,
     Actualiza_estructura_analitica, DBEFPlanContable.Text, sufijoCont);
  mrOk := True;
  Close;
end;

end.
