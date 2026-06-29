unit UProDMLstEscandalloImg;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBQuery,
  HYFIBQuery;

type
  TProDMLstEscandalloImg = class(TDataModule)
     xEscandalloD: TFIBDataSetRO;
     DSEscandalloD: TDataSource;
     TLocal: THYTransaction;
     xEscandalloH: TFIBDataSetRO;
     DSEscandalloH: TDataSource;
     xEscandalloHCOMPUESTO: TFIBStringField;
     xEscandalloDCOMPUESTO: TFIBStringField;
     xMinEscandalloD: TFIBDataSetRO;
     DSxMaxEscandalloD: TDataSource;
     xMaxEscandalloH: TFIBDataSetRO;
     DSxMaxEscandalloH: TDataSource;
     xMaxEscandalloHMAX_H: TIntegerField;
     xMinEscandalloDMIN_D: TIntegerField;
     frDBEscandallos: TfrDBDataSet;
     frListadoEscImg: TfrHYReport;
     QMLstEscandallos: TFIBDataSetRO;
     QMLstEscandallosESCANDALLO: TIntegerField;
     QMLstEscandallosCOMPUESTO: TFIBStringField;
     QMLstEscandallosUNIDAD: TFIBStringField;
     QMLstEscandallosUNIDADES: TFloatField;
     QMLstEscandallosMEDIDA_1: TFloatField;
     QMLstEscandallosMEDIDA_2: TFloatField;
     QMLstEscandallosMEDIDA_3: TFloatField;
     QMLstEscandallosCOSTE_FIJO: TFloatField;
     QMLstEscandallosCOSTE_MOBRA: TFloatField;
     QMLstEscandallosCOSTE_MATER: TFloatField;
     QMLstEscandallosCOSTE_MAQUI: TFloatField;
     QMLstEscandallosCOSTE_TEXTE: TFloatField;
     QMLstEscandallosCOSTE_VAR: TFloatField;
     QMLstEscandallosCOSTE_TOTAL: TFloatField;
     QMLstEscandallosESTADO: TIntegerField;
     QMLstEscandallosNOTAS: TMemoField;
     QMLstEscandallosDIBUJO: TMemoField;
     QMLstEscandallosFECHA_CREAC: TDateTimeField;
     QMLstEscandallosTITULO: TFIBStringField;
     QMLstEscandallosTIPO: TFIBStringField;
     DSLstEscandallos: TDataSource;
     QueryTemp: THYFIBQuery;
     QGeneral: THYFIBQuery;
     QMLstDibEsc: TFIBDataSetRO;
     QMLstDibEscID_IMAGEN: TIntegerField;
     DSLstDibEscs: TDataSource;
     frDBDibEsc: TfrDBDataSet;
     QMLstEscandallosEMPRESA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoEscImgGetValue(const ParName: string; var ParValue: variant);
     procedure frListadoEscImgEnterRect(Memo: TStringList; View: TfrView);
     procedure QMLstEscandallosAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     Tipo_Esc: string;
     Comentario: string;
     FechaListado: TDateTime;
     TFiltro: string;
     procedure CambiaEscandalloD(Escandallo: integer);
     procedure CambiaEscandalloH(Escandallo: integer);
     procedure Recargar;
     procedure MostrarListado(modo: integer; escandallo_ini, escandallo_fin: integer; TipoEsc: string);
  end;

var
  ProDMLstEscandalloImg : TProDMLstEscandalloImg;

implementation

uses UDMListados, UDMMain, UEntorno, UFormGest;

{$R *.dfm}

procedure TProDMLstEscandalloImg.CambiaEscandalloD(Escandallo: integer);
begin
  with xEscandalloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Escandallo'].AsInteger := Escandallo;
     Params.ByName['Tipo'].AsString := Tipo_Esc;
     Open;
  end;
end;

procedure TProDMLstEscandalloImg.CambiaEscandalloH(Escandallo: integer);
begin
  with xEscandalloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Escandallo'].AsInteger := Escandallo;
     Params.ByName['Tipo'].AsString := Tipo_Esc;
     Open;
  end;
end;

