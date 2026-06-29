unit UDMGestProcesos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO, FIBTableDataSetRO,
  SysUtils, Dialogs;

type
  // Define el tipo necesitado para la lista de documentos a procesar
  TDocInfo = record
     id_s: integer;
     id_s_d: integer;

     // Ejercicio, canal y serie de documento origen
     Ejercicio: smallint;
     Canal: smallint;
     Serie: string;

     // Ejercicio, canal y serie de documento destino
     ejerciciodev: smallint;
     canaldev: smallint;
     seriedev: string;
     Rig: integer;

     // Especificos de este formulario
     estado: integer;
     tipo_doc: string;
     Empresa: integer;
  end;

  TDocInfoList = array of TDocInfo;

  TDMGestProcesos = class(TDataModule)
     DSxVerGesPrc: TDataSource;
     xProcesos1: TFIBDataSetRO;
     TLocal: THYTransaction;
     xVerGesPrc: TFIBTableSetRO;
     xVerGesPrcEMPRESA: TIntegerField;
     xVerGesPrcEJERCICIO: TIntegerField;
     xVerGesPrcCANAL: TIntegerField;
     xVerGesPrcSERIE: TFIBStringField;
     xVerGesPrcPROCESO: TFIBStringField;
     xVerGesPrcTIPO: TFIBStringField;
     xVerGesPrcCONTADOR: TIntegerField;
     xVerGesPrcANTERIOR: TIntegerField;
     xVerGesPrcENTRADA: TIntegerField;
     xVerGesPrcUSUARIO: TIntegerField;
     xVerGesPrcNOMBRE: TFIBStringField;
     xVerGesPrcFECHA_E: TDateTimeField;
     xVerGesPrcFECHA_S: TDateTimeField;
     xVerGesPrcUBICACION: TFIBStringField;
     xRecorre: TFIBDataSetRO;
     xRecorreENTRADA: TIntegerField;
     xRecorreEMPRESA: TIntegerField;
     xRecorreEJERCICIO: TIntegerField;
     xRecorreCANAL: TIntegerField;
     xRecorreSERIE: TFIBStringField;
     xRecorreRIG: TIntegerField;
     xRecorreID_S: TIntegerField;
     xRecorreESTADO: TIntegerField;
     xRecorreTIPO: TFIBStringField;
     xRecorrePROC_AUTO: TIntegerField;
     TUpdate: THYTransaction;
     xProcesos1TIPO: TFIBStringField;
     xProcesos1TITULO: TFIBStringField;
     procedure DMGestProcesosCreate(Sender: TObject);
  private
     EmpresaF, EjercicioF, CanalF, ContadorF: integer;
     SerieF: string;
     // Procedimientos que trabajan con el array de documentos  a procesar.
     function FillDocInfoListFromDRO(dro: TFIBDataSetRO; Count: integer): TDocInfoList;
  public
     procedure AbreFactura(Empresa, Ejercicio, Canal, Rig, id_s: integer; Serie, Tipo: string);
     procedure BorraFactura(Empresa, Ejercicio, Canal, Factura, id_s: integer; Serie, Tipo: string);
     procedure AjustaContadores;
     procedure BorraTemporales;
     procedure BorraFacturacion(Tipo: string);
     function EsUltimaFacturacion(Tipo: string): boolean;
     function InicializaProceso(Tipo: string): TDocInfoList;
     procedure RellenaProcesos(Lista: TStrings);
     procedure RefrescaDatos(Serie, Proceso: string);
     procedure InicializaSeries;
  end;

var
  DMGestProcesos : TDMGestProcesos;

implementation

uses UDMMain, UEntorno, UFParadaExt;

{$R *.DFM}

procedure TDMGestProcesos.DMGestProcesosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  InicializaSeries;
end;

function TDMGestProcesos.InicializaProceso(Tipo: string): TDocInfoList;
var
  Count : integer;
