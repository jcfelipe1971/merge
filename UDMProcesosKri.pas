unit UDMProcesosKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery;

type
  TDMProcesosKri = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMProcesosDetalle: TDataSource;
     QMProcesosDetalle: TFIBTableSet;
     DSQMProcesosCabecera: TDataSource;
     QMProcesosCabecera: TFIBTableSet;
     QMProcesosCabeceraID: TIntegerField;
     QMProcesosCabeceraTITULO: TFIBStringField;
     QMProcesosDetalleID: TIntegerField;
     QMProcesosDetalleAVISO: TIntegerField;
     QMProcesosDetalleAVISO_DESTINO: TIntegerField;
     QMProcesosDetalleFECHA_INI: TDateTimeField;
     QMProcesosDetalleUSUARIO_FIN: TIntegerField;
     QMProcesosDetalleTERCERO: TIntegerField;
     QMProcesosDetalleUSUARIO: TIntegerField;
     QMProcesosDetalleFECHA_VAL: TDateTimeField;
     QMProcesosDetalleFECHA_RESPUESTA: TDateTimeField;
     QMProcesosDetalleURGENTE: TIntegerField;
     QMProcesosDetalleMENSAJE: TBlobField;
     QMProcesosDetalleRESULTADO: TBlobField;
     procedure QMProcesosCabeceraBeforePost(DataSet: TDataSet);
     procedure QMProcesosDetalleNewRecord(DataSet: TDataSet);
     procedure QMProcesosDetalleBeforePost(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure LanzaAvisos;
  end;

var
  DMProcesosKri : TDMProcesosKri;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMProcesosKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProcesosCabecera.Open;
  QMProcesosDetalle.Open;
end;

procedure TDMProcesosKri.QMProcesosCabeceraBeforePost(DataSet: TDataSet);
var
  i : integer;
begin
  if (DataSet.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(ID) FROM GES_PROCESOS_CAB_KRI';
           ExecQuery;
           i := FieldByName['MAX'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMProcesosCabeceraID.AsInteger := i + 1;
  end;
end;

procedure TDMProcesosKri.QMProcesosDetalleNewRecord(DataSet: TDataSet);
begin
  QMProcesosDetalleID.AsInteger := QMProcesosCabeceraID.AsInteger;
  QMProcesosDetalleUSUARIO.AsInteger := REntorno.Usuario;
  QMProcesosDetalleFECHA_INI.AsDateTime := Trunc(Now);
  QMProcesosDetalleFECHA_VAL.AsDateTime := Trunc(Now);
  QMProcesosDetalleFECHA_RESPUESTA.AsDateTime := Trunc(Now);
end;

procedure TDMProcesosKri.QMProcesosDetalleBeforePost(DataSet: TDataSet);
var
  i : integer;
begin
  if (DataSet.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(AVISO) FROM GES_PROCESOS_DET_KRI WHERE ID=?ID';
           Params.ByName['ID'].AsInteger := QMProcesosCabeceraID.AsInteger;
           ExecQuery;
           i := FieldByName['MAX'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
     QMProcesosDetalleAVISO.AsInteger := i + 1;
  end;
end;

procedure TDMProcesosKri.LanzaAvisos;
var
  Aviso : integer;
begin
  with QMProcesosDetalle do
  begin
     First;
     while not (EOF) do
     begin
        Aviso := DMMain.ContadorGen('CONTA_USUARIOS_MENSAJES');
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO VER_USUARIOS_MENSAJES ');
              SQL.Add(' (AVISO,FECHA_INI,TERCERO,USUARIO,FECHA_VAL,FECHA_RESPUESTA,URGENTE,ACTIVO,MENSAJE,RESULTADO,NOMBRE_USUARIO,TITULO_TERCERO) ');
              SQL.Add(' VALUES ');
              SQL.Add(' (?AVISO,?FECHA_INI,?TERCERO,?USUARIO,?FECHA_VAL,?FECHA_RESPUESTA,?URGENTE,?ACTIVO,?MENSAJE,?RESULTADO,?NOMBRE_USUARIO,?TITULO_TERCERO) ');
              Params.ByName['AVISO'].AsInteger := Aviso;
              Params.ByName['FECHA_INI'].AsDateTime := REntorno.FechaTrabSH;
              Params.ByName['TERCERO'].AsInteger := QMProcesosDetalleTERCERO.AsInteger;
              Params.ByName['USUARIO'].AsInteger := QMProcesosDetalleUSUARIO.AsInteger;
              Params.ByName['FECHA_VAL'].AsDateTime := REntorno.FechaTrabSH;
              Params.ByName['FECHA_RESPUESTA'].AsDateTime := REntorno.FechaTrabSH;
              Params.ByName['URGENTE'].AsInteger := QMProcesosDetalleURGENTE.AsInteger;
              Params.ByName['ACTIVO'].AsInteger := 1;
              Params.ByName['MENSAJE'].AsString := QMProcesosDetalleMENSAJE.AsString;
              Params.ByName['RESULTADO'].AsString := '';
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'INSERT INTO SYS_USUARIOS_MENSAJES_DEST (AVISO, USUARIO, ACTIVO) VALUES (?AVISO, ?USUARIO, 1)';
              Params.ByName['AVISO'].AsInteger := Aviso;
              Params.ByName['USUARIO'].AsInteger := QMProcesosDetalleUSUARIO_FIN.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        Next;
     end;
     First;
  end;
end;

end.
