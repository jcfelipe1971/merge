unit ZUDMArtLonas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, UDMArticulos;

type
  TZDMArtLonas = class(TDataModule)
     TLocal: THYTransaction;
     QMLonasDet: TFIBTableSet;
     DSQMLonasDet: TDataSource;
     QMLonasDetEMPRESA: TIntegerField;
     QMLonasDetARTICULO: TFIBStringField;
     QMLonasDetID_A: TIntegerField;
     QMLonasDetDETALLE: TFIBStringField;
     QMLonasDetID_A_DET: TIntegerField;
     xDatosDetalle: TFIBDataSetRO;
     xDatosDetalleTITULO: TFIBStringField;
     xDatosDetalleTIPO_ARTICULO_TYC: TFIBStringField;
     QMLonasDetTipoArt: TStringField;
     QMLonasDetDescArt: TStringField;
     QMLonasDetESCANDALLO_DEF: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMLonasDetNewRecord(DataSet: TDataSet);
     procedure QMLonasDetTipoArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMLonasDetDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     DM: TDMArticulos;
  public
     { Public declarations }
     procedure AbreDatos(aDM: TDataModule; Articulo: string);
  end;

var
  ZDMArtLonas : TZDMArtLonas;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TZDMArtLonas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TZDMArtLonas.AbreDatos(aDM: TDataModule; Articulo: string);
begin
  DM := TDMArticulos(aDM);

  with QMLonasDet do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

procedure TZDMArtLonas.QMLonasDetNewRecord(DataSet: TDataSet);
begin
  QMLonasDetEMPRESA.AsInteger := DM.QMArticulosEMPRESA.AsInteger;
  QMLonasDetARTICULO.AsString := DM.QMArticulosARTICULO.AsString;
  QMLonasDetID_A.AsInteger := DM.QMArticulosID_A.AsInteger;
end;

procedure TZDMArtLonas.QMLonasDetTipoArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDatosDetalle.Close;
  xDatosDetalle.Open;

  Text := xDatosDetalleTIPO_ARTICULO_TYC.AsString;
end;

procedure TZDMArtLonas.QMLonasDetDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDatosDetalle.Close;
  xDatosDetalle.Open;

  Text := xDatosDetalleTITULO.AsString;
end;

end.
