unit UDMLstNominas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, frxClass, frxHYReport, FIBDatabase, UFIBModificados,
  DB, FIBDataSet, FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  frxDBSet, UHYReport, FIBTableDataSet, UHYReportMail;

type
  TDMLstNominas = class(TDataModule)
     frNominas: TfrHYReport;
     QMCabNomina: TFIBDataSetRO;
     DSQMCabNominas: TDataSource;
     TLocal: THYTransaction;
     frxNominas: TfrxHYReport;
     HYRSCabNomina: THYReportSource;
     frxDBCabNominas: TfrxDBDataset;
     HYReport: THYReport;
     QMDetNomina: TFIBDataSetRO;
     DSQMDetNomina: TDataSource;
     HYRSDetNomina: THYReportSource;
     frxDBDetNominas: TfrxDBDataset;
     QMEmpleado: TFIBDataSetRO;
     DSEmpleado: TDataSource;
     frDBCabNomina: TfrDBDataSet;
     frDBDetNomina: TfrDBDataSet;
     QMNomDetHaberes: TFIBTableSet;
     DSQMNomDetHaberes: TDataSource;
     QMNomDetDescuentos: TFIBTableSet;
     DSQMNomDetDescuentos: TDataSource;
     QMNomDetParametros: TFIBTableSet;
     DSQMNomDetParametros: TDataSource;
     HYRSNomDetHaberes: THYReportSource;
     frxDBNomDetHaberes: TfrxDBDataset;
     frDBNomDetHaberes: TfrDBDataSet;
     HYRSNomDetDescuentos: THYReportSource;
     frxDBNomDetDescuentos: TfrxDBDataset;
     frDBNomDetDescuentos: TfrDBDataSet;
     HYRSNomDetParametros: THYReportSource;
     frxDBNomDetParametros: TfrxDBDataset;
     frDBNomDetParametros: TfrDBDataSet;
     QMNomConstantes: TFIBTableSet;
     DSNomConstantes: TDataSource;
     HYRSNomConstantes: THYReportSource;
     frxDBNomConstantes: TfrxDBDataset;
     frDBNomConstantes: TfrDBDataSet;
     HYReportMail: THYReportMail;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabNominaAfterOpen(DataSet: TDataSet);
     procedure QMCabNominaBeforeClose(DataSet: TDataSet);
     procedure frNominasBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxNominasBeforePrint(Sender: TfrxReportComponent);
     procedure frNominasGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     procedure ExportarExcel(Archivo: string);
     procedure ExportarExcel2(Archivo: string);
     function DameImporte(Tipo: integer; Codigo: string): double;
  public
     nombreFich, rutaFich: string;
     procedure MostrarListado(Modo, Numero: integer; const IdNomina: integer; ForzarCopias: boolean = False; Copias: integer = 0; Archivo: string = '');
     procedure ExportarLibroRemunearaciones(Periodo: string; Archivo: string);
     procedure MostrarListadoMail(IdNomina: integer; Modo: integer; var Memo: TStrings);
  end;

var
  DMLstNominas : TDMLstNominas;
  SQLBaseHaberes, SQLBaseDescuentos : TStrings;

implementation

uses UDMListados, UFormGest, UEntorno, UDMMain, HYFIBQuery, UHojaCalc, Graphics, UUtiles, Dialogs, UDameDato;

{$R *.dfm}

procedure TDMLstNominas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  SQLBaseHaberes := TStringList.Create;
  SQLBaseDescuentos := TStringList.Create;

  SQLBaseHaberes.Text := QMNomDetHaberes.SelectSQL.Text;
  SQLBaseDescuentos.Text := QMNomDetDescuentos.SelectSQL.Text;

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstNominas.DataModuleDestroy(Sender: TObject);
begin
  SQLBaseHaberes.Free;
  SQLBaseDescuentos.Free;

  CierraData(DMListados);
end;

procedure TDMLstNominas.MostrarListado(Modo, Numero: integer; const IdNomina: integer; ForzarCopias: boolean = False; Copias: integer = 0; Archivo: string = '');
var
  Titulo : string;
  Grupo : integer;
  Listado : smallint;
begin
  case Numero of
     1: Grupo := 643;
     else
        Grupo := 643;
  end;

  Listado := 0;

  with QMCabNomina do
  begin
     Close;
     Params.ByName['ID'].AsInteger := IdNomina;
     Open;
  end;

  if ((DMListados.Copias <> REntorno.Copias) and (DMListados.Copias <> 0)) then
     REntorno.Copias := DMListados.Copias;

  if (Modo = 0) then
     REntorno.Copias := 1; {solo una copia}

  if (ForzarCopias) then
     REntorno.Copias := Copias;

  Titulo := _('Nomina') + '_' + QMCabNomina.FieldByName('ID').AsString + '_Periodo_' + QMCabNomina.FieldByName('EJERCICIO').AsString + '-' + QMCabNomina.FieldByName('PERIODO').AsString;

  if (Modo = 4) then
  begin
     if (Archivo = '') then
        Archivo := Titulo + '.xls';

     if (Numero = 1) then
        ExportarExcel(Archivo)
     else
     if (Numero = 2) then
        ExportarExcel2(Archivo);
  end
  else
  begin
     if (Archivo = '') then
        Archivo := Titulo + '.pdf';

     DMListados.Imprimir(Grupo, Listado, Modo, '', Titulo, frNominas, frxNominas, HYReport, Archivo);
  end;
