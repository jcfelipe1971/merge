unit UDMEscandalloProd;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TDMEscandalloProd = class(TDataModule)
     TLocal: THYTransaction;
     QMEscandallo: TFIBTableSet;
     DSQMEscandallo: TDataSource;
     DSQMEscandalloDet: TDataSource;
     QMEscandalloDet: TFIBTableSet;
     QMEscandalloEMPRESA: TIntegerField;
     QMEscandalloARTICULO: TFIBStringField;
     QMEscandalloNUMERO: TIntegerField;
     QMEscandalloUNIDADES: TFloatField;
     QMEscandalloFECHA_DESDE: TDateTimeField;
     QMEscandalloFECHA_HASTA: TDateTimeField;
     QMEscandalloACTIVO: TIntegerField;
     DSxArticulos: TDataSource;
     QMEscandalloDetEMPRESA: TIntegerField;
     QMEscandalloDetARTICULO: TFIBStringField;
     QMEscandalloDetNUMERO: TIntegerField;
     QMEscandalloDetDETALLE: TFIBStringField;
     QMEscandalloDetCANTIDAD: TFloatField;
     QMEscandalloDetTITULO: TFIBStringField;
     QMEscandalloDetFAMILIA: TFIBStringField;
     QMEscandalloDetP_COSTE: TFloatField;
     QMEscandalloCOSTE: TFloatField;
     QMEscandalloDetCOSTE: TFloatField;
     xArticulos: TFIBDataSetRO;
     QMEscandalloDetLINEA: TIntegerField;
     DSQMEscandalloProc: TDataSource;
     QMEscandalloProc: TFIBTableSet;
     QMEscandalloProcEMPRESA: TIntegerField;
     QMEscandalloProcARTICULO: TFIBStringField;
     QMEscandalloProcNUMERO: TIntegerField;
     QMEscandalloProcPROCESO: TIntegerField;
     QMEscandalloProcPRECIO: TFloatField;
     QMEscandalloProcDURACION: TFloatField;
     QMEscandalloProcTITULO_PROCESO: TFIBStringField;
     QMEscandalloProcLINEA: TIntegerField;
     QMEscandalloProcOPERARIO: TIntegerField;
     QMEscandalloProcTITULO_OP: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMEscandalloProdCreate(Sender: TObject);
     procedure QMEscandalloAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMEscandalloNewRecord(DataSet: TDataSet);
     procedure QMEscandalloDetNewRecord(DataSet: TDataSet);
     procedure QMEscandalloARTICULOChange(Sender: TField);
     procedure QMEscandalloBeforePost(DataSet: TDataSet);
     procedure QMEscandalloPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMEscandalloAfterPost(DataSet: TDataSet);
     procedure QMEscandalloDetDETALLEChange(Sender: TField);
     procedure QMEscandalloDetBeforePost(DataSet: TDataSet);
     procedure QMEscandalloProcAfterDelete(DataSet: TDataSet);
     procedure QMEscandalloProcAfterPost(DataSet: TDataSet);
     procedure QMEscandalloProcNewRecord(DataSet: TDataSet);
     procedure QMEscandalloProcPROCESOChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     function CosteTotal: double;
     procedure BusquedaCompleja;
     procedure FiltraEscandallo(Filtro: string);
  end;

var
  DMEscandalloProd : TDMEscandalloProd;

implementation

uses UDMMain, UEntorno, UFBusca, UUtiles, UParam;

{$R *.DFM}

procedure TDMEscandalloProd.DMEscandalloProdCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Ponemos las máscaras
  QMEscandalloUNIDADES.DisplayFormat := MascaraI;
  QMEscandalloCOSTE.DisplayFormat := MascaraN;
  QMEscandalloDetCANTIDAD.DisplayFormat := MascaraKri;
  QMEscandalloDetCOSTE.DisplayFormat := MascaraN;
  QMEscandalloDetP_COSTE.DisplayFormat := MascaraN;
  QMEscandalloProcPRECIO.DisplayFormat := MascaraE;
  QMEscandalloProcDURACION.DisplayFormat := ',##0.##';

  // Abrimos la tabla maestra
  DMMain.FiltraTabla(QMEscandallo, '10000', True);
end;

procedure TDMEscandalloProd.QMEscandalloAfterOpen(DataSet: TDataSet);
begin
  // Abrimos las tablas hijas
  QMEscandalloDet.Open;
  xArticulos.Open;
  QMEscandalloProc.Open;
end;

procedure TDMEscandalloProd.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMEscandalloProd.QMEscandalloNewRecord(DataSet: TDataSet);
var
  Apertura, Cierre : TDateTime;
begin
  DameMinMax('EJE', Apertura, Cierre);
  QMEscandalloFECHA_DESDE.AsDateTime := Apertura;
  QMEscandalloFECHA_HASTA.AsDateTime := Cierre;

  QMEscandalloEMPRESA.AsInteger := REntorno.Empresa;
  QMEscandalloUNIDADES.AsFloat := StrToIntDef(LeeParametro('PROESCA001'), 1);
  QMEscandalloACTIVO.AsInteger := 1;
  QMEscandalloCOSTE.AsFloat := 0;
end;

