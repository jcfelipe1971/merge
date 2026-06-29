unit UProDMMaquinas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_DSet,
  FR_DBSet, FR_Class, Fr_HYReport, FIBDataSetRO;

type
  TProDMMaquinas = class(TDataModule)
     QMMaquinasC: TFIBTableSet;
     DSQMMaquinasC: TDataSource;
     TLocal: THYTransaction;
     QMMaquinasCCODMAQ: TIntegerField;
     QMMaquinasCCODIDE: TFIBStringField;
     QMMaquinasCFECHA_COMPRA: TDateTimeField;
     QMMaquinasCFABRICANTE: TFIBStringField;
     QMMaquinasCNSERIE: TFIBStringField;
     QMMaquinasCDESCRIPCION: TFIBStringField;
     QMMaquinasCSECCION: TFIBStringField;
     QMMaquinasCOBSERVACION: TBlobField;
     QMMaquinasCEMPRESA: TIntegerField;
     QMMaquinasCDescTipo: TStringField;
     QMMaquinasD: TFIBTableSet;
     DSQMMaquinasD: TDataSource;
     QMMaquinasDEMPRESA: TIntegerField;
     QMMaquinasDCODMAQ: TIntegerField;
     QMMaquinasDLINEA: TIntegerField;
     QMMaquinasDFECHA_REVISION: TDateTimeField;
     QMMaquinasDFECHA_PROXIMA: TDateTimeField;
     QMMaquinasDRESULTADO: TFIBStringField;
     QMMaquinasDLABORATORIO: TFIBStringField;
     QMMaquinasCDescSECCION: TStringField;
     QMMaquinasCFRECUENCIA: TIntegerField;
     QMMaquinasCCERTIFICACION: TIntegerField;
     QMMaquinasCFECHA_CERT: TDateTimeField;
     QMMaquinasDREVISADO: TIntegerField;
     QMMaquinasRep: TFIBTableSet;
     DSQMMaquinasRep: TDataSource;
     frHYMaquinas: TfrHYReport;
     frDBQMMaquinasD: TfrDBDataSet;
     QMMaquinasRepCODMAQ: TIntegerField;
     QMMaquinasRepLINEA: TIntegerField;
     QMMaquinasRepFECHA_DETECCION: TDateTimeField;
     QMMaquinasRepFECHA_REPARACION: TDateTimeField;
     QMMaquinasRepDESCRIPCION: TFIBStringField;
     QMMaquinasRepCOMENTARIO: TFIBStringField;
     QMMaquinasRepLABORATORIO: TFIBStringField;
     QMMaquinasRepCOSTE_REP: TFloatField;
     QMMaquinasRepEMPRESA: TIntegerField;
     QMMaquinasCTIPO: TFIBStringField;
     QMMaquinasCRECURSO: TFIBStringField;
     QMMaquinasCCALENDARIO: TIntegerField;
     QMMaquinasCHORARIO: TFIBStringField;
     xTipo: TFIBDataSetRO;
     xSeccion: TFIBDataSetRO;
     xTipoEMPRESA: TIntegerField;
     xTipoTIPO: TFIBStringField;
     xTipoDESCRIPCION: TFIBStringField;
     xSeccionEMPRESA: TIntegerField;
     xSeccionSECCION: TFIBStringField;
     xSeccionDESCRIPCION: TFIBStringField;
     QMMaquinasCID_MAQUINA: TIntegerField;
     QMMaquinasDDENOMINACION: TFIBStringField;
     QMMaquinasDFRECUENCIA: TIntegerField;
     QMMaquinasDNOTAS: TMemoField;
     QMMaquinasDFECHA_PREVISTA_REVISION: TDateTimeField;
     QMMaquinasDID_REVISION: TIntegerField;
     QMMaquinasCID_IMAGEN: TIntegerField;
     frLstMaqRevision: TfrHYReport;
     frDBMaqRevision: TfrDBDataSet;
     xLstMaqRevision: TFIBDataSetRO;
     DSxLstMaqRevision: TDataSource;
     xLstMaqRevisionCODMAQ: TIntegerField;
     xLstMaqRevisionEMPRESA: TIntegerField;
     xLstMaqRevisionCODMAQ1: TIntegerField;
     xLstMaqRevisionLINEA: TIntegerField;
     xLstMaqRevisionFECHA_REVISION: TDateTimeField;
     xLstMaqRevisionFECHA_PROXIMA: TDateTimeField;
     xLstMaqRevisionRESULTADO: TFIBStringField;
     xLstMaqRevisionLABORATORIO: TFIBStringField;
     xLstMaqRevisionREVISADO: TIntegerField;
     xLstMaqRevisionDENOMINACION: TFIBStringField;
     xLstMaqRevisionFRECUENCIA: TIntegerField;
     xLstMaqRevisionNOTAS: TMemoField;
     xLstMaqRevisionFECHA_PREVISTA_REVISION: TDateTimeField;
     xLstMaqRevisionID_REVISION: TIntegerField;
     xLstMaqRevisionEMPRESA1: TIntegerField;
     xLstMaqRevisionID: TIntegerField;
     xLstMaqRevisionDENOMINACION1: TFIBStringField;
     xLstMaqRevisionTIPO_REVISION: TFIBStringField;
     xLstMaqRevisionFRECUENCIA1: TIntegerField;
     xLstMaqRevisionNOTAS1: TBlobField;
     xLstMaqRevisionRESPONSABLE: TIntegerField;
     QMMaquinasDCOSTE_REV: TFloatField;
     QMMaquinasRepNOTAS: TMemoField;
     frDBMaquinasRep: TfrDBDataSet;
     TUpdate: THYTransaction;
     xCola: TFIBTableSet;
     DSxCola: TDataSource;
     xColaEMPRESA: TIntegerField;
     xColaMAQUINA: TIntegerField;
     xColaORDEN_COLA_MAQUINA: TIntegerField;
     xColaPRODUCIENDO: TIntegerField;
     xColaID_ORDEN: TIntegerField;
     xColaEJERCICIO: TIntegerField;
     xColaCANAL: TIntegerField;
     xColaRIG_OF: TIntegerField;
     xColaLINEA_FASE: TIntegerField;
     xColaLINEA_TAREA: TIntegerField;
     xColaTAREA: TFIBStringField;
     xColaTIPOTAREA: TFIBStringField;
     xColaCOMENTARIO: TMemoField;
     xColaRECURSO: TFIBStringField;
     xColaCANTIDAD: TFloatField;
     xColaESTADO: TIntegerField;
     xColaID_UTILLAJE: TFIBStringField;
     xColaDESC_UTILLAJE: TFIBStringField;
     xColaSECCION: TFIBStringField;
     xColaSITUACION: TIntegerField;
     xColaFECHA_ENTREGA: TDateTimeField;
     xColaIDENTIFICADOR: TIntegerField;
     xColaCOMPUESTO: TFIBStringField;
     xColaTITULO: TFIBStringField;
     xColaUNIDADES: TFloatField;
     xColaUNIDADES_PEND: TFloatField;
     xColaID_HOJA_TRABAJO: TIntegerField;
     xColaHOJA_TRABAJO_VISIBLE: TIntegerField;
     xColaHOJA_TRABAJO_FINALIZADO: TIntegerField;
     xColaHOJA_TRABAJO_FECHA_INI: TDateTimeField;
     xColaHOJA_TRABAJO_PAUSA_INICIO: TDateTimeField;
     xColaHOJA_TRABAJO_PAUSA_FINAL: TDateTimeField;
     xColaESTADO_HOJA_TRABAJO: TStringField;
     QMMaquinasCVIRTUAL: TIntegerField;
     QMMaquinasCWEB: TIntegerField;
     QMMaquinasEti: TFIBTableSet;
     DSQMMaquinasEti: TDataSource;
     QMMaquinasEtiEMPRESA: TIntegerField;
     QMMaquinasEtiCODMAQ: TIntegerField;
     QMMaquinasEtiMINUTOS_PREPARACION: TFloatField;
     QMMaquinasEtiML_PREPARACION: TFloatField;
     QMMaquinasEtiVELOCIDAD: TFloatField;
     QMMaquinasEtiANCHO_MINIMO: TFloatField;
     QMMaquinasEtiANCHO_MAXIMO_1: TFloatField;
     QMMaquinasEtiANCHO_MAXIMO_2: TFloatField;
     QMMaquinasEtiANCHO_MAXIMO_3: TFloatField;
     QMMaquinasEtiFASE: TFIBStringField;
     QMMaquinasCCENTRO: TFIBStringField;
     procedure DMProMaquinasCreate(Sender: TObject);
     procedure QMMaquinasCBeforePost(DataSet: TDataSet);
     procedure QMMaquinasCDescTipoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMMaquinasCAfterOpen(DataSet: TDataSet);
     procedure QMMaquinasCDescSeccionGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMMaquinasDNewRecord(DataSet: TDataSet);
     procedure QMMaquinasCNewRecord(DataSet: TDataSet);
     procedure frHYMaquinasGetValue(const ParName: string; var ParValue: variant);
     procedure QMMaquinasRepNewRecord(DataSet: TDataSet);
     procedure QMMaquinasCBeforeClose(DataSet: TDataSet);
     procedure xColaAfterPost(DataSet: TDataSet);
     procedure xColaESTADO_HOJA_TRABAJOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMMaquinasEtiNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure PreparaNotasDetalle(DataSource: TDataSource);
     procedure ListadoMaquinas;
     procedure FiltraSeccion(Seccion: string);
     procedure Asignar;
     procedure Desasignar;
  end;

