unit UFPregLibroDiarioConta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEditListado, ComCtrls, StdCtrls, ExtCtrls, UEditPanel, ToolWin,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ActnList, DBCtrls, Spin,
  Mask, rxToolEdit, UHYDescription, UHYEdits, ULFCheckBox, ULFEdit,
  ULFComboBox, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, TFlatGroupBoxUnit,
  TFlatPanelUnit, ULFDateEdit, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregLibroDiarioConta = class(TFPEditListadoSimple)
     PNLLibroDiario: TLFPanel;
     TButtDisenar: TToolButton;
     RGOpciones: TRadioGroup;
     PNDatosIniciales: TLFPanel;
     PNPeriodos: TLFPanel;
     TButtLegalizar: TToolButton;
     TButtExportar: TToolButton;
     AComprobar: TAction;
     ALegalizar: TAction;
     GBPeriodos: TFlatGroupBox;
     EFPeriodoDesde: TLFEditFind2000;
     LBLDesde: TLFLabel;
     LBLNivel: TLFLabel;
     EFNivel: TLFEditFind2000;
     CBApertura: TLFCheckBox;
     CBCierre: TLFCheckBox;
     CBRegula: TLFCheckBox;
     ETotalDigitos: TLFEdit;
     LBLTotal: TLFLabel;
     LBLHasta: TLFLabel;
     EFPeriodoHasta: TLFEditFind2000;
     GBDatosIniciales: TFlatGroupBox;
     LBPagina: TLFLabel;
     EPagina: TLFEdit;
     LBDebe: TLFLabel;
     EDebe: TLFEdit;
     LBHaber: TLFLabel;
     EHaber: TLFEdit;
     GBFechas: TFlatGroupBox;
     LDesdeFecha: TLFLabel;
     DTPDesde: TLFDateEdit;
     LHastaFecha: TLFLabel;
     DTPHasta: TLFDateEdit;
     LBLTipo: TLFLabel;
     CBTipoAsiento: TLFComboBox;
     LAsientoHasta: TLFLabel;
     SEAsientoHasta: TSpinEdit;
     SEAsientoDesde: TSpinEdit;
     LAsientoDesde: TLFLabel;
     PMonedas: TLFPanel;
     LMoneda: TLFLabel;
     LFechaListado: TLFLabel;
     DBLCBMoneda: TDBLookupComboBox;
     DTPFecha: TLFDateEdit;
     GBTitulo: TGroupBox;
     ETituloListado: TLFEdit;
     PNLLibroDiarioTop: TLFPanel;
     PNLLibroDiarioMid: TLFPanel;
     PNLLibroDiarioRest: TLFPanel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure DBLCBMonedaClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure RGOpcionesClick(Sender: TObject);
     procedure EFPeriodoDesdeBusqueda(Sender: TObject);
     procedure EFNivelChange(Sender: TObject);
     procedure EFPeriodoHastaBusqueda(Sender: TObject);
     procedure ALegalizarExecute(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Procedimiento para mostrar y ocultar las opciones de filtrado según sea
      - Libro Diario
      - Libro Diario Partido
      - Resumido           }
     procedure MostrarOcultarOpciones(Opcion, modo: smallint);
     procedure Mostrar(Fecha: TDateTime; Asiento: integer);
  end;

var
  FPregLibroDiarioConta : TFPregLibroDiarioConta;

implementation

uses UDMMain, UEntorno, UFormGest, UFMListConfig, UDMListados, UUtiles,
  UDMRLibroDiarioConta, UFMDatosLibro, URellenaLista;

{$R *.DFM}

procedure TFPregLibroDiarioConta.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRLibroDiarioConta, DMRLibroDiarioConta);
  RellenaTiposAsientos(CBTipoAsiento.Items);
  ARecargarExecute(Sender);
  MostrarOcultarOpciones(0, 0);
  MostrarOcultarOpciones(2, 0);
  MostrarOcultarOpciones(1, 1);

  Grupo := 20; // 20, 200, 201 dependiendo de RGOpciones.ItemIndex 
  Listado := DMRLibroDiarioConta.frLibroDiario;
  ListadoFR3 := DMRLibroDiarioConta.frxLibroDiario;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregLibroDiarioConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRLibroDiarioConta);
end;

