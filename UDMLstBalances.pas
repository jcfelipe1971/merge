unit UDMLstBalances;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FR_DSet, FR_DBSet,
  FIBDataSet, FIBDataSetRO, FR_Class, Fr_HYReport;

type
  TDMLstBalances = class(TDataModule)
     TLocal: THYTransaction;
     xCabecera: TFIBDataSetRO;
     xDetalle: TFIBDataSetRO;
     xSubDetalle: TFIBDataSetRO;
     xCabeceraPAIS: TFIBStringField;
     xCabeceraBALANCE: TIntegerField;
     xCabeceraTITULO: TFIBStringField;
     xCabeceraGENERICO: TIntegerField;
     xCabeceraTIPO: TIntegerField;
     xCabeceraORIGEN: TIntegerField;
     xSubDetallePAIS: TFIBStringField;
     xSubDetalleBALANCE: TIntegerField;
     xSubDetalleCLAVE: TFIBStringField;
     xSubDetalleTIPO: TFIBStringField;
     xSubDetalleACUMULA: TFIBStringField;
     xSubDetalleSIGNO: TFIBStringField;
     xDetallePAIS: TFIBStringField;
     xDetalleBALANCE: TIntegerField;
     xDetalleCLAVE: TFIBStringField;
     xDetalleTIPO: TFIBStringField;
     xDetalleGRUPO: TFIBStringField;
     xDetalleORDEN: TIntegerField;
     xDetalleSIGNO: TFIBStringField;
     frDBxCabecera: TfrDBDataSet;
     frDBxDetalle: TfrDBDataSet;
     frDBSubDetalle: TfrDBDataSet;
     DSxCabecera: TDataSource;
     DSxDetalle: TDataSource;
     DSxSubDetalle: TDataSource;
     frBalances: TfrHYReport;
     xDetalleTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frBalancesEnterRect(Memo: TStringList; View: TfrView);
     procedure frBalancesGetValue(const ParName: string; var ParValue: variant);
     procedure xDetalleAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(balance: integer; Clave, Pais, Tipo: string);
  end;

var
  DMLstBalances : TDMLstBalances;
  SW : integer;

implementation

uses UDMMain, UDMListados, UFormGest, UEntorno;

{$R *.dfm}

procedure TDMLstBalances.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstBalances.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstBalances.MostrarListado(Balance: integer; Clave, Pais, Tipo: string);
var
  str : string;
begin
  with xCabecera do
  begin
     Close;
     Params.ByName['PAIS'].AsString := Pais;
     Params.ByName['BALANCE'].AsInteger := Balance;
     Open;
  end;

  with xDetalle do
  begin
     Close;
     Params.ByName['PAIS'].AsString := Pais;
     Params.ByName['BALANCE'].AsInteger := Balance;
     Open;
  end;

  SW := 1;
  DMListados.Cargar(160, '');
  frBalances.LoadFromFIB(REntorno.Formato, str);
  frBalances.PrepareReport;
  frBalances.ShowPreparedReport;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstBalances.frBalancesEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstBalances.frBalancesGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'Descripcion' then
  begin
     if (xSubDetalleSIGNO.AsString = '0') then
        ParValue := 'Comportamiento normal.';
     if (xSubDetalleSIGNO.AsString = '1') then
        ParValue := 'Cambio de signo.';
     if (xSubDetalleSIGNO.AsString = '2') then
        ParValue :=
           'Cambio de signo con puesta a cero.';
     if (xSubDetalleSIGNO.AsString = '3') then
        ParValue :=
           'Mostrar el debe de la cuenta.';
     if (xSubDetalleSIGNO.AsString = '4') then
        ParValue :=
           'Mostrar el haber de la cuenta.';
  end;

  if ParName = 'Moneda' then
     ParValue := REntorno.Moneda;
  if ParName = 'FechaHoy' then
     ParValue := REntorno.FechaTrabSH;
end;

procedure TDMLstBalances.xDetalleAfterOpen(DataSet: TDataSet);
begin
  xSubDetalle.Close;
  xSubDetalle.Open;
end;

end.
