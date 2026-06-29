unit UProDMDefecto;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Forms, Windows, Dialogs;

type
  TProDMDefecto = class(TDataModule)
     TLocal: THYTransaction;
     QMDefecto: TFIBTableSet;
     DSQMDefecto: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleID: TIntegerField;
     QMDetalleID_CAB: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleCODIGO_DEFECTO: TIntegerField;
     QMDetalleCANTIDAD: TFloatField;
     QMDetalleDescDefecto: TStringField;
     xLineaDet: THYFIBQuery;
     QMDetalleEMPRESA: TIntegerField;
     SPMarcar: THYFIBQuery;
     TUpdate: THYTransaction;
     QMDefectoEMPRESA: TIntegerField;
     QMDefectoID: TIntegerField;
     QMDefectoFECHA: TDateTimeField;
     QMDefectoOP: TIntegerField;
     QMDefectoCOMPUESTO: TFIBStringField;
     QMDefectoTITULO_ARTICULO: TFIBStringField;
     QMDefectoFASE: TFIBStringField;
     QMDefectoTITULO_FASE: TFIBStringField;
     QMDefectoOPERARIO: TIntegerField;
     QMDefectoTITULO_OPERARIO: TFIBStringField;
     QMDefectoCANTIDAD_TERMINADAS: TFloatField;
     QMDefectoCUARTAS: TFloatField;
     QMDefectoTIRADO: TFloatField;
     QMDefectoACTUALIZADO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDefectoAfterOpen(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleDescDefectoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDefectoNewRecord(DataSet: TDataSet);
     procedure QMDefectoBeforeClose(DataSet: TDataSet);
     procedure QMDefectoBeforePost(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     TipoFiltro: smallint;
     function DameTituloDefecto(Defecto: integer): string;
  public
     { Public declarations }
     procedure FiltraMarcajes(aTipoFiltro: smallint; FechaDesde, FechaHasta: TDateTime);
     procedure MarcarFiltrados(FechaDesde, FechaHasta: TDateTime);
  end;

var
  ProDMDefecto : TProDMDefecto;

implementation

uses UDMMain, UProFMDefecto, UEntorno, UFParada;

{$R *.dfm}

procedure TProDMDefecto.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMDefecto.Open;
end;

procedure TProDMDefecto.QMDefectoAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TProDMDefecto.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if (QMDefecto.State in [dsInsert, dsEdit]) then
     QMDefecto.Post;

  QMDetalleEMPRESA.AsInteger := QMDefectoEMPRESA.AsInteger;
  QMDetalleID_Cab.AsInteger := QMDefectoID.AsInteger;

  //Núm. Línea
  xLineaDet.Close;
  xLineaDet.Params.ByName['id_cab'].AsInteger := QMDefectoID.AsInteger;
  xLineaDet.ExecQuery;
  QMDetalleLINEA.AsInteger := xLineaDet.FieldByName['NLinea'].AsInteger + 1;

  {Cantidad por defecto}
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT NUEVA_CANTIDAD FROM PRO_ORD_AJUSTA_DEFECTO(?EMPRESA,?ID_CAB)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_CAB'].AsInteger := QMDefectoID.AsInteger;
        ExecQuery;
        QMDetalleCANTIDAD.AsFloat := FieldByName['NUEVA_CANTIDAD'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMDefecto.QMDetalleDescDefectoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloDefecto(QMDetalleCODIGO_DEFECTO.AsInteger);
end;

procedure TProDMDefecto.FiltraMarcajes(aTipoFiltro: smallint; FechaDesde, FechaHasta: TDateTime);
var
  Where : string;
begin
  TipoFiltro := aTipoFiltro;
  Where := '';
  if TipoFiltro = 0 then
     Where := Where + ' AND actualizado=0'
  else if TipoFiltro = 1 then
     Where := Where + ' AND actualizado=1';

  if (FechaDesde > 0) then
  begin
     Where := Where + ' AND fecha>=?fecha_desde';
  end;

  if (FechaHasta > 0) then
  begin
     Where := Where + ' AND fecha<=?fecha_hasta';
  end;

  with QMDefecto do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_PRO_ORD_CAB_DEFECTO WHERE EMPRESA=?EMPRESA' + Where;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if FechaDesde > 0 then
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     if FechaHasta > 0 then
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta + 1;
     Open;
  end;
end;

procedure TProDMDefecto.QMDefectoNewRecord(DataSet: TDataSet);
begin
  QMDefectoEMPRESA.AsInteger := REntorno.Empresa;
  QMDefectoFECHA.AsDateTime := REntorno.FechaTrab;
end;

procedure TProDMDefecto.MarcarFiltrados(FechaDesde, FechaHasta: TDateTime);
begin
  with SPMarcar do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta + 1;
     ExecQuery;
     FreeHandle;
  end;

  FiltraMarcajes(TipoFiltro, FechaDesde, FechaHasta + 1);
end;

procedure TProDMDefecto.QMDefectoBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
end;

function TProDMDefecto.DameTituloDefecto(Defecto: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select descripcion from pro_sys_tipo_defecto where codigo_defecto=?codigo_defecto';
        Params.ByName['CODIGO_DEFECTO'].AsInteger := Defecto;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMDefecto.QMDefectoBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'PRO_CONTA_DEFECTO', 'ID');
end;

procedure TProDMDefecto.QMDetalleBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_PRO_DEFECTO_DET', 'ID');
end;

end.
