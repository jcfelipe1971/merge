unit UDMSiiConfiguracionCorreo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, FIBTableDataSet;

type
  TDMSiiConfiguracionCorreo = class(TDataModule)
     QMSiiConfguracionCorreos: TFIBTableSet;
     DSQMSiiConfguracionCorreos: TDataSource;
     TLocal: TFIBTransaction;
     TUpdate: TFIBTransaction;
     QMSiiConfguracionCorreosEMPRESA: TIntegerField;
     QMSiiConfguracionCorreosVENTAS_SERVIDOR_POP3: TFIBStringField;
     QMSiiConfguracionCorreosVENTAS_PUERTO_POP3: TIntegerField;
     QMSiiConfguracionCorreosVENTAS_USUARIO_POP3: TFIBStringField;
     QMSiiConfguracionCorreosVENTAS_PASSWORD_POP3: TFIBStringField;
     QMSiiConfguracionCorreosVENTAS_SERVIDOR_SMTP: TFIBStringField;
     QMSiiConfguracionCorreosVENTAS_PUERTO_SMTP: TIntegerField;
     QMSiiConfguracionCorreosVENTAS_USUARIO_SMTP: TFIBStringField;
     QMSiiConfguracionCorreosVENTAS_PASSWORD_SMTP: TFIBStringField;
     QMSiiConfguracionCorreosCOMPRAS_SERVIDOR_POP3: TFIBStringField;
     QMSiiConfguracionCorreosCOMPRAS_PUERTO_POP3: TIntegerField;
     QMSiiConfguracionCorreosCOMPRAS_USUARIO_POP3: TFIBStringField;
     QMSiiConfguracionCorreosCOMPRAS_PASSWORD_POP3: TFIBStringField;
     QMSiiConfguracionCorreosCOMPRAS_SERVIDOR_SMTP: TFIBStringField;
     QMSiiConfguracionCorreosCOMPRAS_PUERTO_SMTP: TIntegerField;
     QMSiiConfguracionCorreosCOMPRAS_USUARIO_SMTP: TFIBStringField;
     QMSiiConfguracionCorreosCOMPRAS_PASSWORD_SMTP: TFIBStringField;
     QMSiiConfguracionCorreosVENTAS_SMTP_AUTENTIFICAR: TIntegerField;
     QMSiiConfguracionCorreosVENTAS_SMTP_TSL: TIntegerField;
     QMSiiConfguracionCorreosVENTAS_DIR_CORREO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMSiiConfguracionCorreosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMSiiConfiguracionCorreo : TDMSiiConfiguracionCorreo;

implementation

uses
  UDMMain, UEntorno;

{$R *.dfm}

procedure TDMSiiConfiguracionCorreo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMSiiConfguracionCorreos, '10000', True);
end;

procedure TDMSiiConfiguracionCorreo.QMSiiConfguracionCorreosNewRecord(DataSet: TDataSet);
begin
  QMSiiConfguracionCorreosEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
