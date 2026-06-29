unit UDMMovEntreUbicaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet, HYFIBQuery, Dialogs;

type
  TDMMovEntreUbicaciones = class(TDataModule)
     TLocal: THYTransaction;
     xUbicacionO: TFIBDataSetRO;
     xTituloUBD: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     DSxUbicacionO: TDataSource;
     DSxTituloUBD: TDataSource;
     xArticulosD: TFIBTableSet;
     xArticulosO: TFIBTableSet;
     xArticulosOEMPRESA: TIntegerField;
     xArticulosOCANAL: TIntegerField;
     xArticulosOALMACEN: TFIBStringField;
     xArticulosOCALLE: TFIBStringField;
     xArticulosOESTANTERIA: TFIBStringField;
     xArticulosOREPISA: TFIBStringField;
     xArticulosOPOSICION: TFIBStringField;
     xArticulosOARTICULO: TFIBStringField;
     xArticulosOTITULO: TFIBStringField;
     xArticulosOCOMPOSICION: TFIBStringField;
     xArticulosOTITULO_COMP: TFIBStringField;
     xArticulosOID_A: TIntegerField;
     xArticulosOENTRADAS: TFloatField;
     xArticulosOSALIDAS: TFloatField;
     xArticulosOEXISTENCIAS: TFloatField;
     xArticulosOID_UBICACION: TIntegerField;
     DSxArticulosO: TDataSource;
     DSxArticulosD: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleCALLE: TFIBStringField;
     QMDetalleESTANTERIA: TFIBStringField;
     QMDetalleREPISA: TFIBStringField;
     QMDetallePOSICION: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleUNIDADES: TFloatField;
     QMDetalleID_A: TIntegerField;
     QMDetalleID_UBICACION: TIntegerField;
     QMDetalleTITULO: TFIBStringField;
     xArticulosOGENERAL: TIntegerField;
     xArticulosOID_STOCKS_UB: TIntegerField;
     xArticulosOID_A_UBICACION: TIntegerField;
     QMDetallePESO: TFloatField;
     QMDetalleVOLUMEN: TFloatField;
     QMDetalleDIAMETRO: TFloatField;
     QMDetalleD_ALMACEN: TFIBStringField;
     QMDetalleD_CALLE: TFIBStringField;
     QMDetalleD_ESTANTERIA: TFIBStringField;
     QMDetalleD_REPISA: TFIBStringField;
     QMDetalleD_POSICION: TFIBStringField;
     QMDetalleD_ID_UBICACION: TIntegerField;
     QMDetalleFECHA: TDateTimeField;
     QMDetalleEJERCICIO: TIntegerField;
     xUbicacionD: TFIBDataSetRO;
     xUbicacionDEMPRESA: TIntegerField;
     xUbicacionDALMACEN: TFIBStringField;
     xUbicacionDCALLE: TFIBStringField;
     xUbicacionDESTANTERIA: TFIBStringField;
     xUbicacionDREPISA: TFIBStringField;
     xUbicacionDPOSICION: TFIBStringField;
     xUbicacionDTITULO: TFIBStringField;
     xUbicacionDVOLUMEN_MAX: TFloatField;
     xUbicacionDDIAMETRO_MAX: TFloatField;
     xUbicacionDPESO_MAX: TFloatField;
     xUbicacionDVOLUMEN_ACC: TFloatField;
     xUbicacionDPESO_ACC: TFloatField;
     xUbicacionDDIAMETRO_ACC: TFloatField;
     xUbicacionDID_UBICACION: TIntegerField;
     xUbicacionDCOMPOSICION: TFIBStringField;
     xUbicacionDGENERAL: TIntegerField;
     xUbicacionDUNIDADES_ACC: TFloatField;
     xArticulosDEMPRESA: TIntegerField;
     xArticulosDCANAL: TIntegerField;
     xArticulosDALMACEN: TFIBStringField;
     xArticulosDCALLE: TFIBStringField;
     xArticulosDESTANTERIA: TFIBStringField;
     xArticulosDREPISA: TFIBStringField;
     xArticulosDPOSICION: TFIBStringField;
     xArticulosDARTICULO: TFIBStringField;
     xArticulosDTITULO: TFIBStringField;
     xArticulosDCOMPOSICION: TFIBStringField;
     xArticulosDTITULO_COMP: TFIBStringField;
     xArticulosDID_A: TIntegerField;
     xArticulosDENTRADAS: TFloatField;
     xArticulosDSALIDAS: TFloatField;
     xArticulosDEXISTENCIAS: TFloatField;
     xArticulosDID_STOCKS_UB: TIntegerField;
     xArticulosDID_A_UBICACION: TIntegerField;
     xArticulosDID_UBICACION: TIntegerField;
     xArticulosDGENERAL: TIntegerField;
     DSxUbicacionD: TDataSource;
     xUbicacionOEMPRESA: TIntegerField;
     xUbicacionOALMACEN: TFIBStringField;
     xUbicacionOCALLE: TFIBStringField;
     xUbicacionOESTANTERIA: TFIBStringField;
     xUbicacionOREPISA: TFIBStringField;
     xUbicacionOPOSICION: TFIBStringField;
     xUbicacionOTITULO: TFIBStringField;
     xUbicacionOVOLUMEN_MAX: TFloatField;
     xUbicacionODIAMETRO_MAX: TFloatField;
     xUbicacionOPESO_MAX: TFloatField;
     xUbicacionOVOLUMEN_ACC: TFloatField;
     xUbicacionOPESO_ACC: TFloatField;
     xUbicacionODIAMETRO_ACC: TFloatField;
     xUbicacionOID_UBICACION: TIntegerField;
     xUbicacionOCOMPOSICION: TFIBStringField;
     xUbicacionOGENERAL: TIntegerField;
     xUbicacionOUNIDADES_ACC: TFloatField;
     TUpdate: THYTransaction;
     DSQMDetalleMovSimple: TDataSource;
     QMDetalleMovSimple: TFIBTableSet;
     QMDetalleMovSimpleENTRADA: TIntegerField;
     QMDetalleMovSimpleEMPRESA: TIntegerField;
     QMDetalleMovSimpleEJERCICIO: TIntegerField;
     QMDetalleMovSimpleCANAL: TIntegerField;
     QMDetalleMovSimpleALMACEN: TFIBStringField;
     QMDetalleMovSimpleCALLE: TFIBStringField;
     QMDetalleMovSimpleESTANTERIA: TFIBStringField;
     QMDetalleMovSimpleREPISA: TFIBStringField;
     QMDetalleMovSimplePOSICION: TFIBStringField;
     QMDetalleMovSimpleARTICULO: TFIBStringField;
     QMDetalleMovSimpleLINEA: TIntegerField;
     QMDetalleMovSimpleUNIDADES: TFloatField;
     QMDetalleMovSimpleID_A: TIntegerField;
     QMDetalleMovSimpleID_UBICACION: TIntegerField;
     QMDetalleMovSimpleTITULO: TFIBStringField;
     QMDetalleMovSimplePESO: TFloatField;
     QMDetalleMovSimpleVOLUMEN: TFloatField;
     QMDetalleMovSimpleDIAMETRO: TFloatField;
     QMDetalleMovSimpleD_ALMACEN: TFIBStringField;
     QMDetalleMovSimpleD_CALLE: TFIBStringField;
     QMDetalleMovSimpleD_ESTANTERIA: TFIBStringField;
     QMDetalleMovSimpleD_REPISA: TFIBStringField;
     QMDetalleMovSimpleD_POSICION: TFIBStringField;
     QMDetalleMovSimpleD_ID_UBICACION: TIntegerField;
     QMDetalleMovSimpleFECHA: TDateTimeField;
     QMDetalleMovSimpleTITULO_UBIC_ORIGEN: TStringField;
     QMDetalleMovSimpleTITULO_UBIC_DESTINO: TStringField;
     QMDetalleMovSimpleID_LOTE: TIntegerField;
     QMDetalleMovSimpleLOTE: TFIBStringField;
     QMDetalleID_LOTE: TIntegerField;
     QMDetalleLOTE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleARTICULOChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleUNIDADESChange(Sender: TField);
     procedure QMDetalleMovSimpleARTICULOChange(Sender: TField);
     procedure QMDetalleMovSimpleUNIDADESChange(Sender: TField);
     procedure QMDetalleMovSimpleNewRecord(DataSet: TDataSet);
     procedure QMDetalleMovSimpleD_ID_UBICACIONChange(Sender: TField);
     procedure QMDetalleMovSimpleID_UBICACIONChange(Sender: TField);
     procedure QMDetalleMovSimpleALMACENChange(Sender: TField);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMDetalleMovSimpleTITULO_UBIC_ORIGENGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleMovSimpleTITULO_UBIC_DESTINOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleMovSimpleLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     function CompruebaCapacidad(ID_Ubicacion: integer; NPeso, NVolumen, NDiametro: double): boolean;
     procedure RefrescaGrids;
  public
     { Public declarations }
     AlmacenMovSimple: string;
     procedure DameTituloUb(Composicion: string; Modo: byte);
     procedure BorraTemporal;
     procedure RealizaTraspaso;
     procedure CierraMovSimple;
     procedure AbreMovSimple;
     procedure Infolotes(origen: integer);
  end;

