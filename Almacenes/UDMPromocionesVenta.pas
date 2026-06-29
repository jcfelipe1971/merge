unit UDMPromocionesVenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBQuery, HYFIBQuery, Controls, Dialogs, FIBDataSetRO,
  FIBTableDataSetRO;

type
  TDMPromocionesVenta = class(TDataModule)
     TLocal: THYTransaction;
     QMFamilia: TFIBTableSet;
     DSQMFamilia: TDataSource;
     QMCliFam: TFIBTableSet;
     DSQMCliFam: TDataSource;
     QMCliArt: TFIBTableSet;
     DSQMCliArt: TDataSource;
     QMCliFamEMPRESA: TIntegerField;
     QMCliFamEJERCICIO: TIntegerField;
     QMCliFamCANAL: TIntegerField;
     QMCliFamTIPO: TFIBStringField;
     QMCliFamRIG: TIntegerField;
     QMCliFamFECHA_ALTA: TDateTimeField;
     QMCliFamFECHA_BAJA: TDateTimeField;
     QMCliFamCLIENTE: TIntegerField;
     QMCliFamAGRUPACION: TFIBStringField;
     QMCliFamARTICULO: TFIBStringField;
     QMCliFamTITULO_ARTICULO: TFIBStringField;
     QMCliFamID_A: TIntegerField;
     QMCliFamUNIDADES: TFloatField;
     QMCliFamTARIFA: TFIBStringField;
     QMCliFamPRECIO: TFloatField;
     QMCliFamDTO1: TFloatField;
     QMCliFamDTO2: TFloatField;
     QMCliFamDTO3: TFloatField;
     QMCliFamPROMOCION: TFIBStringField;
     QMCliFamTITULO_PROMOCION: TFIBStringField;
     QMCliFamUDS_PROMOCION: TFloatField;
     QMCliFamPRECIO_PROMO: TFloatField;
     QMCliFamFAMILIA: TFIBStringField;
     QMCliFamID_P: TIntegerField;
     QMCliArtEMPRESA: TIntegerField;
     QMCliArtEJERCICIO: TIntegerField;
     QMCliArtCANAL: TIntegerField;
     QMCliArtTIPO: TFIBStringField;
     QMCliArtRIG: TIntegerField;
     QMCliArtFECHA_ALTA: TDateTimeField;
     QMCliArtFECHA_BAJA: TDateTimeField;
     QMCliArtCLIENTE: TIntegerField;
     QMCliArtAGRUPACION: TFIBStringField;
     QMCliArtARTICULO: TFIBStringField;
     QMCliArtTITULO_ARTICULO: TFIBStringField;
     QMCliArtID_A: TIntegerField;
     QMCliArtUNIDADES: TFloatField;
     QMCliArtTARIFA: TFIBStringField;
     QMCliArtPRECIO: TFloatField;
     QMCliArtDTO1: TFloatField;
     QMCliArtDTO2: TFloatField;
     QMCliArtDTO3: TFloatField;
     QMCliArtPROMOCION: TFIBStringField;
     QMCliArtTITULO_PROMOCION: TFIBStringField;
     QMCliArtUDS_PROMOCION: TFloatField;
     QMCliArtPRECIO_PROMO: TFloatField;
     QMCliArtFAMILIA: TFIBStringField;
     QMCliArtID_P: TIntegerField;
     xCliente: TFIBDataSetRO;
     DSxCliente: TDataSource;
     xClienteTITULO: TFIBStringField;
     xClienteCLIENTE: TIntegerField;
     xAgrupacion: TFIBDataSetRO;
     DSxAgrupacion: TDataSource;
     xAgrupacionAGRUPACION: TFIBStringField;
     xAgrupacionTITULO: TFIBStringField;
     QMCliFamTITULO_FAMILIA: TFIBStringField;
     QMCliArtTITULO_FAMILIA: TFIBStringField;
     QMFamiliaEMPRESA: TIntegerField;
     QMFamiliaEJERCICIO: TIntegerField;
     QMFamiliaCANAL: TIntegerField;
     QMFamiliaTIPO: TFIBStringField;
     QMFamiliaRIG: TIntegerField;
     QMFamiliaFECHA_ALTA: TDateTimeField;
     QMFamiliaFECHA_BAJA: TDateTimeField;
     QMFamiliaCLIENTE: TIntegerField;
     QMFamiliaAGRUPACION: TFIBStringField;
     QMFamiliaARTICULO: TFIBStringField;
     QMFamiliaTITULO_ARTICULO: TFIBStringField;
     QMFamiliaID_A: TIntegerField;
     QMFamiliaUNIDADES: TFloatField;
     QMFamiliaTARIFA: TFIBStringField;
     QMFamiliaPRECIO: TFloatField;
     QMFamiliaDTO1: TFloatField;
     QMFamiliaDTO2: TFloatField;
     QMFamiliaDTO3: TFloatField;
     QMFamiliaPROMOCION: TFIBStringField;
     QMFamiliaTITULO_PROMOCION: TFIBStringField;
     QMFamiliaUDS_PROMOCION: TFloatField;
     QMFamiliaPRECIO_PROMO: TFloatField;
     QMFamiliaFAMILIA: TFIBStringField;
     QMFamiliaTITULO_FAMILIA: TFIBStringField;
     QMAgrFam: TFIBTableSet;
     DSQMAgrFam: TDataSource;
     QMAgrFamEMPRESA: TIntegerField;
     QMAgrFamEJERCICIO: TIntegerField;
     QMAgrFamCANAL: TIntegerField;
     QMAgrFamTIPO: TFIBStringField;
     QMAgrFamRIG: TIntegerField;
     QMAgrFamFECHA_ALTA: TDateTimeField;
     QMAgrFamFECHA_BAJA: TDateTimeField;
     QMAgrFamCLIENTE: TIntegerField;
     QMAgrFamAGRUPACION: TFIBStringField;
     QMAgrFamARTICULO: TFIBStringField;
     QMAgrFamTITULO_ARTICULO: TFIBStringField;
     QMAgrFamID_A: TIntegerField;
     QMAgrFamUNIDADES: TFloatField;
     QMAgrFamTARIFA: TFIBStringField;
     QMAgrFamPRECIO: TFloatField;
     QMAgrFamDTO1: TFloatField;
     QMAgrFamDTO2: TFloatField;
     QMAgrFamDTO3: TFloatField;
     QMAgrFamPROMOCION: TFIBStringField;
     QMAgrFamTITULO_PROMOCION: TFIBStringField;
     QMAgrFamUDS_PROMOCION: TFloatField;
     QMAgrFamPRECIO_PROMO: TFloatField;
     QMAgrFamFAMILIA: TFIBStringField;
     QMAgrFamTITULO_FAMILIA: TFIBStringField;
     QMAgrArt: TFIBTableSet;
     DSQMAgrArt: TDataSource;
     QMAgrArtEMPRESA: TIntegerField;
     QMAgrArtEJERCICIO: TIntegerField;
     QMAgrArtCANAL: TIntegerField;
     QMAgrArtTIPO: TFIBStringField;
     QMAgrArtRIG: TIntegerField;
     QMAgrArtFECHA_ALTA: TDateTimeField;
     QMAgrArtFECHA_BAJA: TDateTimeField;
     QMAgrArtCLIENTE: TIntegerField;
     QMAgrArtAGRUPACION: TFIBStringField;
     QMAgrArtARTICULO: TFIBStringField;
     QMAgrArtTITULO_ARTICULO: TFIBStringField;
     QMAgrArtID_A: TIntegerField;
     QMAgrArtUNIDADES: TFloatField;
     QMAgrArtTARIFA: TFIBStringField;
     QMAgrArtPRECIO: TFloatField;
     QMAgrArtDTO1: TFloatField;
     QMAgrArtDTO2: TFloatField;
     QMAgrArtDTO3: TFloatField;
     QMAgrArtPROMOCION: TFIBStringField;
     QMAgrArtTITULO_PROMOCION: TFIBStringField;
     QMAgrArtUDS_PROMOCION: TFloatField;
     QMAgrArtPRECIO_PROMO: TFloatField;
     QMAgrArtFAMILIA: TFIBStringField;
     QMAgrArtTITULO_FAMILIA: TFIBStringField;
     QMArticulo: TFIBTableSet;
     DSQMArticulo: TDataSource;
     QMArticuloEMPRESA: TIntegerField;
     QMArticuloEJERCICIO: TIntegerField;
     QMArticuloCANAL: TIntegerField;
     QMArticuloTIPO: TFIBStringField;
     QMArticuloRIG: TIntegerField;
     QMArticuloFECHA_ALTA: TDateTimeField;
     QMArticuloFECHA_BAJA: TDateTimeField;
     QMArticuloCLIENTE: TIntegerField;
     QMArticuloAGRUPACION: TFIBStringField;
     QMArticuloARTICULO: TFIBStringField;
     QMArticuloTITULO_ARTICULO: TFIBStringField;
     QMArticuloID_A: TIntegerField;
     QMArticuloUNIDADES: TFloatField;
     QMArticuloTARIFA: TFIBStringField;
     QMArticuloPRECIO: TFloatField;
     QMArticuloDTO1: TFloatField;
     QMArticuloDTO2: TFloatField;
     QMArticuloDTO3: TFloatField;
     QMArticuloPROMOCION: TFIBStringField;
     QMArticuloTITULO_PROMOCION: TFIBStringField;
     QMArticuloUDS_PROMOCION: TFloatField;
     QMArticuloPRECIO_PROMO: TFloatField;
     QMArticuloFAMILIA: TFIBStringField;
     QMArticuloTITULO_FAMILIA: TFIBStringField;
     TUpdate: THYTransaction;
     QMArticuloTITULO_TARIFA: TFIBStringField;
     QMArticuloID_P: TIntegerField;
     QMArticuloDTO1_PROMO: TFloatField;
     QMArticuloDTO2_PROMO: TFloatField;
     QMArticuloDTO3_PROMO: TFloatField;
     QMArticuloLINEA: TIntegerField;
     QMAgrArtTITULO_TARIFA: TFIBStringField;
     QMAgrArtID_P: TIntegerField;
     QMAgrArtDTO1_PROMO: TFloatField;
     QMAgrArtDTO2_PROMO: TFloatField;
     QMAgrArtDTO3_PROMO: TFloatField;
     QMAgrArtLINEA: TIntegerField;
     QMAgrFamTITULO_TARIFA: TFIBStringField;
     QMAgrFamID_P: TIntegerField;
     QMAgrFamDTO1_PROMO: TFloatField;
     QMAgrFamDTO2_PROMO: TFloatField;
     QMAgrFamDTO3_PROMO: TFloatField;
     QMAgrFamLINEA: TIntegerField;
     QMCliArtTITULO_TARIFA: TFIBStringField;
     QMCliArtDTO1_PROMO: TFloatField;
     QMCliArtDTO2_PROMO: TFloatField;
     QMCliArtDTO3_PROMO: TFloatField;
     QMCliArtLINEA: TIntegerField;
     QMCliFamTITULO_TARIFA: TFIBStringField;
     QMCliFamDTO1_PROMO: TFloatField;
     QMCliFamDTO2_PROMO: TFloatField;
     QMCliFamDTO3_PROMO: TFloatField;
     QMCliFamLINEA: TIntegerField;
     QMFamiliaTITULO_TARIFA: TFIBStringField;
     QMFamiliaID_P: TIntegerField;
     QMFamiliaDTO1_PROMO: TFloatField;
     QMFamiliaDTO2_PROMO: TFloatField;
     QMFamiliaDTO3_PROMO: TFloatField;
     QMFamiliaLINEA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMFamiliaPROMOCIONChange(Sender: TField);
     procedure QMFamiliaNewRecord(DataSet: TDataSet);
     procedure QMFamiliaTARIFAChange(Sender: TField);
     procedure QMFamiliaUNIDADESChange(Sender: TField);
     procedure QMCliFamNewRecord(DataSet: TDataSet);
     procedure QMCliFamFAMILIAChange(Sender: TField);
     procedure QMCliFamPROMOCIONChange(Sender: TField);
     procedure QMCliFamTARIFAChange(Sender: TField);
     procedure QMCliFamUNIDADESChange(Sender: TField);
     procedure QMCliArtNewRecord(DataSet: TDataSet);
     procedure QMCliArtARTICULOChange(Sender: TField);
     procedure QMCliArtPROMOCIONChange(Sender: TField);
     procedure QMCliArtTARIFAChange(Sender: TField);
     procedure QMCliArtUNIDADESChange(Sender: TField);
     procedure QMFamiliaFAMILIAChange(Sender: TField);
     procedure QMAgrFamNewRecord(DataSet: TDataSet);
     procedure QMAgrFamFAMILIAChange(Sender: TField);
     procedure QMAgrFamPROMOCIONChange(Sender: TField);
     procedure QMAgrFamTARIFAChange(Sender: TField);
     procedure QMAgrFamUNIDADESChange(Sender: TField);
     procedure QMAgrArtNewRecord(DataSet: TDataSet);
     procedure QMAgrArtARTICULOChange(Sender: TField);
     procedure QMAgrArtTARIFAChange(Sender: TField);
     procedure QMAgrArtUNIDADESChange(Sender: TField);
     procedure QMAgrArtPROMOCIONChange(Sender: TField);
     procedure QMArticuloNewRecord(DataSet: TDataSet);
     procedure QMArticuloARTICULOChange(Sender: TField);
     procedure QMArticuloUNIDADESChange(Sender: TField);
     procedure QMArticuloTARIFAChange(Sender: TField);
     procedure QMArticuloPROMOCIONChange(Sender: TField);
  private
     { Private declarations }
     function PrecioTarifa(Articulo, Tarifa: string; Uds: double): double;
     procedure NewRecord(var DataSet: TFIBTableSet; Tipo: string);
     procedure ArticuloChange(var DataSet: TFIBTableSet);
     procedure PromocionChange(var DataSet: TFIBTableSet);
     procedure UnidadesChange(var DataSet: TFIBTableSet);
     procedure TarifaChange(var DataSet: TFIBTableSet);
     procedure FamiliaChange(var DataSet: TFIBTableSet);
     function NuevoRig(Tipo: string): integer;
     function DameCierreEjercicio: TDateTime;
  public
     { Public declarations }
     procedure MuestraCliente(Cliente: integer);
     procedure MuestraAgrupacion(Agrupacion: string);
     procedure FiltrarFamilia;
     procedure FiltrarCliFam;
     procedure FiltrarCliArt;
     procedure FiltrarAgrFam;
     procedure FiltrarAgrArt;
     procedure FiltrarArticulo;
     //procedure FiltrarCliente(cliente: Integer);
     //procedure FiltrarAgrupaciones(Agrupaciones: String);
  end;

