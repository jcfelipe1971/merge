unit UDMTallas_s;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBQuery, HYFIBQuery, FIBDataSet, FIBDataSetRO,
  Variants, Dialogs, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMTallas_s = class(TDataModule)
     QMver_detalles_gr_sd: TFIBTableSet;
     QMver_detalles_gr_sdREF_PROVEEDOR: TFIBStringField;
     QMver_detalles_gr_sdS_COLOR: TFIBStringField;
     QMver_detalles_gr_sdID_A_M_C: TIntegerField;
     QMver_detalles_gr_sdID_G_T: TIntegerField;
     QMver_detalles_gr_sdP_COMPRA: TFloatField;
     QMver_detalles_gr_sdP_VENTA: TFloatField;
     QMver_detalles_gr_sdTITM: TFIBStringField;
     QMver_detalles_gr_sdTITMC: TFIBStringField;
     QMver_detalles_gr_sdID_D_S_GR: TIntegerField;
     QMver_detalles_gr_sdT01: TFloatField;
     QMver_detalles_gr_sdT02: TFloatField;
     QMver_detalles_gr_sdT03: TFloatField;
     QMver_detalles_gr_sdT04: TFloatField;
     QMver_detalles_gr_sdT05: TFloatField;
     QMver_detalles_gr_sdT06: TFloatField;
     QMver_detalles_gr_sdT07: TFloatField;
     QMver_detalles_gr_sdT08: TFloatField;
     QMver_detalles_gr_sdT09: TFloatField;
     QMver_detalles_gr_sdT10: TFloatField;
     QMver_detalles_gr_sdT11: TFloatField;
     QMver_detalles_gr_sdT12: TFloatField;
     QMver_detalles_gr_sdT13: TFloatField;
     QMver_detalles_gr_sdT14: TFloatField;
     QMver_detalles_gr_sdT15: TFloatField;
     QMver_detalles_gr_sdT16: TFloatField;
     QMver_detalles_gr_sdT17: TFloatField;
     QMver_detalles_gr_sdT18: TFloatField;
     QMver_detalles_gr_sdT19: TFloatField;
     QMver_detalles_gr_sdT20: TFloatField;
     QMver_detalles_gr_sdT21: TFloatField;
     QMver_detalles_gr_sdT22: TFloatField;
     QMver_detalles_gr_sd_pv: TFIBTableSet;
     QMver_detalles_gr_sd_pvREF_PROVEEDOR: TFIBStringField;
     QMver_detalles_gr_sd_pvS_COLOR: TFIBStringField;
     QMver_detalles_gr_sd_pvID_A_M_C: TIntegerField;
     QMver_detalles_gr_sd_pvID_G_T: TIntegerField;
     QMver_detalles_gr_sd_pvP_COMPRA: TFloatField;
     QMver_detalles_gr_sd_pvP_VENTA: TFloatField;
     QMver_detalles_gr_sd_pvTITM: TFIBStringField;
     QMver_detalles_gr_sd_pvTITMC: TFIBStringField;
     QMver_detalles_gr_sd_pvID_D_S_GR: TIntegerField;
     QMver_detalles_gr_sd_pvP01: TFloatField;
     QMver_detalles_gr_sd_pvP02: TFloatField;
     QMver_detalles_gr_sd_pvP03: TFloatField;
     QMver_detalles_gr_sd_pvP04: TFloatField;
     QMver_detalles_gr_sd_pvP05: TFloatField;
     QMver_detalles_gr_sd_pvP06: TFloatField;
     QMver_detalles_gr_sd_pvP07: TFloatField;
     QMver_detalles_gr_sd_pvP08: TFloatField;
     QMver_detalles_gr_sd_pvP09: TFloatField;
     QMver_detalles_gr_sd_pvP10: TFloatField;
     QMver_detalles_gr_sd_pvP11: TFloatField;
     QMver_detalles_gr_sd_pvP12: TFloatField;
     QMver_detalles_gr_sd_pvP13: TFloatField;
     QMver_detalles_gr_sd_pvP14: TFloatField;
     QMver_detalles_gr_sd_pvP15: TFloatField;
     QMver_detalles_gr_sd_pvP16: TFloatField;
     QMver_detalles_gr_sd_pvP17: TFloatField;
     QMver_detalles_gr_sd_pvP18: TFloatField;
     QMver_detalles_gr_sd_pvP19: TFloatField;
     QMver_detalles_gr_sd_pvP20: TFloatField;
     QMver_detalles_gr_sd_pvP21: TFloatField;
     QMver_detalles_gr_sd_pvP22: TFloatField;
     QMver_detalles_gr_sdUTOTAL: TFloatField;
     QMver_detalles_gr_sdPTOTAL: TFloatField;
     QMver_detalles_gr_sdCAMBIA: TIntegerField;
     QMver_detalles_gr_sdID_S: TIntegerField;
     QMver_detalles_gr_sd_pvID_S: TIntegerField;
     QMver_detalles_gr_sdCAJA_EDI: TIntegerField;
     QMver_detalles_gr_sdTIPO_CAJA_EDI: TFIBStringField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure QMver_detalles_gr_sdAfterPost(DataSet: TDataSet);
     procedure QMver_detalles_gr_sdNewRecord(DataSet: TDataSet);
     procedure QMver_detalles_gr_sdBeforePost(DataSet: TDataSet);
     procedure QMver_detalles_gr_sdREF_PROVEEDORChange(Sender: TField);
     procedure QMver_detalles_gr_sdS_COLORChange(Sender: TField);
     procedure QMver_detalles_gr_sd_pvNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     function GetLineaNormal(Talla: string): integer;
     function GetLineaTallas(ID_DETALLES_S: integer; var Talla: string): integer;
     procedure RellenaTallasActivas;
  public
     { Public declarations }
     QMCabecera: TDataSet;
     InfoActualiza:
     procedure of object;
     procedure MascarasMonedas(LocalMascaraN, LocalMascaraL: string);
     procedure SetDS(ds: TDataSource);
     procedure GetDatosLineaRefProveedor(Ref_proveedor: string);
     procedure GetDatosLineaSColor(s_color: string);
     procedure Abrir;
     procedure LocateLineaNormal(DataSet: TDataSet; Talla: string);
     function LocateLineaTallas(ID_DETALLES_S: integer): string;
     procedure SyncTallas(Tipo: integer);
     function GetActive(Tipo: integer = -1): TFIBDataSet;
     procedure TraspasaPedidoAOrdenProd(ID_S: integer);
     procedure TraspasaAgrPedidoAOrdenProd(ID_S: integer);
     procedure UnidadesSegunKit(Kit: string; Cantidad: double);
     procedure InsertaModelo(RefProveedor: string);
  end;

