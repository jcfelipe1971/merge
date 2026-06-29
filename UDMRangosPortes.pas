unit UDMRangosPortes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery, FIBDataSetRO;

type
  TDMRangosPortes = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraTIPO: TIntegerField;
     QMCabeceraID_RANGO: TIntegerField;
     QMCabeceraRANGO: TIntegerField;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleRANGO: TIntegerField;
     QMDetalleINDICE: TIntegerField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleVALOR_1: TFloatField;
     QMDetalleVALOR_2: TFloatField;
     QMDetalleVALOR_3: TFloatField;
     QMDetalleVALOR_4: TFloatField;
     QMDetalleVALOR_5: TFloatField;
     QMDetalleVALOR_6: TFloatField;
     QMDetalleVALOR_7: TFloatField;
     QMDetalleVALOR_8: TFloatField;
     QMDetalleVALOR_9: TFloatField;
     QMDetalleVALOR_10: TFloatField;
     QMDetalleVALOR_11: TFloatField;
     QMDetalleVALOR_12: TFloatField;
     QMDetalleVALOR_13: TFloatField;
     QMDetalleVALOR_14: TFloatField;
     QMDetalleVALOR_15: TFloatField;
     QMDetalleVALOR_16: TFloatField;
     QMDetalleVALOR_17: TFloatField;
     QMDetalleVALOR_18: TFloatField;
     QMDetalleVALOR_19: TFloatField;
     QMDetalleVALOR_20: TFloatField;
     QMDetalleVALOR_21: TFloatField;
     QMDetalleVALOR_22: TFloatField;
     QMDetalleVALOR_23: TFloatField;
     QMDetalleVALOR_24: TFloatField;
     QMDetalleVALOR_25: TFloatField;
     QMDetalleID_RANGO: TIntegerField;
     QMDetalleID_INDICE: TIntegerField;
     xRangos: TFIBDataSetRO;
     xRangosRANGO_1: TFloatField;
     xRangosRANGO_2: TFloatField;
     xRangosRANGO_3: TFloatField;
     xRangosRANGO_4: TFloatField;
     xRangosRANGO_5: TFloatField;
     xRangosRANGO_6: TFloatField;
     xRangosRANGO_7: TFloatField;
     xRangosRANGO_8: TFloatField;
     xRangosRANGO_9: TFloatField;
     xRangosRANGO_10: TFloatField;
     xRangosRANGO_11: TFloatField;
     xRangosRANGO_12: TFloatField;
     xRangosRANGO_13: TFloatField;
     xRangosRANGO_14: TFloatField;
     xRangosRANGO_15: TFloatField;
     xRangosRANGO_16: TFloatField;
     xRangosRANGO_17: TFloatField;
     xRangosRANGO_18: TFloatField;
     xRangosRANGO_19: TFloatField;
     xRangosRANGO_20: TFloatField;
     xRangosRANGO_21: TFloatField;
     xRangosRANGO_22: TFloatField;
     xRangosRANGO_23: TFloatField;
     xRangosRANGO_24: TFloatField;
     xRangosRANGO_25: TFloatField;
     DSxRangosTMP: TDataSource;
     xRangosTMP: TFIBTableSet;
     xRangosTMPENTRADA: TIntegerField;
     xRangosTMPEMPRESA: TIntegerField;
     xRangosTMPRANGO: TIntegerField;
     xRangosTMPLINEA: TIntegerField;
     xRangosTMPID_RANGO: TIntegerField;
     xRangosTMPVALOR: TFloatField;
     TUpdate: THYTransaction;
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure xRangosTMPNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     function DameProximoRango: integer;
     procedure AsignaMascaras;
     function DameSiguienteIndice: integer;
     function DameLineaTMP: integer;
  public
     { Public declarations }
     function DameUnidadDeMedida: string;
     procedure TraspasaATMP;
     procedure BorraTemporal;
     procedure InsertaRangos;
     function BusquedaCompleja: boolean;
     procedure AsignaMascaraCabecera;
  end;

var
  DMRangosPortes : TDMRangosPortes;

implementation

uses UDMMain, UEntorno, uFBusca, UUtiles;

{$R *.dfm}

procedure TDMRangosPortes.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraRANGO.AsInteger := DameProximoRango;
  QMCabeceraTITULO.AsString := ' ';
  QMCabeceraTIPO.AsInteger := 1;
end;

