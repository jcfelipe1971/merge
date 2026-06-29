unit UDMControlPlazas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMControlPlazas = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMEstructuraGolo: TFIBTableSet;
     QMPlazasGolo: TFIBTableSet;
     DSQMEstructuraGolo: TDataSource;
     DSQMPlazasGolo: TDataSource;
     QMEstructuraGoloEMPRESA: TIntegerField;
     QMEstructuraGoloCANAL: TIntegerField;
     QMEstructuraGoloALMACEN: TFIBStringField;
     QMEstructuraGoloID_FAMILIA: TIntegerField;
     QMEstructuraGoloFAMILIA: TFIBStringField;
     QMEstructuraGoloDIA_SEMANA: TIntegerField;
     QMEstructuraGoloHORA: TFIBStringField;
     QMEstructuraGoloACTIVO: TIntegerField;
     QMPlazasGoloEMPRESA: TIntegerField;
     QMPlazasGoloCANAL: TIntegerField;
     QMPlazasGoloALMACEN: TFIBStringField;
     QMPlazasGoloID_FAMILIA: TIntegerField;
     QMPlazasGoloFECHA_HORA: TFIBStringField;
     QMPlazasGoloPLAZAS: TFloatField;
     QMPlazasGoloPLAZAS_MAXIMAS: TFloatField;
     QMPlazasGoloID: TIntegerField;
     QMPlazasGoloMENSAJE: TFIBStringField;
     QMPlazasGoloACTIVO: TIntegerField;
     QMEstructuraCat: TFIBTableSet;
     QMPlazasCat: TFIBTableSet;
     DSQMEstructuraCat: TDataSource;
     DSQMPlazasCat: TDataSource;
     QMEstructuraEsc: TFIBTableSet;
     QMPlazasEsc: TFIBTableSet;
     DSQMEstructuraEsc: TDataSource;
     DSQMPlazasEsc: TDataSource;
     QMEstructuraCatEMPRESA: TIntegerField;
     QMEstructuraCatCANAL: TIntegerField;
     QMEstructuraCatALMACEN: TFIBStringField;
     QMEstructuraCatID_FAMILIA: TIntegerField;
     QMEstructuraCatFAMILIA: TFIBStringField;
     QMEstructuraCatDIA_SEMANA: TIntegerField;
     QMEstructuraCatHORA: TFIBStringField;
     QMEstructuraCatACTIVO: TIntegerField;
     QMPlazasCatEMPRESA: TIntegerField;
     QMPlazasCatCANAL: TIntegerField;
     QMPlazasCatALMACEN: TFIBStringField;
     QMPlazasCatID_FAMILIA: TIntegerField;
     QMPlazasCatFECHA_HORA: TFIBStringField;
     QMPlazasCatPLAZAS: TFloatField;
     QMPlazasCatPLAZAS_MAXIMAS: TFloatField;
     QMPlazasCatID: TIntegerField;
     QMPlazasCatMENSAJE: TFIBStringField;
     QMPlazasCatACTIVO: TIntegerField;
     QMPlazasCatACTIVO_WEB: TIntegerField;
     QMEstructuraEscEMPRESA: TIntegerField;
     QMEstructuraEscCANAL: TIntegerField;
     QMEstructuraEscALMACEN: TFIBStringField;
     QMEstructuraEscID_FAMILIA: TIntegerField;
     QMEstructuraEscFAMILIA: TFIBStringField;
     QMEstructuraEscDIA_SEMANA: TIntegerField;
     QMEstructuraEscHORA: TFIBStringField;
     QMEstructuraEscACTIVO: TIntegerField;
     QMPlazasEscEMPRESA: TIntegerField;
     QMPlazasEscCANAL: TIntegerField;
     QMPlazasEscALMACEN: TFIBStringField;
     QMPlazasEscID_FAMILIA: TIntegerField;
     QMPlazasEscFECHA_HORA: TFIBStringField;
     QMPlazasEscPLAZAS: TFloatField;
     QMPlazasEscPLAZAS_MAXIMAS: TFloatField;
     QMPlazasEscID: TIntegerField;
     QMPlazasEscMENSAJE: TFIBStringField;
     QMPlazasEscACTIVO: TIntegerField;
     QMPlazasEscACTIVO_WEB: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_01: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_02: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_03: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_04: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_05: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_06: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_07: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_08: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_09: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_10: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_11: TIntegerField;
     QMEstructuraGoloACTIVO_WEB_12: TIntegerField;
     QMEstructuraCatACTIVO_WEB_01: TIntegerField;
     QMEstructuraCatACTIVO_WEB_02: TIntegerField;
     QMEstructuraCatACTIVO_WEB_03: TIntegerField;
     QMEstructuraCatACTIVO_WEB_04: TIntegerField;
     QMEstructuraCatACTIVO_WEB_05: TIntegerField;
     QMEstructuraCatACTIVO_WEB_06: TIntegerField;
     QMEstructuraCatACTIVO_WEB_07: TIntegerField;
     QMEstructuraCatACTIVO_WEB_08: TIntegerField;
     QMEstructuraCatACTIVO_WEB_09: TIntegerField;
     QMEstructuraCatACTIVO_WEB_10: TIntegerField;
     QMEstructuraCatACTIVO_WEB_11: TIntegerField;
     QMEstructuraCatACTIVO_WEB_12: TIntegerField;
     QMEstructuraEscACTIVO_WEB_01: TIntegerField;
     QMEstructuraEscACTIVO_WEB_02: TIntegerField;
     QMEstructuraEscACTIVO_WEB_03: TIntegerField;
     QMEstructuraEscACTIVO_WEB_04: TIntegerField;
     QMEstructuraEscACTIVO_WEB_05: TIntegerField;
     QMEstructuraEscACTIVO_WEB_06: TIntegerField;
     QMEstructuraEscACTIVO_WEB_07: TIntegerField;
     QMEstructuraEscACTIVO_WEB_08: TIntegerField;
     QMEstructuraEscACTIVO_WEB_09: TIntegerField;
     QMEstructuraEscACTIVO_WEB_10: TIntegerField;
     QMEstructuraEscACTIVO_WEB_11: TIntegerField;
     QMEstructuraEscACTIVO_WEB_12: TIntegerField;
     QMPlazasGoloACTIVO_WEB: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_01: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_02: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_03: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_04: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_05: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_06: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_07: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_08: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_09: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_10: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_11: TIntegerField;
     QMEstructuraGoloVISIBLE_WEB_12: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_01: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_02: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_03: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_04: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_05: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_06: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_07: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_08: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_09: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_10: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_11: TIntegerField;
     QMEstructuraCatVISIBLE_WEB_12: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_01: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_02: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_03: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_04: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_05: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_06: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_07: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_08: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_09: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_10: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_11: TIntegerField;
     QMEstructuraEscVISIBLE_WEB_12: TIntegerField;
     QMPlazasGoloVISIBLE_WEB: TIntegerField;
     QMPlazasCatVISIBLE_WEB: TIntegerField;
     QMPlazasEscVISIBLE_WEB: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMEstructuraHORAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMEstructuraHORASetText(Sender: TField; const Text: string);
     procedure QMPlazasFECHA_HORAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPlazasFECHA_HORASetText(Sender: TField; const Text: string);
     procedure QMEstructuraNewRecord(DataSet: TDataSet);
     procedure QMPlazasNewRecord(DataSet: TDataSet);
     procedure QMPlazasBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     id_fam_golo, id_fam_cat, id_fam_esc: integer;
     plazas_fam_golo, plazas_fam_cat, plazas_fam_esc: double;
     DiaSemana: integer;
     Fecha: TDateTime;
     function DameIdFamilia(Familia: string): integer;
     function DamePlazasMaximasFamilia(Familia: string): double;
  public
     { Public declarations }
     procedure SetDiaSemana(aDiaSemana: integer);
     procedure SetFecha(aFecha: TDateTime);
  end;

