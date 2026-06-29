unit UProDMReloj;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, DB, FIBDataSetRO, FIBQuery, HYFIBQuery,
  Windows, Messages, Variants, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, UFormGest, ExtCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Menus, rxPlacemnt, {IdGlobal,}
  UFPEdit, ULFDBEdit, ULFToolBar, DateUtils;

type
  TProDMReloj = class(TDataModule)
     xDescRecurso: TFIBDataSetRO;
     xDescRecursoTITULO: TFIBStringField;
     DSxDescRecurso: TDataSource;
     TLocal: THYTransaction;
     DSxRecursos: TDataSource;
     QMProDetMarca: TFIBTableSet;
     QMProDetMarcaEMPRESA: TIntegerField;
     QMProDetMarcaEJERCICIO: TIntegerField;
     QMProDetMarcaCANAL: TIntegerField;
     QMProDetMarcaSERIE: TFIBStringField;
     QMProDetMarcaTIPO: TFIBStringField;
     QMProDetMarcaRIG: TIntegerField;
     QMProDetMarcaLINEA: TIntegerField;
     QMProDetMarcaRIG_OF: TIntegerField;
     QMProDetMarcaSUBORDEN: TIntegerField;
     QMProDetMarcaLINEA_FASE: TIntegerField;
     QMProDetMarcaLINEA_TAREA: TIntegerField;
     QMProDetMarcaFECHA_PREV: TDateTimeField;
     QMProDetMarcaFECHA_REAL: TDateTimeField;
     QMProDetMarcaNUM_REF_SAL: TIntegerField;
     QMProDetMarcaHORA_INICIO: TFloatField;
     QMProDetMarcaHORA_FIN: TFloatField;
     QMProDetMarcaTIEMPO: TFloatField;
     QMProDetMarcaRECURSO: TFIBStringField;
     QMProDetMarcaPRECIO_RECURSO: TFloatField;
     QMProDetMarcaTIPO_RECURSO: TFIBStringField;
     QMProDetMarcaUNIDADES_FAB: TFloatField;
     QMProDetMarcaUNIDADES_DEFECTUOSAS: TFloatField;
     QMProDetMarcaESTADO: TIntegerField;
     QMProDetMarcaNOTAS: TMemoField;
     QMProDetMarcaTOTAL_RECURSO: TFloatField;
     QMProDetMarcaDescripFase: TStringField;
     QMProDetMarcaDescripTarea: TStringField;
     QMProDetMarcaDescripRec: TStringField;
     DSQMProDetMarca: TDataSource;
     xDescRecursoIMPORTE: TFloatField;
     QGeneral: THYFIBQuery;
     QMGeneral: TFIBDataSetRO;
     QRecogerIdTarea: THYFIBQuery;
     QComprobarDatos: THYFIBQuery;
     xHorario: TFIBDataSetRO;
     xOperario: TFIBDataSetRO;
     xOperarioEMPRESA: TIntegerField;
     xOperarioEMPLEADO: TIntegerField;
     xOperarioTERCERO: TIntegerField;
     xOperarioCATEGORIA: TFIBStringField;
     xOperarioCENTRO: TFIBStringField;
     xOperarioDEPARTAMENTO: TFIBStringField;
     xOperarioSECCION: TFIBStringField;
     xOperarioCALENDARIO: TIntegerField;
     xOperarioN_SEGURIDAD_SOCIAL: TFIBStringField;
     xOperarioTIPO_CONTRATO: TFIBStringField;
     xOperarioINI_CONTRATO: TDateTimeField;
     xOperarioFIN_CONTRATO: TDateTimeField;
     xOperarioFECHA_NACIMIENTO: TDateTimeField;
     xOperarioESTADO_CIVIL: TFIBStringField;
     xOperarioNOTAS: TBlobField;
     xOperarioIMAGEN: TMemoField;
     xOperarioCODIGO_TARJETA: TFIBStringField;
     xOperarioUSUARIO: TIntegerField;
     xOperarioRECURSO: TFIBStringField;
     xOperarioIMPUTACION: TIntegerField;
     xOperarioTIPOIMPUTACION: TIntegerField;
     xOperarioHORARIO: TFIBStringField;
     xNumLinea: TFIBDataSetRO;
     xUltimoJornada: TFIBDataSetRO;
     xUltimoJornadaFECHA: TDateTimeField;
     xUltimoJornadaRIG: TIntegerField;
     xUltimoJornadaLINEA: TIntegerField;
     xUltimoJornadaHORA_INICIO: TFloatField;
     xUltimoJornadaHORA_FIN: TFloatField;
     xConfigDet: TFIBDataSetRO;
     xConfigDetEMPRESA: TIntegerField;
     xConfigDetRIG: TIntegerField;
     xConfigDetLINEA: TIntegerField;
     xConfigDetORDEN: TIntegerField;
     xConfigDetCAMPO: TFIBStringField;
     xConfigDetLONG_INI: TIntegerField;
     xConfigDetLONG_FIN: TIntegerField;
     xConfigDetTABLA_FISICA: TFIBStringField;
     xConfigDetCAMPO_FISICO: TFIBStringField;
     xConfigDetTIPOMARC: TFIBStringField;
     xConfigCab: TFIBDataSetRO;
     xConfigCabEMPRESA: TIntegerField;
     xConfigCabRIG: TIntegerField;
     xConfigCabDESCRIPCION: TFIBStringField;
     xConfigCabNOTES: TMemoField;
     xConfigCabFECHA: TDateTimeField;
     xConfigCabRUTA: TFIBStringField;
     xConfigCabRUTAINC: TFIBStringField;
     xConfigCabRUTADEST: TFIBStringField;
     xConfigCabTIPOMARCAJE: TIntegerField;
     xRecursos: TFIBDataSetRO;
     xRecursosEMPRESA: TIntegerField;
     xRecursosRECURSO: TFIBStringField;
     xRecursosTITULO: TFIBStringField;
     xRecursosUNIDAD: TFIBStringField;
     xRecursosTIPORECURSO: TFIBStringField;
     xRecursosIMPORTE: TFloatField;
     xHorarioDia: TFIBDataSetRO;
     xHorarioDiaHORARIO: TFIBStringField;
     xHorarioHORARIO: TFIBStringField;
     xHorarioLINEA: TIntegerField;
     xHorarioTITULO: TFIBStringField;
     xHorarioHORA_INI: TFloatField;
     xHorarioHORA_FIN: TFloatField;
     xHorarioHORA_PRODUCTIVA: TIntegerField;
     xNumLineaNLINEA: TIntegerField;
     xConfigCabRUTACONFIG: TFIBStringField;
     xConfigCabTIPORECURSO: TFIBStringField;
     DSxConfigCab: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure xConfigCabAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     //Funciones de MarcajesPares y MarcajesJornada
     procedure SeleccionMarcajesYFecha;
     function SelecOpeMaq(Codigo, Tipo: string; var OpeMaq, Calendario: string): boolean;
     function EsLaboral(Data: TDateTime; Operario, Calendario, TipoM: string): boolean;
     function HayCabMarcaje(valorcampo, fecha, tipo: string; tipus: integer): boolean;
     function CreaCabMarcaje(valorcampo, tabla_fisica, campo_fisico, TipoM, fecha: string): integer;
     function RecogerDatosIdTarea(IDTarea: integer; var IdOrden, OrdenFab, LineaFase, LineaTarea, SubOrden: integer; var Recurso: string; var PrecioUni: real): boolean;

     //Funciones de marcajes por Jornada
     function LineaDetalle(Tipo: string; NumMarcaje: integer): integer;
     function BuscarUltimoMarcaje(NumOpeMaq, Tipo: string; var NumMarcaje, Linea: integer; var fecha: string; var hora_ini, hora_fin: real): boolean;
     procedure SelecHorario(OpeMaq: integer; TipoM: string; Fecha: TDateTime);
     procedure InsertarMarcaje(ColumnasInsertar, CamposInsertar: string; NumMarcaje, OrdenProd, Suborden, LineaFase, LineaTarea: integer; Recurso, TipoM: string; PrecioUni, HoraIni, HoraFin: real; Tiempo: string);
     procedure ActualizarMarcaje(CamposModificar, TipoM: string; NumMarcaje, Linea: integer);
  end;

