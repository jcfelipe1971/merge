unit UIsoDMInc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, HYFIBQuery, FIBDataSetRO;

type
  TIsoDMInc = class(TDataModule)
     QMInc: TFIBTableSet;
     DSQMInc: TDataSource;
     TLocal: THYTransaction;
     QMIncEMPRESA: TIntegerField;
     QMIncCLI_PRO_INTE: TIntegerField;
     QMIncSITUACION: TFIBStringField;
     QMIncSERIE_DOC: TFIBStringField;
     QMIncNUM_DOC: TIntegerField;
     QMIncFECHA_INC: TDateTimeField;
     QMIncRESPONSABLE: TIntegerField;
     QMIncESTADO: TIntegerField;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleACCION: TIntegerField;
     QMDetalleFECHA_ACCION: TDateTimeField;
     QMDetalleDEFINICION_ACCION: TFIBStringField;
     QMDetalleRESPONSABLE_ACCION: TIntegerField;
     QMDetalleSERIE_DOC: TFIBStringField;
     QMDetalleNUM_DOC: TIntegerField;
     QMDetalleDescTipo: TStringField;
     QMDetalleDescResponsable: TStringField;
     QMDetalleEMPRESA: TIntegerField;
     QMIncDESCRIPCION: TFIBStringField;
     xDepartamentos: TFIBTableSet;
     DSxDepartamentos: TDataSource;
     QMIncTIRAR: TIntegerField;
     QMIncDEVOLVER: TIntegerField;
     QMIncACEPTAR: TIntegerField;
     QMIncOTROS: TIntegerField;
     QMIncNOTAS: TBlobField;
     QMIncVBCALIDAD: TIntegerField;
     QMIncVBRESDEPARTAMENTO: TIntegerField;
     frIsoInc: TfrHYReport;
     frDBQMDetalle: TfrDBDataSet;
     QMDetArticulos: TFIBTableSet;
     DSQMDetArticulos: TDataSource;
     QMDetArticulosEMPRESA: TIntegerField;
     QMDetArticulosLINEA: TIntegerField;
     QMDetArticulosARTICULO: TFIBStringField;
     QMDetArticulosDescArticulo: TStringField;
     QMDetalleREALIZADO: TIntegerField;
     QMIncCANTIDAD: TIntegerField;
     frDBQMDetArticulos: TfrDBDataSet;
     QMDetalleDESCRIPCION: TFIBStringField;
     QMIncTIPO: TFIBStringField;
     QMIncPOR_CLASIFICA: TIntegerField;
     QMIncFECHA_CIERRE: TDateTimeField;
     xTipoDocumento: TFIBTableSet;
     DSxTipoDocumento: TDataSource;
     xTipoDocumentoTIPO: TFIBStringField;
     xTipoDocumentoDESCRIPCION: TFIBStringField;
     xFactorCla: TFIBTableSet;
     DsxFactorCla: TDataSource;
     xFactorClaCOD: TIntegerField;
     xFactorClaDESCRIPCION: TFIBStringField;
     QMIncNDEVOLUCION: TIntegerField;
     QMIncRIC: TIntegerField;
     QMDetalleRIC: TIntegerField;
     QMDetArticulosRIC: TIntegerField;
     QMIncCONTADOR: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetArticulosTIPO: TFIBStringField;
     QMDetalleCONTADOR: TFIBStringField;
     QMDetArticulosCONTADOR: TFIBStringField;
     QMIncDEPARTAMENTO: TFIBStringField;
     xDepartamentosEMPRESA: TIntegerField;
     xDepartamentosDEPARTAMENTO: TFIBStringField;
     xDepartamentosDESCRIPCION: TFIBStringField;
     QMIncEVIDENCIA: TFIBStringField;
     QMIncNDOCCLI: TIntegerField;
     QMIncREFERENCIACLI: TFIBStringField;
     QMDetalleTIPO_ACCION: TFIBStringField;
     QMIncRECUPERAR_ISO: TIntegerField;
     QMIncNOTAS_INC: TBlobField;
     QMDetalleNOTAS: TBlobField;
     QMDetArticulosNOTAS: TBlobField;
     QMDetalleCOSTE: TFloatField;
     QMIncCOSTE_TOTAL: TFloatField;
     QMIncLINEA: TIntegerField;
     frDBQmInc: TfrDBDataSet;
     QMDetalleID_ACCION: TIntegerField;
     QMIncEJERCICIO: TIntegerField;
     SPDevolucion: THYFIBQuery;
     QMDetArticulosCANTIDAD: TFloatField;
     QMIncCLIPRO: TIntegerField;
     QMIncCANAL: TIntegerField;
     QMIncCOSTE_INC: TFloatField;
     frIsoResumenInc: TfrHYReport;
     frDBLstResumenInc: TfrDBDataSet;
     TUpdate: THYTransaction;
     QMIncDESCRIPCION_TIPO: TFIBStringField;
     QMIncNOMBRE_R_SOCIAL: TFIBStringField;
     QMIncTITULO_RESPONSABLE: TFIBStringField;
     QMIncTITULO_DEPARTAMENTO: TFIBStringField;
     procedure DMIsoIncCreate(Sender: TObject);
     procedure QMIncNewRecord(DataSet: TDataSet);
     procedure QMIncAfterOpen(DataSet: TDataSet);
     procedure QMIncTIPOChange(Sender: TField);
     procedure QMIncBeforePost(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleDescTipoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleDescResponsableGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetArticulosDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetArticulosNewRecord(DataSet: TDataSet);
     procedure frIsoIncEnterRect(Memo: TStringList; View: TfrView);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMIncBeforeCancel(DataSet: TDataSet);
     procedure QMIncAfterScroll(DataSet: TDataSet);
     procedure QMIncCLIPROChange(Sender: TField);
     procedure frIsoResumenIncGetValue(const ParName: string; var ParValue: variant);
     procedure QMIncBeforeClose(DataSet: TDataSet);
     procedure QMIncCLI_PRO_INTEChange(Sender: TField);
     procedure QMIncRESPONSABLEChange(Sender: TField);
     procedure QMIncDEPARTAMENTOChange(Sender: TField);
     procedure frIsoIncGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure FiltraInciencia(Incidencia: integer);
     procedure BuscaTerDePro;
     procedure BuscaTerDeCli;
     function CargaDescCliPro: string;
     procedure Filtrar(Filtro: string);
  end;

var
  IsoDMInc : TIsoDMInc;

implementation

uses UIsoFMInc, UDMMain, UEntorno, UUtiles, UDameDato, uFBusca, URecursos, UDMListados;

{$R *.DFM}

procedure TIsoDMInc.DMIsoIncCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMInc, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetArticulos, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMInc, '10000', True);
end;

