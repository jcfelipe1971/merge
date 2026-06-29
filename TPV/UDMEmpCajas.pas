unit UDMEmpCajas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, DB, FIBDataSet, FIBDatabase, UFIBModificados, FIBTableDataSet,
  FIBDataSetRO, HYFIBQuery;

type
  TDMEmpCajas = class(TDataModule)
     QMEmpCajas: TFIBTableSet;
     DSQMEmpCajas: TDataSource;
     TLocal: THYTransaction;
     QMEmpCajasEMPRESA: TIntegerField;
     QMEmpCajasEJERCICIO: TIntegerField;
     QMEmpCajasCANAL: TIntegerField;
     QMEmpCajasSERIE: TFIBStringField;
     QMEmpCajasCAJA: TIntegerField;
     QMEmpCajasTITULO: TFIBStringField;
     QMEmpCajasACTIVA: TIntegerField;
     QMEmpCajasALMACEN: TFIBStringField;
     DSQMUsuarios: TDataSource;
     DSQMFormasPago: TDataSource;
     QMEmpCajasAGENTE: TIntegerField;
     xCuenta: TFIBDataSetRO;
     xCuentaCUENTA_PAGO: TFIBStringField;
     QMFormasPago: TFIBTableSet;
     QMFormasPagoEMPRESA: TIntegerField;
     QMFormasPagoEJERCICIO: TIntegerField;
     QMFormasPagoCANAL: TIntegerField;
     QMFormasPagoSERIE: TFIBStringField;
     QMFormasPagoCAJA: TIntegerField;
     QMFormasPagoFORMA_PAGO: TFIBStringField;
     QMFormasPagoCUENTA_PAGO: TFIBStringField;
     QMFormasPagoFACTURACION: TIntegerField;
     QMFormasPagoACTIVA: TIntegerField;
     QMUsuarios: TFIBTableSet;
     QMUsuariosEMPRESA: TIntegerField;
     QMUsuariosCAJA: TIntegerField;
     QMUsuariosUSUARIO: TIntegerField;
     QMUsuariosNOMBRE: TFIBStringField;
     QMUsuariosAGENTE: TIntegerField;
     QMUsuariosTITULO: TFIBStringField;
     QMUsuariosACTIVO: TIntegerField;
     xCuentaTITULO: TFIBStringField;
     QMFormasPagoTITULO: TFIBStringField;
     QMEmpCajasPIDE_USER: TIntegerField;
     QMEmpCajasPIDE_CLAVE: TIntegerField;
     QMEmpCajasPIDE_AGE: TIntegerField;
     QMEmpCajasPEDIR_A_PROV: TIntegerField;
     TUpdate: THYTransaction;
     QMFormasPagoORDEN: TIntegerField;
     procedure DMEmpCajasCreate(Sender: TObject);
     procedure QMFormasPagoNewRecord(DataSet: TDataSet);
     procedure QMUsuariosNewRecord(DataSet: TDataSet);
     procedure QMEmpCajasAfterOpen(DataSet: TDataSet);
     procedure QMFormasPagoFPChange(Sender: TField);
     procedure QMUsuariosUSUARIOChange(Sender: TField);
     procedure QMUsuariosAGENTEChange(Sender: TField);
     procedure QMUsuariosBeforeEdit(DataSet: TDataSet);
     procedure QMUsuariosBeforePost(DataSet: TDataSet);
     procedure QMFormasPagoAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure AjustaCajas;
     procedure RecargarFP;
     procedure FiltraSerie(Serie: string);
  end;

var
  DMEmpCajas : TDMEmpCajas;

implementation

uses UDMMain, UFMain, UEntorno, UFBusca, UFMEmpCajas, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMEmpCajas.DMEmpCajasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Abrir la tabla por EECS
  DMMain.FiltraTabla(QMEmpCajas, '11100', False);
end;

procedure TDMEmpCajas.AjustaCajas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_EMPRESA_AJUSTA_CAJAS (?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Refresca y vuelve a posicionar
  Refrescar(QMEmpCajas, 'CAJA', QMEmpCajasCAJA.AsInteger);
end;

procedure TDMEmpCajas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMEmpCajas, '11100');
end;

