unit UDMTraspasoPeriodo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSetRO, FIBQuery, HYFIBQuery, UFParada;

type
  TDMTraspasoPeriodo = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DMTraspasoPeriodoCreate(Sender: TObject);
  private
     { Private declarations }
     procedure TraspasaCuentas;
  public
     { Public declarations }
     procedure EjecutarSP(const NombreSP: string; O_Ejercicio, D_Ejercicio, O_Canal, D_Canal: integer; ModCond: boolean);
     procedure TraspasoTodoModo(Inicio, Fin: string; Modo: integer; Modificar: boolean);
     procedure TraspasoCanalModo(Inicio, Fin: string; Modo: integer; Modificar: boolean);
     procedure TraspasoCanalCanal(Inicio, Fin: string; Modo: integer; Modificar: boolean);
     procedure TraspasoListados(Inicio, Fin: string);
     procedure TraspasoListadosTodo(Inicio, Fin: string);
     procedure TraspasoListadosCanal(Inicio, Fin: string);
     procedure TraspasoRestriccion(Inicio, Fin: string);
     procedure TraspasoRestriccionTodo(Inicio, Fin: string);
     procedure TraspasoRestriccionCanal(Inicio, Fin: string);
     procedure TraspasoCondEsp(Tipo: string; O_Ejercicio, D_Ejercicio, O_Canal, D_Canal: integer; ElimCond: boolean);
     procedure TraspasoProveedor(Inicio, Fin: string);
     procedure TraspasoProveedorTodo(Inicio, Fin: string);
     procedure TraspasoProveedorCanal(Inicio, Fin: string);
     procedure TraspasoCampanya(Inicio, Fin: string);
     procedure TraspasoPromociones(Tipo: string; O_Ejercicio, D_Ejercicio, O_Canal, D_Canal: integer; ElimCond: boolean);
     procedure TraspasaPrecioCosteKri(Inicio, Fin: string);
  end;

