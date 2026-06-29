unit UDMCambiaFacProv;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, HYFIBQuery;

type
  TDMCambiaFacProv = class(TDataModule)
     QMTipoIva: TFIBTableSet;
     DSTipoIva: TDataSource;
     TLocal: THYTransaction;
     QMTipoIvaEMPRESA: TIntegerField;
     QMTipoIvaEJERCICIO: TIntegerField;
     QMTipoIvaCANAL: TIntegerField;
     QMTipoIvaSERIE: TFIBStringField;
     QMTipoIvaTIPO: TFIBStringField;
     QMTipoIvaRIG: TIntegerField;
     QMTipoIvaTIPO_IVA: TIntegerField;
     QMTipoIvaPAIS: TFIBStringField;
     QMTipoIvaMONEDA: TFIBStringField;
     QMTipoIvaS_BASES: TFloatField;
     QMTipoIvaDTO_PP: TFloatField;
     QMTipoIvaI_DTO_PP: TFloatField;
     QMTipoIvaP_IVA: TFloatField;
     QMTipoIvaI_IVA: TFloatField;
     QMTipoIvaP_RE: TFloatField;
     QMTipoIvaI_RE: TFloatField;
     QMTipoIvaS_BASES_DTO: TFloatField;
     QMTipoIvaLIQUIDO: TFloatField;
     QMTipoIvaI_IVA_CANAL: TFloatField;
     QMTipoIvaI_RE_CANAL: TFloatField;
     QMoneda: THYFIBQuery;
     TUpdate: THYTransaction;
     procedure Graba(DataSet: TDataSet);
     procedure DMCambiaCreate(Sender: TObject);
     procedure QMTipoIvaNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(id_e: integer);
     procedure DameMoneda(id_e: integer; var Moneda: string);
  end;

var
  DMCambiaFacProv : TDMCambiaFacProv;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TDMCambiaFacProv.DMCambiaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMCambiaFacProv.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMCambiaFacProv.Muestra(id_e: integer);
var
  LocalMascaraN : string;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMTipoIvaMONEDA.AsString, 1);
  QMTipoIvaI_IVA_CANAL.DisplayFormat := MascaraN;
  QMTipoIvaI_RE_CANAL.DisplayFormat := MascaraN;
  QMTipoIvaI_IVA.DisplayFormat := LocalMascaraN;
  QMTipoIvaI_RE.DisplayFormat := LocalMascaraN;

  with QMTipoIva do
  begin
     Close;
     Params.ByName['ID_E'].AsInteger := id_e;
     Open;
  end;
end;

procedure TDMCambiaFacProv.QMTipoIvaNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMCambiaFacProv.DameMoneda(id_e: integer; var Moneda: string);
begin
  with QMoneda do
  begin
     Close;
     Params.ByName['ID_E'].AsInteger := id_e;
     ExecQuery;
     moneda := FieldByName['MONEDA'].AsString;
     FreeHandle;
  end;
end;

end.
