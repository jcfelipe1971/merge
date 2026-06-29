unit ZUDMInteresesAnticipos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, Windows, Messages, Graphics, Controls, Forms, Dialogs,
  FIBQuery, FR_Class, Fr_HYReport, HYFIBQuery;

type
  TZDMInteresesAnticipos = class(TDataModule)
     TLocal: THYTransaction;
     QMAnticipos: TFIBTableSet;
     DSQMAnticipos: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xClientes: TFIBDataSetRO;
     DSxClientes: TDataSource;
     SPContabilizar: THYFIBQuery;
     SPCalculoInteres: THYFIBQuery;
     xCuenta: TFIBDataSetRO;
     DSxCuenta: TDataSource;
     QMAnticiposID: TIntegerField;
     QMAnticiposEMPRESA: TIntegerField;
     QMAnticiposEJERCICIO: TIntegerField;
     QMAnticiposCANAL: TIntegerField;
     QMAnticiposCLIENTE: TIntegerField;
     QMAnticiposESTADO: TIntegerField;
     QMAnticiposINTERES: TFloatField;
     QMAnticiposFECHA_CORTE: TDateTimeField;
     QMAnticiposCONTABILIZAR: TIntegerField;
     QMAnticiposREGISTRO: TIntegerField;
     QMAnticiposASIENTO: TIntegerField;
     QMAnticiposCUENTA: TFIBStringField;
     QMAnticiposC_CONTRAPARTIDA: TFIBStringField;
     QMAnticiposCUENTA_PGC: TIntegerField;
     QMAnticiposC_CONTRAPARTIDA_PGC: TIntegerField;
     SPMarcaTodos: THYFIBQuery;
     QMAnticiposASIENTO_VISIBLE: TBooleanField;
     QMAnticiposIMPORTE_INTERES: TFloatField;
     QMAnticiposTotalInteres: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleANTICIPO: TIntegerField;
     QMDetalleTIPO_TERCERO: TFIBStringField;
     QMDetalleCOD_CLI_PRO: TIntegerField;
     QMDetalleCUENTA_CLI_PRO: TFIBStringField;
     QMDetalleC_CONTRAPARTIDA: TFIBStringField;
     QMDetalleCANTIDAD: TFloatField;
     QMDetalleCONTABILIZAR: TIntegerField;
     QMDetalleREGISTRO: TIntegerField;
     QMDetalleASIENTO: TIntegerField;
     QMDetalleFECHA: TDateTimeField;
     QMDetalleID_CAB_Z_TALONES: TIntegerField;
     QMDetalleMARCADO: TIntegerField;
     QMDetallePAGADO: TIntegerField;
     QMDetalleZ_TALON: TFIBStringField;
     QMDetalleZ_DESCRIPCION: TFIBStringField;
     QMDetalleZ_BANCO: TIntegerField;
     QMDetalleC_CONTRAPARTIDA_PGC: TIntegerField;
     QMDetalleCUENTA_CLI_PRO_PGC: TIntegerField;
     QMDetalleZ_INTERES_ANTICIPO: TFloatField;
     QMDetalleZ_FECHA_CORTE: TDateTimeField;
     QMDetalleZ_IMPORTE_INTERES: TFloatField;
     QMDetalleZ_MARCADO: TIntegerField;
     QMDetalleZ_ID_INTERES_ANTICIPO: TIntegerField;
     SPTotalInteres: THYFIBQuery;
     procedure DMAnticiposCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMAnticiposNewRecord(DataSet: TDataSet);
     procedure QMAnticiposAfterOpen(DataSet: TDataSet);
     procedure QMAnticiposAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMAnticiposCLIENTEChange(Sender: TField);
     procedure QMAnticiposC_CONTRAPARTIDAChange(Sender: TField);
     procedure QMAnticiposASIENTO_VISIBLEGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     procedure CambiaTitulo(cod_cli_pro: integer);
  public
     { Public declarations }
     procedure MostrarAnticiposDisponibles;
     procedure Contabilizar(estado: smallint; fecha_corte: TDateTime; Interes: double);
     procedure SeleccionarDeseleccionar(marcado: integer);
     function Enlace: boolean;
     procedure MostrarTodos;
  end;

