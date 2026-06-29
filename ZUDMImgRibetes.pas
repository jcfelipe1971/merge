unit ZUDMImgRibetes;

interface

uses
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO;

type
  TZDMImgRibetes = class(TDataModule)
     TLocal: THYTransaction;
     xRibetes: TFIBDataSetRO;
     xRibetesCODIGO: TFIBStringField;
     xRibetesDESCRIPCION: TFIBStringField;
     xRibetesNUM_IMAGEN: TIntegerField;
     xRibetesIMAGEN: TBlobField;
     DSxRibetes: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure DevuelveValor;
  end;

var
  ZDMImgRibetes : TZDMImgRibetes;

implementation

uses UDMMain, ZUDMPedidosEsp;

{$R *.dfm}

procedure TZDMImgRibetes.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xRibetes.Open;
end;

procedure TZDMImgRibetes.DevuelveValor;
begin
  if not (ZDMPedidosEsp.QMPedidosDet.State in [dsInsert, dsEdit]) then
     ZDMPedidosEsp.QMPedidosDet.Edit;
  ZDMPedidosEsp.QMPedidosDetRIBETE.AsString := xRibetesCODIGO.AsString;
  ZDMPedidosEsp.QMPedidosDet.Post;
  ZDMPedidosEsp.QMPedidosDet.Edit;
end;

end.
