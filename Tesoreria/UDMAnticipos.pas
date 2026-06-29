unit UDMAnticipos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  FR_Class, Fr_HYReport, FIBDataSetRO, HYFIBQuery;

type
  TDMAnticipos = class(TDataModule)
     TLocal: THYTransaction;
     QMAnticipos: TFIBTableSet;
     QMAnticiposEMPRESA: TIntegerField;
     QMAnticiposEJERCICIO: TIntegerField;
     QMAnticiposCANAL: TIntegerField;
     QMAnticiposANTICIPO: TIntegerField;
     QMAnticiposTIPO_TERCERO: TFIBStringField;
     QMAnticiposCOD_CLI_PRO: TIntegerField;
     QMAnticiposCUENTA_CLI_PRO: TFIBStringField;
     QMAnticiposC_CONTRAPARTIDA: TFIBStringField;
     QMAnticiposCANTIDAD: TFloatField;
     QMAnticiposCONTABILIZAR: TIntegerField;
     QMAnticiposREGISTRO: TIntegerField;
     QMAnticiposASIENTO: TIntegerField;
     QMAnticiposFECHA: TDateTimeField;
     DSQMAnticipos: TDataSource;
     xClientes: TFIBDataSetRO;
     xCuenta: TFIBDataSetRO;
     xProveedores: TFIBDataSetRO;
     xAcreedores: TFIBDataSetRO;
     DSxClientes: TDataSource;
     DSxProveedores: TDataSource;
     DSxAcreedores: TDataSource;
     DSxCuenta: TDataSource;
     QMAnticiposTIPO_ASIENTO: TFIBStringField; {dji lrk kri diarios}
     QMAnticiposASIENTO_VISIBLE: TStringField;
     TUpdate: THYTransaction;
     QSaldo: TFIBDataSetRO;
     DSQSaldo: TDataSource;
     QSaldoSALDO: TFloatField;
     QMAnticiposCUENTA_CLI_PRO_PGC: TIntegerField;
     QMAnticiposC_CONTRAPARTIDA_PGC: TIntegerField;
     QMAnticiposENTRADA: TIntegerField;
     QMAnticiposID_CARTERA: TIntegerField;
     QMAnticiposCREA_CARTERA_NEGATIVA: TIntegerField;
     procedure DMAnticiposCreate(Sender: TObject);
     procedure QMAnticiposNewRecord(DataSet: TDataSet);
     procedure QMAnticiposCOD_CLI_PROChange(Sender: TField);
     procedure QMAnticiposC_CONTRAPARTIDAChange(Sender: TField);
     procedure QMAnticiposAfterOpen(DataSet: TDataSet);
     procedure QMAnticiposTIPO_ASIENTOChange(Sender: TField);
     procedure QMAnticiposASIENTO_VISIBLEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMAnticiposBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     TipoTercero: string;
     procedure CambiaTitulo(CodCliPro: integer);
  public
     { Public declarations }
     procedure Filtra(Tipo: string);
     procedure Contabilizar(Estado: smallint);
     function Enlace: boolean;
  end;

var
  DMAnticipos : TDMAnticipos;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMAnticipos.DMAnticiposCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMAnticiposCANTIDAD.DisplayFormat := MascaraN;
  QSaldoSALDO.DisplayFormat := MascaraN;

  REntorno.Asiento_ANT := 'ANT';
end;

procedure TDMAnticipos.Filtra(Tipo: string);
begin
  TipoTercero := Tipo;
  with QMAnticipos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO_TERCERO'].AsString := Tipo;
     Open;
  end;
  CambiaTitulo(QMAnticiposCOD_CLI_PRO.AsInteger);
end;

procedure TDMAnticipos.QMAnticiposNewRecord(DataSet: TDataSet);
var
  Contador : string;
