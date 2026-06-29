unit UDMEmpleados;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMEmpleados = class(TDataModule)
     TLocal: THYTransaction;
     QMEmpleados: TFIBTableSet;
     DSQMEmpleados: TDataSource;
     QMEmpleadosEMPRESA: TIntegerField;
     QMEmpleadosEJERCICIO: TIntegerField;
     QMEmpleadosCANAL: TIntegerField;
     QMEmpleadosTERCERO: TIntegerField;
     QMEmpleadosIMPORTE: TFloatField;
     QMEmpleadosRETENCION: TFloatField;
     QMEmpleadosFECHA: TDateTimeField;
     QMEmpleadosINGRESO: TIntegerField;
     QMEmpleadosIMPORTE_ESPECIE: TFloatField;
     QMEmpleadosRETENCION_ESPECIE: TFloatField;
     QMEmpleadosDIETAS: TFloatField;
     TUpdate: THYTransaction;
     procedure Graba(DataSet: TDataSet);
     procedure QMEmpleadosNewRecord(DataSet: TDataSet);
     procedure DMEmpleadosCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMEmpleados : TDMEmpleados;

implementation

uses UEntorno, uFBusca, UDMMain;

{$R *.DFM}

procedure TDMEmpleados.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMEmpleados.QMEmpleadosNewRecord(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(INGRESO) FROM EMP_TRABAJADORES WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        QMEmpleadosINGRESO.AsInteger := (FieldByName['MAX'].AsInteger + 1);
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMEmpleadosEMPRESA.AsInteger := REntorno.Empresa;
  QMEmpleadosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMEmpleadosCANAL.AsInteger := REntorno.Canal;
  QMEmpleadosTERCERO.AsInteger := 1;
  QMEmpleadosIMPORTE.AsFloat := 0;
  QMEmpleadosRETENCION.AsFloat := 0;
  QMEmpleadosIMPORTE_ESPECIE.AsFloat := 0;
  QMEmpleadosRETENCION_ESPECIE.AsFloat := 0;
  QMEmpleadosFECHA.AsDateTime := REntorno.FechaTrab;
  QMEmpleadosDIETAS.AsInteger := 0;
end;

procedure TDMEmpleados.DMEmpleadosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMEmpleadosIMPORTE.DisplayFormat := MascaraN;
  QMEmpleadosRETENCION.DisplayFormat := MascaraN;
  QMEmpleadosIMPORTE_ESPECIE.DisplayFormat := MascaraN;
  QMEmpleadosRETENCION_ESPECIE.DisplayFormat := MascaraN;
  QMEmpleadosDIETAS.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMEmpleados, '11100', True);
end;

procedure TDMEmpleados.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMEmpleados, '11100');
end;

end.
