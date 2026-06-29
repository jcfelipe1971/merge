unit UFMDteRecepcionCorreos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ULFPanel, UFPEditSinNavegador, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  UEditPanel, ToolWin, ComCtrls, ULFToolBar;

type
  TFMDteRecepcionCorreos = class(TFPEditSinNavegador)
     PNLLog: TLFPanel;
     MLog: TMemo;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMDteRecepcionCorreos : TFMDteRecepcionCorreos;

implementation

uses UDMDteRecepcionCorreos, UFormGest;

{$R *.dfm}

procedure TFMDteRecepcionCorreos.FormCreate(Sender: TObject);
begin
  AbreData(TDMDteRecepcionCorreos, DMDteRecepcionCorreos);
end;

procedure TFMDteRecepcionCorreos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMDteRecepcionCorreos);
end;

procedure TFMDteRecepcionCorreos.FormShow(Sender: TObject);
begin
  inherited;
  // LeerCorreos devuelve TRUE si hay mensajes en el buzon
  try
     if not DMDteRecepcionCorreos.LeerCorreo(MLog.Lines) then
        CierraForm(FMDteRecepcionCorreos);
  except
     on E: Exception do
        MLog.Lines.Add(E.Message);
  end;
end;

end.
