unit UProDMLstInformeMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBDataSetRO,
  FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery;

type
  TProDMLstInformeMarcajes = class(TDataModule)
     TLocal: THYTransaction;
     frInformeMarcajes: TfrHYReport;
     xLstInforme: TFIBDataSetRO;
     DSxLstInforme: TDataSource;
     frDBLstInforme: TfrDBDataSet;
     xLstEficiencia: TFIBDataSetRO;
     DSxLstEficiencia: TDataSource;
     xLstInformeID_ORDEN: TIntegerField;
     xLstInformeMAQUINA: TIntegerField;
     xLstInformeDESCMAQUINA: TFIBStringField;
     xLstInformeHORAS_PRODUCTIVAS: TFloatField;
     xLstInformeHORAS_NO_PRODUCTIVAS: TFloatField;
     xLstInformeUNIDADES_FABRICADAS: TFloatField;
     xLstInformeUNIDADES_DEFECTUOSAS: TFloatField;
     xLstInformeHORAS_TRABAJADAS: TFloatField;
     xLstEficienciaFECHA_DET: TDateTimeField;
     xLstEficienciaID_ORDEN: TIntegerField;
     xLstEficienciaMAQUINA: TIntegerField;
     xLstEficienciaTIPOFASE: TFIBStringField;
     xLstEficienciaTIEMPO_DEC: TFloatField;
     xLstEficienciaHORAS_NO_PRODUCTIVAS: TFloatField;
     xLstEficienciaUNIDADES_FAB: TFloatField;
     frDBLstEficiencia: TfrDBDataSet;
     xLstEficienciaNO_PRODUCTIVA: TIntegerField;
     xLstEficienciaDESCMAQUINA: TFIBStringField;
     xLstEficienciaUNIDADES_DEFECTUOSAS: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure frInformeMarcajesGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     Comentario: string;
     FechaListado, FechaDesde, FechaHasta: TDateTime;
     MaquinaDesde, MaquinaHasta: integer;
  public
     { Public declarations }
     procedure MostrarListadoInforme(modo: integer; fecha_ini, fecha_fin: TDateTime; maquina_ini, maquina_fin: integer; AComentario: string; AFechaListado: TDateTime);
     procedure MostrarListadoEficiencia(modo: integer; fecha_ini, fecha_fin: TDateTime; maquina_ini, maquina_fin: integer; AComentario: string; AFechaListado: TDateTime);
     procedure DameMinMaxMaquina(var Min, Max: integer);
  end;

var
  ProDMLstInformeMarcajes : TProDMLstInformeMarcajes;

implementation

uses UDMMain, UFormGest, UEntorno, UUtiles,
  UFMain, UDMListados, UDameDato;

{$R *.dfm}

procedure TProDMLstInformeMarcajes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TProDMLstInformeMarcajes.MostrarListadoInforme(modo: integer; fecha_ini, fecha_fin: TDateTime; maquina_ini, maquina_fin: integer; AComentario: string; AFechaListado: TDateTime);
var
  str : string;
begin
  FechaDesde := fecha_ini;
  FechaHasta := fecha_fin;
  MaquinaDesde := maquina_ini;
  MaquinaHasta := maquina_fin;
  Comentario := AComentario;
  FechaListado := AFechaListado;

  xLstInforme.Close;
  xLstInforme.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  xLstInforme.Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
  xLstInforme.Params.ByName['canal'].AsInteger := REntorno.Canal;
  xLstInforme.Params.ByName['serie'].AsString := REntorno.Serie;
  xLstInforme.Params.ByName['fechad'].AsDateTime := fecha_ini;
  xLstInforme.Params.ByName['fechah'].AsDateTime := fecha_fin;
  xLstInforme.Params.ByName['maquinad'].AsInteger := maquina_ini;
  xLstInforme.Params.ByName['maquinah'].AsInteger := maquina_fin;
  xLstInforme.Open;

  DMListados.Imprimir(8208, modo, '', str, frInformeMarcajes, nil);
end;

procedure TProDMLstInformeMarcajes.MostrarListadoEficiencia(modo: integer; fecha_ini, fecha_fin: TDateTime; maquina_ini, maquina_fin: integer; AComentario: string; AFechaListado: TDateTime);
var
  str : string;