var
  ProDMReloj : TProDMReloj;

implementation

uses UDMMain, UEntorno, UProFMReloj;

{$R *.dfm}

procedure TProDMReloj.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraRO(xRecursos, '10000');
end;

procedure TProDMReloj.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMReloj.xConfigCabAfterOpen(DataSet: TDataSet);
begin
  xConfigDet.Open;
end;

//FUNCIONES DE 'MARCAJES POR PARES' Y 'MARCAJES POR JORNADA'
//Este procedimiento selecciona, en el fichero, las posiciones en donde esta la fecha
//y los campos a insertar en la cabecera (operario, maquina, t.externo o varios)
procedure TProDMReloj.SeleccionMarcajesYFecha;
var
  n : integer;
begin
  n := 1;
  //Guardo los tipos de marcajes, en que posiciones de la tabla estan
  xConfigDet.First;
  while xConfigDet.EOF <> True do
  begin
     ProFMReloj.TipoMarcajes[n] := xConfigDetORDEN.AsString;
     Inc(n);
     xConfigDet.Next;
  end;

  //Seleccionamos la posicion del campo FECHA en la tabla de configuraciones.
  with QGeneral do
  begin
     Close;
     SQL.Clear;
     SQL.Add('select first(1) orden from pro_config_det_marca');
     SQL.Add('where empresa=:empresa and rig=:config and ');
     SQL.Add('tabla_fisica=''PRO_ORD_CAB_MARCA'' and campo_fisico=''FECHA''');
     SQL.Add('order by orden asc');
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Config'].AsInteger := ProFMReloj.Configuracion;
     ExecQuery;
     ProFMReloj.PosFecha := Fields[0].AsInteger;
     FreeHandle;
  end; //fi with