var
  DMPromocionesVenta : TDMPromocionesVenta;

implementation

uses UDMMain, UEntorno, uFBusca, DateUtils, StrUtils, UUtiles, UDameDato;

{$R *.dfm}

procedure TDMPromocionesVenta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); // IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // Máscaras
  AsignaDisplayFormat(QMFamilia, MascaraN, MascaraI, ShortDateFormat);
  QMFamiliaUDS_PROMOCION.DisplayFormat := MascaraI;
  QMFamiliaDTO1.DisplayFormat := MascaraP;
  QMFamiliaDTO2.DisplayFormat := MascaraP;
  QMFamiliaDTO3.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMCliFam, MascaraN, MascaraI, ShortDateFormat);
  QMCliFamUDS_PROMOCION.DisplayFormat := MascaraI;
  QMCliFamDTO1.DisplayFormat := MascaraP;
  QMCliFamDTO2.DisplayFormat := MascaraP;
  QMCliFamDTO3.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMCliArt, MascaraN, MascaraI, ShortDateFormat);
  QMCliArtUDS_PROMOCION.DisplayFormat := MascaraI;
  QMCliArtDTO1.DisplayFormat := MascaraP;
  QMCliArtDTO2.DisplayFormat := MascaraP;
  QMCliArtDTO3.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMAgrFam, MascaraN, MascaraI, ShortDateFormat);
  QMAgrFamUDS_PROMOCION.DisplayFormat := MascaraI;
  QMAgrFamDTO1.DisplayFormat := MascaraP;
  QMAgrFamDTO2.DisplayFormat := MascaraP;
  QMAgrFamDTO3.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMAgrArt, MascaraN, MascaraI, ShortDateFormat);
  QMAgrArtUDS_PROMOCION.DisplayFormat := MascaraI;
  QMAgrArtDTO1.DisplayFormat := MascaraP;
  QMAgrArtDTO2.DisplayFormat := MascaraP;
  QMAgrArtDTO3.DisplayFormat := MascaraP;

  AsignaDisplayFormat(QMArticulo, MascaraN, MascaraI, ShortDateFormat);
  QMArticuloUDS_PROMOCION.DisplayFormat := MascaraI;
  QMArticuloDTO1.DisplayFormat := MascaraP;
  QMArticuloDTO2.DisplayFormat := MascaraP;
  QMArticuloDTO3.DisplayFormat := MascaraP;

  FiltrarFamilia;
  FiltrarArticulo;
