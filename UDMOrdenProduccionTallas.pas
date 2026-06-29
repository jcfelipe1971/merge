unit UDMOrdenProduccionTallas;

interface

uses
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet, HYFIBQuery,
  FIBDataSetRO, FIBQuery;

type
  TDMOrdenProduccionTallas = class(TDataModule)
     QMDetalle: TFIBDataSet;
     TLocal: THYTransaction;
     QMCabecera: TFIBDataSet;
     DSQMCabecera: TDataSource;
     DSQMDetalle: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleNORDEN: TIntegerField;
     QMDetalleREF_PROVEEDOR: TFIBStringField;
     QMDetalleESCANDALLO: TIntegerField;
     QMDetalleS_COLOR: TFIBStringField;
     QMDetalleID_A_M_C: TIntegerField;
     QMDetalleID_G_T: TIntegerField;
     QMDetalleTITM: TFIBStringField;
     QMDetalleTITMC: TFIBStringField;
     QMDetalleT01: TFloatField;
     QMDetalleT02: TFloatField;
     QMDetalleT03: TFloatField;
     QMDetalleT04: TFloatField;
     QMDetalleT05: TFloatField;
     QMDetalleT06: TFloatField;
     QMDetalleT07: TFloatField;
     QMDetalleT08: TFloatField;
     QMDetalleT09: TFloatField;
     QMDetalleT10: TFloatField;
     QMDetalleT11: TFloatField;
     QMDetalleT12: TFloatField;
     QMDetalleT13: TFloatField;
     QMDetalleT14: TFloatField;
     QMDetalleT15: TFloatField;
     QMDetalleT16: TFloatField;
     QMDetalleT17: TFloatField;
     QMDetalleT18: TFloatField;
     QMDetalleT19: TFloatField;
     QMDetalleT20: TFloatField;
     QMDetalleT21: TFloatField;
     QMDetalleT22: TFloatField;
     QMaxNOrden: TFIBQuery;
     QID_G_T: TFIBQuery;
     QTituloTalla: TFIBQuery;
     QTraspasaOrden: TFIBQuery;
     xget_tallas: TFIBDataSetRO;
     xget_tallasNVISIBLE: TIntegerField;
     xget_tallasGRUPO: TFIBStringField;
     xget_tallasT01: TFIBStringField;
     xget_tallasT02: TFIBStringField;
     xget_tallasT03: TFIBStringField;
     xget_tallasT04: TFIBStringField;
     xget_tallasT05: TFIBStringField;
     xget_tallasT06: TFIBStringField;
     xget_tallasT07: TFIBStringField;
     xget_tallasT08: TFIBStringField;
     xget_tallasT09: TFIBStringField;
     xget_tallasT10: TFIBStringField;
     xget_tallasT11: TFIBStringField;
     xget_tallasT12: TFIBStringField;
     xget_tallasT13: TFIBStringField;
     xget_tallasT14: TFIBStringField;
     xget_tallasT15: TFIBStringField;
     xget_tallasT16: TFIBStringField;
     xget_tallasT17: TFIBStringField;
     xget_tallasT18: TFIBStringField;
     xget_tallasT19: TFIBStringField;
     xget_tallasT20: TFIBStringField;
     xget_tallasT21: TFIBStringField;
     xget_tallasT22: TFIBStringField;
     xget_tallasID_G_T: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraNORDEN: TIntegerField;
     QMCabeceraPEDIDO: TIntegerField;
     QMCabeceraLINEA: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraPRIORIDAD: TIntegerField;
     QMCabeceraP_MERMA: TFloatField;
     QMCabeceraFECHA_ENTREGA: TDateTimeField;
     QMCabeceraMATERIAL: TIntegerField;
     QMCabeceraTERCERO_OPERARIO: TIntegerField;
     QMCabeceraFECHA_ORDEN: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleREF_PROVEEDORChange(Sender: TField);
     procedure QMCabeceraAfterPost(DataSet: TDataSet);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     function GetTituloTalla(id_g_t: integer; talla: string): string;
     procedure PoneTitulos;
     procedure TraspasaOrden;
     function DameUds(talla: integer): integer;
     function DameStock(talla: integer): integer;
     function DameEnProduccion(talla: integer): integer;
     function DameVisible(talla: integer): boolean;
  end;

var
  DMOrdenProduccionTallas : TDMOrdenProduccionTallas;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMOrdenProduccionTallas.DataModuleCreate(Sender: TObject);
begin
  if (not QMCabecera.Transaction.InTransaction) then
     QMCabecera.Transaction.StartTransaction;
  QMCabecera.Close;
  QMCabecera.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMCabecera.Open;
end;

procedure TDMOrdenProduccionTallas.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  QMDetalle.Close;
  QMDetalle.Open;
  PoneTitulos;
end;

procedure TDMOrdenProduccionTallas.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  with QMaxNOrden do
  begin
     Close;
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     ExecQuery;
     QMCabeceraNORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
     Transaction.Commit;
  end;
end;

procedure TDMOrdenProduccionTallas.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabeceraCANAL.AsInteger := REntorno.Canal;
  QMCabeceraSERIE.AsString := REntorno.Serie;
  QMCabeceraTERCERO_OPERARIO.AsInteger := 1;
  QMCabeceraPEDIDO.AsInteger := 0;
  QMCabeceraLINEA.AsInteger := 0;
  QMCabeceraFECHA_ORDEN.AsDateTime := Now;
  QMCabeceraFECHA_ENTREGA.AsDateTime := Now;
  QMCabeceraALMACEN.AsString := REntorno.AlmacenDefecto;
  QMCabeceraPRIORIDAD.AsInteger := 0;
  QMCabeceraMATERIAL.AsInteger := 0;
  QMCabeceraP_MERMA.AsFloat := 0;
