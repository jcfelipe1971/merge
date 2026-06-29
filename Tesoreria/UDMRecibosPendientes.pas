unit UDMRecibosPendientes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO;

type
  TDMRecibosPendientes = class(TDataModule)
     TLocal: THYTransaction;
     DSxListarRemesa: TDataSource;
     xListarRemesa: TFIBTableSet;
     xListarRemesaEMPRESA: TIntegerField;
     xListarRemesaEJERCICIO: TIntegerField;
     xListarRemesaCANAL: TIntegerField;
     xListarRemesaSIGNO: TFIBStringField;
     xListarRemesaREGISTRO: TIntegerField;
     xListarRemesaFECHA_REGISTRO: TDateTimeField;
     xListarRemesaCUENTA: TFIBStringField;
     xListarRemesaTITULO_CUENTA: TFIBStringField;
     xListarRemesaDOC_NUMERO: TIntegerField;
     xListarRemesaDOC_SERIE: TFIBStringField;
     xListarRemesaDOC_FECHA: TDateTimeField;
     xListarRemesaDOC_TIPO: TFIBStringField;
     xListarRemesaVENCIMIENTO: TDateTimeField;
     xListarRemesaLIQUIDO: TFloatField;
     xListarRemesaRECIBIDO: TIntegerField;
     xListarRemesaPAGADO: TIntegerField;
     xListarRemesaMONEDA: TFIBStringField;
     xListarRemesaLIQUIDO_MONEDA: TFloatField;
     xRevImpagados: TFIBDataSetRO;
     xRevImpagadosEJERCICIO: TIntegerField;
     xRevImpagadosREGISTRO: TIntegerField;
     xRevImpagadosDOC_SERIE: TFIBStringField;
     xRevImpagadosFECHA_REGISTRO: TDateTimeField;
     xRevImpagadosEJERCICIO_ORIGEN: TIntegerField;
     xRevImpagadosCANAL_ORIGEN: TIntegerField;
     xRevImpagadosRECIBO_ORIGEN: TIntegerField;
     xRevImpagadosFECHA_ULT_IMPAGO: TDateTimeField;
     xRevImpagadosNUM_IMPAGOS: TIntegerField;
     xRevImpagadosGASTOS: TFloatField;
     DSxRevImpagados: TDataSource;
     TUpdate: THYTransaction;
     DSxListarRemesaTotales: TDataSource;
     xListarRemesaTotales: TFIBDataSetRO;
     xListarRemesaTotalesLIQUIDO: TFloatField;
     procedure DMRecibosPendientesCreate(Sender: TObject);
     procedure xListarRemesanuevo_liquidoGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     sw: integer;
  public
     { Public declarations }
     Pagado: integer;
     procedure Filtra(Desde, Signo, Tipo: string; Ejercicio: integer);
     procedure DameRegistro(var Registro: integer; var Ok: boolean; var Ejercicio: integer);
     function HayDetalle: boolean;
     procedure FiltraClientes(Empresa, Canal, Control: integer; Cuenta: string);
     procedure FiltraImpagados(Ejercicio: integer; Cuenta: string);
     procedure RefrescaTotales;
  end;

var
  DMRecibosPendientes : TDMRecibosPendientes;

implementation

{$R *.DFM}

uses UDMMain, UEntorno;

procedure TDMRecibosPendientes.DMRecibosPendientesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Pagado := 1;  // Por defecto, mostrar todos los recibos
  xListarRemesaLIQUIDO.DisplayFormat := MascaraN;
  xListarRemesaTotalesLIQUIDO.DisplayFormat := MascaraN;

  sw := 0;
end;

procedure TDMRecibosPendientes.Filtra(Desde, Signo, Tipo: string; Ejercicio: integer);
var
  Tipo2, Tipo3 : string;
begin
  if Tipo = 'FAC' then
  begin
     Tipo2 := 'AGC';
     Tipo3 := 'NRC';
  end;
  if (Tipo = 'FAP') then
  begin
     Tipo2 := 'AGP';
     Tipo3 := 'NRP';
  end;
  if (Tipo = 'FCR') then
  begin
     Tipo2 := 'AGA';
     Tipo3 := 'NRA';
  end;
  if (Desde = '') then
  begin
     xListarRemesa.Close;
     xListarRemesaTotales.Close;
     Exit;
  end;

  if (sw = 0) then
  begin
     with xListarRemesa do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := Signo;
        Params.ByName['DCUENTA'].AsString := Desde;
        Params.ByName['PAGADO'].AsInteger := Pagado;
        Params.ByName['DOC_TIPO'].AsString := Tipo;
        Params.ByName['DOC_TIPO2'].AsString := Tipo2;
        Params.ByName['DOC_TIPO3'].AsString := Tipo3;
        Open;
     end;

     with xListarRemesaTotales do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := Signo;
        Params.ByName['DCUENTA'].AsString := Desde;
        Params.ByName['PAGADO'].AsInteger := Pagado;
        Params.ByName['DOC_TIPO'].AsString := Tipo;
        Params.ByName['DOC_TIPO2'].AsString := Tipo2;
        Params.ByName['DOC_TIPO3'].AsString := Tipo3;
        Open;
     end;
  end
  else
  begin
     xListarRemesa.Open;
     xListarRemesaTotales.Open;
  end;
