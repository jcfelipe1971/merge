unit UDMAgrupacionFac;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, FIBTableDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMAgrupacionFac = class(TDataModule)
     QMAgrupacionFac: TFIBTableSet;
     TLocal: THYTransaction;
     QMAgrupacionFacCODIGO: TFIBStringField;
     QMAgrupacionFacTITULO: TFIBStringField;
     DSQMAgrupacionFac: TDataSource;
     QMAgrupacionFacDet: TFIBTableSet;
     DSQMAgrupacionFacDet: TDataSource;
     QMAgrupacionFacDetCODIGO: TFIBStringField;
     QMAgrupacionFacDetEMPRESA: TIntegerField;
     QMAgrupacionFacDetEJERCICIO: TIntegerField;
     QMAgrupacionFacDetCANAL: TIntegerField;
     QMAgrupacionFacDetSERIE: TFIBStringField;
     QMAgrupacionFacDetTIPO: TFIBStringField;
     QMAgrupacionFacDetRIG: TIntegerField;
     QMAgrupacionFacDetMONEDA: TFIBStringField;
     QMAgrupacionFacDetFORMA_PAGO: TFIBStringField;
     QMAgrupacionFacDetCLIENTE: TIntegerField;
     QMAgrupacionFacDetTERCERO: TIntegerField;
     QMAgrupacionFacDetTITULO: TFIBStringField;
     QMAgrupacionFacDetFECHA: TDateTimeField;
     QMAgrupacionFacDetTOTAL: TFloatField;
     QMAgrupacionFacDetREFERENCIA: TFIBStringField;
     QMAgrupacionFacDetPROCESAR: TIntegerField;
     DSxSeleccionCabeceras: TDataSource;
     QInsertaCabecera: THYFIBQuery;
     QMAgrupacionFacREFERENCIA: TFIBStringField;
     QMAgrupacionFacFECHA: TDateTimeField;
     QProcesar: THYFIBQuery;
     QMAgrupacionFacCERRAR: TIntegerField;
     QMAgrupacionFacDetLIQUIDO_MONEDA: TFloatField;
     xAgrupacion: TFIBDataSetRO;
     DSxAgrupacion: TDataSource;
     QRangos: THYFIBQuery;
     xSeleccionCabeceras: TFIBTableSetRO;
     xSeleccionCabecerasEMPRESA: TIntegerField;
     xSeleccionCabecerasEJERCICIO: TIntegerField;
     xSeleccionCabecerasCANAL: TIntegerField;
     xSeleccionCabecerasSERIE: TFIBStringField;
     xSeleccionCabecerasTIPO: TFIBStringField;
     xSeleccionCabecerasRIG: TIntegerField;
     xSeleccionCabecerasMONEDA: TFIBStringField;
     xSeleccionCabecerasFECHA: TDateTimeField;
     xSeleccionCabecerasCLIENTE: TIntegerField;
     xSeleccionCabecerasTERCERO: TIntegerField;
     xSeleccionCabecerasSU_REFERENCIA: TFIBStringField;
     xSeleccionCabecerasFORMA_PAGO: TFIBStringField;
     xSeleccionCabecerasLIQUIDO: TFloatField;
     xSeleccionCabecerasLIQUIDO_MONEDA: TFloatField;
     TUpdate: THYTransaction;
     procedure DMAgrupacionFacCreate(Sender: TObject);
     procedure QMAgrupacionFacAfterPost(DataSet: TDataSet);
     procedure QMAgrupacionFacAfterOpen(DataSet: TDataSet);
     procedure QMAgrupacionFacDetBeforeEdit(DataSet: TDataSet);
     procedure QMAgrupacionFacDetNewRecord(DataSet: TDataSet);
     procedure QMAgrupacionFacDetAfterPost(DataSet: TDataSet);
     procedure QMAgrupacionFacDetAfterDelete(DataSet: TDataSet);
     procedure QMAgrupacionFacNewRecord(DataSet: TDataSet);
     procedure QMAgrupacionFacDetLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xSeleccionCabecerasLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     procedure PonSQLAgrupacion;
  public
     { Public declarations }
     procedure PonSQLBase;
     procedure FiltraCabeceras;
     procedure InsertaCabecera;
     procedure RefrescaCabecera;
     procedure BusquedaCabeceras(var Modo: integer);
     procedure ProcesarFacturas;
     procedure FiltraporAgrupacion(agrupacion: string);
     procedure FiltraTituloAgrupacion(agrupacion: string);
     procedure FiltraFechas(Desde, Hasta: TDateTime; Agrupacion: string);
     procedure DameRangos(var Agrupacion: string; var Desde, Hasta: TDateTime);
     procedure Busqueda;
  end;

