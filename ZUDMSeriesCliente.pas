unit ZUDMSeriesCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FIBQuery, HYFIBQuery, FIBTableDataSet, ComCtrls;

type
  TZDMSeriesCli = class(TDataModule)
     TLocal: THYTransaction;
     QMCabSeriesCli: TFIBTableSet;
     QMDetSeriesCli: TFIBTableSet;
     DSCabSeriesCli: TDataSource;
     QMCabSeriesCliID: TIntegerField;
     QMCabSeriesCliEMPRESA: TIntegerField;
     QMCabSeriesCliCLIENTE: TIntegerField;
     QMCabSeriesCliFECHA: TDateTimeField;
     DSDetSeriesCli: TDataSource;
     TUpdate: THYTransaction;
     QMCabSeriesCliNOMBRE_R_SOCIAL: TFIBStringField;
     QMDetSeriesCliID: TIntegerField;
     QMDetSeriesCliID_CAB: TIntegerField;
     QMDetSeriesCliEMPRESA: TIntegerField;
     QMDetSeriesCliCLIENTE: TIntegerField;
     QMDetSeriesCliLINEA: TIntegerField;
     QMDetSeriesCliARTICULO: TFIBStringField;
     QMDetSeriesCliCANAL: TIntegerField;
     QMDetSeriesCliALMACEN: TFIBStringField;
     QMDetSeriesCliCODIGO: TIntegerField;
     QMDetSeriesCliTITULO: TFIBStringField;
     QMDetSeriesCliNSERIE: TFIBStringField;
     QMDetSeriesCliFECHA_CADUCIDAD: TDateTimeField;
     QMDetSeriesCliFECHA_GARANTIA_CLIENTE: TDateTimeField;
     QMDetSeriesCliFECHA_GARANTIA_PROVEEDOR: TDateTimeField;
     QMDetSeriesCliNOTAS: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabSeriesCliAfterOpen(DataSet: TDataSet);
     procedure QMCabSeriesCliNewRecord(DataSet: TDataSet);
     procedure QMCabSeriesCliBeforePost(DataSet: TDataSet);
     procedure QMDetSeriesCliNewRecord(DataSet: TDataSet);
     procedure QMCabSeriesCliBeforeClose(DataSet: TDataSet);
     procedure QMDetSeriesCliBeforePost(DataSet: TDataSet);
     procedure QMDetSeriesCliNSERIEChange(Sender: TField);
     procedure QMDetSeriesCliARTICULOChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     function BusquedaCompleja: integer;
     procedure ExportacionExcel(Archivo: string; ProgressBar: TProgressBar = nil);
  end;

var
  ZDMSeriesCli : TZDMSeriesCli;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles, UDameDato;

{$R *.dfm}

procedure TZDMSeriesCli.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMCabSeriesCli, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetSeriesCli, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMCabSeriesCli, '10000');
end;

procedure TZDMSeriesCli.QMCabSeriesCliAfterOpen(DataSet: TDataSet);
begin
  QMDetSeriesCli.Close;
  QMDetSeriesCli.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  QMDetSeriesCli.Open;
end;

procedure TZDMSeriesCli.QMCabSeriesCliBeforeClose(DataSet: TDataSet);
begin
  QMDetSeriesCli.Close;
end;

procedure TZDMSeriesCli.QMCabSeriesCliNewRecord(DataSet: TDataSet);
begin
  QMCabSeriesCliEMPRESA.AsInteger := REntorno.Empresa;
  QMCabSeriesCliFECHA.AsDateTime := Date;
end;

procedure TZDMSeriesCli.QMCabSeriesCliBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMCabSeriesCliID.AsInteger := DMMain.ContadorGen('ID_ART_ARTICULOS_SER_CLI');
end;

procedure TZDMSeriesCli.QMDetSeriesCliNewRecord(DataSet: TDataSet);
begin
  QMDetSeriesCliID_CAB.AsInteger := QMCabSeriesCliID.AsInteger;
  QMDetSeriesCliCANAL.AsInteger := REntorno.Canal;
  QMDetSeriesCliEMPRESA.AsInteger := QMCabSeriesCliEMPRESA.AsInteger;
  QMDetSeriesCliCLIENTE.AsInteger := QMCabSeriesCliCLIENTE.AsInteger;
  QMDetSeriesCliALMACEN.AsString := REntorno.AlmacenDefecto;
end;

