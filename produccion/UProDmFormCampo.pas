unit UProDmFormCampo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TProDmFormCampo = class(TDataModule)
     QmProFormulasCamp: TFIBTableSet;
     DSQmProFormulasCamp: TDataSource;
     TLocal: THYTransaction;
     QmProFormulasCampID_FORMULA_CAMPOS_CAB: TIntegerField;
     QmProFormulasCampID_FORMULA: TIntegerField;
     QmProFormulasCampVALIDA: TIntegerField;
     QmProFormulasCampFORMULA: TFIBStringField;
     QmProFormulasCampESTADO_FORMULA: TStringField;
     QmProFormulasCampDet: TFIBTableSet;
     DsQmProFormulasCampDet: TDataSource;
     QmProFormulasCampDetID_FORMULA_CAMPOS_DET: TIntegerField;
     QmProFormulasCampDetID_FORMULA_CAMPOS_CAB: TIntegerField;
     QmProFormulasCampDetNOMBRE: TFIBStringField;
     QmProFormulasCampDetVALOR: TFloatField;
     QmProFormulasCampDetCAMPO_ESC: TFIBStringField;
     QmProFormulasCampDetTABLA_ESC: TFIBStringField;
     QmProFormulasCampDetCAMPO_ORD: TFIBStringField;
     QmProFormulasCampDetTABLA_ORD: TFIBStringField;
     QmProFormulasCampDetTABLA_DESP: TFIBStringField;
     QmProFormulasCampDetCAMPO_DESP: TFIBStringField;
     QmProFormulasCampTIPO_REDONDEO: TIntegerField;
     DSxTipoRedondeo: TDataSource;
     xTipoRedondeo: TFIBDataSetRO;
     xTipoRedondeoTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QmProFormulasCampAfterOpen(DataSet: TDataSet);
     procedure QmProFormulasCampDetNewRecord(DataSet: TDataSet);
     procedure QmProFormulasCampESTADO_FORMULAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QmProFormulasCampTIPO_REDONDEOChange(Sender: TField);
     procedure QmProFormulasCampBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AbreRegistro(id: integer);
     procedure ValidaFormula;
     procedure DesvalidaFormula;
     procedure BusquedaCompleja;
  end;

var
  ProDmFormCampo : TProDmFormCampo;

implementation

uses UEntorno, UDMMain, UFBusca;

{$R *.dfm}

procedure TProDmFormCampo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDmFormCampo.AbreRegistro(id: integer);
begin
  with QMProFormulasCamp do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := 'SELECT * FROM PRO_FORMULAS_CAMPOS_CAB WHERE ID_FORMULA_CAMPOS_CAB = ?ID_FORMULA_CAMPOS_CAB';
     Params.ByName['ID_FORMULA_CAMPOS_CAB'].AsInteger := id;
     Open;
  end;
end;

procedure TProDmFormCampo.QmProFormulasCampAfterOpen(DataSet: TDataSet);
begin
  QmProFormulasCampDet.Open;
  xTipoRedondeo.Open;
end;

procedure TProDmFormCampo.QmProFormulasCampBeforeClose(DataSet: TDataSet);
begin
  QmProFormulasCampDet.Close;
  xTipoRedondeo.Close;
end;

procedure TProDmFormCampo.QmProFormulasCampDetNewRecord(DataSet: TDataSet);
begin
  QmProFormulasCampDetID_FORMULA_CAMPOS_CAB.AsInteger := QmProFormulasCampID_FORMULA_CAMPOS_CAB.AsInteger;
end;

procedure TProDmFormCampo.ValidaFormula;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_FORMULAS_CAMPOS_CAB ');
        SQL.Add(' SET ');
        SQL.Add(' VALIDA = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_FORMULA_CAMPOS_CAB = :ID_FORMULA_CAMPOS_CAB AND ');
        SQL.Add(' ID_FORMULA = :ID_FORMULA ');
        Params.ByName['ID_FORMULA_CAMPOS_CAB'].AsInteger := QmProFormulasCampID_FORMULA_CAMPOS_cAB.AsInteger;
        Params.ByName['ID_FORMULA'].AsInteger := QmProFormulasCampID_FORMULA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_VALIDA_FORMULA(:ID_FORMULA, :ID_FORMULA_CAB)';
        Params.ByName['ID_FORMULA_CAB'].AsInteger := QmProFormulasCampID_FORMULA_CAMPOS_cAB.AsInteger;
        Params.ByName['ID_FORMULA'].AsInteger := QmProFormulasCampID_FORMULA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // sfg.albert - Es refresca fent un open-close per agafar el nou valor del procedure
  QmProFormulasCamp.Refresh;
end;

procedure TProDmFormCampo.DesvalidaFormula;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        Database := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_FORMULAS_CAMPOS_CAB ');
        SQL.Add(' SET ');
        SQL.Add(' VALIDA = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_FORMULA_CAMPOS_CAB = :ID_FORMULA_CAMPOS_CAB ');
        Params.ByName['ID_FORMULA_CAMPOS_CAB'].AsInteger := QmProFormulasCampID_FORMULA_CAMPOS_cAB.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        Database := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_FORMULAS ');
        SQL.Add(' SET ');
        SQL.Add(' ACTIVO = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_FORMULA = :ID_FORMULA ');
        Params.ByName['ID_FORMULA'].AsInteger := QmProFormulasCampID_FORMULA.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDmFormCampo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QmProFormulasCamp, '00000');
end;

procedure TProDmFormCampo.QmProFormulasCampESTADO_FORMULAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (not QmProFormulasCamp.EOF) then
  begin
     if (QmProFormulasCampVALIDA.AsInteger = 1) then
        Text := _('Validada')
     else
        Text := _('No validada');
  end;
end;

procedure TProDmFormCampo.QmProFormulasCampTIPO_REDONDEOChange(Sender: TField);
begin
  with xTipoRedondeo do
  begin
     Close;
     Open;
  end;
end;

end.
