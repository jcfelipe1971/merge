unit UDMPlantillas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TDMPlantillas = class(TDataModule)
     QMPlantillas: TFIBTableSet;
     DSQMPlantillas: TDataSource;
     QMPlantillasPLANTILLA: TIntegerField;
     QMPlantillasNOMBRE: TFIBStringField;
     QMPlantillasTIPO: TFIBStringField;
     QMPlantillasTITULO: TFIBStringField;
     QMPlantillasENTRADA: TIntegerField;
     QMPlantillasMONEDA: TFIBStringField;
     xTipo: TFIBDataSetRO;
     DSxTipo: TDataSource;
     xMoneda: TFIBDataSetRO;
     DSxMoneda: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetallePLANTILLA: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleCARGO: TFIBStringField;
     QMDetalleABONO: TFIBStringField;
     QMDetalleIMPORTE: TFloatField;
     SPLineaSiguiente: THYFIBQuery;
     TLocal: THYTransaction;
     QMDetalleTEXTO: TFIBStringField;
     QCambiaMoneda: THYFIBQuery;
     QMPlantillasCONCEPTO_COMUN: TIntegerField;
     QMPlantillasCONCEPTO_PROPIO: TIntegerField;
     QMPlantillasBANCO: TIntegerField;
     TUpdate: THYTransaction;
     QMDetalleCENTRO_COSTE: TIntegerField;
     procedure DMPlantillasCreate(Sender: TObject);
     procedure QMPlantillasBeforePost(DataSet: TDataSet);
     procedure QMPlantillasNewRecord(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMPlantillasMONEDAChange(Sender: TField);
     procedure QMPlantillasAfterOpen(DataSet: TDataSet);
     procedure QMPlantillasTIPOChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMPlantillasBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     monedaold: string;
     procedure CambiaMonedaDetalle;
  public
     HayCambios: boolean;
     procedure CambiaMascara;
     function TieneCentroCoste(Cuenta: string): boolean;
  end;

var
  DMPlantillas : TDMPlantillas;

implementation

uses UDMMain, UUtiles, URecursos, UEntorno, UFMPlantillas;

{$R *.DFM}

procedure TDMPlantillas.DMPlantillasCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMPlantillas.Open;
  CambiaMascara;
end;

procedure TDMPlantillas.QMPlantillasBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMPlantillasPLANTILLA.AsInteger = 0)) then
     DMMain.Contador_Gen(DataSet, 'conta_plantillas_con', 'Plantilla');
end;

procedure TDMPlantillas.QMPlantillasNewRecord(DataSet: TDataSet);
begin
  QMPlantillasPLANTILLA.AsInteger := 0;
  QMPlantillasTIPO.AsString := 'NOR';
  QMPlantillasMONEDA.AsString := REntorno.Moneda;
  QMPlantillasTITULO.AsString := ' ';
  QMPlantillasENTRADA.AsInteger := REntorno.Entrada;
  QMPlantillasCONCEPTO_COMUN.AsInteger := 0; {dji lrk kri}
  QMPlantillasCONCEPTO_PROPIO.AsInteger := 0; {dji lrk kri}
  QMPlantillasBANCO.AsInteger := 0; {dji lrk kri}
end;

procedure TDMPlantillas.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMPlantillas.State = dsInsert) or (QMPlantillas.State = dsEdit)) then
  begin
     QMPlantillas.Post;
     QMDetalle.Edit;
     CambiaMascara;
  end;
  QMDetallePLANTILLA.AsInteger := QMPlantillasPLANTILLA.AsInteger;

  with SPLineaSiguiente do
  begin
     Close;
     Params.ByName['PLANTILLA'].AsInteger := QMPlantillasPLANTILLA.AsInteger;
     ExecQuery;
     QMDetalleLINEA.AsInteger := FieldByName['LINEA'].AsInteger;
     FreeHandle;
  end;

  //Ponemos un texto por defecto
  if QMPlantillasTIPO.AsString = 'APE' then
     QMDetalleTEXTO.AsString := _('ASIENTO DE APERTURA')
  else
     QMDetalleTEXTO.AsString := QMPlantillasTITULO.AsString;
end;

// Nou
procedure TDMPlantillas.CambiaMascara;
var
  LocalMascaraN : string;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMPlantillasMONEDA.AsString, 1);
  QMDetalleIMPORTE.DisplayFormat := LocalMascaraN;
  QMDetalleCARGO.EditMask := REntorno.MascaraCuentas;
  QMDetalleABONO.EditMask := REntorno.MascaraCuentas;
end;

procedure TDMPlantillas.QMPlantillasMONEDAChange(Sender: TField);
begin
  with xMoneda do
  begin
     Close;
     Open;
  end;
  CambiaMascara;
end;

procedure TDMPlantillas.QMPlantillasAfterOpen(DataSet: TDataSet);
begin
  //Abrimos sus tablas hijas
  QMDetalle.Open;
  xTipo.Open;
  xMoneda.Open;
end;

procedure TDMPlantillas.QMPlantillasTIPOChange(Sender: TField);
begin
  with xTipo do
  begin
     Close;
     Open;
  end;
end;

procedure TDMPlantillas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;

  if (monedaold <> QMPlantillasMONEDA.AsString) then
     CambiaMonedaDetalle;
end;

procedure TDMPlantillas.QMDetalleBeforePost(DataSet: TDataSet);
begin
  QMDetalleTEXTO.AsString := QMDetalleTEXTO.AsString;
end;

procedure TDMPlantillas.QMPlantillasBeforeEdit(DataSet: TDataSet);
begin
  monedaold := QMPlantillasMONEDA.AsString;
end;

procedure TDMPlantillas.CambiaMonedaDetalle;
begin
  with QCambiaMoneda do
  begin
     Close;
     Params.ByName['PLANTILLA'].AsInteger := QMPlantillasPLANTILLA.AsInteger;
     Params.ByName['MONEDAOLD'].AsString := monedaold;
     Params.ByName['MONEDA'].AsString := QMPlantillasMONEDA.AsString;
     Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMPlantillas.QMDetalleAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  // dji lrk kri Centro de Costes
  if ((TieneCentroCoste(QMDetalleCARGO.AsString)) or (TieneCentroCoste(QMDetalleABONO.AsString))) then
     FMPlantillas.ACentroCoste.Execute;
end;

function TDMPlantillas.TieneCentroCoste(Cuenta: string): boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := ' select centro_coste from VER_SUBCUENTAS ' +
           ' where ((empresa=?empresa )and(ejercicio=?ejercicio) ' +
           ' and(canal=?canal)and(cuenta=?cuenta) and (pgc=?pgc))';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := Cuenta;
        Params.ByName['PGC'].AsInteger := REntorno.PGC;
        ExecQuery;
        Result := FieldByName['CENTRO_COSTE'].AsInteger = 1;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

end.
