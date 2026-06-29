unit UProFMCostesTOrden;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, UDBDateTimePicker, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, ToolWin,
  ULFToolBar, ULFDBEditFind2000, ULFDBEdit, ULFLabel, UFPEditSinNavegador,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit, UEditPanel, ExtCtrls, ULFPanel;

type
  TProFMCostesTOrden = class(TFPEditSinNavegador)
     Label1: TLFLabel;
     DBEdit1: TLFDbedit;
     Label23: TLFLabel;
     DBEditFind20006: TLFDBEditFind2000;
     Label11: TLFLabel;
     DBEditFind20007: TLFDBEditFind2000;
     Label12: TLFLabel;
     DBEdit3: TLFDbedit;
     Label7: TLFLabel;
     DBEditFind20008: TLFDBEditFind2000;
     DBEdit4: TLFDbedit;
     Label13: TLFLabel;
     DBEdit13: TLFDbedit;
     Label14: TLFLabel;
     DBEdit14: TLFDbedit;
     Label15: TLFLabel;
     DBEdit15: TLFDbedit;
     Label24: TLFLabel;
     Label25: TLFLabel;
     Label26: TLFLabel;
     Label27: TLFLabel;
     Label28: TLFLabel;
     Label29: TLFLabel;
     Label30: TLFLabel;
     DBEdit50: TLFDbedit;
     DBEdit49: TLFDbedit;
     DBEdit48: TLFDbedit;
     DBEdit47: TLFDbedit;
     DBEdit46: TLFDbedit;
     DBEdit45: TLFDbedit;
     DBEdit44: TLFDbedit;
     Label31: TLFLabel;
     DBEdit51: TLFDbedit;
     DBEdit52: TLFDbedit;
     Label32: TLFLabel;
     Label33: TLFLabel;
     DBEdit53: TLFDbedit;
     DBEdit54: TLFDbedit;
     Label34: TLFLabel;
     Label35: TLFLabel;
     DBEdit55: TLFDbedit;
     DBEdit56: TLFDbedit;
     Label36: TLFLabel;
     Label37: TLFLabel;
     DBEdit57: TLFDbedit;
     Label18: TLFLabel;
     DBEdit18: TLFDbedit;
     LFLabel1: TLFLabel;
     LFDbedit1: TLFDbedit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMCostesTOrden : TProFMCostesTOrden;

implementation

uses UFMain, UProDMOrden, UDMMain;

{$R *.dfm}

procedure TProFMCostesTOrden.FormCreate(Sender: TObject);
begin
  ProDMOrden.xCostesTOrden.Close;
  ProDMOrden.xCostesTOrden.Open;
end;

procedure TProFMCostesTOrden.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ProDMOrden.xCostesTOrden.Close;
end;

end.
