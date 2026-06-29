unit UDMTarifaPArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDatabase, UFIBModificados, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery, UFParada, UFBusca;

type
  TDMTarifaPArticulo = class(TDataModule)
     QMTarifasArticulo: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMTarifasArticulo: TDataSource;
     QMTarifasArticuloEMPRESA: TIntegerField;
     QMTarifasArticuloTARIFA: TFIBStringField;
     QMTarifasArticuloARTICULO: TFIBStringField;
     QMTarifasArticuloTITULO_ARTICULO: TFIBStringField;
     QMTarifasArticuloLINEA: TIntegerField;
     QMTarifasArticuloCALCULO: TIntegerField;
     QMTarifasArticuloTITULO_CALCULO: TFIBStringField;
     QMTarifasArticuloUNID_MINIMAS: TFloatField;
     QMTarifasArticuloUNID_MAXIMAS: TFloatField;
     QMTarifasArticuloPRECIO_BASE: TFloatField;
     QMTarifasArticuloPRECIO_VENTA: TFloatField;
     QMTarifasArticuloMARGEN_PC: TFloatField;
     QMTarifasArticuloMARGEN_PV: TFloatField;
     QMTarifasArticuloCOMISION: TFloatField;
     QMTarifasArticuloBLOQUEADO: TIntegerField;
     QMTarifasArticuloFAMILIA: TFIBStringField;
     QMTarifasArticuloMONEDA: TFIBStringField;
     QMTarifasArticuloPRECIO_BASE_CANAL: TFloatField;
     QMTarifasArticuloCOMISION_CANAL: TFloatField;
     QMTarifasArticuloPRECIO_VENTA_CANAL: TFloatField;
     QMTarifasArticuloACTIVA: TIntegerField;
     QMTarifasArticuloMARGEN: TFloatField;
     QMTarifasArticuloID_A: TIntegerField;
     TUpdate: THYTransaction;
     QMTarifasArticuloBARRAS: TFIBStringField;
     QMTarifasArticuloSUBFAMILIA: TFIBStringField;
     QMTarifasArticuloDESCUENTO_COMPRA: TFloatField;
     QMTarifasArticuloPRECIO_COMPRA: TFloatField;
     QMTarifasArticuloPRECIO_COSTE: TFloatField;
     QMTarifasArticuloDESCUENTO_COMPRA_2: TFloatField;
     QMTarifasArticuloDESCUENTO_COMPRA_3: TFloatField;
     QMTarifasArticuloCODIGO_ARTICULO_TARIFA: TFIBStringField;
     QMTarifasArticuloPRECIO_SIN_IVA: TFloatField;
     QMTarifasArticuloPRECIO_CON_IVA: TFloatField;
     xTipoIva: TFIBDataSetRO;
     xTipoIvaP_IVA: TFloatField;
     xTipoIvaP_RECARGO: TFloatField;
     xTipoIvaTITULO: TFIBStringField;
     DSxTipoIva: TDataSource;
     QMTarifasArticuloIVA_INCLUIDO: TIntegerField;
     QMTarifasArticuloTIPO_IVA: TIntegerField;
     QMTarifasArticuloP_IVA: TFloatField;
     QMTarifasArticuloEJERCICIO: TIntegerField;
     QMTarifasArticuloCANAL: TIntegerField;
     QMTarifasArticuloFABRICANTE: TIntegerField;
     QMTarifasArticuloDISPONIBILIDAD: TIntegerField;
     QMTarifasArticuloBAJA: TIntegerField;
     QMTarifasArticuloALFA_1: TFIBStringField;
     QMTarifasArticuloALFA_2: TFIBStringField;
     QMTarifasArticuloALFA_3: TFIBStringField;
     QMTarifasArticuloALFA_4: TFIBStringField;
     QMTarifasArticuloALFA_5: TFIBStringField;
     QMTarifasArticuloALFA_6: TFIBStringField;
     QMTarifasArticuloALFA_7: TFIBStringField;
     QMTarifasArticuloALFA_8: TFIBStringField;
     QMTarifasArticuloBLISTER: TFIBStringField;
     QMTarifasArticuloTITULO_BLISTER: TFIBStringField;
     QMTarifasArticuloP_COSTE_BLISTER: TFloatField;
     procedure DMTarifaPArticuloCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMTarifasArticuloNewRecord(DataSet: TDataSet);
     procedure QMTarifasArticuloPRECIO_BASE_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMTarifasArticuloCOMISION_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMTarifasArticuloCalcFields(DataSet: TDataSet);
     procedure QMTarifasArticuloBeforeClose(DataSet: TDataSet);
     procedure QMTarifasArticuloAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraVista(Tarifa, Familia, Subfamilia, Articulo: string; Baja: boolean);
     procedure EstablecerBloqueo(Bloqueo: integer; Tarifa, Familia, Subfamilia, Articulo: string);
     procedure BusquedaCompleja(Tarifa: string);
     procedure CambioMargen(Tarifa: string; Margen: double; Modo: integer);
     procedure DatosStocks(var Articulo, Almacen: string);
     procedure CopiaTarifa(TarifaOrigen: string; Margen: double);
  end;

