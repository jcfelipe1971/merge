unit UProDMEquivalenciaArticulo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Dialogs, Controls;

type
  TProDMEquivalenciaArticulo = class(TDataModule)
     TLocal: THYTransaction;
     QMProCabEquival: TFIBTableSet;
     QMProDetEquival: TFIBTableSet;
     DSProCabEquival: TDataSource;
     DSProDetEquival: TDataSource;
     QMProCabEquivalEMPRESA: TIntegerField;
     QMProCabEquivalID_EQUIVAL: TIntegerField;
     QMProCabEquivalDESC_EQUIVAL: TFIBStringField;
     QMProCabEquivalARTICULO: TFIBStringField;
     QMProCabEquivalDEFECTO: TIntegerField;
     QMProDetEquivalEMPRESA: TIntegerField;
     QMProDetEquivalID_EQUIVAL: TIntegerField;
     QMProDetEquivalLINEA: TIntegerField;
     QMProDetEquivalORDEN: TIntegerField;
     QMProDetEquivalARTICULO_EQUIVAL: TFIBStringField;
     QMProDetEquivalTITULO: TStringField;
     QMProDetEquivalSTOCK: TFloatField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProCabEquivalNewRecord(DataSet: TDataSet);
     procedure QMProCabEquivalAfterOpen(DataSet: TDataSet);
     procedure QMProDetEquivalTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetEquivalNewRecord(DataSet: TDataSet);
     procedure QMProCabEquivalBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMProCabEquivalAfterPost(DataSet: TDataSet);
     procedure QMProCabEquivalBeforeClose(DataSet: TDataSet);
     procedure QMProDetEquivalSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     Almacen: string;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure PosicionaEquivalencia(IDEquivalencia: integer);
     procedure StockAlmacen(aAlmacen: string);
  end;

var
  ProDMEquivalenciaArticulo : TProDMEquivalenciaArticulo;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles, UDameDato;

{$R *.dfm}

procedure TProDMEquivalenciaArticulo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Almacen := 'NOCALC';
  DMMain.FiltraTabla(QMProCabEquival, '10000');
end;

procedure TProDMEquivalenciaArticulo.QMProCabEquivalNewRecord(DataSet: TDataSet);
begin
  QMProCabEquivalEMPRESA.Value := REntorno.Empresa;
  QMProCabEquivalDEFECTO.Value := 0;
end;

procedure TProDMEquivalenciaArticulo.QMProCabEquivalAfterOpen(DataSet: TDataSet);
begin
  QMProDetEquival.Open;
end;

procedure TProDMEquivalenciaArticulo.QMProDetEquivalTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMProDetEquivalARTICULO_EQUIVAL.AsString);
end;

