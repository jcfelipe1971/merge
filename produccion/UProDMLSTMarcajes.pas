unit UProDMLSTMarcajes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FR_DSet, FR_DBSet, FR_Class, DBTables, Fr_HYReport, FIBQuery,
  HYFIBQuery;

type
  TProDMLstMarcajes = class(TDataModule)
     TLocal: THYTransaction;
     QMGenerarLst: TFIBDataSetRO;
     DSGenerar: TDataSource;
     frDBMarcajes: TfrDBDataSet;
     frMarcajes: TfrHYReport;
     xMaquinaD: TFIBDataSetRO;
     DSxMaquinaD: TDataSource;
     xMaquinaH: TFIBDataSetRO;
     DSxMaquinaH: TDataSource;
     xProveedorD: TFIBDataSetRO;
     DSxProveedorD: TDataSource;
     xProveedorDTITULO: TFIBStringField;
     xProveedorH: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     DSxProveedorH: TDataSource;
     xRecursoD: TFIBDataSetRO;
     FIBStringField2: TFIBStringField;
     DSxRecursoD: TDataSource;
     xRecursoH: TFIBDataSetRO;
     FIBStringField3: TFIBStringField;
     DSxRecursoH: TDataSource;
     xMaquinaDDESCRIPCION: TFIBStringField;
     xMaquinaHDESCRIPCION: TFIBStringField;
     QMRecargar: THYFIBQuery;
     QIdTarea: THYFIBQuery;
     QMGenOpeFas: TFIBDataSetRO;
     DSGenOpeFas: TDataSource;
     frDBMarcaOpeFas: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frMarcajesGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     procedure RecargarDatos(const Resultado: string; Tipo: integer);
  public
     { Public declarations }
     operariomin: string;
     TFiltro: integer;
     procedure CambiaMaquinaD(maquina: integer);
     procedure CambiaMaquinaH(maquina: integer);
     procedure CambiaProveedorD(proveedor: integer);
     procedure CambiaProveedorH(proveedor: integer);
     procedure CambiaVariosD(recurso: string);
     procedure CambiaVariosH(recurso: string);
     procedure Recargar;
     procedure MostrarListado(tipolst, Modo: integer; min_fecha, max_fecha: TDateTime; min_operario, max_operario: integer; min_maquina, max_maquina, min_prov, max_prov: integer; min_var, max_var: string; min_fase, max_fase, min_tarea, max_tarea: string; TipoFiltro: string; fecha_listado: TDateTime; min_rigordre, max_rigordre, t_idtarea: integer; idtaread, idtareah: string; idorden_d, idorden_h: integer; compuestod, compuestoh: string);
     procedure GeneraSQL(Tipo: string; Orden: integer);
  end;

var
  ProDMLstMarcajes : TProDMLstMarcajes;

implementation

uses UDMMain, UDMListados, UEntorno, UFormGest, UProFMLstMarcajes, UUtiles;

{$R *.dfm}

procedure TProDMLstMarcajes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TProDMLstMarcajes.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDmLstMarcajes.CambiaMaquinaD(maquina: integer);
begin
  with xMaquinaD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['CodMaq'].AsInteger := maquina;
     Open;
  end;
end;

procedure TProDmLstMarcajes.CambiaMaquinaH(maquina: integer);
begin
  with xMaquinaH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['CodMaq'].AsInteger := maquina;
     Open;
  end;
end;

procedure TProDmLstMarcajes.CambiaProveedorD(proveedor: integer);
begin
  with xProveedorD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Proveedor'].AsInteger := proveedor;
     Open;
  end;
end;

procedure TProDmLstMarcajes.CambiaProveedorH(proveedor: integer);
begin
  with xProveedorH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Proveedor'].AsInteger := proveedor;
     Open;
  end;
end;

procedure TProDmLstMarcajes.CambiaVariosD(recurso: string);
begin
  with xRecursoD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Recurso'].AsString := recurso;
     Open;
  end;
end;

procedure TProDmLstMarcajes.CambiaVariosH(recurso: string);
begin
  with xRecursoH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Recurso'].AsString := recurso;
     Open;
  end;
end;

