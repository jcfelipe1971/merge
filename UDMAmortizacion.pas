unit UDMAmortizacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Math, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, SysUtils, HYFIBQuery, FIBDataSetRO;

type
  TDMAmortizacion = class(TDataModule)
     QMInmovilizado: TFIBTableSet;
     DSQMInmovilizado: TDataSource;
     xGrupos: TFIBDataSetRO;
     xGruposAmortizacion: TFIBDataSetRO;
     DSxGrupos: TDataSource;
     DSxGruposAmortizacion: TDataSource;
     DSQMAmortizaciones: TDataSource;
     xGruposGRUPO: TFIBStringField;
     xGruposTITULO: TFIBStringField;
     xGruposAmortizacionPORCENTAJE_MAX: TFloatField;
     xGruposAmortizacionPERIODO_MAX_ANYOS: TIntegerField;
     SPTraspasa: THYFIBQuery;
     SPBorraAsientos: THYFIBQuery;
     SPBorraUno: THYFIBQuery;
     QMAmortizaciones: TFIBTableSet;
     QMAmortizacionesEMPRESA: TIntegerField;
     QMAmortizacionesEJERCICIO: TIntegerField;
     QMAmortizacionesCANAL: TIntegerField;
     QMAmortizacionesARTICULO: TFIBStringField;
     QMAmortizacionesLINEA: TIntegerField;
     QMAmortizacionesFECHA: TDateTimeField;
     QMAmortizacionesVALOR_AMORTIZADO: TFloatField;
     QMAmortizacionesAMORTIZACION_ACUMULADA: TFloatField;
     QMAmortizacionesVALOR_ACTUAL: TFloatField;
     QMAmortizacionesCONTABILIZADO: TIntegerField;
     QMAmortizacionesRIC: TIntegerField;
     SPTraspasaTodos: THYFIBQuery;
     SPBorraTodos: THYFIBQuery;
     xCentroInventario: TFIBDataSetRO;
     DSxCentroInventario: TDataSource;
     xCentroInventarioCENTRO: TFIBStringField;
     xCentroInventarioTITULO: TFIBStringField;
     TLocal: THYTransaction;
     QMInmovilizadoEMPRESA: TIntegerField;
     QMInmovilizadoEJERCICIO: TIntegerField;
     QMInmovilizadoCANAL: TIntegerField;
     QMInmovilizadoARTICULO: TFIBStringField;
     QMInmovilizadoTITULO_ART: TFIBStringField;
     QMInmovilizadoCENTRO_INVENTARIO: TFIBStringField;
     QMInmovilizadoTIPO_BIEN: TIntegerField;
     QMInmovilizadoPAIS: TFIBStringField;
     QMInmovilizadoPADRE: TFIBStringField;
     QMInmovilizadoGRUPO: TFIBStringField;
     QMInmovilizadoVALOR_COMPRA: TFloatField;
     QMInmovilizadoVALOR_RESIDUAL: TFloatField;
     QMInmovilizadoVALOR_INI_EJE: TFloatField;
     QMInmovilizadoAMORTIZACION_AMUM_EJE: TFloatField;
     QMInmovilizadoAMORTIZACION_ACUMULADA: TFloatField;
     QMInmovilizadoVALOR_ACTUAL: TFloatField;
     QMInmovilizadoVALOR_FIN_EJE: TFloatField;
     QMInmovilizadoCUENTA_INMOVILIZADO: TFIBStringField;
     QMInmovilizadoCUENTA_AMORTIZACION: TFIBStringField;
     QMInmovilizadoCUENTA_GASTOS: TFIBStringField;
     QMInmovilizadoINDIRECTO: TIntegerField;
     QMInmovilizadoTIPO_AMORTIZACION: TFIBStringField;
     QMInmovilizadoCOEFICIENTE: TFloatField;
     QMInmovilizadoTASA: TFloatField;
     QMInmovilizadoFECHA_ADQUISICION: TDateTimeField;
     QMInmovilizadoFECHA_INICIO: TDateTimeField;
     QMInmovilizadoFECHA_ULT_AMORTIZACION: TDateTimeField;
     QMInmovilizadoFECHA_FIN_AMORTIZACION: TDateTimeField;
     QMInmovilizadoFECHA_BAJA: TDateTimeField;
     QMInmovilizadoNOTAS: TBlobField;
     QMInmovilizadoCANCELADO: TIntegerField;
     QMInmovilizadoPERIODOS_AMORTIZACION: TIntegerField;
     QMInmovilizadoENTRADA: TIntegerField;
     QMInmovilizadoSEGUNDA_MANO: TIntegerField;
     xGruposInmovilizado: TFIBTableSet;
     DSxGruposInmovilizado: TDataSource;
     xTipoAmortizacion: TFIBDataSetRO;
     DSxtipoAmortizacion: TDataSource;
     xPeriodosAmortizacion: TFIBDataSetRO;
     DSxPeriodosAmortizacion: TDataSource;
     xGruposInmovilizadoPAIS: TFIBStringField;
     xGruposInmovilizadoPADRE: TFIBStringField;
     xGruposInmovilizadoGRUPO: TFIBStringField;
     xGruposInmovilizadoGRUPO_TXT: TFIBStringField;
     xGruposInmovilizadoTITULO: TFIBStringField;
     xGruposInmovilizadoPORCENTAJE_MAX: TFloatField;
     xGruposInmovilizadoPERIODO_MAX_ANYOS: TIntegerField;
     xGruposInmovilizadoES_GRUPO: TIntegerField;
     xGruposInmovilizadoNIVEL: TIntegerField;
     xGruposInmovilizadoGRUPO_COMPLETO: TFIBStringField;
     xGruposInmovilizadoporcentaje_maximo: TFloatField;
     xGruposInmovilizadoperiodo_maximo: TFloatField;
     xGruposAmortizacionTITULO: TFIBStringField;
     xGruposAmortizacionGRUPO: TFIBStringField;
     xGruposAmortizacionPAIS: TFIBStringField;
     xGruposAmortizacionPADRE: TFIBStringField;
     xTipoAmortizacionTITULO: TFIBStringField;
     xPeriodosAmortizacionTITULO: TFIBStringField;
     QMInmovilizadoVALOR_BAJA: TFloatField;
     QMAmortizacionesVALOR_AMORTIZADO_CANAL: TFloatField;
     QMInmovilizadoVALOR_COMPRA_CANAL: TFloatField;
     QMInmovilizadoMONEDA: TFIBStringField;
     QMInmovilizadoVIDA_UTIL: TFloatField;
     TUpdate: THYTransaction;
     QMInmovilizadoVALOR_COMPRA_KRI: TFloatField;
     QMInmovilizadoCoste: TFIBTableSet;
     QMInmovilizadoCosteEMPRESA: TIntegerField;
     QMInmovilizadoCosteCANAL: TIntegerField;
     QMInmovilizadoCosteARTICULO: TFIBStringField;
     QMInmovilizadoCosteEJERCICIO: TIntegerField;
     QMInmovilizadoCosteDIGITO_1: TFIBStringField;
     QMInmovilizadoCosteDIGITO_2: TFIBStringField;
     QMInmovilizadoCosteDIGITO_3: TFIBStringField;
     QMInmovilizadoCosteDIGITO_4: TFIBStringField;
     QMInmovilizadoCosteDIGITO_5: TFIBStringField;
     QMInmovilizadoCosteSUBLINEA: TIntegerField;
     QMInmovilizadoCostePORCENTAJE: TFloatField;
     DSQMInmovilizadoCoste: TDataSource;
     QMInmovilizadoID_INMOVILIZADO: TIntegerField;
     procedure DMAmortizacionCreate(Sender: TObject);
     procedure QMInmovilizadoBeforePost(DataSet: TDataSet);
     procedure QMInmovilizadoAfterPost(DataSet: TDataSet);
     procedure QMInmovilizadoNewRecord(DataSet: TDataSet);
     procedure QMInmovilizadoVIDA_UTILChange(Sender: TField);
     procedure QMInmovilizadoCOEFICIENTEChange(Sender: TField);
     procedure QMInmovilizadoBeforeEdit(DataSet: TDataSet);
     procedure QMInmovilizadoAfterOpen(DataSet: TDataSet);
     procedure QMAmortizacionIIAfterPost(DataSet: TDataSet);
     procedure QMAmortizacionesNewRecord(DataSet: TDataSet);
     procedure QMInmovilizadoCENTRO_INVENTARIOChange(Sender: TField);
     procedure xGruposInmovilizadoCalcFields(DataSet: TDataSet);
     procedure QMInmovilizadoGRUPOChange(Sender: TField);
     procedure QMInmovilizadoSEGUNDA_MANOChange(Sender: TField);
     procedure QMAmortizacionesAfterPost(DataSet: TDataSet);
     procedure QMAmortizacionesAfterDelete(DataSet: TDataSet);
     procedure QMInmovilizadoPERIODOS_AMORTIZACIONChange(Sender: TField);
     procedure QMAmortizacionesBeforePost(DataSet: TDataSet);
     procedure QMAmortizacionesVALOR_AMORTIZADO_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMInmovilizadoVALOR_COMPRA_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMInmovilizadoMONEDAChange(Sender: TField);
     procedure SetPGCBeforeOpen(DataSet: TDataSet);
     procedure QMInmovilizadoVALOR_COMPRA_KRIChange(Sender: TField);
     procedure QMInmovilizadoAfterScroll(DataSet: TDataSet);
     procedure QMInmovilizadoBeforeClose(DataSet: TDataSet);
     procedure QMInmovilizadoCosteNewRecord(DataSet: TDataSet);
     procedure QMInmovilizadoCosteBeforePost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     AutoChange: boolean;
     Cambio: boolean;
     LocalMascaraN: string;
     Old_Cancelado: integer;
     SQL: TStrings;
     procedure CalculaTasa;
     procedure PosicionarUltimoContabilizado;
  public
     { Public declarations }
     procedure AsignaGrupo;
     procedure TraspasaAContabilidad;
     procedure BorraAsientos;
     procedure BorraUltimo;
     procedure TraspasaTodos;
     procedure BorraTodos;
     procedure Refresca;
     procedure MascarasMoneda;
     procedure BusquedaCompleja;
     procedure FiltrarSoloPendientes(Pendientes, Bajas: boolean);
  end;

