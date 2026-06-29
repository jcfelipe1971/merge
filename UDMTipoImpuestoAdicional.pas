unit UDMTipoImpuestoAdicional;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet;

type
  TDMTipoImpuestoAdicional = class(TDataModule)
     QMTipoImpuestoAdicional: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMTipoImpuestoAdicional: TDataSource;
     QMTipoImpuestoAdicionalPAIS: TFIBStringField;
     QMTipoImpuestoAdicionalTIPO: TIntegerField;
     QMTipoImpuestoAdicionalTITULO: TFIBStringField;
     QMTipoImpuestoAdicionalPORCENTAJE: TFloatField;
     QMTipoImpuestoAdicionalACTIVO: TIntegerField;
     TUpdate: THYTransaction;
     procedure QMTipoImpuestoAdicionalNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMTipoImpuestoAdicionalBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMTipoImpuestoAdicional : TDMTipoImpuestoAdicional;

implementation

uses UDMMain, UEntorno, UFBusca, HYFIBQuery;

{$R *.dfm}

procedure TDMTipoImpuestoAdicional.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMTipoImpuestoAdicionalPORCENTAJE.DisplayFormat := MascaraP;

  DMMain.FiltraTabla(QMTipoImpuestoAdicional, '00001');
end;

procedure TDMTipoImpuestoAdicional.QMTipoImpuestoAdicionalNewRecord(DataSet: TDataSet);
begin
  QMTipoImpuestoAdicionalPAIS.AsString := REntorno.Pais;
  QMTipoImpuestoAdicionalPORCENTAJE.AsInteger := 0;
  QMTipoImpuestoAdicionalACTIVO.AsInteger := 1;
end;

procedure TDMTipoImpuestoAdicional.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoImpuestoAdicional, '00001');
end;

procedure TDMTipoImpuestoAdicional.QMTipoImpuestoAdicionalBeforePost(DataSet: TDataSet);
begin
  if (QMTipoImpuestoAdicionalTIPO.AsInteger = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(TIPO) FROM SYS_TIPO_IMPUESTO_ADICIONAL WHERE PAIS = :PAIS';
           Params.ByName['PAIS'].AsString := REntorno.Pais;
           ExecQuery;
           QMTipoImpuestoAdicionalTIPO.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
