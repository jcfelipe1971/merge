unit UIsoDMAcciones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_Class,
  Fr_HYReport, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TIsoDMAcciones = class(TDataModule)
     DSQMIsoAcciones: TDataSource;
     TLocal: THYTransaction;
     frIsoAcciones: TfrHYReport;
     xTipo: TFIBDataSetRO;
     xTipoDESCRIPCION: TFIBStringField;
     xTipoTIPO: TFIBStringField;
     QMIsoAcciones: TFIBTableSet;
     QMIsoAccionesRIC: TIntegerField;
     QMIsoAccionesPROCEDENCIA: TFIBStringField;
     QMIsoAccionesFECHA: TDateTimeField;
     QMIsoAccionesDESCRIPCION: TFIBStringField;
     QMIsoAccionesPLANO: TFIBStringField;
     QMIsoAccionesDESCRIPCIONINC: TBlobField;
     QMIsoAccionesFDESCRIPCIONINC: TIntegerField;
     QMIsoAccionesANALISIS: TBlobField;
     QMIsoAccionesFANALISIS: TIntegerField;
     QMIsoAccionesCAUSAS: TBlobField;
     QMIsoAccionesACCION: TBlobField;
     QMIsoAccionesFACCION: TIntegerField;
     QMIsoAccionesCOMPROBACION: TBlobField;
     QMIsoAccionesFCOMPROBACION: TIntegerField;
     QMIsoAccionesFECHACIERRE: TDateTimeField;
     QMIsoAccionesEMPRESA: TIntegerField;
     QMIsoAccionesTIPO: TFIBStringField;
     QMIsoAccionesID_RECURSO: TFIBStringField;
     QMIsoAccionesTIEMPO: TIntegerField;
     QMIsoAccionesID_ACCION_PRE: TIntegerField;
     QMIsoAccionesCOSTE: TFloatField;
     QMIsoAccionesID_INC: TIntegerField;
     QMIsoAccionesID_INC_LINEA_ACC: TIntegerField;
     QMIsoAccionesFECHAPREVISTA: TDateTimeField;
     QBloquea: THYFIBQuery;
     QMIsoAccionesESTADO: TIntegerField;
     xEstados: TFIBDataSetRO;
     DSxEstado: TDataSource;
     procedure DMIsoAccionesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMIsoAccionesDescTipoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMIsoAccionesNewRecord(DataSet: TDataSet);
     procedure frIsoAccionesEnterRect(Memo: TStringList; View: TfrView);
     procedure QMIsoAccionesAfterScroll(DataSet: TDataSet);
     procedure QMIsoAccionesBeforePost(DataSet: TDataSet);
     procedure QMIsoAccionesBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure CierraAccion;
     function EstadoDocumento: integer;
     procedure BloqueaPedido;
     procedure DesBloqueaPedido;
     procedure FiltraAcciones(Filtro: string);
  end;

var
  IsoDMAcciones : TIsoDMAcciones;

implementation

uses UDMMain, UIsoFMAcciones, UEntorno, UFBusca, UUtiles;

{$R *.DFM}

procedure TIsoDMAcciones.DMIsoAccionesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMIsoAcciones, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMIsoAcciones, '10000', True);
end;

procedure TIsoDMAcciones.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TIsoDMAcciones.QMIsoAccionesDescTipoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xTipo.Close;
  xTipo.Open;
  Text := xTipoDESCRIPCION.AsString;
end;

procedure TIsoDMAcciones.QMIsoAccionesNewRecord(DataSet: TDataSet);
begin
  QMIsoAccionesEMPRESA.AsInteger := REntorno.Empresa;
  QMIsoAccionesFECHA.AsDateTime := REntorno.FechaTrab;
  QMIsoAccionesFECHACIERRE.AsDateTime := REntorno.FechaTrab;
end;

//******************* Fermin ******************************
procedure TIsoDMAcciones.frIsoAccionesEnterRect(Memo: TStringList; View: TfrView);
//sfg.marín var x:integer;
begin
  if (memo.Count > 0) then
  begin
     if (Memo[0] = '[Imagen]') and (View is TfrPictureView) then
     begin
        View.Visible := True;
     end;
  end;
end;
//*********************************************************
procedure TIsoDMAcciones.QMIsoAccionesAfterScroll(DataSet: TDataSet);
begin
  IsoFMAcciones.AbreOCierra;

  if ((QMIsoAccionesPROCEDENCIA.AsString = 'INC') and (QMIsoAccionesID_INC.AsInteger <> 0)) then
  begin
     IsoFMAcciones.LProcedenciaIncidencia.Visible := True;
     IsoFMAcciones.DBEProcedencia.Visible := True;
  end
  else
  begin
     IsoFMAcciones.LProcedenciaIncidencia.Visible := False;
     IsoFMAcciones.DBEProcedencia.Visible := False;
  end;
end;

procedure TIsoDMAcciones.QMIsoAccionesBeforePost(DataSet: TDataSet);
begin
  if (QMIsoAcciones.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(RIC) FROM ISO_ACCIONES_PRE WHERE EMPRESA = :EMPRESA AND TIPO = :TIPO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['TIPO'].AsString := QMIsoAccionesTIPO.AsString;
           ExecQuery;
           QMIsoAccionesRIC.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TIsoDMAcciones.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMIsoAcciones, '10000');
end;

procedure TIsoDMAcciones.CierraAccion;
begin
  // Aviso de total 0
end;

procedure TIsoDMAcciones.BloqueaPedido;
begin
  with QBloquea do
  begin
     Close;
     Params.ByName['ESTADO'].AsInteger := 5;
     Params.ByName['ID_ACCION_PRE'].AsInteger := QMIsoAccionesID_ACCION_PRE.AsInteger;
     ExecQuery;
     QMIsoAcciones.Refresh;
     FreeHandle;
  end;
  QMIsoAccionesFECHACIERRE.AsDateTime := REntorno.FechaTrabSH;
end;

procedure TIsoDMAcciones.DesBloqueaPedido;
begin
  with QBloquea do
  begin
     Close;
     Params.ByName['ESTADO'].AsInteger := 0;
     Params.ByName['ID_ACCION_PRE'].AsInteger := QMIsoAccionesID_ACCION_PRE.AsInteger;
     ExecQuery;
     QMIsoAcciones.Refresh;
     FreeHandle;
  end;
end;

function TIsoDMAcciones.EstadoDocumento: integer;
begin
  Result := QMIsoAcciones.FieldByName('ESTADO').AsInteger;
end;

procedure TIsoDMAcciones.QMIsoAccionesBeforeOpen(DataSet: TDataSet);
begin
  xEstados.Open;
end;

procedure TIsoDMAcciones.FiltraAcciones(Filtro: string);
begin
  with QMIsoAcciones do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := 'SELECT * FROM ISO_ACCIONES_PRE where ' + Filtro;
     Open;
  end;
end;

end.
