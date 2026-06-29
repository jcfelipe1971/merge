unit UProDMLstNecesidades;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, FR_Class, DB, FIBDataSet,
  FIBDatabase, UFIBModificados, FIBDataSetRO, Fr_HYReport, FIBQuery,
  HYFIBQuery, StrUtils, FIBDataSetRW;

type
  TProDMLstNecesidades = class(TDataModule)
     frDBlstNecesidades: TfrDBDataSet;
     DSOrden: TDataSource;
     xOrden: TFIBDataSetRO;
     TLocal: THYTransaction;
     frListadoN: TfrHYReport;
     QGenerarLst: TFIBDataSetRW;
     QListarUbicaciones: TFIBDataSetRO;
     DSLstNec: TDataSource;
     frDBlstUbicaciones: TfrDBDataSet;
     QMLstPedido: TFIBDataSetRO;
     DSLstPedido: TDataSource;
     frDBLstPedido: TfrDBDataSet;
     QMLstTareasUtillaje: TFIBDataSetRO;
     DSLstTareasUtillaje: TDataSource;
     frDBLstTareasUtillaje: TfrDBDataSet;
     xArticuloCodigoCliente: TFIBDataSetRO;
     QMLstPedidoDet: TFIBDataSetRO;
     DSLstPedidoDet: TDataSource;
     frDBLstPedidoDet: TfrDBDataSet;
     QMLstMaterialesLotes: TFIBDataSetRO;
     DSQMLstMaterialesLotes: TDataSource;
     frDBLstMaterialesLotes: TfrDBDataSet;
     xCompuestoCodigoCliente: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoNGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QGenerarLstAfterOpen(DataSet: TDataSet);
     procedure QGenerarLstBeforeClose(DataSet: TDataSet);
     procedure xOrdenAfterOpen(DataSet: TDataSet);
     procedure xOrdenBeforeClose(DataSet: TDataSet);
     procedure QMLstPedidoDetAfterOpen(DataSet: TDataSet);
     procedure QMLstPedidoDetBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     Grupo: integer;
     procedure CambiaOrden(IdOrden: integer);
     procedure MostrarListado(Modo, Grupo, IdOrden, Suborden: integer; AlmDesde, AlmHasta: string; Comentario: string; FechaListado: TDateTime; Equivalencias, Subordenes, Fases, Agrupa: boolean);
  end;

var
  ProDMLstNecesidades : TProDMLstNecesidades;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest;

{$R *.dfm}

procedure TProDMLstNecesidades.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TProDMLstNecesidades.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMLstNecesidades.CambiaOrden(IdOrden: integer);
begin
  xOrden.Close;
  xOrden.Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
  xOrden.Open;
end;

procedure TProDMLstNecesidades.MostrarListado(Modo, Grupo, IdOrden, Suborden: integer; AlmDesde, AlmHasta: string; Comentario: string; FechaListado: TDateTime; Equivalencias, Subordenes, Fases, Agrupa: boolean);
var
  str : string;
  TipoListado : smallint;
begin
  with QGenerarLst do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM PRO_LST_NECESIDADES_LANZAR(:ID_ORDEN, :ALM_DESDE, :ALM_HASTA, :ENTRADA, :TIPOLST) ');
     if (not Equivalencias) then
     begin
        if (not Subordenes) then
           SelectSQL.Add(' WHERE V_NIVEL = 0 ')  // NI SUBORDENES NI EQUIVALENCIAS
        else
           SelectSQL.Add(' WHERE V_NIVEL >= 0 '); // SUBORDENES, PERO NO EQUIVALENCIAS
     end
     else
     if (not Subordenes) then
        SelectSQL.Add(' WHERE V_NIVEL <= 0 '); // EQUIVALENCIAS, PERO NO SUBORDENES
  end;

  TipoListado := -1;
  if (Agrupa) then
     TipoListado := 1;
  if (Fases) then
     TipoListado := 2;

  CambiaOrden(IdOrden);

  // Ejecuto el procedure y lleno la tabla tmp_lst_necesidades
  with QGenerarLst do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Params.ByName['ALM_DESDE'].AsString := AlmDesde;
     Params.ByName['ALM_HASTA'].AsString := AlmHasta;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['TIPOLST'].AsInteger := TipoListado;
     Open;
  end;

  with QMLstMaterialesLotes do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Open;
  end;

  QMLstTareasUtillaje.Close;
  QMLstTareasUtillaje.Open;

  DMListados.DatosInforme(FechaListado, Comentario);
  DMListados.Imprimir(Grupo, Modo, '', str, frListadoN, nil);
