unit UDMOfertaProd;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, FIBDataSetRO, UComponentesBusquedaFiltrada;

type
  TDMOfertaProd = class(TDataModule)
     TLocal: THYTransaction;
     QMOfertaProd: TFIBTableSet;
     DSQMOfertaProd: TDataSource;
     QMOfertaProdEMPRESA: TIntegerField;
     QMOfertaProdRIG_OF: TIntegerField;
     QMOfertaProdFECHA: TDateTimeField;
     QMOfertaProdCLIENTE: TIntegerField;
     QMOfertaProdCOMPUESTO: TFIBStringField;
     QMOfertaProdPESO_PIEZA: TFloatField;
     QMOfertaProdPESO_COLADA: TFloatField;
     QMOfertaProdCOMPONENTE1: TFIBStringField;
     QMOfertaProdPRECIO_COMPONENTE1: TFloatField;
     QMOfertaProdUNI_COMPONENTE1: TFloatField;
     QMOfertaProdCOMPONENTE2: TFIBStringField;
     QMOfertaProdPRECIO_COMPONENTE2: TFloatField;
     QMOfertaProdUNI_COMPONENTE2: TFloatField;
     QMOfertaProdCOMPONENTE3: TFIBStringField;
     QMOfertaProdPRECIO_COMPONENTE3: TFloatField;
     QMOfertaProdUNI_COMPONENTE3: TFloatField;
     QMOfertaProdCOMPONENTE4: TFIBStringField;
     QMOfertaProdPRECIO_COMPONENTE4: TFloatField;
     QMOfertaProdUNI_COMPONENTE4: TFloatField;
     QMOfertaProdUNI_CAJA: TFloatField;
     QMOfertaProdTIPO_MAQUINA: TIntegerField;
     QMOfertaProdTIEMPO_CICLO: TFloatField;
     QMOfertaProdUNI_CAVIDADES: TFloatField;
     QMOfertaProdTIEMPO_MANIPUACION: TFloatField;
     QMOfertaProdHORAS_PREP_MOLDE: TFloatField;
     QMOfertaProdPUESTA_MARCHA: TFloatField;
     QMOfertaProdMARGEN_MAQ: TFloatField;
     QMOfertaProdMARGEN_MAT_PRIMA: TFloatField;
     QMOfertaProdPEDIDO1: TIntegerField;
     QMOfertaProdPEDIDO2: TIntegerField;
     QMOfertaProdPEDIDO3: TIntegerField;
     QMOfertaProdPEDIDO4: TIntegerField;
     QMOfertaProdPEDIDO5: TIntegerField;
     QMOfertaProdPEDIDO6: TIntegerField;
     QMOfertaProdID_ESCANDALLO: TIntegerField;
     QMOfertaProdMOLDE: TFIBStringField;
     QMOfertaProdTIPO_CAJA: TFIBStringField;
     QPreuArticle: TFIBDataSetRO;
     DSQArticle: TDataSource;
     QPreuArticleP_COSTE: TFloatField;
     QMOfertaProdPRECIO_CAJA: TFloatField;
     QNumCavitats: TFIBDataSetRO;
     DSNumCavitats: TDataSource;
     QNumCavitatsNUM_CAVIDADES: TIntegerField;
     xDestino: TFIBDataSetRO;
     DSxDestino: TDataSource;
     xDestinoEMPRESA: TIntegerField;
     xDestinoTIPO: TFIBStringField;
     xDestinoESCANDALLO: TIntegerField;
     QMOfertaProdID_DETALLES_OFERTAS_V: TIntegerField;
     QMOfertaProdTITULO_ART: TFIBStringField;
     QMOfertaProdUSAR_EQUIVAL1: TIntegerField;
     QMOfertaProdID_EQUIVAL1: TIntegerField;
     QMOfertaProdUSAR_EQUIVAL2: TIntegerField;
     QMOfertaProdID_EQUIVAL2: TIntegerField;
     QMOfertaProdUSAR_EQUIVAL3: TIntegerField;
     QMOfertaProdID_EQUIVAL3: TIntegerField;
     QMOfertaProdUSAR_EQUIVAL4: TIntegerField;
     QMOfertaProdID_EQUIVAL4: TIntegerField;
     xArtEquival: TFIBDataSetRO;
     xArtEquivalARTICULO: TFIBStringField;
     QMOfertaProdMARGEN_OPE: TFloatField;
     QMOfertaProdMARGEN_VAR: TFloatField;
     QMOfertaProdMARGEN_TRAB: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMOfertaProdNewRecord(DataSet: TDataSet);
     procedure QMOfertaProdUNI_COMPONENTE2Change(Sender: TField);
     procedure QMOfertaProdUNI_COMPONENTE3Change(Sender: TField);
     procedure QMOfertaProdUNI_COMPONENTE4Change(Sender: TField);
     procedure QMOfertaProdCOMPONENTE1Change(Sender: TField);
     procedure QMOfertaProdCOMPONENTE2Change(Sender: TField);
     procedure QMOfertaProdCOMPONENTE3Change(Sender: TField);
     procedure QMOfertaProdCOMPONENTE4Change(Sender: TField);
     procedure QMOfertaProdMOLDEChange(Sender: TField);
     procedure QMOfertaProdAfterOpen(DataSet: TDataSet);
     procedure QMOfertaProdAfterScroll(DataSet: TDataSet);
     procedure QMOfertaProdBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMOfertaProdCOMPUESTOChange(Sender: TField);
     procedure QMOfertaProdUSAR_EQUIVAL1Change(Sender: TField);
     procedure QMOfertaProdUSAR_EQUIVAL2Change(Sender: TField);
     procedure QMOfertaProdUSAR_EQUIVAL3Change(Sender: TField);
     procedure QMOfertaProdUSAR_EQUIVAL4Change(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     function BusquedaCompleja: integer;
     procedure CreaOfertaEsc(Tipo: smallint);
  end;

var
  DMOfertaProd : TDMOfertaProd;

implementation

uses UDMMain, UEntorno, UDameDato, UFMain, UFMOfertaProd, uFBusca;

{$R *.dfm}

procedure TDMOfertaProd.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction; // Sempre hem d'obrir transaccio

  QMOfertaProdPRECIO_COMPONENTE1.DisplayFormat := MascaraN;
  QMOfertaProdPRECIO_COMPONENTE2.DisplayFormat := MascaraN;
  QMOfertaProdPRECIO_COMPONENTE3.DisplayFormat := MascaraN;
  QMOfertaProdPRECIO_COMPONENTE4.DisplayFormat := MascaraN;
  QMOfertaProdUNI_COMPONENTE1.DisplayFormat := MascaraP;
  QMOfertaProdUNI_COMPONENTE2.DisplayFormat := MascaraP;
  QMOfertaProdUNI_COMPONENTE3.DisplayFormat := MascaraP;
  QMOfertaProdUNI_COMPONENTE4.DisplayFormat := MascaraP;

  DMMain.FiltraTabla(QMOfertaProd, '10000'); // Per obrir la taula amb una consulta filtrant per Empresa
end;

procedure TDMOfertaProd.QMOfertaProdNewRecord(DataSet: TDataSet);
begin
  QMOfertaProdEMPRESA.AsInteger := REntorno.Empresa;
  QMOfertaProdFECHA.AsDateTime := REntorno.FechaTrabSH;
  QMOfertaProdTIPO_CAJA.AsInteger := 0;
  QMOfertaProdUNI_COMPONENTE1.AsFloat := 100;
end;

procedure TDMOfertaProd.QMOfertaProdUNI_COMPONENTE2Change(Sender: TField);
begin
  QMOfertaProdUNI_COMPONENTE1.AsFloat :=
     100 - (QMOfertaProdUNI_COMPONENTE2.AsFloat +
     QMOfertaProdUNI_COMPONENTE3.AsFloat +
     QMOfertaProdUNI_COMPONENTE4.AsFloat);
end;

procedure TDMOfertaProd.QMOfertaProdUNI_COMPONENTE3Change(Sender: TField);
begin
  QMOfertaProdUNI_COMPONENTE1.AsFloat :=
     100 - (QMOfertaProdUNI_COMPONENTE2.AsFloat +
     QMOfertaProdUNI_COMPONENTE3.AsFloat +
     QMOfertaProdUNI_COMPONENTE4.AsFloat);
end;

procedure TDMOfertaProd.QMOfertaProdUNI_COMPONENTE4Change(Sender: TField);
begin
  QMOfertaProdUNI_COMPONENTE1.AsFloat :=
     100 - (QMOfertaProdUNI_COMPONENTE2.AsFloat +
     QMOfertaProdUNI_COMPONENTE3.AsFloat +
     QMOfertaProdUNI_COMPONENTE4.AsFloat);
end;

procedure TDMOfertaProd.QMOfertaProdCOMPONENTE1Change(Sender: TField);
begin
  // Posar preu article
  QPreuArticle.Close;
  QPreuArticle.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QPreuArticle.Params.ByName['ARTICULO'].AsString := QMOfertaProdCOMPONENTE1.AsString;
  QPreuArticle.Open;

  QMOfertaProdPRECIO_COMPONENTE1.AsFloat := QPreuArticleP_COSTE.AsFloat;
end;

procedure TDMOfertaProd.QMOfertaProdCOMPONENTE2Change(Sender: TField);
begin
  // Posar preu article
  QPreuArticle.Close;
  QPreuArticle.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QPreuArticle.Params.ByName['ARTICULO'].AsString := QMOfertaProdCOMPONENTE2.AsString;
  QPreuArticle.Open;

  QMOfertaProdPRECIO_COMPONENTE2.AsFloat := QPreuArticleP_COSTE.AsFloat;
end;

procedure TDMOfertaProd.QMOfertaProdCOMPONENTE3Change(Sender: TField);
begin
  // Posar preu article
  QPreuArticle.Close;
  QPreuArticle.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QPreuArticle.Params.ByName['ARTICULO'].AsString := QMOfertaProdCOMPONENTE3.AsString;
  QPreuArticle.Open;

  QMOfertaProdPRECIO_COMPONENTE3.AsFloat := QPreuArticleP_COSTE.AsFloat;
end;

procedure TDMOfertaProd.QMOfertaProdCOMPONENTE4Change(Sender: TField);
begin
  // Posar preu article
  QPreuArticle.Close;
  QPreuArticle.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QPreuArticle.Params.ByName['ARTICULO'].AsString := QMOfertaProdCOMPONENTE4.AsString;
  QPreuArticle.Open;

  QMOfertaProdPRECIO_COMPONENTE4.AsFloat := QPreuArticleP_COSTE.AsFloat;
end;

procedure TDMOfertaProd.QMOfertaProdMOLDEChange(Sender: TField);
begin
  // Posar núm. cavitats
  QNumCavitats.Close;
  QNumCavitats.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QNumCavitats.Params.ByName['NUM_MOLDE'].AsString := QMOfertaProdMOLDE.AsString;
  QNumCavitats.Open;

  QMOfertaProdUNI_CAVIDADES.AsFloat := QNumCavitatsNUM_CAVIDADES.AsFloat;
end;

procedure TDMOfertaProd.CreaOfertaEsc(Tipo: smallint);
var
  Q : THYFIBQuery;
  // Estado : integer;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;

        // Primero guardamos el estado en el que estaba el escandallo
        {
        SQL.Text := 'SELECT ESTADO FROM PRO_ESCANDALLO WHERE EMPRESA = ?EMPRESA AND ID_ESC = ?ID_ESC';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_ESC'].AsInteger := QMOfertaProdID_ESCANDALLO.AsInteger;
        ExecQuery;
        Estado := FieldByName['ESTADO'].AsInteger;
        FreeHandle;
        }

        // Poner en no activo para poder modificar
        SQL.Text := 'UPDATE PRO_ESCANDALLO SET ESTADO = 0 WHERE EMPRESA = ?EMPRESA AND ID_ESC = ?ID_ESC';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_ESC'].AsInteger := QMOfertaProdID_ESCANDALLO.AsInteger;
        ExecQuery;
        FreeHandle;

        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_OFERTA_ESP_A_PRO (?EMPRESA, ?RIG, ?TIPO, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['RIG'].AsInteger := QMOfertaProdRIG_OF.AsInteger;
        Params.ByName['TIPO'].AsInteger := Tipo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;

        { G_TRASPASO_OFERTA_ESP_A_PRO deja al escandallo activo, por lo que no debo volver a activarlo.
        // Una vez todo modificado volver a activar
        SQL.Text := 'UPDATE PRO_ESCANDALLO SET ESTADO = ?ESTADO WHERE EMPRESA = ?EMPRESA AND ID_ESC = ?ID_ESC';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_ESC'].AsInteger := QMOfertaProdID_ESCANDALLO.AsInteger;
        Params.ByName['ESTADO'].AsInteger := Estado;
        ExecQuery;
        FreeHandle;
        }

        {Si se desactiva y activa se recalcularan los porcentajes y eso no se quiere (ANDALPAST).
        // Desactivo escandallo
        SQL.Text := 'UPDATE PRO_ESCANDALLO SET ESTADO = 0 WHERE EMPRESA = ?EMPRESA AND ID_ESC = ?ID_ESC';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_ESC'].AsInteger := QMOfertaProdID_ESCANDALLO.AsInteger;
        ExecQuery;
        FreeHandle;

        // Activo escandallo
        SQL.Text := 'UPDATE PRO_ESCANDALLO SET ESTADO = 1 WHERE EMPRESA = ?EMPRESA AND ID_ESC = ?ID_ESC';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_ESC'].AsInteger := QMOfertaProdID_ESCANDALLO.AsInteger;
        ExecQuery;
        FreeHandle;
        }
     end;
  finally
     FreeAndNil(Q);
  end;

  QMOfertaProd.Refresh;

  if (Tipo = 0) then
     FMain.EjecutaAccion(FMain.AProOfertasE, 'ID_ESC = ' + QMOfertaProdID_ESCANDALLO.AsString)
  else
     FMain.EjecutaAccion(FMain.AProEscandallosF, 'ID_ESC = ' + QMOfertaProdID_ESCANDALLO.AsString);

  FMOfertaProd.ActualizaRelacion(xDestinoTIPO.AsString);
end;

procedure TDMOfertaProd.QMOfertaProdAfterOpen(DataSet: TDataSet);
begin
  xDestino.Close;
  xDestino.Open;
end;

procedure TDMOfertaProd.QMOfertaProdAfterScroll(DataSet: TDataSet);
begin
  FMOfertaProd.VerArticulosEquivalencias;
  FMOfertaProd.ActualizaRelacion(xDestinoTIPO.AsString);
end;

procedure TDMOfertaProd.QMOfertaProdBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMOfertaProdRIG_OF.AsInteger := DMMain.Contador_E('ZOP');
end;

procedure TDMOfertaProd.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

function TDMOfertaProd.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMOfertaProd, '10000', True);
end;

procedure TDMOfertaProd.QMOfertaProdCOMPUESTOChange(Sender: TField);
begin
  QMOfertaProdTITULO_ART.AsString := DameTituloArticulo(QMOfertaProdCOMPUESTO.AsString);
end;

procedure TDMOfertaProd.QMOfertaProdUSAR_EQUIVAL1Change(Sender: TField);
begin
  if (Sender.AsInteger = 1) then
  begin
     with xArtEquival do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_EQUIVAL'].AsInteger := Sender.AsInteger;
        Open;
     end;

     QMOfertaProdCOMPONENTE1.AsString := xArtEquivalARTICULO.AsString;
  end;

  FMOfertaProd.VerArticulosEquivalencias;
end;

procedure TDMOfertaProd.QMOfertaProdUSAR_EQUIVAL2Change(Sender: TField);
begin
  if (Sender.AsInteger = 1) then
  begin
     with xArtEquival do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_EQUIVAL'].AsInteger := Sender.AsInteger;
        Open;
     end;

     QMOfertaProdCOMPONENTE2.AsString := xArtEquivalARTICULO.AsString;
  end;

  FMOfertaProd.VerArticulosEquivalencias;
end;

procedure TDMOfertaProd.QMOfertaProdUSAR_EQUIVAL3Change(Sender: TField);
begin
  if (Sender.AsInteger = 1) then
  begin
     with xArtEquival do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_EQUIVAL'].AsInteger := Sender.AsInteger;
        Open;
     end;

     QMOfertaProdCOMPONENTE3.AsString := xArtEquivalARTICULO.AsString;
  end;

  FMOfertaProd.VerArticulosEquivalencias;
end;

procedure TDMOfertaProd.QMOfertaProdUSAR_EQUIVAL4Change(Sender: TField);
begin
  if (Sender.AsInteger = 1) then
  begin
     with xArtEquival do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_EQUIVAL'].AsInteger := Sender.AsInteger;
        Open;
     end;

     QMOfertaProdCOMPONENTE4.AsString := xArtEquivalARTICULO.AsString;
  end;

  FMOfertaProd.VerArticulosEquivalencias;
end;

end.
