unit UProDMLstOfertasV;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FR_DSet, FR_DBSet,
  FR_Class, Fr_HYReport, FIBDatabase, FIBQuery;

type
  TProDMLstOfertasV = class(TDataModule)
     frListadoRelOfe: TfrHYReport;
     frDBListadoE: TfrDBDataSet;
     QMLstFase: TFIBDataSetRO;
     DSLstFase: TDataSource;
     DSLstMateriales: TDataSource;
     DSLstTareas: TDataSource;
     QMLstMateriales: TFIBDataSetRO;
     QMLstTareas: TFIBDataSetRO;
     DSLstEscandallo: TDataSource;
     frDBListadoFase: TfrDBDataSet;
     frDBListadoMate: TfrDBDataSet;
     frDBListadoTareas: TfrDBDataSet;
     xEscandallo: TFIBDataSetRO;
     DSEscandallo: TDataSource;
     TLocal: TFIBTransaction;
     QMLstOfertaV: TFIBDataSetRO;
     DSLstOfertaV: TDataSource;
     QMLstEscandallo: TFIBDataSetRO;
     frDBListadoOfertaV: TfrDBDataSet;
     frListadoRelOfeCli: TfrHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMLstOfertaVAfterOpen(DataSet: TDataSet);
     procedure QMLstEscandalloAfterOpen(DataSet: TDataSet);
     procedure QMLstFaseAfterOpen(DataSet: TDataSet);
     procedure frListadoRelOfeGetValue(const ParName: string; var ParValue: variant);

  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListado(modo: integer; tipus_doc: string; tllistat: integer);
  end;

var
  ProDMLstOfertasV : TProDMLstOfertasV;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UDMofertas, UDMLstOfertas;

{$R *.dfm}

{ TProDMLstofertasV }

procedure TProDMLstOfertasV.MostrarListado(modo: integer; tipus_doc: string; tllistat: integer);
begin
  QMLstOfertaV.Close;
  QMLstOfertaV.Params.ByName['id_s'].AsInteger := DMOfertas.QMCabecera.FieldByName('IDS').AsInteger;
  QMLstOfertaV.Open;

  //Llistat intern
  if (tllistat = 1) then
     DMListados.Imprimir(8028, modo, '', '', frListadoRelOfe, nil)
  else if (tllistat = 2) then
  begin
     with DMLstOfertas.QMCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := DMOfertas.QMCabecera.FieldByName('IDS').AsInteger;
        Open;
     end;

     with DMLstOfertas.QMDetalle do
     begin
        Close;
        Open;
     end;
     with DMLstOfertas.xCliente do
     begin
        Close;
        Open;
     end;

     with DMLstOfertas.xDireccion_Cliente do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := DMLstOfertas.QMCabecera.FieldByName('TERCERO').AsInteger;
        Params.ByName['DIRECCION'].AsInteger := DMLstOfertas.QMCabecera.FieldByName('DIRECCION').AsInteger;
        Open;
     end;

     DMListados.Imprimir(8029, modo, '', '', frListadoRelOfeCli, nil);
  end;
end;


procedure TProDMLstOfertasV.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMListados, DMListados);
  AbreData(TDMLstOfertas, DMLstOfertas);

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMLstOfertasV.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMLstOfertas);
  CierraData(DMListados);
end;


procedure TProDMLstOfertasV.QMLstOfertaVAfterOpen(DataSet: TDataSet);
begin
  QmLstEscandallo.Open;
end;

procedure TProDMLstOfertasV.QMLstEscandalloAfterOpen(DataSet: TDataSet);
begin
  QMLstFase.Open;
end;

procedure TProDMLstOfertasV.QMLstFaseAfterOpen(DataSet: TDataSet);
begin
  QMLstMateriales.Open;
  QMlstTareas.Open;
end;


procedure TProDMLstOfertasV.frListadoRelOfeGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

end.
