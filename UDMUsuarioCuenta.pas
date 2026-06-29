unit UDMUsuarioCuenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSet;

type
  TDMUsuarioCuenta = class(TDataModule)
     QMUsuario: TFIBTableSet;
     DSQMUsuario: TDataSource;
     TLocal: THYTransaction;
     QMUsuarioUSUARIO: TIntegerField;
     QMUsuarioNOMBRE: TFIBStringField;
     QMUsuarioCLAVE: TFIBStringField;
     QMUsuarioNIVEL: TIntegerField;
     QMUsuarioEMPRESA: TIntegerField;
     QMUsuarioCANAL: TIntegerField;
     QMUsuarioEJERCICIO: TIntegerField;
     QMUsuarioICONOS_SIMPLES: TIntegerField;
     QMUsuarioFECHA_TRABAJO: TDateTimeField;
     QMUsuarioMEMORIZAR_FECHA: TIntegerField;
     QMUsuarioLENGUA: TFIBStringField;
     QMUsuarioACTIVO: TIntegerField;
     QMUsuarioMENU_LEFT: TIntegerField;
     QMUsuarioMENU_TOP: TIntegerField;
     QMUsuarioPERFIL: TIntegerField;
     QMUsuarioMODO_CIERRA_FORM: TIntegerField;
     QMUsuarioMODO_ENTER: TIntegerField;
     QMUsuarioCOLOR_NAV_ACTIVO: TFloatField;
     QMUsuarioCOLOR_NAV_INACTIVO: TFloatField;
     QMUsuarioCOLOR_MENU_1_ON: TFloatField;
     QMUsuarioCOLOR_MENU_1_OFF: TFloatField;
     QMUsuarioCOLOR_MENU_2_ON: TFloatField;
     QMUsuarioCOLOR_MENU_2_OFF: TFloatField;
     QMUsuarioNOMBRE_CORREO: TFIBStringField;
     QMUsuarioDIR_CORREO: TFIBStringField;
     QMUsuarioCOLOR_ENLACE_ACTIVO: TFloatField;
     QMUsuarioAGENTE: TIntegerField;
     QMUsuarioMODIFICA_DOC: TIntegerField;
     QMUsuarioCUENTA_NUNCA_CADUCA: TIntegerField;
     QMUsuarioCUENTA_DESHABILITADA: TIntegerField;
     QMUsuarioFECHA_CAMBIO_PASSW: TDateTimeField;
     QMUsuarioDIAS_CADUCIDAD: TIntegerField;
     TUpdate: THYTransaction;
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMUsuarioBeforeEdit(DataSet: TDataSet);
     procedure QMUsuarioBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     // Variables que determinan si han habido cambios
     clave_old, nombre_correo_old, dir_correo_old: string;
  public
     { Public declarations }
     ClaveOld: string;
     ClaveCaducada: boolean;
     procedure FiltraUsuario(Usuario: integer);
  end;

var
  DMUsuarioCuenta : TDMUsuarioCuenta;

implementation

{$R *.DFM}

uses UEntorno, UDMMain;

procedure TDMUsuarioCuenta.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMUsuarioCuenta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMUsuarioCuenta.FiltraUsuario(Usuario: integer);
begin
  // Abrimos en estado de edición
  with QMUsuario do
  begin
     Close;
     Params.ByName['Usuario'].AsInteger := Usuario;
     Open;
     Edit;
  end;

  ClaveOld := QMUsuarioCLAVE.AsString;
  if (DMUsuarioCuenta.QMUsuarioCUENTA_NUNCA_CADUCA.AsInteger = 0) and
     (REntorno.FechaTrab >= (DMUsuarioCuenta.QMUsuarioFECHA_CAMBIO_PASSW.AsDateTime +
     DMUsuarioCuenta.QMUsuarioDIAS_CADUCIDAD.AsInteger)) then
     ClaveCaducada := True
  else
     ClaveCaducada := False;
end;

procedure TDMUsuarioCuenta.QMUsuarioBeforeEdit(DataSet: TDataSet);
begin
  // Guardamos valores antiguos
  clave_old := QMUsuarioCLAVE.AsString;
  nombre_correo_old := QMUsuarioNOMBRE_CORREO.AsString;
  dir_correo_old := QMUsuarioDIR_CORREO.AsString;
end;

procedure TDMUsuarioCuenta.QMUsuarioBeforePost(DataSet: TDataSet);
begin
  // Si estamos en modo de edición y han habido cambios
  // guardamos los mismos y modificamos fecha último cambio.
  if (QMUsuario.State = dsEdit) then
     if (QMUsuarioCLAVE.AsString <> clave_old) or
        (QMUsuarioNOMBRE_CORREO.AsString <> nombre_correo_old) or
        (QMUsuarioDIR_CORREO.AsString <> dir_correo_old) then
     begin
        if (QMUsuarioCLAVE.AsString <> clave_old) then
           QMUsuarioFECHA_CAMBIO_PASSW.AsDateTime := REntorno.FechaTrab;
        if (QMUsuarioCLAVE.AsString <> clave_old) then
           REntorno.Clave := QMUsuarioCLAVE.AsString;
     end;
end;

end.