var
  ProDMMaquinas : TProDMMaquinas;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UUtiles, uFBusca, // URecursos,
  UDMListados, UFormGest, HYFIBQuery, DateUtils;

procedure TProDMMaquinas.DMProMaquinasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xColaCANTIDAD.DisplayFormat := MascaraN;
  xColaUNIDADES.DisplayFormat := MascaraN;
  xColaUNIDADES_PEND.DisplayFormat := MascaraN;
  xColaFECHA_ENTREGA.DisplayFormat := ShortDateFormat;
  DMMain.FiltraTabla(QMMaquinasC, '10000', False);
end;

procedure TProDMMaquinas.QMMaquinasCBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMMaquinasCCODMAQ.AsInteger := DMMain.Contador_E('ZMQ');
end;

procedure TProDMMaquinas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMaquinasC, '10000');
end;

procedure TProDMMaquinas.QMMaquinasCDescTipoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xTipo.Close;
  xTipo.Open;
  Text := xTipoDESCRIPCION.AsString;
end;

procedure TProDMMaquinas.QMMaquinasCAfterOpen(DataSet: TDataSet);
begin
  QMMaquinasD.Open;
  QMMaquinasRep.Open;
  xCola.Open;
  xTipo.Open;
  xSeccion.Open;
  QMMaquinasEti.Open;
