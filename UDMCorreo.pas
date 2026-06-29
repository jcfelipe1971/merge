unit UDMCorreo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, FIBQuery, HYFIBQuery, FIBTableDataSetRO;

type
  TDMCorreo = class(TDataModule)
     TLocal: THYTransaction;
     QMCorreo: TFIBTableSet;
     DSQMCorreo: TDataSource;
     QMCorreoEMPRESA: TIntegerField;
     QMCorreoRIG: TIntegerField;
     QMCorreoUSUARIO: TIntegerField;
     QMCorreoASUNTO: TFIBStringField;
     QMCorreoMENSAJE: TBlobField;
     xUsuarios: TFIBDataSetRO;
     DSxUsuarios: TDataSource;
     xUsuariosNOMBRE_CORREO: TFIBStringField;
     xUsuariosDIR_CORREO: TFIBStringField;
     QMCorreoDetalle: TFIBTableSet;
     DSQMCorreoDetalle: TDataSource;
     QMCorreoDetalleEMPRESA: TIntegerField;
     QMCorreoDetalleRIG: TIntegerField;
     QMCorreoDetalleDIR: TIntegerField;
     QMCorreoDetalleTIPO: TFIBStringField;
     QMCorreoDetalleDESTINO_ADRESS: TFIBStringField;
     xTiposDestino: TFIBDataSetRO;
     DSxTiposDestino: TDataSource;
     xTiposDestinoTIPO: TFIBStringField;
     xTiposDestinoTITULO: TFIBStringField;
     xUsuariosNOMBRE: TFIBStringField;
     QMCorreoDetalleAGRUPACION: TFIBStringField;
     QMCorreoDetalleCLIENTE: TIntegerField;
     QMCorreoDetalleTERCERO: TIntegerField;
     xListas: TFIBDataSetRO;
     DSxListas: TDataSource;
     xListasDESTINO_ADRESS: TFIBStringField;
     QMCorreoAdjuntos: TFIBTableSet;
     DSQMCorreoAdjuntos: TDataSource;
     QMCorreoAdjuntosEMPRESA: TIntegerField;
     QMCorreoAdjuntosRIG: TIntegerField;
     QMCorreoAdjuntosDIR: TIntegerField;
     QMCorreoAdjuntosFICHERO: TFIBStringField;
     QMCorreoAdjuntosTAMANYO: TFloatField;
     xListaAttach: TFIBTableSetRO;
     DSxListaAttach: TDataSource;
     xListaAttachFICHERO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMCorreoCreate(Sender: TObject);
     procedure QMCorreoAfterOpen(DataSet: TDataSet);
     procedure QMCorreoNewRecord(DataSet: TDataSet);
     procedure QMCorreoDetalleNewRecord(DataSet: TDataSet);
     procedure QMCorreoBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMCorreoAdjuntosNewRecord(DataSet: TDataSet);
     procedure QMCorreoBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Tipo: string;
  public
     { Public declarations }
     procedure AddAgrupacion(Agrupacion, Tipo: string);
     procedure AddTercero(Tercero: integer; Tipo: string);
     procedure SubTercero(Tercero: integer);
     procedure SubAgrupacion(Agrupacion: string);
     procedure RellenaLista(var Lista: TStrings; Tipo: string);
     procedure InsertaFichero(Nombre: string; Size: longint);
     procedure RellenaListaAttach(Lista: TStrings; var Size: longint);
     procedure BusquedaCompleja;
  end;

var
  DMCorreo : TDMCorreo;

implementation

uses UDMMain, UEntorno, uFBusca;

{$R *.DFM}

