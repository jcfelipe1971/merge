unit UDMPackingList;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBTableDataSetRO, FIBQuery, HYFIBQuery, FIBDataSet, FIBTableDataSet;

type
  TDMPackingList = class(TDataModule)
     DSQMBultosDet: TDataSource;
     TLocal: THYTransaction;
     DSQMBultoActual: TDataSource;
     QMBultosDet: TFIBTableSet;
     QMBultosDetEMPRESA: TIntegerField;
     QMBultosDetEJERCICIO: TIntegerField;
     QMBultosDetCANAL: TIntegerField;
     QMBultosDetSERIE: TFIBStringField;
     QMBultosDetTIPO: TFIBStringField;
     QMBultosDetRIG: TIntegerField;
     QMBultosDetID_S: TIntegerField;
     QMBultosDetNUMERO_BULTO: TFIBStringField;
     QMBultosDetID_B: TIntegerField;
     QMBultosDetID_B_PADRE: TIntegerField;
     QMBultosDetNIVEL: TIntegerField;
     QMBultosDetORDEN: TIntegerField;
     QMBultosDetGRUPO: TIntegerField;
     QMBultosDetARTICULO: TFIBStringField;
     QMBultosDetTITULO: TFIBStringField;
     QMBultosDetID_DETALLES_S: TIntegerField;
     QMBultosDetLINEA: TIntegerField;
     QMBultosDetUNIDADES: TFloatField;
     QMBultosDetPESO_UNITARIO: TFloatField;
     QMBultoActual: TFIBTableSet;
     QMBultoActualEMPRESA: TIntegerField;
     QMBultoActualEJERCICIO: TIntegerField;
     QMBultoActualCANAL: TIntegerField;
     QMBultoActualSERIE: TFIBStringField;
     QMBultoActualTIPO: TFIBStringField;
     QMBultoActualRIG: TIntegerField;
     QMBultoActualID_S: TIntegerField;
     QMBultoActualNUMERO_BULTO: TFIBStringField;
     QMBultoActualORDEN: TIntegerField;
     QMBultoActualNIVEL: TIntegerField;
     QMBultoActualPESO_NETO: TFloatField;
     QMBultoActualPESO_BRUTO: TFloatField;
     QMBultoActualVOLUMEN: TFloatField;
     QMBultoActualDIAMETRO: TFloatField;
     QMBultoActualID_B: TIntegerField;
     QMBultoActualID_B_PADRE: TIntegerField;
     QMBultoActualUBICACION: TFIBStringField;
     QMBultoActualGRUPO: TIntegerField;
     QMBultoActualPESO: TFloatField;
     QMDatosEmbarque: TFIBTableSet;
     DSQMDatosEmbarque: TDataSource;
     QMDatosEmbarqueID_S: TIntegerField;
     QMDatosEmbarqueDATOS_EMBARQUE_IZQ: TBlobField;
     QMDatosEmbarqueDATOS_EMBARQUE_DER: TBlobField;
     QMDatosEmbarqueFECHA_PACKING_LIST: TDateTimeField;
     QMBultoActualBULTO: TIntegerField;
     QMBultoActualTITULO_BULTO: TFIBStringField;
     TUpdate: THYTransaction;
     QMBultosDetNUMERO_BULTO_DET: TFIBStringField;
     xBultosDet: TFIBDataSetRO;
     xBultosDetEMPRESA: TIntegerField;
     xBultosDetEJERCICIO: TIntegerField;
     xBultosDetCANAL: TIntegerField;
     xBultosDetSERIE: TFIBStringField;
     xBultosDetTIPO: TFIBStringField;
     xBultosDetRIG: TIntegerField;
     xBultosDetLINEA: TIntegerField;
     xBultosDetID_S: TIntegerField;
     xBultosDetID_DETALLES_S: TIntegerField;
     xBultosDetID_B: TIntegerField;
     xBultosDetUNIDADES: TFloatField;
     xBultosDetPESO_UNITARIO: TFloatField;
     xBultosDetNUMERO_BULTO_DET: TFIBStringField;
     xBultosDetNUMERO_BULTO: TFIBStringField;
     QMBultosDetCANTIDAD_ETIQUETAS: TIntegerField;
     QMBultoActualSSCC: TFIBStringField;
     QMBultoActualSUM_UNIDADES: TFloatField;
     QMBultosDetPESO_LINEA: TFloatField;
     QMBultosDetALFA_1: TFIBStringField;
     QMBultosDetALFA_2: TFIBStringField;
     QMBultosDetALFA_3: TFIBStringField;
     QMBultosDetALFA_4: TFIBStringField;
     QMBultosDetALFA_5: TFIBStringField;
     QMBultosDetALFA_6: TFIBStringField;
     QMBultosDetALFA_7: TFIBStringField;
     QMBultosDetALFA_8: TFIBStringField;
     QMBultoActualALTURA: TFloatField;
     QMBultoActualALTO: TFloatField;
     QMBultoActualANCHO: TFloatField;
     QMBultoActualFONDO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMBultoActualAfterPost(DataSet: TDataSet);
     procedure QMBultoActualBULTOChange(Sender: TField);
  private
     { Private declarations }
     Serie, TipoDoc: string;
     Ejercicio, RIG, ID_S: integer;
     TipoBultoDefecto: integer;
  public
     { Public declarations }
     function DameTituloTipoBulto(Id: integer): string;
     function ObtenerHijos(ID_B: integer; Articulo: string): TList;
     procedure AbrirDetBulto(ID_B: integer);
     procedure TraspasaUds(ID_B_D: integer; Uds: double; NumBulto: string; tipo: integer);
     function ObtenerID_B(NumBulto: string): integer;
     procedure TraspasaBulto(ID_B_D: integer);
     procedure BorrarBulto;
     procedure BorrarBultosVacios;
     procedure CambiarOrden(Inc: integer);
     procedure CambioBultoInicial(NumBulto: string);
     procedure AgruparBulto(ID_B_DEST: integer);
     function HayDatosDet: boolean;
     function BultoSelec: boolean;
     function BultoVacio: boolean;
     function CrearNuevoBulto(NumBulto: string; Unidades: double; tipo: integer): integer;
     procedure Inicializar(Tipo: string; aID_S: integer; var aSerie: string; var aRIG, aEjercicio, aCliente: integer);
     procedure DistribuirBulto;
     function InsertaBulto(ID_B: integer; Titulo: string = ''): integer;
     procedure GenerarSSCC(ID_B: integer);
     procedure SetTipoBultoDefecto(Tipo: integer);
     function DameNumeroBulto(ID_B: integer): string;
     procedure PosicionaArticulo(Articulo: string);
     procedure AgregarArticulosSinControlStock;
     procedure BorrarLinea;
  end;

  PPackingListInfo = ^TPackingListInfo;

  TPackingListInfo = record
     NumeroBulto: string;
     ID_B: integer;
     ID_B_PADRE: integer;
     Nivel: integer;
     Orden: integer;
     Grupo: integer;
     Unidades: double;
     ContieneArticulo: boolean;
     Titulo: string;
  end;

