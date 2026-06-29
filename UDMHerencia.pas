unit UDMHerencia;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet,
  FIBDataSetRO, FIBTableDataSetRO;

type
  TDMHerencia = class(TDataModule)
     DSxOrigenes: TDataSource;
     DSxDestinos: TDataSource;
     TLocal: THYTransaction;
     xOrigenes: TFIBTableSetRO;
     xDestinos: TFIBTableSetRO;
     procedure DMHerenciaCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Parametros(Rig, Ejercicio: integer; Tipo, Serie: string);
     procedure DatosHerencia(var Empresa, Ejercicio, Canal: integer; var Serie, Tipo: string; var Rig: integer; Dato: boolean);
  end;

var
  DMHerencia : TDMHerencia;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMHerencia.DMHerenciaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMHerencia.Parametros(Rig, Ejercicio: integer; Tipo, Serie: string);
begin
  with xOrigenes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;

  with xDestinos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;
end;

procedure TDMHerencia.DatosHerencia(var Empresa, Ejercicio, Canal: integer; var Serie, Tipo: string; var Rig: integer; Dato: boolean);
begin
  if Dato then
     with xOrigenes do
     begin
        Empresa := FieldByName('REMPRESA').AsInteger;
        Ejercicio := FieldByName('REJERCICIO').AsInteger;
        Canal := FieldByName('RCANAL').AsInteger;
        Serie := FieldByName('RSERIE').AsString;
        Tipo := FieldByName('RTIPO').AsString;
        Rig := FieldByName('RRIG').AsInteger;
     end
  else
     with xDestinos do
     begin
        Empresa := FieldByName('REMPRESA').AsInteger;
        Ejercicio := FieldByName('REJERCICIO').AsInteger;
        Canal := FieldByName('RCANAL').AsInteger;
        Serie := FieldByName('RSERIE').AsString;
        Tipo := FieldByName('RTIPO').AsString;
        Rig := FieldByName('RRIG').AsInteger;
     end;
end;

end.