procedure TIsoDMInc.QMIncNewRecord(DataSet: TDataSet);
begin
  // Es posa el Ric
  DMMain.Contador_Gen(QMInc, 'CONTA_ISO_INC', 'RIC');

  QMIncEMPRESA.AsInteger := REntorno.Empresa;
  QMIncEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMIncCANAL.AsInteger := REntorno.Canal;
  QMIncFECHA_INC.AsDateTime := REntorno.FechaTrabSH;
  QMIncFECHA_CIERRE.AsDateTime := REntorno.FechaTrabSH;
  QMIncTIRAR.AsInteger := 0;
  QMIncRECUPERAR_ISO.AsInteger := 0;
  QMINcDevolver.AsInteger := 0;
  QMIncAceptar.AsInteger := 0;
  QMIncOtros.AsInteger := 0;
  QMIncVBCALIDAD.AsInteger := 0;
  QMIncVBRESDEPARTAMENTO.AsInteger := 0;
  QMIncESTADO.AsInteger := 0;
  if (QMIncSERIE_DOC.AsString = '') then
     QMIncSERIE_DOC.AsString := 'A';
end;

procedure TIsoDMInc.QMIncAfterOpen(DataSet: TDataSet);
begin
  xDepartamentos.Open;
  QMDetalle.Open;
  QMDetArticulos.Open;
  xTipoDocumento.Open;
  xFactorCla.Open;
end;

procedure TIsoDMInc.QMIncTIPOChange(Sender: TField);
begin
  IsoFMInc.LimpiaFormulario;
  IsoFMInc.VisualizaEtiCliProv;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM ISO_NO_CONFORMIDAD_TIPO WHERE TIPO = ?TIPO';
        Params.ByName['TIPO'].AsString := QMIncTIPO.AsString;
        ExecQuery;
        QMIncDESCRIPCION_TIPO.AsString := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMInc.QMIncBeforePost(DataSet: TDataSet);
