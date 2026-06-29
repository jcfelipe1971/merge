unit UDMLstCondicionesCompra;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Forms, Classes, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBDataSetRO, FIB,
  FR_Class, Fr_HYReport, FIBTableDataSetRO, FIBDatabase, UFIBModificados,
  UFormGest, UEntorno, FIBTableDataSet, FIBQuery, HYFIBQuery, UHYReport,
  frxClass, frxHYReport, frxDBSet;

type
  TDMLstCondicionesCompra = class(TDataModule)
     TLocal: THYTransaction;
     QMCondicionesCompra: TFIBTableSetRO;
     frDSQMCondicionesCompra: TfrDBDataSet;
     frCondicionesCompras: TfrHYReport;
     DSCondicionesCompra: TDataSource;
     DSxCabecera: TDataSource;
     QMxCabecera: TFIBTableSetRO;
     frDSxCabecera: TfrDBDataSet;
     QMxLinea: TFIBTableSetRO;
     DSxLinea: TDataSource;
     frDSxLinea: TfrDBDataSet;
     QMxMax: THYFIBQuery;
     QMxMin: THYFIBQuery;
     DSTercero: TDataSource;
     frDSQMTercero: TfrDBDataSet;
     QMTerceroTERCERO: TIntegerField;
     QMTerceroNOMBRE_R_SOCIAL: TFIBStringField;
     QMTerceroNIF: TFIBStringField;
     QMTerceroDIR_COMPLETA: TFIBStringField;
     QMTercero: TFIBDataSetRO;
     QMxLineaEMPRESA: TIntegerField;
     QMxLineaEJERCICIO: TIntegerField;
     QMxLineaCANAL: TIntegerField;
     QMxLineaTIPO: TFIBStringField;
     QMxLineaRIG: TIntegerField;
     QMxLineaLINEA: TIntegerField;
     QMxLineaUNID_MINIMAS: TFloatField;
     QMxLineaUNID_MAXIMAS: TFloatField;
     QMxLineaPRECIO: TFloatField;
     QMxLineaDESCUENTO: TFloatField;
     QMxLineaDESCUENTO_2: TFloatField;
     QMxLineaDESCUENTO_3: TFloatField;
     QMCondicionesCompraEMPRESA: TIntegerField;
     QMCondicionesCompraPROVEEDOR: TIntegerField;
     QMCondicionesCompraTERCERO: TIntegerField;
     QMCondicionesCompraTITULO: TFIBStringField;
     QMCondicionesCompraNIF: TFIBStringField;
     QMCondicionesCompraDESCUENTO: TFloatField;
     QMCondicionesCompraDIA_PAGO_1: TIntegerField;
     QMCondicionesCompraDIA_PAGO_2: TIntegerField;
     QMCondicionesCompraDESCUENTO_PP: TFloatField;
     QMCondicionesCompraNOTAS: TBlobField;
     HYReport: THYReport;
     QMxCabeceraEMPRESA: TIntegerField;
     QMxCabeceraEJERCICIO: TIntegerField;
     QMxCabeceraCANAL: TIntegerField;
     QMxCabeceraTIPO: TFIBStringField;
     QMxCabeceraRIG: TIntegerField;
     QMxCabeceraPROVEEDOR: TIntegerField;
     QMxCabeceraTITULO_PROVEEDOR: TFIBStringField;
     QMxCabeceraARTICULO: TFIBStringField;
     QMxCabeceraTITULO_ARTICULO: TFIBStringField;
     QMxCabeceraFAMILIA: TFIBStringField;
     QMxCabeceraTITULO_FAMILIA: TFIBStringField;
     QMxCabeceraAGRUPACION: TFIBStringField;
     QMxCabeceraTITULO_AGRUPACION: TFIBStringField;
     QMxCabeceraALTA: TDateTimeField;
     QMxCabeceraBAJA: TDateTimeField;
     QMxCabeceraACTIVO: TIntegerField;
     frxCondicionesCompras: TfrxHYReport;
     frxDSQMCondicionesCompra: TfrxDBDataset;
     frxDSxCabecera: TfrxDBDataset;
     frxDSxLinea: TfrxDBDataset;
     frxDSQMTercero: TfrxDBDataset;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure filtrartabla(Modo: integer);
     procedure QMxCabeceraAfterScroll(DataSet: TDataSet);
     procedure frCondicionesComprasEnterRect(Memo: TStringList; View: TfrView);
     procedure frCondicionesComprasGetValue(const ParName: string; var ParValue: variant);
     procedure frxCondicionesComprasBeforePrint(Sender: TfrxReportComponent);
     procedure frxCondicionesComprasGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     minimo, maximo: string;
     procedure Rango(tp: integer);
     procedure EstableceMascaras;
  end;

var
  DMLstCondicionesCompra : TDMLstCondicionesCompra;
  SW : integer;

implementation

uses UDMListados, UDMMain, Dialogs, UDMCondicionesCompra;

{$R *.dfm}

