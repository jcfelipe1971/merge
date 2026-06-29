unit ZUDMImgBambalinas;

interface

uses
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO;

type
  TZDMImgBambalinas = class(TDataModule)
     TLocal: THYTransaction;
     xBambalinas: TFIBDataSetRO;
     xBambalinasCODIGO: TFIBStringField;
     xBambalinasDESCRIPCION: TFIBStringField;
     xBambalinasNUM_IMAGEN: TIntegerField;
     xBambalinasIMAGEN: TBlobField;
     DSxBambalinas: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure DevuelveValor;
  end;

var
  ZDMImgBambalinas : TZDMImgBambalinas;

implementation

uses UDMMain, ZUDMPedidosEsp;

{$R *.dfm}

procedure TZDMImgBambalinas.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xBambalinas.Open;
end;

procedure TZDMImgBambalinas.DevuelveValor;
begin
  if not (ZDMPedidosEsp.QMPedidosDet.State in [dsInsert, dsEdit]) then
     ZDMPedidosEsp.QMPedidosDet.Edit;
  ZDMPedidosEsp.QMPedidosDetBAMBALINA.AsString := xBambalinasCODIGO.AsString;
  ZDMPedidosEsp.QMPedidosDet.Post;
  ZDMPedidosEsp.QMPedidosDet.Edit;
end;

end.
