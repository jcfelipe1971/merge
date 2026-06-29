unit UProDMImputaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TProDMImputaciones = class(TDataModule)
     QMDetalle: TFIBTableSet;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleBRUTO: TFloatField;
     QMDetalleB_IMPONIBLE: TFloatField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleID_E: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleU_IMPUTADAS: TFloatField;
     QMDetalleU_PDTES_IMPUTAR: TFloatField;
     QMDetalleU_A_IMPUTAR: TFloatField;
     QMDetalleIMPUTADO: TIntegerField;
     QMDetalleENTRADA_IMPUTACION: TIntegerField;
     QMDetalleFECHA_IMPUTACION: TDateTimeField;
     QMDetalleIMPUTABLE: TIntegerField;
     QMDetalleID_ORDEN: TIntegerField;
     QMDetalleFASE_ORDEN: TIntegerField;
     DSQMDetalle: TDataSource;
     TLocal: THYTransaction;
     QMDetalleRIG_ORDEN: TIntegerField;
     QMDetalleB_DTO_LINEA: TFloatField;
     TUpdate: THYTransaction;
     QMDetalleFECHA_DOC: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleU_A_IMPUTARChange(Sender: TField);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     IdDocumento: integer;
     MostrandoLineasImputables: boolean;
     SQLBase: TStrings;
  public
     { Public declarations }
     FechaImputacion: TDateTime;
     UtilizarFechadocumento: boolean;
     procedure FiltrarDocumento(aIdDocumento: integer);
     procedure InsertarLineasProd(aIdDocumento: integer);
     procedure MostrarLineasImputables(Mostrar: boolean);
     procedure MarcarLineasDocumento;
     procedure TraspasarDocumento;
     procedure ImputarUnidadesLinea;
     procedure ImputarMarcados;
     procedure MarcarLineasDocImp(Marcar: boolean);
  end;

var
  ProDMImputaciones : TProDMImputaciones;

implementation

uses UDMMain, UEntorno, UUtiles, UFParadaExt;

{$R *.DFM}

procedure TProDMImputaciones.DataModuleCreate(Sender: TObject);
//var
//i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  MostrandoLineasImputables := True;

  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM PRO_VER_DETALLE_E_PROD ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' ID_E = :ID_E ');

  QMDetalle.SelectSQL.Text := SQLBase.Text;
  QMDetalle.SelectSQL.Add(' AND IMPUTABLE = 1 ORDER BY LINEA ');

  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
end;

procedure TProDMImputaciones.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TProDMImputaciones.FiltrarDocumento(aIdDocumento: integer);
begin
  IdDocumento := aIdDocumento;

  with QMDetalle do
  begin
     Close;

     if MostrandoLineasImputables then
        SelectSQL.Text := SQLBase.Text + ' AND IMPUTABLE = 1 ORDER BY LINEA '
     else
        SelectSQL.Text := SQLBase.Text + ' AND IMPUTABLE = 0 ORDER BY LINEA ';

     Params.ByName['ID_E'].AsInteger := IdDocumento;
     Open;
  end;
end;

