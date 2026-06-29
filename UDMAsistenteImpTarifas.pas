unit UDMAsistenteImpTarifas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, DB,
  ADODB, OleServer, Excel2000, Contnrs, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet;

type
  TDMAsistenteImpTarifas = class(TDataModule)
     TLocal: THYTransaction;
     XLApp: TExcelApplication;
     QMTarifasImp: TFIBTableSet;
     DSQMTarifasImp: TDataSource;
     QActualizaPrecio: THYFIBQuery;
     xRecorre: TFIBDataSetRO;
     xRecorreENTRADA: TIntegerField;
     xRecorreLINEA: TIntegerField;
     xRecorreEMPRESA: TIntegerField;
     xRecorreARTICULO: TFIBStringField;
     xRecorreTITULO: TFIBStringField;
     xRecorreMARGEN: TFloatField;
     xRecorrePRECIO: TFloatField;
     xRecorreIMPORTAR: TIntegerField;
     xRecorreP_COSTE: TFloatField;
     xFamilias: TFIBDataSetRO;
     xFamiliasEMPRESA: TIntegerField;
     xFamiliasEJERCICIO: TIntegerField;
     xFamiliasCANAL: TIntegerField;
     xFamiliasFAMILIA: TFIBStringField;
     xFamiliasTITULO: TFIBStringField;
     xFamiliasPAIS: TFIBStringField;
     xFamiliasTIPO_IVA: TIntegerField;
     xFamiliasCTA_COMPRAS: TFIBStringField;
     xFamiliasCTA_VENTAS: TFIBStringField;
     xFamiliasCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     xFamiliasCTA_DEVOLUCION_VENTAS: TFIBStringField;
     xFamiliasCTA_ABONO_COMPRAS: TFIBStringField;
     xFamiliasCTA_ABONO_VENTAS: TFIBStringField;
     xFamiliasVENTA: TIntegerField;
     xFamiliasPTO_VERDE: TFloatField;
     xFamiliasMARGEN: TFloatField;
     xFamiliasTIPO_REDONDEO: TIntegerField;
     xFamiliasACT_TAR_AUTOM: TIntegerField;
     QCtasCompraVenta: THYFIBQuery;
     QMTarifasImpENTRADA: TIntegerField;
     QMTarifasImpLINEA: TIntegerField;
     QMTarifasImpEMPRESA: TIntegerField;
     QMTarifasImpARTICULO: TFIBStringField;
     QMTarifasImpTITULO: TFIBStringField;
     QMTarifasImpMARGEN: TFloatField;
     QMTarifasImpPRECIO: TFloatField;
     QMTarifasImpIMPORTAR: TIntegerField;
     QMTarifasImpFAMILIA: TFIBStringField;
     QMTarifasImpTITULO_FAM: TFIBStringField;
     QMTarifasImpTIPO_IVA: TIntegerField;
     QMTarifasImpP_COSTE: TFloatField;
     TUpdate: THYTransaction;
     QMTarifasImpTITULO_CORTO: TFIBStringField;
     QMTarifasImpNOTAS: TBlobField;
     xRecorreP_COMPRA: TFloatField;
     xRecorreDTO_COMPRA: TFloatField;
     xRecorreUNID_MINIMAS: TFloatField;
     xRecorreUNID_MAXIMAS: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMTarifasImpNewRecord(DataSet: TDataSet);
     procedure QMTarifasImpAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     Filas: TObjectList;
     ColArt, ColMargen, ColPrecio, ColFamilia, ColTitArticulo, ColTitCorto, ColTitFamilia, ColTipoIVA, TipoCalculo, ColPrecioCoste, ColNotas, ColPrecioCompra, ColDtoCompra, ColUnidMinimas, ColUnidMaximas: smallint;
     ColLacado, ColCorte, ColTipo_Lacado, ColTipo_Lona, ColForma_Lona, ColModelo, ColConfecc_Lona: smallint;
     ActBloq, FilaSiguiente: boolean;
     Tarifa: string;
     TipoIVACanal: integer;
     TipoLacadoDef: string;
     TipoLonaDef: string;
     FormaLonaDef: string;
     ExcelConectado: boolean;
     function DameT_IVA(Tipo_Iva: integer; Familia: string): integer;
  public
     { Public declarations }
     function LeerDatos(Archivo, Hoja: string): boolean;
     function DameFilas: TObjectList;
     function DameColumnas: TStrings;
     function LlenarTablaTemporal(CArt, CMargen, CPrecio, CFamilia, CTitArticulo, CTitCorto, CTitFamilia, TipoIVA, CPrecioCoste, CNotas, CPrecioCompra, CDtoCompra, CUnidMinimas, CUnidMaximas, Clacado, Ccorte, Ctipo_lacado, Ctipo_lona, Cforma_lona, Cmodelo, Cconfeccion_lona: smallint; Tipo_Articulo: string; SeparadorDecimal: string; PrimeraFilaTitulos: boolean): boolean;
     procedure BorrarTablaTemporal;
     procedure AbrirTarifasImp;
     procedure SeleccionarTodas(Modo: smallint);
     function CrearTarifa(aTarifa, Titulo, Moneda: string; aTipoCalculo, IVAIncluido: smallint; var Error: string): boolean;
     procedure PropagaTarifa;
     procedure SetTarifa(aTarifa: string; aTipoCalculo: smallint; aActBloq: boolean);
     procedure InicializaProceso;
     function Actual: string;
     function Final: boolean;
     procedure Siguiente;
     function ActualizaPrecio(var Error: string): boolean;
     function Seleccionados: boolean;
     function HayArticulosNuevos: boolean;
     function HayFamiliasNuevas: boolean;
     function CreaFamiliaNueva(var errores: integer): TStrings;
     function CreaArticuloNuevo(var errores: integer): TStrings;
     procedure RellenaTipoArticulo(Lista: TStrings);
     procedure ActualizaDatosImportacion(aFileName: string; var aLastRow, aLastCol, aCountSheet: integer; var aActiveSheetName: string; Sheets: TStrings);
  end;

