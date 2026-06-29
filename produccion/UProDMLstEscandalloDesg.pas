unit UProDMLstEscandalloDesg;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, FR_Class, DB, FIBDataSet,
  FIBDatabase, UFIBModificados, FIBDataSetRO, Fr_HYReport, FIBQuery,
  HYFIBQuery, StrUtils, FIBDataSetRW, frxClass, frxHYReport;

type
  TProDMLstEscandalloDesg = class(TDataModule)
     frDBlstEscDesg: TfrDBDataSet;
     DSEscandallo: TDataSource;
     xEscandallo: TFIBDataSetRO;
     TLocal: THYTransaction;
     frListadoEG: TfrHYReport;
     QGenerarLst: TFIBDataSet;
     QGenerarLstTar: TFIBDataSet;
     frDBlstEscDesgTar: TfrDBDataSet;
     xCompuesto: TFIBDataSetRO;
     xComponente: TFIBDataSetRO;
     DSQGenerarLst: TDataSource;
     DSQGenerarLstTar: TDataSource;
     xComponenteProv: TFIBDataSetRO;
     frxListadoEG: TfrxHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoEGGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xCompuestoBeforeOpen(DataSet: TDataSet);
     procedure QGenerarLstAfterOpen(DataSet: TDataSet);
     procedure xComponenteProvBeforeOpen(DataSet: TDataSet);
     procedure QGenerarLstBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Total_Materiales: double;
     Total_Tareas_HM: double;
     Total_Tareas_MO: double;
     Total_Tareas_TE: double;
     Total_Tareas_VAR: double;
  public
     { Public declarations }
     procedure CambiaEscandallo(Escandallo: integer);
     procedure MostrarListado(Modo, Grupo, Escandallo: integer; Comentario: string; FechaListado: TDateTime);
  end;

var
  ProDMLstEscandalloDesg : TProDMLstEscandalloDesg;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest;

{$R *.dfm}

procedure TProDMLstEscandalloDesg.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TProDMLstEscandalloDesg.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMLstEscandalloDesg.CambiaEscandallo(Escandallo: integer);
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

procedure TProDMLstEscandalloDesg.MostrarListado(Modo, Grupo, Escandallo: integer; Comentario: string; FechaListado: TDateTime);
begin
  // Ejecuto el procedure y lleno la tabla TMP_LST_ESC_DESG
  with QGenerarLst do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ESCANDALLO'].AsInteger := Escandallo;
     Params.ByName['TIPO'].AsString := 'EPR';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     FetchAll;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT * FROM PRO_LST_ESC_DES_TOTALES(?ENTRADA)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Total_Materiales := FieldByName['TOTAL_MATERIALES'].AsDouble;
        Total_Tareas_HM := FieldByName['TOTAL_TAREAS_HM'].AsDouble;
        Total_Tareas_MO := FieldByName['TOTAL_TAREAS_MO'].AsDouble;
        Total_Tareas_TE := FieldByName['TOTAL_TAREAS_TE'].AsDouble;
        Total_Tareas_VAR := FieldByName['TOTAL_TAREAS_VAR'].AsDouble;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Ejecuto el procedure para listar tareas
  with QGenerarLstTar do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     FetchAll;
  end;

  DMListados.DatosInforme(FechaListado, Comentario);
  DMListados.Imprimir(Grupo, 0, Modo, '', _('Listado de escandallo desglosado'), frListadoEG, frxListadoEG, nil);
end;

procedure TProDMLstEscandalloDesg.frListadoEGGetValue(const ParName: string; var ParValue: variant);
var
  Espacios : string;
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Articulo') then
  begin
     if (QGenerarLst.FieldByName('NIVEL').AsInteger = 0) then
        ParValue := QGenerarLst.FieldByName('ARTICULO').AsString
     else
     begin
        Espacios := '';
        if (QGenerarLst.FieldByName('NIVEL').AsInteger > 0) then
           Espacios := DupeString(' ', QGenerarLst.FieldByName('NIVEL').AsInteger);
        ParValue := Espacios + QGenerarLst.FieldByName('ARTICULO').AsString;
     end;
  end;

  if (ParName = 'Total_Materiales') then
     ParValue := Total_Materiales;

  if (ParName = 'Total_Tareas_HM') then
     ParValue := Total_Tareas_HM;

  if (ParName = 'Total_Tareas_MO') then
     ParValue := Total_Tareas_MO;

  if (ParName = 'Total_Tareas_TE') then
     ParValue := Total_Tareas_TE;

  if (ParName = 'Total_Tareas_VAR') then
     ParValue := Total_Tareas_VAR;

  if (ParName = 'Total_Escandallo') then
     ParValue := Total_Materiales + Total_Tareas_HM + Total_Tareas_MO + Total_Tareas_TE + Total_Tareas_VAR;
end;

procedure TProDMLstEscandalloDesg.xCompuestoBeforeOpen(DataSet: TDataSet);
begin
  TFIBDataSetRO(DataSet).Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  TFIBDataSetRO(DataSet).Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
  TFIBDataSetRO(DataSet).Params.ByName['CANAL'].AsInteger := REntorno.Canal;
end;

procedure TProDMLstEscandalloDesg.QGenerarLstAfterOpen(DataSet: TDataSet);
begin
  xCompuesto.Open;
  xComponente.Open;
  xComponenteProv.Open;
end;

procedure TProDMLstEscandalloDesg.xComponenteProvBeforeOpen(DataSet: TDataSet);
begin
  TFIBDataSetRO(DataSet).Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
end;

procedure TProDMLstEscandalloDesg.QGenerarLstBeforeClose(DataSet: TDataSet);
begin
  xCompuesto.Close;
  xComponente.Close;
  xComponenteProv.Close;
end;

end.
