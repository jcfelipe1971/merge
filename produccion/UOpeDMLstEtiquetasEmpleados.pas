unit UOpeDMLstEtiquetasEmpleados;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBDataSetRO,
  FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados;

type
  TOpeDMLstEtiquetasEmpleados = class(TDataModule)
     TLocal: THYTransaction;
     frListado: TfrHYReport;
     xLstEtiquetasEmpleados: TFIBDataSetRO;
     DSxLstEtiquetasEmpleados: TDataSource;
     frDBLstEtiquetasEmpleados: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(Modo, EmpleadoDesde, EmpleadoHasta: integer);
  end;

var
  OpeDMLstEtiquetasEmpleados : TOpeDMLstEtiquetasEmpleados;

implementation

uses UDMMain, UDMListados, UEntorno, UFormGest;

{$R *.dfm}

{ TOpeDMLstEtiquetasEmpleados }

procedure TOpeDMLstEtiquetasEmpleados.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TOpeDMLstEtiquetasEmpleados.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TOpeDMLstEtiquetasEmpleados.MostrarListado(Modo, EmpleadoDesde, EmpleadoHasta: integer);
begin
  with xLstEtiquetasEmpleados do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['EMPLEADO_DESDE'].AsInteger := EmpleadoDesde;
     Params.ByName['EMPLEADO_HASTA'].AsInteger := EmpleadoHasta;
     Open;
  end;

  DMListados.Imprimir(8045, 0, Modo, '', _('Etiquetas de empleado'), frListado, nil, nil, nil);
end;

end.
