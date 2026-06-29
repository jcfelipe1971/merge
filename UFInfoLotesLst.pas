unit UFInfoLotesLst;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UNavigator, Menus, UTeclas,
  UControlEdit, UFormGest, rxPlacemnt, ULFFormStorage, StdCtrls, ULFLabel,
  ULFEdit, UFPEditSimple, ActnList, ULFActionList, UEditPanel;

type
  TFInfoLotesLst = class(TFPEditSimple)
     DBGInfoLotes: TFIBHYGGridFind;
     LFELote: TLFEdit;
     ToolButton1: TToolButton;
     LFLLote: TLFLabel;
     TBBuscarLote: TToolButton;
     PNLFiltroLote: TLFPanel;
     procedure DBGInfoLotesDblClick(Sender: TObject);
     procedure TBBuscarLoteClick(Sender: TObject);
     procedure LFELoteKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FInfoLotesLst : TFInfoLotesLst;

implementation

uses UDMMain, UDMLstTrazabilidadLotes;

{$R *.dfm}

procedure TFInfoLotesLst.DBGInfoLotesDblClick(Sender: TObject);
begin
  DMLstTrazabilidadLotes.AsignaLote;
  Close;
end;

procedure TFInfoLotesLst.TBBuscarLoteClick(Sender: TObject);
begin
  if (Length(Trim(LFELote.Text)) <= 0) then
  begin
     TBBuscarLote.Down := not TBBuscarLote.Down;
     Exit;
  end;

  if TBBuscarLote.Down then
  begin
     DMLstTrazabilidadLotes.AbreLotesFiltrado(LFELote.Text);
     TBBuscarLote.ImageIndex := 22;
  end
  else
  begin
     DMLstTrazabilidadLotes.AbreLotes;
     TBBuscarLote.ImageIndex := 23;
  end;
end;

procedure TFInfoLotesLst.LFELoteKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
     TBBuscarLote.Down := not TBBuscarLote.Down;
     TBBuscarLoteClick(Sender);
  end;
end;

end.
