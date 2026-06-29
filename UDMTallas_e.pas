unit UDMTallas_e;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDataSetRO, DB, FIBDataSet, FIBQuery, HYFIBQuery, Variants,
  FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMTallas_e = class(TDataModule)
     QMver_detalles_gr_ed: TFIBTableSet;
     QMver_detalles_gr_edS_COLOR: TFIBStringField;
     QMver_detalles_gr_edID_E: TIntegerField;
     QMver_detalles_gr_edID_A_M_C: TIntegerField;
     QMver_detalles_gr_edID_G_T: TIntegerField;
     QMver_detalles_gr_edP_COMPRA: TFloatField;
     QMver_detalles_gr_edP_VENTA: TFloatField;
     QMver_detalles_gr_edTITM: TFIBStringField;
     QMver_detalles_gr_edTITMC: TFIBStringField;
     QMver_detalles_gr_edID_D_E_GR: TIntegerField;
     QMver_detalles_gr_edT01: TFloatField;
     QMver_detalles_gr_edT02: TFloatField;
     QMver_detalles_gr_edT03: TFloatField;
     QMver_detalles_gr_edT04: TFloatField;
     QMver_detalles_gr_edT05: TFloatField;
     QMver_detalles_gr_edT06: TFloatField;
     QMver_detalles_gr_edT07: TFloatField;
     QMver_detalles_gr_edT08: TFloatField;
     QMver_detalles_gr_edT09: TFloatField;
     QMver_detalles_gr_edT10: TFloatField;
     QMver_detalles_gr_edT11: TFloatField;
     QMver_detalles_gr_edT12: TFloatField;
     QMver_detalles_gr_edT13: TFloatField;
     QMver_detalles_gr_edT14: TFloatField;
     QMver_detalles_gr_edT15: TFloatField;
     QMver_detalles_gr_edT16: TFloatField;
     QMver_detalles_gr_edT17: TFloatField;
     QMver_detalles_gr_edT18: TFloatField;
     QMver_detalles_gr_edT19: TFloatField;
     QMver_detalles_gr_edT20: TFloatField;
     QMver_detalles_gr_edT21: TFloatField;
     QMver_detalles_gr_edT22: TFloatField;
     QMver_detalles_gr_edREF_PROVEEDOR: TFIBStringField;
     QMver_detalles_gr_ed_pc: TFIBTableSet;
     QMver_detalles_gr_ed_pcREF_PROVEEDOR: TFIBStringField;
     QMver_detalles_gr_ed_pcS_COLOR: TFIBStringField;
     QMver_detalles_gr_ed_pcID_A_M_C: TIntegerField;
     QMver_detalles_gr_ed_pcID_G_T: TIntegerField;
     QMver_detalles_gr_ed_pcP_COMPRA: TFloatField;
     QMver_detalles_gr_ed_pcP_VENTA: TFloatField;
     QMver_detalles_gr_ed_pcTITM: TFIBStringField;
     QMver_detalles_gr_ed_pcTITMC: TFIBStringField;
     QMver_detalles_gr_ed_pcP01: TFloatField;
     QMver_detalles_gr_ed_pcP02: TFloatField;
     QMver_detalles_gr_ed_pcP03: TFloatField;
     QMver_detalles_gr_ed_pcP04: TFloatField;
     QMver_detalles_gr_ed_pcP05: TFloatField;
     QMver_detalles_gr_ed_pcP06: TFloatField;
     QMver_detalles_gr_ed_pcP07: TFloatField;
     QMver_detalles_gr_ed_pcP08: TFloatField;
     QMver_detalles_gr_ed_pcP09: TFloatField;
     QMver_detalles_gr_ed_pcP10: TFloatField;
     QMver_detalles_gr_ed_pcP11: TFloatField;
     QMver_detalles_gr_ed_pcP12: TFloatField;
     QMver_detalles_gr_ed_pcP13: TFloatField;
     QMver_detalles_gr_ed_pcP14: TFloatField;
     QMver_detalles_gr_ed_pcP15: TFloatField;
     QMver_detalles_gr_ed_pcP16: TFloatField;
     QMver_detalles_gr_ed_pcP17: TFloatField;
     QMver_detalles_gr_ed_pcP18: TFloatField;
     QMver_detalles_gr_ed_pcP19: TFloatField;
     QMver_detalles_gr_ed_pcP20: TFloatField;
     QMver_detalles_gr_ed_pcP21: TFloatField;
     QMver_detalles_gr_ed_pcP22: TFloatField;
     QMver_detalles_gr_ed_pcID_E: TIntegerField;
     QMver_detalles_gr_ed_pcID_D_E_GR: TIntegerField;
     QMver_detalles_gr_edUTOTAL: TFloatField;
     QMver_detalles_gr_edPTOTAL: TFloatField;
     QMver_detalles_gr_edCAMBIA: TIntegerField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure QMver_detalles_gr_edBeforePost(DataSet: TDataSet);
     procedure QMver_detalles_gr_edNewRecord(DataSet: TDataSet);
     procedure QMver_detalles_gr_edAfterPost(DataSet: TDataSet);
     procedure QMver_detalles_gr_edREF_PROVEEDORChange(Sender: TField);
     procedure QMver_detalles_gr_edS_COLORChange(Sender: TField);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     function GetLineaNormal(Talla: string): integer;
     function GetLineaTallas(id_detalles_e: integer; var Talla: string): integer;
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
     function LocateLineaTallas(id_detalles_e: integer): string;
     procedure SyncTallas(tipo: integer);
     function GetActive(Tipo: integer = -1): TFIBDataSet;
     procedure UnidadesSegunKit(Kit: string; Cantidad: double);
     procedure InsertaModelo(RefProveedor: string);
  end;

