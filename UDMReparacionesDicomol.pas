{Especifico cliente DICOMOL}

unit UDMReparacionesDicomol;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBTableDataSet,
  FIBDatabase, UFIBModificados, HYFIBQuery, FIBQuery, FR_Class,
  Fr_HYReport, FR_DSet, FR_DBSet;

type
  TDMReparacionesDicomol = class(TDataModule)
     TLocal: THYTransaction;
     ZQMReparaciones: TFIBTableSet;
     ZDSQMReparaciones: TDataSource;
     xFamilia: TFIBDataSetRO;
     xFamiliaTITULO: TFIBStringField;
     DSxFamilia: TDataSource;
     ZQMReparacionesIDREPARACION: TIntegerField;
     ZQMReparacionesCLIENTE: TIntegerField;
     ZQMReparacionesFAMILIA: TFIBStringField;
     ZQMReparacionesARTICULO: TFIBStringField;
     ZQMReparacionesFECHA: TDateTimeField;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     xArticulo: TFIBDataSetRO;
     DSxArticulo: TDataSource;
     ZQMReparacionesEMPRESA: TIntegerField;
     ZQMReparacionesSERIE: TFIBStringField;
     ZQMReparacionesID_ORDEN: TIntegerField;
     ZQMReparacionesDescFamilia: TStringField;
     ZQMReparacionesDescCliente: TStringField;
     ZQMReparacionesDescArticulo: TStringField;
     xArticuloTITULO: TFIBStringField;
     xClienteTITULO: TFIBStringField;
     QTemp: THYFIBQuery;
     ZQMReparacionesESTADO_REP: TIntegerField;
     frDBReparaciones: TfrDBDataSet;
     frLstReparaciones: TfrHYReport;
     xLstReparaciones: TFIBDataSetRO;
     DSxLstReparaciones: TDataSource;
     ZQMReparacionesTITULO_ESTADO: TStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure ZQMReparacionesCLIENTEChange(Sender: TField);
     procedure ZQMReparacionesFAMILIAChange(Sender: TField);
     procedure ZQMReparacionesARTICULOChange(Sender: TField);
     procedure ZQMReparacionesAfterOpen(DataSet: TDataSet);
     procedure ZQMReparacionesNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure ZQMReparacionesAfterScroll(DataSet: TDataSet);
     procedure ZQMReparacionesBeforeEdit(DataSet: TDataSet);
     procedure ZQMReparacionesDescFamiliaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure ZQMReparacionesDescClienteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure ZQMReparacionesDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure frLstReparacionesGetValue(const ParName: string; var ParValue: variant);
     procedure ZQMReparacionesTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     function BusquedaCompleja: integer;
     function BuscarCliente: string;
     function BuscarArticulo: string;
     function BuscarFamilia: string;
     procedure MirarSiOrdenExiste;
     function TieneFamilia: integer;
  end;

var
  DMReparacionesDicomol : TDMReparacionesDicomol;

implementation

uses UDMMain, UEntorno, UFBusca, UFMReparacionesDicomol;

{$R *.dfm}

procedure TDMReparacionesDicomol.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  ZQMReparaciones.Open;
  xFamilia.Open;
  xCliente.Open;
  xArticulo.Open;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesCLIENTEChange(Sender: TField);
