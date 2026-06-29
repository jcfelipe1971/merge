unit UDMCondicionesEspeciales;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMCondicionesEspeciales = class(TDataModule)
     QMCondiciones: TFIBTableSet;
     DSQMCondiciones: TDataSource;
     TLocal: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     SPLineaSiguiente: THYFIBQuery;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleUNID_MINIMAS: TFloatField;
     QMDetalleUNID_MAXIMAS: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMCondicionesEMPRESA: TIntegerField;
     QMCondicionesEJERCICIO: TIntegerField;
     QMCondicionesCANAL: TIntegerField;
     QMCondicionesTIPO: TFIBStringField;
     QMCondicionesRIG: TIntegerField;
     QMCondicionesCLIENTE: TIntegerField;
     QMCondicionesARTICULO: TFIBStringField;
     QMCondicionesFAMILIA: TFIBStringField;
     QMCondicionesPERFIL: TFIBStringField;
     QMCondicionesAGRUPACION: TFIBStringField;
     QMCondicionesALTA: TDateTimeField;
     QMCondicionesBAJA: TDateTimeField;
     QMCondicionesACTIVO: TIntegerField;
     QMCondicionesTITULO_CLIENTE: TFIBStringField;
     QMCondicionesTITULO_ARTICULO: TFIBStringField;
     QMCondicionesTITULO_FAMILIA: TFIBStringField;
     QMCondicionesTITULO_PERFIL: TFIBStringField;
     QMCondicionesTITULO_AGRUPACION: TFIBStringField;
     TUpdate: THYTransaction;
     QMCondicionesTRASPASAR: TIntegerField;
     procedure DMCondicionesEspecialesCreate(Sender: TObject);
     procedure QMCondicionesNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMCondicionesAfterOpen(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMCondicionesBeforePost(DataSet: TDataSet);
     procedure QMDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
  private
     { Private declarations }
     Tipo: string;
     Condicion: string;
  public
     { Public declarations }
     procedure GrabaCabacera;
     procedure TipoCondicion(TipoCond: string; CondicionKri: string);
     function BusquedaCompleja: integer;
  end;

var
  DMCondicionesEspeciales : TDMCondicionesEspeciales;

implementation

uses UDMMain, UEntorno, ufBusca;

{$R *.DFM}

procedure TDMCondicionesEspeciales.DMCondicionesEspecialesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMDetalleUNID_MINIMAS.DisplayFormat := MascaraN;
  QMDetalleUNID_MAXIMAS.DisplayFormat := MascaraN;
  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_3.DisplayFormat := MascaraP;
  QMDetallePRECIO.DisplayFormat := MascaraL;
end;

procedure TDMCondicionesEspeciales.TipoCondicion(TipoCond: string; CondicionKri: string);
begin
  // DataModule común a todas las condiciones especiales.
  // Por tanto, hay que filtrar por el tipo de condición.
  Tipo := TipoCond;
  Condicion := CondicionKri;
  QMCondiciones.Close;
  if (Tipo <> 'ELI') then
  begin
     QMCondiciones.SelectSQL.Text :=
        'SELECT * FROM VER_CONDICIONES_C where (empresa=?empresa) ' +
        'and (ejercicio=?ejercicio) and (canal=?canal) and (Tipo=' + '''' + TipoCond + ''')';
     if (CondicionKri > ' ') then
        QMCondiciones.SelectSQL.Text := QMCondiciones.SelectSQL.Text +
           'and (' + CondicionKri + ') ';
     QMCondiciones.SelectSQL.Add(' ORDER BY AGRUPACION, PERFIL, CLIENTE, FAMILIA, ARTICULO');
     DMMain.FiltraTabla(QMCondiciones, '11100', True);
  end;
end;

procedure TDMCondicionesEspeciales.QMCondicionesNewRecord(DataSet: TDataSet);
begin
  QMCondicionesEMPRESA.AsInteger := REntorno.Empresa;
  QMCondicionesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondicionesCANAL.AsInteger := REntorno.Canal;
  QMCondicionesTIPO.AsString := Tipo;
  QMCondicionesRIG.AsInteger := 0;
  QMCondicionesALTA.AsDateTime := Date;
  QMCondicionesBAJA.AsDateTime := Date;
  QMCondicionesACTIVO.AsInteger := 1;
  QMCondicionesTRASPASAR.AsInteger := 1;
end;

procedure TDMCondicionesEspeciales.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCondicionesEspeciales.GrabaCabacera;
begin
  if ((QMCondiciones.State = dsInsert) or (QMCondiciones.State = dsEdit)) then
     QMCondiciones.Post;
end;

procedure TDMCondicionesEspeciales.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMCondiciones.State = dsInsert) or (QMCondiciones.State = dsEdit)) then
  begin
     QMDetalle.Cancel;
     QMCondiciones.Post;
     QMCondiciones.Refresh;
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetalleCANAL.AsInteger := REntorno.Canal;
  QMDetalleTIPO.AsString := QMCondiciones.FieldByName('TIPO').AsString;
  QMDetalleRIG.AsInteger := QMCondiciones.FieldByName('RIG').AsInteger;
  with SPLineaSiguiente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := QMCondiciones.FieldByName('TIPO').AsString;
     Params.ByName['RIG'].AsInteger := QMCondiciones.FieldByName('RIG').AsInteger;
     ExecQuery;
     QMDetalleLINEA.AsInteger := FieldByName['LINEA'].AsInteger;
     FreeHandle;
  end;
  QMDetallePRECIO.AsFloat := 0;
  QMDetalleDESCUENTO.AsFloat := 0;
  QMDetalleDESCUENTO_2.AsFloat := 0;
  QMDetalleDESCUENTO_3.AsFloat := 0;
end;

procedure TDMCondicionesEspeciales.QMCondicionesAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TDMCondicionesEspeciales.QMDetalleAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TDMCondicionesEspeciales.QMCondicionesBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and
     ((QMCondicionesRIG.AsInteger = 0) or (QMCondicionesRIG.IsNull))) then
     QMCondicionesRIG.AsInteger := DMMain.Contador_EEC(Tipo);
end;

procedure TDMCondicionesEspeciales.QMDetalleBeforeEdit(DataSet: TDataSet);
begin
  if ((QMCondiciones.State = dsInsert) or (QMCondiciones.State = dsEdit)) then
  begin
     QMDetalle.Cancel;
     QMCondiciones.Post;
     QMCondiciones.Refresh;
     QMDetalle.Edit;
  end;
end;

procedure TDMCondicionesEspeciales.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  if ((QMCondiciones.State = dsInsert) or (QMCondiciones.State = dsEdit)) then
  begin
     QMCondiciones.Post;
     QMCondiciones.Refresh;
  end;
end;

function TDMCondicionesEspeciales.BusquedaCompleja: integer;
var
  Orden, SQL : string;
begin
  with QMCondiciones do
  begin
     DisableControls;
     try
        Close;
        SQL := QMCondiciones.SelectSQL.Text;
        Orden := OrdenadoPor;
        Ordenar('');
        Result := TFBusca.Create(Self).SeleccionaBusqueda(QMCondiciones, '11100', False);
        if (Result = mrCancel) then
           QMCondiciones.SelectSQL.Text := SQL
        else
        begin
           if Pos('WHERE', UpperCase(SelectSQL.Text)) <> 0 then
              SelectSQL.Add('AND')
           else
              SelectSQL.Add('WHERE');
           SelectSQL.Add('(Tipo=' + '''' + Tipo + ''')');
           Ordenar(Orden);
        end;
        Open;
     finally
        EnableControls;
     end;
  end;
end;

end.
