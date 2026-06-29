{Especifico cliente DICOMOL}

unit UDMFiltroAlbaranesCompra;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBTableDataSetRO;

type
  TDMFiltroAlbaranesCompra = class(TDataModule)
     QMFiltro: TFIBTableSet;
     DSQMFiltro: TDataSource;
     TLocal: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
  end;

var
  DMFiltroAlbaranesCompra : TDMFiltroAlbaranesCompra;

implementation

uses uFBusca, UUtiles, UDMMain, UEntorno, UFormGest;

{$R *.dfm}

procedure TDMFiltroAlbaranesCompra.DataModuleCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  with QMFiltro do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;

     for i := 0 to FieldCount - 1 do
     begin
        if (Fields[i] is TFloatField) then
           TFloatField(Fields[i]).DisplayFormat := ',0.00';
        if (Fields[i] is TIntegerField) then
           TIntegerField(Fields[i]).DisplayFormat := '0';
        if (Fields[i] is TDateTimeField) then
           TDateTimeField(Fields[i]).DisplayFormat := ShortDateFormat;
     end;
  end;
end;

procedure TDMFiltroAlbaranesCompra.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMFiltro, '10000');
end;

end.
