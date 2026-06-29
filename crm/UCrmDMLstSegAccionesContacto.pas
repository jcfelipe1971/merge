unit UCrmDMLstSegAccionesContacto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, HYFIBQuery;

type
  TCrmDMLstSegAccContactos = class(TDataModule)
     TLocal: THYTransaction;
     frListadoAccSeg: TfrHYReport;
     frDBListadoContacto: TfrDBDataSet;
     QMLstContacto: TFIBDataSetRO;
     DSLstContacto: TDataSource;
     DSLstAcciones: TDataSource;
     frDBListadoAcciones: TfrDBDataSet;
     QMLstAcciones: TFIBDataSetRO;
     DSLstAccDet: TDataSource;
     QMLstAccionesDet: TFIBDataSetRO;
     frDBListadoAccDet: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoAccSegGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     procedure Obrir_Taules(contacto_ini, contacto_fin, accion_ini, accion_fin: integer; tipo_accion_ini, tipo_accion_fin: string; fecha_ini, fecha_fin: TDateTime);
  public
     { Public declarations }
     procedure MostrarListado(contacto_ini, contacto_fin, accion_ini, accion_fin: integer; tipo_accion_ini, tipo_accion_fin: string; fecha_ini, fecha_fin, FechaListado: TDateTime; Comentario: string; Modo, Grupo: integer);
     procedure DameMinMaxAccion(var Desde, Hasta: integer; var DesdeTipo, HastaTipo: string);
  end;

var
  CrmDMLstSegAccContactos : TCrmDMLstSegAccContactos;

implementation

uses UDMMain, UDMListados, UFormGest, UUtiles, UEntorno;

{$R *.dfm}

procedure TCrmDMLstSegAccContactos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TCrmDMLstSegAccContactos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TCrmDMLstSegAccContactos.MostrarListado(contacto_ini, contacto_fin, accion_ini, accion_fin: integer; tipo_accion_ini, tipo_accion_fin: string; fecha_ini, fecha_fin, FechaListado: TDateTime; Comentario: string; Modo, Grupo: integer);
begin
  DMListados.DatosInforme(FechaListado, Comentario);

  Obrir_Taules(contacto_ini, contacto_fin, accion_ini, accion_fin, tipo_accion_ini, tipo_accion_fin, fecha_ini, fecha_fin);

  DMListados.Imprimir(Grupo, Modo, '', '', frListadoAccSeg, nil);
end;

procedure TCrmDMLstSegAccContactos.Obrir_Taules(contacto_ini, contacto_fin, accion_ini, accion_fin: integer; tipo_accion_ini, tipo_accion_fin: string; fecha_ini, fecha_fin: TDateTime);
begin
  with QMLstContacto do
  begin
     Close;
     Params.ByName['CONTACTO_INI'].AsInteger := contacto_ini;
     Params.ByName['CONTACTO_FIN'].AsInteger := contacto_fin;
     Open;
  end;

  with QMLstAcciones do
  begin
     Close;
     // Params.ByName['ID_CONTACTO'].AsInteger := contacto_ini;
     Params.ByName['FECHA_INI'].AsDateTime := fecha_ini;
     Params.ByName['FECHA_FIN'].AsDateTime := fecha_fin;
     Params.ByName['ACCION_INI'].AsInteger := accion_ini;
     Params.ByName['ACCION_FIN'].AsInteger := accion_fin;
     Params.ByName['TIPO_ACCION_INI'].AsString := tipo_accion_ini;
     Params.ByName['TIPO_ACCION_FIN'].AsString := tipo_accion_fin;
     Open;
  end;

  QMLstAccionesDet.Close;
  QMLstAccionesDet.Open;
end;

procedure TCrmDMLstSegAccContactos.frListadoAccSegGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Titol') then
     ParValue := _('LISTADO ACCIONES POR CLIENTE');
end;

procedure TCrmDMLstSegAccContactos.DameMinMaxAccion(var Desde, Hasta: integer; var DesdeTipo, HastaTipo: string);
begin
  /// Obtener el mínimo y el máximo ID de accion

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(ID), MAX(ID) ');
        SQL.Add(' FROM CRM_ACCIONES ');
        ExecQuery;
        Desde := FieldByName['MIN'].AsInteger;
        Hasta := FieldByName['MAX'].AsInteger;
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
        SQL.Add(' SELECT MIN(ACCION), MAX(ACCION) ');
        SQL.Add(' FROM CRM_SYS_ACCIONES ');
        ExecQuery;
        DesdeTipo := FieldByName['MIN'].AsString;
        HastaTipo := FieldByName['MAX'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