end;

procedure TProDMMaquinas.QMMaquinasCDescSeccionGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xSeccion.Close;
  xSeccion.Open;
  Text := xSeccionDESCRIPCION.AsString;
end;

procedure TProDMMaquinas.QMMaquinasDNewRecord(DataSet: TDataSet);
begin
  if ((QMMaquinasC.State = dsInsert) or (QMMaquinasC.State = dsEdit)) then
  begin
     QMMaquinasC.Post;
     QMMaquinasC.Refresh;
     QMMaquinasD.Edit;
  end;

  QMMaquinasDEMPRESA.AsInteger := QMMaquinasCEMPRESA.AsInteger;
  QMMaquinasDCODMAQ.AsInteger := QMMaquinasCCODMAQ.AsInteger;
  QMMaquinasDFECHA_REVISION.AsDateTime := REntorno.FechaTrabSH;
  QMMaquinasDFECHA_PROXIMA.AsDateTime := REntorno.FechaTrabSH;
  QMMaquinasDFECHA_PREVISTA_REVISION.AsDateTime := REntorno.FechaTrabSH;
end;

procedure TProDMMaquinas.QMMaquinasCNewRecord(DataSet: TDataSet);
begin
  QMMaquinasCEMPRESA.AsInteger := REntorno.Empresa;
  QMMaquinasCFECHA_COMPRA.AsDateTime := REntorno.FechaTrab;
  QMMaquinasCFECHA_CERT.AsDateTime := REntorno.FechaTrab;
  QMMaquinasCVIRTUAL.AsInteger := 0;