var
  DMTallas_e : TDMTallas_e;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

{ TDMTallas_e }

procedure TDMTallas_e.QMver_detalles_gr_edBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(QMVer_detalles_gr_ed, 'SEQ_DETALLES_E_GR', 'ID_D_E_GR');
end;

procedure TDMTallas_e.QMver_detalles_gr_edNewRecord(DataSet: TDataSet);
begin
  QMver_detalles_gr_ed['ID_E'] := QMCabecera['ID_E'];
end;

procedure TDMTallas_e.SetDS(ds: TDataSource);
begin
  QMver_detalles_gr_ed.DataSource := ds;
  QMver_detalles_gr_ed_pc.DataSource := ds;
  QMCabecera := ds.DataSet;
  QMver_detalles_gr_ed.Transaction := TFIBTableSet(ds.DataSet).Transaction;
  QMver_detalles_gr_ed_pc.Transaction := TFIBTableSet(ds.DataSet).Transaction;
  QMver_detalles_gr_ed.UpdateTransaction := TFIBTableSet(ds.DataSet).UpdateTransaction;
  QMver_detalles_gr_ed_pc.UpdateTransaction := TFIBTableSet(ds.DataSet).UpdateTransaction;
end;

procedure TDMTallas_e.QMver_detalles_gr_edAfterPost(DataSet: TDataSet);
begin
  // DMMain.Graba;
  TFIBDataSet(DataSet).Transaction.CommitRetaining;
  // DataSet.Refresh;
  if Assigned(InfoActualiza) then
     InfoActualiza;
end;

procedure TDMTallas_e.GetDatosLineaRefProveedor(Ref_proveedor: string);
var
  aux, tmp : double;
begin
  if Ref_proveedor = '' then
     Ref_proveedor := QMver_detalles_gr_edRef_proveedor.AsString;

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

        QMver_detalles_gr_ed['ID_G_T'] := FieldByName['ID_G_T'].Value;
        QMver_detalles_gr_ed['TITMC'] := FieldByName['TITULO'].Value;

        DMMain.Cambios(REntorno.MonedaEmpresa, QMCabecera['MONEDA'], Now, FieldByName['P_COMPRA'].AsDouble, aux, tmp);
        QMver_detalles_gr_ed['P_COMPRA'] := tmp;

        DMMain.Cambios(REntorno.MonedaEmpresa, QMCabecera['MONEDA'], Now, FieldByName['P_VENTA'].AsDouble, aux, tmp);
        QMver_detalles_gr_ed['P_VENTA'] := tmp;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTallas_e.GetDatosLineaSColor(s_color: string);
begin
  if s_color = '' then
     s_color := QMver_detalles_gr_edS_COLOR.AsString;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_A_M_C, AAMC.TITULO FROM ART_ARTICULOS_MOD_COLOR AAMC ');
        SQL.Add(' JOIN ART_ARTICULOS_MODELOS AAM ON AAM.ID_A_M = AAMC.ID_A_M ');
        SQL.Add(' WHERE ');
        SQL.Add(' REF_PROVEEDOR = :REF_PROVEEDOR AND ');
        SQL.Add(' S_COLOR = :S_COLOR ');
        Params.ByName['REF_PROVEEDOR'].AsString := QMver_detalles_gr_edREF_PROVEEDOR.AsString;
        Params.ByName['S_COLOR'].AsString := s_color;
        ExecQuery;
        QMver_detalles_gr_ed['ID_A_M_C'] := FieldByName['ID_A_M_C'].Value;
        QMver_detalles_gr_ed['TITMC'] := FieldByName['TITULO'].Value;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RellenaTallasActivas;
end;

procedure TDMTallas_e.MascarasMonedas(LocalMascaraN, LocalMascaraL: string);
var
  i : integer;
  f : TField;
begin
  QMver_detalles_gr_edP_COMPRA.DisplayFormat := LocalMascaraN;
  QMver_detalles_gr_edP_VENTA.DisplayFormat := LocalMascaraN;
  for i := 1 to 22 do
  begin
     f := QMver_detalles_gr_ed_pc.FindField(Format('P%.2d', [i]));
     if (f <> nil) and (f.DataType = ftFloat) then
        TFloatField(f).DisplayFormat := LocalMascaraN;
  end;
