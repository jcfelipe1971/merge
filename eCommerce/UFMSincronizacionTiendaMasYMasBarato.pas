unit UFMSincronizacionTiendaMasYMasBarato;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls,
  ULFDBEdit, ULFLabel, ULFMemo, UNavigator;

type
  TFMSincronizacionTiendaMasYMasBarato = class(TFPEditSinNavegador)
     PNLConfiguracionSincronizacion: TLFPanel;
     LAlmacen: TLFLabel;
     LFormaPago: TLFLabel;
     LSerie: TLFLabel;
     DBEAlmacen: TLFDbedit;
     DBEFormaPago: TLFDbedit;
     DBESerie: TLFDbedit;
     LConexion: TLFLabel;
     DBEConexion: TLFDbedit;
     LUltimaFactura: TLFLabel;
     DBEUltimaFactura: TLFDbedit;
     MLog: TLFMemo;
     LFCategoryAction1: TLFCategoryAction;
     ASincronizar: TAction;
     NavMain: THYMNavigator;
     ToolButton1: TToolButton;
     LAgente: TLFLabel;
     DBEAgente: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure ASincronizarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Log(s: string);
  end;

var
  FMSincronizacionTiendaMasYMasBarato : TFMSincronizacionTiendaMasYMasBarato;

implementation

uses UDMMain, UFormGest, UDMSincronizacionTiendaMasYMasBarato, UUtiles;

{$R *.dfm}

procedure TFMSincronizacionTiendaMasYMasBarato.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSincronizacionTiendaMasYMasBarato, DMSincronizacionTiendaMasYMasBarato);
end;

procedure TFMSincronizacionTiendaMasYMasBarato.ASincronizarExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  MLog.Lines.Clear;
  Application.ProcessMessages;

  Archivo := '';
  if MyOpenDialog(Archivo, 'CSV,XLS,ODS', '', 'FMSincronizacionTiendaMasYMasBarato-Sincronizar') then
     DMSincronizacionTiendaMasYMasBarato.Sincronizar(Archivo);
end;

procedure TFMSincronizacionTiendaMasYMasBarato.Log(s: string);
begin
  MLog.Lines.Add(s);
end;

end.
