unit UDMNomConceptosCHL;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMNomConceptosCHL = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     DSQMParametro: TDataSource;
     QMParametro: TFIBTableSet;
     QMHaber: TFIBTableSet;
     QMDescuento: TFIBTableSet;
     DSQMDescuento: TDataSource;
     DSQMHaber: TDataSource;
     QMParametroEMPRESA: TIntegerField;
     QMParametroEJERCICIO: TIntegerField;
     QMParametroCANAL: TIntegerField;
     QMParametroCODIGO: TFIBStringField;
     QMParametroGLOSA: TFIBStringField;
     QMParametroCALCULABLE: TIntegerField;
     QMParametroTIPO_DATO: TFIBStringField;
     QMParametroES_TOTAL: TIntegerField;
     QMParametroVISIBLE_EN_EMPLEADO: TIntegerField;
     QMHaberEMPRESA: TIntegerField;
     QMHaberEJERCICIO: TIntegerField;
     QMHaberCANAL: TIntegerField;
     QMHaberCODIGO: TFIBStringField;
     QMHaberGLOSA: TFIBStringField;
     QMHaberCALCULABLE: TIntegerField;
     QMHaberES_IMPONIBLE: TIntegerField;
     QMHaberMOSTRAR_IMPRESION: TIntegerField;
     QMHaberORDEN_IMPRESION: TIntegerField;
     QMHaberES_TOTAL: TIntegerField;
     QMHaberVISIBLE_EN_EMPLEADO: TIntegerField;
     QMDescuentoEMPRESA: TIntegerField;
     QMDescuentoEJERCICIO: TIntegerField;
     QMDescuentoCANAL: TIntegerField;
     QMDescuentoCODIGO: TFIBStringField;
     QMDescuentoGLOSA: TFIBStringField;
     QMDescuentoCALCULABLE: TIntegerField;
     QMDescuentoES_PERSONAL: TIntegerField;
     QMDescuentoMOSTRAR_IMPRESION: TIntegerField;
     QMDescuentoORDEN_IMPRESION: TIntegerField;
     QMDescuentoES_TOTAL: TIntegerField;
     QMDescuentoVISIBLE_EN_EMPLEADO: TIntegerField;
     QMHaberCUENTA: TFIBStringField;
     QMDescuentoCUENTA: TFIBStringField;
     QMDescuentoSIGNO: TFIBStringField;
     QMHaberSIGNO: TFIBStringField;
     QMParametroORDEN_IMPRESION: TIntegerField;
     QMParametroCUENTA: TFIBStringField;
     QMParametroSIGNO: TFIBStringField;
     QMParametroTIPO_PARAMETRO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMParametroCUENTAChange(Sender: TField);
     procedure QMHaberCUENTAChange(Sender: TField);
     procedure QMDescuentoCUENTAChange(Sender: TField);
     procedure QMHaberNewRecord(DataSet: TDataSet);
     procedure QMParametroNewRecord(DataSet: TDataSet);
     procedure QMDescuentoNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMNomConceptosCHL : TDMNomConceptosCHL;

implementation

uses UDMMain, UFBusca, Controls, UEntorno, DateUtils, UUtiles, StrUtils;

{$R *.dfm}

procedure TDMNomConceptosCHL.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMParametro, '11100', True);
  DMMain.FiltraTabla(QMHaber, '11100', True);
  DMMain.FiltraTabla(QMDescuento, '11100', True);
end;

procedure TDMNomConceptosCHL.QMParametroCUENTAChange(Sender: TField);
begin
  if (Trim(QMParametroCUENTA.AsString) = '') then
     QMParametroSIGNO.AsString := ''
  else
  if (Trim(QMParametroSIGNO.AsString) = '') then
  begin
     if LeftStr(QMParametroCUENTA.AsString, 1) = '3' then
        QMParametroSIGNO.AsString := 'D';

     if LeftStr(QMParametroCUENTA.AsString, 1) = '2' then
        QMParametroSIGNO.AsString := 'H';
  end;
end;

procedure TDMNomConceptosCHL.QMHaberCUENTAChange(Sender: TField);
begin
  if (Trim(QMHaberSIGNO.AsString) = '') then
     QMHaberSIGNO.AsString := 'D';
end;

procedure TDMNomConceptosCHL.QMDescuentoCUENTAChange(Sender: TField);
begin
  if (Trim(QMDescuentoSIGNO.AsString) = '') then
     QMDescuentoSIGNO.AsString := 'H';
end;

procedure TDMNomConceptosCHL.QMHaberNewRecord(DataSet: TDataSet);
begin
  QMHaberEMPRESA.AsInteger := REntorno.Empresa;
  QMHaberEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMHaberCANAL.AsInteger := REntorno.Canal;
end;

procedure TDMNomConceptosCHL.QMParametroNewRecord(DataSet: TDataSet);
begin
  QMParametroEMPRESA.AsInteger := REntorno.Empresa;
  QMParametroEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMParametroCANAL.AsInteger := REntorno.Canal;
  QMParametroTIPO_PARAMETRO.AsString := 'DES';
end;

procedure TDMNomConceptosCHL.QMDescuentoNewRecord(DataSet: TDataSet);
begin
  QMDescuentoEMPRESA.AsInteger := REntorno.Empresa;
  QMDescuentoEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDescuentoCANAL.AsInteger := REntorno.Canal;
end;

end.
