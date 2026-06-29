unit UDMMultiSeleccion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMMultiSeleccion = class(TDataModule)
     TLocal: THYTransaction;
     DSxMultiSeleccion: TDataSource;
     xMultiSeleccion: TFIBTableSet;
     xMultiSeleccionENTRADA: TIntegerField;
     xMultiSeleccionEMPRESA: TIntegerField;
     xMultiSeleccionEJERCICIO: TIntegerField;
     xMultiSeleccionCANAL: TIntegerField;
     xMultiSeleccionTITULO_CANAL: TFIBStringField;
     xMultiSeleccionALMACEN: TFIBStringField;
     xMultiSeleccionTITULO_ALMACEN: TFIBStringField;
     xMultiSeleccionMARCADO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMMultiSeleccionCreate(Sender: TObject);
     procedure xMultiSeleccionNewRecord(DataSet: TDataSet);
     procedure xMultiSeleccionMARCADOChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     OcultarAlmacen: boolean;
     procedure MarcarTodos(Marca: smallint);
     procedure ActualizarListas(ListaCanales, ListaAlm: TStringList);
     function WhereCanales(ListaCanales: TStringList): string;
     function CanalesPorComas(ListaCanales: TStringList): string;
     procedure RellenarSeleccion;
     procedure FiltrarSeleccion;
     function WhereAlmacenes(ListaAlm: TStringList): string;
     function SeleccionPorComas(LCan, LAlm: TStringList): string;
  end;

var
  DMMultiSeleccion : TDMMultiSeleccion;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMMultiSeleccion.DMMultiSeleccionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  OcultarAlmacen := True;
end;

procedure TDMMultiSeleccion.RellenarSeleccion;
var
  Modo : integer;
  Q : THYFIBQuery;
begin
  if OcultarAlmacen then
     Modo := 0
  else
     Modo := 1;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_RELLENA_MULTISELECCION(?ENTRADA, ?EMPRESA, ?EJERCICIO, ?MODO)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['MODO'].AsInteger := Modo;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMMultiSeleccion.FiltrarSeleccion;
begin
  with xMultiSeleccion do
  begin
     Close;
     if OcultarAlmacen then
        SelectSQL.Text := 'SELECT * FROM TMP_MULTISELECCION WHERE ENTRADA = ?ENTRADA AND ALMACEN = ?ALMACEN';
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     if OcultarAlmacen then
        Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
     Open;
  end;
end;

procedure TDMMultiSeleccion.MarcarTodos(Marca: smallint);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_MULTISELECCION SET MARCADO = ?MARCA WHERE ENTRADA = ?ENTRADA';
        Params.ByName['MARCA'].AsInteger := Marca;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  FiltrarSeleccion;
end;

procedure TDMMultiSeleccion.ActualizarListas(ListaCanales, ListaAlm: TStringList);
begin
  ListaCanales.Clear;
  if (ListaAlm <> nil) then
     ListaAlm.Clear;
  with xMultiSeleccion do
  begin
     First;
     while not EOF do
     begin
        if (xMultiSeleccionMARCADO.AsInteger = 1) then
        begin
           ListaCanales.Add(IntToStr(xMultiSeleccionCANAL.AsInteger));
           if (ListaAlm <> nil) then
              ListaAlm.Add(xMultiSeleccionALMACEN.AsString);
        end;
        Next;
     end;
  end;
end;

procedure TDMMultiSeleccion.xMultiSeleccionNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMMultiSeleccion.xMultiSeleccionMARCADOChange(Sender: TField);
begin
  if (xMultiSeleccion.State = dsInsert) or (xMultiSeleccion.State = dsEdit) then
     xMultiSeleccion.Post;
end;

// Sentencia WHERE con los canales de ListaCanales

function TDMMultiSeleccion.WhereCanales(ListaCanales: TStringList): string;
var
  i : integer;
begin
  if (ListaCanales.Count = 0) then
     ListaCanales.Add(IntToStr(REntorno.Canal));
  Result := 'AND ( ';
  for i := 0 to (ListaCanales.Count - 1) do
  begin
     if (i > 0) then
        Result := Result + 'OR';
     Result := Result + '(CANAL=' + ListaCanales[i] + ')';
  end;
  Result := Result + ' )';
end;

// Cadena separada por comas con los canales de ListaCanales

function TDMMultiSeleccion.CanalesPorComas(ListaCanales: TStringList): string;
var
  i : integer;
begin
  if (ListaCanales.Count = 0) then
     ListaCanales.Add(IntToStr(REntorno.Canal));
  Result := '';
  for i := 0 to (ListaCanales.Count - 1) do
  begin
     if (i > 0) then
        Result := Result + ', ';
     Result := Result + ListaCanales[i];
  end;
end;

// Sentencia WHERE con los almacenes

function TDMMultiSeleccion.WhereAlmacenes(ListaAlm: TStringList): string;
var
  i : integer;
begin
  if (ListaAlm.Count = 0) then
     ListaAlm.Add(REntorno.AlmacenDefecto);
  Result := 'AND ( ';
  for i := 0 to (ListaAlm.Count - 1) do
  begin
     if (i > 0) then
        Result := Result + 'OR';
     Result := Result + '(ALMACEN=''' + ListaAlm[i] + ''')';
  end;
  Result := Result + ' )';
end;

// Cadena separada por comas con los canales y almacenes seleccionados

function TDMMultiSeleccion.SeleccionPorComas(LCan, LAlm: TStringList): string;
var
  i : integer;
begin
  if (LCan.Count = 0) then
  begin
     LCan.Add(IntToStr(REntorno.Canal));
     LAlm.Add(REntorno.AlmacenDefecto);
  end;

  Result := '';
  for i := 0 to (LCan.Count - 1) do
  begin
     if (i > 0) then
        Result := Result + ', ';
     Result := Result + 'Canal ' + LCan[i] + ' Almacén ' + LAlm[i];
  end;
end;

end.
