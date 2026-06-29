unit UFMForeignKey;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UHYDBGrid, StdCtrls, Mask, DBCtrls, ComCtrls, ExtCtrls,
  ToolWin, UFormGest, Menus, UTeclas, UControlEdit, UNavigator, ULFDBEdit,
  ULFPanel, ULFToolBar, NsDBGrid, ULFMemo, ULFLabel, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, UEditPanel;

type
  TFMForeignKey = class(TFPEditSinNavegador)
     PNLError: TLFPanel;
     PNLDetalles: TLFPanel;
     LExplicacion: TLFLabel;
     MDetalles: TLFMemo;
     TButtVerDetalles: TToolButton;
     TSep1: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TButtVerDetallesClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ShowForeign(FKName: string; MensajeOriginal: string = '');
  end;

var
  FMForeignKey : TFMForeignKey;

implementation

uses UDMMain, UDMForeignKey;

{$R *.DFM}

procedure TFMForeignKey.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMForeignKey, DMForeignKey);
  OwnerDrawMenus(Self);
  Height := 121;
  PNLDetalles.Visible := False;
end;

procedure TFMForeignKey.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMForeignKey);
end;

procedure TFMForeignKey.ShowForeign(FKName: string; MensajeOriginal: string = '');
begin
  MDetalles.Lines.Text := DMForeignKey.OpenFK(FKName);
  MDetalles.Lines.Add('---');
  MDetalles.Lines.Add(MensajeOriginal);
  ShowModal;
end;

procedure TFMForeignKey.TButtVerDetallesClick(Sender: TObject);
begin
  PNLDetalles.Visible := not PNLDetalles.Visible;

  if PNLDetalles.Visible then
     Height := Height + 200
  else
     Height := Height - 200;
end;

end.