var
  DMAgrupacionFac : TDMAgrupacionFac;

implementation

uses UDMMain, UEntorno, UUtiles, UFBuscaRO, UFBusca;

{$R *.DFM}

procedure TDMAgrupacionFac.DMAgrupacionFacCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  PonSQLBase;
  QMAgrupacionFac.Open;
end;

procedure TDMAgrupacionFac.QMAgrupacionFacAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMAgrupacionFac.QMAgrupacionFacAfterOpen(DataSet: TDataSet);
begin
  QMAgrupacionFacDet.Open;
end;

procedure TDMAgrupacionFac.QMAgrupacionFacDetBeforeEdit(DataSet: TDataSet);
begin
  if ((QMAgrupacionFac.State = dsInsert) or (QMAgrupacionFac.State = dsEdit)) then
  begin
     QMAgrupacionFac.Post;
     QMAgrupacionFacDet.Edit;
  end;
end;

procedure TDMAgrupacionFac.QMAgrupacionFacDetNewRecord(DataSet: TDataSet);
begin
  if ((QMAgrupacionFac.State = dsInsert) or (QMAgrupacionFac.State = dsEdit)) then
  begin
     QMAgrupacionFac.Post;
  end;

  DataSet.Cancel;
end;

procedure TDMAgrupacionFac.FiltraCabeceras;
begin
  // Ponemos el Query para evitar problemas
  PonSQLBase;
  DMMain.FiltraRO(xSeleccionCabeceras, '11100', False);
  with xSeleccionCabeceras do
  begin
     Params.ByName['CODIGO'].AsString := QMAgrupacionFacCODIGO.AsString;
     Open;
  end;
end;

procedure TDMAgrupacionFac.InsertaCabecera;
begin
  if (xSeleccionCabeceras.RecordCount > 0) then
     with QInsertaCabecera do
     begin
        Close;
        Params.ByName['CODIGO'].AsString := QMAgrupacionFacCODIGO.AsString;
        Params.ByName['EMPRESA'].AsInteger := xSeleccionCabecerasEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xSeleccionCabecerasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xSeleccionCabecerasCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := xSeleccionCabecerasSERIE.AsString;
        Params.ByName['TIPO'].AsString := xSeleccionCabecerasTIPO.AsString;
        Params.ByName['RIG'].AsInteger := xSeleccionCabecerasRIG.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
end;

procedure TDMAgrupacionFac.RefrescaCabecera;
begin
  QMAgrupacionFacDet.Close;
  QMAgrupacionFacDet.Open;
  xSeleccionCabeceras.Close;
  xSeleccionCabeceras.Open;
end;

procedure TDMAgrupacionFac.BusquedaCabeceras(var Modo: integer);
var
  posicion : integer;
  cadenatemp, resto : string;
