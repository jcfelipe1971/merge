unit UIsoDMPunteo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery;

type
  TIsoDMPunteo = class(TDataModule)
     QMPunteo: TFIBTableSet;
     DSQMPunteo: TDataSource;
     TLocal: THYTransaction;
     QMPunteoEMPRESA: TIntegerField;
     QMPunteoRIC: TIntegerField;
     QMPunteoTIPO: TFIBStringField;
     QMPunteoCLI_PRO_INTE: TIntegerField;
     QMPunteoSITUACION: TFIBStringField;
     QMPunteoSERIE_DOC: TFIBStringField;
     QMPunteoNUM_DOC: TIntegerField;
     QMPunteoDESCRIPCION: TFIBStringField;
     QMPunteoFECHA_INC: TDateTimeField;
     QMPunteoRESPONSABLE: TIntegerField;
     QMPunteoESTADO: TIntegerField;
     QMPunteoNOTAS: TBlobField;
     QMPunteoTIRAR: TIntegerField;
     QMPunteoDEVOLVER: TIntegerField;
     QMPunteoACEPTAR: TIntegerField;
     QMPunteoOTROS: TIntegerField;
     QMPunteoVBCALIDAD: TIntegerField;
     QMPunteoVBRESDEPARTAMENTO: TIntegerField;
     QMPunteoCANTIDAD: TIntegerField;
     xDescTipo: TFIBTableSet;
     DSxDescTipo: TDataSource;
     xDescTipoTIPO: TFIBStringField;
     xDescTipoDESCRIPCION: TFIBStringField;
     QMPunteoxDescTipo: TStringField;
     xDescCliPro: TFIBTableSet;
     DSxDescCliPro: TDataSource;
     xDescCliProTERCERO: TIntegerField;
     xDescCliProNOMBRE_R_SOCIAL: TFIBStringField;
     xDescCliProNIF: TFIBStringField;
     xDescCliProDIR_COMPLETA: TFIBStringField;
     QMPunteoxDescCliPro: TStringField;
     QMPunteoPOR_CLASIFICA: TIntegerField;
     QMPunteoFECHA_CIERRE: TDateTimeField;
     QMPunteoNDEVOLUCION: TIntegerField;
     QMPunteoCONTADOR: TFIBStringField;
     QMPunteoDEPARTAMENTO: TFIBStringField;
     QMPunteoEVIDENCIA: TFIBStringField;
     QMPunteoNDOCCLI: TIntegerField;
     QMPunteoREFERENCIACLI: TFIBStringField;
     QTancarTots: THYFIBQuery;
     QMPunteoRECUPERAR_ISO: TIntegerField;
     procedure DMIsoPunteoCreate(Sender: TObject);
     procedure QMPunteoAfterInsert(DataSet: TDataSet);
     procedure QMPunteoAfterOpen(DataSet: TDataSet);
     procedure QMPunteoAfterPost(DataSet: TDataSet);
     procedure QMPunteoBeforeDelete(DataSet: TDataSet);
     procedure QMPunteoxDescTipoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPunteoxDescCliProGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMPunteoBeforeInsert(DataSet: TDataSet);
     procedure QMPunteoNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     Base: string;
     procedure Filtrar(Tipo: integer);
     procedure Validar;
  end;

var
  IsoDMPunteo : TIsoDMPunteo;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TIsoDMPunteo.DMIsoPunteoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMPunteo, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMPunteo, '10000', True);

  Base := 'SELECT * FROM ISO_NO_CONFORMIDAD WHERE EMPRESA = :EMPRESA AND ESTADO = 0';
end;

procedure TIsoDMPunteo.QMPunteoAfterInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TIsoDMPunteo.QMPunteoAfterOpen(DataSet: TDataSet);
begin
  xDescTipo.Open;
  xDescCliPro.Open;
  DataSet.Cancel;
end;

procedure TIsoDMPunteo.QMPunteoAfterPost(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TIsoDMPunteo.QMPunteoBeforeDelete(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TIsoDMPunteo.QMPunteoxDescTipoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xDescTipo do
  begin
     Close;
     Params.ByName['tipo'].AsString := QMPunteoTIPO.AsString;
     Open;
  end;
  Text := xDescTipoDESCRIPCION.AsString;
end;

procedure TIsoDMPunteo.QMPunteoxDescCliProGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xDescCliPro do
  begin
     Close;
     Params.ByName['cli_pro_inte'].AsInteger := QMPunteoCLI_PRO_INTE.AsInteger;
     Open;
  end;
  Text := xDescCliProNOMBRE_R_SOCIAL.AsString;
end;

procedure TIsoDMPunteo.Filtrar(Tipo: integer);
begin
  // Filtrar
  with QMPunteo do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(Base);
     SelectSQL.Add(' AND TIPO = :TIPO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;

     if (Tipo = 0) then  // Cliente
        Params.ByName['TIPO'].AsString := 'C'
     else
     if (Tipo = 1) then  // Proveedor
        Params.ByName['TIPO'].AsString := 'P'
     else
     if (Tipo = 2) then  // Otros
        Params.ByName['TIPO'].AsString := 'O'
     else
     if (Tipo = -1) then  // Todos
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(Base);
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     end;

     Open;
  end;
end;

procedure TIsoDMPunteo.QMPunteoBeforeInsert(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TIsoDMPunteo.QMPunteoNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TIsoDMPunteo.Validar;
begin
  QTancarTots.Close;
  QTancarTots.Prepare;
  QTancarTots.ExecQuery;

  QMPunteo.Refresh;
  QMPunteo.Close;
  QMPunteo.Open;
end;

end.