var
  DMTallas_s : TDMTallas_s;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

{ TDMTallas_s }

procedure TDMTallas_s.QMver_detalles_gr_sdBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(QMVer_detalles_gr_Sd, 'SEQ_DETALLES_S_GR', 'ID_D_S_GR');
end;

procedure TDMTallas_s.QMver_detalles_gr_sdNewRecord(DataSet: TDataSet);
begin
  QMver_detalles_gr_sd['ID_S'] := QMCabecera['ID_S'];
  QMver_detalles_gr_sd['CAJA_EDI'] := 0;
  QMver_detalles_gr_sd['TIPO_CAJA_EDI'] := '';
end;

procedure TDMTallas_s.SetDS(ds: TDataSource);
begin
  QMver_detalles_gr_sd.DataSource := ds;
  QMver_detalles_gr_sd_pv.DataSource := ds;
  QMCabecera := ds.DataSet;
  QMver_detalles_gr_sd.Transaction := TFIBTableSet(ds.DataSet).Transaction;
  QMver_detalles_gr_sd_pv.Transaction := TFIBTableSet(ds.DataSet).Transaction;
  QMver_detalles_gr_sd.UpdateTransaction := TFIBTableSet(ds.DataSet).UpdateTransaction;
  QMver_detalles_gr_sd_pv.UpdateTransaction := TFIBTableSet(ds.DataSet).UpdateTransaction;
end;

