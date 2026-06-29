unit UDMLstIncidencias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, Forms, FIBQuery,
  HYFIBQuery, frxClass, frxDBSet, frxHYReport, frxFIBHYComponents,
  FIBTableDataSet, frxExportPDF;

type
  TDMLstIncidencias = class(TDataModule)
     xIncidencias: TFIBDataSetRO;
     DSxIncidencias: TDataSource;
     TLocal: THYTransaction;
     xMaestroD: TFIBDataSetRO;
     DSxMaestroD: TDataSource;
     DSxMaestroH: TDataSource;
     xMaestroH: TFIBDataSetRO;
     xTipoMov: TFIBDataSetRO;
     DSxTipoMov: TDataSource;
     QRango: THYFIBQuery;
     frxDBxIncidencias: TfrxDBDataset;
     frIncidencias: TfrHYReport;
     frDSQMIncidencias: TfrDBDataSet;
     frxIncidencias: TfrxHYReport;
     xTipoIncidencia: TFIBDataSetRO;
     DSxTipoIncidencia: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frIncidenciasEnterRect(Memo: TStringList; View: TfrView);
     procedure frIncidenciasGetValue(const ParName: string; var ParValue: variant);
     function ColocaBarra(Sender: TField): string;
     procedure frxIncidenciasBeforePrint(Sender: TfrxReportComponent);
     procedure frxIncidenciasGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     Tipo_Ter, Concepto, Doc: string;
     FechaIni, FechaFin: TDateTime;
     Desglosado: boolean;
     procedure MuestraFiltrado(Cod_ini, Cod_fin: integer; Fecha_Ini, Fecha_Fin: TDateTime; Modo: byte; Age_Ini, Age_Fin, Dir_Ini, Dir_Fin, Usu_Ini, Usu_Fin: integer; TipoIncidencia: string; Finalizada: smallint);
     procedure CambiaMaestro(TipoTer: smallint);
     procedure OnChangeMaestroD(Maestro: integer);
     procedure OnChangeMaestroH(Maestro: integer);
     procedure CambiaTipo(Tipo: smallint);
     procedure Rangos(var Max: integer; var Min: integer);
     procedure RangosUsuario(var Max: integer; var Min: integer);
     procedure RellenaTipoIncidencia(s: TStrings);
     procedure PosicionaTipoIncidencia(Tipo: string);
  end;

var
  DMLstIncidencias : TDMLstIncidencias;

implementation

{$R *.dfm}

uses UDMMain, UDMListados, UEntorno, UFormGest, UUtiles{, frx2xto30};

procedure TDMLstIncidencias.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstIncidencias.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.commit;
  CierraData(DMListados);
end;

procedure TDMLstIncidencias.CambiaMaestro(TipoTer: smallint);
var
  Sentencia, Sentencia2 : string;
begin
  case TipoTer of
     1:
     begin
        Concepto := 'DE PROVEEDORES';
        Sentencia := 'SELECT * FROM VER_PROVEEDORES_EMPRESA ';
        Sentencia2 := ' AND PROVEEDOR = ';
        with QRango do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'SELECT MIN(PROVEEDOR) AS MINIMO,MAX(PROVEEDOR) AS MAXIMO ' +
              'FROM EMP_PROVEEDORES WHERE EMPRESA = ' + REntorno.EmpresaStr;
        end;
     end;
     2:
     begin
        Concepto := 'DE ACREEDORES';
        Sentencia := 'SELECT * FROM VER_ACREEDORES_EMPRESA ';
        Sentencia2 := ' AND ACREEDOR = ';
        with QRango do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'SELECT MIN(ACREEDOR) AS MINIMO,MAX(ACREEDOR) AS MAXIMO ' +
              'FROM EMP_ACREEDORES WHERE EMPRESA = ' + REntorno.EmpresaStr;
        end;
     end;
     3:
     begin
        Concepto := 'DE AGENTES';
        Sentencia := 'SELECT * FROM VER_AGENTES ';
        Sentencia2 := ' AND AGENTE = ';
        with QRango do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'SELECT MIN(AGENTE) AS MINIMO,MAX(AGENTE) AS MAXIMO ' +
              'FROM EMP_AGENTES WHERE EMPRESA = ' + REntorno.EmpresaStr;
        end;
     end
     else
     begin
        Concepto := 'DE CLIENTES';
        Sentencia := 'SELECT * FROM VER_CLIENTES_EMPRESA ';
        Sentencia2 := ' AND CLIENTE = ';
        with QRango do
        begin
           Close;
           SQL.Clear;
           SQL.Text := 'SELECT MIN(CLIENTE) AS MINIMO,MAX(CLIENTE) AS MAXIMO ' +
              'FROM EMP_CLIENTES WHERE EMPRESA = ' + REntorno.EmpresaStr;
        end;
     end;
  end;
  xMaestroD.Close;
  xMaestroD.SelectSQL.Text := Sentencia + 'WHERE EMPRESA = ?EMPRESA ' +
     Sentencia2 + '?MAESTRO';
  xMaestroH.Close;
  xMaestroH.SelectSQL := xMaestroD.SelectSQL;
