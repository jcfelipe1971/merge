unit ZUDMArtArmazones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, UDMArticulos;

type
  TZDMArtArmazones = class(TDataModule)
     TLocal: THYTransaction;
     QMArmazonesDet: TFIBTableSet;
     DSQMArmazonesDet: TDataSource;
     QMArmazonesDetEMPRESA: TIntegerField;
     QMArmazonesDetARTICULO: TFIBStringField;
     QMArmazonesDetID_A: TIntegerField;
     QMArmazonesDetDETALLE: TFIBStringField;
     QMArmazonesDetID_A_DET: TIntegerField;
     xDatosDetalle: TFIBDataSetRO;
     xDatosDetalleTITULO: TFIBStringField;
     xDatosDetalleTIPO_ARTICULO_TYC: TFIBStringField;
     QMArmazonesDetTipoArt: TStringField;
     QMArmazonesDetDescArt: TStringField;
     QMArmazonesDetESCANDALLO_DEF: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMArmazonesDetNewRecord(DataSet: TDataSet);
     procedure QMArmazonesDetTipoArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMArmazonesDetDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     DM: TDMArticulos;
  public
     { Public declarations }
     procedure AbreDatos(aDM: TDataModule; Articulo: string);
  end;

var
  ZDMArtArmazones : TZDMArtArmazones;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TZDMArtArmazones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TZDMArtArmazones.AbreDatos(aDM: TDataModule; Articulo: string);
begin
  DM := TDMArticulos(aDM);
  with QMArmazonesDet do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

procedure TZDMArtArmazones.QMArmazonesDetNewRecord(DataSet: TDataSet);
begin
  QMArmazonesDetEMPRESA.AsInteger := DM.QMArticulosEMPRESA.AsInteger;
  QMArmazonesDetARTICULO.AsString := DM.QMArticulosARTICULO.AsString;
  QMArmazonesDetID_A.AsInteger := DM.QMArticulosID_A.AsInteger;
end;

procedure TZDMArtArmazones.QMArmazonesDetTipoArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDatosDetalle.Close;
  xDatosDetalle.Open;

  Text := xDatosDetalleTIPO_ARTICULO_TYC.AsString;
end;

procedure TZDMArtArmazones.QMArmazonesDetDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDatosDetalle.Close;
  xDatosDetalle.Open;

  Text := xDatosDetalleTITULO.AsString;
end;

end.
