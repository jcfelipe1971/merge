unit UDMLstColadas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, FIBDataSetRO,
  HYFIBQuery, UHYReportMail, UHYReport, FR_Pars, frxClass, frxDBSet,
  frxHYReport;

type
  TDMLstColadas = class(TDataModule)
     frColadas: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     frDBdetalle: TfrDBDataSet;
     QMCabecera: TFIBDataSetRO;
     DSCabecera: TDataSource;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     TLocal: THYTransaction;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSDetalle: THYReportSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraID_COLADA: TIntegerField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraORDEN: TIntegerField;
     QMCabeceraMATERIAL: TFIBStringField;
     QMCabeceraNOTAS: TBlobField;
     QMCabeceraPESO_LINGOTES: TFloatField;
     QMCabeceraPESO_BEBEDEROS: TFloatField;
     QMCabeceraENTRADA: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleID_COLADA: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetallePOSICION: TIntegerField;
     QMDetalleID_ORDEN: TIntegerField;
     QMDetalleARTICULO_CAJA: TFIBStringField;
     QMDetalleDEFECTUOSO: TIntegerField;
     QMDetalleENTRADA: TIntegerField;
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     procedure MostrarListado(Id_colada: integer; modo: byte; serie: string);
  end;

var
  DMLstColadas : TDMLstColadas;
  SW, ID_COLADA_AUX, filtrogen : integer;
  SerieGen : string;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles, UDMColadas;

{$R *.DFM}

procedure TDMLstColadas.MostrarListado(id_colada: integer; modo: byte; serie: string);
var
  str : string;
  grupo : integer;
  Listado : smallint;
begin
  SerieGen := Serie;
  id_colada_aux := id_colada;
  SW := 1;
  grupo := 9905;

  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_COLADA'].AsInteger := ID_COLADA;
     Open;
  end;

  Listado := 0;

  if (Listado > 0) then
     DMListados.Cargar(grupo, '', Listado)
  else
     DMListados.Cargar(grupo, serie);

  if ((DMListados.Copias <> REntorno.Copias) and (DMListados.Copias <> 0)) then
     REntorno.Copias := DMListados.Copias;

  if (Modo = 0) then
     REntorno.Copias := 1;

  if (REntorno.TipoListado = 'FRF') then
  begin
     frColadas.LoadFromFIB(REntorno.Formato, str);
     frColadas.PrepareReport;
     case Modo of
        0:
        begin
           frColadas.DefaultCopies := REntorno.Copias;
           frColadas.ShowPreparedReport;
        end;
        1: frColadas.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
  DMListados.Copias := 0;
end;

procedure TDMLstColadas.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
end;

procedure TDMLstColadas.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
end;

procedure TDMLstColadas.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstColadas.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

end.