procedure TProDMEquivalenciaArticulo.QMProDetEquivalNewRecord(DataSet: TDataSet);
begin
  QMProDetEquivalEMPRESA.AsInteger := REntorno.Empresa;
  QMProDetEquivalID_EQUIVAL.AsInteger := QMProCabEquivalID_EQUIVAL.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) MAX_LINEA, MAX(ORDEN) MAX_ORDEN FROM PRO_SYS_DET_EQUIVAL WHERE EMPRESA = :EMPRESA AND ID_EQUIVAL = :ID_EQUIVAL';
        Params.ByName['EMPRESA'].AsInteger := QMProCabEquivalEMPRESA.AsInteger;
        Params.ByName['ID_EQUIVAL'].AsInteger := QMProCabEquivalID_EQUIVAL.AsInteger;
        ExecQuery;
        QMProDetEquivalLINEA.AsInteger := FieldByName['MAX_LINEA'].AsInteger + 1;
        QMProDetEquivalORDEN.AsInteger := FieldByName['MAX_ORDEN'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TProDMEquivalenciaArticulo.QMProCabEquivalBeforePost(DataSet: TDataSet);
var
  IDEquivalenciaPorDefecto : integer;
begin
  if (DataSet.State = dsInsert) then
     QMProCabEquivalID_EQUIVAL.AsInteger := DMMain.Contador_E('ZEQ');

  // Verifico si otra equivalencia para este artículo está establecida como por defecto.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_EQUIVAL FROM PRO_SYS_CAB_EQUIVAL WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO AND DEFECTO = 1 AND ID_EQUIVAL <> :ID_EQUIVAL';
        Params.ByName['EMPRESA'].AsInteger := QMProCabEquivalEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMProCabEquivalARTICULO.AsString;
        Params.ByName['ID_EQUIVAL'].AsInteger := QMProCabEquivalID_EQUIVAL.AsInteger;
        ExecQuery;
        IDEquivalenciaPorDefecto := FieldByName['ID_EQUIVAL'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (IDEquivalenciaPorDefecto > 0) then
  begin
     if (QMProCabEquivalDEFECTO.AsInteger = 1) then
     begin
        if MessageDlg(_('Error: Ya existe un equivalencia por defecto de este artículo.') +
           #13#10 + _('Solo puede existir una sola equivalencia por defecto.') + #13#10 +
           _('Desea que el actual sea la Por Defecto?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE PRO_SYS_CAB_EQUIVAL SET DEFECTO = 0 WHERE EMPRESA = :EMPRESA AND ID_EQUIVAL = :ID_EQUIVAL';
                 Params.ByName['EMPRESA'].AsInteger := QMProCabEquivalEMPRESA.AsInteger;
                 Params.ByName['ID_EQUIVAL'].AsInteger := IDEquivalenciaPorDefecto;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end
        else
           QMProCabEquivalDEFECTO.AsInteger := 0;
     end;
  end
  else
     // Poso per defecte si no hi ha cap més article
     QMProCabEquivalDEFECTO.AsInteger := 1;
end;

procedure TProDMEquivalenciaArticulo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMEquivalenciaArticulo.QMProCabEquivalAfterPost(DataSet: TDataSet);
var
  IDEquivalencia : integer;
begin
  IDEquivalencia := QMProCabEquivalID_EQUIVAL.AsInteger;
  graba(DataSet);
  PosicionaEquivalencia(IDEquivalencia);
end;

procedure TProDMEquivalenciaArticulo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProCabEquival, '10000');
end;

procedure TProDMEquivalenciaArticulo.PosicionaEquivalencia(IDEquivalencia: integer);
begin
  /// Posiciona en el registro que corresponde al IDEquivalencia o en el primero si no lo encuentra

  if (IDEquivalencia <> 0) then
  begin
     with QMPROCabEquival do
     begin
        Close;
        Open;
        DisableControls;
        try
           First;
           while ((not EOF) and (QMProCabEquivalID_EQUIVAL.AsInteger <> IDEquivalencia)) do
              Next;

           // Si no lo encuentro voy al primer elemento
           if (QMProCabEquivalID_EQUIVAL.AsInteger <> IDEquivalencia) then
              First;
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TProDMEquivalenciaArticulo.QMProCabEquivalBeforeClose(DataSet: TDataSet);
begin
  QMProDetEquival.Close;
end;

procedure TProDMEquivalenciaArticulo.QMProDetEquivalSTOCKGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  Stock : double;
begin
  if (Almacen = 'NOCALC') then
     Text := ''
  else
  begin
     Stock := DMMain.DameStockArticulo(QMProDetEquivalEMPRESA.AsInteger, REntorno.Canal, QMProDetEquivalARTICULO_EQUIVAL.AsString, Almacen);
     Text := FloatToStrDec(Stock, DecimalSeparator, DMMain.DameMascaraUnidades(QMProDetEquivalARTICULO_EQUIVAL.AsString));
  end;
end;

procedure TProDMEquivalenciaArticulo.StockAlmacen(aAlmacen: string);
var
  TituloColumanAlmacen : string;
begin
  Almacen := aAlmacen;

  // Cambio el titulo de la columna para informar de que almacen obtengo el stock
  if (Almacen = 'NOCALC') then
     TituloColumanAlmacen := 'OFF'
  else
  if (Almacen = '') then
     TituloColumanAlmacen := 'ALL'
  else
     TituloColumanAlmacen := Almacen;
  QMProDetEquivalSTOCK.DisplayLabel := Format(_('Stock[%s]'), [TituloColumanAlmacen]);

  // Refresco el detalle
  QMProDetEquival.Close;
  QMProDetEquival.Open;
end;

end.