procedure TProDMLstMarcajes.MostrarListado(tipolst, Modo: integer; min_fecha, max_fecha: TDateTime; min_operario, max_operario: integer; min_maquina, max_maquina, min_prov, max_prov: integer; min_var, max_var: string; min_fase, max_fase, min_tarea, max_tarea: string; TipoFiltro: string; fecha_listado: TDateTime; min_rigordre, max_rigordre, t_idtarea: integer; idtaread, idtareah: string; idorden_d, idorden_h: integer; compuestod, compuestoh: string);
var
  str : string;
  Modul : TFIBDataSetRO;
begin
  min_fecha := HourIntoDate(Min_fecha, '00:00:00');
  max_fecha := HourIntoDate(Max_fecha, '23:59:59');

  DMListados.Normalizar_Desde_Hasta(min_fecha, max_fecha);

  if (tipolst = 16) then
     Modul := QMGenOpeFas
  else
     Modul := QMGenerarLst;

  with Modul do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := REntorno.Serie;
     Params.ByName['Tipo_Filtro'].AsString := TipoFiltro;
     Params.ByName['RigD'].AsInteger := min_rigordre;
     Params.ByName['RigH'].AsInteger := max_rigordre;
     Params.ByName['OperarioD'].AsInteger := min_operario;
     Params.ByName['OperarioH'].AsInteger := max_operario;
     Params.ByName['MaquinaD'].AsInteger := min_maquina;
     Params.ByName['MaquinaH'].AsInteger := max_maquina;
     Params.ByName['ProveedorD'].AsInteger := min_prov;
     Params.ByName['ProveedorH'].AsInteger := max_prov;
     Params.ByName['VariosD'].AsString := min_var;
     Params.ByName['VariosH'].AsString := max_var;
     Params.ByName['TipoFaseD'].AsString := min_fase;
     Params.ByName['TipoFaseH'].AsString := max_fase;
     Params.ByName['TipoTareaD'].AsString := min_tarea;
     Params.ByName['TipoTareaH'].AsString := max_tarea;
     Params.ByName['FechaD'].AsDateTime := min_fecha;
     Params.ByName['FechaH'].AsDateTime := max_fecha;
     Params.ByName['IDOrden_D'].AsInteger := idorden_d;
     Params.ByName['IDOrden_H'].AsInteger := idorden_h;
     Params.ByName['CompuestoD'].AsString := compuestod;
     Params.ByName['CompuestoH'].AsString := compuestoh;

     if (t_idtarea = 1) then
     begin
        Params.ByName['T_IDTarea'].AsInteger := t_idtarea;
        Params.ByName['IDTareaD'].AsInteger := StrToInt(idtaread);
        Params.ByName['IDTareaH'].AsInteger := StrToInt(idtareah);
     end
     else
     begin
        Params.ByName['T_IDTarea'].AsInteger := t_idtarea;
        Params.ByName['IDTareaD'].AsInteger := 0;
        Params.ByName['IDTareaH'].AsInteger := 0;
     end;

     Open;
  end;

  DMListados.Imprimir(8011 + tipolst, Modo, '', str, frMarcajes, nil);
end;

procedure TProDmLstMarcajes.Recargar;
var
  Min, Max : integer;
