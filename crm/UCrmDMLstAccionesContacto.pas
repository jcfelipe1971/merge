unit UCrmDMLstAccionesContacto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, HYFIBQuery;

type
  TCrmDMLstAccContactos = class(TDataModule)
     TLocal: THYTransaction;
     frListadoAcc: TfrHYReport;
     frDBListadoContacto: TfrDBDataSet;
     QMLstContacto: TFIBDataSetRO;
     DSLstContacto: TDataSource;
     DSLstAcciones: TDataSource;
     frDBLisradoAcciones: TfrDBDataSet;
     QMLstAcciones: TFIBDataSetRO;
     xContacto: TFIBDataSetRO;
     DSxContacto: TDataSource;
     xZonaDefault: TFIBDataSetRO;
     DSxZonaDefault: TDataSource;
     DSLstPersonas: TDataSource;
     QMLstPersonas: TFIBDataSetRO;
     frDBListadoPersonas: TfrDBDataSet;
     xAmbitoDefault: TFIBDataSetRO;
     DSxAmbitoDefault: TDataSource;
     xAmbito: TFIBDataSetRO;
     DSxAmbito: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoAccGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     comentario_lst, fecha_lst: string;
     procedure Obrir_Taules(contacto_ini, contacto_fin, ambito: integer; fecha_ini, fecha_fin: TDateTime; zona, pais: string; check_zona, check_ambito, check_poblacion, check_pais: boolean);
  public
     { Public declarations }
     procedure MostrarListado(contacto_ini, contacto_fin, ambito: integer; fecha_ini, fecha_fin, fecha_listado: TDateTime; comentario: string; modo, grupo: integer; zona, pais: string; check_zona, check_ambito, check_poblacion, check_pais: boolean);
     procedure Recargar;
  end;

var
  CrmDMLstAccContactos : TCrmDMLstAccContactos;

implementation

uses UDMMain, UDMListados, UFormGest, UUtiles, UEntorno;

{$R *.dfm}

procedure TCrmDMLstAccContactos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TCrmDMLstAccContactos.MostrarListado(contacto_ini, contacto_fin, ambito: integer; fecha_ini, fecha_fin, fecha_listado: TDateTime; comentario: string; modo, grupo: integer; zona, pais: string; check_zona, check_ambito, check_poblacion, check_pais: boolean);
var
  str : string;
begin
  Fecha_Ini := HourIntoDate(Fecha_Ini, '00:00:00');
  Fecha_Fin := HourIntoDate(Fecha_Fin, '23:59:59');
  DMListados.Normalizar_Desde_Hasta(Fecha_Ini, Fecha_Fin);

  comentario_lst := comentario;
  fecha_lst := DateToStr(fecha_listado);

  Obrir_Taules(contacto_ini, contacto_fin, ambito, fecha_ini, fecha_fin, zona, pais, check_zona, check_ambito, check_poblacion, check_pais);

  DMListados.Imprimir(grupo, modo, '', str, frListadoAcc, nil);
end;

procedure TCrmDMLstAccContactos.Obrir_Taules(contacto_ini, contacto_fin, ambito: integer; fecha_ini, fecha_fin: TDateTime; zona, pais: string; check_zona, check_ambito, check_poblacion, check_pais: boolean);
begin
  with QMLstContacto do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' select * from crm_contactos contact ');

     if (check_ambito) then
     begin
        SelectSQL.Add(' left join crm_ambitos_contacto ambito ');
        SelectSQL.Add(' on contact.id_contacto = ambito.id_crm_contacto ');
     end;
     if (check_poblacion) then
     begin
        SelectSQL.Add(' left join sys_localidades loca ');
        SelectSQL.Add(' on contact.dir_localidad = loca.localidad ');
     end;
     // WHERE
     SelectSQL.Add(' where ');
     SelectSQL.Add(' contact.id_contacto>=?contacto_ini and contact.id_contacto<=?contacto_fin ');
     if (check_zona) then
        SelectSQL.Add(' and ( contact.zona=?zona ) ');
     if (check_ambito) then
        SelectSQL.Add(' and ( ambito.id_crm_ambito=?ambito ) ');
     if (check_pais) then
        SelectSQL.Add(' and ( contact.pais=?pais ) ');
     // ORDER
     if (check_poblacion) then
        SelectSQL.Add(' order by loca.titulo, contact.nombre_comercial ASC')
     else
        SelectSQL.Add(' order by contact.nombre_comercial ASC');

     Params.ByName['contacto_ini'].AsInteger := contacto_ini;
     Params.ByName['contacto_fin'].AsInteger := contacto_fin;
     if (check_zona) then
        Params.ByName['zona'].AsString := zona;
     if (check_ambito) then
        Params.ByName['ambito'].AsInteger := ambito;
     if (check_pais) then
        Params.ByName['pais'].AsString := pais;

     Open;
  end;

  // QMLstAcciones.Close;
  // QMLstAcciones.Params.ByName['contacto_ini'].AsInteger:=QMLstContactoID_CONTACTO.AsInteger;
  // QMLstAcciones.Params.ByName['contacto_fin'].AsInteger:=QMLstContactoID_CONTACTO.AsInteger;
  // QMLstAcciones.Params.ByName['fecha_ini'].AsDateTime :=fecha_ini;
  // QMLstAcciones.Params.ByName['fecha_fin'].AsDateTime :=fecha_fin;
  // QMLstAcciones.Open;
end;

procedure TCrmDMLstAccContactos.frListadoAccGetValue(const ParName: string; var ParValue: variant);
begin
  if (ParName = 'Empresa') then
     ParValue := REntorno.NombreEmpresa;

  if (ParName = 'Titol') then
     ParValue := _('LISTADO ACCIONES POR CLIENTE');

  if (ParName = 'FechaListado') then
     ParValue := fecha_lst;

  if (ParName = 'Comentario') then
     ParValue := comentario_lst;

  if (ParName = 'Localidad') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select titulo from sys_localidades where id_local=?id_local';
           Params.ByName['id_local'].AsInteger := QMLstContacto.FieldByName('ID_LOCAL').AsInteger;
           ExecQuery;
           ParValue := FieldByName['titulo'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TCrmDMLstAccContactos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TCrmDMLstAccContactos.Recargar;
begin
  xContacto.Close;
  xContacto.Open;

  xZonaDefault.Close;
  xZonaDefault.Open;

  xAmbitoDefault.Close;
  xAmbitoDefault.Open;
end;

end.