procedure TFPregLibroDiarioConta.ARecargarExecute(Sender: TObject);
begin
  DMRLibroDiarioConta.Rangos;
  DTPFecha.Date := DMRLibroDiarioConta.Fecha_Lista;
  DTPDesde.Date := DMRLibroDiarioConta.Fecha_Desde;
  DTPHasta.Date := DMRLibroDiarioConta.Fecha_Hasta;
  DBLCBMoneda.KeyValue := REntorno.Moneda;
  CBTipoAsiento.ItemIndex := 0;
  SEAsientoDesde.Value := 1;
  SEAsientoHasta.Value := DMRLibroDiarioConta.Asiento_Hasta;
  DMRLibroDiarioConta.CambiaMascara(DBLCBMoneda.KeyValue);
  EFPeriodoDesde.Text := DMRLibroDiarioConta.Periodo_Desde;
  EFPeriodoHasta.Text := DMRLibroDiarioConta.Periodo_Hasta;
  ETotalDigitos.Text := IntToStr(DMRLibroDiarioConta.TotalDigitos);
end;

procedure TFPregLibroDiarioConta.Mostrar(Fecha: TDateTime; Asiento: integer);
begin
  DTPDesde.Date := Fecha;
  DTPHasta.Date := Fecha;
  SEAsientoDesde.Value := Asiento;
  SEAsientoHasta.Value := Asiento;
  ShowModal;
end;

procedure TFPregLibroDiarioConta.DBLCBMonedaClick(Sender: TObject);
begin
  DMRLibroDiarioConta.CambiaMascara(DBLCBMoneda.KeyValue);
end;

procedure TFPregLibroDiarioConta.FormShow(Sender: TObject);
begin
  if ETituloListado.CanFocus then
     ETituloListado.SetFocus;
end;

procedure TFPregLibroDiarioConta.RGOpcionesClick(Sender: TObject);
begin
  if ETituloListado.CanFocus then
     ETituloListado.SetFocus;
  case RGOpciones.ItemIndex of
     0:
     begin
        MostrarOcultarOpciones(0, 0);
        MostrarOcultarOpciones(2, 0);
        MostrarOcultarOpciones(1, 1);
     end;
     1:
     begin
        MostrarOcultarOpciones(0, 1);
        MostrarOcultarOpciones(2, 0);
        MostrarOcultarOpciones(1, 1);
     end;
     2:
     begin
        MostrarOcultarOpciones(0, 0);
        MostrarOcultarOpciones(2, 1);
        MostrarOcultarOpciones(1, 0);
     end;
  end;
end;

procedure TFPregLibroDiarioConta.EFPeriodoDesdeBusqueda(Sender: TObject);
begin
  // Solo periodos mensuales
  EFPeriodoDesde.CondicionBusqueda := 'TIPO = 1';
end;

procedure TFPregLibroDiarioConta.EFNivelChange(Sender: TObject);
begin
  if (EFNivel.Text <> '') then
     ETotalDigitos.Text := IntToStr(DMRLibroDiarioConta.DameTotalDigitos(StrToInt(EFNivel.Text)));
end;

procedure TFPregLibroDiarioConta.EFPeriodoHastaBusqueda(Sender: TObject);
begin
  // Solo periodos mensuales
  EFPeriodoHasta.CondicionBusqueda := 'TIPO = 1';
end;

procedure TFPregLibroDiarioConta.MostrarOcultarOpciones(Opcion, Modo: smallint);
begin
  {Opciones
     0- Datos Iniciales
     1- Fechas
     2- Periodos }

  case Opcion of
     0: if (modo = 0) then
        begin
           PNDatosIniciales.Enabled := False;
           GBDatosIniciales.ColorBorder := clGradientInactiveCaption;
           GBDatosIniciales.Font.Color := clGrayText;
           EPagina.Color := clInfoBK;
           EDebe.Color := clInfoBK;
           EHaber.Color := clInfoBK;
        end
        else
        begin
           PNDatosIniciales.Enabled := True;
           GBDatosIniciales.ColorBorder := clSilver;
           GBDatosIniciales.Font.Color := clWindowText;
           EPagina.Color := clWindow;
           EDebe.Color := clWindow;
           EHaber.Color := clWindow;
        end;
     1: if (modo = 0) then
        begin
           GBFechas.Enabled := False;
           GBFechas.ColorBorder := clGradientInactiveCaption;
           GBFechas.Font.Color := clGrayText;
           DTPDesde.Color := clInfoBK;
           DTPDesde.Enabled := False;
           DTPHasta.Color := clInfoBK;
           DTPHasta.Enabled := False;
           SEAsientoDesde.Color := clInfoBK;
           SEAsientoDesde.Enabled := False;
           SEAsientoHasta.Color := clInfoBK;
           SEAsientoHasta.Enabled := False;
           CBTipoAsiento.Color := clInfoBK;
           CBTipoAsiento.ClearSelection;
           CBTipoAsiento.ItemIndex := 0;
           CBTipoAsiento.Enabled := False;
        end
        else
        begin
           GBFechas.Enabled := True;
           GBFechas.ColorBorder := clSilver;
           GBFechas.Font.Color := clWindowText;
           DTPDesde.Color := clWindow;
           DTPDesde.Enabled := True;
           DTPHasta.Color := clWindow;
           DTPHasta.Enabled := True;
           SEAsientoDesde.Color := clWindow;
           SEAsientoDesde.Enabled := True;
           SEAsientoHasta.Color := clWindow;
           SEAsientoHasta.Enabled := True;
           CBTipoAsiento.Color := clWindow;
           CBTipoAsiento.Enabled := True;
        end;
     2: if (modo = 0) then
        begin
           PNPeriodos.Enabled := False;
           GBPeriodos.ColorBorder := clGradientInactiveCaption;
           GBPeriodos.Font.Color := clGrayText;
           EFPeriodoDesde.Color := clInfoBK;
           EFPeriodoHasta.Color := clInfoBK;
           EFNivel.Color := clInfoBK;
           CBApertura.Enabled := False;
           CBRegula.Enabled := False;
           CBCierre.Enabled := False;
        end
        else
        begin
           PNPeriodos.Enabled := True;
           GBPeriodos.ColorBorder := clSilver;
           GBPeriodos.Font.Color := clWindowText;
           EFPeriodoDesde.Color := clWindow;
           EFPeriodoHasta.Color := clWindow;
           EFNivel.Color := clWindow;
           CBApertura.Enabled := True;
           CBRegula.Enabled := True;
           CBCierre.Enabled := True;
        end;
  end;