var
  DMTarifaPArticulo : TDMTarifaPArticulo;

implementation

uses UDMMain, UEntorno, UUtiles, UParam;

{$R *.DFM}

procedure TDMTarifaPArticulo.DMTarifaPArticuloCreate(Sender: TObject);
var
  i : integer;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Máscaras
  AsignaDisplayFormat(QMTarifasArticulo, MascaraN, MascaraI, ShortDateFormat);
  QMTarifasArticuloMARGEN.DisplayFormat := MascaraP;
  QMTarifasArticuloMARGEN_PC.DisplayFormat := MascaraP;
  QMTarifasArticuloMARGEN_PV.DisplayFormat := MascaraP;
  QMTarifasArticuloDESCUENTO_COMPRA.DisplayFormat := MascaraP;
  QMTarifasArticuloDESCUENTO_COMPRA_2.DisplayFormat := MascaraP;
  QMTarifasArticuloDESCUENTO_COMPRA_3.DisplayFormat := MascaraP;
  QMTarifasArticuloP_IVA.DisplayFormat := MascaraP;

  AsignaDisplayFormat(xTipoIva, MascaraN, MascaraI, ShortDateFormat);
  xTipoIvaP_IVA.DisplayFormat := MascaraP;
  xTipoIvaP_RECARGO.DisplayFormat := MascaraP;

  // Se establece descripcion de Campos ALFA_n
  for i := 1 to 8 do
     QMTarifasArticulo.FieldByName(Format('ALFA_%d', [i])).DisplayLabel := LeeParametro(format('ARTDESC%3.3d', [i]));

  DMMain.FiltraTabla(QMTarifasArticulo, '11100', False);
end;

procedure TDMTarifaPArticulo.FiltraVista(Tarifa, Familia, Subfamilia, Articulo: string; Baja: boolean);
var
  MascaraMoneda : string;
