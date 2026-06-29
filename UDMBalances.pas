unit UDMBalances;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, Dialogs, HYFIBQuery, FIBDataSetRO;

type
  TDMBalances = class(TDataModule)
     xBalances: TFIBDataSetRO;
     DSQMBalances: TDataSource;
     QMBalances_Def: TFIBTableSet;
     DSQMBalances_Def: TDataSource;
     QMBalances_Def_Detalle: TFIBTableSet;
     DSQMBalances_Def_Detalle: TDataSource;
     QMBalances_DefBALANCE: TIntegerField;
     QMBalances_DefCLAVE: TFIBStringField;
     QMBalances_DefTIPO: TFIBStringField;
     QMBalances_DefGRUPO: TFIBStringField;
     QMBalances_DefORDEN: TIntegerField;
     QMBalances_DefSIGNO: TFIBStringField;
     QMBalances_Def_DetalleBALANCE: TIntegerField;
     QMBalances_Def_DetalleCLAVE: TFIBStringField;
     QMBalances_Def_DetalleTIPO: TFIBStringField;
     QMBalances_Def_DetalleACUMULA: TFIBStringField;
     QMBalances_Def_DetalleSIGNO: TFIBStringField;
     QMBalances_Def_DetalleDESC_SIGNO: TStringField;
     QMBalances_DefPAIS: TFIBStringField;
     QMBalances_Def_DetallePAIS: TFIBStringField;
     xBalancesElec: TFIBDataSetRO;
     DSxBalancesElec: TDataSource;
     QMBalancesCAB: TFIBTableSet;
     DSQMBalancesCAB: TDataSource;
     QMBalancesCABPAIS: TFIBStringField;
     QMBalancesCABBALANCE: TIntegerField;
     QMBalancesCABTITULO: TFIBStringField;
     QMBalancesCABGENERICO: TIntegerField;
     QMBalancesCABTIPO: TIntegerField;
     xBalancesPAIS: TFIBStringField;
     xBalancesBALANCE: TIntegerField;
     xBalancesTITULO: TFIBStringField;
     xBalancesGENERICO: TIntegerField;
     xBalancesTIPO: TIntegerField;
     QMBalancesCABORIGEN: TIntegerField;
     TLocal: THYTransaction;
     QMBalances_Def_DetallePORCENTAJE: TFloatField;
     QMBalances_DefTITULO2: TFIBStringField;
     TUpdate: THYTransaction;
     QMBalances_DefDESC_TIPO: TStringField;
     QMBalances_DefDESC_GRUPO: TStringField;
     xBalancesACTIVO: TIntegerField;
     QMBalancesCABACTIVO: TIntegerField;
     procedure DMBalancesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMBalances_Def_DetalleNewRecord(DataSet: TDataSet);
     procedure QMBalances_DefNewRecord(DataSet: TDataSet);
     procedure QMBalances_Def_DetalleSIGNOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xBalancesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xBalancesAfterOpen(DataSet: TDataSet);
     procedure QMBalances_DefAfterOpen(DataSet: TDataSet);
     procedure QMBalancesCABNewRecord(DataSet: TDataSet);
     procedure QMBalancesBloquea(DataSet: TDataSet);
     procedure QMBalancesCABBALANCEValidate(Sender: TField);
     procedure QMBalancesCABAfterInsert(DataSet: TDataSet);
     procedure QMBalancesCABPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure xBalancesBeforeClose(DataSet: TDataSet);
     procedure QMBalances_DefBeforeClose(DataSet: TDataSet);
     procedure QMBalances_DefDESC_TIPOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMBalances_DefDESC_GRUPOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     nOrigen: smallint;
     procedure BusquedaCompleja;
     procedure Refresca;
     procedure RenumeraBalances;
     procedure AbreCab;
     procedure AbreReplica;
     procedure Regenera;
  end;

var
  DMBalances : TDMBalances;

implementation

uses UEntorno, UUtiles, UDMMain, UFBusca, UFMBalances, SysUtils;

{$R *.DFM}

procedure TDMBalances.DMBalancesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMBalances.Refresca;
var
  Marca : TBookmark;
begin
  Marca := Self.QMBalances_Def.GetBookmark;
  try
     DMMain.FiltraRO(xBalances, '00001', True);
     Self.QMBalances_Def.GotoBookmark(Marca);
  finally
     Self.QMBalances_Def.FreeBookmark(Marca);
  end;
end;

procedure TDMBalances.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMBalances.QMBalances_Def_DetalleNewRecord(DataSet: TDataSet);
begin
  with QMBalances_Def_Detalle do
  begin
     FieldByName('PAIS').AsString := QMBalances_DefPAIS.AsString;
     FieldByName('BALANCE').AsInteger := QMBalances_DefBALANCE.AsInteger;
     FieldByName('CLAVE').AsString := QMBalances_DefCLAVE.AsString;
     FieldByName('TIPO').AsString := QMBalances_DefTIPO.AsString;
  end;
end;

procedure TDMBalances.QMBalances_DefNewRecord(DataSet: TDataSet);
begin
  with QMbalances_Def do
  begin
     FieldByName('PAIS').AsString := xBalancesPAIS.AsString;
     FieldByName('BALANCE').AsInteger := xBalancesBALANCE.AsInteger;
  end;
end;

