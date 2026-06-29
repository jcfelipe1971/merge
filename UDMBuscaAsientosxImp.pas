unit UDMBuscaAsientosxImp;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMBuscaAsientosxImp = class(TDataModule)
     xAsientosDet: TFIBTableSet;
     xAsientosDetEMPRESA: TIntegerField;
     xAsientosDetEJERCICIO: TIntegerField;
     xAsientosDetCANAL: TIntegerField;
     xAsientosDetRIC: TIntegerField;
     xAsientosDetLINEA: TIntegerField;
     xAsientosDetCUENTA: TFIBStringField;
     xAsientosDetSIGNO: TFIBStringField;
     xAsientosDetTEXTO: TFIBStringField;
     xAsientosDetIMPORTE: TFloatField;
     xAsientosDetENTRADA: TIntegerField;
     xAsientosDetDOC_NUMERO: TIntegerField;
     xAsientosDetDOC_SERIE: TFIBStringField;
     xAsientosDetDOC_FECHA: TDateTimeField;
     xAsientosDetPUNTEO: TIntegerField;
     xAsientosDetTIPO: TFIBStringField;
     xAsientosDetCargo: TStringField;
     xAsientosDetAbono: TStringField;
     xAsientosDetASIENTO: TIntegerField;
     xAsientosDetFECHA: TDateTimeField;
     DSxAsientosDet: TDataSource;
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure xAsientosDetCargoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xAsientosDetAbonoGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AbrexAsientoDet(Importe, Masmenos: double; TipoAsiento: integer);
     function HayDatosBusqueda: boolean;
  end;

var
  DMBuscaAsientosxImp : TDMBuscaAsientosxImp;

implementation

uses
  UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMBuscaAsientosxImp.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xAsientosDetFECHA.DisplayFormat := ShortDateFormat;
  xAsientosDetDOC_FECHA.DisplayFormat := ShortDateFormat;
  xAsientosDetIMPORTE.DisplayFormat := MascaraN;
end;

procedure TDMBuscaAsientosxImp.AbrexAsientoDet(Importe, Masmenos: double; TipoAsiento: integer);
begin
  with xAsientosDet do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT AP.*, AST.ASIENTO, AST.FECHA FROM CON_CUENTAS_APUNTES AP ');
     SelectSQL.Add(' JOIN CON_CUENTAS_ASIENTOS AST ');
     SelectSQL.Add(' ON AP.EMPRESA = AST.EMPRESA AND AP.EJERCICIO = AST.EJERCICIO AND AP.CANAL = AST.CANAL AND AP.RIC = AST.RIC ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' AP.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' ((AP.EJERCICIO = :EJERCICIO) OR (AP.EJERCICIO = :EJERCICIO - 1)) AND ');
     SelectSQL.Add(' AP.CANAL = :CANAL ');
     if MasMenos = 0 then
        SelectSQL.Add(' AND AP.IMPORTE = ' + FloatToStrDec(Importe, '.'))
     else
     begin
        SelectSQL.Add(' AND AP.IMPORTE >= ' + FloatToStrDec(Importe - masmenos, '.'));
        SelectSQL.Add(' AND AP.IMPORTE <= ' + FloatToStrDec(Importe + masmenos, '.'));
     end;
     case TipoAsiento of
        1: SelectSQL.Add(' AND AP.SIGNO = ''D'' ');
        2: SelectSQL.Add(' AND AP.SIGNO = ''H'' ');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

function TDMBuscaAsientosxImp.HayDatosBusqueda: boolean;
begin
  Result := (xAsientosDet.RecordCount > 0);
end;

procedure TDMBuscaAsientosxImp.xAsientosDetCargoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xAsientosDetSIGNO.AsString = 'D') then
     Text := xAsientosDetCUENTA.AsString;
end;

procedure TDMBuscaAsientosxImp.xAsientosDetAbonoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xAsientosDetSIGNO.AsString = 'H') then
     Text := xAsientosDetCUENTA.AsString;
end;

end.
