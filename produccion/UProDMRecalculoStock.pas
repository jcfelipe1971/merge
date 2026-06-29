unit UProDMRecalculoStock;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, StdCtrls, ExtCtrls,
  UComponentesBusquedaFiltrada, FIBDatabase, UFIBModificados, Math,
  HYFIBQuery, FIBDataSetRO, jpeg, GIFImage;

type
  TProDMRecalculoStock = class(TDataModule)
     procedure DataModuleDestroy(Sender: TObject);
     procedure DataModuleCreate(Sender: TObject);
  public
     procedure RecalculaStock(Option: byte; Articulo: string; mostrar_fparada: boolean);
  end;

var
  ProDMRecalculoStock : TProDMRecalculoStock;

implementation

uses UDMMain, UEntorno, UFormGest, UFParada;

{$R *.dfm}

procedure TProDMRecalculoStock.RecalculaStock(Option: byte; Articulo: string; mostrar_fparada: boolean);
var
  Q : THYFIBQuery;
begin
  // sfg_rsl se añade un proceos especial para recalcular unidades reservadas en producción
  if (Option and 1) <> 0 then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE PRO_RECALCULA_RESERVA (?EMPRESA, ?ARTICULO)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           if (mostrar_fparada) then
              TFParada.Create(Self).ExecQuery(Q, _('Recalculando las Unidades Reservadas en Producción'))
           else
              ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

  // sfg_rsl se añade un proceos especial para recalcular unidades reservadas en producción
  if (Option and 2) <> 0 then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE PRO_RECALCULA_UNID_PROCESO (?EMPRESA, ?ARTICULO)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           if (mostrar_fparada) then
              TFParada.Create(Self).ExecQuery(Q, _('Recalculando las Unidades en Proceso de Producción'))
           else
              ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

procedure TProDMRecalculoStock.DataModuleDestroy(Sender: TObject);
begin
  CierraData(ProDMRecalculoStock);
end;

procedure TProDMRecalculoStock.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