begin
  // Operario
  DameMinMax('EMP', Min, Max);
  ProFMLstMarcajes.EFOperarioD.Text := IntToStr(Min);
  ProFMLstMarcajes.EFOperarioH.Text := IntToStr(Max);

  // Proveedor
  DameMinMax('PRO', Min, Max);
  ProFMLstMarcajes.EFProveedorD.Text := IntToStr(Min);
  ProFMLstMarcajes.EFProveedorH.Text := IntToStr(Max);

  // Màquina
  RecargarDatos('MIN(CODMAQ) AS MIN_MAQ, MAX(CODMAQ) AS MAX_MAQ', 2);
  QMRecargar.ExecQuery;
  ProFMLstMarcajes.EFMaquinaD.Text := QMRecargar.FieldByName['MIN_MAQ'].AsString;
  ProFMLstMarcajes.EFMaquinaH.Text := QMRecargar.FieldByName['MAX_MAQ'].AsString;

  // Recursos
  RecargarDatos('MIN(RECURSO) AS MIN_RECURSO, MAX(RECURSO) AS MAX_RECURSO', 4);
  QMRecargar.ExecQuery;
  ProFMLstMarcajes.EFVariosD.Text := QMRecargar.FieldByName['MIN_RECURSO'].AsString;
  ProFMLstMarcajes.EFVariosH.Text := QMRecargar.FieldByName['MAX_RECURSO'].AsString;

  // ORDRES DE PRODUCCIÓ
  // RecargarDatos('MIN(RIG_OF) AS MIN_ORDEN, MAX(RIG_OF) AS MAX_ORDEN', 5);
  RecargarDatos('MIN(ID_ORDEN) AS MIN_ORDEN, MAX(ID_ORDEN) AS MAX_ORDEN', 5);
  QMRecargar.ExecQuery;
  ProFMLstMarcajes.EFOrdenD.Text := QMRecargar.FieldByName['MIN_ORDEN'].AsString;
  ProFMLstMarcajes.EFOrdenH.Text := QMRecargar.FieldByName['MAX_ORDEN'].AsString;
  ProFMLstMarcajes.EFOrdenMaqD.Text := QMRecargar.FieldByName['MIN_ORDEN'].AsString;
  ProFMLstMarcajes.EFOrdenMaqH.Text := QMRecargar.FieldByName['MAX_ORDEN'].AsString;
  ProFMLstMarcajes.EFOrdenProvD.Text := QMRecargar.FieldByName['MIN_ORDEN'].AsString;
  ProFMLstMarcajes.EFOrdenProvH.Text := QMRecargar.FieldByName['MAX_ORDEN'].AsString;
  ProFMLstMarcajes.EFOrdenVarD.Text := QMRecargar.FieldByName['MIN_ORDEN'].AsString;
  ProFMLstMarcajes.EFOrdenVarH.Text := QMRecargar.FieldByName['MAX_ORDEN'].AsString;

  // FASES
  RecargarDatos('MIN(FASE) AS MIN_FASE, MAX(FASE) AS MAX_FASE', 6);
  QMRecargar.ExecQuery;
  ProFMLstMarcajes.EFFaseD.Text := QMRecargar.FieldByName['MIN_Fase'].AsString;
  ProFMLstMarcajes.EFFaseH.Text := QMRecargar.FieldByName['MAX_Fase'].AsString;
  ProFMLstMarcajes.EFFaseMaqD.Text := QMRecargar.FieldByName['MIN_Fase'].AsString;
  ProFMLstMarcajes.EFFaseMaqH.Text := QMRecargar.FieldByName['MAX_Fase'].AsString;
  ProFMLstMarcajes.EFFaseProvD.Text := QMRecargar.FieldByName['MIN_Fase'].AsString;
  ProFMLstMarcajes.EFFaseProvH.Text := QMRecargar.FieldByName['MAX_Fase'].AsString;
  ProFMLstMarcajes.EFFaseVarD.Text := QMRecargar.FieldByName['MIN_Fase'].AsString;
  ProFMLstMarcajes.EFFaseVarH.Text := QMRecargar.FieldByName['MAX_Fase'].AsString;

  // TAREA
  RecargarDatos('MIN(TAREA) AS MIN_TAREA, MAX(TAREA) AS MAX_TAREA', 7);
  QMRecargar.ExecQuery;
  ProFMLstMarcajes.EFTareaD.Text := QMRecargar.FieldByName['MIN_Tarea'].AsString;
  ProFMLstMarcajes.EFTareaH.Text := QMRecargar.FieldByName['MAX_Tarea'].AsString;
  ProFMLstMarcajes.EFTareaMaqD.Text := QMRecargar.FieldByName['MIN_Tarea'].AsString;
  ProFMLstMarcajes.EFTareaMaqH.Text := QMRecargar.FieldByName['MAX_Tarea'].AsString;
  ProFMLstMarcajes.EFTareaProvD.Text := QMRecargar.FieldByName['MIN_Tarea'].AsString;
  ProFMLstMarcajes.EFTareaProvH.Text := QMRecargar.FieldByName['MAX_Tarea'].AsString;
  ProFMLstMarcajes.EFTareaVarD.Text := QMRecargar.FieldByName['MIN_Tarea'].AsString;
  ProFMLstMarcajes.EFTareaVarH.Text := QMRecargar.FieldByName['MAX_Tarea'].AsString;

  // COMPUESTO
  RecargarDatos('MIN(COMPUESTO) AS MIN_COMP, MAX(COMPUESTO) AS MAX_COMP', 8);
  QMRecargar.ExecQuery;
  ProFMLstMarcajes.LFCompuestoD.Text := QMRecargar.FieldByName['MIN_COMP'].AsString;
  ProFMLstMarcajes.LFCompuestoH.Text := QMRecargar.FieldByName['MAX_COMP'].AsString;
  ProFMLstMarcajes.LFCompuestoMaqD.Text := QMRecargar.FieldByName['MIN_COMP'].AsString;
  ProFMLstMarcajes.LFCompuestoMaqH.Text := QMRecargar.FieldByName['MAX_COMP'].AsString;
  ProFMLstMarcajes.LFCompuestoProvD.Text := QMRecargar.FieldByName['MIN_COMP'].AsString;
  ProFMLstMarcajes.LFCompuestoProvH.Text := QMRecargar.FieldByName['MAX_COMP'].AsString;
  ProFMLstMarcajes.LFCompuestoVarD.Text := QMRecargar.FieldByName['MIN_COMP'].AsString;
  ProFMLstMarcajes.LFCompuestoVarH.Text := QMRecargar.FieldByName['MAX_COMP'].AsString;
