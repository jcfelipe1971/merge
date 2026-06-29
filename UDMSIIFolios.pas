unit UDMSIIFolios;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, UEntorno, XMLDoc, XMLIntf, HYFIBQuery;

type
  TDMSIIFolios = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMFolios: TFIBTableSet;
     DSQMFolios: TDataSource;
     QMFoliosID: TIntegerField;
     QMFoliosEMPRESA: TIntegerField;
     QMFoliosCANAL: TIntegerField;
     QMFoliosSERIE: TFIBStringField;
     QMFoliosTIPO: TFIBStringField;
     QMFoliosFECHA_AUTORIZACION: TDateTimeField;
     QMFoliosNUMERO_INICIO: TIntegerField;
     QMFoliosNUMERO_FINAL: TIntegerField;
     QMFoliosCONTADOR: TIntegerField;
     QMFoliosACTIVO: TIntegerField;
     QMFoliosAVISO_FOLIOS_PENDIENTES: TIntegerField;
     QMFoliosCOMENTARIO: TMemoField;
     QMFoliosTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMFoliosXML_AUTORIZACION_FOLIOS: TMemoField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMFoliosNewRecord(DataSet: TDataSet);
     procedure QMFoliosBeforePost(DataSet: TDataSet);
     procedure QMFoliosTIPO_DOC_TRIBUTARIOChange(Sender: TField);
  private
     { Private declarations }
     function DameDato(Nodo: IXMLNode; a: array of string): string;
     function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
  public
     { Public declarations }
     procedure ActualizaDatosDesdeFicheroXml(const FileName: string);
     procedure AsignaUltimoFolio;
     procedure LimpiaFolioEnviado;
     procedure AsignaContadorFolioAlUltimoDelCaf;
  end;

var
  DMSIIFolios : TDMSIIFolios;

implementation

uses
  UDMMain, UFMSeleccion;

{$R *.dfm}

procedure TDMSIIFolios.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMFolios, '10100', True);
end;

procedure TDMSIIFolios.QMFoliosNewRecord(DataSet: TDataSet);
begin
  QMFoliosEMPRESA.AsInteger := REntorno.Empresa;
  QMFoliosCANAL.AsInteger := REntorno.Canal;
  QMFoliosSERIE.AsString := REntorno.Serie;
  QMFoliosTIPO.AsString := '';
  QMFoliosFECHA_AUTORIZACION.AsDateTime := REntorno.FechaTrab;
  QMFoliosNUMERO_INICIO.AsInteger := 0;
  QMFoliosNUMERO_FINAL.AsInteger := 0;
  QMFoliosCONTADOR.AsInteger := 0;
  QMFoliosACTIVO.AsInteger := 1;
  QMFoliosAVISO_FOLIOS_PENDIENTES.AsInteger := 0;
  QMFoliosCOMENTARIO.AsString := '';
  QMFoliosTIPO_DOC_TRIBUTARIO.AsString := 'DES';
end;

procedure TDMSIIFolios.QMFoliosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(QMFolios, 'ID_SII_FOLIOS', 'ID');
end;

procedure TDMSIIFolios.ActualizaDatosDesdeFicheroXml(const FileName: string);
var
  m, f : TStream;
  Documento : TXMLDocument;
  TipoDocTributario, FechaAutorizacionTexto : string;
  n_NumeroInicio, n_NumeroFin, n_Contador : integer;
