unit UDMRMayoresCantidad;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  UHYReportMail, frxClass, frxHYReport;

type
  TDMRMayoresCantidad = class(TDataModule)
     QSPMayoresCantidad: TFIBDataSetRO;
     frMayoresCantidad: TfrHYReport;
     DSQSPMayoresCantidad: TDataSource;
     frDSQSPMayoresCantidad: TfrDBDataSet;
     TLocal: THYTransaction;
     QSPMayoresCantidadCIF: TFIBStringField;
     QSPMayoresCantidadCUENTA: TFIBStringField;
     QSPMayoresCantidadNOMBRE: TFIBStringField;
     QSPMayoresCantidadDOMICILIO: TFIBStringField;
     QSPMayoresCantidadCODIGO_POSTAL: TFIBStringField;
     QSPMayoresCantidadPAIS: TFIBStringField;
     QSPMayoresCantidadSIGNO: TFIBStringField;
     QSPMayoresCantidadIMPORTE: TFloatField;
     xTerceroD: TFIBDataSetRO;
     DSxTerceroD: TDataSource;
     xTerceroH: TFIBDataSetRO;
     DSxTerceroH: TDataSource;
     QMaxTercero: THYFIBQuery;
     QSPCarta347: TFIBDataSetRO;
     DSQSPCarta347: TDataSource;
     frDBDSQSPCarta347: TfrDBDataSet;
     QSPCarta347TERCERO: TIntegerField;
     QSPCarta347CIF: TFIBStringField;
     QSPCarta347NOMBRE: TFIBStringField;
     QSPCarta347DOMICILIO: TFIBStringField;
     QSPCarta347CODIGO_POSTAL: TFIBStringField;
     QSPCarta347IMPORTE: TFloatField;
     QSPCarta347SIGNO: TFIBStringField;
     QSPCarta347LOCALIDAD: TFIBStringField;
     HYReportMail: THYReportMail;
     HYMSCarta347: THYReportMailSource;
     xTerceroMail: TFIBDataSetRO;
     DSxTerceroMail: TDataSource;
     QSPCarta347FAX: TFIBStringField;
     xDatosModelosHacienda: TFIBDataSetRO;
     xDatosModelosHaciendaEMPRESA: TIntegerField;
     xDatosModelosHaciendaDELEGACION: TFIBStringField;
     xDatosModelosHaciendaADMINISTRACION: TFIBStringField;
     xDatosModelosHaciendaCOD_ADMINISTRACION: TIntegerField;
     xDatosModelosHaciendaDECLARANTE_NIF: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_NOMBRE: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_TIPO_CALLE: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_CALLE: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_NUMERO: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_ESCALERA: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_PISO: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_PUERTA: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_CODIGO_POSTAL: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_MUNICIPIO: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_PROVINCIA: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_TELEFONO: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_ENTIDAD: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_SUCURSAL: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_DC: TFIBStringField;
     xDatosModelosHaciendaDECLARANTE_CUENTA: TFIBStringField;
     xDatosModelosHaciendaM_110_EFECTIVO: TIntegerField;
     xDatosModelosHaciendaM_115_EFECTIVO: TIntegerField;
     xDatosModelosHaciendaM_300_EFECTIVO: TIntegerField;
     xDatosModelosHaciendaPRESENTADOR_NIF: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_NOMBRE: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_TIPO_CALLE: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_CALLE: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_NUMERO: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_ESCALERA: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_PISO: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_PUERTA: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_CODIGO_POSTAL: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_MUNICIPIO: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_PROVINCIA: TFIBStringField;
     xDatosModelosHaciendaPRESENTADOR_TELEFONO: TFIBStringField;
     frxMayoresCantidad: TfrxHYReport;
     TUpdate: THYTransaction;
     QSPMayoresCantidadIMPORTE_T1: TFloatField;
     QSPMayoresCantidadIMPORTE_T2: TFloatField;
     QSPMayoresCantidadIMPORTE_T3: TFloatField;
     QSPMayoresCantidadIMPORTE_T4: TFloatField;
     QSPCarta347IMPORTE_T1: TFloatField;
     QSPCarta347IMPORTE_T2: TFloatField;
     QSPCarta347IMPORTE_T3: TFloatField;
     QSPCarta347IMPORTE_T4: TFloatField;
     xCorreosElectronicos: TFIBDataSetRO;
     DSCorreosElectronicos: TDataSource;
     xCorreosElectronicosEMAIL: TFIBStringField;
     xCorreosElectronicosNOMBRE: TFIBStringField;
     xCorreosElectronicosEMAIL_OFC: TIntegerField;
     xCorreosElectronicosEMAIL_PEC: TIntegerField;
     xCorreosElectronicosEMAIL_ALB: TIntegerField;
     xCorreosElectronicosEMAIL_FAC: TIntegerField;
     xCorreosElectronicosEMAIL_OFP: TIntegerField;
     xCorreosElectronicosEMAIL_OCP: TIntegerField;
     xCorreosElectronicosEMAIL_PEP: TIntegerField;
     xCorreosElectronicosEMAIL_ALP: TIntegerField;
     xCorreosElectronicosEMAIL_FAP: TIntegerField;
     xCorreosElectronicosEMAIL_FCR: TIntegerField;
     xImportesDeclarar: TFIBTableSet;
     DSImportesDeclarar: TDataSource;
     xImportesDeclararEMPRESA: TIntegerField;
     xImportesDeclararEJERCICIO: TIntegerField;
     xImportesDeclararCANAL: TIntegerField;
     xImportesDeclararNIF: TFIBStringField;
     xImportesDeclararSIGNO: TFIBStringField;
     xImportesDeclararNOMBRE_R_SOCIAL: TFIBStringField;
     xImportesDeclararIMPORTE_T1: TFloatField;
     xImportesDeclararIMPORTE_T2: TFloatField;
     xImportesDeclararIMPORTE_T3: TFloatField;
     xImportesDeclararIMPORTE_T4: TFloatField;
     xImportesDeclararIMPORTE_TOTAL: TFloatField;
     xImportesDeclararIMPORTE_T1_PRESENTAR: TFloatField;
     xImportesDeclararIMPORTE_T2_PRESENTAR: TFloatField;
     xImportesDeclararIMPORTE_T3_PRESENTAR: TFloatField;
     xImportesDeclararIMPORTE_T4_PRESENTAR: TFloatField;
     xImportesDeclararIMPORTE_TOTAL_PRESENTAR: TFloatField;
     xImportesDeclararMODIFICADO: TIntegerField;
     xImportesDeclararTERCERO: TIntegerField;
     xImportesDeclararINVERSION_SUJETO_PASIVO: TIntegerField;
     xImportesDeclararCODIGO_POSTAL: TFIBStringField;
     xImportesDeclararDIR_COMPLETA_N: TFIBStringField;
     xImportesDeclararTELEFONO01: TFIBStringField;
     xImportesDeclararTELEFONO02: TFIBStringField;
     xImportesDeclararTELEFAX: TFIBStringField;
     xImportesDeclararEMAIL: TFIBStringField;
     xImportesDeclararLOCALIDAD: TFIBStringField;
     xFacturas347: TFIBDataSetRO;
     DSxFacturas347: TDataSource;
     frDBxFacturas347: TfrDBDataSet;
     xImportesDeclararCORREO_ENVIADO: TIntegerField;
     xImportesDeclararENTRADA_AGRUPACION: TIntegerField;
     QSPCarta347EMAIL: TFIBStringField;
     QSPCarta347CORREO_ENVIADO: TIntegerField;
     frDBxImportesDeclarar: TfrDBDataSet;
     procedure frMayoresCantidadEnterRect(Memo: TStringList; View: TfrView);
     procedure frMayoresCantidadGetValue(const ParName: string; var ParValue: variant);
     procedure frDSQSPMayoresCantidadFirst(Sender: TObject);
     procedure DMRMayoresCantidadCreate(Sender: TObject);
     procedure DMRMayoresCantidadDestroy(Sender: TObject);
     procedure HYReportMailEnterFields(Sender: THYReportMail; Field: THYField; var Source: string);
     procedure frxMayoresCantidadBeforePrint(Sender: TfrxReportComponent);
     procedure frxMayoresCantidadGetValue(const VarName: string; var Value: variant);
     procedure frxMayoresCantidadBeginDoc(Sender: TObject);
     procedure frMayoresCantidadBeginDoc;
     procedure xImportesDeclararBeforeEdit(DataSet: TDataSet);
     procedure xImportesDeclararNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     numven: integer;
     numcom: integer;
     valven: double;
     valcom: double;
     Mod347: boolean;
     Ejercicio: integer;
     Signo: string;
     Lugar: string;
     CancelarImpresionCarta, CancelarEnvioCorreo: boolean;
     SQLBase: TStrings;
  public
     { Public declarations }
     FechaListado, FechaDesde, FechaHasta: TDateTime;
     Cantidad: double;
     NombreFichero, RutaFichero: string;
     procedure CalculaInforme(TipoOrden: byte; aEjercicio, Orden, Filtro, Impreso: integer);
     procedure Filtra(TipoOrden: byte; aEjercicio, Orden, Filtro, Impreso: integer);
     procedure MostrarListado(Modo: byte; Tipo: integer);
     procedure CambiaTerceroD(Tercero: integer);
     procedure CambiaTerceroH(Tercero: integer);
     procedure CambiaTerceroMail(Tercero: integer);
     procedure MostrarCarta347(Modo: byte; FechaLst: TDateTime; LugarLst: string);
     procedure CancelarMostrarCarta347;
     procedure MostrarCorreo347(Modo: byte; FechaLst: TDateTime; LugarLst: string);
     procedure CancelarMostrarCorreo347;
     procedure MostrarListadoMail(const Tercero: integer; var Memo: TStrings; Modo: integer; FechaLst: TDateTime; LugarLst: string; var TipoDeListado: string; var Enviar: boolean);
     procedure Marcar(Marca: boolean);
  end;

