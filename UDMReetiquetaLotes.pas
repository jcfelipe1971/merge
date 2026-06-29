unit UDMReetiquetaLotes;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMReetiquetaLotes = class(TDataModule)
     Tlocal: THYTransaction;
     DSQMReetiquetado_Lotes: TDataSource;
     QMReetiquetado_Lotes: TFIBTableSet;
     QMArticulos_Lotes: TFIBTableSet;
     DSQMArticulos_Lotes: TDataSource;
     QMaxCodigo: THYFIBQuery;
     QTituloAlmacen: TFIBQuery;
     QTituloProveedor: TFIBQuery;
     QMArticulos_LotesEMPRESA: TIntegerField;
     QMArticulos_LotesCANAL: TIntegerField;
     QMArticulos_LotesALMACEN: TFIBStringField;
     QMArticulos_LotesARTICULO: TFIBStringField;
     QMArticulos_LotesLOTE: TFIBStringField;
     QMArticulos_LotesSERIE: TFIBStringField;
     QMArticulos_LotesPROVEEDOR: TIntegerField;
     QMArticulos_LotesCLASIFICACION: TFIBStringField;
     QMArticulos_LotesF_ENVASADO: TDateTimeField;
     QMArticulos_LotesF_CADUCIDAD: TDateTimeField;
     QMArticulos_LotesSTOCK: TFloatField;
     QMArticulos_LotesF_FABRICACION: TDateTimeField;
     QMArticulos_LotesID_A: TIntegerField;
     QMArticulos_LotesID_LOTE: TIntegerField;
     QMArticulos_LotesAUTO_REETIQUETADO: TIntegerField;
     QMArticulos_LotesCODIGO: TIntegerField;
     QTituloArticulo: TFIBQuery;
     SPReetiquetaLote: TFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function DameProximoCodigo: integer;
     function DameTituloAlmacen(almacen: string): string;
     function DameTituloProveedor(proveedor: integer): string;
     procedure DameDatosLote(id_lote: integer; var Articulo, TituloArt, Lote, SerieLote, Proveedor, TituloProv, Almacen, TituloAlm: string; var Reetiquetado: boolean);
     function DameTituloArticulo(id_a: integer): string;
     procedure ReetiquetaLote(id_lote: integer; NuevoLote: string; Automatico: boolean; var d_id_lote: integer; id_detalles_e: integer);
  end;

var
  DMReetiquetaLotes : TDMReetiquetaLotes;

implementation

uses
  UDMMain, UEntorno;

{$R *.dfm}

procedure TDMReetiquetaLotes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

function TDMReetiquetaLotes.DameProximoCodigo: integer;
begin
  with QMaxCodigo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     Result := FieldByName['MAXIMO'].AsInteger + 1;
     FreeHandle;
  end;
end;

function TDMReetiquetaLotes.DameTituloAlmacen(almacen: string): string;
begin
  with QTituloAlmacen do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ALMACEN'].AsString := Almacen;
     ExecQuery;
     Result := FieldByName['titulo'].AsString;
     FreeHandle;
  end;
end;

function TDMReetiquetaLotes.DameTituloProveedor(proveedor: integer): string;
begin
  with QTituloProveedor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     ExecQuery;
     Result := FieldByName['titulo'].AsString;
     FreeHandle;
  end;
end;

function TDMReetiquetaLotes.DameTituloArticulo(id_a: integer): string;
begin
  with QTituloArticulo do
  begin
     Close;
     Params.ByName['ID_A'].AsInteger := id_a;
     ExecQuery;
     Result := FieldByName['titulo'].AsString;
     FreeHandle;
  end;
end;

procedure TDMReetiquetaLotes.DameDatosLote(id_lote: integer; var Articulo, TituloArt, Lote, SerieLote, Proveedor, TituloProv, Almacen, TituloAlm: string; var Reetiquetado: boolean);
begin
  with QMArticulos_Lotes do
  begin
     Close;
     Params.ByName['ID_LOTE'].AsInteger := id_lote;
     Open;
  end;
  Articulo := QMArticulos_LotesARTICULO.AsString;
  TituloArt := DameTituloArticulo(QMArticulos_LotesID_A.AsInteger);
  Lote := QMArticulos_LotesLOTE.AsString;
  SerieLote := QMArticulos_LotesSERIE.AsString;
  Proveedor := IntToStr(QMArticulos_LotesPROVEEDOR.AsInteger);
  TituloProv := DameTituloProveedor(QMArticulos_LotesPROVEEDOR.AsInteger);
  Almacen := QMArticulos_LotesALMACEN.AsString;
  TituloAlm := DameTituloAlmacen(QMArticulos_LotesALMACEN.AsString);
  Reetiquetado := (QMArticulos_LotesAUTO_REETIQUETADO.AsInteger <> 0);
end;

procedure TDMReetiquetaLotes.ReetiquetaLote(id_lote: integer; NuevoLote: string; Automatico: boolean; var d_id_lote: integer; id_detalles_e: integer);
var
  intAuto : integer;
begin
  if Automatico then
     intAuto := 1
  else
     intAuto := 0;
  with SPReetiquetaLote do
  begin
     Close;
     Params.ByName['ID_LOTE'].AsInteger := id_lote;
     Params.ByName['NUEVOLOTE'].AsString := Nuevolote;
     Params.ByName['AUTOMATICO'].AsInteger := intAuto;
     Params.ByName['ID_DETALLES_E'].AsInteger := id_detalles_e;
     ExecQuery;
     d_id_lote := FieldByName['D_ID_LOTE'].AsInteger;
     Transaction.CommitRetaining;
     FreeHandle;
  end;
end;

end.
