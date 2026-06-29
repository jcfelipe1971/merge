unit UDMLstAlbPdte;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, DB, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FIBDataSet, FR_DSet, FR_Class, Fr_HYReport, FR_DBSet,
  frxClass, frxHYReport;

type
  TDMLstAlbPdte = class(TDataModule)
     DSListado: TDataSource;
     QMListado: TFIBDataSetRO;
     TLocal: THYTransaction;
     frAlbPdte: TfrHYReport;
     FrDBAlbPdte: TfrDBDataSet;
     frxAlbPdte: TfrxHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frAlbPdteGetValue(const ParName: string; var ParValue: variant);
     procedure frAlbPdteBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxAlbPdteBeforePrint(Sender: TfrxReportComponent);
     procedure frxAlbPdteGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     TipoFiltro, DesdeC, HastaC, Servido: integer;
     DescOrden: string;
     DesdeF, HastaF: TDateTime;
  public
     { Public declarations }
     procedure MostrarListado(Modo: integer; min_fecha, max_fecha: TDateTime; min_cliente, max_cliente: integer; TipoServido, ATipoFiltro: integer; ordenado: string; FechaListado: TDateTime; Comentario: string; aDescOrden: string);
     procedure CrearSQL(AgrupadoPorModelo: boolean; SentenciaWhere: string; Orden: integer);
  end;

var
  DMLstAlbPdte : TDMLstAlbPdte;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, StdCtrls, UFPregAlbPdte, DateUtils;

{$R *.dfm}

procedure TDMLstAlbPdte.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstAlbPdte.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstAlbPdte.MostrarListado(Modo: integer; min_fecha, max_fecha: TDateTime; min_cliente, max_cliente: integer; TipoServido, ATipoFiltro: integer; ordenado: string; FechaListado: TDateTime; Comentario: string; aDescOrden: string);
begin
  TipoFiltro := ATipoFiltro;
  DMListados.Normalizar_Desde_Hasta(min_cliente, max_cliente);
  DesdeC := min_cliente;
  HastaC := max_cliente;
  DescOrden := aDescOrden;
  DesdeF := min_fecha;
  HastaF := max_fecha;
  Servido := TipoServido;
  DMListados.Normalizar_Desde_Hasta(min_fecha, max_fecha);
  min_fecha := RecodeTime(min_fecha, 0, 0, 0, 0);
  max_fecha := RecodeTime(max_fecha, 23, 59, 59, 999);

  DMListados.DatosInforme(FechaListado, Comentario);

  with QMListado do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['TIPO_FILTRO'].AsInteger := TipoFiltro;
     Params.ByName['FECHAD'].AsDateTime := min_fecha;
     Params.ByName['FECHAH'].AsDateTime := max_fecha;
     Params.ByName['FAMILIAD'].AsString := ''; // No se utiliza
     Params.ByName['FAMILIAH'].AsString := ''; // No se utiliza
     Params.ByName['CLIENTED'].AsInteger := min_cliente;
     Params.ByName['CLIENTEH'].AsInteger := max_cliente;
     Params.ByName['ARTICULOD'].AsString := ''; // No se utiliza
     Params.ByName['ARTICULOH'].AsString := ''; // No se utiliza
     Params.ByName['SERVIDO'].AsInteger := TipoServido;
     Params.ByName['AGENTED'].AsInteger := 0; // No se utiliza
     Params.ByName['AGENTEH'].AsInteger := 0;  // No se utiliza
     Open;
  end;

  DMListados.Imprimir(5109, 0, Modo, '', _('Listado de Albaranes de Venta Pendientes'), frAlbPdte, frxAlbPdte, nil, nil);
end;

procedure TDMLstAlbPdte.frAlbPdteGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if Trim(ParName) = 'Orden' then
     ParValue := DescOrden;

  if Trim(ParName) = 'Estado' then
  begin
     if (Servido = 0) then // PDTE. SERVIDOS
        ParValue := _('Pdte. de Facturar');
     if (Servido = 1) then // SERVIDOS
        ParValue := _('Facturados');
     if (Servido = 10) then // TODOS
        ParValue := _('Todos');
  end;

  if (TipoFiltro = 1) then // Por Cliente
  begin
     if Trim(ParName) = 'TFiltro' then
        ParValue := Format(_('Desde Cliente: %d Hasta Cliente: %d Desde Fecha: %s Hasta Fecha: %s'), [DesdeC, HastaC, DateToStr(DesdeF), DateToStr(HastaF)]);
  end;
end;

procedure TDMLstAlbPdte.frAlbPdteBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstAlbPdte.frxAlbPdteBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstAlbPdte.frxAlbPdteGetValue(const VarName: string; var Value: variant);
begin
  frAlbPdteGetValue(VarName, Value);
end;

procedure TDMLstAlbPdte.CrearSQL(AgrupadoPorModelo: boolean; SentenciaWhere: string; Orden: integer);
begin
  QMListado.Close;
  with QMListado.SelectSQL do
  begin
     Clear;
     // Elijo el procedimiento segun se agrupe o no por Modelo de Tallas y Colores
     if (AgrupadoPorModelo) then
        Add(' SELECT * FROM LST_ALBARANES_PDTE_SERVIR_TYC ')
     else
        Add(' SELECT * FROM LST_ALBARANES_PDTE_SERVIR ');

     // Parametros son iguales en los dos procedimientos
     Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO_FILTRO, ?FECHAD, ');
     Add(' ?FECHAH, ?FAMILIAD, ?FAMILIAH, ?CLIENTED, ?CLIENTEH, ?ARTICULOD, ');
     Add(' ?ARTICULOH, ?SERVIDO, ?AGENTED, ?AGENTEH) ');

     // Agrego Filtro
     Add(' WHERE V_SERIE IN ' + SentenciaWhere);

     case Orden of
        0: // Orden por cliente y num. Albarán
           Add(' ORDER BY V_CODCLIENTE, V_RIGALB ');
        1: // Orden por fecha de Albarán
           Add(' ORDER BY V_FECHAALB ');
        2: // Orden por número de albarán
           Add(' ORDER BY V_RIGALB ');
     end;
  end;
end;

end.