end;

procedure TProDmLstMarcajes.RecargarDatos(const Resultado: string; Tipo: integer);
begin
  case Tipo of
     2:
     begin
        with QMRecargar do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'SELECT ' + Resultado + ' ' + 'FROM PRO_MAQUINAS_C';
        end;
     end;
     4:
     begin
        with QMRecargar do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'SELECT ' + Resultado + ' ' + 'FROM PRO_RECURSOS';
        end;
     end;
     5:
     begin
        with QMRecargar do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'SELECT ' + Resultado + ' ' + 'FROM PRO_ORD';
        end;
     end;
     6:
     begin
        with QMRecargar do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'SELECT ' + Resultado + ' ' + 'FROM PRO_SYS_FASES';
        end;
     end;
     7:
     begin
        with QMRecargar do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'SELECT ' + Resultado + ' ' + 'FROM PRO_SYS_TAREAS';
        end;
     end;
     8:
     begin
        with QMRecargar do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'SELECT ' + Resultado + ' ' + 'FROM PRO_ORD';
        end;
     end;
  end;
end;

procedure TProDMLstMarcajes.frMarcajesGetValue(const ParName: string; var ParValue: variant);
begin
  if Trim(ParName) = 'Comentario' then
     ParValue := Profmlstmarcajes.EComentario.Text;
  if Trim(ParName) = 'FechaListado' then
     ParValue := ProFMlstMarcajes.TDPFechaListado.Date;
  if Trim(ParName) = 'Orden' then
     ParValue := ProFMlstMarcajes.CBOrden.Items[ProFMlstMarcajes.CBOrden.ItemIndex];

  if (TFiltro = 1) then // Por Operario
  begin
     if Trim(ParName) = 'Filtro' then
        ParValue := _('Desde Operario: ') + ProFMLstMarcajes.EFOperarioD.Text +
           _(' Hasta Operario: ') + ProFMLstMarcajes.EFOperarioH.Text + _(' Desde Fecha: ') +
           DateToStr(ProFMLstMarcajes.DTFechaD.Date) + _(' Hasta Fecha: ') +
           DateToStr(ProFMLstMarcajes.DTFechaH.Date);
  end;
  if (TFiltro = 2) then // Por Maquina
  begin
     if Trim(ParName) = 'Filtro' then
        ParValue := _('Desde Máquina: ') + ProFMLstMarcajes.EFMaquinaD.Text +
           _(' Hasta Máquina: ') + ProFMLstMarcajes.EFMaquinaH.Text + _(' Desde Fecha: ') +
           DateToStr(ProFMLstMarcajes.DTFechaD.Date) + _(' Hasta Fecha: ') +
           DateToStr(ProFMLstMarcajes.DTFechaH.Date);
  end;
  if (TFiltro = 3) then // Por Proveedor
  begin
     if Trim(ParName) = 'Filtro' then
        ParValue := _('Desde Proveedor: ') + ProFMLstMarcajes.EFProveedorD.Text +
           _(' Hasta Proveedor: ') + ProFMLstMarcajes.EFProveedorH.Text +
           _(' Desde Fecha: ') + DateToStr(ProFMLstMarcajes.DTFechaD.Date) +
           _(' Hasta Fecha: ') + DateToStr(ProFMLstMarcajes.DTFechaH.Date);
  end;
  if (TFiltro = 4) then // Por Recurso
  begin
     if Trim(ParName) = 'Filtro' then
        ParValue := _('Desde Recurso: ') + ProFMLstMarcajes.EFVariosD.Text +
           _(' Hasta Recurso: ') + ProFMLstMarcajes.EFVariosD.Text + _(' Desde Fecha: ') +
           DateToStr(ProFMLstMarcajes.DTFechaD.Date) + _(' Hasta Fecha: ') +
           DateToStr(ProFMLstMarcajes.DTFechaH.Date);
  end;
