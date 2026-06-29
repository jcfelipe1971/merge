unit UDMEscCond;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMEscCond = class(TDataModule)
     TLocal: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleUNID_MINIMAS: TFloatField;
     QMDetalleUNID_MAXIMAS: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     xCondCli: TFIBDataSetRO;
     xCondCliARTICULO: TFIBStringField;
     xCondCliFAMILIA: TFIBStringField;
     xCondCliTITULO_ARTICULO: TFIBStringField;
     xCondCliTITULO_FAMILIA: TFIBStringField;
     DSxCondCli: TDataSource;
     SPLineaSiguiente: THYFIBQuery;
     xCondCliPERFIL: TFIBStringField;
     xCondCliTITULO_PERFIL: TFIBStringField;
     xCondCliCLIENTE: TIntegerField;
     xCondCliTITULO_CLIENTE: TFIBStringField;
     xCondCliAGRUPACION: TFIBStringField;
     xCondCliTITULO_AGRUPACION: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     TipoActual: string;
     RIGActual: integer;
  public
     { Public declarations }
     procedure Filtra(tipo: string; RIG: integer);
  end;

var
  DMEscCond : TDMEscCond;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMEscCond.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMDetalleUNID_MINIMAS.DisplayFormat := MascaraN;
  QMDetalleUNID_MAXIMAS.DisplayFormat := MascaraN;
  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_3.DisplayFormat := MascaraP;
  QMDetallePRECIO.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMDetalle, '11100', True);
end;

procedure TDMEscCond.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  Filtra(TipoActual, RIGActual);
end;

procedure TDMEscCond.Filtra(tipo: string; RIG: integer);
begin
  TipoActual := tipo;
  RIGActual := RIG;
  // if ((tipo = 'CCA') or (tipo = 'CCF')) then
  // begin
  with xCondCli do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := RIG;
     Open;
  end;

  with QMDetalle do
  begin
     Close;
     DMMain.FiltraTabla(QMDetalle, '11100', False);
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := RIG;
     Open;
  end;
  // end;
  // if (tipo = 'CAR') then with qm
end;

procedure TDMEscCond.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetalleCANAL.AsInteger := REntorno.Canal;
  QMDetalleTIPO.AsString := TipoActual;
  QMDetalleRIG.AsInteger := RIGActual;
  with SPLineaSiguiente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := TipoActual;
     Params.ByName['RIG'].AsInteger := RIGActual;
     ExecQuery;
     QMDetalleLINEA.AsInteger := FieldByName['LINEA'].AsInteger;
     FreeHandle;
  end;
  QMDetallePRECIO.AsFloat := 0;
  QMDetalleDESCUENTO.AsFloat := 0;
  QMDetalleDESCUENTO_2.AsFloat := 0;
  QMDetalleDESCUENTO_3.AsFloat := 0;
end;

end.
