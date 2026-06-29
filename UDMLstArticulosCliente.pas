unit UDMLstArticulosCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery, FR_DSet, FR_DBSet,
  FR_Class, Fr_HYReport, StdCtrls;

type
  TDMLstArticulosCliente = class(TDataModule)
     TLocal: THYTransaction;
     QMArticulosCliente: TFIBTableSet;
     DSQMArticulosCliente: TDataSource;
     frArticulosCliente: TfrHYReport;
     frDBDSArticulosCliente: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frArticulosClienteGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     ListarMargen: boolean;
     DesdeCliente, HastaCliente: integer;
  public
     { Public declarations }
     procedure MostrarListado(Modo: integer; aDesdeCliente, aHastaCliente: integer; aListarMargen: boolean);
  end;

var
  DMLstArticulosCliente : TDMLstArticulosCliente;

implementation

uses UFormGest, UDMListados, UEntorno, UDMMain, UUtiles;

{$R *.dfm}

procedure TDMLstArticulosCliente.MostrarListado(Modo: integer; aDesdeCliente, aHastaCliente: integer; aListarMargen: boolean);
var
  Tarifa : string;
begin
  DMListados.DatosInforme(Now, '');

  DesdeCliente := aDesdeCliente;
  HastaCliente := aHastaCliente;
  ListarMargen := aListarMargen;

  Tarifa := 'NOR';

  with QMArticulosCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['D_CLIENTE'].AsInteger := DesdeCliente;
     Params.ByName['H_CLIENTE'].AsInteger := HastaCliente;
     Params.ByName['TARIFA'].AsString := Tarifa;
     Open;
  end;

  DMListados.Imprimir(9003, 0, Modo, '', '', frArticulosCliente, nil, nil, nil);
end;

procedure TDMLstArticulosCliente.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstArticulosCliente.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstArticulosCliente.frArticulosClienteGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Cliente_D' then
     ParValue := DesdeCliente;
  if ParName = 'Cliente_H' then
     ParValue := HastaCliente;
  if ParName = 'Margen' then
  begin
     if ListarMargen then
        ParValue := '1'
     else
        ParValue := '0';
  end;
end;

end.