var
  DMMovEntreUbicaciones : TDMMovEntreUbicaciones;

implementation

uses UDMMain, UEntorno, UFMIntroduceLotes, UUtiles, UDameDato;

{$R *.dfm}

procedure TDMMovEntreUbicaciones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMMovEntreUbicaciones.DameTituloUb(Composicion: string; Modo: byte);
begin
  case Modo of
     0:
     begin
        with xUbicacionO do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['COMPOSICION'].AsString := Composicion;
           Open;
        end;
        with xArticulosO do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['COMPOSICION'].AsString := Composicion;
           Open;
        end;
        BorraTemporal;
        with QMDetalle do
        begin
           Close;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ALMACEN'].AsString := xArticulosOALMACEN.AsString;
           Params.ByName['CALLE'].AsString := xArticulosOCALLE.AsString;
           Params.ByName['ESTANTERIA'].AsString := xArticulosOESTANTERIA.AsString;
           Params.ByName['REPISA'].AsString := xArticulosOREPISA.AsString;
           Params.ByName['POSICION'].AsString := xArticulosOPOSICION.AsString;
           Open;
        end;
     end;
     1:
     begin
        with xUbicacionD do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['COMPOSICION'].AsString := Composicion;
           Open;
        end;
        with xArticulosD do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['COMPOSICION'].AsString := Composicion;
           Open;
        end;
     end;
  end;
