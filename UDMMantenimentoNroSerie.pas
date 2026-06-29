unit UDMMantenimentoNroSerie;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados, FIBQuery,
  HYFIBQuery, FIBDataSetRO;

type
  TDMMantenimientoNroSerie = class(TDataModule)
     TLocal: THYTransaction;
     xNroSerie: TFIBTableSet;
     QGeneral: THYFIBQuery;
     xNroSerieEMPRESA: TIntegerField;
     xNroSerieARTICULO: TFIBStringField;
     xNroSerieNRO_SERIE: TFIBStringField;
     xNroSerieDEVOLUCION: TIntegerField;
     xNroSerieEJERCICIO_ENT: TIntegerField;
     xNroSerieCANAL_ENT: TIntegerField;
     xNroSerieSERIE_ENT: TFIBStringField;
     xNroSerieRIG_ENT: TIntegerField;
     xNroSerieLINEA_ENT: TIntegerField;
     xNroSerieALMACEN_ENT: TFIBStringField;
     xNroSerieFECHA_ENT: TDateTimeField;
     xNroSeriePROVEEDOR: TIntegerField;
     xNroSerieEJERCICIO_SAL: TIntegerField;
     xNroSerieCANAL_SAL: TIntegerField;
     xNroSerieSERIE_SAL: TFIBStringField;
     xNroSerieRIG_SAL: TIntegerField;
     xNroSerieLINEA_SAL: TIntegerField;
     xNroSerieALMACEN_SAL: TFIBStringField;
     xNroSerieCLIENTE: TIntegerField;
     xNroSerieFECHA_SAL: TDateTimeField;
     xNroSerieEJERCICIO_MOV: TIntegerField;
     xNroSerieCANAL_MOV: TIntegerField;
     xNroSerieSERIE_MOV: TFIBStringField;
     xNroSerieRIG_MOV: TIntegerField;
     xNroSerieLINEA_MOV: TIntegerField;
     xNroSerieALMACEN_ORI_MOV: TFIBStringField;
     xNroSerieFECHA_MOV: TDateTimeField;
     xNroSerieALMACEN_DEST_MOV: TFIBStringField;
     xNroSerieTITULO_PROVEEDOR: TFIBStringField;
     xNroSerieTITULO_CLIENTE: TFIBStringField;
     xNroSerieTITULO_ALMACEN_ENT: TFIBStringField;
     xNroSerieTITULO_ALMACEN_SAL: TFIBStringField;
     xNroSerieTITULO_ALMACEN_ORI_MOV: TFIBStringField;
     xNroSerieTITULO_ALMACEN_DEST_MOV: TFIBStringField;
     DSxNroSerie: TDataSource;
     xNroSerieID: TIntegerField;
     xNroSerieDEVOLUCION_VENTA: TIntegerField;
     xNroSerieEJERCICIO_DEV: TIntegerField;
     xNroSerieCANAL_DEV: TIntegerField;
     xNroSerieSERIE_DEV: TFIBStringField;
     xNroSerieRIG_DEV: TIntegerField;
     xNroSerieLINEA_DEV: TIntegerField;
     xNroSerieALMACEN_DEV: TFIBStringField;
     xNroSerieFECHA_DEV: TDateTimeField;
     xNroSerieTITULO_ALMACEN_DEV: TFIBStringField;
     xNroSerieEJERCICIO_MOE: TIntegerField;
     xNroSerieCANAL_MOE: TIntegerField;
     xNroSerieSERIE_MOE: TFIBStringField;
     xNroSerieRIG_MOE: TIntegerField;
     xNroSerieLINEA_MOE: TIntegerField;
     xNroSerieALMACEN_MOE: TFIBStringField;
     xNroSerieFECHA_MOE: TDateTimeField;
     xNroSerieTITULO_ALMACEN_MOE: TFIBStringField;
     xNroSerieEJERCICIO_MOS: TIntegerField;
     xNroSerieCANAL_MOS: TIntegerField;
     xNroSerieSERIE_MOS: TFIBStringField;
     xNroSerieRIG_MOS: TIntegerField;
     xNroSerieLINEA_MOS: TIntegerField;
     xNroSerieALMACEN_MOS: TFIBStringField;
     xNroSerieFECHA_MOS: TDateTimeField;
     xNroSerieTITULO_ALMACEN_MOS: TFIBStringField;
     xNroSerieEJERCICIO_DEC: TIntegerField;
     xNroSerieCANAL_DEC: TIntegerField;
     xNroSerieSERIE_DEC: TFIBStringField;
     xNroSerieRIG_DEC: TIntegerField;
     xNroSerieLINEA_DEC: TIntegerField;
     xNroSerieALMACEN_DEC: TFIBStringField;
     xNroSerieFECHA_DEC: TDateTimeField;
     xNroSerieTITULO_ALMACEN_DEC: TFIBStringField;
     xNroSerieCANAL_DST_MOV: TIntegerField;
     xNroSerieMOVIMIENTO: TIntegerField;
     xMovimientos: TFIBDataSetRO;
     xMovimientosTIPO: TFIBStringField;
     xMovimientosSERIE_ENT: TFIBStringField;
     xMovimientosRIG_ENT: TIntegerField;
     xMovimientosLINEA_ENT: TIntegerField;
     xMovimientosNRO_SERIE: TFIBStringField;
     DSxMovimientos: TDataSource;
     procedure DMMantenimentoNroSerieCreate(Sender: TObject);
     procedure DMMantenimentoNroSerieDestroy(Sender: TObject);
     procedure xNroSerieAfterScroll(DataSet: TDataSet);
     procedure xNroSerieBeforeInsert(DataSet: TDataSet);
     procedure xNroSerieNewRecord(DataSet: TDataSet);
     procedure xNroSerieAfterPost(DataSet: TDataSet);
     procedure xNroSerieBeforePost(DataSet: TDataSet);
     procedure xNroSerieAfterCancel(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtra(Condicion: string; modo: byte);
     procedure MuestraMovimientos;
  end;

var
  DMMantenimientoNroSerie : TDMMantenimientoNroSerie;

implementation

uses UDMMain, UFMMantenimentoNroSerie, UEntorno;

{$R *.DFM}

procedure TDMMantenimientoNroSerie.DMMantenimentoNroSerieCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  Filtra('', 1);
end;

procedure TDMMantenimientoNroSerie.DMMantenimentoNroSerieDestroy(Sender: TObject);
begin
  xNroSerie.Close;
  if TLocal.InTransaction then
     TLocal.Commit;
end;

procedure TDMMantenimientoNroSerie.xNroSerieAfterScroll(DataSet: TDataSet);
begin
  if xNroSerie.State = dsBrowse then
  begin
     with Qgeneral do
     begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT TITULO_LARGO AS TITULO FROM ART_ARTICULOS WHERE EMPRESA=' +
           IntToStr(xNroSerieEMPRESA.AsInteger) + ' AND ARTICULO = ''' +
           xNroSerieARTICULO.AsString + '''');
        ExecQuery;
        FMMantenimientoNroSerie.EditTitulo.Text := FieldByName['TITULO'].AsString;

        if ((not xNroSerieEJERCICIO_SAL.IsNull) and
           (xNroSerieEJERCICIO_SAL.AsInteger <> 0) and
           (xNroSerieRIG_SAL.AsInteger <> 0)) then
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT NOMBRE_R_SOCIAL FROM SYS_TERCEROS ' +
              'WHERE TERCERO =' +
              '   (SELECT TERCERO FROM GES_CABECERAS_S' +
              '    WHERE EMPRESA =' + xNroSerieEMPRESA.AsString + ' AND' +
              '      EJERCICIO = ' + xNroSerieEJERCICIO_SAL.AsString + ' AND' +
              '      CANAL = ' + xNroSerieCANAL_SAL.AsString + ' AND' +
              '      SERIE = ''' + xNroSerieSERIE_SAL.AsString + ''' AND' +
              '      TIPO = ''ALB'' AND' +
              '      RIG = ' + xNroSerieRIG_SAL.AsString + ')');
           ExecQuery;
           FMMantenimientoNroSerie.EdCliente.Text :=
              FieldByName['NOMBRE_R_SOCIAL'].AsString;
        end
        else
           FMMantenimientoNroSerie.EdCliente.Text := '';

        if ((not xNroSerieEJERCICIO_ENT.IsNull) and
           (xNroSerieEJERCICIO_ENT.AsInteger <> 0) and
           (xNroSerieRIG_ENT.AsInteger <> 0)) then
        begin
           Close;
           SQL.Clear;
           SQL.Add('SELECT NOMBRE_R_SOCIAL FROM SYS_TERCEROS ' +
              'WHERE TERCERO =' +
              '   (SELECT TERCERO FROM GES_CABECERAS_E_ALB' +
              '    WHERE EMPRESA=' + xNroSerieEMPRESA.AsString + ' AND' +
              '      EJERCICIO = ' + xNroSerieEJERCICIO_ENT.AsString + ' AND' +
              '      CANAL = ' + xNroSerieCANAL_ENT.AsString + ' AND' +
              '      SERIE = ''' + xNroSerieSERIE_ENT.AsString + ''' AND' +
              '      TIPO = ''ALP'' AND' +
              '      RIG = ' + xNroSerieRIG_ENT.AsString + ')');
           ExecQuery;
           FMMantenimientoNroSerie.EdProveedor.Text :=
              FieldByName['NOMBRE_R_SOCIAL'].AsString;
        end
        else
           FMMantenimientoNroSerie.EdProveedor.Text := '';
     end;
  end;
end;

procedure TDMMantenimientoNroSerie.xNroSerieBeforeInsert(DataSet: TDataSet);
begin
  with FMMantenimientoNroSerie do
  begin
     DBEFArticulo.Enabled := True;
     DBEFArticulo.Color := clWindow;
     DBEFArticulo.Text := '';
     HYDBENroSerie.Enabled := True;
     HYDBENroSerie.Color := clWindow;
     HYDBENroSerie.Text := '';

     EFArticulo.Enabled := False;
     EFNroSerie.Enabled := False;
     EFArticulo.Color := clInfoBk;
     EFNroSerie.Color := clInfoBk;
  end;
end;

procedure TDMMantenimientoNroSerie.xNroSerieNewRecord(DataSet: TDataSet);
begin
  xNroSerieEMPRESA.AsInteger := REntorno.Empresa;
  xNroSerieEJERCICIO_ENT.AsInteger := REntorno.Ejercicio;
  xNroSerieCANAL_ENT.AsInteger := REntorno.Canal;
  xNroSerieFECHA_ENT.AsDateTime := Date;
  xNroSerieFECHA_SAL.AsDateTime := Date;
end;

procedure TDMMantenimientoNroSerie.xNroSerieAfterPost(DataSet: TDataSet);
begin
  with FMMantenimientoNroSerie do
  begin
     DBEFArticulo.Enabled := False;
     DBEFArticulo.Color := clInfoBk;
     HYDBENroSerie.Enabled := False;
     HYDBENroSerie.Color := clInfoBk;

     EFArticulo.Enabled := True;
     EFNroSerie.Enabled := True;
     EFArticulo.Color := clWindow;
     EFNroSerie.Color := clWindow;
  end;
end;

procedure TDMMantenimientoNroSerie.xNroSerieBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'CONTA_NRO_SERIE_KRI', 'ID');
end;

procedure TDMMantenimientoNroSerie.Filtra(Condicion: string; modo: byte);
begin
  with xNroSerie do
  begin
     DisableControls;
     Close;
     if (Condicion <> '') then
     begin
        case Modo of
           1:
           begin
              SelectSQL.Text :=
                 'SELECT * FROM NRO_SERIE_KRI WHERE EMPRESA = ?EMPRESA AND NRO_SERIE = ?NRO_SERIE';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['NRO_SERIE'].AsString := Condicion;
           end;
           2:
           begin
              Close;
              SelectSQL.Text :=
                 'SELECT * FROM NRO_SERIE_KRI WHERE EMPRESA = ?EMPRESA AND ARTICULO = ?ARTICULO';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ARTICULO'].AsString := Condicion;
           end;
        end;
     end
     else
     begin
        SelectSQL.Text :=
           'SELECT * FROM NRO_SERIE_KRI WHERE EMPRESA = ?EMPRESA AND NRO_SERIE > '' ''';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     end;
     Open;
     EnableControls;
  end;
end;

procedure TDMMantenimientoNroSerie.xNroSerieAfterCancel(DataSet: TDataSet);
begin
  with FMMantenimientoNroSerie do
  begin
     DBEFArticulo.Enabled := False;
     DBEFArticulo.Color := clInfoBk;
     HYDBENroSerie.Enabled := False;
     HYDBENroSerie.Color := clInfoBk;

     EFArticulo.Enabled := True;
     EFNroSerie.Enabled := True;
     EFArticulo.Color := clWindow;
     EFNroSerie.Color := clWindow;
  end;
end;

procedure TDMMantenimientoNroSerie.MuestraMovimientos;
begin
  with xMovimientos do
  begin
     DisableControls;
     Close;
     Params.ByName['EMPRESA'].AsInteger := xNroSerieEMPRESA.AsInteger;
     Params.ByName['ARTICULO'].AsString := xNroSerieARTICULO.AsString;
     Open;
     EnableControls;
  end;
end;

end.