var
  DMAsistenteImpTarifas : TDMAsistenteImpTarifas;

implementation

uses UDMMain, UEntorno, Variants, UUtiles, UDameDato, Dialogs, StrUtils, UHojaCalc;

{$R *.dfm}

procedure TDMAsistenteImpTarifas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  ExcelConectado := False;
  Filas := TObjectList.Create;
  ColArt := 0;
  ColMargen := 0;
  ColPrecio := 0;
  ColFamilia := 0;
  ColTitArticulo := 0;
  ColTitCorto := 0;
  ColTitFamilia := 0;
  ColTipoIVA := 0;
  ColPrecioCoste := 0;
  ColPrecioCompra := 0;
  ColDtoCompra := 0;
  ColLacado := 0;
  ColCorte := 0;
  ColTipo_Lacado := 0;
  ColTipo_Lona := 0;
  ColForma_Lona := 0;
  ColModelo := 0;
  ColConfecc_Lona := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO_IVA FROM EMP_CANALES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        TipoIVACanal := FieldByName['TIPO_IVA'].AsInteger;
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
        SQL.Text := 'SELECT FIRST 1 CODIGO FROM Z_SYS_COLORES WHERE ACTIVO = 1 ORDER BY CODIGO';
        ExecQuery;
        TipoLacadoDef := FieldByName['CODIGO'].AsString;
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
        SQL.Text := 'SELECT FIRST 1 CODIGO FROM Z_SYS_LONAS ORDER BY CODIGO';
        ExecQuery;
        TipoLonaDef := FieldByName['CODIGO'].AsString;
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
        SQL.Text := 'SELECT FIRST 1 CODIGO FROM Z_SYS_LONAS_FORMA ORDER BY CODIGO';
        ExecQuery;
        FormaLonaDef := FieldByName['CODIGO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteImpTarifas.DataModuleDestroy(Sender: TObject);
begin
  Filas.Free;
  if (ExcelConectado) then
     XLApp.Quit;
  BorrarTablaTemporal;
end;

function TDMAsistenteImpTarifas.LeerDatos(Archivo, Hoja: string): boolean;
var
  HCalc : THojaCalc;
  f, c, x, y : integer;
  Columnas : TObjectList;
  StrList : TStrings;
begin
  /// Inserta los datos del archivo en filas y columnas.
  /// La primera fila la dejará vacia para rellenarlo con el campo donde insertar el dato.

  Result := True;
  try
     Columnas := TObjectList.Create;
     try
        DMMain.Log('F create Excel');
        HCalc := THojaCalc.Create(Archivo, False); // OpenOffice doc if possible, please
        try
           DMMain.Log('HCalc.FileName = ' + Archivo);
           HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

           if (Trim(Hoja) > '') then
           begin
              DMMain.Log('HCalc.ActivateSheetByName(' + Hoja + ')');
              HCalc.ActivateSheetByName(Hoja, False);
           end;

           DMMain.Log('HCalc.Last Row/Col');
           x := HCalc.LastRow + 1;
           y := HCalc.LastCol + 2;
           DMMain.Log(format('LastRow:%d - LastCol:%d', [x, y]));

           // FMAsistenteImpTarifas.ProgresoImportacion.Min := 0;
           // FMAsistenteImpTarifas.ProgresoImportacion.Max := y;

           Columnas.Capacity := y;
           for c := 1 to y do
           begin
              StrList := TStringList.Create;
              StrList.Add(Format(_('Columna %d'), [c]));

              for f := 1 to x do
              begin
                 try
                    StrList.Add(LimpiaCeldaExcel(HCalc.CellText[f, c]));
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
              // FMAsistenteImpArticulos.ProgresoImportacion.Position := c;
           end;

           // Se elimanan las filas vacías.
           DMMain.Log('Eliminando filas vacias');
           Filas.Clear;
           Filas.Capacity := x + 1;

           {
           // Primera fila vacia para seleccionar campo a importar
           StrList := TStringList.Create;
           for c := 0 to Columnas.Count - 1 do
              StrList.Add('');
           Filas.Add(StrList);
           }

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

           DMMain.Log('Fin importacion');
        finally
           Sleep(1000);
           DMMain.Log('I Liberar Excel');
           HCalc.Free;
        end;
     finally
        Columnas.Free;
     end;
  except
     on E: Exception do
     begin
        DMMain.Log('Error importacion' + #13#10 + E.Message);
        MensajesDeError(E);
        Result := False;
     end;
  end;
end;

(*
function TDMAsistenteImpTarifas.LeerDatos(Archivo: string): boolean;
var
  WorkBk : _WorkBook;
  WorkSheet : _WorkSheet;
  f, c, x, y, i, j : integer;
  IIndex : olevariant;
  Matrix : variant;
  Columnas : TObjectList;
  StrList : TStrings;
begin
  {
  // Relleno filas para debug
  // Comentar el resto de la función para evitar la importación desde un excel

  Result := True;
  Filas.Clear;
  Filas.Capacity := 3;

  StrList := TStringList.Create;
  StrList.Add('¿?');
  StrList.Add('LIBRE');
  StrList.Add('50');
  StrList.Add('20');
  Filas.Insert(0, StrList);

  StrList := TStringList.Create;
  StrList.Add('.');
  StrList.Add('VARIO');
  StrList.Add('60');
  StrList.Add('30');
  Filas.Insert(0, StrList);

  StrList := TStringList.Create;
  StrList.Add('ARTICULO');
  StrList.Add('TITULO');
  StrList.Add('PRECIO');
  StrList.Add('P_COSTE');
  Filas.Insert(0, StrList);
  }
  IIndex := 1;
  Result := True;
  FilaSiguiente := False;

  try
     XLApp.Connect;
     ExcelConectado := True;
     Columnas := TObjectList.Create;
     try
        XLApp.WorkBooks.Open(Archivo, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
           EmptyParam, EmptyParam, 0);

        WorkBk := XLApp.WorkBooks.Item[IIndex];
        WorkSheet := WorkBk.WorkSheets.Get_Item(1) as _WorkSheet;

        WorkSheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

        with XLApp.Range['A1', XLApp.ActiveCell] do
        begin
           x := Rows.Count;
           y := Columns.Count;
           Matrix := Value;
        end;

        // XLApp.Quit;
        // XLApp.Disconnect;

        // se eliminan las columnas vacías
        Columnas.Capacity := y;
        for c := 1 to y do
        begin
           StrList := TStringList.Create;
           for f := 1 to x do
              try
                 StrList.Add(Matrix[f, c]);
              except
                 StrList.Add(_('ERROR'));
              end;
           if Trim(StrList.Text) <> '' then
              Columnas.Add(StrList)
           else
              StrList.Free;
        end;

        // Matrix := Unassigned;

        // Se elimanan las filas vacías.
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
              StrList.Free;
        end;

        // Asegurarse que las columnas tenga el título correcto
        i := 0;
        while (i < Columnas.Count) and
           ((IsValidIdent(Trim((Filas.Items[0] as TStrings)[i]))) or
              (Trim((Filas.Items[0] as TStrings)[i]) = '')) do
           i := i + 1;
        if ((i < Columnas.Count) and
           (Pos('ARTICULO', UpperCase((Filas.Items[0] as TStrings)[i])) = 0)) then
        begin
           StrList := TStringList.Create;
           for j := 0 to Columnas.Count - 1 do
              StrList.Add(_('Columna') + ' ' + IntToStr(j + 1));
           Filas.Insert(0, StrList);
           FilaSiguiente := True;
        end
        else
        { TODO : Verificar la variable J. No se inicializa y puede producir errores }
        if (Trim((Filas.Items[0] as TStrings)[j]) = '') then
        begin
           (Filas.Items[0] as TStrings)[j] := _('Columna') + ' ' + IntToStr(j + 1);
           FilaSiguiente := True;
        end;
     finally
        Columnas.Free;
        Matrix := Unassigned;
        XLApp.Disconnect;
        XLApp.Quit;
        ExcelConectado := False;
     end;
  except
     on E: Exception do
     begin
        MensajesDeError(E);
        Result := False;
     end;
  end;
end;
*)

function TDMAsistenteImpTarifas.DameFilas: TObjectList;
begin
  Result := Filas;
end;

function TDMAsistenteImpTarifas.DameColumnas: TStrings;
begin
  Result := (Filas.Items[0] as TStrings);
end;

function TDMAsistenteImpTarifas.LlenarTablaTemporal(CArt, CMargen, CPrecio, CFamilia, CTitArticulo, CTitCorto, CTitFamilia, TipoIVA, CPrecioCoste, CNotas, CPrecioCompra, CDtoCompra, CUnidMinimas, CUnidMaximas, Clacado, Ccorte, Ctipo_lacado, Ctipo_lona, Cforma_lona, Cmodelo, Cconfeccion_lona: smallint; Tipo_Articulo: string; SeparadorDecimal: string; PrimeraFilaTitulos: boolean): boolean;
var
  i, TIVA, FilaIni, Lacado, Corte : integer;
  Margen, Precio, PrecioCoste, PrecioCompra, DtoCompra, UnidMinimas, UnidMaximas : double;
  Familia, TituloArt, TituloCorto, TituloFam, Notas, Tipo_Lacado, Tipo_Lona, Forma_Lona, Modelo, Confecc_Lona : string;
  Q : THYFIBQuery;
begin
  Result := True;

  if (Trim(SeparadorDecimal) = '') then
     SeparadorDecimal := DecimalSeparator;

  ColArt := CArt;
  ColMargen := CMargen;
  ColPrecio := CPrecio;
  ColFamilia := CFamilia;
  ColTitArticulo := CTitArticulo;
  ColTitCorto := CTitCorto;
  ColTitFamilia := CTitFamilia;
  ColTipoIVA := TipoIVA;
  ColPrecioCoste := CPrecioCoste;
  ColNotas := CNotas;
  ColPrecioCompra := CPrecioCompra;
  ColDtoCompra := CDtoCompra;
  ColUnidMinimas := CUnidMinimas;
  ColUnidMaximas := CUnidMaximas;
  ColLacado := CLacado;
  ColCorte := CCorte;
  ColTipo_Lacado := CTipo_Lacado;
  ColTipo_Lona := CTipo_Lona;
  ColForma_Lona := CForma_Lona;
  ColModelo := CModelo;
  ColConfecc_Lona := CConfeccion_Lona;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO TMP_IMPORTAR_TARIFAS ( ');
        SQL.Add(' ENTRADA, LINEA, EMPRESA, ARTICULO, TITULO_CORTO, MARGEN, ');
        SQL.Add(' PRECIO, FAMILIA, TITULO, TITULO_FAM, TIPO_IVA, P_COSTE, ');
        SQL.Add(' NOTAS, P_COMPRA, DTO_COMPRA, UNID_MINIMAS, UNID_MAXIMAS, ');
        SQL.Add(' Z_LACADO, Z_CORTE, Z_TIPO_LACADO, Z_TIPO_LONA, Z_FORMA_LONA, ');
        SQL.Add(' Z_MODELO, Z_CONFECCION_LONA, TIPO_ARTICULO_TYC) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :ENTRADA, :LINEA, :EMPRESA, :ARTICULO, :TITULO_CORTO, :MARGEN, ');
        SQL.Add(' :PRECIO, :FAMILIA, :TITULO, :TITULO_FAM, :T_IVA, :P_COSTE, ');
        SQL.Add(' :NOTAS, :P_COMPRA, :DTO_COMPRA, :UNID_MINIMAS, :UNID_MAXIMAS, ');
        SQL.Add(' :Z_LACADO, :Z_CORTE, :Z_TIPO_LACADO, :Z_TIPO_LONA, :Z_FORMA_LONA, ');
        SQL.Add(' :Z_MODELO, :Z_CONFECCION_LONA, :TIPO_ARTICULO_TYC) ');
     end;

     i := 0;
     FilaIni := 1;  // Evitamos que copie la primera linea que es la de los titulos
     if PrimeraFilaTitulos then
        Inc(FilaIni);

     BorrarTablaTemporal;

     try
        for i := FilaIni to Filas.Count - 1 do
        begin
           if not (FilaSiguiente) then
           begin
              Precio := 0;
              Margen := 0;
              PrecioCoste := 0;
              PrecioCompra := 0;
              DtoCompra := 0;
              UnidMinimas := 0;
              UnidMaximas := 0;
              Lacado := 0;
              Corte := 0;
              Tipo_Lacado := '';
              Tipo_Lona := '';
              Forma_Lona := '';
              Modelo := '';
              Confecc_Lona := '';

              if (ColMargen > 0) then
                 Margen := StrToFloatDec(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColMargen - 1]), SeparadorDecimal[1]);

              if (ColPrecio > 0) then
                 if ((Filas.Items[I] as TStrings)[ColPrecio - 1] <> '') then
                    try
                       Precio := StrToFloatDec(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColPrecio - 1]), SeparadorDecimal[1]);
                    except
                       Precio := 0;
                    end;

              if (ColFamilia > 0) then
                 Familia := UpperCase(Copy(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColFamilia - 1]), 1, 5))
              else
                 Familia := REntorno.FamDefecto;

              if (ColTitArticulo > 0) then
                 TituloArt := Copy(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColTitArticulo - 1]), 1, 60)
              else
                 // Generar automaticamente
                 TituloArt := Copy(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColArt - 1]), 1, 15);

              if (ColTitCorto > 0) then
                 TituloCorto := Copy(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColTitCorto - 1]), 1, 60)
              else
                 // Caracter vacio(dominio not null)
                 TituloCorto := ' ';

              if (ColTitFamilia > 0) then
                 TituloFam := Copy(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColTitFamilia - 1]), 1, 40)
              else
                 // Generar Automaticamente
                 TituloFam := Familia;

              if (ColTipoIVA > 0) then
                 TIVA := StrToInt(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColTipoIVA - 1]))
              else
                 TIVA := TipoIVACanal;

              if (ColPrecioCoste > 0) then
                 PrecioCoste := StrToFloatDec(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColPrecioCoste - 1]), SeparadorDecimal[1]);

              if (ColPrecioCompra > 0) then
                 PrecioCompra := StrToFloatDec(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColPrecioCompra - 1]), SeparadorDecimal[1]);

              if (ColDtoCompra > 0) then
                 DtoCompra := StrToFloatDec(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColDtoCompra - 1]), SeparadorDecimal[1]);

              if (ColNotas > 0) then
                 Notas := Copy(LimpiaCeldaExcel(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColNotas - 1])), 1, 40);

              if (CUnidMinimas > 0) then
                 UnidMinimas := StrToFloatDec(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColUnidMinimas - 1]), SeparadorDecimal[1]);

              if (CUnidMaximas > 0) then
                 UnidMaximas := StrToFloatDec(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColUnidMaximas - 1]), SeparadorDecimal[1]);

              if (ColLacado > 0) then
                 Lacado := StrToInt(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColLacado - 1]));

              if (ColCorte > 0) then
                 Corte := StrToInt(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColCorte - 1]));

              if (ColTipo_Lacado > 0) then
                 Tipo_Lacado := LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColTipo_Lacado - 1])
              else
                 Tipo_Lacado := TipoLacadoDef;

              if (ColTipo_Lona > 0) then
                 Tipo_Lona := LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColTipo_Lona - 1])
              else
                 Tipo_Lona := TipoLonaDef;

              if (ColForma_Lona > 0) then
                 Forma_Lona := LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColForma_Lona - 1])
              else
                 Forma_Lona := FormaLonaDef;

              if (ColModelo > 0) then
                 Modelo := LimpiaCeldaExcel((Filas.Items[i] as TStrings)[ColModelo - 1])
              else
                 Modelo := '';

              if (ColConfecc_Lona > 0) then
                 Confecc_Lona := LimpiaCeldaExcel((Filas.Items[i] as TStrings)[ColConfecc_Lona - 1])
              else
                 Confecc_Lona := '';

              with Q do
              begin
                 Close;
                 Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['LINEA'].AsInteger := I;
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['ARTICULO'].AsString := Copy(LimpiaCeldaExcel((Filas.Items[I] as TStrings)[ColArt - 1]), 1, 15);
                 Params.ByName['MARGEN'].AsFloat := Margen;
                 Params.ByName['PRECIO'].AsFloat := Precio;
                 Params.ByName['FAMILIA'].AsString := Familia;
                 Params.ByName['TITULO'].AsString := TituloArt;
                 Params.ByName['TITULO_CORTO'].AsString := TituloCorto;
                 Params.ByName['TITULO_FAM'].AsString := TituloFam;
                 Params.ByName['T_IVA'].AsInteger := DameT_IVA(TIVA, Familia);
                 Params.ByName['P_COSTE'].AsFloat := PrecioCoste;
                 Params.ByName['P_COMPRA'].AsFloat := PrecioCompra;
                 Params.ByName['DTO_COMPRA'].AsFloat := DtoCompra;
                 Params.ByName['NOTAS'].AsString := Notas;
                 Params.ByName['UNID_MINIMAS'].AsFloat := UnidMinimas;
                 Params.ByName['UNID_MAXIMAS'].AsFloat := UnidMaximas;
                 Params.ByName['Z_LACADO'].AsInteger := Lacado;
                 Params.ByName['Z_CORTE'].AsInteger := Corte;
                 Params.ByName['Z_TIPO_LACADO'].AsString := Tipo_Lacado;
                 Params.ByName['Z_TIPO_LONA'].AsString := Tipo_Lona;
                 Params.ByName['Z_FORMA_LONA'].AsString := Forma_Lona;
                 Params.ByName['Z_MODELO'].AsString := Modelo;
                 Params.ByName['Z_CONFECCION_LONA'].AsString := Confecc_Lona;
                 Params.ByName['TIPO_ARTICULO_TYC'].AsString := Tipo_Articulo;
                 ExecQuery;
                 FreeHandle;
              end;
           end;
           FilaSiguiente := False;
        end;
     except
        on E: Exception do
        begin
           ShowMessage(Format(_('Ha ocurrido un error en la fila numero %d'), [i + FilaIni]) + #13#10 + E.Message);
           FilaSiguiente := True;
           Result := False;
        end;
     end;
  finally
     FreeAndNil(Q);
  end;

  if (Result) then
     AbrirTarifasImp;
end;

procedure TDMAsistenteImpTarifas.BorrarTablaTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_IMPORTAR_TARIFAS WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteImpTarifas.QMTarifasImpNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMAsistenteImpTarifas.AbrirTarifasImp;
begin
  with QMTarifasImp do
  begin
     DisableControls;
     try
        Close;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAsistenteImpTarifas.SeleccionarTodas(Modo: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_IMPORTAR_TARIFAS SET IMPORTAR = :MODO WHERE ENTRADA = :ENTRADA';
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbrirTarifasImp;
end;

function TDMAsistenteImpTarifas.CrearTarifa(aTarifa, Titulo, Moneda: string; aTipoCalculo, IVAIncluido: smallint; var Error: string): boolean;
begin
  Result := True;
  Tarifa := aTarifa;
  TipoCalculo := aTipoCalculo;
  Error := '';
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO ART_TARIFAS_C ( ');
           SQL.Add(' EMPRESA, TARIFA, TITULO, MONEDA, ACTIVA, IVA_INCLUIDO) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :TARIFA, :TITULO, :MONEDA, :ACTIVA, :IVA_INCLUIDO) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['TARIFA'].AsString := Tarifa;
           Params.ByName['TITULO'].AsString := Titulo;
           Params.ByName['MONEDA'].AsString := Moneda;
           Params.ByName['ACTIVA'].AsInteger := 1;
           Params.ByName['IVA_INCLUIDO'].AsInteger := IVAIncluido;
           ExecQuery;
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
           SQL.Add(' INSERT INTO ART_TARIFAS_D ( ');
           SQL.Add(' EMPRESA, TARIFA, CALCULO) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :TARIFA, :CALCULO) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['TARIFA'].AsString := Tarifa;
           Params.ByName['CALCULO'].AsInteger := TipoCalculo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     on E: Exception do
     begin
        Error := E.Message;
        Tarifa := '';
        TipoCalculo := -1;
        Result := False;
     end;
  end;
end;

procedure TDMAsistenteImpTarifas.PropagaTarifa;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE ART_TARIFAS_PROPAGA SET PROPAGA = 1 WHERE EMPRESA = :EMPRESA AND TARIFA = :TARIFA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TARIFA'].AsString := Tarifa;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteImpTarifas.SetTarifa(aTarifa: string; aTipoCalculo: smallint; aActBloq: boolean);
begin
  Tarifa := aTarifa;
  TipoCalculo := aTipoCalculo;
  ActBloq := aActBloq;
end;

procedure TDMAsistenteImpTarifas.InicializaProceso;
begin
  with xRecorre do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with QActualizaPrecio do
  begin
     SQL.Clear;
     SQL.Add(' UPDATE ART_TARIFAS_PRECIOS ');
     SQL.Add(' SET ');
     SQL.Add(' BLOQUEADO = 1 ');

     if (ColPrecio > 0) then
        SQL.Add(', PRECIO_VENTA = :PRECIO ');
     if (ColMargen > 0) then
        SQL.Add(', MARGEN = :MARGEN ');

     if (ColPrecioCoste > 0) then
        SQL.Add(', PRECIO_COSTE = :PRECIO_COSTE ');

     if (ColPrecioCompra > 0) then
        SQL.Add(', PRECIO_COMPRA = :PRECIO_COMPRA ');

     if (ColDtoCompra > 0) then
        SQL.Add(', DESCUENTO_COMPRA = :DESCUENTO_COMPRA ');

     SQL.Add(' WHERE ');
     SQL.Add(' EMPRESA = :EMPRESA AND ');
     SQL.Add(' TARIFA = :TARIFA AND ');
     SQL.Add(' ARTICULO = :ARTICULO ');
     if (TipoCalculo > -1) then
        SQL.Add(' AND CALCULO = :CALCULO ');

     if (ColUnidMinimas > 0) then
        SQL.Add(' AND UNID_MINIMAS = :UNID_MINIMAS ');

     if (ColUnidMaximas > 0) then
        SQL.Add(' AND UNID_MAXIMAS = :UNID_MAXIMAS ');

     if (not ActBloq) then
        SQL.Add(' AND BLOQUEADO = 0 ');
  end;
end;

function TDMAsistenteImpTarifas.Final: boolean;
begin
  Result := xRecorre.EOF;
end;

procedure TDMAsistenteImpTarifas.Siguiente;
begin
  xRecorre.Next;
end;

function TDMAsistenteImpTarifas.Actual: string;
begin
  Result := Format(_('Actualizando Articulo') + ' %s %s', [xRecorreARTICULO.AsString, xRecorreTITULO.AsString]);

  if (ColMargen > 0) then
     Result := Result + ' ' + _('Margen') + ': ' + FormatFloat(MascaraN, xRecorreMARGEN.AsFloat);

  if (ColPrecio > 0) then
     Result := Result + ' ' + _('Precio') + ': ' + FormatFloat(MascaraN, xRecorrePRECIO.AsFloat);
end;

function TDMAsistenteImpTarifas.ActualizaPrecio(var Error: string): boolean;
begin
  Result := True;
  Error := '';
  try
     with QActualizaPrecio do
     begin
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['ARTICULO'].AsString := xRecorreARTICULO.AsString;
        if (TipoCalculo > -1) then
           Params.ByName['CALCULO'].AsInteger := TipoCalculo;
        if (ColPrecio > 0) then
           Params.ByName['PRECIO'].AsFloat := xRecorrePRECIO.AsFloat;
        if (ColMargen > 0) then
           Params.ByName['MARGEN'].AsFloat := xRecorreMARGEN.AsFloat;
        if (ColPrecioCoste > 0) then
           Params.ByName['PRECIO_COSTE'].AsFloat := xRecorreP_COSTE.AsFloat;
        if (ColPrecioCompra > 0) then
           Params.ByName['PRECIO_COMPRA'].AsFloat := xRecorreP_COMPRA.AsFloat;
        if (ColDtoCompra > 0) then
           Params.ByName['DESCUENTO_COMPRA'].AsFloat := xRecorreDTO_COMPRA.AsFloat;
        if (ColUnidMinimas > 0) then
           Params.ByName['UNID_MINIMAS'].AsFloat := xRecorreUNID_MINIMAS.AsFloat;
        if (ColUnidMaximas > 0) then
           Params.ByName['UNID_MAXIMAS'].AsFloat := xRecorreUNID_MAXIMAS.AsFloat;
        ExecQuery;
     end;
  except
     on E: Exception do
     begin
        Error := E.Message;
        Result := False;
     end;
  end;
end;

function TDMAsistenteImpTarifas.Seleccionados: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ENTRADA FROM TMP_IMPORTAR_TARIFAS WHERE ENTRADA = :ENTRADA AND IMPORTAR = 1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['ENTRADA'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAsistenteImpTarifas.HayArticulosNuevos: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST (1) ARTICULO ');
        SQL.Add(' FROM TMP_IMPORTAR_TARIFAS TAR ');
        SQL.Add(' WHERE ');
        SQL.Add(' TAR.EMPRESA = :EMPRESA AND ');
        SQL.Add(' TAR.ENTRADA = :ENTRADA AND ');
        SQL.Add(' TAR.ARTICULO NOT IN (SELECT ARTICULO ');
        SQL.Add('                      FROM ART_ARTICULOS ART ');
        SQL.Add('                      WHERE ');
        SQL.Add('                      ART.EMPRESA = TAR.EMPRESA AND ');
        SQL.Add('                      ART.ARTICULO = TAR.ARTICULO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := HayDatos;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAsistenteImpTarifas.CreaArticuloNuevo(var errores: integer): TStrings;
var
  DS : TFIBDataSetRO;
  rLog : string;
  Titulo : string;
begin
  Result := TStringList.Create;
  DS := TFIBDataSetRO.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := TLocal;
        SelectSQL.Add(' SELECT DISTINCT ARTICULO, TITULO, TITULO_CORTO, FAMILIA, P_COSTE, P_COMPRA, DTO_COMPRA, NOTAS, ');
        SelectSQL.Add(' Z_TIPO_LACADO, Z_LACADO, Z_CORTE, Z_TIPO_LONA, Z_FORMA_LONA, Z_MODELO, Z_CONFECCION_LONA, TIPO_ARTICULO_TYC ');
        SelectSQL.Add(' FROM TMP_IMPORTAR_TARIFAS ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' ENTRADA = :ENTRADA AND ');
        SelectSQL.Add(' IMPORTAR = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Open;
        First;

        while not EOF do
        begin
           Titulo := DameTituloArticulo(DS.FieldByName('ARTICULO').AsString);
           if (Titulo = '') then
           begin
              // Datos Familias
              with xFamilias do
              begin
                 Close;
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['FAMILIA'].AsString := DS.FieldByName('FAMILIA').AsString;
                 Open;
              end;

              // Insertamos
              try
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' INSERT INTO VER_ARTICULOS_CUENTAS( ');
                       SQL.Add(' EMPRESA, EJERCICIO, CANAL, ARTICULO, TITULO_LARGO, TITULO_CORTO, FAMILIA, ');
                       SQL.Add(' P_COSTE, ABIERTO, VIRTUAL, CONTROL_STOCK, PAIS, TIPO_IVA, CTA_COMPRAS, CTA_VENTAS, ENTRADA, UNIDADES, DISPONIBILIDAD, ');
                       SQL.Add(' ACTUALIZA_VENTA, PTO_VERDE, CONTROLA_MEDIDAS, SERIALIZADO, GARANTIA, PRODUCCION, DESCUENTO, DESCUENTO_2, DESCUENTO_3, ');
                       SQL.Add(' IVA_ESCANDALLO, PVP_POR_UD_SECUNDARIA, LOTES, MULTIPLO_1, MULTIPLO_2, MULTIPLO_3, MULTIPLO_4, FACTOR_ESCALA, UD_MINIMO_COMPRA, ');
                       SQL.Add(' UD_MINIMO_VENTA, ID_A, ID_C_A, IMAGEN, PESO, CTA_DEVOLUCION_COMPRAS, CTA_DEVOLUCION_VENTAS, CTA_ABONO_COMPRAS, ');
                       SQL.Add(' CTA_ABONO_VENTAS, UBICABLE, VOLUMEN_UNIT, DIAMETRO_UNIT, DEFECTO_UD_SECUNDARIA, ANTICIPO, ANTICIPO_CONTADO, ANTICIPO_PREG_DATOS, NOTAS, ');
                       SQL.Add(' TIPO_ARTICULO_TYC, Z_LACADO, Z_TIPO_LACADO, Z_CORTE, Z_LONA_TIPO, Z_LONA_FORMA, Z_LONA_MODELO, Z_LONA_CONFECCION) ');
                       SQL.Add(' VALUES( ');
                       SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :TITULO_LARGO, :TITULO_CORTO, :FAMILIA, ');
                       SQL.Add(' :P_COSTE, 0, 0, 1, :PAIS, :TIPO_IVA, :CTA_COMPRAS, :CTA_VENTAS, :ENTRADA, ''-'', :VENTA, ');
                       SQL.Add(' 1, :PTO_VERDE, ');
                       SQL.Add(' 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ');
                       SQL.Add(' 0, NULL, NULL, -1, 0, :CTA_DEVOLUCION_COMPRAS, :CTA_DEVOLUCION_VENTAS, :CTA_ABONO_COMPRAS, :CTA_ABONO_VENTAS, 0, 0, 0, 0, 0, 0, 0, :NOTAS, ');
                       SQL.Add(' :TIPO_ARTICULO_TYC, :Z_LACADO, :Z_TIPO_LACADO, :Z_CORTE, :Z_LONA_TIPO, :Z_LONA_FORMA, :Z_LONA_MODELO, :Z_LONA_CONFECCION) ');

                       // Dejo esto para poder tener una traza en el caso de un fallo
                       rLog := rLog + SQL.Text;
                       rLog := rLog + '1';
                       Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                       rLog := rLog + '2';
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       rLog := rLog + '3';
                       Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                       rLog := rLog + '4';
                       Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                       rLog := rLog + '5';
                       Params.ByName['FAMILIA'].AsString := DS.FieldByName('FAMILIA').AsString;
                       rLog := rLog + '6';
                       Params.ByName['PAIS'].AsString := xFamilias.FieldByName('PAIS').AsString;
                       rLog := rLog + '7';
                       Params.ByName['TIPO_IVA'].AsInteger := xFamilias.FieldByName('TIPO_IVA').AsInteger;
                       rLog := rLog + '8';
                       Params.ByName['VENTA'].AsInteger := xFamilias.FieldByName('VENTA').AsInteger;
                       rLog := rLog + '9';
                       Params.ByName['CTA_COMPRAS'].AsString := xFamilias.FieldByName('CTA_COMPRAS').AsString;
                       rLog := rLog + '0';
                       Params.ByName['CTA_VENTAS'].AsString := xFamilias.FieldByName('CTA_VENTAS').AsString;
                       rLog := rLog + 'a';
                       Params.ByName['CTA_DEVOLUCION_COMPRAS'].AsString := xFamilias.FieldByName('CTA_DEVOLUCION_COMPRAS').AsString;
                       rLog := rLog + 'b';
                       Params.ByName['CTA_DEVOLUCION_VENTAS'].AsString := xFamilias.FieldByName('CTA_DEVOLUCION_VENTAS').AsString;
                       rLog := rLog + 'c';
                       Params.ByName['CTA_ABONO_COMPRAS'].AsString := xFamilias.FieldByName('CTA_ABONO_COMPRAS').AsString;
                       rLog := rLog + 'd';
                       Params.ByName['CTA_ABONO_VENTAS'].AsString := xFamilias.FieldByName('CTA_ABONO_VENTAS').AsString;
                       rLog := rLog + 'e';
                       Params.ByName['PTO_VERDE'].AsFloat := xFamilias.FieldByName('PTO_VERDE').AsFloat;
                       rLog := rLog + 'f';
                       Params.ByName['ARTICULO'].AsString := DS.FieldByName('ARTICULO').AsString;
                       rLog := rLog + 'g';
                       Params.ByName['TITULO_LARGO'].AsString := DS.FieldByName('TITULO').AsString;
                       rLog := rLog + 'h';
                       Params.ByName['TITULO_CORTO'].AsString := DS.FieldByName('TITULO_CORTO').AsString;
                       rLog := rLog + 'i';
                       Params.ByName['P_COSTE'].AsFloat := DS.FieldByName('P_COSTE').AsFloat;
                       rLog := rLog + 'j';
                       Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       rLog := rLog + 'k';
                       Params.ByName['TIPO_ARTICULO_TYC'].AsString := DS.FieldByName('TIPO_ARTICULO_TYC').AsString;
                       rLog := rLog + 'l';
                       Params.ByName['Z_LACADO'].AsInteger := DS.FieldByName('Z_LACADO').AsInteger;
                       rLog := rLog + 'm';
                       Params.ByName['Z_CORTE'].AsInteger := DS.FieldByName('Z_CORTE').AsInteger;
                       rLog := rLog + 'n';
                       Params.ByName['Z_TIPO_LACADO'].AsString := DS.FieldByName('Z_TIPO_LACADO').AsString;
                       rLog := rLog + 'o';
                       Params.ByName['Z_LONA_TIPO'].AsString := DS.FieldByName('Z_TIPO_LONA').AsString;
                       rLog := rLog + 'p';
                       Params.ByName['Z_LONA_FORMA'].AsString := DS.FieldByName('Z_FORMA_LONA').AsString;
                       rLog := rLog + 'q';
                       Params.ByName['Z_LONA_MODELO'].AsString := DS.FieldByName('Z_MODELO').AsString;
                       rLog := rLog + 'r';
                       Params.ByName['Z_LONA_CONFECCION'].AsString := DS.FieldByName('Z_CONFECCION_LONA').AsString;
                       rLog := rLog + 's';
                       ExecQuery;
                       rLog := rLog + 't';
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
                 rLog := _('importado al sistema');
              except
                 on E: Exception do
                 begin
                    rLog := #13#10 + format(_('Traza de errores: %s'), [rLog]) + #13#10 + _('ERROR importando al sistema!') + #13#10 + E.Message;
                    Errores := Errores + 1;
                 end;
              end;

              xFamilias.Close;
              Result.Add(Format(_('Articulo %s %s %s'), [FieldByName('Articulo').AsString, FieldByName('TITULO').AsString, rLog]));
           end;
           Next;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

function TDMAsistenteImpTarifas.HayFamiliasNuevas: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST (1) FAMILIA ');
        SQL.Add(' FROM TMP_IMPORTAR_TARIFAS TAR ');
        SQL.Add(' WHERE ');
        SQL.Add(' TAR.EMPRESA = :EMPRESA AND ');
        SQL.Add(' TAR.ENTRADA = :ENTRADA AND ');
        SQL.Add(' TAR.FAMILIA NOT IN (SELECT FAMILIA ');
        SQL.Add('                     FROM ART_FAMILIAS ART ');
        SQL.Add('                     WHERE ');
        SQL.Add('                     ART.EMPRESA = TAR.EMPRESA AND ');
        SQL.Add('                     ART.FAMILIA = TAR.FAMILIA) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := HayDatos;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMAsistenteImpTarifas.CreaFamiliaNueva(var errores: integer): TStrings;
var
  DS : TFIBDataSetRO;
  rLog : string;
  Titulo : string;
begin
  Result := TStringList.Create;

  DS := TFIBDataSetRO.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := TLocal;
        SelectSQL.Add(' SELECT DISTINCT FAMILIA, TIPO_IVA, TITULO, TITULO_FAM ');
        SelectSQL.Add(' FROM TMP_IMPORTAR_TARIFAS ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' ENTRADA = :ENTRADA AND ');
        SelectSQL.Add(' IMPORTAR = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Open;
        First;
        while not EOF do
        begin
           // Cuentas de la familia
           with QCtasCompraVenta do
           begin
              Close;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              ExecQuery;
           end;

           Titulo := DameTituloFamilia(FieldByName('FAMILIA').AsString);
           if (Titulo = '') then
           begin
              // Insertamos la familia
              try
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'INSERT INTO VER_FAMILIAS_CUENTAS(EMPRESA,EJERCICIO,CANAL,FAMILIA,TITULO,PAIS,TIPO_IVA,CTA_COMPRAS,CTA_VENTAS,VENTA,PTO_VERDE,MARGEN,ACT_TAR_AUTOM,' +
                          ' TIPO_REDONDEO,CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS,CTA_ABONO_COMPRAS,CTA_ABONO_VENTAS)' +
                          ' VALUES(' + REntorno.EmpresaStr + ',' + REntorno.EjercicioStr + ',' + REntorno.CanalStr + ',?FAMILIA,?TITULO_FAM,''' + REntorno.Pais +
                          ''',' + IntToStr(DS.FieldByName('TIPO_IVA').AsInteger) + ',''' + QCtasCompraVenta.FieldByName['CTA_COMPRAS'].AsString + ''',''' + QCtasCompraVenta.FieldByName['CTA_VENTAS'].AsString + ''',' +
                          '1,0,0,1,-1,''' + QCtasCompraVenta.FieldByName['CTA_DEV_COMPRAS'].AsString + ''',''' + QCtasCompraVenta.FieldByName['CTA_DEV_VENTAS'].AsString + ''',''' +
                          QCtasCompraVenta.FieldByName['CTA_COMPRAS'].AsString + ''',''' + QCtasCompraVenta.FieldByName['CTA_VENTAS'].AsString + ''')';

                       Params.ByName['FAMILIA'].AsString := DS.FieldByName('FAMILIA').AsString;
                       Params.ByName['TITULO_FAM'].AsString := DS.FieldByName('TITULO_FAM').AsString;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
                 rLog := _('importado al sistema');
              except
                 on E: Exception do
                 begin
                    rLog := _('ERROR importando al sistema!!') + #13#10 + E.Message;
                    Errores := Errores + 1;
                 end;
              end;

              QCtasCompraVenta.Close;
              Result.Add(Format(_('Familia %s %s'), [FieldByName('FAMILIA').AsString, rLog]));
           end;
           Next;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

function TDMAsistenteImpTarifas.DameT_IVA(Tipo_Iva: integer; Familia: string): integer;
begin
  /// Devuelve tipo de IVA de la familia. Si no se encuentra, se devuelve el del canal.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TIPO_IVA FROM CON_CUENTAS_GES_FAM WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND FAMILIA = :FAMILIA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FAMILIA'].AsString := Familia;
        ExecQuery;
        if (HayDatos) then
           Result := FieldByName['TIPO_IVA'].AsInteger
        else
           Result := TipoIVACanal;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAsistenteImpTarifas.QMTarifasImpAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMAsistenteImpTarifas.RellenaTipoArticulo(Lista: TStrings);
var
  DS : TFIBDataSetRO;
  Tipo : string;
begin
  Lista.Clear;
  DS := TFIBDataSetRO.Create(nil);
  with DS do
  begin
     try
        DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           // Agrego primero el tipo Varios
           SelectSQL.Clear;
           SelectSQL.Add('SELECT TIPO_ARTICULO_TYC, DESCRIPCION FROM SYS_TIPOS_ARTICULO_TYC WHERE TIPO_ARTICULO_TYC = ''V'' ORDER BY TIPO_ARTICULO_TYC ');
           Open;
           Tipo := FieldByName('TIPO_ARTICULO_TYC').AsString + ' ' + FieldByName('DESCRIPCION').AsString;
           Lista.AddObject(Tipo, Pointer(0));

           // Agrego el resto de tipos
           Close;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT TIPO_ARTICULO_TYC, DESCRIPCION FROM SYS_TIPOS_ARTICULO_TYC WHERE TIPO_ARTICULO_TYC <> ''V'' ORDER BY TIPO_ARTICULO_TYC ');
           Open;
           while not EOF do
           begin
              Tipo := FieldByName('TIPO_ARTICULO_TYC').AsString + ' ' + FieldByName('DESCRIPCION').AsString;
              Lista.AddObject(Tipo, Pointer(0));
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

procedure TDMAsistenteImpTarifas.ActualizaDatosImportacion(aFileName: string; var aLastRow, aLastCol, aCountSheet: integer; var aActiveSheetName: string; Sheets: TStrings);
var
  i : integer;
begin
  aLastRow := 0;
  aLastCol := 0;
  aCountSheet := 0;
  Sheets.Clear;

  if FileExists(aFileName) then
  begin
     DMMain.Log('F create Excel');
     with THojaCalc.Create(aFileName, False) do
     begin
        try
           DMMain.Log('HCalc.FileName = ' + aFileName);
           FileName := aFileName;

           // Obtengo lista de hojas
           for i := 1 to CountSheets do
           begin
              ActivateSheetByIndex(i);
              Sheets.Add(ActiveSheetName);
           end;

           // Si el parametro contiene una hoja, la utilizo para obtener la informacion
           if (aActiveSheetName = '') then
              aActiveSheetName := ActiveSheetName
           else
           begin
              try
                 ActivateSheetByName(aActiveSheetName, False);
              except
                 ActivateSheetByIndex(1);
                 aActiveSheetName := ActiveSheetName;
              end;
           end;

           ActivateSheetByName(aActiveSheetName, False);

           aLastRow := LastRow;
           aLastCol := LastCol;
           aCountSheet := CountSheets;
        finally
           Sleep(100);
           Free;
        end;
     end;
  end;
end;

end.
