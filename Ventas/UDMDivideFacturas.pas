unit UDMDivideFacturas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, FIBDataSetRO, FIBTableDataSetRO, SysUtils,
  HYFIBQuery;

type
  TDMDivideFacturas = class(TDataModule)
     DSQMFacturas: TDataSource;
     QMFacturas: TFIBTableSetRO;
     QMFacturasEMPRESA: TIntegerField;
     QMFacturasEJERCICIO: TIntegerField;
     QMFacturasCANAL: TIntegerField;
     QMFacturasSERIE: TFIBStringField;
     QMFacturasRIG: TIntegerField;
     QMFacturasFECHA: TDateTimeField;
     QMFacturasTITULO: TFIBStringField;
     QMFacturasCLIENTE: TIntegerField;
     QMFacturasSU_REFERENCIA: TFIBStringField;
     QMFacturasFORMA_PAGO: TFIBStringField;
     QMFacturasTOTAL_A_COBRAR: TFloatField;
     QMFacturasMONEDA: TFIBStringField;
     QMFacturasID_S: TIntegerField;
     QMFacturasTIPO: TFIBStringField;
     QMFacturasPROCESO_AUTO: TIntegerField;
     TLocal: THYTransaction;
     QMFacturasTRANSPORTISTA: TIntegerField;
     procedure DMDivideFacturasCreate(Sender: TObject);
     procedure QMFacturasTOTAL_A_COBRARGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure DivideFacturas(Sender: TForm; CanalDestino: integer; Porcentaje: double);
     procedure MarcaTodas(Sender: TForm);
     procedure MarcaHasta(Sender: TForm);
     procedure Refrescar;
     procedure CambiarSeleccion(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente, Proyecto: integer; Serie: string);
     procedure DameMinMax(var Desde, Hasta: integer);
  end;

var
  DMDivideFacturas : TDMDivideFacturas;

implementation

uses UFBuscaRO, UFmDivideFacturas, UEntorno, UFormGest, UDMMain, UUtiles;

{$R *.DFM}

procedure TDMDivideFacturas.DMDivideFacturasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not QMFacturas.Transaction.InTransaction then
     QMFacturas.Transaction.StartTransaction;
end;

procedure TDMDivideFacturas.DivideFacturas(Sender: TForm; CanalDestino: integer; Porcentaje: double);
var
  BM : TBookmark;
  Q : THYFIBQuery;
begin
  DMMain.LogIni('DivideFacturas(' + IntToStr(CanalDestino) + ', ' + FloatToStr(Porcentaje) + ')');
  BM := QMFacturas.GetBookmark;
  try
     QMFacturas.DisableControls;
     QMFacturas.Open;
     QMFacturas.First;
     repeat
        if TFMDivideFacturas(Sender).Seleccionado then
        begin
           DMMain.LogIni('G_TRASPASO_FACTURA_A_OTRO_MUL - ' + QMFacturas.FieldByName('EJERCICIO').AsString + ' ' + QMFacturas.FieldByName('SERIE').AsString + '/' + QMFacturas.FieldByName('RIG').AsString);
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' EXECUTE PROCEDURE G_TRASPASO_FACTURA_A_OTRO_MUL( ');
                 SQL.Add(' :O_EMPRESA, :O_EJERCICIO, :O_CANAL, :O_SERIE, :O_TIPO, :O_RIG, :D_TIPO, ');
                 SQL.Add(' :D_ENTRADA, :D_FECHA, :O_TRANSPORTISTA, :D_EJERCICIO, :D_CANAL, :D_SERIE, ');
                 SQL.Add(' :ID_S, :BORRARORIGEN, :GENERA_MOV_STOCK, :BORRA_MOV_STOCK, :CIERRA_FAC, ');
                 SQL.Add(' :GENERAR_PRECIOS) ');
                 Params.ByName['O_EMPRESA'].AsInteger := QMFacturas.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['O_EJERCICIO'].AsInteger := QMFacturas.FieldByName('EJERCICIO').AsInteger;
                 Params.ByName['O_CANAL'].AsInteger := QMFacturas.FieldByName('CANAL').AsInteger;
                 Params.ByName['O_SERIE'].AsString := QMFacturas.FieldByName('SERIE').AsString;
                 Params.ByName['O_TIPO'].AsString := QMFacturas.FieldByName('TIPO').AsString;
                 Params.ByName['O_RIG'].AsInteger := QMFacturas.FieldByName('RIG').AsInteger;
                 Params.ByName['D_TIPO'].AsString := QMFacturas.FieldByName('TIPO').AsString;
                 Params.ByName['D_ENTRADA'].AsInteger := REntorno.Entrada;
                 Params.ByName['D_FECHA'].AsDateTime := QMFacturas.FieldByName('FECHA').AsDateTime;
                 Params.ByName['O_TRANSPORTISTA'].AsInteger := QMFacturas.FieldByName('TRANSPORTISTA').AsInteger;
                 Params.ByName['D_EJERCICIO'].AsInteger := QMFacturas.FieldByName('EJERCICIO').AsInteger;
                 Params.ByName['D_CANAL'].AsInteger := CanalDestino;
                 Params.ByName['D_SERIE'].AsString := QMFacturas.FieldByName('SERIE').AsString;
                 Params.ByName['ID_S'].AsInteger := QMFacturas.FieldByName('ID_S').AsInteger;
                 Params.ByName['BORRARORIGEN'].AsInteger := 1;
                 Params.ByName['GENERA_MOV_STOCK'].AsInteger := 1;
                 Params.ByName['BORRA_MOV_STOCK'].AsInteger := 1;
                 Params.ByName['CIERRA_FAC'].AsInteger := 0;
                 Params.ByName['GENERAR_PRECIOS'].AsInteger := 0;
                 ExecQuery;
                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;
           DMMain.LogFin('G_TRASPASO_FACTURA_A_OTRO_MUL - ' + QMFacturas.FieldByName('EJERCICIO').AsString + ' ' + QMFacturas.FieldByName('SERIE').AsString + '/' + QMFacturas.FieldByName('RIG').AsString);
        end;

        QMFacturas.Next;
     until QMFacturas.EOF;

     try
        QMFacturas.GotoBookmark(BM);
     except
        QMFacturas.First;
     end;
  finally
     QMFacturas.EnableControls;
     QMFacturas.FreeBookmark(BM);
  end;

  Refrescar;
  DMMain.LogFin('DivideFacturas(' + IntToStr(CanalDestino) + ', ' + FloatToStr(Porcentaje) + ')');
