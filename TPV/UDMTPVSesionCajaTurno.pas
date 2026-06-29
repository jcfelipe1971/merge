unit UDMTPVSesionCajaTurno;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMTPVSesionCajaTurno = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xSesion: TFIBTableSet;
     DSxSesion: TDataSource;
     xCaja: TFIBTableSet;
     DSxCaja: TDataSource;
     xTurno: TFIBTableSet;
     DSxTurno: TDataSource;
     xSesionEMPRESA: TIntegerField;
     xSesionEJERCICIO: TIntegerField;
     xSesionCANAL: TIntegerField;
     xSesionSERIE: TFIBStringField;
     xSesionSESION: TIntegerField;
     xSesionABIERTA: TIntegerField;
     xSesionI_IVA: TFloatField;
     xSesionB_IMPONIBLE: TFloatField;
     xSesionTOTAL_SESION: TFloatField;
     xSesionFECHA_INICIO: TDateTimeField;
     xSesionFECHA_FIN: TDateTimeField;
     xSesionUSUARIO_ABRE: TIntegerField;
     xSesionUSUARIO_CIERRA: TIntegerField;
     xCajaEMPRESA: TIntegerField;
     xCajaEJERCICIO: TIntegerField;
     xCajaCANAL: TIntegerField;
     xCajaSERIE: TFIBStringField;
     xCajaSESION: TIntegerField;
     xCajaCAJA: TIntegerField;
     xCajaABIERTA: TIntegerField;
     xCajaI_IVA: TFloatField;
     xCajaB_IMPONIBLE: TFloatField;
     xCajaTOTAL_SESION: TFloatField;
     xCajaFECHA_INICIO: TDateTimeField;
     xCajaFECHA_FIN: TDateTimeField;
     xCajaUSUARIO_ABRE: TIntegerField;
     xCajaUSUARIO_CIERRA: TIntegerField;
     xTurnoEMPRESA: TIntegerField;
     xTurnoEJERCICIO: TIntegerField;
     xTurnoCANAL: TIntegerField;
     xTurnoSERIE: TFIBStringField;
     xTurnoSESION: TIntegerField;
     xTurnoCAJA: TIntegerField;
     xTurnoTURNO: TIntegerField;
     xTurnoABIERTO: TIntegerField;
     xTurnoI_IVA: TFloatField;
     xTurnoB_IMPONIBLE: TFloatField;
     xTurnoTOTAL_TURNO: TFloatField;
     xTurnoFECHA_INICIO: TDateTimeField;
     xTurnoFECHA_FIN: TDateTimeField;
     xTurnoUSUARIO_ABRE: TIntegerField;
     xTurnoUSUARIO_CIERRA: TIntegerField;
     xTurnoCAMBIO_ENTREGADO: TFloatField;
     xTurnoDIFERENCIA: TFloatField;
     xTurnoSALDO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xSesionAfterOpen(DataSet: TDataSet);
     procedure xSesionBeforeClose(DataSet: TDataSet);
     procedure xCajaAfterOpen(DataSet: TDataSet);
     procedure xCajaBeforeClose(DataSet: TDataSet);
     procedure xSesionNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     Serie: string;
  public
     { Public declarations }
     procedure CambiaSerie(aSerie: string);
     procedure AbrirSesion;
     procedure CerrarSesion;
     procedure Refrescar;
  end;

var
  DMTPVSesionCajaTurno : TDMTPVSesionCajaTurno;

implementation

uses
  UDMMain, HYFIBQuery, UEntorno;

{$R *.dfm}

procedure TDMTPVSesionCajaTurno.CambiaSerie(aSerie: string);
begin
  Serie := aSerie;

  DMMain.FiltraTabla(xSesion, '11100', False);
  with xSesion do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMTPVSesionCajaTurno.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMTPVSesionCajaTurno.xSesionAfterOpen(DataSet: TDataSet);
begin
  xCaja.Open;
end;

procedure TDMTPVSesionCajaTurno.xSesionBeforeClose(DataSet: TDataSet);
begin
  xCaja.Close;
end;

procedure TDMTPVSesionCajaTurno.xCajaAfterOpen(DataSet: TDataSet);
begin
  xTurno.Open;
end;

procedure TDMTPVSesionCajaTurno.xCajaBeforeClose(DataSet: TDataSet);
begin
  xTurno.Close;
end;

procedure TDMTPVSesionCajaTurno.AbrirSesion;
begin
  // Abro sesion si no esta abierta
  if (xSesionSESION.AsInteger <= 0) then
  begin
     with xSesion do
     begin
        Insert;
        Post;

        Close;
        Open;
     end;

     // Recorro las cajas abriento turnos
     with xCaja do
     begin
        First;
        while not EOF do
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE G_TICKET_ABRE_TURNO (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CAJA, :USUARIO, :FECHA, :TURNOOLD)';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['SERIE'].AsString := Serie;
                 Params.ByName['CAJA'].AsInteger := xCajaCAJA.AsInteger;
                 Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
                 Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
                 Params.ByName['TURNOOLD'].AsInteger := 0;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Next;
        end;
     end;

     // Refresco Sesion para que refresque las otras tablas
     Refrescar;
  end;
end;

procedure TDMTPVSesionCajaTurno.xSesionNewRecord(DataSet: TDataSet);
begin
  xSesionEMPRESA.AsInteger := REntorno.Empresa;
  xSesionEJERCICIO.AsInteger := REntorno.Ejercicio;
  xSesionCANAL.AsInteger := REntorno.Canal;
  xSesionSERIE.AsString := Serie;
  xSesionSESION.AsInteger := 0;
  xSesionABIERTA.AsInteger := 1;
  xSesionUSUARIO_ABRE.AsInteger := REntorno.Usuario;
  xSesionFECHA_INICIO.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMTPVSesionCajaTurno.CerrarSesion;
begin
  // Cierro sesion si esta abierta
  if (xSesionSESION.AsInteger > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_FACTURA_TICKETS_CIERRA_SS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :SESION, :MODO, :ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['SESION'].AsInteger := xSesionSESION.AsInteger;
           Params.ByName['MODO'].AsInteger := 0; // 0-No cierra Tickets abiertos, 1-Fuerza cierre de tickets abiertos
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Refresco Sesion para que refresque las otras tablas
     Refrescar;
  end;
end;

procedure TDMTPVSesionCajaTurno.Refrescar;
begin
  with xSesion do
  begin
     Close;
     Open;
  end;
end;

end.
