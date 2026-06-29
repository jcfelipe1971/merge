unit UProDMConfigRecMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TProDMConfigRecMarcajes = class(TDataModule)
     QMConfigCabMarca: TFIBTableSet;
     TLocal: THYTransaction;
     DSConfigCabMarca: TDataSource;
     QMTablasBDD: TFIBDataSetRO;
     DSTablasBdd: TDataSource;
     DSCamposBdd: TDataSource;
     QMCamposBDD: TFIBDataSetRO;
     QMTablasBDDRELACION: TFIBStringField;
     QMCamposBDDRELACION: TFIBStringField;
     QMCamposBDDCAMPO: TFIBStringField;
     QMConfigCabMarcaEMPRESA: TIntegerField;
     QMConfigCabMarcaRIG: TIntegerField;
     QMConfigCabMarcaDESCRIPCION: TFIBStringField;
     QMConfigCabMarcaNOTES: TMemoField;
     QMConfigCabMarcaFECHA: TDateTimeField;
     QMConfigDetMarca: TFIBTableSet;
     DSConfigDetMarca: TDataSource;
     QMConfigDetMarcaEMPRESA: TIntegerField;
     QMConfigDetMarcaRIG: TIntegerField;
     QMConfigDetMarcaLINEA: TIntegerField;
     QMConfigDetMarcaORDEN: TIntegerField;
     QMConfigDetMarcaCAMPO: TFIBStringField;
     QMConfigDetMarcaLONG_INI: TIntegerField;
     QMConfigDetMarcaLONG_FIN: TIntegerField;
     QMConfigDetMarcaTABLA_FISICA: TFIBStringField;
     QMConfigDetMarcaCAMPO_FISICO: TFIBStringField;
     QLinea: THYFIBQuery;
     QMConfigCabMarcaRUTA: TFIBStringField;
     QMConfigDetMarcaTIPOMARC: TFIBStringField;
     QMConfigCabMarcaRUTAINC: TFIBStringField;
     QMConfigCabMarcaRUTADEST: TFIBStringField;
     QMConfigCabMarcaTIPOMARCAJE: TIntegerField;
     QDicCampo: TFIBTableSet;
     QDicCampoRELACION: TFIBStringField;
     QDicCampoCAMPO: TFIBStringField;
     QDicCampoORDEN: TIntegerField;
     QDicCampoORIGEN: TFIBStringField;
     QDicCampoTIPO: TIntegerField;
     QDicCampoNOTAS: TBlobField;
     QDicCampoDEFECTO: TBlobField;
     QDicCampoTITULO: TFIBStringField;
     QDicCampoVISIBLE: TIntegerField;
     QDicCampoIDIOMA: TFIBStringField;
     QDicCampoTEXTO: TIntegerField;
     QDicCampoORDEN_BUSCADOR: TIntegerField;
     DSQDicCampo: TDataSource;
     QDicCampoTIPO_TEXTO: TStringField;
     QMConfigCabMarcaRUTACONFIG: TFIBStringField;
     QMConfigCabMarcaTIPORECURSO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMConfigDetMarcaNewRecord(DataSet: TDataSet);
     procedure QMConfigCabMarcaNewRecord(DataSet: TDataSet);
     procedure QMConfigDetMarcaBeforeInsert(DataSet: TDataSet);
     procedure QMConfigDetMarcaTABLA_FISICAChange(Sender: TField);
     procedure QDicCampoCalcFields(DataSet: TDataSet);
     procedure QMConfigCabMarcaAfterOpen(DataSet: TDataSet);
     procedure QMConfigDetMarcaAfterScroll(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     FormConfig: boolean;
     procedure InsertarTablas;
     procedure InsertarCampos;
     procedure ExportarConfig;
     procedure BusquedaCompleja;
  end;

var
  ProDMConfigRecMarcajes : TProDMConfigRecMarcajes;

implementation

uses UDMMain, UEntorno, UProFMConfigRecMarcajes, Forms, UFBusca, UUtiles;

{$R *.dfm}

procedure TProDMConfigRecMarcajes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  FormConfig := False;

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMConfigCabMarca, '10000');
end;

procedure TProDMConfigRecMarcajes.QMConfigDetMarcaNewRecord(DataSet: TDataSet);
begin
  QMConfigDetMarcaEMPRESA.AsInteger := REntorno.Empresa;
  QMConfigDetMarcaRIG.AsInteger := QMConfigCabMarcaRIG.AsInteger;
  QMConfigDetMarcaTIPOMARC.AsString := QMConfigCabMarcaTIPORECURSO.AsString;
  // Busco el número de línea
  with QLinea do
  begin
     Params.ByName['empresa'].AsInteger := REntorno.empresa;
     Params.ByName['rig'].AsInteger := QMConfigCabMarcaRIG.AsInteger;
     ExecQuery;
  end;
  QMConfigDetMarcaLINEA.AsInteger := QLinea.FieldByName['NLinea'].AsInteger + 1;
end;

procedure TProDMConfigRecMarcajes.QMConfigCabMarcaNewRecord(DataSet: TDataSet);
begin
  QMConfigCabMarcaEMPRESA.AsInteger := REntorno.Empresa;
  QMConfigCabMarcaRIG.AsInteger := QMconfigCabMarca.RecordCount + 1;
end;

