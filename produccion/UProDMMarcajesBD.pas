unit UProDMMarcajesBD;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Forms, Windows;

type
  TProDMMarcajesBD = class(TDataModule)
     TLocal: THYTransaction;
     QMMarcajes: TFIBTableSet;
     DSQMMarcajes: TDataSource;
     QMIncidencias: TFIBTableSet;
     DSQMIncidencias: TDataSource;
     xDescIncidencia: TFIBDataSetRO;
     xDescIncidenciaDESCRIPCION: TFIBStringField;
     QBorraMarcajes: THYFIBQuery;
     QMIncidenciasID_CAB: TIntegerField;
     QMIncidenciasESTADO: TIntegerField;
     QMIncidenciasCADENA: TFIBStringField;
     QMIncidenciasHORA_LECTURA: TFloatField;
     QMIncidenciasCADENA_ERR: TFIBStringField;
     QMIncidenciasINCIDENCIA: TFIBStringField;
     QMIncidenciasDESC_INCIDENCIA: TFIBStringField;
     QMMarcajesID: TIntegerField;
     QMMarcajesCADENA: TFIBStringField;
     QMMarcajesPROCESADO: TIntegerField;
     QMMarcajesFECHA_LECTURA: TDateTimeField;
     QMMarcajesFECHA_PROCESADO: TDateTimeField;
     QMMarcajesID_GRUPO: TIntegerField;
     QMMarcajesEMPRESA: TIntegerField;
     QMMarcajesEJERCICIO: TIntegerField;
     QMMarcajesCANAL: TIntegerField;
     QMMarcajesSERIE: TFIBStringField;
     QMIncidenciasID: TIntegerField;
     QMIncidenciasEMPRESA: TIntegerField;
     QMIncidenciasEJERCICIO: TIntegerField;
     QMIncidenciasCANAL: TIntegerField;
     QMIncidenciasSERIE: TFIBStringField;
     QTemp: THYFIBQuery;
     QMMarcajesHORA_PROCESADO: TFloatField;
     QMMarcajesID_TAREA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMMarcajesAfterOpen(DataSet: TDataSet);
     procedure QMMarcajesAfterScroll(DataSet: TDataSet);
     procedure QMMarcajesAfterPost(DataSet: TDataSet);
     procedure QMIncidenciasDescIncidenciaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMIncidenciasNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraMarcajes(TipoFiltro: smallint; FechaDesde, FechaHasta: TDateTime);
     procedure BorraMarcajes;
     procedure InsertaMarcajeManual(cadena, fecha: string; hora: integer);
     procedure BorrarMarcaje;
  end;

var
  ProDMMarcajesBD : TProDMMarcajesBD;

implementation

uses UDMMain, UProFMMarcajesBD, UEntorno, UFParada;

{$R *.dfm}

procedure TProDMMarcajesBD.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMIncidenciasHora_lectura.DisplayFormat := '00:00';
end;

procedure TProDMMarcajesBD.FiltraMarcajes(TipoFiltro: smallint; FechaDesde, FechaHasta: TDateTime);
var
  Where : string;
begin
  Where := '';

  if TipoFiltro = 0 then
     Where := 'WHERE procesado=1 or procesado=0'
  else if TipoFiltro = 1 then
     Where := 'WHERE procesado=2';

  if (FechaDesde > 0) then
  begin
     if Where = '' then
        Where := 'WHERE fecha_lectura>=?fecha_desde'
     else
        Where := Where + ' AND fecha_lectura>=?fecha_desde';
  end;

  if (FechaHasta > 0) then
  begin
     if Where = '' then
        Where := 'WHERE fecha_lectura<=?fecha_hasta'
     else
        Where := Where + ' AND fecha_lectura<=?fecha_hasta';
  end;

  with QMMarcajes do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM PRO_MARCAJES ' + Where;
     if FechaDesde > 0 then
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     if FechaHasta > 0 then
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta + 1;
     Open;
  end;
end;

procedure TProDMMarcajesBD.QMMarcajesAfterOpen(DataSet: TDataSet);
begin
  with QMIncidencias do
  begin
     Close;
     Open;
  end;
end;

procedure TProDMMarcajesBD.QMMarcajesAfterScroll(DataSet: TDataSet);
begin
  // SFG_RSL se cambian los mensajes porque se ha cambiado el proceso en BD
  (* ProFMMarcajesBD.PnlDetalle.Enabled := not QMIncidencias.IsEmpty;
     if (QMIncidencias.IsEmpty) then
    ProFMMarcajesBD.LblIncidencias.Caption := 'SIN INCIDENCIAS'
  else
    ProFMMarcajesBD.LblIncidencias.Caption := 'CON INCIDENCIAS'; *)

  if (QMMarcajesPROCESADO.AsInteger = 2) then
     ProFMMarcajesBD.LblIncidencias.Caption := 'SIN INCIDENCIAS'
  else if (QMMarcajesPROCESADO.AsInteger = 0) then
     ProFMMarcajesBD.LblIncidencias.Caption := 'CON INCIDENCIAS'
  else if (QMMarcajesPROCESADO.AsInteger = 1) then
     ProFMMarcajesBD.LblIncidencias.Caption := 'PROCESANDO';
end;