begin
  with QMTarifasArticulo do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_ART_TARIFAS_PRECIOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');
     SelectSQL.Add(' AND EJERCICIO = ?EJERCICIO ');
     SelectSQL.Add(' AND CANAL = ?CANAL ');
     SelectSQL.Add(' AND TARIFA = ?TARIFA ');
     SelectSQL.Add(' AND FAMILIA <> ?FAM_SISTEMA ');

     if (Familia > '') then
     begin
        SelectSQL.Add(' AND FAMILIA = ?FAMILIA ');
        if (SubFamilia > '') then
        begin
           SelectSQL.Add(' AND SUBFAMILIA = ?SUBFAMILIA ');
        end;
     end;
     if (Articulo > '') then
     begin
        SelectSQL.Add(' AND ( ');
        SelectSQL.Add(' (ARTICULO LIKE ''%' + Articulo + '%'') OR ');
        SelectSQL.Add(' (UPPER(TITULO_ARTICULO) LIKE ''%' + UpperCase(Articulo) + '%'') OR ');
        SelectSQL.Add(' (ID_A IN (SELECT ID_A FROM ART_ARTICULOS_BARRAS WHERE BARRAS = ''' + Articulo + '''))) ');
     end;
     if (not Baja) then
        SelectSQL.Add(' AND BAJA = 0 ');

     SelectSQL.Add(' ORDER BY ARTICULO, UNID_MINIMAS ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TARIFA'].AsString := Tarifa;
     Params.ByName['FAM_SISTEMA'].AsString := REntorno.FamSistema;
     if (Familia > '') then
     begin
        Params.ByName['FAMILIA'].AsString := Familia;
        if (SubFamilia > '') then
        begin
           Params.ByName['SUBFAMILIA'].AsString := Subfamilia;
        end;
     end;

     Open;

     MascaraMoneda := DMMain.MascaraMoneda(QMTarifasArticuloMONEDA.AsString, 0);

     QMTarifasArticuloPRECIO_VENTA.DisplayFormat := MascaraMoneda;
     QMTarifasArticuloCOMISION.DisplayFormat := MascaraMoneda;
     QMTarifasArticuloPRECIO_VENTA.DisplayFormat := MascaraMoneda;
     QMTarifasArticuloPRECIO_BASE.DisplayFormat := MascaraMoneda;
     QMTarifasArticuloPRECIO_COMPRA.DisplayFormat := MascaraMoneda;
     QMTarifasArticuloPRECIO_COSTE.DisplayFormat := MascaraMoneda;
     QMTarifasArticuloPRECIO_CON_IVA.DisplayFormat := MascaraMoneda;
     QMTarifasArticuloPRECIO_SIN_IVA.DisplayFormat := MascaraMoneda;
     QMTarifasArticuloP_COSTE_BLISTER.DisplayFormat := MascaraMoneda;
  end;
end;

procedure TDMTarifaPArticulo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

/// Bloquea/Desbloquea los que esten seleccionados en el DataSet (Filtro incluido)
/// [Bloquea]    si Bloqueo = 1
/// [Desbloquea] si Bloqueo = 0
procedure TDMTarifaPArticulo.EstablecerBloqueo(Bloqueo: integer; Tarifa, Familia, Subfamilia, Articulo: string);
var
  Where : string;
begin
  // Obtengo WHERE de la actual seleccion
  with QMTarifasArticulo do
  begin
     Where := Copy(SelectSQL.Text, Pos('WHERE', UpperCase(SelectSQL.Text)), Length(SelectSQL.Text));
     // Quitar ORDER BY
     if (Pos('ORDER', UpperCase(Where)) > 0) then
        Where := Copy(Where, 1, Pos('ORDER', UpperCase(Where)) - 1);
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_ART_TARIFAS_PRECIOS ');
        SQL.Add(' SET BLOQUEADO = ?BLOQUEO ');
        SQL.Add(Where);

        Params.ByName['BLOQUEO'].AsInteger := Bloqueo;
        Params.ByName['TARIFA'].AsString := QMTarifasArticulo.FieldByName('TARIFA').AsString;
        if (Params.ByName['FAM_SISTEMA'] <> nil) then
           Params.ByName['FAM_SISTEMA'].AsString := REntorno.FamSistema;
        if (Params.ByName['EMPRESA'] <> nil) then
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        if (Params.ByName['EJERCICIO'] <> nil) then
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        if (Params.ByName['CANAL'] <> nil) then
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;

        if (Familia > '') then
        begin
           Params.ByName['FAMILIA'].AsString := Familia;
           if (SubFamilia > '') then
           begin
              Params.ByName['SUBFAMILIA'].AsString := SubFamilia;
           end;
        end;

        if (Articulo > '') then
        begin
           Params.ByName['ARTICULO'].AsString := Articulo;
        end;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Refrescamos Dataset
  QMTarifasArticulo.Close;
  QMTarifasArticulo.Open;
end;

procedure TDMTarifaPArticulo.QMTarifasArticuloNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMTarifaPArticulo.QMTarifasArticuloPRECIO_BASE_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMTarifasArticuloMONEDA.AsString, 0),
     QMTarifasArticuloPRECIO_BASE.AsFloat);
end;

procedure TDMTarifaPArticulo.QMTarifasArticuloCOMISION_CANALGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMTarifasArticuloMONEDA.AsString, 0),
     QMTarifasArticuloCOMISION.AsFloat);
end;

procedure TDMTarifaPArticulo.CambioMargen(Tarifa: string; Margen: double; Modo: integer);
var
  b : TBookmark;
begin
  /// Cambia el margen o incrementa el precio en un porcentaje en los articulos filtrados.
  with QMTarifasArticulo do
  begin
     b := GetBookmark;
     try
        DisableControls;
        First;
        while not EOF do
        begin
           with THYFIBQuery.Create(Self) do
           begin
              try
                 Close;
                 Database := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE A_ART_CAMBIA_MARGEN(?EMPRESA, ?TARIFA, ?ARTICULO, ?LINEA, ?MARGEN, ?MODO, ?ID_A)';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['TARIFA'].AsString := Tarifa;
                 Params.ByName['ARTICULO'].AsString := QMTarifasArticulo.FieldByName('ARTICULO').AsString;
                 Params.ByName['LINEA'].AsInteger := QMTarifasArticulo.FieldByName('LINEA').AsInteger;
                 Params.ByName['MARGEN'].AsFloat := Margen;
                 Params.ByName['MODO'].AsInteger := Modo;
                 Params.ByName['ID_A'].AsInteger := QMTarifasArticulo.FieldByName('ID_A').AsInteger;
                 try
                    ExecQuery;
                 except
                    on E: Exception do
                       ShowMessage(Format(_('No se pudo realizar la operacion en el articulo %s'), [QMTarifasArticulo.FieldByName('ARTICULO').AsString]) + #13#10 + E.Message);
                 end;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
           Next;
        end;

        Close;
        Open;

        try
           GotoBookmark(b);
        except
           First;
        end;
     finally
        EnableControls;
        FreeBookmark(b);
     end;
  end;
end;

procedure TDMTarifaPArticulo.BusquedaCompleja(Tarifa: string);
var
  Orden : string;
begin
  if (Tarifa <> '') then
     if (TFBusca.Create(Self).SeleccionaBusqueda(QMTarifasArticulo,
        '11100', False) <> mrCancel) then
     begin
        with QMTarifasArticulo do
        begin
           Orden := OrdenadoPor;
           Ordenar('');
           if SelectSQL.Count <> 0 then
              SelectSQL.Add(' AND FAMILIA <> :FAMILIA AND TARIFA = :TARIFA ');
           Ordenar(Orden);
           // DMMain.FiltraTabla (QMTarifasArticulo,'10000',False);
           Params.ByName['TARIFA'].AsString := Tarifa;
           Params.ByName['FAMILIA'].AsString := REntorno.FamSistema;
           Open;
        end;
     end;
end;

procedure TDMTarifaPArticulo.DatosStocks(var Articulo, Almacen: string);
begin
  Articulo := QMTarifasArticuloARTICULO.AsString;
  Almacen := REntorno.AlmacenDefecto;
end;

procedure TDMTarifaPArticulo.CopiaTarifa(TarifaOrigen: string; Margen: double);
var
  b : TBookmark;
  PrecioVenta : double;
  Bloqueado : integer;
begin
  /// Copia en los articulos filtrados el precio de una tarifa aplicando un margen.

  with QMTarifasArticulo do
  begin
     b := GetBookmark;
     try
        DisableControls;
        First;
        while not EOF do
        begin
           with THYFIBQuery.Create(Self) do
           begin
              try
                 Close;
                 Database := DMMain.DataBase;
                 SQL.Clear;
                 SQL.Add('SELECT PRECIO_VENTA, BLOQUEADO FROM ART_TARIFAS_PRECIOS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA ');
                 SQL.Add(' AND TARIFA    = :TARIFA ');
                 SQL.Add(' AND ARTICULO  = :ARTICULO');
                 SQL.Add(' AND LINEA     = :LINEA');
                 Params.ByName['EMPRESA'].AsInteger := QMTarifasArticulo.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['TARIFA'].AsString := TarifaOrigen;
                 Params.ByName['ARTICULO'].AsString := QMTarifasArticulo.FieldByName('ARTICULO').AsString;
                 Params.ByName['LINEA'].AsInteger := QMTarifasArticulo.FieldByName('LINEA').AsInteger;
                 ExecQuery;

                 Bloqueado := FieldByName['BLOQUEADO'].AsInteger;
                 PrecioVenta := FieldByName['PRECIO_VENTA'].AsFloat;
                 PrecioVenta := PrecioVenta + ((PrecioVenta * Margen) / 100);

                 FreeHandle;
              finally
                 Free;
              end;
           end;

           with THYFIBQuery.Create(Self) do
           begin
              try
                 Close;
                 Database := DMMain.DataBase;
                 SQL.Clear;
                 SQL.Add(' UPDATE ART_TARIFAS_PRECIOS ');
                 SQL.Add(' SET ');
                 SQL.Add(' PRECIO_VENTA = :PRECIO_VENTA,');
                 SQL.Add(' BLOQUEADO = :BLOQUEADO');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA ');
                 SQL.Add(' AND TARIFA = :TARIFA ');
                 SQL.Add(' AND ARTICULO = :ARTICULO ');
                 SQL.Add(' AND LINEA = :LINEA ');
                 Params.ByName['PRECIO_VENTA'].AsFloat := PrecioVenta;
                 Params.ByName['BLOQUEADO'].AsInteger := Bloqueado;
                 Params.ByName['EMPRESA'].AsInteger := QMTarifasArticulo.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['TARIFA'].AsString := QMTarifasArticulo.FieldByName('TARIFA').AsString;
                 Params.ByName['ARTICULO'].AsString := QMTarifasArticulo.FieldByName('ARTICULO').AsString;
                 Params.ByName['LINEA'].AsInteger := QMTarifasArticulo.FieldByName('LINEA').AsInteger;
                 ExecQuery;

                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Next;
        end;

        // Refresca la tabla
        Close;
        Open;

        try
           GotoBookmark(b);
        except
           First;
        end;
     finally
        EnableControls;
        FreeBookmark(b);
     end;
  end;
end;

procedure TDMTarifaPArticulo.QMTarifasArticuloCalcFields(DataSet: TDataSet);
begin
  if (QMTarifasArticuloIVA_INCLUIDO.AsInteger = 1) then
  begin
     QMTarifasArticuloPRECIO_CON_IVA.AsFloat := QMTarifasArticuloPRECIO_VENTA.AsFloat;
     QMTarifasArticuloPRECIO_SIN_IVA.AsFloat := QMTarifasArticuloPRECIO_VENTA.AsFloat / (QMTarifasArticuloP_IVA.AsFloat / 100 + 1); // TotalConIva/(%IVA/100+1)
  end
  else
  begin
     QMTarifasArticuloPRECIO_SIN_IVA.AsFloat := QMTarifasArticuloPRECIO_VENTA.AsFloat;
     QMTarifasArticuloPRECIO_CON_IVA.AsFloat := QMTarifasArticuloPRECIO_VENTA.AsFloat + (QMTarifasArticuloPRECIO_VENTA.AsFloat * (QMTarifasArticuloP_IVA.AsFloat / 100)); //PrecioSinIVA+(PrecioSinIVA*(%IVA/100))
  end;
end;

procedure TDMTarifaPArticulo.QMTarifasArticuloBeforeClose(DataSet: TDataSet);
begin
  xTipoIva.Close;
end;

procedure TDMTarifaPArticulo.QMTarifasArticuloAfterOpen(DataSet: TDataSet);
begin
  with xTipoIva do
  begin
     Close;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Open;
  end;
end;

end.
