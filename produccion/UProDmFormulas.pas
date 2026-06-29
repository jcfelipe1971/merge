unit UProDmFormulas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TProDmFormulas = class(TDataModule)
     TLocal: THYTransaction;
     QMProFormulas: TFIBTableSet;
     DSQMProFormulas: TDataSource;
     QMProFormulasDet: TFIBTableSet;
     DSQMProFormulasDet: TDataSource;
     QMProFormulasID_FORMULA: TIntegerField;
     QMProFormulasNOMBRE: TFIBStringField;
     QMProFormulasDetID_FORMULA_CAMPOS_CAB: TIntegerField;
     QMProFormulasDetID_FORMULA: TIntegerField;
     QMProFormulasDetVALIDA: TIntegerField;
     QMProFormulasDetFORMULA: TFIBStringField;
     QMProFormulasACTIVO: TIntegerField;
     QMProFormulasDetCAMPO_ESC: TFIBStringField;
     QMProFormulasDetTABLA_ESC: TFIBStringField;
     QMProFormulasDetCAMPO_ORD: TFIBStringField;
     QMProFormulasDetTABLA_ORD: TFIBStringField;
     QMProFormulasESTADO_FORMULA: TStringField;
     QMProFormulasDetTABLA_DESP: TFIBStringField;
     QMProFormulasDetCAMPOS_DESP: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProFormulasDetNewRecord(DataSet: TDataSet);
     procedure QMProFormulasAfterOpen(DataSet: TDataSet);
     procedure QMProFormulasBeforePost(DataSet: TDataSet);
     procedure QMProFormulasNewRecord(DataSet: TDataSet);
     procedure QMProFormulasESTADO_FORMULAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProFormulasBeforeClose(DataSet: TDataSet);
     procedure QMProFormulasDetBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     function EstaActivo: boolean;
     procedure BusquedaCompleja;
     procedure Filtra(Filtro: string);
  end;

var
  ProDmFormulas : TProDmFormulas;

implementation

uses UEntorno, UDMMain, UFBusca;

{$R *.dfm}

procedure TProDmFormulas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMProFormulas.Open;
end;

procedure TProDmFormulas.QMProFormulasAfterOpen(DataSet: TDataSet);
begin
  QMProFormulasDet.Open;
end;

procedure TProDmFormulas.QMProFormulasBeforeClose(DataSet: TDataSet);
begin
  QMProFormulasDet.Close;
end;

procedure TProDmFormulas.QMProFormulasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_PRO_FORMULAS', 'ID_FORMULA');
end;

procedure TProDmFormulas.QMProFormulasNewRecord(DataSet: TDataSet);
begin
  QMProFormulasACTIVO.AsInteger := 0;
end;

procedure TProDmFormulas.QMProFormulasDetBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_PRO_FORMULAS_CAMPOS_CAB', 'ID_FORMULA_CAMPOS_CAB');
end;

procedure TProDmFormulas.QMProFormulasDetNewRecord(DataSet: TDataSet);
begin
  QMProFormulasDetID_FORMULA.AsInteger := QMProFormulasID_FORMULA.AsInteger;
end;

function TProDmFormulas.EstaActivo: boolean;
begin
  Result := (QMProFormulasACTIVO.AsInteger = 1);
end;

procedure TProDmFormulas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProFormulas, '00000');
end;

procedure TProDmFormulas.Filtra(Filtro: string);
begin
  with QMProFormulas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM PRO_FORMULAS ');
     if (Trim(Filtro) <> '') then
        SelectSQL.Add('WHERE ' + Filtro);
     SelectSQL.Add('ORDER BY ID_FORMULA');
     Open;
  end;
end;

procedure TProDmFormulas.QMProFormulasESTADO_FORMULAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMProFormulasACTIVO.AsInteger = 1) then
     Text := _('Activa')
  else
     Text := _('No activa');
end;

end.
