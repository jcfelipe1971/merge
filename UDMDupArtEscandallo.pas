unit UDMDupArtEscandallo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, Classes, Forms, Dialogs, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, Controls, FIBDataSetRO;

type
  TDMDupArtEscandallo = class(TDataModule)
     QMEscandallo: TFIBTableSet;
     DSQMEscandallo: TDataSource;
     QMEscandalloEMPRESA: TIntegerField;
     QMEscandalloARTICULO: TFIBStringField;
     QMEscandalloDETALLE: TFIBStringField;
     QMEscandalloTITULO: TFIBStringField;
     QMEscandalloP_COSTE: TFloatField;
     QMEscandalloCANTIDAD: TFloatField;
     DSxArticulo: TDataSource;
     SPDuplica_Escandallo: TFIBQuery;
     TLocal: THYTransaction;
     QMEscandalloFAMILIA: TFIBStringField;
     QMArticulos: TFIBTableSet;
     QMArticulosEMPRESA: TIntegerField;
     QMArticulosEJERCICIO: TIntegerField;
     QMArticulosCANAL: TIntegerField;
     QMArticulosARTICULO: TFIBStringField;
     QMArticulosTITULO: TFIBStringField;
     QMArticulosFAMILIA: TFIBStringField;
     QMArticulosP_COSTE: TFloatField;
     QMArticulosABIERTO: TIntegerField;
     QMArticulosCONTROL_STOCK: TIntegerField;
     QMArticulosPAIS: TFIBStringField;
     QMArticulosTIPO_IVA: TIntegerField;
     QMArticulosCTA_COMPRAS: TFIBStringField;
     QMArticulosCTA_VENTAS: TFIBStringField;
     QMArticulosENTRADA: TIntegerField;
     QMArticulosUNIDADES: TFIBStringField;
     QMArticulosVIRTUAL: TIntegerField;
     QMArticulosTITULO_CORTO: TFIBStringField;
     QMArticulosNOTAS: TBlobField;
     QMArticulosDISPONIBILIDAD: TIntegerField;
     QMArticulosACTUALIZA_VENTA: TIntegerField;
     QMArticulosPTO_VERDE: TFloatField;
     DSQMArticulos: TDataSource;
     DSXArticuloDest: TDataSource;
     QMEscandalloMARCADO: TIntegerField;
     xLimpia: TFIBQuery;
     xArticuloDest: TFIBDataSetRO;
     xArticuloDestTITULO: TFIBStringField;
     xArticulo: TFIBDataSetRO;
     xArticuloTITULO: TFIBStringField;
     procedure DMArt_EscandalloCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMEscandalloDETALLEChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Duplica_Escandallo(Empresa: smallint; articulo_origen: string; articulo_destino: string);
     procedure Es_Virtual(var vir: smallint);
     procedure BusquedaCompleja;
     procedure AbreTabla(Articulo: string);
  end;

var
  DMDupArtEscandallo : TDMDupArtEscandallo;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca{, URecursos};

{$R *.DFM}

procedure TDMDupArtEscandallo.DMArt_EscandalloCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMEscandalloP_COSTE.DisplayFormat := MascaraE;
  QMEscandalloCANTIDAD.DisplayFormat := MascaraI;
end;

procedure TDMDupArtEscandallo.QMEscandalloDETALLEChange(Sender: TField);
begin
  QMEscandalloEMPRESA.AsInteger := REntorno.Empresa;
  QMEscandalloARTICULO.AsString := DMDupArtEscandallo.QMArticulosARTICULO.AsString;
  with xArticulo do
  begin
     Close;
     Open;
  end;
  QMEscandalloTITULO.AsString := xArticuloTITULO.AsString;
end;

procedure TDMDupArtEscandallo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMDupArtEscandallo.Duplica_Escandallo(Empresa: smallint; articulo_origen: string; articulo_destino: string);
begin
  with SPDuplica_Escandallo do
  begin
     Params.ByName['Empresa'].AsInteger := Empresa;
     Params.ByName['Articulo_Origen'].AsString := articulo_origen;
     Params.ByName['Articulo_Destino'].AsString := articulo_destino;
     ExecQuery;
     FreeHandle;
     Transaction.CommitRetaining;
  end;
  with QMArticulos do
  begin
     Close;
     SelectSQL.Text :=
        'select * from ver_articulos_cuentas where empresa=?empresa and ejercicio=?ejercicio and canal =?canal' +
        ' and familia<>?familia and articulo=?articulo and abierto=1';
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Familia'].AsString := REntorno.FamSistema;
     Params.ByName['Articulo'].AsString := Articulo_Origen;
     Open;
  end;
  QMEscandallo.Open;
end;

procedure TDMDupArtEscandallo.Es_Virtual(var vir: smallint);
begin
  if DMDupArtEscandallo.QMArticulosVIRTUAL.Value = 1 then
     vir := 1;
end;

procedure TDMDupArtEscandallo.BusquedaCompleja;
var
  orden : string;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(QMArticulos, '11100', False) <> mrCancel) then
  begin
     orden := QMArticulos.OrdenadoPor;
     QMArticulos.ordenar('');
     if QMArticulos.SelectSQL.Count <> 0 then
        QMArticulos.SelectSQL.Add('and familia<>''' + REntorno.FamSistema +
           '''' + ' and abierto=1');
     QMArticulos.Ordenar(orden);
  end;
  QMArticulos.Open;
  QMEscandallo.Open;
end;

procedure TDMDupArtEscandallo.AbreTabla(Articulo: string);
begin
  with QMArticulos do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Familia'].AsString := REntorno.FamSistema;
     Params.ByName['Articulo'].AsString := Articulo;
     Open;
  end;
  QMEscandallo.Open;
  xArticulo.Open;
  xArticuloDest.Close;
end;

end.
