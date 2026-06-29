unit UDMLstRestricciones;

interface

uses
  Dialogs, SysUtils, Classes, DB, RxMemDS, ComCtrls, ActnList, Forms, FIBDataSet,
  FIBDatabase, UFIBModificados, FIBTableDataSet, FR_DSet, FR_DBSet,
  FR_Class, Fr_HYReport, UHYReport, UEntorno, frxClass, UFormGest,
  frxHYReport;

type
  TDMLstRestricciones = class(TDataModule)
     RMDCategorias: TRxMemoryData;
     RMDRestricciones: TRxMemoryData;
     RMDRestriccionesTITULO: TStringField;
     RMDRestriccionesCOLOR: TSmallintField;
     RMDRestriccionesCATEGORIA: TStringField;
     RMDCategoriasCATEGORIA: TStringField;
     DSLRPerfil: TDataSource;
     DSRMDCategorias: TDataSource;
     DSRMDRestricciones: TDataSource;
     LRPerfil: TFIBTableSet;
     TLocal: THYTransaction;
     LRPerfilPERFIL: TIntegerField;
     LRPerfilTITULO: TFIBStringField;
     LRPerfilPROTECCION: TBlobField;
     LRPerfilPERFIL_DE_AGENTE: TIntegerField;
     LRPerfilAGENTE: TIntegerField;
     LRPerfilSUPERIOR: TIntegerField;
     LRPerfilCONTABILIDAD_ANALITICA: TIntegerField;
     LRPerfilTACTIL: TIntegerField;
     FRRestricciones: TfrDBDataSet;
     FrRestriciones: TfrHYReport;
     frRMDCategorias: TfrDBDataSet;
     frLRPerfil: TfrDBDataSet;
     frxRestriciones: TfrxHYReport;
     procedure LRPerfilAfterScroll(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure RMDCategoriasAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     Rellenando: boolean;
  public
     { Public declarations }
     procedure RellenaRestricciones;
     procedure MostrarListadoRestricciones(Modo: integer);
  end;

const
  MaxCategoria: integer = 36;

var
  DMLstRestricciones : TDMLstRestricciones;

implementation

uses UFMain, UDMMain, UDMListados;

{$R *.dfm}

procedure TDMLstRestricciones.DataModuleCreate(Sender: TObject);
begin
  AbreData(TDMListados, DMListados);
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMLstRestricciones.DataModuleDestroy(Sender: TObject);
begin
  LRPerfil.Close;
  RMDCategorias.Close;
  RMDRestricciones.Close;
  CierraData(DMListados);
end;

procedure TDMLstRestricciones.RellenaRestricciones;
var
  Categoria : array[0..100] of string;
  x, n, i : integer;
  Acciones : TActionList;
  Accion : TAction;
  Encontrado : integer;
  cbuscar : string;
  cnivel : string;
begin
  Rellenando := False;
  DMLstRestricciones.RMDCategorias.Open;
  DMLstRestricciones.RMDRestricciones.Open;
  DMLstRestricciones.RMDCategorias.EmptyTable;
  DMLstRestricciones.RMDRestricciones.EmptyTable;

  //G2K
  Categoria[0] := 'Contabilidad';
  Categoria[1] := 'Ventas';
  Categoria[2] := 'Compras';
  Categoria[3] := 'Almacenes';
  Categoria[4] := 'Auxiliares';
  Categoria[5] := 'Utilidades';
  Categoria[6] := 'Empresas';
  Categoria[7] := 'Impuestos';
  Categoria[8] := 'Terceros';
  Categoria[9] := 'Tesoreria';
  Categoria[10] := 'Inmovilizado';
  Categoria[11] := 'Produccion';
  Categoria[12] := 'Produccion Avanzada';
  Categoria[13] := 'Produccion Despiece';
  Categoria[14] := 'Produccion ISO';
  Categoria[15] := 'Produccion Pauta';
  Categoria[16] := 'Produccion Plan';
  Categoria[17] := 'Operario';
  Categoria[18] := 'Presencia';
  Categoria[19] := 'Obras';
  Categoria[20] := 'CRM';
  Categoria[21] := 'Contabilidad Analitica';
  Categoria[22] := 'Reparaciones';
  Categoria[23] := 'Etiquetas';
  Categoria[24] := 'Coladas';
  Categoria[25] := 'Estadisticas';
  //TyC dji lrk kri
  Categoria[26] := 'Tallas';
  //TPV
  Categoria[27] := 'Ventas TPV';
  Categoria[28] := 'Gastos TPV';
  Categoria[29] := 'Operaciones TPV';
  Categoria[30] := 'Terceros TPV';
  Categoria[31] := 'Empresa TPV';
  Categoria[32] := 'Auxiliares TPV';
  Categoria[33] := 'Rep. Dominicana';
  Categoria[34] := 'TyC';
  Categoria[35] := 'TyC Auxiliares';
  Categoria[36] := 'TyC Listados';

  Acciones := FMain.ALMain;

  cnivel := DMLstRestricciones.LRPerfilProteccion.AsString;

  //Comprobamos si es el TPV o el G2K
  if (Pos('TPV', UpperCase(ExtractFileName(Application.ExeName))) > 0) then
     i := 27
  else
     i := 0;

  for n := i to MaxCategoria do
  begin
     DMLstRestricciones.RMDCategorias.Append;
     DMLstRestricciones.RMDCategoriasCategoria.AsString := Categoria[n];
     DMLstRestricciones.RMDCategorias.Post;
     for x := 0 to (Acciones.ActionCount - 1) do
        if (Acciones.Actions[x].Category = Categoria[n]) then
        begin
           Accion := TAction(Acciones.Actions[x]);
           cbuscar := (';' + IntToStr(Accion.Tag) + ',');
           Encontrado := Pos(cbuscar, cnivel);
           DMLstRestricciones.RMDRestricciones.Append;
           DMLstRestricciones.RMDRestriccionesTitulo.AsString := Accion.Hint;
           DMLstRestricciones.RMDRestriccionesCategoria.AsString := Categoria[n];
           if (Encontrado <> 0) then
              DMLstRestricciones.RMDRestriccionesColor.AsInteger := StrToInt(Copy(cnivel, Encontrado + Length(cbuscar), 1))
           else
              DMLstRestricciones.RMDRestriccionesColor.AsInteger := 2;
           DMLstRestricciones.RMDRestricciones.Post;
        end;
  end;

  Rellenando := True;
end;

procedure TDMLstRestricciones.MostrarListadoRestricciones(Modo: integer);
var
  Grupo : integer;
begin
  Grupo := 6136;

  with LRPerfil do
  begin
     Close;
     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', FrRestriciones, frxRestriciones, nil, nil);
end;

procedure TDMLstRestricciones.LRPerfilAfterScroll(DataSet: TDataSet);
begin
  RellenaRestricciones;
  RMDCategorias.First;
end;

procedure TDMLstRestricciones.RMDCategoriasAfterScroll(DataSet: TDataSet);
begin
  if (Rellenando = True) then
  begin
     RMDRestricciones.Filtered := False;
     RMDRestricciones.Filter := 'CATEGORIA=' + QuotedStr(RMDCategoriasCategoria.AsString);
     RMDRestricciones.Filtered := True;
  end;
end;

end.
