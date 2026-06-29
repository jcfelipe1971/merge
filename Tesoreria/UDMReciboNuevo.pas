unit UDMReciboNuevo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TDMReciboNuevo = class(TDataModule)
     xClientes: TFIBDataSetRO;
     xProveedores: TFIBDataSetRO;
     xAcreedores: TFIBDataSetRO;
     TLocal: THYTransaction;
     procedure DMReciboNuevoCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function DameFormaPago(TipoDoc: string): string;
     function DameMoneda(TipoDoc: string): string;
     procedure CambiaCod_Cli(TipoDoc: string; Cod_cli_pro: integer; var Titulo: string);
     function CreaRecibo(CodCliPro: integer; TipoDoc, FormaPago, Moneda: string; Fecha: TDateTime; Texto, Cuenta: string; Importe: double; Serie, CuentaContrapartida: string; Contabilizar: boolean): integer;
     function DameCtaFormaPago(Serie, FormaPago: string): string;
  end;

var
  DMReciboNuevo : TDMReciboNuevo;

implementation

uses UEntorno, UDMMain, UParam;

{$R *.DFM}

procedure TDMReciboNuevo.DMReciboNuevoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMReciboNuevo.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMReciboNuevo.CambiaCod_Cli(TipoDoc: string; Cod_cli_pro: integer; var Titulo: string);
begin
  if ((TipoDoc = 'FAC') or (TipoDoc = 'ANC')) then
     with xClientes do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CLIENTE'].AsInteger := Cod_cli_pro;
        Open;
        Titulo := FieldByName('TITULO').AsString;
     end;
  if ((TipoDoc = 'FAP') or (TipoDoc = 'ANP')) then
     with xProveedores do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PROVEEDOR'].AsInteger := Cod_cli_pro;
        Open;
        Titulo := FieldByName('TITULO').AsString;
     end;
  if ((TipoDoc = 'FCR') or (TipoDoc = 'ANA')) then
     with xAcreedores do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ACREEDOR'].AsInteger := Cod_cli_pro;
        Open;
        Titulo := FieldByName('TITULO').AsString;
     end;
end;

function TDMReciboNuevo.DameFormaPago(TipoDoc: string): string;
begin
  if ((TipoDoc = 'FAC') or (TipoDoc = 'ANC')) then
     Result := xClientes.FieldByName('FORMA_PAGO').AsString
  else
  if ((TipoDoc = 'FAP') or (TipoDoc = 'ANP')) then
     Result := xProveedores.FieldByName('FORMA_PAGO').AsString
  else
     Result := xAcreedores.FieldByName('FORMA_PAGO').AsString;
end;

function TDMReciboNuevo.DameMoneda(TipoDoc: string): string;
begin
  if ((TipoDoc = 'FAC') or (TipoDoc = 'ANC')) then
     Result := xClientes.FieldByName('MONEDA').AsString
  else
  if ((TipoDoc = 'FAP') or (TipoDoc = 'ANP')) then
     Result := xProveedores.FieldByName('MONEDA').AsString
  else
     Result := xAcreedores.FieldByName('MONEDA').AsString;
end;

function TDMReciboNuevo.CreaRecibo(CodCliPro: integer; TipoDoc, FormaPago, Moneda: string; Fecha: TDateTime; Texto, Cuenta: string; Importe: double; Serie, CuentaContrapartida: string; Contabilizar: boolean): integer;
var
  Mensaje : string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE E_CARTERA_RECIBO_NUEVO ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?COD_CLI_PRO, ?TIPO_DOC, ?FORMAPAGO, ?FECHA, ');
        SQL.Add(' ?TEXTO, ?LIQUIDO, ?ENTRADA, ?CTA_PAGO, ?MONEDA, ?DOC_FECHA, ?SERIE) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['COD_CLI_PRO'].AsInteger := CodCliPro;
        Params.ByName['TIPO_DOC'].AsString := TipoDoc;
        Params.ByName['FORMAPAGO'].AsString := FormaPago;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        Params.ByName['TEXTO'].AsString := Texto;
        Params.ByName['LIQUIDO'].AsFloat := Importe;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['CTA_PAGO'].AsString := Cuenta;
        Params.ByName['MONEDA'].AsString := Moneda;
        Params.ByName['DOC_FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;
        Result := FieldByName['ID_CARTERA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Mensaje := _('Recibo Creado');

  // Contabilizo el recibo según cuentas informadas
  if (Contabilizar) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE C_ASIENTO_RECIBO ');
           SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?FECHA, ?CONCEPTO, ?ENTRADA, ?TIPO_DOC, ');
           SQL.Add(' ?COD_CLI_PRO, ?CUENTA_CONTRAPARTIDA, ?IMPORTE) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           Params.ByName['CONCEPTO'].AsString := Texto;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['TIPO_DOC'].AsString := TipoDoc;
           Params.ByName['COD_CLI_PRO'].AsInteger := CodCliPro;
           Params.ByName['CUENTA_CONTRAPARTIDA'].AsString := CuentaContrapartida;
           Params.ByName['IMPORTE'].AsFloat := Importe;
           ExecQuery;
           Mensaje := Mensaje + #13#10 + Format(_('Asiento Número %d'), [FieldByName['ASIENTO'].AsInteger]);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // PROLASE no quiere este mensaje.
  if (LeeParametro('RECCREA001', Serie) = 'S') then
     ShowMessage(Mensaje);
end;

function TDMReciboNuevo.DameCtaFormaPago(Serie, FormaPago: string): string;
begin
  // Primero busco por serie
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CUENTA_PAGO ');
        SQL.Add(' FROM CON_CUENTAS_GES_FP_EECS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' FORMA_PAGO = :FORMA_PAGO ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FORMA_PAGO'].AsString := FormaPago;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;
        Result := FieldByName['CUENTA_PAGO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si no encuentro tomo la cuenta por defecto
  if (Trim(Result) = '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT CUENTA_PAGO ');
           SQL.Add(' FROM CON_CUENTAS_GES_FP ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' FORMA_PAGO = :FORMA_PAGO ');

           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FORMA_PAGO'].AsString := FormaPago;
           ExecQuery;
           Result := FieldByName['CUENTA_PAGO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
