unit UDMConfiguracionServidorCorreo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMConfiguracionServidorCorreo = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMConfiguracionCorreos: TDataSource;
     QMConfiguracionCorreos: TFIBTableSet;
     QMConfiguracionCorreosID: TIntegerField;
     QMConfiguracionCorreosEMPRESA: TIntegerField;
     QMConfiguracionCorreosDESCRIPCION: TFIBStringField;
     QMConfiguracionCorreosSERVIDOR_POP3: TFIBStringField;
     QMConfiguracionCorreosPUERTO_POP3: TIntegerField;
     QMConfiguracionCorreosUSUARIO_POP3: TFIBStringField;
     QMConfiguracionCorreosPASSWORD_POP3: TFIBStringField;
     QMConfiguracionCorreosSERVIDOR_SMTP: TFIBStringField;
     QMConfiguracionCorreosPUERTO_SMTP: TIntegerField;
     QMConfiguracionCorreosUSUARIO_SMTP: TFIBStringField;
     QMConfiguracionCorreosPASSWORD_SMTP: TFIBStringField;
     QMConfiguracionCorreosSMTP_AUTENTIFICAR: TIntegerField;
     QMConfiguracionCorreosSMTP_TSL: TIntegerField;
     QMConfiguracionCorreosDIR_CORREO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMConfiguracionCorreosNewRecord(DataSet: TDataSet);
     procedure QMConfiguracionCorreosBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMConfiguracionServidorCorreo : TDMConfiguracionServidorCorreo;

implementation

uses
  UDMMain, UEntorno;

{$R *.dfm}

procedure TDMConfiguracionServidorCorreo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMConfiguracionCorreos, '10000', True);
end;

procedure TDMConfiguracionServidorCorreo.QMConfiguracionCorreosNewRecord(DataSet: TDataSet);
begin
  QMConfiguracionCorreosEMPRESA.AsInteger := REntorno.Empresa;
  QMConfiguracionCorreosDESCRIPCION.AsString := '';

  QMConfiguracionCorreosDIR_CORREO.AsString := '';

  QMConfiguracionCorreosSERVIDOR_POP3.AsString := '';
  QMConfiguracionCorreosPUERTO_POP3.AsInteger := 0;
  QMConfiguracionCorreosUSUARIO_POP3.AsString := '';
  QMConfiguracionCorreosPASSWORD_POP3.AsString := '';

  QMConfiguracionCorreosSERVIDOR_SMTP.AsString := '';
  QMConfiguracionCorreosPUERTO_SMTP.AsInteger := 0;
  QMConfiguracionCorreosUSUARIO_SMTP.AsString := '';
  QMConfiguracionCorreosPASSWORD_SMTP.AsString := '';

  QMConfiguracionCorreosSMTP_AUTENTIFICAR.AsInteger := 0;
  QMConfiguracionCorreosSMTP_TSL.AsInteger := 0;
end;

procedure TDMConfiguracionServidorCorreo.QMConfiguracionCorreosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_CONF_SERV_CORREO', 'ID');
end;

end.
