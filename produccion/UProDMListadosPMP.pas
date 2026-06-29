unit UProDMListadosPMP;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBDataSet;

type
  TProDMListadosPMP = class(TDataModule)
     TLocal: THYTransaction;
     SPListadoPMP: TFIBDataSetRO;
     DSSPListadoPMP: TDataSource;
     frDBLstPmp: TfrDBDataSet;
     frListadoPMPMat: TfrHYReport;
     frListadoPMPMaq: TfrHYReport;
     frListadoPMP: TfrHYReport;
     frListadoPMPEti: TfrHYReport;
     xLstEtiquetas: TFIBDataSetRO;
     DSxLstEtiquetas: TDataSource;
     frDBLstEtiPMP: TfrDBDataSet;
     xLstTareasEti: TFIBDataSetRO;
     DSxTareasEti: TDataSource;
     frDBLstTareasEti: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoPMPMatGetValue(const ParName: string; var ParValue: variant);
     procedure xLstEtiquetasAfterOpen(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     TipoTarea: string;
     IdPlanificacion: integer;
  public
     { Public declarations }
     Tarea, Operario, Comentario: string;
     Planificacion: integer;
     procedure MostrarListado(Modo, Tipo, aIdPlanificacion: integer; aTipoTarea: string; Filtro, Copias_pmp: integer);
  end;

var
  ProDMListadosPMP : TProDMListadosPMP;

implementation

uses UDMMain, UDMListados, UFormGest, UEntorno;

{$R *.dfm}

{ TProDMListadosPMP }

procedure TProDMListadosPMP.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TProDMListadosPMP.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMListadosPMP.MostrarListado(Modo, Tipo, aIdPlanificacion: integer; aTipoTarea: string; Filtro, Copias_pmp: integer);
begin
  TipoTarea := aTipoTarea;
  IdPlanificacion := aIdPlanificacion;

  if (Tipo = 0) then // Ficha
  begin
     with SPListadoPMP do
     begin
        Close;
        Params.ByName['TIPO_TAREA'].AsString := aTipoTarea;
        Params.ByName['ID_PLANIFICACION'].AsInteger := aIdPlanificacion;
        Params.ByName['FILTRO'].AsInteger := Filtro;
        // Params.ByName['SERIE'].AsString := REntorno.Serie;
        Open;
     end;

     case Filtro of
        0: // Ninguno
           DMListados.Imprimir(9911, Modo, '', '', frListadoPMP, nil); // Listado PMP
        1: //Material
           DMListados.Imprimir(9909, Modo, '', '', frListadoPMPMat, nil); // Listado PMP -Materiales-
        2: //Maquinas
           DMListados.Imprimir(9910, Modo, '', '', frListadoPMPMaq, nil); // Listado PMP -Maquinas-
     end;
  end
  else
  if (Tipo = 1) then // Etiquetes
  begin
     with xLstEtiquetas do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['PLANIFICACION'].AsInteger := aIdPlanificacion;
        Open;
     end;

     DMListados.Imprimir(9912, Modo, '', '', frListadoPMPEti, nil); // Listado PMP -Etiquetas-
  end;
end;

procedure TProDMListadosPMP.frListadoPMPMatGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Planificacion') then
     ParValue := Planificacion;

  if (ParName = 'Tarea') then
     ParValue := Tarea;

  if (ParName = 'Operario') then
     ParValue := Operario;

  if (ParName = 'Comentario') then
     ParValue := Comentario;

  if (ParName = 'Fecha_entrega') then
     if (xLstEtiquetas.FieldByName('FECHA_ENTREGA').AsDateTime = 0) then
        ParValue := ''
     else
        ParValue := xLstEtiquetas.FieldByName('FECHA_ENTREGA').AsDateTime;

  if (ParName = 'Suma_Tiempo_Total') then
  begin
     (*
      { SQL:
            select sum(tar.tiempo) from pro_ord op
            join pro_ord_tarea tar
            on op.id_orden=tar.id_orden
            join pro_sys_tareas tipo_tar
            on tipo_tar.empresa=tar.empresa and tipo_tar.tarea=tar.tipotarea
            where
            op.empresa = ?empresa and
            op.canal = ?canal and
            op.ejercicio =?.ejercicio and
            op.series = ?serie and
            op.id_planificacion = ?d_planificacion and
            tar.tipotarea = ?tipo_tarea
      }
      with xSumaTotal do
      begin
         Close;
         Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
         Params.ByName['CANAL'].AsInteger := REntorno.Canal;
         Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
         Params.ByName['SERIE'].AsString := REntorno.Serie;
         Params.ByName['ID_PLANIFICACION'].AsInteger := id_planificacion_g;
         Params.ByName['TIPO_TAREA'].AsString := tipo_tarea_g;
         Open;
      end;
      ParValue := xSumaTotalSUM.AsFloat;
      *)
  end;
end;

procedure TProDMListadosPMP.xLstEtiquetasAfterOpen(DataSet: TDataSet);
begin
  xLstTareasEti.Close;
  xLstTareasEti.Open;
end;

end.