begin

  QMFolios.Edit;
  //Guardamos el XML en DS de folios
  m := DMSIIFolios.QMFolios.CreateBlobStream(DMSIIFolios.QMFoliosXML_AUTORIZACION_FOLIOS, bmWrite);
  try
     f := TFileStream.Create(FileName, fmOpenRead);
     try
        m.CopyFrom(f, f.Size);
     finally
        f.Free;
     end;
  finally
     m.Free;
  end;

  //Obtenemos informacion del XML de autorización de folios
  Documento := TXMLDocument.Create(Self);
  with Documento do
  begin
     XML.Text := DMSIIFolios.QMFoliosXML_AUTORIZACION_FOLIOS.AsString;
     DMMain.Log('Documento.Active := True');
     // Se activa para poder utilizar el componente
     Active := True;
     DMMain.Log('Documento.Encoding = utf-8');
     // Codigifacion UTF-8
     Encoding := 'utf-8';
     DMMain.Log('Documento.NodeIndentStr = #8');
     // Caracter para indentar el fichero XML
     NodeIndentStr := #8;

     DMMain.Log('Obtener nodos');
     n_NumeroInicio := StrToInt(DameDato(DocumentElement, ['CAF', 'DA', 'RNG', 'D']));
     n_NumeroFin := StrToInt(DameDato(DocumentElement, ['CAF', 'DA', 'RNG', 'H']));
     n_Contador := StrToInt(DameDato(DocumentElement, ['CAF', 'DA', 'RNG', 'D']));
     FechaAutorizacionTexto := DameDato(DocumentElement, ['CAF', 'DA', 'FA']);
     TipoDocTributario := DameDato(DocumentElement, ['CAF', 'DA', 'TD']);
  end;

  //Verificamos que la autorizacion corresponda al mismo tipo de documento tributario
  if (QMFoliosTIPO_DOC_TRIBUTARIO.AsString <> TipoDocTributario) then
  begin
     QMFolios.Cancel;
     raise Exception.Create(_('El Tipo de documento tributario no corresponde a la autorización de folios ' + TipoDocTributario + ' <> ' + QMFoliosTIPO_DOC_TRIBUTARIO.AsString));
  end;

  //Verificamos que ya no tenga folios disponibles
  if ((QMFoliosCONTADOR.AsInteger < QMFoliosNUMERO_FINAL.AsInteger) and (QMFoliosCONTADOR.AsInteger <> 0)) then
  begin
     QMFolios.Cancel;
     raise Exception.Create(_('No puede actualizar la autorizacion de folios, porque aún cuenta con folios disponibles para el T. Doc. Tributario: ' + QMFoliosTIPO_DOC_TRIBUTARIO.AsString));
  end;

  //Verificamos que los folios nuevos sean continuos al anterior
  if (((QMFoliosCONTADOR.AsInteger + 1) <> n_NumeroInicio) and (QMFoliosCONTADOR.AsInteger <> 0)) then
  begin
     QMFolios.Cancel;
     raise Exception.Create(_('No puede actualizar la autorizacion de folios, porque los nuevos folios no son continuos al ultimo folio usado'));
  end;

  QMFoliosNUMERO_INICIO.AsInteger := n_NumeroInicio;
  QMFoliosNUMERO_FINAL.AsInteger := n_NumeroFin;
  QMFoliosCONTADOR.AsInteger := n_Contador;
  QMFoliosFECHA_AUTORIZACION.AsDateTime := StrToDate(Copy(FechaAutorizacionTexto, 9, 2) + '/' + Copy(FechaAutorizacionTexto, 6, 2) + '/' + Copy(FechaAutorizacionTexto, 1, 4));
  QMFoliosACTIVO.AsInteger := 1;
  QMFolios.Post;
end;

function TDMSIIFolios.DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
var
  i : integer;
begin
  Result := nil;
  i := 0;

  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.ChildNodes.FindNode(a[i]);
     Inc(i);
  end;

  Result := Nodo;
end;

function TDMSIIFolios.DameDato(Nodo: IXMLNode; a: array of string): string;
begin
  Result := '';
  Nodo := DameNodo(Nodo, a);
  // Si encuentro el nodo, obtengo el texto
  if Assigned(Nodo) then
     Result := Nodo.Text
  else
     Result := '';
end;

