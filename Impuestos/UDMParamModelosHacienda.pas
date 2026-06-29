unit UDMParamModelosHacienda;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet, FIBQuery,
  HYFIBQuery, FIBDataSetRO;

type
  TDMParamModelosHacienda = class(TDataModule)
     QMModelos: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMModelos: TDataSource;
     QMModelosDELEGACION: TFIBStringField;
     QMModelosADMINISTRACION: TFIBStringField;
     QMModelosCOD_ADMINISTRACION: TIntegerField;
     QMModelosDECLARANTE_NIF: TFIBStringField;
     QMModelosDECLARANTE_NOMBRE: TFIBStringField;
     QMModelosDECLARANTE_TIPO_CALLE: TFIBStringField;
     QMModelosDECLARANTE_CALLE: TFIBStringField;
     QMModelosDECLARANTE_NUMERO: TFIBStringField;
     QMModelosDECLARANTE_ESCALERA: TFIBStringField;
     QMModelosDECLARANTE_PISO: TFIBStringField;
     QMModelosDECLARANTE_PUERTA: TFIBStringField;
     QMModelosDECLARANTE_CODIGO_POSTAL: TFIBStringField;
     QMModelosDECLARANTE_MUNICIPIO: TFIBStringField;
     QMModelosDECLARANTE_PROVINCIA: TFIBStringField;
     QMModelosDECLARANTE_TELEFONO: TFIBStringField;
     QMModelosDECLARANTE_ENTIDAD: TFIBStringField;
     QMModelosDECLARANTE_SUCURSAL: TFIBStringField;
     QMModelosDECLARANTE_DC: TFIBStringField;
     QMModelosM_110_EFECTIVO: TIntegerField;
     QMModelosM_115_EFECTIVO: TIntegerField;
     QMModelosM_300_EFECTIVO: TIntegerField;
     QMModelosEMPRESA: TIntegerField;
     QMModelosEJERCICIO: TIntegerField;
     QMModelosCANAL: TIntegerField;
     QMModelosPRESENTADOR_NIF: TFIBStringField;
     QMModelosPRESENTADOR_NOMBRE: TFIBStringField;
     QMModelosPRESENTADOR_TIPO_CALLE: TFIBStringField;
     QMModelosPRESENTADOR_CALLE: TFIBStringField;
     QMModelosPRESENTADOR_NUMERO: TFIBStringField;
     QMModelosPRESENTADOR_ESCALERA: TFIBStringField;
     QMModelosPRESENTADOR_PISO: TFIBStringField;
     QMModelosPRESENTADOR_PUERTA: TFIBStringField;
     QMModelosPRESENTADOR_CODIGO_POSTAL: TFIBStringField;
     QMModelosPRESENTADOR_MUNICIPIO: TFIBStringField;
     QMModelosPRESENTADOR_PROVINCIA: TFIBStringField;
     QMModelosPRESENTADOR_TELEFONO: TFIBStringField;
     QMModelosDECLARANTE_IBAN: TFIBStringField;
     QMModelosDECLARANTE_BIC: TFIBStringField;
     QMModelosDECLARANTE_CUENTA: TFIBStringField;
     TUpdate: THYTransaction;
     QMModelosM_303_EFECTIVO: TIntegerField;
     QMModelosDEVOLUCION_MENSUAL_M303: TIntegerField;
     QMModelosDEVOLUCION_MENSUAL_M349: TIntegerField;
     QMModelosCERTIFICADO: TFIBStringField;
     QMModelosCERTIFICADO_LROE_FICHERO: TFIBStringField;
     QMModelosCERTIFICADO_LROE_CLAVE: TFIBStringField;
     QMModelosDEVOLUCION_MENSUAL_M592: TIntegerField;
     QMModelosUTILIZA_SII: TIntegerField;
     QMModelosUTILIZA_TICKETBAI: TIntegerField;
     QMModelosUTILIZA_VERIFACTU: TIntegerField;
     QMModelosVERIFACTU_MODO_PRUEBAS: TIntegerField;
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMModelosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure SIIPruebas(ModoPruebas: boolean);
     procedure TBAIPruebas(ModoPruebas: boolean);
  end;

var
  DMParamModelosHacienda : TDMParamModelosHacienda;

implementation

uses UDMMain, uFBusca, UFormGest, UEntorno;

{$R *.DFM}