begin
  // Valores necesarios para Desfacturar una vez hecho el commit
  EmpresaF := xVerGesPrcEMPRESA.AsInteger;
  EjercicioF := xVerGesPrcEJERCICIO.AsInteger;
  CanalF := xVerGesPrcCANAL.AsInteger;
  SerieF := xVerGesPrcSERIE.AsString;
  ContadorF := xVerGesPrcCONTADOR.AsInteger;

  if TLocal.InTransaction then
     TLocal.Commit;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ALBARANES_NO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :ENTRADA, :CONTADOR)';
        Params.ByName['EMPRESA'].AsInteger := EmpresaF;
        Params.ByName['EJERCICIO'].AsInteger := EjercicioF;
        Params.ByName['CANAL'].AsInteger := CanalF;
        Params.ByName['SERIE'].AsString := SerieF;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['CONTADOR'].AsInteger := ContadorF;
        ExecQuery;
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
        SQL.Add(' SELECT COUNT(*) FROM TMP_DESHACER_FACTURACION ');
        SQL.Add(' WHERE  ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' ((SERIE = ?SERIE) OR (CAST('' '' AS VARCHAR(10)) = ?SERIE)) AND  ');
        SQL.Add(' ENTRADA = ?ENTRADA AND ');
        SQL.Add(' PROC_AUTO = ?PROC_AUTO ');
        Params.ByName['Empresa'].AsInteger := EmpresaF;
        Params.ByName['Ejercicio'].AsInteger := EjercicioF;
        Params.ByName['Serie'].AsString := SerieF;
        Params.ByName['Entrada'].AsInteger := REntorno.Entrada;
        Params.ByName['PROC_AUTO'].AsInteger := ContadorF;
        ExecQuery;
        Count := Fields[0].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xRecorre do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := EmpresaF;
     Params.ByName['EJERCICIO'].AsInteger := EjercicioF;
     // Params.ByName['CANAL'].AsInteger := xVerGesPrcCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := SerieF;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['PROC_AUTO'].AsInteger := ContadorF;
     Open;
     Result := FillDocInfoListFromDRO(xRecorre, Count);
     Close;
  end;
end;

procedure TDMGestProcesos.AbreFactura(Empresa, Ejercicio, Canal, Rig, id_s: integer; Serie, Tipo: string);
var
  Q : THYFIBQuery;
begin
  if (Tipo = '+AT') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_DESPAGA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :ID_S)';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['RIG'].AsInteger := Rig;
           Params.ByName['ID_S'].AsInteger := id_s;
           with TFParadaExt.Create(Self) do
           begin
              try
                 repeat
                 until ExecQuery(Q, _('Atención:'), 30000);
              finally
                 Free;
              end;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ((Tipo = 'FAC') or (Tipo = '+AT')) then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ABRE(:ID_S)';
           Params.ByName['ID_S'].AsInteger := id_s;
           with TFParadaExt.Create(Self) do
           begin
              try
                 repeat
                 until ExecQuery(Q, _('Atención:'), 30000);
              finally
                 Free;
              end;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  if (Tipo = 'FCR') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_ACR_ABRE(:ID_E)';
           Params.ByName['ID_E'].AsInteger := id_s;
           with TFParadaExt.Create(Self) do
           begin
              try
                 repeat
                 until ExecQuery(Q, _('Atención:'), 30000);
              finally
                 Free;
              end;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMGestProcesos.BorraFactura(Empresa, Ejercicio, Canal, Factura, id_s: integer; Serie, Tipo: string);
var
  Q : THYFIBQuery;
