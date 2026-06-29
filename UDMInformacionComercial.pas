unit UDMInformacionComercial;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBDataSetRO, FIBDatabase, UFIBModificados;

type
  TDMInformacionComercial = class(TDataModule)
     TLocal: THYTransaction;
     xEmpClientes: TFIBDataSetRO;
     xConCuentasGesCli: TFIBDataSetRO;
     xEmpClientesRIESGO_AUT: TFloatField;
     xEmpClientesDIA_PAGO_1: TIntegerField;
     xEmpClientesDIA_PAGO_2: TIntegerField;
     xEmpClientesAGENTE: TIntegerField;
     xEmpClientesNOTAS: TBlobField;
     xEmpClientesTIPO: TIntegerField;
     xEmpClientesNRO_EMPLEADOS: TIntegerField;
     xEmpClientesFACTURACION_TOTAL: TFloatField;
     xEmpClientesCONSUMO_MATERIAL: TFloatField;
     xEmpClientesPROVEEDORES_HABITUALES: TFIBStringField;
     xEmpClientesRUTA: TIntegerField;
     xEmpClientesTIPO_CLIENTE: TFIBStringField;
     xEmpClientesCLIENTE_POTENCIAL: TIntegerField;
     xConCuentasGesCliEMPRESA: TIntegerField;
     xConCuentasGesCliEJERCICIO: TIntegerField;
     xConCuentasGesCliCANAL: TIntegerField;
     xConCuentasGesCliCLIENTE: TIntegerField;
     xConCuentasGesCliTERCERO: TIntegerField;
     xConCuentasGesCliCUENTA: TFIBStringField;
     xConCuentasGesCliFORMA_PAGO: TFIBStringField;
     xEmpAgrupacionesCli: TFIBDataSetRO;
     xEmpAgrupacionesCliAGRUPACION: TFIBStringField;
     xEmpAgrupacionesCliTITULO: TFIBStringField;
     DSxConCuentasGesCli: TDataSource;
     DSxEmpClientes: TDataSource;
     DSxEmpAgrupacionesCli: TDataSource;
     xVerAgente: TFIBDataSetRO;
     xVerAgenteTITULO: TFIBStringField;
     DSxVerAgente: TDataSource;
     DSxSysTerceros: TDataSource;
     xSysTerceros: TFIBDataSetRO;
     xSysTercerosTERCERO: TIntegerField;
     xSysTercerosNOMBRE_R_SOCIAL: TFIBStringField;
     xSysTercerosNOMBRE_COMERCIAL: TFIBStringField;
     xSysTercerosTIPO_RAZON: TFIBStringField;
     xSysTercerosNIF: TFIBStringField;
     xSysTercerosFECHA_ALTA: TDateTimeField;
     xSysTercerosNOTAS: TBlobField;
     xSysTercerosTELEFONO01: TFIBStringField;
     xSysTercerosTELEFONO02: TFIBStringField;
     xSysTercerosTELEFAX: TFIBStringField;
     xSysTercerosEMAIL: TFIBStringField;
     xSysTercerosWEB: TFIBStringField;
     xSysTercerosCLIENTE_POTENCIAL: TIntegerField;
     xSysTercerosContacto: TFIBDataSetRO;
     DSxSysTercerosContacto: TDataSource;
     xSysTercerosContactoTERCERO: TIntegerField;
     xSysTercerosContactoCONTACTO: TIntegerField;
     xSysTercerosContactoNOMBRE: TFIBStringField;
     xSysTercerosContactoAPELLIDOS: TFIBStringField;
     xSysTercerosContactoMOVIL: TFIBStringField;
     xSysTercerosContactoTELEFONO: TFIBStringField;
     xSysTercerosContactoFAX: TFIBStringField;
     xSysTercerosContactoEXTENSION: TFIBStringField;
     xSysTercerosContactoCORREO: TFIBStringField;
     xSysTercerosContactoNOTAS: TBlobField;
     xEmpClientesEMPRESA: TIntegerField;
     xEmpClientesCLIENTE: TIntegerField;
     xSysTercerosBanco: TFIBDataSetRO;
     xSysTercerosDireccion: TFIBDataSetRO;
     DSxSysTerceronsBancos: TDataSource;
     DSxSysTercerosDireccion: TDataSource;
     xSysTercerosBancoTERCERO: TIntegerField;
     xSysTercerosBancoBANCO: TIntegerField;
     xSysTercerosBancoTITULO: TFIBStringField;
     xSysTercerosBancoENTIDAD: TFIBStringField;
     xSysTercerosBancoSUCURSAL: TFIBStringField;
     xSysTercerosBancoCONTROL: TFIBStringField;
     xSysTercerosBancoCUENTA: TFIBStringField;
     xSysTercerosBancoACTIVA: TIntegerField;
     xSysTercerosBancoMODO: TIntegerField;
     xSysTercerosBancoORDEN: TIntegerField;
     xSysTercerosBancoNOTAS: TBlobField;
     xSysTercerosDireccionTERCERO: TIntegerField;
     xSysTercerosDireccionDIRECCION: TIntegerField;
     xSysTercerosDireccionDIR_TIPO: TFIBStringField;
     xSysTercerosDireccionDIR_NOMBRE: TFIBStringField;
     xSysTercerosDireccionDIR_NOMBRE_2: TFIBStringField;
     xSysTercerosDireccionDIR_NUMERO: TFIBStringField;
     xSysTercerosDireccionDIR_BLOQUE_ESCALERA: TFIBStringField;
     xSysTercerosDireccionDIR_PISO: TFIBStringField;
     xSysTercerosDireccionDIR_PUERTA: TFIBStringField;
     xSysTercerosDireccionDIR_COMPLETA: TFIBStringField;
     xSysTercerosDireccionDIR_LOCALIDAD: TFIBStringField;
     xSysTercerosDireccionDIR_COMPLETA_N: TFIBStringField;
     DSxSysLocalidades: TDataSource;
     xSysLocalidades: TFIBDataSetRO;
     xSysLocalidadesLOCALIDAD: TFIBStringField;
     xSysLocalidadesTITULO: TFIBStringField;
     xSysLocalidadesCODIGO_POSTAL: TFIBStringField;
     xSysLocalidadesPAIS: TFIBStringField;
     xSysLocalidadesPROVINCIA: TFIBStringField;
     DSxSysBancos: TDataSource;
     xSysBancos: TFIBDataSetRO;
     xSysBancosENTIDAD: TFIBStringField;
     xSysBancosTITULO: TFIBStringField;
     xSysTercerosBancoIBAN: TFIBStringField;
     xSysTercerosBancoBIC: TFIBStringField;
     xSysTercerosBancoPAIS: TFIBStringField;
     procedure DMInformacionComercialDestroy(Sender: TObject);
     procedure xConCuentasGesCliAfterOpen(DataSet: TDataSet);
     procedure xConCuentasGesCliBeforeClose(DataSet: TDataSet);
     procedure xEmpClientesAfterOpen(DataSet: TDataSet);
     procedure xEmpClientesBeforeClose(DataSet: TDataSet);
     procedure xSysTercerosAfterOpen(DataSet: TDataSet);
     procedure xSysTercerosBeforeClose(DataSet: TDataSet);
     procedure xSysTercerosBancoAfterOpen(DataSet: TDataSet);
     procedure xSysTercerosBancoBeforeClose(DataSet: TDataSet);
     procedure xSysTercerosDireccionAfterOpen(DataSet: TDataSet);
     procedure xSysTercerosDireccionBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMInformacionComercial : TDMInformacionComercial;