begin
  Modo := TFBuscaRO.Create(Self).SeleccionaBusqueda(xSeleccionCabeceras, '00000', False);
  if Modo = mrOk then

  begin
     // Añadimos el alias
     posicion := Pos('GES_CABECERAS_S', xSeleccionCabeceras.SelectSQL.Text);
     cadenatemp := Copy(xSeleccionCabeceras.SelectSQL.Text, 1, posicion + 15);
     resto := Copy(xSeleccionCabeceras.SelectSQL.Text,
        posicion + 16, Length(xSeleccionCabeceras.SelectSQL.Text) - Length(cadenatemp));
     cadenatemp := cadenatemp + 'CAB' + resto;
     with xSeleccionCabeceras do
     begin
        SelectSQL.Clear;
        SelectSQL.Add(cadenatemp);

        // Añadimos where
        SelectSQL.Add('AND CAB.RIG NOT IN (SELECT RIG FROM SYS_AGRUPACION_FAC_DETALLE DET WHERE ' +
           '((CAB.EMPRESA   = DET.EMPRESA   ) AND' +
           ' (CAB.EJERCICIO = DET.EJERCICIO ) AND' +
           ' (CAB.CANAL     = DET.CANAL     ) AND' +
           ' (CAB.SERIE     = DET.SERIE     ) AND' +
           ' (CAB.TIPO      = DET.TIPO      ) AND' +
           ' (CAB.RIG       = DET.RIG       ) AND' +
           ' (DET.CODIGO    = ?CODIGO       )))' +
           ' AND CAB.TIPO = ''FAC''');
        Params.ByName['CODIGO'].AsString := QMAgrupacionFacCODIGO.AsString;
        Open;
     end;
  end
  else
     FiltraCabeceras;
end;

procedure TDMAgrupacionFac.QMAgrupacionFacDetAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMAgrupacionFac.QMAgrupacionFacDetAfterDelete(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMAgrupacionFac.QMAgrupacionFacNewRecord(DataSet: TDataSet);
begin
  QMAgrupacionFacREFERENCIA.AsString := '';
  QMAgrupacionFacFECHA.AsDateTime := REntorno.FechaTrab;
  QMAgrupacionFacCERRAR.AsInteger := 0;
end;

procedure TDMAgrupacionFac.ProcesarFacturas;
begin
  with QProcesar do
  begin
     Params.ByName['CODIGO'].AsString := QMAgrupacionFacCODIGO.AsString;
     Params.ByName['REFERENCIA'].AsString := QMAgrupacionFacREFERENCIA.AsString;
     Params.ByName['FECHA'].AsDateTime := QMAgrupacionFacFECHA.AsDateTime;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['CERRAR'].AsInteger := QMAgrupacionFacCERRAR.AsInteger;
     ExecQuery;
     FreeHandle;
     ShowMessage(_('PROCESO TERMINADO CON EXITO'));
  end;
end;

procedure TDMAgrupacionFac.QMAgrupacionFacDetLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMAgrupacionFacDetMONEDA.AsString, 1),
     QMAgrupacionFacDetTOTAL.AsFloat);
end;

procedure TDMAgrupacionFac.FiltraporAgrupacion(agrupacion: string);
begin
  PonSQLAgrupacion;
  DMMain.FiltraRO(xSeleccionCabeceras, '11100', 1 = 0);
  with xSeleccionCabeceras do
  begin
     Params.ByName['CODIGO'].AsString := QMAgrupacionFacCODIGO.AsString;
     Params.ByName['AGRUPACION'].AsString := agrupacion;
     Open;
  end;
end;

procedure TDMAgrupacionFac.FiltraTituloAgrupacion(agrupacion: string);
begin
  with xAgrupacion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGRUPACION'].AsString := agrupacion;
     Open;
  end;
end;

procedure TDMAgrupacionFac.PonSQLBase;
begin
  with xSeleccionCabeceras do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' select * from ges_cabeceras_s cab ' +
        'where cab.rig not in ' +
        '(select rig from sys_agrupacion_fac_detalle det ' +
        'where ((det.empresa   = cab.empresa  ) and ' +
        '(det.ejercicio = cab.ejercicio) and ' +
        '(det.canal     = cab.canal    ) and ' +
        '(det.serie     = cab.serie    ) and ' +
        '(det.tipo      = cab.tipo     ) and ' +
        '(det.rig       = cab.rig      ) and ' +
        '(det.codigo = ?CODIGO))) ' +
        'and cab.empresa   = ?EMPRESA   and ' +
        'cab.ejercicio = ?EJERCICIO and ' +
        'cab.canal     = ?CANAL     and ' +
        'cab.tipo      = ''FAC''');
  end;
end;

