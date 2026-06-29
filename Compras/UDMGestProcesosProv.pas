unit UDMGestProcesosProv;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO, FIBTableDataSetRO,
  SysUtils;

type
  TDMGestProcesosProv = class(TDataModule)
     DSxVerGesPrc: TDataSource;
     xSeries: TFIBDataSetRO;
     DSxSeries: TDataSource;
     xProcesos: TFIBDataSetRO;
     DSxProcesos: TDataSource;
     TLocal: THYTransaction;
     xVerGesPrc: TFIBTableSetRO;
     xVerGesPrcEMPRESA: TIntegerField;
     xVerGesPrcEJERCICIO: TIntegerField;
     xVerGesPrcCANAL: TIntegerField;
     xVerGesPrcSERIE: TFIBStringField;
     xVerGesPrcPROCESO: TFIBStringField;
     xVerGesPrcTIPO: TFIBStringField;
     xVerGesPrcCONTADOR: TIntegerField;
     xVerGesPrcANTERIOR: TIntegerField;
     xVerGesPrcENTRADA: TIntegerField;
     xVerGesPrcUSUARIO: TIntegerField;
     xVerGesPrcNOMBRE: TFIBStringField;
     xVerGesPrcFECHA_E: TDateTimeField;
     xVerGesPrcFECHA_S: TDateTimeField;
     xVerGesPrcUBICACION: TFIBStringField;
     xRecorre: TFIBDataSetRO;
     xRecorreENTRADA: TIntegerField;
     xRecorreEMPRESA: TIntegerField;
     xRecorreEJERCICIO: TIntegerField;
     xRecorreCANAL: TIntegerField;
     xRecorreSERIE: TFIBStringField;
     xRecorreRIG: TIntegerField;
     xRecorreID_S: TIntegerField;
     xRecorreESTADO: TIntegerField;
     xRecorreTIPO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMGestProcesosCreate(Sender: TObject);
     procedure xSeriesAfterOpen(DataSet: TDataSet);
     procedure xProcesosAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
  public
     function InicializaProceso(Tipo: string): integer;
     procedure AbreFactura(Tipo: string; id_e: integer);
     procedure BorraFactura(Empresa, Ejercicio, Canal, Factura, id_e: integer; Serie, Tipo: string);
     procedure AjustaContadores;
     procedure BorraTemporales;
     procedure BorraFacturacion(Tipo: string);
     function EsUltimaFacturacion(Tipo: string): boolean;
  end;

var
  DMGestProcesosProv : TDMGestProcesosProv;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMGestProcesosProv.DMGestProcesosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraRO(xSeries, '11100', True);
end;

procedure TDMGestProcesosProv.xSeriesAfterOpen(DataSet: TDataSet);
begin
  xProcesos.Open;
  with xVerGesPrc do
  begin
     Close;
     Params.ByName['Tipo'].AsString := xProcesos.FieldByName('Tipo').AsString;
     Open;
  end;
end;

procedure TDMGestProcesosProv.xProcesosAfterScroll(DataSet: TDataSet);
begin
  with xVerGesPrc do
  begin
     Close;
     Params.ByName['Tipo'].AsString := xProcesos.FieldByName('Tipo').AsString;
     Open;
  end;
end;

function TDMGestProcesosProv.InicializaProceso(Tipo: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ALBARANES_NO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :ENTRADA, :CONTADOR)';
        Params.ByName['EMPRESA'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xVerGesPrcCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := xVerGesPrcSERIE.AsString;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['CONTADOR'].AsInteger := xVerGesPrcCONTADOR.AsInteger;
        ExecQuery;
        Result := FieldByName['PROCESO_AUTO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xRecorre do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
     Params.ByName['Ejercicio'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
     // Params.ByName['Canal'].AsInteger := xVerGesPrcCANAL.AsInteger;
     Params.ByName['Serie'].AsString := xVerGesPrcSERIE.AsString;
     Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
     Params.ByName['PROC_AUTO'].AsInteger := xVerGesPrcCONTADOR.AsInteger;
     Open;
     First;
  end;
end;

procedure TDMGestProcesosProv.AbreFactura(Tipo: string; id_e: integer);
begin
  if (Tipo = 'FAP') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_PROV_ABRE(:ID_E)';
           Params.ByName['ID_E'].AsInteger := id_e;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMGestProcesosProv.BorraFactura(Empresa, Ejercicio, Canal, Factura, id_e: integer; Serie, Tipo: string);
begin
  if (Tipo = 'FAP') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_BORRA_RIG_ENTRADA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_E)';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['RIG'].AsInteger := Factura;
           Params.ByName['ID_E'].AsInteger := id_e;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMGestProcesosProv.AjustaContadores;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CONTADORES_AJUSTA_EMP_EJE(:EMPRESA, :EJERCICIO )';
        Params.ByName['EMPRESA'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMGestProcesosProv.BorraTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_DESHACER_FACTURACION WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMGestProcesosProv.BorraFacturacion(Tipo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_BORRA_PROC_AUTO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :CONTADOR)';
        Params.ByName['EMPRESA'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xVerGesPrcCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := xVerGesPrcSERIE.AsString;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['CONTADOR'].AsInteger := xVerGesPrcCONTADOR.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMGestProcesosProv.EsUltimaFacturacion(Tipo: string): boolean;
begin
  Result := False;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(CONTADOR) FROM GES_PROCESOS_AUTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' ANTERIOR = 0 ');
        Params.ByName['EMPRESA'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xVerGesPrcCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := xVerGesPrcSERIE.AsString;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;

        if ((not (FieldByName['MAX'].IsNull)) and
           (FieldByName['MAX'].AsInteger = xVerGesPrcCONTADOR.AsInteger)) then
           Result := True;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
