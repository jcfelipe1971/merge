unit UIsoDMFirmas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TIsoDMFirmas = class(TDataModule)
     TLocal: THYTransaction;
     QMFirmas: TFIBTableSet;
     DSQMFirmas: TDataSource;
     QMFirmasEMPRESA: TIntegerField;
     QMFirmasID_FIRMA: TIntegerField;
     QMFirmasOK: TIntegerField;
     QMFirmasPERSONA: TFIBStringField;
     QMFirmasFECHA: TDateTimeField;
     QMFirmasNOTAS: TBlobField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure NuevaFirma(Id_firma: integer);
     procedure AbreFirma(Empresa, Id_firma: integer);
     procedure BusquedaCompleja;
  end;

var
  IsoDMFirmas : TIsoDMFirmas;

implementation

uses UDMMain, UEntorno, uFBusca;

{$R *.dfm}

procedure TIsoDMFirmas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMFirmas, '10000');
end;

procedure TIsoDMFirmas.NuevaFirma(Id_firma: integer);
begin
  QMFirmas.Open;
  QMFirmas.Insert;
  QMFirmasEMPRESA.AsInteger := REntorno.Empresa;
  QMFirmasID_FIRMA.AsInteger := Id_firma;
  QMFirmasPERSONA.AsString := REntorno.Nombre;
  QMFirmasFECHA.AsDateTime := REntorno.FechaTrab;
end;

procedure TIsoDMFirmas.AbreFirma(Empresa, Id_firma: integer);
begin
  with QMFirmas do
  begin
     Close;
     SelectSQL.Text := 'select * from iso_firmas where empresa=' + IntToStr(Empresa) +
        ' and id_firma=' + IntToStr(Id_firma);
     Open;
     Edit;
  end;
end;

procedure TIsoDMFirmas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMFirmas, '10000', True);
end;

procedure TIsoDMFirmas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
