unit UDMNumerosDeSerieKriCompra;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados;

type
  TDMNumerosDeSerieKriCompra = class(TDataModule)
     InsertarNroSerie: TFIBQuery;
     xCuantosAsignados: TFIBQuery;
     SacarNroSerie: TFIBQuery;
     xTieneMovimiento: TFIBQuery;
     xArticulos: TFIBTableSet;
     NumerosDeSerieEntrados: TFIBTableSet;
     FIBTableSet3: TFIBTableSet;
     DSxArticulos: TDataSource;
     DSNumerosDeSerie: TDataSource;
     DataSource3: TDataSource;
     DSxEscandallo: TDataSource;
     xEscandallo: TFIBTableSet;
     xArticulosEMPRESA: TIntegerField;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     xArticulosSERIALIZADO_KRI: TIntegerField;
     xEscandalloEMPRESA: TIntegerField;
     xEscandalloARTICULO: TFIBStringField;
     xEscandalloDETALLE: TFIBStringField;
     xEscandalloCANTIDAD: TFloatField;
     NumerosDeSerieEntradosNRO_SERIE: TFIBStringField;
     xOldArticulo: TFIBQuery;
     BorraNroDeSerie: TFIBQuery;
     Local: THYTransaction;
     procedure DMNumerosDeSerieKriCompraCreate(Sender: TObject);
     procedure DMNumerosDeSerieKriCompraDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Refrescar(empresa: integer; articulo: string; ejercicio: integer; canal: integer; serie: string; rig: integer; linea: integer);
  end;

var
  DMNumerosDeSerieKriCompra : TDMNumerosDeSerieKriCompra;

implementation

uses UDMMain;

{$R *.DFM}

procedure TDMNumerosDeSerieKriCompra.Refrescar(empresa: integer; articulo: string; ejercicio: integer; canal: integer; serie: string; rig: integer; linea: integer);
begin
  xArticulos.Close;
  xArticulos.Params.ByName['EMPRESA'].AsInteger := empresa;
  xArticulos.Params.ByName['ARTICULO'].AsString := articulo;
  xArticulos.Open;
  xEscandallo.Close;
  xEscandallo.Open;
  NumerosDeSerieEntrados.Close;
  NumerosDeSerieEntrados.Params.ByName['RIG_ENT'].AsInteger := rig;
  NumerosDeSerieEntrados.Params.ByName['EJERCICIO_ENT'].AsInteger := ejercicio;
  NumerosDeSerieEntrados.Params.ByName['CANAL_ENT'].AsInteger := canal;
  NumerosDeSerieEntrados.Params.ByName['SERIE_ENT'].AsString := serie;
  NumerosDeSerieEntrados.Params.ByName['LINEA_ENT'].AsInteger := linea;
  NumerosDeSerieEntrados.Open;
end;

procedure TDMNumerosDeSerieKriCompra.DMNumerosDeSerieKriCompraCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  Local.StartTransaction;
end;

procedure TDMNumerosDeSerieKriCompra.DMNumerosDeSerieKriCompraDestroy(Sender: TObject);
begin
  Local.Commit;
end;

end.