end;

function TProDMReloj.SelecOpeMaq(Codigo, Tipo: string; var OpeMaq, Calendario: string): boolean;
begin
  with QGeneral do
  begin
     Close;
     SQL.Clear;
     if (Tipo = 'MO') then
     begin //A partir del codigo de targeta, busco el número de operario
        SQL.Add('select empleado, calendario from ope_empleado');
        SQL.Add('where empresa=?empresa and codigo_tarjeta=?tarjeta');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TARJETA'].AsString := Codigo; //Codigo de tarjeta de operario
     end
     else if (Tipo = 'HM') then
     begin
        SQL.Add('select codmaq, calendario from pro_maquinas_c');
        SQL.Add('where empresa=?empresa and codmaq=?codmaq');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CODMAQ'].AsInteger := StrToInt(Codigo); //Codigo de maquina en numerico
     end;
     ExecQuery;
     OpeMaq := Fields[0].AsString;
     Calendario := Fields[1].AsString;
     FreeHandle;
  end;

  Result := (OpeMaq <> '');
end;

//Miro si hi ha algun registre amb aquesta data al calendari del treballador
function TProDMReloj.EsLaboral(Data: TDateTime; Operario, Calendario, TipoM: string): boolean;
begin
  with QMGeneral do
  begin
     Close;
     if (TipoM = 'MO') then
        SelectSQL.Text := 'select festivo,fecha from ope_empleado_cal ' +
           'where empresa=?empresa and empleado=?empleado and fecha=?fecha ' +
           'union ' +
           'select festivo,fecha from ope_calendario_d ' +
           'where empresa=?empresa and calendario=?calendario and fecha=?fecha'
     else if (TipoM = 'HM') then
        SelectSQL.Text := 'select festivo,fecha from ope_calendario_d ' +
           'where empresa=?empresa and calendario=?calendario and fecha=?fecha';
     Params.ByName['Empresa'].Value := REntorno.Empresa;
     if (TipoM = 'MO') then
        Params.ByName['Empleado'].Value := Operario;
     Params.ByName['Calendario'].Value := Calendario;
     Params.ByName['Fecha'].Value := Data;
     Open;
  end;

  if (QMGeneral.Fields[0].AsInteger <> 0) then
     EsLaboral := False
  else
     EsLaboral := True;