begin
  FechaDesde := fecha_ini;
  FechaHasta := fecha_fin;
  MaquinaDesde := maquina_ini;
  MaquinaHasta := maquina_fin;
  Comentario := AComentario;
  FechaListado := AFechaListado;

  xLstEficiencia.Close;
  xLstEficiencia.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  xLstEficiencia.Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
  xLstEficiencia.Params.ByName['canal'].AsInteger := REntorno.Canal;
  xLstEficiencia.Params.ByName['serie'].AsString := REntorno.Serie;
  xLstEficiencia.Params.ByName['fechad'].AsDateTime := fecha_ini;
  xLstEficiencia.Params.ByName['fechah'].AsDateTime := fecha_fin;
  xLstEficiencia.Params.ByName['maquinad'].AsInteger := maquina_ini;
  xLstEficiencia.Params.ByName['maquinah'].AsInteger := maquina_fin;
  xLstEficiencia.Open;

  DMListados.Imprimir(8209, modo, '', str, frInformeMarcajes, nil);
end;

procedure TProDMLstInformeMarcajes.frInformeMarcajesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'Comentario' then
     ParValue := Comentario;

  if ParName = 'FechaDoc' then
     ParValue := FechaListado;

  if ParName = 'FechaDesde' then
     ParValue := FechaDesde;

  if ParName = 'FechaHasta' then
     ParValue := FechaHasta;

  if ParName = 'MaquinaDesde' then
     ParValue := MaquinaDesde;

  if ParName = 'MaquinaHasta' then
     ParValue := MaquinaHasta;

  // Listado informe
  if ParName = 'HorasTotales' then
     ParValue := (xLstInformeHORAS_TRABAJADAS.AsFloat);

  if ParName = 'HorasNoProducidas' then
     ParValue := (xLstInformeHORAS_NO_PRODUCTIVAS.AsFloat);

  if ParName = 'HorasProducidas' then
     ParValue := (xLstInformeHORAS_PRODUCTIVAS.AsFloat);

  if ParName = 'Kilos' then
     ParValue := (xLstInformeUNIDADES_FABRICADAS.AsInteger);

  if ParName = 'KilosDeRechazo' then
     ParValue := (xLstInformeUNIDADES_DEFECTUOSAS.AsInteger);

  if ParName = 'KilosHora' then
     if (xLstInformeHORAS_PRODUCTIVAS.AsInteger <> 0) then
        ParValue := ((xLstInformeUNIDADES_FABRICADAS.AsInteger + xLstInformeUNIDADES_DEFECTUOSAS.AsInteger) / xLstInformeHORAS_PRODUCTIVAS.AsInteger)
     else
        ParValue := 0;

  if ParName = 'PorTrab' then
     if (xLstInformeHORAS_TRABAJADAS.AsFloat <> 0) then
        ParValue := ((xLstInformeHORAS_PRODUCTIVAS.AsFloat / xLstInformeHORAS_TRABAJADAS.AsFloat) * 100)
     else
        ParValue := 0;

  // Listado eficiencia
  if ParName = 'HorasNoProdEf' then
     ParValue := (xLstEficienciaHORAS_NO_PRODUCTIVAS.AsFloat / 100);

  if ParName = 'Eficiencia' then
     if (xLstInformeHORAS_TRABAJADAS.AsInteger <> 0) then
        ParValue := (xLstEficienciaUNIDADES_FAB.AsFloat / xLstEficienciaTIEMPO_DEC.AsInteger)
     else
        ParValue := 0;

  if ParName = 'DescFase' then
     ParValue := DameTituloFase(xLstEficienciaTIPOFASE.AsString);

  if ParName = 'HorasNoProd' then
     if (xLstEficienciaNO_PRODUCTIVA.AsInteger = 1) then
        ParValue := xLstEficienciaTIEMPO_DEC.AsFloat
     else
        ParValue := 0;

  if ParName = 'HorasProd' then
     if (xLstEficienciaNO_PRODUCTIVA.AsInteger = 0) then
        ParValue := xLstEficienciaTIEMPO_DEC.AsFloat
     else
        ParValue := 0;

  if ParName = 'KilosDeRechazoEf' then
     ParValue := (xLstEficienciaUNIDADES_DEFECTUOSAS.AsInteger);

end;

procedure TProDMLstInformeMarcajes.DameMinMaxMaquina(var Min, Max: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select min(codmaq), max(codmaq) from pro_maquinas_c where empresa=?empresa';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Min := FieldByName['MIN'].AsInteger;
        Max := FieldByName['MAX'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMLstInformeMarcajes.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

end.
