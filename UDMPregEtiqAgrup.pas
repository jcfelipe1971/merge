unit UDMPregEtiqAgrup;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO;

type
  TDMPregEtiqAgrup = class(TDataModule)
     TLocal: THYTransaction;
     xAgrupClientes: TFIBDataSetRO;
     DSxAgrupClientes: TDataSource;
     xAgrupProveedores: TFIBDataSetRO;
     DSxAgrupProveedores: TDataSource;
     procedure DMPregAgrupTerCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraAgrupacion(Agrupacion: string);
     procedure FiltraAgrupacionProv(Agrupacion: string);
  end;

var
  DMPregEtiqAgrup : TDMPregEtiqAgrup;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMPregEtiqAgrup.DMPregAgrupTerCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMPregEtiqAgrup.FiltraAgrupacion(Agrupacion: string);
begin
  with xAgrupClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMPregEtiqAgrup.FiltraAgrupacionProv(Agrupacion: string);
begin
  with xAgrupProveedores do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;
end;

end.