begin
  if TipoTercero = 'CLI' then
     Contador := 'ANC'
  else
  if TipoTercero = 'PRO' then
     Contador := 'ANP'
  else
  if TipoTercero = 'ACR' then
     Contador := 'ANA';

  QMAnticiposEMPRESA.AsInteger := REntorno.Empresa;
  QMAnticiposEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMAnticiposCANAL.AsInteger := REntorno.Canal;
  QMAnticiposANTICIPO.AsInteger := DMMain.Contador_EEC(Contador);
  QMAnticiposTIPO_TERCERO.AsString := TipoTercero;
  QMAnticiposCONTABILIZAR.AsInteger := 0;
  QMAnticiposFECHA.AsDateTime := REntorno.FechaTrab;
  QMAnticiposTipo_Asiento.AsString := REntorno.Asiento_ANT; {dji lrk kri diarios}
  QMAnticiposENTRADA.AsInteger := REntorno.Entrada;
  QMAnticiposCREA_CARTERA_NEGATIVA.AsInteger := DMMain.EstadoKri(419);
end;

procedure TDMAnticipos.CambiaTitulo(CodCliPro: integer);
begin
  xClientes.Close;
  xProveedores.Close;
  xAcreedores.Close;
  if TipoTercero = 'CLI' then
  begin
     xClientes.Params.ByName['COD_CLI_PRO'].AsInteger := CodCliPro;
     xClientes.Open;
  end;
  if TipoTercero = 'PRO' then
  begin
     xProveedores.Params.ByName['COD_CLI_PRO'].AsInteger := CodCliPro;
     xProveedores.Open;
  end;
  if TipoTercero = 'ACR' then
  begin
     xAcreedores.Params.ByName['COD_CLI_PRO'].AsInteger := CodCliPro;
     xAcreedores.Open;
  end;
end;

procedure TDMAnticipos.Contabilizar(Estado: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_CARTERA_ANTICIPOS ');
        SQL.Add(' SET ');
        SQL.Add(' CONTABILIZAR = ?ESTADO, ');
        SQL.Add(' ENTRADA = ?ENTRADA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' TIPO_TERCERO = ?TIPO_TERCERO AND ');
        SQL.Add(' ANTICIPO = ?ANTICIPO ');
        Params.ByName['EMPRESA'].AsInteger := QMAnticiposEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAnticiposEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAnticiposCANAL.AsInteger;
        Params.ByName['TIPO_TERCERO'].AsString := QMAnticiposTIPO_TERCERO.AsString;
        Params.ByName['ANTICIPO'].AsInteger := QMAnticiposANTICIPO.AsInteger;
        Params.ByName['ESTADO'].AsInteger := Estado;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMAnticipos.Refresh;
end;

procedure TDMAnticipos.QMAnticiposCOD_CLI_PROChange(Sender: TField);
begin
  CambiaTitulo(Sender.AsInteger);
end;

procedure TDMAnticipos.QMAnticiposC_CONTRAPARTIDAChange(Sender: TField);
begin
  xCuenta.Close;
  xCuenta.Params.ByName['C_CONTRAPARTIDA'].AsString := Sender.AsString;
  xCuenta.Open;
end;

procedure TDMAnticipos.QMAnticiposAfterOpen(DataSet: TDataSet);
begin
  xClientes.Close;
  xProveedores.Close;
  xAcreedores.Close;
  if (QMAnticiposTIPO_TERCERO.AsString = 'CLI') then
     xClientes.Open;
  if (QMAnticiposTIPO_TERCERO.AsString = 'PRO') then
     xProveedores.Open;
  if (QMAnticiposTIPO_TERCERO.AsString = 'ACR') then
     xAcreedores.Open;
  xCuenta.Close;
  xCuenta.Open;
  QSaldo.Open;
end;

procedure TDMAnticipos.QMAnticiposTIPO_ASIENTOChange(Sender: TField);
begin
  {dji lrk kri diarios}
  REntorno.Asiento_ANT := Sender.AsString;
end;

function TDMAnticipos.Enlace: boolean;
begin
  Result := (not (QMAnticipos.State in [dsEdit, dsInsert]) and (QMAnticiposCONTABILIZAR.AsInteger = 1));
end;

procedure TDMAnticipos.QMAnticiposASIENTO_VISIBLEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMAnticiposCONTABILIZAR.AsInteger = 1 then
     Text := QMAnticiposASIENTO.AsString
  else
     Text := '';
end;

procedure TDMAnticipos.QMAnticiposBeforeClose(DataSet: TDataSet);
begin
  xClientes.Close;
  xProveedores.Close;
  xAcreedores.Close;
  xCuenta.Close;
  QSaldo.Close;
end;

end.
