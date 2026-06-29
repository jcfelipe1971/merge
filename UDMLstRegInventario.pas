unit UDMLstRegInventario;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, frxClass,
  frxHYReport, DB, FIBDataSetRO, FIBDatabase, UFIBModificados, UHYReport,
  FIBDataSet;

type
  TDMLstRegInventario = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBDataSetRO;
     QMDetalle: TFIBDataSetRO;
     DSQMCabecera: TDataSource;
     DSQMDetalle: TDataSource;
     frxRegInventario: TfrxHYReport;
     frRegInventario: TfrHYReport;
     frDSQMCabecera: TfrDBDataSet;
     frDSQMDetalle: TfrDBDataSet;
     HYReport: THYReport;
     xAlmacen: TFIBDataSetRO;
     DSxAlmacen: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure frRegInventarioGetValue(const ParName: string; var ParValue: variant);
     procedure frxRegInventarioGetValue(const VarName: string; var Value: variant);
     procedure frRegInventarioEnterRect(Memo: TStringList; View: TfrView);
     procedure frxRegInventarioBeforePrint(Sender: TfrxReportComponent);
  private
     { Private declarations }
     SW: integer;
  public
     { Public declarations }
     function MostrarListado(IdReg, Modo, Grupo: integer): string;
  end;

var
  DMLstRegInventario : TDMLstRegInventario;

implementation

uses
  UDMMain, UDMListados, UEntorno, UFormGest;

{$R *.dfm}

procedure TDMLstRegInventario.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstRegInventario.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

function TDMLstRegInventario.MostrarListado(IdReg, Modo, Grupo: integer): string;
var
  Archivo : string;
begin
  with QMCabecera do
  begin
     if Active then
        Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM ART_REG_INVENTARIO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_REG = ?ID_REG ');
     Params.ByName['ID_REG'].AsInteger := IdReg;
     Open;
     Archivo := format('RegStock_%d.pdf', [FieldByName('RIG').AsInteger]);
  end;

  SW := 1;
  DMListados.Imprimir(Grupo, 0, Modo, '', '', frRegInventario, frxRegInventario, HYReport, nil, Archivo);
  Result := Archivo;
end;

procedure TDMLstRegInventario.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xAlmacen.Open;
end;

procedure TDMLstRegInventario.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xAlmacen.Close;
end;

procedure TDMLstRegInventario.frRegInventarioGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'TipoInv') then
     case QMCabecera.FieldByName('TIPO_INV').AsInteger of
        0: ParValue := 'Absoluto';
        1: ParValue := 'Relativo';
        2: ParValue := 'Barrera';
        3: ParValue := 'Barrera (Apertura)';
     end;

  if (ParName = 'TipoPrecio') then
     case QMCabecera.FieldByName('TIPO').AsInteger of
        0: ParValue := 'Precio PMP';
        1: ParValue := 'Precio Configuración';
        2: ParValue := 'Precio Coste';
        3: ParValue := 'Precio Coste Ficha';
     end;

  if (ParName = 'Estado') then
     case QMCabecera.FieldByName('ESTADO').AsInteger of
        0: ParValue := 'Abierto';
        3: ParValue := 'En Proceso';
        5: ParValue := 'Cerrado';
     end;
end;

procedure TDMLstRegInventario.frxRegInventarioGetValue(const VarName: string; var Value: variant);
begin
  frRegInventarioGetValue(VarName, Value);
end;

procedure TDMLstRegInventario.frRegInventarioEnterRect(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstRegInventario.frxRegInventarioBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

end.
