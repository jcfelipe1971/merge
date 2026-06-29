unit UDMTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, DBGrids, Variants, NsDBGrid, IdGlobal, IdGlobalProtocols, HYFIBQuery,
  FIBDatabase, UFIBModificados;

type
  TDMTallas = class(TDataModule)
     xget_tallas: TFIBDataSetRO;
     TLocal: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     procedure CheckOpen;
  public
     { Public declarations }
     procedure SetCaptions(id_g_t: variant; grd: TNsDbGrid); overload;
     procedure SetCaptions(id_g_t: variant; grd: TNsDbGrid; id_a_m_c: integer); overload;
     procedure SetColumns(id_g_t: variant; grd: TNsDbGrid);
     procedure Refresh;
     procedure CuentaCaptions(grd: TNsDbGrid; var sentencia: string);
     function DameCodigoGrupoTallas(ID_G_T: integer): string;
  end;

var
  DMTallas : TDMTallas;

implementation

uses UFormGest, UDMMain;

{$R *.dfm}

procedure TDMTallas.CheckOpen;
begin
  if DMTallas = nil then
     AbreData(TDMTallas, DMTallas);

  with DMTallas.xget_tallas do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;

     if not Active then
     begin
        Open;
        Last;
     end;
  end;
end;

procedure TDMTallas.Refresh;
begin
  CheckOpen;
  xget_tallas.Close;
end;

procedure TDMTallas.SetCaptions(id_g_t: variant; grd: TNsDbGrid);
var
  i : integer;
  aux : string;
begin
  if id_g_t <> null then
  begin
     CheckOpen;
     with grd, DMTallas do
     begin
        xget_tallas.Locate('ID_G_T', id_g_t, []);
        for i := 0 to Columns.Count - 1 do
        begin
           if ((Columns[i].FieldName[1] = 'T') or (Columns[i].FieldName[1] = 'P')) and
              IsNumeric(Columns[i].FieldName[2]) and IsNumeric(Columns[i].FieldName[3]) and
              (Length(Columns[i].FieldName) = 3) then
           begin
              aux := 'T' + Copy(Columns[i].FieldName, 2, 2);
              if xget_tallas[aux] <> null then
                 Columns[i].Title.Caption := xget_tallas[aux]
              else
                 Columns[i].Title.Caption := '';
              {
                if (xget_doc_s_tallas[Columns[i].FieldName] = null) and
                   (QMver_detalles_gr_sd.RecordCount > 0) then
                   Columns[i].Field.ReadOnly := True
                else
                  Columns[i].Field.ReadOnly := False;
             }
           end;
        end;
     end;
  end;
end;

procedure TDMTallas.SetColumns(id_g_t: variant; grd: TNsDbGrid);
var
  i : integer;
  c : TColumn;
  nVisible : integer;
begin
  if id_g_t <> null then
  begin
     CheckOpen;
     with grd, DMTallas do
     begin
        xget_tallas.Locate('ID_G_T', id_g_t, []);
        if xget_tallas['NVISIBLE'] <> null then
        begin
           nVisible := xget_tallas['NVISIBLE'];
           for i := 1 to 22 do
           begin
              c := FindColumn('T' + Format('%.2d', [i]));
              if (c = nil) then
                 c := FindColumn('P' + Format('%.2d', [i]));
              if (c <> nil) then
              begin
                 if i > nVisible then
                    c.Visible := False
                 else
                    c.Visible := True;
              end;
           end;
        end;
     end;
     setCaptions(id_g_t, grd);
  end;
end;

procedure TDMTallas.CuentaCaptions(grd: TNsDbGrid; var sentencia: string);
var
  i, j : integer;
  aux, aux1 : string;
begin
  sentencia := '';
  aux := '';
  sentencia := 'UPDATE VER_DETALLES_GR_SD_PV SET P_VENTA=?P_VENTA';
  with grd do
  begin
     for i := 3 to 22 do
     begin
        j := i - 2;
        if (j < 10) then
           aux := ('0' + IntToStr(j))
        else
           aux := IntToStr(i);
        if (Columns[i].Title.Caption = '') then
           aux1 := (',P' + aux + '=null')
        else
           aux1 := (',P' + aux + '=?P' + aux);
        sentencia := sentencia + aux1;
        aux1 := '';
     end;
  end;
end;

function TDMTallas.DameCodigoGrupoTallas(ID_G_T: integer): string;
begin
  if (ID_G_T <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('SELECT GRUPO FROM ART_GRUPOS_TALLAS WHERE ID_G_T=?ID_G_T');
           Params.ByName['ID_G_T'].AsInteger := ID_G_T;
           ExecQuery;
           Result := FieldByName['GRUPO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMTallas.DataModuleCreate(Sender: TObject);
begin
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMTallas.SetCaptions(id_g_t: variant; grd: TNsDbGrid; id_a_m_c: integer);
var
  i : integer;
  aux : string;
  ds : TFIBDataSet;
begin
  if id_g_t <> null then
  begin
     CheckOpen;
     DS := TFIBDataSet.Create(nil);
     with DS do
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
              SelectSQL.Add(' SELECT ATA.ID_G_T, ATA.COD_TALLA, ATA.TALLA, ATA.TITULO, AMCT.ARTICULO ');
              SelectSQL.Add(' FROM ART_ARTICULOS_MOD_COLOR AMC ');
              SelectSQL.Add(' JOIN ART_ARTICULOS_MODELOS AM ON AMC.ID_A_M = AM.ID_A_M ');
              SelectSQL.Add(' JOIN ART_TALLAS ATA ON AM.ID_G_T = ATA.ID_G_T ');
              SelectSQL.Add(' LEFT JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON AMC.ID_A_M_C = AMCT.ID_A_M_C AND ATA.ID_A_T = AMCT.ID_A_T ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' AMC.ID_A_M_C = :ID_A_M_C ');
              SelectSQL.Add(' ORDER BY ATA.COD_TALLA ');
              Params.ByName['ID_A_M_C'].AsInteger := id_a_m_c;
              Open;


              with grd, DMTallas do
              begin
                 xget_tallas.Locate('ID_G_T', id_g_t, []);
                 for i := 0 to Columns.Count - 1 do
                 begin
                    // Tengo en cuenta solo los campos Tnn y Pnn
                    if ((Columns[i].FieldName[1] = 'T') or (Columns[i].FieldName[1] = 'P')) and
                       IsNumeric(Columns[i].FieldName[2]) and IsNumeric(Columns[i].FieldName[3]) and
                       (Length(Columns[i].FieldName) = 3) then
                    begin
                       aux := 'T' + Copy(Columns[i].FieldName, 2, 2);
                       if xget_tallas[aux] <> null then
                          Columns[i].Title.Caption := xget_tallas[aux]
                       else
                          Columns[i].Title.Caption := '';

                       DS.Locate('COD_TALLA', StrToInt(Copy(Columns[i].FieldName, 2, 2)), []);
                       Columns[i].Field.ReadOnly := (DS.FieldByName('ARTICULO').AsString = '');

                       {
                         if (xget_doc_s_tallas[Columns[i].FieldName] = null) and
                            (QMver_detalles_gr_sd.RecordCount > 0) then
                            Columns[i].Field.ReadOnly := True
                         else
                           Columns[i].Field.ReadOnly := False;
                      }
                    end;
                 end;
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
end;

end.