var
  DMAmortizacion : TDMAmortizacion;

implementation

{$R *.DFM}

uses UEntorno, UDMMain, UUtiles, UFBusca, UParam;

procedure TDMAmortizacion.DMAmortizacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMInmovilizado, MascaraN, MascaraI, ShortDateFormat);
  QMInmovilizadoCOEFICIENTE.DisplayFormat := MascaraP;
  QMInmovilizadoVIDA_UTIL.DisplayFormat := '#0.##';
  // QMInmovilizadoPORCENTAJE_MAX.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMInmovilizadoCoste, MascaraN, MascaraI, ShortDateFormat);
  QMInmovilizadoCostePORCENTAJE.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMAmortizaciones, MascaraN, MascaraI, ShortDateFormat);

  SQL := TStringList.Create;
  SQL.Add(' SELECT * FROM VER_INMOVILIZADO_CUENTAS ');
  SQL.Add(' WHERE ');
  SQL.Add(' EMPRESA = ?EMPRESA AND ');
  SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
  SQL.Add(' CANAL = ?CANAL ');
  SQL.Add(' ORDER BY ARTICULO ');

  QMInmovilizado.SelectSQL.Assign(SQL);

  DMMain.FiltraTabla(QMInmovilizado, '11100', True);
  Cambio := False;
