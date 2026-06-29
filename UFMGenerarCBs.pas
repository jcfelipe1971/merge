unit UFMGenerarCBs;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ToolWin, ComCtrls, UEditPanel, ActnList, StdCtrls, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  ULFActionList, ULFCheckBox, ULFPanel, ULFToolBar, TFlatCheckBoxUnit,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, Menus, UTeclas,
  UControlEdit;

type
  TFMGenerarCBs = class(TFPEditSinNavegador)
     TBGenerarCBs: TToolButton;
     RGTipoCB: TRadioGroup;
     TBSep1: TToolButton;
     CBStock: TLFCheckBox;
     procedure TBGenerarCBsClick(Sender: TObject);
  private
     procedure GenerarCBs;
  public
     { Public declarations }
  end;

var
  FMGenerarCBs : TFMGenerarCBs;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, HYFIBQuery, UUtiles;

procedure TFMGenerarCBs.TBGenerarCBsClick(Sender: TObject);
begin
  inherited;

  GenerarCBs;
  Close;
end;

procedure TFMGenerarCBs.GenerarCBs;
var
  Tipo, Stock : smallint;
begin
  if ConfirmaMensaje(_('Se generaran codigos de barras a TODOS los articulos que no lo tengan' + #13#10 + '¿Desea continuar?')) then
  begin
     Screen.Cursor := crHourglass;
     try
        if RGTipoCB.ItemIndex = 1 then
           Tipo := 3
        else
           Tipo := 1;

        if CBStock.State = cbUnchecked then
           Stock := 0
        else
           Stock := 1;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE A_ART_GENERAR_COD_BARRAS(:EMPRESA, :TIPO, :STOCK)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['TIPO'].AsInteger := Tipo;
              Params.ByName['STOCK'].AsInteger := Stock;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

end.