end;

procedure TDMDivideFacturas.MarcaTodas(Sender: TForm);
var
  BM : TBookmark;
begin
  BM := QMFacturas.GetBookmark;
  try
     QMFacturas.DisableControls;
     QMFacturas.First;

     repeat
        TFMDivideFacturas(Sender).Marca;
        QMFacturas.Next;
     until QMFacturas.EOF;

     try
        QMFacturas.GotoBookmark(BM);
     except
        QMFacturas.First;
     end;
  finally
     QMFacturas.EnableControls;
     QMFacturas.FreeBookmark(BM);
  end;
end;

procedure TDMDivideFacturas.MarcaHasta(Sender: TForm);
var
  BM : TBookmark;
begin
  BM := QMFacturas.GetBookmark;
  try
     QMFacturas.DisableControls;
     while not (TFMDivideFacturas(Sender).DBGFacturas.SelectedRows.CurrentRowSelected) do
     begin
        TFMDivideFacturas(Sender).Marca;
        QMFacturas.Prior;
     end;

     try
        QMFacturas.GotoBookmark(BM);
     except
        QMFacturas.First;
     end;
  finally
     QMFacturas.EnableControls;
     QMFacturas.FreeBookmark(BM);
  end;
end;

procedure TDMDivideFacturas.BusquedaCompleja;
var
  orden : string;
begin
  QMFacturas.Close;
  if TFBuscaRO.Create(Self).SeleccionaBusqueda(QMFacturas, '11100', False) = mrOk then
  begin
     orden := QMFacturas.OrdenadoPor;
     QMFacturas.ordenar('');
     if QMFacturas.SelectSQL.Count <> 0 then
        QMFacturas.SelectSQL.Add('and tipo=''FAC''');
     QMFacturas.Ordenar(orden);
  end;
  QMFacturas.Open;
end;

procedure TDMDivideFacturas.QMFacturasTOTAL_A_COBRARGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMFacturasMONEDA.AsString, 1),
     QMFacturasTOTAL_A_COBRAR.AsFloat);
end;

procedure TDMDivideFacturas.Refrescar;
begin
  QMFacturas.Close;
  QMFacturas.Open;
end;

procedure TDMDivideFacturas.CambiarSeleccion(DesdeFecha, HastaFecha: TDateTime; DesdeCliente, HastaCliente, Proyecto: integer; Serie: string);
begin
  with QMFacturas do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT * ');
        Add(' FROM VER_CABECERAS_FACTURA ');
        Add(' WHERE  ');
        Add(' EMPRESA = :EMPRESA AND ');
        Add(' EJERCICIO = :EJERCICIO AND ');
        Add(' CANAL = :CANAL AND ');
        Add(' TIPO = ''FAC'' AND ');
        Add(' FECHA BETWEEN :DESDE_FECHA AND :HASTA_FECHA AND ');
        Add(' CLIENTE BETWEEN :DESDE_CLIENTE AND :HASTA_CLIENTE AND ');
        Add(' PROYECTO = :PROYECTO AND ');
        Add(' ESTADO = :ESTADO AND ');
        Add(' FORMA_PAGO IN (SELECT FORMA_PAGO FROM CON_CUENTAS_GES_FP WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL=:CANAL AND TIPO_EFECTO = ''CON'') ');
        if (Serie <> '') then
           Add(' AND SERIE = :SERIE ');
        Add(' ORDER BY SERIE, RIG ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := HastaFecha;
     Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
     Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
     Params.ByName['PROYECTO'].AsInteger := Proyecto;
     Params.ByName['ESTADO'].AsInteger := 0;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMDivideFacturas.DameMinMax(var Desde, Hasta: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT MIN(CLIENTE),MAX(CLIENTE) FROM VER_CLIENTES_CUENTAS');
        SQL.Add('WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND');
        SQL.Add('EJERCICIO =' + REntorno.EjercicioStr + ' AND');
        SQL.Add('CANAL =' + REntorno.CanalStr);
        ExecQuery;
        Desde := FieldByName['MIN'].AsInteger;
        Hasta := FieldByName['MAX'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

end.