procedure TDMTallas_s.QMver_detalles_gr_sdAfterPost(DataSet: TDataSet);
begin
  // DMMain.Graba;
  TFIBDataSet(DataSet).Transaction.CommitRetaining;
  // DataSet.Refresh;
  if Assigned(InfoActualiza) then
     InfoActualiza;
end;

procedure TDMTallas_s.GetDatosLineaRefProveedor(Ref_proveedor: string);
var
  aux, tmp : double;
begin
  if Ref_proveedor = '' then
     Ref_proveedor := QMver_detalles_gr_sdRef_proveedor.AsString;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_A_M, ID_G_T, P_COMPRA, P_VENTA, TITULO ');
        SQL.Add(' FROM ART_ARTICULOS_MODELOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' REF_PROVEEDOR = :REF_PROVEEDOR ');
        Params.ByName['REF_PROVEEDOR'].AsString := Ref_Proveedor;
        ExecQuery;

        QMver_detalles_gr_sd['ID_G_T'] := FieldByName['ID_G_T'].Value;
        QMver_detalles_gr_sd['TITMC'] := FieldByName['TITULO'].Value;

        DMMain.Cambios(REntorno.MonedaEmpresa, QMCabecera['MONEDA'], Now, FieldByName['P_COMPRA'].AsDouble, aux, tmp);
        QMver_detalles_gr_sd['P_COMPRA'] := tmp;

        // Establece el precio segun el modelo.
        // Cuando se modifique el color tomará el precio que corresponda segun tarifa
        // De todos modos el precio final se establece por talla
        DMMain.Cambios(REntorno.MonedaEmpresa, QMCabecera['MONEDA'], Now, FieldByName['P_VENTA'].AsDouble, aux, tmp);
        QMver_detalles_gr_sd['P_VENTA'] := tmp;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTallas_s.GetDatosLineaSColor(s_color: string);
var
  aux, tmp : double;
begin
  if s_color = '' then
     s_color := QMver_detalles_gr_sdS_COLOR.AsString;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 AAMC.ID_A_M_C, AAMC.TITULO, TAR.PRECIO_VENTA FROM ART_ARTICULOS_MOD_COLOR AAMC ');
        SQL.Add(' JOIN ART_ARTICULOS_MODELOS AAM  ');
        SQL.Add(' ON AAM.ID_A_M = AAMC.ID_A_M ');
        SQL.Add(' LEFT JOIN ART_ARTICULOS_M_C_TALLAS MCT ');
        SQL.Add(' ON AAMC.ID_A_M_C = MCT.ID_A_M_C ');
        SQL.Add(' LEFT JOIN ART_TARIFAS_PRECIOS TAR ');
        SQL.Add(' ON TAR.ARTICULO = MCT.ARTICULO ');
        SQL.Add(' WHERE ');
        SQL.Add(' AAM.REF_PROVEEDOR = :REF_PROVEEDOR AND ');
        SQL.Add(' AAMC.S_COLOR = :S_COLOR AND ');
        SQL.Add(' TAR.EMPRESA = :EMPRESA AND ');
        SQL.Add(' TAR.TARIFA = :TARIFA ');
        Params.ByName['REF_PROVEEDOR'].AsString := QMver_detalles_gr_sdREF_PROVEEDOR.AsString;
        Params.ByName['S_COLOR'].AsString := s_color;
        Params.ByName['EMPRESA'].AsString := QMCabecera['EMPRESA'];
        Params.ByName['TARIFA'].AsString := QMCabecera['TARIFA'];
        ExecQuery;
        QMver_detalles_gr_sd['ID_A_M_C'] := FieldByName['ID_A_M_C'].Value;
        QMver_detalles_gr_sd['TITMC'] := FieldByName['TITULO'].Value;

        // Toma el precio de la tarifa de ventas. Puede ser diferente del precio segun el modelo
        // De todos modos el precio final se establece por talla
        DMMain.Cambios(REntorno.MonedaEmpresa, QMCabecera['MONEDA'], Now, FieldByName['PRECIO_VENTA'].AsDouble, aux, tmp);
        QMver_detalles_gr_sd['P_VENTA'] := tmp;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RellenaTallasActivas;
end;

procedure TDMTallas_s.MascarasMonedas(LocalMascaraN, LocalMascaraL: string);
var
  i : integer;
  f : TField;
begin
  QMver_detalles_gr_sdP_COMPRA.DisplayFormat := LocalMascaraN;
  QMver_detalles_gr_sdP_VENTA.DisplayFormat := LocalMascaraN;
  for i := 1 to 22 do
  begin
     f := QMver_detalles_gr_sd_pv.FindField(Format('P%.2d', [i]));
     if (f <> nil) and (f.DataType = ftFloat) then
        tFloatField(f).DisplayFormat := LocalMascaraN;
  end;
end;

function TDMTallas_s.GetLineaNormal(Talla: string): integer;
var
  aux : TFIBDataSet;
begin
  /// Devuelve la linea de GES_DETALLES_S en donde esta la talla.

  Result := 0;
  Aux := GetActive;
  if (Aux <> nil) and (Aux.RecordCount > 0) and (Aux['ID_A_M_C'] <> null) and (Aux['ID_D_S_GR'] <> null) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE XGET_NORMAL_S(:ID_A_M_C, :ID_D_S_GR, :COD_TALLA)';
           Params.ByName['ID_A_M_C'].AsInteger := Aux['ID_A_M_C'];
           Params.ByName['ID_D_S_GR'].AsInteger := Aux['ID_D_S_GR'];
           Params.ByName['COD_TALLA'].AsString := Talla;
           ExecQuery;
           Result := FieldByName['LINEA'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMTallas_s.GetLineaTallas(ID_DETALLES_S: integer; var Talla: string): integer;
begin
  /// Devuelve ID y COD_TALLA del articulo de GES_DETALLES_S

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE XGET_GRUPO_S(:ID_DETALLES_S)';
        Params.ByName['ID_DETALLES_S'].AsInteger := ID_DETALLES_S;
        ExecQuery;
        Result := FieldByName['ID_D_S_GR'].AsInteger;
        Talla := FieldByName['COD_TALLA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTallas_s.Abrir;
begin
  if (QMCabecera.Active) then
     if (QMCabecera.FieldByName('ID_S').AsInteger > 0) then
        QMver_detalles_gr_sd.Open;
end;

function TDMTallas_s.LocateLineaTallas(ID_DETALLES_S: integer): string;
var
  ID_D_S_GR : integer;
  ds : TFIBDataSet;
begin
  ID_D_S_GR := GetLineaTallas(ID_DETALLES_S, Result);
  if (id_d_s_gr <> 0) then
  begin
     ds := GetActive;
     with ds do
     begin
        if (ds <> nil) then
        begin
           if (not ds.Active) then
              Abrir;

           DisableControls;
           try
              First;
              ds.Locate('ID_D_S_GR', ID_D_S_GR, []);
           finally
              EnableControls;
           end;
        end;
     end;
  end;
end;

procedure TDMTallas_s.LocateLineaNormal(DataSet: TDataSet; Talla: string);
var
  Linea : integer;
begin
  Linea := GetLineaNormal(Copy(Talla, 2, 2));
  with DataSet do
  begin
     DisableControls;
     try
        First;
        if (Linea <> 0) then
           Locate('LINEA', Linea, []);
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMTallas_s.QMver_detalles_gr_sdREF_PROVEEDORChange(Sender: TField);
begin
  GetDatosLineaRefProveedor(Sender.AsString);
end;

procedure TDMTallas_s.QMver_detalles_gr_sdS_COLORChange(Sender: TField);
begin
  GetDatosLineaSColor(Sender.AsString);
end;

procedure TDMTallas_s.SyncTallas(Tipo: integer);
begin
  GetActive(Tipo).Locate('ID_D_S_GR', GetActive(abs(Tipo - 1))['ID_D_S_GR'], []);
end;

function TDMTallas_s.GetActive(Tipo: integer = -1): TFIBDataSet;
begin
  Result := nil;

  case Tipo of
     0: // Precios -> Tallas
        Result := QMver_detalles_gr_sd;
     1: // Tallas  -> Precios
        Result := QMver_detalles_gr_sd_pv;
  end;

  if Result = nil then
  begin
     if QMver_detalles_gr_sd.Active then
        Result := QMver_detalles_gr_sd;
     if QMver_detalles_gr_sd_pv.Active then
        Result := QMver_detalles_gr_sd_pv;
  end;

  // Si no encuentro nada que devolver, devuelvo el DataSet principal
  if Result = nil then
     Result := QMver_detalles_gr_sd;
end;

procedure TDMTallas_s.QMver_detalles_gr_sd_pvNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMTallas_s.TraspasaPedidoAOrdenProd(ID_S: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_PEDIDO_A_TMP_ORD_KRI (:ID_S)';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTallas_s.TraspasaAgrPedidoAOrdenProd(ID_S: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASO_AGRPED_A_TMP_ORD_KRI (:ID_S)';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTallas_s.UnidadesSegunKit(Kit: string; Cantidad: double);
begin
  // Me aseguro de que estemos editando la linea
  if (not (QMver_detalles_gr_sd.State in [dsEdit, dsInsert])) then
     QMver_detalles_gr_sd.Edit;

  with TFIBDataSet.Create(nil) do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT A.COD_TALLA, T.UNIDADES FROM ART_KIT K ');
           SelectSQL.Add(' JOIN ART_KIT_TALLAS T ON K.ID_A_K = T.ID_A_K ');
           SelectSQL.Add(' JOIN ART_TALLAS A ON T.ID_A_T = A.ID_A_T ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' K.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' K.KIT = :KIT ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['KIT'].AsString := Kit;
           Open;

           // Asigno unidades a cada talla
           while not EOF do
           begin
              if (StrToIntDef(FieldByName('COD_TALLA').AsString, 0) <= 22) then
              begin
                 QMver_detalles_gr_sd.FieldByName('T' + FieldByName('COD_TALLA').AsString).AsFloat := (FieldByName('UNIDADES').AsFloat * Cantidad);
              end;
              Next;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  // Guardo los datos
  if (QMver_detalles_gr_sd.State in [dsEdit, dsInsert]) then
     QMver_detalles_gr_sd.Post;
end;

procedure TDMTallas_s.DataModuleCreate(Sender: TObject);
begin
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMTallas_s.RellenaTallasActivas;
begin
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT T.COD_TALLA FROM ART_ARTICULOS_MOD_COLOR AMC ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_MODELOS AAM ON AMC.ID_A_M = AAM.ID_A_M ');
           SelectSQL.Add(' JOIN ART_TALLAS T ON AAM.ID_G_T = T.ID_G_T ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON AMCT.ID_A_M_C = AMC.ID_A_M_C AND T.ID_A_T = AMCT.ID_A_T ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' AMC.ID_A_M_C = :ID_A_M_C ');
           Params.ByName['ID_A_M_C'].AsString := QMver_detalles_gr_sd['ID_A_M_C'];
           Open;
           while not EOF do
           begin
              if (StrToIntDef(FieldByName('COD_TALLA').AsString, 0) <= 22) then
              begin
                 if (QMver_detalles_gr_sd['T' + FieldByName('COD_TALLA').AsString] = Null) then
                    QMver_detalles_gr_sd['T' + FieldByName('COD_TALLA').AsString] := 0;
              end;
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMTallas_s.InsertaModelo(RefProveedor: string);
begin
  with TFIBDataSet.Create(nil) do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT M.ID_A_M, M.REF_PROVEEDOR, MC.ID_A_M_C, MC.S_COLOR ');
           SelectSQL.Add(' FROM ART_ARTICULOS_MODELOS M ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR MC ON M.ID_A_M = MC.ID_A_M ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' M.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' M.REF_PROVEEDOR = :REF_PROVEEDOR ');
           SelectSQL.Add(' ORDER BY M.REF_PROVEEDOR, MC.S_COLOR ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['REF_PROVEEDOR'].AsString := RefProveedor;
           Open;

           // Asigno unidades a cada talla
           while not EOF do
           begin
              QMver_detalles_gr_sd.Insert;
              QMver_detalles_gr_sdREF_PROVEEDOR.AsString := RefProveedor;
              QMver_detalles_gr_sdS_COLOR.AsString := FieldByName('S_COLOR').AsString;
              QMver_detalles_gr_sd.Post;

              Next;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

end.
