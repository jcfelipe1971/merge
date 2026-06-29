unit UDMExtraccionDatos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDataSetRO, DB, FIBDataSet, FIBTableDataSet,
  FIBDatabase, UFIBModificados, Dialogs, ComCtrls;

type
  TDMExtraccionDatos = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMExtraccion: TFIBTableSet;
     DSQMExtraccion: TDataSource;
     xResultado: TFIBTableSet;
     DSxResultado: TDataSource;
     QMExtraccionID: TIntegerField;
     QMExtraccionTITULO: TFIBStringField;
     QMExtraccionSENTENCIA: TBlobField;
     QMExtraccionTRANSACCION_READONLY: TIntegerField;
     TResultado: THYTransaction;
     procedure QMExtraccionBeforePost(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMExtraccionNewRecord(DataSet: TDataSet);
     procedure QMExtraccionBeforeDelete(DataSet: TDataSet);
  private
     { Private declarations }
     param_SYSCONF008: string;
     procedure FormatoCampos(Visual: boolean);
  public
     { Public declarations }
     procedure Cargar;
     procedure Ejecutar;
     procedure ExportaAExcel(ProgressBar: TProgressBar);
     procedure ExportaAHTML(ProgressBar: TProgressBar);
     procedure ExportaACSV(ProgressBar: TProgressBar);
  end;

var
  DMExtraccionDatos : TDMExtraccionDatos;

implementation

uses UDMMain, UEntorno, HYFIBQuery, UHojaCalc, UUtiles, Forms, UHTMLInf, UParam, UDameDato;

{$R *.dfm}

procedure TDMExtraccionDatos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMExtraccion.Open;

  // Separador decimal para numeros al generar CSV
  param_SYSCONF008 := Copy(LeeParametro('SYSCONF008'), 1, 1);
  if (Length(param_SYSCONF008) <> 1) or (not (param_SYSCONF008[1] in [',', '.'])) then
     param_SYSCONF008 := '.';
end;

procedure TDMExtraccionDatos.Cargar;
var
  i : integer;
begin
  with xResultado do
  begin
     Close;
     with Transaction do
     begin
        if InTransaction then
           Commit;

        if (QMExtraccionTRANSACCION_READONLY.AsInteger = 1) then
        begin
           TRParams.Clear;
           TRParams.Add('read');
           TRParams.Add('read_committed');
        end
        else
        begin
           TRParams.Clear;
           TRParams.Add('rec_version');
           TRParams.Add('read_committed');
           TRParams.Add('nowait');
        end;

        StartTransaction;
     end;

     if (not QMExtraccion.IsEmpty) then
     begin
        SelectSQL.Text := QMExtraccionSENTENCIA.AsString;
        for i := 0 to Params.Count - 1 do
        begin
           if (Params[i].Name = 'EMPRESA') then
              Params[i].AsInteger := REntorno.Empresa
           else
           if (Params[i].Name = 'EJERCICIO') then
              Params[i].AsInteger := REntorno.Ejercicio
           else
           if (Params[i].Name = 'CANAL') then
              Params[i].AsInteger := REntorno.Canal
           else
           if (Params[i].Name = 'SERIE') then
              Params[i].AsString := REntorno.Serie
           else
           if (Params[i].Name = 'PAIS') then
              Params[i].AsString := REntorno.Pais
           else
           if (Params[i].Name = 'PGC') then
              Params[i].AsInteger := REntorno.PGC;
        end;
     end;
  end;
end;

procedure TDMExtraccionDatos.FormatoCampos(Visual: boolean);
var
  i : integer;
begin
  with xResultado do
  begin
     // Agrego DisplayFormat segun el tipo de campo
     for i := 0 to FieldCount - 1 do
     begin
        try
           with Fields[i] do
           begin
              if DataType in [ftSmallint, ftInteger, ftWord] then
              begin
                 if (Visual) then
                    TIntegerField(Fields[i]).DisplayFormat := ',0'
                 else
                    TIntegerField(Fields[i]).DisplayFormat := '0';
              end
              else
              if DataType in [ftFloat, ftCurrency] then
              begin
                 if (Visual) then
                    TFloatField(Fields[i]).DisplayFormat := ',0.000'
                 else
                    TFloatField(Fields[i]).DisplayFormat := '0.000';
              end
              else
              if DataType in [ftDateTime, ftDate, ftTime] then
                 TDateTimeField(Fields[i]).DisplayFormat := 'dd/mm/yyyy hh:nn:ss';
           end;
        except
        end;
     end;
  end;
end;

procedure TDMExtraccionDatos.Ejecutar;
begin
  with xResultado do
  begin
     DisableControls;
     try
        Close;
        with Transaction do
        begin
           if InTransaction then
              Commit;
           StartTransaction;
        end;
        Open;
        Transaction.CommitRetaining;

        FormatoCampos(True);
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMExtraccionDatos.QMExtraccionBeforePost(DataSet: TDataSet);
begin
  // Verificamos que el usuario tenga un perfil administrador
  if (DamePerfilUsuario(REntorno.Usuario) <> 0) then
     raise Exception.Create(_('Solo un usuario administrador puede modificar una extraccion de datos'));

  if (QMExtraccion.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT COALESCE(MAX(ID) + 1, 1) FROM SYS_EXTRACCION_DATOS';
           ExecQuery;
           QMExtraccionID.AsInteger := FieldByName['COALESCE'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMExtraccionDatos.QMExtraccionBeforeDelete(DataSet: TDataSet);
begin
  // Verificamos que el usuario tenga un perfil administrador
  if (DamePerfilUsuario(REntorno.Usuario) <> 0) then
     raise Exception.Create(_('Solo un usuario administrador puede modificar una extraccion de datos'));
end;

procedure TDMExtraccionDatos.ExportaAExcel(ProgressBar: TProgressBar);
var
  //HCalc : THojaCalc;
  //f, c, i : integer;
  Archivo : string;
begin
  inherited;
  Archivo := Format('%s_%s.xls', [Trim(QMExtraccionTITULO.AsString), FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMExtraccionDatos_Excel') then
  begin
     ExportarExcel(Archivo, DSxResultado, True, False, ProgressBar);
  end;
end;

procedure TDMExtraccionDatos.ExportaACSV(ProgressBar: TProgressBar);
var
  Archivo : string;
begin
  ProgressBar.Position := 0;
  ProgressBar.Visible := True;
  ProgressBar.Max := 100;

  // El componente exporta del registro actual en adelante.
  xResultado.First;
  xResultado.DisableControls;
  try
     try
        ProgressBar.Position := 50;
        Archivo := Format('%s_%s.csv', [Trim(QMExtraccionTITULO.AsString), FormatDateTime('yyyymmdd-hhnnss', Now)]);
        if MySaveDialog(Archivo, 'CSV', '', 'DMExtraccionDatos_CSV') then
        begin
           FormatoCampos(False);
           ExportarCSV(Archivo, DSxResultado, ';', True, True, False, param_SYSCONF008);
           FormatoCampos(True);
        end;
     finally
        ProgressBar.Position := 100;
        ProgressBar.Visible := False;
     end;
  finally
     xResultado.EnableControls;
  end;
end;

procedure TDMExtraccionDatos.ExportaAHTML(ProgressBar: TProgressBar);
var
  hInf : tLstHTML;
begin
  ProgressBar.Position := 0;
  ProgressBar.Visible := True;
  ProgressBar.Max := 100;

  // El componente exporta del registro actual en adelante.
  xResultado.First;
  xResultado.DisableControls;
  try
     try
        hInf := tLstHTML.Create(QMExtraccionTITULO.Text);
        try
           hInf.GeneraInforme(DSxResultado);
           ProgressBar.Position := 50;
           hInf.LanzaInforme(0);
        finally
           hInf.Free;
        end;
     finally
        ProgressBar.Position := 100;
        ProgressBar.Visible := False;
     end;
  finally
     xResultado.EnableControls;
  end;
end;

procedure TDMExtraccionDatos.QMExtraccionNewRecord(DataSet: TDataSet);
begin
  QMExtraccionTRANSACCION_READONLY.AsInteger := 1;
end;

end.
