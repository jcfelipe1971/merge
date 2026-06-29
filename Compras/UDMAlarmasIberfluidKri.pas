unit UDMAlarmasIberfluidKri;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBDataSet;

type
  TDMAlarmasIberfluidKri = class(TDataModule)
     TLocal: THYTransaction;
     xAlarmaVerde: TFIBDataSetRO;
     DSxAlarmaVerde: TDataSource;
     xAlarmaAmarilla: TFIBDataSetRO;
     DSxAlarmaAmarilla: TDataSource;
     xAlarmaRoja: TFIBDataSetRO;
     DSxAlarmaRoja: TDataSource;
     xAlarmaVioleta: TFIBDataSetRO;
     DSxAlarmaVioleta: TDataSource;
     xAlarmaVerdeID_E: TIntegerField;
     xAlarmaVerdeID_S: TIntegerField;
     xAlarmaVerdeEMPRESA: TIntegerField;
     xAlarmaVerdeEJERCICIO: TIntegerField;
     xAlarmaVerdeCANAL: TIntegerField;
     xAlarmaVerdeSERIE: TFIBStringField;
     xAlarmaVerdeTIPO: TFIBStringField;
     xAlarmaVerdeRIG: TIntegerField;
     xAlarmaVerdeALMACEN: TFIBStringField;
     xAlarmaVerdeMONEDA: TFIBStringField;
     xAlarmaVerdeS_BASES: TFloatField;
     xAlarmaVerdeLIQUIDO: TFloatField;
     xAlarmaVerdeSU_REFERENCIA: TFIBStringField;
     xAlarmaVerdeFECHA: TDateTimeField;
     xAlarmaVerdeFECHA_ENTREGA: TDateTimeField;
     xAlarmaVerdeTERCERO: TIntegerField;
     xAlarmaVerdePROVEEDOR: TIntegerField;
     xAlarmaVerdeFECHA_ENTREGA_PED: TDateTimeField;
     xAlarmaVerdeFECHA_PRE_CAB: TDateTimeField;
     xAlarmaVerdeFECHA_REC_CAB: TDateTimeField;
     xAlarmaVerdeFECHA_CONFIRMADA_KRI: TDateTimeField;
     xAlarmaVerdePLAZO_INICIAL_KRI: TDateTimeField;
     xAlarmaVerdePLAZO_CONFIRM_KRI: TDateTimeField;
     xAlarmaAmarillaID_E: TIntegerField;
     xAlarmaAmarillaID_S: TIntegerField;
     xAlarmaAmarillaEMPRESA: TIntegerField;
     xAlarmaAmarillaEJERCICIO: TIntegerField;
     xAlarmaAmarillaCANAL: TIntegerField;
     xAlarmaAmarillaSERIE: TFIBStringField;
     xAlarmaAmarillaTIPO: TFIBStringField;
     xAlarmaAmarillaRIG: TIntegerField;
     xAlarmaAmarillaALMACEN: TFIBStringField;
     xAlarmaAmarillaMONEDA: TFIBStringField;
     xAlarmaAmarillaS_BASES: TFloatField;
     xAlarmaAmarillaLIQUIDO: TFloatField;
     xAlarmaAmarillaSU_REFERENCIA: TFIBStringField;
     xAlarmaAmarillaFECHA: TDateTimeField;
     xAlarmaAmarillaFECHA_ENTREGA: TDateTimeField;
     xAlarmaAmarillaTERCERO: TIntegerField;
     xAlarmaAmarillaPROVEEDOR: TIntegerField;
     xAlarmaAmarillaFECHA_ENTREGA_PED: TDateTimeField;
     xAlarmaAmarillaFECHA_PRE_CAB: TDateTimeField;
     xAlarmaAmarillaFECHA_REC_CAB: TDateTimeField;
     xAlarmaAmarillaFECHA_CONFIRMADA_KRI: TDateTimeField;
     xAlarmaAmarillaPLAZO_INICIAL_KRI: TDateTimeField;
     xAlarmaAmarillaPLAZO_CONFIRM_KRI: TDateTimeField;
     xAlarmaRojaID_E: TIntegerField;
     xAlarmaRojaID_S: TIntegerField;
     xAlarmaRojaEMPRESA: TIntegerField;
     xAlarmaRojaEJERCICIO: TIntegerField;
     xAlarmaRojaCANAL: TIntegerField;
     xAlarmaRojaSERIE: TFIBStringField;
     xAlarmaRojaTIPO: TFIBStringField;
     xAlarmaRojaRIG: TIntegerField;
     xAlarmaRojaALMACEN: TFIBStringField;
     xAlarmaRojaMONEDA: TFIBStringField;
     xAlarmaRojaS_BASES: TFloatField;
     xAlarmaRojaLIQUIDO: TFloatField;
     xAlarmaRojaSU_REFERENCIA: TFIBStringField;
     xAlarmaRojaFECHA: TDateTimeField;
     xAlarmaRojaFECHA_ENTREGA: TDateTimeField;
     xAlarmaRojaTERCERO: TIntegerField;
     xAlarmaRojaPROVEEDOR: TIntegerField;
     xAlarmaRojaFECHA_ENTREGA_PED: TDateTimeField;
     xAlarmaRojaFECHA_PRE_CAB: TDateTimeField;
     xAlarmaRojaFECHA_REC_CAB: TDateTimeField;
     xAlarmaRojaFECHA_CONFIRMADA_KRI: TDateTimeField;
     xAlarmaRojaPLAZO_INICIAL_KRI: TDateTimeField;
     xAlarmaRojaPLAZO_CONFIRM_KRI: TDateTimeField;
     xAlarmaVioletaID_E: TIntegerField;
     xAlarmaVioletaID_S: TIntegerField;
     xAlarmaVioletaEMPRESA: TIntegerField;
     xAlarmaVioletaEJERCICIO: TIntegerField;
     xAlarmaVioletaCANAL: TIntegerField;
     xAlarmaVioletaSERIE: TFIBStringField;
     xAlarmaVioletaTIPO: TFIBStringField;
     xAlarmaVioletaRIG: TIntegerField;
     xAlarmaVioletaALMACEN: TFIBStringField;
     xAlarmaVioletaMONEDA: TFIBStringField;
     xAlarmaVioletaS_BASES: TFloatField;
     xAlarmaVioletaLIQUIDO: TFloatField;
     xAlarmaVioletaSU_REFERENCIA: TFIBStringField;
     xAlarmaVioletaFECHA: TDateTimeField;
     xAlarmaVioletaFECHA_ENTREGA: TDateTimeField;
     xAlarmaVioletaTERCERO: TIntegerField;
     xAlarmaVioletaPROVEEDOR: TIntegerField;
     xAlarmaVioletaFECHA_ENTREGA_PED: TDateTimeField;
     xAlarmaVioletaFECHA_PRE_CAB: TDateTimeField;
     xAlarmaVioletaFECHA_REC_CAB: TDateTimeField;
     xAlarmaVioletaFECHA_CONFIRMADA_KRI: TDateTimeField;
     xAlarmaVioletaPLAZO_INICIAL_KRI: TDateTimeField;
     xAlarmaVioletaPLAZO_CONFIRM_KRI: TDateTimeField;
     xAlarmaVerdeNOMBRE_R_SOCIAL: TFIBStringField;
     xAlarmaAmarillaNOMBRE_R_SOCIAL: TFIBStringField;
     xAlarmaRojaNOMBRE_R_SOCIAL: TFIBStringField;
     xAlarmaVioletaNOMBRE_R_SOCIAL: TFIBStringField;
     xAlarmaVerdeSERIE_PED: TFIBStringField;
     xAlarmaVerdeRIG_PED: TIntegerField;
     xAlarmaAmarillaSERIE_PED: TFIBStringField;
     xAlarmaAmarillaRIG_PED: TIntegerField;
     xAlarmaRojaSERIE_PED: TFIBStringField;
     xAlarmaRojaRIG_PED: TIntegerField;
     xAlarmaVioletaSERIE_PED: TFIBStringField;
     xAlarmaVioletaRIG_PED: TIntegerField;
     xAlarmaVerdeEJERCICIO_PED: TIntegerField;
     xAlarmaAmarillaEJERCICIO_PED: TIntegerField;
     xAlarmaRojaEJERCICIO_PED: TIntegerField;
     xAlarmaVioletaEJERCICIO_PED: TIntegerField;
     procedure DataModuleDestroy(Sender: TObject);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     LocalMascaraN: string;
  public
     { Public declarations }
     procedure Filtra(Fecha, DesdeFecha: TDateTime; Serie: string; Proveedor: integer);
  end;

