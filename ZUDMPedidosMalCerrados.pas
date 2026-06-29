unit ZUDMPedidosMalCerrados;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, FIBInfoSet, Dialogs,
  jpeg, GIFImage, Graphics, ExtCtrls, Variants, Math, Controls;

type
  TZDMPedidosMalCerrados = class(TDataModule)
     QMPedidosMalCerrados: TFIBDataSetRO;
     DSQMPedidosMalCerrados: TDataSource;
     TLocal: THYTransaction;
     QMPedidosMalCerradosZ_COD_BARRAS: TIntegerField;
     QMPedidosMalCerradosID_ORDEN: TIntegerField;
     QMPedidosMalCerradosTITULO: TFIBStringField;
     QMPedidosMalCerradosFECHA: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     TipoOpcion: integer;
     dateleft, dateright: TDateTime;
     procedure PedidosAbiertosConAlbaran;
     procedure Procesa;
     { Public declarations }
  end;

var
  ZDMPedidosMalCerrados : TZDMPedidosMalCerrados;

implementation

uses UEntorno, UFParada, UDMMain, ZUFMPedidosMalCerrados;

{$R *.dfm}

procedure TZDMPedidosMalCerrados.PedidosAbiertosConAlbaran;
begin
  with QMPedidosMalCerrados do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['canal'].AsInteger := REntorno.Canal;
     Params.ByName['serie'].AsString := REntorno.Serie;
     Params.ByName['tipo'].AsInteger := TipoOpcion;
     Params.ByName['procesa'].AsInteger := 0;
     Params.ByName['Fechal'].AsDateTime := ZFMPedidosMalCerrados.LFDateLeft.Date;
     Params.ByName['Fechar'].AsDateTime := ZFMPedidosMalCerrados.LFDateRight.Date;
     Open;
  end;
end;

procedure TZDMPedidosMalCerrados.Procesa;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'execute procedure Z_DAME_PEDIDOS_MAL_CERRADOS' +
        '(?tipo , ?procesa, ?empresa ,?ejercicio ,?canal' +
        ',?serie,?fechal , ?fechar )';

     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['canal'].AsInteger := REntorno.Canal;
     Params.ByName['serie'].AsString := REntorno.Serie;
     Params.ByName['tipo'].AsInteger := TipoOpcion;
     Params.ByName['procesa'].AsInteger := 1;
     Params.ByName['Fechal'].AsDateTime := ZFMPedidosMalCerrados.LFDateLeft.Date;
     Params.ByName['Fechar'].AsDateTime := ZFMPedidosMalCerrados.LFDateRight.Date;

     TFParada.Create(Self).ExecQuery(Q);
  end;
  FreeAndNil(Q);

  // hacer de nuevo la búsqueda para actualizar
  PedidosAbiertosConAlbaran;
end;

procedure TZDMPedidosMalCerrados.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

end.