end;

procedure TDMAmortizacion.DataModuleDestroy(Sender: TObject);
begin
  SQL.Free;
end;

procedure TDMAmortizacion.AsignaGrupo;
begin
  with xGruposAmortizacion do
  begin
     QMInmovilizadoPAIS.AsString := FieldByName('PAIS').AsString;
     QMInmovilizadoPADRE.AsString := FieldByName('PADRE').AsString;
     QMInmovilizadoGRUPO.AsString := FieldByName('GRUPO').AsString;
     // QMInmovilizadoTITULO_GRUP.AsString := FieldByName('TITULO').AsString;
     // QMInmovilizadoPORCENTAJE_MAX.AsFloat := FieldByName('PORCENTAJE_MAX').AsFloat;
     // QMInmovilizadoPERIODOS_MAX_ANYOS.AsInteger:= FieldByName('PERIODO_MAX_ANYOS').AsInteger;
  end;
end;

procedure TDMAmortizacion.QMInmovilizadoBeforePost(DataSet: TDataSet);
var
  Confirma : boolean;
begin
  Confirma := True;
  if ((Old_Cancelado = 0) and (Old_Cancelado <> QMInmovilizadoCANCELADO.AsInteger)) then
     Confirma := ConfirmaGrave;

  if Confirma then
  begin
     {
     if Trunc(QMInmovilizadoFECHA_INICIO.AsDateTime) < Trunc(QMInmovilizadoFECHA_ADQUISICION.AsDateTime) then
       Raise Exception.Create(_('La fecha de inicio no puede ser menor que la de compra'));
     }
     if QMInmovilizadoFECHA_BAJA.AsDateTime < QMInmovilizadoFECHA_ADQUISICION.AsDateTime then
        QMInmovilizadoFECHA_BAJA.AsDateTime := QMInmovilizadoFECHA_ADQUISICION.AsDateTime;
     CalculaTasa;
  end
  else
     QMInmovilizado.Cancel;
