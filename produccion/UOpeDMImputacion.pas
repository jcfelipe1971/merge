unit UOpeDMImputacion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TOpeDMImputacion = class(TDataModule)
     TLocal: THYTransaction;
     QMImputacion: TFIBTableSet;
     DSQMImputacion: TDataSource;
     QMImputacionIMPUTACION: TFIBStringField;
     QMImputacionDESCRIPCION: TFIBStringField;
     QMImputacionTIPO_IMPUTACION: TFIBStringField;
     QMImputacionH_INDET: TIntegerField;
     xTipoImputacion: TFIBTableSet;
     DSxTipoImputacion: TDataSource;
     xTipoImputacionTIPO_IMPUTACION: TFIBStringField;
     xTipoImputacionDESCRIPCION: TFIBStringField;
     xTipoImputacionHORAS: TIntegerField;
     procedure Graba(DataSet: TDataSet);
     procedure Duplicados(Sender: TField);
     procedure OpeDMImputacionCreate(Sender: TObject);
     procedure QMImputacionBeforePost(DataSet: TDataSet);
     procedure QMImputacionTIPO_IMPUTACIONChange(Sender: TField);
     procedure QMImputacionAfterOpen(DataSet: TDataSet);
     procedure QMImputacionAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  OpeDMImputacion : TOpeDMImputacion;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UUtiles;

procedure TOpeDMImputacion.OpeDMImputacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMImputacion, '00000');
end;

procedure TOpeDMImputacion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TOpeDMImputacion.QMImputacionBeforePost(DataSet: TDataSet);
begin
  QMImputacionIMPUTACION.AsString := UpperCase(QMImputacionIMPUTACION.AsString);
end;

procedure TOpeDMImputacion.Duplicados(Sender: TField);
begin
  // DMMain.ControlaDuplicados(Sender);
end;

procedure TOpeDMImputacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMImputacion, '00000');
end;

procedure TOpeDMImputacion.QMImputacionTIPO_IMPUTACIONChange(Sender: TField);
begin
  with OpeDMImputacion.xTipoImputacion do
  begin
     Close;
     Params.ByName['TIPO_IMPUTACION'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TOpeDMImputacion.QMImputacionAfterOpen(DataSet: TDataSet);
begin
  xTipoImputacion.Open;
end;

procedure TOpeDMImputacion.QMImputacionAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  Refrescar(QMImputacion, 'IMPUTACION', QMImputacionIMPUTACION.AsString);
end;

end.
