unit UDMAsistenteImpAsientos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB,
  ADODB, OleServer, Excel2000, Contnrs, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet;

type
  // Define el tipo necesitado para la lista de documentos a procesar
  TDocInfo = class
     // Asiento y fecha
     fasiento: integer;
     ffecha: TDateTime;
  public
     property asiento: integer Read fasiento Write fasiento;
     property fecha: TDateTime Read ffecha Write ffecha;
  end;

  TDocInfoList = TList;

  TDMAsistenteImpAsientos = class(TDataModule)
     TLocal: THYTransaction;
     XLApp: TExcelApplication;
     QLlenarTemporal: THYFIBQuery;
     QBorrarTemporal: THYFIBQuery;
     QMAsientosImp: TFIBTableSet;
     DSQMAsientosImp: TDataSource;
     QSeleccionarTodas: THYFIBQuery;
     QCantSel: THYFIBQuery;
     DSxRecorreAsientos: TDataSource;
     QInsertarAsiento: THYFIBQuery;
     QInsertarApunte: THYFIBQuery;
     TUpdate: THYTransaction;
     xAsientos: TFIBDataSetRO;
     IntegerField1: TIntegerField;
     DateTimeField1: TDateTimeField;
     xApuntes: TFIBDataSetRO;
     xApuntesENTRADA: TIntegerField;
     xApuntesASIENTO: TIntegerField;
     xApuntesLINEA: TIntegerField;
     xApuntesCUENTA: TFIBStringField;
     xApuntesTITULO: TFIBStringField;
     xApuntesTEXTO: TFIBStringField;
     xApuntesTIPO: TFIBStringField;
     xApuntesIMPORTE: TFloatField;
     xApuntesMARCADO: TIntegerField;
     xApuntesDEBE: TFloatField;
     xApuntesHABER: TFloatField;
     xApuntesFECHA: TDateTimeField;
     xApuntesID: TIntegerField;
     QInsertarApuntes: THYFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMAsientosImpNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     Filas: TObjectList;
     ColAsiento, ColLinea, ColCuenta, ColFecha, ColTextoAsiento, ColTipoAsiento, ColImporte: integer;
     FilaSiguiente: boolean;
     RIB: integer;
     PorDebeYHaber: boolean;
     function NuevoRIB: boolean;
     // Procedimientos que trabajan con el array de documentos  a procesar.
     function FillDocInfoListFromDRO(dro: TFIBDataSetRO; Count: integer): TDocInfoList;
  public
     { Public declarations }
     Error: string;
     function LeerDatos(Archivo: string): boolean;
     function LeerDatosCalc(Archivo: string): boolean;
     function DameFilas: TObjectList;
     function DameColumnas: TStrings;
     function LlenarTablaTemporal(CAsiento, CLinea, CCuenta, CFecha, CTextoAsiento, CTipoAsiento, CImporte: smallint; PorDebeYHaber: boolean): boolean;
     procedure BorrarTablaTemporal;
     procedure AbrirAsientosImp;
     procedure SeleccionarTodas(Modo: smallint);
     function Seleccionados: boolean;
     function InicializaProceso: TDocInfoList;
     function ImportarAsiento(Asiento: integer; Fecha: TDateTime): boolean;
     function ImportarApuntes(Asiento: integer): boolean;
  end;

var
  DMAsistenteImpAsientos : TDMAsistenteImpAsientos;

implementation

uses UDMMain, UEntorno, Variants, UUtiles, Dialogs, StrUtils, DateUtils, UHojaCalc;

{$R *.dfm}

procedure TDMAsistenteImpAsientos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  Filas := TObjectList.Create;
  ColAsiento := 0;
  ColLinea := 0;
  ColCuenta := 0;
  ColFecha := 0;
  ColTextoAsiento := 0;
  ColTipoAsiento := 0;
  ColImporte := 0;
end;

