unit UProDMLstMatEsc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, FR_Class, DB, FIBDataSet,
  FIBDatabase, UFIBModificados, FIBDataSetRO, Fr_HYReport, FIBQuery,
  HYFIBQuery, StrUtils, FIBDataSetRW;

type
  TProDMLstMatEsc = class(TDataModule)
     QGenerarLst: TFIBDataSetRW;
     TLocal: THYTransaction;
     frDBlstNecesidades: TfrDBDataSet;
     frListadoN: TfrHYReport;
     QTemp: THYFIBQuery;
     QGenerarLstV_COMPONENTE: TFIBStringField;
     QGenerarLstV_COMPUESTO: TFIBStringField;
     QGenerarLstV_NUM_ESC: TIntegerField;
     QGenerarLstV_ENTRADA: TIntegerField;
     QGenerarLstV_TITULO_COMPUESTO: TFIBStringField;
     QGenerarLstV_TITULO_COMPONENTE: TFIBStringField;
     QGenerarLstV_UNIDAD: TFIBStringField;
     QGenerarLstV_UNDS_NEC: TFloatField;
     QGenerarLstV_UNDS_STOCK: TFloatField;
     QGenerarLstV_UNDS_FABRICAR: TFloatField;
     QGenerarLstV_ESCANDALLO: TIntegerField;
     QGenerarLstV_STOCK_ESC: TFloatField;
     QGenerarLstV_UNIDADES_ESC: TFloatField;
     QGenerarLstV_UNDS_COMPRAR: TFloatField;
     QGenerarLstV_LINEA_FASE: TIntegerField;
     QGenerarLstV_TITULO_FASE: TFIBStringField;
     QGenerarLstV_LINEA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoNGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     comentario: string;
     grupo: integer;
     PorDefecto: integer;
     function BuscaDesc(Tabla, campo: string): string;
     procedure MostrarListado(modo: integer; ComponenteDesde, ComponenteHasta, CompuestoDesde, CompuestoHasta: string);
     function Limites(filtro: string): string;
  end;

var
  ProDMLstMatEsc : TProDMLstMatEsc;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UProFMLstMatEsc;

{$R *.dfm}

procedure TProDMLstMatEsc.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TProDMLstMatEsc.MostrarListado(modo: integer; ComponenteDesde, ComponenteHasta, CompuestoDesde, CompuestoHasta: string);
var
  str : string;
begin
  // Ejecuto el procedure y lleno la tabla tmp_lst_necesidades
  with QGenerarLst do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['COMPONENTE_DESDE'].AsString := ComponenteDesde;
     Params.ByName['COMPONENTE_HASTA'].AsString := ComponenteHasta;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['TIPO'].AsString := 'EPR';
     Params.ByName['COMPUESTO_DESDE'].AsString := CompuestoDesde;
     Params.ByName['COMPUESTO_HASTA'].AsString := CompuestoHasta;
     Params.ByName['POR_DEFECTO'].AsInteger := PorDefecto;
     Open;
  end;

  DMListados.Imprimir(grupo, modo, '', str, frListadoN, nil);
end;

function TProDMLstMatEsc.Limites(filtro: string): string;
begin
  if (filtro = 'DESDE') then
  begin
     with QTemp do
     begin
        SQL.Clear;
        SQL.Add('Select first(1) compuesto from pro_escandallo where empresa=?empresa and tipo=?tipo order by escandallo asc');
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Tipo'].AsString := 'EPR';
        ExecQuery;
     end;
     Result := QTemp.FieldByName['compuesto'].AsString;
  end;

  if (filtro = 'HASTA') then
  begin
     with QTemp do
     begin
        SQL.Clear;
        SQL.Add('Select first(1) compuesto from pro_escandallo where empresa=?empresa and tipo=?tipo order by escandallo desc');
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Tipo'].AsString := 'EPR';
        ExecQuery;
     end;

     Result := QTemp.FieldByName['compuesto'].AsString;
  end;
end;

function TProDMLstMatEsc.BuscaDesc(Tabla, campo: string): string;
begin
  if (Tabla = 'VER_ARTICULOS_CUENTAS') then
  begin
     with QTemp do
     begin
        SQL.Clear;
        SQL.Add('Select TITULO from VER_ARTICULOS_CUENTAS where ARTICULO=?ARTICULO and EMPRESA=?EMPRESA');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := campo;
        ExecQuery;
     end;
     Result := QTemp.FieldByName['titulo'].AsString;
  end;

  if (Tabla = 'ART_ARTICULOS') then
  begin
     with QTemp do
     begin
        SQL.Clear;
        SQL.Add('Select titulo from art_articulos where articulo=?articulo and empresa=?empresa');
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Articulo'].AsString := campo;
        ExecQuery;
     end;
     Result := QTemp.FieldByName['Titulo'].AsString;
  end;
end;

procedure TProDMLstMatEsc.frListadoNGetValue(const ParName: string; var ParValue: variant);
begin
  if (ParName = 'Empresa') then
  begin
     with QTemp do
     begin
        SQL.Clear;
        SQL.Add('select titulo from sys_empresas where empresa=?empresa');
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        ExecQuery;
     end;
     ParValue := QTemp.FieldByName['titulo'].AsString;
  end;

  if Trim(ParName) = 'Comentario' then
     ParValue := ProFMLstMatEsc.EComentario.Text;
  if Trim(ParName) = 'FechaListado' then
     ParValue := ProFMLstMatEsc.TDPFechaListado.Date;
end;

end.