begin
  with xCliente do
  begin
     Close;
     Params.ByName['Cliente'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesFAMILIAChange(Sender: TField);
begin
  with xFamilia do
  begin
     Close;
     Params.ByName['Familia'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesARTICULOChange(Sender: TField);
begin
  with xArticulo do
  begin
     Close;
     Params.ByName['Articulo'].AsString := Sender.AsString;
     Open;
  end;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesAfterOpen(DataSet: TDataSet);
begin
  ZQMReparaciones.Open;
  xFamilia.Open;
  xCliente.Open;
  xArticulo.Open;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesNewRecord(DataSet: TDataSet);
begin
  ZQMReparacionesFECHA.AsDateTime := Date;
  ZQMReparacionesSERIE.AsString := REntorno.Serie;

  // Es posa el codi següent. Es crida al generador de la BDD
  ZQMReparacionesEMPRESA.AsInteger := REntorno.Empresa;

  DMMain.Contador_Gen(DataSet, 'Z_REPARACIONES', 'IDREPARACION');
end;

procedure TDMReparacionesDicomol.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  ZQMReparaciones.Refresh;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesAfterScroll(DataSet: TDataSet);
begin
  //SFG_RSP Traspas a ordres
  if (ZQMReparacionesID_ORDEN.AsInteger <> 0) then
     FMReparacionesDicomol.AGenerarOrden.Enabled := False
  else
     FMReparacionesDicomol.AGenerarOrden.Enabled := True;
  MirarSiOrdenExiste;
  with QTemp do
  begin
     Close;
     SQL.Text := 'select id_orden from pro_ord where id_orden = ?id_orden';
     Params.ByName['id_orden'].AsInteger := ZQMReparacionesID_ORDEN.AsInteger;
     ExecQuery;
  end;
  FMReparacionesDicomol.LFOrden.Text := QTemp.FieldByName['id_orden'].AsString;
end;

function TDMReparacionesDicomol.TieneFamilia: integer;
begin
  with QTemp do
  begin
     Close;
     SQL.Text := 'select count(familia) as num_familia from z_fam_escandallos where familia = ?familia';
     Params.ByName['familia'].AsInteger := ZQMReparacionesFAMILIA.AsInteger;
     ExecQuery;
  end;

  Result := QTemp.FieldByName['num_familia'].AsInteger;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesBeforeEdit(DataSet: TDataSet);
begin
  if ((ZQMReparacionesESTADO_REP.AsInteger = 5)) then
  begin
     raise Exception.Create('Documento Bloqueado');
     DataSet.Cancel;
  end;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesDescFamiliaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (ZQMReparacionesFAMILIA.AsString <> '') then
  begin
     xFamilia.Close;
     xFamilia.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     xFamilia.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     xFamilia.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     xFamilia.Open;
     Text := xFamiliaTITULO.AsString;
  end;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesDescClienteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (ZQMReparacionesCLIENTE.AsString <> '') then
  begin
     xCliente.Close;
     xCliente.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     xCliente.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     xCliente.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     xCliente.Open;
     Text := xClienteTITULO.AsString;
  end;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (ZQMReparacionesARTICULO.AsString <> '') then
  begin
     xArticulo.Close;
     xArticulo.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     xArticulo.Open;
     Text := xArticuloTITULO.AsString;
  end;
end;

procedure TDMReparacionesDicomol.frLstReparacionesGetValue(const ParName: string; var ParValue: variant);
begin
  if (ParName = 'NombreCliente') then
     ParValue := FMReparacionesDicomol.DescCliente.Text;
end;

function TDMReparacionesDicomol.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(ZQMReparaciones, '10000');
end;

function TDMReparacionesDicomol.BuscarCliente: string;
begin
  with QTemp do
  begin
     Close;
     SQL.Text := 'select first(1) titulo from ver_clientes where empresa=?empresa' +
        ' and cliente=?cliente ';
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['cliente'].AsInteger := ZQMReparacionesCLIENTE.AsInteger;
     ExecQuery;
  end;
  Result := QTemp.FieldByName['titulo'].AsString;
end;

function TDMReparacionesDicomol.BuscarFamilia: string;
begin
  with QTemp do
  begin
     Close;
     SQL.Text := 'select first(1) titulo from ver_familias_cuentas where empresa=?empresa' +
        ' and ejercicio=?ejercicio and canal=?canal and familia=?familia ';
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['canal'].AsInteger := REntorno.Canal;
     Params.ByName['familia'].AsString := ZQMReparacionesFAMILIA.AsString;
     ExecQuery;
  end;
  Result := QTemp.FieldByName['titulo'].AsString;
end;

function TDMReparacionesDicomol.BuscarArticulo: string;
begin
  with QTemp do
  begin
     Close;
     SQL.Text := 'select first(1) titulo from ver_articulos where empresa=?empresa' +
        ' and articulo=?articulo ';
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['articulo'].AsString := ZQMReparacionesARTICULO.AsString;
     ExecQuery;
  end;
  Result := QTemp.FieldByName['titulo'].AsString;
end;

procedure TDMReparacionesDicomol.MirarSiOrdenExiste;
var
  existe : integer;
begin
  //Mirar si existeix la ordre o s'ha esborrat.
  //Sino existeix document passa a estat normal
  if (ZQMReparacionesESTADO_REP.AsInteger = 5) then
  begin
     with QTemp do
     begin
        Close;
        Close;
        SQL.Text := 'select count(*) as num from pro_ord ' +
           'where id_orden = ?id_orden';
        Params.ByName['id_orden'].AsInteger := ZQMReparacionesID_ORDEN.AsInteger;
        ExecQuery;
     end;
     existe := QTemp.FieldByName['num'].AsInteger;

     if ((existe = 0) or (ZQMReparacionesID_ORDEN.AsInteger = 0)) then
     begin
        // pasa a estado normal y se blanquea id_orden
        with QTemp do
        begin
           Close;
           SQL.Text := 'update z_reparaciones set estado_rep=0,id_orden=0 ' +
              'where IDREPARACION=?id';
           Params.ByName['id'].AsInteger := ZQMReparacionesIDREPARACION.AsInteger;
           ExecQuery;
        end;
        ZQMReparaciones.Refresh;
        ZQMReparaciones.Edit;
        ZQMReparaciones.Post;
     end;
  end;
end;

procedure TDMReparacionesDicomol.ZQMReparacionesTITULO_ESTADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEstado(ZQMReparacionesESTADO_REP.AsInteger);
end;

end.