end;

procedure TProDMLstNecesidades.frListadoNGetValue(const ParName: string; var ParValue: variant);
var
  Espacios : string;
  Nivel : integer;
  DS : TFIBDataSet;
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Articulo') then
  begin
     Nivel := QGenerarLst.FieldByName('V_NIVEL').AsInteger;
     case Nivel of
        -1: Espacios := ' ·E - ';
        0: Espacios := '';
        1: Espacios := DupeString(' ', Nivel * 3) + ' - ';
        else
           Espacios := DupeString(' ', Nivel * 4) + ' - ';
     end;
     ParValue := Espacios + QGenerarLst.FieldByName('V_ARTICULO').AsString;
  end;

  if (ParName = 'StockComponente') then
  begin
     ParValue := '';

     if (QGenerarLst.Active) then
        ParValue := DMMain.DameStockArticulo(QGenerarLst.FieldByName('EMPRESA').AsInteger, QGenerarLst.FieldByName('CANAL').AsInteger, QGenerarLst.FieldByName('V_ARTICULO').AsString, QGenerarLst.FieldByName('ALMACEN_SAL').AsString);
  end;

  if (ParName = 'StockUtillaje') then
  begin
     ParValue := '';
     if (QMLstTareasUtillaje.Active) then
     begin
        DS := TFIBDataSet.Create(nil);
        try
           with DS do
           begin
              Transaction := TFIBTransaction.Create(nil);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    TRParams.Add('read_committed');
                    TRParams.Add('read');
                    if (not InTransaction) then
                       StartTransaction;
                 end;
                 SelectSQL.Add(' SELECT ARTICULO, ALMACEN, EXISTENCIAS ');
                 SelectSQL.Add(' FROM A_ART_DAME_STOCK_ARTICULO(:EMPRESA, :CANAL, :ARTICULO, :SOLO_STOCK) ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' EXISTENCIAS <> 0 ');
                 Params.ByName['EMPRESA'].AsInteger := QMLstTareasUtillaje.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['CANAL'].AsInteger := QMLstTareasUtillaje.FieldByName('CANAL').AsInteger;
                 Params.ByName['ARTICULO'].AsString := QMLstTareasUtillaje.FieldByName('ARTICULOUTILLAJE').AsString;
                 Params.ByName['SOLO_STOCK'].AsInteger := 1;
                 Open;
                 ParValue := FieldByName('ALMACEN').AsString + ' x ' + DMMain.DameUnidadesConFormato(FieldByName('ARTICULO').AsString, FieldByName('EXISTENCIAS').AsFloat);
                 Next;
                 while not EOF do
                 begin
                    ParValue := ParValue + #13#10 + FieldByName('ALMACEN').AsString + ' x ' + DMMain.DameUnidadesConFormato(FieldByName('ARTICULO').AsString, FieldByName('EXISTENCIAS').AsFloat);
                    Next;
                 end;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           end;
        finally
           FreeAndNil(DS);
        end;
     end;
  end;
end;

procedure TProDMLstNecesidades.QGenerarLstAfterOpen(DataSet: TDataSet);
begin
  QListarUbicaciones.Open;
end;

procedure TProDMLstNecesidades.QGenerarLstBeforeClose(DataSet: TDataSet);
begin
  QListarUbicaciones.Close;
end;

procedure TProDMLstNecesidades.xOrdenAfterOpen(DataSet: TDataSet);
begin
  QMLstPedido.Open;
  QMLstPedidoDet.Open;
  xCompuestoCodigoCliente.Open;
end;

procedure TProDMLstNecesidades.xOrdenBeforeClose(DataSet: TDataSet);
begin
  QMLstPedido.Close;
  QMLstPedidoDet.Close;
  xCompuestoCodigoCliente.Close;
end;

procedure TProDMLstNecesidades.QMLstPedidoDetAfterOpen(DataSet: TDataSet);
begin
  with xArticuloCodigoCliente do
  begin
     Close;
     Params.ByName['CLIENTE'].AsInteger := QMLstPedido.FieldByName('CLIENTE').AsInteger;
     Open;
  end;
end;

procedure TProDMLstNecesidades.QMLstPedidoDetBeforeClose(DataSet: TDataSet);
begin
  xArticuloCodigoCliente.Close;
end;

end.