end;

procedure TDMAmortizacion.QMInmovilizadoAfterPost(DataSet: TDataSet);
begin
  with QMAmortizaciones do
  begin
     Close;
     Open;
  end;
  PosicionarUltimoContabilizado;
end;

procedure TDMAmortizacion.QMInmovilizadoNewRecord(DataSet: TDataSet);
begin
  QMInmovilizadoFECHA_ADQUISICION.AsDateTime := REntorno.FechaTrab;
  QMInmovilizadoFECHA_INICIO.AsDateTime := REntorno.FechaTrab;
  QMInmovilizadoEMPRESA.AsInteger := REntorno.Empresa;
  QMInmovilizadoEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMInmovilizadoCANAL.AsInteger := REntorno.Canal;
  QMInmovilizadoTIPO_AMORTIZACION.AsString := 'CON';
  QMInmovilizadoPERIODOS_AMORTIZACION.AsInteger := 1;
  QMInmovilizadoCANCELADO.AsInteger := 0;
  QMInmovilizadoENTRADA.AsInteger := REntorno.Entrada;
  QMInmovilizadoINDIRECTO.AsInteger := BoolToInt((LeeParametro('AMOINDI001') = 'I'));
  QMInmovilizadoSEGUNDA_MANO.AsInteger := 0;
  QMInmovilizadoVALOR_ACTUAL.AsInteger := 0;
  QMInmovilizadoVALOR_COMPRA_KRI.AsInteger := 0;
  QMInmovilizadoVALOR_COMPRA.AsInteger := 0;
  QMInmovilizadoVALOR_BAJA.AsInteger := 0;
  QMInmovilizadoMONEDA.AsString := REntorno.Moneda;
  QMInmovilizadoTIPO_BIEN.AsInteger := 19;
  QMInmovilizadoFECHA_ULT_AMORTIZACION.AsDateTime := REntorno.FechaTrab;
  QMInmovilizadoFECHA_FIN_AMORTIZACION.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMAmortizacion.QMInmovilizadoVIDA_UTILChange(Sender: TField);
begin
  if not AutoChange then
  begin
     AutoChange := True;
     if Sender.AsFloat <> 0 then
        QMInmovilizadoCOEFICIENTE.AsFloat := 100 / Sender.AsFloat
     else
        QMInmovilizadoCOEFICIENTE.AsFloat := 0;
     AutoChange := False;
  end;
end;

procedure TDMAmortizacion.QMInmovilizadoCOEFICIENTEChange(Sender: TField);
begin
  if not AutoChange then
  begin
     AutoChange := True;
     if Sender.AsFloat <> 0 then
        QMInmovilizadoVIDA_UTIL.AsFloat := 100 / Sender.AsFloat
     else
        QMInmovilizadoVIDA_UTIL.AsFloat := 0;
     AutoChange := False;
  end;
end;

procedure TDMAmortizacion.CalculaTasa;
var
  Tasa, Base, Exponente : double;
begin
  if (QMInmovilizadoTIPO_AMORTIZACION.AsString <> 'DEC') then
     QMInmovilizadoTASA.AsFloat := 0
  else
  begin
     Exponente := 1 / QMInmovilizadoVIDA_UTIL.AsFloat;
     Base := QMInmovilizadoVALOR_RESIDUAL.AsFloat / QMInmovilizadoVALOR_COMPRA.AsFloat;
     Tasa := 1 - power(Base, Exponente);
     QMInmovilizadoTASA.AsFloat := Tasa;
  end;