begin
  if (Tipo = 'FAC') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_BORRA_RIG_SALIDA_LOG(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_S, :ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := 'FAC';
           Params.ByName['RIG'].AsInteger := Factura;
           Params.ByName['ID_S'].AsInteger := id_s;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           with TFParadaExt.Create(Self) do
           begin
              try
                 repeat
                 until ExecQuery(Q, _('Atención:'), 30000);
              finally
                 Free;
              end;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  if (Tipo = 'FCR') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_BORRA_RIG_ENTRADA_LOG(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_E, :ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := 'FCR';
           Params.ByName['RIG'].AsInteger := Factura;
           Params.ByName['ID_S'].AsInteger := id_s;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           with TFParadaExt.Create(Self) do
           begin
              try
                 repeat
                 until ExecQuery(Q, _('Atención:'), 30000);
              finally
                 Free;
              end;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMGestProcesos.AjustaContadores;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CONTADORES_AJUSTA_EMP_EJE(:EMPRESA, :EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMGestProcesos.BorraTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_DESHACER_FACTURACION WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMGestProcesos.BorraFacturacion(Tipo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_BORRA_PROC_AUTO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :CONTADOR)';
        Params.ByName['EMPRESA'].AsInteger := EmpresaF;
        Params.ByName['EJERCICIO'].AsInteger := EjercicioF;
        Params.ByName['CANAL'].AsInteger := CanalF;
        Params.ByName['SERIE'].AsString := SerieF;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['CONTADOR'].AsInteger := ContadorF;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMGestProcesos.EsUltimaFacturacion(Tipo: string): boolean;
begin
  Result := False;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(CONTADOR) FROM GES_PROCESOS_AUTO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' ((SERIE = :SERIE) OR (CAST('' '' AS VARCHAR(10)) = :SERIE)) AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' ANTERIOR = 0 ');
        Params.ByName['Empresa'].AsInteger := xVerGesPrcEMPRESA.AsInteger;
        Params.ByName['Ejercicio'].AsInteger := xVerGesPrcEJERCICIO.AsInteger;
        Params.ByName['Canal'].AsInteger := xVerGesPrcCANAL.AsInteger;
        Params.ByName['Serie'].AsString := xVerGesPrcSERIE.AsString;
        Params.ByName['Tipo'].AsString := Tipo;
        ExecQuery;
        if ((not (FieldByName['MAX'].IsNull)) and
           (FieldByName['MAX'].AsInteger = xVerGesPrcCONTADOR.AsInteger)) then
           Result := True;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMGestProcesos.FillDocInfoListFromDRO(dro: TFIBDataSetRO; Count: integer): TDocInfoList;
var
  i : integer;
  list : TDocInfoList;
begin
  with dro do
  begin
     if Count > 0 then
     begin
        First;
        i := 0;
        SetLength(list, Count);
        while not EOF do
        begin
           // Try empresa field
           try
              list[i].Empresa := FieldByName('empresa').AsInteger;
           except
              on E: Exception do
                 list[i].Empresa := 0;
           end;

           // Try id_s field
           try
              list[i].id_s := FieldByName('id_s').AsInteger;
           except
              on E: Exception do
                 list[i].id_s := 0;
           end;

           { // Try id_s_d field
        try
          list[i].id_s_d := FieldByName('id_s_d').AsInteger;
        except
          on E: Exception do list[i].id_s_d := 0;
        end;
        }

           // Try ejercicio field
           try
              list[i].Ejercicio := FieldByName('ejercicio').AsInteger;
           except
              on E: Exception do
                 list[i].Ejercicio := 0;
           end;

           // Try canal field
           try
              list[i].Canal := FieldByName('canal').AsInteger;
           except
              on E: Exception do
                 list[i].Canal := 0;
           end;

           // Try serie
           try
              list[i].Serie := FieldByName('SERIE').AsString;
           except
              on E: Exception do
                 list[i].Serie := '';
           end;

           // Try rig field
           try
              list[i].Rig := FieldByName('rig').AsInteger;
           except
              on E: Exception do
                 list[i].Rig := 0;
           end;

           // Try estado field
           try
              list[i].estado := FieldByName('estado').AsInteger;
           except
              on E: Exception do
                 list[i].estado := 0;
           end;

           // Try tipo_doc field
           try
              list[i].tipo_doc := FieldByName('tipo').AsString;
           except
              on E: Exception do
                 list[i].tipo_doc := '';
           end;

           dro.Next;
           Inc(i);
        end;
     end;
  end;
  Result := list;
end;

procedure TDMGestProcesos.RellenaProcesos(Lista: TStrings);
var
  Tipo : string;
begin
  Lista.Clear;
  with xProcesos1 do
  begin
     Close;
     Open;
     First;
     while not EOF do
     begin
        Tipo := xProcesos1TIPO.AsString;
        Lista.Add(Tipo + ' | ' + xProcesos1TITULO.AsString);
        Next;
     end;
     Close;
  end;
end;

procedure TDMGestProcesos.RefrescaDatos(Serie: string; Proceso: string);
begin
  if ((EmpresaF > 0) and (EjercicioF > 0) and (CanalF > 0)) then
  begin
     with xVerGesPrc do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := EmpresaF;
        Params.ByName['EJERCICIO'].AsInteger := EjercicioF;
        Params.ByName['CANAL'].AsInteger := CanalF;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Proceso;
        Open;
     end;
  end;
end;

procedure TDMGestProcesos.InicializaSeries;
begin
  EmpresaF := REntorno.Empresa;
  EjercicioF := REntorno.Ejercicio;
  CanalF := REntorno.Canal;
end;

end.