end;

procedure TProDMLstMarcajes.GeneraSQL(Tipo: string; Orden: integer);
begin
  with QMGenerarLst do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM PRO_LST_MARCAJES(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO_FILTRO, ');
     SelectSQL.Add(' ?RIGD, ?RIGH, ?OPERARIOD, ?OPERARIOH, ?MAQUINAD, ?MAQUINAH, ?PROVEEDORD, ?PROVEEDORH, ');
     SelectSQL.Add(' ?VARIOSD, ?VARIOSH, ?TIPOFASED, ?TIPOFASEH, ?TIPOTAREAD, ?TIPOTAREAH, ?FECHAD, ?FECHAH, ');
     SelectSQL.Add(' ?T_IDTAREA, ?IDTAREAD, ?IDTAREAH, ?IDORDEN_D, ?IDORDEN_H, ?COMPUESTOD, ?COMPUESTOH) ');

     if (Tipo = 'OPE') then
     begin
        if (Orden = 0) then
           SelectSQL.Add('ORDER BY V_OPERARIO, V_DET_RIG_OF, V_DET_TIPOFASE, V_CAB_FECHA ');
        if (Orden = 1) then
           SelectSQL.Add('ORDER BY V_CAB_FECHA, V_OPERARIO, V_DET_RIG_OF, V_DET_TIPOFASE ');
        {
        if (Orden = 2) then // Ordre per data
           SelectSQL.Add(' ORDER BY V_DET_TIPOFASE ');
        if (Orden = 3) then // Ordre per data
           SelectSQL.Add(' ORDER BY V_DET_TIPOTAREA ');
        }
     end;

     if (Tipo = 'MAQ') then
     begin
        if (Orden = 0) then
           SelectSQL.Add(' ORDER BY V_MAQUINA, V_CAB_FECHA, V_IDTAREA ');
        if (Orden = 1) then
           SelectSQL.Add(' ORDER BY V_CAB_FECHA, V_MAQUINA, V_IDTAREA ');
        {
        if (Orden = 2) then // Ordre per operari i ordre
           SelectSQL.Add(' ORDER BY V_DET_TIPOFASE ');
        if (Orden = 3) then // Ordre per operari i ordre
           SelectSQL.Add(' ORDER BY V_DET_TIPOTAREA ');
        }
     end;

     if (Tipo = 'TRA') then
     begin
        if (Orden = 0) then
           SelectSQL.Add(' ORDER BY V_TEXTERN, V_DET_RIG_OF, V_CAB_FECHA ');
        if (Orden = 1) then
           SelectSQL.Add(' ORDER BY V_CAB_FECHA, V_TEXTERN, V_DET_RIG_OF ');
        {
        if (Orden = 2) then // Ordre per operari i ordre
           SelectSQL.Add(' ORDER BY V_DET_TIPOFASE ');
        if (Orden = 3) then // Ordre per operari i ordre
           SelectSQL.Add(' ORDER BY V_DET_TIPOTAREA ');
        }
     end;

     if (Tipo = 'VAR') then
     begin
        if (Orden = 0) then
           SelectSQL.Add(' ORDER BY V_VARIOS, V_DET_RIG_OF, V_CAB_FECHA ');
        if (Orden = 1) then
           SelectSQL.Add(' ORDER BY V_CAB_FECHA, V_VARIOS, V_DET_RIG_OF ');
        {
        if (Orden = 2) then // Ordre per operari i ordre
           SelectSQL.Add(' ORDER BY V_DET_TIPOFASE ');
        if (Orden = 3) then // Ordre per operari i ordre
           SelectSQL.Add(' ORDER BY V_DET_TIPOTAREA ');
        }
     end;
  end;
end;

end.
