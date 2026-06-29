unit UDMLSTAcreedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery, StdCtrls,
  ULFComboBox, frxClass, frxHYReport;

type
  TDMLSTAcreedor = class(TDataModule)
     frAcreedor: TfrHYReport;
     frDSQMAcreedor: TfrDBDataSet;
     QMAcreedor: TFIBDataSetRO;
     DSQMAcreedor: TDataSource;
     QMTerceros: TFIBDataSetRO;
     DSQMTerceros: TDataSource;
     frDSQMTerceros: TfrDBDataSet;
     frDSQMJustifica: TfrDBDataSet;
     DSQMJustifica: TDataSource;
     QMJustifica: TFIBDataSetRO;
     QMFormasdePago: TFIBDataSetRO;
     DSFormasdePago: TDataSource;
     frDSQMFormasdePago: TfrDBDataSet;
     frDSQMIvaModos: TfrDBDataSet;
     DSIvaModos: TDataSource;
     QMIvaModos: TFIBDataSetRO;
     QMIRPF: TFIBDataSetRO;
     DSIRPF: TDataSource;
     frDSQMIRPF: TfrDBDataSet;
     frDSQMTipoTerceros: TfrDBDataSet;
     DSTipoTerceros: TDataSource;
     QMTipoTercero: TFIBDataSetRO;
     QMTipodeProv: TFIBDataSetRO;
     DSQMlstTipodeProv: TDataSource;
     frQMDSQMlstTipodeProv: TfrDBDataSet;
     TLocal: THYTransaction;
     xCarga: TFIBDataSetRO;
     DSxCarga: TDataSource;
     frDBxCarga: TfrDBDataSet;
     xFacturasMensual: TFIBTableSet;
     DSxFacturasMensual: TDataSource;
     DSxFacturasMensualCompara: TDataSource;
     xFacturasMensualCompara: TFIBDataSet;
     xFacturasAnual: TFIBDataSet;
     DSxFacturasAnual: TDataSource;
     DSxFacturasAnualCompara: TDataSource;
     xFacturasAnualCompara: TFIBDataSet;
     xPrevisionMensual: TFIBDataSet;
     DSxPrevisionMensual: TDataSource;
     DSxPrevisionAnual: TDataSource;
     xPrevisionAnual: TFIBDataSet;
     xFacturasAnualC_1: TFIBDataSet;
     DSxFacturasAnualC_1: TDataSource;
     DSxFacturasAnualC_2: TDataSource;
     xFacturasAnualC_2: TFIBDataSet;
     xFacturasAnualC_3: TFIBDataSet;
     DSxFacturasAnualC_3: TDataSource;
     frxAcreedor: TfrxHYReport;
     xTituloAcreedores: TFIBDataSet;
     DSxTituloAcreedores: TDataSource;
     procedure frAcreedorGetValue(const ParName: string; var ParValue: variant);
     procedure frAcreedorEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLSTAcreedorDestroy(Sender: TObject);
     procedure DMLSTAcreedorCreate(Sender: TObject);
     procedure frxAcreedorBeforePrint(Sender: TfrxReportComponent);
     procedure frxAcreedorGetValue(const VarName: string; var Value: variant);
     procedure QMAcreedorAfterOpen(DataSet: TDataSet);
     procedure QMAcreedorBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     tipo_grafico, ejer: integer;
     ejercicio, ejercicio2: integer;
     SW: integer;
     Serie: string;
     Canal: integer;
     TransportistaD, TransportistaH: integer;
     ClienteD, ClienteH: integer;
     FechaD, FechaH: TDateTime;
  public
     { Public declarations }
     procedure MostrarFiltrado(Modo: byte);
     procedure MostrarFiltradoFiscal(Modo: byte);
     procedure MostrarCarga(Modo: byte; ACanal: integer; ASerie: string; AFechaD, AFechaH: TDateTime; AClienteD, AClienteH, ATransportistaD, ATransportistaH: integer; Facturados, Resumido: boolean);
     procedure RecargaTransportistaCarga(var MinCli, MaxCli, MinTransp, MaxTransp: integer; var FechaD, FechaH: TDateTime);
     procedure MuestraEstadistica(tipo, ejerc, ejerc2, acreedor: integer; moneda: string; porcentaje: double);
  end;

