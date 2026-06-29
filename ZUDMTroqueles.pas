unit ZUDMTroqueles;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBTableDataSetRO, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, GIFImage, jpeg,
  ExtCtrls, HYFIBQuery;

type
  TZDMTroqueles = class(TDataModule)
     TLocal: THYTransaction;
     DSQMTroqueles: TDataSource;
     QMTroqueles: TFIBTableSet;
     QMTroquelesTROQUEL: TIntegerField;
     QMTroquelesANCHO: TFloatField;
     QMTroquelesAVANCE: TFloatField;
     QMTroquelesOBSERVACIONES: TBlobField;
     frDBDSOrdProd: TfrDBDataSet;
     frTroqueles: TfrHYReport;
     DSxLstTroqueles: TDataSource;
     TUpdate: THYTransaction;
     QMTroquelesPOS_Z: TIntegerField;
     QMTroquelesID_IMAGEN: TIntegerField;
     QMTroquelesTROQUEL_ESPECIAL: TIntegerField;
     QMTroquelesTROQUEL_OVALADO: TIntegerField;
     QMConstantes: TFIBTableSet;
     QMConstantesPATH_DOCUMENTOS: TFIBStringField;
     DSConstantes: TDataSource;
     QMTroquelesEMPRESA: TIntegerField;
     QMTroquelesSH_ANCHO: TFloatField;
     QMTroquelesSV_AVANCE: TFloatField;
     QMTroquelesFIGURAS_ANCHO: TFloatField;
     QMTroquelesFIGURAS_AVANCE: TFloatField;
     QMTroquelesBANDA: TFloatField;
     QMTroquelesMAQUINA: TIntegerField;
     QMTroquelesFORMA: TFIBStringField;
     QMTroquelesTREPADO: TIntegerField;
     QMTroquelesFECHA_ALTA: TDateTimeField;
     QMTroquelesARTICULO: TFIBStringField;
     QMTroquelesUTILLAJE: TFIBStringField;
     procedure ZDMTroquelesCreate(Sender: TObject);
     procedure QMTroquelesNewRecord(DataSet: TDataSet);
     procedure QMTroquelesBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     function DameTituloForma(Codigo: string): string;
  end;

var
  ZDMTroqueles : TZDMTroqueles;

implementation

{$R *.DFM}

uses UDMMain, uFBusca, UEntorno;

procedure TZDMTroqueles.ZDMTroquelesCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Primero hay que abrir Constantes. Se requiere para saber la ruta
  QMConstantes.Close;
  QMConstantes.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMConstantes.Open;

  DMMain.FiltraTabla(QMTroqueles, '10000', True);
end;

procedure TZDMTroqueles.QMTroquelesNewRecord(DataSet: TDataSet);
begin
  QMTroquelesEMPRESA.AsInteger := REntorno.Empresa;
  QMTroquelesTROQUEL.AsInteger := 0;
  QMTroquelesANCHO.AsFloat := 0;
  QMTroquelesAVANCE.AsFloat := 0;
end;

procedure TZDMTroqueles.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTroqueles, '10000');
end;

procedure TZDMTroqueles.QMTroquelesBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'CONTA_TROQUELES', 'TROQUEL');
end;

function TZDMTroqueles.DameTituloForma(Codigo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_AUXILIARES WHERE TIPO_AUX = ''FOR'' AND CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Codigo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
