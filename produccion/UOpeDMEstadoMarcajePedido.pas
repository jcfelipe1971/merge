unit UOpeDMEstadoMarcajePedido;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet;

type
  TOpeDMEstadoMarcajePedido = class(TDataModule)
     QMEstadoMarcajePedido: TFIBTableSet;
     DSEstadoMarcajePedido: TDataSource;
     TLocal: THYTransaction;
     QMEstadoMarcajePedidoEMPRESA: TIntegerField;
     QMEstadoMarcajePedidoID_ESTADO_MARCAJE_PEDIDO: TIntegerField;
     QMEstadoMarcajePedidoTITULO: TFIBStringField;
     QMEstadoMarcajePedidoORDEN_EJECUCION: TIntegerField;
     QMEstadoMarcajePedidoSTOCK_AFECTA: TIntegerField;
     QMEstadoMarcajePedidoASOCIAR_FECHA_MARCAJE: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMOpeEstadoMarcajePedidoCreate(Sender: TObject);
     procedure QMEstadoMarcajePedidoNewRecord(DataSet: TDataSet);
     procedure QMEstadoMarcajePedidoBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  OpeDMEstadoMarcajePedido : TOpeDMEstadoMarcajePedido;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UUtiles, uFBusca, URecursos;

procedure TOpeDMEstadoMarcajePedido.DMOpeEstadoMarcajePedidoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMEstadoMarcajePedido, '10000', True);
end;

procedure TOpeDMEstadoMarcajePedido.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMEstadoMarcajePedido, '10000');
end;

procedure TOpeDMEstadoMarcajePedido.QMEstadoMarcajePedidoNewRecord(DataSet: TDataSet);
begin
  QMEstadoMarcajePedidoEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TOpeDMEstadoMarcajePedido.QMEstadoMarcajePedidoBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_ESTADO_MARCAJE_PEDIDO', 'ID_ESTADO_MARCAJE_PEDIDO');
end;

end.