implementation

uses UDMMain;

{$R *.DFM}

procedure TDMInformacionComercial.DMInformacionComercialDestroy(Sender: TObject);
begin
  if DMInformacionComercial.TLocal.InTransaction then
     DMInformacionComercial.TLocal.Commit;
end;

procedure TDMInformacionComercial.xConCuentasGesCliAfterOpen(DataSet: TDataSet);
begin
  xEmpClientes.Close;
  xEmpClientes.Open;
  xEmpAgrupacionesCli.Close;
  xEmpAgrupacionesCli.Open;
  xSysTerceros.Close;
  xSysTerceros.Open;
end;

procedure TDMInformacionComercial.xConCuentasGesCliBeforeClose(DataSet: TDataSet);
begin
  xEmpClientes.Close;
  xEmpAgrupacionesCli.Close;
  xSysTerceros.Close;
end;

procedure TDMInformacionComercial.xEmpClientesAfterOpen(DataSet: TDataSet);
begin
  xVerAgente.Close;
  xVerAgente.Open;
end;

procedure TDMInformacionComercial.xEmpClientesBeforeClose(DataSet: TDataSet);
begin
  xVerAgente.Close;
end;

procedure TDMInformacionComercial.xSysTercerosAfterOpen(DataSet: TDataSet);
begin
  xSysTercerosContacto.Close;
  xSysTercerosContacto.Open;
  xSysTercerosDireccion.Open;
  xSysTercerosBanco.Open;
end;

procedure TDMInformacionComercial.xSysTercerosBeforeClose(DataSet: TDataSet);
begin
  xSysTercerosContacto.Close;
  xSysTercerosDireccion.Close;
  xSysTercerosBanco.Close;
end;

procedure TDMInformacionComercial.xSysTercerosBancoAfterOpen(DataSet: TDataSet);
begin
  xSysBancos.Open;
end;

procedure TDMInformacionComercial.xSysTercerosBancoBeforeClose(DataSet: TDataSet);
begin
  xSysBancos.Close;
end;

procedure TDMInformacionComercial.xSysTercerosDireccionAfterOpen(DataSet: TDataSet);
begin
  xSysLocalidades.Open;
end;

procedure TDMInformacionComercial.xSysTercerosDireccionBeforeClose(DataSet: TDataSet);
begin
  xSysLocalidades.Close;
end;

end.
