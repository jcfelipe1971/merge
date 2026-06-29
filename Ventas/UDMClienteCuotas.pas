unit UDMClienteCuotas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, FIBQuery, HYFIBQuery, DB, FIBDataSet, FIBTableDataSet,
  FIBDatabase, UFIBModificados, FIBDataSetRO, Dialogs, Forms;

type
  TDMClienteCuotas = class(TDataModule)
     TLocal: THYTransaction;
     QMCuotas: TFIBTableSet;
     QMCuotasEMPRESA: TIntegerField;
     QMCuotasCLIENTE: TIntegerField;
     QMCuotasCUOTA: TIntegerField;
     QMCuotasTERCERO: TIntegerField;
     QMCuotasNOTAS: TBlobField;
     QMCuotasSUPLIDO: TIntegerField;
     QMCuotasPERIODICIDAD: TIntegerField;
     QMCuotasFECHA_ULT_CUOTA: TDateTimeField;
     QMCuotasFECHA_PROX_CUOTA: TDateTimeField;
     QMCuotasSERIE_ULT_CUOTA: TFIBStringField;
     QMCuotasTIPO_DOC: TFIBStringField;
     QMCuotasAGRUPADA: TIntegerField;
     QMCuotasRIG_DOC: TIntegerField;
     QMCuotasID_S: TIntegerField;
     DSQMCuotas: TDataSource;
     xTipoDoc: TFIBDataSetRO;
     DSxTipoDoc: TDataSource;
     xTipoDocTITULO: TFIBStringField;
     QMCuotasDIAS: TIntegerField;
     QMCuotasID_S_D: TIntegerField;
     QMCuotasFECHA_FIN_CUOTA: TDateTimeField;
     TUpdate: THYTransaction;
     QMCuotasCANAL: TIntegerField;
     QMCuotasID_ORIGEN: TIntegerField;
     QMCuotasTIPO_ORIGEN: TFIBStringField;
     QMCuotasLINEA_INICIAL: TIntegerField;
     QMCuotasPROYECTO: TIntegerField;
     QMCuotasOBSERVACIONES: TBlobField;
     QMCuotasID_CUOTA: TIntegerField;
     QMCuotasNOMBRE_R_SOCIAL: TFIBStringField;
     QMCuotasNOMBRE_COMERCIAL: TFIBStringField;
     QMCuotasNIF: TFIBStringField;
     QMCuotasEMAIL: TFIBStringField;
     QMCuotasTELEFONO01: TFIBStringField;
     QMCuotasDetalle: TFIBTableSet;
     DSCuotasDetalle: TDataSource;
     QMCuotasDetalleEMPRESA: TIntegerField;
     QMCuotasDetalleCANAL: TIntegerField;
     QMCuotasDetalleCLIENTE: TIntegerField;
     QMCuotasDetalleCUOTA: TIntegerField;
     QMCuotasDetalleLINEA: TIntegerField;
     QMCuotasDetalleARTICULO: TFIBStringField;
     QMCuotasDetalleDESCRIPCION: TFIBStringField;
     QMCuotasDetalleUNIDADES: TFloatField;
     QMCuotasDetalleIMPORTE: TFloatField;
     QMCuotasDetalleDESCUENTO: TFloatField;
     QMCuotasDetalleID_A: TIntegerField;
     QMCuotasDetalleID_CUOTA: TIntegerField;
     QMCuotasDetalleP_COSTE: TFloatField;
     QMCuotasDetalleUNIDAD_FOMENTO: TFloatField;
     QMCuotasSU_REFERENCIA: TFIBStringField;
     procedure QMCuotasNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCuotasAfterOpen(DataSet: TDataSet);
     procedure QMCuotasTIPO_DOCChange(Sender: TField);
     procedure QMCuotasBeforePost(DataSet: TDataSet);
     procedure AntesDeEditar(DataSet: TDataSet);
     procedure QMCuotasAfterPost(DataSet: TDataSet);
     procedure QMCuotasCLIENTEChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCuotasBeforeClose(DataSet: TDataSet);
     procedure QMCuotasDetalleARTICULOChange(Sender: TField);
     procedure QMCuotasDetalleNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     ClienteFiltrado: integer;
     SQLBase: TStrings;
     procedure CompruebaCuotas;
  public
     { Public declarations }
     Fecha_Fin_Cuota_Old: TDateTime;
     procedure CambiaArticuloCuota(Articulo: string);
     procedure FiltraCliente(Cliente: integer; TipoOrigen: string = ''; IdOrigen: integer = 0);
     procedure MuestraDoc;
     procedure CrearCuota(Cliente: integer; Importe: double; TipoOrigen: string; IdOrigen: integer);
     procedure BusquedaCompleja;
     procedure ImprimirContrato(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
  end;

var
  DMClienteCuotas : TDMClienteCuotas;

implementation

uses UDMMain, UEntorno, UFMain, uFBusca, UUtiles, UDMLstCuotasCliente, UDMListados, UFormGest, UDameDato;

{$R *.dfm}

procedure TDMClienteCuotas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  ClienteFiltrado := 0;
  SQLBase := TStringList.Create;
  SQLBase.Text := QMCuotas.SelectSQL.Text;

  QMCuotasDetalleIMPORTE.DisplayFormat := MascaraE;
  QMCuotasDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMCuotasDetalleUNIDADES.DisplayFormat := MascaraI;
  QMCuotasDetalleP_COSTE.DisplayFormat := MascaraE;

  with QMCuotas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMClienteCuotas.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMClienteCuotas.FiltraCliente(Cliente: integer; TipoOrigen: string = ''; IdOrigen: integer = 0);
begin
  ClienteFiltrado := Cliente;

  with QMCuotas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_EMP_CLIENTES_CUOTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');
     SelectSQL.Add(' AND CANAL = ?CANAL ');
     SelectSQL.Add(' AND CLIENTE = ?CLIENTE ');
     SelectSQL.Add(' ORDER BY CUOTA ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := ClienteFiltrado;
     Open;
     if (TipoOrigen <> '') then
     begin
        Last;
        while ((not BOF) and (FieldByName('ID_ORIGEN').AsInteger <> IdOrigen)) do
           Prior;
     end;
  end;
end;

procedure TDMClienteCuotas.QMCuotasNewRecord(DataSet: TDataSet);
begin
  QMCuotasEMPRESA.AsInteger := REntorno.Empresa;
  if (ClienteFiltrado <> 0) then
     QMCuotasCLIENTE.AsInteger := ClienteFiltrado;
  QMCuotasID_CUOTA.AsInteger := 0;
  QMCuotasSUPLIDO.AsInteger := 0;
  QMCuotasAGRUPADA.AsInteger := 0;
  QMCuotasPERIODICIDAD.AsInteger := 12;
  QMCuotasDIAS.AsInteger := 0;
  QMCuotasFECHA_ULT_CUOTA.AsDateTime := REntorno.FechaTrabSh;
  QMCuotasFECHA_PROX_CUOTA.AsDateTime := REntorno.FechaTrabSh;
  QMCuotasSERIE_ULT_CUOTA.AsString := '';
  QMCuotasRIG_DOC.AsInteger := 0;
  QMCuotasDIAS.AsInteger := 0;
  QMCuotasTIPO_DOC.AsString := 'FAC';
  QMCuotasSERIE_ULT_CUOTA.AsString := '';
  QMCuotasCANAL.AsInteger := REntorno.Canal;
  QMCuotasPROYECTO.AsInteger := 0;
end;

procedure TDMClienteCuotas.CambiaArticuloCuota(Articulo: string);
begin
  if QMCuotasDetalle.State in [dsEdit, dsInsert] then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO_LARGO, P_COSTE FROM ART_ARTICULOS WHERE EMPRESA = ?EMPRESA AND ARTICULO = ?ARTICULO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           ExecQuery;
           QMCuotasDetalleDESCRIPCION.AsString := FieldByName['TITULO_LARGO'].AsString;
           QMCuotasDetalleIMPORTE.AsFloat := FieldByName['P_COSTE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMClienteCuotas.QMCuotasAfterOpen(DataSet: TDataSet);
begin
  xTipoDoc.Open;
  QMCuotasDetalle.Open;
end;

procedure TDMClienteCuotas.QMCuotasTIPO_DOCChange(Sender: TField);
begin
  xTipoDoc.Close;
  xTipoDoc.Open;
end;

procedure TDMClienteCuotas.QMCuotasBeforePost(DataSet: TDataSet);
begin
  if ((Fecha_Fin_Cuota_Old <> QMCuotasFECHA_FIN_CUOTA.AsDateTime) and (QMCuotasFECHA_FIN_CUOTA.AsFloat > 0)) then
     CompruebaCuotas;

  DMMain.Contador_Gen(DataSet, 'ID_CUOTAS', 'ID_CUOTA'); // ID

  if (QMCuotas.State in [dsInsert]) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE UT_INCREMENTA_FECHA(?FECHA, ?MESES, ?DIAS)';
           Params.ByName['FECHA'].AsDateTime := QMCuotasFECHA_ULT_CUOTA.AsDateTime;
           Params.ByName['MESES'].AsInteger := QMCuotasPERIODICIDAD.AsInteger;
           Params.ByName['DIAS'].AsInteger := QMCuotasDIAS.AsInteger;
           ExecQuery;
           QMCuotasFECHA_PROX_CUOTA.AsDateTime := FieldByName['FECHA_SAL'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMClienteCuotas.MuestraDoc;
begin
  if ((QMCuotasRIG_DOC.AsInteger > 0) and (QMCuotasSERIE_ULT_CUOTA.AsString > '')) then
     if ((QMCuotasTIPO_DOC.AsString = 'ALB') or (QMCuotasTIPO_DOC.AsString = 'FAC')) then
        FMain.TraspasoDeDocumentosSalida(QMCuotasID_S.AsInteger)
     else
        FMain.MuestraCartera(REntorno.Ejercicio, REntorno.Canal, 'C', QMCuotasRIG_DOC.AsInteger);
end;

procedure TDMClienteCuotas.AntesDeEditar(DataSet: TDataSet);
begin
  Fecha_Fin_Cuota_Old := QMCuotasFECHA_FIN_CUOTA.AsDateTime;
end;

procedure TDMClienteCuotas.CompruebaCuotas;
var
  Datos : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT * FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND CLIENTE=?CLIENTE AND CUOTA=?CUOTA AND FECHA >= ?FECHA_FIN_C';
        Params.ByName['EMPRESA'].AsInteger := QMCuotasEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCuotasCanal.AsInteger;
        Params.ByName['CLIENTE'].AsInteger := QMCuotasCLIENTE.AsInteger;
        Params.ByName['CUOTA'].AsInteger := QMCuotasCUOTA.AsInteger;
        Params.ByName['FECHA_FIN_C'].AsDateTime := QMCuotasFECHA_FIN_CUOTA.AsDateTime;
        Params.ByName['CANAL'].AsInteger := QMCuotasCanal.AsInteger;
        ExecQuery;
        Datos := HayDatos;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Datos) then
  begin
     // Miramos si todos tienen ID_S = 0
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND CLIENTE=?CLIENTE AND CUOTA=?CUOTA AND FECHA >= ?FECHA_FIN_C AND ID_S<>0';
           Params.ByName['EMPRESA'].AsInteger := QMCuotasEMPRESA.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCuotasCanal.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCuotasCLIENTE.AsInteger;
           Params.ByName['CUOTA'].AsInteger := QMCuotasCUOTA.AsInteger;
           Params.ByName['FECHA_FIN_C'].AsDateTime := QMCuotasFECHA_FIN_CUOTA.AsDateTime;
           ExecQuery;
           Datos := HayDatos;
           FreeHandle;
        finally
           Free;
        end;
     end;
     if not (Datos) then
     begin
        if (Application.MessageBox(PChar(string(_('Existen cuotas generadas superiores a la fecha de finalización de cuotas.' + #13#10 +
           '¿Desea Borrarlas?'))),
           PChar(string(_('Confirmación'))), MB_OKCANCEL + MB_ICONINFORMATION) = idOk) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'DELETE FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC WHERE EMPRESA=?EMPRESA AND CANAL=?CANAL AND CLIENTE=?CLIENTE AND CUOTA=?CUOTA AND FECHA >=?FECHA_FIN_C AND ID_S=0';
                 Params.ByName['EMPRESA'].AsInteger := QMCuotasEMPRESA.AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMCuotasCanal.AsInteger;
                 Params.ByName['CLIENTE'].AsInteger := QMCuotasCLIENTE.AsInteger;
                 Params.ByName['CUOTA'].AsInteger := QMCuotasCUOTA.AsInteger;
                 Params.ByName['FECHA_FIN_C'].AsDateTime := QMCuotasFECHA_FIN_CUOTA.AsDateTime;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           {Este procedimiento no existe

           // Al borrar tenemos que updatear los nuevos valores de ultima cuota y proxima cuota
           with THYFIBQuery.Create(nil) do
              begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT * FROM G_DAME_NUEVAS_FECHAS_CUOTAS(?EMPRESA, ?CLIENTE, ?CUOTA, ?PERIODICIDAD, ?DIAS, ?FECHA_FIN_CUOTAS)';
                 Params.ByName['EMPRESA'].AsInteger := QMCuotasEMPRESA.AsInteger;
                 Params.ByName['CLIENTE'].AsInteger := QMCuotasCLIENTE.AsInteger;
                 Params.ByName['CUOTA'].AsInteger := QMCuotasCUOTA.AsInteger;
                 Params.ByName['PERIODICIDAD'].AsInteger := QMCuotasPERIODICIDAD.AsInteger;
                 Params.ByName['DIAS'].AsInteger := QMCuotasDias.AsInteger;
                 Params.ByName['FECHA_FIN_CUOTAS'].AsDateTime := QMCuotasFECHA_FIN_CUOTA.AsDateTime;
                 ExecQuery;
                 QMCuotasFECHA_ULT_CUOTA.AsDateTime := FieldByName['ULTIMACUOTA'].AsDateTime;
                 QMCuotasFECHA_PROX_CUOTA.AsDateTime := FieldByName['PROXIMACUOTA'].AsDateTime;
                 FreeHandle;
           finally
                 Free;
              end;
           end;
           }
        end
        else
           QMCuotasFECHA_FIN_CUOTA.AsDateTime := Fecha_Fin_Cuota_Old;
     end
     else
     begin
        ShowMessage(_('Existen cuotas facturadas con fechas superiores a la fecha de finalización de cuotas'));
        QMCuotasFECHA_FIN_CUOTA.AsDateTime := Fecha_Fin_Cuota_Old;
     end;
  end;
end;

procedure TDMClienteCuotas.QMCuotasAfterPost(DataSet: TDataSet);
var
  ClienteInsertado : integer;
begin
  // Al insertar, el trigger fuerza el nro. de cuota a MAX(CUOTA) + 1
  // Por lo tanto debo refrescar el DataSet e ir al último registro
  // Recreo el SelectSQL para asegurar que este ordenado por cliente-cuota

  if (QMCuotasCUOTA.AsInteger = 0) then
  begin
     ClienteInsertado := QMCuotasCLIENTE.AsInteger;
     with QMCuotas do
     begin
        DisableControls;
        try
           Close;
           SelectSQL.Text := SQLBase.Text;

           if (ClienteFiltrado <> 0) then
           begin
              SelectSQL.Clear;
              SelectSQL.Add(' SELECT * FROM VER_EMP_CLIENTES_CUOTAS ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = ?EMPRESA ');
              SelectSQL.Add(' AND CANAL = ?CANAL ');
              SelectSQL.Add(' AND CLIENTE = ?CLIENTE ');
              SelectSQL.Add(' ORDER BY CUOTA ');
           end;

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;

           if (ClienteFiltrado <> 0) then
              Params.ByName['CLIENTE'].AsInteger := ClienteFiltrado;

           Open;

           Last;
           while (ClienteInsertado <> QMCuotasCLIENTE.AsInteger) do
              Prior
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TDMClienteCuotas.CrearCuota(Cliente: integer; Importe: double; TipoOrigen: string; IdOrigen: integer);
begin
  FiltraCliente(Cliente);

  QMCuotas.Insert;
  QMCuotasID_ORIGEN.AsInteger := IdOrigen;
  QMCuotasTIPO_ORIGEN.AsString := TipoOrigen;
  QMCuotas.Post;

  QMCuotasDetalle.Insert;
  QMCuotasDetalleARTICULO.AsString := REntorno.ArtTextoLibre;
  QMCuotasDetalleIMPORTE.AsFloat := Importe;
  QMCuotasDetalle.Post;
end;

procedure TDMClienteCuotas.QMCuotasCLIENTEChange(Sender: TField);
begin
  QMCuotasTERCERO.AsInteger := DameTercero('CLI', QMCuotasCLIENTE.AsInteger);
end;

procedure TDMClienteCuotas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCuotas, '10100');
end;

procedure TDMClienteCuotas.ImprimirContrato(Modo: integer; MedianteClienteCorreo, MuestraCuerpo: boolean);
var
  CuerpoMail : TStrings;
  Archivo : string;
begin
  AbreData(TDMLstCuotasCliente, DMLstCuotasCliente);

  Archivo := _('Contrato') + '-' + QMCuotasCLIENTE.AsString + '-' + QMCuotasCUOTA.AsString + '.pdf';
  DMLstCuotasCliente.MuestraContrato(Modo, QMCuotasID_CUOTA.AsInteger, Archivo);
  CierraData(DMLstCuotasCliente);

  // Modo 2 es para enviar por email. Genera un PDF y lo deja en %TEMP%
  if (Modo = 2) then
  begin
     AbreData(TDMListados, DMListados);
     CuerpoMail := TStringList.Create;
     try
        CuerpoMail.Add('Este correo ha sido enviado desde:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('Y contiene el fichero adjunto ' + UpperCase(Archivo));
        CuerpoMail.Add('Correspondiente al documento: ' + _('Contrato de mantenimiento'));
        CuerpoMail.Add('------------------------------------------------------------');
        CuerpoMail.Add('This email has been sent from:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('And contains the attached file ' + UpperCase(Archivo));
        CuerpoMail.Add('Corresponding to the document: ' + _('Maintenance contract'));

        if MedianteClienteCorreo then
           DMListados.SendMailTerceroPDF2(QMCuotas.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Contrato de mantenimiento'), 'TER', QMCuotas.FieldByName('TERCERO').AsInteger, MuestraCuerpo)
        else
           DMListados.SendMailTerceroPDF(QMCuotas.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Contrato de mantenimiento'), 'TER', QMCuotas.FieldByName('TERCERO').AsInteger, MuestraCuerpo);
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end;
end;

procedure TDMClienteCuotas.QMCuotasBeforeClose(DataSet: TDataSet);
begin
  QMCuotasDetalle.Close;
end;

procedure TDMClienteCuotas.QMCuotasDetalleARTICULOChange(Sender: TField);
begin
  CambiaArticuloCuota(Sender.AsString);
end;

procedure TDMClienteCuotas.QMCuotasDetalleNewRecord(DataSet: TDataSet);
begin
  QMCuotasDetalleEMPRESA.AsInteger := QMCuotasEMPRESA.AsInteger;
  QMCuotasDetalleCANAL.AsInteger := QMCuotasCANAL.AsInteger;
  QMCuotasDetalleCLIENTE.AsInteger := QMCuotasCLIENTE.AsInteger;
  QMCuotasDetalleCUOTA.AsInteger := QMCuotasCUOTA.AsInteger;
  QMCuotasDetalleID_CUOTA.AsInteger := QMCuotasID_CUOTA.AsInteger;
  QMCuotasDetalleDESCRIPCION.AsString := '';
  QMCuotasDetalleUNIDADES.AsInteger := 0;
  QMCuotasDetalleIMPORTE.AsInteger := 0;
  QMCuotasDetalleDESCUENTO.AsInteger := 0;
  QMCuotasDetalleP_COSTE.AsFloat := 0;
  QMCuotasDetalleUNIDAD_FOMENTO.AsFloat := 0;
end;

end.