end;

procedure TDMMovEntreUbicaciones.BorraTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Close;
        SQL.Text := 'DELETE FROM TMP_TRASPASO_ENTRE_UB WHERE ENTRADA = ?ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMovEntreUbicaciones.QMDetalleNewRecord(DataSet: TDataSet);
begin
  xArticulosD.Close;
  xArticulosD.Open;
  QMDetalleUNIDADES.AsFloat := 0;
  QMDetallePESO.AsFloat := 0;
  QMDetalleVOLUMEN.AsFloat := 0;
  QMDetalleDIAMETRO.AsFloat := 0;
  QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetalleENTRADA.AsInteger := REntorno.Entrada;
  QMDetalleCANAL.AsInteger := REntorno.Canal;
  QMDetalleALMACEN.AsString := xUbicacionOALMACEN.AsString;
  QMDetalleCALLE.AsString := xUbicacionOCALLE.AsString;
  QMDetalleESTANTERIA.AsString := xUbicacionOESTANTERIA.AsString;
  QMDetalleREPISA.AsString := xUbicacionOREPISA.AsString;
  QMDetallePOSICION.AsString := xUbicacionOPOSICION.AsString;
  QMDetalleID_UBICACION.AsInteger := xUbicacionOID_UBICACION.AsInteger;
  QMDetalleD_ALMACEN.AsString := xUbicacionDALMACEN.AsString;
  QMDetalleD_CALLE.AsString := xUbicacionDCALLE.AsString;
  QMDetalleD_ESTANTERIA.AsString := xUbicacionDESTANTERIA.AsString;
  QMDetalleD_REPISA.AsString := xUbicacionDREPISA.AsString;
  QMDetalleD_POSICION.AsString := xUbicacionDPOSICION.AsString;
  QMDetalleD_ID_UBICACION.AsInteger := xUbicacionDID_UBICACION.AsInteger;
  QMDetalleFecha.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMMovEntreUbicaciones.QMDetalleARTICULOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Close;
        if (xArticulosDGENERAL.AsInteger = 0) then
           SQL.Text := 'select count(*) as contador from ver_articulos_ubicaciones where empresa =' +
              REntorno.EmpresaStr + ' and id_ubicacion =' + IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) +
              ' and ( articulo not in ( select tmp.articulo' +
              ' from tmp_traspaso_entre_ub tmp' +
              ' where tmp.entrada =' + IntToStr(REntorno.Entrada) +
              ' and tmp.empresa =' + REntorno.EmpresaStr +
              ' and tmp.canal =' + REntorno.CanalStr +
              ' and tmp.id_ubicacion =' + IntToStr(xArticulosOID_UBICACION.AsInteger) + ' ))' +
              ' and ( articulo in ( select st.articulo' +
              ' from art_stocks_ubicaciones st' +
              ' where (( empresa      =' + REntorno.EmpresaStr + ') and' +
              ' ( canal        =' + REntorno.CanalStr + '  ) and' +
              ' ( id_ubicacion =' + IntToStr(xArticulosOID_UBICACION.AsInteger) + ') and' +
              ' ( existencias  > 0 ))))'
        else
           SQL.Text := 'select count(*) as contador from ver_articulos_ubicaciones where empresa =' +
              REntorno.EmpresaStr + ' and id_ubicacion =' + IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) +
              ' and ( articulo not in ( select tmp.articulo' +
              ' from tmp_traspaso_entre_ub tmp' +
              ' where tmp.entrada =' + IntToStr(REntorno.Entrada) +
              ' and tmp.empresa =' + REntorno.EmpresaStr +
              ' and tmp.canal =' + REntorno.CanalStr +
              ' and tmp.id_ubicacion =' + IntToStr(xArticulosOID_UBICACION.AsInteger) + ' ))' +
              ' and ( articulo in ( select ver.articulo' +
              ' from ver_articulos_ubicaciones ver' +
              ' where ver.id_ubicacion =' + IntToStr(xArticulosDID_UBICACION.AsInteger) + '))' +
              ' and ( articulo in ( select st.articulo' +
              ' from art_stocks_ubicaciones st' +
              ' where (( empresa      =' + REntorno.EmpresaStr + ') and' +
              ' ( canal        =' + REntorno.CanalStr + '  ) and' +
              ' ( id_ubicacion =' + IntToStr(xArticulosOID_UBICACION.AsInteger) + ') and' +
              ' ( existencias  > 0 ))))';
        ExecQuery;
        if (FieldByName['CONTADOR'].AsInteger = 0) then
           raise Exception.Create(_('El artículo introducido no es correcto'))
        else
        begin
           Close;
           SQL.Text := 'SELECT TITULO_LARGO AS TITULO,ID_A FROM ART_ARTICULOS WHERE EMPRESA =?EMPRESA AND ARTICULO = ?ARTICULO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Sender.AsString;
           ExecQuery;
           QMDetalleTITULO.AsString := FieldByName['TITULO'].AsString;
           QMDetalleID_A.AsInteger := FieldByName['ID_A'].AsInteger;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMovEntreUbicaciones.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMMovEntreUbicaciones.QMDetalleUNIDADESChange(Sender: TField);