end;

//Comprobamos si existe el marcaje en alguna cabecera
function TProDMReloj.HayCabMarcaje(valorcampo, fecha, tipo: string; tipus: integer): boolean;
begin
  with QGeneral do
  begin
     Close;
     SQL.Clear;
     SQL.Add('select count(*) from pro_ord_cab_marca');
     SQL.Add('where empresa=:empresa and ejercicio=:ejercicio and canal=:canal and serie=:serie');
     if (tipus = 0) then //si és Marcaje per parelles, miraré la data
        SQL.Add('and tipo=:tipomarc and fecha=:fecha')
     else  //si és Marcaje per jornada, no miraré la data, només l'operari
        SQL.Add('and tipo=:tipomarc');
     if tipo = 'MO' then
        SQL.Add(' and operario=:opemaq')
     else if tipo = 'HM' then
        SQL.Add(' and maquina=:opemaq');

     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Params.ByName['TipoMarc'].AsString := tipo;
     Params.ByName['Opemaq'].AsInteger := StrToInt(valorcampo);
     if (tipus = 0) then
        Params.ByName['Fecha'].AsString := fecha;
     ExecQuery;
     Result := (Fields[0].AsInteger >= 1); //Si existe mas de un registro, sera TRUE
     FreeHandle;
  end;
end;