var
  DMPackingList : TDMPackingList;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno, UUtiles, UParam;

procedure TDMPackingList.DataModuleCreate(Sender: TObject);
var
  Param_PACCORD001 : string;
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMBultoActualPESO_NETO.DisplayFormat := MascaraN;
  QMBultoActualPESO_BRUTO.DisplayFormat := MascaraN;
  QMBultoActualVOLUMEN.DisplayFormat := MascaraN;
  QMBultoActualDIAMETRO.DisplayFormat := MascaraN;
  QMBultoActualPESO.DisplayFormat := MascaraN;
  QMBultoActualSUM_UNIDADES.DisplayFormat := MascaraN;
  QMBultoActualALTURA.DisplayFormat := MascaraN;

  QMBultosDetPESO_UNITARIO.DisplayFormat := MascaraN;
  QMBultosDetPESO_LINEA.DisplayFormat := MascaraN;

  TipoBultoDefecto := 0;

  Param_PACCORD001 := LeeParametro('PACCORD001');

  with QMBultosDet.SelectSQL do
  begin
     Clear;
     Add(' SELECT * FROM VER_PACKING_LIST_DET ');
     Add(' WHERE ');
     Add(' ID_S = :ID_S AND ');
     Add(' ((ID_B = :ID_B) OR (ID_B IN (SELECT ID_B_H ');
     Add('                              FROM G_PACKING_LIST_DESCENDENCIA(:ID_S, :ID_B)))) ');
     if (Param_PACCORD001 = '') then
        Add(' ORDER BY LINEA, NIVEL, ORDEN ')
     else
        Add(' ORDER BY ' + Param_PACCORD001 + ', LINEA, NIVEL, ORDEN ');
  end;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMBultosDet.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));