procedure TDMCorreo.DMCorreoCreate(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  // Mascaras
  QMCorreoAdjuntosTAMANYO.DisplayFormat := MascaraI;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(TIPO) FROM SYS_TIPOS_DESTINO';
        ExecQuery;
        Tipo := FieldByName['MIN'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  with xUsuarios do
  begin
     Close;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Open;
  end;

  with QMCorreo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Open;
  end;
end;

procedure TDMCorreo.QMCorreoAfterOpen(DataSet: TDataSet);
begin
  QMCorreoDetalle.Open;
  QMCorreoAdjuntos.Open;
end;

procedure TDMCorreo.QMCorreoBeforeClose(DataSet: TDataSet);
begin
  QMCorreoDetalle.Close;
  QMCorreoAdjuntos.Close;
end;

procedure TDMCorreo.QMCorreoNewRecord(DataSet: TDataSet);
begin
  QMCorreoEMPRESA.AsInteger := REntorno.Empresa;
  QMCorreoUSUARIO.AsInteger := REntorno.Usuario;
  QMCorreoASUNTO.AsString := '';
end;

procedure TDMCorreo.QMCorreoDetalleNewRecord(DataSet: TDataSet);
begin
  if ((DSQMCorreo.State = dsInsert) or (DSQMCorreo.State = dsEdit)) then
  begin
     QMCorreo.Post;
     QMCorreoDetalle.Edit;
  end;

  if QMCorreoRIG.AsInteger = 0 then
  begin
     QMCorreo.Insert;
     QMCorreo.Post;
     QMCorreoDetalle.Edit;
  end;

  QMCorreoDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMCorreoDetalleRIG.AsInteger := QMCorreoRIG.AsInteger;
  QMCorreoDetalleDIR.AsInteger := 0;
  QMCorreoDetalleTIPO.AsString := 'TO';
  QMCorreoDetalleAGRUPACION.AsString := '';
  QMCorreoDetalleCLIENTE.AsInteger := 0;
  QMCorreoDetalleTERCERO.AsInteger := 0;
end;

procedure TDMCorreo.QMCorreoBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_CORREO', 'RIG');
end;

procedure TDMCorreo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCorreo.AddAgrupacion(Agrupacion, Tipo: string);
var
  Q : THYFIBQuery;
begin
  if (DSQMCorreo.State = dsInsert) or
     (DSQMCorreo.State = dsEdit) then
     QMCorreo.Post;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CORREO_INSERTA_AGRUPACION(:EMPRESA, :RIG, :AGRUPACION, :TIPO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['RIG'].AsInteger := QMCorreoRIG.AsInteger;
        Params.ByName['AGRUPACION'].AsString := Agrupacion;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMCorreo.Refresh;
end;

procedure TDMCorreo.AddTercero(Tercero: integer; Tipo: string);
var
  Q : THYFIBQuery;
begin
  if (DSQMCorreo.State = dsInsert) or
     (DSQMCorreo.State = dsEdit) then
     QMCorreo.Post;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CORREO_INSERTA_TERCERO(:EMPRESA, :RIG, :TERCERO, :TIPO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['RIG'].AsInteger := QMCorreoRIG.AsInteger;
        Params.ByName['TERCERO'].AsInteger := Tercero;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMCorreo.Refresh;
end;

procedure TDMCorreo.SubTercero(Tercero: integer);
var
  Q : THYFIBQuery;
begin
  if (DSQMCorreo.State = dsInsert) or
     (DSQMCorreo.State = dsEdit) then
     QMCorreo.Post;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM EMP_CORREO_DETALLE WHERE EMPRESA = :EMPRESA AND RIG = :RIG AND TERCERO = :TERCERO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['RIG'].AsInteger := QMCorreoRIG.AsInteger;
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMCorreo.Refresh;
end;

procedure TDMCorreo.SubAgrupacion(Agrupacion: string);
var
  Q : THYFIBQuery;
begin
  if (DSQMCorreo.State = dsInsert) or
     (DSQMCorreo.State = dsEdit) then
     QMCorreo.Post;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM EMP_CORREO_DETALLE WHERE EMPRESA = :EMPRESA AND RIG = :RIG AND AGRUPACION = :AGRUPACION';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['RIG'].AsInteger := QMCorreoRIG.AsInteger;
        Params.ByName['AGRUPACION'].AsString := Agrupacion;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMCorreo.Refresh;
end;

procedure TDMCorreo.RellenaLista(var Lista: TStrings; Tipo: string);
begin
  Lista.Clear;

  with xListas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['RIG'].AsInteger := QMCorreoRIG.AsInteger;
     Params.ByName['TIPO'].AsString := Tipo;
     Open;
     Last;
     if RecordCount <> 0 then
     begin
        First;
        while not EOF do
        begin
           Lista.Add(xListasDESTINO_ADRESS.AsString);
           Next;
        end;
     end;
  end;
end;

procedure TDMCorreo.QMCorreoAdjuntosNewRecord(DataSet: TDataSet);
begin
  QMCorreoAdjuntosEMPRESA.AsInteger := QMCorreoEMPRESA.AsInteger;
  QMCorreoAdjuntosRIG.AsInteger := QMCorreoRIG.AsInteger;
  QMCorreoAdjuntosDIR.AsInteger := 0;
  QMCorreoAdjuntosFICHERO.AsString := '';
  QMCorreoAdjuntosTAMANYO.AsFloat := 0;
end;

procedure TDMCorreo.InsertaFichero(Nombre: string; Size: longint);
begin
  if DSQMCorreoAdjuntos.State = dsInsert then
     QMCorreoAdjuntos.Cancel;

  QMCorreoAdjuntos.Insert;
  QMCorreoAdjuntosFICHERO.AsString := Nombre;
  QMCorreoAdjuntosTAMANYO.AsFloat := Size;
  QMCorreoAdjuntos.Post;
  QMCorreoAdjuntos.Close;
  QMCorreoAdjuntos.Open;
end;

procedure TDMCorreo.RellenaListaAttach(Lista: TStrings; var Size: longint);
var
  Q : THYFIBQuery;
begin
  Lista.Clear;
  Size := 0;
  with xListaAttach do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['RIG'].AsInteger := QMCorreoRIG.AsInteger;
     Open;
     Last;

     if RecordCount <> 0 then
     begin
        First;
        while not (EOF) do
        begin
           Lista.Add(xListaAttachFICHERO.AsString);
           Next;
        end;

        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT SUM(TAMANYO) FROM EMP_CORREO_ADJUNTOS WHERE EMPRESA = :EMPRESA AND RIG = :RIG';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['RIG'].AsInteger := QMCorreoRIG.AsInteger;
              ExecQuery;
              Size := FieldByName['SUM'].AsLong;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
     end;
  end;
end;

procedure TDMCorreo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCorreo, '10000');
end;

end.