begin
  if (QMIncCLI_PRO_INTE.AsInteger = 0) then
     QMIncCLI_PRO_INTE.AsString := '-1';

  if (QMIncPOR_CLASIFICA.AsInteger = 0) then
     QMIncPOR_CLASIFICA.AsInteger := 3;

  if (QMIncRESPONSABLE.AsInteger = 0) then
     QMIncRESPONSABLE.AsInteger := 1;

  if (QMIncDEPARTAMENTO.AsString = '') then
     QMIncDEPARTAMENTO.AsString := 'DES';

  IsoFMINC.DBEFTipo.ReadOnly := False;
  IsoFMINC.DBEFTipo.Color := clInfoBk;
end;

procedure TIsoDMInc.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMInc, '10000');
end;

procedure TIsoDMInc.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMInc.State = dsInsert) or (QMInc.State = dsEdit)) then
  begin
     QMInc.Post;
     IsoFMINC.NavMain.BtnClick(nbRefresh);
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := QMIncEMPRESA.AsInteger;
  QMDetalleRIC.AsInteger := QMIncRIC.AsInteger;
  QMDetalleTIPO.AsString := QMIncTIPO.AsString;
  QMDetalleCONTADOR.AsString := QMIncCONTADOR.AsString;
  QMDetalleFECHA_ACCION.AsDateTime := REntorno.FechaTrab;
  if (QMDetalleSERIE_DOC.AsString = '') then
     QMDetalleSERIE_DOC.AsString := ' ';

  QMDetalleSERIE_DOC.AsString := QMIncSERIE_DOC.AsString;
  QMDetalleNUM_DOC.AsInteger := QMIncNUM_DOC.AsInteger;

  // Obtenemos siguiente numero de linea
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(ACCION) FROM ISO_NO_CONFORMIDAD_ACCIONES WHERE EMPRESA = :EMPRESA AND RIC = :RIC';
        Params.ByName['EMPRESA'].AsInteger := QMIncEMPRESA.AsInteger;
        Params.ByName['RIC'].AsInteger := QMIncRIC.AsInteger;
        ExecQuery;
        QMDetalleACCION.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMInc.QMDetalleDescTipoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM ISO_INC_ACCIONES_TIPO WHERE TIPO = ?TIPO';
        Params.ByName['TIPO'].AsString := QMDetalleTIPO_ACCION.AsString;
        ExecQuery;
        Text := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMInc.QMDetalleDescResponsableGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEmpleado(QMDetalleRESPONSABLE_ACCION.AsInteger);
end;

procedure TIsoDMInc.QMDetArticulosDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMDetArticulosARTICULO.AsString);
end;

