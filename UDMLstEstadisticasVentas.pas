unit UDMLstEstadisticasVentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Forms, SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBQuery, HYFIBQuery, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDataSet;

type
  TDMLstEstadisticasVentas = class(TDataModule)
     TLocal: THYTransaction;
     QDameFecha: THYFIBQuery;
     xLstAgentesArt: TFIBDataSetRO;
     DSxLstAgentesArt: TDataSource;
     frEstadisticasArt: TfrHYReport;
     frDBDSLstAgentesArt: TfrDBDataSet;
     xLstClientesArt: TFIBDataSetRO;
     DSxLstClientesArt: TDataSource;
     frDBDSLstClientesArt: TfrDBDataSet;
     xLstProvArt: TFIBDataSetRO;
     DSxLstProvArt: TDataSource;
     frDBDSLstProvArt: TfrDBDataSet;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frEstadisticasArtGetValue(const ParName: string; var ParValue: variant);
     procedure frEstadisticasArtBeforePrint(Memo: TStringList; View: TfrView);
  private
     { Private declarations }
     F_Desde, F_Hasta: TDateTime;
     Art_Desde, Art_Hasta, Coment: string;
     Fam_Desde, Fam_Hasta: string;
     AgCliPro_Desde, AgCliPro_Hasta: integer;
     Agente_Desde, Agente_Hasta: integer;
  public
     { Public declarations }
     function FechaEjercicio: TDateTime;
     procedure Muestra(Clase, Modo: smallint; Fecha1, Fecha2: TDateTime; ArticuloD, ArticuloH, FamiliaD, FamiliaH, Comentario: string; AgCliProD, AgCliProH, Alcance, Canal: integer; Serie: string; AgenteD: integer = 0; AgenteH: integer = 0; ProrratearPortes: boolean = False);
  end;

var
  DMLstEstadisticasVentas : TDMLstEstadisticasVentas;

implementation

uses UEntorno, UDMListados, UFormGest, UUtiles, UDMMain, Controls;

{$R *.dfm}

procedure TDMLstEstadisticasVentas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMlistados, DMListados);
end;

procedure TDMLstEstadisticasVentas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

function TDMLstEstadisticasVentas.FechaEjercicio: TDateTime;
var
  duracion : smallint;
  fecha : TDateTime;
begin
  with QDameFecha do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     duracion := FieldByName['DURACION'].AsInteger;
     fecha := FieldByName['APERTURA'].AsDateTime;

     if (duracion = 2) then
        Result := fecha
     else
        Result := EncodeDate(REntorno.Ejercicio, 01, 01);
  end;
end;

procedure TDMLstEstadisticasVentas.Muestra(Clase, Modo: smallint; Fecha1, Fecha2: TDateTime; ArticuloD, ArticuloH, FamiliaD, FamiliaH, Comentario: string; AgCliProD, AgCliProH, Alcance, Canal: integer; Serie: string; AgenteD: integer = 0; AgenteH: integer = 0; ProrratearPortes: boolean = False);
var
  Grupo : integer;
  Fichero : string;
