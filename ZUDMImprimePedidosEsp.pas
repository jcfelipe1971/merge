unit ZUDMImprimePedidosEsp;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, FIBDataSetRO, FIBTableDataSetRO, SysUtils;

type
  TZDMImprimePedidosEsp = class(TDataModule)
     DSQMPedidosEsp: TDataSource;
     QMPedidosEsp: TFIBTableSetRO;
     QMPedidosEspEMPRESA: TIntegerField;
     QMPedidosEspEJERCICIO: TIntegerField;
     QMPedidosEspCANAL: TIntegerField;
     QMPedidosEspSERIE: TFIBStringField;
     QMPedidosEspTIPO: TFIBStringField;
     QMPedidosEspRIG: TIntegerField;
     QMPedidosEspALMACEN: TFIBStringField;
     QMPedidosEspMONEDA: TFIBStringField;
     QMPedidosEspFECHA: TDateTimeField;
     QMPedidosEspTERCERO: TIntegerField;
     QMPedidosEspTITULO: TFIBStringField;
     QMPedidosEspDIRECCION: TIntegerField;
     QMPedidosEspCLIENTE: TIntegerField;
     QMPedidosEspSU_REFERENCIA: TFIBStringField;
     QMPedidosEspFORMA_PAGO: TFIBStringField;
     QMPedidosEspCAMPANYA: TIntegerField;
     QMPedidosEspNOTAS: TBlobField;
     QMPedidosEspESTADO: TIntegerField;
     QMPedidosEspBULTOS: TIntegerField;
     QMPedidosEspLINEAS: TIntegerField;
     QMPedidosEspS_BASES: TFloatField;
     QMPedidosEspAGENTE: TIntegerField;
     QMPedidosEspDTO_PP: TFloatField;
     QMPedidosEspDTO_CIAL: TFloatField;
     QMPedidosEspLIQUIDO: TFloatField;
     QMPedidosEspENTRADA: TIntegerField;
     QMPedidosEspFECHA_ENTREGA_PREV: TDateTimeField;
     QMPedidosEspFECHA_REC_CAB: TDateTimeField;
     QMPedidosEspNOMBRE_COMERCIAL: TFIBStringField;
     QMPedidosEspTARIFA: TFIBStringField;
     QMPedidosEspID_S: TIntegerField;
     QMPedidosEspIDIOMA: TFIBStringField;
     QMPedidosEspZ_COD_BARRAS_PED: TIntegerField;
     TLocal: THYTransaction;
     procedure ZDMImprimePedidosEspCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure busquedaCompleja;
     procedure ImprimePedidosEsp(Sender: TForm; TipoListado: byte);
     procedure MarcaTodas(Sender: TForm);
     procedure MarcaHasta(Sender: TForm);
     procedure Filtra(maestro: TDataSet);
  end;

var
  ZDMImprimePedidosEsp : TZDMImprimePedidosEsp;

implementation

uses UFBuscaRO, ZUFMImprimePedidosEsp, UEntorno, ZUDMLstPedidos, UFormGest, UDMMain,
  UUtiles, UDMListados;

{$R *.DFM}

procedure TZDMImprimePedidosEsp.ZDMImprimePedidosEspCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  DMMain.FiltraRO(QMPedidosEsp, '11100', True);

  AbreData(TDMListados, DMListados);
  DMListados.Cargar(9002, REntorno.Serie);
  CierraData(DMListados);
  ZFMImprimePedidosEsp.Z_CENumCopias.Value := REntorno.Copias;
end;

procedure TZDMImprimePedidosEsp.Filtra(maestro: TDataSet);
begin
  with QMPedidosEsp do
  begin
     if Active then
        Close;
     Params.ByName['EMPRESA'].AsInteger := maestro.FieldByName('EMPRESA').AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := maestro.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := maestro.FieldByName('CANAL').AsInteger;
     Open;
  end;
end;

procedure TZDMImprimePedidosEsp.ImprimePedidosEsp(Sender: TForm; TipoListado: byte);
var
  m : TBookmark;
  listado, grupo, cabecera, copias : integer;
  tipo : string;
begin
  REntorno.Copias := Round(ZFMImprimePedidosEsp.Z_CENumCopias.Value); //sfg_jla
  AbreData(TZDMLstPedidos, ZDMLstPedidos);
  QMPedidosEsp.DisableControls;
  try
     m := QMPedidosEsp.GetBookmark;
     try
        QMPedidosEsp.Open;
        QMPedidosEsp.First;
        listado := REntorno.Formato;
        grupo := REntorno.Grupo;
        copias := REntorno.Copias;
        cabecera := REntorno.Cabecera;
        tipo := REntorno.TipoListado;
        repeat
           REntorno.Formato := listado;
           REntorno.Grupo := grupo;
           REntorno.Copias := copias;
           REntorno.Cabecera := cabecera;
           REntorno.TipoListado := tipo;
           if TZFMImprimePedidosEsp(Sender).seleccionado then
              case TipoListado of
                 0: ZDMLstPedidos.MostrarListado(1, QMPedidosEspID_S.AsInteger);
              end;
           QMPedidosEsp.Next;
        until QMPedidosEsp.EOF;

        QMPedidosEsp.GotoBookmark(m);
     finally
        QMPedidosEsp.FreeBookmark(m);
     end;
  finally
     QMPedidosEsp.EnableControls;
  end;
  CierraData(ZDMLstPedidos);
end;

procedure TZDMImprimePedidosEsp.MarcaTodas(Sender: TForm);
var
  m : TBookmark;
begin
  m := QMPedidosEsp.GetBookmark;
  try
     QMPedidosEsp.DisableControls;
     try
        QMPedidosEsp.First;
        repeat
           TZFMImprimePedidosEsp(Sender).Marca;
           QMPedidosEsp.Next;
        until QMPedidosEsp.EOF;
        QMPedidosEsp.GotoBookmark(m);
     finally
        QMPedidosEsp.EnableControls;
     end;
  finally
     QMPedidosEsp.FreeBookmark(m);
  end;
end;

procedure TZDMImprimePedidosEsp.MarcaHasta(Sender: TForm);
var
  m : TBookmark;
begin
  m := QMPedidosEsp.GetBookmark;
  try
     QMPedidosEsp.DisableControls;
     try
        while not (TZFMImprimePedidosEsp(Sender).HYTDBGPedidosEsp.SelectedRows.CurrentRowSelected) do
        begin
           TZFMImprimePedidosEsp(Sender).Marca;
           QMPedidosEsp.Prior;
        end;
        QMPedidosEsp.GotoBookmark(m);
     finally
        QMPedidosEsp.EnableControls;
     end;
  finally
     QMPedidosEsp.FreeBookmark(m);
  end;
end;

procedure TZDMImprimePedidosEsp.busquedaCompleja;
var
  orden : string;
begin
  QMPedidosEsp.Close;
  if TFBuscaRO.Create(Self).SeleccionaBusqueda(QMPedidosEsp, '11100', False) = mrOk then
  begin
     orden := QMPedidosEsp.OrdenadoPor;
     QMPedidosEsp.ordenar('');
     if QMPedidosEsp.SelectSQL.Count <> 0 then
        QMPedidosEsp.SelectSQL.Add('and tipo=''PEC'' and estado=0');
     QMPedidosEsp.Ordenar(orden);
  end;
  QMPedidosEsp.Open;
end;

end.
