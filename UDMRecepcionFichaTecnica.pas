unit UDMRecepcionFichaTecnica;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet;

type
  TDMRecepcionFichaTecnica = class(TDataModule)
     xRecepcion: TFIBTableSet;
     TLocal: THYTransaction;
     DSxRecepcion: TDataSource;
     TUpdate: THYTransaction;
     xRecepcionEMPRESA: TIntegerField;
     xRecepcionID_REP_RECEPCION: TIntegerField;
     xRecepcionID_FICHA_TECNICA: TIntegerField;
     xRecepcionMATRICULA: TFIBStringField;
     xRecepcionTITULO_VEHICULO: TFIBStringField;
     xRecepcionKILOMETRAJE: TIntegerField;
     xRecepcionCOMBUSTIBLE: TFloatField;
     xRecepcionID_CLIENTE: TIntegerField;
     xRecepcionCLIENTE: TIntegerField;
     xRecepcionNOMBRE_R_SOCIAL: TFIBStringField;
     xRecepcionID_REPARACION: TIntegerField;
     xRecepcionID_EMPLEADO: TIntegerField;
     xRecepcionEMPLEADO: TIntegerField;
     xRecepcionNOMBRE_EMPLEADO: TFIBStringField;
     xRecepcionFECHA: TDateTimeField;
     xRecepcionTESTIGO_AVERIA: TIntegerField;
     xRecepcionESTADO_PLACAS_MATRICULA: TIntegerField;
     xRecepcionESTADO_CRISTALES: TIntegerField;
     xRecepcionANTENA: TIntegerField;
     xRecepcionPILOTOS_Y_FAROS: TIntegerField;
     xRecepcionAPERTURA_PUERTAS_DELANTERAS: TIntegerField;
     xRecepcionAPERTURA_PUERTAS_TRASERAS: TIntegerField;
     xRecepcionELEVALUNAS_DELATEROS: TIntegerField;
     xRecepcionELEVALUNAS_TRASEROS: TIntegerField;
     xRecepcionRETROVISORES: TIntegerField;
     xRecepcionCOMENTARIO_ESTADO: TMemoField;
     xRecepcionTRABAJOS_A_REALIZAR: TMemoField;
     xRecepcionID_GALERIA_RECEPCION: TIntegerField;
     xRecepcionCOMENTARIOS_CLIENTE: TMemoField;
     xRecepcionAUTORIZA_PRESUPUESTO: TIntegerField;
     xRecepcionAUTORIZA_PRUEBAS: TIntegerField;
     xRecepcionPIEZAS_DEL_CLIENTE: TIntegerField;
     xRecepcionRECOGER_PIEZAS_SUSTITUIDAS: TIntegerField;
     xRecepcionID_FIRMA: TIntegerField;
     xRecepcionESTADO_ESCOBILLAS: TIntegerField;
     xPreITV: TFIBTableSet;
     DSxPreITV: TDataSource;
     xPreITVVerificacion: TFIBTableSet;
     DSPreITVVerificacion: TDataSource;
     xPreITVID_INSPECCION: TIntegerField;
     xPreITVID_RECEPCION: TIntegerField;
     xPreITVEMPRESA: TIntegerField;
     xPreITVID_FICHA_TECNICA: TIntegerField;
     xPreITVKILOMETROS: TFloatField;
     xPreITVFECHA: TDateTimeField;
     xPreITVOBSERVACIONES: TMemoField;
     xPreITVID_EMPLEADO: TIntegerField;
     xPreITVMATRICULA: TFIBStringField;
     xPreITVMARCA: TFIBStringField;
     xPreITVMODELO: TFIBStringField;
     xPreITVTITULO: TFIBStringField;
     xPreITVEMPLEADO: TIntegerField;
     xPreITVTERCERO: TIntegerField;
     xPreITVNOMBRE_R_SOCIAL: TFIBStringField;
     xPreITVVerificacionID_INSPECCION: TIntegerField;
     xPreITVVerificacionID_VERIFICACION: TIntegerField;
     xPreITVVerificacionORDEN: TIntegerField;
     xPreITVVerificacionTITULO: TFIBStringField;
     xPreITVVerificacionRESULTADO: TFIBStringField;
     xPreITVVerificacionREPARADO: TIntegerField;
     xPreITVVerificacionOBSERVACIONES: TFIBStringField;
     xRecepcionFECHA_HORA_CIERRE: TDateTimeField;
     xPreITVFECHA_HORA_CIERRE: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xRecepcionNewRecord(DataSet: TDataSet);
     procedure xRecepcionBeforePost(DataSet: TDataSet);
     procedure xRecepcionID_FICHA_TECNICAChange(Sender: TField);
     procedure BusquedaCompleja;
     procedure xRecepcionCLIENTEChange(Sender: TField);
     procedure xRecepcionEMPLEADOChange(Sender: TField);
     procedure xRecepcionAfterOpen(DataSet: TDataSet);
     procedure xRecepcionBeforeClose(DataSet: TDataSet);
     procedure xPreITVBeforeClose(DataSet: TDataSet);
     procedure xPreITVNewRecord(DataSet: TDataSet);
     procedure xPreITVBeforePost(DataSet: TDataSet);
     procedure xPreITVAfterOpen(DataSet: TDataSet);
     procedure xRecepcionFECHA_HORA_CIERREChange(Sender: TField);
     procedure xPreITVFECHA_HORA_CIERREChange(Sender: TField);
     procedure xPreITVEMPLEADOChange(Sender: TField);
  private

     { Private declarations }
  public
     { Public declarations }
     procedure Filtra(IdRecepcion, IdReparacion, IdFichaTecnica: integer);
     procedure FiltraFicha(Filtro: string);
  end;