end;

function TDMTallas_e.GetLineaNormal(Talla: string): integer;
var
  aux : TFIBDataSet;
begin
  /// Devuelve la linea de GES_DETALLES_E en donde esta la talla.

  Result := 0;
  Aux := GetActive;
  if (Aux <> nil) and (Aux['ID_A_M_C'] <> null) and (Aux['ID_D_E_GR'] <> null) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE XGET_NORMAL_E(:ID_A_M_C, :ID_D_E_GR, :COD_TALLA)';
           Params.ByName['ID_A_M_C'].AsInteger := Aux['ID_A_M_C'];
           Params.ByName['ID_D_E_GR'].AsInteger := Aux['ID_D_E_GR'];
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

function TDMTallas_e.GetLineaTallas(id_detalles_e: integer; var Talla: string): integer;
begin
  /// Devuelve ID y COD_TALLA del articulo de GES_DETALLES_S

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE XGET_GRUPO_E(:ID_DETALLES_E)';
        Params.ByName['ID_DETALLES_E'].AsInteger := id_detalles_e;
        ExecQuery;
        Result := FieldByName['ID_D_E_GR'].AsInteger;
        Talla := FieldByName['COD_TALLA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTallas_e.Abrir;
begin
  QMver_detalles_gr_ed.Open;
end;

function TDMTallas_e.LocateLineaTallas(id_detalles_e: integer): string;
var
  ID_D_E_GR : integer;
  ds : TFIBDataSet;
begin
  ID_D_E_GR := GetLineaTallas(ID_DETALLES_E, Result);
  if (ID_D_E_GR <> 0) then
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
              ds.Locate('ID_D_E_GR', ID_D_E_GR, []);
           finally
              EnableControls;
           end;
        end;
     end;
  end;

end;

procedure TDMTallas_e.LocateLineaNormal(DataSet: TDataSet; Talla: string);
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

procedure TDMTallas_e.QMver_detalles_gr_edREF_PROVEEDORChange(Sender: TField);
begin
  GetDatosLineaRefProveedor(Sender.AsString);
end;

procedure TDMTallas_e.QMver_detalles_gr_edS_COLORChange(Sender: TField);
begin
  GetDatosLineaSColor(Sender.AsString);
end;

procedure TDMTallas_e.SyncTallas(Tipo: integer);
begin
  GetActive(Tipo).Locate('ID_D_E_GR', GetActive(abs(Tipo - 1))['ID_D_e_GR'], []);
end;

function TDMTallas_e.GetActive(Tipo: integer = -1): TFIBDataSet;
begin
  Result := nil;

  case Tipo of
     0: // Precios -> Tallas
        Result := QMver_detalles_gr_ed;
     1: // Tallas  -> Precios
        Result := QMver_detalles_gr_ed_pc;
  end;

  if Result = nil then
  begin
     if QMver_detalles_gr_ed.Active then
        Result := QMver_detalles_gr_ed;
     if QMver_detalles_gr_ed_pc.Active then
        Result := QMver_detalles_gr_ed_pc;
  end;

  { -dji lrk kri-
  // Si no encuentro nada que devolver, devuelvo el DataSet principal
  if Result = nil then
  begin
      Result := QMver_detalles_gr_ed;
  end;
  }
end;

procedure TDMTallas_e.UnidadesSegunKit(Kit: string; Cantidad: double);
begin
  // Me aseguro de que estemos editando la linea
  if (not (QMver_detalles_gr_ed.State in [dsEdit, dsInsert])) then
     QMver_detalles_gr_ed.Edit;

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
                 QMver_detalles_gr_ed.FieldByName('T' + FieldByName('COD_TALLA').AsString).AsFloat := (FieldByName('UNIDADES').AsFloat * Cantidad);
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
  if (QMver_detalles_gr_ed.State in [dsEdit, dsInsert]) then
     QMver_detalles_gr_ed.Post;
end;

procedure TDMTallas_e.DataModuleCreate(Sender: TObject);
begin
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMTallas_e.RellenaTallasActivas;
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
           Params.ByName['ID_A_M_C'].AsString := QMver_detalles_gr_ed['ID_A_M_C'];
           Open;
           while not EOF do
           begin
              if (StrToIntDef(FieldByName('COD_TALLA').AsString, 0) <= 22) then
              begin
                 if (QMver_detalles_gr_ed['T' + FieldByName('COD_TALLA').AsString] = Null) then
                    QMver_detalles_gr_ed['T' + FieldByName('COD_TALLA').AsString] := 0;
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

procedure TDMTallas_e.InsertaModelo(RefProveedor: string);
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
              QMver_detalles_gr_ed.Insert;
              QMver_detalles_gr_edREF_PROVEEDOR.AsString := RefProveedor;
              QMver_detalles_gr_edS_COLOR.AsString := FieldByName('S_COLOR').AsString;
              QMver_detalles_gr_ed.Post;

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
