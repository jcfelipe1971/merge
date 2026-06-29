unit ZUFMTraspasoMultiCanalMasivo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, ComCtrls, ToolWin, ActnList,
  rxToolEdit, ULFDateEdit, ULFLabel, ULFEdit, Grids, DBGrids, NsDBGrid,
  UNavigator, ULFToolBar, UHYDescription, ULFHYDBDescription,
  ULFEditFind2000, ULFDBEdit, Math, DateUtils, ULFPanel, Buttons,
  TFlatCheckBoxUnit, ULFCheckBox;

type
  TZFMTraspasoMultiCanalMasivo = class(TG2kForm)
     PNMain: TLFPanel;
     PNTraspaso: TLFPanel;
     RGDocumento: TRadioGroup;
     TBTraspaso: TLFToolBar;
     TButtTrapasa: TToolButton;
     ALMain: TActionList;
     ATraspasa: TAction;
     GBDatos: TGroupBox;
     LCanalDestino: TLFLabel;
     EFCanales: TEditFind2000;
     LSerieDestino: TLFLabel;
     EFSeriesD: TEditFind2000;
     GBVarios: TGroupBox;
     LFechaDocumento: TLFLabel;
     DEFechaDst: TLFDateEdit;
     CBCerrarFactura: TLFCheckBox;
     TButtSalir: TToolButton;
     ASalir: TAction;
     GTraspasos: TGroupBox;
     LPorcentajeDestino: TLFLabel;
     LTotalDestino: TLFLabel;
     LFEPorcentajeD: TLFEdit;
     LFETotalD: TLFEdit;
     LPorciento: TLFLabel;
     LMoneda: TLFLabel;
     CBBorraDoc: TLFCheckBox;
     DBGRecibos: TDBGridFind2000;
     LTotalSeleccionFiltro: TLFLabel;
     LFETotalSelec: TLFDbedit;
     LSerieOrigen: TLFLabel;
     EFSeriesOr: TLFEditFind2000;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LFFechaD: TLFDateEdit;
     LFFechaH: TLFDateEdit;
     LDEsdeRIG: TLFLabel;
     LHastaRIG: TLFLabel;
     LFRigD: TLFEditFind2000;
     LFRigH: TLFEditFind2000;
     GBOrigen: TGroupBox;
     LCanalOrigen: TLFLabel;
     EFCanalOr: TLFEdit;
     DBReciboAct: TDBGridFind2000;
     LCuentaTesoreria: TLFLabel;
     EFCuentaCaja: TLFEditFind2000;
     BEmpezar: TBitBtn;
     BInterrumpir: TBitBtn;
     GBGrid: TGroupBox;
     PNLInfoProceso: TLFPanel;
     LFaltan: TLFLabel;
     LFactura: TLFLabel;
     LBLProcesando: TLFLabel;
     LBLFaltan: TLFLabel;
     PNLFiltros: TLFPanel;
     PNLBotones: TLFPanel;
     PNLGrids: TLFPanel;
     PNLPie: TLFPanel;
     ETituloCuenta: TLFEdit;
     ETituloCanalOrigen: TLFEdit;
     ETituloCanalDestino: TLFEdit;
     ETituloSerieOrigen: TLFEdit;
     ETituloSerieDestino: TLFEdit;
     procedure EFCanalesChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ATraspasaExecute(Sender: TObject);
     procedure EFSeriesDChange(Sender: TObject);
     procedure EFSeriesDBusqueda(Sender: TObject);
     procedure RGDocumentoClick(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure LFEPorcentajeDExit(Sender: TObject);
     procedure EFSeriesOrBusqueda(Sender: TObject);
     procedure EFSeriesOrChange(Sender: TObject);
     procedure LFETotalSelecChange(Sender: TObject);
     procedure EFCanalOrChange(Sender: TObject);
     procedure LFRigDBusqueda(Sender: TObject);
     procedure LFRigHBusqueda(Sender: TObject);
     procedure LFRigDChange(Sender: TObject);
     procedure LFRigHChange(Sender: TObject);
     procedure EFCuentaCajaBusqueda(Sender: TObject);
     procedure EFCuentaCajaChange(Sender: TObject);
     procedure BInterrumpirClick(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure BEmpezarClick(Sender: TObject);
     procedure LFFechaDExit(Sender: TObject);
     procedure LFFechaHExit(Sender: TObject);
  private
     { Private declarations }
     {id_s, rig,} ejercicio, canal, NDoc{, Transportista, Accion}: integer;
     tipo{, serie}: string;
     // E_Destino, C_Destino, R_Destino: integer;
     // S_Destino, T_Destino: string;
     procedure PonCaptionVentana(Tipo: string);
     // procedure ConstruyeRG;
  public
     { Public declarations }
     Interrumpir: boolean;
     procedure Carga;
     function DameDocumentoDestino: string;
     procedure CargaGrid;
     procedure CalculoFechas(fechad, fechah: string; var fecha_desde, fecha_hasta: TDateTime);
  end;

var
  ZFMTraspasoMultiCanalMasivo : TZFMTraspasoMultiCanalMasivo;

implementation

uses UDMMain, ZUDMTraspasoMultiCanalMasivo, UEntorno, FIBQuery, DB, UUtiles,
  FIBDataSetRO, UDMListados, UDameDato;

{$R *.dfm}

procedure TZFMTraspasoMultiCanalMasivo.EFCanalesChange(Sender: TObject);
begin
  ETituloCanalDestino.Text := DameTituloCanal(StrToIntDef(EFCanales.Text, 0));
end;

procedure TZFMTraspasoMultiCanalMasivo.Carga;
var
  Year, Month, Day : word;
begin
  canal := REntorno.Canal;
  ejercicio := REntorno.ejercicio;
  tipo := 'FAC';

  // Poso la data del des de - hasta al primer i últim dia del mes
  DecodeDate(Date, Year, Month, Day);
  LFFechaD.Date := EncodeDate(Year, Month, StrToInt('01'));
  LFFechaH.Date := EncodeDate(Year, Month, DaysInAMonth(Year, Month));

  EFCanales.Text := ZDMTraspasoMultiCanalMasivo.DameMinCanal;
  EFSeriesOr.Text := ZDMTraspasoMultiCanalMasivo.DameMinSerie(StrToIntDef(EFCanalOr.Text, REntorno.Canal));
  EFSeriesD.Text := ZDMTraspasoMultiCanalMasivo.DameMinSerie(StrToIntDef(EFCanales.Text, REntorno.Canal));

  PonCaptionVentana(Tipo);
end;

procedure TZFMTraspasoMultiCanalMasivo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE   

  AbreData(TZDMTraspasoMultiCanalMasivo, ZDMTraspasoMultiCanalMasivo);
  DEFechaDst.Date := Date;
  EFCanalOr.Text := REntorno.CanalStr;
  { TODO : Aqui deberíamos buscar la cuenta teniendo en cuenta GESTION, NIVEL y PGC del canal }
  EFCuentaCaja.Text := '570000000';
  Carga;
  CBCerrarFactura.State := cbChecked;
  // CargaGrid;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BEmpezar, 1, DMMain.ILMain_Ac, 7);
  GetBitmapFromImageList(BInterrumpir, 1, DMMain.ILMain_Ac, 39);
  GetBitmapFromImageList(BEmpezar, 2, DMMain.ILMain_In, 7);
  GetBitmapFromImageList(BInterrumpir, 2, DMMain.ILMain_In, 39);
end;

procedure TZFMTraspasoMultiCanalMasivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(ZDMTraspasoMultiCanalMasivo);
end;

function TZFMTraspasoMultiCanalMasivo.DameDocumentoDestino: string;
begin
  // case RGDocumento.ItemIndex of
  //    4 : result := 'FAC';
  // end;

  if (NDoc < 5) then
  begin
     case RGDocumento.ItemIndex of
        0: Result := 'FAC';
        1: Result := 'PEC';
        2: Result := 'ALB';
        3: Result := 'FAC';
     end;
  end
  else
  begin
     case RGDocumento.ItemIndex of
        0: Result := 'OFP';
        1: Result := 'OCP';
        2: Result := 'PEP';
        3: Result := 'ALP';
        4: Result := 'FAP';
     end;
  end;
end;

procedure TZFMTraspasoMultiCanalMasivo.ATraspasaExecute(Sender: TObject);
var
  // doc_destino, Serie_dst, tipo_dst : string;
  // Refresca, Ejercicio_dst, Canal_dst, Rig_dst : integer;
  // percent_desti, percent_origen, efectivo : real;
  Fecha_Desde, Fecha_Hasta : TDateTime;
  id_rigD, id_rigH : integer;
begin
  Screen.Cursor := crHourGlass;
  try
     CalculoFechas(LFFechaD.Text, LFFechaH.Text, Fecha_Desde, Fecha_Hasta);

     id_rigD := ZDMTraspasoMultiCanalMasivo.BuscarID_Rig(EFSeriesOr.Text, StrToInt(LFRigD.Text));
     id_rigH := ZDMTraspasoMultiCanalMasivo.BuscarID_Rig(EFSeriesOr.Text, StrToInt(LFRigH.Text));

     // Crida al procés que genera el traspàs
     ZDMTraspasoMultiCanalMasivo.TraspasoDocumento('FAC', EFSeriesOr.Text, EFSeriesD.Text,
        Canal, Ejercicio,
        StrToIntDef(EFCanales.Text, REntorno.Canal), NDoc,
        0, 0, Ord(CBCerrarFactura.Checked), 0, 0, StrToFloat(LFEPorcentajeD.Text),
        Fecha_Desde, Fecha_Hasta, EFCuentaCaja.Text, id_rigD, id_rigH);
  finally
     Screen.Cursor := crDefault;
  end;
  ShowMessage(_('Traspaso generado con éxito'));
end;

procedure TZFMTraspasoMultiCanalMasivo.PonCaptionVentana(Tipo: string);
var
  Valor : integer;
begin
  if (Tipo = 'FAC') then
  begin
     Caption := _('Traspaso Factura Multi-Canal'); // Quito SexShop por si lo utiliza otro cliente
     NDoc := 4;
  end;

  if (NDoc > 4) then
     Valor := (NDoc - 4)
  else
     Valor := NDoc;

  // ConstruyeRG;

  RGDocumento.ItemIndex := Valor - 1;
end;

procedure TZFMTraspasoMultiCanalMasivo.EFSeriesDChange(Sender: TObject);
begin
  ETituloSerieDestino.Text := DameTituloSerie(EFSeriesD.Text);
  // CargaGrid;
end;

procedure TZFMTraspasoMultiCanalMasivo.EFSeriesDBusqueda(Sender: TObject);
begin
  EFSeriesD.CondicionBusqueda := 'CANAL=' + EFCanales.Text;
end;

procedure TZFMTraspasoMultiCanalMasivo.RGDocumentoClick(Sender: TObject);
begin
  // Visible solo para facturas
  CBCerrarFactura.Visible := (((RGDocumento.ItemIndex = 3) and (NDoc < 5)) or
     ((RGDocumento.ItemIndex = 4) and (NDoc > 4)));
end;

procedure TZFMTraspasoMultiCanalMasivo.ASalirExecute(Sender: TObject);
begin
  Close;
end;

{ No se utiliza
procedure TZFMTraspasoMultiCanalMasivo.ConstruyeRG;
begin
  with RGDocumento do
  begin
     Items.Clear;
     if (NDoc < 5) then
     begin
        Items.Add(_('Oferta'));
        Items.Add(_('Pedido'));
        Items.Add(_('Albarán'));
        Items.Add(_('Factura'));
        Columns := 2;
     end
     else
     begin
        Items.Add(_('Propuesta'));
        Items.Add(_('Propuesta Confirmada'));
        Items.Add(_('Pedido'));
        Items.Add(_('Albarán'));
        Items.Add(_('Factura'));
        Columns := 3;
     end;
  end;
end;
}
procedure TZFMTraspasoMultiCanalMasivo.LFEPorcentajeDExit(Sender: TObject);
begin

  if (LFEPorcentajeD.Text <> '') then
     LFETotalD.Text := FormatFloat(MascaraN, ((ZDMTraspasoMultiCanalMasivo.xRecibosSUMA_LIQUIDO.AsFloat * StrToFloat(LFEPorcentajeD.Text)) / 100));
end;

procedure TZFMTraspasoMultiCanalMasivo.EFSeriesOrBusqueda(Sender: TObject);
begin
  EFSeriesOr.CondicionBusqueda := 'CANAL=' + EFCanales.Text;
end;

procedure TZFMTraspasoMultiCanalMasivo.EFSeriesOrChange(Sender: TObject);
begin
  ETituloSerieOrigen.Text := DameTituloSerie(EFSeriesOr.Text);
  // CargaGrid;
end;

procedure TZFMTraspasoMultiCanalMasivo.CargaGrid;
var
  fecha_desde, fecha_hasta : TDateTime;
  id_rigD, id_rigH{, temp} : integer;
begin
  // Es posa la hora a la data (00:00:00 i 23:59:59)
  CalculoFechas(LFFechaD.Text, LFFechaH.Text, Fecha_Desde, Fecha_Hasta);
  {
  id_rigD := BuscarID_Rig(StrToInt(LFRigD.Text), 'D');
  id_rigH := BuscarID_Rig(StrToInt(LFRigH.Text), 'H');

  // S'ordenen els rigs de menor a major
  if (id_rigH < id_rigD) then
    begin
      temp := id_rigH;
      id_rigH := id_rigD;
      id_rigD := temp;
    end;
 }
  id_rigD := 0;
  id_rigH := 0;

  ZDMTraspasoMultiCanalMasivo.MostrarRecibos(EFSeriesOr.Text, Fecha_Desde, Fecha_Hasta, id_rigD,
     id_rigH);
end;

procedure TZFMTraspasoMultiCanalMasivo.CalculoFechas(fechad, fechah: string; var fecha_desde, fecha_hasta: TDateTime);
begin
  Fecha_Desde := StrToDateTime(fechad + '00:00:00');
  Fecha_Hasta := StrToDateTime(fechah + '23:59:59');
end;

procedure TZFMTraspasoMultiCanalMasivo.LFETotalSelecChange(Sender: TObject);
begin
  LFEPorcentajeDExit(Sender);
end;

procedure TZFMTraspasoMultiCanalMasivo.EFCanalOrChange(Sender: TObject);
begin
  ETituloCanalOrigen.Text := DameTituloCanal(StrToIntDef(EFCanalOr.Text, 0));
end;

procedure TZFMTraspasoMultiCanalMasivo.LFRigDBusqueda(Sender: TObject);
var
  fechad, fechah : string;
  YearD, MonthD, DayD : word;
  YearH, MonthH, DayH : word;
begin
  DecodeDate(LFFechaD.Date, YearD, MonthD, DayD);
  DecodeDate(LFFechaH.Date, YearH, MonthH, DayH);

  fechad := IntToStr(monthd) + '/' + IntToStr(dayd) + '/' + IntToStr(yeard) + ' 00:00:00';
  fechah := IntToStr(monthh) + '/' + IntToStr(dayh) + '/' + IntToStr(yearh) + ' 23:59:59';

  LFRigD.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr +
     ' and ejercicio=' + REntorno.EjercicioStr +
     ' and canal=' + REntorno.CanalStr +
     ' and serie=''' + EFSeriesOr.Text + '''' +
     ' and fecha>=''' + fechad + '''' +
     ' and fecha<=''' + fechah + '''';
end;

procedure TZFMTraspasoMultiCanalMasivo.LFRigHBusqueda(Sender: TObject);
var
  fechad, fechah : string;
  YearD, MonthD, DayD : word;
  YearH, MonthH, DayH : word;
begin
  DecodeDate(LFFechaD.Date, YearD, MonthD, DayD);
  DecodeDate(LFFechaH.Date, YearH, MonthH, DayH);

  fechad := IntToStr(monthd) + '/' + IntToStr(dayd) + '/' + IntToStr(yeard) + ' 00:00:00';
  fechah := IntToStr(monthh) + '/' + IntToStr(dayh) + '/' + IntToStr(yearh) + ' 23:59:59';

  LFRigH.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr +
     ' and ejercicio=' + REntorno.EjercicioStr +
     ' and canal=' + REntorno.CanalStr +
     ' and serie=''' + EFSeriesOr.Text + '''' +
     ' and fecha>=''' + fechad + '''' +
     ' and fecha<=''' + fechah + '''';
end;

procedure TZFMTraspasoMultiCanalMasivo.LFRigDChange(Sender: TObject);
begin
  if ((LFRigD.Text <> '') and (LFRigH.Text <> '')) then
     CargaGrid;
end;

procedure TZFMTraspasoMultiCanalMasivo.LFRigHChange(Sender: TObject);
begin
  if ((LFRigD.Text <> '') and (LFRigH.Text <> '')) then
     CargaGrid;
end;

procedure TZFMTraspasoMultiCanalMasivo.EFCuentaCajaBusqueda(Sender: TObject);
begin
  EFCuentaCaja.CondicionBusqueda := 'GESTION=11';
end;

procedure TZFMTraspasoMultiCanalMasivo.EFCuentaCajaChange(Sender: TObject);
begin
  ETituloCuenta.Text := DameTituloCuenta(EFCuentaCaja.Text);
end;

procedure TZFMTraspasoMultiCanalMasivo.BInterrumpirClick(Sender: TObject);
begin
  Interrumpir := True;
end;

procedure TZFMTraspasoMultiCanalMasivo.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  Interrumpir := True;
end;

procedure TZFMTraspasoMultiCanalMasivo.BEmpezarClick(Sender: TObject);
var
  fechad, fechah : TDateTime;
  {id_rigD, id_RigH,} Cantidad{, temp} : integer;
begin
  fechad := HourIntoDate(LFFechaD.Date, '00:00:00');
  fechah := HourIntoDate(LFFechaH.Date, '23:59:59');
  DMListados.Normalizar_Desde_Hasta(fechad, fechah);

  BInterrumpir.Enabled := True;
  BEmpezar.Enabled := False;
  Interrumpir := False;
  Cantidad := 0;

  with ZDMTraspasoMultiCanalMasivo.QSelecciona do
  begin
     Close;
     if not Transaction.InTransaction then
        Transaction.StartTransaction;

     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['canal'].AsInteger := REntorno.Canal;
     Params.ByName['serie'].AsString := EFSeriesOr.Text;
     Params.ByName['fecha_d'].AsDateTime := FechaD;
     Params.ByName['fecha_h'].AsDateTime := FechaH;
     // Params.ByName['id_rigD'].AsInteger := id_rigD;
     // Params.ByName['id_rigH'].AsInteger := id_rigH;
     Params.ByName['cc'].AsString := EFCuentaCaja.Text;
     Open;

     LFaltan.Caption := _('Contando') + '...';
     Application.ProcessMessages;
     while not EOF do
     begin
        Inc(Cantidad);
        Next;
     end;

     First;
     while ((not EOF) and (not Interrumpir)) do
     begin
        try
           LFactura.Caption := Format(_('Emp: %d - Ejer: %d - Can: %d - RIG: %d'), [FieldByName('EMPRESA').AsInteger, FieldByName('EJERCICIO').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('DOC_NUMERO').AsInteger]);
           LFaltan.Caption := IntToStr(Cantidad);
           Application.ProcessMessages;

           // Actualitzo el grid de l'actual
           ZDMTraspasoMultiCanalMasivo.ActualizaREcibosGAct(EFSeriesOr.Text, FechaD, FechaH, FieldByName('ID_DOC').AsInteger);

           // Crida al procés que genera el traspàs
           if (ZDMTraspasoMultiCanalMasivo.HayTraspasoHerencia(FieldByName('DOC_NUMERO').AsInteger, StrToInt(EFCanales.Text),
              EFSeriesOr.Text) = 0) then
           begin
              ZDMTraspasoMultiCanalMasivo.TraspasoDocumento('FAC', EFSeriesOr.Text, EFSeriesD.Text,
                 Canal, Ejercicio, StrToIntDef(EFCanales.Text, REntorno.Canal), NDoc,
                 0, 0, Ord(CBCerrarFactura.Checked), 0, 0, StrToFloat(LFEPorcentajeD.Text),
                 FechaD, FechaH, EFCuentaCaja.Text, FieldByName('ID_DOC').AsInteger, FieldByName('ID_DOC').AsInteger);
           end
        except
           ShowMessage(_('Error de traspaso'));
        end;

        Dec(Cantidad);
        Next;
     end;

     Close;
     if Transaction.InTransaction then
        Transaction.Commit;
  end;

  if not Interrumpir then
  begin
     LFactura.Caption := _('Terminado');
     ShowMessage(_('Proceso Finalizado'));
  end
  else
  begin
     LFactura.Caption := _('Interrumpido');
     ShowMessage(_('Proceso Interrumpido'));
  end;

  LFaltan.Caption := '0';
  BInterrumpir.Enabled := False;
  BEmpezar.Enabled := True;
end;

procedure TZFMTraspasoMultiCanalMasivo.LFFechaDExit(Sender: TObject);
begin
  if ((LFFechaD.Date <> 0) and (LFFechaH.Date <> 0)) then
     CargaGrid;
end;

procedure TZFMTraspasoMultiCanalMasivo.LFFechaHExit(Sender: TObject);
begin
  if ((LFFechaD.Date <> 0) and (LFFechaH.Date <> 0) and (EFSeriesOR.Text <> '')) then
     CargaGrid;
end;

end.
