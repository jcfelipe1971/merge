unit UDMConsultaNroSerieKri;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TDMConsultaNroSerieKri = class(TDataModule)
     TLocal: THYTransaction;
     xNroSerieKri: TFIBDataSetRO;
     xNroSerieKriEMPRESA: TIntegerField;
     xNroSerieKriARTICULO: TFIBStringField;
     xNroSerieKriNRO_SERIE: TFIBStringField;
     xNroSerieKriDEVOLUCION: TIntegerField;
     xNroSerieKriEJERCICIO_ENT: TIntegerField;
     xNroSerieKriCANAL_ENT: TIntegerField;
     xNroSerieKriSERIE_ENT: TFIBStringField;
     xNroSerieKriRIG_ENT: TIntegerField;
     xNroSerieKriLINEA_ENT: TIntegerField;
     xNroSerieKriALMACEN_ENT: TFIBStringField;
     xNroSerieKriFECHA_ENT: TDateTimeField;
     xNroSerieKriPROVEEDOR: TIntegerField;
     xNroSerieKriEJERCICIO_SAL: TIntegerField;
     xNroSerieKriCANAL_SAL: TIntegerField;
     xNroSerieKriSERIE_SAL: TFIBStringField;
     xNroSerieKriRIG_SAL: TIntegerField;
     xNroSerieKriLINEA_SAL: TIntegerField;
     xNroSerieKriALMACEN_SAL: TFIBStringField;
     xNroSerieKriCLIENTE: TIntegerField;
     xNroSerieKriFECHA_SAL: TDateTimeField;
     xNroSerieKriEJERCICIO_MOV: TIntegerField;
     xNroSerieKriCANAL_MOV: TIntegerField;
     xNroSerieKriSERIE_MOV: TFIBStringField;
     xNroSerieKriRIG_MOV: TIntegerField;
     xNroSerieKriLINEA_MOV: TIntegerField;
     xNroSerieKriALMACEN_ORI_MOV: TFIBStringField;
     xNroSerieKriFECHA_MOV: TDateTimeField;
     xNroSerieKriALMACEN_DEST_MOV: TFIBStringField;
     xNroSerieKriEJERCICIO_GAR: TIntegerField;
     xNroSerieKriCANAL_GAR: TIntegerField;
     xNroSerieKriSERIE_GAR: TFIBStringField;
     xNroSerieKriRIG_GAR: TIntegerField;
     xNroSerieKriLINEA_GAR: TIntegerField;
     xNroSerieKriALMACEN_GAR: TFIBStringField;
     xNroSerieKriFECHA_GAR: TDateTimeField;
     xNroSerieKriTITULO_PROVEEDOR: TFIBStringField;
     xNroSerieKriTITULO_CLIENTE: TFIBStringField;
     xNroSerieKriTITULO_ALMACEN_ENT: TFIBStringField;
     xNroSerieKriTITULO_ALMACEN_SAL: TFIBStringField;
     xNroSerieKriTITULO_ALMACEN_ORI_MOV: TFIBStringField;
     xNroSerieKriTITULO_ALMACEN_DEST_MOV: TFIBStringField;
     xNroSerieKriTITULO_ALMACEN_GAR: TFIBStringField;
     xNroSerieKriTRASPASADO: TIntegerField;
     xNroSerieKriID: TIntegerField;
     xNroSerieKriLOTE: TFIBStringField;
     xNroSerieKriCADUCIDAD: TDateTimeField;
     DSxNroSerieKri: TDataSource;
     xLotesEntradas: TFIBDataSetRO;
     xLotesSalidas: TFIBDataSetRO;
     DSxLotesEntradas: TDataSource;
     DSxLotesSalidas: TDataSource;
     xLotesEntradasCOUNT: TIntegerField;
     xLotesEntradasEMPRESA: TIntegerField;
     xLotesEntradasARTICULO: TFIBStringField;
     xLotesEntradasLOTE: TFIBStringField;
     xLotesEntradasCADUCIDAD: TDateTimeField;
     xLotesEntradasEJERCICIO_ENT: TIntegerField;
     xLotesEntradasCANAL_ENT: TIntegerField;
     xLotesEntradasSERIE_ENT: TFIBStringField;
     xLotesEntradasRIG_ENT: TIntegerField;
     xLotesEntradasLINEA_ENT: TIntegerField;
     xLotesEntradasFECHA_ENT: TDateTimeField;
     xLotesEntradasALMACEN_ENT: TFIBStringField;
     xLotesEntradasTITULO_ALMACEN_ENT: TFIBStringField;
     xLotesEntradasPROVEEDOR: TIntegerField;
     xLotesEntradasTITULO_PROVEEDOR: TFIBStringField;
     xLotesSalidasCOUNT: TIntegerField;
     xLotesSalidasEMPRESA: TIntegerField;
     xLotesSalidasARTICULO: TFIBStringField;
     xLotesSalidasLOTE: TFIBStringField;
     xLotesSalidasCADUCIDAD: TDateTimeField;
     xLotesSalidasEJERCICIO_SAL: TIntegerField;
     xLotesSalidasCANAL_SAL: TIntegerField;
     xLotesSalidasSERIE_SAL: TFIBStringField;
     xLotesSalidasRIG_SAL: TIntegerField;
     xLotesSalidasLINEA_SAL: TIntegerField;
     xLotesSalidasFECHA_SAL: TDateTimeField;
     xLotesSalidasALMACEN_SAL: TFIBStringField;
     xLotesSalidasTITULO_ALMACEN_SAL: TFIBStringField;
     xLotesSalidasCLIENTE: TIntegerField;
     xLotesSalidasTITULO_CLIENTE: TFIBStringField;
     xNroDeLote: TFIBDataSetRO;
     DSxNroDeLote: TDataSource;
     xNroDeLoteCOUNT: TIntegerField;
     xNroDeLoteEMPRESA: TIntegerField;
     xNroDeLoteARTICULO: TFIBStringField;
     xNroDeLoteLOTE: TFIBStringField;
     xNroDeLoteCADUCIDAD: TDateTimeField;
     xNroSerieKriDEVOLUCION_VENTA: TIntegerField;
     xNroSerieKriEJERCICIO_DEV: TIntegerField;
     xNroSerieKriCANAL_DEV: TIntegerField;
     xNroSerieKriSERIE_DEV: TFIBStringField;
     xNroSerieKriRIG_DEV: TIntegerField;
     xNroSerieKriLINEA_DEV: TIntegerField;
     xNroSerieKriALMACEN_DEV: TFIBStringField;
     xNroSerieKriFECHA_DEV: TDateTimeField;
     xNroSerieKriTITULO_ALMACEN_DEV: TFIBStringField;
     xNroSerieKriEJERCICIO_MOE: TIntegerField;
     xNroSerieKriCANAL_MOE: TIntegerField;
     xNroSerieKriSERIE_MOE: TFIBStringField;
     xNroSerieKriRIG_MOE: TIntegerField;
     xNroSerieKriLINEA_MOE: TIntegerField;
     xNroSerieKriALMACEN_MOE: TFIBStringField;
     xNroSerieKriFECHA_MOE: TDateTimeField;
     xNroSerieKriTITULO_ALMACEN_MOE: TFIBStringField;
     xNroSerieKriEJERCICIO_MOS: TIntegerField;
     xNroSerieKriCANAL_MOS: TIntegerField;
     xNroSerieKriSERIE_MOS: TFIBStringField;
     xNroSerieKriRIG_MOS: TIntegerField;
     xNroSerieKriLINEA_MOS: TIntegerField;
     xNroSerieKriALMACEN_MOS: TFIBStringField;
     xNroSerieKriFECHA_MOS: TDateTimeField;
     xNroSerieKriTITULO_ALMACEN_MOS: TFIBStringField;
     xLotesMovEnt: TFIBDataSetRO;
     xLotesMovSal: TFIBDataSetRO;
     DSxLotesMovEnt: TDataSource;
     DSxLotesMovSal: TDataSource;
     xLotesMovEntCOUNT: TIntegerField;
     xLotesMovEntEMPRESA: TIntegerField;
     xLotesMovEntARTICULO: TFIBStringField;
     xLotesMovEntLOTE: TFIBStringField;
     xLotesMovEntCADUCIDAD: TDateTimeField;
     xLotesMovEntEJERCICIO_MOE: TIntegerField;
     xLotesMovEntCANAL_MOE: TIntegerField;
     xLotesMovEntSERIE_MOE: TFIBStringField;
     xLotesMovEntRIG_MOE: TIntegerField;
     xLotesMovEntLINEA_MOE: TIntegerField;
     xLotesMovEntFECHA_MOE: TDateTimeField;
     xLotesMovEntALMACEN_MOE: TFIBStringField;
     xLotesMovEntTITULO_ALMACEN_MOE: TFIBStringField;
     xLotesMovSalCOUNT: TIntegerField;
     xLotesMovSalEMPRESA: TIntegerField;
     xLotesMovSalARTICULO: TFIBStringField;
     xLotesMovSalLOTE: TFIBStringField;
     xLotesMovSalCADUCIDAD: TDateTimeField;
     xLotesMovSalEJERCICIO_MOS: TIntegerField;
     xLotesMovSalCANAL_MOS: TIntegerField;
     xLotesMovSalSERIE_MOS: TFIBStringField;
     xLotesMovSalRIG_MOS: TIntegerField;
     xLotesMovSalLINEA_MOS: TIntegerField;
     xLotesMovSalFECHA_MOS: TDateTimeField;
     xLotesMovSalALMACEN_MOS: TFIBStringField;
     xLotesMovSalTITULO_ALMACEN_MOS: TFIBStringField;
     xLotesSalidasDEVOLUCION_VENTA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xLotesMovEntAfterScroll(DataSet: TDataSet);
     procedure xNroDeLoteAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BuscaNroSerie(NroSerie: string);
     procedure BuscaArticuloSerie(Articulo: string);
     procedure BuscaLote(Lote: string);
     procedure BuscaArticuloLote(Articulo: string);
  end;

