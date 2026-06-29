unit UFMBusquedaOrden;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, StdCtrls, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UEditPanel, ToolWin, ComCtrls, ULFLabel,
  ULFPanel, ULFToolBar;

type
  TFMBusquedaOrden = class(TG2kForm)
     PMain: TLFPanel;
     LIDOrdenProduccion: TLFLabel;
     EFIdOrden: TEditFind2000;
     TBMain: TLFToolBar;
     HYMEPanel: THYMEditPanel;
     procedure EFIdOrdenKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure HYMEPanelClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     function DameIdOrden: integer;
  end;

var
  FMBusquedaOrden : TFMBusquedaOrden;

implementation

uses UDMMain, UFMain;

{$R *.DFM}

procedure TFMBusquedaOrden.EFIdOrdenKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
end;

procedure TFMBusquedaOrden.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  FMain.AddComponenteReturn(EFIdOrden);
end;

procedure TFMBusquedaOrden.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.DelComponenteReturn(EFIdOrden);
end;

procedure TFMBusquedaOrden.HYMEPanelClickBuscar(Sender: TObject; var Continua: boolean);
begin
  ModalResult := mrOk;
end;

function TFMBusquedaOrden.DameIdOrden: integer;
begin
  Result := 0;
  if (ShowModal = mrOk) then
     Result := StrToIntDef(EFIdOrden.Text, 0);
end;

end.
