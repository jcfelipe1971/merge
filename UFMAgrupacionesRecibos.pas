unit UFMAgrupacionesRecibos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  ExtCtrls, UEditPanel, ToolWin, ComCtrls, NsDBGrid, ULFToolBar, ULFPanel;

type
  TFMAgrupacionesRecibos = class(TG2kForm)
     PNPrincipal: TLFPanel;
     DBGFRecibos: TDBGridFind2000;
     TBMain: TLFToolBar;
     EPMain: THYMEditPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFRecibosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFRecibosDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure mostrar(empresa, ejercicio, canal, registro: integer; signo: string; EjercicioOrigen: integer);
  end;

var
  FMAgrupacionesRecibos : TFMAgrupacionesRecibos;

implementation

uses UDMMain, UDMAgrupacionesRecibos, UFMain, UUtiles;

{$R *.DFM}

procedure TFMAgrupacionesRecibos.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMAgrupacionesRecibos, DMAgrupacionesRecibos);
end;

procedure TFMAgrupacionesRecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(DMAgrupacionesRecibos);
end;

procedure TFMAgrupacionesRecibos.mostrar(Empresa, Ejercicio, Canal, Registro: integer; Signo: string; EjercicioOrigen: integer);
begin
  DMAgrupacionesRecibos.mostrar(Empresa, Ejercicio, Canal, Registro, Signo, EjercicioOrigen);
  ShowModal;
end;

procedure TFMAgrupacionesRecibos.DBGFRecibosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMAgrupacionesRecibos.HayDatos then
  begin
     if (UpperCase(Column.FieldName) = 'REGISTRO') then
        CeldaEnlace(DBGFRecibos, Rect);
  end;
end;

procedure TFMAgrupacionesRecibos.DBGFRecibosDblClick(Sender: TObject);
begin
  if DMAgrupacionesRecibos.HayDatos then
  begin
     FMain.MuestraCartera(DMAgrupacionesRecibos.xAgrupadosEJERCICIO.AsInteger,
        DMAgrupacionesRecibos.xAgrupadosCanal.AsInteger,
        DMAgrupacionesRecibos.xAgrupadosSIGNO.AsString[1],
        DMAgrupacionesRecibos.xAgrupadosREGISTRO.AsInteger);
     Close;
  end;
end;

end.
