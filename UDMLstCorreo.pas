unit UDMLstCorreo;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FIBDatabase,
  UFIBModificados, FR_Class, Fr_HYReport, FIBDataSetRO, FIBQuery,
  HYFIBQuery, frxClass, frxHYReport, frxDBSet;

type
  TDMLstCorreo = class(TDataModule)
     frCorreo: TfrHYReport;
     TLocal: THYTransaction;
     frDBxCorreo: TfrDBDataSet;
     xCorreo: TFIBDataSetRO;
     xCorreoEMPRESA: TIntegerField;
     xCorreoRIG: TIntegerField;
     xCorreoUSUARIO: TIntegerField;
     xCorreoASUNTO: TFIBStringField;
     xCorreoMENSAJE: TBlobField;
     DSxCorreo: TDataSource;
     xCorreoDetalle: TFIBDataSetRO;
     xCorreoDetalleEMPRESA: TIntegerField;
     xCorreoDetalleRIG: TIntegerField;
     xCorreoDetalleDIR: TIntegerField;
     xCorreoDetalleTIPO: TFIBStringField;
     xCorreoDetalleDESTINO_ADRESS: TFIBStringField;
     xCorreoDetalleAGRUPACION: TFIBStringField;
     xCorreoDetalleCLIENTE: TIntegerField;
     xCorreoDetalleTERCERO: TIntegerField;
     DSxCorreoDetalle: TDataSource;
     xCorreoAdjuntos: TFIBDataSetRO;
     xCorreoAdjuntosEMPRESA: TIntegerField;
     xCorreoAdjuntosRIG: TIntegerField;
     xCorreoAdjuntosDIR: TIntegerField;
     xCorreoAdjuntosFICHERO: TFIBStringField;
     xCorreoAdjuntosTAMANYO: TFloatField;
     DSxCorreoAdjuntos: TDataSource;
     frDBxCorreoDetalle: TfrDBDataSet;
     frDBxCorreoAdjuntos: TfrDBDataSet;
     xUsuarios: TFIBDataSetRO;
     xUsuariosNOMBRE_CORREO: TFIBStringField;
     xUsuariosDIR_CORREO: TFIBStringField;
     xUsuariosNOMBRE: TFIBStringField;
     DSxUsuarios: TDataSource;
     frDBxUsuarios: TfrDBDataSet;
     QDameDelTipo: TFIBQuery;
     frUserDataset1: TfrUserDataset;
     frxCorreo: TfrxHYReport;
     frxDBxCorreo: TfrxDBDataset;
     frxDBxCorreoDetalle: TfrxDBDataset;
     frxDBxCorreoAdjuntos: TfrxDBDataset;
     frxDBxUsuarios: TfrxDBDataset;
     procedure DMLstCorreoCreate(Sender: TObject);
     procedure DMLstCorreoDestroy(Sender: TObject);
     procedure xCorreoAfterOpen(DataSet: TDataSet);
     procedure frCorreoEnterRect(Memo: TStringList; View: TfrView);
     procedure frCorreoGetValue(const ParName: string; var ParValue: variant);
     procedure frxCorreoGetValue(const VarName: string; var Value: variant);
     procedure frxCorreoBeforePrint(Sender: TfrxReportComponent);
  private
     { Private declarations }
     ListaTipo, TipoAnt: string;
     function Traduce(const Tipo: string): string;
  public
     { Public declarations }
     procedure MostrarListado(Modo: byte; Rig: integer);
     procedure MostrarListadoFiltrado(Modo: byte; SWFil: integer);
  end;

var
  DMLstCorreo : TDMLstCorreo;

implementation

uses UDMListados, UFormGest, UEntorno;

{$R *.DFM}

procedure TDMLstCorreo.DMLstCorreoCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstCorreo.DMLstCorreoDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.commit;
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMLstCorreo.MostrarListado(Modo: byte; Rig: integer);
var
  str : string;
