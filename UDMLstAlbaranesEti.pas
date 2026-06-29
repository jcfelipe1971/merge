unit UDMLstAlbaranesEti;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO, FIBDataSetRW,
  UHYReport, frxClass, frxDBSet, frxHYReport;

type
  TDMLstAlbaranesEti = class(TDataModule)
     frAlbaranes: TfrHYReport;
     frxAlbaranes: TfrxHYReport;
     frDBxEtiquetas: TfrDBDataSet;
     xEtiquetas: TFIBDataSetRW;
     DSxEtiquetas: TDataSource;
     TLocal: THYTransaction;
     frDBDCabecera: TfrDBDataSet;
     QMCabecera: TFIBDataSetRW;
     DSQMCabecera: TDataSource;
     HYReport: THYReport;
     HYREtiquetas: THYReportSource;
     HYRQMCabecera: THYReportSource;
     QMCartaPortes: TFIBTableSet;
     DSCartaPortes: TDataSource;
     frDBCartaPortes: TfrDBDataSet;
     HYRQMCartaPortes: THYReportSource;
     procedure DMLstAlbaranesDestroy(Sender: TObject);
     procedure DMLstAlbaranesCreate(Sender: TObject);
     procedure frAlbaranesGetValue(const ParName: string; var ParValue: variant);
     procedure frAlbaranesBeforePrint(Memo: TStringList; View: TfrView);
     procedure xEtiquetasBeforeClose(DataSet: TDataSet);
     procedure xEtiquetasAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure frxAlbaranesGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     Albaran: integer;
     Fecha_Alb: TDateTime;
     Copias: integer;
     Pagina: integer;
  public
     procedure MostrarListado(ejercicio, rig, vacias, aCopias: integer; fecha: TDateTime; Modo: byte; serie: string);
     procedure MostrarListadoMul(ejercicio, rig, vacias, aCopias: integer; fecha: TDateTime; Modo: byte; serie: string);
  end;

var
  DMLstAlbaranesEti : TDMLstAlbaranesEti;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados;

{$R *.DFM}

procedure TDMLstAlbaranesEti.DMLstAlbaranesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
end;

procedure TDMLstAlbaranesEti.DMLstAlbaranesDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstAlbaranesEti.MostrarListado(ejercicio, rig, vacias, aCopias: integer; fecha: TDateTime; Modo: byte; serie: string);
var
  str : string;
begin
  Albaran := rig;
  Fecha_Alb := fecha;
  Copias := aCopias;
  with xEtiquetas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := serie;
     Params.ByName['RIG'].AsInteger := Rig;
     Params.ByName['VACIAS'].AsInteger := vacias;
     Params.ByName['COPIAS'].AsInteger := copias;
     Params.ByName['TIPO'].AsString := 'ALB';
     Open;
  end;

  DMListados.Cargar(58, serie);

  if (REntorno.TipoListado = 'FRF') then
  begin
     frAlbaranes.LoadFromFIB(REntorno.Formato, str);
     frAlbaranes.PrepareReport;
     case Modo of
        0: frAlbaranes.ShowPreparedReport;
        1: frAlbaranes.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  if (REntorno.TipoListado = 'FR3') then
  begin
     Pagina := 0;
     frxAlbaranes.LoadFromFIB(REntorno.Formato, str);
     frxAlbaranes.PrepareReport;
     case Modo of
        0: frxAlbaranes.ShowPreparedReport;
        1: frxAlbaranes.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  if (REntorno.TipoListado = 'HYR') then
  begin
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     case Modo of
        0: HYReport.Preview;
        1: HYReport.Print(REntorno.NombreMatricial);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstAlbaranesEti.MostrarListadoMul(ejercicio, rig, vacias, aCopias: integer; fecha: TDateTime; Modo: byte; serie: string);
var
  str : string;
begin
  Albaran := rig;
  Fecha_Alb := fecha;
  Copias := aCopias;
  if (Albaran > 0) then
     with xEtiquetas do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := serie;
        Params.ByName['RIG'].AsInteger := Rig;
        Params.ByName['VACIAS'].AsInteger := vacias;
        Params.ByName['COPIAS'].AsInteger := copias;
        Params.ByName['TIPO'].AsString := 'ALB';
        Open;
     end
  else
     with xEtiquetas do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := serie;
        Params.ByName['RIG'].AsInteger := Rig;
        Params.ByName['VACIAS'].AsInteger := vacias;
        Params.ByName['COPIAS'].AsInteger := copias;
        Params.ByName['TIPO'].AsString := 'ALM';
        Open;
     end;

  DMListados.Cargar(58, serie);

  if (REntorno.TipoListado = 'FRF') then
  begin
     frAlbaranes.LoadFromFIB(REntorno.Formato, str);
     frAlbaranes.PrepareReport;
     case Modo of
        0: frAlbaranes.ShowPreparedReport;
        1: frAlbaranes.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  if (REntorno.TipoListado = 'HYR') then
  begin
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     case Modo of
        0: HYReport.Preview;
        1: HYReport.Print(REntorno.NombreMatricial);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstAlbaranesEti.frAlbaranesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Albaran' then
     ParValue := Albaran;
  if ParName = 'Fecha' then
     ParValue := Fecha_Alb;
  if ParName = 'Copias' then
     ParValue := Copias;
  if ParName = 'PaginaEti' then
  begin
     Inc(Pagina);
     ParValue := Pagina;
  end;
end;

procedure TDMLstAlbaranesEti.frAlbaranesBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstAlbaranesEti.xEtiquetasBeforeClose(DataSet: TDataSet);
begin
  QMCabecera.Close;
end;

procedure TDMLstAlbaranesEti.xEtiquetasAfterOpen(DataSet: TDataSet);
begin
  QMCabecera.Open;
end;

procedure TDMLstAlbaranesEti.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMCartaPortes.Open;
end;

procedure TDMLstAlbaranesEti.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMCartaPortes.Close;
end;

procedure TDMLstAlbaranesEti.frxAlbaranesGetValue(const VarName: string; var Value: variant);
begin
  frAlbaranesGetValue(VarName, Value);
end;

end.
