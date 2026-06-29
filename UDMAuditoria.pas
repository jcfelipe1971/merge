unit UDMAuditoria;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FIBTableDataSetRO, FIBTableDataSet, HYFIBQuery;

type
  TDMAuditoria = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xAuditoria: TFIBTableSet;
     DSxAuditoria: TDataSource;
     xAuditoriaID: TIntegerField;
     xAuditoriaTABLA: TFIBStringField;
     xAuditoriaFECHA: TDateTimeField;
     xAuditoriaENTRADA: TIntegerField;
     xAuditoriaVALORES_OLD: TMemoField;
     xAuditoriaVALORES_NEW: TMemoField;
     xAuditoriaACCION: TFIBStringField;
     xAuditoriaUSUARIO: TIntegerField;
     xAuditoriaFEC_ENTRADA: TDateTimeField;
     xAuditoriaFEC_SALIDA: TDateTimeField;
     xAuditoriaUBICACION: TIntegerField;
     xAuditoriaMAQUINA: TFIBStringField;
     xAuditoriaLOGIN: TFIBStringField;
     xAuditoriaSISTEMA: TFIBStringField;
     xAuditoriaDESCRIPCION_UBICACION: TFIBStringField;
     xAuditoriaNOMBRE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xAuditoriaACCIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RellenaTablas(Lista: TStrings; Todas: boolean = True);
     procedure Filtrar(FechaDesde, FechaHasta: TDateTime; Usuario: integer; Tabla: string);
     procedure BorrarAuditoria(Dias: integer);
  end;

var
  DMAuditoria : TDMAuditoria;

implementation

uses DateUtils, UDMMain, UUtiles;

{$R *.dfm}

procedure TDMAuditoria.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xAuditoriaFECHA.DisplayFormat := ShortDateFormat;
end;

procedure TDMAuditoria.Filtrar(FechaDesde, FechaHasta: TDateTime; Usuario: integer; Tabla: string);
begin
  with xAuditoria do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_SYS_AUDITORIA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA ');
     if (Usuario <> 0) then
        SelectSQL.Add(' AND USUARIO = :USUARIO ');
     if (Tabla <> '') then
        SelectSQL.Add(' AND TABLA = :TABLA ');
     SelectSQL.Add(' ORDER BY ID ');

     Params.ByName['DESDE_FECHA'].AsDateTime := FechaDesde;
     Params.ByName['HASTA_FECHA'].AsDateTime := RecodeTime(FechaHasta, 23, 59, 59, 999);
     if (Usuario <> 0) then
        Params.ByName['USUARIO'].AsInteger := Usuario;
     if (Tabla <> '') then
        Params.ByName['TABLA'].AsString := Tabla;
     Open;
  end;
end;

procedure TDMAuditoria.BorrarAuditoria(Dias: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM SYS_AUDITORIA ');
        SQL.Add(' WHERE FECHA < :FECHA');
        Params.ByName['FECHA'].AsDateTime := Date - Dias;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAuditoria.xAuditoriaACCIONGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xAuditoriaACCION.AsString = 'I') then
     Text := _('Insercion')
  else
  if (xAuditoriaACCION.AsString = 'U') then
     Text := _('Modificacion')
  else
  if (xAuditoriaACCION.AsString = 'D') then
     Text := _('Borrado');
end;

procedure TDMAuditoria.RellenaTablas(Lista: TStrings; Todas: boolean = True);
var
  Tabla : string;
begin
  /// Rellena la lista con tablas auditadas.

  Lista.Clear;
  if (Todas) then
     Lista.AddObject(_('Todas los Tablas'), Pointer(0));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT DISTINCT TABLA FROM SYS_AUDITORIA ');
           SelectSQL.Add(' ORDER BY TABLA ');
           Open;
           while not EOF do
           begin
              Tabla := FieldByName('TABLA').AsString;
              Lista.AddObject(Tabla, Pointer(0));

              Next;
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
