unit UDMDetallePagoFactura;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMDetallePagoFactura = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMCabecera: TDataSource;
     QMCabecera: TFIBTableSet;
     QMCabeceraFORMA_PAGO: TFIBStringField;
     QMCabeceraPEDIR_DETALLE_PAGO: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraLIQUIDO: TFloatField;
     QMCabeceraIMPORTE_ANTICIPO: TFloatField;
     QMCabeceraCAC: TIntegerField;
     QMCabeceraRESTO: TFloatField;
     QMCabeceraIMPORTE_PAGADO: TFloatField;
     QMCabeceraID_CARTERA: TIntegerField;
     DSQMCarteraDetalle: TDataSource;
     QMCarteraDetalle: TFIBTableSet;
     QMCarteraDetalleEMPRESA: TIntegerField;
     QMCarteraDetalleEJERCICIO: TIntegerField;
     QMCarteraDetalleCANAL: TIntegerField;
     QMCarteraDetalleSIGNO: TFIBStringField;
     QMCarteraDetalleREGISTRO: TIntegerField;
     QMCarteraDetalleLINEA: TIntegerField;
     QMCarteraDetalleVENCIMIENTO: TDateTimeField;
     QMCarteraDetalleCTA_PAGO: TFIBStringField;
     QMCarteraDetalleLIQUIDO: TFloatField;
     QMCarteraDetallePAGADO: TIntegerField;
     QMCarteraDetalleTIPO_EFECTO: TFIBStringField;
     QMCarteraDetalleREMESAR: TIntegerField;
     QMCarteraDetalleREMESA: TIntegerField;
     QMCarteraDetalleRECIBIDO: TIntegerField;
     QMCarteraDetalleANTICIPADO: TFloatField;
     QMCarteraDetalleDOCUMENTO: TFIBStringField;
     QMCarteraDetalleMONEDA: TFIBStringField;
     QMCarteraDetalleMONEDA_CANAL: TFIBStringField;
     QMCarteraDetalleLIQUIDO_CANAL: TFloatField;
     QMCarteraDetalleFECHA_RECIBIDO: TDateTimeField;
     QMCarteraDetalleFECHA_VALOR: TDateTimeField;
     QMCarteraDetalleID_CARTERA: TIntegerField;
     QMCarteraDetalleID_CARTERA_DETALLE: TIntegerField;
     QMCarteraDetalleID_REMESAS: TIntegerField;
     QMCarteraDetalleEJERCICIO_CONFIRMING: TIntegerField;
     QMCarteraDetalleCONFIRMING: TIntegerField;
     QMCarteraDetalleEJERCICIO_ORD_PAGO: TIntegerField;
     QMCarteraDetalleORD_PAGO: TIntegerField;
     QMCarteraDetalleDOC_AUTOMATICO: TIntegerField;
     QMCarteraDetalleRETENCION: TIntegerField;
     QMCarteraDetalleTIPO_RETENCION: TIntegerField;
     QMCarteraDetalleOBSERVACIONES: TFIBStringField;
     QMCabeceraMONEDA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraCalcFields(DataSet: TDataSet);
     procedure QMCabeceraIMPORTE_PAGADOSetText(Sender: TField; const Text: string);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraIMPORTE_PAGADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     aPedirDetallePago: boolean;
     Liquido: double;
     LocalMascaraN, LocalMascaraL: string;
  public
     { Public declarations }
     id_s: integer;
     FormaPago: string;
     Observaciones: string;
     procedure Filtrar(aid_s: integer);
     procedure AsignaVencimiento(Fecha: TDateTime);
     property PedirDetallePago: boolean Read aPedirDetallePago;
  end;

var
  DMDetallePagoFactura : TDMDetallePagoFactura;

implementation

uses UDMMain, HYFIBQuery;

{$R *.dfm}

