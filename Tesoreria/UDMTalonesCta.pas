unit UDMTalonesCta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSetRO, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBQuery, HYFIBQuery;

type
  TDMTalonesCta = class(TDataModule)
     TLocal: THYTransaction;
     QMTalones: TFIBTableSet;
     xInfoActualizada: TFIBDataSetRO;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     DSxInfoActualizada: TDataSource;
     DSQMTalones: TDataSource;
     QMTalonesEMPRESA: TIntegerField;
     QMTalonesEJERCICIO: TIntegerField;
     QMTalonesCANAL: TIntegerField;
     QMTalonesTALON: TFIBStringField;
     QMTalonesCUENTA: TFIBStringField;
     QMTalonesDESCRIPCION: TFIBStringField;
     QMTalonesLUGAR_LIBRAMIENTO: TFIBStringField;
     QMTalonesFECHA_LIBRAMIENTO: TDateTimeField;
     QMTalonesBANCO: TIntegerField;
     QMTalonesIMPORTE: TFloatField;
     QMTalonesPAGADO: TIntegerField;
     QMTalonesRIC: TIntegerField;
     QMTalonesASIENTO: TIntegerField;
     xInfoActualizadaTALON: TFIBStringField;
     xInfoActualizadaIMPORTE: TFloatField;
     xInfoActualizadaPAGADO: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleTALON: TFIBStringField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleC_CONTRAPARTIDA: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleIMPORTE: TFloatField;
     QMDetalleC_CONTRAPARTIDA_PGC: TIntegerField;
     TUpdate: THYTransaction;
     QMTalonesZ_NOTASTALONCC: TBlobField;
     QMTalonesZ_CONTADOR: TIntegerField;
     procedure DMTalonesCtaCreate(Sender: TObject);
     procedure QMTalonesNewRecord(DataSet: TDataSet);
     procedure QMTalonesAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMDetalleC_CONTRAPARTIDAChange(Sender: TField);
     procedure QMTalonesBeforeClose(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleAfterDelete(DataSet: TDataSet);
     procedure QMDetalleBeforeInsert(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Contabilizar(Valor: smallint);
     procedure GuardaMaestro;
     procedure BusquedaCompleja;
     function ContadorAutomaticoBanco(Banco: integer): boolean;
     function DameTalon: integer;
     procedure RefrescaTotales;
  end;

var
  DMTalonesCta : TDMTalonesCta;

implementation

uses UDMMain, UEntorno, uFBusca, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMTalonesCta.DMTalonesCtaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMTalonesIMPORTE.DisplayFormat := MascaraN;
  xInfoActualizadaIMPORTE.DisplayFormat := MascaraN;
  QMDetalleIMPORTE.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMTalones, '11100', True);
end;

procedure TDMTalonesCta.QMTalonesNewRecord(DataSet: TDataSet);
begin
  QMTalonesEMPRESA.AsInteger := REntorno.Empresa;
  QMTalonesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMTalonesCANAL.AsInteger := REntorno.Canal;
  QMTalonesFECHA_LIBRAMIENTO.AsDateTime := REntorno.FechaTrab;
  QMTalonesIMPORTE.AsFloat := 0;
  QMTalonesPAGADO.AsInteger := 0;
end;

function TDMTalonesCta.DameTalon: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE UT_MAYOR_TALON(:EMPRESA, :EJERCICIO, :CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := StrToIntDef(FieldByName['MAXIMO'].AsString, 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTalonesCta.QMTalonesAfterOpen(DataSet: TDataSet);
begin
  xInfoActualizada.Open;
  QMDetalle.Open;
end;

procedure TDMTalonesCta.Graba(DataSet: TDataSet);
var
  Contador : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CONTADOR_TALON FROM EMP_BANCOS WHERE EMPRESA = ?EMPRESA AND BANCO = ?BANCO AND CONTADOR_TALON_AUTOMATICO = 1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['BANCO'].AsInteger := QMTalonesBANCO.AsInteger;
        ExecQuery;
        Contador := FieldByName['CONTADOR_TALON'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Contador <> 0) then
  begin
     QMTalonesZ_CONTADOR.AsInteger := Contador;
     QMTalonesTALON.AsString := IntToStr(Contador);
  end;
end;

procedure TDMTalonesCta.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleEMPRESA.AsInteger := QMTalonesEMPRESA.AsInteger;
  QMDetalleEJERCICIO.AsInteger := QMTalonesEJERCICIO.AsInteger;
  QMDetalleCANAL.AsInteger := QMTalonesCANAL.AsInteger;
  QMDetalleTALON.AsString := QMTalonesTALON.AsString;
  QMDetalleIMPORTE.AsFloat := 0;
end;

procedure TDMTalonesCta.Contabilizar(Valor: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_CARTERA_TAL_CTA ');
        SQL.Add(' SET ');
        SQL.Add(' PAGADO = :PAGADO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' TALON = :TALON ');
        Params.ByName['EMPRESA'].AsInteger := QMTalonesEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMTalonesEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMTalonesCANAL.AsInteger;
        Params.ByName['TALON'].AsString := QMTalonesTALON.AsString;
        Params.ByName['PAGADO'].AsInteger := Valor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaTotales;
  QMTalones.Refresh;
end;

procedure TDMTalonesCta.GuardaMaestro;
begin
  if ((QMTalones.State = dsInsert) or (QMTalones.State = dsEdit)) then
     QMTalones.Post;
end;

procedure TDMTalonesCta.QMDetalleBeforeEdit(DataSet: TDataSet);
begin
  GuardaMaestro;
end;

procedure TDMTalonesCta.BusquedaCompleja;
var
  Orden : string;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(QMTalones, '11100', False) <> mrCancel) then
  begin
     Orden := QMTalones.OrdenadoPor;
     QMTalones.Ordenar('');
     QMTalones.Ordenar(Orden);
  end;

  QMTalones.Open;
end;

procedure TDMTalonesCta.QMDetalleBeforePost(DataSet: TDataSet);
var
  Linea : integer;
begin
  if (QMDetalle.State = dsInsert) then
  begin
     // Calculamos la linea
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA) FROM EMP_CARTERA_TAL_DETALLE ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' TALON = :TALON ');
           Params.ByName['EMPRESA'].AsInteger := QMTalonesEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMTalonesEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMTalonesCANAL.AsInteger;
           Params.ByName['TALON'].AsString := QMTalonesTALON.AsString;
           ExecQuery;
           Linea := FieldByName['MAX'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMDetalleLINEA.AsInteger := Linea + 1;
  end;

  QMDetalleC_CONTRAPARTIDA_PGC.AsInteger := REntorno.PGC;
end;

procedure TDMTalonesCta.QMDetalleC_CONTRAPARTIDAChange(Sender: TField);
begin
  QMDetalleTITULO.AsString := DameTituloCuenta(QMDetalleC_CONTRAPARTIDA.AsString);
end;

function TDMTalonesCta.ContadorAutomaticoBanco(Banco: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CONTADOR_TALON_AUTOMATICO FROM EMP_BANCOS WHERE EMPRESA=?EMPRESA AND BANCO=?BANCO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['BANCO'].AsInteger := Banco;
        ExecQuery;
        Result := (FieldByName['CONTADOR_TALON_AUTOMATICO'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTalonesCta.QMTalonesBeforeClose(DataSet: TDataSet);
begin
  xInfoActualizada.Close;
  QMDetalle.Close;
end;

procedure TDMTalonesCta.QMDetalleAfterPost(DataSet: TDataSet);
begin
  RefrescaTotales;
end;

procedure TDMTalonesCta.QMDetalleAfterDelete(DataSet: TDataSet);
begin
  RefrescaTotales;
end;

procedure TDMTalonesCta.RefrescaTotales;
var
  Linea : integer;
begin
  Linea := QMDetalleLINEA.AsInteger;
  xInfoActualizada.Close;
  xInfoActualizada.Open;
  QMTalones.Refresh;
  Refrescar(QMDetalle, 'LINEA', Linea, False, True);
end;

procedure TDMTalonesCta.QMDetalleBeforeInsert(DataSet: TDataSet);
begin
  GuardaMaestro;
end;

end.
