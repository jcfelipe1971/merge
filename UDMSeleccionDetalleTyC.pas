unit UDMSeleccionDetalleTyC;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados;

type
  TDMSeleccionDetalleTyC = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMModelo: TFIBDataSetRO;
     DSQMModelo: TDataSource;
     QMColor: TFIBDataSetRO;
     DSQMColor: TDataSource;
     QMTalla: TFIBDataSetRO;
     DSQMTalla: TDataSource;
     QMTallasArticulo: TFIBDataSetRO;
     DSTallasArticulo: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMModeloBeforeClose(DataSet: TDataSet);
     procedure QMColorAfterOpen(DataSet: TDataSet);
     procedure QMColorBeforeOpen(DataSet: TDataSet);
     procedure QMModeloAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraModelo(RefProveedor: string);
  end;

var
  DMSeleccionDetalleTyC : TDMSeleccionDetalleTyC;

implementation

uses
  UDMMain, UEntorno;

{$R *.dfm}

procedure TDMSeleccionDetalleTyC.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not Tlocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMSeleccionDetalleTyC.FiltraModelo(RefProveedor: string);
begin
  with QMModelo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['REF_PROVEEDOR'].AsString := RefProveedor;
     Open;
  end;
end;

procedure TDMSeleccionDetalleTyC.QMModeloAfterOpen(DataSet: TDataSet);
begin
  QMColor.Open;
  QMTallasArticulo.Open;
end;

procedure TDMSeleccionDetalleTyC.QMModeloBeforeClose(DataSet: TDataSet);
begin
  QMColor.Close;
  QMTallasArticulo.Close;
end;

procedure TDMSeleccionDetalleTyC.QMColorAfterOpen(DataSet: TDataSet);
begin
  QMTalla.Open;
end;

procedure TDMSeleccionDetalleTyC.QMColorBeforeOpen(DataSet: TDataSet);
begin
  QMTalla.Close;
end;

end.
