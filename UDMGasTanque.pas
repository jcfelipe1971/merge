unit UDMGasTanque;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery, Variants,
  jpeg, GIFImage, ExtCtrls, Math, DBTables, FR_Class, FR_DSet, FR_DBSet,
  Fr_HYReport, frxClass, frxHYReport;

type
  TDMGasTanque = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMGasTanque: TFIBTableSet;
     DSQMGasTanque: TDataSource;
     QMGasTanqueEMPRESA: TIntegerField;
     QMGasTanqueSERIE: TFIBStringField;
     QMGasTanqueCOD_TANQUE: TIntegerField;
     QMGasTanqueTITULO: TFIBStringField;
     QMGasTanqueEVAPORACION: TFloatField;
     QMGasTanqueCAPACIDAD: TFloatField;
     QMGasTanqueALMACEN: TFIBStringField;
     QMGasTanqueARTICULO: TFIBStringField;
     QMGasTanqueTARIFA: TFIBStringField;
     QMGasTanqueESTADO: TIntegerField;
     QMGasTanqueNOTAS: TBlobField;
     QMGasTanqueDescSerie: TStringField;
     QMGasTanqueDescAlmacen: TStringField;
     QMGasTanqueDescArticulo: TStringField;
     QMGasTanqueDescTarifa: TStringField;
     QMGasTanqueEJERCICIO: TIntegerField;
     QMGasTanqueCANAL: TIntegerField;
     procedure QMGasTanqueAfterPost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMGasTanqueNewRecord(DataSet: TDataSet);
     procedure QMGasTanqueDescSerieGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMGasTanqueDescAlmacenGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMGasTanqueDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMGasTanqueDescTarifaGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMGasTanque : TDMGasTanque;

implementation

uses UDMMain, UFBusca, UFormGest, UUtiles, UDameDato, UEntorno;

{$R *.DFM}

procedure TDMGasTanque.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMGasTanque.QMGasTanqueAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMGasTanque.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMGasTanque, '10000');
end;

procedure TDMGasTanque.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMGasTanque.Open;

  QMGasTanqueEVAPORACION.DisplayFormat := MascaraP;
end;

procedure TDMGasTanque.QMGasTanqueNewRecord(DataSet: TDataSet);
begin
  QMGasTanqueEMPRESA.AsInteger := REntorno.Empresa;
  // Estos campos no son correctos. Se inicializan a 0 hasta borrarlos
  QMGasTanqueEJERCICIO.AsInteger := 0;
  QMGasTanqueCANAL.AsInteger := 0;
end;

procedure TDMGasTanque.QMGasTanqueDescSerieGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloSerie(QMGasTanqueSERIE.AsString);
end;

procedure TDMGasTanque.QMGasTanqueDescAlmacenGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloAlmacen(QMGasTanqueALMACEN.AsString);
end;

procedure TDMGasTanque.QMGasTanqueDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMGasTanqueARTICULO.AsString);
end;

procedure TDMGasTanque.QMGasTanqueDescTarifaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloTarifa(QMGasTanqueTARIFA.AsString);
end;

end.