end;

procedure TDMAmortizacion.TraspasaAContabilidad;
begin
  with SPTraspasa do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := QMInmovilizadoARTICULO.AsString;
     Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
  end;
end;

procedure TDMAmortizacion.BorraAsientos;
begin
  with SPBorraAsientos do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := QMInmovilizadoARTICULO.AsString;
     ExecQuery;
  end;
end;

procedure TDMAmortizacion.BorraUltimo;
begin
  with SPBorraUno do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO'].AsString := QMInmovilizadoARTICULO.AsString;
     ExecQuery;
  end;
end;

procedure TDMAmortizacion.QMInmovilizadoBeforeEdit(DataSet: TDataSet);
begin
  QMInmovilizadoENTRADA.AsInteger := REntorno.Entrada;
  Old_Cancelado := QMInmovilizadoCANCELADO.AsInteger;
end;

procedure TDMAmortizacion.QMInmovilizadoAfterOpen(DataSet: TDataSet);
begin
  QMAmortizaciones.Open;
  xGrupos.Open;
  xGruposAmortizacion.Open;
  xGruposInmovilizado.Open;
  xCentroInventario.Open;
  xTipoAmortizacion.Open;
  xPeriodosAmortizacion.Open;
  QMInmovilizadoCoste.Open;
  Autochange := False;
  PosicionarUltimoContabilizado;
end;

procedure TDMAmortizacion.Refresca;
begin
  QMInmovilizado.Refresh;
  PosicionarUltimoContabilizado;
end;

procedure TDMAmortizacion.QMAmortizacionIIAfterPost(DataSet: TDataSet);
begin
  Refresca;
end;

procedure TDMAmortizacion.QMAmortizacionesNewRecord(DataSet: TDataSet);
begin
  if (QMInmovilizado.State = dsInsert) or
     (QMInmovilizado.State = dsEdit) then
     QMInmovilizado.Post;
  QMAmortizacionesEMPRESA.AsInteger := REntorno.Empresa;
  QMAmortizacionesCANAL.AsInteger := REntorno.Canal;
  QMAmortizacionesARTICULO.AsString := QMInmovilizadoARTICULO.AsString;
end;

procedure TDMAmortizacion.TraspasaTodos;
begin
  with SPTraspasaTodos do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
  end;
end;

procedure TDMAmortizacion.BorraTodos;
begin
  with SPBorraTodos do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
  end;
end;

procedure TDMAmortizacion.QMInmovilizadoCENTRO_INVENTARIOChange(Sender: TField);
begin
  with xCentroInventario do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CENTRO_INVENTARIO'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TDMAmortizacion.xGruposInmovilizadoCalcFields(DataSet: TDataSet);
begin
  if QMInmovilizadoSEGUNDA_MANO.AsInteger = 1 then
  begin
     xGruposInmovilizadoporcentaje_maximo.AsFloat :=
        xGruposInmovilizadoPORCENTAJE_MAX.AsFloat * 2;
  end
  else
     xGruposInmovilizadoporcentaje_maximo.AsFloat :=
        xGruposInmovilizadoPORCENTAJE_MAX.AsFloat;

  xGruposInmovilizadoperiodo_maximo.AsInteger :=
     xGruposInmovilizadoPERIODO_MAX_ANYOS.AsInteger;
end;

procedure TDMAmortizacion.QMInmovilizadoGRUPOChange(Sender: TField);
begin
  with xGruposInmovilizado do
  begin
     Close;
     Open;
  end;
end;

procedure TDMAmortizacion.QMInmovilizadoSEGUNDA_MANOChange(Sender: TField);
begin
  with xGruposInmovilizado do
  begin
     Close;
     Open;
  end;
end;

procedure TDMAmortizacion.QMAmortizacionesAfterPost(DataSet: TDataSet);
var
  Articulo : string;
  Linea : integer;
begin
  Articulo := QMInmovilizadoARTICULO.AsString;
  Linea := QMAmortizacionesLINEA.AsInteger;

  if Cambio then
  begin
     Refrescar(QMInmovilizado, 'ARTICULO', Articulo);
     Refrescar(QMAmortizaciones, 'LINEA', Linea);
  end
  else
     Refrescar(QMAmortizaciones, 'LINEA', Linea);
end;