//Crea la cabecera del marcage para el operario/maquina...
function TProDMReloj.CreaCabMarcaje(valorcampo, tabla_fisica, campo_fisico, TipoM, fecha: string): integer;
begin
  with QGeneral do
  begin
     Close;
     SQL.Clear;
     SQL.Add('insert into ' + tabla_fisica + '(empresa,ejercicio,canal,serie,tipo,' +
        campo_fisico + ',fecha)');
     SQL.Add('values (' + REntorno.EmpresaStr + ',' + REntorno.EjercicioStr + ',' +
        REntorno.CanalStr + ',''' + REntorno.Serie + ''',''' + TipoM + ''',''' +
        valorcampo + ''',''' + fecha + ''')');
     ExecQuery;
     Transaction.CommitRetaining;
     FreeHandle;
  end;

  with QGeneral do
  begin
     Close;
     SQL.Clear;
     SQL.Add('select contador from emp_contadores_eecs');
     SQL.Add('where empresa=:empresa and ejercicio=:ejercicio and canal=:canal and serie=:serie and tipo=:tipo');
     Params.ByName['Empresa'].AsInteger := REntorno.empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Params.ByName['Tipo'].AsString := 'ZMA';
     ExecQuery;
     Transaction.CommitRetaining;
     Result := Fields[0].AsInteger;
     FreeHandle;
  end;
end;

//Nos recogerá los datos necesarios para la inserción del marcaje de la IDTarea determinada
//Nos recogerá la ordenf, linea_fase, linea_tarea, ... vinculada al IDTarea
function TProDMReloj.RecogerDatosIdTarea(IDTarea: integer; var IdOrden, OrdenFab, LineaFase, LineaTarea, SubOrden: integer; var Recurso: string; var PrecioUni: real): boolean;
var
  Estado : smallint;
begin
  OrdenFab := -99;

  //Miro si hay registros
  QGeneral.Close;
  QGeneral.SQL.Clear;
  QGeneral.SQL.Add('select count(*) from pro_ord_tarea');
  QGeneral.SQL.Add('where identificador=:idtarea');
  QGeneral.Params.ByName['idtarea'].AsInteger := IDTarea;
  QGeneral.ExecQuery;

  if (QGeneral.Fields[0].AsInteger > 0) then
  begin
     QRecogerIdTarea.Close;
     QRecogerIdTarea.Params.ByName['IdTarea'].AsInteger := IDTarea;
     QRecogerIdTarea.ExecQuery;

     IdOrden := QRecogerIdTarea.Fields[0].AsInteger;
     OrdenFab := QRecogerIdTarea.Fields[1].AsInteger;
     SubOrden := QRecogerIdTarea.Fields[2].AsInteger;
     LineaFase := QRecogerIdTarea.Fields[3].AsInteger;
     LineaTarea := QRecogerIdTarea.Fields[4].AsInteger;
     Recurso := QRecogerIdTarea.Fields[5].AsString;
     PrecioUni := QRecogerIdTarea.Fields[6].AsFloat;
     Estado := QRecogerIdTarea.Fields[7].AsInteger;
     Result := Estado <> 1;
  end
  else
     Result := False;
end;

function TProDMReloj.LineaDetalle(Tipo: string; NumMarcaje: integer): integer;
begin
  with xNumLinea do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Params.ByName['Tipo'].AsString := Tipo;
     Params.ByName['Rig'].AsInteger := NumMarcaje;
     Open;
  end;

  Result := xNumLineaNLINEA.AsInteger;
end;

//Aquest procediment servirà per Marcatge de Jornada. Li paso el número d'operari o maquina,
//les variables perque retorni el rig de capçalera i la hora final
function TProDMReloj.BuscarUltimoMarcaje(NumOpeMaq, Tipo: string; var NumMarcaje, Linea: integer; var fecha: string; var hora_ini, hora_fin: real): boolean;
var
  Data : TDateTime;
  any, mes, dia : word;
begin
  with QGeneral do
  begin
     Close;
     SQL.Clear;
     SQL.Add('execute procedure pro_marcaje_ultimo (?empresa, ?opemaq, ?tipo, ''MO'', ''HM'')' +
        ('returning_values :ult_fecha, :ult_rig_marcaje, :ult_linea, :hora_ini, :hora_fin;'));
     //Ordenamos la consulta al reves, para que nos muestre el ultimo marcaje
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['OpeMaq'].AsInteger := StrToInt(NumOpeMaq);
     Params.ByName['Tipo'].AsString := Tipo;
     ExecQuery;
     NumMarcaje := QGeneral.FieldByName['RIG_MARCAJE'].AsInteger;
     Linea := QGeneral.FieldByName['LINEA_MARCAJE'].AsInteger;
     hora_ini := QGeneral.FieldByName['HORA_INI'].AsFloat;
     hora_fin := QGeneral.FieldByName['HORA_FIN'].AsFloat;

     {TODO: Revisar tema de fecha. Devuelve en string. Porque no utiliza AsDatetime?}
     Data := StrToDateTime(QGeneral.FieldByName['FECHA'].AsString);
     DecodeDate(Data, any, mes, dia);
     fecha := IntToStr(dia) + '/' + IntToStr(mes) + '/' + IntToStr(any);
     Result := QGeneral.HayDatos;
     FreeHandle;
  end;

  //Si no hay algun marcaje con este operario o maquina, hora_inicio=-1 y hora_final=-1
  if (not Result) then
  begin
     NumMarcaje := -1;
     Linea := -1;
     hora_ini := -1;
     hora_fin := -1;
     fecha := '';
  end;
end;

procedure TProDMReloj.SelecHorario(OpeMaq: integer; TipoM: string; Fecha: TDateTime);
begin  //Selecciono l'horari de l'operari/maquina, per poder comparar les hores productives
  xHorarioDia.Close;
  if (TipoM = 'MO') then
     xHorarioDia.SelectSQL.Text :=
        'select * from ope_dame_horario_empleado (?empresa, ?opemaq, ?fecha)'
  else if (TipoM = 'HM') then
     xHorarioDia.SelectSQL.Text :=
        'select * from ope_dame_horario_maquina (?empresa, ?opemaq, ?fecha)';
  xHorarioDia.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
  xHorarioDia.Params.ByName['OpeMaq'].AsInteger := OpeMaq;
  xHorarioDia.Params.ByName['Fecha'].AsDateTime := Fecha;
  xHorarioDia.Open;

  xHorario.Close;
  xHorario.Params.ByName['Empresa'].AsInteger := REntorno.empresa;
  xHorario.Params.ByName['Horario'].AsString := xHorarioDiaHORARIO.AsString;
  xHorario.Open;
  xHorario.First;
end;

procedure TProDMReloj.InsertarMarcaje(ColumnasInsertar, CamposInsertar: string; NumMarcaje, OrdenProd, Suborden, LineaFase, LineaTarea: integer; Recurso, TipoM: string; PrecioUni, HoraIni, HoraFin: real; Tiempo: string);
begin
  with QGeneral do
  begin
     Close;
     SQL.Clear;
     SQL.Add('insert into pro_ord_det_marca (empresa,ejercicio,canal,serie,tipo,rig,linea,');
     SQL.Add('rig_of,suborden,linea_fase,linea_tarea,recurso,precio_recurso,');
     if (ColumnasInsertar <> '') and (CamposInsertar <> '') then
        SQL.Add('hora_inicio,hora_fin,tiempo,' + ColumnasInsertar + ')')
     else
        SQL.Add('hora_inicio,hora_fin,tiempo');
     SQL.Add('values (:empresa,:ejercicio,:canal,:serie,:tipo,:rig,:linea,:ordenprod,');
     SQL.Add(':suborden,:lineafase,:lineatarea,:recurso,:precio_rec,:horaini,:horafin,');
     if (ColumnasInsertar <> '') and (CamposInsertar <> '') then
        SQL.Add(Tiempo + ',' + CamposInsertar + ')')
     else
        SQL.Add(Tiempo + ')');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['TIPO'].AsString := TipoM;
     Params.ByName['RIG'].AsInteger := NumMarcaje;
     Params.ByName['LINEA'].AsInteger := LineaDetalle(TipoM, NumMarcaje) + 1;
     Params.ByName['ORDENPROD'].AsInteger := OrdenProd;
     Params.ByName['SUBORDEN'].AsInteger := Suborden;
     Params.ByName['LINEAFASE'].AsInteger := LineaFase;
     Params.ByName['LINEATAREA'].AsInteger := LineaTarea;
     Params.ByName['RECURSO'].AsString := Recurso;
     Params.ByName['PRECIO_REC'].AsFloat := PrecioUni;
     Params.ByName['HORAINI'].AsFloat := HoraIni;
     Params.ByName['HORAFIN'].AsFloat := HoraFin;
     ExecQuery;
  end;
end;

procedure TProDMReloj.ActualizarMarcaje(CamposModificar, TipoM: string; NumMarcaje, Linea: integer);
begin
  with QGeneral do
  begin
     Close;
     SQL.Clear;
     SQL.Add('update pro_ord_det_marca');
     SQL.Add(CamposModificar);
     SQL.Add('where empresa=:empresa and ejercicio=:ejercicio and canal=:canal and ' +
        ' serie=:serie and tipo=:tipo and rig=:rig and linea=:linea');
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Params.ByName['Tipo'].AsString := TipoM;
     Params.ByName['Rig'].AsInteger := NumMarcaje;
     Params.ByName['Linea'].AsInteger := Linea;
     ExecQuery;
     Transaction.CommitRetaining;
     FreeHandle;
  end;
end;

end.
