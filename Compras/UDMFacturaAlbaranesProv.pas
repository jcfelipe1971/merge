unit UDMFacturaAlbaranesProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, SysUtils, HYFIBQuery, FIBDataSetRO;

type
  TDMFacturaAlbaranesProv = class(TDataModule)
     QMAlbaranes: TFIBTableSet;
     DSQMAlbaranes: TDataSource;
     QMAlbaranesEMPRESA: TIntegerField;
     QMAlbaranesEJERCICIO: TIntegerField;
     QMAlbaranesCANAL: TIntegerField;
     QMAlbaranesSERIE: TFIBStringField;
     QMAlbaranesTIPO: TFIBStringField;
     QMAlbaranesRIG: TIntegerField;
     QMAlbaranesALMACEN: TFIBStringField;
     QMAlbaranesMONEDA: TFIBStringField;
     QMAlbaranesFECHA: TDateTimeField;
     QMAlbaranesPROVEEDOR: TIntegerField;
     QMAlbaranesTERCERO: TIntegerField;
     QMAlbaranesTITULO: TFIBStringField;
     QMAlbaranesNOTAS: TBlobField;
     QMAlbaranesESTADO: TIntegerField;
     QMAlbaranesBULTOS: TIntegerField;
     QMAlbaranesLINEAS: TIntegerField;
     QMAlbaranesBRUTO: TFloatField;
     QMAlbaranesI_DTO_LINEAS: TFloatField;
     QMAlbaranesS_BASES: TFloatField;
     QMAlbaranesS_CUOTA_IVA: TFloatField;
     QMAlbaranesS_CUOTA_RE: TFloatField;
     QMAlbaranesB_DTO_LINEAS: TFloatField;
     QMAlbaranesDTO_PP: TFloatField;
     QMAlbaranesDTO_CIAL: TFloatField;
     QMAlbaranesI_DTO_CIAL: TFloatField;
     QMAlbaranesI_DTO_PP: TFloatField;
     QMAlbaranesLIQUIDO: TFloatField;
     QMAlbaranesENTRADA: TIntegerField;
     QMAlbaranesNUM_ALBARAN: TFIBStringField;
     QMAlbaranesENTRADA_FACTURACION: TIntegerField;
     TLocal: THYTransaction;
     QMAlbaranesID_E: TIntegerField;
     xDocumentos: TFIBDataSetRO;
     DSxDocumentos: TDataSource;
     TUpdate: THYTransaction;
     procedure DMFacturaAlbaranesProvCreate(Sender: TObject);
     procedure QMAlbaranesNewRecord(DataSet: TDataSet);
     procedure QMAlbaranesLIQUIDOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMAlbaranesAfterOpen(DataSet: TDataSet);
     procedure QMAlbaranesENTRADA_FACTURACIONChange(Sender: TField);
  private
     { Private declarations }
     Contador: integer;
     SerieFacturada: string;
     ImporteSeleccionado: double;
     LocalMascaraN: string;
     procedure AbreDocumentos;
     procedure FiltraQuery(Proveedor: integer; Serie: string);
     procedure MuestraDocumentos(Destino, Serie: string; Contador, CanalDestino: integer);
     function AceptaCambioCanal: boolean;
  public
     { Public declarations }
     procedure RefrescarAlbaranes(Proveedor: integer; Serie: string);
     procedure MarcarAlbaranes(Proveedor: integer; Serie: string; Tipo: smallint);
     procedure FacturaAlbaranes(Proveedor, Canal: integer; FechaFactura, FechaContabilizacion: TDateTime; Serie, SerieDestino: string);
     procedure FiltrarAlbaranes(Proveedor: integer; Serie: string);
     procedure MuestraErrores;
     function HayErrores: boolean;
  end;

var
  DMFacturaAlbaranesProv : TDMFacturaAlbaranesProv;

implementation

uses UDMMain, UEntorno, UFMFacturasAProveedor, UFormGest, UFMControlErroresFactura,
  UFMain, UFMControlAgrupPedidos, UFMFacturaAlbaranesProv;

{$R *.DFM}

procedure TDMFacturaAlbaranesProv.DMFacturaAlbaranesProvCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMAlbaranesFECHA.DisplayFormat := ShortDateFormat;
  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  ImporteSeleccionado := 0;
  FMFacturaAlbaranesProv.Importe(FormatFloat(LocalMascaraN, ImporteSeleccionado));
  SerieFacturada := REntorno.Serie;
end;

procedure TDMFacturaAlbaranesProv.FiltrarAlbaranes(Proveedor: integer; Serie: string);
begin
  FiltraQuery(Proveedor, Serie);
end;

