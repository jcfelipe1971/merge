unit UDMPerfiles;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO;

type
  TDMPerfiles = class(TDataModule)
     QMPerfiles: TFIBTableSet;
     DSPerfiles: TDataSource;
     QMPerfilesPERFIL: TFIBStringField;
     QMPerfilesTITULO: TFIBStringField;
     QMPerfilesCOPIAS_OFERTA: TIntegerField;
     QMPerfilesMODELO_OFERTA: TIntegerField;
     QMPerfilesCOPIAS_PEDIDO: TIntegerField;
     QMPerfilesMODELO_PEDIDO: TIntegerField;
     QMPerfilesCOPIAS_ALBARAN: TIntegerField;
     QMPerfilesMODELO_ALBARAN: TIntegerField;
     QMPerfilesCOPIAS_FACTURA: TIntegerField;
     QMPerfilesMODELO_FACTURA: TIntegerField;
     QMPerfilesDEFECTO: TIntegerField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMPerfilesIMPONER_LISTADO_OFERTA: TIntegerField;
     QMPerfilesIMPONER_LISTADO_PEDIDO: TIntegerField;
     QMPerfilesIMPONER_LISTADO_ALBARAN: TIntegerField;
     QMPerfilesIMPONER_LISTADO_FACTURA: TIntegerField;
     QMPerfilesIMPONER_COPIAS_OFERTA: TIntegerField;
     QMPerfilesIMPONER_COPIAS_PEDIDO: TIntegerField;
     QMPerfilesIMPONER_COPIAS_ALBARAN: TIntegerField;
     QMPerfilesIMPONER_COPIAS_FACTURA: TIntegerField;
     QMPerfilesIMPONER_LISTADO_OFERTA_MAIL: TIntegerField;
     QMPerfilesIMPONER_LISTADO_PEDIDO_MAIL: TIntegerField;
     QMPerfilesIMPONER_LISTADO_ALBARAN_MAIL: TIntegerField;
     QMPerfilesIMPONER_LISTADO_FACTURA_MAIL: TIntegerField;
     QMPerfilesMODELO_OFERTA_MAIL: TIntegerField;
     QMPerfilesMODELO_PEDIDO_MAIL: TIntegerField;
     QMPerfilesMODELO_ALBARAN_MAIL: TIntegerField;
     QMPerfilesMODELO_FACTURA_MAIL: TIntegerField;
     procedure DMPerfilesCreate(Sender: TObject);
     procedure QMPerfilesNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMPerfiles : TDMPerfiles;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TDMPerfiles.DMPerfilesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMPerfiles.Open;
end;

procedure TDMPerfiles.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPerfiles, '00000');
end;

procedure TDMPerfiles.QMPerfilesNewRecord(DataSet: TDataSet);
begin
  QMPerfilesDEFECTO.AsInteger := 0;
end;

end.