procedure TDMAsistenteImpAsientos.DataModuleDestroy(Sender: TObject);
begin
  Filas.Free;
  BorrarTablaTemporal;
end;

function TDMAsistenteImpAsientos.LeerDatos(Archivo: string): boolean;
var
  WorkBk : _WorkBook;
  WorkSheet : _WorkSheet;
  f, c, x, y, i, j : integer;
  IIndex : olevariant;
  Matrix : variant;
  Columnas : TObjectList;
  StrList : TStrings;
begin
  IIndex := 1;
  Result := True;
  FilaSiguiente := False;
  try
     Columnas := TObjectList.Create;

     DMMain.Log('F create Excel');
     XLApp.Connect;
     try
        DMMain.Log('HCalc.FileName = ' + Archivo);
        XLApp.WorkBooks.Open(Archivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, 0);

        DMMain.Log('XLApp.WorkBooks.Item[' + IntToStr(IIndex) + ']');
        WorkBk := XLApp.WorkBooks.Item[IIndex];
        WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;

        WorkSheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

        with XLApp.Range['A1', XLApp.ActiveCell] do
        begin
           x := Rows.Count;
           y := Columns.Count;
           Matrix := Value;
        end;
        DMMain.Log(format('Rows.Count:%d - Columns.Count:%d', [x, y]));

        // XLApp.Quit;
        // XLApp.Disconnect;

        // Se eliminan las columnas vacías
        Columnas.Capacity := y;
        for c := 1 to y do
        begin
           StrList := TStringList.Create;
           for f := 1 to x do
           begin
              try
                 StrList.Add(LimpiaCeldaExcel(Matrix[f, c]));
              except
                 StrList.Add(_('ERROR'));
              end;
           end;

           // Se eliminan las columnas vacías
           if Trim(StrList.Text) <> '' then
              Columnas.Add(StrList)
           else
           begin
              DMMain.Log(format('Eliminando Columna Vacia: %d', [c]));
              StrList.Free;
           end;
        end;

        // Matrix := Unassigned;

        // Se elimanan las filas vacías.
        DMMain.Log('Eliminando filas vacias');
        Filas.Clear;
        Filas.Capacity := x;
        for f := 0 to x - 1 do
        begin
           StrList := TStringList.Create;
           for c := 0 to Columnas.Count - 1 do
              StrList.Add((Columnas.Items[c] as TStrings)[f]);

           if Trim(StrList.Text) <> '' then
              Filas.Add(StrList)
           else
           begin
              DMMain.Log(format('Eliminando Fila Vacia: %d', [f]));
              StrList.Free;
           end;
        end;

        // Asegurarse que las columnas tenga el título correcto
        i := 0;
        while (i < Columnas.Count) and
           ((IsValidIdent(Trim((Filas.Items[0] as TStrings)[i]))) or
              (Trim((Filas.Items[0] as TStrings)[i]) = '')) do
           i := i + 1;

        if (i < Columnas.Count) then
        begin
           StrList := TStringList.Create;
           for j := 0 to Columnas.Count - 1 do
              StrList.Add(_('Columna') + ' ' + IntToStr(j + 1));
           Filas.Insert(0, StrList);
           FilaSiguiente := True;
        end
        else
        begin
           for j := 0 to Columnas.Count - 1 do
              if (Trim((Filas.Items[0] as TStrings)[j]) = '') then
              begin
                 (Filas.Items[0] as TStrings)[j] := _('Columna') + ' ' + IntToStr(j + 1);
                 FilaSiguiente := True;
              end;
        end;

        DMMain.Log('Fin importacion');
     finally
        Matrix := Unassigned;
        XLApp.Quit;
        XLApp.Disconnect;
        Columnas.Free;
     end;
  except
     on E: Exception do
     begin
        MensajesDeError(E);
        Result := False;
     end;
  end;
end;