procedure TProDMConfigRecMarcajes.QMConfigDetMarcaBeforeInsert(DataSet: TDataSet);
begin
  QMConfigDetMarca.Last;
end;

procedure TProDMConfigRecMarcajes.InsertarTablas;
var
  c : integer;
begin
  // Inserto las tablas

  c := EncuentraField(ProFMConfigRecMarcajes.DBGDetall, 'TABLA_FISICA');
  if (c >= 0) then
  begin
     QMTablasBDD.Open;
     while QMTablasBDD.EOF <> True do
     begin
        // 5-TABLA_FISICA
        c := EncuentraField(ProFMConfigRecMarcajes.DBGDetall, 'TABLA_FISICA');
        ProFMConfigRecMarcajes.DBGDetall.Columns[c].PickList.Add(QMTablasBDDRELACION.AsString);
        QMTablasBDD.Next;
     end;// while
  end;
end;

procedure TProDMConfigRecMarcajes.InsertarCampos;
var
  c : integer;
begin
  // Inserto los campos

  c := EncuentraField(ProFMConfigRecMarcajes.DBGDetall, 'CAMPO_FISICO');
  if (c >= 0) then
  begin
     QMCamposBDD.Close;
     QMCamposBDD.Params.ByName['TAULA'].AsString := QMConfigDetMarcaTABLA_FISICA.AsString;
     QMCamposBDD.Open;
     QMCamposBDD.First;

     // 6-CAMPO_FISICO
     ProFMConfigRecMarcajes.DBGDetall.Columns[c].PickList.Clear;
     while QMCamposBDD.EOF <> True do
     begin
        ProFMConfigRecMarcajes.DBGDetall.Columns[c].PickList.Add(QMCamposBDDCAMPO.AsString);
        QMCamposBDD.Next;
     end;
  end;
end;

procedure TProDMConfigRecMarcajes.QMConfigDetMarcaTABLA_FISICAChange(Sender: TField);
begin
  InsertarCampos;
end;

procedure TProDMConfigRecMarcajes.ExportarConfig;
var
  f : Text;
  VarInt : integer;
begin
  AssignFile(f, QMConfigCabMarcaRUTACONFIG.AsString + '\Config' + QMConfigCabMarcaRIG.AsString + '.txt');
  Rewrite(f);

  {
  Da error si guardamos directamente
  WriteLn(QMConfigCabMarcaDESCRIPCION.AsString);
  WriteLn('marcajes'+QMConfigCabMarcaRIG.AsString+'.spe');
  WriteLn(QMConfigCabMarcaTIPORECURSO.AsString);
  }
  Write(f, QMConfigCabMarcaDESCRIPCION.AsString);
  WriteLn(f);
  Write(f, 'marcajes' + QMConfigCabMarcaRIG.AsString + '.spe');
  WriteLn(f);
  Write(f, QMConfigCabMarcaTIPORECURSO.AsString);
  WriteLn(f);

  QDicCampo.Close;
  QDicCampo.Open;

  with QMConfigDetMarca do
  begin
     First;
     while not EOF do
     begin
        Write(f, QMConfigDetMarcaORDEN.AsString + '#');
        Write(f, QMConfigDetMarcaCAMPO.AsString + '#');
        VarInt := QMConfigDetMarcaLONG_FIN.AsInteger - QMConfigDetMarcaLONG_INI.AsInteger + 1;
        if QMConfigDetMarcaLONG_INI.AsInteger = 0 then
           Dec(VarInt);
        Write(f, IntToStr(VarInt) + '#' + QDicCampoTIPO_TEXTO.AsString + '#');
        WriteLn(f);
        Next;
     end;
     First;
  end;
  CloseFile(f);
end;

procedure TProDMConfigRecMarcajes.QDicCampoCalcFields(DataSet: TDataSet);
begin
  case QDicCampoTIPO.AsInteger of
     7: if (Trim(QDicCampoORIGEN.AsString) = 'LOGICO') then
           QDicCampoTIPO_TEXTO.AsString := 'L' // LOGICO
        else
           QDicCampoTIPO_TEXTO.AsString := 'N'; // 'SMALLINT'

     8: QDicCampoTIPO_TEXTO.AsString := 'N';  // 'INTEGER'

     10: if (Trim(QDicCampoORIGEN.AsString) = 'HORA') then
           QDicCampoTIPO_TEXTO.AsString := 'H' // 'FLOAT'
        else
           QDicCampoTIPO_TEXTO.AsString := 'N';

     14: QDicCampoTIPO_TEXTO.AsString := 'S'; // 'CHAR'

     27: QDicCampoTIPO_TEXTO.AsString := 'N'; // 'DOUBLE'

     35: QDicCampoTIPO_TEXTO.AsString := 'D'; // 'DATE'

     37: QDicCampoTIPO_TEXTO.AsString := 'S'; // 'VARCHAR'
     else
        QDicCampoTIPO_TEXTO.AsString := '?';
  end;
end;

procedure TProDMConfigRecMarcajes.QMConfigCabMarcaAfterOpen(DataSet: TDataSet);
begin
  QMConfigDetMarca.Open;
end;

procedure TProDMConfigRecMarcajes.QMConfigDetMarcaAfterScroll(DataSet: TDataSet);
begin
  if FormConfig then
     InsertarCampos;
end;

procedure TProDMConfigRecMarcajes.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMConfigRecMarcajes.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMConfigCabMarca, '00000');
end;

end.