end;

procedure TDMLstNominas.QMCabNominaAfterOpen(DataSet: TDataSet);
begin
  QMDetNomina.Open;
  QMEmpleado.Open;
  QMNomDetHaberes.Open;
  QMNomDetDescuentos.Open;
  QMNomDetParametros.Open;
  QMNomConstantes.Open;
end;

procedure TDMLstNominas.QMCabNominaBeforeClose(DataSet: TDataSet);
begin
  QMDetNomina.Close;
  QMEmpleado.Close;
  QMNomDetHaberes.Close;
  QMNomDetDescuentos.Close;
  QMNomDetParametros.Close;
  QMNomConstantes.Close;
end;

procedure TDMLstNominas.frNominasBeforePrint(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstNominas.frxNominasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstNominas.frNominasGetValue(const ParName: string; var ParValue: variant);
var
  Tipo : integer;
begin
  DMListados.GetValue(ParName, ParValue);

  // Campos de Nomina de Chile
  if (Length(ParName) = 4) then
  begin
     Tipo := 0;
     if ParName[1] = 'H' then
        Tipo := 1
     else
     if ParName[1] = 'D' then
        Tipo := 2
     else
     if ParName[1] = 'P' then
        Tipo := 3
     else
     if ParName[1] = 'C' then
        Tipo := 4;

     if (Tipo <> 0) then
        ParValue := DameImporte(Tipo, ParName);
  end;

  if ParName = 'H020_LETRAS' then
     ParValue := NumerosALetras(DameImporte(1, 'H020'));
end;

function TDMLstNominas.DameImporte(Tipo: integer; Codigo: string): double;
begin
  /// Devuelve el valor IMPORTE del codigo seleccionado para la nomina.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT IMPORTE FROM ');
        case Tipo of
           1: SQL.Add(' VER_EMP_NOMINAS_DET_HABERES ');
           2: SQL.Add(' VER_EMP_NOMINAS_DET_DESCUENTOS ');
           3: SQL.Add(' VER_EMP_NOMINAS_DET_PARAMETROS ');
           4: SQL.Add(' VER_EMP_NOMINAS_CONSTANTES ');
        end;
        SQL.Add(' WHERE ');
        if (Tipo = 4) then
        begin
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' PERIODO = :PERIODO AND ');
           SQL.Add(' CODIGO = :CODIGO ');
           Params.ByName['EMPRESA'].AsInteger := QMCabNomina.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabNomina.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabNomina.FieldByName('CANAL').AsInteger;
           Params.ByName['PERIODO'].AsString := QMCabNomina.FieldByName('PERIODO').AsString;
           Params.ByName['CODIGO'].AsString := Codigo;
        end
        else
        begin
           SQL.Add(' ID_CABECERA = :ID_CABECERA AND ');
           SQL.Add(' CODIGO = :CODIGO ');
           Params.ByName['ID_CABECERA'].AsInteger := QMCabNomina.FieldByName('ID').AsInteger;
           Params.ByName['CODIGO'].AsString := Codigo;
        end;

        ExecQuery;
        Result := FieldByName['IMPORTE'].AsFloat;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstNominas.ExportarExcel(Archivo: string);
var
  Fila : integer;
  HCalc : THojaCalc;

  procedure DestacaFila(aFila: integer; Color: TColor);
  var
     c : integer;
  begin
     for c := 1 to 7 do
     begin
        HCalc.Bold(aFila, c);
        HCalc.BackgroundColor(aFila, c, Color);
     end;
  end;

