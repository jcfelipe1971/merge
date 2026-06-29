unit UDMLstStockResTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, DB, DBTables, FIBDataSet, FIBTableDataSet, FR_Class, FR_DSet, FR_DBSet,
  Fr_HYReport, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO;

type
  TDMLstStockResTallas = class(TDataModule)
     xMod_Desde: TFIBDataSetRO;
     DSxMod_Desde: TDataSource;
     xMod_Hasta: TFIBDataSetRO;
     DSxMod_Hasta: TDataSource;
     frStockResTallas: TfrHYReport;
     TLocal: THYTransaction;
     xGrupo_Desde: TFIBDataSetRO;
     DSxGrupo_Desde: TDataSource;
     xGrupo_Hasta: TFIBDataSetRO;
     DSxGrupo_Hasta: TDataSource;
     SPStock: TFIBDataSetRO;
     DSPStock: TDataSource;
     frDSStock: TfrDBDataSet;
     SPStockStock: TFIBDataSetRO;
     DSSPStockStock: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frStockResTallasEnterRect(Memo: TStringList; View: TfrView);
     procedure frStockResTallasGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     // LocalMascaraN: string;
     SW, SWStock, SWTalla: integer;
     RangoSelec: string;
     ATalla: array[0..15] of string;
     AStock: array[0..15] of double;
     procedure ActualizarRangoSelec(LCan: TStrings; Canal: smallint);
  public
     { Public declarations }
     ModeloDesde, ModeloHasta, GrupoDesde, GrupoHasta, Almacen: string;
     FechaCalculo: TDateTime;
     TipoStock, FCanal: integer;
     procedure Rangos;
     procedure ActualizaGrupoDesde(Grupo: string);
     procedure ActualizaGrupoHasta(Grupo: string);
     procedure ActualizaModeloDesde(Modelo: string);
     procedure ActualizaModeloHasta(Modelo: string);
     procedure MostrarListado(modo: byte; LCan: TStringList);
  end;

var
  DMLstStockResTallas : TDMLstStockResTallas;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles;

{$R *.dfm}

procedure TDMLstStockResTallas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
end;

procedure TDMLstStockResTallas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstStockResTallas.Rangos;
begin
  DameMinMax('RFP', ModeloDesde, ModeloHasta);
  DameMinMax('GRT', GrupoDesde, GrupoHasta);
  Almacen := REntorno.AlmacenDefecto;
end;

procedure TDMLstStockResTallas.ActualizaGrupoDesde(Grupo: string);
begin
  with xGrupo_desde do
  begin
     Close;
     Params.ByName['GRUPO'].AsString := Grupo;
     Open;
  end;
end;

procedure TDMLstStockResTallas.ActualizaGrupoHasta(Grupo: string);
begin
  with xGrupo_Hasta do
  begin
     Close;
     Params.ByName['GRUPO'].AsString := Grupo;
     Open;
  end;
end;

procedure TDMLstStockResTallas.ActualizaModeloDesde(Modelo: string);
begin
  with xMod_desde do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['MODELO'].AsString := Modelo;
     Open;
  end;
end;

procedure TDMLstStockResTallas.ActualizaModeloHasta(Modelo: string);
begin
  with xMod_Hasta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['MODELO'].AsString := Modelo;
     Open;
  end;
end;

procedure TDMLstStockResTallas.MostrarListado(modo: byte; LCan: TStringList);
begin
  ActualizarRangoSelec(LCan, FCanal);

  with SPStock do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := FCanal;
     Params.ByName['MOD_DESDE'].AsString := ModeloDesde;
     Params.ByName['MOD_HASTA'].AsString := ModeloHasta;
     Params.ByName['GRUPO_DESDE'].AsString := GrupoDesde;
     Params.ByName['GRUPO_HASTA'].AsString := GrupoHasta;
     Params.ByName['TIPO_STOCK'].AsInteger := TipoStock;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['FECHA'].AsDateTime := FechaCalculo;
     Open;
  end;

  SW := 1;
  SWStock := 1;
  SWTalla := 1;
  DMListados.Imprimir(5000, 0, Modo, '', '', frStockResTallas, nil, nil, nil);
end;

procedure TDMLstStockResTallas.frStockResTallasEnterRect(Memo: TStringList; View: TfrView);
begin
  if Memo.Count > 0 then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

