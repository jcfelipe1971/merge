unit UDMNumerosDeSerieKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados;

type
  TDMNumerosDeSerieKri = class(TDataModule)
     xArticulos: TFIBTableSet;
     NroSerieDisponible: TFIBTableSet;
     NroSerieAsignado: TFIBTableSet;
     NroSerieDisponibleNRO_SERIE: TFIBStringField;
     DSxArticulos: TDataSource;
     DSNroSerieDisponible: TDataSource;
     DSNroSerieAsignado: TDataSource;
     NroSerieAsignadoNRO_SERIE: TFIBStringField;
     InsertarNroSerie: TFIBQuery;
     SacarNroSerie: TFIBQuery;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     xArticulosSERIALIZADO_KRI: TIntegerField;
     xArticulosEMPRESA: TIntegerField;
     xEscandallo: TFIBTableSet;
     DSxEscandallo: TDataSource;
     xEscandalloEMPRESA: TIntegerField;
     xEscandalloARTICULO: TFIBStringField;
     xEscandalloDETALLE: TFIBStringField;
     xEscandalloCANTIDAD: TFloatField;
     xCuantosAsignados: TFIBQuery;
     xOldArticulo: TFIBQuery;
     BorraNrosDeSerie: TFIBQuery;
     Local: THYTransaction;
     NroSerieDisponibleGar: TFIBTableSet;
     NroSerieAsignadoGar: TFIBTableSet;
     DSNroSerieDisponibleGar: TDataSource;
     DSNroSerieAsignadoGar: TDataSource;
     xCuantosAsignadosGar: TFIBQuery;
     InsertarNroSerieGar: TFIBQuery;
     NroSerieDisponibleGarNRO_SERIE: TFIBStringField;
     NroSerieAsignadoGarNRO_SERIE: TFIBStringField;
     SacarNroSerieGar: TFIBQuery;
     NroSerieDisponibleALMACEN_ENT: TFIBStringField;
     xArticulosABIERTO: TIntegerField;
     NroSerieDisponibleID: TIntegerField;
     NroSerieDisponibleGarID: TIntegerField;
     procedure DMNumerosDeSerieKriCreate(Sender: TObject);
     procedure DMNumerosDeSerieKriDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Refrescar(empresa: integer; articulo: string; ejercicio: integer; canal: integer; serie: string; rig: integer; linea: integer; cliente: integer; almacen: string);
  end;

var
  DMNumerosDeSerieKri : TDMNumerosDeSerieKri;

implementation

uses UDMMain;

{$R *.DFM}

procedure TDMNumerosDeSerieKri.Refrescar(empresa: integer; articulo: string; ejercicio: integer; canal: integer; serie: string; rig: integer; linea: integer; cliente: integer; almacen: string);
begin
  xArticulos.Close;
  xArticulos.Params.ByName['EMPRESA'].AsInteger := empresa;
  xArticulos.Params.ByName['ARTICULO'].AsString := articulo;
  xArticulos.Open;
  if xArticulosABIERTO.AsInteger = 1 then
  begin
     xEscandallo.Close;
     xEscandallo.Open;
  end;
  NroSerieDisponible.Close;
  NroSerieDisponible.Params.ByName['ALMACEN'].AsString := almacen;
  NroSerieDisponible.Open;
  NroSerieAsignado.Close;
  NroSerieAsignado.Params.ByName['EJERCICIO_SAL'].AsInteger := ejercicio;
  NroSerieAsignado.Params.ByName['CANAL_SAL'].AsInteger := canal;
  NroSerieAsignado.Params.ByName['SERIE_SAL'].AsString := serie;
  NroSerieAsignado.Params.ByName['RIG_SAL'].AsInteger := rig;
  NroSerieAsignado.Params.ByName['LINEA_SAL'].AsInteger := linea;
  NroSerieAsignado.Open;
  NroSerieDisponibleGar.Close;
  NroSerieDisponibleGar.Params.ByName['CLIENTE'].AsInteger := cliente;
  NroSerieDisponibleGar.Open;
  NroSerieAsignadoGar.Close;
  NroSerieAsignadoGar.Params.ByName['EJERCICIO_GAR'].AsInteger := ejercicio;
  NroSerieAsignadoGar.Params.ByName['CANAL_GAR'].AsInteger := canal;
  NroSerieAsignadoGar.Params.ByName['SERIE_GAR'].AsString := serie;
  NroSerieAsignadoGar.Params.ByName['RIG_GAR'].AsInteger := rig;
  NroSerieAsignadoGar.Params.ByName['LINEA_GAR'].AsInteger := linea;
  NroSerieAsignadoGar.Open;
end;

procedure TDMNumerosDeSerieKri.DMNumerosDeSerieKriCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not Local.InTransaction then
     Local.StartTransaction;
end;

procedure TDMNumerosDeSerieKri.DMNumerosDeSerieKriDestroy(Sender: TObject);
begin
  Local.Commit;
end;

end.
