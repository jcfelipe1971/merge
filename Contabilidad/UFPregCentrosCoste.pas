unit UFPregCentrosCoste;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, StdCtrls, Mask, rxToolEdit, ExtCtrls, ActnList,
  ComCtrls, ToolWin, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FR_Class, Fr_HYReport, FIBDataSet, FR_DSet, FR_DBSet, DateUtils,
  ULFLabel, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  HYFIBQuery, ULFEdit, ULFDateEdit, ULFComboBox, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregCentrosCoste = class(TFPEditListadoSimple)
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LNivel: TLFLabel;
     LDigito: TLFLabel;
     CBDigito: TLFComboBox;
     CBNivel: TLFComboBox;
     DEDFecha: TLFDateEdit;
     DEHFecha: TLFDateEdit;
     frCentroCoste: TfrHYReport;
     TLocal: THYTransaction;
     QListado2: TFIBDataSetRO;
     DSListado: TDataSource;
     TButtConfiguracionRapida: TToolButton;
     QListado: TFIBDataSetRO;
     DSListado2: TDataSource;
     AConfiguracionRapida: TAction;
     frDBListado: TfrDBDataSet;
     frDBListado2: TfrDBDataSet;
     QListado2ENTRADA: TIntegerField;
     QListado2EMPRESA: TIntegerField;
     QListado2EJERCICIO: TIntegerField;
     QListado2CANAL: TIntegerField;
     QListado2CUENTA: TFIBStringField;
     QListado2NIVEL: TIntegerField;
     QListado2NUM_DIGITO: TIntegerField;
     QListado2D1: TFIBStringField;
     QListado2I1: TFloatField;
     QListado2D2: TFIBStringField;
     QListado2I2: TFloatField;
     QListado2D3: TFIBStringField;
     QListado2I3: TFloatField;
     QListado2D4: TFIBStringField;
     QListado2I4: TFloatField;
     QListado2D5: TFIBStringField;
     QListado2I5: TFloatField;
     QListado2D6: TFIBStringField;
     QListado2I6: TFloatField;
     QListado2D7: TFIBStringField;
     QListado2I7: TFloatField;
     QListado2D8: TFIBStringField;
     QListado2I8: TFloatField;
     QListado2D9: TFIBStringField;
     QListado2I9: TFloatField;
     QListado2D10: TFIBStringField;
     QListado2I10: TFloatField;
     QListado2D11: TFIBStringField;
     QListado2I11: TFloatField;
     QListado2D12: TFIBStringField;
     QListado2I12: TFloatField;
     QListado2D13: TFIBStringField;
     QListado2I13: TFloatField;
     QListado2D14: TFIBStringField;
     QListado2I14: TFloatField;
     QListado2D15: TFIBStringField;
     QListado2I15: TFloatField;
     QListado2D16: TFIBStringField;
     QListado2I16: TFloatField;
     QListado2D17: TFIBStringField;
     QListado2I17: TFloatField;
     QListado2D18: TFIBStringField;
     QListado2I18: TFloatField;
     QListado2D19: TFIBStringField;
     QListado2I19: TFloatField;
     QListado2D20: TFIBStringField;
     QListado2I20: TFloatField;
     QListado2D21: TFIBStringField;
     QListado2I21: TFloatField;
     QListado2D22: TFIBStringField;
     QListado2I22: TFloatField;
     QListado2D23: TFIBStringField;
     QListado2I23: TFloatField;
     QListado2D24: TFIBStringField;
     QListado2I24: TFloatField;
     QListado2D25: TFIBStringField;
     QListado2I25: TFloatField;
     QListado2D26: TFIBStringField;
     QListado2I26: TFloatField;
     QListado2D27: TFIBStringField;
     QListado2I27: TFloatField;
     QListado2D28: TFIBStringField;
     QListado2I28: TFloatField;
     QListado2D29: TFIBStringField;
     QListado2I29: TFloatField;
     QListado2D30: TFIBStringField;
     QListado2I30: TFloatField;
     LDesdeCanal: TLFLabel;
     LHastaCanal: TLFLabel;
     EDesdeCanal: TLFEdit;
     EHastaCanal: TLFEdit;
     procedure ARecargarExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure frCentroCosteGetValue(const ParName: string; var ParValue: variant);
     procedure AConfiguracionRapidaExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
     //Digitos : TStringList;
  public
     { Public declarations }
  end;

var
  FPregCentrosCoste : TFPregCentrosCoste;

implementation

uses UDMMain, UEntorno, UDMListados, UFMListConfig, UFormGest;

{$R *.dfm}

