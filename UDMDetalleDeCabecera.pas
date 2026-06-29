unit UDMDetalleDeCabecera;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMDetalleDeCabecera = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraID_S: TIntegerField;
     QMCabeceraTRANSP_INSTAL: TFIBStringField;
     QMCabeceraVEHICULO_ESPECIAL: TIntegerField;
     QMCabeceraTIPO_VEHICULO: TFIBStringField;
     QMCabeceraENTRADA: TIntegerField;
     QMCabeceraDIRECCION: TBlobField;
     QMCabeceraCONTACTO: TFIBStringField;
     QMCabeceraTELEFONO: TFIBStringField;
     QMCabeceraEMAIL: TFIBStringField;
     QMCabeceraTIPO_SERVICIO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CreaRegistro(IdS: integer);
  end;

var
  DMDetalleDeCabecera : TDMDetalleDeCabecera;

implementation

uses UDMMain, UEntorno, HYFIBQuery;

{$R *.dfm}

procedure TDMDetalleDeCabecera.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMDetalleDeCabecera.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
  if (TUpdate.InTransaction) then
     TUpdate.Commit;
end;

procedure TDMDetalleDeCabecera.CreaRegistro(IdS: integer);
var
  Q : THYFIBQuery;
begin
  /// Abro el registro.
  /// Si no existe lo creo.

  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := IdS;
     Open;

     if (RecordCount = 0) then
     begin
        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO GES_CABECERAS_S_DETALLE ');
              SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S) ');
              SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S FROM GES_CABECERAS_S ');
              SQL.Add(' WHERE ID_S  = :ID_S ');
              Params.ByName['ID_S'].AsInteger := IdS;
              ExecQuery;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;

        Close;
        Params.ByName['ID_S'].AsInteger := IdS;
        Open;
     end;
  end;
end;

procedure TDMDetalleDeCabecera.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  QMCabeceraENTRADA.AsInteger := REntorno.Entrada;
end;

end.