end;

procedure TDMOrdenProduccionTallas.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMDetalleEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMDetalleCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMDetalleSERIE.AsString := QMCabeceraSERIE.AsString;
  QMDetalleNORDEN.AsInteger := QMCabeceraNORDEN.AsInteger;
  QMDetalleESCANDALLO.AsInteger := 1;
end;

procedure TDMOrdenProduccionTallas.QMDetalleAfterPost(DataSet: TDataSet);
begin
  QMDetalle.Transaction.CommitRetaining;
end;

procedure TDMOrdenProduccionTallas.QMDetalleREF_PROVEEDORChange(Sender: TField);
begin
  with QID_G_T do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['REF_PROVEEDOR'].AsString := QMDetalleREF_PROVEEDOR.AsString;
     ExecQuery;
     QMDetalleID_G_T.AsInteger := FieldByName['ID_G_T'].AsInteger;
     Transaction.Commit;
  end;
  PoneTitulos;
end;

function TDMOrdenProduccionTallas.GetTituloTalla(id_g_t: integer; talla: string): string;
begin
  with QTituloTalla do
  begin
     Result := ' ';
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Params.ByName['ID_G_T'].AsInteger := id_g_t;
     Params.ByName['COD_TALLA'].AsString := talla;
     ExecQuery;
     if (not EOF) then
        Result := FieldByName['TALLA'].AsString;
     Transaction.Commit;
  end;
end;

procedure TDMOrdenProduccionTallas.QMCabeceraAfterPost(DataSet: TDataSet);
begin
  QMCabecera.Transaction.CommitRetaining;
end;

procedure TDMOrdenProduccionTallas.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  PoneTitulos;
end;

procedure TDMOrdenProduccionTallas.PoneTitulos;
begin
  with xget_tallas do
  begin
     Open;
     Last;
     Locate('ID_G_T', QMDetalleID_G_T.AsInteger, []);
  end;
  {  with QMDetalle do
  begin
    for i := 0 to FieldCount - 1 do
    begin
       if ((Fields[i].FieldName[1] = 'T') and
           (Fields[i].FieldName[2] in ['0'..'9']) and
           (Fields[i].FieldName[3] in ['0'..'9'])) then
       begin
         aux := GetTituloTalla(QMDetalleID_G_T.AsInteger,copy(Fields[i].FieldName,2,2));
           Fields[i].DisplayLabel := aux;
       end;
    end;
  end;}
end;

procedure TDMOrdenProduccionTallas.TraspasaOrden;
begin
  with QTraspasaOrden do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['NORDEN'].AsInteger := QMCabeceraNORDEN.AsInteger;
     ExecQuery;
     Transaction.Commit;
  end;
  QMCabecera.Close;
  QMCabecera.Open;
end;

procedure TDMOrdenProduccionTallas.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  if (QMCabecera.State = dsInsert) then
     QMCabecera.Post;
end;

function TDMOrdenProduccionTallas.DameUds(talla: integer): integer;
begin
  if (talla > 9) then
     Result := QMDetalle.FieldByName('T' + IntToStr(talla)).AsInteger
  else
     Result := QMDetalle.FieldByName('T0' + IntToStr(talla)).AsInteger;
end;

function TDMOrdenProduccionTallas.DameStock(talla: integer): integer;
var
  Q : THYFIBQuery;
begin
  Result := 0;
  if (QMDetalleID_A_M_C.AsString > '') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EXISTENCIAS FROM a_art_dame_stock_art_ed (:empresa, :canal, ' +
           '(select articulo from  art_articulos_m_c_tallas where ' +
           'id_a_t=-:id_a_t and id_a_m_c=:id_a_m_c), :almacen, 1, 0, 0, 0, 0, 0, 0, null)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := 0;
        Params.ByName['ALMACEN'].AsString := '';
        Params.ByName['ID_A_T'].AsInteger := talla;
        Params.ByName['ID_A_M_C'].AsInteger := QMDetalleID_A_M_C.AsInteger;
        ExecQuery;
        Result := FieldByName['EXISTENCIAS'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

function TDMOrdenProduccionTallas.DameEnProduccion(talla: integer): integer;
var
  Q : THYFIBQuery;
begin
  Result := 0;
  if (QMDetalleID_A_M_C.AsString > '') then
  begin
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select sum(aop.unidades) from art_ordenes_produccion aop join art_articulos art ' +
           'on aop.empresa = art.empresa and aop.articulo = art.articulo ' +
           'join art_articulos_m_c_tallas aamct ' +
           'on aamct.id_a_m_c_t = art. id_a_m_c_t ' +
           'where aop.estado <= 1 and aop.empresa = ' + REntorno.EmpresaStr +
           ' and aamct.id_a_m_c = ' + QMDetalleID_A_M_C.AsString +
           ' and aamct.id_a_t = ' + IntToStr(talla);
        ExecQuery;
        Result := FieldByName['SUM'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
  end;
end;

function TDMOrdenProduccionTallas.DameVisible(talla: integer): boolean;
begin
  Result := talla <= xget_tallasNVISIBLE.AsInteger;
end;

end.