procedure TProDMLstEscandalloImg.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMListados, DMListados);
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMLstEscandalloImg.MostrarListado(modo, escandallo_ini, escandallo_fin: integer; TipoEsc: string);
begin
  // ENLLAÇAR AMB L APRIMERA LINIA DE LA TAULA DE DIBUIXOS DEL ESCANDALL
  QMLstEscandallos.Close;
  QMLstEscandallos.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  QMLstEscandallos.Params.ByName['Escandallo_ini'].AsInteger := escandallo_ini;
  QMLstEscandallos.Params.ByName['Escandallo_fin'].AsInteger := escandallo_fin;
  QMLstEscandallos.Params.ByName['Tipo'].AsString := TipoEsc;
  QMLstEscandallos.Open;

  DMListados.Imprimir(8046, modo, '', '', frListadoEscImg, nil); // Listado escandallos
end;

procedure TProDMLstEscandalloImg.Recargar;
begin
  with xMinEscandalloD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Tipo'].AsString := Tipo_Esc;
     Open;
  end;

  with xMaxEscandalloH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Tipo'].AsString := Tipo_Esc;
     Open;
  end;
end;

procedure TProDMLstEscandalloImg.frListadoEscImgGetValue(const ParName: string; var ParValue: variant);
begin
  // CABECERA LISTADO
  if Trim(ParName) = 'Comentario' then
     ParValue := Comentario;
  if Trim(ParName) = 'FechaListado' then
     ParValue := FechaListado;
  if Trim(ParName) = 'Empresa' then
  begin
     with QGeneral do
     begin
        Close;
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        ExecQuery;
        ParValue := FieldByName['titulo'].AsString;
     end;
  end;
  if Trim(ParName) = 'TFiltro' then
     ParValue := TFiltro;

  // SUMATORIOS DE LOS TOTALES NUMÉRICOS DE ESCANDALLO (FASES, TAREAS, MATERIALES)
  if Trim(ParName) = 'TotalFases' then
  begin
     with QueryTemp do
     begin
        Close;
        SQL.Clear;
        SQL.Add('select count(*) as Suma from pro_fases_esc');
        SQL.Add('where empresa=' + IntToStr(REntorno.Empresa) +
           ' and escandallo=' + QMLstEscandallosESCANDALLO.AsString +
           ' and tipo=''' + Tipo_Esc + '''');
        ExecQuery;
        ParValue := FieldByName['Suma'].AsString;
     end;
  end;
  if Trim(ParName) = 'TotalMateriales' then
  begin
     with QueryTemp do
     begin
        Close;
        SQL.Clear;
        SQL.Add('select count(*) as Suma from pro_mat_esc');
        SQL.Add('where empresa=' + IntToStr(REntorno.Empresa) +
           ' and escandallo=' + QMLstEscandallosESCANDALLO.AsString +
           ' and tipo=''' + Tipo_Esc + '''');
        ExecQuery;
        ParValue := FieldByName['Suma'].AsString;
     end;
  end;
  if Trim(ParName) = 'TotalTareas' then
  begin
     with QueryTemp do
     begin
        Close;
        SQL.Clear;
        SQL.Add('select count(*) as Suma from pro_tarea_esc');
        SQL.Add('where empresa=' + IntToStr(REntorno.Empresa) +
           ' and escandallo=' + QMLstEscandallosESCANDALLO.AsString +
           ' and tipo=''' + Tipo_Esc + '''');
        ExecQuery;
        ParValue := FieldByName['Suma'].AsString;
     end;
  end;
end;

procedure TProDMLstEscandalloImg.frListadoEscImgEnterRect(Memo: TStringList; View: TfrView);
begin
  if (memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
     if (Memo[0] = '[ImatgeEscandall]') and (View is TfrPictureView) then
     begin
        DMListados.MostrarImagen(QMLstDibEscID_IMAGEN.AsInteger, View);
     end;
  end;
end;

procedure TProDMLstEscandalloImg.QMLstEscandallosAfterScroll(DataSet: TDataSet);
begin
  QMLstDibEsc.Close;
  QMLstDibesc.Params.ByName['Empresa'].AsInteger := QMLstEscandallosEMPRESA.AsInteger;
  QMLstDibesc.Params.ByName['escandallo'].AsInteger := QMLstEscandallosESCANDALLO.AsInteger;
  QMLstDibesc.Params.ByName['Tipo'].AsString := QMLstEscandallosTIPO.AsString;
  QMLstDibEsc.Open;
end;

end.