function TDMAsistenteImpAsientos.LeerDatosCalc(Archivo: string): boolean;
var
  HCalc : THojaCalc;
  f, c, x, y, i, j : integer;
  Hoja : integer;
  Columnas : TObjectList;
  StrList : TStrings;
begin
  Hoja := 1;
  Result := True;
  try
     Columnas := TObjectList.Create;

     DMMain.Log('F create Excel');
     HCalc := THojaCalc.Create(Archivo, False);
     try
        DMMain.Log('HCalc.FileName = ' + Archivo);
        HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

        DMMain.Log('HCalc.ActivateSheetByIndex(' + IntToStr(Hoja) + ')');
        HCalc.ActivateSheetByIndex(Hoja);

        DMMain.Log('HCalc.Last Row/Col');
        x := HCalc.LastRow + 1;
        y := HCalc.LastCol + 1;
        DMMain.Log(format('LastRow:%d - LastCol:%d', [x, y]));

        // Se eliminan las columnas vacías
        Columnas.Capacity := y;
        for c := 1 to y do
        begin
           StrList := TStringList.Create;
           for f := 1 to x do
           begin
              try
                 StrList.Add(LimpiaCeldaExcel(HCalc.CellText[f, c]));
                 DMMain.Log(format('Celda(%d, %d) = <%s>', [f, c, HCalc.CellText[f, c]]));
              except
                 StrList.Add(_('ERROR'));
              end;
           end;

           // Se eliminan las columnas vacías
           if Trim(StrList.Text) <> '' then
              Columnas.Add(StrList)
           else
           begin
              DMMain.Log(format('Eliminando Columna Vacia: %d', [c]));
              StrList.Free;
           end;
           // FMAsistenteImpClientes.ProgresoImportacion.Position := c;
        end;

        // Se elimanan las filas vacías.
        DMMain.Log('Eliminando filas vacias');
        Filas.Clear;
        Filas.Capacity := x;
        for f := 0 to x - 1 do
        begin
           StrList := TStringList.Create;
           for c := 0 to Columnas.Count - 1 do
              StrList.Add((Columnas.Items[c] as TStrings)[f]);

           if Trim(StrList.Text) <> '' then
              Filas.Add(StrList)
           else
           begin
              DMMain.Log(format('Eliminando Fila Vacia: %d', [f]));
              StrList.Free;
           end;
        end;

        // Asegurarse que las columnas tenga el título correcto
        i := 0;
        while (i < Columnas.Count) and
           ((IsValidIdent(Trim((Filas.Items[0] as TStrings)[i]))) or
              (Trim((Filas.Items[0] as TStrings)[i]) = '')) do
           i := i + 1;
        if (i < Columnas.Count) then
        begin
           StrList := TStringList.Create;
           for j := 0 to Columnas.Count - 1 do
              StrList.Add(_('Columna') + ' ' + IntToStr(j + 1));
           Filas.Insert(0, StrList);
           FilaSiguiente := True;
        end
        else
        begin
           for j := 0 to Columnas.Count - 1 do
              if (Trim((Filas.Items[0] as TStrings)[j]) = '') then
              begin
                 (Filas.Items[0] as TStrings)[j] := _('Columna') + ' ' + IntToStr(j + 1);
                 FilaSiguiente := True;
              end;
        end;

        DMMain.Log('Fin importacion');
     finally
        Sleep(1000);
        DMMain.Log('I Liberar Excel');
        HCalc.Free;
        Columnas.Free;
     end;
  except
     on E: Exception do
     begin
        MensajesDeError(E);
        Result := False;
     end;
  end;
end;

function TDMAsistenteImpAsientos.DameFilas: TObjectList;
begin
  Result := Filas;
end;

function TDMAsistenteImpAsientos.DameColumnas: TStrings;
begin
  Result := (Filas.Items[0] as TStrings);
end;

