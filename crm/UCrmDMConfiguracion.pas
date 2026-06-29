unit UCrmDMConfiguracion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  Graphics, ExtCtrls, Math;

type
  TCrmDMConfiguracion = class(TDataModule)
     TLocal: THYTransaction;
     xTAcciones: TFIBDataSetRO;
     DSxTAcciones: TDataSource;
     QMCrmConfig: TFIBTableSet;
     DSQMCrmConfig: TDataSource;
     QMCrmConfigID: TIntegerField;
     QMCrmConfigCRM_TIPO_LETRA: TFIBStringField;
     QMCrmConfigCRM_TAMANO_LETRA: TIntegerField;
     QMCrmConfigCRM_AUTO_ACCION: TIntegerField;
     QMCrmConfigCRM_ACCION_DEFECTO: TFIBStringField;
     QMCrmConfigCRM_AVISOS: TIntegerField;
     QMCrmConfigHTML_CONTACTO: TBlobField;
     QMCrmConfigHTML_CONTACTOS: TBlobField;
     QMCrmConfigHTML_CLIENTE: TBlobField;
     QMCrmConfigHTML_EMPRESA: TBlobField;
     QMCrmConfigLOGO_CRM: TBlobField;
     QMCrmConfigIMAGEN: TBlobField;
     QMCrmConfigFORMATO: TFIBStringField;
     QMCrmConfigOrigen: TIntegerField;
     QMCrmConfigCRM_IP_IMPRESORA: TFIBStringField;
     QMCrmConfigCRM_NOMBRE_IMPRESORA: TFIBStringField;
     QMCrmConfigCRM_NOMBRE: TFIBStringField;
     QMCrmConfigCRM_CIUDAD: TFIBStringField;
     QMCrmConfigCRM_PROVINCIA: TFIBStringField;
     QMCrmConfigCRM_CP: TFIBStringField;
     QMCrmConfigCRM_PAIS: TFIBStringField;
     QMCrmConfigCRM_TELEFONO: TFIBStringField;
     QMCrmConfigCRM_DIRECCION: TFIBStringField;
     QMCrmConfigCRM_DIRECCION_AMPLIADA: TBlobField;
     QMCrmConfigCRM_EMAIL: TFIBStringField;
     QMCrmConfigCRM_WEB: TFIBStringField;
     QMCrmConfigCRM_FAX: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCrmConfigAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure EscribirValor(valor, campo: string);
     procedure LeeDatos(var crm_tamany_letra: integer; var crm_tipo_letra: string; var crm_auto_accion, crm_avisos: integer; var crm_accion_defecto: string);
     procedure CargarImagen(const FileName: string; Formato: string);
  end;

var
  CrmDMConfiguracion : TCrmDMConfiguracion;

implementation

uses UDMMain;

{$R *.dfm}

procedure TCrmDMConfiguracion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCrmConfig.Close;
  QMCrmConfig.Open;
end;

// sfg.albert - no es fa servir. S'ha posat navegador
procedure TCrmDMConfiguracion.LeeDatos(var crm_tamany_letra: integer; var crm_tipo_letra: string; var crm_auto_accion, crm_avisos: integer; var crm_accion_defecto: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CRM_TIPO_LETRA, CRM_TAMANO_LETRA, CRM_AUTO_ACCION, CRM_ACCION_DEFECTO FROM CRM_CONFIGURACION';
        ExecQuery;
        crm_tipo_letra := FieldByName['CRM_TIPO_LETRA'].AsString;
        crm_tamany_letra := FieldByName['CRM_TAMANO_LETRA'].AsInteger;
        crm_auto_accion := FieldByName['CRM_AUTO_ACCION'].AsInteger;
        crm_accion_defecto := FieldByName['CRM_ACCION_DEFECTO'].AsString;
        crm_avisos := FieldByName['CRM_AVISOS'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// sfg.albert - no es fa servir. S'ha posat navegador
procedure TCrmDMConfiguracion.EscribirValor(Valor, Campo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE CRM_CONFIGURACION SET ' + Campo + ' = :VALOR';
        ExecQuery;
        Params.ByName['VALOR'].Value := Valor;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMConfiguracion.CargarImagen(const FileName: string; Formato: string);
var
  m, f : TStream;
  HacerPost : boolean;
begin
  if (not (QMCRMConfig.State in [dsInsert, dsEdit])) then
  begin
     QMCRMConfig.Edit;
     HacerPost := True;
  end
  else
     HacerPost := False;

  QMCRMConfigFORMATO.AsString := Formato;

  m := QMCRMConfig.CreateBlobStream(QMCRMConfigIMAGEN, bmWrite);
  try
     f := TFileStream.Create(FileName, fmOpenRead);
     try
        m.CopyFrom(f, f.Size);
     finally
        f.Free;
     end;
  finally
     m.Free;
  end;

  if HacerPost then
     QMCRMConfig.Post;
end;

procedure TCrmDMConfiguracion.QMCrmConfigAfterScroll(DataSet: TDataSet);
begin
  QMCrmConfigOrigen.AsInteger := 0;
end;

end.