procedure TZDMSeriesCli.QMDetSeriesCliBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(LINEA) FROM ART_ARTICULOS_SER_CLI_DET WHERE ID_CAB = :ID_CAB';
           Params.ByName['ID_CAB'].AsInteger := QMCabSeriesCliID.AsInteger;
           ExecQuery;
           QMDetSeriesCliLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TZDMSeriesCli.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMCabSERiesCli, '10000');
end;

procedure TZDMSeriesCli.QMDetSeriesCliNSERIEChange(Sender: TField);
begin
  // Obtengo el codigo segun el nro. de serie
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CODIGO FROM ART_ARTICULOS_SERIALIZACION ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CANAL =:CANAL AND ');
        SQL.Add(' ALMACEN = :ALMACEN AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' NSERIE = :NSERIE ');
        Params.ByName['EMPRESA'].AsInteger := QMDetSeriesCliEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMDetSeriesCliCANAL.AsInteger;
        Params.ByName['ALMACEN'].AsString := QMDetSeriesCliALMACEN.AsString;
        Params.ByName['ARTICULO'].AsString := QMDetSeriesCliARTICULO.AsString;
        Params.ByName['NSERIE'].AsString := QMDetSeriesCliNSERIE.AsString;
        ExecQuery;
        QMDetSeriesCliCODIGO.AsInteger := FieldByName['CODIGO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMSeriesCli.QMDetSeriesCliARTICULOChange(Sender: TField);
begin
  QMDetSeriesCliTITULO.AsString := DameTituloArticulo(QMDetSeriesCliARTICULO.AsString);
end;

procedure TZDMSeriesCli.ExportacionExcel(Archivo: string; ProgressBar: TProgressBar = nil);
var
  DS : TFIBDataSet;
  D : TDataSOurce;
begin
  DS := TFIBDataSet.Create(nil);
  with DS do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT C.ID, C.EMPRESA, C.CLIENTE, C.FECHA, T.NOMBRE_R_SOCIAL, L.PAIS, L.PROVINCIA, LP.TITULO TITULO_PROVINCIA, ');
           SelectSQL.Add('        A.LINEA, A.ARTICULO, A.CODIGO, AA.TITULO_LARGO, SS.NSERIE, SS.FECHA_CADUCIDAD, SS.FECHA_GARANTIA_CLIENTE, ');
           SelectSQL.Add('        SS.FECHA_GARANTIA_PROVEEDOR, CAST(SUBSTRING(SS.NOTAS FROM 1 FOR 60) AS VARCHAR(60)) NOTAS ');
           SelectSQL.Add(' FROM ART_ARTICULOS_SER_CLI C ');
           SelectSQL.Add(' LEFT JOIN EMP_CLIENTES CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = CC.CLIENTE ');
           SelectSQL.Add(' LEFT JOIN SYS_TERCEROS T ON CC.TERCERO = T.TERCERO ');
           SelectSQL.Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES TD ON T.TERCERO = TD.TERCERO AND TD.DIR_DEFECTO  = 1 ');
           SelectSQL.Add(' LEFT JOIN SYS_LOCALIDADES L ON TD.ID_LOCAL = L.ID_LOCAL ');
           SelectSQL.Add(' LEFT JOIN SYS_PROVINCIAS LP ON L.PAIS = LP.PAIS AND L.PROVINCIA = LP.PROVINCIA ');
           SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_SER_CLI_DET A ON C.EMPRESA = A.EMPRESA AND C.CLIENTE = A.CLIENTE ');
           SelectSQL.Add(' LEFT JOIN ART_ARTICULOS AA ON A.EMPRESA = AA.EMPRESA AND A.ARTICULO = AA.ARTICULO ');
           SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_SERIALIZACION SS ON A.EMPRESA = SS.EMPRESA AND A.ARTICULO = SS.ARTICULO AND A.CANAL = SS.CANAL AND A.ALMACEN = SS.ALMACEN AND A.CODIGO = SS.CODIGO ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' C.EMPRESA = :EMPRESA ');
           SelectSQL.Add(' ORDER BY C.CLIENTE, A.ARTICULO, SS.NSERIE ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Open;
           D := TDataSource.Create(nil);
           try
              D.DataSet := DS;
              if (UpperCase(ExtractFileExt(Archivo)) = '.CSV') then
                 ExportarCSV(Archivo, D, ';', True, True, True, '.', ProgressBar)
              else
                 ExportarExcel(Archivo, D, True, True, ProgressBar);
           finally
              D.Free;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

end.
