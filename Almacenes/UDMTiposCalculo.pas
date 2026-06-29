unit UDMTiposCalculo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMTiposCalculo = class(TDataModule)
     QMTiposCalculo: TFIBTableSet;
     DSQMTiposCalculo: TDataSource;
     TLocal: THYTransaction;
     xTipoRedondeo: TFIBDataSetRO;
     xTipoRedondeoTITULO: TFIBStringField;
     QMTiposCalculoEMPRESA: TIntegerField;
     QMTiposCalculoCALCULO: TIntegerField;
     QMTiposCalculoTITULO: TFIBStringField;
     QMTiposCalculoTIPO_REDONDEO: TIntegerField;
     QMTiposCalculoCOMISION: TFloatField;
     QMTiposCalculoCARGO_PORCENTUAL: TFloatField;
     QMTiposCalculoCARGO_LINEAL: TFloatField;
     QMTiposCalculoDESCUENTO: TFloatField;
     QMTiposCalculoCARGO_COMERCIAL: TFloatField;
     QMTiposCalculoPRECIO_PUNTOS: TFloatField;
     QMTiposCalculoTIPO_PRECIO_BASE: TIntegerField;
     xTiposPrecioBase: TFIBDataSetRO;
     DSxTipoRedondeo: TDataSource;
     DSxTiposPrecioBase: TDataSource;
     xTiposPrecioBaseTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     QMTiposCalculoFACTOR: TFloatField;
     procedure DMTarifasCreate(Sender: TObject);
     procedure QMTiposCalculoNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMTiposCalculoBeforePost(DataSet: TDataSet);
     procedure QMTiposCalculoAfterOpen(DataSet: TDataSet);
     procedure QMTiposCalculoTIPO_REDONDEOChange(Sender: TField);
     procedure QMTiposCalculoTIPO_PRECIO_BASEChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTiposCalculo : TDMTiposCalculo;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMTiposCalculo.DMTarifasCreate(Sender: TObject);
var
  LocalMascaraL : string;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMTiposCalculo, '10000', True);

  QMTiposCalculoCOMISION.DisplayFormat := MascaraP;
  QMTiposCalculoCARGO_PORCENTUAL.DisplayFormat := MascaraP;
  QMTiposCalculoDESCUENTO.DisplayFormat := MascaraP;
  QMTiposCalculoCARGO_COMERCIAL.DisplayFormat := MascaraP;
  QMTiposCalculoFACTOR.DisplayFormat := '0.000';

  LocalMascaraL := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 0);
  QMTiposCalculoCARGO_LINEAL.DisplayFormat := LocalMascaraL;
  QMTiposCalculoPRECIO_PUNTOS.DisplayFormat := LocalMascaraL;
end;

procedure TDMTiposCalculo.QMTiposCalculoNewRecord(DataSet: TDataSet);
begin
  QMTiposCalculoEMPRESA.AsInteger := REntorno.Empresa;
  QMTiposCalculoTIPO_REDONDEO.AsInteger := 0;
  QMTiposCalculoCOMISION.AsFloat := 0;
  QMTiposCalculoCARGO_PORCENTUAL.AsFloat := 0;
  QMTiposCalculoCARGO_LINEAL.AsFloat := 0;
  QMTiposCalculoDESCUENTO.AsFloat := 0;
  QMTiposCalculoCARGO_COMERCIAL.AsFloat := 0;
  QMTiposCalculoPRECIO_PUNTOS.AsFloat := 0;
  QMTiposCalculoTIPO_PRECIO_BASE.AsInteger := 0;
  QMTiposCalculoFACTOR.AsFloat := 1;
end;

procedure TDMTiposCalculo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMTiposCalculo.QMTiposCalculoBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and
     ((QMTiposCalculoCALCULO.AsInteger = 0) or (QMTiposCalculoCALCULO.IsNull))) then
     QMTiposCalculoCALCULO.AsInteger := DMMain.Contador_E('XCT');
end;

procedure TDMTiposCalculo.QMTiposCalculoAfterOpen(DataSet: TDataSet);
begin
  xTipoRedondeo.Open;
  xTiposPrecioBase.Open;
end;

procedure TDMTiposCalculo.QMTiposCalculoTIPO_REDONDEOChange(Sender: TField);
begin
  with xTipoRedondeo do
  begin
     Close;
     Open;
  end;
end;

procedure TDMTiposCalculo.QMTiposCalculoTIPO_PRECIO_BASEChange(Sender: TField);
begin
  xTiposPrecioBase.Close;
  xTiposPrecioBase.Open;
end;

end.
