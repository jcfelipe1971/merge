unit UDMTraspasoMultiCanal;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, Forms, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FIBQuery, HYFIBQuery, Dialogs;

type
  TDMTraspasoMultiCanal = class(TDataModule)
     TLocal: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     function DameSentenciaSQL(Tipo: integer): string;
  public
     { Public declarations }
     procedure MuestraDatos(D_Ejercicio, D_Canal, D_Rig: integer; D_Tipo, D_Serie: string; var Refresca: integer);
     procedure TraspasoDocumento(O_Tipo, O_Serie, D_Tipo, D_Serie: string; O_ID, O_Canal, O_RIG, O_Ejercicio, D_Ejercicio, D_Canal, NDoc, Transportista: integer; BorraMovStock, GeneraMovStock, CierraFac, BorraDoc, GeneraPrec: boolean; D_Fecha: TDateTime; var Refresca: integer);
     function DameMinCanal: string;
     function DameMinSerie(Canal_EF: integer): string;
     function DameIdClienteDocumento(IdS: integer): integer;
  end;

var
  DMTraspasoMultiCanal : TDMTraspasoMultiCanal;

implementation

uses UDMMain, UFormGest, UEntorno, UUtiles, UFMain, UFMTraspasoMultiCanal;

{$R *.dfm}

procedure TDMTraspasoMultiCanal.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMTraspasoMultiCanal.TraspasoDocumento(O_Tipo, O_Serie, D_Tipo, D_Serie: string; O_ID, O_Canal, O_RIG, O_Ejercicio, D_Ejercicio, D_Canal, NDoc, Transportista: integer; BorraMovStock,     // Borrar Mov. Stock en doc. origen
  GeneraMovStock,    // Generar Mov. Stock en destino
  CierraFac,         // Cerrar Factura
  BorraDoc,          // Borrar Doc. Origen
  GeneraPrec: boolean; // Regenerar Precios del Doc. destino
  D_Fecha: TDateTime; var Refresca: integer);
var
  D_Rig : integer;
begin
  Refresca := -1;
  // if Confirma then
  // begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := DameSentenciaSQL(NDoc);
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := O_Ejercicio;
        Params.ByName['CANAL'].AsInteger := O_Canal;
        Params.ByName['SERIE'].AsString := O_Serie;
        Params.ByName['TIPO'].AsString := O_Tipo;
        Params.ByName['RIG'].AsInteger := O_Rig;
        Params.ByName['D_TIPO'].AsString := D_tipo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['FECHA'].AsDateTime := D_Fecha;
        Params.ByName['D_EJERCICIO'].AsInteger := D_Ejercicio;
        Params.ByName['D_CANAL'].AsInteger := D_Canal;
        Params.ByName['D_SERIE'].AsString := D_Serie;
        if (Params.ByName['ID_S'] <> nil) then
           Params.ByName['ID_S'].AsInteger := O_ID;
        if (Params.ByName['ID_E'] <> nil) then
           Params.ByName['ID_E'].AsInteger := O_ID;
        Params.ByName['BORRARORIGEN'].AsInteger := BoolToInt(BorraDoc);
        if (Params.ByName['TRANSPORTISTA'] <> nil) then
           Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
        if (Params.ByName['GENERA_MOV_STOCK'] <> nil) then
           Params.ByName['GENERA_MOV_STOCK'].AsInteger := BoolToInt(GeneraMovStock);
        if (Params.ByName['BORRA_MOV_STOCK'] <> nil) then
           Params.ByName['BORRA_MOV_STOCK'].AsInteger := BoolToInt(BorraMovStock);
        if (Params.ByName['CIERRA_FAC'] <> nil) then
           Params.ByName['CIERRA_FAC'].AsInteger := BoolToInt(CierraFac);
        Params.ByName['GENERAR_PRECIOS'].AsInteger := BoolToInt(GeneraPrec);
        ExecQuery;

        D_Rig := FieldByName['RIG_DST'].AsInteger;

        if ((REntorno.Ejercicio = D_Ejercicio) and
           (REntorno.Canal = D_Canal)) then
           FMain.MuestraDocumento(D_Ejercicio, D_Tipo, D_Serie, D_Rig)
        else
           MuestraDatos(D_Ejercicio, D_Canal, D_Rig, D_Tipo, D_Serie, Refresca);

        FreeHandle;
     finally
        Free;
     end;
  end;
  // end;
end;