function TDMAsistenteImpAsientos.LlenarTablaTemporal(CAsiento, CLinea, CCuenta, CFecha, CTextoAsiento, CTipoAsiento, CImporte: smallint; PorDebeYHaber: boolean): boolean;
var
  i, Asiento, Linea : integer;
  Importe, Debe, Haber : double;
  Cuenta, TextoAsiento, TipoAsiento : string;
  Fecha : TDateTime;
begin
  Result := True;
  ColAsiento := CAsiento;
  ColLinea := CLinea;
  ColCuenta := CCuenta;
  ColFecha := CFecha;
  ColTextoAsiento := CTextoAsiento;
  ColTipoAsiento := CTipoAsiento;
  ColImporte := CImporte;
  Self.PorDebeYHaber := PorDebeYHaber;

  Asiento := 0;
  Linea := 0;
  Fecha := REntorno.FechaTrab;

  BorrarTablaTemporal;
  try
     for I := 1 to Filas.Count - 1 do
     begin
        if not (FilaSiguiente) then
        begin
           with QLlenarTemporal do
           begin
              if (ColAsiento > 0) then
                 Asiento := StrToInt((Filas.Items[I] as TStrings)[ColAsiento - 1]);
              if (ColLinea > 0) then
                 Linea := StrToInt((Filas.Items[I] as TStrings)[ColLinea - 1]);

              Cuenta := Copy(((Filas.Items[I] as TStrings)[ColCuenta - 1]), 1, 12);
              TextoAsiento := Copy((Filas.Items[I] as TStrings)[ColTextoAsiento - 1], 1, 100);

              if (PorDebeyHaber) then
              begin
                 if (not TryStrToFloat((Filas.Items[I] as TStrings)[ColTipoAsiento - 1], Debe)) then
                    Debe := 0;

                 if (not TryStrToFloat((Filas.Items[I] as TStrings)[ColImporte - 1], Haber)) then
                    Haber := 0;

                 // Debe := StrToFloat((Filas.Items[I] as TStrings)[ColTipoAsiento - 1]);
                 // Haber := StrToFloat((Filas.Items[I] as TStrings)[ColImporte - 1]);
                 TipoAsiento := '';
                 Importe := 0;
              end
              else
              begin
                 Debe := 0;
                 Haber := 0;
                 TipoAsiento := Copy((Filas.Items[I] as TStrings)[ColTipoAsiento - 1], 1, 1);
                 if (not TryStrToFloat((Filas.Items[I] as TStrings)[ColImporte - 1], Importe)) then
                    Importe := 0;
                 // Importe := StrToFloat((Filas.Items[I] as TStrings)[ColImporte - 1]);
              end;

              if (ColFecha > 0) then
                 Fecha := StrToDateTime((Filas.Items[I] as TStrings)[ColFecha - 1]);

              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ASIENTO'].AsInteger := Asiento;
              Params.ByName['LINEA'].AsInteger := Linea;
              Params.ByName['CUENTA'].AsString := Cuenta;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              Params.ByName['TEXTO'].AsString := TextoAsiento;
              Params.ByName['TIPO'].AsString := TipoAsiento;
              Params.ByName['IMPORTE'].AsFloat := Importe;
              Params.ByName['DEBE'].AsFloat := Debe;
              Params.ByName['HABER'].AsFloat := Haber;
              ExecQuery;
           end;
        end;
        FilaSiguiente := False;
     end;
  except
     on E: Exception do
     begin
        MensajesDeError(E);
        Result := False;
     end;
  end;

  if (Result) then
     AbrirAsientosImp;
end;

procedure TDMAsistenteImpAsientos.BorrarTablaTemporal;
begin
  with QBorrarTemporal do
  begin
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMAsistenteImpAsientos.QMAsientosImpNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMAsistenteImpAsientos.AbrirAsientosImp;
begin
  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;
  with QMAsientosImp do
  begin
     DisableControls;
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     EnableControls;
  end;
end;

procedure TDMAsistenteImpAsientos.SeleccionarTodas(Modo: smallint);
begin
  with QSeleccionarTodas do
  begin
     Params.ByName['MODO'].AsInteger := Modo;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     FreeHandle;
  end;
  AbrirAsientosImp;
