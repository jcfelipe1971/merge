unit UDMFichaTecnica;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO;

type
  TDMFichaTecnica = class(TDataModule)
     QMFichaTecnica: TFIBTableSet;
     DSQMFichaTecnica: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMFichaTecnicaEMPRESA: TIntegerField;
     QMFichaTecnicaID_FICHA_TECNICA: TIntegerField;
     QMFichaTecnicaMATRICULA: TFIBStringField;
     QMFichaTecnicaCLIENTE: TIntegerField;
     QMFichaTecnicaNOMBRE_R_SOCIAL: TFIBStringField;
     QMFichaTecnicaID_CLIENTE: TIntegerField;
     QMFichaTecnicaMARCA: TFIBStringField;
     QMFichaTecnicaTITULO: TFIBStringField;
     QMFichaTecnicaID_MARCA: TIntegerField;
     QMFichaTecnicaMODELO: TFIBStringField;
     QMFichaTecnicaBASTIDOR: TFIBStringField;
     QMFichaTecnicaID_IMAGEN: TIntegerField;
     QMFichaTecnicaID_GALERIA: TIntegerField;
     QMFichaTecnicaFECHA_COMPRA: TDateTimeField;
     QMFichaTecnicaFECHA_PROXIMA_ITV: TDateTimeField;
     QMFichaTecnicaRENTING: TFIBStringField;
     QMFichaTecnicaNOTAS: TBlobField;
     QMFichaTecnicaTITULO_MARCA: TFIBStringField;
     QMFichaTecnicaMOTOR: TFIBStringField;
     QMFichaTecnicaKILOMETRAJE: TIntegerField;
     QMFichaTecnicaANYO_FABRICACION: TIntegerField;
     QMFichaTecnicaCOLOR: TFIBStringField;
     QMFichaTecnicaMEDIDA_NEUMATICO: TFIBStringField;
     QMFichaTecnicaFECHA_ULTIMA_ITV: TDateTimeField;
     QMCabReparar: TFIBDataSetRO;
     DSQMCabReparar: TDataSource;
     QMCabRepararIDCABREPARAR: TIntegerField;
     QMCabRepararEMPRESA: TIntegerField;
     QMCabRepararEJERCICIO: TIntegerField;
     QMCabRepararCLIENTE: TIntegerField;
     QMCabRepararTERCERO: TIntegerField;
     QMCabRepararEQUIPO: TFIBStringField;
     QMCabRepararMARCA: TFIBStringField;
     QMCabRepararMODELO: TFIBStringField;
     QMCabRepararNUM_SERIE: TFIBStringField;
     QMCabRepararCONDICION: TFIBStringField;
     QMCabRepararOT: TFIBStringField;
     QMCabRepararTECNICO: TFIBStringField;
     QMCabRepararFECHA_AVISO: TDateTimeField;
     QMCabRepararFECHA_ENTRADA: TDateTimeField;
     QMCabRepararFECHA_SALIDA: TDateTimeField;
     QMCabRepararOBSERVACIONES_CLIENTE: TMemoField;
     QMCabRepararTIPO_ACTUACION: TIntegerField;
     QMCabRepararTRABAJO_REALIZADO: TMemoField;
     QMCabRepararESTADO: TIntegerField;
     QMCabRepararCARGO_COSTE: TIntegerField;
     QMCabRepararID_NUM_SERIE: TIntegerField;
     QMCabRepararTOTAL_COSTE: TFloatField;
     QMCabRepararESTADO_REPAR: TIntegerField;
     QMCabRepararCANAL: TIntegerField;
     QMCabRepararREPARACION: TIntegerField;
     QMCabRepararID_FICHA_TECNICA: TIntegerField;
     QMCabRepararID_S: TIntegerField;
     QMCabRepararSERIE_DOC: TFIBStringField;
     QMCabRepararKILOMETROS: TFIBStringField;
     QMCabRepararSERIE: TFIBStringField;
     QMCabRepararFECHA_PREV_SALIDA: TDateTimeField;
     QMCabRepararCONTACTO_EMAIL: TFIBStringField;
     QMCabRepararCONTACTO_NOMBRE: TFIBStringField;
     QMCabRepararCONTACTO_TELEFONO: TFIBStringField;
     QMCabRepararKILOMETROS_ENTRADA: TFloatField;
     QMCabRepararSITUACION: TIntegerField;
     QMCabRepararID_S_ORIGEN: TIntegerField;
     QMCabRepararPROYECTO: TIntegerField;
     QMCabRepararTIPO: TIntegerField;
     QMCabRepararCONTACTO_LATITUD: TFloatField;
     QMCabRepararCONTACTO_LONGITUD: TFloatField;
     QMCabRepararCONTACTO_LOCALIDAD: TFIBStringField;
     QMCabRepararCONTACTO_DIR_NOMBRE: TFIBStringField;
     QMCabRepararCONTACTO_DIR_NOMBRE_2: TFIBStringField;
     QMCabRepararHORARIO_1_DESDE: TDateTimeField;
     QMCabRepararHORARIO_1_HASTA: TDateTimeField;
     QMCabRepararHORARIO_2_DESDE: TDateTimeField;
     QMCabRepararHORARIO_2_HASTA: TDateTimeField;
     QMCabRepararDIRECCION_DOCUMENTO: TIntegerField;
     QMCabRepararID_REP_RECEPCION: TIntegerField;
     QMCabRepararNOMBRE_COMERCIAL: TFIBStringField;
     QMCabRepararNOMBRE_R_SOCIAL: TFIBStringField;
     QMCabRepararTITULO_ESTADO: TFIBStringField;
     QMCabRepararTITULO_SITUACION: TFIBStringField;
     QMCabRepararTITULO_TIPO_REPARACION: TFIBStringField;
     QMCabRepararTITULO_TIPO_ACTUACION: TFIBStringField;
     QMCabRepararTITULO_PROYECTO: TFIBStringField;
     QMCabRepararTITULO_LOCALIDAD: TFIBStringField;
     QMCabRepararCODIGO_POSTAL: TFIBStringField;
     QMCabRepararEJERCICIO_ORIGEN: TIntegerField;
     QMCabRepararCANAL_ORIGEN: TIntegerField;
     QMCabRepararSERIE_ORIGEN: TFIBStringField;
     QMCabRepararTIPO_ORIGEN: TFIBStringField;
     QMCabRepararRIG_ORIGEN: TIntegerField;
     QMCabRepararEJERCICIO_DESTINO: TIntegerField;
     QMCabRepararCANAL_DESTINO: TIntegerField;
     QMCabRepararSERIE_DESTINO: TFIBStringField;
     QMCabRepararTIPO_DESTINO: TFIBStringField;
     QMCabRepararRIG_DESTINO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMFichaTecnicaNewRecord(DataSet: TDataSet);
     procedure QMFichaTecnicaBeforePost(DataSet: TDataSet);
     procedure QMFichaTecnicaAfterOpen(DataSet: TDataSet);
     procedure QMFichaTecnicaAfterClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     function DameTituloMarca(Marca: string): string;
     procedure NuevaFicha(Cliente: integer);
     procedure FiltraFicha(IdFichaTecnica: integer);
     procedure BusquedaCompleja;
  end;