function TDMRangosPortes.DameProximoRango: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(RANGO) AS RANGO FROM EMP_RANGOS WHERE EMPRESA = ?EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := FieldByName['RANGO'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRangosPortes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  with QMCabecera do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;

  AsignaMascaras;
end;

procedure TDMRangosPortes.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xRangos.Open;
end;

procedure TDMRangosPortes.AsignaMascaras;
begin
  AsignaMascaraCabecera;

  QMDetalleVALOR_1.DisplayFormat := MascaraN;
  QMDetalleVALOR_2.DisplayFormat := MascaraN;
  QMDetalleVALOR_3.DisplayFormat := MascaraN;
  QMDetalleVALOR_4.DisplayFormat := MascaraN;
  QMDetalleVALOR_5.DisplayFormat := MascaraN;
  QMDetalleVALOR_6.DisplayFormat := MascaraN;
  QMDetalleVALOR_7.DisplayFormat := MascaraN;
  QMDetalleVALOR_8.DisplayFormat := MascaraN;
  QMDetalleVALOR_9.DisplayFormat := MascaraN;
  QMDetalleVALOR_10.DisplayFormat := MascaraN;
  QMDetalleVALOR_11.DisplayFormat := MascaraN;
  QMDetalleVALOR_12.DisplayFormat := MascaraN;
  QMDetalleVALOR_13.DisplayFormat := MascaraN;
  QMDetalleVALOR_14.DisplayFormat := MascaraN;
  QMDetalleVALOR_15.DisplayFormat := MascaraN;
  QMDetalleVALOR_16.DisplayFormat := MascaraN;
  QMDetalleVALOR_17.DisplayFormat := MascaraN;
  QMDetalleVALOR_18.DisplayFormat := MascaraN;
  QMDetalleVALOR_19.DisplayFormat := MascaraN;
  QMDetalleVALOR_20.DisplayFormat := MascaraN;
  QMDetalleVALOR_21.DisplayFormat := MascaraN;
  QMDetalleVALOR_22.DisplayFormat := MascaraN;
  QMDetalleVALOR_23.DisplayFormat := MascaraN;
  QMDetalleVALOR_24.DisplayFormat := MascaraN;
  QMDetalleVALOR_25.DisplayFormat := MascaraN;
end;

procedure TDMRangosPortes.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMDetalleRANGO.AsInteger := QMCabeceraRANGO.AsInteger;
  QMDetalleID_RANGO.AsInteger := QMCabeceraID_RANGO.AsInteger;
  QMDetalleINDICE.AsInteger := DameSiguienteIndice;
  QMDetalleVALOR_1.AsFloat := 0;
  QMDetalleVALOR_2.AsFloat := 0;
  QMDetalleVALOR_3.AsFloat := 0;
  QMDetalleVALOR_4.AsFloat := 0;
  QMDetalleVALOR_5.AsFloat := 0;
  QMDetalleVALOR_6.AsFloat := 0;
  QMDetalleVALOR_7.AsFloat := 0;
  QMDetalleVALOR_8.AsFloat := 0;
  QMDetalleVALOR_9.AsFloat := 0;
  QMDetalleVALOR_10.AsFloat := 0;
  QMDetalleVALOR_11.AsFloat := 0;
  QMDetalleVALOR_12.AsFloat := 0;
  QMDetalleVALOR_13.AsFloat := 0;
  QMDetalleVALOR_14.AsFloat := 0;
  QMDetalleVALOR_15.AsFloat := 0;
  QMDetalleVALOR_16.AsFloat := 0;
  QMDetalleVALOR_17.AsFloat := 0;
  QMDetalleVALOR_18.AsFloat := 0;
  QMDetalleVALOR_19.AsFloat := 0;
  QMDetalleVALOR_20.AsFloat := 0;
  QMDetalleVALOR_21.AsFloat := 0;
  QMDetalleVALOR_22.AsFloat := 0;
  QMDetalleVALOR_23.AsFloat := 0;
  QMDetalleVALOR_24.AsFloat := 0;
  QMDetalleVALOR_25.AsFloat := 0;
end;

function TDMRangosPortes.DameSiguienteIndice: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(INDICE) AS INDICE FROM EMP_RANGOS_INDICES WHERE ID_RANGO = ?ID_RANGO';
        Params.ByName['ID_RANGO'].AsInteger := QMDetalleID_RANGO.AsInteger;
        ExecQuery;
        Result := (FieldByName['INDICE'].AsInteger + 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRangosPortes.QMDetalleBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_INDICES_RANGOS', 'ID_INDICE');
end;

function TDMRangosPortes.DameUnidadDeMedida: string;
begin
  case QMCabeceraTIPO.AsInteger of
     1: Result := _('Kg.');
     2:
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT SIGNO_MONEDA FROM SYS_MONEDAS WHERE MONEDA = ?MONEDA';
              Params.ByName['MONEDA'].AsString := REntorno.Moneda;
              ExecQuery;
              Result := FieldByName['SIGNO_MONEDA'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
     3: Result := _('Bultos');
  end;
end;

procedure TDMRangosPortes.TraspasaATMP;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_RANGOS_TEMPORALES(?ENTRADA, ?ID_RANGO, 0)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_RANGO'].AsInteger := QMCabeceraID_RANGO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xRangosTMP do
  begin
     Close;
     Params.ByName['ID_RANGO'].AsInteger := QMCabeceraID_RANGO.AsInteger;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMRangosPortes.BorraTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.Database;
        SQL.Text := 'DELETE FROM TMP_EMP_RANGO WHERE ID_RANGO = ?ID_RANGO AND ENTRADA = ?ENTRADA';
        Params.ByName['ID_RANGO'].AsInteger := QMCabeceraID_RANGO.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRangosPortes.InsertaRangos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_RANGOS_TEMPORALES(?ENTRADA, ?ID_RANGO, 1)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_RANGO'].AsInteger := QMCabeceraID_RANGO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMRangosPortes.DameLineaTMP: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) AS LINEA FROM TMP_EMP_RANGO WHERE ID_RANGO = ?ID_RANGO AND ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_RANGO'].AsInteger := QMCabeceraID_RANGO.AsInteger;
        ExecQuery;
        if (FieldByName['LINEA'].AsInteger = 25) then
           raise Exception.Create(_('No se pueden dar de alta mas rangos.'))
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) AS LINEA FROM TMP_EMP_RANGO WHERE ID_RANGO = ?ID_RANGO AND ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_RANGO'].AsInteger := QMCabeceraID_RANGO.AsInteger;
        ExecQuery;
        Result := FieldByName['LINEA'].AsInteger + 1;
     finally
        Free;
     end;
  end;
end;

procedure TDMRangosPortes.xRangosTMPNewRecord(DataSet: TDataSet);
begin
  xRangosTMPENTRADA.AsInteger := REntorno.Entrada;
  xRangosTMPEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  xRangosTMPRANGO.AsInteger := QMCabeceraRANGO.AsInteger;
  xRangosTMPLINEA.AsInteger := DameLineaTMP;
  xRangosTMPID_RANGO.AsInteger := QMCabeceraID_RANGO.AsInteger;
  xRangosTMPVALOR.AsInteger := 0;
end;

procedure TDMRangosPortes.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_RANGOS', 'ID_RANGO');
end;

function TDMRangosPortes.BusquedaCompleja: boolean;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '10000');
  Result := not (QMCabecera.RecordCount = 0);
