unit UDMMaquinasVending;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TDMMaquinasVending = class(TDataModule)
     TLocal: THYTransaction;
     QMMaquinas: TFIBTableSet;
     DSQMMaquinas: TDataSource;
     TUpdate: THYTransaction;
     QMMaquinasID_MAQUINA: TIntegerField;
     QMMaquinasEMPRESA: TIntegerField;
     QMMaquinasMAQUINA: TIntegerField;
     QMMaquinasTITULO: TFIBStringField;
     QMMaquinasID_CLIENTE: TIntegerField;
     QMMaquinasCLIENTE: TIntegerField;
     QMMaquinasACTIVO: TIntegerField;
     QMMaquinasPARAMETRO_CLIENTE: TFIBStringField;
     QMMaquinasPARAMETRO_MAQUINA: TFIBStringField;
     QMMaquinasPARAMETRO_UBICACION: TFIBStringField;
     QMMaquinasPARAMETRO_DOMINIO: TFIBStringField;
     procedure DMMaquinasVendingCreate(Sender: TObject);
     procedure QMMaquinasNewRecord(DataSet: TDataSet);
     procedure QMMaquinasBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMMaquinasVending : TDMMaquinasVending;

implementation

{$R *.DFM}

uses UDMMain, uFBusca, UEntorno;

procedure TDMMaquinasVending.DMMaquinasVendingCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Apertura de tablas
  DMMain.FiltraTabla(QMMaquinas, '10000', True);

  // Máscaras
end;

procedure TDMMaquinasVending.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMaquinas, '10000');
end;

procedure TDMMaquinasVending.QMMaquinasNewRecord(DataSet: TDataSet);
begin
  QMMaquinasEMPRESA.AsInteger := REntorno.Empresa;
  QMMaquinasACTIVO.AsInteger := 1;
  QMMaquinasPARAMETRO_UBICACION.AsString := '';
  QMMaquinasPARAMETRO_DOMINIO.AsString := 'topayweb.com';
end;

procedure TDMMaquinasVending.QMMaquinasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_MAQUINA_VENDING', 'ID_MAQUINA');
end;

end.
