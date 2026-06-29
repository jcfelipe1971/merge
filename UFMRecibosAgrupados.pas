unit UFMRecibosAgrupados;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  ExtCtrls, UEditPanel, ToolWin, ComCtrls, NsDBGrid, ULFToolBar, ULFPanel,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit;

type
  TFMRecibosAgrupados = class(TFPEditSinNavegador)
     DBGFRecibos: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFRecibosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFRecibosDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Mostrar(Empresa, Ejercicio_rec, Canal, Registro, Ejercicio: integer; Signo: string);
  end;

var
  FMRecibosAgrupados : TFMRecibosAgrupados;

implementation

uses UDMRecibosAgrupados, UDMMain, UUtiles, UFMain;

{$R *.DFM}

procedure TFMRecibosAgrupados.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRecibosAgrupados, DMRecibosAgrupados);
end;

procedure TFMRecibosAgrupados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMRecibosAgrupados);
end;

procedure TFMRecibosAgrupados.Mostrar(Empresa, Ejercicio_rec, Canal, Registro, Ejercicio: integer; Signo: string);
begin
  DMRecibosAgrupados.Mostrar(Empresa, Ejercicio_rec, Canal, Registro, Ejercicio, Signo);
  ShowModal;
end;

procedure TFMRecibosAgrupados.DBGFRecibosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMRecibosAgrupados.HayDatos then
  begin
     if (UpperCase(Column.FieldName) = 'REGISTRO_REC') then
        CeldaEnlace(DBGFRecibos, Rect);
  end;
end;

procedure TFMRecibosAgrupados.DBGFRecibosDblClick(Sender: TObject);
begin
  if DMRecibosAgrupados.HayDatos then
  begin
     FMain.MuestraCartera(DMRecibosAgrupados.xAgrupadosEJERCICIO_REC.AsInteger,
        DMRecibosAgrupados.xAgrupadosCANAL.AsInteger,
        DMRecibosAgrupados.xAgrupadosSIGNO_REC.AsString[1],
        DMRecibosAgrupados.xAgrupadosREGISTRO_REC.AsInteger);
     Close;
  end;
end;

end.