begin
  if (QMDetalleUNIDADES.AsFloat < 0) then
     raise Exception.Create(_('Las unidades a traspasar han de ser mayores que 0'));

  if (QMDetalleUNIDADES.AsFloat > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           DataBase := DMMain.DataBase;
           //Transaction := TLocal;
           SQL.Text := 'SELECT PESO,VOLUMEN_UNIT,DIAMETRO_UNIT FROM ART_ARTICULOS WHERE ID_A = ?ID_A';
           Params.ByName['ID_A'].AsInteger := QMDetalleID_A.AsInteger;
           ExecQuery;
           QMDetallePESO.AsFloat := FieldByName['PESO'].AsFloat * QMDetalleUNIDADES.AsFloat;
           QMDetalleVOLUMEN.AsFloat := FieldByName['VOLUMEN_UNIT'].AsFloat * QMDetalleUNIDADES.AsFloat;
           QMDetalleDIAMETRO.AsFloat := FieldByName['DIAMETRO_UNIT'].AsFloat * QMDetalleUNIDADES.AsFloat;
           if not (CompruebaCapacidad(QMDetalleD_ID_UBICACION.AsInteger, QMDetallePESO.AsFloat,
              QMDetalleVOLUMEN.AsFloat, QMDetalleDIAMETRO.AsFloat)) then
              ShowMessage(_('Las dimensiones exceden de las definidas en la ubicación'));
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMovEntreUbicaciones.CompruebaCapacidad(ID_Ubicacion: integer; NPeso, NVolumen, NDiametro: double): boolean;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT VOLUMEN_ACC,PESO_ACC,DIAMETRO_ACC,VOLUMEN_MAX,PESO_MAX,DIAMETRO_MAX,GENERAL' +
           ' FROM ART_ALMACENES_UBICACIONES' +
           ' WHERE ID_UBICACION = ?ID_UBICACION';
        Params.ByName['ID_UBICACION'].AsInteger := ID_Ubicacion {xArticulosDID_UBICACION.AsInteger};
        ExecQuery;
        // Comprobamos que lo que tenemos acumulado mas lo que vamos a acumular quepa en la ubicacion
        // se le resta 1 para controlar que si son iguales no salte la excepcion
        if (FieldByName['GENERAL'].AsInteger = 0) then
        begin
           if (FieldByName['VOLUMEN_MAX'].AsFloat <=
              (FieldByName['VOLUMEN_ACC'].AsFloat + (NVolumen - 1))) then
              Result := False
           else if (FieldByName['PESO_MAX'].AsFloat <=
              (FieldByName['PESO_ACC'].AsFloat + (NPeso - 1))) then
              Result := False
           else if (FieldByName['DIAMETRO_MAX'].AsFloat <=
              (FieldByName['DIAMETRO_ACC'].AsFloat + (NDiametro - 1))) then
              Result := False
           else
              Result := True;
        end
        else
           Result := True;
     finally
        Free;
     end;
  end;
end;

procedure TDMMovEntreUbicaciones.RealizaTraspaso;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_TMP_ENTRE_UB(?ENTRADA)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  BorraTemporal;
  RefrescaGrids;
end;

procedure TDMMovEntreUbicaciones.RefrescaGrids;
begin
  xArticulosO.Close;
  xArticulosO.Open;
  xArticulosD.Close;
  xArticulosD.Open;
  QMDetalle.Close;
  QMDetalle.Open;
  QMDetalleMovSimple.Close;
  QMDetalleMovSimple.Open;
end;

procedure TDMMovEntreUbicaciones.QMDetalleMovSimpleARTICULOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Close;
        SQL.Text := 'SELECT COUNT(*) CONTADOR FROM ART_ARTICULOS_UBICACIONES ARTUBI JOIN ART_ARTICULOS ART ' +
           'ON(ARTUBI.ID_A = ART.ID_A) JOIN ART_ALMACENES_UBICACIONES UBI ON                      ' +
           '(ARTUBI.ID_UBICACION = UBI.ID_UBICACION) WHERE ART.EMPRESA  =  ?EMPRESA    AND        ' +
           'UBI.ALMACEN  = ?ALMACEN AND ART.ARTICULO = ?ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ALMACEN'].AsString := QMDetalleMovSimpleALMACEN.AsString;
        Params.ByName['ARTICULO'].AsString := Sender.AsString;

        { if (xArticulosDGENERAL.AsInteger = 0) then
         SQL.Text := 'select count(*) as contador from ver_articulos_ubicaciones where empresa =' +
           REntorno.EmpresaStr + ' and id_ubicacion =' + IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) +
           ' and ( articulo not in ( select tmp.articulo' +
           ' from tmp_traspaso_entre_ub tmp' +
           ' where tmp.entrada =' + IntToStr(REntorno.Entrada) +
           ' and tmp.empresa =' + REntorno.EmpresaStr +
           ' and tmp.canal =' + REntorno.CanalStr +
           ' and tmp.id_ubicacion =' + IntToStr(xArticulosOID_UBICACION.AsInteger) + ' ))' +
           ' and ( articulo in ( select st.articulo' +
           ' from art_stocks_ubicaciones st' +
           ' where (( empresa      =' + REntorno.EmpresaStr + ') and' +
           ' ( canal        =' + REntorno.CanalStr + '  ) and' +
           ' ( id_ubicacion =' + IntToStr(xArticulosOID_UBICACION.AsInteger) + ') and' +
           ' ( existencias  > 0 ))))'
       else
         SQL.Text := 'select count(*) as contador from ver_articulos_ubicaciones where empresa =' +
           REntorno.EmpresaStr + ' and id_ubicacion =' + IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) +
           ' and ( articulo not in ( select tmp.articulo' +
           ' from tmp_traspaso_entre_ub tmp' +
           ' where tmp.entrada =' + IntToStr(REntorno.Entrada) +
           ' and tmp.empresa =' + REntorno.EmpresaStr +
           ' and tmp.canal =' + REntorno.CanalStr +
           ' and tmp.id_ubicacion =' + IntToStr(xArticulosOID_UBICACION.AsInteger) + ' ))' +
           ' and ( articulo in ( select ver.articulo' +
           ' from ver_articulos_ubicaciones ver' +
           ' where ver.id_ubicacion =' + IntToStr(xArticulosDID_UBICACION.AsInteger) + '))' +
           ' and ( articulo in ( select st.articulo' +
           ' from art_stocks_ubicaciones st' +
           ' where (( empresa      =' + REntorno.EmpresaStr + ') and' +
           ' ( canal        =' + REntorno.CanalStr + '  ) and' +
           ' ( id_ubicacion =' + IntToStr(xArticulosOID_UBICACION.AsInteger) + ') and' +
           ' ( existencias  > 0 ))))';
        }
        ExecQuery;
        if (FieldByName['CONTADOR'].AsInteger = 0) then
           raise Exception.Create(_('El artículo introducido no es correcto'))
        else
        begin
           Close;
           SQL.Text := 'SELECT ART.ID_A, ART.TITULO_LARGO AS TITULO FROM ART_ARTICULOS_UBICACIONES ARTUBI                    ' +
              'JOIN ART_ARTICULOS ART ON(ARTUBI.ID_A = ART.ID_A) JOIN ART_ALMACENES_UBICACIONES UBI ' +
              'ON (ARTUBI.ID_UBICACION = UBI.ID_UBICACION) WHERE ART.EMPRESA  =  ?EMPRESA    AND    ' +
              'UBI.ALMACEN  = ?ALMACEN AND ART.ARTICULO = ?ARTICULO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ALMACEN'].AsString := QMDetalleMovSimpleALMACEN.AsString;
           Params.ByName['ARTICULO'].AsString := Sender.AsString;
           ExecQuery;
           QMDetalleMovSimpleTITULO.AsString := FieldByName['TITULO'].AsString;
           QMDetalleMovSimpleID_A.AsInteger := FieldByName['ID_A'].AsInteger;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMovEntreUbicaciones.QMDetalleMovSimpleUNIDADESChange(Sender: TField);
