unit UDMLstUbicacionesC;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport,
  DB, FR_DSet, FR_DBSet, FIBDataSetRO, FIBDataSet, frxClass, frxHYReport;

type
  TDMLstUbicacionesC = class(TDataModule)
     TLocal: THYTransaction;
     frUbicaciones: TfrHYReport;
     xListado: TFIBDataSetRO;
     frDBxListado: TfrDBDataSet;
     DSxListado: TDataSource;
     xListadoEMPRESA: TIntegerField;
     xListadoEJERCICIO: TIntegerField;
     xListadoCANAL: TIntegerField;
     xListadoSERIE: TFIBStringField;
     xListadoTIPO: TFIBStringField;
     xListadoRIG: TIntegerField;
     xListadoTERCERO: TIntegerField;
     xListadoPROVEEDOR: TIntegerField;
     xListadoLINEA: TIntegerField;
     xListadoARTICULO: TFIBStringField;
     xListadoTITULO: TFIBStringField;
     xListadoUNIDADESLINEA: TFloatField;
     xListadoLINEA_UBICACION: TIntegerField;
     xListadoUBICACION: TFIBStringField;
     xListadoUNIDADES: TFloatField;
     xListadoPESO: TFloatField;
     xListadoVOLUMEN: TFloatField;
     xListadoDIAMETRO: TFloatField;
     xListadoGENERAL: TIntegerField;
     xListadoTITULO1: TFIBStringField;
     xListadoNOMBRE_R_SOCIAL: TFIBStringField;
     frxUbicaciones: TfrxHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frUbicacionesGetValue(const ParName: string; var ParValue: variant);
     procedure frUbicacionesEnterRect(Memo: TStringList; View: TfrView);
     procedure frxUbicacionesBeforePrint(Sender: TfrxReportComponent);
     procedure frxUbicacionesGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     function DameSentenciaSQL(Tipo: string): string;
  public
     { Public declarations }
     procedure MostrarListadoUbicaciones(id_e: integer; TIPO: string; Modo: byte);
     procedure ConfiguraListado(Tipo: string);
  end;

var
  DMLstUbicacionesC : TDMLstUbicacionesC;

implementation

uses UDMMain, UDMListados, UFormGest, UEntorno;

{$R *.dfm}

procedure TDMLstUbicacionesC.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstUbicacionesC.MostrarListadoUbicaciones(id_e: integer; TIPO: string; Modo: byte);
var
  str : string;
begin
  if (tipo <> '') then
     with xListado do
     begin
        Close;
        SelectSQL.Text := DameSentenciaSQL(Tipo);
        Params.ByName['ID_E'].AsInteger := id_e;
        Open;
     end;

  DMListados.Cargar(192, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frUbicaciones.LoadFromFIB(REntorno.Formato, str);
     frUbicaciones.PrepareReport;
     case Modo of
        0: frUbicaciones.ShowPreparedReport;
        1: frUbicaciones.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxUbicaciones.LoadFromFIB(REntorno.Formato, str);
     frxUbicaciones.PrepareReport;
     case Modo of
        0: frxUbicaciones.ShowPreparedReport;
        1: frxUbicaciones.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

function TDMLstUbicacionesC.DameSentenciaSQL(Tipo: string): string;
begin
  if (Tipo = 'ALP') then
     Result := 'select cab.empresa,cab.ejercicio,cab.canal,cab.serie,cab.tipo,cab.rig,' +
        ' cab.tercero,cab.proveedor,det.linea,det.articulo,det.titulo,det.unidades as unidadeslinea,ub.linea_ubicacion,ub.ubicacion,ub.unidades,' +
        ' ub.peso,ub.volumen,ub.diametro,ub.general,alm.titulo,ter.nombre_r_social' +
        ' from ges_cabeceras_e_alb cab' +
        ' join sys_terceros ter' +
        ' on (cab.tercero = ter.tercero)' +
        ' join ges_detalles_e det' +
        ' on (cab.id_e = det.id_e)' +
        ' join ges_detalles_e_ubicaciones ub' +
        ' on (det.id_detalles_e = ub.id_detalles_e)' +
        ' join art_almacenes_ubicaciones alm' +
        ' on ub.id_ubicacion = alm.id_ubicacion' +
        ' where cab.id_e = ?id_e' +
        ' order by cab.empresa,cab.ejercicio,cab.canal,cab.serie,cab.tipo,cab.rig,det.linea,ub.linea_ubicacion';
  if (Tipo = 'FAP') then
     Result := 'select cab.empresa,cab.ejercicio,cab.canal,cab.serie,cab.tipo,cab.rig,' +
        ' cab.tercero,cab.proveedor,det.linea,det.articulo,det.titulo,det.unidades as unidadeslinea,ub.linea_ubicacion,ub.ubicacion,ub.unidades,' +
        ' ub.peso,ub.volumen,ub.diametro,ub.general,alm.titulo,ter.nombre_r_social' +
        ' from ges_cabeceras_e_fac cab' +
        ' join sys_terceros ter' +
        ' on (cab.tercero = ter.tercero)' +
        ' join ges_detalles_e det' +
        ' on (cab.id_e = det.id_e)' +
        ' join ges_detalles_e_ubicaciones ub' +
        ' on (det.id_detalles_e = ub.id_detalles_e)' +
        ' join art_almacenes_ubicaciones alm' +
        ' on ub.id_ubicacion = alm.id_ubicacion' +
        ' where cab.id_e = ?id_e' +
        ' order by cab.empresa,cab.ejercicio,cab.canal,cab.serie,cab.tipo,cab.rig,det.linea,ub.linea_ubicacion';
end;

procedure TDMLstUbicacionesC.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstUbicacionesC.frUbicacionesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'TIPODOCUMENTO') then
     if (xListado.FieldByName('TIPO').AsString = 'ALP') then
        ParValue := 'Albarán de Proveedor : '
     else
        ParValue := 'Factura de Proveedor : ';
end;

procedure TDMLstUbicacionesC.frUbicacionesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstUbicacionesC.ConfiguraListado(Tipo: string);
begin
  with xListado do
  begin
     Close;
     SelectSQL.Text := DameSentenciaSQL(Tipo);
  end;
end;

procedure TDMLstUbicacionesC.frxUbicacionesBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMLstUbicacionesC.frxUbicacionesGetValue(const VarName: string; var Value: variant);
begin
  frUbicacionesGetValue(VarName, Value);
end;

end.
