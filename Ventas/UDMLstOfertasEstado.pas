unit UDMLstOfertasEstado;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, FR_DSet, FR_DBSet, DB,
  FIBDataSet, FIBDataSetRO, FR_Class, Fr_HYReport, FIBDatabase,
  UFIBModificados;

type
  TDMLstOfertasEstado = class(TDataModule)
     TLocal: THYTransaction;
     frOfertas: TfrHYReport;
     xLstOfertas: TFIBDataSetRO;
     DSxLstOfertas: TDataSource;
     frDBLstOfertas: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frOfertasGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     SerieD: string;
     SerieH: string;
     OfertaD: string;
     OfertaH: string;
     AgrD: string;
     AgrH: string;
     Servido: integer;
     Grupo: integer;
  public
     { Public declarations }
     procedure RecargaOfertas(var MinSerie, MaxSerie, MinAgrup, MaxAgrup: string);
     procedure MostrarListado(Modo: word; aSerieD, aSerieH, aAgrD, aAgrH: string; Tipo: integer; min_fecha, max_fecha: TDateTime);
  end;

var
  DMLstOfertasEstado : TDMLstOfertasEstado;

implementation

uses UDMMain, UDMListados, UEntorno, UUtiles, UFormGest;

{$R *.dfm}

procedure TDMLstOfertasEstado.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  Grupo := 638;
end;

procedure TDMLstOfertasEstado.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstOfertasEstado.RecargaOfertas(var MinSerie, MaxSerie, MinAgrup, MaxAgrup: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(SERIE), MAX(SERIE) ');
        SQL.Add(' FROM VER_CANALES_SERIES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        MinSerie := FieldByName['MIN'].AsString;
        MaxSerie := FieldByName['MAX'].AsString;
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
        SQL.Add(' SELECT MIN(AGRUPACION), MAX(AGRUPACION) ');
        SQL.Add(' FROM SYS_AGRUPACIONES ');
        SQL.Add(' WHERE ');
        SQL.Add(' TIPO = ''C'' ');
        ExecQuery;
        MinAgrup := FieldByName['MIN'].AsString;
        MaxAgrup := FieldByName['MAX'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstOfertasEstado.MostrarListado(Modo: word; aSerieD, aSerieH, aAgrD, aAgrH: string; Tipo: integer; min_fecha, max_fecha: TDateTime);
begin
  SerieD := aSerieD;
  SerieH := aSerieH;
  AgrD := aAgrD;
  AgrH := aAgrH;
  Servido := Tipo;
  min_fecha := HourIntoDate(Min_fecha, '00:00:00');
  max_fecha := HourIntoDate(Max_fecha, '23:59:59');

  with xLstOfertas do
  begin
     Close;

     Params.ByName['Estado1'].AsInteger := -1;
     Params.ByName['Estado2'].AsInteger := -1;
     Params.ByName['Estado3'].AsInteger := -1;

     if Tipo = -1 then
     begin
        Params.ByName['Estado1'].AsInteger := 0;
        Params.ByName['Estado2'].AsInteger := 2;
        Params.ByName['Estado3'].AsInteger := 5;
     end;

     Params.ByName['Estado'].AsInteger := Tipo;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE_DESDE'].AsString := SerieD;
     Params.ByName['SERIE_HASTA'].AsString := SerieH;
     Params.ByName['AGR_DESDE'].AsString := AgrD;
     Params.ByName['AGR_HASTA'].AsString := AgrH;
     Params.ByName['FECHA_DESDE'].AsDateTime := min_fecha;
     Params.ByName['FECHA_HASTA'].AsDateTime := max_fecha;

     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frOfertas, nil, nil);
end;

procedure TDMLstOfertasEstado.frOfertasGetValue(const ParName: string; var ParValue: variant);
begin
  begin
     DMListados.GetValue(ParName, ParValue);

     if ParName = 'SerieD' then
        ParValue := SerieD;
     if ParName = 'SerieH' then
        ParValue := SerieH;
     if ParName = 'OfertaD' then
        ParValue := OfertaD;
     if ParName = 'OfertaH' then
        ParValue := OfertaH;
     if ParName = 'AgrD' then
        ParValue := AgrD;
     if ParName = 'AgrH' then
        ParValue := AgrH;
     if (Servido = 0) then //PDTE. ACEPTAR
        if Trim(ParName) = 'Estado' then
           ParValue := _('Pendientes de Aceptar');
     if (Servido = 5) then //ACEPTADAS
        if Trim(ParName) = 'Estado' then
           ParValue := _('Aceptadas');
     if (Servido = 2) then //ANULADAS
        if Trim(ParName) = 'Estado' then
           ParValue := _('Anuladas');
     if (Servido = 9) then //TODOS
        if Trim(ParName) = 'Estado' then
           ParValue := _('Todas');
  end;
end;

end.
