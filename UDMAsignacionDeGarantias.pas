unit UDMAsignacionDeGarantias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery, FR_DSet, FR_DBSet, FR_Desgn, FR_Class, FR_BarC;

type
  TDMAsignacionDeGarantias = class(TDataModule)
     TLocal: THYTransaction;
     xGarantiaCabecera: TFIBTableSet;
     xGarantiaCabeceraEMPRESA: TIntegerField;
     xGarantiaCabeceraARTICULO: TFIBStringField;
     xGarantiaCabeceraID: TIntegerField;
     xGarantiaCabeceraUSUARIO: TIntegerField;
     xGarantiaCabeceraFECHA_EMBALAJE: TDateTimeField;
     xGarantiaCabeceraFECHA_VENTA: TDateTimeField;
     xGarantiaCabeceraCLIENTE: TIntegerField;
     xGarantiaCabeceraOBSERVACIONES: TBlobField;
     xGarantiaCabeceraIMPRESO: TIntegerField;
     xGarantiaDetalle: TFIBTableSet;
     xGarantiaDetalleEMPRESA: TIntegerField;
     xGarantiaDetalleARTICULO: TFIBStringField;
     xGarantiaDetalleID: TIntegerField;
     xGarantiaDetalleDETALLE: TFIBStringField;
     xGarantiaDetalleREFERENCIA: TFIBStringField;
     xGarantiaDetalleORDEN_TRABAJO: TFIBStringField;
     DSxGarantiaCabecera: TDataSource;
     DSxGarantiaDetalle: TDataSource;
     xLstGarantia: TFIBTableSet;
     dsxLstGarantia: TDataSource;
     frReport1: TfrReport;
     frDBxLstGarantia: TfrDBDataSet;
     xLstGarantiaDetalle: TFIBTableSet;
     DsxLstGarantiaDetalle: TDataSource;
     frDBxLstGarantiaDetalle: TfrDBDataSet;
     xGarantiaCabeceraORDEN_TRABAJO: TFIBStringField;
     xGarantiaDetalleORDEN: TIntegerField;
     xGarantiaCabeceraALBARAN: TStringField;
     xGarantiaCabeceraID_DETALLES_S_ALB: TIntegerField;
     TUpdate: THYTransaction;
     procedure xGarantiaCabeceraNewRecord(DataSet: TDataSet);
     procedure xGarantiaDetalleNewRecord(DataSet: TDataSet);
     procedure xGarantiaCabeceraAfterPost(DataSet: TDataSet);
     procedure xGarantiaDetalleBeforeInsert(DataSet: TDataSet);
     procedure repetir;
     procedure xGarantiaCabeceraBeforePost(DataSet: TDataSet);
     procedure xGarantiaCabeceraALBARANGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DataModuleCreate(Sender: TObject);
     procedure xGarantiaCabeceraAfterOpen(DataSet: TDataSet);
     procedure xGarantiaCabeceraBeforeClose(DataSet: TDataSet);
     procedure xLstGarantiaAfterOpen(DataSet: TDataSet);
     procedure xLstGarantiaBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraPorReferencia(Referencia: string);
     procedure ImprimirEtiqueta(Previsualizar: boolean; Listado: integer);
     function DameArticuloGarantia(Articulo: string): string;
  end;

var
  DMAsignacionDeGarantias : TDMAsignacionDeGarantias;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMAsignacionDeGarantias.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(xGarantiaCabecera, '10000', True);
end;

procedure TDMAsignacionDeGarantias.xGarantiaCabeceraNewRecord(DataSet: TDataSet);
begin
  xGarantiaCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  xGarantiaCabeceraIMPRESO.AsInteger := 0;
  xGarantiaCabeceraUSUARIO.AsInteger := REntorno.Usuario;
  xGarantiaCabeceraCLIENTE.AsInteger := -1;
end;

