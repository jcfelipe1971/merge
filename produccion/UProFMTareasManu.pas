unit UProFMTareasManu;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, StdCtrls, Mask, DBCtrls, ULFDBEdit, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel,
  ULFLabel, ULFEdit;

type
  TProFMTareasManu = class(TFPEdit)
     LTarea: TLFLabel;
     DBETarea: TLFDbedit;
     LTiempo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBEFRecurso: TLFDBEditFind2000;
     DBEFTipTareasMan: TLFDBEditFind2000;
     LRecurso: TLFLabel;
     DBETituloRecurso: TLFDbedit;
     DBETituloTarea: TLFDbedit;
     LTipoTarea: TLFLabel;
     MaskEdit1: TMaskEdit;
     LSepHoraMinuto: TLFLabel;
     LSepMinutoSegundo: TLFLabel;
     LFEHoras: TLFEdit;
     LFEMinutos: TLFEdit;
     LFESegundos: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure MaskEdit1Exit(Sender: TObject);
     procedure LFEMinutosExit(Sender: TObject);
     procedure LFESegundosExit(Sender: TObject);
     procedure LFEHorasExit(Sender: TObject);
     // procedure SoloNumeros(Sender: TObject; var Key: char);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMTareasManu : TProFMTareasManu;

implementation

uses UProDMTareasManu, UFormGest, UDMMain, UUtiles;

{$R *.dfm}

procedure TProFMTareasManu.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMTareasManu, ProDMTareasManu);
  NavMain.DataSource := ProDMTareasManu.DSQMProTareasManu;
  DBGMain.DataSource := ProDMTareasManu.DSQMProTareasManu;
end;

procedure TProFMTareasManu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMTareasManu);
end;

procedure TProFMTareasManu.MaskEdit1Exit(Sender: TObject);
var
  Minuto, Segundo : integer;
begin
  inherited;

  Minuto := StrToInt(Copy(MaskEdit1.Text, 5, 2));
  Segundo := StrToInt(Copy(MaskEdit1.Text, 8, 2));

  if (Minuto > 59) or (Segundo > 59) then
     raise Exception.Create(_('Formato incorrecto. Debe utilizar: hhh:mm:ss.' + #13#10 + 'Máximo valor para minutos y segundos 60.'));

  ProDMTareasManu.QMProTareasManuTime.AsString := MaskEdit1.Text;
end;

procedure TProFMTareasManu.LFEMinutosExit(Sender: TObject);
begin
  inherited;
  LFEMinutos.Text := Format('%.2d', [StrToIntDef(LFEMinutos.Text, 0)]);

  if (StrToInt(LFEMinutos.Text) > 59) then
     LFEMinutos.SetFocus();
end;

procedure TProFMTareasManu.LFESegundosExit(Sender: TObject);
begin
  inherited;
  LFESegundos.Text := Format('%.2d', [StrToIntDef(LFESegundos.Text, 0)]);

  if (StrToInt(LFESegundos.Text) > 59) then
     LFESegundos.SetFocus();
end;

procedure TProFMTareasManu.LFEHorasExit(Sender: TObject);
begin
  inherited;
  LFEHoras.Text := Format('%.3d', [StrToIntDef(LFEHoras.Text, 0)]);
end;

(*
procedure TProFMTareasManu.SoloNumeros(Sender: TObject; var Key: char);
begin
  inherited;
  if not (key in ['0'..'9', #8]) then
     Key := #0;
end;
*)

end.