end;

procedure TProDMMaquinas.frHYMaquinasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;
end;

procedure TProDMMaquinas.QMMaquinasRepNewRecord(DataSet: TDataSet);
begin
  if ((QMMaquinasC.State = dsInsert) or (QMMaquinasC.State = dsEdit)) then
  begin
     QMMaquinasC.Post;
     QMMaquinasC.Refresh;
     QMMaquinasRep.Edit;
  end;

  QMMaquinasRepEMPRESA.AsInteger := QMMaquinasCEMPRESA.AsInteger;
  QMMaquinasRepCODMAQ.AsInteger := QMMaquinasCCODMAQ.AsInteger;
  QMMaquinasRepFECHA_DETECCION.AsDateTime := REntorno.FechaTrab;
end;

procedure TProDMMaquinas.PreparaNotasDetalle(DataSource: TDataSource);
begin
  if (DataSource.DataSet.State in [dsEdit, dsInsert]) then
     DataSource.DataSet.Post;
  DataSource.DataSet.Edit;
end;

procedure TProDMMaquinas.ListadoMaquinas;
var
  str : string;
begin
  inherited;
  str := '';
  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(8011, 0, '', str, FrHYMaquinas, nil);
  CierraData(DMListados);
end;

procedure TProDMMaquinas.QMMaquinasCBeforeClose(DataSet: TDataSet);
begin
  QMMaquinasD.Close;
  QMMaquinasRep.Close;
  xCola.Close;
  xTipo.Close;
  xSeccion.Close;
  QMMaquinasEti.Close;
end;

procedure TProDMMaquinas.xColaAfterPost(DataSet: TDataSet);
begin
  // Refresco datos, manteniendo la posicion
  Refrescar(xCola, 'ORDEN_COLA_MAQUINA', xCola.FieldByName('ORDEN_COLA_MAQUINA').AsInteger);
end;

procedure TProDMMaquinas.FiltraSeccion(Seccion: string);
begin
  with QMMaquinasC do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM PRO_MAQUINAS_C ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');
     if (Seccion > '') then
        SelectSQL.Add(' AND SECCION = ?SECCION ');
     SelectSQL.Add(' ORDER BY CODMAQ ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if (Seccion > '') then
        Params.ByName['SECCION'].AsString := Seccion;
     Open;
  end;
end;

procedure TProDMMaquinas.xColaESTADO_HOJA_TRABAJOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xColaID_HOJA_TRABAJO.AsInteger <> 0) then
  begin
     if (xColaHOJA_TRABAJO_VISIBLE.AsInteger = 1) then
     begin
        if (xColaHOJA_TRABAJO_FINALIZADO.AsInteger = 0) then
        begin
           if (xColaHOJA_TRABAJO_FECHA_INI.AsDateTime = 0) then
              Text := _('Sin Iniciar')
           else
           if ((xColaHOJA_TRABAJO_PAUSA_INICIO.AsDateTime > 0) and (xColaHOJA_TRABAJO_PAUSA_FINAL.AsDateTime = 0)) then
              Text := _('Pausada')
           else
           if ((xColaHOJA_TRABAJO_PAUSA_INICIO.AsDateTime = 0) and (xColaHOJA_TRABAJO_PAUSA_FINAL.AsDateTime = 0)) or ((xColaHOJA_TRABAJO_PAUSA_INICIO.AsDateTime > 0) and (xColaHOJA_TRABAJO_PAUSA_FINAL.AsDateTime > 0)) then
              Text := _('Iniciada');
        end
        else
           Text := _('Finalizada'); // Modificar ProFMMaquinas.DBGFColaDrawColumnCell si se modifica este string.
     end
     else
        Text := _('Sin asignar');
  end
  else
     Text := _('Sin Hoja Trabajo');
end;

procedure TProDMMaquinas.Asignar;
var
  OrdenProduciendo : string;