procedure TDMAsignacionDeGarantias.xGarantiaCabeceraBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(ID) AS ID FROM ART_ARTICULOS_GARANTIAS';
           ExecQuery;
           xGarantiaCabeceraID.AsInteger := FieldByName['ID'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMAsignacionDeGarantias.xGarantiaCabeceraAfterPost(DataSet: TDataSet);
begin
  // Refresco porque los triggers crean lineas de detalle
  xGarantiaDetalle.Close;
  xGarantiaDetalle.Open;
end;

procedure TDMAsignacionDeGarantias.xGarantiaDetalleNewRecord(DataSet: TDataSet);
begin
  xGarantiaDetalleEMPRESA.AsInteger := REntorno.Empresa;
  xGarantiaDetalleARTICULO.AsString := xGarantiaCabeceraARTICULO.AsString;
  xGarantiaDetalleID.AsInteger := xGarantiaCabeceraID.AsInteger;
end;

procedure TDMAsignacionDeGarantias.xGarantiaDetalleBeforeInsert(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Cancel;
end;

procedure TDMAsignacionDeGarantias.Repetir;
var
  Articulo : string;
  Usuario : integer;
  fecha_embalaje : TDateTime;
  Fecha_Venta : TDateTime;
  Cliente : integer;
  Observaciones : variant;
  ID_aux : integer;
  OrdenTrabajo : string;
begin
  ID_aux := xGarantiaCabeceraID.Value;

  Articulo := xGarantiaCabeceraARTICULO.Value;
  Usuario := xGarantiaCabeceraUSUARIO.Value;
  Fecha_Embalaje := xGarantiaCabeceraFECHA_EMBALAJE.Value;
  Fecha_Venta := xGarantiaCabeceraFECHA_VENTA.Value;
  Cliente := xGarantiaCabeceraCLIENTE.Value;
  Observaciones := xGarantiaCabeceraOBSERVACIONES.AsVariant;
  OrdenTrabajo := xGarantiaCabeceraORDEN_TRABAJO.Value;

  xGarantiaCabecera.Insert;

  xGarantiaCabeceraARTICULO.Value := Articulo;
  xGarantiaCabeceraUSUARIO.Value := Usuario;
  xGarantiaCabeceraFECHA_EMBALAJE.Value := Fecha_Embalaje;
  xGarantiaCabeceraFECHA_VENTA.Value := Fecha_Venta;
  xGarantiaCabeceraCLIENTE.Value := Cliente;
  xGarantiaCabeceraOBSERVACIONES.AsVariant := Observaciones;
  xGarantiaCabeceraORDEN_TRABAJO.Value := OrdenTrabajo;

  xGarantiaCabecera.Post;

  xGarantiaDetalle.DisableControls;
  try
     xGarantiaDetalle.First;
     while not xGarantiaDetalle.EOF do
     begin
        xGarantiaDetalle.Edit;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT ORDEN_TRABAJO FROM ART_ARTICULOS_GARANTIAS_DET ' +
                 'WHERE ' +
                 'EMPRESA = ' + xGarantiaCabeceraEMPRESA.AsString + ' AND ' +
                 'ARTICULO = ''' + xGarantiaDetalleARTICULO.AsString + ''' AND ' +
                 'ID = ' + IntToStr(ID_aux) + ' AND ' +
                 'DETALLE = ''' + xGarantiaDetalleDETALLE.AsString + '''';
              ExecQuery;
              xGarantiaDetalleORDEN_TRABAJO.AsString := FieldByName['ORDEN_TRABAJO'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;

        xGarantiaDetalle.Post;
        xGarantiaDetalle.Next;
     end;
     xGarantiaDetalle.First;
  finally
     xGarantiaDetalle.EnableControls;
  end;
end;

procedure TDMAsignacionDeGarantias.FiltraPorReferencia(Referencia: string);
begin
  with xGarantiaCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM ART_ARTICULOS_GARANTIAS ');
     if (Trim(Referencia) <> '') then
        if (Pos('%', Referencia) = 0) then
           SelectSQL.Add('WHERE ID in (SELECT ID FROM ART_ARTICULOS_GARANTIAS_DET WHERE REFERENCIA=''' + Trim(Referencia) + ''') ')
        else
           SelectSQL.Add('WHERE ID in (SELECT ID FROM ART_ARTICULOS_GARANTIAS_DET WHERE REFERENCIA like ''' + Trim(Referencia) + ''') ');
     SelectSQL.Add('ORDER BY ID desc, FECHA_EMBALAJE desc');
     Open;
  end;
end;

procedure TDMAsignacionDeGarantias.xGarantiaCabeceraALBARANGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xGarantiaCabeceraID_DETALLES_S_ALB.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TIPO||'' ''||EJERCICIO||''-''||SERIE||''/''||RIG FROM GES_DETALLES_S ' +
              'WHERE ' +
              'ID_DETALLES_S = ' + xGarantiaCabeceraID_DETALLES_S_ALB.AsString;
           ExecQuery;
           Text := Fields[0].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     Text := '';
end;

procedure TDMAsignacionDeGarantias.ImprimirEtiqueta(Previsualizar: boolean; Listado: integer);
var
  Copias : integer;
begin
  Copias := 1;
  // Si voy a imprimir, averiguo la cantidad de etiquetas que se necesitan
  if (not Previsualizar) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT NRO_ETIQUETAS FROM ART_ARTICULOS_ESC_GARANTIA WHERE ' +
              'EMPRESA = ' + xGarantiaCabeceraEMPRESA.AsString + ' AND ' +
              'ARTICULO = ''' + xGarantiaCabeceraARTICULO.AsString + '''';
           ExecQuery;
           Copias := FieldByName['NRO_ETIQUETAS'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  with xLStGarantia do
  begin
     if not (Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     Params.ByName['EMPRESA'].Value := xGarantiaCabeceraEMPRESA.Value;
     Params.ByName['ARTICULO'].Value := xGarantiaCabeceraARTICULO.Value;
     Params.ByName['ID'].Value := xGarantiaCabeceraID.Value;
     Open;
  end;

  frReport1.ChangePrinter(0, 1);
  with frReport1 do
  begin
     LoadFromFile(Format('LGarantias%d.frf', [Listado]));
     Title := Format('Etiqueta de Garantias %d', [Listado]);

     ChangePrinter(-1, REntorno.Etiquetas);

     PrepareReport;
     if (Previsualizar) then
        ShowPreparedReport
     else
        PrintPreparedReport('', Copias, True, frAll);
  end;
end;

function TDMAsignacionDeGarantias.DameArticuloGarantia(Articulo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM ART_ARTICULOS_ESC_GARANTIA WHERE ' +
           'EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND ' +
           'ARTICULO = ''' + Articulo + '''';
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsignacionDeGarantias.xGarantiaCabeceraAfterOpen(DataSet: TDataSet);
begin
  xGarantiaDetalle.Open;
end;

procedure TDMAsignacionDeGarantias.xGarantiaCabeceraBeforeClose(DataSet: TDataSet);
begin
  xGarantiaDetalle.Close;
end;

procedure TDMAsignacionDeGarantias.xLstGarantiaAfterOpen(DataSet: TDataSet);
begin
  xLstGarantiaDetalle.Open;
end;

procedure TDMAsignacionDeGarantias.xLstGarantiaBeforeClose(DataSet: TDataSet);
begin
  xLstGarantiaDetalle.Close;
end;

end.