end;

procedure TDMPackingList.Inicializar(Tipo: string; aID_S: integer; var aSerie: string; var aRIG, aEjercicio, aCliente: integer);
begin
  ID_S := aID_S;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EJERCICIO, SERIE, TIPO, RIG, CLIENTE FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := ID_S;
        ExecQuery;
        Ejercicio := FieldByName['EJERCICIO'].AsInteger;
        Serie := FieldByName['SERIE'].AsString;
        TipoDoc := FieldByName['TIPO'].AsString;
        RIG := FieldByName['RIG'].AsInteger;
        aCliente := FieldByName['CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Campos a devolver
  aEjercicio := Ejercicio;
  aSerie := Serie;
  aRIG := RIG;

  with QMDatosEmbarque do
  begin
     Close;
     SelectSQL.Clear;
     if (TipoDoc = 'FAC') then
        SelectSQL.Add(' SELECT ID_S, DATOS_EMBARQUE_IZQ, DATOS_EMBARQUE_DER, FECHA_PACKING_LIST FROM GES_CABECERAS_S_FAC ');
     if (TipoDoc = 'ALB') then
        SelectSQL.Add(' SELECT ID_S, DATOS_EMBARQUE_IZQ, DATOS_EMBARQUE_DER, FECHA_PACKING_LIST FROM GES_CABECERAS_S_ALB ');
     if (TipoDoc = 'PEC') then
        SelectSQL.Add(' SELECT ID_S, DATOS_EMBARQUE_IZQ, DATOS_EMBARQUE_DER, FECHA_PACKING_LIST FROM GES_CABECERAS_S_PED ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_S = ?ID_S ');

     RefreshSQL.Text := SelectSQL.Text;

     UpdateSQL.Clear;
     if (TipoDoc = 'FAC') then
        UpdateSQL.Add(' UPDATE GES_CABECERAS_S_FAC ');
     if (TipoDoc = 'ALB') then
        UpdateSQL.Add(' UPDATE GES_CABECERAS_S_ALB ');
     if (TipoDoc = 'PEC') then
        UpdateSQL.Add(' UPDATE GES_CABECERAS_S_PED ');
     UpdateSQL.Add(' SET ');
     UpdateSQL.Add('    DATOS_EMBARQUE_IZQ = :DATOS_EMBARQUE_IZQ ');
     UpdateSQL.Add('   ,DATOS_EMBARQUE_DER = :DATOS_EMBARQUE_DER ');
     UpdateSQL.Add('   ,FECHA_PACKING_LIST = :FECHA_PACKING_LIST ');
     UpdateSQL.Add(' WHERE ');
     UpdateSQL.Add('   ID_S = :ID_S ');

     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;
end;

function TDMPackingList.ObtenerHijos(ID_B: integer; Articulo: string): TList;
var
  Info : PPackingListInfo;
begin
  with TFIBDataSetRO.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        Transaction := TLocal;
        Unidirectional := True;
        SelectSQL.Add(' SELECT B.NUMERO_BULTO, B.ID_B, B.ID_B_PADRE, B.NIVEL, B.ORDEN, B.GRUPO, B.PESO_BRUTO, ');
        SelectSQL.Add('        CASE ');
        SelectSQL.Add('          WHEN (B.BULTO > 0) THEN ');
        SelectSQL.Add('              B.TITULO_BULTO ');
        SelectSQL.Add('          ELSE COALESCE(''('' || A.TITULO || '') '', '''') || B.TITULO_BULTO ');
        SelectSQL.Add('        END AS TITULO_BULTO, ');
        SelectSQL.Add('       COALESCE((SELECT SUM(UNIDADES) ');
        SelectSQL.Add('                 FROM GES_DETALLES_S_BULTOS ');
        SelectSQL.Add('                 WHERE ');
        SelectSQL.Add('                 ID_B = B.ID_B), 0) AS UNIDADES, ');
        SelectSQL.Add('       COALESCE((SELECT FIRST 1 DD.ARTICULO ');
        SelectSQL.Add('                 FROM GES_DETALLES_S_BULTOS BB ');
        SelectSQL.Add('                 JOIN GES_DETALLES_S DD ON BB.ID_DETALLES_S = DD.ID_DETALLES_S ');
        SelectSQL.Add('                 WHERE ');
        SelectSQL.Add('                 BB.ID_B = B.ID_B AND ');
        SelectSQL.Add('                 DD.ARTICULO = :ARTICULO), '''') AS CONTIENE_ARTICULO ');
        SelectSQL.Add(' FROM GES_CABECERAS_S_BULTOS B ');
        SelectSQL.Add(' LEFT JOIN ART_BULTOS A ON B.EMPRESA = A.EMPRESA AND B.BULTO = A.BULTO ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' B.ID_B_PADRE = :ID_B AND ');
        SelectSQL.Add(' B.ID_S = :ID_S ');
        SelectSQL.Add(' ORDER BY B.ORDEN, B.ID_B ');
        Params.ByName['ID_B'].AsInteger := ID_B;
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Open;

        Result := TList.Create;
        while not EOF do
        begin
           New(Info);
           Info^.NumeroBulto := FieldByName('NUMERO_BULTO').AsString;
           Info^.ID_B := FieldByName('ID_B').AsInteger;
           Info^.ID_B_PADRE := FieldByName('ID_B_PADRE').AsInteger;
           Info^.Nivel := FieldByName('NIVEL').AsInteger;
           Info^.Orden := FieldByName('ORDEN').AsInteger;
           Info^.Grupo := FieldByName('GRUPO').AsInteger;
           Info^.Unidades := FieldByName('UNIDADES').AsFloat;
           Info^.ContieneArticulo := (FieldByName('CONTIENE_ARTICULO').AsString = Articulo);
           Info^.Titulo := format('Uds: %d - Peso: %.2f - %s', [FieldByName('UNIDADES').AsInteger, FieldByName('PESO_BRUTO').AsFloat, FieldByName('TITULO_BULTO').AsString]);
           Result.Add(Info);
           Next;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMPackingList.AbrirDetBulto(ID_B: integer);
begin
  with QMBultoActual do
  begin
     Close;
     Params.ByName['ID_B'].AsInteger := ID_B;
     Open;
  end;

  with QMBultosDet do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Params.ByName['ID_B'].AsInteger := ID_B;
     Open;
  end;
end;

procedure TDMPackingList.TraspasaUds(ID_B_D: integer; Uds: double; NumBulto: string; Tipo: integer);
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Add(' EXECUTE PROCEDURE G_PACKING_LIST_TRASPASAR_UDS ');
        SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?ID_S, ');
        SQL.Add(' ?ID_B_O, ?ID_DETALLES_S, ?ID_B_D, ?UNIDADES, ?PESO_UNITARIO, ?NUMERO_BULTO_DET) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;

        if (Tipo = 1) then // QMBultosDet
        begin
           Params.ByName['EJERCICIO'].AsInteger := QMBultosDetEJERCICIO.AsInteger;
           Params.ByName['SERIE'].AsString := QMBultosDetSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMBultosDetTIPO.AsString;
           Params.ByName['RIG'].AsInteger := QMBultosDetRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := QMBultosDetLINEA.AsInteger;
           Params.ByName['ID_S'].AsInteger := QMBultosDetID_S.AsInteger;
           Params.ByName['ID_B_O'].AsInteger := QMBultosDetID_B.AsInteger;
           Params.ByName['ID_DETALLES_S'].AsInteger := QMBultosDetID_DETALLES_S.AsInteger;
           Params.ByName['PESO_UNITARIO'].AsFloat := QMBultosDetPESO_UNITARIO.AsFloat;
        end
        else
        if (Tipo = 2) then // xBultosDet
        begin
           Params.ByName['EJERCICIO'].AsInteger := xBultosDetEJERCICIO.AsInteger;
           Params.ByName['SERIE'].AsString := xBultosDetSERIE.AsString;
           Params.ByName['TIPO'].AsString := xBultosDetTIPO.AsString;
           Params.ByName['RIG'].AsInteger := xBultosDetRIG.AsInteger;
           Params.ByName['LINEA'].AsInteger := xBultosDetLINEA.AsInteger;
           Params.ByName['ID_S'].AsInteger := xBultosDetID_S.AsInteger;
           Params.ByName['ID_B_O'].AsInteger := xBultosDetID_B.AsInteger;
           Params.ByName['ID_DETALLES_S'].AsInteger := xBultosDetID_DETALLES_S.AsInteger;
           Params.ByName['PESO_UNITARIO'].AsFloat := xBultosDetPESO_UNITARIO.AsFloat;
        end;

        Params.ByName['ID_B_D'].AsInteger := ID_B_D;
        Params.ByName['UNIDADES'].AsFloat := Uds;
        Params.ByName['NUMERO_BULTO_DET'].AsString := NumBulto;
        ExecQuery;
     finally
        Free;
     end;
  end;

  QMBultosDet.Close;
  QMBultosDet.Open;
end;

function TDMPackingList.ObtenerID_B(NumBulto: string): integer;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'SELECT ID_B FROM GES_CABECERAS_S_BULTOS WHERE ID_S = :ID_S AND NUMERO_BULTO = :NUMERO_BULTO';
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['NUMERO_BULTO'].AsString := NumBulto;
        ExecQuery;
        Result := FieldByName['ID_B'].AsInteger;
     finally
        Free;
     end;
  end;
end;

procedure TDMPackingList.TraspasaBulto(ID_B_D: integer);
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_TRASPASAR_BULTO(?ID_S, ?ID_B_O, ?ID_B_D)';
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['ID_B_O'].AsInteger := QMBultoActualID_B.AsInteger;
        Params.ByName['ID_B_D'].AsInteger := ID_B_D;
        ExecQuery;
     finally
        Free;
     end;
  end;

  // AbrirDetBulto(ID_B_D);
end;

procedure TDMPackingList.BorrarBulto;
begin
  // Borro los detalles. El trigger al borrar el último detalle, borra la cabecera
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'DELETE FROM GES_CABECERAS_S_BULTOS WHERE ID_B = :ID_B';
        Params.ByName['ID_B'].AsInteger := QMBultoActualID_B.AsInteger;
        ExecQuery;
     finally
        Free;
     end;
  end;

  QMBultoActual.Close;
  QMBultoActual.Open;

  QMBultosDet.Close;
  QMBultosDet.Open;
end;

procedure TDMPackingList.CambiarOrden(Inc: integer);
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_CAMBIAR_ORDEN(?ID_S, ?ID_B, ?INC)';
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['ID_B'].AsInteger := QMBultoActualID_B.AsInteger;
        Params.ByName['INC'].AsInteger := Inc;
        ExecQuery;
     finally
        Free;
     end;
  end;

  QMBultoActual.Close;
  QMBultoActual.Open;
  QMBultosDet.Close;
  QMBultosDet.Open;
end;

procedure TDMPackingList.CambioBultoInicial(NumBulto: string);
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_RENUMERAR(?ID_S, 0, ?NUM_BULTO)';
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['NUM_BULTO'].AsString := NumBulto;
        ExecQuery;
     finally
        Free;
     end;
  end;

  QMBultoActual.Close;
  QMBultoActual.Open;
  QMBultosDet.Close;
  QMBultosDet.Open;
end;

procedure TDMPackingList.AgruparBulto(ID_B_DEST: integer);
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_AGRUPAR(?ID_S, ?ID_B_ORIG, ?ID_B_DEST)';
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['ID_B_ORIG'].AsInteger := QMBultoActualID_B.AsInteger;
        Params.ByName['ID_B_DEST'].AsInteger := ID_B_DEST;
        ExecQuery;
     finally
        Free;
     end;
  end;

  QMBultoActual.Close;
  QMBultoActual.Open;
  QMBultosDet.Close;
  QMBultosDet.Open;
end;

function TDMPackingList.HayDatosDet: boolean;
begin
  Result := QMBultosDet.RecordCount > 0;
end;

function TDMPackingList.BultoSelec: boolean;
begin
  Result := QMBultoActual.RecordCount > 0;
end;

function TDMPackingList.BultoVacio: boolean;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'SELECT COUNT(*) FROM GES_DETALLES_S_BULTOS WHERE ID_B = ?ID_B';
        Params.ByName['ID_B'].AsInteger := QMBultoActualID_B.AsInteger;
        ExecQuery;
        Result := FieldByName['COUNT'].AsInteger = 0;
     finally
        Free;
     end;
  end;
end;

function TDMPackingList.CrearNuevoBulto(NumBulto: string; Unidades: double; Tipo: integer): integer;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Add(' EXECUTE PROCEDURE G_PACKING_LIST_CREAR_BULTO ');
        SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ID_S, :ID_DETALLES_S, ');
        SQL.Add(' :UDS, :PESO_UNITARIO, :NUMERO_BULTO, :ID_B_O, :NUMERO_BULTO_DET, :TIPO_BULTO) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMBultosDetEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;

        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := TipoDoc;
        Params.ByName['RIG'].AsInteger := RIG;
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['TIPO_BULTO'].AsInteger := TipoBultoDefecto;

        if (Tipo = 1) then // QMBultosDet
        begin
           Params.ByName['LINEA'].AsInteger := QMBultosDetLINEA.AsInteger;
           Params.ByName['ID_DETALLES_S'].AsInteger := QMBultosDetID_DETALLES_S.AsInteger;
           Params.ByName['PESO_UNITARIO'].AsFloat := QMBultosDetPESO_UNITARIO.AsFloat;
           Params.ByName['ID_B_O'].AsInteger := QMBultosDetID_B.AsInteger;
        end
        else
        if (tipo = 2) then // xBultosDet
        begin
           Params.ByName['LINEA'].AsInteger := xBultosDetLINEA.AsInteger;
           Params.ByName['ID_DETALLES_S'].AsInteger := xBultosDetID_DETALLES_S.AsInteger;
           Params.ByName['PESO_UNITARIO'].AsFloat := xBultosDetPESO_UNITARIO.AsFloat;
           Params.ByName['ID_B_O'].AsInteger := xBultosDetID_B.AsInteger;
        end;

        Params.ByName['UDS'].AsFloat := Unidades;
        Params.ByName['NUMERO_BULTO'].AsString := NumBulto;
        Params.ByName['NUMERO_BULTO_DET'].AsString := NumBulto;

        ExecQuery;
        Result := FieldByName['ID_B1'].AsInteger;
     finally
        Free;
     end;
  end;

  QMBultosDet.Close;
  QMBultosDet.Open;
end;

procedure TDMPackingList.DistribuirBulto;
var
  IdDoc, IdDetalleDoc, ID_B_D : integer;
  Unidades : real;
  NumBultoDestino : string;
begin
  if (QMBultosDet.State <> dsBrowse) then
     QMBultosDet.Post;

  IdDoc := QMBultosDetID_S.AsInteger;
  IdDetalleDoc := QMBultosDetID_DETALLES_S.AsInteger;

  with xBultosDet do
  begin
     if (Active) then
        Close;
     // Params.ByName['ID_B'].AsInteger := QMBultosDetID_B.AsInteger;
     Params.ByName['ID_S'].AsInteger := IdDoc;
     Open;

     First;
     while not (EOF) do
     begin
        Unidades := xBultosDetUNIDADES.AsFloat;
        NumBultoDestino := xBultosDetNUMERO_BULTO_DET.AsString;

        if ((NumBultoDestino <> '')) then
        begin
           ID_B_D := ObtenerID_B(NumBultoDestino);
           if (ID_B_D = 0) then
              CrearNuevoBulto(NumBultoDestino, Unidades, 2)
           else
              TraspasaUds(ID_B_D, Unidades, NumBultoDestino, 2);
        end;

        Next;
     end;

     Close;
  end;

  // Limpio los NUMERO_BULTO_DET
  with THYFIBQuery.Create(Self) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_DETALLES_S_BULTOS SET NUMERO_BULTO_DET = '''' WHERE ID_S = :ID_S AND NUMERO_BULTO_DET <> ''''';
        Params.ByName['ID_S'].AsInteger := IdDoc;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMBultosDet, 'ID_DETALLES_S', IdDetalleDoc);
end;

procedure TDMPackingList.QMBultoActualAfterPost(DataSet: TDataSet);
begin
  // Refrescar(QMBultoActual, 'ID_B', QMBultoActualID_B.AsInteger);
end;

function TDMPackingList.InsertaBulto(ID_B: integer; Titulo: string = ''): integer;
var
  ID_B_NUEVO : integer;
  NumeroBulto : string;
begin
  ID_B_NUEVO := DMMain.ContadorGen('ID_BULTOS');

  // Obtengo el último bulto
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Add(' SELECT ');
        SQL.Add('        CASE ');
        SQL.Add('          WHEN POSITION(''.'', NUMERO_BULTO) > 0 THEN ');
        SQL.Add('              SUBSTRING(NUMERO_BULTO FROM 1 FOR POSITION(''.'', NUMERO_BULTO) - 1) ');
        SQL.Add('          ELSE NUMERO_BULTO ');
        SQL.Add('        END AS NUMERO_BULTO ');
        SQL.Add(' FROM GES_CABECERAS_S_BULTOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_S = :ID_S ');
        SQL.Add(' -- Orden por longitud de nro y luego por nro, porque son tipo varchar ');
        SQL.Add(' ORDER BY CHAR_LENGTH(CASE ');
        SQL.Add('                        WHEN POSITION(''.'', NUMERO_BULTO) > 0 THEN ');
        SQL.Add('                            SUBSTRING(NUMERO_BULTO FROM 1 FOR POSITION(''.'', NUMERO_BULTO) - 1) ');
        SQL.Add('                        ELSE NUMERO_BULTO ');
        SQL.Add('                      END) DESC, 1 DESC ');
        Params.ByName['ID_S'].AsInteger := ID_S;
        ExecQuery;
        NumeroBulto := FieldByName['NUMERO_BULTO'].AsString;
     finally
        Free;
     end;
  end;

  // Inserto el nuevo bulto
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Add(' INSERT INTO GES_CABECERAS_S_BULTOS ( ');
        SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, ID_B, NUMERO_BULTO, BULTO, TITULO_BULTO, ORDEN) ');
        SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, :ID_B, :NUMERO_BULTO, :BULTO, :TITULO_BULTO, ');
        SQL.Add('        -- ');
        SQL.Add('        COALESCE((SELECT MAX(ORDEN) + 1 ');
        SQL.Add('                  FROM GES_CABECERAS_S_BULTOS ');
        SQL.Add('                  WHERE ');
        SQL.Add('                  ID_S = :ID_S), 1) ');
        SQL.Add(' FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_S = :ID_S ');
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['ID_B'].AsInteger := ID_B_NUEVO;
        Params.ByName['BULTO'].AsInteger := TipoBultoDefecto;
        Params.ByName['NUMERO_BULTO'].AsString := IntToStr(StrToIntDef(NumeroBulto, 0) + 1);
        Params.ByName['TITULO_BULTO'].AsString := Titulo;
        ExecQuery;
     finally
        Free;
     end;
  end;

  // Si estaba posicionado en un bulto, lo agrego como hijo.
  if (ID_B <> 0) then
  begin
     with THYFIBQuery.Create(Self) do
     begin
        try
           Database := DMMain.Database;
           SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_TRASPASAR_BULTO(?ID_S, ?ID_B_O, ?ID_B_D)';
           Params.ByName['ID_S'].AsInteger := ID_S;
           Params.ByName['ID_B_O'].AsInteger := ID_B_NUEVO;
           Params.ByName['ID_B_D'].AsInteger := ID_B;
           ExecQuery;
        finally
           Free;
        end;
     end;
  end;

  Result := ID_B_NUEVO;
end;

function TDMPackingList.DameTituloTipoBulto(Id: integer): string;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'SELECT TITULO FROM ART_BULTOS WHERE EMPRESA = :EMPRESA AND BULTO = :BULTO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['BULTO'].AsInteger := Id;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
     finally
        Free;
     end;
  end;
end;

procedure TDMPackingList.QMBultoActualBULTOChange(Sender: TField);
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'SELECT PESO, VOLUMEN, DIAMETRO FROM ART_BULTOS WHERE EMPRESA = :EMPRESA AND BULTO = :BULTO';
        Params.ByName['EMPRESA'].AsInteger := QMBultoActualEMPRESA.AsInteger;
        Params.ByName['BULTO'].AsInteger := QMBultoActualBULTO.AsInteger;
        ExecQuery;
        QMBultoActualVOLUMEN.AsFloat := FieldByName['VOLUMEN'].AsFloat;
        QMBultoActualDIAMETRO.AsFloat := FieldByName['DIAMETRO'].AsFloat;
        QMBultoActualPESO.AsFloat := FieldByName['PESO'].AsFloat;
     finally
        Free;
     end;
  end;
end;

procedure TDMPackingList.GenerarSSCC(ID_B: integer);
var
  SSCC : string;
  Contador : string;
begin
  if (ID_B <> 0) then
  begin
     // Prefijo de empresa GS1
     with THYFIBQuery.Create(Self) do
     begin
        try
           Database := DMMain.Database;
           SQL.Text := 'SELECT GS1_COMPANY_PREFIX FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA';
           Params.ByName['EMPRESA'].AsInteger := QMBultoActualEMPRESA.AsInteger;
           ExecQuery;
           SSCC := FieldByName['GS1_COMPANY_PREFIX'].AsString;
        finally
           Free;
        end;
     end;

     // Contador de bulto
     Contador := IntToStr(DMMain.Contador_E('SSC'));

     // Concateno a 17 espacios
     SSCC := SSCC + '000000000000000000';
     SSCC := Copy(SSCC, 1, 17 - Length(Contador)) + Contador;

     // Agrego digito de control
     SSCC := DMMain.AgregaDigitoControl(SSCC);

     with THYFIBQuery.Create(Self) do
     begin
        try
           Database := DMMain.Database;
           SQL.Text := 'UPDATE GES_CABECERAS_S_BULTOS SET SSCC = :SSCC WHERE ID_B = :ID_B';
           Params.ByName['SSCC'].AsString := SSCC;
           Params.ByName['ID_B'].AsInteger := ID_B;
           ExecQuery;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMPackingList.SetTipoBultoDefecto(Tipo: integer);
begin
  TipoBultoDefecto := Tipo;
end;

function TDMPackingList.DameNumeroBulto(ID_B: integer): string;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'SELECT NUMERO_BULTO FROM GES_CABECERAS_S_BULTOS WHERE ID_S = :ID_S AND ID_B = :ID_B';
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['ID_B'].AsInteger := ID_B;
        ExecQuery;
        Result := FieldByName['NUMERO_BULTO'].AsString;
     finally
        Free;
     end;
  end;
end;

procedure TDMPackingList.BorrarBultosVacios;
begin
  /// Borro los bultos del documento que no tengan detalle y que no sean padre de otro bulto

  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Add(' DELETE FROM GES_CABECERAS_S_BULTOS C ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.ID_S = :ID_S AND ');
        SQL.Add(' NOT EXISTS(SELECT ID_S ');
        SQL.Add('            FROM GES_DETALLES_S_BULTOS ');
        SQL.Add('            WHERE ');
        SQL.Add('            ID_B = C.ID_B) AND ');
        SQL.Add(' NOT EXISTS(SELECT ID_B ');
        SQL.Add('            FROM GES_CABECERAS_S_BULTOS ');
        SQL.Add('            WHERE ');
        SQL.Add('            ID_B_PADRE = C.ID_B) ');
        Params.ByName['ID_S'].AsInteger := ID_S;
        ExecQuery;
     finally
        Free;
     end;
  end;
end;

procedure TDMPackingList.PosicionaArticulo(Articulo: string);
begin
  QMBultosDet.Close;
  QMBultosDet.Open;
end;

procedure TDMPackingList.AgregarArticulosSinControlStock;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.Database;
        SQL.Text := 'EXECUTE PROCEDURE G_PACKING_LIST_GENERAR_SS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_S)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := TipoDoc;
        Params.ByName['RIG'].AsInteger := RIG;
        Params.ByName['ID_S'].AsInteger := ID_S;
        ExecQuery;
     finally
        Free;
     end;
  end;
end;

procedure TDMPackingList.BorrarLinea;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM GES_DETALLES_S_BULTOS WHERE ID_DETALLES_S = :ID_DETALLES_S';
        Params.ByName['ID_DETALLES_S'].AsInteger := QMBultosDetID_DETALLES_S.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AbrirDetBulto(QMBultosDetID_B.AsInteger);
end;

end.
