unit UProDMLstNecesidadesEsc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, FR_Class, DB, FIBDataSet,
  FIBDatabase, UFIBModificados, FIBDataSetRO, Fr_HYReport, FIBQuery,
  HYFIBQuery, StrUtils, FIBDataSetRW;

type
  TProDMLstNecesidadesEsc = class(TDataModule)
     frDBlstNecesidades: TfrDBDataSet;
     xCompuesto: TFIBDataSetRO;
     DSCompuesto: TDataSource;
     DSEscandallo: TDataSource;
     xEscandallo: TFIBDataSetRO;
     TLocal: THYTransaction;
     xCompuestoTITULO: TFIBStringField;
     frListadoN: TfrHYReport;
     QGenerarLst: TFIBDataSetRW;
     xEscandalloCOMPUESTO: TFIBStringField;
     xEscandalloEMPRESA: TIntegerField;
     xEscandalloTIPO: TFIBStringField;
     xEscandalloDESCRIPCION: TFIBStringField;
     QMCodProv: TFIBDataSetRO;
     DSCodProv: TDataSource;
     DSQGenerarLst: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoNGetValue(const ParName: string; var ParValue: variant);
     procedure xEscandalloAfterOpen(DataSet: TDataSet);
     procedure xEscandalloBeforeClose(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QGenerarLstAfterOpen(DataSet: TDataSet);
     procedure QGenerarLstBeforeClose(DataSet: TDataSet);
     procedure QMCodProvBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
     Multiplicador: double;
  public
     { Public declarations }
     procedure CambiaEscandallo(Escandallo: integer);
     procedure MostrarListado(Modo, Grupo, Escandallo: integer; AlmDesde, AlmHasta: string; Comentario: string; FechaListado: TDateTime; aMultiplicador: double; Equivalencias, Subordenes, Fases, Agrupa: boolean);
  end;

var
  ProDMLstNecesidadesEsc : TProDMLstNecesidadesEsc;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest;

{$R *.dfm}

procedure TProDMLstNecesidadesEsc.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TProDMLstNecesidadesEsc.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMLstNecesidadesEsc.CambiaEscandallo(Escandallo: integer);
begin
  with xEscandallo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['TIPO'].AsString := 'EPR';
     Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
     Open;
  end;
end;

procedure TProDMLstNecesidadesEsc.MostrarListado(Modo, Grupo, Escandallo: integer; AlmDesde, AlmHasta: string; Comentario: string; FechaListado: TDateTime; aMultiplicador: double; Equivalencias, Subordenes, Fases, Agrupa: boolean);
var
  str : string;
  TipoListado : smallint;
begin
  with QGenerarLst do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM PRO_LST_NECESIDADES_LANZAR_ESC(:EMPRESA, :ESCANDALLO, :TIPO, :CANAL, :ENTRADA, :ALM_DESDE, :ALM_HASTA, :TIPO_LST, :UNIDADES, 1 /*CALCULA_STOCK*/) ');
     if (not Equivalencias) then
     begin
        if (not Subordenes) then
           SelectSQL.Add(' WHERE V_NIVEL = 0 ')  // NI SUBORDENES NI EQUIVALENCIAS
        else
           SelectSQL.Add(' WHERE V_NIVEL >= 0 '); // SUBORDENES, PERO NO EQUIVALENCIAS
     end
     else
     if (not Subordenes) then
        SelectSQL.Add(' WHERE V_NIVEL <= 0 '); // EQUIVALENCIAS, PERO NO SUBORDENES
  end;

  TipoListado := -1;
  if (Agrupa) then
     TipoListado := 1;
  if (Fases) then
     TipoListado := 2;

  Multiplicador := aMultiplicador;

  // Ejecuto el procedure y lleno la tabla tmp_lst_necesidades
  with QGenerarLst do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
     Params.ByName['TIPO'].AsString := 'EPR';
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['ALM_DESDE'].AsString := AlmDesde;
     Params.ByName['ALM_HASTA'].AsString := AlmHasta;
     Params.ByName['TIPO_LST'].AsInteger := TipoListado;
     Params.ByName['UNIDADES'].AsFloat := Multiplicador;
     Open;
  end;

  DMListados.DatosInforme(FechaListado, Comentario);
  DMListados.Imprimir(Grupo, Modo, '', str, frListadoN, nil);
end;

procedure TProDMLstNecesidadesEsc.frListadoNGetValue(const ParName: string; var ParValue: variant);
var
  Espacios : string;
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Articulo') then
  begin
     if (QGenerarLst.FieldByName('V_NIVEL').AsInteger = 0) then
        ParValue := QGenerarLst.FieldByName('V_ARTICULO').AsString
     else
     begin
        if (QGenerarLst.FieldByName('V_NIVEL').AsInteger = -1) then
           Espacios := ' ·E'
        else if (QGenerarLst.FieldByName('V_NIVEL').AsInteger = 1) then
           Espacios := DupeString(' ', QGenerarLst.FieldByName('V_NIVEL').AsInteger * 3)
        else if (QGenerarLst.FieldByName('V_NIVEL').AsInteger > 1) then
           Espacios := DupeString(' ', QGenerarLst.FieldByName('V_NIVEL').AsInteger * 4);

        ParValue := Espacios + '- ' + QGenerarLst.FieldByName('V_ARTICULO').AsString;
     end;
  end;

  if (ParName = 'Multiplicador') then
     ParValue := Multiplicador;
end;

procedure TProDMLstNecesidadesEsc.xEscandalloAfterOpen(DataSet: TDataSet);
begin
  xCompuesto.Open;
end;

procedure TProDMLstNecesidadesEsc.xEscandalloBeforeClose(DataSet: TDataSet);
begin
  xCompuesto.Close;
end;

procedure TProDMLstNecesidadesEsc.QGenerarLstAfterOpen(DataSet: TDataSet);
begin
  QMCodProv.Open;
end;

procedure TProDMLstNecesidadesEsc.QGenerarLstBeforeClose(DataSet: TDataSet);
begin
  QMCodProv.Close;
end;

procedure TProDMLstNecesidadesEsc.QMCodProvBeforeOpen(DataSet: TDataSet);
begin
  QMCodProv.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
end;

end.
