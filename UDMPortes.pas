unit UDMPortes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TDMPortes = class(TDataModule)
     TLocal: THYTransaction;
     QMPortes: TFIBTableSet;
     QMPortesEMPRESA: TIntegerField;
     QMPortesEJERCICIO: TIntegerField;
     QMPortesCANAL: TIntegerField;
     QMPortesTIPO: TIntegerField;
     QMPortesTITULO: TFIBStringField;
     QMPortesCTA_COMPRAS: TFIBStringField;
     QMPortesCTA_DEV_COMPRAS: TFIBStringField;
     QMPortesCTA_VENTAS: TFIBStringField;
     QMPortesCTA_DEV_VENTAS: TFIBStringField;
     QMPortesPAIS: TFIBStringField;
     QMPortesTIPO_IVA: TIntegerField;
     DSQMPortes: TDataSource;
     QMPortesIdiomas: TFIBTableSet;
     QMPortesIdiomasEMPRESA: TIntegerField;
     QMPortesIdiomasEJERCICIO: TIntegerField;
     QMPortesIdiomasCANAL: TIntegerField;
     QMPortesIdiomasTIPO: TIntegerField;
     QMPortesIdiomasIDIOMA: TFIBStringField;
     QMPortesIdiomasTITULO: TFIBStringField;
     DSQMPortesIdiomas: TDataSource;
     xTipoIva: TFIBDataSetRO;
     xTipoIvaP_IVA: TFloatField;
     xTipoIvaP_RECARGO: TFloatField;
     xTipoIvaTITULO: TFIBStringField;
     DSxTipoIva: TDataSource;
     xCta_Comp: TFIBDataSetRO;
     DSxCta_Comp: TDataSource;
     xCta_Vent: TFIBDataSetRO;
     DSxCta_Vent: TDataSource;
     xCta_Dev_Comp: TFIBDataSetRO;
     DSxCta_Dev_Comp: TDataSource;
     DSxCta_Dev_Vent: TDataSource;
     xCta_Dev_Vent: TFIBDataSetRO;
     QMSeries: TFIBTableSet;
     DSQMSeries: TDataSource;
     QMSeriesEMPRESA: TIntegerField;
     QMSeriesEJERCICIO: TIntegerField;
     QMSeriesCANAL: TIntegerField;
     QMSeriesSERIE: TFIBStringField;
     QMSeriesTIPO: TIntegerField;
     QMSeriesCTA_COMPRAS: TFIBStringField;
     QMSeriesCTA_DEV_COMPRAS: TFIBStringField;
     QMSeriesCTA_VENTAS: TFIBStringField;
     QMSeriesCTA_DEV_VENTAS: TFIBStringField;
     xSeries: TFIBDataSetRO;
     DSxSeries: TDataSource;
     TUpdate: THYTransaction;
     procedure DMFormasPagoCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure GrabaIdioma(DataSet: TDataSet);
     procedure QMPortesNewRecord(DataSet: TDataSet);
     procedure QMPortesIdiomasNewRecord(DataSet: TDataSet);
     procedure QMPortesTIPO_IVAChange(Sender: TField);
     procedure QMPortesCTA_COMPRASChange(Sender: TField);
     procedure QMPortesCTA_VENTASChange(Sender: TField);
     procedure QMPortesCTA_DEV_COMPRASChange(Sender: TField);
     procedure QMPortesCTA_DEV_VENTASChange(Sender: TField);
     procedure QMSeriesSERIEChange(Sender: TField);
     procedure QMSeriesNewRecord(DataSet: TDataSet);
     procedure QMSeriesCTA_COMPRASChange(Sender: TField);
     procedure QMSeriesCTA_DEV_COMPRASChange(Sender: TField);
     procedure QMSeriesCTA_VENTASChange(Sender: TField);
     procedure QMSeriesCTA_DEV_VENTASChange(Sender: TField);
  private
     { Private declarations }
     procedure EstableceMascaras;
     procedure AbrePortes;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     // Cerrar Tablas por Pestañas
     procedure CerrarFicha;
     procedure CerrarIdiomas;
     procedure CerrarSerie;
     // Abrir Tablas por Pestañas
     procedure AbrirSeries;
     procedure AbrirFicha;
     procedure AbrirIdioma;
  end;

var
  DMPortes : TDMPortes;

implementation

uses UDMMain, UFBusca, UEntorno;

{$R *.DFM}

procedure TDMPortes.DMFormasPagoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  EstableceMascaras;
  AbrePortes;
end;

procedure TDMPortes.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPortes, '11100');
end;

procedure TDMPortes.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMPortes.GrabaIdioma(DataSet: TDataSet);
begin
  if (not TLocal.InTransaction) then
     TLocal.CommitRetaining;
end;

procedure TDMPortes.QMPortesNewRecord(DataSet: TDataSet);
begin
  raise Exception.Create(_('No se puede dar de alta un nuevo porte.'));
  DataSet.Cancel;
end;

procedure TDMPortes.QMPortesIdiomasNewRecord(DataSet: TDataSet);
begin
  QMPortesIdiomasEMPRESA.AsInteger := QMPortesEMPRESA.AsInteger;
  QMPortesIdiomasEJERCICIO.AsInteger := QMPortesEJERCICIO.AsInteger;
  QMPortesIdiomasCANAL.AsInteger := QMPortesCANAL.AsInteger;
  QMPortesIdiomasTIPO.AsInteger := QMPortesTIPO.AsInteger;