var
  DMLSTAcreedor : TDMLSTAcreedor;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UFMAcreedores, UFormGest, UDMListados, UUtiles, ClipBrd, UDameDato;

procedure TDMLSTAcreedor.DMLSTAcreedorCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLSTAcreedor.DMLSTAcreedorDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstAcreedor.MostrarFiltrado(Modo: byte);
var
  str : string;
begin
  QMAcreedor.Close;
  QMAcreedor.Open;
  if (FMAcreedores.SWFil = 0) then
     if (FMAcreedores.SWEnlace = 0) then
        DMMain.FiltraRO(QMAcreedor, '11100', True)
     else
        DMMain.FiltraRO(QMAcreedor, '10100', True);

  SW := 1;

  if ((Modo = 0) or (Modo = 1)) then  // Listado Filtrado
     DMListados.Cargar(11, '')
  else                                  // Listado de Direcciones
     DMListados.Cargar(80, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAcreedor.LoadFromFIB(REntorno.Formato, str);
     frAcreedor.PrepareReport;
     case Modo of
        0, 2: frAcreedor.ShowPreparedReport;
        1, 3: frAcreedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxAcreedor.LoadFromFIB(REntorno.Formato, str);
     frxAcreedor.PrepareReport;
     case Modo of
        0, 2: frxAcreedor.ShowPreparedReport;
        1, 3: frxAcreedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstAcreedor.MostrarFiltradoFiscal(Modo: byte);
var
  str : string;
begin
  QMAcreedor.Close;
  QMAcreedor.Open;
  if (FMAcreedores.SWFil = 0) then
     if (FMAcreedores.SWEnlace = 0) then
        DMMain.FiltraRO(QMAcreedor, '11100', True)
     else
        DMMain.FiltraRO(QMAcreedor, '10100', True);

  SW := 1;
  DMListados.Cargar(12, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAcreedor.LoadFromFIB(REntorno.Formato, str);
     frAcreedor.PrepareReport;
     case Modo of
        0: frAcreedor.ShowPreparedReport;
        1: frAcreedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxAcreedor.LoadFromFIB(REntorno.Formato, str);
     frxAcreedor.PrepareReport;
     case Modo of
        0: frxAcreedor.ShowPreparedReport;
        1: frxAcreedor.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTAcreedor.frAcreedorGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'trans1' then
     ParValue := Format('%d %s', [TransportistaD, DameTituloAcreedor(TransportistaD)]);
  if ParName = 'trans2' then
     ParValue := Format('%d %s', [TransportistaH, DameTituloAcreedor(TransportistaH)]);
  if ParName = 'cliente1' then
     ParValue := Format('%d %s', [ClienteD, DameTituloCliente(ClienteD)]);
  if ParName = 'cliente2' then
     ParValue := Format('%d %s', [ClienteH, DameTituloCliente(ClienteH)]);
  if ParName = 'fecha1' then
     ParValue := FechaD;
  if ParName = 'fecha2' then
     ParValue := FechaH;
  if ParName = 'canal' then
  begin
     if Canal = 0 then
        ParValue := _('Todos')
     else
        ParValue := Canal;
  end;
  if ParName = 'serie' then
  begin
     if Serie = ' ' then
        ParValue := _('Todas')
     else
        ParValue := Serie;
  end;
  if ParName = 'TipoGrafico' then
     ParValue := Tipo_grafico;

  if ParName = 'Ejercicio' then
     ParValue := ejer;

  if ParName = 'Ejercicio2' then
     ParValue := ejercicio2;
end;

procedure TDMLSTAcreedor.frAcreedorEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if Memo[0] = 'Nº' then
        SW := 1;
  end;

  // Estadisticas
  if (SW = 100) then
  begin
     if Clipboard.HasFormat(CF_BITMAP) then
     begin
        (frAcreedor.FindObject('Grafica') as TfrPictureView).Picture.Bitmap.Assign(Clipboard);
     end;
  end;
end;

procedure TDMLstAcreedor.MostrarCarga(Modo: byte; ACanal: integer; ASerie: string; AFechaD, AFechaH: TDateTime; AClienteD, AClienteH, ATransportistaD, ATransportistaH: integer; Facturados, Resumido: boolean);
var
  Grupo : integer;
begin
  Canal := ACanal;
  Serie := ASerie;
  TransportistaD := ATransportistaD;
  TransportistaH := ATransportistaH;
  FechaD := AFechaD;
  FechaH := AFechaH;
  ClienteD := AClienteD;
  ClienteH := AClienteH;

  with xCarga do
  begin
     Close;
     SelectSQL.Clear;
     if (Resumido) then
     begin
        SelectSQL.Add(' SELECT TRANSPORTISTA, TITULO_TRANSPORTISTA, ARTICULO, TITULO, SUM(UNIDADES) AS SUMA ');
        SelectSQL.Add(' FROM LST_TRANSPORTISTA_CARGA(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TRANSPORTISTAD, ?TRANSPORTISTAH, ');
        SelectSQL.Add(' ?FECHAD, ?FECHAH, ?CLIENTED, ?CLIENTEH, ?FACTURADOS) ');
        SelectSQL.Add(' GROUP BY TRANSPORTISTA, TITULO_TRANSPORTISTA, ARTICULO, TITULO ');
        SelectSQL.Add(' ORDER BY TRANSPORTISTA, ARTICULO ');
        Grupo := 147;
     end
     else
     begin
        SelectSQL.Add(' SELECT * FROM LST_TRANSPORTISTA_CARGA(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TRANSPORTISTAD, ?TRANSPORTISTAH, ');
        SelectSQL.Add(' ?FECHAD, ?FECHAH, ?CLIENTED, ?CLIENTEH, ?FACTURADOS) ');
        SelectSQL.Add(' ORDER BY TRANSPORTISTA, ARTICULO, CLIENTE ');
        Grupo := 119;
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TRANSPORTISTAD'].AsInteger := TransportistaD;
     Params.ByName['TRANSPORTISTAH'].AsInteger := TransportistaH;
     Params.ByName['FECHAd'].AsDateTime := FechaD;
     Params.ByName['FECHAh'].AsDateTime := FechaH;
     Params.ByName['CLIENTED'].AsInteger := ClienteD;
     Params.ByName['CLIENTEH'].AsInteger := ClienteH;
     Params.ByName['FACTURADOS'].AsInteger := BoolToInt(Facturados);
     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, Serie, _('Listado de Carga de Transportistas'), frAcreedor, frxAcreedor, nil, nil);
end;

procedure TDMLstAcreedor.RecargaTransportistaCarga(var MinCli, MaxCli, MinTransp, MaxTransp: integer; var FechaD, FechaH: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(CLIENTE) MIN_CLIENTE, MAX(CLIENTE) MAX_CLIENTE, ');
        SQL.Add(' MIN(FECHA) AS MIN_FECHA, MAX(FECHA) AS MAX_FECHA ');
        SQL.Add(' FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND ');
        SQL.Add(' EJERCICIO=?EJERCICIO AND ');
        SQL.Add(' TIPO=''ALB'' AND ');
        SQL.Add(' ESTADO=0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.ejercicio;
        ExecQuery;
        MinCli := FieldByName['MIN_CLIENTE'].AsInteger;
        MaxCli := FieldByName['MAX_CLIENTE'].AsInteger;
        if (FieldByName['MIN_FECHA'].AsDateTime <= 0) then
        begin
           FechaD := REntorno.FechaTrabSH;
           FechaH := REntorno.FechaTrabSH;
        end
        else
        begin
           FechaD := FieldByName['MIN_FECHA'].AsDateTime;
           FechaH := FieldByName['MAX_FECHA'].AsDateTime;
        end;
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
        SQL.Add(' SELECT MIN(TRANSPORTISTA), MAX(TRANSPORTISTA) ');
        SQL.Add(' FROM GES_CABECERAS_S_ALB ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND ');
        SQL.Add(' EJERCICIO=?EJERCICIO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.ejercicio;
        ExecQuery;
        MinTransp := FieldByName['MIN'].AsInteger;
        MaxTransp := FieldByName['MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstAcreedor.MuestraEstadistica(tipo, ejerc, ejerc2, acreedor: integer; moneda: string; porcentaje: double);
var
  str : string;
begin
  tipo_grafico := tipo;
  ejer := ejerc;
  str := '';
  ejercicio := ejerc;
  ejercicio2 := ejerc2;

  with xTituloAcreedores do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Open;
  end;

  with xFacturasAnual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FCR';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualCompara do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FCR';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualC_1 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 1;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FCR';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualC_2 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FCR';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;

  with xFacturasAnualC_3 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2 - 3;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FCR';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Transaction.CommitRetaining;
  end;
  with xFacturasMensual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FCR';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
  with xFacturasMensualCompara do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['TIPO'].AsString := 'FCR';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
  with xPrevisionMensual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Params.ByName['MODO'].AsInteger := 0;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['PORCENTAJE_VENTAS'].AsDouble := Porcentaje;
     Params.ByName['TIPO'].AsString := 'FCR';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xPrevisionAnual do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio2;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ACREEDOR'].AsInteger := Acreedor;
     Params.ByName['MODO'].AsInteger := 1;
     Params.ByName['MONEDA'].AsString := moneda;
     Params.ByName['PORCENTAJE_VENTAS'].AsDouble := Porcentaje;
     Params.ByName['TIPO'].AsString := 'FCR';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
  SW := 100;
  DMListados.Cargar(199, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAcreedor.LoadFromFIB(REntorno.Formato, str);
     frAcreedor.PrepareReport;
     frAcreedor.ShowPreparedReport;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxAcreedor.LoadFromFIB(REntorno.Formato, str);
     frxAcreedor.PrepareReport;
     frxAcreedor.ShowPreparedReport;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLSTAcreedor.frxAcreedorBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('AGRUPACION', Memo[0]) > 0 then
              SW := 1;
        end;

  // Estadisticas
  if (SW = 100) then
     if Clipboard.HasFormat(CF_BITMAP) then
     begin
        (frxAcreedor.FindObject('Grafica') as TfrxPictureView).Picture.Bitmap.Assign(Clipboard);
     end;
end;

procedure TDMLSTAcreedor.frxAcreedorGetValue(const VarName: string; var Value: variant);
begin
  frAcreedorGetValue(VarName, Value);
end;

procedure TDMLSTAcreedor.QMAcreedorAfterOpen(DataSet: TDataSet);
begin
  QMTerceros.Close;
  QMTerceros.Open;
  QMTipodeProv.Close;
  QMTipodeProv.Open;
  QMFormasdePago.Close;
  QMFormasdePago.Open;
  QMIvaModos.Close;
  QMIvaModos.Open;
  QMIRPF.Close;
  QMIRPF.Open;
  QMTipoTercero.Close;
  QMTipoTercero.Open;
  QMJustifica.Close;
  QMJustifica.Open;
end;

procedure TDMLSTAcreedor.QMAcreedorBeforeClose(DataSet: TDataSet);
begin
  QMTerceros.Close;
  QMTipodeProv.Close;
  QMFormasdePago.Close;
  QMIvaModos.Close;
  QMIRPF.Close;
  QMTipoTercero.Close;
  QMJustifica.Close;
end;

end.