procedure TDMLstCondicionesCompra.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Self.EstableceMascaras;
  AbreData(TDMListados, DMListados);

  // DMMain.FiltraRO(QMCondicionesVenta,'10000',true);
  DMMain.FiltraRO(QMxCabecera, '11100', True);
  DMMain.FiltraRO(QMxLinea, '11100', True);
  DMMain.FiltraRO(QMTercero, '00000', True);

  Self.EstableceMascaras;
end;

procedure TDMLstCondicionesCompra.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  CierraData(DMLstCondicionesCompra);
  Application.ProcessMessages;
end;

procedure TDMLstCondicionesCompra.filtrartabla(Modo: integer);
var
  str : string;
begin
  DMListados.Cargar(161, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frCondicionesCompras.LoadFromFIB(REntorno.Formato, str);
     frCondicionesCompras.PrepareReport;
     case modo of
        0: frCondicionesCompras.ShowPreparedReport;
        1: frCondicionesCompras.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxCondicionesCompras.LoadFromFIB(REntorno.Formato, str);
     frxCondicionesCompras.PrepareReport;
     case Modo of
        0: frxCondicionesCompras.ShowPreparedReport;
        1: frxCondicionesCompras.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMLstCondicionesCompra.QMxCabeceraAfterScroll(DataSet: TDataSet);
begin
  with QMxLinea do
  begin
     Close;
     Open;
  end;
end;

//****************************************************************************

procedure TDMLstCondicionesCompra.Rango(tp: integer);
begin
  case tp of
     1:
     begin
        QMxMin.SQL.Clear;
        QMxMin.SQL.Add('SELECT MIN(PROVEEDOR) AS MINIMO FROM VER_PROVEEDORES_EMPRESA WHERE EMPRESA=?EMPRESA');
        QMxMax.SQL.Clear;
        QMxMax.SQL.Add('SELECT MAX(PROVEEDOR) AS MAXIMO FROM VER_PROVEEDORES_EMPRESA WHERE EMPRESA=?EMPRESA');
        QMxMin.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        QMxMax.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     end;
     2:
     begin
        QMxMin.SQL.Clear;
        QMxMin.SQL.Add('SELECT MIN(ARTICULO) AS MINIMO FROM ART_ARTICULOS WHERE EMPRESA=?EMPRESA ' +
           'and Familia<>''' + REntorno.FamSistema + '''');
        QMxMax.SQL.Clear;
        QMxMax.SQL.Add('SELECT MAX(ARTICULO) AS MAXIMO FROM ART_ARTICULOS WHERE EMPRESA=?EMPRESA ' +
           'and Familia<>''' + REntorno.FamSistema + '''');
        QMxMin.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        QMxMax.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     end;
     3:
     begin
        QMxMin.SQL.Clear;
        QMxMin.SQL.Add('SELECT MIN(FAMILIA) AS MINIMO FROM ART_FAMILIAS WHERE EMPRESA=?EMPRESA ' +
           'and Familia<>''' + REntorno.FamSistema + '''');
        QMxMax.SQL.Clear;
        QMxMax.SQL.Add('SELECT MAX(FAMILIA) AS MAXIMO FROM ART_FAMILIAS WHERE EMPRESA=?EMPRESA ' +
           'and Familia<>''' + REntorno.FamSistema + '''');
        QMxMin.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        QMxMax.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     end;
     4:
     begin
        QMxMin.SQL.Clear;
        QMxMin.SQL.Add('SELECT MIN(AGRUPACION) AS MINIMO FROM SYS_AGRUPACIONES WHERE TIPO=''T''');
        QMxMax.SQL.Clear;
        QMxMax.SQL.Add('SELECT MAX(AGRUPACION) AS MAXIMO FROM SYS_AGRUPACIONES WHERE TIPO=''T''');
     end;
  end;

  with QMxMin do
  begin
     ExecQuery;
     minimo := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMxMax do
  begin
     ExecQuery;
     maximo := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMLstCondicionesCompra.EstableceMascaras;
begin
  QMxLineaPRECIO.DisplayFormat := MascaraN;
  QMxLineaDESCUENTO.DisplayFormat := MascaraP;
  QMxLineaDESCUENTO_2.DisplayFormat := MascaraP;
  QMxLineaDESCUENTO_3.DisplayFormat := MascaraP;
end;

//****************************************************************************

procedure TDMLstCondicionesCompra.frCondicionesComprasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstCondicionesCompra.frCondicionesComprasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'UnidMaximas' then
  begin
     if (QMxLineaUNID_MAXIMAS.AsFloat = 1999999999) then
        ParValue := '--------------'
     else
        ParValue := FormatFloat(MascaraI, QMxLineaUNID_MAXIMAS.AsFloat);
  end;
end;

procedure TDMLstCondicionesCompra.frxCondicionesComprasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLstCondicionesCompra.frxCondicionesComprasGetValue(const VarName: string; var Value: variant);
begin
  frCondicionesComprasGetValue(VarName, Value);
end;

end.