end;

procedure TDMPortes.EstableceMascaras;
begin
  xTipoIvaP_IVA.DisplayFormat := MascaraP;
  xTipoIvaP_RECARGO.DisplayFormat := MascaraP;
end;

procedure TDMPortes.QMPortesTIPO_IVAChange(Sender: TField);
begin
  with xTipoIva do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Params.ByName['TIPO_IVA'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

procedure TDMPortes.QMPortesCTA_COMPRASChange(Sender: TField);
begin
  with xCta_Comp do
  begin
     Close;
     Params.ByName['CTA_COMPRAS'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TDMPortes.QMPortesCTA_VENTASChange(Sender: TField);
begin
  with xCta_Vent do
  begin
     Close;
     Params.ByName['CTA_VENTAS'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TDMPortes.QMPortesCTA_DEV_COMPRASChange(Sender: TField);
begin
  xCta_Dev_Comp.Close;
  xCta_Dev_Comp.Open;
end;

procedure TDMPortes.QMPortesCTA_DEV_VENTASChange(Sender: TField);
begin
  xCta_Dev_Vent.Close;
  xCta_Dev_Vent.Open;
end;

procedure TDMPortes.QMSeriesSERIEChange(Sender: TField);
begin
  xSeries.Close;
  xSeries.Open;
end;

procedure TDMPortes.AbrirFicha;
begin
  // Asignamos los DS
  xCta_Comp.DataSource := DSQMPortes;
  xCta_Vent.DataSource := DSQMPortes;
  xCta_Dev_Vent.DataSource := DSQMPortes;
  xCta_Dev_Comp.DataSource := DSQMPortes;
  xTipoIVA.Close;
  xTipoIVA.Open;
  xCta_Comp.Open;
  xCta_Vent.Open;
  xCta_Dev_Comp.Open;
  xCta_Dev_Vent.Open;
end;

procedure TDMPortes.AbrirSeries;
begin
  // Asignamos los DS
  xCta_Comp.DataSource := DSQMSeries;
  xCta_Vent.DataSource := DSQMSeries;
  xCta_Dev_Vent.DataSource := DSQMSeries;
  xCta_Dev_Comp.DataSource := DSQMSeries;
  QMSeries.Open;
  xSeries.Open;
  xCta_Comp.Open;
  xCta_Vent.Open;
  xCta_Dev_Comp.Open;
  xCta_Dev_Vent.Open;
end;

procedure TDMPortes.AbrirIdioma;
begin
  QMPortesIdiomas.Close;
  QMPortesIdiomas.Open;
end;

procedure TDMPortes.CerrarFicha;
begin
  xTipoIva.Close;
  xCta_Comp.Close;
  xCta_Vent.Close;
  xCta_Dev_Comp.Close;
  xCta_Dev_Vent.Close;
end;

procedure TDMPortes.CerrarIdiomas;
begin
  QMPortesIdiomas.Close;
end;

procedure TDMPortes.CerrarSerie;
begin
  xCta_Comp.Close;
  xSeries.Close;
  xCta_Vent.Close;
  xCta_Dev_Comp.Close;
  xCta_Dev_Vent.Close;
end;

procedure TDMPortes.AbrePortes;
begin
  with QMPortes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMPortes.QMSeriesNewRecord(DataSet: TDataSet);
begin
  QMSeriesEMPRESA.AsInteger := QMPortesEMPRESA.AsInteger;
  QMSeriesEJERCICIO.AsInteger := QMPortesEJERCICIO.AsInteger;
  QMSeriesCANAL.AsInteger := QMPortesCANAL.AsInteger;
  QMSeriesSERIE.AsString := '';

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE DAME_CUENTAS_COMPRA_VENTA (?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := QMSeriesEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMSeriesEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMSeriesCANAL.AsInteger;
        ExecQuery;
        QMSeriesCTA_COMPRAS.AsString := FieldByName['CTA_COMPRAS'].AsString;
        QMSeriesCTA_VENTAS.AsString := FieldByName['CTA_VENTAS'].AsString;
        QMSeriesCTA_DEV_COMPRAS.AsString := FieldByName['CTA_DEV_COMPRAS'].AsString;
        QMSeriesCTA_DEV_VENTAS.AsString := FieldByName['CTA_DEV_VENTAS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPortes.QMSeriesCTA_COMPRASChange(Sender: TField);
begin
  xCta_Comp.Close;
  xCta_Comp.Open;
end;

procedure TDMPortes.QMSeriesCTA_DEV_COMPRASChange(Sender: TField);
begin
  xCta_dev_Comp.Close;
  xCta_Dev_Comp.Open;
end;

procedure TDMPortes.QMSeriesCTA_VENTASChange(Sender: TField);
begin
  xCta_Vent.Close;
  xCta_Vent.Open;
end;

procedure TDMPortes.QMSeriesCTA_DEV_VENTASChange(Sender: TField);
begin
  xCta_Dev_vent.Close;
  xCta_Dev_Vent.Open;
end;

end.
