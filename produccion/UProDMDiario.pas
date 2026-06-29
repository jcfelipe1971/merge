unit UProDMDiario;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO;

type
  TProDMDiario = class(TDataModule)
     QMProDetMarca: TFIBTableSet;
     DSQMProDetMarca: TDataSource;
     TLocal: THYTransaction;
     DSxRecurso: TDataSource;
     xRecurso: TFIBDataSetRO;
     xRecursoTITULO: TFIBStringField;
     xTituloFase: TFIBDataSetRO;
     xTarea: TFIBDataSetRO;
     DSxTarea: TDataSource;
     DSxTituloFase: TDataSource;
     QMProDetMarcaDescripFase: TStringField;
     QMProDetMarcaDescripTarea: TStringField;
     QMProDetMarcaDescripRec: TStringField;
     QMProDetMarcaT: TFIBTableSet;
     DSQMProDetMarcaT: TDataSource;
     QMProDetMarcaTTIMPORTE: TFloatField;
     QMProDetMarcaTTTIEMPO: TFloatField;
     QMProDetMarcaEMPRESA: TIntegerField;
     QMProDetMarcaEJERCICIO: TIntegerField;
     QMProDetMarcaCANAL: TIntegerField;
     QMProDetMarcaSERIE: TFIBStringField;
     QMProDetMarcaTIPO: TFIBStringField;
     QMProDetMarcaRIG: TIntegerField;
     QMProDetMarcaOPERARIO: TIntegerField;
     QMProDetMarcaMAQUINA: TIntegerField;
     QMProDetMarcaPROVEEDOR: TIntegerField;
     QMProDetMarcaVARIOS: TFIBStringField;
     QMProDetMarcaFECHA: TDateTimeField;
     QMProDetMarcaTIEMPO_TOT: TFloatField;
     QMProDetMarcaRIG_OFF: TIntegerField;
     QMProDetMarcaLINEA: TIntegerField;
     QMProDetMarcaRIG_OF: TIntegerField;
     QMProDetMarcaSUBORDEN: TIntegerField;
     QMProDetMarcaLINEA_FASE: TIntegerField;
     QMProDetMarcaLINEA_TAREA: TIntegerField;
     QMProDetMarcaFECHA_PREV: TDateTimeField;
     QMProDetMarcaFECHA_REAL: TDateTimeField;
     QMProDetMarcaNUM_REF_SAL: TIntegerField;
     QMProDetMarcaHORA_INICIO: TFloatField;
     QMProDetMarcaHORA_FIN: TFloatField;
     QMProDetMarcaTIEMPO: TFloatField;
     QMProDetMarcaRECURSO: TFIBStringField;
     QMProDetMarcaPRECIO_RECURSO: TFloatField;
     QMProDetMarcaTIPO_RECURSO: TFIBStringField;
     QMProDetMarcaUNIDADES_FAB: TFloatField;
     QMProDetMarcaESTADO: TIntegerField;
     QMProDetMarcaNOTAS: TMemoField;
     QMProDetMarcaTOTAL_RECURSO: TFloatField;
     QMProDetMarcaIDTAREA: TIntegerField;
     QMProDetMarcaIMPUTACION: TFIBStringField;
     QMProDetMarcaTIEMPO_DEC: TFloatField;
     QMProDetMarcaTIPOFASE: TFIBStringField;
     QMProDetMarcaTIPOTAREA: TFIBStringField;
     QMProDetMarcaNUEVA_TAREA: TIntegerField;
     QMProDetMarcaENTRADA: TIntegerField;
     QMProDetMarcaEMPLEADO: TIntegerField;
     QMProDetMarcaTERCERO: TIntegerField;
     QMProDetMarcaTTUNDS: TFloatField;
     QMProDetMarcaNOMBRE_R_SOCIAL: TFIBStringField;
     xMaquina: TFIBDataSetRO;
     DSxMaquina: TDataSource;
     xMaquinaDESCRIPCION: TFIBStringField;
     xTExt: TFIBDataSetRO;
     DSTExt: TDataSource;
     xVarios: TFIBDataSetRO;
     DSxVarios: TDataSource;
     xTExtTITULO: TFIBStringField;
     xVariosTITULO: TFIBStringField;
     QMProDetMarcaDESC_MAQUINA: TFIBStringField;
     QMProDetMarcaDESC_TE: TFIBStringField;
     QMProDetMarcaDESC_VARIOS: TFIBStringField;
     xOperario: TFIBDataSetRO;
     DSxOperario: TDataSource;
     xOperarioTITULO: TFIBStringField;
     xTituloFaseTITULO: TFIBStringField;
     xTareaTITULO: TFIBStringField;
     QMProDetMarcaID_ORDEN: TIntegerField;
     xTituloCompuesto: TFIBDataSetRO;
     DSxTituloCompuesto: TDataSource;
     xTituloCompuestoTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProDetMarcaDescripFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetMarcaDescripRecGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure TransformaHoras(Sender: TField; var Text: string; DisplayText: boolean);
     procedure EscribeHora(Sender: TField; const Text: string);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMDiario : TProDMDiario;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.dfm}

procedure TProDMDiario.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProDetMarca.Close;
  QMProDetMarcaT.Close;
  xRecurso.Close;

  QMProDetMarca.Open;
  QMProDetMarcaHORA_INICIO.DisplayFormat := '00:00'; //MascaraI; //##:##
  QMProDetMarcaHORA_FIN.DisplayFormat := '00:00'; //MascaraI; //##:##
  QMProDetMarcaTIEMPO.DisplayFormat := '00:00'; //MascaraI; //##:##
end;

// en el evento 'GETEXT'
procedure TProDMDiario.TransformaHoras(Sender: TField; var Text: string; DisplayText: boolean);
var
  StrAux : string;
  StrHora : string;
begin
  //SFG.ALBERT - Desactivat perque no li trobo la funcionalitat
  //Aquest event anava al gettext de HORA_INICIO,HORA_FIN,TIEMPO

  //transforma de float a hora
  StrHora := FloatToStrF(Sender.AsFloat, ffNumber, 4, 2);
  StrAux := Copy(StrHora, 1, Pos(',', StrHora) - 1);
  StrAux := StrAux + ':' + Copy(StrHora, Pos(',', StrHora) + 1, 2);
  Text := StrAux;
end;

// en el evento 'SETEXT'
procedure TProDMDiario.EscribeHora(Sender: TField; const Text: string);
var
  StrAux : string;
begin
  //SFG.ALBERT - Desactivat perque no li trobo la funcionalitat
  //Aquest event anava al settext de HORA_INICIO,HORA_FIN,TIEMPO

  //transforma de float a hora
  StrAux := Text;
  StrAux[Pos(':', Text)] := ',';
  Sender.AsFloat := StrToFloat(StrAux);
end;

procedure TProDMDiario.QMProDetMarcaDescripFaseGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTituloFase do
  begin
     Close;
     Open;
  end;
  Text := xTituloFaseTitulo.Value;
end;

procedure TProDMDiario.QMProDetMarcaDescripTareaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xTarea do
  begin
     Close;
     Open;
  end;
  Text := xTareaTitulo.Value;
end;

procedure TProDMDiario.QMProDetMarcaDescripRecGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xRecurso do
  begin
     Close;
     Open;
  end;
  Text := xRecursoTitulo.Value;
end;

procedure TProDMDiario.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMDiario.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProDetMarca, '11110');
end;

end.
