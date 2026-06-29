unit UIsoDMLstMedicion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FR_Class, Fr_HYReport, FR_DSet, FR_DBSet, FIBDataSet;

type
  TIsoDMLstMedicion = class(TDataModule)
     TLocal: THYTransaction;
     QLstSigRev: TFIBDataSetRO;
     DSQLstSigRev: TDataSource;
     QLstSigRevRIG: TIntegerField;
     QLstSigRevDENOMINACION: TFIBStringField;
     QLstSigRevCODID: TFIBStringField;
     QLstSigRevFECHA_COMPRA: TDateTimeField;
     QLstSigRevFABRICANTE: TFIBStringField;
     QLstSigRevNSERIE: TFIBStringField;
     QLstSigRevDESCRIPCION: TFIBStringField;
     QLstSigRevUBICACION: TFIBStringField;
     QLstSigRevPRCAL: TFIBStringField;
     QLstSigRevUSUARIO: TIntegerField;
     QLstSigRevRANGOM: TFIBStringField;
     QLstSigRevDIVESCALA: TFIBStringField;
     QLstSigRevINCERTIDUMBRE: TFIBStringField;
     QLstSigRevOBSERVACIONES: TBlobField;
     QLstSigRevFRECUENCIA: TIntegerField;
     QLstSigRevCERTIFICADO: TIntegerField;
     QLstSigRevEMPRESA: TIntegerField;
     QLstSigRevRIG1: TIntegerField;
     QLstSigRevFECHA_ULT: TDateTimeField;
     QLstSigRevFECHA_PROX: TDateTimeField;
     QLstSigRevRESULTADO: TFIBStringField;
     QLstSigRevLABORATORIO: TFIBStringField;
     QLstSigRevLINEA: TIntegerField;
     frDBSegRevision: TfrDBDataSet;
     frIsoSegRevision: TfrHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure frIsoSegRevisionGetValue(const ParName: string; var ParValue: variant);
  private
     { Private declarations }
     FFechaListado, FDesde, FHasta: TDateTime;
     FComentario: string;
  public
     { Public declarations }
     procedure Filtra(Desde, Hasta, FechaListado: TDateTime; Comentario: string);
  end;

var
  IsoDMLstMedicion : TIsoDMLstMedicion;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TIsoDMLstMedicion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TIsoDMLstMedicion.Filtra(Desde, Hasta, FechaListado: TDateTime; Comentario: string);
begin
  FDesde := Desde;
  FHasta := Hasta;
  FFechaListado := FFechaListado;
  FComentario := Comentario;
  QLstSigRev.Close;
  QLstSigRev.Params.ByName['Fecha_desde'].AsDateTime := FDesde;
  QLstSigRev.Params.ByName['Fecha_hasta'].AsDateTime := FHasta;
  QLstSigRev.Open;
end;

procedure TIsoDMLstMedicion.frIsoSegRevisionGetValue(const ParName: string; var ParValue: variant);
begin
  if ParName = 'Fecha_Listado' then
     ParValue := FFechaListado;

  if ParName = 'Filtro_Fecha' then
     ParValue := Format(_('Desde: %s Hasta: %s'), [DateToStr(FDesde), DateToStr(FHasta)]);

  if ParName = 'Comentario' then
     ParValue := FComentario;

  if ParName = 'Empresa' then
     ParValue := REntorno.NombreEmpresa;
end;

end.
