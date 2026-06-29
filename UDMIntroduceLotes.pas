unit UDMIntroduceLotes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBQuery, HYFIBQuery, DB, FIBDatabase,
  UFIBModificados, FIBDataSet, FIBTableDataSet, FIBDataSetRO,
  FIBTableDataSetRO;

type
  TDMIntroduceLotes = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
     Tipo: string;
     RIG: integer;
  public
     { Public declarations }
     Insercion: boolean;
     procedure DameDatos(aTipo, Serie, Articulo: string; ejercicio, aRIG, linea, id_doc: integer; var almacenLinea, almacenLineaDst, Larticulo, NroSerie, clasificacion: string; var lote: string; var canal, canal_dst: integer; var FFabricacion, FCaducidad, FEnvasado: TDateTime; var Proveedor, ID_Lote, ID_Reetiquetado: integer; var LoteAnterior: string);
     function GrabaLote(ejercicio, canal_ori, canal_dst: smallint; Serie, Tipo, Articulo, lote, Almacen, almacen_dst, Clasificacion, NroSerie, cantidad: string; RIGL, LineaL: integer; FFabricacion, FEnvasado, FCaducidad: TDateTime; id, id_a, proveedor, id_lote: integer; nuevo_lote: string; Notas: TStrings; medida1, medida2, medida3, medida4: double): integer;
     procedure EliminaReetiquetado(id_detalles_e: integer; Tipo: string);
     procedure AbreLotes(id_lote: integer);
     procedure DameDatosLote(ID_Lote: integer; var Lote: string; var Proveedor: integer; Notas: TStrings; var medida1, medida2, medida3, medida4: double; var f_envasado, f_caducidad, f_fabricacion: TDateTime; var stock: double; var Clasificacion: string);
  end;

var
  DMIntroduceLotes : TDMIntroduceLotes;

implementation

uses UDMMain, UEntorno, UUtiles, UFormGest, UFMControl_Lotes;

{$R *.dfm}

procedure TDMIntroduceLotes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TDMIntroduceLotes.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMIntroduceLotes.DameDatos(aTipo, Serie, Articulo: string; ejercicio, aRIG, linea, id_doc: integer; var almacenLinea, almacenLineaDst, Larticulo, NroSerie, clasificacion: string; var lote: string; var canal, canal_dst: integer; var FFabricacion, FCaducidad, FEnvasado: TDateTime; var Proveedor, ID_Lote, ID_Reetiquetado: integer; var LoteAnterior: string);
var
  Q : THYFIBQuery;
begin
  Tipo := aTipo;
  RIG := aRIG;

  Q := THYFIBQuery.Create(Self);
  try
     with Q do
     begin
        Database := DMMain.DataBase;
        Close;
        SQL.Text := 'EXECUTE PROCEDURE G_OBTEN_LOTE(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ID)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIG'].AsInteger := RIG;
        Params.ByName['LINEA'].AsInteger := linea;
        Params.ByName['ID'].AsInteger := id_doc;
        ExecQuery;

        AlmacenLinea := FieldByName['ALMACEN'].AsString;
        Lote := FieldByName['LOTE'].AsString;
        NroSerie := FieldByName['N_SERIE'].AsString;
        Clasificacion := FieldByName['CLASIFICACION'].AsString;
        FFabricacion := FieldByName['F_FABRICACION'].AsDateTime;
        FEnvasado := FieldByName['F_ENVASADO'].AsDateTime;
        FCaducidad := FieldByName['F_CADUCIDAD'].AsDateTime;
        AlmacenLineaDst := FieldByName['ALMACEN_DST'].AsString;
        canal := FieldByName['CANAL_ORI'].AsInteger;
        canal_dst := FieldByName['CANAL_DST'].AsInteger;
        Proveedor := FieldByName['PROVEEDOR'].AsInteger;
        ID_Lote := FieldByName['ID_LOTE'].AsInteger;
        ID_Reetiquetado := FieldByName['ID_REETIQUETADO'].AsInteger;
        LoteAnterior := FieldByName['LOTE_ANTERIOR'].AsString;

        Close;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMIntroduceLotes.GrabaLote(ejercicio, canal_ori, canal_dst: smallint; Serie, Tipo, Articulo, lote, Almacen, almacen_dst, Clasificacion, NroSerie, Cantidad: string; RIGL, LineaL: integer; FFabricacion, FEnvasado, FCaducidad: TDateTime; id, id_a, proveedor, id_lote: integer; Nuevo_lote: string; Notas: TStrings; medida1, medida2, medida3, medida4: double): integer;
