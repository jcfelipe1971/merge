unit UCrmDMLstContactoDetallado;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, HYFIBQuery;

type
  TCrmDMLstContactoDetallado = class(TDataModule)
     TLocal: THYTransaction;
     xContactoDesde: TFIBDataSetRO;
     xContactoHasta: TFIBDataSetRO;
     DSxContactoD: TDataSource;
     DSxContactoH: TDataSource;
     frListadoContactos: TfrHYReport;
     DSLstContactos: TDataSource;
     frDBListadoContactos: TfrDBDataSet;
     QMLstContactos: TFIBDataSetRO;
     xContactoDesdeNOMBRE_COMERCIAL: TFIBStringField;
     xContactoHastaNOMBRE_COMERCIAL: TFIBStringField;
     QMTerceros: TFIBDataSetRO;
     DSQMTerceros: TDataSource;
     QMBancos: TFIBDataSetRO;
     DSQMBancos: TDataSource;
     QMContactos: TFIBDataSetRO;
     DSQMContactos: TDataSource;
     QMCondiciones: TFIBDataSetRO;
     DSCondiciones: TDataSource;
     frDBNombreContactos: TfrDBDataSet;
     frDBBancos: TfrDBDataSet;
     frDBTerceros: TfrDBDataSet;
     frDBCondiciones: TfrDBDataSet;
     QMDetalleCondiciones: TFIBDataSetRO;
     DSDetalleCondiciones: TDataSource;
     frDBDetalleCondiciones: TfrDBDataSet;
     frUDNotas: TfrUserDataset;
     xEtiquetas: TFIBDataSetRO;
     DSxEtiquetas: TDataSource;
     frDBxEtiquetas: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoContactosGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frListadoContactosBeforePrint(Memo: TStringList; View: TfrView);
     procedure frUDNotasCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUDNotasFirst(Sender: TObject);
     procedure frUDNotasNext(Sender: TObject);
     procedure QMLstContactosAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     ric: TStringList;
     j: integer;
     procedure AbrirTablas(ContactoDesde, ContactoHasta: integer; FechaDesde, FechaHasta: TDateTime);
  public
     { Public declarations }
     procedure MostrarListado(ContactoDesde, ContactoHasta: integer; FechaDesde, FechaHasta, FechaListado: TDateTime; Comentario: string; Modo, Grupo: integer);
     procedure MostrarListadoEti(Modo, Filtro, Enlace: integer);
  end;

var
  CrmDMLstContactoDetallado : TCrmDMLstContactoDetallado;

implementation

uses UDMMain, UDMListados, UFormGest, UUtiles, UEntorno, UCrmDMContactos, UDameDato;

{$R *.dfm}

procedure TCrmDMLstContactoDetallado.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  ric := TStringList.Create;
end;

procedure TCrmDMLstContactoDetallado.DataModuleDestroy(Sender: TObject);
begin
  ric.Free;
  CierraData(DMListados);
end;

procedure TCrmDMLstContactoDetallado.MostrarListado(ContactoDesde, ContactoHasta: integer; FechaDesde, FechaHasta, FechaListado: TDateTime; Comentario: string; Modo, Grupo: integer);
begin
  FechaDesde := HourIntoDate(FechaDesde, '00:00:00');
  FechaHasta := HourIntoDate(FechaHasta, '23:59:59');
  DMListados.Normalizar_Desde_Hasta(FechaDesde, FechaHasta);

  DMListados.DatosInforme(FechaListado, Comentario);

  AbrirTablas(ContactoDesde, ContactoHasta, FechaDesde, FechaHasta);

  DMListados.Imprimir(Grupo, Modo, '', _('Listado de Contacto Detallado'), frListadoContactos, nil);
end;

procedure TCrmDMLstContactoDetallado.AbrirTablas(ContactoDesde, ContactoHasta: integer; FechaDesde, FechaHasta: TDateTime);
begin
  with QMLstContactos do
  begin
     Close;
     Params.ByName['CONTACTO_INI'].AsInteger := ContactoDesde;
     Params.ByName['CONTACTO_FIN'].AsInteger := ContactoHasta;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  QMContactos.Close;
  QMContactos.Open;

  with QMTerceros do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  with QMBancos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  with QmCondiciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  with QmDetalleCondiciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TCrmDMLstContactoDetallado.frListadoContactosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Titol') then
     ParValue := _('LISTADO CONTACTO DETALLADO');
end;

procedure TCrmDMLstContactoDetallado.frListadoContactosBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if Memo[0] = '[Notas]' then
        Memo[0] := ric.Strings[j];
  end;
end;

procedure TCrmDMLstContactoDetallado.frUDNotasCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric.Count = j);
end;

procedure TCrmDMLstContactoDetallado.frUDNotasFirst(Sender: TObject);
begin
  j := 0;
end;

procedure TCrmDMLstContactoDetallado.frUDNotasNext(Sender: TObject);
begin
  j := j + 1;
end;

procedure TCrmDMLstContactoDetallado.QMLstContactosAfterScroll(DataSet: TDataSet);
begin
  if ((QMLstContactos.RecordCount > 0) and (ric <> nil)) then
     ric.Assign(QMLstContactos.FieldByName('NOTAS'));
end;

procedure TCrmDMLstContactoDetallado.MostrarListadoEti(Modo, Filtro, Enlace: integer);
begin
  with xEtiquetas do
  begin
     Close;
     if (Filtro = 0) then
     begin
        if ((DameAgenteUsuario(REntorno.Usuario) <> 0) and (Enlace = 0)) then
           Params.ByName['AGENTE'].AsInteger := DameAgenteUsuario(REntorno.Usuario);
     end;
     Open;
  end;

  DMListados.Imprimir(8207, Modo, '', _('Etiquetas de Contacto Filtradas'), frListadoContactos, nil);
end;

end.