var
  DMFichaTecnica : TDMFichaTecnica;

implementation

uses UDMMain, UEntorno, HYFIBQuery, UUtiles, UFBusca, Controls;

{$R *.dfm}

procedure TDMFichaTecnica.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMFichaTecnica, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMCabReparar, MascaraN, MascaraI, ShortDateFormat);

  QMCabRepararHORARIO_1_DESDE.DisplayFormat := 'hh:nn';
  QMCabRepararHORARIO_1_HASTA.DisplayFormat := 'hh:nn';
  QMCabRepararHORARIO_2_DESDE.DisplayFormat := 'hh:nn';
  QMCabRepararHORARIO_2_HASTA.DisplayFormat := 'hh:nn';

  DMMain.FiltraTabla(QMFichaTecnica, '10000', True);
end;

procedure TDMFichaTecnica.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMFichaTecnica.QMFichaTecnicaNewRecord(DataSet: TDataSet);
begin
  QMFichaTecnicaEMPRESA.AsInteger := REntorno.Empresa;
  QMFichaTecnicaCLIENTE.AsInteger := -1;
  QMFichaTecnicaID_IMAGEN.AsInteger := 0;
  QMFichaTecnicaID_GALERIA.AsInteger := 0;
  QMFichaTecnicaFECHA_COMPRA.AsDateTime := REntorno.FechaTrab;
  QMFichaTecnicaFECHA_PROXIMA_ITV.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMFichaTecnica.QMFichaTecnicaBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_FICHA_TECNICA', 'ID_FICHA_TECNICA');
end;

function TDMFichaTecnica.DameTituloMarca(Marca: string): string;
begin
  Result := '';
  if (Trim(Marca) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM SYS_MARCA WHERE MARCA = :MARCA';
           Params.ByName['MARCA'].AsString := Marca;
           ExecQuery;
           Result := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMFichaTecnica.NuevaFicha(Cliente: integer);
begin
  FiltraFicha(0);
  QMFichaTecnica.Insert;
  QMFichaTecnicaCLIENTE.AsInteger := Cliente;
end;

procedure TDMFichaTecnica.FiltraFicha(IdFichaTecnica: integer);
begin
  with QMFichaTecnica do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_FICHA_TECNICA ');
     SelectSQL.Add(' WHERE  ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA ');
     SelectSQL.Add(' AND ID_FICHA_TECNICA = ?ID_FICHA_TECNICA ');
     SelectSQL.Add(' ORDER BY MATRICULA ');
  end;

  DMMain.FiltraTabla(QMFichaTecnica, '10000', False);
  QMFichaTecnica.Params.ByName['ID_FICHA_TECNICA'].AsInteger := IdFichaTecnica;
  QMFichaTecnica.Open;
end;

procedure TDMFichaTecnica.BusquedaCompleja;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(QMFichaTecnica, '10000', True, '') = mrAll) then
  begin
     with QMFichaTecnica do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_FICHA_TECNICA ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = ?EMPRESA ');
        SelectSQL.Add(' ORDER BY MATRICULA ');
     end;
     DMMain.FiltraTabla(QMFichaTecnica, '10000', True);
  end;
end;

procedure TDMFichaTecnica.QMFichaTecnicaAfterOpen(DataSet: TDataSet);
begin
  QMCabReparar.Open;
end;

procedure TDMFichaTecnica.QMFichaTecnicaAfterClose(DataSet: TDataSet);
begin
  QMCabReparar.Close;
end;

end.