var
  Q : THYFIBQuery;
begin
  if (Insercion) then
  begin
     // Si estamos en inserción insetar en art_articulos_lotes

     // Generar el id_lote
     id_lote := DMMain.ContadorGen('ID_LOTES');

     // Insertar el lote
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Database := DMMain.DataBase;
           SQL.Add(' INSERT INTO ART_ARTICULOS_LOTES ( ');
           SQL.Add(' EMPRESA, CANAL, ALMACEN, ARTICULO, LOTE, CLASIFICACION, F_ENVASADO, F_CADUCIDAD, F_FABRICACION, ID_A, PROVEEDOR, ');
           SQL.Add(' ID_LOTE, NOTAS, MEDIDA_1, MEDIDA_2, MEDIDA_3, MEDIDA_4, CODIGO) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :LOTE, :CLASIFICACION, :F_ENVASADO, :F_CADUCIDAD, :F_FABRICACION, :ID_A, ');
           SQL.Add(' :PROVEEDOR, :ID_LOTE, :NOTAS, :MEDIDA_1, :MEDIDA_2, :MEDIDA_3, :MEDIDA_4, :CODIGO) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ALMACEN'].AsString := Almacen;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['LOTE'].AsString := Lote;
           if (DMMain.EstadoKri(491) = 1) then
              Params.ByName['LOTE'].AsString := IntToStr(id_lote)
           else
              Params.ByName['LOTE'].AsString := Lote;
           Params.ByName['CLASIFICACION'].AsString := Clasificacion;
           Params.ByName['F_ENVASADO'].AsDateTime := FEnvasado;
           Params.ByName['F_CADUCIDAD'].AsDateTime := FCaducidad;
           Params.ByName['F_FABRICACION'].AsDateTime := FFabricacion;
           Params.ByName['ID_A'].AsInteger := id_a;
           Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
           Params.ByName['ID_LOTE'].AsInteger := id_lote;
           Params.ByName['NOTAS'].AsString := Notas.Text;
           Params.ByName['MEDIDA_1'].AsFloat := medida1;
           Params.ByName['MEDIDA_2'].AsFloat := medida2;
           Params.ByName['MEDIDA_3'].AsFloat := medida3;
           Params.ByName['MEDIDA_4'].AsFloat := medida4;
           Params.ByName['CODIGO'].AsInteger := StrToIntDef(Lote, 0);
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end
  else
  begin
     // Buscar proveedor y lote
     Q := THYFIBQuery.Create(Self);
     try
        with Q do
        begin
           Database := DMMain.DataBase;
           Close;
           SQL.Text := 'SELECT PROVEEDOR, LOTE FROM ART_ARTICULOS_LOTES WHERE ID_LOTE = :ID_LOTE';
           Params.ByName['ID_LOTE'].AsInteger := id_lote;
           ExecQuery;
           Proveedor := FieldByName['PROVEEDOR'].AsInteger;
           Lote := FieldByName['LOTE'].AsString;
           Close;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

  Q := THYFIBQuery.Create(Self);
  try
     with Q do
     begin
        Database := DMMain.DataBase;
        Close;
        SQL.Add(' EXECUTE PROCEDURE SOF_G_GUARDA_LOTE(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ALMACEN, :ARTICULO, ');
        SQL.Add(' :LOTE, :N_SERIE, :CLASIFICACION, :F_FABRICACION, :F_ENVASADO, :F_CADUCIDAD, :CANTIDAD, :CANAL_DST, :ALMACEN_DST, ');
        SQL.Add(' :ID, :ID_A, :PROVEEDOR, :ID_LOTE) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal_ori;
        Params.ByName['CANAL_DST'].AsInteger := Canal_dst;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIG'].AsInteger := RIGL;
        Params.ByName['LINEA'].AsInteger := LineaL;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ALMACEN_DST'].AsString := Almacen_DST;
        Params.ByName['ARTICULO'].AsString := Articulo;
        if (DMMain.EstadoKri(491) = 1) then
           Params.ByName['LOTE'].AsString := IntToStr(id_lote)
        else
           Params.ByName['LOTE'].AsString := Lote;
        Params.ByName['N_SERIE'].AsString := NroSerie;
        Params.ByName['CLASIFICACION'].AsString := Clasificacion;
        Params.ByName['F_FABRICACION'].AsDateTime := FFabricacion;
        Params.ByName['F_ENVASADO'].AsDateTime := FEnvasado;
        Params.ByName['F_CADUCIDAD'].AsDateTime := FCaducidad;
        Params.ByName['CANTIDAD'].AsFloat := StrToFloat(Cantidad);
        Params.ByName['ID'].AsInteger := id;
        Params.ByName['ID_A'].AsInteger := id_a;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['ID_LOTE'].AsInteger := id_lote;
        ExecQuery;
        Close;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Result := id_lote;
end;

procedure TDMIntroduceLotes.EliminaReetiquetado(id_detalles_e: integer; Tipo: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Database := DMMain.DataBase;
        Close;
        SQL.Text := 'EXECUTE PROCEDURE G_ELIMINA_REETIQUETADO(:ID_DETALLES_E, :TIPO)';
        Params.ByName['ID_DETALLES_E'].AsInteger := id_detalles_e;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Close;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMIntroduceLotes.AbreLotes(id_lote: integer);
var
  Q : THYFIBQuery;
  Articulo : string;
  id_a : integer;
begin
  Q := THYFIBQuery.Create(Self);
  try
     with Q do
     begin
        Database := DMMain.DataBase;
        Close;
        SQL.Text := 'SELECT ARTICULO, ID_A FROM ART_ARTICULOS_LOTES WHERE ID_LOTE = :ID_LOTE';
        Params.ByName['ID_LOTE'].AsInteger := ID_Lote;
        ExecQuery;
        Articulo := FieldByName['ARTICULO'].AsString;
        id_a := FieldByName['ID_A'].AsInteger;
        Close;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  TFMControl_Lotes.Create(Self).AsignaLote(Articulo, id_a, id_lote);
end;

procedure TDMIntroduceLotes.DameDatosLote(ID_Lote: integer; var Lote: string; var Proveedor: integer; Notas: TStrings; var medida1, medida2, medida3, medida4: double; var f_envasado, f_caducidad, f_fabricacion: TDateTime; var stock: double; var Clasificacion: string);
var
  DS : TFIBDataSetRO;
  ProveedorAux : integer;
begin
  ProveedorAux := Proveedor;

  DS := TFIBDataSetRO.Create(nil);
  try
     with DS do
     begin
        AutoTrans := True;
        Close;
        DataBase := DMMain.DataBase;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        SelectSQL.Text := 'SELECT LOTE, PROVEEDOR, NOTAS, MEDIDA_1, MEDIDA_2, MEDIDA_3, MEDIDA_4, F_ENVASADO, F_CADUCIDAD, F_FABRICACION, CLASIFICACION FROM ART_ARTICULOS_LOTES WHERE ID_LOTE = :ID_LOTE';
        Params.ByName['ID_LOTE'].AsInteger := ID_Lote;
        Open;
        Lote := FieldByName('LOTE').AsString;
        Clasificacion := FieldByName('CLASIFICACION').AsString;
        Proveedor := FieldByName('PROVEEDOR').AsInteger;
        Notas.Text := FieldByName('NOTAS').AsString;
        medida1 := FieldByName('MEDIDA_1').AsFloat;
        medida2 := FieldByName('MEDIDA_2').AsFloat;
        medida3 := FieldByName('MEDIDA_3').AsFloat;
        medida4 := FieldByName('MEDIDA_4').AsFloat;
        f_envasado := FieldByName('F_ENVASADO').AsDateTime;
        f_caducidad := FieldByName('F_CADUCIDAD').AsDateTime;
        f_fabricacion := FieldByName('F_FABRICACION').AsDateTime;
        Transaction.Commit;

        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        SelectSQL.Clear;
        SelectSQL.Text := 'SELECT STOCK FROM SOF_A_ART_STOCK_LOTES(:EMPRESA, :CANAL, :ALMACEN, :ID_LOTE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
        Params.ByName['ID_LOTE'].AsInteger := ID_Lote;
        Open;

        Stock := FieldByName('STOCK').AsFloat;
        Transaction.Commit;
     end;
  finally
     FreeAndNil(DS);
  end;

  if (Proveedor = 0) then
     Proveedor := ProveedorAux;
end;

end.
