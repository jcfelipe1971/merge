unit UProDMTareasManu;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO;

type
  TProDMTareasManu = class(TDataModule)
     QMProTareasManu: TFIBTableSet;
     DSQMProTareasManu: TDataSource;
     TLocal: THYTransaction;
     QMProTareasManuID_RECURSO: TFIBStringField;
     QMProTareasManuTIEMPO: TIntegerField;
     QMProTareasManuID_TIPO_TAREA_MAN: TFIBStringField;
     QMProTareasManuID_TAREA_MAN: TFIBStringField;
     xRecursos: TFIBDataSetRO;
     DSxRecursos: TDataSource;
     xRecursosRECURSO: TFIBStringField;
     xRecursosTITULO: TFIBStringField;
     xTipoTareaMan: TFIBDataSetRO;
     DSxTipoTareaMan: TDataSource;
     xTipoTareaManID_TIPO_TAREA_MANU: TFIBStringField;
     xTipoTareaManTITULO: TFIBStringField;
     QMProTareasManuTime: TStringField;
     procedure ProDMTareasManuCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMProTareasManuID_RECURSOChange(Sender: TField);
     procedure QMProTareasManuID_TIPO_TAREA_MANChange(Sender: TField);
     procedure QMProTareasManuBeforePost(DataSet: TDataSet);
     procedure QMProTareasManuAfterScroll(DataSet: TDataSet);
     procedure QMProTareasManuTimeChange(Sender: TField);
     procedure QMProTareasManuAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProDMTareasManu : TProDMTareasManu;

implementation

uses UDMMain, UEntorno, uFBusca, UProFMTareasManu;

{$R *.dfm}

procedure TProDMTareasManu.ProDMTareasManuCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMProTareasManu.Open;
end;

procedure TProDMTareasManu.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMTareasManu.QMProTareasManuID_RECURSOChange(Sender: TField);
begin
  xRecursos.Close;
  xRecursos.Open;
end;

procedure TProDMTareasManu.QMProTareasManuID_TIPO_TAREA_MANChange(Sender: TField);
begin
  xTipoTareaMan.Close;
  xTipoTareaMan.Open;
end;

procedure TProDMTareasManu.QMProTareasManuBeforePost(DataSet: TDataSet);
var
  Horas, Minutos, Segundos : string;
begin
  if Trim(QMProTareasManuID_TAREA_MAN.AsString) = '' then
  begin
     ProFMTareasManu.DBETarea.SetFocus;
     raise Exception.Create(_('Debe Introducir el Código de Tarea.'));
  end;
  Horas := ProFMTareasManu.LFEHoras.Text; // Copy(QMProTareasManuTime.AsString,0,3);
  Minutos := ProFMTareasManu.LFEMinutos.Text; // Copy(QMProTareasManuTime.AsString,5,2);
  Segundos := ProFmTareasManu.LFESegundos.Text; // Copy(QMProTareasManuTime.AsString,8,2);
  QMProTareasManuTIEMPO.AsInteger := StrToInt(Segundos) + StrToInt(Minutos) * 60 + StrToInt(Horas) * 3600;
end;

procedure TProDMTareasManu.QMProTareasManuAfterScroll(DataSet: TDataSet);
var
  TotSegundos, Horas, Minutos, Segundos : integer;
  Resto : integer; //Double;
begin
  TotSegundos := QMProTareasManuTIEMPO.AsInteger;
  Horas := TotSegundos div 3600;
  Resto := TotSegundos mod 3600;
  Minutos := Resto div 60;
  Resto := Resto mod 60;
  Segundos := Resto;
  with ProFMTareasManu do
  begin
     // LFEHoras.Text := Lrell(IntToStr(Horas), 3, '0');
     // LFEMinutos.Text := LRell(IntToStr(Minutos), 2, '0');
     // LFESegundos.Text := LRell(IntToStr(Segundos), 2, '0');
     LFEHoras.Text := Format('%.3d', [Horas]);
     LFEMinutos.Text := Format('%.2d', [Minutos]);
     LFESegundos.Text := Format('%.2d', [Segundos]);
  end;
  // QMProTareasManuTime.Text := Lrell(IntToStr(Horas), 3, '0') + ':' + LRell(IntToStr(Minutos), 2, '0') + ':' + LRell(IntToStr(Segundos), 2, '0');
  QMProTareasManuTime.Text := Format('%.3d:%.2d:%.2d', [Horas, Minutos, Segundos]);
end;

procedure TProDMTareasManu.QMProTareasManuTimeChange(Sender: TField);
begin
  ProFMTareasManu.MaskEdit1.Text := Sender.Text;
end;

procedure TProDMTareasManu.QMProTareasManuAfterOpen(DataSet: TDataSet);
begin
  xRecursos.Open;
  xTipoTareaMan.Open;
end;

end.
