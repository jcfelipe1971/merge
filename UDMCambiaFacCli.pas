unit UDMCambiaFacCli;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, HYFIBQuery;

type
  TDMCambiaFacCli = class(TDataModule)
     QMTipoIva: TFIBTableSet;
     DSQMTipoIva: TDataSource;
     TLocal: THYTransaction;
     QMTipoIvaEMPRESA: TIntegerField;
     QMTipoIvaEJERCICIO: TIntegerField;
     QMTipoIvaCANAL: TIntegerField;
     QMTipoIvaSERIE: TFIBStringField;
     QMTipoIvaTIPO: TFIBStringField;
     QMTipoIvaRIG: TIntegerField;
     QMTipoIvaTIPO_IVA: TIntegerField;
     QMTipoIvaI_IVA: TFloatField;
     QMTipoIvaI_RE: TFloatField;
     QMTipoIvaI_IVA_CANAL: TFloatField;
     QMTipoIvaI_RE_CANAL: TFloatField;
     QMTipoIvaMONEDA: TFIBStringField;
     TUpdate: THYTransaction;
     QMTipoIvaTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     QMTipoIvaI_IMPUESTO_ADICIONAL: TFloatField;
     QMTipoIvaI_IMPUESTO_ADICIONAL_CANAL: TFloatField;
     procedure Graba(DataSet: TDataSet);
     procedure DMCambiaCreate(Sender: TObject);
     procedure QMTipoIvaNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(id_s: integer);
     function DameMoneda(id_s: integer): string;
  end;

var
  DMCambiaFacCli : TDMCambiaFacCli;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TDMCambiaFacCli.DMCambiaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMCambiaFacCli.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMCambiaFacCli.Muestra(id_s: integer);
var
  LocalMascaraN : string;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMTipoIvaMONEDA.AsString, 1);

  QMTipoIvaI_IVA_CANAL.DisplayFormat := LocalMascaraN;
  QMTipoIvaI_RE_CANAL.DisplayFormat := LocalMascaraN;
  QMTipoIvaI_IMPUESTO_ADICIONAL.DisplayFormat := LocalMascaraN;
  QMTipoIvaI_IVA.DisplayFormat := LocalMascaraN;
  QMTipoIvaI_RE.DisplayFormat := LocalMascaraN;
  QMTipoIvaI_IMPUESTO_ADICIONAL_CANAL.DisplayFormat := LocalMascaraN;

  with QMTipoIva do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := id_s;
     Open;
  end;
end;

procedure TDMCambiaFacCli.QMTipoIvaNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

function TDMCambiaFacCli.DameMoneda(id_s: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MONEDA FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        Result := FieldByName['MONEDA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
