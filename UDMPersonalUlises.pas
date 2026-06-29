unit UDMPersonalUlises;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, ADODB, HYFIBQuery, FIBDataSet, FIBTableDataSet,
  FIBDatabase, UFIBModificados;

type
  TDMPersonalUlises = class(TDataModule)
     ADOUlises: TADOConnection;
     QImpArticulos: TADOQuery;
     QPeticionReposicion: TADOQuery;
     QGeneral: TADOQuery;
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     QMPeticRepo: TFIBTableSet;
     DSQMPeticRepo: TDataSource;
     QMPeticRepoTIPO_ENTRADA: TFIBStringField;
     QMPeticRepoN3: TFIBStringField;
     QMPeticRepoDOCUMENTO: TFIBStringField;
     QMPeticRepoLINEA: TFIBStringField;
     QMPeticRepoARTICULO: TFIBStringField;
     QMPeticRepoLOTE: TFIBStringField;
     QMPeticRepoUBICACION: TFIBStringField;
     QMPeticRepoCANTIDAD: TFloatField;
     QMPeticRepoENTRADA: TIntegerField;
     QPUlisesCab: TFIBTableSet;
     DSQPUlisesCab: TDataSource;
     QPUlisesCabEMPRESA: TIntegerField;
     QPUlisesCabEJERCICIO: TIntegerField;
     QPUlisesCabCANAL: TIntegerField;
     QPUlisesCabSERIE: TFIBStringField;
     QPUlisesCabTIPO: TFIBStringField;
     QPUlisesCabRIG: TIntegerField;
     QPUlisesCabID_S: TIntegerField;
     QPUlisesCabFECHA: TDateTimeField;
     QPUlisesCabCLIENTE: TIntegerField;
     QPUlisesCabTITULO: TFIBStringField;
     QPUlisesCabSU_REFERENCIA: TFIBStringField;
     QPUlisesCabFORMA_PAGO: TFIBStringField;
     QPUlisesCabLIQUIDO: TFloatField;
     QPUlisesCabN3: TFIBStringField;
     QPUlisesCabPROCESAR: TIntegerField;
     QPUlisesCabePed: TFIBTableSet;
     QPUlisesDetaPed: TFIBTableSet;
     DSQPUlisesCabePed: TDataSource;
     QPUlisesCabePedN3: TFIBStringField;
     QPUlisesCabePedN2: TFIBStringField;
     QPUlisesCabePedDOCUMENTO: TFIBStringField;
     QPUlisesCabePedTIPO_N3: TFIBStringField;
     QPUlisesCabePedPRIORIDAD: TIntegerField;
     QPUlisesCabePedBULTOS: TIntegerField;
     QPUlisesCabePedOBSERVACION_ALMACEN: TFIBStringField;
     QPUlisesCabePedOBSERVACION_CLIENTE: TFIBStringField;
     QPUlisesCabePedOBSERVACION_TRANSPORTE: TFIBStringField;
     QPUlisesCabePedCLIENTE: TFIBStringField;
     QPUlisesCabePedNOMBRE_CLIENTE: TFIBStringField;
     QPUlisesCabePedDIRECCION: TFIBStringField;
     QPUlisesCabePedPOBLACION: TFIBStringField;
     QPUlisesCabePedPROVINCIA: TFIBStringField;
     QPUlisesCabePedCP: TFIBStringField;
     QPUlisesCabePedPAIS: TFIBStringField;
     QPUlisesCabePedTRANSPORTISTA: TFIBStringField;
     QPUlisesCabePedIMPRIMIR_ALBARAN: TFIBStringField;
     QPUlisesCabePedALB_VALORADO: TFIBStringField;
     QPUlisesCabePedPORTES: TFIBStringField;
     QPUlisesCabePedDATO1: TFIBStringField;
     QPUlisesCabePedDATO2: TFIBStringField;
     QPUlisesCabePedDATO3: TFIBStringField;
     QPUlisesCabePedFECHA_ENTREGA: TFIBStringField;
     QPUlisesCabePedTIPO_BLOQUE: TFIBStringField;
     QPUlisesCabePedID_S: TIntegerField;
     QPUlisesCabePedPROCESAR: TIntegerField;
     QPUlisesDetaPedN3: TFIBStringField;
     QPUlisesDetaPedLINEA: TFIBStringField;
     QPUlisesDetaPedARTICULO: TFIBStringField;
     QPUlisesDetaPedLOTE: TFIBStringField;
     QPUlisesDetaPedCANTIDAD: TFloatField;
     QPUlisesDetaPedDESCRIPCION: TFIBStringField;
     QPUlisesDetaPedPRECIO: TFloatField;
     QPUlisesDetaPedUBICACION: TFIBStringField;
     QPUlisesDetaPedDATO1: TFIBStringField;
     QPUlisesDetaPedTIPO_BLOQUE: TFIBStringField;
     QPUlisesDetaPedID_DETALLES_S: TIntegerField;
     QPUlisesDetaPedPROCESAR: TIntegerField;
     QPUlisesCabENVIADO: TIntegerField;
     QPUlisesCabServ: TFIBTableSet;
     DSQPUlisesCabServ: TDataSource;
     QPUlisesCabServEMPRESA: TIntegerField;
     QPUlisesCabServEJERCICIO: TIntegerField;
     QPUlisesCabServCANAL: TIntegerField;
     QPUlisesCabServSERIE: TFIBStringField;
     QPUlisesCabServTIPO: TFIBStringField;
     QPUlisesCabServRIG: TIntegerField;
     QPUlisesCabServID_S: TIntegerField;
     QPUlisesCabServFECHA: TDateTimeField;
     QPUlisesCabServCLIENTE: TIntegerField;
     QPUlisesCabServTITULO: TFIBStringField;
     QPUlisesCabServSU_REFERENCIA: TFIBStringField;
     QPUlisesCabServFORMA_PAGO: TFIBStringField;
     QPUlisesCabServLIQUIDO: TFloatField;
     QPUlisesCabServN3: TFIBStringField;
     QPUlisesCabServFECHA_SERVICIO: TDateTimeField;
     QPUlisesCabServBULTOS_SERVIDOS: TIntegerField;
     QPUlisesCabServKILOS: TFloatField;
     QPUlisesCabServFECHA_CREACION: TDateTimeField;
     QPUlisesCabServPROCESAR: TIntegerField;
     QGeneral2: TADOQuery;
     QGeneral3: TADOQuery;
     DSQPUlisesDetaPed: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleCLIENTE: TIntegerField;
     QMDetalleMONEDA: TFIBStringField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetalleUNIDADES_SERVIDAS: TFloatField;
     QMDetalleUNIDADES_PENDIENTES: TFloatField;
     QMDetalleUNIDADES_RESERVADAS: TFloatField;
     QMDetalleSERVIDO: TIntegerField;
     QMDetallePRECIO: TFloatField;
     QMDetallePIEZAS_X_BULTO: TIntegerField;
     QMDetalleBULTOS: TIntegerField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMDetalleCOMISION: TFloatField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleM_MOV_STOCK: TIntegerField;
     QMDetalleTIPO_IVA: TIntegerField;
     QMDetalleP_IVA: TFloatField;
     QMDetalleP_RECARGO: TFloatField;
     QMDetalleBRUTO: TFloatField;
     QMDetalleB_COMISION: TFloatField;
     QMDetalleI_DESCUENTO: TFloatField;
     QMDetalleB_IMPONIBLE: TFloatField;
     QMDetalleB_DTO_LINEA: TFloatField;
     QMDetalleI_COMISION: TFloatField;
     QMDetalleC_IVA: TFloatField;
     QMDetalleC_RECARGO: TFloatField;
     QMDetalleT_COSTE: TFloatField;
     QMDetalleM_BRUTO: TFloatField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleENTRADA_AGRUPACION: TIntegerField;
     QMDetalleNOTAS: TBlobField;
     QMDetalleUNIDADES_EXT: TFloatField;
     QMDetalleORDEN_PRODUCCION: TIntegerField;
     QMDetalleUNIDADES_SEC: TFloatField;
     QMDetalleDIRECCION_ENTREGA: TIntegerField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleID_S: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMDetalleCOMISION_LINEAL: TFloatField;
     QMDetalleI_COMISION_LINEAL: TFloatField;
     QMDetalleFECHA_ENTREGA_PREV: TDateTimeField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     QMDetalleTITULO_IDIOMA: TFIBStringField;
     QMDetalleMARGEN_KRI: TFloatField;
     QMDetalleTIPO_LINEA_KRI: TIntegerField;
     QMDetalleORDEN: TIntegerField;
     QMDetalleTIPO_LINEA: TFIBStringField;
     QMDetallePROC_PROMOCION: TIntegerField;
     QMDetalleORIGEN: TIntegerField;
     QMDetalleID_P: TIntegerField;
     QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMDetallePROYECTO: TIntegerField;
     QMDetalleNOTAS2: TBlobField;
     QMDetalleCRC_NOTAS: TFIBStringField;
     QMDetalleCRC_NOTAS2: TFIBStringField;
     QPUlisesCabePedENVIADO: TIntegerField;
     QPUlisesCabePedFECHA_SERVICIO: TDateTimeField;
     QPUlisesCabePedBULTOS_SERVIDOS: TIntegerField;
     QPUlisesCabePedKILOS: TFloatField;
     QPUlisesCabePedFECHA_CREACION: TDateTimeField;
     QPUlisesCabePedRECIBIDO: TIntegerField;
     QPUlisesDetaPedCANTIDAD_CONFIRMADA: TFloatField;
     QPUlisesDetaPedRECIBIDO: TIntegerField;
     QMPeticRepoUNIDADES_ENVIAR: TFloatField;
     QMPeticRepoALMACEN: TFIBStringField;
     QMPeticRepoENVIADO: TIntegerField;
     QMPeticRepoEMPRESA: TIntegerField;
     QMPeticRepoCANAL: TIntegerField;
     QMPeticRepoSTOCK: TFloatField;
     QMPeticRepoResp: TFIBTableSet;
     DSQMPeticRepoResp: TDataSource;
     QPeticionRepoRespuesta: TADOQuery;
     QMPeticRepoRespTIPO_ENTRADA: TFIBStringField;
     QMPeticRepoRespN3: TFIBStringField;
     QMPeticRepoRespDOCUMENTO: TFIBStringField;
     QMPeticRepoRespLINEA: TFIBStringField;
     QMPeticRepoRespARTICULO: TFIBStringField;
     QMPeticRepoRespLOTE: TFIBStringField;
     QMPeticRepoRespUBICACION: TFIBStringField;
     QMPeticRepoRespCANTIDAD: TFloatField;
     QMPeticRepoRespENTRADA: TIntegerField;
     QMPeticRepoRespUNIDADES_ENVIAR: TFloatField;
     QMPeticRepoRespALMACEN: TFIBStringField;
     QMPeticRepoRespSTOCK: TFloatField;
     QMPeticRepoRespENVIADO: TIntegerField;
     QMPeticRepoRespEMPRESA: TIntegerField;
     QMPeticRepoRespCANAL: TIntegerField;
     QMPeticRepoRespRECALCULA_STOCK: TIntegerField;
     QMPeticRepoRespMOVIMIENTO: TIntegerField;
     QMPeticRepoRECALCULA_STOCK: TIntegerField;
     QMPeticRepoMOVIMIENTO: TIntegerField;
     QMDetalleCANTIDAD: TFloatField;
     QMDetalleCANTIDAD_CONFIRMADA: TFloatField;
     QPrueba: TADOQuery;
     DSQPrueba: TDataSource;
     QMPeticRepoRespCANTIDAD_ENTRADA: TFloatField;
     procedure QPUlisesCabPROCESARChange(Sender: TField);
     procedure QPUlisesCabePedAfterOpen(DataSet: TDataSet);
     procedure QPUlisesCabePedBeforeClose(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QPUlisesCabAfterOpen(DataSet: TDataSet);
     procedure QPUlisesCabBeforeClose(DataSet: TDataSet);
     procedure QPUlisesCabServAfterOpen(DataSet: TDataSet);
     procedure QPUlisesCabServBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     CS, DDB: string;
     AlmacenInteligente: string;
     procedure CambiarAlmacen(id_s: integer);
  public
     { Public declarations }
     Almacen: string;
     function Conectar(CS, DDB: string): boolean;
     procedure Desconectar;
     procedure InsertarArticulo(articulo, descripcion, ean13, ean132: string; Peso, Volumen: real; Dato1, Dato2, Dato3, Dato4, Dato5, Operacion: string);
     procedure DatosConexion(var CS, DDB: string);
     procedure RegenerarPeticionReposicion(Empresa, Canal: integer; Almacen: string);
     procedure AbrePedidos;
     procedure CierraPedidos;
     procedure EnviarPedidos;
     procedure AbrePedidosServidos;
     procedure CierraPedidosServidos;
     procedure RefrescarPedidosServ;
     procedure ServirReposicion(Almacen: string);
     function DameAlmacenInteligente: string;
     procedure RegeneraStockPeticRepo(Almacen: string);
     procedure RefrescaPeticionRepoRespuesta(Empresa, Canal: integer; Almacen: string);
     procedure GeneraMovimientosPeticionRepo;
     procedure GenerarAlbaranes;
  end;

var
  DMPersonalUlises : TDMPersonalUlises;

implementation

uses UEntorno, UDameDato, Dialogs, UDMMain, UDMAgrupacionPedidosVentas, UFormGest,
  UFMAlbaranes, UFMain, UFInfoFacturacionAlb, Forms,
  UDMAgrupacionDeAlbaranesKri;

{$R *.dfm}

function TDMPersonalUlises.Conectar(CS, DDB: string): boolean;
begin
  Result := False;
  if ((CS = '') and (DDB = '')) then
     DatosConexion(CS, DDB);
  try
     with ADOUlises do
     begin
        if not Connected then
        begin
           ConnectionString := CS;
           DefaultDataBase := DDB;
        end;
        try
           if not Connected then
              Open; // Open (nombre,password);
           Result := True;
        except
           try
              if not Connected then
                 {TODO -oDuilio : Sacar Usuario/Password de la BD}
                 Open('luis', 'romeu');
              Result := True;
           except
              on e: Exception do
                 ShowMessage(_('Error abriendo con open (nombre,password)') + #13#10 + e.Message);
           end;
        end;
     end;
  except
     on e: Exception do
        MessageDlg(_('Error conectando.') + #13#10 + e.Message, mtError, [mbOK], 0);
  end;
end;

procedure TDMPersonalUlises.DatosConexion(var CS, DDB: string);
var
  Q : THYFIBQuery;
begin
  if ((CS = '') and (DDB = '')) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
        SQL.Text := 'SELECT CONNECTIONSTRING, DEFAULTDATABASE FROM PULISES_CONSTANTES';
        ExecQuery;
        CS := FieldByName['CONNECTIONSTRING'].AsString;
        DDB := FieldByName['DEFAULTDATABASE'].AsString;
        FreeHandle;
     end;
     FreeAndNil(Q);
     Self.CS := CS;
     Self.DDB := DDB;
  end
  else
  begin
     CS := Self.CS;
     DDB := Self.DDB;
  end;
end;

procedure TDMPersonalUlises.Desconectar;
begin
  if (ADOUlises.Connected) then
     ADOUlises.Close;
end;

procedure TDMPersonalUlises.InsertarArticulo(Articulo, Descripcion, ean13, ean132: string; Peso, Volumen: real; Dato1, Dato2, Dato3, Dato4, Dato5, Operacion: string);
begin
  {Operacion: A=Alta, Modificacion - B=Baja}
  with QImpArticulos do
  begin
     Close;
     Connection := ADOUlises;
     Connection.BeginTrans;
     try
        SQL.Clear;
        SQL.Add(' INSERT INTO IMP_ARTICULOS ');
        SQL.Add(' (TRATADO,FECHA_TRATADO,ERROR,ARTICULO,DESCRIPCION,EAN13,EAN132,ROTACION,UNIDAD_CARGA_ENTRADA,UNIDAD_CARGA_SALIDA,METODO_ENTRADA,METODO_SALIDA,PESO,VOLUMEN,DATO1,DATO2,DATO3,DATO4,DATO5,OPERACION) ');
        SQL.Add(' VALUES ');
        SQL.Add(' (''N'',NULL,NULL,:ARTICULO,:DESCRIPCION,:EAN13,:EAN132,:ROTACION,:UNIDAD_CARGA_ENTRADA,:UNIDAD_CARGA_SALIDA,:METODO_ENTRADA,:METODO_SALIDA,:PESO,:VOLUMEN,:DATO1,:DATO2,:DATO3,:DATO4,:DATO5,:OPERACION) ');
        Parameters.ParamByName('ARTICULO').Value := Articulo;
        Parameters.ParamByName('DESCRIPCION').Value := Copy(Descripcion, 1, 40); {Texto40}
        Parameters.ParamByName('EAN13').Value := ean13;
        Parameters.ParamByName('EAN132').Value := ean132;
        Parameters.ParamByName('ROTACION').Value := 'A'; {Valor por defecto}
        Parameters.ParamByName('UNIDAD_CARGA_ENTRADA').Value := 1; {Valor por defecto}
        Parameters.ParamByName('UNIDAD_CARGA_SALIDA').Value := 1; {Valor por defecto}
        Parameters.ParamByName('METODO_ENTRADA').Value := '1'; {Valor por defecto}
        Parameters.ParamByName('METODO_SALIDA').Value := '1'; {Valor por defecto}
        Parameters.ParamByName('PESO').Value := Peso;
        Parameters.ParamByName('VOLUMEN').Value := Volumen;
        Parameters.ParamByName('DATO1').Value := Copy(Dato1, 1, 20); {Texto20}
        Parameters.ParamByName('DATO2').Value := Copy(Dato2, 1, 20); {Texto20}
        Parameters.ParamByName('DATO3').Value := Copy(Dato3, 1, 20); {Texto20}
        Parameters.ParamByName('DATO4').Value := Copy(Dato4, 1, 20); {Texto20}
        Parameters.ParamByName('DATO5').Value := Copy(Dato5, 1, 20); {Texto20}
        Parameters.ParamByName('OPERACION').Value := Operacion;
        ExecSQL;
        Connection.CommitTrans;
     except
        on e: Exception do
        begin
           Connection.RollbackTrans;
           MessageDlg(_('Error [InsertaArticulo]') + ' ' + Articulo + #13#10 + e.Message, mtError, [mbOK], 0);
        end;
     end;
  end;
end;

procedure TDMPersonalUlises.RegenerarPeticionReposicion(Empresa, Canal: integer; Almacen: string);
var
  Q : THYFIBQuery;
  Exito : boolean;
begin
  {Primero borro lo que hay en el temporal}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
     SQL.Text := 'DELETE FROM TMP_PULISES_PETIC_REPO WHERE MOVIMIENTO=0';
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);

  {Luego importo de EXP_PETIC_REPO}
  with QPeticionReposicion do
  begin
     Close;
     Connection := ADOUlises;
     Conectar(CS, DDB);
     Connection.BeginTrans;
     try
        SQL.Clear;
        SQL.Add('SELECT * FROM EXP_PETIC_REPO');
        SQL.Add('WHERE TRATADO=''N'' AND FECHA_TRATADO IS NULL AND ERROR IS NULL');
        Open;
        while not EOF do
        begin
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
              SQL.Text := 'INSERT INTO TMP_PULISES_PETIC_REPO(TIPO_ENTRADA,N3,DOCUMENTO,LINEA,ARTICULO,LOTE,UBICACION,CANTIDAD,ENTRADA,EMPRESA,CANAL,ALMACEN) ' +
                 'VALUES (?TIPO_ENTRADA,?N3,?DOCUMENTO,?LINEA,?ARTICULO,?LOTE,?UBICACION,?CANTIDAD,?ENTRADA,?EMPRESA,?CANAL,?ALMACEN)';
              Params.ByName['TIPO_ENTRADA'].AsString := QPeticionReposicion.FieldByName('TIPO_ENTRADA').AsString;
              Params.ByName['N3'].AsString := QPeticionReposicion.FieldByName('N3').AsString;
              Params.ByName['DOCUMENTO'].AsString := QPeticionReposicion.FieldByName('DOCUMENTO').AsString;
              Params.ByName['LINEA'].AsString := QPeticionReposicion.FieldByName('LINEA').AsString;
              Params.ByName['ARTICULO'].AsString := QPeticionReposicion.FieldByName('ARTICULO').AsString;
              Params.ByName['LOTE'].AsString := QPeticionReposicion.FieldByName('LOTE').AsString;
              Params.ByName['UBICACION'].AsString := QPeticionReposicion.FieldByName('UBICACION').AsString;
              Params.ByName['CANTIDAD'].AsInteger := QPeticionReposicion.FieldByName('CANTIDAD').AsInteger;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['ALMACEN'].AsString := Almacen;
              try
                 ExecQuery;
                 Exito := True;
              except
                 Exito := False;
              end;
              FreeHandle;
           end;
           FreeAndNil(Q);

           if (Exito) then
              with QGeneral do
              begin
                 Close;
                 Connection := ADOUlises;
                 SQL.Clear;
                 SQL.Add('UPDATE EXP_PETIC_REPO SET TRATADO=:TRATADO, FECHA_TRATADO=:FECHA_TRATADO, ERROR = NULL WHERE N3=:N3 AND ARTICULO=:ARTICULO');
                 Parameters.ParamByName('TRATADO').Value := 'S';
                 Parameters.ParamByName('N3').Value := QPeticionReposicion.FieldByName('N3').AsString;
                 Parameters.ParamByName('ARTICULO').Value := QPeticionReposicion.FieldByName('ARTICULO').AsString;
                 Parameters.ParamByName('FECHA_TRATADO').DataType := ftDateTime;
                 Parameters.ParamByName('FECHA_TRATADO').Value := Now;
                 ExecSQL;
              end
           else
              with QGeneral do
              begin
                 Close;
                 Connection := ADOUlises;
                 SQL.Clear;
                 SQL.Add('UPDATE EXP_PETIC_REPO SET TRATADO=:TRATADO, FECHA_TRATADO=:FECHA_TRATADO, ERROR = ''ERROR INCORPORANDO EXP_PETIC_REPO'' WHERE N3=:N3 AND ARTICULO=:ARTICULO');
                 Parameters.ParamByName('TRATADO').Value := 'N';
                 Parameters.ParamByName('N3').Value := QPeticionReposicion.FieldByName('N3').AsString;
                 Parameters.ParamByName('ARTICULO').Value := QPeticionReposicion.FieldByName('ARTICULO').AsString;
                 Parameters.ParamByName('FECHA_TRATADO').DataType := ftDateTime;
                 Parameters.ParamByName('FECHA_TRATADO').Value := Now;
                 ExecSQL;
              end;
           Next;
        end;
        Connection.CommitTrans;
     except
        on e: Exception do
        begin
           Connection.RollbackTrans;
           MessageDlg(Format(_('Error [RegenerarPeticionReposicion]' + #13#10 + 'N3: $s' + #13#10 + 'Articulo: %s'),
              [QPeticionReposicion.FieldByName('N3').AsString, QPeticionReposicion.FieldByName('ARTICULO').AsString]) + #13#10 +
              e.Message, mtError, [mbOK], 0);
        end;
     end;
  end; {with QPeticionReposicion}

  {Refresco los datos}
  with QMPeticRepo do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPersonalUlises.QPUlisesCabPROCESARChange(Sender: TField);
begin
  if (QPUlisesCabPROCESAR.AsInteger = 1) then
     QPUlisesCabN3.AsString := QPUlisesCabTIPO.AsString + '-' + QPUlisesCabEJERCICIO.AsString + '-' + QPUlisesCabCANAL.AsString + '-' + QPUlisesCabSERIE.AsString + '/' + QPUlisesCabRIG.AsString;
end;

procedure TDMPersonalUlises.EnviarPedidos;
var
  Q : THYFIBQuery;
begin
  with QGeneral do
  begin
     Close;
     Connection := ADOUlises;
     Conectar(CS, DDB);
     Connection.BeginTrans;
     {QPUlisesCabePed.DisableControls;
      QPUlisesCab.DisableControls;
      QPUlisesDetaPed.DisableControls;}
     try
        QPUlisesCabePed.Close;
        QPUlisesCab.First;
        while not QPUlisesCab.EOF do
        begin
           if (QPUlisesCabPROCESAR.AsInteger = 1) then
           begin
              {Pasamos el pedido al almacen inteligente}
              CambiarAlmacen(QPUlisesCabID_S.AsInteger);
              QPUlisesCabePed.Open;
              SQL.Clear;
              SQL.Add('INSERT INTO IMP_CABE_PED');
              SQL.Add('(N3,N2,DOCUMENTO,TIPO_N3,PRIORIDAD,');
              SQL.Add('BULTOS,OBSERVACION_ALMACEN,OBSERVACION_CLIENTE,OBSERVACION_TRANSPORTE,');
              SQL.Add('CLIENTE,NOMBRE_CLIENTE,DIRECCION,POBLACION,PROVINCIA,CP,PAIS,');
              SQL.Add('TRANSPORTISTA,IMPRIMIR_ALBARAN,ALB_VALORADO,PORTES,');
              SQL.Add('DATO1,DATO2,DATO3,FECHA_ENTREGA,TIPO_BLOQUE,TRATADO,FECHA_TRATADO,ERROR)');
              SQL.Add('VALUES');
              SQL.Add('(:N3,:N2,:DOCUMENTO,:TIPO_N3,:PRIORIDAD,');
              SQL.Add(':BULTOS,:OBSERVACION_ALMACEN,:OBSERVACION_CLIENTE,:OBSERVACION_TRANSPORTE,');
              SQL.Add(':CLIENTE,:NOMBRE_CLIENTE,:DIRECCION,:POBLACION,:PROVINCIA,:CP,:PAIS,');
              SQL.Add(':TRANSPORTISTA,:IMPRIMIR_ALBARAN,:ALB_VALORADO,:PORTES,');
              SQL.Add(':DATO1,:DATO2,:DATO3,:FECHA_ENTREGA,:TIPO_BLOQUE,''N'',NULL,NULL)');
              Parameters.ParamByName('N3').Value := QPUlisesCabePedN3.Value;
              Parameters.ParamByName('N2').Value := QPUlisesCabePedN2.Value;
              Parameters.ParamByName('DOCUMENTO').Value := QPUlisesCabePedDOCUMENTO.Value;
              Parameters.ParamByName('TIPO_N3').Value := QPUlisesCabePedTIPO_N3.Value;
              Parameters.ParamByName('PRIORIDAD').Value := QPUlisesCabePedPRIORIDAD.Value;
              Parameters.ParamByName('BULTOS').Value := QPUlisesCabePedBULTOS.Value;
              Parameters.ParamByName('OBSERVACION_ALMACEN').Value := QPUlisesCabePedOBSERVACION_ALMACEN.Value;
              Parameters.ParamByName('OBSERVACION_CLIENTE').Value := QPUlisesCabePedOBSERVACION_CLIENTE.Value;
              Parameters.ParamByName('OBSERVACION_TRANSPORTE').Value := QPUlisesCabePedOBSERVACION_TRANSPORTE.Value;
              Parameters.ParamByName('CLIENTE').Value := QPUlisesCabePedCLIENTE.Value;
              Parameters.ParamByName('NOMBRE_CLIENTE').Value := QPUlisesCabePedNOMBRE_CLIENTE.Value;
              Parameters.ParamByName('DIRECCION').Value := QPUlisesCabePedDIRECCION.Value;
              Parameters.ParamByName('POBLACION').Value := QPUlisesCabePedPOBLACION.Value;
              Parameters.ParamByName('PROVINCIA').Value := QPUlisesCabePedPROVINCIA.Value;
              Parameters.ParamByName('CP').Value := QPUlisesCabePedCP.Value;
              Parameters.ParamByName('PAIS').Value := QPUlisesCabePedPAIS.Value;
              Parameters.ParamByName('TRANSPORTISTA').Value := QPUlisesCabePedTRANSPORTISTA.Value;
              Parameters.ParamByName('IMPRIMIR_ALBARAN').Value := QPUlisesCabePedIMPRIMIR_ALBARAN.Value;
              Parameters.ParamByName('ALB_VALORADO').Value := QPUlisesCabePedALB_VALORADO.Value;
              Parameters.ParamByName('PORTES').Value := QPUlisesCabePedPORTES.Value;
              Parameters.ParamByName('DATO1').Value := QPUlisesCabePedDATO1.Value;
              Parameters.ParamByName('DATO2').Value := QPUlisesCabePedDATO2.Value;
              Parameters.ParamByName('DATO3').Value := QPUlisesCabePedDATO3.Value;
              Parameters.ParamByName('FECHA_ENTREGA').Value := QPUlisesCabePedFECHA_ENTREGA.Value;
              Parameters.ParamByName('TIPO_BLOQUE').Value := QPUlisesCabePedTIPO_BLOQUE.Value;
              ExecSQL;
              while not QPUlisesDetaPed.EOF do
              begin
                 SQL.Clear;
                 SQL.Add('INSERT INTO IMP_DETA_PED');
                 SQL.Add('(N3,LINEA,ARTICULO,LOTE,CANTIDAD,DESCRIPCION,PRECIO,UBICACION,DATO1,TIPO_BLOQUE,TRATADO,FECHA_TRATADO,ERROR)');
                 SQL.Add('VALUES');
                 SQL.Add('(:N3,:LINEA,:ARTICULO,:LOTE,:CANTIDAD,:DESCRIPCION,:PRECIO,NULL,:DATO1,:TIPO_BLOQUE,''N'',NULL,NULL)');
                 Parameters.ParamByName('N3').Value := QPUlisesDetaPedN3.Value;
                 Parameters.ParamByName('LINEA').Value := QPUlisesDetaPedLINEA.Value;
                 Parameters.ParamByName('ARTICULO').Value := QPUlisesDetaPedARTICULO.Value;
                 Parameters.ParamByName('LOTE').Value := QPUlisesDetaPedLOTE.Value;
                 Parameters.ParamByName('CANTIDAD').Value := QPUlisesDetaPedCANTIDAD.AsInteger;
                 Parameters.ParamByName('DESCRIPCION').Value := QPUlisesDetaPedDESCRIPCION.Value;
                 Parameters.ParamByName('PRECIO').Value := QPUlisesDetaPedPRECIO.Value;
                 //UBICACION debe ser null
                 //Parameters.ParamByName('UBICACION').Value := QPUlisesDetaPedUBICACION.Value;
                 Parameters.ParamByName('DATO1').Value := QPUlisesDetaPedDATO1.Value;
                 Parameters.ParamByName('TIPO_BLOQUE').Value := QPUlisesDetaPedTIPO_BLOQUE.Value;
                 ExecSQL;
                 QPUlisesDetaPed.Next;
              end;

              {Lo marco como enviado al Almacen Inteligente}
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                 SQL.Text := 'UPDATE VER_PULISES_CABECERA  ' +
                    'SET ENVIADO=1, PROCESAR=0 ' +
                    'WHERE N3=?N3';
                 Params.ByName['N3'].AsString := QPUlisesCabePedN3.AsString;
                 ExecQuery;
                 FreeHandle;
              end;
              FreeAndNil(Q);
           end;
           QPUlisesCab.Next;
        end;
     except
        on e: Exception do
        begin
           Connection.RollbackTrans;
           MessageDlg(_('Error [EnviarPedidos]') + #13#10 + e.Message, mtError, [mbOK], 0);
        end;
     end;
     QPUlisesCab.Close;
     QPUlisesCab.Open;
     {QPUlisesCabePed.EnableControls;
      QPUlisesCab.EnableControls;
      QPUlisesDetaPed.EnableControls;}

     Connection.CommitTrans;
  end;
end;

procedure TDMPersonalUlises.QPUlisesCabePedAfterOpen(DataSet: TDataSet);
begin
  QPUlisesDetaPed.Open;
end;

procedure TDMPersonalUlises.QPUlisesCabePedBeforeClose(DataSet: TDataSet);
begin
  QPUlisesDetaPed.Close;
end;

procedure TDMPersonalUlises.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
  CS := '';
  DDB := '';
  AlmacenInteligente := '';
end;

procedure TDMPersonalUlises.AbrePedidos;
begin
  QMDetalle.Close;
  QMDetalle.DataSource := DSQPUlisesCab;
  with QPUlisesCab do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMPersonalUlises.CierraPedidos;
begin
  QPUlisesCab.Close;
end;

procedure TDMPersonalUlises.AbrePedidosServidos;
begin
  QMDetalle.Close;
  QMDetalle.DataSource := DSQPUlisesCabServ;
  with QPUlisesCabServ do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMPersonalUlises.CierraPedidosServidos;
begin
  QPUlisesCabServ.Close;
end;

procedure TDMPersonalUlises.RefrescarPedidosServ;
var
  Q : THYFIBQuery;
begin
  with QGeneral do
  begin
     Close;
     Connection := ADOUlises;
     Conectar(CS, DDB);
     Connection.BeginTrans;
     SQL.Clear;
     SQL.Add('SELECT * FROM EXP_CABE_PED');
     SQL.Add('WHERE TRATADO=''N'' AND FECHA_TRATADO IS NULL AND ERROR IS NULL');
     try
        Open;
        while not EOF do
        begin
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
              SQL.Text := 'UPDATE PULISES_CABE_PED SET ' +
                 {'FECHA_SERVICIO=?FECHA_SERVICIO, '+}
                 'BULTOS_SERVIDOS=?BULTOS_SERVIDOS, ' +
                 'KILOS=?KILOS, ' +
                 {'FECHA_CREACION=?FECHA_CREACION, '+}
                 'RECIBIDO=?RECIBIDO ' +
                 'WHERE N3=?N3';
              //Params.ByName['FECHA_SERVICIO'].AsString := QGeneral.FieldByName('FECHA_SERVICIO').AsString;
              Params.ByName['BULTOS_SERVIDOS'].AsInteger := QGeneral.FieldByName('BULTOS').AsInteger;
              Params.ByName['KILOS'].AsInteger := QGeneral.FieldByName('KILOS').AsInteger;
              //Params.ByName['FECHA_CREACION'].AsString := QGeneral.FieldByName('FECHA_CREACION').AsString;
              Params.ByName['RECIBIDO'].AsInteger := 1;
              Params.ByName['N3'].AsString := QGeneral.FieldByName('N3').AsString;
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);

           with QGeneral2 do
           begin
              Close;
              Connection := ADOUlises;
              SQL.Clear;
              SQL.Add('SELECT * FROM EXP_DETA_PED ');
              SQL.Add('WHERE TRATADO=''N'' AND FECHA_TRATADO IS NULL AND ERROR IS NULL AND N3=:N3');
              Parameters.ParamByName('N3').Value := QGeneral.FieldByName('N3').AsString;
              Open;
              while not EOF do
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                    SQL.Text := 'UPDATE PULISES_DETA_PED SET ' +
                       'LOTE=?LOTE, ' +
                       'CANTIDAD_CONFIRMADA=?CANTIDAD_CONFIRMADA, ' +
                       'RECIBIDO=?RECIBIDO ' +
                       'WHERE N3=?N3 AND LINEA=?LINEA AND ARTICULO=:ARTICULO';
                    Params.ByName['LOTE'].AsString := QGeneral2.FieldByName('LOTE').AsString;
                    Params.ByName['CANTIDAD_CONFIRMADA'].AsInteger := QGeneral2.FieldByName('CANTIDAD_CONFIRMADA').AsInteger;
                    Params.ByName['RECIBIDO'].AsInteger := 1;
                    Params.ByName['N3'].AsString := QGeneral2.FieldByName('N3').AsString;
                    Params.ByName['LINEA'].AsInteger := QGeneral2.FieldByName('LINEA').AsInteger;
                    Params.ByName['ARTICULO'].AsString := QGeneral2.FieldByName('ARTICULO').AsString;
                    ExecQuery;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);

                 {Marco EXP_DETA_PED como leida}
                 with QGeneral3 do
                 begin
                    Close;
                    Connection := ADOUlises;
                    SQL.Clear;
                    SQL.Add('UPDATE EXP_DETA_PED');
                    SQL.Add('SET TRATADO=''S'', FECHA_TRATADO = :FECHA_TRATADO, ERROR = NULL');
                    SQL.Add('WHERE N3=:N3 AND LINEA=:LINEA AND ARTICULO=:ARTICULO');
                    Parameters.ParamByName('N3').Value := QGeneral2.FieldByName('N3').AsString;
                    Parameters.ParamByName('LINEA').Value := QGeneral2.FieldByName('LINEA').AsInteger;
                    Parameters.ParamByName('ARTICULO').Value := QGeneral2.FieldByName('ARTICULO').AsString;
                    Parameters.ParamByName('FECHA_TRATADO').Value := Now;
                    ExecSQL;
                 end;

                 Next;
              end;
           end;

           {Marco EXP_CABE_PED como leida}
           with QGeneral3 do
           begin
              Close;
              Connection := ADOUlises;
              SQL.Clear;
              SQL.Add('UPDATE EXP_CABE_PED');
              SQL.Add('SET TRATADO=''S'', FECHA_TRATADO = :FECHA_TRATADO, ERROR = NULL');
              SQL.Add('WHERE N3=:N3');
              Parameters.ParamByName('N3').Value := QGeneral.FieldByName('N3').AsString;
              Parameters.ParamByName('FECHA_TRATADO').Value := Now;
              ExecSQL;
           end;

           Next;
        end;
        Connection.CommitTrans;
     except
        on e: Exception do
        begin
           Connection.RollbackTrans;
           MessageDlg(_('Error [RefrescarPedidosServ Cabecera]') + #13#10 + e.Message, mtError, [mbOK], 0);
        end;
     end;
  end;

  {Refrescamos la tabla para que nos los muestra}
  with QPUlisesCabServ do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPersonalUlises.QPUlisesCabAfterOpen(DataSet: TDataSet);
begin
  QPUlisesCabePed.Open;
  QMDetalle.Open;
end;

procedure TDMPersonalUlises.QPUlisesCabBeforeClose(DataSet: TDataSet);
begin
  QPUlisesCabePed.Close;
  //QMDetalle.Close;
end;

procedure TDMPersonalUlises.QPUlisesCabServAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
end;

procedure TDMPersonalUlises.QPUlisesCabServBeforeClose(DataSet: TDataSet);
begin
  //QMDetalle.Close;
end;

procedure TDMPersonalUlises.ServirReposicion(Almacen: string);
begin
  try
     with QGeneral do
     begin
        Close;
        Connection := ADOUlises;
        Conectar(CS, DDB);
        Connection.BeginTrans;
     end;

     with QMPeticRepo do
     begin
        First;
        while not EOF do
        begin
           if ((QMPeticRepoENTRADA.AsInteger = REntorno.Entrada) and (QMPeticRepoUNIDADES_ENVIAR.AsFloat > 0)) then
           begin
              with QGeneral do
              begin
                 Close;
                 SQL.Clear;
                 SQL.Add('INSERT INTO IMP_ENTRADAS (TIPO_ENTRADA,N3,DOCUMENTO,LINEA,ARTICULO,');
                 SQL.Add('LOTE,UBICACION,CANTIDAD,MARCA_FIN,DATO1,TRATADO,FECHA_TRATADO,');
                 SQL.Add('ERROR,ID_PROCESO,DESCRIPCION,FECHA_ENTRADA,TIPO_BLOQUE)');
                 SQL.Add('VALUES (:TIPO_ENTRADA,:N3,:DOCUMENTO,:LINEA,:ARTICULO,');
                 SQL.Add(':LOTE,:UBICACION,:CANTIDAD,:MARCA_FIN,:DATO1,''N'',NULL,');
                 SQL.Add('NULL,:ID_PROCESO,:DESCRIPCION,:FECHA_ENTRADA,NULL)');
                 Parameters.ParamByName('TIPO_ENTRADA').Value := QMPeticRepo.FieldByName('TIPO_ENTRADA').AsString;
                 Parameters.ParamByName('N3').Value := QMPeticRepo.FieldByName('N3').AsString;
                 Parameters.ParamByName('DOCUMENTO').Value := QMPeticRepo.FieldByName('DOCUMENTO').AsString;
                 Parameters.ParamByName('LINEA').Value := QMPeticRepo.FieldByName('LINEA').AsString;
                 Parameters.ParamByName('ARTICULO').Value := QMPeticRepo.FieldByName('ARTICULO').AsString;
                 Parameters.ParamByName('LOTE').Value := QMPeticRepo.FieldByName('LOTE').AsString;
                 Parameters.ParamByName('UBICACION').Value := QMPeticRepo.FieldByName('UBICACION').AsString;
                 Parameters.ParamByName('CANTIDAD').Value := QMPeticRepo.FieldByName('UNIDADES_ENVIAR').AsString;
                 Parameters.ParamByName('MARCA_FIN').Value := '';
                 Parameters.ParamByName('DATO1').Value := '';
                 Parameters.ParamByName('ID_PROCESO').Value := '';
                 Parameters.ParamByName('DESCRIPCION').Value := '';
                 Parameters.ParamByName('FECHA_ENTRADA').Value := '';
                 ExecSQL;
              end;

              {marco la linea como enviada}
              Edit;
              FieldByName('ALMACEN').AsString := Almacen;
              FieldByName('ENVIADO').AsInteger := 1;
              Post;
           end;
           Next;
        end;
     end;
  finally
     with QGeneral do
     begin
        Connection.CommitTrans;
        Close;
        Desconectar;
     end;
  end;

  {Refresco los datos}
  with QMPeticRepo do
  begin
     Close;
     Open;
  end;
end;

function TDMPersonalUlises.DameAlmacenInteligente: string;
var
  Q : THYFIBQuery;
begin
  if (AlmacenInteligente = '') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
        SQL.Text := 'SELECT ALMACEN FROM PULISES_CONSTANTES';
        ExecQuery;
        AlmacenInteligente := FieldByName['ALMACEN'].AsString;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
  Result := AlmacenInteligente;
end;

procedure TDMPersonalUlises.CambiarAlmacen(id_s: integer);
var
  Q : THYFIBQuery;
  Alm : string;
begin
  Alm := DameAlmacenInteligente;
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
     SQL.Text := 'UPDATE GES_CABECERAS_S SET ALMACEN=?ALMACEN WHERE ID_S=?ID_S AND ALMACEN<>?ALMACEN';
     Params.ByName['ALMACEN'].AsString := Alm;
     Params.ByName['ID_S'].AsInteger := id_s;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMPersonalUlises.RegeneraStockPeticRepo(Almacen: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
     SQL.Text := 'UPDATE TMP_PULISES_PETIC_REPO SET ALMACEN=?ALMACEN, RECALCULA_STOCK=1';
     Params.ByName['ALMACEN'].AsString := Almacen;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
  QMPeticRepo.Close;
  QMPeticRepo.Open;
end;

procedure TDMPersonalUlises.RefrescaPeticionRepoRespuesta(Empresa, Canal: integer; Almacen: string);
var
  Q : THYFIBQuery;
  Existe : boolean;
begin
  {Luego importo de EXP_ENTRADAS}
  with QPeticionRepoRespuesta do
  begin
     Close;
     Connection := ADOUlises;
     Conectar(CS, DDB);
     Connection.BeginTrans;
     try
        SQL.Clear;
        SQL.Add('SELECT * FROM EXP_ENTRADAS');
        SQL.Add('WHERE TRATADO=''N'' AND FECHA_TRATADO IS NULL AND ERROR IS NULL');
        Open;
        while not EOF do
        begin
           try
              {Primero me fijo si existe la línea}
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                 SQL.Text := 'SELECT COUNT(*) FROM TMP_PULISES_PETIC_REPO WHERE N3=?N3 AND DOCUMENTO=?DOCUMENTO AND LINEA=?LINEA';
                 Params.ByName['N3'].AsString := QPeticionReposicion.FieldByName('N3').AsString;
                 Params.ByName['DOCUMENTO'].AsString := QPeticionReposicion.FieldByName('DOCUMENTO').AsString;
                 Params.ByName['LINEA'].AsString := QPeticionReposicion.FieldByName('LINEA').AsString;
                 ExecQuery;
                 Existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);

              if (Existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                    SQL.Text := 'INSERT INTO TMP_PULISES_PETIC_REPO(TIPO_ENTRADA,N3,DOCUMENTO,LINEA,ARTICULO,LOTE,UBICACION,CANTIDAD,ENTRADA,EMPRESA,CANAL,ALMACEN) ' +
                       'VALUES (?TIPO_ENTRADA,?N3,?DOCUMENTO,?LINEA,?ARTICULO,?LOTE,?UBICACION,?CANTIDAD,?ENTRADA,?EMPRESA,?CANAL,?ALMACEN)';
                    Params.ByName['TIPO_ENTRADA'].AsString := QPeticionReposicion.FieldByName('TIPO_ENTRADA').AsString;
                    Params.ByName['N3'].AsString := QPeticionReposicion.FieldByName('N3').AsString;
                    Params.ByName['DOCUMENTO'].AsString := QPeticionReposicion.FieldByName('DOCUMENTO').AsString;
                    Params.ByName['LINEA'].AsString := QPeticionReposicion.FieldByName('LINEA').AsString;
                    Params.ByName['ARTICULO'].AsString := QPeticionReposicion.FieldByName('ARTICULO').AsString;
                    Params.ByName['LOTE'].AsString := QPeticionReposicion.FieldByName('LOTE').AsString;
                    Params.ByName['UBICACION'].AsString := QPeticionReposicion.FieldByName('UBICACION').AsString;
                    Params.ByName['CANTIDAD_ENTRADA'].AsInteger := QPeticionReposicion.FieldByName('CANTIDAD_ENTRADA').AsInteger;
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    Params.ByName['EMPRESA'].AsInteger := Empresa;
                    Params.ByName['CANAL'].AsInteger := Canal;
                    Params.ByName['ALMACEN'].AsString := Almacen;
                    ExecQuery;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                    SQL.Clear;
                    SQL.Add('UPDATE TMP_PULISES_PETIC_REPO ');
                    SQL.Add('SET ');
                    SQL.Add(' UNIDADES_ENVIAR=?UNIDADES_ENVIAR ');
                    SQL.Add(',CANTIDAD_ENTRADA=?CANTIDAD_ENTRADA ');
                    SQL.Add('WHERE ');
                    SQL.Add('N3=?N3 AND ');
                    SQL.Add('DOCUMENTO=?DOCUMENTO AND ');
                    SQL.Add('LINEA=?LINEA ');

                    Params.ByName['N3'].AsString := QPeticionReposicion.FieldByName('N3').AsString;
                    Params.ByName['DOCUMENTO'].AsString := QPeticionReposicion.FieldByName('DOCUMENTO').AsString;
                    Params.ByName['LINEA'].AsString := QPeticionReposicion.FieldByName('LINEA').AsString;
                    Params.ByName['CANTIDAD_ENTRADA'].AsInteger := QPeticionReposicion.FieldByName('CANTIDAD_ENTRADA').AsInteger;
                    ExecQuery;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              with QGeneral do
              begin
                 Close;
                 Connection := ADOUlises;
                 SQL.Clear;
                 SQL.Add('UPDATE EXP_PETIC_REPO SET TRATADO=''S'', FECHA_TRATADO=:FECHA_TRATADO, ERROR = NULL WHERE N3=''' + QPeticionReposicion.FieldByName('N3').AsString + '''');
                 Parameters.ParamByName('FECHA_TRATADO').Value := Now;
                 ExecSQL;
              end;
           except
              with QGeneral do
              begin
                 Close;
                 Connection := ADOUlises;
                 SQL.Clear;
                 SQL.Add('UPDATE EXP_PETIC_REPO SET TRATADO=''S'', FECHA_TRATADO=:FECHA_TRATADO, ERROR = ''ERROR INCORPORANDO EXP_PETIC_REPO'' WHERE N3=''' + QPeticionReposicion.FieldByName('N3').AsString + '''');
                 Parameters.ParamByName('FECHA_TRATADO').Value := Now;
                 ExecSQL;
              end;
           end;
           Next;
        end;
        Connection.CommitTrans;
     except
        on e: Exception do
        begin
           Connection.RollbackTrans;
           MessageDlg(_('Error [RegenerarPeticionReposicion]') + #13#10 + e.Message, mtError, [mbOK], 0);
        end;
     end;
  end;

  {Refrescamos los datos}
  with QMPeticRepoResp do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPersonalUlises.GeneraMovimientosPeticionRepo;
var
  Serie, UltimoAlmacen : string;
  rig : integer;
  Q : THYFIBQuery;
begin
  Serie := REntorno.Serie;
  rig := 0;
  UltimoAlmacen := '';
  with QMPeticRepoResp do
  begin
     {Lo ordenamos por almacen para ir haciendo cabeceras diferentes segun corresponda}
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM TMP_PULISES_PETIC_REPO');
     SelectSQL.Add('WHERE MOVIMIENTO=0');
     SelectSQL.Add('ORDER BY ALMACEN, N3, DOCUMENTO, LINEA');
     Open;

     First;
     while not EOF do
     begin
        {Busco la cabecera para ese N3 y ese almacen}
        if (FieldByName('ALMACEN').AsString <> UltimoAlmacen) then
        begin
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
              SQL.Text := 'SELECT RIG FROM GES_CABECERAS_ST WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND SERIE=?SERIE AND ALMACEN_ORI=?ALMACEN_ORI AND COMENTARIO=?COMENTARIO AND ESTADO=0 AND ENTRADA=?ENTRADA';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['ALMACEN_ORI'].AsString := QMPeticRepoResp.FieldByName('ALMACEN').AsString;
              {Si cambia comentario, cambiar tambien al insertar}
              Params.ByName['COMENTARIO'].AsString := 'Traspaso P. Ulises (' + Trim(QMPeticRepoResp.FieldByName('N3').AsString) + ')';
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              ExecQuery;
              rig := FieldByName['RIG'].AsInteger;
              FreeHandle;
           end;
           FreeAndNil(Q);
        end;

        {Si todavía no está creada la cabecera, la creamos}
        if (rig = 0) then
        begin
           rig := DMMain.Contador_EES(Serie, 'MAN');
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
              SQL.Clear;
              SQL.Add('INSERT INTO GES_CABECERAS_ST ');
              SQL.Add('(EMPRESA,SERIE,EJERCICIO,RIG, ');
              SQL.Add('TIPO_OPERACION,FECHA,ALMACEN_ORI,CANAL_ORI,ALMACEN_DST,CANAL_DST, ');
              SQL.Add('COMENTARIO,TIPO_VALORACION,ENTRADA,TRASPASADO,ID_REG,ESTADO, ');
              SQL.Add('DEPOSITO,DEFINITIVO) ');
              SQL.Add('VALUES ');
              SQL.Add('(?EMPRESA,?SERIE,?EJERCICIO,?RIG, ');
              SQL.Add('?TIPO_OPERACION,?FECHA,?ALMACEN_ORI,?CANAL_ORI,?ALMACEN_DST,?CANAL_DST, ');
              SQL.Add('?COMENTARIO,?TIPO_VALORACION,?ENTRADA,?TRASPASADO,?ID_REG,?ESTADO, ');
              SQL.Add('?DEPOSITO,?DEFINITIVO) ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['RIG'].AsInteger := rig;
              Params.ByName['TIPO_OPERACION'].AsString := 'T';
              Params.ByName['FECHA'].AsDateTime := Now;
              Params.ByName['ALMACEN_ORI'].AsString := QMPeticRepoResp.FieldByName('ALMACEN').AsString;
              Params.ByName['CANAL_ORI'].AsInteger := REntorno.Canal;
              Params.ByName['ALMACEN_DST'].AsString := DameAlmacenInteligente;
              Params.ByName['CANAL_DST'].AsInteger := REntorno.Canal;
              {Si cambia comentario, cambiar tambien al buscar}
              Params.ByName['COMENTARIO'].AsString := 'Traspaso P. Ulises (' + Trim(QMPeticRepoResp.FieldByName('N3').AsString) + ')';
              Params.ByName['TIPO_VALORACION'].AsInteger := 1;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['TRASPASADO'].AsInteger := 0;
              Params.ByName['ID_REG'].AsInteger := 0;
              Params.ByName['ESTADO'].AsInteger := 0;
              Params.ByName['DEPOSITO'].AsInteger := 0;
              Params.ByName['DEFINITIVO'].AsInteger := 0;
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);
        end;

        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
           SQL.Clear;
           SQL.Add('INSERT INTO GES_DETALLES_ST ');
           SQL.Add('(EMPRESA,EJERCICIO,SERIE,RIG,LINEA,UNIDADES,PRECIO,UNIDADES_EXT,RECIBIDAS,PRECIO_VENTA,');
           SQL.Add('ENTRADA,TITULO,');
           SQL.Add('ORDEN_PRODUCCION,ARTICULO,NSERIE,ID_DETALLES_ST)');
           SQL.Add('VALUES');
           SQL.Add('(?EMPRESA,?EJERCICIO,?SERIE,?RIG,?LINEA,?UNIDADES,?PRECIO,?UNIDADES_EXT,?RECIBIDAS,?PRECIO_VENTA,');
           SQL.Add('?ENTRADA,?TITULO,');
           SQL.Add('?ORDEN_PRODUCCION,?ARTICULO,?NSERIE,?ID_DETALLES_ST)');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['RIG'].AsInteger := rig;
           Params.ByName['LINEA'].AsInteger := 0;
           Params.ByName['UNIDADES'].AsInteger := QMPeticRepoResp.FieldByName('CANTIDAD_ENTRADA').AsInteger;
           Params.ByName['PRECIO'].AsFloat := DMMain.DamePrecioMovimientoArticulo(REntorno.Empresa, REntorno.Canal, QMPeticRepoResp.FieldByName('ARTICULO').AsString, QMPeticRepoResp.FieldByName('ALMACEN').AsString, 0, 'T', 0);
           Params.ByName['UNIDADES_EXT'].AsInteger := 0;
           Params.ByName['RECIBIDAS'].AsInteger := 0;
           Params.ByName['PRECIO_VENTA'].AsInteger := 0;
           Params.ByName['ID_DETALLES_ST'].AsInteger := 0;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['TITULO'].AsString := DameTituloArticulo(QMPeticRepoResp.FieldByName('ARTICULO').AsString);
           Params.ByName['ORDEN_PRODUCCION'].AsInteger := 0;
           Params.ByName['ARTICULO'].AsString := QMPeticRepoResp.FieldByName('ARTICULO').AsString;
           Params.ByName['NSERIE'].AsString := '';
           ExecQuery;
           FreeHandle;
        end;
        FreeAndNil(Q);

        Edit;
        FieldByName('MOVIMIENTO').AsInteger := rig;
        Post;
        Next;
     end; {while not EOF}

     {Bloqueo los movimientos generados}
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
        SQL.Text := 'UPDATE GES_CABECERAS_ST SET ESTADO=5 WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND SERIE=?SERIE AND ESTADO=0 AND ENTRADA=?ENTRADA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);

     {Vuelvo a hacer el select general}
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM TMP_PULISES_PETIC_REPO');
     SelectSQL.Add('ORDER BY N3, DOCUMENTO, LINEA');
     Open;
  end; {with QMPeticRepoResp}
end;

procedure TDMPersonalUlises.GenerarAlbaranes;
var
  Q : THYFIBQuery;
  ejercicio, canal, rig, id_s, id_s_d, portes, rango, indice, transportista, dir, i : integer;
  Por_Portes, I_Portes : double;
  serie, Tipo, articulo : string;
  WndList : Pointer;
  Loteado : boolean;
  Lote : string;
  d_empresa, d_ejercicio, d_canal, d_rig, d_linea : integer;
  d_serie, d_tipo : string;
begin
  AbreData(TDMAgrupacionPedidosVentas, DMAgrupacionPedidosVentas);

  Tipo := 'ALB';
  Transportista := 0;

  with DMAgrupacionPedidosVentas do
  begin
     EBusca.Empresa := REntorno.Empresa;
     EBusca.Ejercicio := REntorno.Ejercicio;
     EBusca.Canal := REntorno.Canal;
     EBusca.Serie := REntorno.Serie;
     EBusca.Cliente := 0;
  end;

  FInfoFacturacionAlb := TFInfoFacturacionAlb.Create(Self);
  WndList := DisableTaskWindows(FInfoFacturacionAlb.Handle);
  try
     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Marcando Pedidos');
        GBProcesaCab.Caption := _('Procesando Pedido');
        LBLEjercicio.Caption := '';
        LBLCanal.Caption := '';
        LBLSerie.Caption := '';
        LBLRig.Caption := '';
        Show;
        Top := FMain.Height + 5;
     end;

     with QPUlisesCabServ do
     begin
        First;
        while not EOF do
        begin
           Transportista := 0;
           if (FieldByName('PROCESAR').AsInteger = 1) then
           begin
              DMAgrupacionPedidosVentas.EBusca.Serie := QPUlisesCabServSERIE.AsString;
              DMAgrupacionPedidosVentas.EBusca.Cliente := QPUlisesCabServCLIENTE.AsInteger;
              Transportista := DMAgrupacionPedidosVentas.DameMinTransportista(QPUlisesCabServCLIENTE.AsInteger);
              DMAgrupacionPedidosVentas.DamePortesCliente(QPUlisesCabServCLIENTE.AsInteger, Portes, Rango, Indice, I_Portes, Por_Portes);

              QMDetalle.First;
              while (not QMDetalle.EOF) do
              begin
                 with FInfoFacturacionAlb do
                 begin
                    LBLEjercicio.Caption := QPUlisesCabServEJERCICIO.AsString;
                    LBLCanal.Caption := QPUlisesCabServCANAL.AsString;
                    LBLSerie.Caption := QPUlisesCabServSERIE.AsString;
                    LBLRig.Caption := QPUlisesCabServRIG.AsString + '.' + QMDetalleLINEA.AsString;
                 end;
                 Application.ProcessMessages;
                 FInfoFacturacionalb.BringToFront;
                 {Marco la linea para traspasarla a albaran}
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                    SQL.Text := 'UPDATE VER_DETALLE_PEDIDO ' +
                       'SET UNIDADES_RESERVADAS=?UNIDADES_RESERVADAS, SERVIDO=?SERVIDO, ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION, FECHA_REC_DET=?FECHA_REC_DET ' +
                       'WHERE ID_DETALLES_S=?ID_DETALLES_S ';
                    Params.ByName['UNIDADES_RESERVADAS'].AsFloat := QMDetalleCANTIDAD_CONFIRMADA.AsInteger;
                    if (QMDetalleCANTIDAD_CONFIRMADA.AsInteger = QMDetalleUNIDADES.AsInteger + QMDetalleUNIDADES_SERVIDAS.AsInteger) then
                       Params.ByName['SERVIDO'].AsInteger := 1
                    else
                       Params.ByName['SERVIDO'].AsInteger := 0;
                    Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
                    Params.ByName['FECHA_REC_DET'].AsDateTime := Now;
                    Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
                    ExecQuery;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);

                 QMDetalle.Next;
              end; {QMDetalle.EOF}
           end;
           Next;
        end;
     end; {with QPUlisesCabServ}

     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Traspasando Pedidos');
        GBProcesaCab.Caption := _('Procesando Pedido');
        LBLEjercicio.Caption := '';
        LBLCanal.Caption := '';
        LBLSerie.Caption := '';
        LBLRig.Caption := '';
     end;
     Application.ProcessMessages;
     FInfoFacturacionalb.BringToFront;
     DMAgrupacionPedidosVentas.InicializaTraspaso;

     // Recorriendo y creando cabeceras
     with DMAgrupacionPedidosVentas.xRecorre do
     begin
        First;
        while not EOF do
        begin
           id_s := FieldByName('id_s').AsInteger;
           ejercicio := FieldByName('ejercicio').AsInteger;
           canal := FieldByName('canal').AsInteger;
           serie := FieldByName('serie').AsString;
           rig := FieldByName('rig').AsInteger;
           dir := FieldByName('direccion').AsInteger; {dji lrk kri}
           with FInfoFacturacionAlb do
           begin
              LBLEjercicio.Caption := IntToStr(Ejercicio);
              LBLCanal.Caption := IntToStr(Canal);
              LBLSerie.Caption := Serie;
              LBLRig.Caption := IntToStr(Rig);
           end;
           Application.ProcessMessages;
           FInfoFacturacionalb.BringToFront;

           DMAgrupacionPedidosVentas.GeneraCabeceras(ejercicio, Canal, rig, id_s, serie,
              tipo, transportista, portes, rango, indice, REntorno.Canal,
              I_Portes, Por_Portes, Now, dir, False, False, 0);
           Next;
        end;
        Close;
     end;

     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Traspasando Pedidos');
        GBProcesaCab.Caption := _('Traspasando Pedido :');
     end;
     Application.ProcessMessages;
     FInfoFacturacionalb.BringToFront;
     DMAgrupacionPedidosVentas.RecorreProcesados(REntorno.Entrada);

     with DMAgrupacionPedidosVentas.xProcesar do
     begin
        First;
        while not EOF do
        begin
           id_s := FieldByName('id_s').AsInteger;
           id_s_d := FieldByName('id_s_d').AsInteger;
           ejercicio := FieldByName('ejercicio').AsInteger;
           canal := FieldByName('canal').AsInteger;
           serie := FieldByName('serie').AsString;
           rig := FieldByName('rig').AsInteger;
           with FInfoFacturacionAlb do
           begin
              LBLEjercicio.Caption := IntToStr(Ejercicio);
              LBLCanal.Caption := IntToStr(Canal);
              LBLSerie.Caption := Serie;
              LBLRig.Caption := IntToStr(Rig);
           end;
           Application.ProcessMessages;
           FInfoFacturacionalb.BringToFront;

           DMAgrupacionPedidosVentas.TraspasaPedido(id_s, id_s_d, tipo, False, False);
           Next;
        end;
        Close;
     end;

     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Actualizando Precios');
        GBProcesaCab.Caption := _('Procesando Artículo: ');
     end;
     Application.ProcessMessages;
     FInfoFacturacionalb.BringToFront;
     DMAgrupacionPedidosVentas.RecorreFacturados(DMAgrupacionPedidosVentas.Proceso_auto);

     with DMAgrupacionPedidosVentas.xFacturados do
     begin
        First;
        while not EOF do
        begin
           articulo := FieldByName('articulo').AsString;
           with FInfoFacturacionAlb do
           begin
              LTitEjercicio.Caption := _('Código :');
              LTitCanal.Caption := '';
              LTitSerie.Caption := '';
              LTitRIG.Caption := '';
              LBLEjercicio.Caption := articulo;
              LBLCanal.Caption := '';
              LBLSerie.Caption := '';
              LBLRig.Caption := '';
           end;
           DMAgrupacionPedidosVentas.ActualizaPrecio(articulo, DMAgrupacionPedidosVentas.Proceso_auto);
           Next;
        end;
        Close;
     end;

     DMAgrupacionPedidosVentas.RecorreProcesados(REntorno.Entrada);

     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Ajustando Pedidos');
        GBProcesaCab.Caption := _('Ajustando Pedido :');
        LTitEjercicio.Caption := _('Ejercicio') + ' :';
        LTitCanal.Caption := _('Canal') + ' :';
        LTitSerie.Caption := _('Serie') + ' :';
        LTitRIG.Caption := _('RIG');
     end;
     with DMAgrupacionPedidosVentas.xProcesar do
     begin
        First;
        while not EOF do
        begin
           id_s := FieldByName('id_s').AsInteger;
           id_s_d := FieldByName('id_s_d').AsInteger;
           ejercicio := FieldByName('ejercicio').AsInteger;
           canal := FieldByName('canal').AsInteger;
           serie := FieldByName('serie').AsString;
           rig := FieldByName('rig').AsInteger;
           with FInfoFacturacionAlb do
           begin
              LBLEjercicio.Caption := IntToStr(Ejercicio);
              LBLCanal.Caption := IntToStr(Canal);
              LBLSerie.Caption := Serie;
              LBLRig.Caption := IntToStr(Rig);
           end;
           DMAgrupacionPedidosVentas.ActualizaPedidos(id_s, id_s_d);
           Next;
        end;
        Close;
     end;

     DMAgrupacionPedidosVentas.BorraTemporales;

     DMAgrupacionPedidosVentas.Final(DMAgrupacionPedidosVentas.Proceso_auto, REntorno.Canal, Tipo, DMAgrupacionPedidosVentas.SerieDestino);

     CierraData(DMAgrupacionPedidosVentas);

     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Nro. de Serie y Lote');
        GBProcesaCab.Caption := _('Asigna Nro. Serie y Lote');
     end;

     with QPUlisesCabServ do
     begin
        First;
        while not EOF do
        begin
           if (FieldByName('PROCESAR').AsInteger = 1) then
           begin
              QMDetalle.First;
              while (not QMDetalle.EOF) do
              begin
                 with FInfoFacturacionAlb do
                 begin
                    LBLEjercicio.Caption := QPUlisesCabServEJERCICIO.AsString;
                    LBLCanal.Caption := QPUlisesCabServCANAL.AsString;
                    LBLSerie.Caption := QPUlisesCabServSERIE.AsString;
                    LBLRig.Caption := QPUlisesCabServRIG.AsString + '.' + QMDetalleLINEA.AsString;
                 end;
                 Application.ProcessMessages;
                 FInfoFacturacionalb.BringToFront;

                 {Miro si el articulo controla lote}
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                    SQL.Text := 'SELECT LOTES_KRI FROM ART_ARTICULOS WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO';
                    Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
                    Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
                    ExecQuery;
                    Loteado := FieldByName['LOTES_KRI'].AsInteger = 1;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);

                 {Si controla lotes}
                 if (Loteado) then
                 begin
                    {Busco el Lote asignado por PUlises}
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                       SQL.Text := 'SELECT LOTE FROM PULISES_DETA_PED WHERE ID_DETALLES_S=?ID_DETALLES_S';
                       Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalleID_DETALLES_S.AsInteger;
                       ExecQuery;
                       Lote := FieldByName['LOTE'].AsString;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);

                    {Si PUlises asigna un lote}
                    if (Lote > ' ') then
                       {LOTE=PUlises.Lote}
                       Lote := Lote
                    else {Si PUlises no asigna el lote (lote='')}
                    begin
                       {Busco el lote que hay en ese almacen (debe haber solo uno)}
                       Q := THYFIBQuery.Create(nil);
                       with Q do
                       begin
                          Close;
                          DataBase := DMMain.DataBase;
                          //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                          SQL.Text := 'SELECT LOTE FROM NRO_SERIE_KRI ' +
                             'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO AND ' +
                             '(ALMACEN_ENT =?ALMACEN or ALMACEN_MOE=?ALMACEN) AND ' +
                             '(CANAL_ENT =?CANAL or CANAL_MOE=?CANAL) AND ' +
                             'MOVIMIENTO=0 AND DEVOLUCION=0 ORDER BY CADUCIDAD';
                          Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
                          Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
                          Params.ByName['ALMACEN'].AsString := QMDetalleALMACEN.AsString;
                          Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
                          ExecQuery;
                          Lote := FieldByName['LOTE'].AsString;
                          FreeHandle;
                       end;
                       FreeAndNil(Q);
                    end;

                    {Busco linea de ALB destino}
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                       SQL.Text := 'select D_EMPRESA,D_EJERCICIO,D_CANAL,D_SERIE,D_TIPO,D_RIG,D_LINEA from ges_detalles_relaciones ' +
                          'where o_empresa=?empresa and o_ejercicio=?ejercicio and o_canal=?canal and ' +
                          'o_serie=?serie and o_tipo=?tipo and o_rig=?rig and o_linea=?linea and d_tipo=''ALB'' ';
                       Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
                       Params.ByName['EJERCICIO'].AsInteger := QMDetalleEJERCICIO.AsInteger;
                       Params.ByName['CANAL'].AsInteger := QMDetalleCANAL.AsInteger;
                       Params.ByName['SERIE'].AsString := QMDetalleSERIE.AsString;
                       Params.ByName['TIPO'].AsString := QMDetalleTIPO.AsString;
                       Params.ByName['RIG'].AsInteger := QMDetalleRIG.AsInteger;
                       Params.ByName['LINEA'].AsInteger := QMDetalleLINEA.AsInteger;
                       ExecQuery;
                       d_empresa := FieldByName['D_EMPRESA'].AsInteger;
                       d_ejercicio := FieldByName['D_EJERCICIO'].AsInteger;
                       d_canal := FieldByName['D_CANAL'].AsInteger;
                       d_serie := FieldByName['D_SERIE'].AsString;
                       d_tipo := FieldByName['D_TIPO'].AsString;
                       d_rig := FieldByName['D_RIG'].AsInteger;
                       d_linea := FieldByName['D_LINEA'].AsInteger;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);

                    {Asigno ese lote a la línea del ALB}
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := DMMain.DataBase;
                       //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
                       SQL.Text := 'execute procedure G_ASIGNA_LOTE_KRI(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ALMACEN,?ARTICULO,?LOTE,?CANTIDAD,?ID_UBICACION)';
                       Params.ByName['EMPRESA'].AsInteger := d_empresa;
                       Params.ByName['EJERCICIO'].AsInteger := d_ejercicio;
                       Params.ByName['CANAL'].AsInteger := d_canal;
                       Params.ByName['SERIE'].AsString := d_serie;
                       Params.ByName['TIPO'].AsString := d_tipo;
                       Params.ByName['RIG'].AsInteger := d_rig;
                       Params.ByName['LINEA'].AsInteger := d_linea;
                       Params.ByName['ALMACEN'].AsString := QMDetalleALMACEN.AsString;
                       Params.ByName['ARTICULO'].AsString := QMDetalleARTICULO.AsString;
                       Params.ByName['LOTE'].AsString := Lote;
                       Params.ByName['CANTIDAD'].AsInteger := QMDetalleCANTIDAD_CONFIRMADA.AsInteger;
                       Params.ByName['ID_UBICACION'].AsInteger := 0;
                       ExecQuery;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end; {if Loteado}

                 QMDetalle.Next;
              end; {QMDetalle.EOF}
           end;
           Next;
        end;
     end; {with QPUlisesCabServ}

     {Agrupo los albaranes}
     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Agrupacion');
        GBProcesaCab.Caption := _('Agrupando albaranes');
        LBLEjercicio.Caption := '';
        LBLCanal.Caption := '';
        LBLSerie.Caption := '';
        LBLRig.Caption := '';
     end;
     Application.ProcessMessages;
     FInfoFacturacionalb.BringToFront;
     FMAlbaranes.AAgrupaAlbaranesFiltradosKri.Execute;
     FMAlbaranes.Close;

     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Traspasos');
        GBProcesaCab.Caption := _('Traspaso a Factura');
     end;
     {Abro agrupacion de albaranes para imprimir/facturar/etiquetas}
     FMain.EjecutaAccion(FMain.AAgrupacionDeAlbaranesKri);
     DMAgrupacionDeAlbaranesKri.Refresca; {por si ya estaba abierto}
     Application.ProcessMessages;
     FInfoFacturacionalb.BringToFront;
     {Marco los albaranes en la agrupacion}
     DMAgrupacionDeAlbaranesKri.Marcar(REntorno.Entrada);
     Application.ProcessMessages;
     FInfoFacturacionalb.BringToFront;
     {Traspasa los albaranes marcados a Factura}
     DMAgrupacionDeAlbaranesKri.FacturaAlbaranes;
     Application.ProcessMessages;
     FInfoFacturacionalb.BringToFront;

     with FInfoFacturacionAlb do
     begin
        LBLGeneral.Caption := _('Impresiones');
        GBProcesaCab.Caption := _('Impresion de Albaran y Factura');
     end;
     {Imprime los albaranes}
     //DMAgrupacionDeAlbaranesKri.ImprimirAlbaranes(0);
     //Application.ProcessMessages; FInfoFacturacionalb.BringToFront;
     {Imprime las facturas}
     //DMAgrupacionDeAlbaranesKri.ImprimirFacturas(0);
     //Application.ProcessMessages; FInfoFacturacionalb.BringToFront;
     {Imprime las etiquetas}
     //DMAgrupacionDeAlbaranesKri.ImprimirEtiquetas(1{imprimir}, 1{copias}, 0{vacias});
     //Application.ProcessMessages; FInfoFacturacionalb.BringToFront;

     DMAgrupacionDeAlbaranesKri.Marcar(0);
  finally
     EnableTaskWindows(WndList);
     FInfoFacturacionAlb.Close;
  end;

  {Refrescamos la tabla para que nos los muestra}
  with QPUlisesCabServ do
  begin
     Close;
     Open;
  end;
end;

end.
