unit UDMLstSysCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FR_DSet, FR_DBSet,
  FIBDataSet, FIBDataSetRO, FR_Class, Fr_HYReport, FIBTableDataSet;

type
  TDMLstSysCuentas = class(TDataModule)
     QMCuentas: TFIBTableSet;
     DSCuentas: TDataSource;
     QMCuentasCUENTA: TFIBStringField;
     QMCuentasTITULO: TFIBStringField;
     QMCuentasNIVEL: TIntegerField;
     QMCuentasSUPERIOR: TFIBStringField;
     QMCuentasTIPO: TIntegerField;
     QMCuentasGESTION: TIntegerField;
     DSxCuentasGestion: TDataSource;
     QMCuentasTIPO_TERCERO: TIntegerField;
     TLocal: THYTransaction;
     xCuentasGestion: TFIBDataSetRO;
     QMCuentasREG_CIERRE: TIntegerField;
     QMCuentasPGC: TIntegerField;
     TUpdate: THYTransaction;
     QMCuentasPAIS: TFIBStringField;
     frGestiones: TfrHYReport;
     frDBxCuentas: TfrDBDataSet;
     procedure QMCuentasGESTIONChange(Sender: TField);
     procedure xPgCAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frGestionesEnterRect(Memo: TStringList; View: TfrView);
     procedure frGestionesGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(pgc: integer; Pais: string);
  end;

var
  DMLstSysCuentas : TDMLstSysCuentas;

implementation

uses UDMMain, uFBusca, UDMListados, UEntorno, UFormGest;

{$R *.DFM}

procedure TDMLstSysCuentas.QMCuentasGESTIONChange(Sender: TField);
begin
  with xCuentasGestion do
  begin
     Close;
     Open;
  end;
end;

procedure TDMLstSysCuentas.xPgCAfterOpen(DataSet: TDataSet);
begin
  QMCuentas.Close;
  QMCuentas.Open;
end;

procedure TDMLstSysCuentas.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TDMLstSysCuentas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstSysCuentas.MostrarListado(PGC: integer; Pais: string);
var
  str : string;
begin
  with QMCuentas do
  begin
     Close;
     Params.ByName['PGC'].AsInteger := PGC;
     Params.ByName['PAIS'].AsString := Pais;
     Open;
  end;

  DMListados.Cargar(911, '');
  frGestiones.LoadFromFIB(REntorno.Formato, str);
  frGestiones.PrepareReport;
  frGestiones.ShowPreparedReport;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstSysCuentas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstSysCuentas.frGestionesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstSysCuentas.frGestionesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'FechaHoy' then
     ParValue := REntorno.FechaTrabSH;
end;

end.