begin
  if (QMDetalleMovSimpleUNIDADES.AsFloat < 0) then
     raise Exception.Create(_('Las unidades a traspasar han de ser mayores que 0'));

  if (QMDetalleMovSimpleUNIDADES.AsFloat > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT PESO,VOLUMEN_UNIT,DIAMETRO_UNIT FROM ART_ARTICULOS WHERE ID_A = ?ID_A';
           Params.ByName['ID_A'].AsInteger := QMDetalleMovSimpleID_A.AsInteger;
           ExecQuery;
           QMDetalleMovSimplePESO.AsFloat := FieldByName['PESO'].AsFloat * QMDetalleMovSimpleUNIDADES.AsFloat;
           QMDetalleMovSimpleVOLUMEN.AsFloat := FieldByName['VOLUMEN_UNIT'].AsFloat * QMDetalleMovSimpleUNIDADES.AsFloat;
           QMDetalleMovSimpleDIAMETRO.AsFloat := FieldByName['DIAMETRO_UNIT'].AsFloat * QMDetalleMovSimpleUNIDADES.AsFloat;
           if (QMDetalleMovSimpleD_ID_UBICACION.AsInteger <> 0) then
              if not (CompruebaCapacidad(QMDetalleMovSimpleD_ID_UBICACION.AsInteger, QMDetalleMovSimplePESO.AsFloat,
                 QMDetalleMovSimpleVOLUMEN.AsFloat, QMDetalleMovSimpleDIAMETRO.AsFloat)) then
                 ShowMessage(_('Las dimensiones exceden de las definidas en la ubicación'));
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMovEntreUbicaciones.QMDetalleMovSimpleNewRecord(DataSet: TDataSet);
begin
  QMDetalleMovSimpleUNIDADES.AsFloat := 0;
  QMDetalleMovSimplePESO.AsFloat := 0;
  QMDetalleMovSimpleVOLUMEN.AsFloat := 0;
  QMDetalleMovSimpleDIAMETRO.AsFloat := 0;
  QMDetalleMovSimpleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleMovSimpleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetalleMovSimpleALMACEN.AsString := AlmacenMovSimple;
  QMDetalleMovSimpleENTRADA.AsInteger := REntorno.Entrada;
  QMDetalleMovSimpleCANAL.AsInteger := REntorno.Canal;
  QMDetalleMovSimpleFecha.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMMovEntreUbicaciones.QMDetalleMovSimpleD_ID_UBICACIONChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CALLE, ESTANTERIA,REPISA,POSICION FROM ART_ALMACENES_UBICACIONES WHERE ID_UBICACION = ?ID_UBICACION';
        Params.ByName['ID_UBICACION'].AsInteger := QMDetalleMovSimpleD_ID_UBICACION.AsInteger;
        ExecQuery;
        QMDetalleMovSimpleD_CALLE.AsString := FieldByName['CALLE'].AsString;
        QMDetalleMovSimpleD_ESTANTERIA.AsString := FieldByName['ESTANTERIA'].AsString;
        QMDetalleMovSimpleD_REPISA.AsString := FieldByName['REPISA'].AsString;
        QMDetalleMovSimpleD_POSICION.AsString := FieldByName['POSICION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMovEntreUbicaciones.QMDetalleMovSimpleID_UBICACIONChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CALLE, ESTANTERIA,REPISA,POSICION FROM ART_ALMACENES_UBICACIONES WHERE ID_UBICACION = ?ID_UBICACION';
        Params.ByName['ID_UBICACION'].AsInteger := QMDetalleMovSimpleID_UBICACION.AsInteger;
        ExecQuery;
        QMDetalleMovSimpleCALLE.AsString := FieldByName['CALLE'].AsString;
        QMDetalleMovSimpleESTANTERIA.AsString := FieldByName['ESTANTERIA'].AsString;
        QMDetalleMovSimpleREPISA.AsString := FieldByName['REPISA'].AsString;
        QMDetalleMovSimplePOSICION.AsString := FieldByName['POSICION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMovEntreUbicaciones.QMDetalleMovSimpleALMACENChange(Sender: TField);
begin
  QMDetalleMovSimpleD_ALMACEN.AsString := QMDetalleMovSimpleALMACEN.AsString;
end;

{
procedure TDMMovEntreUnicaciones.CierraMovSimple;
begin
  QMDetalleMovSimple.Close;
end;

procedure TDMMovEntreUnicaciones.AbreMovSimple;
begin
  QMDetalleMovSimple.Open;
end;
}

procedure TDMMovEntreUbicaciones.AbreMovSimple;
begin
  with QMDetalleMovSimple do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMMovEntreUbicaciones.CierraMovSimple;
begin
  QMDetalleMovSimple.Close;
end;

procedure TDMMovEntreUbicaciones.QMDetalleBeforePost(DataSet: TDataSet);
begin
  if (ArticuloLoteable(DataSet.FieldByName('ARTICULO').AsString)) and (DataSet.FieldByName('ID_LOTE').AsInteger = 0) then
     raise Exception.Create(_('El artículo no tiene lote asignado'));

  if (DataSet.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(LINEA) AS LINEA FROM TMP_TRASPASO_ENTRE_UB WHERE ENTRADA = ?ENTRADA';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           DataSet.FieldByName('LINEA').AsInteger := FieldByName['LINEA'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMovEntreUbicaciones.QMDetalleMovSimpleTITULO_UBIC_ORIGENGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloUbicacion(QMDetalleMovSimpleID_UBICACION.AsInteger);
end;

procedure TDMMovEntreUbicaciones.QMDetalleMovSimpleTITULO_UBIC_DESTINOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloUbicacion(QMDetalleMovSimpleD_ID_UBICACION.AsInteger);
end;

procedure TDMMovEntreUbicaciones.Infolotes(origen: integer);
var
  IntroduceLotes : TFMIntroduceLotes;
begin
  {Modo original de G2k HY}
  if (origen = 0) then
  begin
     if (ArticuloLoteable(QMDetalleARTICULO.AsString)) then
     begin
        if (QMDetalle.State = dsBrowse) then
           QMDetalle.Edit;
        IntroduceLotes := TFMIntroduceLotes.Create(Self);
        try
           with IntroduceLotes do
           begin
              QMDetalleID_LOTE.AsInteger := AsignaArticulo('MEU', '',
                 QMDetalleARTICULO.AsString, QMDetalleEJERCICIO.AsInteger,
                 QMDetalleENTRADA.AsInteger,
                 QMDetalleLINEA.AsInteger, QMDetalleUNIDADES.AsFloat,
                 QMDetalleALMACEN.AsString,
                 QMDetalleALMACEN.AsString, QMDetalleCANAL.AsInteger,
                 QMDetalleCANAL.AsInteger, True, QMDetalleID_A.AsInteger,
                 0, 0, False);
           end;
        finally
           IntroduceLotes.Free;
        end;
     end;
  end;

  {Modo Grid}
  if (origen = 1) then
  begin
     if (ArticuloLoteable(QMDetalleMovSimpleARTICULO.AsString)) then
     begin
        if (QMDetalleMovSimple.State = dsBrowse) then
           QMDetalleMovSimple.Edit;
        IntroduceLotes := TFMIntroduceLotes.Create(Self);
        try
           with IntroduceLotes do
           begin
              QMDetalleMovSimpleID_LOTE.AsInteger := AsignaArticulo('MEU', '',
                 QMDetalleMovSimpleARTICULO.AsString, QMDetalleMovSimpleEJERCICIO.AsInteger,
                 QMDetalleMovSimpleENTRADA.AsInteger,
                 QMDetalleMovSimpleLINEA.AsInteger, QMDetalleMovSimpleUNIDADES.AsFloat,
                 QMDetalleMovSimpleALMACEN.AsString,
                 QMDetalleMovSimpleALMACEN.AsString, QMDetalleMovSimpleCANAL.AsInteger,
                 QMDetalleMovSimpleCANAL.AsInteger, True, QMDetalleMovSimpleID_A.AsInteger,
                 0, 0, False);
           end;
        finally
           IntroduceLotes.Free;
        end;
     end;
  end;
end;

procedure TDMMovEntreUbicaciones.QMDetalleLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameLote(QMDetalleID_LOTE.AsInteger);
end;

procedure TDMMovEntreUbicaciones.QMDetalleMovSimpleLOTEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameLote(QMDetalleMovSimpleID_LOTE.AsInteger);
end;

end.