var
  DMConsultaNroSerieKri : TDMConsultaNroSerieKri;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMConsultaNroSerieKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  TLocal.StartTransaction;
end;

procedure TDMConsultaNroSerieKri.DataModuleDestroy(Sender: TObject);
begin
  TLocal.Commit;
end;

procedure TDMConsultaNroSerieKri.BuscaNroSerie(NroSerie: string);
begin
  if (Trim(NroSerie) <> '') then
  begin
     with xNroSerieKri do
     begin
        Close;
        SelectSQL.Text := 'SELECT * FROM NRO_SERIE_KRI WHERE EMPRESA=' +
           REntorno.EmpresaStr + ' AND NRO_SERIE = ''' + NroSerie +
           ''' ORDER BY TITULO_CLIENTE';
        Open;
     end;
  end;
end;

procedure TDMConsultaNroSerieKri.BuscaArticuloSerie(Articulo: string);
begin
  if (Trim(Articulo) <> '') then
  begin
     with xNroSerieKri do
     begin
        Close;
        SelectSQL.Text := 'SELECT * FROM NRO_SERIE_KRI WHERE EMPRESA=' +
           REntorno.EmpresaStr + ' AND ARTICULO = ''' + Articulo +
           ''' ORDER BY TITULO_CLIENTE';
        Open;
     end;
  end;
end;

procedure TDMConsultaNroSerieKri.BuscaLote(Lote: string);
begin
  if (Trim(Lote) <> '') then
  begin
     with xNroDeLote do
     begin
        Close;
        SelectSQL.Text :=
           'select count(*),empresa,articulo,lote,caducidad from nro_serie_kri ' +
           'where ' +
           'empresa = ' + REntorno.EmpresaStr + ' and ' +
           'lote = ''' + Lote + ''' ' +
           'group by empresa,articulo,lote,caducidad ';
        Open;
        {         xLotesEntradas.Close;
         xLotesEntradas.Open;
         xLotesSalidas.Close;
         xLotesSalidas.Open;}
     end;
  end;
end;

procedure TDMConsultaNroSerieKri.BuscaArticuloLote(Articulo: string);
begin
  if (Trim(Articulo) <> '') then
  begin
     with xNroDeLote do
     begin
        Close;
        SelectSQL.Text :=
           'select count(*),empresa,articulo,lote,caducidad from nro_serie_kri ' +
           'where ' +
           'empresa = ' + REntorno.EmpresaStr + ' and ' +
           'articulo = ''' + Articulo + ''' ' +
           'group by empresa,articulo,lote,caducidad ';
        Open;
        {         xLotesEntradas.Close;
         xLotesEntradas.Open;
         xLotesSalidas.Close;
         xLotesSalidas.Open;}
     end;
  end;
end;

procedure TDMConsultaNroSerieKri.xLotesMovEntAfterScroll(DataSet: TDataSet);
begin
  {   xLotesMovEnt.Close;
   xLotesMovEnt.Open;

   xLotesMovSal.Close;
   xLotesMovSal.Params.ByName['EMPRESA'].AsInteger := xNroDeLoteEMPRESA.AsInteger;
   xLotesMovSal.Params.ByName['ARTICULO'].AsString := xNroDeLoteARTICULO.AsString;
   xLotesMovSal.Params.ByName['LOTE'].AsString := xNroDeLoteLOTE.AsString;}
  {   xLotesMovSal.Params.ByName['EJERCICIO_ENT'].AsInteger := xLotesEntradasEJERCICIO_ENT.AsInteger;
   xLotesMovSal.Params.ByName['CANAL_ENT'].AsInteger := xLotesEntradasCANAL_ENT.AsInteger;
   xLotesMovSal.Params.ByName['SERIE_ENT'].AsString := xLotesEntradasSERIE_ENT.AsString;
   xLotesMovSal.Params.ByName['RIG_ENT'].AsInteger := xLotesEntradasRIG_ENT.AsInteger;
   xLotesMovSal.Params.ByName['LINEA_ENT'].AsInteger := xLotesEntradasLINEA_ENT.AsInteger;
   xLotesMovSal.Params.ByName['EJERCICIO_MOE'].AsInteger := xLotesMovEntEJERCICIO_MOE.AsInteger;
   xLotesMovSal.Params.ByName['CANAL_MOE'].AsInteger := xLotesMovEntCANAL_MOE.AsInteger;
   xLotesMovSal.Params.ByName['SERIE_MOE'].AsString := xLotesMovEntSERIE_MOE.AsString;
   xLotesMovSal.Params.ByName['RIG_MOE'].AsInteger := xLotesMovEntRIG_MOE.AsInteger;
   xLotesMovSal.Params.ByName['LINEA_MOE'].AsInteger := xLotesMovEntLINEA_MOE.AsInteger;
   xLotesMovSal.Open;}
end;

procedure TDMConsultaNroSerieKri.xNroDeLoteAfterScroll(DataSet: TDataSet);
begin
  xLotesEntradas.Close;
  xLotesEntradas.Open;
  xLotesSalidas.Close;
  xLotesSalidas.Open;
  xLotesMovEnt.Close;
  xLotesMovEnt.Open;
  xLotesMovSal.Close;
  xLotesMovSal.Open;
end;

end.