var
  ZDMInteresesAnticipos : TZDMInteresesAnticipos;

implementation

uses UDMMain, UEntorno, uFBusca, UUtiles, UFormGest, ZUFMInteresesAnticipos;

{$R *.dfm}

{Todo : Utilizar TLocal/TUpdate}

procedure TZDMInteresesAnticipos.MostrarAnticiposDisponibles;
begin
  if QMAnticiposASIENTO.AsInteger = 0 then
     with QMDetalle do
     begin
        DisableControls;
        Close;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT * FROM EMP_CARTERA_ANTICIPOS ');
        SelectSQL.Add('WHERE((EMPRESA=?EMPRESA)AND(EJERCICIO<=?EJERCICIO)AND(CANAL=?CANAL)');
        SelectSQL.Add('AND TIPO_TERCERO=''CLI''');
        SelectSQL.Add('AND(COD_CLI_PRO=?COD_CLI_PRO) AND Z_MARCADO<2)');
        SelectSQL.Add(' ORDER BY EMPRESA,ANTICIPO');
        Params.ByName['COD_CLI_PRO'].AsInteger := QMAnticiposCLIENTE.AsInteger;
        Open;
        EnableControls;
     end
  else
     raise Exception.Create('Documento Bloqueado');
end;

procedure TZDMInteresesAnticipos.DMAnticiposCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMDetalleCANTIDAD.DisplayFormat := MascaraN;
  QMAnticiposINTERES.DisplayFormat := MascaraP;
  QMDetalleZ_INTERES_ANTICIPO.DisplayFormat := MascaraP;
  DMMain.FiltraTabla(QMAnticipos, '11100', True);
  CambiaTitulo(QMAnticiposCLIENTE.AsInteger);
  QMAnticipos.Close;
  QMAnticipos.Open;
  xCuenta.Open;
end;

procedure TZDMInteresesAnticipos.Graba(DataSet: TDataSet);
begin
  if QMAnticiposASIENTO.AsInteger = 0 then
  begin
     TFIBTableSet(DataSet).Transaction.CommitRetaining;
     QMAnticipos.Close;
     QMAnticipos.Open;
     QMAnticipos.Last;
  end
  else
     raise Exception.Create('Documento Bloqueado');
  //  Graba(DataSet);
end;

procedure TZDMInteresesAnticipos.QMAnticiposNewRecord(DataSet: TDataSet);
begin
  QMAnticiposEMPRESA.AsInteger := REntorno.Empresa;
  QMAnticiposEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMAnticiposCANAL.AsInteger := REntorno.Canal;
  //QMAnticiposID.AsInteger     := Anticipo;
  QMAnticiposCONTABILIZAR.AsInteger := 0;
  //QMAnticiposFECHA.AsDateTime       := Rentorno.FechaTrab;
end;

procedure TZDMInteresesAnticipos.QMAnticiposAfterOpen(DataSet: TDataSet);
begin
  xClientes.Close;
  xClientes.Open;
  xCuenta.Close;
  xCuenta.Open;

  with QMDetalle do
  begin
     DisableControls;
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM EMP_CARTERA_ANTICIPOS ');
     SelectSQL.Add('WHERE((EMPRESA=?EMPRESA)AND(EJERCICIO<=?EJERCICIO)AND(CANAL=?CANAL)');
     SelectSQL.Add('AND TIPO_TERCERO=''CLI''');
     SelectSQL.Add('AND(COD_CLI_PRO=?COD_CLI_PRO)');
     SelectSQL.Add('AND (Z_ID_INTERES_ANTICIPO=?Z_ID_INTERES_ANTICIPO) AND Z_MARCADO<2)');
     SelectSQL.Add(' ORDER BY EMPRESA,ANTICIPO');
     Params.ByName['COD_CLI_PRO'].AsInteger := QMAnticiposCLIENTE.AsInteger;
     Params.ByName['Z_ID_INTERES_ANTICIPO'].AsInteger := QMAnticiposID.AsInteger;
     Open;
     EnableControls;
  end;
