unit UDMCRM;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery;

type
  TDMCRM = class(TDataModule)
     TLocal: THYTransaction;
     xCRM: TFIBTableSet;
     xCRMID: TIntegerField;
     xCRMEMPRESA: TIntegerField;
     xCRMUSUARIO: TIntegerField;
     xCRMAGENTE: TIntegerField;
     xCRMCLIENTE: TIntegerField;
     xCRMINCIDENCIA: TFIBStringField;
     xCRMFECHA: TDateTimeField;
     xCRMFECHA_FUTURO: TDateTimeField;
     xCRMTIPO: TIntegerField;
     xCRMNOTAS: TBlobField;
     DSXCRM: TDataSource;
     xCRMTIT_AGENTE: TFIBStringField;
     xCRMTIT_CLIENTE: TFIBStringField;
     xCRMTIT_TIPO: TFIBStringField;
     xCRMRUTA: TIntegerField;
     xCRMSEMANA: TIntegerField;
     xSemana: TFIBTableSet;
     dsXSemana: TDataSource;
     xSemanaID: TIntegerField;
     xSemanaEMPRESA: TIntegerField;
     xSemanaUSUARIO: TIntegerField;
     xSemanaAGENTE: TIntegerField;
     xSemanaTIT_AGENTE: TFIBStringField;
     xSemanaCLIENTE: TIntegerField;
     xSemanaTIT_CLIENTE: TFIBStringField;
     xSemanaINCIDENCIA: TFIBStringField;
     xSemanaFECHA: TDateTimeField;
     xSemanaFECHA_FUTURO: TDateTimeField;
     xSemanaTIPO: TIntegerField;
     xSemanaTIT_TIPO: TFIBStringField;
     xSemanaNOTAS: TBlobField;
     xSemanaRUTA: TIntegerField;
     xSemanaSEMANA: TIntegerField;
     xTotSemana: TFIBTableSet;
     DSxTotSemana: TDataSource;
     xCRMEJERCICIO: TIntegerField;
     xSemanaEJERCICIO: TIntegerField;
     xTotSemanaEMPRESA: TIntegerField;
     xTotSemanaEJERCICIO: TIntegerField;
     xTotSemanaUSUARIO: TIntegerField;
     xTotSemanaAGENTE: TIntegerField;
     xTotSemanaSEMANA: TIntegerField;
     xTotSemanaRUTA: TIntegerField;
     xTotSemanaKILOMETROS: TFloatField;
     xTotSemanaGASOLINA: TFloatField;
     xTotSemanaBILLETES: TFloatField;
     xTotSemanaPEAJES: TFloatField;
     xTotSemanaPARKING: TFloatField;
     xTotSemanaTELEFONO: TFloatField;
     xTotSemanaHOTEL: TFloatField;
     xTotSemanaCOMIDAS_VIAJE: TFloatField;
     xTotSemanaCOMIDAS_INVITACION: TFloatField;
     xTotSemanaGASTOS_PEQUENOS: TFloatField;
     xTotSemanaVARIOS: TFloatField;
     xTotSemanaTOTAL: TFloatField;
     xCRMCLIENTE_AUSENTE: TIntegerField;
     xCRMCLIENTE_NUEVO: TIntegerField;
     xCRMVISITA_EFECTUADA: TIntegerField;
     xCRMAUSENTE: TIntegerField;
     xCRMVOLVER: TIntegerField;
     xCRMANULAR: TIntegerField;
     xCRMVISITA_COMERCIAL: TIntegerField;
     xCRMGESTION_DE_COBROS: TIntegerField;
     xCRMENTREGA_MATERIAL: TIntegerField;
     xSemanaCLIENTE_AUSENTE: TIntegerField;
     xSemanaCLIENTE_NUEVO: TIntegerField;
     xSemanaVISITA_EFECTUADA: TIntegerField;
     xSemanaAUSENTE: TIntegerField;
     xSemanaVOLVER: TIntegerField;
     xSemanaANULAR: TIntegerField;
     xSemanaVISITA_COMERCIAL: TIntegerField;
     xSemanaGESTION_DE_COBROS: TIntegerField;
     xSemanaENTREGA_MATERIAL: TIntegerField;
     xVisitas: TFIBTableSet;
     DSVisitas: TDataSource;
     xVisitasEMPRESA: TIntegerField;
     xVisitasCLIENTE: TIntegerField;
     xVisitasTITULO: TFIBStringField;
     xVisitasCODIGO_POSTAL: TFIBStringField;
     xVisitasTITULO_LOCALIDAD: TFIBStringField;
     xVisitasFRECUENCIA: TIntegerField;
     xVisitasVENTAS_2: TFloatField;
     xVisitasVENTAS_1: TFloatField;
     xVisitasVENTAS: TFloatField;
     xVisitasPREVISION_VENTA: TFloatField;
     xVisitasRUTA: TIntegerField;
     xVisitasCLIENTE_POTENCIAL: TIntegerField;
     xVisitasAGENTE: TIntegerField;
     xVisitasEJERCICIO: TIntegerField;
     xVisitasD01: TIntegerField;
     xVisitasD02: TIntegerField;
     xVisitasD03: TIntegerField;
     xVisitasD04: TIntegerField;
     xVisitasD05: TIntegerField;
     xVisitasD06: TIntegerField;
     xVisitasD07: TIntegerField;
     xVisitasD08: TIntegerField;
     xVisitasD09: TIntegerField;
     xVisitasD10: TIntegerField;
     xVisitasD11: TIntegerField;
     xVisitasD12: TIntegerField;
     xVisitasD13: TIntegerField;
     xVisitasD14: TIntegerField;
     xVisitasD15: TIntegerField;
     xVisitasD16: TIntegerField;
     xVisitasD17: TIntegerField;
     xVisitasD18: TIntegerField;
     xVisitasD19: TIntegerField;
     xVisitasD20: TIntegerField;
     xVisitasD21: TIntegerField;
     xVisitasD22: TIntegerField;
     xVisitasD23: TIntegerField;
     xVisitasD24: TIntegerField;
     xVisitasD25: TIntegerField;
     xVisitasD26: TIntegerField;
     xVisitasD27: TIntegerField;
     xVisitasD28: TIntegerField;
     xVisitasD29: TIntegerField;
     xVisitasD30: TIntegerField;
     xVisitasD31: TIntegerField;
     xVisitasD32: TIntegerField;
     xVisitasD33: TIntegerField;
     xVisitasD34: TIntegerField;
     xVisitasD35: TIntegerField;
     xVisitasD36: TIntegerField;
     xVisitasD37: TIntegerField;
     xVisitasD38: TIntegerField;
     xVisitasD39: TIntegerField;
     xVisitasD40: TIntegerField;
     xVisitasD41: TIntegerField;
     xVisitasD42: TIntegerField;
     xVisitasD43: TIntegerField;
     xVisitasD44: TIntegerField;
     xVisitasD45: TIntegerField;
     xVisitasD46: TIntegerField;
     xVisitasD47: TIntegerField;
     xVisitasD48: TIntegerField;
     xVisitasD49: TIntegerField;
     xVisitasD50: TIntegerField;
     xVisitasD51: TIntegerField;
     xVisitasD52: TIntegerField;
     xVisitasD53: TIntegerField;
     xVisitasD54: TIntegerField;
     xVisitasD55: TIntegerField;
     xCRMTERCERO: TIntegerField;
     xCRMCLIENTE_POTENCIAL: TIntegerField;
     TUpdate: THYTransaction;
     xTotSemanaEFECTIVO: TFloatField;
     xTotSemanaTARJETA: TFloatField;
     procedure xCRMNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure xCRMBeforePost(DataSet: TDataSet);
     procedure xCRMAfterPost(DataSet: TDataSet);
     procedure xCRMCLIENTEChange(Sender: TField);
     procedure xTotSemanaAfterPost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xVisitasAfterPost(DataSet: TDataSet);
     procedure xTotSemanaEFECTIVOChange(Sender: TField);
     procedure xTotSemanaTARJETAChange(Sender: TField);
     procedure xTotSemanaCambiaPrecio(Sender: TField);
  private
     { Private declarations }
     RecalculandoTotalKri: boolean;
  public
     { Public declarations }
     Agente: integer;
     procedure FiltraSemana(Agente, Semana, Ruta: integer);
     procedure CalculaVisitas(ruta: integer);
     procedure DuplicaDatos(Tipo: integer);
  end;

