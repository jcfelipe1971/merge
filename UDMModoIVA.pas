unit UDMModoIVA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDatabase, FIBDataSet, FIBTableDataSet, FIBQuery,
  UFIBModificados, FIBDataSetRO, HYFIBQuery;

type
  TDMModoIVA = class(TDataModule)
     QMModoIva: TFIBTableSet;
     DSQMModoIva: TDataSource;
     QMModoIvaMODO: TIntegerField;
     QMModoIvaIVA: TIntegerField;
     QMModoIvaRECARGO: TIntegerField;
     QMModoIvaTITULO: TFIBStringField;
     TLocal: THYTransaction;
     QMModoIvaDEDUCIBLE: TIntegerField;
     QMModoIvaTIPO_TRANSACCION: TIntegerField;
     SPAltaCuentasIva: THYFIBQuery;
     DSxTransaccion: TDataSource;
     xTransaccion: TFIBDataSetRO;
     TUpdate: THYTransaction;
     procedure DMModoIVACreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMModoIvaNewRecord(DataSet: TDataSet);
     procedure QMModoIvaBeforePost(DataSet: TDataSet);
     procedure QMModoIvaAfterPost(DataSet: TDataSet);
     procedure QMModoIvaAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure AltaCuentasIva;
  end;

var
  DMModoIVA : TDMModoIVA;

implementation

uses UDMMain, UUtiles, UEntorno, uFBusca;

{$R *.DFM}

procedure TDMModoIVA.DMModoIVACreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMModoIva.Open;
end;

procedure TDMModoIVA.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMModoIVA.QMModoIvaNewRecord(DataSet: TDataSet);
begin
  QMModoIvaIVA.AsInteger := 0;
  QMModoIvaRECARGO.AsInteger := 0;
  QMModoIvaDEDUCIBLE.AsInteger := 0;
  QMModoIvaTITULO.AsString := _('Desconocido');
end;

procedure TDMModoIVA.QMModoIvaBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'Conta_Modo_Iva', 'Modo');
end;

procedure TDMModoIVA.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMModoIVa, '00000');
end;

procedure TDMModoIVA.QMModoIvaAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  AltaCuentasIva;
end;

procedure TDMModoIVa.AltaCuentasIva;
begin
  with SPAltaCuentasIva do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Close;
     FreeHandle;
  end;
end;

procedure TDMModoIVA.QMModoIvaAfterOpen(DataSet: TDataSet);
begin
  xTransaccion.Open;
end;

end.
