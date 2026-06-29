unit UDMLstMatPeligrosas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, DB, FIBDataSetRO, FR_DSet, FR_DBSet,
  FR_Class, Fr_HYReport, FIBDataSet;

type
  TDMLstMatPeligrosas = class(TDataModule)
     frLstMatPeligrosas: TfrHYReport;
     frDBMatPeligrosas: TfrDBDataSet;
     QMLstMatPeligrosas: TFIBDataSetRO;
     TLocal: TFIBTransaction;
     DSMatPeligrosas: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frLstMatPeligrosasGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(Modo: integer; Fechad, Fechah: TDateTime; Comentario: string; Todos: integer);
  end;

var
  DMLstMatPeligrosas : TDMLstMatPeligrosas;

implementation

uses UDMMain, UDMListados, UEntorno, UFormGest, UUtiles, DateUtils;

{$R *.dfm}

{ TDMLstMatPeligrosas }

procedure TDMLstMatPeligrosas.MostrarListado(Modo: integer; Fechad, Fechah: TDateTime; Comentario: string; Todos: integer);
begin
  DMListados.Normalizar_Desde_Hasta(FechaD, FechaH);

  FechaD := HourIntoDate(FechaD, '00:00:00');
  FechaH := HourIntoDate(FechaH, '23:59:59');

  with QMLstMatPeligrosas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHAD'].AsDateTime := FechaD;
     Params.ByName['FECHAH'].AsDateTime := FechaH;
     Params.ByName['TODOS'].AsInteger := Todos;
     Open;
  end;

  DMListados.DatosInforme(Today, Comentario);
  DMListados.Imprimir(6200, Modo, '', '', frLstMatPeligrosas, nil);
end;

procedure TDMLstMatPeligrosas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstMatPeligrosas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstMatPeligrosas.frLstMatPeligrosasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

end.
