unit UOpeDMTiposImputacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TOpeDMTiposImputacion = class(TDataModule)
     QMTipoImputa: TFIBTableSet;
     DSQMTipoImputa: TDataSource;
     TLocal: THYTransaction;
     QMTipoImputaTIPO_IMPUTACION: TFIBStringField;
     QMTipoImputaDESCRIPCION: TFIBStringField;
     QMTipoImputaHORAS: TIntegerField;
     procedure OpeDMTiposImputacionCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure Duplicados(Sender: TField);
     procedure QMTipoImputaBeforePost(DataSet: TDataSet);
     procedure QMTipoImputaAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  OpeDMTiposImputacion : TOpeDMTiposImputacion;

implementation

uses UDMMain, UFBusca, UEntorno, UUtiles;

{$R *.DFM}

procedure TOpeDMTiposImputacion.OpeDMTiposImputacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMTipoImputa, '00000');
end;

procedure TOpeDMTiposImputacion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TOpeDMTiposImputacion.QMTipoImputaBeforePost(DataSet: TDataSet);
begin
  QMTipoImputaTIPO_IMPUTACION.AsString := UpperCase(QMTipoImputaTIPO_IMPUTACION.AsString);
end;

procedure TOpeDMTiposImputacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMtipoImputa, '00000');
end;

procedure TOpeDMTiposImputacion.Duplicados(Sender: TField);
begin
  // DMMain.ControlaDuplicados(Sender);
end;

procedure TOpeDMTiposImputacion.QMTipoImputaAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);

  Refrescar(QMTipoImputa, 'TIPO_IMPUTACION', QMTipoImputaTIPO_IMPUTACION.AsString);
end;

end.
