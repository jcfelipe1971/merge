unit UDMOrdenaLineas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMOrdenaLineas = class(TDataModule)
     TLocal: THYTransaction;
     xLineas: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     Id: integer;
     Tipo, TablaDetalle, CampoIdCab, CampoIdDet: string;
     SQLCambioOrden: string;
  public
     { Public declarations }
     procedure PonerDatos(Tipo: string; Id: integer);
     procedure ActualizaOrden(Id_Det, Orden: integer);
  end;

var
  DMOrdenaLineas : TDMOrdenaLineas;

implementation

{$R *.dfm}

uses
  UDMMain, UProDMEscandallo, UEntorno;

procedure TDMOrdenaLineas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMOrdenaLineas.PonerDatos(Tipo: string; Id: integer);
begin
  Self.Tipo := Tipo;
  Self.Id := Id;

  if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
  begin
     TablaDetalle := 'ges_detalles_s';
     CampoIdCab := 'id_s';
     CampoIdDet := 'id_detalles_s';
  end
  else if ((Tipo = 'PEP') or (Tipo = 'ALP') or (Tipo = 'FAP') or (Tipo = 'FCR') or (tipo = 'OFP') or (tipo = 'OCP')) then
  begin
     TablaDetalle := 'ges_detalles_e';
     CampoIdCab := 'id_e';
     CampoIdDet := 'id_detalles_e';
  end
  else if ((Tipo = 'TESC')) then
  begin
     TablaDetalle := 'pro_tarea_esc';
     CampoIdCab := 'id_esc';
     CampoIdDet := 'linea_tarea';
  end
  else if ((Tipo = 'MESC')) then
  begin
     TablaDetalle := 'pro_mat_esc';
     CampoIdCab := 'id_esc';
     CampoIdDet := 'linea_comp';
  end;

  with xLineas do
  begin
     if (Tipo = 'MESC') then
     begin
        SelectSQL.Text := 'select comp.componente as componente,tit.titulo_largo as titulo,comp.unidades as unidades,comp.orden as orden,comp.' + CampoIdDet + ' as id_det' +
           ' from ' + TablaDetalle + ' comp' +
           ' left join art_articulos tit' +
           ' on comp.componente = tit.articulo' +
           ' where ' + CampoIdCab + '=' + IntToStr(Id) + ' and linea_fase=' + ProDMEscandallo.QMProFasesEscLINEA_FASE.AsString + ' order by orden';
     end
     else if (Tipo = 'TESC') then
     begin
        SelectSQL.Text := 'select tar.tipotarea as tipotarea,tit.titulo as titulo, tar.orden as orden,tar.' + CampoIdDet + ' as id_det' +
           ' from ' + TablaDetalle + ' tar' +
           ' left join pro_sys_tareas tit' +
           ' on tar.tipotarea = tit.tarea' +
           ' where ' + CampoIdCab + '=' + IntToStr(Id) + ' and linea_fase=' + ProDMEscandallo.QMProFasesEscLINEA_FASE.AsString + ' order by orden';
     end
     else
     begin
        SelectSQL.Text := 'select linea,articulo,titulo,orden,unidades,' + CampoIdDet + ' as id_det' +
           ' from ' + TablaDetalle +
           ' where ' + CampoIdCab + '=' + IntToStr(Id) + ' order by orden';
     end;
     Open;
  end;

  if ((Tipo = 'TESC') or (Tipo = 'MESC')) then
  begin
     SQLCambioOrden := 'update ' + TablaDetalle + ' set orden=?orden' +
        ' where id_esc=' + IntToStr(Id) + ' and ' + CampoIdDet + '=?' + CampoIdDet;
  end
  else
  begin
     SQLCambioOrden := 'update ' + TablaDetalle + ' set orden=?orden' +
        ' where ' + CampoIdDet + '=?' + CampoIdDet;
  end;
end;

procedure TDMOrdenaLineas.ActualizaOrden(Id_Det, Orden: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := SQLCambioOrden;
        Params.ByName[CampoIdDet].AsInteger := Id_Det;
        Params.ByName['ORDEN'].AsInteger := Orden;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