end;

procedure TDMRecibosPendientes.DameRegistro(var Registro: integer; var Ok: boolean; var Ejercicio: integer);
begin
  Registro := xListarRemesaREGISTRO.AsInteger;
  Ejercicio := xListarRemesaEJERCICIO.AsInteger;
  Ok := HayDetalle;
end;

procedure TDMRecibosPendientes.xListarRemesanuevo_liquidoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(xListarRemesaMONEDA.AsString, 1),
     xListarRemesaLIQUIDO.AsFloat);
end;

function TDMRecibosPendientes.HayDetalle: boolean;
begin
  Result := (xListarRemesa.RecordCount > 0);
end;

procedure TDMRecibosPendientes.FiltraImpagados(Ejercicio: integer; Cuenta: string);
begin
  with xRevImpagados do
  begin
     Close;
     Params.ByName['EMP'].AsInteger := REntorno.Empresa;
     Params.ByName['CAN'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Cuenta;
     Open;
  end;
end;

procedure TDMRecibosPendientes.FiltraClientes(Empresa, Canal, Control: integer; Cuenta: string);
begin
  Cuenta := Copy(Cuenta, 1, 15);

  with xListarRemesa do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' select * from ver_lista_cartera ');
     SelectSQL.Add(' where ');
     SelectSQL.Add(' empresa = ' + IntToStr(Empresa));
     SelectSQL.Add(' and canal = ' + IntToStr(Canal));
     case Control of
        0: // Recibos no cobrados clientes
        begin
           SelectSQL.Add(' and signo = ''C'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 1 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
           // ' and vencimiento <= '''+ formatDateTime('mm/dd/yyyy',REntorno.FechaTrab)+'''';
        end;
        1: // Recibos pendientes clientes
        begin
           SelectSQL.Add(' and signo = ''C'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 0 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
        end;
        2: // Recibos no cobrados proveedores
        begin
           SelectSQL.Add(' and signo = ''P'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 1 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
           // ' and vencimiento <= '''+ formatDateTime('mm/dd/yyyy',REntorno.FechaTrab)+'''';
        end;
        3: // Recibos pendientes proveedores
        begin
           SelectSQL.Add(' and signo = ''P'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 0 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
        end;
        4: // Recibos no cobrados acreedores
        begin
           SelectSQL.Add(' and signo = ''P'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 1 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
           // ' and vencimiento <= '''+ formatDateTime('mm/dd/yyyy',REntorno.FechaTrab)+'''';
        end;
        5: // Recibos pendientes acreedores
        begin
           SelectSQL.Add(' and signo = ''P'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 0 ');
           // SelectSQL.Add(' and visible = 1 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
        end;
     end;

     Open;
  end;

  with xListarRemesaTotales do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' select sum(liquido) as liquido from ver_lista_cartera ');
     SelectSQL.Add(' where ');
     SelectSQL.Add(' empresa = ' + IntToStr(Empresa));
     SelectSQL.Add(' and canal = ' + IntToStr(Canal));
     case Control of
        0: // Recibos no cobrados clientes
        begin
           SelectSQL.Add(' and signo = ''C'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 1 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
           // ' and vencimiento <= '''+ formatDateTime('mm/dd/yyyy',REntorno.FechaTrab)+'''';
        end;
        1: // Recibos pendientes clientes
        begin
           SelectSQL.Add(' and signo = ''C'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 0 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
        end;
        2: // Recibos no cobrados proveedores
        begin
           SelectSQL.Add(' and signo = ''P'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 1 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
           // ' and vencimiento <= '''+ formatDateTime('mm/dd/yyyy',REntorno.FechaTrab)+'''';
        end;
        3: // Recibos pendientes proveedores
        begin
           SelectSQL.Add(' and signo = ''P'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 0 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
        end;
        4: // Recibos no cobrados acreedores
        begin
           SelectSQL.Add(' and signo = ''P'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 1 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
           // ' and vencimiento <= '''+ formatDateTime('mm/dd/yyyy',REntorno.FechaTrab)+'''';
        end;
        5: // Recibos pendientes acreedores
        begin
           SelectSQL.Add(' and signo = ''P'' and ');
           SelectSQL.Add(' cuenta = ''' + Cuenta + ''' and ');
           SelectSQL.Add(' pagado = 0 and ');
           SelectSQL.Add(' recibido = 0 ');
           // SelectSQL.Add(' and visible = 1 ');
           // ' and doc_serie = '''+REntorno.Serie+'''';
        end;
     end;

     Open;
  end;

  sw := 1;
end;

procedure TDMRecibosPendientes.RefrescaTotales;
begin
  with xListarRemesaTotales do
  begin
     if Active then
        Close;
     Open;
  end;
end;

end.