end;

procedure TDMRangosPortes.AsignaMascaraCabecera;
var
  MascaraAsigna : string;
begin
  if ((QMCabeceraTIPO.AsInteger = 1) or (QMCabeceraTIPO.AsInteger = 3)) then
     MascaraAsigna := MascaraI
  else
     MascaraAsigna := MascaraN;

  // xRangos
  xRangosRANGO_1.DisplayFormat := MascaraAsigna;
  xRangosRANGO_2.DisplayFormat := MascaraAsigna;
  xRangosRANGO_3.DisplayFormat := MascaraAsigna;
  xRangosRANGO_4.DisplayFormat := MascaraAsigna;
  xRangosRANGO_5.DisplayFormat := MascaraAsigna;
  xRangosRANGO_6.DisplayFormat := MascaraAsigna;
  xRangosRANGO_7.DisplayFormat := MascaraAsigna;
  xRangosRANGO_8.DisplayFormat := MascaraAsigna;
  xRangosRANGO_9.DisplayFormat := MascaraAsigna;
  xRangosRANGO_10.DisplayFormat := MascaraAsigna;
  xRangosRANGO_11.DisplayFormat := MascaraAsigna;
  xRangosRANGO_12.DisplayFormat := MascaraAsigna;
  xRangosRANGO_13.DisplayFormat := MascaraAsigna;
  xRangosRANGO_14.DisplayFormat := MascaraAsigna;
  xRangosRANGO_15.DisplayFormat := MascaraAsigna;
  xRangosRANGO_16.DisplayFormat := MascaraAsigna;
  xRangosRANGO_17.DisplayFormat := MascaraAsigna;
  xRangosRANGO_18.DisplayFormat := MascaraAsigna;
  xRangosRANGO_19.DisplayFormat := MascaraAsigna;
  xRangosRANGO_20.DisplayFormat := MascaraAsigna;
  xRangosRANGO_21.DisplayFormat := MascaraAsigna;
  xRangosRANGO_22.DisplayFormat := MascaraAsigna;
  xRangosRANGO_23.DisplayFormat := MascaraAsigna;
  xRangosRANGO_24.DisplayFormat := MascaraAsigna;
  xRangosRANGO_25.DisplayFormat := MascaraAsigna;

  // xRangosTMP
  xRangosTMPRANGO.DisplayFormat := MascaraAsigna;
end;

procedure TDMRangosPortes.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xRangos.Close;
end;

end.
