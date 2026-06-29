unit ZUDMMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TZDMMarcajes = class(TDataModule)
     TLocal: THYTransaction;
     QMMarcajes: TFIBTableSet;
     QMMarcajesID: TIntegerField;
     QMMarcajesPROCESADO: TIntegerField;
     QMMarcajesFECHA_LECTURA: TDateTimeField;
     QMMarcajesFECHA_PROCESADO: TDateTimeField;
     DSQMMarcajes: TDataSource;
     QMIncidencias: TFIBTableSet;
     QMIncidenciasID: TIntegerField;
     QMIncidenciasLINEA: TIntegerField;
     QMIncidenciasINCIDENCIA: TFIBStringField;
     QMIncidenciasDESC_INCIDENCIA: TFIBStringField;
     QMIncidenciasDescIncidencia: TStringField;
     DSQMIncidencias: TDataSource;
     xDescIncidencia: TFIBDataSetRO;
     xDescIncidenciaDESCRIPCION: TFIBStringField;
     QMMarcajesCADENA: TFIBStringField;
     QMIncidenciasCADENA: TFIBStringField;
     QMIncidenciasCADENA_ERR: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMMarcajesAfterOpen(DataSet: TDataSet);
     procedure QMMarcajesAfterScroll(DataSet: TDataSet);
     procedure QMMarcajesAfterPost(DataSet: TDataSet);
     procedure QMIncidenciasDescIncidenciaGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraMarcajes(TipoFiltro: smallint; FechaDesde, FechaHasta: TDateTime);
     procedure BorraMarcajes(Estado: smallint);
  end;

var
  ZDMMarcajes : TZDMMarcajes;

implementation

uses UDMMain, ZUFMMarcajes, UUtiles;

{$R *.dfm}

procedure TZDMMarcajes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TZDMMarcajes.FiltraMarcajes(TipoFiltro: smallint; FechaDesde, FechaHasta: TDateTime);
var
  Where : string;
begin
  Where := '';

  if (TipoFiltro = 0) then
     Where := ' WHERE PROCESADO = 0'
  else
  if (TipoFiltro = 1) then
     Where := ' WHERE PROCESADO = 1';

  if (FechaDesde > 0) then
  begin
     if Where = '' then
        Where := ' WHERE FECHA_LECTURA >= ?FECHA_DESDE '
     else
        Where := Where + ' AND FECHA_LECTURA >= ?FECHA_DESDE ';
  end;

  if (FechaHasta > 0) then
  begin
     if Where = '' then
        Where := 'WHERE FECHA_LECTURA <= ?FECHA_HASTA'
     else
        Where := Where + ' AND FECHA_LECTURA <= ?FECHA_HASTA';
  end;

  with QMMarcajes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM Z_MARCAJES ');
     SelectSQL.Add(Where);
     if (FechaDesde > 0) then
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     if (FechaHasta > 0) then
        Params.ByName['FECHA_HASTA'].AsDateTime := HourIntoDate(FechaHasta, '23:59:59');
     Open;
  end;
end;

procedure TZDMMarcajes.QMMarcajesAfterOpen(DataSet: TDataSet);
begin
  QMIncidencias.Close;
  QMIncidencias.Open;
end;

procedure TZDMMarcajes.QMMarcajesAfterScroll(DataSet: TDataSet);
begin
  with ZFMMarcajes do
  begin
     PnlDetalle.Enabled := not QMIncidencias.IsEmpty;
     if (QMIncidencias.IsEmpty) then
        LblIncidencias.Caption := _('SIN INCIDENCIAS')
     else
        LblIncidencias.Caption := _('CON INCIDENCIAS');
  end;
end;

procedure TZDMMarcajes.QMMarcajesAfterPost(DataSet: TDataSet);
begin
  with ZFMMarcajes do
  begin
     PnlDetalle.Enabled := not QMIncidencias.IsEmpty;
     if (QMIncidencias.IsEmpty) then
        LblIncidencias.Caption := _('SIN INCIDENCIAS')
     else
        LblIncidencias.Caption := _('CON INCIDENCIAS');
  end;
end;

procedure TZDMMarcajes.QMIncidenciasDescIncidenciaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescIncidencia.Close;
  xDescIncidencia.Open;

  Text := xDescIncidenciaDESCRIPCION.AsString;
end;

procedure TZDMMarcajes.BorraMarcajes(Estado: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM Z_MARCAJES ');
        if (Estado <> -1) then
           SQL.Add(' WHERE PROCESADO = ' + IntToStr(Estado));
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si borramos todos los marcajes, ponemos tambien el contador a 0
  if (Estado = -1) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SET GENERATOR Z_CONTA_MARCAJES TO 0';
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
