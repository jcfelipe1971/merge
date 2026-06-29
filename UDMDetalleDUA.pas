unit UDMDetalleDUA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMDetalleDUA = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleID_DETALLES_E: TIntegerField;
     QMDetalleID_E: TIntegerField;
     QMDetalleDUA: TFIBStringField;
     QMDetallePROVEEDOR: TIntegerField;
     QMDetalleFECHA_ADMISION: TDateTimeField;
     QMFacturasProveedor: TFIBTableSet;
     DSFacturasProveedor: TDataSource;
     QMFacturasProveedorEMPRESA: TIntegerField;
     QMFacturasProveedorEJERCICIO: TIntegerField;
     QMFacturasProveedorCANAL: TIntegerField;
     QMFacturasProveedorSERIE: TFIBStringField;
     QMFacturasProveedorTIPO: TFIBStringField;
     QMFacturasProveedorRIG: TIntegerField;
     QMFacturasProveedorLINEA: TIntegerField;
     QMFacturasProveedorID_DETALLES_E: TIntegerField;
     QMFacturasProveedorID_E: TIntegerField;
     QMFacturasProveedorID_E_FAP: TIntegerField;
     QMFacturasProveedorDOCUMENTO: TStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure QMFacturasProveedorDOCUMENTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFacturasProveedorNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CreaRegistro(IdDetallesE: integer);
     function DameDescripcionFactura(IdE: integer): string;
  end;

var
  DMDetalleDUA : TDMDetalleDUA;

implementation

uses UDMMain, UEntorno, HYFIBQuery;

{$R *.dfm}

procedure TDMDetalleDUA.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMDetalleDUA.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;
end;

procedure TDMDetalleDUA.CreaRegistro(IdDetallesE: integer);
begin
  /// Abro el registro.
  /// Si no existe lo creo.
  /// Luego cambio a estado edicion.

  with QMDetalle do
  begin
     Close;
     Params.ByName['ID_DETALLES_E'].AsInteger := IdDetallesE;
     Open;

     if (RecordCount = 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO GES_DETALLES_E_DUA ');
              SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_E, ID_DETALLES_E) ');
              SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_E, ID_DETALLES_E FROM GES_DETALLES_E ');
              SQL.Add(' WHERE ID_DETALLES_E  = :ID_DETALLES_E ');
              Params.ByName['ID_DETALLES_E'].AsInteger := IdDetallesE;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        Close;
        Params.ByName['ID_DETALLES_E'].AsInteger := IdDetallesE;
        Open;
     end;

     Edit;
  end;
end;

function TDMDetalleDUA.DameDescripcionFactura(IdE: integer): string;
begin
  Result := '';
  if (IdE <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, F.NUM_FACTURA FROM GES_CABECERAS_E C ');
           SQL.Add(' JOIN GES_CABECERAS_E_FAC F ');
           SQL.Add(' ON C.ID_E = F.ID_E ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_E  = :ID_E ');
           Params.ByName['ID_E'].AsInteger := IdE;
           ExecQuery;
           Result := Format('Factura %d-%s/%d (%s)', [FieldByName['EJERCICIO'].AsInteger, FieldByName['SERIE'].AsString, FieldByName['RIG'].AsInteger, FieldByName['NUM_FACTURA'].AsString]);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMDetalleDUA.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  QMFacturasProveedor.Open;
end;

procedure TDMDetalleDUA.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  QMFacturasProveedor.Close;
end;

procedure TDMDetalleDUA.QMFacturasProveedorDOCUMENTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameDescripcionFactura(QMFacturasProveedorID_E_FAP.AsInteger);
end;

procedure TDMDetalleDUA.QMFacturasProveedorNewRecord(DataSet: TDataSet);
begin
  if (QMDetalle.State in [dsEdit, dsInsert]) then
     QMDetalle.Post;

  QMFacturasProveedorEMPRESA.AsInteger := QMDetalleEMPRESA.AsInteger;
  QMFacturasProveedorEJERCICIO.AsInteger := QMDetalleEJERCICIO.AsInteger;
  QMFacturasProveedorCANAL.AsInteger := QMDetalleCANAL.AsInteger;
  QMFacturasProveedorSERIE.AsString := QMDetalleSERIE.AsString;
  QMFacturasProveedorTIPO.AsString := QMDetalleTIPO.AsString;
  QMFacturasProveedorRIG.AsInteger := QMDetalleRIG.AsInteger;
  QMFacturasProveedorLINEA.AsInteger := QMDetalleLINEA.AsInteger;
  QMFacturasProveedorID_E.AsInteger := QMDetalleID_E.AsInteger;
  QMFacturasProveedorID_DETALLES_E.AsInteger := QMDetalleID_DETALLES_E.AsInteger;
end;

end.
