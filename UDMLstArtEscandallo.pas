unit UDMLstArtEscandallo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FR_Class, FR_DSet, FR_DBSet,
  Fr_HYReport, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLstArtEscandallo = class(TDataModule)
     QMArticulos: TFIBDataSetRO;
     DSQMArticulos: TDataSource;
     xDetalle: TFIBDataSetRO;
     DSxDetalle: TDataSource;
     frDBQMArticulos: TfrDBDataSet;
     frDBxDetalle: TfrDBDataSet;
     frEscandallo: TfrHYReport;
     TLocal: THYTransaction;
     xDetalleEMPRESA: TIntegerField;
     xDetalleARTICULO: TFIBStringField;
     xDetalleDETALLE: TFIBStringField;
     xDetalleTITULO: TFIBStringField;
     xDetalleP_COSTE: TFloatField;
     xDetalleCANTIDAD: TFloatField;
     xDetalleFAMILIA: TFIBStringField;
     xDetalleUNIDADES: TFIBStringField;
     frxEscandallo: TfrxHYReport;
     procedure DMLstArtEscandalloDestroy(Sender: TObject);
     procedure frEscandalloEnterRect(Memo: TStringList; View: TfrView);
     procedure frEscandalloGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstArtEscandalloCreate(Sender: TObject);
     procedure frxEscandalloBeforePrint(Sender: TfrxReportComponent);
     procedure frxEscandalloGetValue(const VarName: string; var Value: variant);
  private
     SW: integer;
  public
     { Public declarations }
     procedure MostrarListadoFiltrado(Modo: byte);
     procedure MostrarListado(Desde: string; Hasta: string; Modo: integer);
     procedure AsignaSQL(SQL: TStrings);
  end;

var
  DMLstArtEscandallo : TDMLstArtEscandallo;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UFormGest, UDMListados, UDameDato;

procedure TDMLstArtEscandallo.DMLstArtEscandalloCreate(Sender: TObject);
begin
  // Abrir la transacción
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);

  with QMArticulos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_ARTICULOS_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' ARTICULO >= :ARTICULO_DESDE AND ');
     SelectSQL.Add(' ARTICULO <= :ARTICULO_HASTA ');
     SelectSQL.Add(' ORDER BY ARTICULO ');
  end;
end;

procedure TDMLstArtEscandallo.DMLstArtEscandalloDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstArtEscandallo.MostrarListadoFiltrado(Modo: byte);
var
  Grupo : integer;
  i : integer;
begin
  with QMArticulos do
  begin
     Close;
     for i := 0 to Params.Count - 1 do
     begin
        if Params[i].Name = 'EMPRESA' then
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        if Params[i].Name = 'EJERCICIO' then
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        if Params[i].Name = 'CANAL' then
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     end;
     Open;
  end;

  with xDetalle do
  begin
     Close;
     Open;
  end;

  SW := 1;
  Grupo := 35;
  DMListados.Imprimir(Grupo, 0, Modo, '', '', frEscandallo, frxEscandallo, nil, nil);
end;

procedure TDMLstArtEscandallo.MostrarListado(Desde, Hasta: string; Modo: integer);
var
  Grupo : integer;
begin
  DMListados.Normalizar_Desde_Hasta(Desde, Hasta);

  with QMArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO_DESDE'].AsString := Desde;
     Params.ByName['ARTICULO_HASTA'].AsString := Hasta;
     Open;
  end;

  with xDetalle do
  begin
     Close;
     Open;
  end;

  SW := 1;

  Grupo := 35;
  DMListados.Imprimir(Grupo, 0, Modo, '', '', frEscandallo, frxEscandallo, nil, nil);
end;

procedure TDMLstArtEscandallo.frEscandalloEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Memo[0] = 'PRECIO ARTÍCULO:') then
        SW := 1; // Para inicializar el pijama cuando empieza otro artículo
  end;
end;

procedure TDMLstArtEscandallo.frEscandalloGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'CodBarraArticulo' then
     ParValue := DameCodigoBarras(xDetalleARTICULO.AsString);
  if ParName = 'CodBarraDetalle' then
     ParValue := DameCodigoBarras(xDetalleDETALLE.AsString);
end;

procedure TDMLstArtEscandallo.frxEscandalloBeforePrint(Sender: TfrxReportComponent);
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
           if Pos('PRECIO ARTÍCULO:', Memo[0]) > 0 then
           begin
              SW := 1;
           end;
        end;
end;

procedure TDMLstArtEscandallo.frxEscandalloGetValue(const VarName: string; var Value: variant);
begin
  frEscandalloGetValue(VarName, Value);
end;

procedure TDMLstArtEscandallo.AsignaSQL(SQL: TStrings);
begin
  with QMArticulos do
  begin
     Close;
     SelectSQL.Assign(SQL);
  end;
end;

end.
