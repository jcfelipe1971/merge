unit UFMAFPIndicadores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFLabel,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, Grids,
  DBGrids, NsDBGrid, ULFEdit, UHYDBGrid;

type
  TFMAFPIndicadores = class(TFPEditSimple)
     PNLPeriodo: TLFPanel;
     EFPeriodo: TLFEditFind2000;
     LPeriodo: TLFLabel;
     ETituloPeriodo: TLFEdit;
     TBSep1: TToolButton;
     TBInsertIndicadoresAFP: TToolButton;
     DBGMain: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFPeriodoChange(Sender: TObject);
     procedure TBInsertIndicadoresAFPClick(Sender: TObject);
  private
     { Private declarations }
     procedure FiltraPeriodo;
  public
     { Public declarations }
  end;

var
  FMAFPIndicadores : TFMAFPIndicadores;

implementation

uses
  UDMMain, UDMAFPIndicadores, UFormGest, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMAFPIndicadores.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAFPIndicadores, DMAFPIndicadores);

  NavMain.DataSource := DMAFPIndicadores.DSQMAFPIndicadores;
  DBGMain.DataSource := DMAFPIndicadores.DSQMAFPIndicadores;


  EFPeriodo.Text := DMMain.DamePeriodo(Now);
  EFPeriodoChange(Sender);
end;

procedure TFMAFPIndicadores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAFPIndicadores);
end;

procedure TFMAFPIndicadores.FiltraPeriodo;
begin
  DMAFPIndicadores.FiltraPeriodo(EFPeriodo.Text);
end;

procedure TFMAFPIndicadores.EFPeriodoChange(Sender: TObject);
begin
  inherited;
  ETituloPeriodo.Text := DameTituloPeriodo(EFPeriodo.Text);
  FiltraPeriodo;
end;

procedure TFMAFPIndicadores.TBInsertIndicadoresAFPClick(Sender: TObject);
begin
  inherited;
  if (Trim(EFPeriodo.Text) = '') then
     raise Exception.Create(_('Debe seleccionar un periodo'))
  else
     DMAFPIndicadores.InsertaIndicadores;
end;

end.
