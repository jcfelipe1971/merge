{Especifico cliente DICOMOL}

unit UDMFamiliasEscandallos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMFamiliasEscandallos = class(TDataModule)
     TLocal: THYTransaction;
     ZQMFamiliasEscandallos: TFIBTableSet;
     ZDSQMFamiliasEscandallos: TDataSource;
     ZQMFamiliasEscandallosFAMILIA: TFIBStringField;
     ZQMFamiliasEscandallosESCANDALLO: TIntegerField;
     xFamilia: TFIBDataSetRO;
     DSxFamilia: TDataSource;
     xCompuesto: TFIBDataSetRO;
     DSxCompuesto: TDataSource;
     xFamiliaTITULO: TFIBStringField;
     xCompuestoCOMPUESTO: TFIBStringField;
     ZQMFamiliasEscandallosEMPRESA: TIntegerField;
     ZQMFamiliasEscandallosDescFamili: TStringField;
     ZQMFamiliasEscandallosDescCompuesto: TStringField;
     QTemp: THYFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
     procedure ZQMFamiliasEscandallosFAMILIAChange(Sender: TField);
     procedure ZQMFamiliasEscandallosESCANDALLOChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure ZQMFamiliasEscandallosAfterOpen(DataSet: TDataSet);
     procedure ZQMFamiliasEscandallosNewRecord(DataSet: TDataSet);
     procedure ZQMFamiliasEscandallosDescFamiliGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure ZQMFamiliasEscandallosDescCompuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     function BuscarCompuesto: string;
     function BuscarFamilia: string;
  end;

var
  DMFamiliasEscandallos : TDMFamiliasEscandallos;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.dfm}

procedure TDMFamiliasEscandallos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  ZQMFamiliasEscandallos.Open;
end;

procedure TDMFamiliasEscandallos.ZQMFamiliasEscandallosFAMILIAChange(Sender: TField);
begin
  with xFamilia do
  begin
     Close;
     Params.ByName['Familia'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TDMFamiliasEscandallos.ZQMFamiliasEscandallosESCANDALLOChange(Sender: TField);
begin
  with xCompuesto do
  begin
     Close;
     Params.ByName['escandallo'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TDMFamiliasEscandallos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  ZQMFamiliasEscandallos.Refresh;
end;

procedure TDMFamiliasEscandallos.ZQMFamiliasEscandallosAfterOpen(DataSet: TDataSet);
begin
  ZQMFamiliasEscandallos.Open;
  xFamilia.Open;
end;

procedure TDMFamiliasEscandallos.ZQMFamiliasEscandallosNewRecord(DataSet: TDataSet);
begin
  ZQMFamiliasEscandallosEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TDMFamiliasEscandallos.ZQMFamiliasEscandallosDescFamiliGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (ZQMFamiliasEscandallosFAMILIA.AsString <> '') then
  begin
     xFamilia.Close;
     xFamilia.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     xFamilia.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     xFamilia.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     xFamilia.Open;
     Text := xFamiliaTITULO.AsString;
  end;
end;

procedure TDMFamiliasEscandallos.ZQMFamiliasEscandallosDescCompuestoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (ZQMFamiliasEscandallosESCANDALLO.AsString <> '') then
  begin
     xCompuesto.Close;
     xCompuesto.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     xCompuesto.Open;
     Text := xCompuestoCOMPUESTO.AsString;
  end;
end;

function TDMFamiliasEscandallos.BuscarFamilia: string;
begin
  with QTemp do
  begin
     Close;
     SQL.Text := 'select titulo from ver_familias_cuentas where empresa=?empresa' +
        ' and ejercicio=?ejercicio and canal=?canal and familia=?familia ';
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['canal'].AsInteger := REntorno.Canal;
     Params.ByName['familia'].AsString := ZQMFamiliasEscandallosFAMILIA.AsString;
     ExecQuery;
  end;
  Result := QTemp.FieldByName['titulo'].AsString;
end;

function TDMFamiliasEscandallos.BuscarCompuesto: string;
begin
  with QTemp do
  begin
     Close;
     SQL.Text := 'select first(1) compuesto from pro_escandallo where escandallo=?escandallo' +
        ' and tipo= "EPR" ';
     Params.ByName['escandallo'].AsInteger := ZQMFamiliasEscandallosESCANDALLO.AsInteger;
     ExecQuery;

  end;
  Result := QTemp.FieldByName['compuesto'].AsString;
end;

end.