procedure TProDMMarcajesBD.QMMarcajesAfterPost(DataSet: TDataSet);
begin
  // SFG_RSL se cambian los mensajes porque se ha cambiado el proceso en BD
  (*  ProFMMarcajesBD.PnlDetalle.Enabled := not QMIncidencias.IsEmpty;
  if (QMIncidencias.IsEmpty) then
    ProFMMarcajesBD.LblIncidencias.Caption := 'SIN INCIDENCIAS'
  else
    ProFMMarcajesBD.LblIncidencias.Caption := 'CON INCIDENCIAS'; *)
  // SFG_RSL se cambian los mensajes porque se ha cambiado el proceso en BD
  if (QMMarcajesPROCESADO.AsInteger = 2) then
     ProFMMarcajesBD.LblIncidencias.Caption := 'SIN INCIDENCIAS'
  else if (QMMarcajesPROCESADO.AsInteger = 0) then
     ProFMMarcajesBD.LblIncidencias.Caption := 'CON INCIDENCIAS'
  else if (QMMarcajesPROCESADO.AsInteger = 1) then
     ProFMMarcajesBD.LblIncidencias.Caption := 'PROCESANDO';
end;

procedure TProDMMarcajesBD.QMIncidenciasDescIncidenciaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescIncidencia.Close;
  xDescIncidencia.Open;

  Text := xDescIncidenciaDESCRIPCION.AsString;
end;

procedure TProDMMarcajesBD.BorraMarcajes;
var
  SubSelect : string;
  j : integer;
begin
  SubSelect := QMMarcajes.SelectSQL.Text;
  j := 0;
  while QMMarcajes.SelectSQL.Text[j] <> '*' do
  begin
     j := j + 1;
     SubSelect[j] := ' ';
  end;

  SubSelect := ' (select id ' + SubSelect + ') ';

  //Actualitzar capçalera per permetre el borrat al detall
  with QTemp do
  begin
     Close;
     SQL.Text := 'update pro_marcajes set borrar_detalle = 1 where id in ' + SubSelect;
     Params.ByName['FECHA_DESDE'].AsDateTime := ProFMMarcajesBD.DEdESDE.Date;
     Params.ByName['FECHA_HASTA'].AsDateTime := ProFMMarcajesBD.DEHasta.Date + 1;

     TFParada.Create(Self).ExecQuery(QTemp);

     Close;
     SQL.Clear;
     SQL.Text := 'delete from pro_marcajes_det where id_cab in ' + SubSelect;
     Params.ByName['FECHA_DESDE'].AsDateTime := ProFMMarcajesBD.DEdESDE.Date;
     Params.ByName['FECHA_HASTA'].AsDateTime := ProFMMarcajesBD.DEHasta.Date + 1;

     TFParada.Create(Self).ExecQuery(QTemp);

     Close;
     SQL.Clear;
     SQL.Text := 'delete from pro_marcajes where id in' + SubSelect;
     Params.ByName['FECHA_DESDE'].AsDateTime := ProFMMarcajesBD.DEdESDE.Date;
     Params.ByName['FECHA_HASTA'].AsDateTime := ProFMMarcajesBD.DEHasta.Date + 1;

     TFParada.Create(Self).ExecQuery(QTemp);
     FreeHandle;
  end;
end;

procedure TProDMMarcajesBD.QMIncidenciasNewRecord(DataSet: TDataSet);
begin
  QMIncidenciasID_Cab.Value := QMMarcajesID.Value;
  QMIncidenciasEMPRESA.Value := REntorno.Empresa;
  QMIncidenciasEJERCICIO.Value := REntorno.Ejercicio;
  QMIncidenciasCANAL.Value := REntorno.Canal;
  QMIncidenciasSERIE.Value := REntorno.Serie;
end;

procedure TProDMMarcajesBD.InsertaMarcajeManual(cadena, fecha: string; hora: integer);
begin
  with QTemp do
  begin
     Close;
     SQL.Text := 'insert into pro_marcajes_det (cadena,empresa,ejercicio,canal, serie,fecha_lectura,hora_lectura)' +
        'values (?cadena,?empresa,?ejercicio,?canal,?serie,?fecha,?hora)';
     Params.ByName['CADENA'].AsString := Cadena;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['FECHA'].AsDateTime := StrToDateTime(Fecha);
     Params.ByName['HORA'].AsInteger := Hora;

     TFParada.Create(Self).ExecQuery(QTemp);
     FreeHandle;
  end;
end;

procedure TProDMMarcajesBD.BorrarMarcaje;
begin
  if (QMMarcajesID.AsInteger <> 0) then
  begin
     //Borrar detalls
     if (Application.MessageBox('ATENCION! Se eliminará el marcaje.' + #13#10 + '¿Desea Continuar?',
        'Warning', MB_ICONWARNING + MB_OKCANCEL) = idOk) then
     begin
        //Actualitzar capçalera per permetre el borrat al detall
        with QTemp do
        begin
           Close;
           SQL.Text := 'update pro_marcajes set borrar_detalle = 1 where id=?id';
           Params.ByName['ID'].AsInteger := QMMarcajesID.AsInteger;
           TFParada.Create(Self).ExecQuery(QTemp);
           FreeHandle;
        end;

        with QTemp do
        begin
           Close;
           SQL.Text := 'delete from pro_marcajes_det where id_cab=?id';
           Params.ByName['ID'].AsInteger := QMMarcajesID.AsInteger;
           TFParada.Create(Self).ExecQuery(QTemp);
           FreeHandle;
        end;

        //Borrar capçalera
        with QTemp do
        begin
           Close;
           SQL.Text := 'delete from pro_marcajes where id=?id';
           Params.ByName['ID'].AsInteger := QMMarcajesID.AsInteger;
           TFParada.Create(Self).ExecQuery(QTemp);
           FreeHandle;
        end;
     end;
     ProFMMarcajesBD.Filtrar;
  end;
end;

procedure TProDMMarcajesBD.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  ProFMMarcajesBD.Filtrar;
end;

end.