end;

procedure TZDMInteresesAnticipos.QMAnticiposAfterScroll(DataSet: TDataSet);
begin
  if QMAnticiposASIENTO.AsInteger = 0 then
  begin
     with QMDetalle do
     begin
        DisableControls;
        Close;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT * FROM EMP_CARTERA_ANTICIPOS ');
        SelectSQL.Add('WHERE((EMPRESA=?EMPRESA)AND(EJERCICIO<=?EJERCICIO)AND(CANAL=?CANAL)');
        SelectSQL.Add('AND TIPO_TERCERO=''CLI''');
        SelectSQL.Add('AND(COD_CLI_PRO=?COD_CLI_PRO) AND Z_MARCADO<2)');
        SelectSQL.Add(' ORDER BY EMPRESA,ANTICIPO');
        Params.ByName['COD_CLI_PRO'].AsInteger := QMAnticiposCLIENTE.AsInteger;
        Open;
        EnableControls;
     end;
  end
  else
     with QMDetalle do
     begin
        DisableControls;
        Close;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT * FROM EMP_CARTERA_ANTICIPOS ');
        SelectSQL.Add('WHERE((EMPRESA=?EMPRESA)AND(EJERCICIO<=?EJERCICIO)AND(CANAL=?CANAL)');
        SelectSQL.Add('AND TIPO_TERCERO=''CLI''');
        SelectSQL.Add('AND(COD_CLI_PRO=?COD_CLI_PRO)');
        SelectSQL.Add('AND (Z_ID_INTERES_ANTICIPO=?Z_ID_INTERES_ANTICIPO) AND Z_MARCADO<2)');
        SelectSQL.Add(' ORDER BY EMPRESA,ANTICIPO');
        Params.ByName['COD_CLI_PRO'].AsInteger := QMAnticiposCLIENTE.AsInteger;
        Params.ByName['Z_ID_INTERES_ANTICIPO'].AsInteger := QMAnticiposID.AsInteger;
        Open;
        EnableControls;
     end;
end;

procedure TZDMInteresesAnticipos.QMDetalleAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TZDMInteresesAnticipos.QMDetalleBeforeEdit(DataSet: TDataSet);
begin
  if ((QMAnticipos.State = dsEdit) or (QMAnticipos.State = dsInsert)) then
     QMAnticipos.Post;
end;

procedure TZDMInteresesAnticipos.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMAnticipos.State = dsEdit) or (QMAnticipos.State = dsInsert)) then
     QMAnticipos.Post;

  if QMDetalle.State = dsInsert then
     DataSet.Cancel;
end;

procedure TZDMInteresesAnticipos.QMAnticiposCLIENTEChange(Sender: TField);
begin
  CambiaTitulo(Sender.AsInteger);
end;

procedure TZDMInteresesAnticipos.CambiaTitulo(cod_cli_pro: integer);
begin
  xClientes.Close;
  xClientes.Params.ByName['cod_cli_pro'].AsInteger := cod_cli_pro;
  xClientes.Open;
end;