procedure TDMFacturaAlbaranesProv.MarcarAlbaranes(Proveedor: integer; Serie: string; Tipo: smallint);
begin
  if (Serie > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE VER_CABECERAS_ALBARAN_PROV ');
           SQL.Add(' SET ENTRADA_FACTURACION = ?ENTRADA_FACTURACION ');
           SQL.Add(' WHERE');
           QMAlbaranes.DameFiltroSelect(SQL);
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           if (Serie > ' ') then
              Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
           if (Tipo = 1) then
              Params.ByName['ENTRADA_FACTURACION'].AsInteger := REntorno.Entrada
           else
              Params.ByName['ENTRADA_FACTURACION'].AsInteger := 0;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     RefrescarAlbaranes(Proveedor, Serie);
  end;
end;

procedure TDMFacturaAlbaranesProv.RefrescarAlbaranes(Proveedor: integer; Serie: string);
begin
  FiltraQuery(Proveedor, Serie);
end;

procedure TDMFacturaAlbaranesProv.QMAlbaranesNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMFacturaAlbaranesProv.FacturaAlbaranes(Proveedor, Canal: integer; FechaFactura, FechaContabilizacion: TDateTime; Serie, SerieDestino: string);
begin
  if (QMAlbaranes.State = dsEdit) then
  begin
     QMAlbaranes.Post;
     QMAlbaranes.Transaction.CommitRetaining;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_FACTURA_ALBARANES_PROV ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE_FILTRO, :SERIE_DESTINO, :PROVEEDOR, :FECHA, :ENTRADA, :FECHA_CON, :CANAL_D) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE_FILTRO'].AsString := Serie;
        Params.ByName['SERIE_DESTINO'].AsString := SerieDestino;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['FECHA'].AsDateTime := FechaFactura;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada{Entrada};
        Params.ByName['FECHA_CON'].AsDateTime := FechaContabilizacion;
        Params.ByName['CANAL_D'].AsInteger := Canal;
        ExecQuery;
        Contador := FieldByName['PROC_AUTO'].AsInteger;
        SerieFacturada := FieldByName['SERIE_A_FACTURAR'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if HayErrores then
     MuestraErrores;

  RefrescarAlbaranes(Proveedor, Serie);

  // Muestro los albaranes generados. Si están en otro canal muestro ventana especial con esa informacion.
  if (REntorno.Canal = Canal) then
     AbreDocumentos
  else
  if (Serie > ' ') then
     MuestraDocumentos('FAP', Serie, contador, Canal);
end;

procedure TDMFacturaAlbaranesProv.AbreDocumentos;
begin
  // Se abren las facturas que genera la facturacion
  FMain.EjecutaAccion(FMain.AFacturasProv);
  FMFacturasAProveedor.FiltraFacturacion(SerieFacturada, Contador);
end;

procedure TDMFacturaAlbaranesProv.FiltraQuery(Proveedor: integer; Serie: string);
begin
  if (Proveedor <> 0) then
     with QMAlbaranes do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_CABECERAS_ALBARAN_PROV ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA AND  ');
        SelectSQL.Add(' EJERCICIO <= ?EJERCICIO AND ');
        SelectSQL.Add(' CANAL = ?CANAL AND ');
        if (Serie > ' ') then
           SelectSQL.Add(' SERIE = ?SERIE AND ');
        SelectSQL.Add(' TIPO = ''ALP'' AND  ');
        SelectSQL.Add(' PROVEEDOR = ?PROVEEDOR AND ');
        SelectSQL.Add(' ESTADO = 0 ');
        SelectSQL.Add(' ORDER BY EJERCICIO, RIG ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        if (Serie > ' ') then
           Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Open;
     end;
end;

procedure TDMFacturaAlbaranesProv.QMAlbaranesLIQUIDOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMAlbaranesMONEDA.AsString, 1),
     QMAlbaranesLIQUIDO.AsFloat);
end;

function TDMFacturaAlbaranesProv.HayErrores: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM TMP_ERRORES_FACTURACION WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMFacturaAlbaranesProv.MuestraErrores;
begin
  FMControlErroresFactura := TFMControlErroresFactura.Create(Self);
  FMControlErroresFactura.ShowModal;
  FMControlErroresFactura.Free;
end;

procedure TDMFacturaAlbaranesProv.MuestraDocumentos(Destino, Serie: string; Contador, CanalDestino: integer);
begin
  with xDocumentos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := CanalDestino;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Destino;
     Params.ByName['CONTADOR'].AsInteger := Contador;
     Open;
  end;

  if (AceptaCambioCanal) then
  begin
     CierraFormsMenos(FMFacturaAlbaranesProv);
     FMain.CambiaEjercicioYCanal(REntorno.Ejercicio, CanalDestino);
     AbreDocumentos;
     FMFacturaAlbaranesProv.Close;
  end;
end;

function TDMFacturaAlbaranesProv.AceptaCambioCanal: boolean;
begin
  FMControlAgrupPedidos := TFMControlAgrupPedidos.Create(DMFacturaAlbaranesProv);
  try
     FMControlAgrupPedidos.AsignaDataSource(DMFacturaAlbaranesProv.DSxDocumentos);
     Result := (FMControlAgrupPedidos as TFMControlAgrupPedidos).Inicializa;
  finally
     FMControlAgrupPedidos.Free;
  end;
end;

procedure TDMFacturaAlbaranesProv.QMAlbaranesAfterOpen(DataSet: TDataSet);
begin
  ImporteSeleccionado := 0;

  with DataSet do
  begin
     DisableControls;
     try
        if RecordCount > 0 then
        begin
           while not EOF do
           begin
              if (QMAlbaranesENTRADA_FACTURACION.AsInteger = REntorno.Entrada) then
                 ImporteSeleccionado := ImporteSeleccionado + QMAlbaranesLIQUIDO.AsFloat;
              Next;
           end;
           First;
        end;
     finally
        EnableControls;
     end;
  end;

  FMFacturaAlbaranesProv.Importe(FormatFloat(LocalMascaraN, ImporteSeleccionado));
end;

procedure TDMFacturaAlbaranesProv.QMAlbaranesENTRADA_FACTURACIONChange(Sender: TField);
begin
  if (QMAlbaranesENTRADA_FACTURACION.AsInteger = REntorno.Entrada) then
     ImporteSeleccionado := ImporteSeleccionado + QMAlbaranesLIQUIDO.AsFloat
  else
     ImporteSeleccionado := ImporteSeleccionado - QMAlbaranesLIQUIDO.AsFloat;

  FMFacturaAlbaranesProv.Importe(FormatFloat(LocalMascaraN, ImporteSeleccionado));
end;

end.
