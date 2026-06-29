unit UFMVerificaStockEscandallo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls, HYFIBQuery, ULFEdit, ULFPanel;

type
  TFMVerificaStockEscandallo = class(TForm)
     PNLCabecera: TLFPanel;
     EArticulo: TLFEdit;
     ETitulo: TLFEdit;
     PNLDatos: TLFPanel;
     DBGStock: TDBGrid;
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     function muestra(Articulo, Almacen: string; Cantidad: real): boolean;
  end;

var
  FMVerificaStockEscandallo : TFMVerificaStockEscandallo;

implementation

uses UDMVerificaStockEscandallo, UEntorno, UFormGest, UDMMain;

{$R *.DFM}

procedure TFMVerificaStockEscandallo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMVerificaStockEscandallo, DMVerificaStockEscandallo);
end;

function TFMVerificaStockEscandallo.muestra(Articulo, Almacen: string; Cantidad: real): boolean;
var
  // Q : THYFIBQuery;
  Existencias : real;
begin
  Result := True;
  DMVerificaStockEscandallo.Cantidad := Cantidad;
  DMVerificaStockEscandallo.Almacen := Almacen;
  with DMVerificaStockEscandallo do
  begin
     QArticulo.Close;
     QArticulo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     QArticulo.Params.ByName['ARTICULO'].AsString := Trim(Articulo);
     QArticulo.Open;
     if QArticulo.FieldByName('ABIERTO').AsInteger = 0 then
        Close
     else
     begin
        QEscandallo.DisableControls;
        QEscandallo.Close;
        QEscandallo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        QEscandallo.Params.ByName['ARTICULO'].AsString := Trim(Articulo);
        QEscandallo.Open;
        QEscandallo.First;
        while ((not QEscandallo.EOF) and (Result)) do
        begin
           {Busco las existencias, porque el campo calculado no se refresca. Supongo que es porque todavia no se ve el Form}
           Existencias := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, QEscandalloDETALLE.AsString, Almacen);
           if ((Cantidad * QEscandallo.FieldByName('CANTIDAD').AsFloat) > Existencias) then
              Result := False;
           QEscandallo.Next;
        end;
        QEscandallo.First;
        QEscandallo.EnableControls;
        if Result = False then
           ShowModal
        else
           Close;
     end;
  end;
end;

procedure TFMVerificaStockEscandallo.FormShow(Sender: TObject);
begin
  EArticulo.Text := DMVerificaStockEscandallo.QArticulo.FieldByName(
     'ARTICULO').AsString;
  ETitulo.Text := DMVerificaStockEscandallo.QArticulo.FieldByName('TITULO').AsString;
end;

procedure TFMVerificaStockEscandallo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMVerificaStockEscandallo);
  Action := caFree;
end;

end.