procedure TDMLstStockResTallas.frStockResTallasGetValue(const ParName: string; var ParValue: variant);
var
  i, j : integer;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Empresa' then
     ParValue := REntorno.NombreEmpresa;
  if ParName = 'Empresa_Cif' then
     ParValue := REntorno.CifEmpresa;
  if ParName = 'Empresa_Direccion' then
     ParValue := REntorno.DirEmpresa;
  if ParName = 'Empresa_Cod' then
     ParValue := REntorno.PobEmpresa;
  if ParName = 'Empresa_Prov' then
     ParValue := REntorno.ProvEmpresa;
  if ParName = 'Empresa_Pais' then
     ParValue := REntorno.Pais;
  if ParName = 'FiltroCanal' then
     ParValue := RangoSelec;
  if ParName = 'TipoStock' then
     if (TipoStock = 0) then
        ParValue := _('Stock Real')
     else
        ParValue := _('Stock Virtual');

  if ParName = 'modelo' then
  begin
     with SPStockStock do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := FCanal;
        Params.ByName['MOD_DESDE'].AsString := SPStock.FieldByName('MODELO').AsString {modelo_Desde};
        Params.ByName['MOD_HASTA'].AsString := SPStock.FieldByName('MODELO').AsString {modelo_Hasta};
        Params.ByName['GRUPO_DESDE'].AsString := SPStock.FieldByName('GRUPO_TALLA').AsString {Grupo_Desde};
        Params.ByName['GRUPO_HASTA'].AsString := SPStock.FieldByName('GRUPO_TALLA').AsString {Grupo_Hasta};
        Params.ByName['TIPO_STOCK'].AsInteger := TipoStock;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['GRUPO_TALLA'].AsString := SPStock.FieldByName('GRUPO_TALLA').AsString;
        Params.ByName['MODELO'].AsString := SPStock.FieldByName('MODELO').AsString;
        Params.ByName['COLOR'].AsString := SPStock.FieldByName('COLOR').AsString;
        Params.ByName['FECHA'].AsDateTime := FechaCalculo;
        Open;
     end;

     if (SWTalla = 1) then
     begin
        for i := 0 to 15 do
           ATalla[i] := ' ';
        i := 0;
        repeat
           ATalla[i] := SPStockStock.FieldByName('TALLA').AsString;
           i := i + 1;
           SPStockStock.Next;
        until ((SPStockStock.EOF) or (i = 15));
     end;
  end;

  if ParName = 'color' then
  begin
     with SPStockStock do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := FCanal;
        Params.ByName['MOD_DESDE'].AsString := SPStock.FieldByName('MODELO').AsString {modelo_Desde};
        Params.ByName['MOD_HASTA'].AsString := SPStock.FieldByName('MODELO').AsString {modelo_Hasta};
        Params.ByName['GRUPO_DESDE'].AsString := SPStock.FieldByName('GRUPO_TALLA').AsString {Grupo_Desde};
        Params.ByName['GRUPO_HASTA'].AsString := SPStock.FieldByName('GRUPO_TALLA').AsString {Grupo_Hasta};
        Params.ByName['TIPO_STOCK'].AsInteger := TipoStock;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['GRUPO_TALLA'].AsString := SPStock.FieldByName('GRUPO_TALLA').AsString;
        Params.ByName['MODELO'].AsString := SPStock.FieldByName('MODELO').AsString;
        Params.ByName['COLOR'].AsString := SPStock.FieldByName('COLOR').AsString;
        Params.ByName['FECHA'].AsDateTime := FechaCalculo;
        Open;
     end;

     if (SWStock = 1) then
     begin
        for j := 0 to 15 do
           AStock[j] := 0;
        j := 0;
        repeat
           AStock[j] := SPStockStock.FieldByName('STOCK').AsFloat;
           j := j + 1;
           SPStockStock.Next;
        until ((SPStockStock.EOF) or (j = 15));
     end;
  end;

  if ParName = 'stock1' then
     ParValue := AStock[0];
  if ParName = 'stock2' then
     ParValue := AStock[1];
  if ParName = 'stock3' then
     ParValue := AStock[2];
  if ParName = 'stock4' then
     ParValue := AStock[3];
  if ParName = 'stock5' then
     ParValue := AStock[4];
  if ParName = 'stock6' then
     ParValue := AStock[5];
  if ParName = 'stock7' then
     ParValue := AStock[6];
  if ParName = 'stock8' then
     ParValue := AStock[7];
  if ParName = 'stock9' then
     ParValue := AStock[8];
  if ParName = 'stock10' then
     ParValue := AStock[9];
  if ParName = 'stock11' then
     ParValue := AStock[10];
  if ParName = 'stock12' then
     ParValue := AStock[11];
  if ParName = 'stock13' then
     ParValue := AStock[12];
  if ParName = 'stock14' then
     ParValue := AStock[13];
  if ParName = 'stock15' then
     ParValue := AStock[14];
  if ParName = 'stock16' then
     ParValue := AStock[15];

  if ParName = 'talla1' then
     ParValue := ATalla[0];
  if ParName = 'talla2' then
     ParValue := ATalla[1];
  if ParName = 'talla3' then
     ParValue := ATalla[2];
  if ParName = 'talla4' then
     ParValue := ATalla[3];
  if ParName = 'talla5' then
     ParValue := ATalla[4];
  if ParName = 'talla6' then
     ParValue := ATalla[5];
  if ParName = 'talla7' then
     ParValue := ATalla[6];
  if ParName = 'talla8' then
     ParValue := ATalla[7];
  if ParName = 'talla9' then
     ParValue := ATalla[8];
  if ParName = 'talla10' then
     ParValue := ATalla[9];
  if ParName = 'talla11' then
     ParValue := ATalla[10];
  if ParName = 'talla12' then
     ParValue := ATalla[11];
  if ParName = 'talla13' then
     ParValue := ATalla[12];
  if ParName = 'talla14' then
     ParValue := ATalla[13];
  if ParName = 'talla15' then
     ParValue := ATalla[14];
  if ParName = 'talla16' then
     ParValue := ATalla[15];
end;

procedure TDMLstStockResTallas.ActualizarRangoSelec(LCan: TStrings; Canal: smallint);
var
  i : integer;
begin
  if (LCan.Count = 0) then
     RangoSelec := Format(_('Canal: %s'), [IntToStr(Canal)])
  else
  begin
     RangoSelec := Format(_('Canal: %s'), [LCan[0]]);
     for i := 1 to (LCan.Count - 1) do
        RangoSelec := RangoSelec + ', ' + LCan[i];
  end;
end;

end.