var
  DMAlarmasIberfluidKri : TDMAlarmasIberfluidKri;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMAlarmasIberfluidKri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  xAlarmaVerdeS_BASES.DisplayFormat := LocalMascaraN;
  xAlarmaVerdeLIQUIDO.DisplayFormat := LocalMascaraN;
  xAlarmaAmarillaS_BASES.DisplayFormat := LocalMascaraN;
  xAlarmaAmarillaLIQUIDO.DisplayFormat := LocalMascaraN;
  xAlarmaRojaS_BASES.DisplayFormat := LocalMascaraN;
  xAlarmaRojaLIQUIDO.DisplayFormat := LocalMascaraN;
  xAlarmaVioletaS_BASES.DisplayFormat := LocalMascaraN;
  xAlarmaVioletaLIQUIDO.DisplayFormat := LocalMascaraN;
end;

procedure TDMAlarmasIberfluidKri.Filtra(Fecha, DesdeFecha: TDateTime; Serie: string; Proveedor: integer);
begin
  Serie := UpperCase(Trim(Serie));
  xAlarmaVerde.Close;
  xAlarmaAmarilla.Close;
  xAlarmaRoja.Close;
  xAlarmaVioleta.Close;
  if TLocal.InTransaction then
     TLocal.Commit;
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  with xAlarmaVerde do
  begin
     SelectSQL.Clear;

     SelectSQL.Add(' SELECT A.ID_E, A.ID_S, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO,C.RIG, ');
     SelectSQL.Add(' C.ALMACEN, C.MONEDA, C.S_BASES, C.LIQUIDO, C.SU_REFERENCIA, C.FECHA, C.FECHA_ENTREGA, ');
     SelectSQL.Add(' P.TERCERO, P.PROVEEDOR, T.NOMBRE_R_SOCIAL, P.FECHA_ENTREGA AS FECHA_ENTREGA_PED, ');
     SelectSQL.Add(' P.FECHA_PRE_CAB, P.FECHA_REC_CAB, P.FECHA_CONFIRMADA_KRI, P.PLAZO_INICIAL_KRI, ');
     SelectSQL.Add(' P.PLAZO_CONFIRM_KRI, V.EJERCICIO AS EJERCICIO_PED, V.SERIE AS SERIE_PED, V.RIG AS RIG_PED');
     SelectSQL.Add(' FROM KRI_ALARMAS_IBERFLUID (?EMPRESA, ?FECHA, ?TIPO) A ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E C ON A.ID_E = C.ID_E ');
     SelectSQL.Add(' JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E ');
     SelectSQL.Add(' JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO ');
     SelectSQL.Add(' JOIN GES_CABECERAS_S V ON A.ID_S = V.ID_S ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' A.FECHA_RESULTADO >= ?DESDE_FECHA ');
     if (Serie > ' ') then
        SelectSQL.Add(' AND C.SERIE = ?SERIE ');
     if (Proveedor <> 0) then
        SelectSQL.Add(' AND P.PROVEEDOR = ?PROVEEDOR ');
     SelectSQL.Add('ORDER BY C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     if (Serie > ' ') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Proveedor > 0) then
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['TIPO'].AsString := 'VERDE';
     Open;
  end;
  with xAlarmaAmarilla do
  begin
     SelectSQL.Text := xAlarmaVerde.SelectSQL.Text;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     if (Serie > ' ') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Proveedor <> 0) then
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['TIPO'].AsString := 'AMARILLA';
     Open;
  end;
  with xAlarmaRoja do
  begin
     SelectSQL.Text := xAlarmaVerde.SelectSQL.Text;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     if (Serie > ' ') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Proveedor <> 0) then
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['TIPO'].AsString := 'ROJA';
     Open;
  end;
  with xAlarmaVioleta do
  begin
     SelectSQL.Text := xAlarmaVerde.SelectSQL.Text;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     Params.ByName['DESDE_FECHA'].AsDateTime := DesdeFecha;
     if (Serie > ' ') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Proveedor <> 0) then
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
     Params.ByName['TIPO'].AsString := 'VIOLETA';
     Open;
  end;
end;

procedure TDMAlarmasIberfluidKri.DataModuleDestroy(Sender: TObject);
begin
  xAlarmaVerde.Close;
  xAlarmaAmarilla.Close;
  xAlarmaRoja.Close;
  xAlarmaVioleta.Close;
  if TLocal.InTransaction then
     TLocal.Commit;
end;

end.