end;

function TDMAsistenteImpAsientos.Seleccionados: boolean;
begin
  with QCantSel do
  begin
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     Result := FieldByName['CANTIDAD'].AsInteger > 0;
     FreeHandle;
  end;
end;

function TDMAsistenteImpAsientos.NuevoRIB: boolean;
var
  Q : THYFIBQuery;
begin
  RIB := 0;
  Result := True;
  Error := '';
  Q := THYFIBQuery.Create(nil);
  with Q do
     try
        try
           Database := DMMain.DataBase;
           SQL.Text := 'execute procedure cod_contadores_ee(?empresa,?ejercicio,''RIB'')';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           ExecQuery;
           RIB := FieldByName['CODIGO'].AsInteger;
        except
           on E: Exception do
           begin
              Result := False;
              Error := E.Message;
           end;
        end;
     finally
        Free;
     end;
end;

function TDMAsistenteImpAsientos.FillDocInfoListFromDRO(dro: TFIBDataSetRO; Count: integer): TDocInfoList;
var
  // i : integer;
  list : TDocInfoList;
  node : TDocInfo;
begin
  list := nil;
  with dro do
  begin
     if Count > 0 then
     begin
        First;
        // i := 0;
        list := TList.Create();
        //SetLength(list,count);
        while not EOF do
        begin
           // Try asiento field
           node := TDocInfo.Create();
           try
              node.asiento := FieldByName('asiento').AsInteger;
           except
              on E: Exception do
                 node.asiento := 0;
           end;

           // Try fecha field
           try
              node.fecha := FieldByName('fecha').AsDateTime;
           except
              on E: Exception do
                 node.fecha := EncodeDateTime(1899, 12, 30, 00, 00, 00, 000);
           end;
           list.Add(node);
           Next;
           // Inc(i);
        end;
     end;
  end;
  Result := list;
end;

function TDMAsistenteImpAsientos.InicializaProceso: TDocInfoList;
var
  Q : THYFIBQuery;
  Count : integer;
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;

  Q := THYFIBQuery.Create(nil);
  with q do
  begin
     Database := DMMain.DataBase;
     SQL.Text := 'SELECT COUNT(DISTINCT ASIENTO) FROM TMP_IMPORTAR_ASIENTOS WHERE ENTRADA = ?ENTRADA AND MARCADO=1';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     ExecQuery;
     Count := Fields[0].AsInteger;
     FreeHandle;
  end;

  with xAsientos do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     Result := FillDocInfoListFromDRO(xAsientos, Count);
     Close;
  end;
end;

function TDMAsistenteImpAsientos.ImportarAsiento(asiento: integer; fecha: TDateTime): boolean;
begin
  Result := NuevoRIB;
  if (Result) then
  begin
     Error := '';
     with QInsertarAsiento do
        try
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['RIB'].AsInteger := RIB;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA'].AsDateTime := fecha;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['MONEDA'].AsString := REntorno.Moneda;
           Params.ByName['ASIENTO'].AsInteger := Asiento;
           ExecQuery;
        except
           on E: Exception do
           begin
              Result := False;
              Error := E.Message;
           end;
        end;
  end;
end;

function TDMAsistenteImpAsientos.ImportarApuntes(Asiento: integer): boolean;
begin
  Result := True;
  Error := '';
  with QInsertarApuntes do
     try
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['ASIENTO'].AsInteger := Asiento;
        Params.ByName['RIB'].AsInteger := RIB;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        if PorDebeYHaber then
           Params.ByName['PORDEBEYHABER'].AsInteger := 1
        else
           Params.ByName['PORDEBEYHABER'].AsInteger := 0;
        ExecQuery;
     except
        on E: Exception do
        begin
           Result := False;
           Error := E.Message;
        end;
     end;
end;

end.