end;

function TDMPromocionesVenta.PrecioTarifa(Articulo, Tarifa: string; Uds: double): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PRECIO_VENTA FROM ART_TARIFAS_PRECIOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' TARIFA = :TARIFA AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' :UNIDADES BETWEEN UNID_MINIMAS AND UNID_MAXIMAS ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['UNIDADES'].AsFloat := Uds;
        ExecQuery;
        Result := FieldByName['PRECIO_VENTA'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPromocionesVenta.NewRecord(var DataSet: TFIBTableSet; Tipo: string);
begin
  with DataSet do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('EJERCICIO').AsInteger := REntorno.Ejercicio;
     FieldByName('CANAL').AsInteger := REntorno.Canal;
     FieldByName('TIPO').AsString := Tipo;
     FieldByName('RIG').AsInteger := NuevoRig(Tipo);
     FieldByName('FECHA_ALTA').AsDateTime := REntorno.FechaTrabSH;
     FieldByName('FECHA_BAJA').AsDateTime := DameCierreEjercicio; // EncodeDate(REntorno.Ejercicio, 12, 31);
     FieldByName('UNIDADES').AsFloat := 1;
     FieldByName('DTO1').AsFloat := 0;
     FieldByName('DTO2').AsFloat := 0;
     FieldByName('DTO3').AsFloat := 0;
     FieldByName('UDS_PROMOCION').AsFloat := 0;
     FieldByName('PRECIO_PROMO').AsFloat := 0;
     FieldByName('TARIFA').AsString := REntorno.TarifaDefecto;
  end;
end;

procedure TDMPromocionesVenta.ArticuloChange(var DataSet: TFIBTableSet);
begin
  with DataSet do
  begin
     FieldByName('TITULO_ARTICULO').AsString :=
        DameTituloArticulo(FieldByName('ARTICULO').AsString);

     FieldByName('PRECIO').AsFloat :=
        PrecioTarifa(FieldByName('ARTICULO').AsString,
        FieldByName('TARIFA').AsString,
        FieldByName('UNIDADES').AsFloat);
  end;
end;

procedure TDMPromocionesVenta.PromocionChange(var DataSet: TFIBTableSet);
begin
  with DataSet do
     FieldByName('TITULO_PROMOCION').AsString :=
        DameTituloArticulo(FieldByName('PROMOCION').AsString);
end;

procedure TDMPromocionesVenta.UnidadesChange(var DataSet: TFIBTableSet);
begin
  with DataSet do
     FieldByName('PRECIO').AsFloat :=
        PrecioTarifa(FieldByName('ARTICULO').AsString,
        FieldByName('TARIFA').AsString,
        FieldByName('UNIDADES').AsFloat);
end;

procedure TDMPromocionesVenta.TarifaChange(var DataSet: TFIBTableSet);
begin
  with DataSet do
     FieldByName('PRECIO').AsFloat :=
        PrecioTarifa(FieldByName('ARTICULO').AsString,
        FieldByName('TARIFA').AsString,
        FieldByName('UNIDADES').AsFloat);
end;

procedure TDMPromocionesVenta.MuestraCliente(Cliente: integer);
begin
  with xCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMPromocionesVenta.MuestraAgrupacion(Agrupacion: string);
begin
  with xAgrupacion do
  begin
     Close;
     Params.ByName['AGRUPACION'].AsString := Agrupacion;
     Open;
  end;
end;

procedure TDMPromocionesVenta.FamiliaChange(var DataSet: TFIBTableSet);
begin
  with DataSet do
     FieldByName('TITULO_FAMILIA').AsString :=
        DameTituloFamilia(FieldByName('FAMILIA').AsString);
end;

// Promoción Tipo Familia
procedure TDMPromocionesVenta.FiltrarFamilia;
begin
  with QMFamilia do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMPromocionesVenta.QMFamiliaNewRecord(DataSet: TDataSet);
begin
  NewRecord(QMFamilia, 'PFA');
end;

procedure TDMPromocionesVenta.QMFamiliaFAMILIAChange(Sender: TField);
begin
  FamiliaChange(QMFamilia);
end;

procedure TDMPromocionesVenta.QMFamiliaPROMOCIONChange(Sender: TField);
begin
  PromocionChange(QMFamilia);
end;

procedure TDMPromocionesVenta.QMFamiliaTARIFAChange(Sender: TField);
begin
  TarifaChange(QMFamilia);
end;

procedure TDMPromocionesVenta.QMFamiliaUNIDADESChange(Sender: TField);
begin
  UnidadesChange(QMFamilia);
end;

// Promoción Tipo Cliente/Familia
procedure TDMPromocionesVenta.QMCliFamNewRecord(DataSet: TDataSet);
begin
  NewRecord(QMCliFam, 'PCF');
  QMCliFamCLIENTE.AsInteger := xClienteCLIENTE.AsInteger;
end;

procedure TDMPromocionesVenta.FiltrarCliFam;
begin
  with QMCliFam do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := xClienteCLIENTE.AsInteger;
     Open;
  end;
end;

procedure TDMPromocionesVenta.QMCliFamFAMILIAChange(Sender: TField);
begin
  FamiliaChange(QMCliFam);
end;

procedure TDMPromocionesVenta.QMCliFamPROMOCIONChange(Sender: TField);
begin
  PromocionChange(QMCliFam);
end;

procedure TDMPromocionesVenta.QMCliFamTARIFAChange(Sender: TField);
begin
  TarifaChange(QMCliFam);
end;

procedure TDMPromocionesVenta.QMCliFamUNIDADESChange(Sender: TField);
begin
  UnidadesChange(QMCliFam);
end;

// Promoción Tipo Cliente/Articulo
procedure TDMPromocionesVenta.FiltrarCliArt;
begin
  with QMCliArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := xClienteCLIENTE.AsInteger;
     Open;
  end;
end;

procedure TDMPromocionesVenta.QMCliArtNewRecord(DataSet: TDataSet);
begin
  NewRecord(QMCliArt, 'PCA');
  QMCliArtCLIENTE.AsInteger := xClienteCLIENTE.AsInteger;
end;

procedure TDMPromocionesVenta.QMCliArtARTICULOChange(Sender: TField);
begin
  ArticuloChange(QMCliArt);
end;

procedure TDMPromocionesVenta.QMCliArtPROMOCIONChange(Sender: TField);
begin
  PromocionChange(QMCliArt);
end;

procedure TDMPromocionesVenta.QMCliArtTARIFAChange(Sender: TField);
begin
  TarifaChange(QMCliArt);
end;

procedure TDMPromocionesVenta.QMCliArtUNIDADESChange(Sender: TField);
begin
  UnidadesChange(QMCliArt);
end;

// Promoción Tipo Agrupación Cliente/Familia
procedure TDMPromocionesVenta.FiltrarAgrFam;
begin
  with QMAgrFam do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGRUPACION'].AsString := xAgrupacionAGRUPACION.AsString;
     Open;
  end;
end;

procedure TDMPromocionesVenta.QMAgrFamNewRecord(DataSet: TDataSet);
begin
  NewRecord(QMAgrFam, 'PAF');
  QMAgrFamAGRUPACION.AsString := xAgrupacionAGRUPACION.AsString;
end;

procedure TDMPromocionesVenta.QMAgrFamFAMILIAChange(Sender: TField);
begin
  FamiliaChange(QMAgrFam);
end;

procedure TDMPromocionesVenta.QMAgrFamPROMOCIONChange(Sender: TField);
begin
  PromocionChange(QMAgrFam);
end;

procedure TDMPromocionesVenta.QMAgrFamTARIFAChange(Sender: TField);
begin
  TarifaChange(QMAgrFam);
end;

procedure TDMPromocionesVenta.QMAgrFamUNIDADESChange(Sender: TField);
begin
  UnidadesChange(QMAgrFam);
end;

// Promoción Tipo Agrupación Cliente/Articulo
procedure TDMPromocionesVenta.FiltrarAgrArt;
begin
  with QMAgrArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGRUPACION'].AsString := xAgrupacionAGRUPACION.AsString;
     Open;
  end;
end;

procedure TDMPromocionesVenta.QMAgrArtNewRecord(DataSet: TDataSet);
begin
  NewRecord(QMAgrArt, 'PAA');
  QMAgrArtAGRUPACION.AsString := xAgrupacionAGRUPACION.AsString;
end;

procedure TDMPromocionesVenta.QMAgrArtARTICULOChange(Sender: TField);
begin
  ArticuloChange(QMAgrArt);
end;

procedure TDMPromocionesVenta.QMAgrArtTARIFAChange(Sender: TField);
begin
  TarifaChange(QMAgrArt);
end;

procedure TDMPromocionesVenta.QMAgrArtUNIDADESChange(Sender: TField);
begin
  UnidadesChange(QMAgrArt);
end;

procedure TDMPromocionesVenta.QMAgrArtPROMOCIONChange(Sender: TField);
begin
  PromocionChange(QMAgrArt);
end;

// Promoción Tipo Artículo
procedure TDMPromocionesVenta.FiltrarArticulo;
begin
  with QMArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMPromocionesVenta.QMArticuloNewRecord(DataSet: TDataSet);
begin
  NewRecord(QMArticulo, 'PAR');
end;

procedure TDMPromocionesVenta.QMArticuloARTICULOChange(Sender: TField);
begin
  ArticuloChange(QMArticulo);
end;

procedure TDMPromocionesVenta.QMArticuloUNIDADESChange(Sender: TField);
begin
  UnidadesChange(QMArticulo);
end;

procedure TDMPromocionesVenta.QMArticuloTARIFAChange(Sender: TField);
begin
  TarifaChange(QMArticulo);
end;

procedure TDMPromocionesVenta.QMArticuloPROMOCIONChange(Sender: TField);
begin
  PromocionChange(QMArticulo);
end;

function TDMPromocionesVenta.NuevoRig(Tipo: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(RIG) FROM ART_PROMOCIONES_C ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' TIPO = :TIPO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMPromocionesVenta.DameCierreEjercicio: TDateTime;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CIERRE FROM EMP_EJERCICIOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        ExecQuery;
        Result := Trunc(FieldByName['CIERRE'].AsDateTime);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
