unit UDMEquivalenciaColores;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMEquivalenciaColores = class(TDataModule)
     DSEquivalenciaColores: TDataSource;
     QMEquivalenciaColoresID_A_BASE: TIntegerField;
     QMEquivalenciaColoresID_A_CORRESP: TIntegerField;
     QMEquivalenciaColoresCOLOR: TFIBStringField;
     QMEquivalenciaColoresEMPRESA: TIntegerField;
     QMEquivalenciaColoresARTICULO_BASE: TFIBStringField;
     QMEquivalenciaColoresARTICULO_CORRESP: TFIBStringField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMEquivalenciaColores: TFIBTableSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMEquivalenciaColoresNewRecord(DataSet: TDataSet);
     procedure QMEquivalenciaColoresBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtrar(Color, ArticuloBase, ArticuloCorrespondente: string);
  end;

var
  DMEquivalenciaColores : TDMEquivalenciaColores;

implementation

uses UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TDMEquivalenciaColores.DataModuleCreate(Sender: TObject);
begin
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMEquivalenciaColores.Close;
  QMEquivalenciaColores.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMEquivalenciaColores.Open;
end;

procedure TDMEquivalenciaColores.QMEquivalenciaColoresNewRecord(DataSet: TDataSet);
begin
  QMEquivalenciaColoresEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TDMEquivalenciaColores.QMEquivalenciaColoresBeforePost(DataSet: TDataSet);
begin
  QMEquivalenciaColoresID_A_BASE.AsInteger := DameIDArticulo(QMEquivalenciaColoresARTICULO_BASE.AsString);
  QMEquivalenciaColoresID_A_CORRESP.AsInteger := DameIDArticulo(QMEquivalenciaColoresARTICULO_CORRESP.AsString);
end;

procedure TDMEquivalenciaColores.Filtrar(Color, ArticuloBase, ArticuloCorrespondente: string);
begin
  with QMEquivalenciaColores do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM PRO_DESPIECE_COLOR ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA=?EMPRESA ');
     if (Trim(Color) > '') then
        SelectSQL.Add(' AND COLOR = ?COLOR ');
     if (Trim(ArticuloBase) > '') then
        SelectSQL.Add(' AND ARTICULO_BASE = ?ARTICULO_BASE ');
     if (Trim(ArticuloCorrespondente) > '') then
        SelectSQL.Add(' AND ARTICULO_CORRESP = ?ARTICULO_CORRESP ');
     SelectSQL.Add(' ORDER BY COLOR, ARTICULO_BASE, ARTICULO_CORRESP ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if (Trim(Color) > '') then
        Params.ByName['COLOR'].AsString := Color;
     if (Trim(ArticuloBase) > '') then
        Params.ByName['ARTICULO_BASE'].AsString := ArticuloBase;
     if (Trim(ArticuloCorrespondente) > '') then
        Params.ByName['ARTICULO_CORRESP'].AsString := ArticuloCorrespondente;

     Open;
  end;
end;

end.