procedure TDMAmortizacion.QMAmortizacionesAfterDelete(DataSet: TDataSet);
begin
  QMAmortizaciones.Close;
  QMAmortizaciones.Open;
end;

procedure TDMAmortizacion.QMInmovilizadoPERIODOS_AMORTIZACIONChange(Sender: TField);
begin
  xPeriodosAmortizacion.Close;
  xPeriodosAmortizacion.Open;
end;

procedure TDMAmortizacion.QMAmortizacionesBeforePost(DataSet: TDataSet);
begin
  if (QMInmovilizadoTIPO_AMORTIZACION.AsString <> 'VAR') and
     (DataSet.State = dsEdit) then
     Cambio := True
  else
     Cambio := False;
end;

procedure TDMAmortizacion.MascarasMoneda;
begin
  if (Trim(QMInmovilizadoMONEDA.AsString) = '') then
     LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1)
  else
     LocalMascaraN := DMMain.MascaraMoneda(QMInmovilizadoMONEDA.AsString, 1);
  QMInmovilizadoVALOR_COMPRA.DisplayFormat := LocalMascaraN;
  QMInmovilizadoVALOR_RESIDUAL.DisplayFormat := LocalMascaraN;
  QMInmovilizadoAMORTIZACION_AMUM_EJE.DisplayFormat := LocalMascaraN;
  QMInmovilizadoAMORTIZACION_ACUMULADA.DisplayFormat := LocalMascaraN;
  QMInmovilizadoVALOR_ACTUAL.DisplayFormat := LocalMascaraN;
  QMInmovilizadoVALOR_FIN_EJE.DisplayFormat := LocalMascaraN;
  QMInmovilizadoVALOR_INI_EJE.DisplayFormat := LocalMascaraN;
  QMInmovilizadoVALOR_BAJA.DisplayFormat := LocalMascaraN;
  QMAmortizacionesVALOR_AMORTIZADO.DisplayFormat := LocalMascaraN;
  QMAmortizacionesVALOR_ACTUAL.DisplayFormat := LocalMascaraN;
  QMAmortizacionesAMORTIZACION_ACUMULADA.DisplayFormat := LocalMascaraN;
  QMInmovilizadoVALOR_COMPRA_KRI.DisplayFormat := LocalMascaraN;
end;

procedure TDMAmortizacion.QMAmortizacionesVALOR_AMORTIZADO_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  AuxVer, AuxCalculo : double;
begin
  DMMain.Cambios(QMInmovilizadoMONEDA.AsString, REntorno.Moneda,
     QMInmovilizadoFECHA_INICIO.AsDateTime, QMAmortizacionesVALOR_AMORTIZADO.AsFloat,
     AuxVer, AuxCalculo);
  Text := FormatFloat(MascaraN, AuxVer);
end;

procedure TDMAmortizacion.QMInmovilizadoVALOR_COMPRA_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  MascaraCampo : string;
begin
  if (Trim(QMInmovilizadoMONEDA.AsString) = '') then
  begin
     MascaraCampo := DMMain.MascaraMoneda(REntorno.Moneda, 1);
     Text := FormatFloat(MascaraCampo, QMInmovilizadoVALOR_COMPRA.AsFloat) + ' (' + REntorno.Moneda + ')';
  end
  else
  begin
     MascaraCampo := DMMain.MascaraMoneda(QMInmovilizadoMONEDA.AsString, 1);
     Text := FormatFloat(MascaraCampo, QMInmovilizadoVALOR_COMPRA.AsFloat) + ' (' + QMInmovilizadoMONEDA.AsString + ')';
  end;
end;

procedure TDMAmortizacion.QMInmovilizadoMONEDAChange(Sender: TField);
begin
  MascarasMoneda;
end;

procedure TDMAmortizacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMInmovilizado, '11100');
end;

procedure TDMAmortizacion.SetPGCBeforeOpen(DataSet: TDataSet);
begin
  TFIBDataSetRO(DataSet).Params.ByName['PGC'].AsInteger := REntorno.Pgc;
end;

procedure TDMAmortizacion.QMInmovilizadoVALOR_COMPRA_KRIChange(Sender: TField);
begin
  if (QMInmovilizadoVALOR_COMPRA.AsFloat = 0) then
     QMInmovilizadoVALOR_COMPRA.AsFloat := QMInmovilizadoVALOR_COMPRA_KRI.AsFloat;
