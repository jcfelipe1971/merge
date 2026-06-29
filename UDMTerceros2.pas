unit UDMTerceros2;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, FIBTableDataSet, FIBDataSet, FIBQuery, FIBSQLMonitor,
  FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery, jpeg, GIFImage;

type
  TDMTerceros2 = class(TDataModule)
     DSQMTerceros: TDataSource;
     DSxLoc_T: TDataSource;
     DSQMContactos: TDataSource;
     QMContactos: TFIBTableSet;
     QMTerceros: TFIBTableSet;
     xLoc_T: TFIBDataSetRO;
     QMBancos: TFIBTableSet;
     DSQMBancos: TDataSource;
     xBancos: TFIBDataSetRO;
     DSxBancos: TDataSource;
     QMBancosTERCERO: TIntegerField;
     QMBancosBANCO: TIntegerField;
     QMBancosTITULO: TFIBStringField;
     QMBancosENTIDAD: TFIBStringField;
     QMBancosSUCURSAL: TFIBStringField;
     QMBancosCONTROL: TFIBStringField;
     QMBancosACTIVA: TIntegerField;
     QMBancosMODO: TIntegerField;
     QMBancosORDEN: TIntegerField;
     QMBancosNOTAS: TBlobField;
     xRazones: TFIBDataSetRO;
     DSxRazones: TDataSource;
     xTipDir_T: TFIBDataSetRO;
     DSxTipDir_T: TDataSource;
     QMDirecciones: TFIBTableSet;
     DSQMDirecciones: TDataSource;
     QMDireccionesDIRECCION: TIntegerField;
     QMDireccionesDIR_NOMBRE: TFIBStringField;
     QMDireccionesDIR_BLOQUE_ESCALERA: TFIBStringField;
     QMDireccionesDIR_PISO: TFIBStringField;
     xLoc_D: TFIBDataSetRO;
     DSxLoc_D: TDataSource;
     QMDireccionesTERCERO: TIntegerField;
     QMDireccionesDIR_LOCALIDAD: TFIBStringField;
     QMDireccionesDIR_TIPO: TFIBStringField;
     xTipDir_D: TFIBDataSetRO;
     DSxTipDir_D: TDataSource;
     QMDireccionesDIR_PUERTA: TFIBStringField;
     TLocal: THYTransaction;
     QMDireccionesDIR_NOMBRE_2: TFIBStringField;
     xRazonesRAZON: TFIBStringField;
     xRazonesTITULO: TFIBStringField;
     QMDireccionesDIR_NUMERO: TFIBStringField;
     QMDireccionesDIR_COMPLETA: TFIBStringField;
     QMDireccionesDIR_COMPLETA_N: TFIBStringField;
     QMContactosTERCERO: TIntegerField;
     QMContactosCONTACTO: TIntegerField;
     QMContactosNOMBRE: TFIBStringField;
     QMContactosAPELLIDOS: TFIBStringField;
     QMContactosMOVIL: TFIBStringField;
     QMContactosTELEFONO: TFIBStringField;
     QMContactosFAX: TFIBStringField;
     QMContactosEXTENSION: TFIBStringField;
     QMContactosCORREO: TFIBStringField;
     QMContactosNOTAS: TBlobField;
     QMTercerosTERCERO: TIntegerField;
     QMTercerosNOMBRE_COMERCIAL: TFIBStringField;
     QMTercerosNOMBRE_R_SOCIAL: TFIBStringField;
     QMTercerosTIPO_RAZON: TFIBStringField;
     QMTercerosNIF: TFIBStringField;
     QMTercerosDIR_TIPO: TFIBStringField;
     QMTercerosDIR_NOMBRE: TFIBStringField;
     QMTercerosDIR_NOMBRE_2: TFIBStringField;
     QMTercerosDIR_NUMERO: TFIBStringField;
     QMTercerosDIR_BLOQUE_ESCALERA: TFIBStringField;
     QMTercerosDIR_PISO: TFIBStringField;
     QMTercerosDIR_PUERTA: TFIBStringField;
     QMTercerosDIR_LOCALIDAD: TFIBStringField;
     QMTercerosFECHA_ALTA: TDateTimeField;
     QMTercerosNOTAS: TBlobField;
     QMTercerosTELEFONO01: TFIBStringField;
     QMTercerosTELEFONO02: TFIBStringField;
     QMTercerosTELEFAX: TFIBStringField;
     QMTercerosEMAIL: TFIBStringField;
     QMTercerosWEB: TFIBStringField;
     QMDireccionesDIR_CLASE: TIntegerField;
     QMDireccionesDIR_TELEFONO01: TFIBStringField;
     QMDireccionesDIR_TELEFONO02: TFIBStringField;
     QMDireccionesDIR_TELEFAX: TFIBStringField;
     QMTercerosIMAGEN: TIntegerField;
     QMTercerosCLIENTE_POTENCIAL: TIntegerField;
     QMDireccionesNOTAS: TBlobField;
     QMTercerosCODIGO_EDI: TFIBStringField;
     QMDireccionesCODIGO_EDI: TFIBStringField;
     QMTercerosDIR_DEFECTO: TIntegerField;
     QMDireccionesDIR_DEFECTO: TIntegerField;
     QMTercerosDIR_CLASE: TIntegerField;
     QMTercerosTIT_LOCALIDAD: TFIBStringField;
     QMTercerosCODIGO_POSTAL: TFIBStringField;
     QMTercerosID_LOCAL: TIntegerField;
     QMDireccionesID_LOCAL: TIntegerField;
     xEmails: TFIBDataSetRO;
     DSxEmails: TDataSource;
     xEmailsEMPRESA: TIntegerField;
     xEmailsRIG: TIntegerField;
     xEmailsUSUARIO: TIntegerField;
     xEmailsTERCERO: TIntegerField;
     xEmailsFECHA: TDateTimeField;
     xEmailsLINEA: TIntegerField;
     QMContactosAGENTE: TIntegerField;
     QMContactosZONA: TFIBStringField;
     QMBancosCUENTA: TFIBStringField;
     QMBancosIBAN: TFIBStringField;
     QMBancosBIC: TFIBStringField;
     TUpdate: THYTransaction;
     QMContactosDIRECCION: TIntegerField;
     QMContactosPADRE: TIntegerField;
     QMContactosDEPARTAMENTO: TFIBStringField;
     QMDireccionesULT_MODIFICACION: TDateTimeField;
     QMDireccionesDIR_TRANSPORTISTA: TIntegerField;
     QMTercerosCOLONIA: TFIBStringField;
     QMDireccionesCOLONIA: TFIBStringField;
     QMDireccionesDIR_NOMBRE_3: TFIBStringField;
     QMBancosTIPO_ADEUDO_SEPA: TFIBStringField;
     QMBancosFIRMA: TFIBStringField;
     QMBancosFECHA_FIRMA: TDateTimeField;
     QMBancosTIPO_CONTRATO_SEPA: TFIBStringField;
     QMTercerosFECHA_NACIMIENTO: TDateTimeField;
     QMDireccionesACTIVO: TIntegerField;
     QMContactosULT_MODIFICACION: TDateTimeField;
     QMContactosID_FORCEMANAGER: TIntegerField;
     QMDireccionesID_FORCEMANAGER: TIntegerField;
     QMContactosEMAIL_OFC: TIntegerField;
     QMContactosEMAIL_PEC: TIntegerField;
     QMContactosEMAIL_ALB: TIntegerField;
     QMContactosEMAIL_FAC: TIntegerField;
     QMContactosEMAIL_FCR: TIntegerField;
     QMContactosEMAIL_PEP: TIntegerField;
     QMContactosEMAIL_ALP: TIntegerField;
     QMContactosEMAIL_FAP: TIntegerField;
     QMContactosEMAIL_OCP: TIntegerField;
     QMContactosEMAIL_OFP: TIntegerField;
     QMTercerosREGISTRO_MERCANTIL: TFIBStringField;
     QMTercerosCARNET_APLICADOR: TFIBStringField;
     QMTercerosFECHA_VALIDEZ_CARNET_APLICADOR: TDateTimeField;
     QMDireccionesBANCO: TIntegerField;
     QMContactosENTRADA: TIntegerField;
     QMTercerosPAIS_TERCERO: TFIBStringField;
     QMTercerosTIPO_DOC_IDENT: TFIBStringField;
     QMDireccionesCODIGO_POSTAL: TFIBStringField;
     QMDireccionesLATITUD: TFloatField;
     QMDireccionesLONGITUD: TFloatField;
     QMDireccionesID_CODIGO_POSTAL: TIntegerField;
     QMDireccionesPAIS_DIRECCION: TFIBStringField;
     QMDireccionesPROVINCIA: TFIBStringField;
     QMDireccionesPOBLACION: TFIBStringField;
     QMDireccionesREGION: TFIBStringField;
     QMDireccionesDIRECCION_LITERAL: TBlobField;
     QMDireccionesTITULO_POBLACION: TFIBStringField;
     QMDireccionesTITULO_PROVINCIA: TFIBStringField;
     QMDireccionesTITULO_PAIS: TFIBStringField;
     QMDireccionesTITULO_COD_POSTAL: TFIBStringField;
     QMContactosID_USUARIO_WEB: TIntegerField;
     QMDireccionesHORARIO: TFIBStringField;
     QMDireccionesMEDIOS: TFIBStringField;
     QMDireccionesDIR_CORREO: TFIBStringField;
     QMDireccionesDIR_CONTACTO: TFIBStringField;
     QMTercerosDIRECCION_LITERAL: TMemoField;
     QMTercerosPAIS_DIRECCION: TFIBStringField;
     QMDireccionesTIT_LOCALIDAD: TFIBStringField;
     QMDireccionesTIT_PROVINCIA_LOC: TFIBStringField;
     QMTercerosTITULO_PROVINCIA_LOC: TFIBStringField;
     QMTercerosDIR_NOMBRE_3: TFIBStringField;
     QMTercerosLATITUD: TFloatField;
     QMTercerosLONGITUD: TFloatField;
     QMTercerosPROVINCIA_DIRECCION: TFIBStringField;
     QMTercerosREGION_DIRECCION: TFIBStringField;
     QMTercerosPOBLACION_DIRECCION: TFIBStringField;
     QMTercerosDIRECCION: TIntegerField;
     QMTercerosDIR_TRANSPORTISTA: TIntegerField;
     QMTercerosDIRECCION_CODIGO_POSTAL: TFIBStringField;
     QMTercerosTITULO_REGION: TFIBStringField;
     QMTercerosTITULO_PROVINCIA: TFIBStringField;
     QMTercerosTITULO_POBLACION: TFIBStringField;
     QMTercerosTITULO_CODIGO_POSTAL: TFIBStringField;
     QMBancosTIPO_CUENTA: TIntegerField;
     QMBancosPAIS: TFIBStringField;
     QMTercerosCOMO_NOS_CONOCIERON: TIntegerField;
     QMComoNosConocieron: TFIBDataSetRO;
     DSQMComoNosConocieron: TDataSource;
     QMComoNosConocieronMODO: TIntegerField;
     QMComoNosConocieronTITULO: TFIBStringField;
     xValidacionDoc: TFIBDataSetRO;
     xValidacionDocRESULTADO: TFIBStringField;
     xValidacionDocRESULTADO_NOMBRE: TFIBStringField;
     xValidacionDocFECHA_COMPROBACION: TDateTimeField;
     DSxValidacionDoc: TDataSource;
     procedure DMTercerosCreate(Sender: TObject);
     procedure QMTercerosNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMContactosNewRecord(DataSet: TDataSet);
     procedure QMTercerosBeforePost(DataSet: TDataSet);
     procedure QMContactosBeforePost(DataSet: TDataSet);
     procedure QMBancosNewRecord(DataSet: TDataSet);
     procedure QMBancosBeforePost(DataSet: TDataSet);
     procedure QMDireccionesNewRecord(DataSet: TDataSet);
     procedure QMDireccionesDIR_LOCALIDADChange(Sender: TField);
     procedure QMDireccionesBeforePost(DataSet: TDataSet);
     procedure QMBancosENTIDADChange(Sender: TField);
     procedure QMTercerosDIR_LOCALIDADChange(Sender: TField);
     procedure QMTercerosDIR_TIPOChange(Sender: TField);
     procedure QMDireccionesDIR_TIPOChange(Sender: TField);
     procedure QMTercerosAfterOpen(DataSet: TDataSet);
     procedure QMTercerosNOMBRE_COMERCIALChange(Sender: TField);
     procedure QMTercerosTIPO_RAZONChange(Sender: TField);
     procedure DMTercerosDestroy(Sender: TObject);
     procedure QMTercerosBeforeEdit(DataSet: TDataSet);
     procedure QMDireccionesBeforeDelete(DataSet: TDataSet);
     procedure QMDireccionesAfterOpen(DataSet: TDataSet);
     procedure QMTercerosAfterScroll(DataSet: TDataSet);
     procedure QMContactosAfterScroll(DataSet: TDataSet);
     procedure QMContactosAfterOpen(DataSet: TDataSet);
     procedure QMDireccionesBeforeClose(DataSet: TDataSet);
     procedure QMBancosAfterOpen(DataSet: TDataSet);
     procedure QMBancosBeforeClose(DataSet: TDataSet);
     procedure QMDireccionesAfterPost(DataSet: TDataSet);
     procedure QMTercerosBeforeClose(DataSet: TDataSet);
     procedure QMTercerosPAIS_TERCEROChange(Sender: TField);
  private
     { Private declarations }
     nombreold: string;
     nifold: string;
     function CodigosAuxiliares(Modo: smallint): integer;
     procedure RefrescaNombreCuentas;
     procedure RefrescaContactoCRM;
     procedure CheckDuplicateNif;
  public
     { Public declarations }
     SQLBase: TStrings;
     procedure BusquedaCompleja;
     procedure QueEs(Tercero: integer; var Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm: boolean);
     // Abrir Tablas por Pestañas
     procedure AbrirFicha;
     procedure AbrirDirecciones;
     procedure AbrirContactos;
     procedure AbrirCuentas;
     procedure AbrirEMail;
     // Cerrar Tablas por Pestañas
     procedure CerrarFicha;
     procedure CerrarDirecciones;
     procedure CerrarContactos;
     procedure CerrarCuentas;
     procedure CerrarEMail;
     procedure InsertarTercero;
     procedure FiltraTercero(Filtro: string);
     // Establece la direccion por defecto para el tercero
     procedure DireccionDefecto;
     // Restablece la direccion por defecto para el tercero
     procedure ResDireccionDefecto;
     function HayDireccion: boolean;
     procedure ActualizaDirecciones;
     procedure VerificaNifKri;
     procedure PosicionaContacto(Contacto: integer);
     procedure GenerarFirma;
     procedure CreaTerceros;
     procedure RenombraTerceros;
     procedure ReemplazaCarateres;
     procedure ImprimirCartaSEPA(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
     procedure ImprimirCartaSpeedLock(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
     procedure ImprimirCartaLOPD(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
     procedure CalculaIBAN;
     function VerificaExisteEnTercero(Tercero: integer; Tipo: string): boolean;
     procedure TransportistaSegunCP(CP: string);
     procedure CreaUsuarioWeb(Tercero, Contacto, Direccion: integer; Nombre, email: string);
     procedure QuitaFiltros;
     procedure FiltraUnTercero(Tercero: integer);
  end;

var
  DMTerceros2 : TDMTerceros2;
  UnaVez : byte = 0;

implementation

uses UDMMain, UUtiles, UDameDato, uFBusca, UEntorno, UFMTerceros2, DateUtils, UDMLstTerceros, UFormGest, UDMListados, UParam;

{$R *.DFM}

const
  mc_Bancos = 1;
  mc_Contactos = 2;
  mc_Direcciones = 3;

procedure TDMTerceros2.DMTercerosCreate(Sender: TObject);
begin
  // Creamos la sentencia SQL básica para QMTerceros
  SQLBase := TStringList.Create;
  SQLBase.Text := ' SELECT * FROM VER_TERCEROS_EDICION ';

  QMTerceros.SelectSQL.Assign(SQLBase);
  QMTerceros.SelectSQL.Add(' ORDER BY TERCERO ');

  // Para auditoria, se eliminan registros mediante procedimiento que guarda entrada.
  QMContactos.DeleteSQL.Text := 'EXECUTE PROCEDURE DEL_SYS_TERCEROS_CONTACTOS(?old_TERCERO, ?old_CONTACTO, ' + IntToStr(REntorno.Entrada) + ')';

  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMTerceros, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMContactos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMBancos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDirecciones, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xValidacionDoc, MascaraN, MascaraI, ShortDateFormat);

  if REntorno.DatosAbiertos then
     QMTerceros.Open;
end;

procedure TDMTerceros2.DMTercerosDestroy(Sender: TObject);
begin
  SQLBase.Free;   // Destruimos la sentencia SQL base
end;

procedure TDMTerceros2.QMTercerosNewRecord(DataSet: TDataSet);
begin
  QMTercerosFECHA_ALTA.AsDateTime := REntorno.FechaTrabSH;
  QMTercerosTIPO_RAZON.AsString := 'DE';
  QMTercerosDIR_TIPO.AsString := 'CL';
  QMTercerosFECHA_ALTA.AsDateTime := REntorno.FechaTrabSH;
  // QMTercerosNOMBRE_R_SOCIAL.Value := 'Desconocido';
  QMTercerosNOMBRE_COMERCIAL.AsString := _('Desconocido');
  QMTercerosDIR_DEFECTO.AsInteger := 1;
  FMTerceros2.TraspasosActivos(0);
  QMTercerosIMAGEN.AsInteger := 0;
  // Asignamos por defecto al pais del entorno
  QMTercerosPAIS_TERCERO.AsString := REntorno.Pais;
  // Obtenemos el tipo de documento del pais del entorno
  QMTercerosTIPO_DOC_IDENT.AsString := DMMain.DameTipoDocPaisDefecto(REntorno.Pais);
  QMTercerosCOMO_NOS_CONOCIERON.AsInteger := 0;
end;

procedure TDMTerceros2.Graba(DataSet: TDataSet);
begin
  FMTerceros2.TraspasosActivos(1);
  if (nombreold <> QMTercerosNOMBRE_R_SOCIAL.AsString) then
  begin
     RefrescaNombreCuentas;
     RefrescaContactoCRM;
  end;
end;

procedure TDMTerceros2.QMContactosNewRecord(DataSet: TDataSet);
begin
  QMContactosTERCERO.AsInteger := QMTercerosTERCERO.AsInteger;
  QMContactosEMAIL_OFC.AsInteger := 0;
  QMContactosEMAIL_PEC.AsInteger := 0;
  QMContactosEMAIL_ALB.AsInteger := 0;
  QMContactosEMAIL_FAC.AsInteger := 0;
  QMContactosEMAIL_OFP.AsInteger := 0;
  QMContactosEMAIL_OCP.AsInteger := 0;
  QMContactosEMAIL_PEP.AsInteger := 0;
  QMContactosEMAIL_ALP.AsInteger := 0;
  QMContactosEMAIL_FAP.AsInteger := 0;
  QMContactosEMAIL_FCR.AsInteger := 0;
  QMContactosID_USUARIO_WEB.AsInteger := 0;
end;

procedure TDMTerceros2.QMTercerosBeforePost(DataSet: TDataSet);
var
  Valido : boolean;
  MensajeError : string;
begin
  FMTerceros2.TraspasosActivos(0);
  if (DataSet.State = dsInsert) then
  begin
     nombreold := QMTercerosNOMBRE_R_SOCIAL.AsString;
     nifold := QMTercerosNIF.AsString;
  end;

  if (LeeParametro('TERLNIF001') = 'S') then
     QMTercerosNIF.AsString := LimpiaNIF(QMTercerosPAIS_TERCERO.AsString, QMTercerosNIF.AsString);

  // CONTROL DE NIF DUPLICADOS
  if ((DataSet.State = dsInsert) or
     ((DataSet.State = dsEdit) and (nifold <> QMTercerosNIF.AsString))) then
     CheckDuplicateNif;

  if (not xLoc_T.Active) then
     xLoc_T.Open;

  QMTercerosID_LOCAL.AsInteger := xLoc_T.FieldByName('ID_LOCAL').AsInteger;

  // Verificamos numero de documento
  DMMain.VerificaDocumentoIdentificacion(QMTercerosPAIS_TERCERO.AsString, QMTercerosTIPO_DOC_IDENT.AsString, QMTercerosNIF.AsString, Valido, MensajeError);
  if (not Valido) then
     // Si el pais es Chile validamos que el NIF sea correcto
     if ((QMTercerosPAIS_TERCERO.AsString = 'CHL') and (QMTercerosTIPO_DOC_IDENT.AsString > '') and (QMTercerosNIF.AsString > '')) then
        raise Exception.Create(MensajeError)
     else
        MessageDlg(MensajeError, mtWarning, [mbOK], 0);

  if (LeeParametro('TEROEML001') = 'S') and (Trim(QMTercerosEMAIL.AsString) <= '') then
     raise Exception.Create(_('Es obligatorio rellenar el campo e-mail'));

  DMMain.Contador_Gen(DataSet, 'CONTA_TERCEROS', 'TERCERO');

  // Se regenera en trigger
  QMTercerosDIRECCION_LITERAL.AsString := '';
end;

procedure TDMTerceros2.QMContactosBeforePost(DataSet: TDataSet);
begin
  QMContactosENTRADA.AsInteger := REntorno.Entrada;
  if (DataSet.State = dsInsert) then
  begin
     QMContactosCONTACTO.AsInteger := Self.CodigosAuxiliares(mc_Contactos);
     QMContactosTERCERO.AsInteger := QMTercerosTERCERO.AsInteger;
  end;
  nombreold := QMTercerosNOMBRE_R_SOCIAL.AsString;
  nifold := QMTercerosNIF.AsString;
end;

procedure TDMTerceros2.QMBancosNewRecord(DataSet: TDataSet);
begin
  QMBancosTERCERO.AsInteger := QMTercerosTERCERO.AsInteger;
  QMBancosACTIVA.AsInteger := 1;
  QMBancosMODO.AsInteger := 0;
  QMBancosORDEN.AsInteger := 1;
  QMBancosTITULO.AsString := QMTercerosNOMBRE_R_SOCIAL.AsString;
  QMBancosTIPO_ADEUDO_SEPA.AsString := 'NONE';
  QMBancosTIPO_CONTRATO_SEPA.AsString := 'NONE';
  QMBancosFIRMA.AsString := '';
  QMBancosFECHA_FIRMA.AsDateTime := Today;
  QMBancosPAIS.AsString := REntorno.Pais;
end;

function TDMTerceros2.CodigosAuxiliares(Modo: smallint): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE COD_TERCERO_AUX(?TERCERO, ?MODO)';
        Params.ByName['TERCERO'].AsInteger := QMTercerosTercero.AsInteger;
        Params.ByName['MODO'].AsInteger := Modo;
        ExecQuery;
        Result := FieldByName['CONT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTerceros2.QMBancosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMBancosBANCO.AsInteger := Self.CodigosAuxiliares(mc_Bancos);

  if (QMBancosENTIDAD.AsString = '') then
     QMBancosENTIDAD.AsString := '0000';
  if (QMBancosSUCURSAL.AsString = '') then
     QMBancosSUCURSAL.AsString := '0000';
  if (QMBancosCONTROL.AsString = '') then
     QMBancosCONTROL.AsString := '**';
  if (QMBancosCONTROL.AsString <> '**') then
     if not (CuentaCCCValida(QMBancosENTIDAD.AsString, QMBancosSUCURSAL.AsString,
        QMBancosCONTROL.AsString, Trim(QMBancosCUENTA.AsString))) then
        MessageDlg(_('El código de cuenta no es correcto. Verifíquelo'), mtWarning, [mbOK], 0);

  nombreold := QMTercerosNOMBRE_R_SOCIAL.AsString;
  nifold := QMTercerosNIF.AsString;
end;

procedure TDMTerceros2.QMDireccionesNewRecord(DataSet: TDataSet);
begin
  QMDireccionesDIR_TIPO.AsString := 'CL';
  QMDireccionesDIR_CLASE.AsInteger := 1;
  QMDireccionesCODIGO_EDI.AsString := '';
  QMDireccionesDIR_DEFECTO.AsInteger := 0;
  QMDireccionesACTIVO.AsInteger := 1;
  QMDireccionesBANCO.AsInteger := 0;
  QMDireccionesPAIS_DIRECCION.AsString := REntorno.Pais;
  QMDireccionesDIR_LOCALIDAD.AsString := '99999999';
end;

procedure TDMTerceros2.QMDireccionesDIR_LOCALIDADChange(Sender: TField);
begin
  with xLoc_D do
  begin
     Close;
     Params.ByName['DIR_LOCALIDAD'].AsString := Sender.AsString;
     Open;
     QMDireccionesPAIS_DIRECCION.AsString := FieldByName('C_PAIS').AsString;
  end;
end;

procedure TDMTerceros2.QMDireccionesBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     QMDireccionesTERCERO.AsInteger := QMTercerosTERCERO.AsInteger;
     if (QMDireccionesDIRECCION.AsInteger = 0) then {dji lrk kri - Mirko quiere poner el nro de direccion}
        QMDireccionesDIRECCION.AsInteger := CodigosAuxiliares(mc_Direcciones);
  end;

  QMDireccionesDIR_BLOQUE_ESCALERA.AsString :=
     UpperCase(QMDireccionesDIR_BLOQUE_ESCALERA.AsString);

  nombreold := QMTercerosNOMBRE_R_SOCIAL.AsString;
  nifold := QMTercerosNIF.AsString;

  if (REntorno.Pais = 'CHL') then
  begin
     QMDireccionesID_LOCAL.AsInteger := 1;
     QMDireccionesDIR_LOCALIDAD.AsString := '99999999';
  end
  else
  begin
     QMDireccionesID_LOCAL.AsInteger := xLoc_D.FieldByName('ID_LOCAL').AsInteger;
     QMDireccionesPAIS_DIRECCION.AsString := xLoc_D.FieldByName('C_PAIS').AsString;
  end;

  // Se regenera en trigger
  QMDireccionesDIRECCION_LITERAL.AsString := '';
end;

procedure TDMTerceros2.QMBancosENTIDADChange(Sender: TField);
begin
  // Refresco datos cuadno estoy editando/insertando
  if (Sender.DataSet.State in [dsEdit, dsInsert]) then
  begin
     with xBancos do
     begin
        Close;
        Params.ByName['ENTIDAD'].AsString := Sender.AsString;
        Open;
     end;
  end;
end;

procedure TDMTerceros2.QMTercerosDIR_LOCALIDADChange(Sender: TField);
begin
  // Refresco datos cuadno estoy editando/insertando
  if (Sender.DataSet.State in [dsEdit, dsInsert]) then
  begin
     with xLoc_T do
     begin
        Close;
        Params.ByName['DIR_LOCALIDAD'].AsString := Sender.AsString;
        Open;
        QMTercerosPAIS_DIRECCION.AsString := FieldByName('C_PAIS').AsString;
     end;
  end;
end;

procedure TDMTerceros2.QMTercerosDIR_TIPOChange(Sender: TField);
begin
  // Refresco datos cuadno estoy editando/insertando
  if (Sender.DataSet.State in [dsEdit, dsInsert]) then
  begin
     with xTipDir_T do
     begin
        Close;
        Params.ByName['DIR_TIPO'].AsString := Sender.AsString;
        Open;
     end;
  end;
end;

procedure TDMTerceros2.QMDireccionesDIR_TIPOChange(Sender: TField);
begin
  // Refresco datos cuadno estoy editando/insertando
  if (Sender.DataSet.State in [dsEdit, dsInsert]) then
  begin
     with xTipDir_D do
     begin
        Close;
        Params.ByName['DIR_TIPO'].AsString := Sender.AsString;
        Open;
     end;
  end;
end;

procedure TDMTerceros2.QMTercerosAfterOpen(DataSet: TDataSet);
begin
  { Se abren cuando la pestaña se activa
  QMDirecciones.Open;
  QMContactos.Open;
  QMBancos.Open;
  xEmails.Open;
  }
  xRazones.Open;
  xLoc_T.Open;
  xTipDir_T.Open;
  QMComoNosConocieron.Open;
  xValidacionDoc.Open;
end;

procedure TDMTerceros2.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTerceros, '00000');
end;

procedure TDMTerceros2.QueEs(Tercero: integer; var Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE S_TERCEROS_QUE_SON (:EMPRESA, :EJERCICIO, :CANAL, :TERCERO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;
        Cliente := (FieldByName['CLIENTE'].AsInteger <> 0);
        Proveedor := (FieldByName['PROVEEDOR'].AsInteger <> 0);
        Acreedor := (FieldByName['ACREEDOR'].AsInteger <> 0);
        Agente := (FieldByName['AGENTE'].AsInteger <> 0);
        Empleado := (FieldByName['EMPLEADO'].AsInteger <> 0);
        Potencial := (FieldByName['POTENCIAL'].AsInteger <> 0);
        Crm := (FieldByName['CRM'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTerceros2.QMTercerosNOMBRE_COMERCIALChange(Sender: TField);
begin
  if QMTerceros.State <> dsEdit then
     QMTercerosNOMBRE_R_SOCIAL.AsString := QMTercerosNOMBRE_COMERCIAL.AsString;
end;

procedure TDMTerceros2.QMTercerosTIPO_RAZONChange(Sender: TField);
begin
  // Refresco datos cuadno estoy editando/insertando
  if (Sender.DataSet.State in [dsEdit, dsInsert]) then
  begin
     with xRazones do
     begin
        Close;
        Params.ByName['TIPO_RAZON'].AsString;
        Open;
     end;
  end;
end;

{ **********  Abrir y cerrar las tablas por pestañas  ********** }

procedure TDMTerceros2.AbrirFicha;
begin
  if (not xLoc_T.Active) then
     xLoc_T.Open;
  if (not xTipDir_T.Active) then
     xTipDir_T.Open;
  if (not xRazones.Active) then
     xRazones.Open;
end;

procedure TDMTerceros2.CerrarFicha;
begin
  xLoc_T.Close;
  xTipDir_T.Close;
  xRazones.Close;
end;

procedure TDMTerceros2.AbrirDirecciones;
begin
  QMDirecciones.Open;
end;

procedure TDMTerceros2.CerrarDirecciones;
begin
  QMDirecciones.Close;
end;

procedure TDMTerceros2.AbrirContactos;
begin
  QMContactos.Open;
end;

procedure TDMTerceros2.CerrarContactos;
begin
  QMContactos.Close;
end;

procedure TDMTerceros2.AbrirCuentas;
begin
  QMBancos.Open;
end;

procedure TDMTerceros2.CerrarCuentas;
begin
  QMBancos.Close;
end;

procedure TDMTerceros2.AbrirEmail;
begin
  xEmails.Close;
  xEmails.SelectSQL.Text := 'SELECT * FROM EMP_CORREO_ENVIADO WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND TERCERO=?TERCERO ORDER BY LINEA';
  xEmails.Open;
end;

procedure TDMTerceros2.CerrarEmail;
begin
  xEmails.Close;
end;

procedure TDMTerceros2.InsertarTercero;
begin
  with QMTerceros do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_TERCEROS_EDICION WHERE TERCERO = 0 ORDER BY TERCERO';
     Open;
     Insert;
     QMTercerosNewRecord(QMTerceros);
  end;
end;

procedure TDMTerceros2.FiltraTercero(Filtro: string);
begin
  with QMTerceros do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;
     if (Filtro <> '') then
        SelectSQL.Add('WHERE ' + Filtro);
     SelectSQL.Add(' ORDER BY TERCERO ');
     Open;
  end;
end;

procedure TDMTerceros2.QMTercerosBeforeEdit(DataSet: TDataSet);
begin
  nombreold := QMTercerosNOMBRE_R_SOCIAL.AsString;
  nifold := QMTercerosNIF.AsString;
end;

procedure TDMTerceros2.RefrescaNombreCuentas;
var
  pregunta1, pregunta2 : boolean;
  modo : byte;
begin
  pregunta1 := (Application.MessageBox(PChar(string(_('El nombre del Tercero ha cambiado. ¿Desea regenerar el nombre de sus cuentas asociadas?'))),
     PChar(string(_('Confirmación'))),
     mb_iconstop + mb_yesno) = id_yes);

  if (pregunta1) then
  begin
     modo := 0;
     pregunta2 := (Application.MessageBox(PChar(string(_('¿Desea que se cambien los textos de los apuntes asociados?'))), PChar(string(_('Confirmación'))),
        mb_iconstop + mb_yesno) = id_yes);

     if (pregunta2) then
        modo := 1;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_CAMBIA_TITULO_TER (?TERCERO, ?TITULOOLD, ?TITULOPAR, ?MODO)';
           Params.ByName['TERCERO'].AsInteger := QMTercerosTERCERO.AsInteger;
           Params.ByName['TITULOPAR'].AsString := QMTercerosNOMBRE_R_SOCIAL.AsString;
           Params.ByName['TITULOOLD'].AsString := nombreold;
           Params.ByName['MODO'].AsInteger := modo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ShowMessage(_('Se han cambiado las cuentas asociadas correctamente.'));
  end;
end;

procedure TDMTerceros2.RefrescaContactoCRM;
var
  Param_TERCCRM003 : string;
begin
  Param_TERCCRM003 := LeeParametro('TERCCRM003');

  if ((Param_TERCCRM003 = 'S') or (Application.MessageBox(PChar(string(_('¿Desea traspasar los datos del tercero al contacto CRM?'))),
     PChar(string(_('Confirmación'))), mb_iconstop + mb_yesno) = id_yes)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE TRASPASA_DATOS_TERCERO_A_CRM (?TERCERO)';
           Params.ByName['TERCERO'].AsInteger := QMTercerosTERCERO.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ShowMessage(_('Se ha cambiado los datos del contactos CRM.'));
  end;
end;

procedure TDMTerceros2.CheckDuplicateNif;
var
  Duplicado : boolean;
  Continuar : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(NIF) FROM SYS_TERCEROS  WHERE NIF = ?NIF';
        Params.ByName['NIF'].AsString := QMTercerosNIF.AsString;
        ExecQuery;
        Duplicado := (FieldByName['COUNT'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Duplicado) then
  begin
     if (DMMain.EstadoKri(202) = 1) then
        raise Exception.Create(_('El numero de identificacion esta siendo utilizado por otro Tercero. Proceda a modificarlo'))
     else
     begin
        Continuar := (Application.MessageBox(PChar(string(_('El numero de identificacion esta siendo utilizado por otro Tercero, ¿desea continuar?'))),
           PChar(string(_('Confirmación'))),
           mb_iconstop + mb_yesno) = id_yes);
        if (not Continuar) then
           raise Exception.Create(_('Proceda a modificar el NIF'));
     end;
  end;
end;

procedure TDMTerceros2.DireccionDefecto;
begin
  if (HayDireccion) then
     if (confirma) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE UT_CAMBIA_DIRECCION_DEFECTO(?TERCERO, ?DIRECCION)';
              Params.ByName['TERCERO'].AsInteger := QMDireccionesTERCERO.AsInteger;
              Params.ByName['DIRECCION'].AsInteger := QMDireccionesDIRECCION.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        ActualizaDirecciones;
     end;
end;

procedure TDMTerceros2.ResDireccionDefecto;
begin
  if (HayDireccion) then
     if confirma then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE UT_CAMBIA_DIRECCION_DEFECTO(?TERCERO, 1)';
              Params.ByName['TERCERO'].AsInteger := QMDireccionesTERCERO.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        ActualizaDirecciones;
     end;
end;

function TDMTerceros2.HayDireccion;
begin
  Result := (QMDireccionesDIRECCION.AsInteger <> 0);
end;

procedure TDMTerceros2.QMDireccionesBeforeDelete(DataSet: TDataSet);
begin
  if QMDireccionesDIR_DEFECTO.AsInteger = 1 then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE UT_CAMBIA_DIRECCION_DEFECTO(?TERCERO, 1)';
           Params.ByName['TERCERO'].AsInteger := QMDireccionesTERCERO.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMTerceros2.ActualizaDirecciones;
var
  Temporal : TBookmark;
begin
  Temporal := QMDirecciones.GetBookmark;
  try
     QMDirecciones.Close;
     QMDirecciones.Open;
     QMDirecciones.GotoBookmark(Temporal);
  finally
     QMDirecciones.FreeBookmark(Temporal);
  end;
end;

procedure TDMTerceros2.QMDireccionesAfterOpen(DataSet: TDataSet);
begin
  xLoc_D.Open;
  xTipDir_D.Open;
end;

procedure TDMTerceros2.VerificaNifKri;
var
  Seguir : integer;
  s : string;

  Valido : boolean;
  MensajeError : string;
begin
  inherited;
  Seguir := mrOk;
  QMTerceros.First;
  while ((not QMTerceros.EOF) and (Seguir = mrOk)) do
  begin
     Application.ProcessMessages;
     s := Format(_('Tercero : (%d) %s - NIF : %s'), [QMTercerosTERCERO.AsInteger, QMTercerosNOMBRE_R_SOCIAL.AsString, QMTercerosNIF.AsString]);

     if (not xLoc_T.Active) then
        xLoc_T.Open;

     DMMain.VerificaDocumentoIdentificacion(QMTercerosPAIS_TERCERO.AsString, QMTercerosTIPO_DOC_IDENT.AsString, QMTercerosNIF.AsString, Valido, MensajeError);
     if (not Valido) then
        Seguir := MessageDlg(s + #13#10 + #13#10 + MensajeError, mtConfirmation, [mbOK, mbCancel], 0);

     if (Seguir = mrOk) then
        QMTerceros.Next;
  end;
end;

procedure TDMTerceros2.QMTercerosAfterScroll(DataSet: TDataSet);
begin
  {dji lrk kri - para que al borrar contactos no diga que cambio el nombre}
  nombreold := QMTercerosNOMBRE_R_SOCIAL.AsString;
  nifold := QMTercerosNIF.AsString;
end;

procedure TDMTerceros2.QMContactosAfterScroll(DataSet: TDataSet);
begin
  // FMTerceros2.CreaArbolContactos;
end;

procedure TDMTerceros2.QMContactosAfterOpen(DataSet: TDataSet);
begin
  FMTerceros2.CreaArbolContactos;
end;

procedure TDMTerceros2.PosicionaContacto(Contacto: integer);
begin
  with QMContactos do
  begin
     First;
     while ((not EOF) and (QMContactosCONTACTO.AsInteger <> Contacto) and (Contacto <> 0)) do
        Next;
  end;
end;

procedure TDMTerceros2.GenerarFirma;
var
  GenerarNuevaFirma : boolean;
  TipoAdeudoSEPA : string;
  TipoContratoSEPA : string;
begin
  GenerarNuevaFirma := True;
  if (QMBancosFIRMA.AsString > '') then
  begin
     GenerarNuevaFirma := (Application.MessageBox(PChar(string(_('Ya tiene una firma asignada. Quiere generar otra firma?'))),
        PChar(string(_('Confirmación'))),
        mb_iconstop + mb_yesno) = id_yes);
  end;
  // else
  //   MessageDlg(_('Se creará una nueva firma.'), mtWarning, [mbOK], 0);

  if (GenerarNuevaFirma) then
  begin
     // Si no está especificado el Tipo de Adeudo lo pregunto
     if (QMBancosTIPO_ADEUDO_SEPA.AsString = 'NONE') then
     begin
        if (Application.MessageBox(PChar(string(_('Es de tipo Recurrente?'))),
           PChar(string(_('Confirmación'))),
           mb_iconstop + mb_yesno) = id_yes) then
           TipoAdeudoSEPA := 'FRST'
        else
           TipoAdeudoSEPA := 'OOFF';
     end
     else
        TipoAdeudoSEPA := QMBancosTIPO_ADEUDO_SEPA.AsString;

     // Si no está especificado el Tipo de Contrato lo pregunto
     if (QMBancosTIPO_CONTRATO_SEPA.AsString = 'NONE') then
     begin
        if (Application.MessageBox(PChar(string(_('Es de tipo B2B?'))),
           PChar(string(_('Confirmación'))),
           mb_iconstop + mb_yesno) = id_yes) then
           TipoContratoSEPA := 'B2B'
        else
           TipoContratoSEPA := 'CORE';
     end
     else
        TipoContratoSEPA := QMBancosTIPO_CONTRATO_SEPA.AsString;

     with QMBancos do
     begin
        if (State <> dsEdit) then
           Edit;

        // Agrego la firma anterior a las notas
        if (Trim(QMBancosFIRMA.AsString) > '') then
        begin
           if (QMBancosNOTAS.AsString > '') then
              QMBancosNOTAS.AsString := QMBancosNOTAS.AsString + #13;
           QMBancosNOTAS.AsString := QMBancosNOTAS.AsString + Format(_('Firma anterior: (%s) %s, de %s'), [QMBancosTIPO_ADEUDO_SEPA.AsString, QMBancosFIRMA.AsString, FormatDateTime(ShortDateFormat, QMBancosFECHA_FIRMA.AsDateTime)]);
        end;

        QMBancosFIRMA.AsString := FormatDateTime('yyyymmddhhnnss', Now);
        QMBancosFECHA_FIRMA.AsDateTime := Now;
        QMBancosTIPO_ADEUDO_SEPA.AsString := TipoAdeudoSEPA;
        QMBancosTIPO_CONTRATO_SEPA.AsString := TipoContratoSEPA;

        Post;
     end;
  end;
end;

procedure TDMTerceros2.CreaTerceros;
var
  a, n, d, b, l, z : TStrings;
  i, r : integer;
  Tercero : integer;
  nombre, direccion : string;
  Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm : boolean;
  Tarifa : string;
  NroCliente : integer;
  PrecioVenta : double;
begin
  // Crea terceros aleatoriamente

  Tarifa := '';
  a := TStringList.Create;
  n := TStringList.Create;
  d := TStringList.Create;
  b := TStringList.Create;
  l := TStringList.Create;
  z := TStringList.Create;

  a.LoadFromFile('C:\Apellidos.txt');
  n.LoadFromFile('C:\Nombres.txt');
  d.LoadFromFile('C:\Direcciones.txt');
  b.LoadFromFile('C:\Bancos.txt');
  l.LoadFromFile('C:\Localidades.txt');
  z.LoadFromFile('C:\Zonas.txt');

  // Creo terceros

  Randomize;
  for i := 1 to 1000 do
  begin
     r := Random(a.Count);
     nombre := Trim(a[r]);
     r := Random(a.Count);
     nombre := nombre + ' ' + Trim(a[r]);
     r := Random(n.Count);
     nombre := nombre + ', ' + Trim(n[r]);
     r := Random(d.Count);
     direccion := Trim(d[r]);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE INSERTA_TERCERO(0, :NIF, :NOMBRE_R_SOCIAL, :FECHA_ALTA, :TELEFONO01, :TELEFONO02, :TELEFAX, :EMAIL, :WEB, :DIRECCION)';
           Params.ByName['NIF'].AsString := Format('ESB%d%d%d%d%d%d%d%d', [Random(9), Random(9), Random(9), Random(9), Random(9), Random(9), Random(9), Random(9)]);
           Params.ByName['NOMBRE_R_SOCIAL'].AsString := nombre;
           Params.ByName['FECHA_ALTA'].AsDateTime := Now;
           Params.ByName['TELEFONO01'].AsString := '';
           Params.ByName['TELEFONO02'].AsString := '';
           Params.ByName['TELEFAX'].AsString := '';
           Params.ByName['EMAIL'].AsString := '';
           Params.ByName['WEB'].AsString := '';
           Params.ByName['DIRECCION'].AsString := Copy(direccion, 1, 40);
           ExecQuery;
           Tercero := FieldByName['TERCERO'].AsInteger;
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
           SQL.Add(' INSERT INTO SYS_TERCEROS_BANCOS ');
           SQL.Add(' (TERCERO, BANCO, TITULO, ENTIDAD, SUCURSAL, CONTROL, CUENTA, ACTIVA, MODO, ORDEN, IBAN, BIC) ');
           SQL.Add(' VALUES ');
           SQL.Add(' (:TERCERO, 0, '''', :ENTIDAD, :SUCURSAL, :CONTROL, :CUENTA, 1, 0, 1, '''', '''') ');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Params.ByName['ENTIDAD'].AsString := b[Random(b.Count)];
           Params.ByName['SUCURSAL'].AsString := Format('%d%d%d%d', [Random(9), Random(9), Random(9), Random(9)]);
           Params.ByName['CONTROL'].AsString := Format('%d%d', [Random(9), Random(9)]);
           Params.ByName['CUENTA'].AsString := Format('%d%d%d%d%d%d%d%d%d%d', [Random(9), Random(9), Random(9), Random(9), Random(9), Random(9), Random(9), Random(9), Random(9), Random(9)]);
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
           SQL.Add(' UPDATE SYS_TERCEROS_DIRECCIONES ');
           SQL.Add(' SET ');
           SQL.Add(' DIR_LOCALIDAD = :LOCALIDAD, ');
           SQL.Add(' DIR_NUMERO = :DIR_NUMERO ');
           SQL.Add(' WHERE ');
           SQL.Add(' TERCERO = :TERCERO AND ');
           SQL.Add(' DIRECCION = 1 ');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Params.ByName['LOCALIDAD'].AsString := l[Random(l.Count)];
           Params.ByName['DIR_NUMERO'].AsString := IntToStr(Random(100));
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

  end;

  // Creo Clientes
  with QMTerceros do
  begin
     Close;
     Open;
     while not EOF do
     begin
        if (QMTercerosTERCERO.AsInteger > 1) then
        begin
           QueEs(QMTercerosTERCERO.AsInteger, Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm);
           if (not Cliente) then
           begin
              NroCliente := DMMain.Contador_E('XCL');
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' INSERT INTO VER_CLIENTES_CUENTAS ');
                    SQL.Add(' (EMPRESA, EJERCICIO, CANAL, CLIENTE, TERCERO, TARIFA, FORMA_PAGO, RIESGO_AUT, ');
                    SQL.Add(' RIESGO_ACT, MODO_IVA, DIA_PAGO_1, DIA_PAGO_2, DESCUENTO_PP, DESCUENTO_CIAL, ');
                    SQL.Add(' AGENTE, NOTAS, CUENTA, TITULO, PERFIL, TIPO_IRPF, PAIS, TIPO, PORTES, ');
                    SQL.Add(' NOMBRE_COMERCIAL, USAR_ANTICIPOS, SU_PROVEEDOR, EVAL_FEB, EVAL_FEB_SI, MONEDA, ');
                    SQL.Add(' FINANCIACION, FACTURAR_AGENTE, FACTURAR_TRANSPORTISTA, FACTURAR_REFERENCIA, ');
                    SQL.Add(' FACTURAR_DIRECCION, FACTURAR_SERIE, SERIE_A_FACTURAR, FACTURAR_ALMACEN, ');
                    SQL.Add(' TRANSPORTISTA, FACTURA_DIRECCION_ADMTVA, ALBARAN_DIRECCION_ENVIO, ');
                    SQL.Add(' POR_FINANCIACION, NO_ALB_FAC, NO_VENTA_RIESGO, SU_REFERENCIA, RIESGO_FAC, ');
                    SQL.Add(' RIESGO_ALB, RIESGO_CAR, RIESGO_REM, MOROSO, CREDITO_Y_CAUCION, NRO_EMPLEADOS, ');
                    SQL.Add(' FACTURACION_TOTAL, CONSUMO_MATERIAL, PROVEEDORES_HABITUALES, RUTA, ');
                    SQL.Add(' CLIENTE_POTENCIAL, TIPO_CLIENTE, NO_CALC_DESC_KRI, NO_AGRUPAR_PED_KRI, ');
                    SQL.Add(' POTENCIAL_DE_COMPRA, NOTAS_FACTURACION_KRI, RIESGO_FACTOR, INTRA, ');
                    SQL.Add(' INTRA_TRANS, FACTURAR_TARIFA, PAIS_C2, TIT_LOCALIDAD, CODIGO_POSTAL, ');
                    SQL.Add(' CUENTA_DTOPP, CUENTA_DTOCIAL, DIAS_ENTREGA, IDIOMA, APLICAR_PTO_VERDE, ');
                    SQL.Add(' COD_CREDITO_Y_CAUCION, FACTURAS_POR_EMAIL_KRI, TIPO_PORTES, POR_PORTES, ');
                    SQL.Add(' I_PORTES, RANGO, INDICE, FRECUENCIA, ZONA, PROTOCOLO, BLOQUEO, MOTIVO_BLOQUEO, ');
                    SQL.Add(' CODIGO_INCOTERM, DIR_DEFECTO_VENTAS, DIRECCION_DEFECTO, FECHA_ENTREGA_X_STOCK, ');
                    SQL.Add(' SIN_DESCUENTOS, UTILIZA_F_PAGO_ALTERNATIVA, BAJA, FECHA_BAJA, MOTIVO_BAJA, ');
                    SQL.Add(' TELEFONO, TIPO_NCF, CUENTA_COMPRA, CUENTA_VENTA) ');
                    SQL.Add(' VALUES ');
                    SQL.Add(' (1, 2013, 1, :CLIENTE, :TERCERO, :TARIFA, ''CON'', 0, ');
                    SQL.Add(' 0, 1, 0, 0, 0, 0, ');
                    SQL.Add(' 1, NULL, :CUENTA, '''', ''NORM'', 0, ''ESP'', 1, 0, ');
                    SQL.Add(' '''', 0, '''', 1, 1, ''EUR'', ');
                    SQL.Add(' 0, 1, 1, 0, ');
                    SQL.Add(' 1, 0, '''', 0, ');
                    SQL.Add(' 1, 1, 0, ');
                    SQL.Add(' 0, 0, 0, '''', 0, ');
                    SQL.Add(' 0, 0, 0, 0, 0, 0, ');
                    SQL.Add(' 0, 0, '''', 0, ');
                    SQL.Add(' 0, '''', 0, 0, ');
                    SQL.Add(' 0, NULL, 1, 0, ');
                    SQL.Add(' 0, 1, ''ES'', '''', '''', ');
                    SQL.Add(' ''706000000'', ''709000000'', 0, ''CAS'', 0, ');
                    SQL.Add(' 0, 0, 0, 0, ');
                    SQL.Add(' 0, NULL, NULL, 0, :ZONA, ''NORM'', 0, '''', ');
                    SQL.Add(' ''EXW'', 0, 0, 0, ');
                    SQL.Add(' 0, 0, 0, NULL, '''', ');
                    SQL.Add(' '''', 0, ''600000000'', ''700000000'') ');

                    Params.ByName['TERCERO'].AsInteger := QMTercerosTERCERO.AsInteger;
                    Params.ByName['CLIENTE'].AsInteger := NroCliente;
                    Params.ByName['CUENTA'].AsString := Format('4300%.5d', [Params.ByName['CLIENTE'].AsInteger]);
                    if (Tarifa = 'RED') then
                       Tarifa := 'GEN'
                    else
                       Tarifa := 'RED';
                    Params.ByName['TARIFA'].AsString := Tarifa;
                    Params.ByName['ZONA'].AsString := z[Random(z.Count)];
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
                    SQL.Text := 'SELECT PRECIO_VENTA FROM ART_TARIFAS_PRECIOS WHERE EMPRESA=1 AND TARIFA=?TARIFA AND ARTICULO=''CUOTA'' AND LINEA=1';
                    Params.ByName['TARIFA'].AsString := Tarifa;
                    ExecQuery;
                    PrecioVenta := FieldByName['PRECIO_VENTA'].AsFloat;
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
                    SQL.Text := '';
                    SQL.Add(' INSERT INTO EMP_CLIENTES_CUOTAS ');
                    SQL.Add(' (EMPRESA, CANAL, CLIENTE, CUOTA, TERCERO, ARTICULO, DESCRIPCION, IMPORTE, ');
                    SQL.Add(' SUPLIDO, DESCUENTO, PERIODICIDAD, DIAS, FECHA_ULT_CUOTA, SERIE_ULT_CUOTA, ');
                    SQL.Add(' TIPO_DOC, AGRUPADA, ID_A, FECHA_PROX_CUOTA, RIG_DOC, ID_S, FECHA_FIN_CUOTA, ');
                    SQL.Add(' UNIDADES) ');
                    SQL.Add(' VALUES ');
                    SQL.Add(' (1, 1, ?CLIENTE, 0, ?TERCERO, ?ARTICULO, ?DESCRIPCION, ?IMPORTE, ');
                    SQL.Add(' 0, 0, ?PERIODICIDAD, ?DIAS, ?FECHA_ULT_CUOTA, '''', ');
                    SQL.Add(' ''REC'', 0, 0, ?FECHA_PROX_CUOTA, 0, 0, null, ');
                    SQL.Add(' 1) ');

                    Params.ByName['TERCERO'].AsInteger := QMTercerosTERCERO.AsInteger;
                    Params.ByName['CLIENTE'].AsInteger := NroCliente;
                    Params.ByName['ARTICULO'].AsString := 'CUOTA';
                    Params.ByName['DESCRIPCION'].AsString := DameTituloArticulo('CUOTA');
                    Params.ByName['IMPORTE'].AsFloat := PrecioVenta;
                    Params.ByName['PERIODICIDAD'].AsInteger := 1;
                    Params.ByName['DIAS'].AsInteger := 0;
                    Params.ByName['FECHA_ULT_CUOTA'].AsDateTime := EncodeDate(2013, 03, 01);
                    Params.ByName['FECHA_PROX_CUOTA'].AsDateTime := EncodeDate(2013, 04, 01);
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
        Next;
     end;
  end;

  a.Free;
  n.Free;
  d.Free;
  b.Free;
  l.Free;
  z.Free;
end;

procedure TDMTerceros2.RenombraTerceros;
var
  a, n, d, b, l, z : TStrings;
  r : integer;
  Tercero : integer;
  nombre, direccion : string;
  Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm : boolean;
  Tarifa : string;
begin
  // Crea terceros aleatoriamente

  Tarifa := '';
  a := TStringList.Create;
  n := TStringList.Create;
  d := TStringList.Create;
  b := TStringList.Create;
  l := TStringList.Create;
  z := TStringList.Create;

  a.LoadFromFile('C:\Apellidos.txt');
  n.LoadFromFile('C:\Nombres.txt');
  d.LoadFromFile('C:\Direcciones.txt');
  b.LoadFromFile('C:\Bancos.txt');
  l.LoadFromFile('C:\Localidades.txt');
  z.LoadFromFile('C:\Zonas.txt');

  Randomize;
  // Modifico Terceros/Clientes/Proveedores/Acreedores
  with QMTerceros do
  begin
     Close;
     Open;
     while not EOF do
     begin
        Application.ProcessMessages;
        Tercero := QMTercerosTERCERO.AsInteger;
        if (Tercero > 1) then
        begin
           r := Random(a.Count);
           nombre := Trim(a[r]);
           r := Random(a.Count);
           nombre := nombre + ' ' + Trim(a[r]);
           r := Random(n.Count);
           nombre := nombre + ', ' + Trim(n[r]);
           r := Random(d.Count);
           direccion := Trim(d[r]);

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' UPDATE VER_TERCEROS_EDICION ');
                 SQL.Add(' SET ');
                 SQL.Add(' NOMBRE_R_SOCIAL = :NOMBRE_R_SOCIAL, ');
                 SQL.Add(' NOMBRE_COMERCIAL = :NOMBRE_COMERCIAL, ');
                 SQL.Add(' DIR_NOMBRE = :DIR_NOMBRE ');
                 SQL.Add(' WHERE TERCERO = :TERCERO ');
                 Params.ByName['NOMBRE_R_SOCIAL'].AsString := nombre;
                 Params.ByName['NOMBRE_COMERCIAL'].AsString := nombre;
                 Params.ByName['DIR_NOMBRE'].AsString := direccion;
                 Params.ByName['TERCERO'].AsInteger := Tercero;
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
                 SQL.Add(' UPDATE SYS_TERCEROS_BANCOS ');
                 SQL.Add(' SET TITULO = :TITULO ');
                 SQL.Add(' WHERE TERCERO = :TERCERO ');
                 Params.ByName['TERCERO'].AsInteger := Tercero;
                 Params.ByName['TITULO'].AsString := nombre;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           QueEs(QMTercerosTERCERO.AsInteger, Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm);
           if (Cliente) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE CON_CUENTAS SET TITULO = :TITULO WHERE CUENTA IN (SELECT CUENTA FROM VER_CLIENTES_CUENTAS WHERE TERCERO = :TERCERO) ');
                    Params.ByName['TERCERO'].AsInteger := QMTercerosTERCERO.AsInteger;
                    Params.ByName['TITULO'].AsString := nombre;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           if (Proveedor) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE CON_CUENTAS SET TITULO = :TITULO WHERE CUENTA IN (SELECT CUENTA FROM VER_PROVEEDORES_CUENTAS WHERE TERCERO = :TERCERO) ');
                    Params.ByName['TERCERO'].AsInteger := QMTercerosTERCERO.AsInteger;
                    Params.ByName['TITULO'].AsString := nombre;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           if (Acreedor) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE CON_CUENTAS SET TITULO = :TITULO WHERE CUENTA IN (SELECT CUENTA FROM VER_ACREEDORES_CUENTAS WHERE TERCERO = :TERCERO) ');
                    Params.ByName['TERCERO'].AsInteger := QMTercerosTERCERO.AsInteger;
                    Params.ByName['TITULO'].AsString := nombre;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           if (Agente) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE CON_CUENTAS SET TITULO = :TITULO WHERE CUENTA IN (SELECT CUENTA FROM VER_AGENTES_CUENTAS WHERE TERCERO = :TERCERO) ');
                    Params.ByName['TERCERO'].AsInteger := QMTercerosTERCERO.AsInteger;
                    Params.ByName['TITULO'].AsString := nombre;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
        end;
        Next;
     end;
     Close;
     Open;
  end;

  a.Free;
  n.Free;
  d.Free;
  b.Free;
  l.Free;
  z.Free;
end;

procedure TDMTerceros2.ReemplazaCarateres;
var
  TituloForm : string;
  NombreComercial : string;
  NombreRSocial : string;
  DirNombre : string;
  DirNombre2 : string;

  function Reemplazar(s: string): string;
  begin
     s := StringReplace(s, '£', 'Ñ', [rfReplaceAll]);
     // s := StringReplace(s, '#', '*', [rfReplaceAll]);
     Result := s;
  end;

  function ContieneCaracteresRaros(s: string): boolean;
  var
     i : integer;
  begin
     Result := False;
     for i := 1 to Length(s) do
        if not (s[i] in ['a'..'z', 'A'..'Z', '0'..'9',
           'ñ', 'Ñ', 'ç', 'Ç',
           'á', 'é', 'í', 'ó', 'ú', 'Á', 'É', 'Í', 'Ó', 'Ú', 'ü', 'Ü',
           ',', '.', ' ', '&', '/', '\', '-', '#', 'º', 'ª', '(', ')', '"', '''']) then
           Result := True;
  end;

begin
  TituloForm := FMTerceros2.Caption;

  with QMTerceros do
  begin
     First;
     while not EOF do
     begin
        NombreComercial := Reemplazar(QMTercerosNOMBRE_COMERCIAL.AsString);
        NombreRSocial := Reemplazar(QMTercerosNOMBRE_R_SOCIAL.AsString);
        DirNombre := Reemplazar(QMTercerosDIR_NOMBRE.AsString);
        DirNombre2 := Reemplazar(QMTercerosDIR_NOMBRE_2.AsString);

        if ContieneCaracteresRaros(QMTercerosNOMBRE_COMERCIAL.AsString) then
           DMMain.Log('NombreComercial ' + QMTercerosNOMBRE_COMERCIAL.AsString);

        if ContieneCaracteresRaros(QMTercerosNOMBRE_R_SOCIAL.AsString) then
           DMMain.Log('NombreRSocial ' + QMTercerosNOMBRE_R_SOCIAL.AsString);

        if ContieneCaracteresRaros(QMTercerosDIR_NOMBRE.AsString) then
           DMMain.Log('DirNombre ' + QMTercerosDIR_NOMBRE.AsString);

        if ContieneCaracteresRaros(QMTercerosDIR_NOMBRE_2.AsString) then
           DMMain.Log('DirNombre2 ' + QMTercerosDIR_NOMBRE_2.AsString);

        if (
           (NombreComercial <> QMTercerosNOMBRE_COMERCIAL.AsString) or
           (NombreRSocial <> QMTercerosNOMBRE_R_SOCIAL.AsString) or
           (DirNombre <> QMTercerosDIR_NOMBRE.AsString) or
           (DirNombre2 <> QMTercerosDIR_NOMBRE_2.AsString)) then
        begin
           Edit;

           FMTerceros2.Caption := QMTercerosNOMBRE_COMERCIAL.AsString + QMTercerosNOMBRE_R_SOCIAL.AsString;
           QMTercerosNOMBRE_COMERCIAL.AsString := NombreComercial;
           QMTercerosNOMBRE_R_SOCIAL.AsString := NombreRSocial;
           QMTercerosDIR_NOMBRE.AsString := DirNombre;
           QMTercerosDIR_NOMBRE_2.AsString := DirNombre2;

           Post;
        end;

        Next;
     end;
  end;

  FMTerceros2.Caption := TituloForm;
end;

procedure TDMTerceros2.ImprimirCartaSEPA(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
var
  BancoAbierto : boolean;
  CuerpoMail : TStrings;
  Archivo : string;
  Cliente : integer;
begin
  BancoAbierto := QMBancos.Active;

  if not BancoAbierto then
     AbrirCuentas;

  AbreData(TDMLstTerceros, DMLstTerceros);
  GenerarFirma;
  Archivo := _('Carta') + '-' + QMBancosFIRMA.AsString + '.pdf';
  DMLstTerceros.MuestraCartaSEPA(Modo, QMTercerosTERCERO.AsInteger, QMBancosBANCO.AsInteger, Archivo);
  CierraData(DMLstTerceros);

  // Modo 2 es para enviar por email. Genera un PDF y lo deja en %TEMP%
  if (Modo = 2) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT CLIENTE FROM EMP_CLIENTES WHERE EMPRESA=?EMPRESA AND TERCERO=?TERCERO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['TERCERO'].AsInteger := QMTercerosTERCERO.AsInteger;
           ExecQuery;
           Cliente := FieldByName['CLIENTE'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     AbreData(TDMListados, DMListados);
     CuerpoMail := TStringList.Create;
     try
        CuerpoMail.Add('Este correo ha sido enviado desde :');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('y contiene el fichero adjunto ' + UpperCase(Archivo));
        CuerpoMail.Add('correspondiente al documento : ' + _('Carta de autorizacion de adeudo SEPA'));
        CuerpoMail.Add('------------------------------------------------------------');
        CuerpoMail.Add('This is an automatic message send from :');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('We attached the file ' + UpperCase(Archivo));
        CuerpoMail.Add('correspondig to : ' + _('Carta de autorizacion de adeudo SEPA'));

        if MedianteClienteCorreo then
           DMListados.SendMailClientePDF2(Cliente, CuerpoMail, DameTempPath + Archivo, Archivo, _('Carta de autorizacion de adeudo SEPA'), 'CLI', Cliente, MuestraCuerpo)
        else
           DMListados.SendMailClientePDF(Cliente, CuerpoMail, DameTempPath + Archivo, Archivo, _('Carta de autorizacion de adeudo SEPA'), 'CLI', Cliente, MuestraCuerpo);
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end;

  if not BancoAbierto then
     CerrarCuentas;
end;

procedure TDMTerceros2.ImprimirCartaSpeedLock(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
var
  // BancoAbierto : boolean;
  CuerpoMail : TStrings;
  Archivo : string;
  // Cliente : integer;
begin
  AbreData(TDMLstTerceros, DMLstTerceros);
  Archivo := _('Carta') + '-' + QMTercerosTERCERO.AsString + '-' + QMContactosCONTACTO.AsString + '.pdf';
  DMLstTerceros.MuestraCartaSpeedLock(Modo, QMTercerosTERCERO.AsInteger, QMContactosCONTACTO.AsInteger, Archivo);
  CierraData(DMLstTerceros);

  // Modo 2 es para enviar por email. Genera un PDF y lo deja en %TEMP%
  if (Modo = 2) then
  begin
     {
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT CLIENTE FROM EMP_CLIENTES WHERE EMPRESA=?EMPRESA AND TERCERO=?TERCERO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['TERCERO'].AsInteger := QMTercerosTERCERO.AsInteger;
           ExecQuery;
           Cliente := FieldByName['CLIENTE'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
     }
     AbreData(TDMListados, DMListados);
     CuerpoMail := TStringList.Create;
     try
        CuerpoMail.Add('Este correo ha sido enviado desde :');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('y contiene el fichero adjunto ' + UpperCase(Archivo));
        CuerpoMail.Add('correspondiente al documento : ' + _('Claves SpeedLock'));
        CuerpoMail.Add('------------------------------------------------------------');
        CuerpoMail.Add('This is an automatic message send from :');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('We attached the file ' + UpperCase(Archivo));
        CuerpoMail.Add('correspondig to : ' + _('Claves SpeedLock'));

        if MedianteClienteCorreo then
           DMListados.SendMailPDF2(QMContactosCORREO.AsString, CuerpoMail, DameTempPath + Archivo, Archivo, _('Claves SpeedLock'))
        else
           DMListados.SendMailPDF(QMContactosCORREO.AsString, CuerpoMail, DameTempPath + Archivo, Archivo, _('Claves SpeedLock'));
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end;
end;

procedure TDMTerceros2.ImprimirCartaLOPD(Modo: integer; MedianteClienteCorreo: boolean; MuestraCuerpo: boolean = False);
var
  CuerpoMail : TStrings;
  Archivo : string;
begin
  AbreData(TDMLstTerceros, DMLstTerceros);

  Archivo := _('CartaLOPD') + '-' + QMTercerosNIF.AsString + '.pdf';
  DMLstTerceros.MuestraCartaLOPD(Modo, 'LOP', QMTercerosTERCERO.AsInteger, 0, Archivo);
  CierraData(DMLstTerceros);

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
        CuerpoMail.Add('Correspondiente al documento: ' + _('Carta de consentimiento del uso de datos'));
        CuerpoMail.Add('------------------------------------------------------------');
        CuerpoMail.Add('This email has been sent from:');
        CuerpoMail.Add(UpperCase(REntorno.NombreEmpresa));
        CuerpoMail.Add('');
        CuerpoMail.Add('And contains the attached file ' + UpperCase(Archivo));
        CuerpoMail.Add('Corresponding to the document: ' + _('Carta de consentimiento del uso de datos'));

        if MedianteClienteCorreo then
           DMListados.SendMailTerceroPDF2(QMTerceros.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Carta de consentimiento del uso de datos'), 'TER', QMTerceros.FieldByName('TERCERO').AsInteger, MuestraCuerpo)
        else
           DMListados.SendMailTerceroPDF(QMTerceros.FieldByName('TERCERO').AsInteger, CuerpoMail, DameTempPath + Archivo, Archivo, _('Carta de consentimiento del uso de datos'), 'TER', QMTerceros.FieldByName('TERCERO').AsInteger, MuestraCuerpo);
     finally
        CuerpoMail.Free;
        CierraData(DMListados);
     end;
  end;
end;

procedure TDMTerceros2.CalculaIBAN;
var
  TituloForm : string;
  Faltan : integer;
begin
  /// Suponemos que el pais del banco es el mismo que el pais del tercero
  /// Solo recalculamos si IBAN vacío

  TituloForm := FMTerceros2.Caption;

  with QMTerceros do
  begin
     Last;
     Faltan := RecordCount;
     First;
     FMTerceros2.TSCuentas.Show;

     while not EOF do
     begin
        FMTerceros2.Caption := 'Faltan: ' + IntToStr(Faltan);
        with QMBancos do
        begin
           while not EOF do
           begin
              if (
                 (Trim(QMBancosENTIDAD.AsString + QMBancosSUCURSAL.AsString + QMBancosCONTROL.AsString + QMBancosCUENTA.AsString) > '') and
                 (Trim(QMBancosIBAN.AsString) = '')
                 ) then
              begin
                 Edit;

                 try
                    QMBancosIBAN.AsString := CalcularIBAN(DamePaisC2(xLoc_T.FieldByName('C_PAIS').AsString), Trim(QMBancosENTIDAD.AsString) + Trim(QMBancosSUCURSAL.AsString) + Trim(QMBancosCONTROL.AsString) + Trim(QMBancosCUENTA.AsString));
                    Post;
                 except
                    Cancel;
                 end;
              end;

              Next;
           end;
        end;

        Next;
        Dec(Faltan);
     end;
  end;

  FMTerceros2.Caption := TituloForm;
end;

procedure TDMTerceros2.QMDireccionesBeforeClose(DataSet: TDataSet);
begin
  xLoc_D.Close;
  xTipDir_D.Close;
end;

procedure TDMTerceros2.QMBancosAfterOpen(DataSet: TDataSet);
begin
  xBancos.Open;
end;

procedure TDMTerceros2.QMBancosBeforeClose(DataSet: TDataSet);
begin
  xBancos.Close;
end;

procedure TDMTerceros2.QMTercerosPAIS_TERCEROChange(Sender: TField);
begin
  // Si pais diferente de vacio asignamos el tipo de documento del pais por defecto
  if ((QMTerceros.State <> dsBrowse) and (QMTercerosPAIS_TERCERO.AsString > '')) then
  begin
     QMTercerosTIPO_DOC_IDENT.AsString := DMMain.DameTipoDocPaisDefecto(QMTercerosPAIS_TERCERO.AsString);
  end;
end;

function TDMTerceros2.VerificaExisteEnTercero(Tercero: integer; Tipo: string): boolean;
var
  Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm : boolean;
begin
  QueEs(QMTercerosTERCERO.AsInteger, Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm);

  Result := False;
  if (Tipo = 'CLI') then
     Result := Cliente
  else if (Tipo = 'PROV') then
     Result := Proveedor
  else if (Tipo = 'ACR') then
     Result := Acreedor
  else if (Tipo = 'AGE') then
     Result := Agente
  else if (Tipo = 'OPE') then
     Result := Empleado
  else if (Tipo = 'CRM') then
     Result := Crm;
end;

procedure TDMTerceros2.QMDireccionesAfterPost(DataSet: TDataSet);
begin
  Refrescar(QMDirecciones, 'DIRECCION', QMDireccionesDIRECCION.AsInteger);
end;

procedure TDMTerceros2.TransportistaSegunCP(CP: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ACREEDOR FROM CON_CUENTAS_GES_TAR_PORTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO=:EJERCICIO AND ');
        SQL.Add(' CANAL=:CANAL AND ');
        SQL.Add(' :CODIGO_POSTAL BETWEEN CODIGO_POSTAL_INI AND CODIGO_POSTAL_FIN ');
        SQL.Add(' ORDER BY ACREEDOR ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CODIGO_POSTAL'].AsString := CP;
        ExecQuery;
        QMDireccionesDIR_TRANSPORTISTA.AsInteger := FieldByName['ACREEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTerceros2.CreaUsuarioWeb(Tercero, Contacto, Direccion: integer; Nombre, email: string);
var
  Cliente, IdCliente : integer;
  Usuario : integer;
begin
  if (QMContactosID_USUARIO_WEB.AsInteger = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 CLIENTE, ID_CLIENTE ');
           SQL.Add(' FROM EMP_CLIENTES ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' TERCERO = :TERCERO ');
           SQL.Add(' ORDER BY CLIENTE ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['TERCERO'].AsInteger := Tercero;
           ExecQuery;
           Cliente := FieldByName['CLIENTE'].AsInteger;
           IdCliente := FieldByName['ID_CLIENTE'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Usuario para asociar al usuario web.
     // Si no esta definido, se toma el 1 que normalmente seria ADMIN.
     Usuario := StrToIntDef(LeeParametro('WEBCONT001'), 1);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO USUARIOS_WEB ( ');
           SQL.Add(' USUARIOID, CONTRASENYA, USUARIO, ID_CLIENTE_AGENTE, TERCERO, DIRECCION, CONTACTO, TIPO_USUARIO, EMAIL, NOMBRE, WEB_TARIFA, WEB_EMPRESA, WEB_CANAL, WEB_SERIE) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :USUARIOID, :CONTRASENYA, :USUARIO, :ID_CLIENTE_AGENTE, :TERCERO, :DIRECCION, :CONTACTO, :TIPO_USUARIO, :EMAIL, :NOMBRE, :WEB_TARIFA, :WEB_EMPRESA, :WEB_CANAL, :WEB_SERIE) ');

           Params.ByName['USUARIOID'].AsString := Format('C%.4d%.2d%.2d', [Cliente, Direccion, Contacto]);
           Params.ByName['CONTRASENYA'].AsString := CalcCRC32Str(Format('C%.4d%.2d%.2d', [Cliente, Direccion, Contacto]));
           Params.ByName['USUARIO'].AsInteger := Usuario;
           Params.ByName['ID_CLIENTE_AGENTE'].AsInteger := IdCliente;
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Params.ByName['DIRECCION'].AsInteger := Direccion;
           Params.ByName['CONTACTO'].AsInteger := Contacto;
           Params.ByName['TIPO_USUARIO'].AsInteger := 0;
           Params.ByName['EMAIL'].AsString := email;
           Params.ByName['NOMBRE'].AsString := Trim(Nombre);
           Params.ByName['WEB_TARIFA'].AsString := REntorno.TarifaDefecto;
           Params.ByName['WEB_EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['WEB_CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['WEB_SERIE'].AsString := REntorno.Serie;

           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     Refrescar(QMContactos, 'CONTACTO', QMContactosCONTACTO.AsInteger);
  end;
end;

procedure TDMTerceros2.FiltraUnTercero(Tercero: integer);
begin
  with QMTerceros do
  begin
     Close;
     SelectSQL.Assign(SQLBase);
     if (Tercero <> 0) then
        SelectSQL.Add(format(' WHERE TERCERO = %d', [Tercero]));
     SelectSQL.Add(' ORDER BY TERCERO ');
     QMTerceros.Open;
  end;
end;

procedure TDMTerceros2.QuitaFiltros;
begin
  with QMTerceros do
  begin
     Close;
     SelectSQL.Assign(SQLBase);
     SelectSQL.Add(' ORDER BY TERCERO ');
     QMTerceros.Open;
  end;
end;

procedure TDMTerceros2.QMTercerosBeforeClose(DataSet: TDataSet);
begin
  xRazones.Close;
  xLoc_T.Close;
  xTipDir_T.Close;
  QMComoNosConocieron.Close;
  xValidacionDoc.Close;
end;

end.