begin
  OrdenProduciendo := '';

  // Verifico si puedo desasignar
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 SERIE, RIG_OF, ID_ORDEN ');
        SQL.Add(' FROM VER_MAQUINAS_COLA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' MAQUINA = :MAQUINA AND ');
        SQL.Add(' PRODUCIENDO = 1 ');

        Params.ByName['EMPRESA'].AsInteger := xColaEMPRESA.AsInteger;
        Params.ByName['MAQUINA'].AsInteger := xColaMAQUINA.AsInteger;
        ExecQuery;
        if (FieldByName['ID_ORDEN'].AsInteger > 0) then
           OrdenProduciendo := Format('%s/%s (%d)', [FieldByName['SERIE'].AsString, FieldByName['RIG_OF'].AsInteger, FieldByName['ID_ORDEN'].AsInteger]);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (OrdenProduciendo <> '') then
     ShowMessage(Format(_('La hoja de trabajo no se puede Asignar.' + #13#10 + 'Hay otra orden marcada como produciendo. (%s)'), [OrdenProduciendo]))
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE OPE_HOJAS_TRABAJO_ASIGNAR (:EMPRESA, :MAQUINA, :SECCION, :ID_HOJA_TRABAJO)';
           Params.ByName['EMPRESA'].AsInteger := xColaEMPRESA.AsInteger;
           Params.ByName['MAQUINA'].AsInteger := xColaMAQUINA.AsInteger;
           Params.ByName['SECCION'].AsString := xColaSECCION.AsString;
           Params.ByName['ID_HOJA_TRABAJO'].AsInteger := xColaID_HOJA_TRABAJO.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Refrescar(xCola, 'ID_HOJA_TRABAJO', xCola.FieldByName('ID_HOJA_TRABAJO').AsInteger);
end;

procedure TProDMMaquinas.Desasignar;
var
  Puedo : boolean;
begin
  // Verifico si puedo desasignar
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 ID_HOJA_TRABAJO ');
        SQL.Add(' FROM OPE_HOJAS_TRABAJO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_HOJA_TRABAJO = :ID_HOJA_TRABAJO AND ');
        SQL.Add(' VISIBLE = 1 AND ');
        SQL.Add(' FINALIZADO = 0 AND ');
        SQL.Add(' FECHA_INI IS NULL ');

        Params.ByName['ID_HOJA_TRABAJO'].AsInteger := xColaID_HOJA_TRABAJO.AsInteger;
        ExecQuery;
        Puedo := (FieldByName['ID_HOJA_TRABAJO'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (not Puedo) then
     ShowMessage(_('La hoja de trabajo no se puede desasignar.'))
  else
  begin
     // Verifico si esta pausada para rellenar el campo DETENER_TRABAJO
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 ID_PAUSA_TRABAJO ');
           SQL.Add(' FROM OPE_HOJAS_TRABAJO_PAUSAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_HOJA_TRABAJO = :ID_HOJA_TRABAJO AND ');
           SQL.Add(' FINAL IS NULL ');
           Params.ByName['ID_HOJA_TRABAJO'].AsInteger := xColaID_HOJA_TRABAJO.AsInteger;
           ExecQuery;
           Puedo := (FieldByName['ID_PAUSA_TRABAJO'].AsInteger <> 0);
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
           SQL.Text := 'EXECUTE PROCEDURE OPE_HOJAS_TRABAJO_DESASIGNAR (:ID_HOJA_TRABAJO, :FECHA_FIN, :DETENER_TRABAJO)';
           Params.ByName['ID_HOJA_TRABAJO'].AsInteger := xColaID_HOJA_TRABAJO.AsInteger;
           Params.ByName['FECHA_FIN'].AsDateTime := Now;
           Params.ByName['DETENER_TRABAJO'].AsInteger := BoolToInt(Puedo);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Refrescar(xCola, 'ID_HOJA_TRABAJO', xCola.FieldByName('ID_HOJA_TRABAJO').AsInteger);
end;

procedure TProDMMaquinas.QMMaquinasEtiNewRecord(DataSet: TDataSet);
begin
  QMMaquinasEtiEMPRESA.AsInteger := QMMaquinasCEMPRESA.AsInteger;
  QMMaquinasEtiCODMAQ.AsInteger := QMMaquinasCCODMAQ.AsInteger;
end;

end.
