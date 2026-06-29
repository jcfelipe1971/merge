unit UDMLstArticulosProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMLstArticulosProv = class(TDataModule)
     frArticulosProv: TfrHYReport;
     frDBArticulosProv: TfrDBDataSet;
     DSQMArticulosProv: TDataSource;
     TLocal: THYTransaction;
     QMArticulosProv: TFIBDataSetRO;
     QMArticulosProvARTICULO: TFIBStringField;
     QMArticulosProvTITULO: TFIBStringField;
     QMProveedores: TFIBTableSet;
     QMProveedoresEMPRESA: TIntegerField;
     QMProveedoresARTICULO: TFIBStringField;
     QMProveedoresPROVEEDOR: TIntegerField;
     QMProveedoresNOMBRE_PROVEEDOR: TFIBStringField;
     QMProveedoresCODIGO_PROVEEDOR: TFIBStringField;
     QMProveedoresID_A: TIntegerField;
     DSQMProveedores: TDataSource;
     frDBProveedores: TfrDBDataSet;
     QMArticulosProvID_A: TIntegerField;
     QMArticulosProvEMPRESA: TIntegerField;
     procedure frArticulosProvGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstFacturaDestroy(Sender: TObject);
     procedure frArticulosProvEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstFacturaProvArtCreate(Sender: TObject);
     procedure QMArticulosProvAfterOpen(DataSet: TDataSet);
     procedure QMArticulosProvBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     LocalMascaraN, LocalMascaraL: string;
  public
     procedure MostrarListadoFiltrado(Modo: byte; SWFil: integer);
  end;

var
  DMLstArticulosProv : TDMLstArticulosProv;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest;

{$R *.DFM}

procedure TDMLstArticulosProv.DMLstFacturaProvArtCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  LocalMascaraL := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);
end;

procedure TDMLstArticulosProv.DMLstFacturaDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstArticulosProv.frArticulosProvGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstArticulosProv.frArticulosProvEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraL]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraL;
  end;
end;

procedure TDMLstArticulosProv.MostrarListadoFiltrado(Modo: byte; SWFil: integer);
begin
  with QMArticulosProv do
  begin
     Close;
     if (SWFIL = 0) then
        DMMain.FiltraRO(QMArticulosProv, '10000', False);
     Open;
  end;

  DMListados.Imprimir(9013, 0, Modo, '', '', frArticulosProv, nil, nil, nil);
end;

procedure TDMLstArticulosProv.QMArticulosProvAfterOpen(DataSet: TDataSet);
begin
  QMProveedores.Open;
end;

procedure TDMLstArticulosProv.QMArticulosProvBeforeClose(DataSet: TDataSet);
begin
  QMProveedores.Close;
end;

end.