var
  DMCRM : TDMCRM;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMCRM.DataModuleCreate(Sender: TObject);
var
  Q : THYFIBQuery;
  LocalMascaraN : string;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select agente from SYS_USUARIOS where USUARIO=' + REntorno.UsuarioStr;
     ExecQuery;
     Agente := FieldByName['AGENTE'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'delete from tmp_lst_crm where entrada=' + IntToStr(REntorno.Entrada);
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);

  if (not xCRM.Transaction.InTransaction) then
     xCRM.Transaction.StartTransaction;
  xCRM.Close;
  xCRM.SelectSQL.Text := 'SELECT * FROM VER_CRM_CABECERA WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND AGENTE=?AGENTE ORDER BY ID';
  xCRM.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xCRM.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
  xCRM.Params.ByName['AGENTE'].AsInteger := Agente;
  xCRM.Open;

  {Pongo mascaras}
  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  xVisitasVENTAS_2.DisplayFormat := LocalMascaraN;
  xVisitasVENTAS_1.DisplayFormat := LocalMascaraN;
  xVisitasVENTAS.DisplayFormat := LocalMascaraN;
  xVisitasPREVISION_VENTA.DisplayFormat := LocalMascaraN;
end;

procedure TDMCRM.DataModuleDestroy(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'delete from tmp_lst_crm where entrada=' + IntToStr(REntorno.Entrada);
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMCRM.xCRMNewRecord(DataSet: TDataSet);
begin
  xCRMEMPRESA.AsInteger := REntorno.Empresa;
  xCRMEJERCICIO.AsInteger := REntorno.Ejercicio;
  xCRMUSUARIO.AsInteger := REntorno.Usuario;
  xCRMAGENTE.AsInteger := Agente;
  xCRMCLIENTE_AUSENTE.AsInteger := 0;
  xCRMCLIENTE_NUEVO.AsInteger := 0;
  xCRMVISITA_EFECTUADA.AsInteger := 0;
  xCRMAUSENTE.AsInteger := 0;
  xCRMVOLVER.AsInteger := 0;
  xCRMANULAR.AsInteger := 0;
  xCRMVISITA_COMERCIAl.AsInteger := 0;
  xCRMGESTION_DE_COBROS.AsInteger := 0;
  xCRMENTREGA_MATERIAL.AsInteger := 0;
  xCRMCLIENTE_POTENCIAL.AsInteger := 0;
  xCRMFECHA.AsDateTime := Now;
  xCRMFECHA_FUTURO.AsDateTime := Now;
  xCRMTIPO.AsInteger := 1;
end;

procedure TDMCRM.DuplicaDatos(Tipo: integer);
var
  cliente_ant : integer;
  incidencia_ant : string;
  fecha_ant : TDateTime;
  fecha_futuro_ant : TDateTime;
  tipo_ant : integer;
begin
  if ((xCRM.State = dsEdit) or (xCRM.State = dsInsert)) then
     xCRM.Post;
  {Guarda los datos para usar en el siguiente insert}
  cliente_ant := xCRMCliente.AsInteger;
  incidencia_ant := xCRMINCIDENCIA.AsString;
  fecha_ant := xCRMFECHA.AsDateTime;
  fecha_futuro_ant := xCRMFECHA_FUTURO.AsDateTime;
  tipo_ant := xCRMTIPO.AsInteger;

  if (Tipo = 0) then
     Tipo := tipo_ant;

  xCRM.Insert;
  {Toma datos del anterior}
  xCRMFECHA.AsDateTime := fecha_ant;
  xCRMFECHA_FUTURO.AsDateTime := fecha_futuro_ant;
  xCRMTIPO.AsInteger := Tipo;
  xCRMCLIENTE.AsInteger := cliente_ant;
  xCRMINCIDENCIA.AsString := incidencia_ant;
end;

procedure TDMCRM.xCRMBeforePost(DataSet: TDataSet);
begin
  xCRMINCIDENCIA.AsString := UpperCase(xCRMINCIDENCIA.AsString);
  if (xCRM.State = dsInsert) then
     DMMain.Contador_Gen(xCRM, 'ID_CRM_KRI', 'ID');
end;

procedure TDMCRM.xCRMAfterPost(DataSet: TDataSet);
begin
  xCRM.Transaction.CommitRetaining;
end;

procedure TDMCRM.xCRMCLIENTEChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  if ((xCRM.State = dsEdit) or (xCRM.State = dsInsert)) then
  begin
     if (xCRMCLIENTE.AsString > '') then
     begin
        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'select ruta from emp_clientes where empresa=' + REntorno.EmpresaStr +
              ' and cliente=' + xCRMCLIENTE.AsString;
           ExecQuery;
           xCRMRUTA.AsInteger := FieldByName['RUTA'].AsInteger;
           FreeHandle;
        end;
        FreeAndNil(Q);
     end;
  end;
end;

procedure TDMCRM.FiltraSemana(Agente, Semana, Ruta: integer);
begin
  if (not xSemana.Transaction.InTransaction) then
     xSemana.Transaction.StartTransaction;
  xSemana.Close;
  xSemana.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xSemana.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
  xSemana.Params.ByName['AGENTE'].AsInteger := Agente;
  xSemana.Params.ByName['SEMANA'].AsInteger := Semana;
  xSemana.Params.ByName['RUTA'].AsInteger := Ruta;
  xSemana.Open;
  if (not xTotSemana.Transaction.InTransaction) then
     xTotSemana.Transaction.StartTransaction;
  xTotSemana.Close;
  xTotSemana.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xTotSemana.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
  xTotSemana.Params.ByName['AGENTE'].AsInteger := Agente;
  xTotSemana.Params.ByName['SEMANA'].AsInteger := Semana;
  xTotSemana.Params.ByName['RUTA'].AsInteger := Ruta;
  xTotSemana.Open;
end;

procedure TDMCRM.xTotSemanaAfterPost(DataSet: TDataSet);
begin
  DMCRM.xTotSemana.Transaction.CommitRetaining;
end;

procedure TDMCRM.CalculaVisitas(ruta: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'execute procedure lst_crm_visitas(?empresa,?ejercicio,?agente,?ruta)';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Params.ByName['RUTA'].AsInteger := ruta;
     ExecQuery;
     FreeHandle;
  end;
  FreeAndNil(Q);
  xVisitas.Close;
  xVisitas.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xVisitas.Params.ByName['RUTA'].AsInteger := ruta;
  xVisitas.Params.ByName['AGENTE'].AsInteger := Agente;
  xVisitas.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
  xVisitas.Open;
end;

procedure TDMCRM.xVisitasAfterPost(DataSet: TDataSet);
begin
  xVisitas.Transaction.CommitRetaining;
end;

procedure TDMCRM.xTotSemanaEFECTIVOChange(Sender: TField);
begin
  if (not RecalculandoTotalKri) then
  begin
     RecalculandoTotalKri := True;
     xTotSemanaTARJETA.AsFloat := xTotSemanaTOTAL.AsFloat - xTotSemanaEFECTIVO.AsFloat;
     RecalculandoTotalKri := False;
  end;
end;

procedure TDMCRM.xTotSemanaTARJETAChange(Sender: TField);
begin
  if (not RecalculandoTotalKri) then
  begin
     RecalculandoTotalKri := True;
     xTotSemanaEFECTIVO.AsFloat := xTotSemanaTOTAL.AsFloat - xTotSemanaTARJETA.AsFloat;
     RecalculandoTotalKri := False;
  end;
end;

procedure TDMCRM.xTotSemanaCambiaPrecio(Sender: TField);
begin
  xTotSemanaTOTAL.AsFloat := xTotSemanaKILOMETROS.AsFloat + xTotSemanaGASOLINA.AsFloat +
     xTotSemanaBILLETES.AsFloat + xTotSemanaPEAJES.AsFloat +
     xTotSemanaPARKING.AsFloat + xTotSemanaTELEFONO.AsFloat +
     xTotSemanaHOTEL.AsFloat + xTotSemanaCOMIDAS_VIAJE.AsFloat +
     xTotSemanaCOMIDAS_INVITACION.AsFloat + xTotSemanaGASTOS_PEQUENOS.AsFloat +
     xTotSemanaVARIOS.AsFloat;
end;

end.