procedure TDMSIIFolios.QMFoliosTIPO_DOC_TRIBUTARIOChange(Sender: TField);
begin
  //Dependiendo del tipo de Doc tributario asignamos el tipo de documento por defecto
  if ((QMFolios.State = dsInsert) or (QMFolios.State = dsEdit)) then
  begin
     if ((QMFoliosTIPO_DOC_TRIBUTARIO.AsString = '33') or (QMFoliosTIPO_DOC_TRIBUTARIO.AsString = '56') or (QMFoliosTIPO_DOC_TRIBUTARIO.AsString = '61')) then
        QMFoliosTIPO.AsString := 'FAC'
     else if (QMFoliosTIPO_DOC_TRIBUTARIO.AsString = '52') then
        QMFoliosTIPO.AsString := 'ALB';
  end;
end;

procedure TDMSIIFolios.AsignaUltimoFolio;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SII_FOLIOS ');
        SQL.Add(' SET ');
        SQL.Add(' CONTADOR = (SELECT MAX(FOLIO) + 1 ');

        if (QMFoliosTIPO.AsString = 'FAC') then
           SQL.Add(' FROM GES_CABECERAS_S_FAC ')
        else if (QMFoliosTIPO.AsString = 'ALB') then
           SQL.Add(' FROM GES_CABECERAS_S_ALB ')
        else
           raise Exception.Create(_('Tipo de documento no valido'));

        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO =  :TIPO AND ');
        SQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO) ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND ');
        SQL.Add(' ACTIVO = 1 ');
        Params.ByName['EMPRESA'].AsInteger := QMFoliosEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMFoliosCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMFoliosSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMFoliosTIPO.AsString;
        Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := QMFoliosTIPO_DOC_TRIBUTARIO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  QMFolios.Refresh;
end;

procedure TDMSIIFolios.LimpiaFolioEnviado;
var
  Folio : integer;
begin
  if PideDato('INT', Folio, _('Eliminando Folio')) then
  begin
     if ((Folio >= QMFoliosNUMERO_INICIO.AsInteger) and (Folio <= QMFoliosNUMERO_FINAL.AsInteger)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' EXECUTE PROCEDURE SII_ELIMINA_DATOS_ENVIO_DTE(:EMPRESA, :CANAL, :SERIE, :TIPO, :FOLIO, :TIPO_DOC_TRIBUTARIO, ');
              SQL.Add(' (SELECT FIRST 1 ID_S ');

              if (QMFoliosTIPO.AsString = 'FAC') then
                 SQL.Add(' FROM GES_CABECERAS_S_FAC ')
              else if (QMFoliosTIPO.AsString = 'ALB') then
                 SQL.Add(' FROM GES_CABECERAS_S_ALB ')
              else
                 raise Exception.Create(_('Tipo de documento no valido'));

              SQL.Add(' WHERE EMPRESA = :EMPRESA AND SERIE = :SERIE AND ');
              SQL.Add(' TIPO = :TIPO AND TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND FOLIO = :FOLIO)) ');

              Params.ByName['EMPRESA'].AsInteger := QMFoliosEMPRESA.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMFoliosCANAL.AsInteger;
              Params.ByName['SERIE'].AsString := QMFoliosSERIE.AsString;
              Params.ByName['TIPO'].AsString := QMFoliosTIPO.AsString;
              Params.ByName['FOLIO'].AsInteger := Folio;
              Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := QMFoliosTIPO_DOC_TRIBUTARIO.AsString;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
        QMFolios.Refresh;
     end
     else
        raise Exception.Create(_('El folio no corresponde a la autorizacion de folios'));
  end;
end;

procedure TDMSIIFolios.AsignaContadorFolioAlUltimoDelCaf;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SII_FOLIOS ');
        SQL.Add(' SET ');
        SQL.Add(' CONTADOR = NUMERO_FINAL ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO ');
        Params.ByName['EMPRESA'].AsInteger := QMFoliosEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMFoliosCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMFoliosSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMFoliosTIPO.AsString;
        Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := QMFoliosTIPO_DOC_TRIBUTARIO.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  QMFolios.Refresh;
end;

end.
