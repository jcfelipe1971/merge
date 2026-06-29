unit UDMFacturacionCanal;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet,
  FIBDataSetRO;

type
  TDMFacturacionCanal = class(TDataModule)
     QMCanales: TFIBTableSet;
     DSQMCanales: TDataSource;
     TLocal: THYTransaction;
     QMCanalesEMPRESA: TIntegerField;
     QMCanalesCANAL: TIntegerField;
     QMCanalesPORCENTAJE: TFloatField;
     QMCanalesRESTO: TIntegerField;
     xCanal: TFIBDataSetRO;
     xCanalTITULO: TFIBStringField;
     DSxCanal: TDataSource;
     xCaja: TFIBDataSetRO;
     DSxCaja: TDataSource;
     xCajaTITULO: TFIBStringField;
     QMCanalesCAJA: TIntegerField;
     QMCanalesIMPORTE: TFloatField;
     TUpdate: THYTransaction;
     procedure DMEmpCajasCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCanalesNewRecord(DataSet: TDataSet);
     procedure QMCanalesCANALChange(Sender: TField);
     procedure QMCanalesCAJAChange(Sender: TField);
     procedure QMCanalesAfterOpen(DataSet: TDataSet);
     procedure QMCanalesBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     procedure Refresca;
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMFacturacionCanal : TDMFacturacionCanal;

implementation

uses UDMMain, UEntorno, UFBusca, UFMain;

{$R *.DFM}

procedure TDMFacturacionCanal.DMEmpCajasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCanalesPORCENTAJE.DisplayFormat := '0.##';
  QMCanalesIMPORTE.DisplayFormat := DMMain.MascaraMoneda(REntorno.MonedaEmpresa);

  // Abrir la tabla por E
  DMMain.FiltraTabla(QMCanales, '10000', True);
end;

procedure TDMFacturacionCanal.Graba(DataSet: TDataSet);
begin
  Refresca;
end;

procedure TDMFacturacionCanal.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCanales, '10000');
end;

procedure TDMFacturacionCanal.QMCanalesNewRecord(DataSet: TDataSet);
begin
  QMCanalesEMPRESA.AsInteger := REntorno.empresa;
  QMCanalesCAJA.AsInteger := REntorno.Caja;
  QMCanalesCANAL.AsInteger := REntorno.Canal;
  QMCanalesPORCENTAJE.AsFloat := 0;
end;

procedure TDMFacturacionCanal.QMCanalesCANALChange(Sender: TField);
begin
  with xCanal do
  begin
     Close;
     Open;
  end;
end;

procedure TDMFacturacionCanal.QMCanalesCAJAChange(Sender: TField);
begin
  with xCaja do
  begin
     Close;
     Open;
  end;
end;

procedure TDMFacturacionCanal.Refresca;
var
  aBookmark : TBookmark;
begin
  with QMCanales do
  begin
     aBookmark := GetBookmark;
     try
        Close;
        Open;
        GotoBookmark(aBookmark);
     finally
        FreeBookmark(aBookmark);
     end;
  end;
end;

procedure TDMFacturacionCanal.QMCanalesAfterOpen(DataSet: TDataSet);
begin
  xCanal.Open;
  xCaja.Open;
end;

procedure TDMFacturacionCanal.QMCanalesBeforeClose(DataSet: TDataSet);
begin
  xCanal.Close;
  xCaja.Close;
end;

end.