var
  DMTraspasoPeriodo : TDMTraspasoPeriodo;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TDMTraspasoPeriodo.DMTraspasoPeriodoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMTraspasoPeriodo.EjecutarSP(const NombreSP: string; O_Ejercicio, D_Ejercicio, O_Canal, D_Canal: integer; ModCond: boolean);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE ' + NombreSP + ' (:EMPRESA, :O_EJERCICIO, :D_EJERCICIO, :O_CANAL, :D_CANAL, :MODIFICADO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := O_Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := D_Ejercicio;
        Params.ByName['O_CANAL'].AsInteger := O_Canal;
        Params.ByName['D_CANAL'].AsInteger := D_Canal;
        Params.ByName['MODIFICADO'].AsInteger := BoolToInt(ModCond);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoTodoModo(Inicio, Fin: string; Modo: integer; Modificar: boolean);
var
  procesados : integer;
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_PROPAGA_EJER_TODO_M(:EMPRESA, :EJERCICIOORI, :CANAL, :EJERCICIODES, :MODO, :MODIFICAR)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['EJERCICIOORI'].AsInteger := StrToInt(Inicio);
        Params.ByName['EJERCICIODES'].AsInteger := StrToInt(Fin);
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['MODIFICAR'].AsInteger := BoolToInt(Modificar);
        TFParada.Create(Self).ExecQuery(Q);
        procesados := FieldByName['PROCESADOS'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  DMMain.AjustaNivelesContables;
  TraspasaCuentas;
  ShowMessage(Format(_('Registros procesados: %d'), [procesados]));
end;

procedure TDMTraspasoPeriodo.TraspasoCanalModo(Inicio, Fin: string; Modo: integer; Modificar: boolean);
var
  procesados : integer;
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_PROPAGA_CANALES_MODO(:O_EMPRESA, :O_EJERCICIO, :O_CANAL, :D_EMPRESA, :D_EJERCICIO, :D_CANAL, :MODO, :MODIFICAR)';
        Params.ByName['O_EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['D_EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['D_CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['MODIFICAR'].AsInteger := BoolToInt(Modificar);
        TFParada.Create(Self).ExecQuery(Q);
        procesados := FieldByName['PROCESADOS'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  DMMain.AjustaNivelesContables;
  TraspasaCuentas;
  ShowMessage(Format(_('Registros procesados: %d'), [procesados]));
end;

procedure TDMTraspasoPeriodo.TraspasaCuentas;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PROCESADOS FROM C_CUENTAS_ALTA_PROPAGA_NIV(:EMPRESA, :EJERCICIO, :CANAL, 1)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoCanalCanal(Inicio, Fin: string; Modo: integer; Modificar: boolean);
var
  procesados : integer;
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_PROPAGA_EJER_TODO_MC(:EMPRESA, :EJERCICIOORI, :CANAL, :EJERCICIODES, :MODO, :MODIFICAR)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['EJERCICIOORI'].AsInteger := StrToInt(Inicio);
        Params.ByName['EJERCICIODES'].AsInteger := StrToInt(Fin);
        Params.ByName['MODO'].AsInteger := Modo;
        Params.ByName['MODIFICAR'].AsInteger := BoolToInt(Modificar);
        TFParada.Create(Self).ExecQuery(Q);
        procesados := FieldByName['PROCESADOS'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  DMMain.AjustaNivelesContables;
  TraspasaCuentas;
  ShowMessage(Format(_('Registros procesados: %d'), [procesados]));
end;

procedure TDMTraspasoPeriodo.TraspasoListados(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASO_LISTADOS(:O_EMPRESA, :O_EJERCICIO, :O_CANAL, :D_EMPRESA, :D_EJERCICIO, :D_CANAL)';
        Params.ByName['O_EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['O_CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['D_EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        Params.ByName['D_CANAL'].AsInteger := REntorno.Canal;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoListadosTodo(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_LISTADOS_EJER_TODO(:EMPRESA, :O_EJERCICIO, :O_CANAL, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['O_CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoListadosCanal(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_LISTADOS_EJER_TODOC(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['O_EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoRestriccion(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASO_PERFILES(:O_EMPRESA, :O_EJERCICIO, :O_CANAL, :D_EMPRESA, :D_EJERCICIO, :D_CANAL);';
        Params.ByName['O_EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['O_CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['D_EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        Params.ByName['D_CANAL'].AsInteger := REntorno.Canal;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoRestriccionTodo(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_PERFILES_EJER_TODO(:EMPRESA, :O_EJERCICIO, :O_CANAL, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['O_CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoRestriccionCanal(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_PERFILES_EJER_TODOC(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoCondEsp(Tipo: string; O_Ejercicio, D_Ejercicio, O_Canal, D_Canal: integer; ElimCond: boolean);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRS_CONDICIONES_ESPECIALES(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO, :O_CANAL, :D_CANAL, :ELIMINAR, :TIPO)  ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := O_Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := D_Ejercicio;
        Params.ByName['O_CANAL'].AsInteger := O_Canal;
        Params.ByName['D_CANAL'].AsInteger := D_Canal;
        Params.ByName['ELIMINAR'].AsInteger := BoolToInt(ElimCond);
        Params.ByName['TIPO'].AsString := Tipo;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoProveedor(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASO_TARIFAS_PROV(:EMPRESA, :O_EJERCICIO, :O_CANAL, :D_EJERCICIO, :D_CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['O_CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        Params.ByName['D_CANAL'].AsInteger := REntorno.Canal;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoProveedorTodo(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_TARIFAS_PROV_EJER_TODO(:EMPRESA, :O_EJERCICIO, :O_CANAL, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['O_CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoProveedorCanal(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_TARIFAS_PROV_EJER_T_C(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoCampanya(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASO_CAMPANYAS(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTraspasoPeriodo.TraspasoPromociones(Tipo: string; O_Ejercicio, D_Ejercicio, O_Canal, D_Canal: integer; ElimCond: boolean);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.Database;
        SQL.Text := 'EXECUTE PROCEDURE TRS_PROMOCIONES(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO, :O_CANAL, :D_CANAL, :BORRAR, :TIPO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := O_Ejercicio;
        Params.ByName['D_EJERCICIO'].AsInteger := D_Ejercicio;
        Params.ByName['O_CANAL'].AsInteger := O_Canal;
        Params.ByName['D_CANAL'].AsInteger := D_Canal;
        Params.ByName['BORRAR'].AsInteger := BoolToInt(ElimCond);
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTraspasoPeriodo.TraspasaPrecioCosteKri(Inicio, Fin: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE TRASPASA_PCOSTE_ARTICULOS(:EMPRESA, :O_EJERCICIO, :D_EJERCICIO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['O_EJERCICIO'].AsInteger := StrToInt(Inicio);
        Params.ByName['D_EJERCICIO'].AsInteger := StrToInt(Fin);
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
