unit UDMTipoRetencion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMTipoRetencion = class(TDataModule)
     TLocal: THYTransaction;
     QMTipoRet: TFIBTableSet;
     DSQMTipoRet: TDataSource;
     TUpdate: THYTransaction;
     QMTipoRetID: TIntegerField;
     QMTipoRetDESCRIPCION: TFIBStringField;
     QMTipoRetPOR_ITBIS: TFloatField;
     QMTipoRetCUENTA_ITBIS: TFIBStringField;
     QMTipoRetPOR_ISR: TFloatField;
     QMTipoRetCUENTA_ISR: TFIBStringField;
     QMTipoRetCALCULO_SOBRE_BASE: TIntegerField;
     procedure DMTipoAsientoCreate(Sender: TObject);
     procedure QMTipoRetNewRecord(DataSet: TDataSet);
     procedure QMTipoRetBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     function BusquedaCompleja: integer;
  end;

var
  DMTipoRetencion : TDMTipoRetencion;

implementation

uses UDMMain, UEntorno, uFBusca, UUtiles;

{$R *.DFM}

procedure TDMTipoRetencion.DMTipoAsientoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMTipoRet, MascaraN, MascaraI, ShortDateFormat);
  QMTipoRetPOR_ITBIS.DisplayFormat := MascaraP;
  QMTipoRetPOR_ISR.DisplayFormat := MascaraP;

  QMTipoRet.Close;
  QMTipoRet.Open;
end;

procedure TDMTipoRetencion.QMTipoRetNewRecord(DataSet: TDataSet);
begin
  QMTipoRetCALCULO_SOBRE_BASE.AsInteger := 1;
end;

procedure TDMTipoRetencion.QMTipoRetBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'DOM_RETENCIONES', 'ID');
  end;
end;

function TDMTipoRetencion.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMTipoRet, '00000');
end;

end.