end;

procedure TDMLstIncidencias.MuestraFiltrado(Cod_ini, Cod_fin: integer; Fecha_Ini, Fecha_Fin: TDateTime; Modo: byte; Age_Ini, Age_Fin, Dir_Ini, Dir_Fin, Usu_Ini, Usu_Fin: integer; TipoIncidencia: string; Finalizada: smallint);
begin
  FechaIni := Fecha_Ini;
  FechaFin := Fecha_Fin;
  Fecha_Ini := HourIntoDate(Fecha_Ini, '00:00:00');
  Fecha_Fin := HourIntoDate(Fecha_Fin, '23:59:59');
  DMListados.Normalizar_Desde_Hasta(Fecha_Ini, Fecha_Fin);

  with xIncidencias do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_INCIDENCIAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' COD_CLI_PRO >= ?COD_INI AND COD_CLI_PRO <= ?COD_FIN AND ');
     SelectSQL.Add(' TIPO_TERCERO = ?TIPO AND ');
     SelectSQL.Add(' FECHA >= ?FECHA_INI AND FECHA <= ?FECHA_FIN AND ');
     SelectSQL.Add(' AGENTE >= ?AGE_INI AND AGENTE <= ?AGE_FIN AND ');
     SelectSQL.Add(' USUARIO >= ?USU_INI AND USUARIO <= ?USU_FIN AND ');
     SelectSQL.Add(' DIRECCION >= ?DIR_INI AND DIRECCION <= ?DIR_FIN ');
     if (TipoIncidencia <> _('Todas')) then
        SelectSQL.Add(' AND TIPO_INCIDENCIA_KRI = ?TIPO_INCIDENCIA_KRI ');
     case Finalizada of
        1: SelectSQL.Add(' AND FINALIZADO = 1 ');
        2: SelectSQL.Add(' AND FINALIZADO = 0 ');
     end;
     SelectSQL.Add(' ORDER BY COD_CLI_PRO, FECHA, INCIDENCIA ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA_INI'].AsDateTime := Fecha_Ini;
     Params.ByName['FECHA_FIN'].AsDateTime := Fecha_Fin;
     Params.ByName['TIPO'].AsString := Tipo_Ter;
     Params.ByName['COD_INI'].AsInteger := Cod_ini;
     Params.ByName['COD_FIN'].AsInteger := Cod_fin;
     Params.ByName['AGE_INI'].AsInteger := Age_ini;
     Params.ByName['AGE_FIN'].AsInteger := Age_fin;
     Params.ByName['USU_INI'].AsInteger := Usu_ini;
     Params.ByName['USU_FIN'].AsInteger := Usu_fin;
     Params.ByName['DIR_INI'].AsInteger := Dir_ini;
     Params.ByName['DIR_FIN'].AsInteger := Dir_fin;
     if (TipoIncidencia <> _('Todas')) then
        Params.ByName['TIPO_INCIDENCIA_KRI'].AsString := TipoIncidencia;
     Open;
  end;

  DMListados.Imprimir(515, 0, Modo, '', _('Listado de incidencias'), frIncidencias, frxIncidencias, nil, nil);
end;

procedure TDMLstIncidencias.frIncidenciasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstIncidencias.OnChangeMaestroD(Maestro: integer);
begin
  with xMaestroD do
  begin
     Close;
     Params.ByName['MAESTRO'].AsInteger := Maestro;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMLstIncidencias.OnChangeMaestroH(Maestro: integer);