procedure TIsoDMInc.QMDetArticulosNewRecord(DataSet: TDataSet);
begin
  if ((QMInc.State = dsInsert) or (QMInc.State = dsEdit)) then
  begin
     QMInc.Post;
     IsoFMINC.NavMain.BtnClick(nbRefresh);
     QMDetArticulos.Edit;
  end;

  QMDetArticulosEMPRESA.AsInteger := QMIncEMPRESA.AsInteger;
  QMDetArticulosRIC.AsInteger := QMIncRIC.AsInteger;
  QMDetArticulosTIPO.AsString := QMIncTIPO.AsString;
  QMDetArticulosCONTADOR.AsString := QMIncCONTADOR.AsString;

  // Obtenemos siguiente numero de linea
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM ISO_INC_ARTICULO WHERE EMPRESA = :EMPRESA AND RIC = :RIC';
        Params.ByName['EMPRESA'].AsInteger := QMIncEMPRESA.AsInteger;
        Params.ByName['RIC'].AsInteger := QMIncRIC.AsInteger;
        ExecQuery;
        QMDetArticulosLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMInc.frIsoIncEnterRect(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TIsoDMInc.QMDetalleBeforePost(DataSet: TDataSet);
begin
  QMDetalleSERIE_DOC.AsString := UpperCase(QMDetalleSERIE_DOC.AsString);
end;

procedure TIsoDMInc.QMIncBeforeCancel(DataSet: TDataSet);
begin
  IsoFMINC.DBEFTipo.ReadOnly := False;
  IsoFMINC.DBEFTipo.Color := clInfoBk;
end;

procedure TIsoDMInc.QMIncAfterScroll(DataSet: TDataSet);
begin
  // Si el check està marcat no es deixa que es faci una nova devolució
  if ((QMIncDEVOLVER.AsInteger = 1) and (QMIncNDEVOLUCION.AsInteger > 0)) then
     IsoFMInc.ADevolucionArt.Enabled := False
  else
     IsoFMInc.ADevolucionArt.Enabled := True;

  if (QMIncNUM_DOC.AsInteger <> 0) then
     IsoFMInc.DBEDoc.Color := REntorno.ColorEnlaceActivo
  else
     IsoFMInc.DBEDoc.Color := clWindow;

  if (QMIncESTADO.AsInteger = 0) then
  begin
     IsoFMInc.LFFEchaCierre.Visible := False;
     IsoFMInc.DBFEchaCierre.Visible := False;
  end
  else
  begin
     IsoFMInc.LFFEchaCierre.Visible := True;
     IsoFMInc.DBFEchaCierre.Visible := True;
  end;

  IsoFMInc.VisualizaEtiCliProv;
  IsoFMInc.LFDbDescCliPro.Text := CargaDescCliPro;
end;

procedure TIsoDMInc.FiltraInciencia(Incidencia: integer);
begin
  with QMInc do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_ISO_NO_CONFORMIDAD ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' RIC = ?RIC ');
     SelectSQL.Add(' ORDER BY RIC ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['RIC'].AsInteger := Incidencia;
     Open;
  end;
end;

function TIsoDMInc.CargaDescCliPro: string;
begin
  IsoFMInc.LFDbDescCliPro.Text := '';
  if (QMIncTIPO.AsString = 'C') then
     Result := DameTituloCliente(QMIncCLIPRO.AsInteger);

  if (QMIncTIPO.AsString = 'P') then
     Result := DameTituloProveedor(QMIncCLIPRO.AsInteger);
end;

procedure TIsoDMInc.BuscaTerDeCli;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TERCERO FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := QMIncCLIPRO.AsInteger;
        ExecQuery;
        QMIncCLI_PRO_INTE.AsInteger := FieldByName['TERCERO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMInc.BuscaTerDePro;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TERCERO FROM EMP_PROVEEDORES WHERE EMPRESA = ?EMPRESA AND PROVEEDOR = ?PROVEEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROVEEDOR'].AsInteger := QMIncCLIPRO.AsInteger;
        ExecQuery;
        QMIncCLI_PRO_INTE.AsInteger := FieldByName['TERCERO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMInc.QMIncCLIPROChange(Sender: TField);
begin
  IsoFMInc.VisualizaEtiCliProv;
  IsoFMInc.LFDbDescCliPro.Text := CargaDescCliPro;
end;

procedure TIsoDMInc.frIsoResumenIncGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'DescCliProv') then
     ParValue := CargaDescCliPro;

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;
end;

procedure TIsoDMInc.QMIncBeforeClose(DataSet: TDataSet);
begin
  xDepartamentos.Close;
  QMDetalle.Close;
  QMDetArticulos.Close;
  xTipoDocumento.Close;
  xFactorCla.Close;
end;

procedure TIsoDMInc.Filtrar(Filtro: string);
begin
  // Es filtre les INC
  with QMInc do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_ISO_NO_CONFORMIDAD ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');
     if (Filtro <> '') then
        SelectSQL.Add(' AND (' + Filtro + ') ');
     SelectSQL.Add(' ORDER BY RIC ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TIsoDMInc.QMIncCLI_PRO_INTEChange(Sender: TField);
begin
  QMIncNOMBRE_R_SOCIAL.Text := DameTituloTercero(QMIncCLI_PRO_INTE.AsInteger);
end;

procedure TIsoDMInc.QMIncRESPONSABLEChange(Sender: TField);
begin
  QMIncTITULO_RESPONSABLE.AsString := DameTituloEmpleado(QMIncRESPONSABLE.AsInteger);
end;

procedure TIsoDMInc.QMIncDEPARTAMENTOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM OPE_DEPARTAMENTOS WHERE EMPRESA = :EMPRESA AND DEPARTAMENTO = :DEPARTAMENTO';
        Params.ByName['EMPRESA'].AsInteger := QMIncEMPRESA.AsInteger;
        Params.ByName['DEPARTAMENTO'].AsString := QMIncDEPARTAMENTO.AsString;
        ExecQuery;
        QMIncDESCRIPCION_TIPO.AsString := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMInc.frIsoIncGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

end.
