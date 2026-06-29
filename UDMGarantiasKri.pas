unit UDMGarantiasKri;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMGarantiasKri = class(TDataModule)
     DSxGarantias: TDataSource;
     xGarantias: TFIBTableSet;
     TLocal: THYTransaction;
     xGarantiasEMPRESA: TIntegerField;
     xGarantiasARTICULO: TFIBStringField;
     xGarantiasID: TIntegerField;
     xGarantiasDETALLE: TFIBStringField;
     xGarantiasREFERENCIA: TFIBStringField;
     xGarantiasORDEN_TRABAJO: TFIBStringField;
     xGarantiasORDEN: TIntegerField;
     xGarantiasMARCA: TIntegerField;
     xGarantiasID_S_CAB: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure xGarantiasNewRecord(DataSet: TDataSet);
     procedure xGarantiasAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     ID_S_CAB: integer;
  public
     { Public declarations }
     ID: integer;
     procedure Filtra(id_s_documento: integer);
  end;

var
  DMGarantiasKri : TDMGarantiasKri;

implementation

uses UDMMain, UFMGarantiasKri, UEntorno;

{$R *.dfm}

procedure TDMGarantiasKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMGarantiasKri.xGarantiasNewRecord(DataSet: TDataSet);
begin
  xGarantiasEMPRESA.AsInteger := REntorno.Empresa;
  xGarantiasARTICULO.AsString := FMGarantiasKri.EFArticulo.Text;
  xGarantiasID.AsInteger := ID;
  xGarantiasDETALLE.AsString := '';
  xGarantiasREFERENCIA.AsString := '';
  xGarantiasORDEN_TRABAJO.AsString := '';
  xGarantiasORDEN.AsInteger := 0;
  xGarantiasMARCA.AsInteger := 0;
  xGarantiasID_S_CAB.AsInteger := ID_S_CAB;
end;

procedure TDMGarantiasKri.xGarantiasAfterScroll(DataSet: TDataSet);
begin
  FMGarantiasKri.EFArticulo.Text := xGarantiasARTICULO.AsString;
  ID := xGarantiasID.AsInteger;
end;

procedure TDMGarantiasKri.Filtra(id_s_documento: integer);
begin
  ID_S_CAB := id_s_documento;
  xGarantias.Close;
  xGarantias.Params.ByName['ID_S_CAB'].AsInteger := id_s_documento;
  xGarantias.Open;
end;

end.