begin
  DMMain.Log('Exportando Factura Excel: ' + Archivo);

  // Verifico si es excel o OpenOffice
  if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
     HCalc := THojaCalc.Create(thcExcel, False)
  else
     HCalc := THojaCalc.Create(thcOpenOffice, False);

  try
     HCalc.FileName := Archivo;

     HCalc.ActivateSheetByIndex(1);

     // Cabecera
     Fila := 3;
     HCalc.CellText[Fila, 1] := DameTituloEmpresa(QMCabNomina.FieldByName('EMPRESA').AsInteger);
     HCalc.CellText[Fila, 5] := _('LIQUIDACION DE REMUNERACIONES');
     DestacaFila(Fila, clYellow);
     Inc(Fila);

     { TODO : Ver si esto es SYS_EMPRESAS.NIF (REntorno.CifEmpresa) }
     HCalc.CellText[Fila, 1] := '76.479.984-4';

     HCalc.CellText[Fila, 5] := format(_('Mes de: %d-%s'), [QMCabNomina.FieldByName('EJERCICIO').AsInteger, QMCabNomina.FieldByName('PERIODO').AsString]);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Nombre: ');
     HCalc.CellText[Fila, 2] := QMEmpleado.FieldByName('TITULO').AsString;
     HCalc.Bold(Fila, 2);
     Inc(Fila);
     HCalc.CellText[Fila, 1] := _('RUT: ');
     HCalc.CellText[Fila, 2] := QMEmpleado.FieldByName('NIF').AsString;
     HCalc.Bold(Fila, 2);

     HCalc.CellText[Fila, 5] := _('Fecha: ');
     if HCalc.IsExcel then
        HCalc.CellText[Fila, 7] := '''' + FormatDateTime('dd/MM/yyyy', QMCabNomina.FieldByName('FECHA').AsDateTime)
     else
        HCalc.CellText[Fila, 7] := FormatDateTime('dd/MM/yyyy', QMCabNomina.FieldByName('FECHA').AsDateTime);

     Inc(Fila);
     HCalc.CellText[Fila, 1] := _('Correo Electrónico: ');
     HCalc.CellText[Fila, 2] := QMEmpleado.FieldByName('EMAIL').AsString;
     Inc(Fila);
     HCalc.CellText[Fila, 1] := _('Cargo: ');
     HCalc.CellText[Fila, 2] := QMEmpleado.FieldByName('CATEGORIA').AsString;
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Sueldo Base: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H001'));

     HCalc.CellText[Fila, 5] := _('Fecha de ingreso: ');
     if HCalc.IsExcel then
        HCalc.CellText[Fila, 7] := '''' + FormatDateTime('dd/MM/yyyy', QMCabNomina.FieldByName('FECHA_INI_PERIODO').AsDateTime)
     else
        HCalc.CellText[Fila, 7] := FormatDateTime('dd/MM/yyyy', QMCabNomina.FieldByName('FECHA_INI_PERIODO').AsDateTime);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Dias a Pago: ');
     HCalc.SendNumber(Fila, 3, DameImporte(3, 'P003'));

     HCalc.CellText[Fila, 5] := _('Tope Imponible Mes: ');
     HCalc.SendNumber(Fila, 7, DameImporte(4, 'CS02'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Dias Licencia Medica / Act: ');
     HCalc.SendNumber(Fila, 3, DameImporte(3, 'P002'));

     HCalc.CellText[Fila, 5] := _('Tope Seguro Cesantia: ');
     HCalc.SendNumber(Fila, 7, DameImporte(4, 'CS03'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Dias Faltas / Permisos: ');
     HCalc.SendNumber(Fila, 3, DameImporte(3, 'P001'));

     HCalc.CellText[Fila, 5] := _('Valor UF: ');
     HCalc.SendNumber(Fila, 7, DameImporte(4, 'C001'));
     Inc(Fila);

     HCalc.CellText[Fila, 5] := _('Base Imponible: ');
     HCalc.SendNumber(Fila, 7, DameImporte(1, 'H013'));
     Inc(Fila);

     HCalc.CellText[Fila, 5] := _('Base Tributable: ');
     HCalc.SendNumber(Fila, 7, DameImporte(1, 'H014'));
     Inc(Fila);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Haberes Imponibles');
     HCalc.CellText[Fila, 5] := _('Descuentos');
     DestacaFila(Fila, clYellow);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Sueldo Base Ganado: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H002'));

     HCalc.CellText[Fila, 5] := _('A.F.P. Habitat S.A.: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D001'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Sueldo Base P.T.: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H001'));

     HCalc.CellText[Fila, 5] := _('Fonasa: ');
     HCalc.SendNumber(Fila, 7, DameImporte(3, 'D002'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Gratificación: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H005'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Horas de Descuento: ');
     HCalc.SendNumber(Fila, 2, DameImporte(1, 'H045'));
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H050'));

     HCalc.CellText[Fila, 5] := _('Descuento Adicional Isapre: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D006'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Monto Horas Extras 50%: ');
     // HCalc.SendNumber(Fila, 2, DameImporte(?, '????'));
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H003'));

     HCalc.CellText[Fila, 5] := _('Impuesto: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D008'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Bono de Producción: ');
     // HCalc.SendNumber(Fila, 3, DameImporte(?, '????'));

     HCalc.CellText[Fila, 5] := _('Seguro Cesantía Trabajador: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D011'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Comision por semana corrida: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H027'));

     HCalc.CellText[Fila, 5] := _('APV Distinto AFP (Otras Inst) U.F.: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D080'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Comisiones por Ventas: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H029'));

     HCalc.CellText[Fila, 5] := _('APVI Afiliado AFP en UF: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D030'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Aguinaldo: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H023'));

     HCalc.CellText[Fila, 5] := _('APVI Afiliado AFP $: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D061'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Bono Meta: ');
     // HCalc.SendNumber(Fila, 3, DameImporte(?, '????'));

     HCalc.CellText[Fila, 5] := _('Ahorro AFP: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D013'));
     Inc(Fila);

     HCalc.CellText[Fila, 5] := _('Descto 3% Prestamo Estado: ');
     // HCalc.SendNumber(Fila, 7, DameImporte(?, '????'));
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Total Imponible: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H006'));
     HCalc.BackgroundColor(Fila, 1, clLime);
     HCalc.BackgroundColor(Fila, 2, clLime);
     HCalc.BackgroundColor(Fila, 3, clLime);

     HCalc.CellText[Fila, 5] := _('Total Descuentos Legales: ');
     // HCalc.SendNumber(Fila, 7, DameImporte(?, '????'));
     HCalc.BackgroundColor(Fila, 5, clLime);
     HCalc.BackgroundColor(Fila, 6, clLime);
     HCalc.BackgroundColor(Fila, 7, clLime);
     Inc(Fila);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Haberes No Imponibles ');
     HCalc.CellText[Fila, 5] := _('Descuentos Personales ');
     DestacaFila(Fila, clYellow);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Asignación Familiar Simple: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H007'));

     HCalc.CellText[Fila, 5] := _('Anticipo Sueldo: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D014'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Asignación Familiar Retroactivo: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H008'));

     { TODO : Averiguar si esto es el campo D015 o D060. Ambos campos son editables (No se calculan)}
     HCalc.CellText[Fila, 5] := _('Préstamo Empresa: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D015'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Monto Colación: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H009'));

     HCalc.CellText[Fila, 5] := _('Descuentos Varios: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D022'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Monto Movilización: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H010'));

     HCalc.CellText[Fila, 5] := _('Prestamo CCAF: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D024'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Otras asignaciones No Imponibles: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H067'));

     HCalc.CellText[Fila, 5] := _('Retencion Judicial: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D026'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Viatico: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H066'));

     HCalc.CellText[Fila, 5] := _('Descuento Seguro CCAF: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D025'));
     Inc(Fila);

     HCalc.CellText[Fila, 5] := _('Aguinaldo ya cancelado: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D028'));
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Total Haberes No Imponibles: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H011'));
     HCalc.BackgroundColor(Fila, 1, clLime);
     HCalc.BackgroundColor(Fila, 2, clLime);
     HCalc.BackgroundColor(Fila, 3, clLime);

     HCalc.CellText[Fila, 5] := _('Total Descuentos Personales: ');
     // HCalc.SendNumber(Fila, 7, DameImporte(?, '????'));
     HCalc.BackgroundColor(Fila, 5, clLime);
     HCalc.BackgroundColor(Fila, 6, clLime);
     HCalc.BackgroundColor(Fila, 7, clLime);
     Inc(Fila);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Total Haberes: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H012'));

     HCalc.CellText[Fila, 5] := _('Total Descuentos: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D017'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Total Imponible: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H006'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Base Tributable: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H014'));

     HCalc.CellText[Fila, 5] := _('Liquido a Pagar: ');
     HCalc.SendNumber(Fila, 7, DameImporte(1, 'H020'));
     HCalc.BackgroundColor(Fila, 5, clLime);
     HCalc.BackgroundColor(Fila, 6, clLime);
     HCalc.BackgroundColor(Fila, 7, clLime);
     Inc(Fila);
     Inc(Fila);

     // Tamaño automático de columnas
     // En este punto porque luego se insertan textos largos...
     HCalc.AutoFit(1);
     HCalc.ColumnWidth(4, 500);
     HCalc.AutoFit(5);

     HCalc.CellText[Fila, 1] := _('Son: ') + NumerosALetras(DameImporte(1, 'H020'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := 'Certifico haber recibido a mi entera satisfaccion el saldo liquido indicado en la presente liquidacion de sueldos';
     Inc(Fila);

     HCalc.CellText[Fila, 1] := 'y no tengo cargo ni cobro posterior que hacer en contra de mi empleador';
     Inc(Fila);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := '__________________________';
     HCalc.CellText[Fila, 5] := '__________________________';
     Inc(Fila);

     HCalc.CellText[Fila, 1] := 'Firma Empleador';
     HCalc.CellText[Fila, 5] := 'Firma Trabajador';

     // Formato
     HCalc.ColNumberFormat(3, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
     HCalc.ColNumberFormat(7, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

     HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     Sleep(1000);
  finally
     HCalc.Free;
  end;
end;

procedure TDMLstNominas.ExportarExcel2(Archivo: string);
var
  Fila, FilaIncio, FilaFinal : integer;
  HCalc : THojaCalc;

  procedure DestacaFila(aFila: integer; Color: TColor);
  var
     c : integer;
  begin
     for c := 1 to 7 do
     begin
        HCalc.Bold(aFila, c);
        HCalc.BackgroundColor(aFila, c, Color);
     end;
  end;

begin
  DMMain.Log('Exportando Factura Excel: ' + Archivo);

  // Verifico si es excel o OpenOffice
  if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
     HCalc := THojaCalc.Create(thcExcel, False)
  else
     HCalc := THojaCalc.Create(thcOpenOffice, False);

  try
     HCalc.FileName := Archivo;

     HCalc.ActivateSheetByIndex(1);

     // Cabecera
     Fila := 3;
     HCalc.CellText[Fila, 1] := DameTituloEmpresa(QMCabNomina.FieldByName('EMPRESA').AsInteger);
     HCalc.CellText[Fila, 5] := _('LIQUIDACION DE REMUNERACIONES');
     DestacaFila(Fila, clYellow);
     Inc(Fila);

     { TODO : Ver si esto es SYS_EMPRESAS.NIF (REntorno.CifEmpresa) }
     HCalc.CellText[Fila, 1] := '76.479.984-4';

     HCalc.CellText[Fila, 5] := format(_('Mes de: %d-%s'), [QMCabNomina.FieldByName('EJERCICIO').AsInteger, QMCabNomina.FieldByName('PERIODO').AsString]);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Nombre: ');
     HCalc.CellText[Fila, 2] := QMEmpleado.FieldByName('TITULO').AsString;
     HCalc.Bold(Fila, 2);
     Inc(Fila);
     HCalc.CellText[Fila, 1] := _('RUT: ');
     HCalc.CellText[Fila, 2] := QMEmpleado.FieldByName('NIF').AsString;
     HCalc.Bold(Fila, 2);

     HCalc.CellText[Fila, 5] := _('Fecha: ');
     if HCalc.IsExcel then
        HCalc.CellText[Fila, 7] := '''' + FormatDateTime('dd/MM/yyyy', QMCabNomina.FieldByName('FECHA').AsDateTime)
     else
        HCalc.CellText[Fila, 7] := FormatDateTime('dd/MM/yyyy', QMCabNomina.FieldByName('FECHA').AsDateTime);

     Inc(Fila);
     HCalc.CellText[Fila, 1] := _('Correo Electrónico: ');
     HCalc.CellText[Fila, 2] := QMEmpleado.FieldByName('EMAIL').AsString;
     Inc(Fila);
     HCalc.CellText[Fila, 1] := _('Cargo: ');
     HCalc.CellText[Fila, 2] := QMEmpleado.FieldByName('CATEGORIA').AsString;
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Sueldo Base: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H001'));

     HCalc.CellText[Fila, 5] := _('Fecha de ingreso: ');
     if HCalc.IsExcel then
        HCalc.CellText[Fila, 7] := '''' + FormatDateTime('dd/MM/yyyy', QMCabNomina.FieldByName('FECHA_INI_PERIODO').AsDateTime)
     else
        HCalc.CellText[Fila, 7] := FormatDateTime('dd/MM/yyyy', QMCabNomina.FieldByName('FECHA_INI_PERIODO').AsDateTime);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Dias a Pago: ');
     HCalc.SendNumber(Fila, 3, DameImporte(3, 'P003'));

     HCalc.CellText[Fila, 5] := _('Tope Imponible Mes: ');
     HCalc.SendNumber(Fila, 7, DameImporte(4, 'CS02'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Dias Licencia Medica / Act: ');
     HCalc.SendNumber(Fila, 3, DameImporte(3, 'P002'));

     HCalc.CellText[Fila, 5] := _('Tope Seguro Cesantia: ');
     HCalc.SendNumber(Fila, 7, DameImporte(4, 'CS03'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Dias Faltas / Permisos: ');
     HCalc.SendNumber(Fila, 3, DameImporte(3, 'P001'));

     HCalc.CellText[Fila, 5] := _('Valor UF: ');
     HCalc.SendNumber(Fila, 7, DameImporte(4, 'C001'));
     Inc(Fila);

     HCalc.CellText[Fila, 5] := _('Base Imponible: ');
     HCalc.SendNumber(Fila, 7, DameImporte(1, 'H013'));
     Inc(Fila);

     HCalc.CellText[Fila, 5] := _('Base Tributable: ');
     HCalc.SendNumber(Fila, 7, DameImporte(1, 'H014'));
     Inc(Fila);
     Inc(Fila);
     Inc(Fila);

     //************** Segundo Bloque **************
     HCalc.CellText[Fila, 1] := _('Haberes Imponibles');
     HCalc.CellText[Fila, 5] := _('Descuentos');
     DestacaFila(Fila, clYellow);
     Inc(Fila);
     Inc(Fila);

     // *** Haberes Imponibles ***
     // MOSTRAR = 1 y ES_IMPONIBLE = 1
     FilaIncio := Fila;
     with QMNomDetHaberes do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_EMP_NOMINAS_DET_HABERES');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ID_CABECERA = :ID_CABECERA AND ');
        SelectSQL.Add(' MOSTRAR_IMPRESION = 1 AND ES_IMPONIBLE = 1 ');
        SelectSQL.Add(' ORDER BY ORDEN_IMPRESION ');
        Params.ByName['ID_CABECERA'].AsInteger := QMCabNomina.FieldByName('ID').AsInteger;
        Open;
        First;
        if RecordCount > 0 then
           while not EOF do
           begin
              HCalc.CellText[Fila, 1] := _(FieldByName('GLOSA').AsString);
              HCalc.SendNumber(Fila, 3, DameImporte(1, FieldByName('CODIGO').AsString));
              Inc(Fila);

              Next;
           end;

        Close;
        SelectSQL.Clear;
        SelectSQL.Text := SQLBaseHaberes.Text;
        Open;

        FilaFinal := fila;
     end;

     // *** Descuentos ***
     // MOSTRAR = 1 y ES_PERSONAL = 0
     Fila := FilaIncio;
     with QMNomDetDescuentos do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_EMP_NOMINAS_DET_DESCUENTOS');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ID_CABECERA = :ID_CABECERA AND ');
        SelectSQL.Add(' MOSTRAR_IMPRESION = 1 AND ES_PERSONAL = 0 ');
        SelectSQL.Add(' ORDER BY ORDEN_IMPRESION ');
        Params.ByName['ID_CABECERA'].AsInteger := QMCabNomina.FieldByName('ID').AsInteger;
        Open;
        First;
        if RecordCount > 0 then
           while not EOF do
           begin
              HCalc.CellText[Fila, 5] := _(FieldByName('GLOSA').AsString);
              HCalc.SendNumber(Fila, 7, DameImporte(2, FieldByName('CODIGO').AsString));
              Inc(Fila);

              Next;
           end;

        Close;
        SelectSQL.Clear;
        SelectSQL.Text := SQLBaseDescuentos.Text;
        Open;

        if Fila > FilaFinal then
           FilaFinal := fila;
     end;

     // Totales del Segundo Bloque
     Fila := FilaFinal;
     HCalc.CellText[Fila, 1] := _('Total Imponible: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H006'));
     HCalc.BackgroundColor(Fila, 1, clLime);
     HCalc.BackgroundColor(Fila, 2, clLime);
     HCalc.BackgroundColor(Fila, 3, clLime);

     HCalc.CellText[Fila, 5] := _('Total Descuentos Legales: ');
     // HCalc.SendNumber(Fila, 7, DameImporte(?, '????'));
     HCalc.BackgroundColor(Fila, 5, clLime);
     HCalc.BackgroundColor(Fila, 6, clLime);
     HCalc.BackgroundColor(Fila, 7, clLime);
     Inc(Fila);
     Inc(Fila);
     Inc(Fila);

     //************** Tercer Bloque **************
     HCalc.CellText[Fila, 1] := _('Haberes No Imponibles ');
     HCalc.CellText[Fila, 5] := _('Descuentos Personales ');
     DestacaFila(Fila, clYellow);
     Inc(Fila);
     Inc(Fila);

     // ***Haberes NO Imponibles ***
     // MOSTRAR = 1 y ES_IMPONIBLE = 0
     FilaIncio := Fila;
     with QMNomDetHaberes do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_EMP_NOMINAS_DET_HABERES');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ID_CABECERA = :ID_CABECERA AND ');
        SelectSQL.Add(' MOSTRAR_IMPRESION = 1 AND ES_IMPONIBLE = 0 ');
        SelectSQL.Add(' ORDER BY ORDEN_IMPRESION ');
        Params.ByName['ID_CABECERA'].AsInteger := QMCabNomina.FieldByName('ID').AsInteger;
        Open;
        First;
        if RecordCount > 0 then
           while not EOF do
           begin
              HCalc.CellText[Fila, 1] := _(FieldByName('GLOSA').AsString);
              HCalc.SendNumber(Fila, 3, DameImporte(1, FieldByName('CODIGO').AsString));
              Inc(Fila);

              Next;
           end;

        Close;
        SelectSQL.Clear;
        SelectSQL.Text := SQLBaseHaberes.Text;
        Open;

        FilaFinal := fila;
     end;

     // *** Descuentos Personales ***
     // MOSTRAR = 1 y ES_PERSONAL = 1
     Fila := FilaIncio;
     with QMNomDetDescuentos do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_EMP_NOMINAS_DET_DESCUENTOS');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ID_CABECERA = :ID_CABECERA AND ');
        SelectSQL.Add(' MOSTRAR_IMPRESION = 1 AND ES_PERSONAL = 1 ');
        SelectSQL.Add(' ORDER BY ORDEN_IMPRESION ');
        Params.ByName['ID_CABECERA'].AsInteger := QMCabNomina.FieldByName('ID').AsInteger;
        Open;
        First;
        if RecordCount > 0 then
           while not EOF do
           begin
              HCalc.CellText[Fila, 5] := _(FieldByName('GLOSA').AsString);
              HCalc.SendNumber(Fila, 7, DameImporte(2, FieldByName('CODIGO').AsString));
              Inc(Fila);

              Next;
           end;

        Close;
        SelectSQL.Clear;
        SelectSQL.Text := SQLBaseDescuentos.Text;
        Open;

        if Fila > FilaFinal then
           FilaFinal := fila;
     end;

     // Totales del Tercer Bloque
     Fila := FilaFinal;
     HCalc.CellText[Fila, 1] := _('Total Haberes No Imponibles: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H011'));
     HCalc.BackgroundColor(Fila, 1, clLime);
     HCalc.BackgroundColor(Fila, 2, clLime);
     HCalc.BackgroundColor(Fila, 3, clLime);

     HCalc.CellText[Fila, 5] := _('Total Descuentos Personales: ');
     // HCalc.SendNumber(Fila, 7, DameImporte(?, '????'));
     HCalc.BackgroundColor(Fila, 5, clLime);
     HCalc.BackgroundColor(Fila, 6, clLime);
     HCalc.BackgroundColor(Fila, 7, clLime);
     Inc(Fila);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Total Haberes: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H012'));

     HCalc.CellText[Fila, 5] := _('Total Descuentos: ');
     HCalc.SendNumber(Fila, 7, DameImporte(2, 'D017'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Total Imponible: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H006'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := _('Base Tributable: ');
     HCalc.SendNumber(Fila, 3, DameImporte(1, 'H014'));

     HCalc.CellText[Fila, 5] := _('Liquido a Pagar: ');
     HCalc.SendNumber(Fila, 7, DameImporte(1, 'H020'));
     HCalc.BackgroundColor(Fila, 5, clLime);
     HCalc.BackgroundColor(Fila, 6, clLime);
     HCalc.BackgroundColor(Fila, 7, clLime);
     Inc(Fila);
     Inc(Fila);

     // Tamaño automático de columnas
     // En este punto porque luego se insertan textos largos...
     HCalc.AutoFit(1);
     HCalc.ColumnWidth(4, 500);
     HCalc.AutoFit(5);

     HCalc.CellText[Fila, 1] := _('Son: ') + NumerosALetras(DameImporte(1, 'H020'));
     Inc(Fila);

     HCalc.CellText[Fila, 1] := 'Certifico haber recibido a mi entera satisfaccion el saldo liquido indicado en la presente liquidacion de sueldos';
     Inc(Fila);

     HCalc.CellText[Fila, 1] := 'y no tengo cargo ni cobro posterior que hacer en contra de mi empleador';
     Inc(Fila);
     Inc(Fila);
     Inc(Fila);

     HCalc.CellText[Fila, 1] := '__________________________';
     HCalc.CellText[Fila, 5] := '__________________________';
     Inc(Fila);

     HCalc.CellText[Fila, 1] := 'Firma Empleador';
     HCalc.CellText[Fila, 5] := 'Firma Trabajador';

     // Formato
     HCalc.ColNumberFormat(3, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
     HCalc.ColNumberFormat(7, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

     HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     Sleep(1000);
  finally
     HCalc.Free;
  end;
end;

procedure TDMLstNominas.ExportarLibroRemunearaciones(Periodo: string; Archivo: string);
var
  Fila : integer;
  HCalc : THojaCalc;
  i : integer;
begin
  with QMCabNomina do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_EMP_NOMINAS_CABECERA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' PERIODO = :PERIODO ');
     SelectSQL.Add(' ORDER BY NIF '); // Podría ser tambíen EMPLEADO, NOMBRE_R_SOCIAL

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PERIODO'].AsString := Periodo;
     Open;
  end;

  DMMain.Log('Exportando Libro de Remuneraciones Excel: ' + Archivo);

  // Verifico si es excel o OpenOffice
  if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
     HCalc := THojaCalc.Create(thcExcel, False)
  else
     HCalc := THojaCalc.Create(thcOpenOffice, False);

  try
     HCalc.FileName := Archivo;

     HCalc.ActivateSheetByIndex(1);

     // Cabecera
     Fila := 1;
     HCalc.CellText[Fila, 1] := 'Cia';
     HCalc.CellText[Fila, 2] := 'Mes';
     HCalc.CellText[Fila, 3] := 'Nombre';
     HCalc.CellText[Fila, 4] := 'RUT';
     HCalc.CellText[Fila, 5] := DMMain.DameGlosa(3, 'P003');
     HCalc.CellText[Fila, 6] := DMMain.DameGlosa(1, 'H080');
     HCalc.CellText[Fila, 7] := DMMain.DameGlosa(1, 'H081');
     HCalc.CellText[Fila, 8] := DMMain.DameGlosa(1, 'H003');
     HCalc.CellText[Fila, 9] := DMMain.DameGlosa(1, 'H069');
     HCalc.CellText[Fila, 10] := DMMain.DameGlosa(1, 'H070');
     HCalc.CellText[Fila, 11] := DMMain.DameGlosa(1, 'H006');
     HCalc.CellText[Fila, 12] := DMMain.DameGlosa(3, 'P013');
     HCalc.CellText[Fila, 13] := DMMain.DameGlosa(1, 'H036');
     HCalc.CellText[Fila, 14] := DMMain.DameGlosa(1, 'H037');
     HCalc.CellText[Fila, 15] := DMMain.DameGlosa(1, 'H066');
     HCalc.CellText[Fila, 16] := DMMain.DameGlosa(1, 'H007');
     HCalc.CellText[Fila, 17] := DMMain.DameGlosa(1, 'H012');
     HCalc.CellText[Fila, 18] := DMMain.DameGlosa(2, 'D055');
     HCalc.CellText[Fila, 19] := DMMain.DameGlosa(2, 'D018');
     HCalc.CellText[Fila, 20] := DMMain.DameGlosa(2, 'D003');
     HCalc.CellText[Fila, 21] := DMMain.DameGlosa(1, 'H014');
     HCalc.CellText[Fila, 22] := DMMain.DameGlosa(2, 'D008');
     HCalc.CellText[Fila, 23] := DMMain.DameGlosa(3, 'P153');
     HCalc.CellText[Fila, 24] := DMMain.DameGlosa(2, 'D081');
     HCalc.CellText[Fila, 25] := DMMain.DameGlosa(2, 'D080');
     HCalc.CellText[Fila, 26] := DMMain.DameGlosa(2, 'D014');
     HCalc.CellText[Fila, 27] := DMMain.DameGlosa(1, 'H020');
     HCalc.CellText[Fila, 28] := DMMain.DameGlosa(3, 'P152');
     HCalc.CellText[Fila, 29] := DMMain.DameGlosa(2, 'D031');
     HCalc.CellText[Fila, 30] := DMMain.DameGlosa(2, 'D053');
     HCalc.CellText[Fila, 31] := DMMain.DameGlosa(2, 'D054');
     HCalc.CellText[Fila, 32] := DMMain.DameGlosa(2, 'D061');
     HCalc.CellText[Fila, 33] := DMMain.DameGlosa(2, 'D013');
     HCalc.CellText[Fila, 34] := DMMain.DameGlosa(2, 'D024');
     HCalc.CellText[Fila, 35] := DMMain.DameGlosa(3, 'P418');

     Inc(Fila);

     with QMCabNomina do
     begin
        while not EOF do
        begin
           HCalc.CellText[Fila, 1] := REntorno.NombreEmpresa;
           HCalc.CellText[Fila, 2] := QMCabNomina.FieldByName('PERIODO').AsString;
           HCalc.CellText[Fila, 3] := QMCabNomina.FieldByName('NOMBRE_R_SOCIAL').AsString;
           HCalc.CellText[Fila, 4] := QMCabNomina.FieldByName('NIF').AsString;
           HCalc.SendNumber(Fila, 5, DameImporte(3, 'P003'));
           HCalc.SendNumber(Fila, 6, DameImporte(1, 'H080'));
           HCalc.SendNumber(Fila, 7, DameImporte(1, 'H081'));
           HCalc.SendNumber(Fila, 8, DameImporte(1, 'H003'));
           HCalc.SendNumber(Fila, 9, DameImporte(1, 'H069'));
           HCalc.SendNumber(Fila, 10, DameImporte(1, 'H070'));
           HCalc.SendNumber(Fila, 11, DameImporte(1, 'H006'));
           HCalc.SendNumber(Fila, 12, DameImporte(3, 'P013'));
           HCalc.SendNumber(Fila, 13, DameImporte(1, 'H036'));
           HCalc.SendNumber(Fila, 14, DameImporte(1, 'H037'));
           HCalc.SendNumber(Fila, 15, DameImporte(1, 'H066'));
           HCalc.SendNumber(Fila, 16, DameImporte(1, 'H007'));
           HCalc.SendNumber(Fila, 17, DameImporte(1, 'H012'));
           HCalc.SendNumber(Fila, 18, DameImporte(2, 'D055'));
           HCalc.SendNumber(Fila, 19, DameImporte(2, 'D018'));
           HCalc.SendNumber(Fila, 20, DameImporte(2, 'D003'));
           HCalc.SendNumber(Fila, 21, DameImporte(1, 'H014'));
           HCalc.SendNumber(Fila, 22, DameImporte(1, 'D008'));
           HCalc.SendNumber(Fila, 23, DameImporte(3, 'P153'));
           HCalc.SendNumber(Fila, 24, DameImporte(2, 'D081'));
           HCalc.SendNumber(Fila, 25, DameImporte(2, 'D080'));
           HCalc.SendNumber(Fila, 26, DameImporte(2, 'D014'));
           HCalc.SendNumber(Fila, 27, DameImporte(1, 'H020'));
           HCalc.SendNumber(Fila, 28, DameImporte(3, 'P152'));
           HCalc.SendNumber(Fila, 29, DameImporte(2, 'D031'));
           HCalc.SendNumber(Fila, 30, DameImporte(2, 'D053'));
           HCalc.SendNumber(Fila, 31, DameImporte(2, 'D054'));
           HCalc.SendNumber(Fila, 32, DameImporte(2, 'D061'));
           HCalc.SendNumber(Fila, 33, DameImporte(2, 'D013'));
           HCalc.SendNumber(Fila, 34, DameImporte(2, 'D024'));
           HCalc.SendNumber(Fila, 35, DameImporte(3, 'P418'));

           Inc(Fila);
           Next;
        end;
     end;

     // Tamaño automático de columnas
     // En este punto porque luego se insertan textos largos...
     HCalc.AutoFit(1); // Compañia
     HCalc.AutoFit(2); // Mes
     HCalc.AutoFit(3); // Nombre
     HCalc.AutoFit(4); // RUT (NIF del empleado)
     for i := 5 to 35 do
        HCalc.AutoFit(i);

     // Formato
     HCalc.ColNumberFormat(5, '#' + ThousandSeparator + '##0'); // Entero
     HCalc.ColNumberFormat(6, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00'); // Dos decimales
     HCalc.ColNumberFormat(7, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00'); // Dos decimales
     HCalc.ColNumberFormat(8, '#' + ThousandSeparator + '##0'); // Entero
     for i := 9 to 35 do
        HCalc.ColNumberFormat(i, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00'); // Dos decimales

     HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     Sleep(1000);
  finally
     HCalc.Free;
  end;
end;

procedure TDMLstNominas.MostrarListadoMail(IdNomina: integer; Modo: integer; var Memo: TStrings);
var
  str : string;
  //Grupo : integer;
  Listado : smallint;
begin
  Listado := 0;

  with QMCabNomina do
  begin
     Close;
     Params.ByName['ID'].AsInteger := IdNomina;
     Open;
  end;

  nombreFich := _('Nomina') + '_' + QMCabNomina.FieldByName('ID').AsString + '_Periodo_' + QMCabNomina.FieldByName('EJERCICIO').AsString + '-' + QMCabNomina.FieldByName('PERIODO').AsString;

  DMListados.CargarMail(643, '');

  if (Modo <> 2) then
  begin
     if (REntorno.TipoListado = 'HYM') then
     begin
        HYReportMail.LoadFromFIB(REntorno.Formato, str);
        HYReportMail.Prepare;
        case Modo of
           0: HYReportMail.Preview;
           1: HYReportMail.PrintinMemo(Memo);
        end;
     end
     else if (REntorno.TipoListado = 'FR3') then
     begin
        frxNominas.LoadFromFIB(REntorno.Formato, str);
        if (frxNominas.DotMatrixReport) then
        begin
           frxNominas.PrepareReport;
           frxNominas.PreviewOptions.Zoom := 0.85;
           case Modo of
              0: frxNominas.ShowPreparedReport;
              1: frxNominas.PrintInMemo(Memo);
           end;
           frxNominas.PreviewOptions.Zoom := 1;
        end;
     end;
  end
  else
  begin
     if (REntorno.TipoListado = 'FRF') then
     begin
        with frNominas do
        begin
           LoadFromFIB(REntorno.Formato, str);
           PrepareReport;
           rutaFich := ExportarPDF(frNominas, nombreFich);
        end;
     end
     else
     if (REntorno.TipoListado = 'FR3') then
     begin
        with frxNominas do
        begin
           LoadFromFIB(REntorno.Formato, str);
           PrepareReport;
           rutaFich := ExportarPDF(frxNominas, nombreFich);
        end;
     end
     else
     begin
        MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 +
           'El listado debe ser del tipo FRF/FR3.'), mtWarning, [mbOK], 0);
        raise Exception.Create('');
     end;
  end;

  DMListados.LimpiaEntorno;
end;

end.