procedure TDMAgrupacionFac.PonSQLAgrupacion;
begin
  with xSeleccionCabeceras do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('select * from ges_cabeceras_s cab ' +
        'join emp_agrupaciones_cli agr ' +
        'on (cab.cliente   = agr.cliente and ' +
        'cab.empresa   = agr.empresa) ' +
        'where cab.rig not in ' +
        '(select rig from sys_agrupacion_fac_detalle det ' +
        'where ((det.empresa   = cab.empresa  ) and ' +
        '(det.ejercicio = cab.ejercicio) and ' +
        '(det.canal     = cab.canal    ) and ' +
        '(det.serie     = cab.serie    ) and ' +
        '(det.tipo      = cab.tipo     ) and ' +
        '(det.rig       = cab.rig      ) and ' +
        '(det.codigo = ?CODIGO))) ' +
        'and cab.empresa   = ?EMPRESA   and ' +
        'cab.ejercicio = ?EJERCICIO and ' +
        'cab.canal     = ?CANAL     and ' +
        'cab.tipo      = ''FAC'' and ' +
        'agr.agrupacion = ?AGRUPACION');
  end;
end;

procedure TDMAgrupacionFac.FiltraFechas(Desde, Hasta: TDateTime; Agrupacion: string);
begin
  with xSeleccionCabeceras do
  begin
     Close;

     // Le añadimos parametros de fecha
     if Pos('cab.fecha', SelectSQL.Text) = 0 then
        SelectSQL.Add(' and cab.fecha >= ?DESDE and cab.fecha <= ?HASTA');

     Params.ByName['DESDE'].AsDateTime := Desde;
     Params.ByName['HASTA'].AsDateTime := Hasta;

     // Evaluamos si el SQL viene del filtrador o es propio.
     if ExisteParametro(xSeleccionCabeceras, 'EMPRESA') then
     begin
        if ExisteParametro(xSeleccionCabeceras, 'AGRUPACION') then
           Params.ByName['AGRUPACION'].AsString := Agrupacion;
        DMMain.FiltraRO(xSeleccionCabeceras, '11100', 1 = 0);
        Params.ByName['CODIGO'].AsString := QMAgrupacionFacCODIGO.AsString;
     end;
     Open;
  end;
end;

procedure TDMAgrupacionFac.DameRangos(var Agrupacion: string; var Desde, Hasta: TDateTime);
begin
  // Agrupacion
  with QRangos do
  begin
     SQL.Clear;
     SQL.Add('select min(agrupacion) as AGRUPACION from ver_agrupaciones_cliente ' +
        'where empresa=?EMPRESA');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Agrupacion := FieldByName['AGRUPACION'].AsString;
     FreeHandle;
  end;

  // Fechas
  with QRangos do
  begin
     SQL.Clear;
     SQL.Add(' select min (cab.fecha) as DESDE, max (cab.fecha) as HASTA' +
        ' from ges_cabeceras_s cab ' +
        'where cab.rig not in ' +
        '(select rig from sys_agrupacion_fac_detalle det ' +
        'where ((det.empresa   = cab.empresa  ) and ' +
        '(det.ejercicio = cab.ejercicio) and ' +
        '(det.canal     = cab.canal    ) and ' +
        '(det.serie     = cab.serie    ) and ' +
        '(det.tipo      = cab.tipo     ) and ' +
        '(det.rig       = cab.rig      ) and ' +
        '(det.codigo = ?CODIGO))) ' +
        'and cab.empresa   = ?EMPRESA   and ' +
        'cab.ejercicio = ?EJERCICIO and ' +
        'cab.canal     = ?CANAL     and ' +
        'cab.tipo      = ''FAC''');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CODIGO'].AsString := QMAgrupacionFacCODIGO.AsString;
     ExecQuery;
     Desde := FieldByName['DESDE'].AsDateTime;
     Hasta := FieldByName['HASTA'].AsDateTime;
     FreeHandle;
  end;
end;

procedure TDMAgrupacionFac.Busqueda;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMAgrupacionFac, '00000', True);
end;

procedure TDMAgrupacionFac.xSeleccionCabecerasLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(xSeleccionCabecerasMONEDA.AsString, 1),
     xSeleccionCabecerasLIQUIDO.AsFloat);
end;

end.