end;

procedure TFPregLibroDiarioConta.ALegalizarExecute(Sender: TObject);
begin
  TFMDatosLibro.Create(Self).ShowModal;
end;

procedure TFPregLibroDiarioConta.AConfigurarExecute(Sender: TObject);
begin
  case RGOpciones.ItemIndex of
     0: Grupo := 20;
     1: Grupo := 200;
     2: Grupo := 201;
  end;

  inherited;
end;

procedure TFPregLibroDiarioConta.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  Archivo : string;
  // Fecha_Desde : TDate;
  // Fecha_Hasta : TDate;
  // TipoAsiento : string;
  // Asiento_Desde : integer;
  // Asiento_Hasta : integer;
begin
  if (RGOpciones.ItemIndex = 1) then
  begin
     if EDebe.Text <> '' then
        DMRLibroDiarioConta.IniDebe := StrToFloat(EDebe.Text)
     else
        DMRLibroDiarioConta.Inidebe := 0;

     if EHaber.Text <> '' then
        DMRLibroDiarioConta.IniHaber := StrToFloat(EHaber.Text)
     else
        DMRLibroDiarioConta.IniHaber := 0;

     DMRLibroDiarioConta.IniPagina := StrToIntDef(EPagina.Text, 0);
  end;

  if (RGOpciones.ItemIndex <> 2) then
  begin
     with DMRLibroDiarioConta do
     begin
        Fecha_Desde := HourIntoDate(DTPDesde.Date, '00:00:00');
        Fecha_Hasta := HourIntoDate(DTPHasta.Date, '23:59:59');
        Asiento_Desde := SEAsientoDesde.Value;
        Asiento_Hasta := SEAsientoHasta.Value;
        Fecha_lista := DTPFecha.Date;
        if CBTipoAsiento.ItemIndex = 0 then
           TipoAsiento := '0'
        else
           TipoAsiento := Copy(CBTipoAsiento.Text, 0, 3);
        CalculaInforme;
        Titulo := ETituloListado.Text;
     end;
  end;

  if (RGOpciones.ItemIndex = 2) then
  begin
     with DMRLibroDiarioConta do
     begin
        Periodo_Desde := EFPeriodoDesde.Text;
        Periodo_Hasta := EFPeriodoHasta.Text;
        Nivel := StrToInt(EFNivel.Text);
        if CBApertura.Checked then
           Apertura := 1
        else
           Apertura := 0;

        if CBCierre.Checked then
           Cierre := 1
        else
           Cierre := 0;

        if CBRegula.Checked then
           Regula := 1
        else
           Regula := 0;

        Fecha_lista := DTPFecha.Date;
        CalculaInformeResumido;
        Titulo := ETituloListado.Text;
     end;
  end;

  if (Modo = 2) then
  begin
     Archivo := Format(_('Diario_%s.xls'), [FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'FPregLibroDiarioConta') then
        DMRLibroDiarioConta.ExportarFichero(Archivo);
  end
  else
  begin
     DMRLibroDiarioConta.MostrarInforme(Modo, RGOpciones.ItemIndex);
  end;
end;

end.
