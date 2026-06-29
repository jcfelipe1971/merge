unit UDMRHPersona;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMRHPersona = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     DSQMRHPersona: TDataSource;
     QMRHPersona: TFIBTableSet;
     QMRHPersonaEMPRESA: TIntegerField;
     QMRHPersonaID_PERSONA: TIntegerField;
     QMRHPersonaNOMBRE: TFIBStringField;
     QMRHPersonaAPELLIDOS: TFIBStringField;
     QMRHPersonaGENERO: TFIBStringField;
     QMRHPersonaPOBLACION: TFIBStringField;
     QMRHPersonaPROVINCIA: TFIBStringField;
     QMRHPersonaTELEFONO01: TFIBStringField;
     QMRHPersonaTELEFONO02: TFIBStringField;
     QMRHPersonaEMAIL: TFIBStringField;
     QMRHPersonaTIPO_DOCUMENTO: TFIBStringField;
     QMRHPersonaNUMERO_DOCUMENTO: TFIBStringField;
     QMRHPersonaN_SEGURIDAD_SOCIAL: TFIBStringField;
     QMRHPersonaFECHA_NACIMIENTO: TDateTimeField;
     QMRHPersonaESTADO_CIVIL: TFIBStringField;
     QMRHPersonaNOTAS: TMemoField;
     QMRHPersonaFORMACION_INI: TMemoField;
     QMRHPersonaEXPERIENCIA_PROF: TMemoField;
     QMRHPersonaBAJA: TIntegerField;
     QMRHPersonaMINUSVALIA: TIntegerField;
     QMRHPersonaAPTO: TIntegerField;
     QMRHPersonaPUESTO_TRABAJO: TFIBStringField;
     QMRHPersonaFECHA_ENTREVISTA: TDateTimeField;
     QMRHPersonaENTREVISTADOR: TFIBStringField;
     QMRHPersonaCOMENTARIO: TMemoField;
     QMRHPersonaVALORACION_1: TFIBStringField;
     QMRHPersonaVALORACION_2: TFIBStringField;
     QMRHPersonaVALORACION_3: TFIBStringField;
     QMRHPersonaACEPTADO: TIntegerField;
     QMRHPersonaFECHA_ACEPTADO: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMRHPersonaBeforePost(DataSet: TDataSet);
     procedure QMRHPersonaNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure Filtrar(Concepto: string);
     procedure BusquedaCompleja;
  end;

var
  DMRHPersona : TDMRHPersona;

implementation

uses UDMMain, UFBusca, Controls, UEntorno;

{$R *.dfm}

procedure TDMRHPersona.DataModuleCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Máscaras de visualización a los campos numéricos
  with QMRHPersona do
  begin
     for i := 0 to FieldCount - 1 do
     begin
        if (Fields[i] is TFloatField) then
           TFloatField(Fields[i]).DisplayFormat := MascaraN;
        if (Fields[i] is TDateTimeField) then
           TFloatField(Fields[i]).DisplayFormat := ShortDateFormat;
     end;
  end;

  SQLBase := TStringList.Create;

  SQLBase.Add(' SELECT  * FROM VER_RH_PERSONA ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' EMPRESA = ?EMPRESA ');

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMRHPersona.SelectSQL.Text := SQLBase.Text;
  QMRHPersona.SelectSQL.Add(' ORDER BY ID_PERSONA ');

  DMMain.FiltraTabla(QMRHPersona, '100000');
end;


procedure TDMRHPersona.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMRHPersona.Filtrar(Concepto: string);
begin
  { TODO : Falta implementar }
end;

procedure TDMRHPersona.QMRHPersonaBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_RH_PERSONAS', 'ID_PERSONA');
end;


procedure TDMRHPersona.QMRHPersonaNewRecord(DataSet: TDataSet);
begin
  QMRHPersonaEMPRESA.AsInteger := REntorno.Empresa;
  QMRHPersonaFECHA_ENTREVISTA.AsDateTime := Now;
end;

procedure TDMRHPersona.BusquedaCompleja;
var
  Resultado : integer;
begin
  // Filtro
  TFBusca.Create(Self).SeleccionaBusqueda(QMRHPersona, '10000');

  with QMRHPersona do
  begin
     if (Resultado = mrAll) then
     begin
        Close;
        SelectSQL.Text := SQLBase.Text;
        SelectSQL.Add(' ORDER BY ID_PERSONA ');
        DMMain.FiltraTabla(QMRHPersona, '100000');
     end;
  end;
end;

end.
