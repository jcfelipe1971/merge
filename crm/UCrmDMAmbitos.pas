unit UCrmDMAmbitos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TCrmDMAmbitos = class(TDataModule)
     TLocal: THYTransaction;
     QMAmbitos: TFIBTableSet;
     QMAmbitosAMBITO: TIntegerField;
     QMAmbitosDESCRIPCION: TFIBStringField;
     DSQMAmbitos: TDataSource;
     xNumEmails: TFIBDataSetRO;
     xNumEmailsCOUNT: TIntegerField;
     DSxNumEmails: TDataSource;
     xNumContactos: TFIBDataSetRO;
     DSxNumContactos: TDataSource;
     xNumContactosCOUNT: TIntegerField;
     xReemplazaAmbitos: TFIBDataSetRO;
     xReemplazaAmbitosAMBITO: TIntegerField;
     xReemplazaAmbitosDESCRIPCION: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAmbitosBeforePost(DataSet: TDataSet);
     procedure QMAmbitosAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure ReemplazarAmbitos(const AmbitoORI: integer);
  end;

var
  CrmDMAmbitos : TCrmDMAmbitos;

implementation

uses UDMMain, UFBusca;

{$R *.dfm}

procedure TCrmDMAmbitos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.Active then
     TLocal.StartTransaction;

  QMAmbitos.Open;
end;

procedure TCrmDMAmbitos.QMAmbitosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CRM_CONTA_AMBITOS', 'AMBITO');
end;

procedure TCrmDMAmbitos.QMAmbitosAfterOpen(DataSet: TDataSet);
begin
  xNumEmails.Open;
  xNumContactos.Open;
end;

procedure TCrmDMAmbitos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMAmbitos, '00000');
end;

procedure TCrmDMAmbitos.ReemplazarAmbitos(const AmbitoORI: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CRM_CAMBIAR_AMBITO (:AMBITOORI, :AMBITODES)';
        Params.ByName['AMBITOORI'].AsInteger := AmbitoORI;
        Params.ByName['AMBITODES'].AsInteger := QMAmbitosAMBITO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