procedure TDMEscandalloProd.QMEscandalloDetNewRecord(DataSet: TDataSet);
begin
  // Si el maestro está en modo de inserción o edición, lo grabamos antes
  if ((QMEscandallo.State = dsInsert) or (QMEscandallo.State = dsEdit)) then
  begin
     QMEscandallo.Post;
     QMEscandalloDet.Edit;
  end;

  // Valores por defecto
  QMEscandalloDetEMPRESA.AsInteger := REntorno.Empresa;
  QMEscandalloDetARTICULO.AsString := QMEscandalloARTICULO.AsString;
  QMEscandalloDetNUMERO.AsInteger := QMEscandalloNUMERO.AsInteger;
  QMEscandalloDetCANTIDAD.AsFloat := 1;
  QMEscandalloDetCOSTE.AsFloat := 0;
end;

procedure TDMEscandalloProd.QMEscandalloARTICULOChange(Sender: TField);
begin
  // Cambio de Título del artículo
  with xArticulos do
  begin
     Close;
     Open;
  end;
end;

procedure TDMEscandalloProd.QMEscandalloBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  // Llamada al contador
  if (DataSet.State = dsInsert) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(NUMERO) FROM ART_ARTICULOS_ESC_PRODUCCION ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := QMEscandalloARTICULO.AsString;
           ExecQuery;
           QMEscandalloNUMERO.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

procedure TDMEscandalloProd.QMEscandalloPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMEscandallo.State = dsInsert then
     QMEscandalloNUMERO.Clear;
end;

procedure TDMEscandalloProd.QMEscandalloAfterPost(DataSet: TDataSet);
begin
  // Grabamos en la transacción local
  Graba(DataSet);
end;

procedure TDMEscandalloProd.QMEscandalloDetDETALLEChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  // Obtenemos el título y familia del artículo
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO_LARGO AS TITULO, FAMILIA FROM ART_ARTICULOS WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Sender.AsString;
        ExecQuery;
        QMEscandalloDetTITULO.AsString := FieldByName['TITULO'].AsString;
        QMEscandalloDetFAMILIA.AsString := FieldByName['FAMILIA'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMEscandalloProd.BusquedaCompleja;
begin
  with QMEscandallo do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM ART_ARTICULOS_ESC_PRODUCCION C ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = ?EMPRESA ');
     SelectSQL.Add(' ORDER BY C.ARTICULO, C.NUMERO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  end;

  // Llamada al buscador
  TFBusca.Create(Self).SeleccionaBusqueda(QMEscandallo, '10000', True);
end;

procedure TDMEscandalloProd.QMEscandalloDetBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  if (QMEscandalloDetCANTIDAD.AsString = '') then
     QMEscandalloDetCANTIDAD.AsFloat := 1;

  if DataSet.State = dsInsert then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(LINEA) FROM ART_ARTICULOS_ESC_PROD_DETALLE ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' ARTICULO = ?ARTICULO AND ');
           SQL.Add(' NUMERO = ?NUMERO ');
           Params.ByName['EMPRESA'].AsInteger := QMEscandalloDetEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMEscandalloDetARTICULO.AsString;
           Params.ByName['NUMERO'].AsInteger := QMEscandalloDetNUMERO.AsInteger;
           ExecQuery;
           QMEscandalloDetLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

function TDMEscandalloProd.CosteTotal: double;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE A_ART_ESC_PRODUCCION_COSTE (?EMPRESA, ?ARTICULO, ?NUMERO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := QMEscandalloARTICULO.AsString;
        Params.ByName['NUMERO'].AsFloat := QMEscandalloNUMERO.AsFloat;
        ExecQuery;
        Result := FieldByName['COSTE'].AsFloat;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMEscandalloProd.QMEscandalloProcAfterDelete(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMEscandalloProd.QMEscandalloProcAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMEscandalloProd.QMEscandalloProcNewRecord(DataSet: TDataSet);
begin
  // Valores por defecto
  QMEscandalloProcEMPRESA.AsInteger := REntorno.Empresa;
  QMEscandalloProcARTICULO.AsString := QMEscandalloARTICULO.AsString;
  QMEscandalloProcNUMERO.AsInteger := QMEscandalloNUMERO.AsInteger;
  QMEscandalloProcOPERARIO.AsInteger := 0;
end;

procedure TDMEscandalloProd.QMEscandalloProcPROCESOChange(Sender: TField);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TITULO, DURACION, PRECIO ');
        SQL.Add(' FROM EMP_PROCESOS_PRODUCCION ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND PROCESO=?PROCESO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROCESO'].AsInteger := Sender.AsInteger;
        ExecQuery;
        QMEscandalloProcTITULO_PROCESO.AsString := FieldByName['TITULO'].AsString;
        QMEscandalloProcDURACION.AsFloat := FieldByName['DURACION'].AsFloat;
        QMEscandalloProcPRECIO.AsFloat := FieldByName['PRECIO'].AsFloat;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT * FROM A_ART_DAME_OPERARIO(?EMPRESA, ?PROCESO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROCESO'].AsInteger := Sender.AsInteger;
        ExecQuery;
        QMEscandalloProcOPERARIO.AsInteger := FieldByName['OPERARIO'].AsInteger;
        QMEscandalloProcTITULO_OP.AsString := FieldByName['TITULO_OP'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMEscandalloProd.FiltraEscandallo(Filtro: string);
begin
  with QMEscandallo do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM ART_ARTICULOS_ESC_PRODUCCION C ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = ?EMPRESA ');
     if (Trim(Filtro) > '') then
        SelectSQL.Add(' AND ' + Filtro);
     SelectSQL.Add(' ORDER BY C.ARTICULO, C.NUMERO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

end.
