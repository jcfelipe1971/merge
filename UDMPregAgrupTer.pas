unit UDMPregAgrupTer;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO;

type
  TDMPregAgrupTer = class(TDataModule)
     xTiposDestino: TFIBDataSetRO;
     DSxTiposDestino: TDataSource;
     TLocal: THYTransaction;
     xAgrupacion: TFIBDataSetRO;
     DSxAgrupacion: TDataSource;
     DSxTerceros: TDataSource;
     xTerceros: TFIBDataSetRO;
     procedure DMPregAgrupTerCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraTipo(Tipo: string);
     procedure FiltraAgrupacion(Agrupacion: string);
     procedure FiltraTercero(Tercero: integer);
  end;

var
  DMPregAgrupTer : TDMPregAgrupTer;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMPregAgrupTer.DMPregAgrupTerCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMPregAgrupTer.FiltraTipo(Tipo: string);
begin
  with xTiposDestino do
  begin
     Close;
     Params.ByName['TIPO'].AsString := Tipo;
     Open;
  end;
end;

procedure TDMPregAgrupTer.FiltraAgrupacion(Agrupacion: string);
begin
  with xAgrupacion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMPregAgrupTer.FiltraTercero(Tercero: integer);
begin
  with xTerceros do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;
end;

end.