end;

procedure TDMAmortizacion.QMInmovilizadoAfterScroll(DataSet: TDataSet);
begin
  MascarasMoneda;
  PosicionarUltimoContabilizado;
end;

procedure TDMAmortizacion.PosicionarUltimoContabilizado;
begin
  with QMAmortizaciones do
  begin
     DisableControls;
     try
        while (not EOF) and (QMAmortizacionesCONTABILIZADO.AsInteger = 1) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAmortizacion.QMInmovilizadoBeforeClose(DataSet: TDataSet);
begin
  QMAmortizaciones.Close;
  xGrupos.Close;
  xGruposAmortizacion.Close;
  xGruposInmovilizado.Close;
  xCentroInventario.Close;
  xTipoAmortizacion.Close;
  xPeriodosAmortizacion.Close;
  QMInmovilizadoCoste.Close;
end;

procedure TDMAmortizacion.QMInmovilizadoCosteNewRecord(DataSet: TDataSet);
begin
  QMInmovilizadoCosteEMPRESA.AsInteger := QMInmovilizadoEMPRESA.AsInteger;
  QMInmovilizadoCosteCANAL.AsInteger := QMInmovilizadoCANAL.AsInteger;
  QMInmovilizadoCosteARTICULO.AsString := QMInmovilizadoARTICULO.AsString;
  QMInmovilizadoCosteEJERCICIO.AsInteger := QMInmovilizadoEJERCICIO.AsInteger;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(PORCENTAJE) FROM CON_INMOV_CUENTAS_COSTES WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND ARTICULO=?ARTICULO AND EJERCICIO=?EJERCICIO';
        Params.ByName['EMPRESA'].AsInteger := QMInmovilizadoEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMInmovilizadoCANAL.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMInmovilizadoARTICULO.AsString;
        Params.ByName['EJERCICIO'].AsInteger := QMInmovilizadoEJERCICIO.AsInteger;
        ExecQuery;
        QMInmovilizadoCostePORCENTAJE.AsFloat := 100 - FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAmortizacion.QMInmovilizadoCosteBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(SUBLINEA) FROM CON_INMOV_CUENTAS_COSTES WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND ARTICULO=?ARTICULO AND EJERCICIO=?EJERCICIO';
           Params.ByName['EMPRESA'].AsInteger := QMInmovilizadoEMPRESA.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMInmovilizadoCANAL.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMInmovilizadoARTICULO.AsString;
           Params.ByName['EJERCICIO'].AsInteger := QMInmovilizadoEJERCICIO.AsInteger;
           ExecQuery;
           QMInmovilizadoCosteSUBLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMAmortizacion.FiltrarSoloPendientes(Pendientes, Bajas: boolean);
begin
  with QMInmovilizado do
  begin
     Close;

     if (Pendientes) then
     begin
        with SelectSQL do
        begin
           Clear;
           Add(' SELECT * FROM VER_INMOVILIZADO_CUENTAS ');
           Add(' WHERE ');
           Add(' EMPRESA = ?EMPRESA AND ');
           Add(' EJERCICIO = ?EJERCICIO AND ');
           Add(' CANAL = ?CANAL ');
           Add(' AND ARTICULO IN (SELECT DISTINCT (C.ARTICULO) FROM CON_INMOVILIZADOS C ');
           Add('                 JOIN CON_INMOVILIZADOS_DETALLE D ');
           Add('                 ON C.EMPRESA = D.EMPRESA AND C.CANAL = D.CANAL AND C.ARTICULO = D.ARTICULO ');
           Add('                 WHERE ');
           Add('                 C.EMPRESA = ?EMPRESA AND ');
           Add('                 C.CANAL = ?CANAL AND ');
           if (Bajas) then
              Add('              C.CANCELADO = 1 AND ');
           Add('                 D.EJERCICIO = ?EJERCICIO AND ');
           Add('                 D.CONTABILIZADO = 0 AND ');
           Add('                 D.FECHA <= ?FECHA) ');
           Add(' ORDER BY ARTICULO ');
        end;
     end
     else
        SelectSQL.Assign(SQL);

     DMMain.FiltraTabla(QMInmovilizado, '11100', False);

     if (Pendientes) then
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;

     Open;
  end;
end;

end.