procedure TProDMImputaciones.InsertarLineasProd(aIdDocumento: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO PRO_GES_DETALLES_E (ID_DETALLES_E) ');
        SQL.Add(' SELECT ID_DETALLES_E ');
        SQL.Add(' FROM GES_DETALLES_E ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_E = :ID_E AND ');
        SQL.Add(' ID_DETALLES_E NOT IN (SELECT ID_DETALLES_E FROM PRO_GES_DETALLES_E) ');
        Params.ByName['ID_E'].AsInteger := aIdDocumento;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Hacemos un update para que recalcule las unidades pdtes
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_GES_DETALLES_E SET ID_E = :ID_E WHERE ID_E = :ID_E ');
        Params.ByName['ID_E'].AsInteger := aIdDocumento;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMImputaciones.MostrarLineasImputables(Mostrar: boolean);
begin
  MostrandoLineasImputables := Mostrar;
  FiltrarDocumento(IdDocumento);
end;

procedure TProDMImputaciones.MarcarLineasDocumento;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE PRO_GES_DETALLES_E SET IMPUTADO = 1, ENTRADA_IMPUTACION = :ENTRADA WHERE ID_E = :ID_E';
        Params.ByName['ID_E'].AsInteger := IdDocumento;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  FiltrarDocumento(IdDocumento);
end;

procedure TProDMImputaciones.TraspasarDocumento;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_G_TRASPASO_IMP_A_PRO(:ID_E, :ENTRADA)';
        Params.ByName['ID_E'].AsInteger := IdDocumento;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        with TFParadaExt.Create(Self) do
        begin
           try
              repeat
              until ExecQuery(Q, _('Atención:'), 30000);
           finally
              Free;
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  FiltrarDocumento(IdDocumento);
end;

procedure TProDMImputaciones.QMDetalleNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TProDMImputaciones.QMDetalleU_A_IMPUTARChange(Sender: TField);
begin
  if (Sender.AsFloat <> 0) then
     QMDetalleENTRADA_IMPUTACION.AsInteger := REntorno.Entrada
  else
     QMDetalleENTRADA_IMPUTACION.AsInteger := 0;

  if (QMDetalleUNIDADES.AsFloat <= (Sender.AsFloat + QMDetalleU_IMPUTADAS.AsFloat)) then
     QMDetalleIMPUTADO.AsInteger := 1
  else
     QMDetalleIMPUTADO.AsInteger := 0;
end;

procedure TProDMImputaciones.ImputarUnidadesLinea;
begin
  with QMDetalle do
  begin
     if (RecordCount > 0) then
     begin
        if not (State = dsEdit) then
           Edit;
        QMDetalleU_A_IMPUTAR.AsFloat := QMDetalleUNIDADES.AsFloat - QMDetalleU_IMPUTADAS.AsFloat;
        Post;
     end;
  end;
end;

procedure TProDMImputaciones.ImputarMarcados;
begin
  if (QMDetalle.State = dsEdit) then
     QMDetalle.Post;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE PRO_GES_DETALLES_E SET IMPUTADO = 1, FECHA_IMPUTACION = :FECHA_IMP WHERE ID_E = :ID_E';
        Params.ByName['ID_E'].AsInteger := QMDetalleID_E.AsInteger;
        if UtilizarFechadocumento then
           Params.ByName['FECHA_IMP'].AsDateTime := QMDetalleFECHA_DOC.AsDateTime
        else
           Params.ByName['FECHA_IMP'].AsDateTime := FechaImputacion;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  FiltrarDocumento(IdDocumento);
end;

procedure TProDMImputaciones.MarcarLineasDocImp(Marcar: boolean);
begin
  // Los datos se introducen en edicion porque desde un procedimiento, al hacer commit, la linea_servida cambia y
  // se quedan como servidas y no aparecen en el grid
  with QMDetalle do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           Edit;

           QMDetalleIMPUTADO.AsInteger := BoolToInt(Marcar);
           if (Marcar) then
              QMDetalleU_A_IMPUTAR.AsFloat := QMDetalleUNIDADES.AsFloat - QMDetalleU_IMPUTADAS.AsFloat
           else
              QMDetalleU_A_IMPUTAR.AsFloat := 0;

           Next;
        end;

        First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TProDMImputaciones.QMDetalleBeforePost(DataSet: TDataSet);
begin
  // Es posa la data de imputació
  if (QMDetalle.State in [dsEdit, dsInsert]) then
  begin
     if UtilizarFechadocumento then
        QMDetalleFECHA_IMPUTACION.AsDateTime := QMDetalleFECHA_DOC.AsDateTime
     else
        QMDetalleFECHA_IMPUTACION.AsDateTime := FechaImputacion;
  end;
end;

end.