begin
  with xMaestroH do
  begin
     Close;
     Params.ByName['MAESTRO'].AsInteger := Maestro;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMLstIncidencias.frIncidenciasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Concepto' then
     ParValue := Concepto;
  if ParName = 'Fecha1' then
     ParValue := FechaIni;
  if ParName = 'Fecha2' then
     ParValue := FechaFin;

  if ParName = 'Documento' then
  begin
     if (xIncidencias.FieldByName('DOC_RIG').AsInteger > 0) then
     begin
        if xIncidencias.FieldByName('DOC_TIPO').AsString = 'PEP' then
           Doc := _('Pedido de proveedor');
        if xIncidencias.FieldByName('DOC_TIPO').AsString = 'ALP' then
           Doc := _('Albarán de proveedor');
        if xIncidencias.FieldByName('DOC_TIPO').AsString = 'FAP' then
           Doc := _('Factura de proveedor');
        if xIncidencias.FieldByName('DOC_TIPO').AsString = 'PEC' then
           Doc := _('Pedido');
        if xIncidencias.FieldByName('DOC_TIPO').AsString = 'ALB' then
           Doc := _('Albarán');
        if xIncidencias.FieldByName('DOC_TIPO').AsString = 'FAC' then
           Doc := _('Factura');
        if xIncidencias.FieldByName('DOC_TIPO').AsString = 'OFC' then
           Doc := _('Oferta');
        if xIncidencias.FieldByName('DOC_TIPO').AsString = 'FCR' then
           Doc := _('Factura de acreedor');

        ParValue := Format(_('DOCUMENTO: %s %s'), [Doc, xIncidencias.FieldByName('DOC_RIG').AsString +
           ColocaBarra(xIncidencias.FieldByName('DOC_SERIE')) + xIncidencias.FieldByName('DOC_SERIE').AsString +
           ColocaBarra(xIncidencias.FieldByName('DOC_EJERCICIO')) + xIncidencias.FieldByName('DOC_EJERCICIO').AsString]);
     end
     else
        ParValue := '';
  end;

  if ParName = 'InFecha' then
  begin
     if not xIncidencias.FieldByName('FECHA').IsNull then
        ParValue := xIncidencias.FieldByName('FECHA').AsDateTime
     else
        ParValue := '';
  end;

  if ParName = 'RecFecha' then
  begin
     if not xIncidencias.FieldByName('FECHA_RECEPCION').IsNull then
        ParValue := xIncidencias.FieldByName('FECHA_RECEPCION').AsDateTime
     else
        ParValue := '';
  end;

  if ParName = 'ResFecha' then
  begin
     if not xIncidencias.FieldByName('FECHA_RESPUESTA').IsNull then
        ParValue := xIncidencias.FieldByName('FECHA_RESPUESTA').AsDateTime
     else
        ParValue := '';
  end;

  if ParName = 'Desglosado' then
     ParValue := Desglosado;
end;

function TDMLstIncidencias.ColocaBarra(Sender: TField): string;
begin
  if not Sender.IsNull then
     Result := ' / ';
end;

procedure TDMLstIncidencias.CambiaTipo(Tipo: smallint);
begin
  case Tipo of
     0: Tipo_Ter := 'CLI';
     1: Tipo_Ter := 'PRO';
     2: Tipo_Ter := 'ACR';
     3: Tipo_Ter := 'AGE'
     else
        Tipo_Ter := 'POT';
  end;
end;

procedure TDMLstIncidencias.Rangos(var Max: integer; var Min: integer);
begin
  with QRango do
  begin
     Close;
     ExecQuery;
     Max := FieldByName['MAXIMO'].AsInteger;
     Min := FieldByName['MINIMO'].AsInteger;
     FreeHandle;
  end;
end;

procedure TDMLstIncidencias.frxIncidenciasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstIncidencias.frxIncidenciasGetValue(const VarName: string; var Value: variant);
begin
  frIncidenciasGetValue(VarName, Value);
end;

procedure TDMLstIncidencias.RangosUsuario(var Max: integer; var Min: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT MIN(USUARIO),MAX(USUARIO) FROM SYS_USUARIOS';
     ExecQuery;
     Min := FieldByName['MIN'].AsInteger;
     Max := FieldByName['MAX'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMLstIncidencias.RellenaTipoIncidencia(s: TStrings);
begin
  s.Add(_('Todas'));
  with xTipoIncidencia do
  begin
     if Active then
        Close;
     Open;
     while (not EOF) do
     begin
        s.Add(FieldByName('TIPO').AsString);
        Next;
     end;
  end;
end;

procedure TDMLstIncidencias.PosicionaTipoIncidencia(Tipo: string);
begin
  with xTipoIncidencia do
  begin
     if (Tipo = _('Todas')) then
        Close
     else
     begin
        DisableControls;
        if not Active then
           Open;
        First;
        while ((not EOF) and (FieldByName('TIPO').AsString <> Tipo)) do
           Next;
        EnableControls;
     end;
  end;
end;

end.