var
  DMRMayoresCantidad : TDMRMayoresCantidad;
  SW : integer;

implementation

uses UDMMain, UEntorno, UFPregMayoresCantidad, UFormGest, UDMListados,
  UUtiles, DateUtils, UDameDato;

{$R *.DFM}

procedure TDMRMayoresCantidad.DMRMayoresCantidadCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  AsignaDisplayFormat(xImportesDeclarar, MascaraN, MascaraI, ShortDateFormat);

  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT C.*, D.DIR_COMPLETA_N, L.TITULO LOCALIDAD, T.TELEFONO01, T.TELEFONO02, T.TELEFAX, T.EMAIL ');
  SQLBase.Add(' FROM CON_MODELO_347 C ');
  SQLBase.Add(' LEFT JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
  SQLBase.Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO AND D.DIR_DEFECTO = 1 ');
  SQLBase.Add(' LEFT JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' C.EMPRESA = :EMPRESA AND ');
  SQLBase.Add(' C.EJERCICIO = :EJERCICIO AND ');
  SQLBase.Add(' C.CANAL = :CANAL ');

  with xImportesDeclarar do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;

     RefreshSQL.Text := SQLBase.Text;
     RefreshSQL.Add(' AND C.NIF=?NIF ');
     RefreshSQL.Add(' AND C.SIGNO=?SIGNO ');
     RefreshSQL.Add(' AND C.INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO ');
  end;

  // No hace falta abrir. El form fuerza recarga al abrirse
  // DMMain.FiltraTabla(xImportesDeclarar, '11100', True);
end;

procedure TDMRMayoresCantidad.DMRMayoresCantidadDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  SQLBase.Free;
end;

procedure TDMRMayoresCantidad.CalculaInforme(TipoOrden: byte; aEjercicio, Orden, Filtro, Impreso: integer);
begin
  Ejercicio := aEjercicio;

  Mod347 := (TipoOrden = 2); // Para el texto del listado

  // Normalizar fechas desde-hasta
  DMListados.Normalizar_Desde_Hasta(TDateTime(FechaDesde), TDateTime(FechaHasta));

  if (Mod347) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_MODELO_347 (:EMPRESA, :EJERCICIO, :CANAL)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Filtra(TipoOrden, Ejercicio, Orden, Filtro, Impreso);
end;

procedure TDMRMayoresCantidad.Filtra(TipoOrden: byte; aEjercicio, Orden, Filtro, Impreso: integer);
begin
  Ejercicio := aEjercicio;

  with QSPMayoresCantidad do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM C_MAYORES_CANTIDAD ( ');
     SelectSQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :CANTIDAD, ');
     SelectSQL.Add(' :FECHA_DESDE, :FECHA_HASTA, :TIPO_ORDEN) ');

     SelectSQL.Add(' WHERE (1 = 1) ');
     case Filtro of
        0: SelectSQL.Add(' AND SIGNO=''S'' ');
        1: SelectSQL.Add(' AND SIGNO=''R'' ');
        2: SelectSQL.Add(' AND ((SIGNO=''S'') OR (SIGNO=''R'')) ');
     end;

     case Orden of
        0: SelectSQL.Add(' ORDER BY CIF ');
        1: SelectSQL.Add(' ORDER BY NOMBRE ');
        2: SelectSQL.Add(' ORDER BY IMPORTE ');
        3: SelectSQL.Add(' ORDER BY CUENTA ');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CANTIDAD'].AsFloat := Cantidad;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Params.ByName['TIPO_ORDEN'].AsInteger := TipoOrden;

     Open;
  end;

  with xDatosModelosHacienda do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  with xImportesDeclarar do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;

     case Filtro of
        0: SelectSQL.Add(' AND C.SIGNO=''A'' ');
        1: SelectSQL.Add(' AND C.SIGNO=''B'' ');
        2: SelectSQL.Add(' AND ((C.SIGNO=''A'') OR (C.SIGNO=''B'')) ');
     end;

     case Impreso of
        0: SelectSQL.Add(' ');
        1: SelectSQL.Add(' AND C.CORREO_ENVIADO = 1 ');
        2: SelectSQL.Add(' AND C.CORREO_ENVIADO = 0 ');
     end;

     case Orden of
        0: SelectSQL.Add(' ORDER BY C.NIF ');
        1: SelectSQL.Add(' ORDER BY C.NOMBRE_R_SOCIAL ');
        2: SelectSQL.Add(' ORDER BY C.IMPORTE_TOTAL ');
        3: SelectSQL.Add(' ORDER BY C.NIF ');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;

     Open;
  end;
end;

procedure TDMRMayoresCantidad.MostrarListado(Modo: byte; Tipo: integer);
begin
  SW := 1;
  if Tipo = 2 then
  begin
     DMListados.Imprimir(100, 0, Modo, '', _('Modelo 347 de Hacienda'), frMayoresCantidad, frxMayoresCantidad, nil);
  end
  else
     DMListados.Imprimir(18, 0, Modo, '', _('Modelo 347 de Hacienda'), frMayoresCantidad, frxMayoresCantidad, nil);
end;

procedure TDMRMayoresCantidad.frMayoresCantidadEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMRMayoresCantidad.frMayoresCantidadGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Fecha_Listado') then
     ParValue := FechaListado;

  if ParName = 'TXTDESC' then
     if Mod347 then
        ParValue := Format(_('Modelo 347  Ejercicio %d'), [Ejercicio])
     else
        ParValue := Format(_('Listado Desde %s Hasta %s'), [DateToStr(FechaDesde), DateToStr(FechaHasta)]);

  if ParName = 'Clave' then
  begin
     Signo := QSPMayoresCantidadSIGNO.AsString;
     if Signo = 'R' then
     begin
        ParValue := 'B';
        numven := numven + 1;
        valven := valven + QSPMayoresCantidadIMPORTE.Value;
     end
     else
     begin
        ParValue := 'A';
        numcom := numcom + 1;
        valcom := valcom + QSPMayoresCantidadIMPORTE.Value;
     end;
  end;
  if ParName = 'PerCompras' then
     ParValue := numcom;
  if ParName = 'PerVentas' then
     ParValue := numven;
  if ParName = 'ImpCompras' then
     ParValue := valcom;
  if ParName = 'ImpVentas' then
     ParValue := valven;

  // Carta 347
  if ParName = 'Fecha_Letra' then
     ParValue :=
        FormatDateTime(_('dd "de" mmmm "de" yyyy'), FechaListado);
  if ParName = 'Ejercicio' then
     ParValue := Ejercicio;
  if ParName = 'Lugar' then
     ParValue := Lugar;
  if ParName = 'TTercero' then
  begin
     if (QSPCarta347.FieldByName('SIGNO').AsString = 'B') then
        ParValue := _('Cliente')
     else
        ParValue := _('Proveedor/Acreedor');
  end;
end;

procedure TDMRMayoresCantidad.frDSQSPMayoresCantidadFirst(Sender: TObject);
begin
  numcom := 0;
  numven := 0;
  valcom := 0;
  valven := 0;
end;

procedure TDMRMayoresCantidad.CambiaTerceroD(Tercero: integer);
begin
  with xTerceroD do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;
end;

procedure TDMRMayoresCantidad.CambiaTerceroH(Tercero: integer);
begin
  with xTerceroH do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;
end;

procedure TDMRMayoresCantidad.CambiaTerceroMail(Tercero: integer);
begin
  with xTerceroMail do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;

  with xCorreosElectronicos do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;
end;

procedure TDMRMayoresCantidad.MostrarCarta347(Modo: byte; FechaLst: TDateTime; LugarLst: string);
var
  NIF, Signo, Titulo : string;
begin
  FechaListado := FechaLst;
  Lugar := LugarLst;
  CancelarImpresionCarta := False;

  with xImportesDeclarar do
  begin
     try
        frMayoresCantidad.ShowPrintDialog := False;
        frMayoresCantidad.ShowProgress := False;
        frxMayoresCantidad.ShowProgress := False;

        // DisableControls;
        NIF := xImportesDeclararNIF.AsString;
        Signo := xImportesDeclararSIGNO.AsString;
        First;
        while not EOF and (not CancelarImpresionCarta) do
        begin
           if (xImportesDeclararENTRADA_AGRUPACION.AsInteger = REntorno.Entrada) and (xImportesDeclararCORREO_ENVIADO.AsInteger = 0) then
           begin
              with QSPCarta347 do
              begin
                 Close;
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['TIPO'].AsInteger := 0; // Solo entrega datos del tercero pedido
                 Params.ByName['TERCEROINI'].AsInteger := xImportesDeclararTERCERO.AsInteger;
                 Params.ByName['TERCEROFIN'].AsInteger := xImportesDeclararTERCERO.AsInteger;
                 Open;
              end;

              // Detalle de facturas que entran en la declaracion
              xFacturas347.Close;
              xFacturas347.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              xFacturas347.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              xFacturas347.Params.ByName['D_FECHA'].AsDateTime := EncodeDateTime(Ejercicio, 1, 1, 0, 0, 0, 0);
              xFacturas347.Params.ByName['H_FECHA'].AsDateTime := EncodeDateTime(Ejercicio, 12, 31, 23, 59, 59, 999);
              xFacturas347.Open;

              Titulo := format('CartaMOD347-%d-%s', [Ejercicio, QSPCarta347CIF.AsString]);
              DMListados.Imprimir(134, 0, Modo, '', Titulo, frMayoresCantidad, frxMayoresCantidad, nil, HYReportMail, Titulo + '.pdf');

              // Marco carta como enviada
              xImportesDeclarar.Edit;
              xImportesDeclararCORREO_ENVIADO.AsInteger := 1;
              xImportesDeclarar.Post;
           end;

           Next;

           Application.ProcessMessages;
        end;

        First;
        while not EOF and (NIF <> xImportesDeclararNIF.AsString) or (Signo <> xImportesDeclararSIGNO.AsString) do
           Next;
     finally
        // EnableControls;

        frMayoresCantidad.ShowPrintDialog := True;
        frMayoresCantidad.ShowProgress := True;
        frxMayoresCantidad.ShowProgress := True;
     end;
  end;
end;

procedure TDMRMayoresCantidad.MostrarCorreo347(Modo: byte; FechaLst: TDateTime; LugarLst: string);
var
  NIF, Signo, Titulo, s : string;
  TipoDeListado, Asunto : string;
  BodyMail : TStrings;
begin
  FechaListado := FechaLst;
  Lugar := LugarLst;
  CancelarEnvioCorreo := False;

  with xImportesDeclarar do
  begin
     try
        BodyMail := TStringList.Create;
        frMayoresCantidad.ShowPrintDialog := False;
        frMayoresCantidad.ShowProgress := False;
        frxMayoresCantidad.ShowProgress := False;

        // DisableControls;
        NIF := xImportesDeclararNIF.AsString;
        Signo := xImportesDeclararSIGNO.AsString;
        First;
        while not EOF and (not CancelarEnvioCorreo) do
        begin
           if (xImportesDeclararENTRADA_AGRUPACION.AsInteger = REntorno.Entrada) and (xImportesDeclararCORREO_ENVIADO.AsInteger = 0) and (Trim(xImportesDeclararEMAIL.AsString) > '') then
           begin
              with QSPCarta347 do
              begin
                 Close;
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['TIPO'].AsInteger := 0; // Solo entrega datos del tercero pedido
                 Params.ByName['TERCEROINI'].AsInteger := xImportesDeclararTERCERO.AsInteger;
                 Params.ByName['TERCEROFIN'].AsInteger := xImportesDeclararTERCERO.AsInteger;
                 Open;
              end;

              // Detalle de facturas que entran en la declaracion
              xFacturas347.Close;
              xFacturas347.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              xFacturas347.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              xFacturas347.Params.ByName['D_FECHA'].AsDateTime := EncodeDateTime(Ejercicio, 1, 1, 0, 0, 0, 0);
              xFacturas347.Params.ByName['H_FECHA'].AsDateTime := EncodeDateTime(Ejercicio, 12, 31, 23, 59, 59, 999);
              xFacturas347.Open;

              Titulo := format('CartaMOD347-%d-%s', [Ejercicio, QSPCarta347CIF.AsString]);
              NombreFichero := format(_('CifraAnual347_%s.pdf'), [REntorno.NombreEmpresa]);
              RutaFichero := '';

              // FRF, FR3 enviados como PDF adjunto
              InicializaVariableEmail('347');
              with VariableEmail do
              begin
                 Ejercicio := Ejercicio;
                 Serie := '';
                 NumeroDocumento := 0;
                 Fecha := Today;
                 SuReferencia := '';
                 SuPedido := '';
                 Folio := '';
                 TituloDocTributario := '';
                 NombreFichero := NombreFichero;
                 Matricula := '';
                 NombreComercial := '';
                 RazonSocial := '';
                 OrdenTrabajo := 0;
                 UsuarioCreadorDocumento := DameTituloUsuario(DameUsuarioSegunEntrada(REntorno.Entrada));
              end;
              // Asunto := _('Cifra Anual para el Modelo 347 de Hacienda') + ' ' + _('de') + ' ' + REntorno.NombreEmpresa;
              DamePartesEmail(Asunto, BodyMail);


              DMListados.CargarMail(134, '');

              TipoDeListado := REntorno.TipoListado;

              if (TipoDeListado = 'FRF') then
              begin
                 frMayoresCantidad.LoadFromFIB(REntorno.Formato, s);
                 frMayoresCantidad.PrepareReport;
                 RutaFichero := ExportarPDF(frMayoresCantidad, NombreFichero);
              end
              else if (TipoDeListado = 'FR3') then
              begin
                 frxMayoresCantidad.LoadFromFIB(REntorno.Formato, s);
                 frxMayoresCantidad.PrepareReport;
                 RutaFichero := ExportarPDF(frxMayoresCantidad, NombreFichero);
              end
              else if (TipoDeListado = 'HYM') then
              begin
                 HYReportMail.LoadFromFIB(REntorno.Formato, s);
                 HYReportMail.Prepare;
                 HYReportMail.PrintinMemo(BodyMail);
              end
              else
              begin
                 MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 +
                    'El listado debe ser de los tipos FRF o FR3.'), mtWarning, [mbOK], 0);
                 raise Exception.Create('');
              end;
              DMListados.LimpiaEntorno;

              try
                 if (TipoDeListado <> 'HYM') then
                 begin
                    if (Modo = 0) then
                       DMListados.SendMailPDF(Trim(xImportesDeclararEMAIL.AsString), BodyMail, DMRMayoresCantidad.RutaFichero, DMRMayoresCantidad.NombreFichero, Asunto)
                    else
                       DMListados.SendMailPDF2(Trim(xImportesDeclararEMAIL.AsString), BodyMail, DMRMayoresCantidad.RutaFichero, DMRMayoresCantidad.NombreFichero, Asunto);
                 end
                 else
                 if (TipoDeListado = 'HYM') then
                 begin
                    if (Modo = 0) then
                       DMListados.SendMailPDF(Trim(xImportesDeclararEMAIL.AsString), BodyMail, '', '', Asunto)
                    else
                       DMListados.SendMailPDF2(Trim(xImportesDeclararEMAIL.AsString), BodyMail, '', '', Asunto);
                 end;

                 // Marco carta como enviada
                 xImportesDeclarar.Edit;
                 xImportesDeclararCORREO_ENVIADO.AsInteger := 1;
                 xImportesDeclarar.Post;
              except
                 on E: Exception do
                    CancelarEnvioCorreo := (MessageDlg(_('Error al enviar correo') + #13#10 + E.Message + #13#10 + '¿Desea continuar?', mtWarning, [mbYes, mbNo], 0) = mrNo);
              end;
           end;

           Next;

           Application.ProcessMessages;
        end;

        First;
        while not EOF and (NIF <> xImportesDeclararNIF.AsString) or (Signo <> xImportesDeclararSIGNO.AsString) do
           Next;
     finally
        // EnableControls;

        BodyMail.Free;
        frMayoresCantidad.ShowPrintDialog := True;
        frMayoresCantidad.ShowProgress := True;
        frxMayoresCantidad.ShowProgress := True;
     end;
  end;
end;

procedure TDMRMayoresCantidad.CancelarMostrarCarta347;
begin
  CancelarImpresionCarta := True;
end;

procedure TDMRMayoresCantidad.CancelarMostrarCorreo347;
begin
  CancelarEnvioCorreo := True;
end;

procedure TDMRMayoresCantidad.MostrarListadoMail(const Tercero: integer; var Memo: TStrings; Modo: integer; FechaLst: TDateTime; LugarLst: string; var TipoDeListado: string; var Enviar: boolean);
var
  str : string;
begin
  FechaListado := FechaLst;
  Lugar := LugarLst;

  with QSPCarta347 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsInteger := 0;             // 0: Por Terceros - 1: Todos
     Params.ByName['TERCEROINI'].AsInteger := Tercero; // Para un tercero
     Params.ByName['TERCEROFIN'].AsInteger := Tercero;
     Open;
     if (RecordCount <> 0) then
     begin
        // Detalle de facturas que entran en la declaracion
        xFacturas347.Close;
        xFacturas347.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        xFacturas347.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        xFacturas347.Params.ByName['TERCERO'].AsInteger := Tercero;
        xFacturas347.Params.ByName['D_FECHA'].AsDateTime := EncodeDateTime(Ejercicio, 1, 1, 0, 0, 0, 0);
        xFacturas347.Params.ByName['H_FECHA'].AsDateTime := EncodeDateTime(Ejercicio, 12, 31, 23, 59, 59, 999);
        xFacturas347.Open;

        Enviar := True;
        NombreFichero := format(_('CifraAnual347_%s.pdf'), [LimpiaCadenaBasica(REntorno.NombreEmpresa)]);
        DMListados.CargarMail(134, '');

        TipoDeListado := REntorno.TipoListado;

        if (TipoDeListado = 'FRF') then
        begin
           frMayoresCantidad.LoadFromFIB(REntorno.Formato, str);
           frMayoresCantidad.PrepareReport;
           RutaFichero := ExportarPDF(frMayoresCantidad, NombreFichero);
        end
        else if (TipoDeListado = 'FR3') then
        begin
           frxMayoresCantidad.LoadFromFIB(REntorno.Formato, Str);
           frxMayoresCantidad.PrepareReport;
           RutaFichero := ExportarPDF(frxMayoresCantidad, NombreFichero);
        end
        else if (TipoDeListado = 'HYM') then
        begin
           HYReportMail.LoadFromFIB(REntorno.Formato, str);
           HYReportMail.Prepare;
           case Modo of
              0: HYReportMail.Preview;
              1: HYReportMail.PrintinMemo(Memo);
           end;
        end
        else
        begin
           MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 +
              'El listado debe ser de los tipos FRF o FR3.'), mtWarning, [mbOK], 0);
           raise Exception.Create('');
        end;
        DMListados.LimpiaEntorno;
     end
     else
        Enviar := False;
  end;
end;

procedure TDMRMayoresCantidad.HYReportMailEnterFields(Sender: THYReportMail; Field: THYField; var Source: string);
begin
  DMListados.EnterFields(Source);

  // Carta 347
  if Source = '[LUGAR_Y_FECHA_LISTADO]' then
     Source := Format(_('%s, a %s'), [Lugar, FormatDateTime('dd "de" mmmm "de" yyyy', FechaListado)]); // Ejemplo: Barcelona a 1 de enero de 2011
  if Source = '[TTERCERO]' then
  begin
     if (QSPCarta347.FieldByName('SIGNO').AsString = 'B') then
        Source := _('Cliente')
     else
        Source := _('Proveedor/Acreedor');
  end;
  if Source = '[EJERCICIO]' then
     Source := IntToStr(Ejercicio);
  if Source = '[IMPORTE]' then
     Source := FormatFloat('#,0.00', QSPCarta347.FieldByName('IMPORTE').AsFloat);
  if Source = '[IMPORTE_T1]' then
     Source := FormatFloat('#,0.00', QSPCarta347.FieldByName('IMPORTE_T1').AsFloat);
  if Source = '[IMPORTE_T2]' then
     Source := FormatFloat('#,0.00', QSPCarta347.FieldByName('IMPORTE_T2').AsFloat);
  if Source = '[IMPORTE_T3]' then
     Source := FormatFloat('#,0.00', QSPCarta347.FieldByName('IMPORTE_T3').AsFloat);
  if Source = '[IMPORTE_T4]' then
     Source := FormatFloat('#,0.00', QSPCarta347.FieldByName('IMPORTE_T4').AsFloat);
end;

procedure TDMRMayoresCantidad.frxMayoresCantidadBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMRMayoresCantidad.frxMayoresCantidadGetValue(const VarName: string; var Value: variant);
begin
  //if (frxMayoresCantidad.Engine.FinalPass) then // Prueba
  frMayoresCantidadGetValue(VarName, Value);
end;

procedure TDMRMayoresCantidad.frxMayoresCantidadBeginDoc(Sender: TObject);
begin
  frMayoresCantidadBeginDoc;
end;

procedure TDMRMayoresCantidad.frMayoresCantidadBeginDoc;
begin
  numcom := 0;
  numven := 0;
  valcom := 0;
  valven := 0;
end;

procedure TDMRMayoresCantidad.xImportesDeclararBeforeEdit(DataSet: TDataSet);
begin
  xImportesDeclararMODIFICADO.AsInteger := 0;
end;

procedure TDMRMayoresCantidad.xImportesDeclararNewRecord(DataSet: TDataSet);
begin
  xImportesDeclararEMPRESA.AsInteger := REntorno.Empresa;
  xImportesDeclararEJERCICIO.AsInteger := Ejercicio;
  xImportesDeclararCANAL.AsInteger := REntorno.Canal;
end;

procedure TDMRMayoresCantidad.Marcar(Marca: boolean);
var
  NIF, Signo : string;
begin
  with xImportesDeclarar do
  begin
     try
        DisableControls;
        NIF := xImportesDeclararNIF.AsString;
        Signo := xImportesDeclararSIGNO.AsString;
        First;
        while not EOF do
        begin
           if (Marca) then
           begin
              if (xImportesDeclararENTRADA_AGRUPACION.AsInteger <> REntorno.Entrada) then
              begin
                 Edit;
                 xImportesDeclararENTRADA_AGRUPACION.AsInteger := REntorno.Entrada;
                 Post;
              end;
           end
           else
           begin
              if (xImportesDeclararENTRADA_AGRUPACION.AsInteger <> 0) then
              begin
                 Edit;
                 xImportesDeclararENTRADA_AGRUPACION.AsInteger := 0;
                 Post;
              end;
           end;

           Next;
        end;

        First;
        while not EOF and (NIF <> xImportesDeclararNIF.AsString) or (Signo <> xImportesDeclararSIGNO.AsString) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

end.
