unit UDMPresenciaFichar;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO;

type
  TDMPresenciaFichar = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSxPresencia: TDataSource;
     DSxMarcaje: TDataSource;
     xPresencia: TFIBDataSetRO;
     xPresenciaFECHA: TDateTimeField;
     xPresenciaHORA_ENTRADA: TDateTimeField;
     xPresenciaHORA_SALIDA: TDateTimeField;
     xPresenciaTIEMPO: TDateTimeField;
     xPresenciaDESCRIPCION: TFIBStringField;
     xMarcaje: TFIBDataSetRO;
     xMarcajeFECHA_MARCAJE: TDateTimeField;
     xMarcajeTIPO_MARCAJE: TFIBStringField;
     xMarcajeDESCRIPCION: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function InsertaMarcaje(CodigoTarjeta, TipoMarcaje: string; IdIncidencia: integer): integer;
     procedure RefrescarHistorico(Empleado: integer);
  end;

var
  DMPresenciaFichar : TDMPresenciaFichar;

implementation

uses UDMMain, UEntorno, UUtiles, HYFIBQuery, UDameDato;

{$R *.dfm}

procedure TDMPresenciaFichar.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xPresencia, MascaraN, MascaraI, 'hh:nn');
  xPresenciaFECHA.DisplayFormat := ShortDateFormat;
  AsignaDisplayFormat(xMarcaje, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
end;

function TDMPresenciaFichar.InsertaMarcaje(CodigoTarjeta, TipoMarcaje: string; IdIncidencia: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE INSERTA_MARCAJE_PRESENCIA (:CODIGO_TARJETA, :TIPO_MARCAJE, :ENTRADA, :ID_INCIDENCIA)';
        Params.ByName['CODIGO_TARJETA'].AsString := CodigoTarjeta;
        Params.ByName['TIPO_MARCAJE'].AsString := TipoMarcaje;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_INCIDENCIA'].AsInteger := IdIncidencia;
        ExecQuery;
        Result := FieldByName['ERROR_CODE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPresenciaFichar.RefrescarHistorico(Empleado: integer);
begin
  with xPresencia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['EMPLEADO'].AsInteger := Empleado;
     Open;
  end;

  with xMarcaje do
  begin
     Close;
     Params.ByName['ID_EMPLEADO'].AsInteger := DameIDEmpleado(Empleado);
     Open;
  end;
end;

end.