begin
  F_Desde := Fecha1;
  F_Hasta := Fecha2;
  Art_Desde := ArticuloD;
  Art_Hasta := ArticuloH;
  Fam_Desde := FamiliaD;
  Fam_Hasta := FamiliaH;
  Coment := Comentario;
  AgCliPro_Desde := AgCliProD;
  AgCliPro_Hasta := AgCliProH;
  Agente_Desde := AgenteD;
  Agente_Hasta := AgenteH;

  DMListados.Normalizar_Desde_Hasta(Fecha1, Fecha2);
  DMListados.Normalizar_Desde_Hasta(ArticuloD, ArticuloH);
  DMListados.Normalizar_Desde_Hasta(Fam_Desde, Fam_Hasta);
  DMListados.Normalizar_Desde_Hasta(AgCliProD, AgCliProH);

  Grupo := 0;
  case Clase of
     0:
     begin
        // TSAgentes
        Agente_Desde := AgCliProD;
        Agente_Hasta := AgCliProH;

        with xLstAgentesArt do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Copy(Serie, 1, 10);
           Params.ByName['ARTICULO_D'].AsString := ArticuloD;
           Params.ByName['ARTICULO_H'].AsString := ArticuloH;
           Params.ByName['FAMILIA_D'].AsString := Fam_Desde;
           Params.ByName['FAMILIA_H'].AsString := Fam_Hasta;
           Params.ByName['AGENTE_D'].AsInteger := AgCliProD;
           Params.ByName['AGENTE_H'].AsInteger := AgCliProH;
           Params.ByName['FECHA_D'].AsDateTime := HourIntoDate(Fecha1, '00:00:00');
           Params.ByName['FECHA_H'].AsDateTime := HourIntoDate(Fecha2, '23:59:59');
           Params.ByName['ALCANCE'].AsInteger := Alcance;
           Params.ByName['CANALCAL'].AsInteger := REntorno.Canal;
           Open;
        end;
        Grupo := 152;
     end;
     1:
     begin
        // TSClientes
        with xLstClientesArt do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Copy(Serie, 1, 10);
           Params.ByName['ARTICULO_D'].AsString := ArticuloD;
           Params.ByName['ARTICULO_H'].AsString := ArticuloH;
           Params.ByName['FAMILIA_D'].AsString := Fam_Desde;
           Params.ByName['FAMILIA_H'].AsString := Fam_Hasta;
           Params.ByName['CLIENTE_D'].AsInteger := AgCliProD;
           Params.ByName['CLIENTE_H'].AsInteger := AgCliProH;
           Params.ByName['AGENTE_D'].AsInteger := AgenteD;
           Params.ByName['AGENTE_H'].AsInteger := AgenteH;
           Params.ByName['FECHA_D'].AsDateTime := HourIntoDate(Fecha1, '00:00:00');
           Params.ByName['FECHA_H'].AsDateTime := HourIntoDate(Fecha2, '23:59:59');
           Params.ByName['ALCANCE'].AsInteger := Alcance;
           Params.ByName['CANALCAL'].AsInteger := REntorno.Canal;
           Open;
        end;
        Grupo := 153;
     end;
     2:
     begin
        // Proveedores
        with xLstProvArt do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Copy(Serie, 1, 10);
           Params.ByName['ARTICULO_D'].AsString := ArticuloD;
           Params.ByName['ARTICULO_H'].AsString := ArticuloH;
           Params.ByName['FAMILIA_D'].AsString := Fam_Desde;
           Params.ByName['FAMILIA_H'].AsString := Fam_Hasta;
           Params.ByName['PROV_D'].AsInteger := AgCliProD;
           Params.ByName['PROV_H'].AsInteger := AgCliProH;
           Params.ByName['FECHA_D'].AsDateTime := HourIntoDate(Fecha1, '00:00:00');
           Params.ByName['FECHA_H'].AsDateTime := HourIntoDate(Fecha2, '23:59:59');
           Params.ByName['ALCANCE'].AsInteger := Alcance;
           Params.ByName['CANALCAL'].AsInteger := REntorno.Canal;
           Params.ByName['PRORRATEAR_PORTES'].AsInteger := BoolToInt(ProrratearPortes);
           Open;
        end;
        Grupo := 154;
     end;
  end;

  if (Modo = 2) then
  begin
     case Clase of
        0:
        begin
           Fichero := Format(_('EstadisticaAgente_%s.xls'), [FormatDateTime('yyyymmdd-hhnnss', Now)]);
           if MySaveDialog(Fichero, 'XLS,ODS', '', 'DMLstEstadisticasVentas-EstadisticaAgente') then
           begin
              Screen.Cursor := crHourGlass;
              try
                 ExportarExcel(Fichero, DSxLstAgentesArt, True, True);
              finally
                 Screen.Cursor := crDefault;
              end;
           end;
        end;
        1:
        begin
           Fichero := Format(_('EstadisticaCliente_%s.xls'), [FormatDateTime('yyyymmdd-hhnnss', Now)]);
           if MySaveDialog(Fichero, 'XLS,ODS', '', 'DMLstEstadisticasVentas-EstadisticaCliente') then
           begin
              Screen.Cursor := crHourGlass;
              try
                 ExportarExcel(Fichero, DSxLstClientesArt, True, True);
              finally
                 Screen.Cursor := crDefault;
              end;
           end;
        end;
        2:
        begin
           Fichero := Format(_('EstadisticaProveedor_%s.xls'), [FormatDateTime('yyyymmdd-hhnnss', Now)]);
           if MySaveDialog(Fichero, 'XLS,ODS', '', 'DMLstEstadisticasVentas-EstadisticaProveedor') then
           begin
              Screen.Cursor := crHourGlass;
              try
                 ExportarExcel(Fichero, DSxLstProvArt, True, True);
              finally
                 Screen.Cursor := crDefault;
              end;
           end;
        end;
     end;
  end
  else
     DMListados.Imprimir(Grupo, 0, Modo, '', '', frEstadisticasArt, nil, nil, nil);
end;

procedure TDMLstEstadisticasVentas.frEstadisticasArtGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'FechaListado' then
     ParValue := REntorno.FechaTrabSH;

  if ParName = 'AgenteDesde' then
     ParValue := Agente_Desde;

  if ParName = 'AgenteHasta' then
     ParValue := Agente_Hasta;

  if ParName = 'ProvDesde' then
     ParValue := AgCliPro_Desde;

  if ParName = 'ProvHasta' then
     ParValue := AgCliPro_Hasta;

  if ParName = 'ClienteDesde' then
     ParValue := AgCliPro_Desde;

  if ParName = 'ClienteHasta' then
     ParValue := AgCliPro_Hasta;

  if ParName = 'FechaDesde' then
     ParValue := F_Desde;

  if ParName = 'FechaHasta' then
     ParValue := F_Hasta;

  if ParName = 'ArticuloDesde' then
     ParValue := Art_Desde;

  if ParName = 'ArticuloHasta' then
     ParValue := Art_Hasta;

  if ParName = 'FamiliaDesde' then
     ParValue := Fam_Desde;

  if ParName = 'FamiliaHasta' then
     ParValue := Fam_Hasta;

  if ParName = 'Comentario' then
     ParValue := Coment;
end;

procedure TDMLstEstadisticasVentas.frEstadisticasArtBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

end.