procedure TDMEmpCajas.QMFormasPagoNewRecord(DataSet: TDataSet);
begin
  if ((QMEmpCajas.State = dsInsert) or (QMEmpCajas.State = dsEdit)) then
  begin
     QMEmpCajas.Post;
     QMFormasPago.Edit;
  end;

  QMFormasPagoEMPRESA.AsInteger := QMEmpCajasEmpresa.AsInteger;
  QMFormasPagoEJERCICIO.AsInteger := QMEmpCajasEjercicio.AsInteger;
  QMFormasPagoCANAL.AsInteger := QMEmpCajasCanal.AsInteger;
  QMFormasPagoSERIE.AsString := REntorno.Serie;
  QMFormasPagoCAJA.AsInteger := QMEmpCajasCaja.AsInteger;
end;

procedure TDMEmpCajas.QMUsuariosNewRecord(DataSet: TDataSet);
begin
  if ((QMEmpCajas.State = dsInsert) or (QMEmpCajas.State = dsEdit)) then
  begin
     QMEmpCajas.Post;
     QMUsuarios.Edit;
  end;

  QMUsuariosEMPRESA.AsInteger := QMEmpCajasEmpresa.AsInteger;
  QMUsuariosCAJA.AsInteger := QMEmpCajasCaja.AsInteger;
end;

procedure TDMEmpCajas.QMEmpCajasAfterOpen(DataSet: TDataSet);
begin
  QMUsuarios.Open;
  QMFormasPago.Open;
end;

procedure TDMEmpCajas.QMFormasPagoFPChange(Sender: TField);
begin
  xCuenta.Close;
  xCuenta.Open;
  QMFormasPagoCUENTA_PAGO.AsString := xCuentaCUENTA_PAGO.AsString;
  QMFormasPagoTITULO.AsString := xCuentaTITULO.AsString;
end;

procedure TDMEmpCajas.QMUsuariosUSUARIOChange(Sender: TField);
begin
  QMUsuariosNOMBRE.AsString := DameTituloUsuario(QMUsuariosUSUARIO.AsInteger);
end;

procedure TDMEmpCajas.QMUsuariosAGENTEChange(Sender: TField);
begin
  QMUsuariosTITULO.AsString := DameTituloAgente(QMUsuariosAGENTE.AsInteger);
end;

procedure TDMEmpCajas.RecargarFP;
var
  control : integer;
begin
  control := 0;
  if not (QMFormasPago.IsEmpty) then
     if (Application.MessageBox(PChar(string(_('¿Desea Mantener las Formas de Pago actuales?'))), PChar(string(_('Atención'))),
        MB_ICONEXCLAMATION + mb_yesno + mb_defbutton2) = id_yes) then
        control := 1
     else
        control := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_TPV_RECARGAR_FP (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?CAJA, ?CONTROL)';
        Params.ByName['EMPRESA'].AsInteger := QMEmpCajasEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMEmpCajasEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMEmpCajasCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMEmpCajasSERIE.AsString;
        Params.ByName['CAJA'].AsInteger := QMEmpCajasCAJA.AsInteger;
        Params.ByName['CONTROL'].AsInteger := control;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMFormasPago.Close;
  QMFormasPago.Open;
end;

procedure TDMEmpCajas.QMUsuariosBeforeEdit(DataSet: TDataSet);
begin
  FMEmpCajas.DBGUsuario.Columns[0].Color := clInfoBK;
  FMEmpCajas.DBGUsuario.Columns[0].Font.Color := clGrayText;
  FMEmpCajas.DBGUsuario.Columns[0].ReadOnly := True;
end;

procedure TDMEmpCajas.QMUsuariosBeforePost(DataSet: TDataSet);
begin
  if ((QMUsuarios.State = dsInsert) or (QMUsuarios.State = dsEdit)) then
  begin
     FMEmpCajas.DBGUsuario.Columns[0].Color := clWindow;
     FMEmpCajas.DBGUsuario.Columns[0].Font.Color := clWindowText;
     FMEmpCajas.DBGUsuario.Columns[0].ReadOnly := False;
  end;
end;

procedure TDMEmpCajas.FiltraSerie(Serie: string);
begin
  with QMEmpCajas do
  begin
     Close;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

procedure TDMEmpCajas.QMFormasPagoAfterPost(DataSet: TDataSet);
begin
  Refrescar(QMFormasPago, 'FORMA_PAGO', QMFormasPagoFORMA_PAGO.AsString);
end;

end.
