unit UDMTiposMoneda;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDatabase, FIBDataSet, FIBTableDataSet, FIBQuery,
  UFIBModificados, FIBDataSetRO;

type
  TDMTiposMoneda = class(TDataModule)
     DSQMTiposMoneda: TDataSource;
     QMTiposMoneda: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMTiposMonedaCOD_MONEDA: TIntegerField;
     QMTiposMonedaMONEDA: TFIBStringField;
     QMTiposMonedaDESCRIPCION: TFIBStringField;
     QMTiposMonedaTIPO: TIntegerField;
     QMTiposMonedaVALOR: TFloatField;
     procedure DMAuxiliaresCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMTiposMonedaAfterPost(DataSet: TDataSet);
     procedure QMTiposMonedaAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMTiposMoneda : TDMTiposMoneda;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMTiposMoneda.DMAuxiliaresCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTiposMoneda.Open;
end;

procedure TDMTiposMoneda.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMTiposMoneda.QMTiposMonedaAfterPost(DataSet: TDataSet);
var
  Moneda : string;
  Valor : real;
begin
  Graba(DataSet);
  // Como el código se da en los triggers, debo cerrar, abrir y buscar.
  with QMTiposMoneda do
  begin
     Moneda := QMTiposMonedaMONEDA.AsString;
     Valor := QMTiposMonedaVALOR.AsFloat;
     DisableControls;
     try
        Close;
        Open;
        First;
        while (not EOF) and ((QMTiposMonedaMONEDA.AsString <> Moneda) or (QMTiposMonedaVALOR.AsFloat <> Valor)) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMTiposMoneda.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTiposMoneda, '00000');
end;

procedure TDMTiposMoneda.QMTiposMonedaAfterScroll(DataSet: TDataSet);
begin
  QMTiposMonedaVALOR.DisplayFormat := DMMain.MascaraMoneda(QMTiposMonedaMONEDA.AsString, 1);
end;

end.