var
  DMControlPlazas : TDMControlPlazas;

implementation

uses UDMMain, UEntorno, HYFIBQuery, DateUtils;

{$R *.dfm}

function TDMControlPlazas.DameIdFamilia(Familia: string): integer;
var
  Q : THYFIBQuery;
begin
  Result := 0;
  if (Trim(Familia) > '') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_FAMILIA FROM ART_FAMILIAS WHERE EMPRESA = ' +
           REntorno.EmpresaStr + ' AND FAMILIA = ''' + Familia + '''';
        ExecQuery;
        Result := FieldByName['ID_FAMILIA'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

function TDMControlPlazas.DamePlazasMaximasFamilia(Familia: string): double;
var
  Q : THYFIBQuery;
begin
  Result := 0;
  if (Trim(Familia) > '') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PLAZAS_MAXIMAS FROM ART_FAMILIAS WHERE EMPRESA = ' +
           REntorno.EmpresaStr + ' AND FAMILIA = ''' + Familia + '''';
        ExecQuery;
        Result := FieldByName['PLAZAS_MAXIMAS'].AsFloat;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

procedure TDMControlPlazas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  id_fam_golo := DameIdFamilia('GOLO');
  id_fam_cat := DameIdFamilia('CAT');
  id_fam_esc := DameIdFamilia('ESC');
  plazas_fam_golo := DamePlazasMaximasFamilia('GOLO');
  plazas_fam_cat := DamePlazasMaximasFamilia('CAT');
  plazas_fam_esc := DamePlazasMaximasFamilia('ESC');
  Fecha := Now;
  // DiaSemana (Delphi) 1 Lunes - 7 Domingo
  DiaSemana := DayOfTheWeek(Fecha);
  // DiaSemana (FB) 0 Domingo, 1 Lunes, ... 6 Sabado
  if (DiaSemana = 7) then
     DiaSemana := 0;
end;

procedure TDMControlPlazas.SetDiaSemana(aDiaSemana: integer);
begin
  // DiaSemana (FB) 0 Domingo, 1 Lunes, ... 6 Sabado
  DiaSemana := aDiaSemana;
  if (DiaSemana = 7) then
     DiaSemana := 0;

  with QMEstructuraGolo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
     Params.ByName['ID_FAMILIA'].AsInteger := id_fam_golo;
     Params.ByName['DIA_SEMANA'].AsInteger := DiaSemana;
     Open;
  end;
  with QMEstructuraCat do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
     Params.ByName['ID_FAMILIA'].AsInteger := id_fam_cat;
     Params.ByName['DIA_SEMANA'].AsInteger := DiaSemana;
     Open;
  end;
  with QMEstructuraEsc do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
     Params.ByName['ID_FAMILIA'].AsInteger := id_fam_esc;
     Params.ByName['DIA_SEMANA'].AsInteger := DiaSemana;
     Open;
  end;
end;

procedure TDMControlPlazas.SetFecha(aFecha: TDateTime);

  procedure RefrescaEstructura(id_familia: integer; aFecha: TDateTime);
  var
     Q : THYFIBQuery;
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE CREA_ESTRUCTURA_PLAZAS_FAM (:EMPRESA, :CANAL, :ALMACEN, :ID_FAMILIA, :FECHA_HORA) ';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
           Params.ByName['ID_FAMILIA'].AsInteger := id_familia;
           Params.ByName['FECHA_HORA'].AsString := FormatDateTime('yyyymmdd"-000000"', Fecha);
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

begin
  Fecha := aFecha;

  // Me aseguro de que exista la estructura para la fecha
  RefrescaEstructura(id_fam_golo, aFecha);
  RefrescaEstructura(id_fam_cat, aFecha);
  RefrescaEstructura(id_fam_esc, aFecha);

  with QMPlazasGolo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
     Params.ByName['ID_FAMILIA'].AsInteger := id_fam_golo;
     Params.ByName['FECHA'].AsString := FormatDateTime('yyyymmdd', Fecha);
     Open;
  end;
  with QMPlazasCat do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
     Params.ByName['ID_FAMILIA'].AsInteger := id_fam_cat;
     Params.ByName['FECHA'].AsString := FormatDateTime('yyyymmdd', Fecha);
     Open;
  end;
  with QMPlazasEsc do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
     Params.ByName['ID_FAMILIA'].AsInteger := id_fam_esc;
     Params.ByName['FECHA'].AsString := FormatDateTime('yyyymmdd', Fecha);
     Open;
  end;
end;

procedure TDMControlPlazas.QMEstructuraHORAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Copy(Sender.AsString, 1, 2) + ':' + Copy(Sender.AsString, 3, 2);
end;

procedure TDMControlPlazas.QMEstructuraHORASetText(Sender: TField; const Text: string);
begin
  Sender.AsString := Copy(Text, 1, 2) + Copy(Text, 4, 2) + '00';
end;

procedure TDMControlPlazas.QMPlazasFECHA_HORAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Copy(Sender.AsString, 10, 2) + ':' + Copy(Sender.AsString, 12, 2);
end;

procedure TDMControlPlazas.QMPlazasFECHA_HORASetText(Sender: TField; const Text: string);
begin
  Sender.AsString := FormatDateTime('yyyymmdd', Fecha) + '-' + Copy(Text, 1, 2) + Copy(Text, 4, 2) + '00';
end;

procedure TDMControlPlazas.QMEstructuraNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('CANAL').AsInteger := REntorno.Canal;
     FieldByName('ALMACEN').AsString := REntorno.AlmacenDefecto;
     FieldByName('DIA_SEMANA').AsInteger := DiaSemana;
     if DataSet.Name = 'QMEstructuraGolo' then
     begin
        FieldByName('FAMILIA').AsString := 'GOLO';
        FieldByName('ID_FAMILIA').AsInteger := id_fam_golo;
     end;
     if DataSet.Name = 'QMEstructuraCat' then
     begin
        FieldByName('FAMILIA').AsString := 'CAT';
        FieldByName('ID_FAMILIA').AsInteger := id_fam_cat;
     end;
     if DataSet.Name = 'QMEstructuraEsc' then
     begin
        FieldByName('FAMILIA').AsString := 'ESC';
        FieldByName('ID_FAMILIA').AsInteger := id_fam_esc;
     end;
  end;
end;

procedure TDMControlPlazas.QMPlazasNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('CANAL').AsInteger := REntorno.Canal;
     FieldByName('ALMACEN').AsString := REntorno.AlmacenDefecto;
     FieldByName('FECHA_HORA').AsString := FormatDateTime('yyyymmdd', Fecha);
     FieldByName('PLAZAS').AsFloat := 0;
     if DataSet.Name = 'QMPlazasGolo' then
     begin
        FieldByName('ID_FAMILIA').AsInteger := id_fam_golo;
        FieldByName('PLAZAS_MAXIMAS').AsFloat := plazas_fam_golo;
     end;
     if DataSet.Name = 'QMPlazasCat' then
     begin
        FieldByName('ID_FAMILIA').AsInteger := id_fam_cat;
        FieldByName('PLAZAS_MAXIMAS').AsFloat := plazas_fam_cat;
     end;
     if DataSet.Name = 'QMPlazasEsc' then
     begin
        FieldByName('ID_FAMILIA').AsInteger := id_fam_esc;
        FieldByName('PLAZAS_MAXIMAS').AsFloat := plazas_fam_esc;
     end;
  end;
end;

procedure TDMControlPlazas.QMPlazasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_PLAZAS_FAMILIA', 'ID');
end;

end.