begin
  with xCorreo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Params.ByName['RIG'].AsInteger := Rig;
     Open;
  end;

  with xUsuarios do
  begin
     Close;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Open;
  end;

  DMListados.Cargar(506, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frCorreo.LoadFromFIB(REntorno.Formato, str);
     frCorreo.PrepareReport;
     case Modo of
        0: frCorreo.ShowPreparedReport;
        1: frCorreo.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxCorreo.LoadFromFIB(REntorno.Formato, str);
     frxCorreo.PrepareReport;
     case Modo of
        0: frxCorreo.ShowPreparedReport;
        1: frxCorreo.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstCorreo.xCorreoAfterOpen(DataSet: TDataSet);
begin
  xCorreoDetalle.Open;
  xCorreoAdjuntos.Open;
  xUsuarios.Open;
end;

procedure TDMLstCorreo.frCorreoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstCorreo.frCorreoGetValue(const ParName: string; var ParValue: variant);
var
  Tipo : string;
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Organizacion') then
  begin
     ParValue := REntorno.NombreEmpresa;
     TipoAnt := 'INICIA';
     ListaTipo := '';
  end;

  if (ParName = 'Fecha') then
     ParValue := DateTimeToStr(Now);

  if (ParName = 'Tipo') then
  begin
     Tipo := xCorreoDetalle.FieldByName('TIPO').AsString;
     if (Tipo <> TipoAnt) then
        with QDameDelTipo do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger :=
              xCorreoDetalle.FieldByName('EMPRESA').AsInteger;
           Params.ByName['RIG'].AsInteger := xCorreoDetalle.FieldByName('RIG').AsInteger;
           Params.ByName['TIPO'].AsString := Tipo;
           ExecQuery;
           ListaTipo := FieldByName['DESTINO_ADRESS'].AsString;
           Next;
           while not (EOF) do
           begin
              ListaTipo := ListaTipo + ', ' + FieldByName['DESTINO_ADRESS'].AsString;
              Next;
           end;
           FreeHandle;
           ParValue := Traduce(Tipo);
        end
     else
     begin
        ParValue := '';
     end;
     TipoAnt := Tipo;
  end;

  if (ParName = 'TipoVisible') then
  begin
     Tipo := xCorreoDetalle.FieldByName('TIPO').AsString;
     if (Tipo <> TipoAnt) then
        ParValue := 'Mostrar'
     else
        ParValue := 'No mostrar';
  end;

  if (ParName = 'TipoDestino') then
     ParValue := ListaTipo;
end;

function TDMLstCorreo.Traduce(const Tipo: string): string;
begin
  if (Tipo = 'TO') then
     Result := 'Para'
  else if (Tipo = 'GROUP') then
     Result := 'Grupo de Noticias'
  else if (Tipo = 'REPLYTO') then
     Result := 'Responder a'
  else if (Tipo = 'CC') then
     Result := 'Copia a'
  else if (Tipo = 'BCC') then
     Result := 'Copia Oculta a'
  else
     Result := Tipo;
end;

procedure TDMLstCorreo.MostrarListadoFiltrado(Modo: byte; SWFil: integer);
var
  str : string;
begin
  if (SWFil = 0) then
     with xCorreo do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Open;
     end;

  with xUsuarios do
  begin
     Close;
     Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
     Open;
  end;

  DMListados.Cargar(506, '');
  if (REntorno.TipoListado = 'FRF') then
  begin
     frCorreo.LoadFromFIB(REntorno.Formato, str);
     frCorreo.PrepareReport;
     case Modo of
        0: frCorreo.ShowPreparedReport;
        1: frCorreo.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxCorreo.LoadFromFIB(REntorno.Formato, str);
     frxCorreo.PrepareReport;
     case Modo of
        0: frxCorreo.ShowPreparedReport;
        1: frxCorreo.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstCorreo.frxCorreoGetValue(const VarName: string; var Value: variant);
begin
  frCorreoGetValue(VarName, Value);
end;

procedure TDMLstCorreo.frxCorreoBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

end.
