unit UDMInfoHistorico;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, FIBTableDataSetRO;

type
  TDMInfoHistorico = class(TDataModule)
     TLocal: THYTransaction;
     DSQHist_Precios: TDataSource;
     xHist_Precios: TFIBTableSetRO;
     xHist_PreciosP_COSTE: TFloatField;
     xHist_PreciosPRECIO: TFloatField;
     xHist_PreciosFECHA: TDateTimeField;
     xHist_PreciosTIPO: TFIBStringField;
     xHist_PreciosRIG: TIntegerField;
     xHist_PreciosNARTICULO: TFIBStringField;
     xHist_PreciosNOMBRE: TFIBStringField;
     xHist_PreciosUNIDADES: TFloatField;
     xHist_PreciosDESCUENTO: TFloatField;
     xHist_PreciosDESCUENTO_2: TFloatField;
     xHist_PreciosDESCUENTO_3: TFloatField;
     xHist_PreciosMONEDA: TFIBStringField;
     xHist_PreciosID_DOC: TIntegerField;
     xHist_PreciosID_DETALLES_DOC: TIntegerField;
     xHist_PreciosCANAL: TIntegerField;
     xHist_PreciosSERIE: TFIBStringField;
     xHist_PreciosTITULO: TFIBStringField;
     xHist_PreciosUNIDADES_SEC: TFloatField;
     xHist_PreciosAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     procedure DMInfoHistoricoCreate(Sender: TObject);
     procedure xHist_PreciosPRECIOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xHist_PreciosP_COSTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     TipoDoc: integer;
  public
     { Public declarations }
     procedure FiltrarHist(const Serie, Art: string; CliProv, Tipo: integer; TipoDocumento: string; SoloEjercicio, SoloSerie, SoloCanal: boolean);
  end;

var
  DMInfoHistorico : TDMInfoHistorico;

implementation

uses UDMMain, UEntorno, Uutiles;

{$R *.DFM}

procedure TDMInfoHistorico.DMInfoHistoricoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xHist_Precios, MascaraN, MascaraI, ShortDateFormat);
  xHist_PreciosDESCUENTO.DisplayFormat := MascaraP;
  xHist_PreciosDESCUENTO_2.DisplayFormat := MascaraP;
  xHist_PreciosDESCUENTO_3.DisplayFormat := MascaraP;
  xHist_PreciosUNIDADES.DisplayFormat := MascaraI;
end;

// Filtro
procedure TDMInfoHistorico.FiltrarHist(const Serie, Art: string; CliProv, Tipo: integer; TipoDocumento: string; SoloEjercicio, SoloSerie, SoloCanal: boolean);
var
  Campo : string;
begin
  TipoDoc := Tipo;

  with DMInfoHistorico.xHist_Precios do
  begin
     Close;
     SelectSQL.Clear;

     if (Tipo = 0) then
     begin
        Campo := 'CLIENTE';

        SelectSQL.Add(' SELECT * FROM DAME_HISTORICO_ART_CLI ');
        SelectSQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CLIENTE, :ARTICULO) ');
        if (TipoDocumento <> 'ALL') then
           SelectSQL.Add(' WHERE TIPO = :TIPO ');
        SelectSQL.Add(' ORDER BY FECHA DESC ');
     end
     else
     begin
        Campo := 'PROVEEDOR';

        SelectSQL.Add(' SELECT * FROM DAME_HISTORICO_ART_PROV ');
        SelectSQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :PROVEEDOR, :ARTICULO) ');
        if (TipoDocumento <> 'ALL') then
           SelectSQL.Add(' WHERE TIPO = :TIPO ');
        SelectSQL.Add(' ORDER BY FECHA DESC ');
     end;

     // DMMain.FiltraRO(DMInfoHistorico.xHist_Precios, '11100', False);
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := Art;
     Params.ByName[Campo].AsInteger := CliProv;

     if SoloEjercicio then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio
     else
        Params.ByName['EJERCICIO'].AsInteger := 0;

     if SoloCanal then
        Params.ByName['CANAL'].AsInteger := REntorno.Canal
     else
        Params.ByName['CANAL'].AsInteger := 0;

     if SoloSerie then
        Params.ByName['SERIE'].AsString := Serie
     else
        Params.ByName['SERIE'].AsString := '';

     if (TipoDocumento <> 'ALL') then
        Params.ByName['TIPO'].AsString := TipoDocumento;
     Open;
  end;
end;

procedure TDMInfoHistorico.xHist_PreciosPRECIOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xHist_PreciosMONEDA.AsString = REntorno.MonedaEmpresa) then
     Text := FormatFloat(MascaraL, xHist_PreciosPRECIO.AsFloat)
  else
     Text := FormatFloat(DMMain.MascaraMoneda(xHist_PreciosMONEDA.AsString, 0), xHist_PreciosPRECIO.AsFloat);
end;

procedure TDMInfoHistorico.xHist_PreciosP_COSTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xHist_PreciosMONEDA.AsString = REntorno.MonedaEmpresa) then
     Text := FormatFloat(MascaraL, xHist_PreciosP_COSTE.AsFloat)
  else
  begin
     if (TipoDoc = 1) then
        Text := FormatFloat(DMMain.MascaraMoneda(xHist_PreciosMONEDA.AsString, 0),
           xHist_PreciosP_COSTE.AsFloat)
     else
        Text := FormatFloat(MascaraL, xHist_PreciosP_COSTE.AsFloat);
  end;
end;

end.