function TDMTraspasoMultiCanal.DameMinCanal: string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(CANAL) FROM VER_CANALES_ACTIVOS WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL<>?CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        if (FieldByName['MIN'].AsInteger > 0) then
           Result := IntToStr(FieldByName['MIN'].AsInteger)
        else
           Result := REntorno.canalstr;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTraspasoMultiCanal.DameMinSerie(Canal_EF: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(SERIE) FROM VER_SERIES WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal_EF;
        ExecQuery;
        Result := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTraspasoMultiCanal.DameSentenciaSQL(Tipo: integer): string;
begin
  case Tipo of
     1: {Ofertas} Result := 'EXECUTE PROCEDURE G_TRASPASO_OFERTA_A_OTRO_MUL' +
           ' (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,' +
           ' ?ENTRADA,?FECHA,?D_EJERCICIO,?D_CANAL,?D_SERIE,?ID_S,?BORRARORIGEN,' +
           ' ?CIERRA_FAC,?GENERAR_PRECIOS)';

     2: {Pedidos} Result := 'EXECUTE PROCEDURE G_TRASPASO_PEDIDO_A_OTRO_MUL' +
           ' (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,' +
           ' ?ENTRADA,?FECHA,?D_EJERCICIO,?D_CANAL,?D_SERIE,?ID_S,?BORRARORIGEN,' +
           ' ?CIERRA_FAC,?GENERAR_PRECIOS)';

     3: {Albaranes} Result := 'EXECUTE PROCEDURE G_TRASPASO_ALBARAN_A_OTRO_MUL' +
           ' (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,' +
           ' ?ENTRADA,?FECHA, ?TRANSPORTISTA,?D_EJERCICIO,?D_CANAL,?D_SERIE,?ID_S,?BORRARORIGEN,?GENERA_MOV_STOCK,' +
           ' ?BORRA_MOV_STOCK,?CIERRA_FAC,?GENERAR_PRECIOS)';

     4: {Facturas} Result := 'EXECUTE PROCEDURE G_TRASPASO_FACTURA_A_OTRO_MUL' +
           ' (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,' +
           ' ?ENTRADA,?FECHA, ?TRANSPORTISTA,?D_EJERCICIO,?D_CANAL,?D_SERIE,?ID_S,?BORRARORIGEN,?GENERA_MOV_STOCK,' +
           ' ?BORRA_MOV_STOCK,?CIERRA_FAC,?GENERAR_PRECIOS)';

     5: {Propuesta Prov} Result := 'EXECUTE PROCEDURE G_TRASPASO_OFP_PROV_A_OTRO' +
           '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,' +
           '?ENTRADA,?FECHA,?D_EJERCICIO,?D_CANAL,?D_SERIE,?ID_E,?BORRARORIGEN,' +
           '?CIERRA_FAC,?GENERAR_PRECIOS)';

     6: {Propuesta Conf. Prov} Result := 'EXECUTE PROCEDURE G_TRASPASO_OCP_PROV_A_OTRO' +
           '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,' +
           '?ENTRADA,?FECHA,?D_EJERCICIO,?D_CANAL,?D_SERIE,?ID_E,?BORRARORIGEN,' +
           '?CIERRA_FAC,?GENERAR_PRECIOS)';

     7: {Ped Prov} Result := 'EXECUTE PROCEDURE G_TRASPASO_PEDIDO_PROV_MUL' +
           '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,' +
           '?ENTRADA,?FECHA,?D_EJERCICIO,?D_CANAL,?D_SERIE,?ID_E,?BORRARORIGEN,' +
           '?CIERRA_FAC,?GENERAR_PRECIOS)';

     8: {Alb Prov} Result := 'EXECUTE PROCEDURE G_TRASPASO_ALBARAN_PROV_MUL' +
           '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,' +
           '?ENTRADA,?FECHA,?D_EJERCICIO,?D_CANAL,?D_SERIE,' +
           '?ID_E,?BORRARORIGEN,?GENERA_MOV_STOCK,?BORRA_MOV_STOCK,' +
           '?CIERRA_FAC,?GENERAR_PRECIOS)';

     9: {Fac Prov} Result := 'EXECUTE PROCEDURE G_TRASPASO_FACTURA_PROV_MUL' +
           '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,' +
           '?ENTRADA,?FECHA,?D_EJERCICIO,?D_CANAL,?D_SERIE,' +
           '?ID_E,?BORRARORIGEN,?GENERA_MOV_STOCK,?BORRA_MOV_STOCK,' +
           '?CIERRA_FAC,?GENERAR_PRECIOS)';

     10: {Fac Acr} Result := 'EXECUTE PROCEDURE G_TRASPASO_FACTURA_ACR_MUL' +
           '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?D_TIPO,' +
           '?ENTRADA,?FECHA,?D_EJERCICIO,?D_CANAL,?D_SERIE,' +
           '?ID_E,?BORRARORIGEN,?GENERA_MOV_STOCK,?BORRA_MOV_STOCK,' +
           '?CIERRA_FAC,?GENERAR_PRECIOS)';
  end;
end;

procedure TDMTraspasoMultiCanal.MuestraDatos(D_Ejercicio, D_Canal, D_Rig: integer; D_Tipo, D_Serie: string; var Refresca: integer);
begin
  if (Application.MessageBox(PChar(string(_('Desea abrir el documento destino.'))),
     PChar(string(_('Confirmación'))), mb_iconstop + mb_yesno) = id_yes) then
     if (Application.MessageBox(PChar(string(_('Se va a cerrar el ejercicio y/o canal actual para abrir el ejercicio y/o canal del documento '))),
        PChar(string(_('Confirmación'))), mb_iconstop + mb_yesno) = id_yes) then
     begin
        Refresca := 0;
        CierraFormsMenos(FMTraspasoMultiCanal);
        FMain.CambiaEjercicioYCanal(D_Ejercicio, D_Canal);
        FMain.MuestraDocumento(D_Ejercicio, D_Tipo, D_Serie, D_Rig);
        FMain.SetFocus;
     end;
end;

function TDMTraspasoMultiCanal.DameIdClienteDocumento(IdS: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT C.ID_CLIENTE FROM GES_CABECERAS_S D ');
        SQL.Add(' JOIN EMP_CLIENTES C ON D.EMPRESA = C.EMPRESA AND D.CLIENTE = C.CLIENTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' D.ID_S = :ID_S ');
        Params.ByName['ID_S'].AsInteger := IdS;
        ExecQuery;
        Result := FieldByName['ID_CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
