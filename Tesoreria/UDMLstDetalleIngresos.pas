unit UDMLstDetalleIngresos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, FR_DSet, FR_DBSet,
  frxClass, frxDBSet, FR_Class, Fr_HYReport, FIBDataSet, frxHYReport, UFormGest;

type
  TDMLstDetalleIngresos = class(TDataModule)
     frIngresos: TfrHYReport;
     frxDBIngresos: TfrxDBDataset;
     frDBIngresos: TfrDBDataSet;
     TLocal: TFIBTransaction;
     QMIngresos: TFIBDataSetRO;
     DSIngresos: TDataSource;
     frxIngresos: TfrxHYReport;
     QMTotalesIngresos: TFIBDataSetRO;
     DSTotalesIngresos: TDataSource;
     frDBTotalesIngresos: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure frIngresosGetValue(const ParName: string; var ParValue: variant);
     procedure frxIngresosGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     FechaDesde, FechaHasta: TDateTime;
     Serie: string;
  public
     { Public declarations }
     procedure MostrarListado(Modo: integer; aFechaDesde, aFechaHasta: TDateTime; aSerie: string; FechaListado: TDateTime; Comentario: string; Usuario: integer);
  end;

var
  DMLstDetalleIngresos : TDMLstDetalleIngresos;

implementation

uses
  UDMMain, UDMListados, UEntorno, UDameDato;

{$R *.dfm}

procedure TDMLstDetalleIngresos.MostrarListado(Modo: integer; aFechaDesde, aFechaHasta: TDateTime; aSerie: string; FechaListado: TDateTime; Comentario: string; Usuario: integer);
begin
  AbreData(TDMListados, DMListados);

  // Guardo datos para usarlas como resultado de GetValue en el listado
  FechaDesde := aFechaDesde;
  FechaHasta := aFechaHasta;
  Serie := aSerie;

  DMListados.Normalizar_Desde_Hasta(FechaDesde, FechaHasta);
  DMListados.DatosInforme(FechaListado, Comentario);

  with QMIngresos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Canal 0 = Todos los canales
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Params.ByName['SERIE'].AsString := Serie;
     // Usuario 0 = Todos los usuarios
     Params.ByName['USUARIO'].AsInteger := Usuario;
     Open;
  end;

  with QMTotalesIngresos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     // Canal 0 = Todos los canales
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA_INI'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_FIN'].AsDateTime := FechaHasta;
     Params.ByName['SERIE'].AsString := Serie;
     // Usuario 0 = Todos los usuarios
     Params.ByName['USUARIO'].AsInteger := Usuario;
     Open;
  end;

  DMListados.Imprimir(640, 0, Modo, '', '', frIngresos, frxIngresos, nil);

  CierraData(DMListados);
end;

procedure TDMLstDetalleIngresos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TDMLstDetalleIngresos.frIngresosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'FECHA_DESDE') then
     ParValue := FechaDesde;

  if (ParName = 'FECHA_HASTA') then
     ParValue := FechaHasta;

  if (ParName = 'TITULO_SERIE') then
     ParValue := DameTituloSerie(Serie);
end;

procedure TDMLstDetalleIngresos.frxIngresosGetValue(const VarName: string; var Value: variant);
begin
  frIngresosGetValue(VarName, Value);
end;

end.