var
  DMRecepcionFichaTecnica : TDMRecepcionFichaTecnica;

implementation

uses UDMMain, UEntorno, HYFIBQuery, uFBusca, Controls, UDMReparaciones, Variants, DateUtils, UDameDato;

{$R *.dfm}

procedure TDMRecepcionFichaTecnica.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Filtro la tabla por empresa y la abro
  DMMain.FiltraTabla(xRecepcion, '10000', True);
end;

procedure TDMRecepcionFichaTecnica.xRecepcionNewRecord(DataSet: TDataSet);
var
  i : integer;
begin
  // Pongo todos los campos INTEGER a cero.
  with xRecepcion do
  begin
     for i := 0 to FieldCount - 1 do
     begin
        if (Fields[i] is TIntegerField) then
           TIntegerField(Fields[i]).AsInteger := 0;
     end;
  end;

  xRecepcionEMPRESA.AsInteger := REntorno.Empresa;
  xRecepcionFECHA.AsDateTime := Now;
  xRecepcionCOMBUSTIBLE.AsFloat := 0;
  // xRecepcionFECHA_HORA_CIERRE.Clear;

  // Obtengo el empleado asociado al usuario
  (**
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_EMPLEADO, EMPLEADO FROM OPE_EMPLEADO WHERE EMPRESA = :EMPRESA AND USUARIO = :USUARIO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;
        xRecepcionID_EMPLEADO.AsInteger := FieldByName['ID_EMPLEADO'].AsInteger;
        xRecepcionEMPLEADO.AsInteger := FieldByName['EMPLEADO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  **)
end;

procedure TDMRecepcionFichaTecnica.xRecepcionBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_REP_RECEPCIONES', 'ID_REP_RECEPCION'); // ID
end;

procedure TDMRecepcionFichaTecnica.xRecepcionID_FICHA_TECNICAChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT R.MATRICULA, R.TITULO TITULO_FICHA_TECNICA, M.TITULO AS MARCA, R.MODELO, R.BASTIDOR, R.KILOMETRAJE, R.CLIENTE ');
        SQL.Add(' FROM REP_FICHA_TECNICA R ');
        SQL.Add(' JOIN SYS_MARCA M ON M.ID_MARCA = R.ID_MARCA ');
        SQL.Add(' WHERE ');
        SQL.Add(' R.ID_FICHA_TECNICA = :ID_FICHA_TECNICA ');
        Params.ByName['ID_FICHA_TECNICA'].AsInteger := xRecepcionID_FICHA_TECNICA.AsInteger;
        ExecQuery;
        xRecepcionMATRICULA.AsString := FieldByName['MATRICULA'].AsString;
        xRecepcionTITULO_VEHICULO.AsString := FieldByName['TITULO_FICHA_TECNICA'].AsString;
        xRecepcionKILOMETRAJE.AsFloat := FieldByName['KILOMETRAJE'].AsFloat;
        xRecepcionCLIENTE.AsInteger := FieldByName['CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRecepcionFichaTecnica.BusquedaCompleja;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(xRecepcion, '10000', True, '') = mrAll) then
  begin
     with xRecepcion do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_REP_RECEPCION ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA ');
        SelectSQL.Add(' ORDER BY MATRICULA ');
     end;
     DMMain.FiltraTabla(xRecepcion, '10000', True);
  end;
end;

procedure TDMRecepcionFichaTecnica.xRecepcionCLIENTEChange(Sender: TField);
begin
  xRecepcionNOMBRE_R_SOCIAL.AsString := DameTituloCliente(xRecepcionCLIENTE.AsInteger);
end;

procedure TDMRecepcionFichaTecnica.xRecepcionEMPLEADOChange(Sender: TField);
begin
  xRecepcionNOMBRE_EMPLEADO.AsString := DameTituloEmpleado(xRecepcionEMPLEADO.AsInteger);
end;

procedure TDMRecepcionFichaTecnica.Filtra(IdRecepcion, IdReparacion, IdFichaTecnica: integer);
begin
  if (IdRecepcion = 0) and (IdReparacion <> 0) then
  begin
     xRecepcion.Insert;
     xRecepcionID_REPARACION.AsInteger := IdReparacion;
     xRecepcionID_FICHA_TECNICA.AsInteger := IdFichaTecnica;
  end
  else
  begin
     with xRecepcion do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_REP_RECEPCION ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add(' ID_REP_RECEPCION = ?ID_REP_RECEPCION ');
        SelectSQL.Add(' ORDER BY MATRICULA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_REP_RECEPCION'].AsInteger := IdRecepcion;
        Open;
     end;
  end;
end;

procedure TDMRecepcionFichaTecnica.FiltraFicha(Filtro: string);
begin
  if (Trim(Filtro) <> '') then
  begin
     with xRecepcion do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_REP_RECEPCION ');
        SelectSQL.Add(' WHERE ' + Filtro);
        SelectSQL.Add(' ORDER BY MATRICULA ');
        Open;
     end;
  end;
end;

procedure TDMRecepcionFichaTecnica.xRecepcionAfterOpen(DataSet: TDataSet);
begin
  xPreITV.Open;
end;

procedure TDMRecepcionFichaTecnica.xRecepcionBeforeClose(DataSet: TDataSet);
begin
  xPreITV.Close;
end;

procedure TDMRecepcionFichaTecnica.xPreITVAfterOpen(DataSet: TDataSet);
begin
  xPreITVVerificacion.Open;
end;

procedure TDMRecepcionFichaTecnica.xPreITVBeforeClose(DataSet: TDataSet);
begin
  xPreITVVerificacion.Close;
end;

procedure TDMRecepcionFichaTecnica.xPreITVNewRecord(DataSet: TDataSet);
begin
  xPreITVID_RECEPCION.AsInteger := xRecepcionID_REP_RECEPCION.AsInteger;
  xPreITVID_FICHA_TECNICA.AsInteger := xRecepcionID_FICHA_TECNICA.AsInteger;
  xPreITVFECHA.AsDateTime := Now;
  // xPreITVFECHA_HORA_CIERRE.Clear;
  xPreITVMATRICULA.AsString := xRecepcionMATRICULA.AsString;
  xPreITVTITULO.AsString := xRecepcionTITULO_VEHICULO.AsString;
  xPreITVKILOMETROS.AsFloat := xRecepcionKILOMETRAJE.AsFloat;
end;

procedure TDMRecepcionFichaTecnica.xPreITVBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_PRE_ITV_INSPECCION', 'ID_INSPECCION');
end;

procedure TDMRecepcionFichaTecnica.xRecepcionFECHA_HORA_CIERREChange(Sender: TField);
begin
  // Modifico la hora de la fecha si esta rellenada y si el hora y minuto son diferentes de la actual
  // De lo contrario entra en bucle infinito
  if (xRecepcion.FieldByName('FECHA_HORA_CIERRE').Value > EncodeDate(2000, 1, 1)) and
     ((HourOf(xRecepcion.FieldByName('FECHA_HORA_CIERRE').Value) <> HourOf(Now)) or
     (MinuteOf(xRecepcion.FieldByName('FECHA_HORA_CIERRE').Value) <> MinuteOf(Now))) then
     xRecepcionFECHA_HORA_CIERRE.AsDateTime := RecodeTime(xRecepcionFECHA_HORA_CIERRE.AsDateTime, HourOf(Now), MinuteOf(Now), SecondOf(Now), 0);
end;

procedure TDMRecepcionFichaTecnica.xPreITVFECHA_HORA_CIERREChange(Sender: TField);
begin
  // Modifico la hora de la fecha si esta rellenada y si el hora y minuto son diferentes de la actual
  // De lo contrario entra en bucle infinito
  if (xPreITV.FieldByName('FECHA_HORA_CIERRE').Value > EncodeDate(2000, 1, 1)) and
     ((HourOf(xPreITV.FieldByName('FECHA_HORA_CIERRE').Value) <> HourOf(Now)) or
     (MinuteOf(xPreITV.FieldByName('FECHA_HORA_CIERRE').Value) <> MinuteOf(Now))) then
     xPreITVFECHA_HORA_CIERRE.AsDateTime := RecodeTime(xPreITVFECHA_HORA_CIERRE.AsDateTime, HourOf(Now), MinuteOf(Now), SecondOf(Now), 0);
end;

procedure TDMRecepcionFichaTecnica.xPreITVEMPLEADOChange(Sender: TField);
begin
  xPreITVID_EMPLEADO.AsInteger := DameIdEmpleado(xPreITVEMPLEADO.AsInteger);
end;

end.