procedure TDMBalances.QMBalances_Def_DetalleSIGNOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if Sender.IsNull then
     Exit;

  case Sender.AsInteger of
     0: Self.QMBalances_Def_DetalleDESC_SIGNO.Value := _('Comportamiento normal');
     1: Self.QMBalances_Def_DetalleDESC_SIGNO.Value := _('Cambio de signo');
     2: Self.QMBalances_Def_DetalleDESC_SIGNO.Value := _('Cambio de signo con puesta a cero');
     3: Self.QMBalances_Def_DetalleDESC_SIGNO.Value := _('Mostrar el debe de la cuenta');
     4: Self.QMBalances_Def_DetalleDESC_SIGNO.Value := _('Mostrar el haber de la cuenta');
     5: Self.QMBalances_Def_DetalleDESC_SIGNO.Value := _('Saldo con puesta a cero si es negativo');
     6: Self.QMBalances_Def_DetalleDESC_SIGNO.Value := _('Saldo con puesta a cero si es positivo');
  end;
  Text := Sender.AsString;
end;

procedure TDMBalances.xBalancesTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := xBalancesBALANCE.AsString + ' - ' + xBalancesTITULO.AsString;
end;

procedure TDMBalances.BusquedaCompleja;
var
  Filtro : TStrings;
  Orden : string;
begin
  Filtro := TStringList.Create;
  try
     TFBusca.Create(Self).SeleccionaBusqueda(QMBalances_Def, '00000', False);
     QMBalances_Def.Close;
     QMBalances_Def.DameFiltroSelect(filtro);
     Orden := QMBalances_Def.OrdenadoPor;
     QMBalances_Def.Ordenar('');
     if Filtro.Count = 0 then
        QMBalances_Def.SelectSQL.Add(' WHERE ')
     else
        QMBalances_Def.SelectSQL.Add(' AND ');

     QMBalances_Def.SelectSQL.Add(' PAIS=?PAIS ');
     QMBalances_Def.SelectSQL.Add('AND BALANCE=?BALANCE');
     QMBalances_Def.Ordenar(Orden);
     QMBalances_Def.Open;
  finally
     Filtro.Free;
  end;
end;

procedure TDMBalances.xBalancesAfterOpen(DataSet: TDataSet);
begin
  QMBalances_Def.Open;
end;

procedure TDMBalances.QMBalances_DefAfterOpen(DataSet: TDataSet);
begin
  QMBalances_Def_Detalle.Open;
end;

procedure TDMBalances.RenumeraBalances;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE UT_BALANCE_RENUMERA(:PAIS, :BALANCE)';
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['BALANCE'].AsInteger := QMBalances_DefBALANCE.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMBalances.QMBalancesCABNewRecord(DataSet: TDataSet);
begin
  QMBalancesCABPAIS.AsString := REntorno.Pais;
  QMBalancesCABTIPO.AsInteger := xBalancesElec.FieldByName('TIPO').AsInteger;
  QMBalancesCABORIGEN.AsInteger := nOrigen;
  QMBalancesCABTITULO.AsString := _('Nuevo Balance');
  QMBalancesCABGENERICO.AsInteger := 0;
  QMBalancesCABACTIVO.AsInteger := 1;
end;

procedure TDMBalances.AbreCab;
begin
  DMMain.FiltraTabla(QMBalancesCab, '00001', True);
end;

procedure TDMBalances.AbreReplica;
begin
  DMMain.FiltraRO(xBalancesElec, '00001', True);
end;

procedure TDMBalances.QMBalancesBloquea(DataSet: TDataSet);
begin
  if (DataSet.FieldByName('GENERICO').AsInteger = 1) then
     raise
     Exception.Create(_('No se puede editar o eliminar un balance básico'));
end;

procedure TDMBalances.QMBalancesCABBALANCEValidate(Sender: TField);
begin
  if ((Sender.Value < 0) or (Sender.Value > 32000)) then
     raise
     Exception.Create(_('Rango inválido'));
end;

procedure TDMBalances.QMBalancesCABAfterInsert(DataSet: TDataSet);
begin
  ShowMessage(_('Registro nuevo'));
end;

procedure TDMBalances.QMBalancesCABPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  DataSet.Close;
  DataSet.Open;
end;

procedure TDMBalances.Regenera;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE S_BALANCE_COPIA(:PAIS, :ORIGEN, :DESTINO)';
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['ORIGEN'].AsInteger := QMBalancesCABORIGEN.AsInteger;
        Params.ByName['DESTINO'].AsInteger := QMBalancesCABBALANCE.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMBalances.xBalancesBeforeClose(DataSet: TDataSet);
begin
  QMBalances_Def.Close;
end;

procedure TDMBalances.QMBalances_DefBeforeClose(DataSet: TDataSet);
begin
  QMBalances_Def_Detalle.Close;
end;

procedure TDMBalances.QMBalances_DefDESC_TIPOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMBalances_DefTIPO.AsString = 'L' then
     Text := _('Listado')
  else if QMBalances_DefTIPO.AsString = 'R' then
     Text := _('Rótulo')
  else if QMBalances_DefTIPO.AsString = 'S' then
     Text := _('Sumatorio')
  else if QMBalances_DefTIPO.AsString = 'T' then
     Text := _('Total')
  else
     Text := '';

  // Si es un rotulo, el panel no debe mostrar datos.
  FMBalances.PDetalle.Visible := (QMBalances_DefTIPO.AsString <> 'R');
end;

procedure TDMBalances.QMBalances_DefDESC_GRUPOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMBalances_DefGRUPO.AsString = 'A' then
     Text := _('Activo')
  else if QMBalances_DefGRUPO.AsString = 'P' then
     Text := _('Pasivo')
  else if QMBalances_DefGRUPO.AsString = 'D' then
     Text := _('Debe')
  else if QMBalances_DefGRUPO.AsString = 'H' then
     Text := _('Haber')
  else
     Text := '';
end;

end.