procedure TFPregCentrosCoste.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMListados, DMListados);
  ARecargar.Execute;
end;

procedure TFPregCentrosCoste.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMListados);
end;

procedure TFPregCentrosCoste.ARecargarExecute(Sender: TObject);
begin
  inherited;
  DEDFecha.Date := EncodeDate(REntorno.Ejercicio, 01, 01);
  DEHFecha.Date := EncodeDate(REntorno.Ejercicio, 12, 31);
  CBNivel.Text := '5';
  CBDigito.Text := '1';
  EDesdeCanal.Text := REntorno.CanalStr;
  EHastaCanal.Text := REntorno.CanalStr;
end;

procedure TFPregCentrosCoste.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFPregCentrosCoste.AImprimirExecute(Sender: TObject);
var
  str : string;
  Q : THYFIBQuery;
begin
  inherited;
  DMListados.Cargar(5510, '');
  //Digitos := TStringList.Create;
  DEHFecha.Date := EncodeDateTime(YearOf(DEHFecha.Date), MonthOf(DEHFecha.Date), DayOf(DEHFecha.Date), 23, 59, 59, 999);
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'execute procedure lst_centro_coste (?entrada,?empresa,?ejercicio,?dcanal,?hcanal,?dfecha,?hfecha)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['DCANAL'].AsInteger := StrToInt(EDesdeCanal.Text);
        Params.ByName['HCANAL'].AsInteger := StrToInt(EHastaCanal.Text);
        Params.ByName['DFEHCA'].AsDateTime := DEDFecha.Date;
        Params.ByName['HFECHA'].AsDateTime := DEHFecha.Date;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  QListado2.SelectSQL.Text := 'SELECT * FROM TMP_CENTROS_COSTE_2 WHERE ENTRADA=?entrada and nivel=?nivel and num_digito=?num_digito and canal=?canal order by cuenta';
  QListado2.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
  QListado2.Params.ByName['NIVEL'].AsInteger := StrToInt(CBNivel.Text);
  QListado2.Params.ByName['NUM_DIGITO'].AsInteger := StrToInt(CBDigito.Text);
  QListado2.Params.ByName['CANAL'].AsInteger := REntorno.Canal; {StrToInt(CBCanal.Text)}
  QListado2.Open;

  frCentroCoste.LoadFromFIB(REntorno.Formato, str);
  frCentroCoste.PrepareReport;
  frCentroCoste.PrintPreparedReport('', REntorno.Copias);
  DMListados.LimpiaEntorno;
end;

procedure TFPregCentrosCoste.APrevExecute(Sender: TObject);
var
  str : string;
  Q : THYFIBQuery;
begin
  inherited;
  DMListados.Cargar(5510, '');
  //Digitos := TStringList.Create;
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'execute procedure lst_centro_coste (?entrada,?empresa,?ejercicio,?dcanal,?hcanal,?dfecha,?hfecha)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['DCANAL'].AsInteger := StrToInt(EDesdeCanal.Text);
        Params.ByName['HCANAL'].AsInteger := StrToInt(EHastaCanal.Text);
        Params.ByName['DFEChA'].AsDateTime := DEDFecha.Date;
        Params.ByName['HFECHA'].AsDateTime := DEHFecha.Date;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  if (not QListado2.Transaction.InTransaction) then
     QListado2.Transaction.StartTransaction;
  QListado2.SelectSQL.Text := 'SELECT * FROM TMP_CENTROS_COSTE_2 WHERE ENTRADA=?entrada and nivel=?nivel and num_digito=?num_digito and canal=?canal order by cuenta';
  QListado2.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
  QListado2.Params.ByName['NIVEL'].AsInteger := StrToInt(CBNivel.Text);
  QListado2.Params.ByName['NUM_DIGITO'].AsInteger := StrToInt(CBDigito.Text);
  QListado2.Params.ByName['CANAL'].AsInteger := REntorno.Canal; {StrToInt(CBCanal.Text)}
  QListado2.Open;

  frCentroCoste.LoadFromFIB(REntorno.Formato, str);
  frCentroCoste.PrepareReport;
  frCentroCoste.ShowPreparedReport;
  DMListados.LimpiaEntorno;
  QListado2.Transaction.Commit;
end;


procedure TFPregCentrosCoste.frCentroCosteGetValue(const ParName: string; var ParValue: variant);
begin
  inherited;
  DMListados.GetValue(ParName, ParValue);
  if (ParName = '') then
     ParValue := '';
end;

procedure TFPregCentrosCoste.AConfiguracionRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(5510, formato, cabecera, copias,
     pijama, '', frCentroCoste);
end;


end.