procedure TDMParamModelosHacienda.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMParamModelosHacienda.DataModuleCreate(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMModelos, '11100', True);

  // Si no hay registros trato de copiar el del ejercicio anterior
  if (QMModelos.RecordCount = 0) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO EMP_MODELOS_HACIENDA ');
           SQL.Add(' (EMPRESA,EJERCICIO,CANAL,DELEGACION,ADMINISTRACION,COD_ADMINISTRACION ');
           SQL.Add(' ,DECLARANTE_NIF,DECLARANTE_NOMBRE,DECLARANTE_TIPO_CALLE,DECLARANTE_CALLE ');
           SQL.Add(' ,DECLARANTE_NUMERO,DECLARANTE_ESCALERA,DECLARANTE_PISO,DECLARANTE_PUERTA ');
           SQL.Add(' ,DECLARANTE_CODIGO_POSTAL,DECLARANTE_MUNICIPIO,DECLARANTE_PROVINCIA ');
           SQL.Add(' ,DECLARANTE_TELEFONO,DECLARANTE_ENTIDAD,DECLARANTE_SUCURSAL,DECLARANTE_DC ');
           SQL.Add(' ,DECLARANTE_CUENTA,M_110_EFECTIVO,M_115_EFECTIVO,M_300_EFECTIVO ');
           SQL.Add(' ,PRESENTADOR_NIF,PRESENTADOR_NOMBRE,PRESENTADOR_TIPO_CALLE,PRESENTADOR_CALLE ');
           SQL.Add(' ,PRESENTADOR_NUMERO,PRESENTADOR_ESCALERA,PRESENTADOR_PISO,PRESENTADOR_PUERTA ');
           SQL.Add(' ,PRESENTADOR_CODIGO_POSTAL,PRESENTADOR_MUNICIPIO,PRESENTADOR_PROVINCIA ');
           SQL.Add(' ,PRESENTADOR_TELEFONO,DECLARANTE_IBAN,DECLARANTE_BIC,M_303_EFECTIVO ');
           SQL.Add(' ,DEVOLUCION_MENSUAL_M303, DEVOLUCION_MENSUAL_M349) ');
           SQL.Add(' SELECT ');
           SQL.Add(' EMPRESA,?EJERCICIO,CANAL,DELEGACION,ADMINISTRACION,COD_ADMINISTRACION ');
           SQL.Add(' ,DECLARANTE_NIF,DECLARANTE_NOMBRE,DECLARANTE_TIPO_CALLE,DECLARANTE_CALLE ');
           SQL.Add(' ,DECLARANTE_NUMERO,DECLARANTE_ESCALERA,DECLARANTE_PISO,DECLARANTE_PUERTA ');
           SQL.Add(' ,DECLARANTE_CODIGO_POSTAL,DECLARANTE_MUNICIPIO,DECLARANTE_PROVINCIA ');
           SQL.Add(' ,DECLARANTE_TELEFONO,DECLARANTE_ENTIDAD,DECLARANTE_SUCURSAL,DECLARANTE_DC ');
           SQL.Add(' ,DECLARANTE_CUENTA,M_110_EFECTIVO,M_115_EFECTIVO,M_300_EFECTIVO ');
           SQL.Add(' ,PRESENTADOR_NIF,PRESENTADOR_NOMBRE,PRESENTADOR_TIPO_CALLE,PRESENTADOR_CALLE ');
           SQL.Add(' ,PRESENTADOR_NUMERO,PRESENTADOR_ESCALERA,PRESENTADOR_PISO,PRESENTADOR_PUERTA ');
           SQL.Add(' ,PRESENTADOR_CODIGO_POSTAL,PRESENTADOR_MUNICIPIO,PRESENTADOR_PROVINCIA ');
           SQL.Add(' ,PRESENTADOR_TELEFONO,DECLARANTE_IBAN,DECLARANTE_BIC,M_303_EFECTIVO ');
           SQL.Add(' ,DEVOLUCION_MENSUAL_M303, DEVOLUCION_MENSUAL_M349 ');
           SQL.Add(' FROM EMP_MODELOS_HACIENDA ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA=?EMPRESA AND ');
           SQL.Add(' EJERCICIO=?EJERCICIO - 1 AND');
           SQL.Add(' CANAL=?CANAL ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     QMModelos.Close;
     DMMain.FiltraTabla(QMModelos, '11100', True);
  end;
end;

procedure TDMParamModelosHacienda.QMModelosNewRecord(DataSet: TDataSet);
begin
  QMModelosEMPRESA.AsInteger := REntorno.Empresa;
  QMModelosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMModelosCANAL.AsInteger := REntorno.Canal;
  QMModelosDEVOLUCION_MENSUAL_M303.AsInteger := 0;
  QMModelosDEVOLUCION_MENSUAL_M349.AsInteger := 0;
end;

procedure TDMParamModelosHacienda.SIIPruebas(ModoPruebas: boolean);
begin
  if (ModoPruebas) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''EMI'', ''https://www7.aeat.es/wlpl/SSII-FACT/ws/fe/SiiFactFEV1SOAP'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
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
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''REC'', ''https://www7.aeat.es/wlpl/SSII-FACT/ws/fr/SiiFactFRV1SOAP'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''EMI'', ''https://www1.agenciatributaria.gob.es/wlpl/SSII-FACT/ws/fe/SiiFactFEV1SOAP'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
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
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''REC'', ''https://www1.agenciatributaria.gob.es/wlpl/SSII-FACT/ws/fr/SiiFactFRV1SOAP'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMParamModelosHacienda.TBAIPruebas(ModoPruebas: boolean);
begin
  if (ModoPruebas) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''TBA'', ''https://tbai-prep.egoitza.gipuzkoa.eus/WAS/HACI/HTBRecepcionFacturasWEB/rest/recepcionFacturas/alta'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
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
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''TBB'', ''https://tbai-prep.egoitza.gipuzkoa.eus/WAS/HACI/HTBRecepcionFacturasWEB/rest/recepcionFacturas/anulacion'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
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
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''LRA'', ''https://pruesarrerak.bizkaia.eus/N3B4000M/aurkezpena'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
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
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''LRC'', ''https://pruesarrerak.bizkaia.eus/N3B4001M/kontsulta'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''TBA'', ''https://tbai-z.egoitza.gipuzkoa.eus/sarrerak/alta'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
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
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''TBB'', ''https://tbai-z.egoitza.gipuzkoa.eus/sarrerak/baja'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
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
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''LRA'', ''https://sarrerak.bizkaia.eus/N3B4000M/aurkezpena'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
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
           SQL.Add(' UPDATE OR INSERT INTO SII_URL_ENDPOINT (TIPO, URL, PAIS) ');
           SQL.Add(' VALUES (''LRC'', ''https://sarrerak.bizkaia.eus/N3B4001M/kontsulta'', ''ESP'') ');
           SQL.Add(' MATCHING (TIPO, PAIS) ');
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
