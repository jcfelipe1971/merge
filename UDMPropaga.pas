unit UDMPropaga;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TDMPropaga = class(TDataModule)
     QMPropaga: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMPropaga: TDataSource;
     QMPropagaO_EMPRESA: TIntegerField;
     QMPropagaO_EJERCICIO: TIntegerField;
     QMPropagaO_CANAL: TIntegerField;
     QMPropagaD_EMPRESA: TIntegerField;
     QMPropagaD_EJERCICIO: TIntegerField;
     QMPropagaD_CANAL: TIntegerField;
     QMPropagaAUTO_EJERCICIOS: TIntegerField;
     QMPropagaMODO: TIntegerField;
     xEmpresas: TFIBDataSetRO;
     xCanales: TFIBDataSetRO;
     DSxEmpresas: TDataSource;
     DSxCanales: TDataSource;
     xSys_Canales: TFIBDataSetRO;
     DSxSys_Canales: TDataSource;
     xEmpresaDestino: TFIBDataSetRO;
     xCanalesDestino: TFIBDataSetRO;
     xSys_CanalesDestino: TFIBDataSetRO;
     DSxEmpresaDestino: TDataSource;
     DSxCanalesDestino: TDataSource;
     DSxSys_CanalesDestino: TDataSource;
     QMPropagaMODIFICA: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMPropagaCreate(Sender: TObject);
     procedure QMPropagaAfterOpen(DataSet: TDataSet);
     procedure QMPropagaO_EMPRESAChange(Sender: TField);
     procedure QMPropagaO_CANALChange(Sender: TField);
     procedure xCanalesAfterOpen(DataSet: TDataSet);
     procedure QMPropagaD_CANALChange(Sender: TField);
     procedure xCanalesDestinoAfterOpen(DataSet: TDataSet);
     procedure xEmpresaDestinoAfterOpen(DataSet: TDataSet);
     procedure QMPropagaNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure PropagaCanal;
  end;

var
  DMPropaga : TDMPropaga;

implementation

uses UDMMain, UFBusca, UEntorno;

{$R *.DFM}

procedure TDMPropaga.DMPropagaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMPropaga, '11100', True);
  xEmpresaDestino.Open;
end;

procedure TDMPropaga.QMPropagaAfterOpen(DataSet: TDataSet);
begin
  xEmpresas.Open;
  xCanales.Open;
end;

procedure TDMPropaga.QMPropagaO_EMPRESAChange(Sender: TField);
begin
  xEmpresas.Close;
  xEmpresas.Open;
end;

procedure TDMPropaga.QMPropagaO_CANALChange(Sender: TField);
begin
  xCanales.Close;
  xSys_Canales.Close;
  xCanales.Open;
end;

procedure TDMPropaga.xCanalesAfterOpen(DataSet: TDataSet);
begin
  xSys_canales.Open;
end;

procedure TDMPropaga.QMPropagaD_CANALChange(Sender: TField);
begin
  xCanalesDestino.Close;
  xSys_canalesDestino.Close;
  xCanalesDestino.Open;
end;

procedure TDMPropaga.xCanalesDestinoAfterOpen(DataSet: TDataSet);
begin
  xSys_CanalesDestino.Open;
end;

procedure TDMPropaga.xEmpresaDestinoAfterOpen(DataSet: TDataSet);
begin
  xCanalesDestino.Open;
end;

procedure TDMPropaga.QMPropagaNewRecord(DataSet: TDataSet);
begin
  QMPropagaO_EMPRESA.AsInteger := REntorno.Empresa;
  QMPropagaD_EMPRESA.AsInteger := REntorno.Empresa;
  QMPropagaO_CANAL.AsInteger := REntorno.Canal;
  QMPropagaO_EJERCICIO.AsInteger := REntorno.Ejercicio;
  QMPropagaMODO.AsInteger := 0;
  QMPropagaAUTO_EJERCICIOS.AsInteger := 1;
  QMPropagaMODIFICA.AsInteger := 1;
end;

procedure TDMPropaga.PropagaCanal;
var
  Procesados : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE C_CUENTAS_PROPAGA_CANALES_MODO( ');
        SQL.Add(' :O_EMPRESA, :O_EJERCICIO, :O_CANAL, :D_EMPRESA, :D_EJERCICIO, :D_CANAL, 4095, 0) ');
        Params.ByName['O_EMPRESA'].AsInteger := QMPropagaO_EMPRESA.AsInteger;
        Params.ByName['O_EJERCICIO'].AsInteger := QMPropagaO_EJERCICIO.AsInteger;
        Params.ByName['O_CANAL'].AsInteger := QMPropagaO_CANAL.AsInteger;
        Params.ByName['D_EMPRESA'].AsInteger := QMPropagaD_EMPRESA.AsInteger;
        Params.ByName['D_EJERCICIO'].AsInteger := QMPropagaD_EJERCICIO.AsInteger;
        Params.ByName['D_CANAL'].AsInteger := QMPropagaD_CANAL.AsInteger;
        ExecQuery;
        Procesados := FieldByName['PROCESADOS'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(format(_('Registros Procesados : %d'), [Procesados]));
end;

end.
