unit ZUDMModelosDet;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, FIBInfoSet, Dialogs,
  jpeg, GIFImage, Graphics, ExtCtrls, Variants, Math, Controls, Forms;

type
  TZDMModelosDet = class(TDataModule)
     TLocal: THYTransaction;
     QMModelosDet: TFIBTableSet;
     DSQMModelosDet: TDataSource;
     xModelo: TFIBDataSetRO;
     DSxModelo: TDataSource;
     xModeloCODIGO: TFIBStringField;
     xModeloDESCRIPCION: TFIBStringField;
     QMModelosDetLINEA: TIntegerField;
     QMModelosDetSALIDA: TIntegerField;
     xModeloNOTAS: TBlobField;
     xModeloDIAS_SERVIR: TIntegerField;
     xModeloCONFIG_TIPO: TIntegerField;
     xModeloCONFIG_SUBTIPO: TIntegerField;
     xModeloINC_CORTE: TIntegerField;
     xModeloDEC_BARRAS_MANUAL_ARRIBA: TFloatField;
     xModeloDEC_BARRAS_MANUAL_ABAJO: TFloatField;
     xModeloDEC_BARRAS_MOTOR_ARRIBA: TFloatField;
     xModeloDEC_BARRAS_MOTOR_ABAJO: TFloatField;
     xModeloDEC_MANUAL_MEDIDA_LONA: TFloatField;
     QMModelosCalc: TFIBTableSet;
     DSQMModelosCalc: TDataSource;
     QMModelosCalcLINEA: TIntegerField;
     QMModelosCalcSALIDA: TIntegerField;
     QMModelosCalcTIPO_LONA: TFIBStringField;
     QMModelosCalcINC_SALIDA: TIntegerField;
     xCalcLonas: TFIBDataSetRO;
     DSxCalcLonas: TDataSource;
     xCalcLonasDESC_TIPO_LONA: TFIBStringField;
     xCalcLonasMULTIPLO: TIntegerField;
     xCalcLonasTOTAL_LINEA: TIntegerField;
     xCalcLonasTOTAL_SALIDA: TIntegerField;
     xCalcLonasTOTAL_M2_LONA: TFloatField;
     QMModelosCalcDescTipoLona: TStringField;
     QMModelosCalcMultiplo: TSmallintField;
     QMModelosCalcTotalM2Lona: TSmallintField;
     xModeloTIPO_AUX: TFIBStringField;
     xModeloTIPO_CONFECCION: TFIBStringField;
     QMModelosDetTIPO_AUX: TFIBStringField;
     QMModelosDetTIPO_CONFECCION: TFIBStringField;
     QMModelosCalcTOTAL_LINEA: TIntegerField;
     QMModelosCalcTOTAL_SALIDA: TIntegerField;
     xTipoLona: TFIBDataSetRO;
     DSxTipoLona: TDataSource;
     xTipoLonaMULTIPLO: TIntegerField;
     QMMotores: TFIBTableSet;
     DSQMMotores: TDataSource;
     QMMotoresLINEA: TIntegerField;
     QMMotoresSALIDA: TIntegerField;
     QMMotoresMOTOR: TFIBStringField;
     QMMotoresORDEN: TIntegerField;
     QMMotoresDescMotor: TStringField;
     QMModelosCalcLONA: TFIBStringField;
     QMModelosCalcFABRICACION: TFIBStringField;
     QMModelosDetINCR_LACADO_PVP: TIntegerField;
     QMModelosDetCODIGO: TFIBStringField;
     QMModelosCalcCODIGO: TFIBStringField;
     QMMotoresCODIGO: TFIBStringField;
     QMModelosDetBARRA_SUPERIOR: TFIBStringField;
     QMModelosDetBARRA_INFERIOR: TFIBStringField;
     QMModelosDetESCANDALLO: TIntegerField;
     QMModelosDetEMPRESA: TIntegerField;
     QMModelosDetARMAZON: TStringField;
     QMModelosDetToldo: TStringField;
     xArmazonToldo: TFIBDataSetRO;
     xArmazonToldoARTICULO: TFIBStringField;
     xArmazonToldoTITULO: TFIBStringField;
     QMModelosDetDESCARMAZON: TStringField;
     QMModelosDetDescToldo: TStringField;
     QMMotoresEMPRESA: TIntegerField;
     QMMotoresTIPO: TFIBStringField;
     QMMotoresUNIDADES: TFloatField;
     QMModelosDetEJERCICIO: TIntegerField;
     QMModelosDetCANAL: TIntegerField;
     QMModelosDetENTRADA: TIntegerField;
     QMModelosDetINC_CORTE: TFloatField;
     QMModelosDetDEC_MANUAL_MEDIDA_LONA: TFloatField;
     QMModelosDetDEC_BARRAS_MANUAL_ARRIBA: TFloatField;
     QMModelosDetDEC_BARRAS_MANUAL_ABAJO: TFloatField;
     QMModelosDetDEC_BARRAS_MOTOR_ARRIBA: TFloatField;
     QMModelosDetDEC_BARRAS_MOTOR_ABAJO: TFloatField;
     xCalcLonasMULTIPLO_SALIDA: TIntegerField;
     QMModelosCalcMultiplo_Salida: TSmallintField;
     QMModelosCalcTIPO: TFIBStringField;
     QMModelosCalcTIPO_CALCULO: TIntegerField;
     QMModelosDetOBSOLETO: TIntegerField;
     QMModelosDetESCANDALLO_COLOR: TIntegerField;
     xModeloESCANDALLO_DEFECTO: TIntegerField;
     xModeloBARRA_SUPERIOR: TFIBStringField;
     xModeloBARRA_INFERIOR: TFIBStringField;
     xModeloBARRAS_TIENEN_FORMULA: TIntegerField;
     xModeloWEB: TIntegerField;
     xModeloEMPRESA: TIntegerField;
     xModeloENTRADA: TIntegerField;
     xModeloEJERCICIO: TIntegerField;
     xModeloTIPO_LINEA_SALIDA: TIntegerField;
     xModeloTIPO_MODELO: TFIBStringField;
     DSQMLamas: TDataSource;
     QMLamas: TFIBTableSet;
     QMLamasEMPRESA: TIntegerField;
     QMLamasCODIGO: TFIBStringField;
     QMLamasANCHO: TIntegerField;
     QMLamasLARGO: TIntegerField;
     QMLamasORDEN: TIntegerField;
     QMLamasNUM_LAMAS: TIntegerField;
     QMLamasMERMA: TFloatField;
     QMLamasARTICULO: TFIBStringField;
     QMLamasDescArticulo: TStringField;
     QMLamasAnchoLama: TFloatField;
     QMLamasLargoLama: TFloatField;
     QMLamasColorLama: TStringField;
     xArticulosLama: TFIBDataSetRO;
     DSxArticulosLama: TDataSource;
     xArticulosLamaEMPRESA: TIntegerField;
     xArticulosLamaARTICULO: TFIBStringField;
     xArticulosLamaID_A: TIntegerField;
     xArticulosLamaANCHO: TFloatField;
     xArticulosLamaLARGO: TFloatField;
     xArticulosLamaCOLOR: TFIBStringField;
     xDescColores: TFIBDataSetRO;
     DSxColores: TDataSource;
     xDescColoresCODIGO: TFIBStringField;
     xDescColoresDESCRIPCION: TFIBStringField;
     QMLamasDescColor: TStringField;
     QMLamasTIPO_LAMA: TFIBStringField;
     QMLamasDESCLAMA: TStringField;
     xDescLama: TFIBDataSetRO;
     DSxDescLama: TDataSource;
     xDescLamaCODIGO: TFIBStringField;
     xDescLamaDESCRIPCION: TFIBStringField;
     QMModelosDetID_A_ARMAZON: TIntegerField;
     QMModelosDetID_A_TOLDO: TIntegerField;
     QMModelosDetID_A_PERSIANA: TIntegerField;
     QMLamasLINEA: TIntegerField;
     QMLamasSALIDA: TIntegerField;
     QMModelosDetCODIGO_IMAGEN: TIntegerField;
     xModeloIMAGEN: TIntegerField;
     QMModelosDetLINEA_MINIMA: TIntegerField;
     TUpdate: THYTransaction;
     QMMotoresARTICULO_KIT: TFIBStringField;
     QMMotoresDescKit: TStringField;
     QMModelosDetDEC_MOTOR_MEDIDA_LONA: TFloatField;
     xModeloDEC_MOTOR_MEDIDA_LONA: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMModelosDetAfterOpen(DataSet: TDataSet);
     procedure QMModelosDetNewRecord(DataSet: TDataSet);
     procedure QMModelosCalcNewRecord(DataSet: TDataSet);
     procedure QMModelosCalcAfterOpen(DataSet: TDataSet);
     procedure QMModelosCalcDescTipoLonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMModelosCalcMultiploGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMModelosCalcTotalM2LonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMModelosCalcTIPO_LONAChange(Sender: TField);
     procedure QMModelosCalcINC_SALIDAChange(Sender: TField);
     procedure QMMotoresNewRecord(DataSet: TDataSet);
     procedure QMMotoresAfterPost(DataSet: TDataSet);
     procedure QMModelosDetAfterScroll(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure GrabaDetalle(DataSet: TDataSet);
     procedure QMModelosCalcBeforeEdit(DataSet: TDataSet);
     procedure QMModelosCalcAfterPost(DataSet: TDataSet);
     procedure QMModelosCalcMultiplo_SalidaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMModelosCalcTOTAL_LINEAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMModelosCalcTOTAL_SALIDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMLamasNewRecord(DataSet: TDataSet);
     procedure QMLamasDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMLamasAnchoLamaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMLamasLargoLamaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMLamasColorLamaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMLamasDescColorGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMLamasARTICULOChange(Sender: TField);
     procedure QMLamasCalcFields(DataSet: TDataSet);
     procedure QMLamasTIPO_LAMAChange(Sender: TField);
     procedure QMLamasDESCLAMAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMMotoresCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     valor_lona_antic: string;
     procedure FiltraModelo(Modelo: string);
     procedure CrearArmazones(Modelo: string; Modo: integer);
     procedure CrearToldos(Modelo: string);
     procedure CargarArmazonToldo;
     procedure RecrearToldos(Modelo: string);
     procedure ReplicarCalculos(Modelo: string);
     procedure ReplicarTiposConfeccion(Modelo: string);
     procedure ReplicarIncrLacadoPVP(Modelo: string);
     procedure AsignarEscPerdido(modelo: string);
     procedure RecalcularLonas;
     procedure EliminarDuplicados;
     procedure ActualizarPrecios;
     procedure AbrirEscModelo;
     procedure ActualizarMedidas;
     procedure ActualizarModeloEsc;
     procedure RefrescaDatos;
  end;

var
  ZDMModelosDet : TZDMModelosDet;

implementation

uses UDMMain, ZUFMModelosDet, UEntorno, UFMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TZDMModelosDet.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMModelosDetINC_CORTE.DisplayFormat := MascaraN;
  QMModelosDetDEC_MANUAL_MEDIDA_LONA.DisplayFormat := MascaraN;
  QMModelosDetDEC_MOTOR_MEDIDA_LONA.DisplayFormat := MascaraN;
  QMModelosDetDEC_BARRAS_MANUAL_ARRIBA.DisplayFormat := MascaraN;
  QMModelosDetDEC_BARRAS_MANUAL_ABAJO.DisplayFormat := MascaraN;
  QMModelosDetDEC_BARRAS_MOTOR_ARRIBA.DisplayFormat := MascaraN;
  QMModelosDetDEC_BARRAS_MOTOR_ABAJO.DisplayFormat := MascaraN;
  QMModelosCalcTotalM2Lona.DisplayFormat := MascaraN;
end;

procedure TZDMModelosDet.QMModelosDetAfterOpen(DataSet: TDataSet);
begin
  QMModelosCalc.Close;
  QMModelosCalc.Open;

  QMMotores.Close;
  QMMotores.Open;

  QMLamas.Close;
  QMLamas.Open;
end;

procedure TZDMModelosDet.FiltraModelo(Modelo: string);
begin
  xModelo.Close;
  xModelo.Params.ByName['CODIGO'].AsString := Modelo;
  xModelo.Open;

  QMModelosDet.Close;
  QMModelosDet.Params.ByName['CODIGO'].AsString := Modelo;
  QMModelosDet.Open;
end;

procedure TZDMModelosDet.QMModelosDetNewRecord(DataSet: TDataSet);
begin
  QMModelosDetCODIGO.AsString := Trim(ZFMModelosDet.EFModelo.Text);

  QMModelosDetINC_CORTE.AsInteger := xModeloINC_CORTE.AsInteger;
  QMModelosDetDEC_MANUAL_MEDIDA_LONA.AsInteger := xModeloDEC_MANUAL_MEDIDA_LONA.AsInteger;
  QMModelosDetDEC_MOTOR_MEDIDA_LONA.AsInteger := xModeloDEC_MOTOR_MEDIDA_LONA.AsInteger;
  QMModelosDetDEC_BARRAS_MANUAL_ARRIBA.AsInteger := xModeloDEC_BARRAS_MANUAL_ARRIBA.AsInteger;
  QMModelosDetDEC_BARRAS_MANUAL_ABAJO.AsInteger := xModeloDEC_BARRAS_MANUAL_ABAJO.AsInteger;
  QMModelosDetDEC_BARRAS_MOTOR_ARRIBA.AsInteger := xModeloDEC_BARRAS_MOTOR_ARRIBA.AsInteger;
  QMModelosDetDEC_BARRAS_MOTOR_ABAJO.AsInteger := xModeloDEC_BARRAS_MOTOR_ABAJO.AsInteger;
  QMModelosDetCODIGO_IMAGEN.AsInteger := xModeloIMAGEN.AsInteger;

  QMModelosDetTIPO_AUX.AsString := xModeloTIPO_AUX.AsString;
  QMModelosDetTIPO_CONFECCION.AsString := xModeloTIPO_CONFECCION.AsString;

  QMModelosDetEMPRESA.AsInteger := REntorno.Empresa;
  QMModelosDetEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMModelosDetCANAL.AsInteger := REntorno.Canal;
  QMModelosDetENTRADA.AsInteger := REntorno.Entrada;
  QMModelosDetLINEA_MINIMA.AsInteger := 0;
end;

procedure TZDMModelosDet.CrearArmazones(Modelo: string; Modo: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_A_CREA_ARTICULOS_ARMAZON(:EMPRESA, :EJERCICIO, :CANAL, :MODELO, :ENTRADA, :LINEA_DEST, :SALIDA_DEST)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['MODELO'].AsString := Modelo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['LINEA_DEST'].AsInteger := 0;
        Params.ByName['SALIDA_DEST'].AsInteger := 0;
        ExecQuery;
        if (Modo = 0) or
           ((Modo = 1) and ((FieldByName['TOTAL_ARTICULOS'].AsInteger > 0) or
           (FieldByName['TOTAL_CUENTAS'].AsInteger > 0))) then
           ShowMessage(Format(_('Se han creado %s armazones nuevos y %s cuentas.'), [FieldByName['TOTAL_ARTICULOS'].AsString, FieldByName['TOTAL_CUENTAS'].AsString]));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMModelosDet.CrearToldos(Modelo: string);
begin
  CrearArmazones(Modelo, 1);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_A_CREA_ARTICULOS_TOLDO(:EMPRESA, :EJERCICIO, :CANAL, :MODELO, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['MODELO'].AsString := Modelo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;

        ShowMessage(Format(_('Se han creado %s toldos nuevos y %s cuentas.'), [FieldByName['TOTAL_ARTICULOS'].AsString, FieldByName['TOTAL_CUENTAS'].AsString]));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMModelosDet.RecrearToldos(Modelo: string);
begin
  CrearArmazones(Modelo, 1);
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_A_RECREA_ARTICULOS_TOLDO(:EMPRESA, :EJERCICIO, :CANAL, :MODELO, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['MODELO'].AsString := Modelo;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;

        ShowMessage(Format(_('Se han creado %s toldos.' + #13#10 + 'Se han creado %s artículos nuevos y %s cuentas.'), [FieldByName['TOTAL_RECREADOS'].AsString, FieldByName['TOTAL_ARTICULOS'].AsString, FieldByName['TOTAL_CUENTAS'].AsString]));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMModelosDet.ReplicarCalculos(Modelo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_MODELO_REPLICA_CALCULOS(:CODIGO, :LINEA, :SALIDA)';
        Params.ByName['CODIGO'].AsString := Modelo;
        Params.ByName['LINEA'].AsInteger := QMModelosCalcLINEA.AsInteger;
        Params.ByName['SALIDA'].AsInteger := QMModelosCalcSALIDA.AsInteger;
        ExecQuery;
        ShowMessage(_('Proceso finalizado.'));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMModelosDet.ReplicarTiposConfeccion(Modelo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE Z_SYS_MODELOS_DET ');
        SQL.Add(' SET ');
        SQL.Add(' TIPO_CONFECCION = :TIPO_CONFECCION ');
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO = :CODIGO AND ');
        SQL.Add(' ((LINEA <> :LINEA) OR (SALIDA <> :SALIDA)) ');
        Params.ByName['CODIGO'].AsString := Modelo;
        Params.ByName['LINEA'].AsInteger := QMModelosDetLINEA.AsInteger;
        Params.ByName['SALIDA'].AsInteger := QMModelosDetSALIDA.AsInteger;
        Params.ByName['TIPO_CONFECCION'].AsString := QMModelosDetTIPO_CONFECCION.AsString;
        ExecQuery;
        ShowMessage(_('Proceso finalizado.'));
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMModelosDet.Close;
  QMModelosDet.Open;
end;

procedure TZDMModelosDet.ReplicarIncrLacadoPVP(Modelo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE Z_SYS_MODELOS_DET ');
        SQL.Add(' SET ');
        SQL.Add(' INCR_LACADO_PVP = :INCR_LACADO_PVP ');
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO = :CODIGO AND ');
        SQL.Add(' ((LINEA <> :LINEA) OR (SALIDA <> :SALIDA)) ');
        Params.ByName['CODIGO'].AsString := Modelo;
        Params.ByName['LINEA'].AsInteger := QMModelosDetLINEA.AsInteger;
        Params.ByName['SALIDA'].AsInteger := QMModelosDetSALIDA.AsInteger;
        Params.ByName['INCR_LACADO_PVP'].AsInteger := QMModelosDetINCR_LACADO_PVP.AsInteger;
        ExecQuery;
        ShowMessage(_('Proceso finalizado.'));
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMModelosDet.Close;
  QMModelosDet.Open;
end;

procedure TZDMModelosDet.QMModelosCalcNewRecord(DataSet: TDataSet);
begin
  QMModelosCalcCODIGO.AsString := Trim(QMModelosDetCODIGO.AsString);
  QMModelosCalcLINEA.AsInteger := QMModelosDetLINEA.AsInteger;
  QMModelosCalcSALIDA.AsInteger := QMModelosDetSALIDA.AsInteger;
  QMModelosCalcINC_SALIDA.AsInteger := 25;
  QMModelosCalcTIPO_CALCULO.AsInteger := 1; //sfg.albert - Per defecte es posa 1, és a dir, manual
end;

procedure TZDMModelosDet.QMModelosCalcAfterOpen(DataSet: TDataSet);
begin
  xCalcLonas.Close;
  xCalcLonas.Open;
end;

procedure TZDMModelosDet.QMModelosCalcDescTipoLonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xCalcLonas.Close;
  xCalcLonas.Open;
  Text := xCalcLonasDESC_TIPO_LONA.AsString;
end;

procedure TZDMModelosDet.QMModelosCalcMultiploGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xCalcLonas.Close;
  xCalcLonas.Open;
  Text := xCalcLonasMULTIPLO.AsString;
end;

procedure TZDMModelosDet.QMModelosCalcTotalM2LonaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat('0.0000', xCalcLonasTOTAL_M2_LONA.AsFloat);
end;

procedure TZDMModelosDet.QMModelosCalcTIPO_LONAChange(Sender: TField);
begin
  xCalcLonas.Close;
  xCalcLonas.Open;
  QMModelosCalcTOTAL_LINEA.AsInteger := xCalcLonasTOTAL_LINEA.AsInteger;
  QMModelosCalcTOTAL_SALIDA.AsInteger := xCalcLonasTOTAL_SALIDA.AsInteger;
  {
  xTipoLona.Close;
  xTipoLona.Open;

  QMModelosCalcTOTAL_LINEA.AsInteger := xTipoLonaMULTIPLO.AsInteger;

  while (QMModelosDetLINEA.AsInteger > QMModelosCalcTOTAL_LINEA.AsInteger) do
     QMModelosCalcTOTAL_LINEA.AsInteger := QMModelosCalcTOTAL_LINEA.AsInteger + xTipoLonaMULTIPLO.AsInteger;
  }
end;

procedure TZDMModelosDet.QMModelosCalcINC_SALIDAChange(Sender: TField);
begin
  {
  QMModelosCalcTOTAL_SALIDA.AsInteger :=
      QMModelosDetSALIDA.AsInteger +
      QMModelosCalcINC_SALIDA.AsInteger +
      QMModelosDetINC_CORTE.AsInteger;
  }
end;

procedure TZDMModelosDet.QMMotoresNewRecord(DataSet: TDataSet);
begin
  QMMotoresCODIGO.AsString := Trim(QMModelosDetCODIGO.AsString);
  QMMotoresLINEA.AsInteger := QMModelosDetLINEA.AsInteger;
  QMMotoresSALIDA.AsInteger := QMModelosDetSALIDA.AsInteger;
  QMMotoresEMPRESA.AsInteger := QMModelosDetEMPRESA.AsInteger;
end;

procedure TZDMModelosDet.QMMotoresAfterPost(DataSet: TDataSet);
begin
  QMModelosDet.Refresh;
end;

procedure TZDMModelosDet.QMModelosDetAfterScroll(DataSet: TDataSet);
begin
  CargarArmazonToldo;
end;

procedure TZDMModelosDet.CargarArmazonToldo;
var
  Valor : string;
begin
  // Armazón
  xArmazonToldo.Close;
  xArmazonToldo.Params.ByName['EMPRESA'].AsInteger := QMModelosDetEMPRESA.AsInteger;
  xArmazonToldo.Params.ByName['ARTICULO'].AsString := 'A' + Trim(QMModelosDetCODIGO.AsString) + QMModelosDetLINEA.AsString +
     QMModelosDetSALIDA.AsString;
  xArmazonToldo.Open;

  QMModelosDetARMAZON.AsString := xArmazonToldoARTICULO.AsString;
  QMModelosDetDESCARMAZON.AsString := xArmazonToldoTITULO.AsString;

  // Toldo/Persiana
  {
  if (xModeloTIPO_MODELO.AsString = 'TOL') then
     valor := 'T'
  else if (xModeloTIPO_MODELO.AsString = 'PER') then
     valor := 'P';
  }
  Valor := DMMain.DamePrefijoArticulo(QMModelosDetCODIGO.AsString);

  xArmazonToldo.Close;
  xArmazonToldo.Params.ByName['EMPRESA'].AsInteger := QMModelosDetEMPRESA.AsInteger;
  xArmazonToldo.Params.ByName['ARTICULO'].AsString := Valor + Trim(QMModelosDetCODIGO.AsString) + QMModelosDetLINEA.AsString +
     QMModelosDetSALIDA.AsString;
  xArmazonToldo.Open;

  QMModelosDetToldo.AsString := xArmazonToldoARTICULO.AsString;
  QMModelosDetDescToldo.AsString := xArmazonToldoTITULO.AsString;
end;

procedure TZDMModelosDet.AsignarEscPerdido(modelo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_A_ASIGNA_ESC_MODELOS(:EMPRESA, :EJERCICIO, :CANAL, :MODELO, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['MODELO'].AsString := Trim(Modelo);
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        ShowMessage(Format(_('Se han asignado %s escandallos'), [FieldByName['TOTAL_ESC'].AsString]));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMModelosDet.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;

  CargarArmazonToldo;

  RecalcularLonas;
end;

procedure TZDMModelosDet.QMModelosCalcBeforeEdit(DataSet: TDataSet);
begin
  // sfg.albert - Agafo el valor antic de la lona, per si el canvien
  valor_lona_antic := QMModelosCalcLONA.AsString;
end;

procedure TZDMModelosDet.QMModelosCalcAfterPost(DataSet: TDataSet);
begin
  if (valor_lona_antic <> QMModelosCalcLONA.AsString) then
     if MessageDlg(_('Después de cambiar una lona se debe recrear toldos. Desea hacerlo ahora?'),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        RecrearToldos(ZFMModelosDet.EFModelo.Text);
     end;

  GrabaDetalle(DataSet);
end;

// sfg.albert - Es recalculen les lones un cop ha fet el post
procedure TZDMModelosDet.RecalcularLonas;
begin
  QMModelosCalc.First;

  while not QMModelosCalc.EOF do
  begin
     xCalcLonas.Close;
     xCalcLonas.Params.ByName['codigo'].AsString := QMModelosCalcCODIGO.AsString;
     xCalcLonas.Params.ByName['linea'].AsInteger := QMModelosCalcLINEA.AsInteger;
     xCalcLonas.Params.ByName['salida'].AsInteger := QMModelosCalcSALIDA.AsInteger;
     xCalcLonas.Params.ByName['tipo_lona'].AsString := QMModelosCalcTIPO_LONA.AsString;
     xCalcLonas.Params.ByName['tipo_calculo'].AsInteger := QMModelosCalcTIPO_CALCULO.AsInteger;
     xCalcLonas.Open;

     QMModelosCalc.Edit;

     QMModelosCalcTotalM2Lona.AsFloat := xCalcLonasTOTAL_M2_LONA.AsFloat;
     QMModelosCalcTOTAL_SALIDA.AsInteger := xCalcLonasTOTAL_SALIDA.AsInteger;
     QMModelosCalcTOTAL_LINEA.AsInteger := xCalcLonasTOTAL_LINEA.AsInteger;

     QMModelosCalc.Post;

     QMModelosCalc.Next;
  end;
end;

procedure TZDMModelosDet.EliminarDuplicados;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_BORRAR_DUPLICADOS_LONAS(:MODELO)';
        Params.ByName['MODELO'].AsString := Trim(QMModelosCalcCODIGO.AsString);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(_('Proceso terminado correctamente'));
end;

procedure TZDMModelosDet.QMModelosCalcMultiplo_SalidaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xCalcLonas.Close;
  xCalcLonas.Open;
  Text := xCalcLonasMULTIPLO_SALIDA.AsString;
end;

procedure TZDMModelosDet.GrabaDetalle(DataSet: TDataSet);
begin
  DataSet.Refresh;
  // RecalcularLonas;
end;

procedure TZDMModelosDet.ActualizarPrecios;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE ACTUALIZA_PRECIO_DATOS_MODELO(:MODELO, :EMPRESA, ''EPR'')';
        Params.ByName['MODELO'].AsString := QMModelosDetCODIGO.AsString;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMModelosDet.AbrirEscModelo;
var
  Lista : TStrings;
  Escandallo : integer;
begin
  // Obre el formulari d'escandall filtrant tots els escandalls d'aquest model - sfg.albert -

  Lista := TStringList.Create;
  try
     with QMModelosDet do
     begin
        Escandallo := QMModelosDetESCANDALLO.AsInteger;
        DisableControls;
        try
           First;
           while not EOF do
           begin
              if (QMModelosDetOBSOLETO.AsInteger = 0) then
                 Lista.Add(QMModelosDetESCANDALLO.AsString);
              Next;
           end;

           Posicionar(QMModelosDet, 'ESCANDALLO', Escandallo);
        finally
           EnableControls;
        end;
     end;

     FMain.EjecutaAccion(FMain.AProEscandalloSF, 'ESCANDALLO IN (' + Lista.CommaText + ')');
  finally
     Lista.Free;
  end;
end;

procedure TZDMModelosDet.ActualizarMedidas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE ACTUALIZA_MEDIDAS_ESCANDALLO(:MODELO, :EMPRESA)';
        Params.ByName['MODELO'].AsString := QMModelosDetCODIGO.AsString;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMModelosDet.QMModelosCalcTOTAL_LINEAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xCalcLonas.Close;
  xCalcLonas.Open;
  Text := xCalcLonasTOTAL_LINEA.AsString;
end;

procedure TZDMModelosDet.QMModelosCalcTOTAL_SALIDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xCalcLonas.Close;
  xCalcLonas.Open;
  Text := xCalcLonasTOTAL_SALIDA.AsString;
end;

procedure TZDMModelosDet.QMLamasNewRecord(DataSet: TDataSet);
begin
  QMLamasEMPRESA.AsInteger := REntorno.Empresa;
  QMLamasCODIGO.AsString := Trim(QMModelosDetCODIGO.AsString);
  QMLamasANCHO.AsInteger := QMModelosDetLINEA.AsInteger;
  QMLamasLARGO.AsInteger := QMModelosDetSALIDA.AsInteger;
  QMLamasLINEA.AsInteger := QMModelosDetLINEA.AsInteger;
  QMLamasSALIDA.AsInteger := QMModelosDetSALIDA.AsInteger;
end;

procedure TZDMModelosDet.QMLamasDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMLamasARTICULO.AsString);
end;

procedure TZDMModelosDet.QMLamasAnchoLamaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xArticulosLama.Close;
  xArticulosLama.Open;

  Text := xArticulosLamaANCHO.AsString;
end;

procedure TZDMModelosDet.QMLamasLargoLamaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xArticulosLama.Close;
  xArticulosLama.Open;

  Text := xArticulosLamaLARGO.AsString;
end;

procedure TZDMModelosDet.QMLamasColorLamaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xArticulosLama.Close;
  xArticulosLama.Open;

  Text := xArticulosLamaCOLOR.AsString;
end;

procedure TZDMModelosDet.QMLamasDescColorGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescColores.Close;
  xDescColores.Params[0].AsString := xArticulosLamaCOLOR.AsString;
  xDescColores.Open;

  Text := xDescColoresDESCRIPCION.AsString;
end;

procedure TZDMModelosDet.QMLamasARTICULOChange(Sender: TField);
begin
  QMLamasDescArticulo.AsString := DameTituloArticulo(QMLamasARTICULO.AsString);
end;

procedure TZDMModelosDet.QMLamasCalcFields(DataSet: TDataSet);
begin
  // Es calculen el numero de lamas (REVISAR AMB EL SALVADOR)

  xArticulosLama.Close;
  xArticulosLama.Open;

  if ((QMLamasLARGO.AsInteger <> 0) and (xArticulosLamaANCHO.AsInteger <> 0)) then
  begin
     // QMLamasNUM_LAMAS.AsInteger := QMLamasLARGO.AsInteger div xArticulosLamaANCHO.AsInteger;
     // QMLamasMERMA.AsFloat := QMLamasLARGO.AsInteger mod xArticulosLamaANCHO.AsInteger;
  end;

  xArticulosLama.Close;
end;

procedure TZDMModelosDet.QMLamasTIPO_LAMAChange(Sender: TField);
begin
  xDescLama.Close;
  xDescLama.Params.ByName['codigo'].AsString := QMLamasTIPO_LAMA.AsString;
  xDescLama.Params.ByName['tipo'].AsInteger := 1;
  xDescLama.Open;

  QMLamasDESCLAMA.AsString := xDescLamaDESCRIPCION.AsString;
end;

procedure TZDMModelosDet.QMLamasDESCLAMAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMLamasTIPO_LAMA.AsString <> '') then
  begin
     xDescLama.Close;
     xDescLama.Params.ByName['codigo'].AsString := QMLamasTIPO_LAMA.AsString;
     xDescLama.Params.ByName['tipo'].AsInteger := 1;
     xDescLama.Open;

     Text := xDescLamaDESCRIPCION.AsString;
  end;
end;

procedure TZDMModelosDet.ActualizarModeloEsc;
begin
  Screen.Cursor := crHourGlass;
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE PRO_ACTUALIZA_MODELO_ESC(:EMPRESA, :MODELO)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['MODELO'].AsString := QMModelosDetCODIGO.AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TZDMModelosDet.QMMotoresCalcFields(DataSet: TDataSet);
begin
  QMMotoresDescMotor.AsString := DameTituloArticulo(QMMotoresMOTOR.AsString);
  if (QMMotoresARTICULO_KIT.AsString > '') then
  begin
     QMMotoresDescKit.AsString := DameTituloArticulo(QMMotoresARTICULO_KIT.AsString);
  end;
end;

procedure TZDMModelosDet.RefrescaDatos;
begin
  Refrescar(QMModelosDet, 'ESCANDALLO', QMModelosDetESCANDALLO.AsInteger);
end;

end.
