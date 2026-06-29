unit UFMAmortizacionGrupos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, ToolWin, ComCtrls, ImgList, UControlEdit,
  UFormGest, ExtCtrls, UEditPanel, ULFToolBar;

type
  TFMAmortizacionGrupos = class(TG2KForm)
     DBGGrupos: TDBGrid;
     TBMain: TLFToolBar;
     DBLCBGrupos: TDBLookupComboBox;
     TButtAceptar: TToolButton;
     TButtSep1: TToolButton;
     TreeView1: TTreeView;
     HYMEPGrupos: THYMEditPanel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure TButtAceptarClick(Sender: TObject);
     procedure DBGGruposDblClick(Sender: TObject);
     procedure DBGGruposKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMAmortizacionGrupos : TFMAmortizacionGrupos;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UDMAmortizacion;

procedure TFMAmortizacionGrupos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFMAmortizacionGrupos.FormShow(Sender: TObject);
begin
  DBLCBGrupos.KeyValue := '0';
end;

procedure TFMAmortizacionGrupos.TButtAceptarClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAmortizacionGrupos.DBGGruposDblClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAmortizacionGrupos.DBGGruposKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     Close;
end;

end.