procedure TZDMInteresesAnticipos.Contabilizar(estado: smallint; fecha_corte: TDateTime; Interes: double);
begin
  with SPCalculoInteres do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ID'].AsInteger := QMAnticiposID.AsInteger;
     Params.ByName['INTERES'].AsFloat := QMAnticiposINTERES.AsFloat;
     Params.ByName['FECHA_CORTE'].AsDateTime := QMAnticiposFECHA_CORTE.AsDateTime;
     Params.ByName['COD_CLI_PRO'].AsInteger := QMAnticiposCLIENTE.AsInteger;
     ExecQuery;
     FreeHandle;
  end;

  with SPContabilizar do
  begin
     Close;
     Params.ByName['ESTADO'].AsInteger := estado;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ANTICIPO'].AsInteger := QMAnticiposID.AsInteger;
     ExecQuery;
     FreeHandle;
  end;
  QMAnticipos.Refresh;

  with QMDetalle do
  begin
     DisableControls;
     Close;
     //  orden := OrdenadoPor;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM EMP_CARTERA_ANTICIPOS ');
     SelectSQL.Add('WHERE((EMPRESA=?EMPRESA)AND(EJERCICIO<=?EJERCICIO)AND(CANAL=?CANAL)');
     SelectSQL.Add('AND TIPO_TERCERO=''CLI''');
     SelectSQL.Add('AND(COD_CLI_PRO=?COD_CLI_PRO)');
     SelectSQL.Add('AND (Z_ID_INTERES_ANTICIPO=?Z_ID_INTERES_ANTICIPO) AND Z_MARCADO<2)');
     SelectSQL.Add(' ORDER BY EMPRESA,ANTICIPO');
     Params.ByName['COD_CLI_PRO'].AsInteger := QMAnticiposCLIENTE.AsInteger;
     Params.ByName['Z_ID_INTERES_ANTICIPO'].AsInteger := QMAnticiposID.AsInteger;
     //  Ordenar(orden);
     Open;
     EnableControls;
  end;
end;

procedure TZDMInteresesAnticipos.QMAnticiposC_CONTRAPARTIDAChange(Sender: TField);
begin
  xCuenta.Close;
  xCuenta.Params.ByName['c_contrapartida'].AsString := Sender.AsString;
  xCuenta.Open;
end;

procedure TZDMInteresesAnticipos.SeleccionarDeseleccionar(marcado: integer);
begin
  with SPMarcaTodos do
  begin
     SQL.Text := 'update emp_cartera_anticipos set z_marcado =?marcado where ' +
        ' empresa=?empresa and canal=?canal and (ejercicio<=?ejercicio) ' +
        ' and tipo_tercero=''CLI'' and cod_cli_pro=?cod_cli_pro ';
     Params.ByName['marcado'].AsInteger := marcado;
     Params.ByName['empresa'].AsInteger := REntorno.empresa;
     Params.ByName['ejercicio'].AsInteger := REntorno.ejercicio;
     Params.ByName['canal'].AsInteger := REntorno.canal;
     Params.ByName['cod_cli_pro'].AsInteger := QMAnticiposCLIENTE.AsInteger;
     ExecQuery;
     Transaction.CommitRetaining;
     FreeHandle;
  end;
  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TZDMInteresesAnticipos.QMAnticiposASIENTO_VISIBLEGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMAnticiposCONTABILIZAR.AsInteger = 1 then
     Text := QMAnticiposASIENTO.AsString
  else
     Text := '';
end;

function TZDMInteresesAnticipos.Enlace: boolean;
begin
  Result := (not (QMAnticipos.State in [dsEdit, dsInsert]) and (QMAnticiposCONTABILIZAR.AsInteger = 1));
end;

procedure TZDMInteresesAnticipos.MostrarTodos;
begin
  with QMDetalle do
  begin
     DisableControls;
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM EMP_CARTERA_ANTICIPOS ');
     SelectSQL.Add('WHERE((EMPRESA=?EMPRESA)AND(EJERCICIO<=?EJERCICIO)AND(CANAL=?CANAL)');
     SelectSQL.Add('AND TIPO_TERCERO=''CLI''');
     SelectSQL.Add('AND(COD_CLI_PRO=?COD_CLI_PRO))');
     SelectSQL.Add(' ORDER BY EMPRESA,ANTICIPO');
     Params.ByName['COD_CLI_PRO'].AsInteger := QMAnticiposCLIENTE.AsInteger;
     Open;
     EnableControls;
  end;
end;

end.
