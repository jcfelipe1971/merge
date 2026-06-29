unit UDMDisenador;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDataSet, FIBDatabase, FIBQuery, FIBTableDataSet,
  UFIBModificados, FR_Class, Fr_HYReport, UHYReport, HYFIBQuery, FIBDataSetRO,
  UHYReportMail, frxClass, frxHYReport;

type
  TDMDisenador = class(TDataModule)
     DSQMListado: TDataSource;
     QMListado: TFIBTableSet;
     DSQMGrupo: TDataSource;
     QMGrupo: TFIBTableSet;
     TLocal: THYTransaction;
     QMGrupoGRUPO: TIntegerField;
     QMGrupoTITULO: TFIBStringField;
     QMGrupoLISTADODEF: TIntegerField;
     QMGrupoCOPIAS: TIntegerField;
     QMGrupoPIJAMA: TIntegerField;
     frListado: TfrHYReport;
     xListados: TFIBDataSetRO;
     DSxListados: TDataSource;
     xGrupos_EEC: TFIBDataSetRO;
     DSxGrupos_EEC: TDataSource;
     xGrupos_EECEMPRESA: TIntegerField;
     xGrupos_EECEJERCICIO: TIntegerField;
     xGrupos_EECCANAL: TIntegerField;
     xGrupos_EECGRUPO: TIntegerField;
     xGrupos_EECLISTADODEF: TIntegerField;
     QMListadoLISTADO: TIntegerField;
     QMListadoGRUPO: TIntegerField;
     QMListadoTITULO: TFIBStringField;
     QMListadoDEF_LISTADO: TBlobField;
     QMListadoEDITABLE: TIntegerField;
     QMListadoCABECERA: TIntegerField;
     QMListadoTIPO: TFIBStringField;
     HYReport: THYReport;
     QMListadosEECS: TFIBTableSet;
     DSQMListadosEECS: TDataSource;
     QMListadosEECSEMPRESA: TIntegerField;
     QMListadosEECSEJERCICIO: TIntegerField;
     QMListadosEECSCANAL: TIntegerField;
     QMListadosEECSSERIE: TFIBStringField;
     QMListadosEECSGRUPO: TIntegerField;
     QMListadosEECSLISTADODEF: TIntegerField;
     QMListadosEECSTITULO_SERIE: TFIBStringField;
     QMListadosEECSTITULO_LISTADO: TFIBStringField;
     QMGrupoLISTADODEFMAIL: TIntegerField;
     xGrupos_EECLISTADODEFMAIL: TIntegerField;
     QMListadosEECSLISTADODEFMAIL: TIntegerField;
     HYReportMail: THYReportMail;
     frxListado: TfrxHYReport;
     QExportadorLst: TFIBDataSetRO;
     QExportadorLstLISTADO: TIntegerField;
     QExportadorLstGRUPO: TIntegerField;
     QExportadorLstTITULO: TFIBStringField;
     QExportadorLstDEF_LISTADO: TBlobField;
     QExportadorLstEDITABLE: TIntegerField;
     QExportadorLstCABECERA: TIntegerField;
     QExportadorLstTIPO: TFIBStringField;
     TUpdate: THYTransaction;
     QMListadoIMPRESORA: TFIBStringField;
     xListadosLISTADO: TIntegerField;
     xListadosGRUPO: TIntegerField;
     xListadosTITULO: TFIBStringField;
     xListadosDEF_LISTADO: TBlobField;
     xListadosEDITABLE: TIntegerField;
     xListadosCABECERA: TIntegerField;
     xListadosTIPO: TFIBStringField;
     xListadosIMPRESORA: TFIBStringField;
     procedure DMDisenadorCreate(Sender: TObject);
     procedure QMListadoNewRecord(DataSet: TDataSet);
     procedure QMListadoCABECERAChange(Sender: TField);
     procedure QMListadoBeforePost(DataSet: TDataSet);
     procedure QMListadoBeforeDelete(DataSet: TDataSet);
     procedure QMGrupoAfterOpen(DataSet: TDataSet);
     procedure QMListadoAfterOpen(DataSet: TDataSet);
     procedure QMListadoDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMGrupoAfterScroll(DataSet: TDataSet);
     procedure QMListadosEECSBeforePost(DataSet: TDataSet);
     procedure QMListadosEECSNewRecord(DataSet: TDataSet);
     procedure QMListadosEECSSERIEChange(Sender: TField);
     procedure QMListadosEECSLISTADODEFChange(Sender: TField);
     procedure xAuxiliarAfterOpen(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     TipoListado: string;
     procedure GuardaInforme(Proforma: string);
     procedure Disenyar(Listado: integer; TipoListado: string);
     procedure ListadoDefecto;
     procedure ListadoDefectoEEC;
     procedure ListadoDefectoMail;
     procedure ListadoDefectoMailEEC;
     procedure BusquedaCompleja;
     procedure BusquedaDetalle;
     procedure BorraListadoDefectoEEC;
     procedure RefrescarListadoEECS;
     function GetTipoListado(Listado: integer): string;
     procedure SetTipoListado(Listado: integer);
     procedure CambiaDataSources;
     procedure ExportarListados;
     procedure ImportarListados;
     procedure GuardarFR3(Listado: integer; TipoListado: string);
     procedure RefrescarGrupo;
  end;

var
  DMDisenador : TDMDisenador;

implementation

uses UEntorno, UFormGest, UUtiles, UDMMain, UFBusca, UFSendCorreo, UDameDato;

{$R *.DFM}

procedure TDMDisenador.DMDisenadorCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  CambiaDataSources;
  QMGrupo.Open;
end;

procedure TDMDisenador.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMDisenador.Disenyar(Listado: integer; TipoListado: string);
var
  str : string;
  ModoEnter : integer;
begin
  if (TipoListado = 'FRF') then  // Listado FastReport
  begin
     frListado.LoadFromFIB(Listado, str);
     frListado.DesignReport;
  end;

  if (TipoListado = 'FR3') then  // Listado FastReport 3
  begin
     frxListado.LoadFromFIB(Listado, str);
     frxListado.DesignReport;
  end;

  if (TipoListado = 'HYR') then // Listado HYReport
  begin
     HYReport.ValorCodigo := Listado;
     ModoEnter := REntorno.ModoEnter;  // Guardar Modo Enter
     REntorno.ModoEnter := 0;
     HYReport.Edit;
     REntorno.ModoEnter := ModoEnter;  // Restaurar Modo Enter
  end;

  if (TipoListado = 'HYM') then
  begin
     HYReportMail.ValorCodigo := Listado;
     ModoEnter := REntorno.ModoEnter;  // Guardar Modo Enter
     REntorno.ModoEnter := 0;
     HYReportMail.Edit;
     REntorno.ModoEnter := ModoEnter;  // Restaurar Modo Enter
  end;
end;

procedure TDMDisenador.ListadoDefecto;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE L_CAMBIA_LISTADO_DEFECTO (:EMPRESA, :EJERCICIO, :CANAL, :GRUPO, :LISTADO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
        Params.ByName['LISTADO'].AsInteger := QMListadoLISTADO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescarGrupo;
end;

procedure TDMDisenador.ListadoDefectoMail;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE L_CAMBIA_LISTADO_DEFECTO_MAIL (:GRUPO, :LISTADO)';
        Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
        Params.ByName['LISTADO'].AsInteger := QMListadoLISTADO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescarGrupo;
end;

procedure TDMDisenador.ListadoDefectoEEC;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE L_CAMBIA_LISTADO_DEFECTO_EEC (?EMPRESA, :EJERCICIO, :CANAL, :GRUPO, :LISTADO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
        Params.ByName['LISTADO'].AsInteger := QMListadoLISTADO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xGrupos_EEC do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
     Open;
  end;
end;

procedure TDMDisenador.ListadoDefectoMailEEC;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE L_CAMBIA_LISTADO_DEFECTO_M_EEC (:EMPRESA, :EJERCICIO, :CANAL, :GRUPO, :LISTADO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
        Params.ByName['LISTADO'].AsInteger := QMListadoLISTADO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xGrupos_EEC do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
     Open;
  end;
end;

procedure TDMDisenador.BusquedaCompleja;
begin
  QMListado.Close;
  QMListado.SelectSQL.Text := 'SELECT * FROM DIC_LISTADOS where grupo=?grupo order by listado';
  TFBusca.Create(Self).SeleccionaBusqueda(QMGrupo, '00000', True);
  QMListado.Close;
  QMListado.Open;
  xlistados.Open;
end;

procedure TDMDisenador.BusquedaDetalle;
var
  Listado : integer;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMListado, '00000', False);
  QMGrupo.Close;
  QMGrupo.SelectSQL.Text := 'SELECT * FROM DIC_LISTADOS_GRUPOS order by grupo';
  QMGrupo.Open;
  if (QMListado.RecordCount > 0) then
  begin
     QMListado.Refresh;
     QMGrupoGRUPO.AsInteger := QMListadoGRUPO.AsInteger;
     QMGrupo.Refresh;
     Listado := QMListadoLISTADO.AsInteger;
     QMListado.Close;
     QMListado.SelectSQL.Text := 'SELECT * FROM DIC_LISTADOS where grupo=?grupo order by listado';
     QMListado.Open;
     QMListadoLISTADO.AsInteger := Listado;
     QMListado.Refresh;
  end;
end;

procedure TDMDisenador.QMListadoNewRecord(DataSet: TDataSet);
begin
  QMListadoGRUPO.AsInteger := QMGrupoGRUPO.AsInteger;
  QMListadoEDITABLE.AsInteger := 1;
  QMListadoCABECERA.AsInteger := 1000;
  QMListadoTIPO.AsString := 'FRF';
  TipoListado := 'FRF';
end;

procedure TDMDisenador.QMListadoCABECERAChange(Sender: TField);
begin
  xListados.Close;
  xListados.Open;
end;

procedure TDMDisenador.GuardaInforme(Proforma: string);
var
  Listado : integer;
  str, TipoListado : string;
begin
  if Proforma = 'FRF' then
     Listado := 1
  else if Proforma = 'HYR' then
     Listado := 2
  else if Proforma = 'HYM' then
     Listado := 3
  else if Proforma = 'FR3' then
     Listado := 4
  else
     Listado := StrToIntDef(Proforma, 1);

  TipoListado := GetTipoListado(Listado);
  if (TipoListado = 'FRF') then
  begin
     frListado.LoadFromFIB(Listado, str);
     frListado.Title := QMListadoTITULO.AsString;
     frListado.SaveToFIB(QMListadoLISTADO.AsInteger, QMGrupoGRUPO.AsInteger);
  end
  else if (TipoListado = 'FR3') then
  begin
     frxListado.LoadFromFIB(Listado, str);
     frxListado.ReportOptions.Name := QMListadoTITULO.AsString;
     frxListado.SaveToFIB(QMListadoLISTADO.AsInteger, QMGrupoGRUPO.AsInteger);
  end
  else if ((TipoListado = 'HYR') or (TipoListado = 'HYM')) then
  begin
     HYReport.LoadFromFIB(Listado, str);
     HYReport.Titulo := QMListadoTITULO.AsString;
     HYReport.WriteToFIB(QMListadoLISTADO.AsInteger, QMGrupoGRUPO.AsInteger);
  end;
end;

procedure TDMDisenador.QMListadoBeforePost(DataSet: TDataSet);
var
  Listado : integer;
begin
  if (QMListado.State = dsInsert) then
  begin
     if (QMListadoLISTADO.AsInteger = 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT MAX(LISTADO) FROM DIC_LISTADOS';
              ExecQuery;
              Listado := FieldByName['MAX'].AsInteger + 1;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Listado >= 2000) then
           QMListadoLISTADO.AsInteger := Listado
        else
           QMListadoLISTADO.AsInteger := 2000;
     end;

     QMListadoTIPO.AsString := TipoListado;
  end;
end;

procedure TDMDisenador.QMListadoBeforeDelete(DataSet: TDataSet);
begin
  if (QMListadoLISTADO.AsInteger < 2000) then

     raise Exception.Create(_('No se pueden eliminar listados del sistema'));
end;

procedure TDMDisenador.QMGrupoAfterOpen(DataSet: TDataSet);
begin
  QMListado.Open;
  with xGrupos_EEC do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
     Open;
  end;
  RefrescarListadoEECS;
end;

procedure TDMDisenador.QMListadoAfterOpen(DataSet: TDataSet);
begin
  xListados.Open;
end;

procedure TDMDisenador.QMListadoDeleteError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  QMListado.Cancel;
end;

procedure TDMDisenador.QMGrupoAfterScroll(DataSet: TDataSet);
begin
  with xGrupos_EEC do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
     Open;
  end;

  RefrescarListadoEECS;
end;

procedure TDMDisenador.BorraListadoDefectoEEC;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM DIC_LISTADOS_GRUPOS_EEC WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND GRUPO = :GRUPO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xGrupos_EEC do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
     Open;
  end;
end;

procedure TDMDisenador.RefrescarListadoEECS;
begin
  with QMListadosEECS do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
     Open;
  end;
end;

function TDMDisenador.GetTipoListado(Listado: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO, TIPO FROM DIC_LISTADOS WHERE LISTADO  =:LISTADO';
        Params.ByName['LISTADO'].AsInteger := Listado;
        ExecQuery;
        Result := FieldByName['TIPO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDisenador.SetTipoListado(Listado: integer);
begin
  TipoListado := GetTipoListado(Listado);
  QMListadoTIPO.AsString := TipoListado;
end;

procedure TDMDisenador.QMListadosEECSBeforePost(DataSet: TDataSet);
begin
  QMListadosEECSGRUPO.AsInteger := QMGrupoGRUPO.AsInteger;
end;

procedure TDMDisenador.QMListadosEECSNewRecord(DataSet: TDataSet);
begin
  QMListadosEECSEMPRESA.AsInteger := REntorno.Empresa;
  QMListadosEECSEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMListadosEECSCANAL.AsInteger := REntorno.Canal;
end;

procedure TDMDisenador.QMListadosEECSSERIEChange(Sender: TField);
begin
  QMListadosEECSTITULO_SERIE.AsString := DameTituloSerie(QMListadosEECSSERIE.AsString);
end;

procedure TDMDisenador.QMListadosEECSLISTADODEFChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM DIC_LISTADOS WHERE LISTADO = :LISTADO';
        Params.ByName['LISTADO'].AsInteger := QMListadosEECSLISTADODEF.AsInteger;
        ExecQuery;
        QMListadosEECSTITULO_LISTADO.AsString := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDisenador.xAuxiliarAfterOpen(DataSet: TDataSet);
begin
  QMListado.Open;

  with xGrupos_EEC do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['GRUPO'].AsInteger := QMGrupoGRUPO.AsInteger;
     Open;
  end;

  RefrescarListadoEECS;
end;

procedure TDMDisenador.CambiaDataSources;
begin
  QMGrupo.DataSource := nil;
  QMListado.DataSource := DSQMGrupo;
end;

procedure TDMDisenador.ExportarListados;

  function LimpiaCadena(s: string): string;
  begin
     /// funcion interna que limpia el caracter '\'
     Result := Trim(StringReplace(s, '\', '_', [rfReplaceAll]));
  end;

var
  Stream : TMemoryStream;
  f : TStream;
  Cadena, Ruta : string;
begin
  // Importante, el directorio debe estar creado
  Ruta := REntorno.ReportesReportSmith + 'Exportacion\';
  if not DirectoryExists(Ruta) then
     if not CreateDir(Ruta) then
        raise Exception.Create(Format(_('No se pudo crear la carpeta %s'), [Ruta]));

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Exportando Listados'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Exportando Listado a') + #13#10 + Ruta);

     with QExportadorLst do
     begin
        Close;
        Open;
        First;
        while not EOF do
        begin
           Cadena := Format('%5.5d-%5.5d %s', [QExportadorLstGRUPO.AsInteger, QExportadorLstLISTADO.AsInteger, QExportadorLstTITULO.AsString]);
           FSendCorreo.Texto(_('Exportando Listado a') + #13#10 + Ruta + #13#10 + Cadena);
           if not (QExportadorLstDEF_LISTADO.IsNull) then
           begin
              try
                 Stream := TMemoryStream.Create;
                 try
                    (QExportadorLstDEF_LISTADO as TBlobField).SaveToStream(Stream);
                    Stream.Position := 0;

                    if (QExportadorLstTIPO.AsString = 'FRF') then
                    begin
                       try
                          frListado.LoadFromStream(Stream);
                       except
                          ShowMessage(_('Fallo en la carga del Listado:') + ' ' + #13#10 + Cadena + #13#10 +
                             _('Se continuara con la exportación.'));
                       end;

                       try
                          frListado.SaveToFile(Ruta + LimpiaCadena(Cadena) + '.FRF');
                       except
                          ShowMessage(_('Fallo en la exportacion del Listado:') + ' ' + #13#10 + Cadena + #13#10 +
                             _('Se continuara con la exportación.'));
                       end;
                    end;

                    if (QExportadorLstTIPO.AsString = 'FR3') then
                    begin
                       try
                          frxListado.LoadFromStream(Stream);
                       except
                          ShowMessage(_('Fallo en la carga del Listado:') + #13#10 + Cadena + #13#10 +
                             _('Se continuara con la exportación.'));
                       end;

                       try
                          frxListado.SaveToFile(Ruta + LimpiaCadena(Cadena) + '.FR3');
                       except
                          ShowMessage(_('Fallo en la exportacion del Listado:') + #13#10 + Cadena + #13#10 +
                             _('Se continuara con la exportación.'));
                       end;
                    end;

                    if (QExportadorLstTIPO.AsString = 'HYR') then
                    begin
                       try
                          HYReport.LoadFromStream(Stream);
                       except
                          ShowMessage(_('Fallo en la carga del Listado:') + #13#10 + Cadena + #13#10 +
                             _('Se continuara con la exportación.'));
                       end;

                       try
                          HYReport.WriteToFile(Ruta + LimpiaCadena(Cadena) + '.HYR');
                       except
                          ShowMessage(_('Fallo en la exportacion del Listado:') + #13#10 + Cadena + #13#10 +
                             _('Se continuara con la exportación.'));
                       end;
                    end;

                    if (QExportadorLstTIPO.AsString = 'HYM') then
                    begin
                       Cadena := Format('%5.5d-%5.5d %s', [QExportadorLstGRUPO.AsInteger, QExportadorLstLISTADO.AsInteger, QExportadorLstTITULO.AsString]);
                       try
                          HYReportMail.LoadFromStream(Stream);
                       except
                          ShowMessage(_('Fallo en la carga del Listado:') + #13#10 + Cadena + #13#10 +
                             _('Se continuara con la exportación.'));
                       end;

                       try
                          HYReportMail.WriteToFile(Ruta + LimpiaCadena(Cadena) + '.HYM');
                       except
                          ShowMessage(_('Fallo en la exportacion del Listado:') + #13#10 + Cadena + #13#10 +
                             _('Se continuara con la exportación.'));
                       end;
                    end;

                    if (QExportadorLstTIPO.AsString = 'PHP') then
                    begin
                       Cadena := Format('%5.5d-%5.5d %s', [QExportadorLstGRUPO.AsInteger, QExportadorLstLISTADO.AsInteger, QExportadorLstTITULO.AsString]);

                       try
                          f := TFileStream.Create(Ruta + LimpiaCadena(Cadena) + '.PHP', fmCreate);
                          try
                             f.CopyFrom(Stream, Stream.Size);
                          finally
                             f.Free;
                          end;
                       except
                          ShowMessage(_('Fallo en la exportacion del Listado:') + #13#10 + Cadena + #13#10 +
                             _('Se continuara con la exportación.'));
                       end;
                    end;
                 finally
                    Stream.Free;
                 end;
              except
              end;
           end;
           Next;
        end; // while not eof
     end; // with QExportadorLst
     FSendCorreo.BitBtnOk.Visible := True;
     Application.ProcessMessages;
     FSendCorreo.Visible := False;
     FSendCorreo.SePuede := True;
     FSendCorreo.ShowModal;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

{ -Importador de listados-
 Formato para importar: '[Grupo]-[NumeroListado] [Titulo].[Formato]'

 NOTA: Los listados deben tener su registro creado correctamente en la base de datos.
}
procedure TDMDisenador.ImportarListados;

  procedure DameInformacionLst(CadenaOri: string; var Grupo, Listado: integer; var Titulo, Formato: string);
  var
     Cadena : string;
  begin
     Cadena := CadenaOri;
     while (Pos('\', Cadena) > 0) do
     begin
        Cadena := Copy(Cadena, Pos('\', Cadena) + 1, Length(Cadena));
     end;
     Cadena := Trim(Cadena);
     Grupo := StrToInt(Copy(Cadena, 1, Pos('-', Cadena) - 1));
     if (Pos(' ', Cadena) > 0) then
     begin
        Listado := StrToInt(Copy(Cadena, Pos('-', Cadena) + 1, Pos(' ', Copy(Cadena, Pos('-', Cadena) + 1, Length(Cadena))) - 1));
        Titulo := Copy(Cadena, Pos(' ', Cadena) + 1, Length(Cadena));
        Titulo := Copy(Titulo, 1, Length(Titulo) - 4);
     end
     else
     begin  // No tiene Titulo
        Titulo := Copy(cadena, Pos('-', Cadena) + Length(IntToStr(Grupo)), Length(cadena));
        Listado := StrToInt(Copy(Titulo, 1, Length(Titulo) - 4));
        Titulo := '';
     end;
     Formato := Copy(Cadena, Length(Cadena) - 2, Length(Cadena));
  end;

var
  Formato, Titulo : string;
  Archivos : TStrings;
  Listado, Grupo, Cont : integer;
  m, f : TStream;
begin
  Archivos := TStringList.Create;
  try
     with TOpenDialog.Create(nil) do
     begin
        try
           Filter := _('Todos las diseños|*.frf;*.fr3;*.hyr;*.hym|Fast Report 2.5 (*.frf)|*.frf|Fast Report 3 (*.fr3)|*.fr3|Matriciales (*.hyr)|*.hyr|Correo Electronico (*.hym)|*.hym|Listados PHP (*.php)|*.php');
           FilterIndex := 1;
           // Posicion inicial en Mis Documentos
           InitialDir := GetSpecialFolderPath(CSIDL_PERSONAL, False);
           Title := _('Carga de Diseños');
           Options := Options + [ofAllowMultiSelect];
           if (Execute) then
           begin
              Archivos.Clear;
              Archivos.AddStrings(Files);
           end;
        finally
           Free;
        end;
     end;

     try
        FSendCorreo := TFSendCorreo.Create(Self);

        Cont := 0;

        FSendCorreo.Caption := _('Importando Listados');
        FSendCorreo.Show;
        FSendCorreo.LTexto.Caption := _('Importando Listado');
        Application.ProcessMessages;

        while (Cont < Archivos.Count) do
        begin
           DameInformacionLst(Archivos[cont], Grupo, Listado, Titulo, Formato);

           FSendCorreo.LTexto.Caption := Format(_('Importando Listado %d de %d'), [Cont, archivos.Count]) + #13#10 +
              _('Grupo-Listado:') + ' ' + IntToStr(Grupo) + ' - ' + IntToStr(Listado) + #13#10 +
              _('Titulo:') + ' ' + Titulo;
           Application.ProcessMessages;

           if (UpperCase(formato) = 'FRF') then
           begin
              try
                 frListado.Clear;
                 frListado.LoadFromFile(Archivos[cont]);
                 frListado.Title := Titulo;
                 frListado.SaveToFIB(Listado, Grupo);
              except
                 ShowMessage(_('Error importando listado:') + #13#10 + IntToStr(Grupo) + '-' +
                    IntToStr(Listado) + '.' + Formato);
              end;
           end;
           if (UpperCase(Formato) = 'FR3') then
           begin
              try
                 frxListado.Clear;
                 frxListado.LoadFromFile(Archivos[Cont]);
                 frxListado.SaveToFIB(Listado, Grupo);
              except
                 ShowMessage(_('Error importando listado:') + #13#10 + IntToStr(Grupo) + '-' +
                    IntToStr(Listado) + '.' + Formato);
              end;
           end;
           if (UpperCase(formato) = 'HYR') then
           begin
              try
                 HYReport.ClearAll;
                 HYReport.LoadFromFile(Archivos[Cont]);
                 HYReport.Titulo := Titulo;
                 HYReport.WriteToFIB(Listado, Grupo);
              except
                 ShowMessage(_('Error importando listado:') + #13#10 + IntToStr(Grupo) + '-' +
                    IntToStr(Listado) + '.' + Formato);
              end;
           end;
           {
           if (upperCase(formato) = 'HYM') then begin   // No lo importa bien
            try
              HYReport.LoadFromFile(archivos[cont]);
              HYReport.Titulo := titulo;
              HYReport.WriteToFIB(listado,grupo);
            except
              showMessage ('Error importando listado: ' + #13#10 + IntToStr(grupo) + '-' +
                            IntToStr(listado) + '.' + formato);
            end;
           end;
           }
           if (UpperCase(formato) = 'PHP') then
           begin
              // Posiciono en Grupo+Listado
              try
                 Posicionar(QMGrupo, 'GRUPO', Grupo);
                 if (QMGrupoGRUPO.AsInteger = Grupo) then
                 begin
                    Posicionar(QMListado, 'LISTADO', Listado);
                    if (QMListadoLISTADO.AsInteger = Listado) then
                       QMListado.Edit
                    else
                       QMListado.Insert;

                    QMListadoLISTADO.AsInteger := Listado;
                    QMListadoGRUPO.AsInteger := Grupo;
                    QMListadoTITULO.AsString := Titulo;
                    QMListadoTIPO.AsString := 'PHP';
                    TipoListado := 'PHP';

                    m := QMListado.CreateBlobStream(QMListadoDEF_LISTADO, bmWrite);
                    try
                       f := TFileStream.Create(Archivos[cont], fmOpenRead);
                       try
                          m.CopyFrom(f, f.Size);
                       finally
                          f.Free;
                       end;
                    finally
                       m.Free;
                    end;

                    QMListado.Post;
                 end;
              except
                 ShowMessage(_('Error importando listado:') + #13#10 + IntToStr(Grupo) + '-' +
                    IntToStr(Listado) + '.' + Formato);
              end;
           end;

           Inc(cont);
        end; // fin while
        FSendCorreo.BitBtnOk.Visible := True;
        Application.ProcessMessages;
        FSendCorreo.Visible := False;
        FSendCorreo.SePuede := True;
        FSendCorreo.ShowModal;
     finally
        FSendCorreo.Free;
     end;
  finally
     Archivos.Free;
  end;
end;

procedure TDMDisenador.GuardarFR3(Listado: integer; TipoListado: string);
var
  str : string;
begin
  if (TipoListado = 'FRF') then  // Listado FastReport
  begin
     frListado.LoadFromFIB(Listado, str);
     frListado.SaveToFR3File('c:\Convertido.fr3');
     frxListado.LoadFromFile('c:\Convertido.fr3');
     frxListado.DesignReport;
  end;
end;

procedure TDMDisenador.RefrescarGrupo;
var
  Listado : integer;
begin
  Listado := QMListadoLISTADO.AsInteger;
  Refrescar(QMGrupo, 'GRUPO', QMGrupoGRUPO.AsInteger);
  Refrescar(QMListado, 'LISTADO', Listado);
end;

end.
