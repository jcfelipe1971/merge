unit ZUDMPedidosEspTodos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FIBTableDataSet;

type
  TZDMPedidosEspTodos = class(TDataModule)
     TLocal: THYTransaction;
     DSPedidosEsp: TDataSource;
     QMPedidosEsp: TFIBTableSet;
     QMPedidosEspEMPRESA: TIntegerField;
     QMPedidosEspEJERCICIO: TIntegerField;
     QMPedidosEspRIG: TIntegerField;
     QMPedidosEspCLIENTE: TIntegerField;
     QMPedidosEspFECHA: TDateTimeField;
     QMPedidosEspSU_REFERENCIA: TFIBStringField;
     QMPedidosEspNOTAS: TBlobField;
     QMPedidosEspDIAS_SERVIR: TIntegerField;
     QMPedidosEspFECHA_ENTREGA_PREV: TDateTimeField;
     QMPedidosEspESTADO_PED: TIntegerField;
     QMPedidosEspEMPRESA_D: TIntegerField;
     QMPedidosEspEJERCICIO_D: TIntegerField;
     QMPedidosEspCANAL_D: TIntegerField;
     QMPedidosEspSERIE_D: TFIBStringField;
     QMPedidosEspTIPO_D: TFIBStringField;
     QMPedidosEspRIG_D: TIntegerField;
     QMPedidosEspID_S_D: TIntegerField;
     xDescCliente: TFIBDataSetRO;
     DSxDescCliente: TDataSource;
     xDescClienteTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraTabla;
     procedure DescCliente(Cliente: integer);
  end;

var
  ZDMPedidosEspTodos : TZDMPedidosEspTodos;

implementation

uses UDMMain, ZUFMPedidosEspTodos, UEntorno;

{$R *.dfm}

procedure TZDMPedidosEspTodos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  FiltraTabla;
end;

procedure TZDMPedidosEspTodos.FiltraTabla;
begin
  with QMPedidosEsp do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('select * from z_ges_cabeceras_s_ped');
     SelectSQL.Add('where empresa=?empresa and ejercicio=?ejercicio');
     if (ZFMPedidosEspTodos.CBEstado.ItemIndex = 0) then
        SelectSQL.Add('and estado_ped=0')
     else if (ZFMPedidosEspTodos.CBEstado.ItemIndex = 1) then
        SelectSQL.Add('and estado_ped=1');
     if (ZFMPedidosEspTodos.EFCliente.Text <> '') then
        SelectSQL.Add('and cliente=' + ZFMPedidosEspTodos.EFCliente.Text);
     if (ZFMPedidosEspTodos.ESuRef.Text <> '') then
        SelectSQL.Add('and su_referencia like "%' + ZFMPedidosEspTodos.ESuRef.Text + '%"');
     SelectSQL.Add('order by rig');
  end;
  DMMain.FiltraTabla(QMPedidosEsp, '11000');
end;

procedure TZDMPedidosEspTodos.DescCliente(Cliente: integer);
begin
  xDescCliente.Close;
  xDescCliente.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xDescCliente.Params.ByName['CLIENTE'].AsInteger := Cliente;
  xDescCliente.Open;
end;

end.