procedure TDMDetallePagoFactura.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCarteraDetalleVENCIMIENTO.DisplayFormat := ShortDateFormat;
  Liquido := 0;
end;

procedure TDMDetallePagoFactura.Filtrar(aid_s: integer);
var
  IdCarteraDetalle : integer;
  CuentaPago : string;
  TipoEfecto : string;
  Remesar : integer;
begin
  id_s := aid_s;

  with QMCabecera do
  begin
     if (State in [dsEdit, dsInsert]) then
     begin
        Post;

        if (Liquido <> 0) then
        begin
           IdCarteraDetalle := DMMain.ContadorGen('ID_CARTERA_DETALLE');

           // Busco detalles de la forma de pago
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT CUENTA_PAGO, PAGO_AUTOMATICO, TIPO_EFECTO, REMESAR ');
                 SQL.Add(' FROM CON_CUENTAS_GES_FP ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' CANAL = :CANAL AND ');
                 SQL.Add(' FORMA_PAGO = :FORMA_PAGO ');
                 Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
                 Params.ByName['FORMA_PAGO'].AsString := FormaPago;
                 ExecQuery;
                 CuentaPago := FieldByName['CUENTA_PAGO'].AsString;
                 TipoEfecto := FieldByName['TIPO_EFECTO'].AsString;
                 Remesar := FieldByName['REMESAR'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Verificamos si la forma de pago tenga una cuenta de pago asignada por serie
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT CUENTA_PAGO ');
                 SQL.Add(' FROM CON_CUENTAS_GES_FP_EECS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' CANAL = :CANAL AND ');
                 SQL.Add(' SERIE = :SERIE AND ');
                 SQL.Add(' FORMA_PAGO = :FORMA_PAGO ');
                 Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
                 Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
                 Params.ByName['FORMA_PAGO'].AsString := FormaPago;
                 ExecQuery;
                 if (FieldByName['CUENTA_PAGO'].AsString <> '') then
                    CuentaPago := FieldByName['CUENTA_PAGO'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' INSERT INTO VER_EMP_CARTERA_DETALLE ( ');
                 SQL.Add(' EMPRESA, EJERCICIO, CANAL, SIGNO, REGISTRO, LINEA, VENCIMIENTO, CTA_PAGO, LIQUIDO, PAGADO, TIPO_EFECTO, REMESAR, REMESA, ');
                 SQL.Add('  RECIBIDO, ANTICIPADO, DOCUMENTO, MONEDA, MONEDA_CANAL, LIQUIDO_CANAL, FECHA_RECIBIDO, FECHA_VALOR, ID_CARTERA, ');
                 SQL.Add('  ID_CARTERA_DETALLE, ID_REMESAS, EJERCICIO_CONFIRMING, CONFIRMING, EJERCICIO_ORD_PAGO, ORD_PAGO, DOC_AUTOMATICO, ');
                 SQL.Add('  RETENCION, TIPO_RETENCION, OBSERVACIONES, FORMA_PAGO) ');
                 SQL.Add(' SELECT FIRST 1 EMPRESA, EJERCICIO, CANAL, SIGNO, REGISTRO, 0, VENCIMIENTO, :CTA_PAGO, :LIQUIDO, 0, :TIPO_EFECTO, :REMESAR, 0, ');
                 SQL.Add('                0, 0, DOCUMENTO, MONEDA, MONEDA_CANAL, NULL, FECHA_RECIBIDO, FECHA_VALOR, ID_CARTERA, :ID_CARTERA_DETALLE, 0, 0, 0, 0, 0, ');
                 SQL.Add('                0, 0, 0, :OBSERVACIONES, :FORMA_PAGO ');
                 SQL.Add(' FROM VER_EMP_CARTERA_DETALLE ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_CARTERA = :ID_CARTERA AND ');
                 SQL.Add(' PAGADO = 0 ');
                 SQL.Add(' ORDER BY LINEA ');
                 Params.ByName['ID_CARTERA'].AsInteger := QMCabeceraID_CARTERA.AsInteger;
                 Params.ByName['ID_CARTERA_DETALLE'].AsInteger := IdCarteraDetalle;
                 Params.ByName['CTA_PAGO'].AsString := CuentaPago;
                 Params.ByName['TIPO_EFECTO'].AsString := TipoEfecto;
                 Params.ByName['REMESAR'].AsInteger := Remesar;
                 Params.ByName['LIQUIDO'].AsFloat := Liquido;
                 Params.ByName['OBSERVACIONES'].AsString := Observaciones;
                 Params.ByName['FORMA_PAGO'].AsString := FormaPago;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE VER_EMP_CARTERA_DETALLE  ');
                 SQL.Add(' SET ');
                 SQL.Add(' PAGADO = 1, ');
                 SQL.Add(' TIPO_EFECTO = :TIPO_EFECTO ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_CARTERA_DETALLE = :ID_CARTERA_DETALLE ');
                 Params.ByName['ID_CARTERA_DETALLE'].AsInteger := IdCarteraDetalle;
                 Params.ByName['TIPO_EFECTO'].AsString := TipoEfecto;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Borro los recibos que queden a 0.
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' DELETE FROM VER_EMP_CARTERA_DETALLE  ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' LIQUIDO = 0 AND ');
                 SQL.Add(' ID_CARTERA IN (SELECT ID_CARTERA FROM EMP_CARTERA WHERE ID_DOC = :ID_DOC) ');
                 Params.ByName['ID_DOC'].AsInteger := id_s;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Liquido := 0;
        end;

        QMCarteraDetalle.Close;
        QMCarteraDetalle.Open;
     end;

     Close;
     Params.ByName['ID_S'].AsInteger := id_s;
     Open;

     LocalMascaraN := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 0);
     QMCabeceraLIQUIDO.DisplayFormat := LocalMascaraN;
     QMCabeceraIMPORTE_ANTICIPO.DisplayFormat := LocalMascaraN;
     QMCabeceraRESTO.DisplayFormat := LocalMascaraN;
     QMCabeceraIMPORTE_PAGADO.DisplayFormat := LocalMascaraN;
     QMCarteraDetalleLIQUIDO.DisplayFormat := LocalMascaraN;

     aPedirDetallePago := (QMCabeceraPEDIR_DETALLE_PAGO.AsInteger = 1);
  end;
end;

procedure TDMDetallePagoFactura.QMCabeceraCalcFields(DataSet: TDataSet);
begin
  QMCabeceraRESTO.AsFloat := QMCabeceraLIQUIDO.AsFloat - QMCabeceraIMPORTE_ANTICIPO.AsFloat - QMCabeceraIMPORTE_PAGADO.AsFloat;
end;

procedure TDMDetallePagoFactura.QMCabeceraIMPORTE_PAGADOSetText(Sender: TField; const Text: string);
begin
  Liquido := StrToFloatDef(Text, 0);
end;

procedure TDMDetallePagoFactura.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMCarteraDetalle.Open;
end;

procedure TDMDetallePagoFactura.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMCarteraDetalle.Close;
end;

procedure TDMDetallePagoFactura.QMCabeceraIMPORTE_PAGADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(LocalMascaraN, Liquido);
end;

procedure TDMDetallePagoFactura.AsignaVencimiento(Fecha: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_EMP_CARTERA_DETALLE  ');
        SQL.Add(' SET ');
        SQL.Add(' VENCIMIENTO = :VENCIMIENTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' PAGADO = 0 AND ');
        SQL.Add(' ID_CARTERA IN (SELECT ID_CARTERA FROM EMP_CARTERA WHERE ID_DOC = :ID_DOC) ');
        Params.ByName['ID_DOC'].AsInteger := id_s;
        Params.ByName['VENCIMIENTO'].AsDateTime := Fecha;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Filtrar(id_s);
end;

end.
