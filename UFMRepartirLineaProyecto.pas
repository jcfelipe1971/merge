unit UFMRepartirLineaProyecto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, UFPEditSimple, DB, FIBDataSet,
  FIBDatabase, UFIBModificados, FIBTableDataSet, UNavigator, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TFMRepartirLineaProyecto = class(TFPEditSimple)
     xProyecto: TFIBTableSet;
     DSxProyecto: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xProyectoEMPRESA: TIntegerField;
     xProyectoPROYECTO: TIntegerField;
     xProyectoEJERCICIO: TIntegerField;
     xProyectoCANAL: TIntegerField;
     xProyectoSERIE: TFIBStringField;
     xProyectoTIPO: TFIBStringField;
     xProyectoRIG: TIntegerField;
     xProyectoLINEA: TIntegerField;
     xProyectoUNIDADES: TFloatField;
     xProyectoUNI_MAX: TFloatField;
     xProyectoIMPORTE: TFloatField;
     xProyectoAFEC_TOTAL: TIntegerField;
     xProyectoID_DETALLES_E: TIntegerField;
     xProyectoID_E: TIntegerField;
     xProyectoTOTAL: TFloatField;
     xProyectoPORC_AFECTACION: TFloatField;
     DBGFProyectos: TDBGridFind2000;
     procedure xProyectoNewRecord(DataSet: TDataSet);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure xProyectoAfterPost(DataSet: TDataSet);
     procedure xProyectoAfterDelete(DataSet: TDataSet);
  private
     { Private declarations }
     Tipo: string;
     IdDetalles: integer;
     Importe, UnidadesMax: double;
     procedure CompruebaPorcentajes;

  public
     { Public declarations }
     procedure Inicializar(aTipo: string; aIdDetalles: integer; aUnidadesMax, aImporte: double);
  end;

var
  FMRepartirLineaProyecto : TFMRepartirLineaProyecto;

implementation

uses
  UDMMain, UEntorno, UUtiles, HYFIBQuery;

{$R *.dfm}

{ TFMRepartirLineaProyecto }

procedure TFMRepartirLineaProyecto.Inicializar(aTipo: string; aIdDetalles: integer; aUnidadesMax, aImporte: double);
begin
  Tipo := aTipo;
  IdDetalles := aIdDetalles;
  UnidadesMax := aUnidadesMax;
  Importe := aImporte;

  with xProyecto do
  begin
     Close;
     { TODO : Parametrizar según compras/ventas }
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM EMP_PROYECTOS_COMPRAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TIPO = :TIPO AND ');
     SelectSQL.Add(' ID_DETALLES_E = :ID_DETALLES ');
     SelectSQL.Add(' ORDER BY PROYECTO ');

     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['ID_DETALLES'].AsInteger := IdDetalles;
     Open;
  end;

  AsignaDisplayFormat(xProyecto, MascaraN, MascaraI, ShortDateFormat);
end;

procedure TFMRepartirLineaProyecto.xProyectoNewRecord(DataSet: TDataSet);
begin
  inherited;
  xProyecto.FieldByName('EMPRESA').AsInteger := 0; // Para que tome los datos según el ID_DETALLLES_?
  { TODO : Parametrizar según compras/ventas }
  xProyecto.FieldByName('ID_DETALLES_E').AsInteger := IdDetalles;
  xProyecto.FieldByName('AFEC_TOTAL').AsInteger := 0;
  xProyecto.FieldByName('UNI_MAX').AsFloat := UnidadesMax;
  xProyecto.FieldByName('IMPORTE').AsFloat := Importe;
end;

procedure TFMRepartirLineaProyecto.FormCreate(Sender: TObject);
begin
  inherited;
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TFMRepartirLineaProyecto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if TLocal.InTransaction then
     TLocal.Commit;
end;

procedure TFMRepartirLineaProyecto.xProyectoAfterPost(DataSet: TDataSet);
begin
  inherited;
  CompruebaPorcentajes;
  // Refresco porque se pueden tocar otros registros en triggers Insert Update
  Refrescar(xProyecto, 'PROYECTO', xProyectoPROYECTO.AsInteger);
end;

procedure TFMRepartirLineaProyecto.xProyectoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CompruebaPorcentajes;
end;

procedure TFMRepartirLineaProyecto.CompruebaPorcentajes;
var
  Suma : double;
  i : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(PORC_AFECTACION) FROM EMP_PROYECTOS_COMPRAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' ID_DETALLES_E = :ID_DETALLES ');
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ID_DETALLES'].AsInteger := IdDetalles;
        ExecQuery;
        Suma := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  i := EncuentraField(DBGFProyectos, 'PORC_AFECTACION');
  if (i >= 0) then
  begin
     with DBGFProyectos.Columns.Items[i] do
     begin
        if (Abs(Suma - 100) > 0.001) then
        begin
           Color := Brighten(clRed, 50);
           Font.Color := clWindowText;
        end
        else
        begin
           Color := clWindow;
           Font.Color := clWindowText;
        end;
     end;
  end;
end;

end.
