unit UFPregVentasAgente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest, Spin,
  rxToolEdit, ULFActionList, ULFCheckBox, ULFDBEdit, ULFPanel, ULFToolBar,
  ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel, ULFDateEdit,
  UFPEditListado, rxPlacemnt, ULFFormStorage, ULFPageControl,
  UFPEditListadoSimple;

type
  TFPregVentasAgente = class(TFPEditListadoSimple)
     PNLListArt: TLFPanel;
     TButtConfRapida: TToolButton;
     GBFamilia: TGroupBox;
     LDesdeFamilia: TLFLabel;
     EFFamiliaD: TLFEditFind2000;
     DBEFamDesde: TLFDbedit;
     DBEFamHasta: TLFDbedit;
     EFFamiliaH: TLFEditFind2000;
     LHastaFamilia: TLFLabel;
     GBArticulo: TGroupBox;
     LDesdeArticulo: TLFLabel;
     EFArt_Desde: TLFEditFind2000;
     EFArt_Hasta: TLFEditFind2000;
     LHastaArticulo: TLFLabel;
     DBEArticuloHasta: TLFDbedit;
     DBEArticuloDesde: TLFDbedit;
     GBCliente: TGroupBox;
     LDesdeCliente: TLFLabel;
     EFClienteD: TLFEditFind2000;
     DBEClienteD: TLFDbedit;
     DBECLienteH: TLFDbedit;
     EFClienteH: TLFEditFind2000;
     LHastaCliente: TLFLabel;
     GBSerie: TGroupBox;
     LDesdeSerie: TLFLabel;
     EFSerieD: TLFEditFind2000;
     DBESerieD: TLFDbedit;
     DBESerieH: TLFDbedit;
     EFserieH: TLFEditFind2000;
     LHastaSerie: TLFLabel;
     GBFechas: TGroupBox;
     LDesdeEjercicio: TLFLabel;
     LHastaEjercicio: TLFLabel;
     SEAnoH: TSpinEdit;
     LHastaCanal: TLFLabel;
     LDesdeCanal: TLFLabel;
     SECanalD: TSpinEdit;
     SECanalH: TSpinEdit;
     LHastaFecha: TLFLabel;
     LDesdeFecha: TLFLabel;
     DTPFechaD: TLFDateEdit;
     DTPFechaH: TLFDateEdit;
     GBOpciones: TGroupBox;
     LMoneda: TLFLabel;
     CBAlbaranes: TLFCheckBox;
     CBFacCerradas: TLFCheckBox;
     CBFacAbiertas: TLFCheckBox;
     EFMoneda: TLFEditFind2000;
     DBETitMoneda: TLFDbedit;
     ChkBMostrarInfoLotes: TLFCheckBox;
     GBAgente: TGroupBox;
     LDesdeAgente: TLFLabel;
     EFAgenteD: TLFEditFind2000;
     DBEAgenteD: TLFDbedit;
     DBEAgenteH: TLFDbedit;
     EFAgenteH: TLFEditFind2000;
     LHastaAgente: TLFLabel;
     SEAnoD: TSpinEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArt_DesdeBusqueda(Sender: TObject);
     procedure EFArt_HastaBusqueda(Sender: TObject);
     procedure EFArt_DesdeChange(Sender: TObject);
     procedure EFArt_HastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFClienteDChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFSerieDChange(Sender: TObject);
     procedure EFserieHChange(Sender: TObject);
     procedure EFMonedaChange(Sender: TObject);
     procedure EFAgenteDBusqueda(Sender: TObject);
     procedure EFAgenteHBusqueda(Sender: TObject);
     procedure EFAgenteDChange(Sender: TObject);
     procedure EFAgenteHChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     TipoListado: smallint; // 0=LISTADO DE COMISIONES DETALLADAS, 1=PREVISION DE COMISIONES, 2=Listado Resumen de comisiones
     procedure EjecutaListado(Imprimir: integer);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure SeleccionarModo(aTipoListado: smallint);
     procedure Muestra(Cliente: string);
  end;

var
  FPregVentasAgente : TFPregVentasAgente;

implementation

uses UUtiles, UEntorno, UDMMain, UDMLstVentasAgente, DateUtils;

{$R *.DFM}

procedure TFPregVentasAgente.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstVentasAgente, DMLstVentasAgente);

  TipoListado := 0; // por defecto

  Grupo := 0;
  Listado := DMLstVentasAgente.frHYVentasAgentes;
  ListadoFR3 := DMLstVentasAgente.frxHYVentasAgentes;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  ARecargar.Execute;
end;

procedure TFPregVentasAgente.EjecutaListado(Imprimir: integer);
var
  Albaran, FacAbiertas, FacCerradas : smallint;
begin
  if CBAlbaranes.Checked then
     Albaran := 1
  else
     Albaran := 0;
  if CBFacAbiertas.Checked then
     FacAbiertas := 1
  else
     FacAbiertas := 0;
  if CBFacCerradas.Checked then
     FacCerradas := 1
  else
     FacCerradas := 0;

  case TipoListado of
     0:
        DMLstVentasAgente.Visualizar(Imprimir, Albaran, FacCerradas, FacAbiertas,
           ChkBMostrarInfoLotes.Checked, SEAnoD.Value,
           SEAnoH.Value, SEcanalD.Value, SEcanalh.Value, StrToIntDef(EFClienteD.Text, -1),
           StrToIntDef(EFClienteH.Text, 9999999),
           StrToIntDef(EFAgenteD.Text, -1), StrToIntDef(EFAgenteH.Text, 9999999),
           EFArt_Desde.Text, EFArt_Hasta.Text, EFFamiliaD.Text, EFFamiliaH.Text,
           EFSerieD.Text, EFSerieH.Text, EFMoneda.Text,
           DTPfechaD.Date, DTPfechaH.Date);
     1:
        DMLstVentasAgente.VisualizarPREVISION(Imprimir, Albaran, FacCerradas, FacAbiertas,
           ChkBMostrarInfoLotes.Checked, SEAnoD.Value,
           SEAnoH.Value, SEcanalD.Value, SEcanalh.Value, StrToIntDef(EFClienteD.Text, -1),
           StrToIntDef(EFClienteH.Text, 9999999),
           StrToIntDef(EFAgenteD.Text, -1), StrToIntDef(EFAgenteH.Text, 9999999),
           EFArt_Desde.Text, EFArt_Hasta.Text, EFFamiliaD.Text, EFFamiliaH.Text,
           EFSerieD.Text, EFSerieH.Text, EFMoneda.Text,
           DTPfechaD.Date, DTPfechaH.Date);
     2:
        DMLstVentasAgente.VisualizarResumen(Imprimir, Albaran, FacCerradas, FacAbiertas,
           ChkBMostrarInfoLotes.Checked, SEAnoD.Value,
           SEAnoH.Value, SEcanalD.Value, SEcanalh.Value, StrToIntDef(EFClienteD.Text, -1),
           StrToIntDef(EFClienteH.Text, 9999999),
           StrToIntDef(EFAgenteD.Text, -1), StrToIntDef(EFAgenteH.Text, 9999999),
           EFArt_Desde.Text, EFArt_Hasta.Text, EFFamiliaD.Text, EFFamiliaH.Text,
           EFSerieD.Text, EFSerieH.Text, EFMoneda.Text,
           DTPfechaD.Date, DTPfechaH.Date);
  end;
end;

procedure TFPregVentasAgente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstVentasAgente);
end;

procedure TFPregVentasAgente.EFArt_DesdeBusqueda(Sender: TObject);
begin
  EFArt_Desde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregVentasAgente.EFArt_HastaBusqueda(Sender: TObject);
begin
  EFArt_Hasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregVentasAgente.EFArt_DesdeChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstVentasAgente.xArt_Desde, EFArt_Desde.Text);
end;

procedure TFPregVentasAgente.EFArt_HastaChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstVentasAgente.xArt_Hasta, EFArt_Hasta.Text);
end;

procedure TFPregVentasAgente.ARecargarExecute(Sender: TObject);
var
  ClienteD, ClienteH, AgenteD, AgenteH : integer;
  ArticuloD, ArticuloH, FamiliaD, FamiliaH, SerieD, SerieH : string;
begin
  DMLstVentasAgente.Rango1(ClienteD, ClienteH, AgenteD, AgenteH, ArticuloD, ArticuloH, FamiliaD, FamiliaH, SerieD, SerieH);
  EFArt_Desde.Text := ArticuloD;
  EFArt_Hasta.Text := ArticuloH;
  EFClienteD.Text := IntToStr(ClienteD);
  EFClienteH.Text := IntToStr(ClienteH);
  CBALbaranes.Checked := True;
  CBFacAbiertas.Checked := True;
  CBFacCerradas.Checked := True;
  SEAnoD.Value := REntorno.Ejercicio;
  SEAnoH.Value := REntorno.Ejercicio;
  DTPFechaD.Date := EncodeDate(YearOf(REntorno.FechaTrabSH), MonthOf(REntorno.FechaTrabSH), 1);
  DTPFechaH.Date := EncodeDate(YearOf(REntorno.FechaTrabSH), MonthOf(REntorno.FechaTrabSH), DaysInMonth(REntorno.FechaTrabSH));
  EFSerieD.Text := SerieD;
  EFSerieH.Text := SerieH;
  SECanalD.Value := REntorno.Canal;
  SECanalH.Value := REntorno.Canal;
  EFFamiliaD.Text := FamiliaD;
  EFFamiliaH.Text := FamiliaH;
  EFMoneda.Text := REntorno.Moneda;
  EFAgenteD.Text := IntToStr(AgenteD);
  EFAgenteH.Text := IntToStr(AgenteH);
end;

procedure TFPregVentasAgente.Muestra(Cliente: string);
begin
  EFClienteD.Text := Cliente;
  EFClienteH.Text := Cliente;
  ShowModal;
end;

procedure TFPregVentasAgente.EFFamiliaDChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstVentasAgente.xFam_Desde, EFFamiliaD.Text);
end;

procedure TFPregVentasAgente.EFFamiliaHChange(Sender: TObject);
begin
  Actualiza_FamiliaRO(DMLstVentasAgente.xFam_Hasta, EFFamiliaH.Text);
end;

procedure TFPregVentasAgente.EFClienteDChange(Sender: TObject);
begin
  Actualiza_ClienteEmpRO(DMLstVentasAgente.xCli_Desde, EFClienteD.Text);
end;

procedure TFPregVentasAgente.EFClienteHChange(Sender: TObject);
begin
  Actualiza_ClienteEmpRO(DMLstVentasAgente.xCli_Hasta, EFClienteH.Text);
end;

procedure TFPregVentasAgente.EFSerieDChange(Sender: TObject);
begin
  Actualiza_SerieEmpRO(DMLstVentasAgente.xSerie_Desde, EFSerieD.Text);
end;

procedure TFPregVentasAgente.EFserieHChange(Sender: TObject);
begin
  Actualiza_SerieEmpRO(DMLstVentasAgente.xSerie_Hasta, EFSerieH.Text);
end;

procedure TFPregVentasAgente.EFMonedaChange(Sender: TObject);
begin
  DMLstVentasAgente.CambiaMoneda(EFMoneda.Text);
end;

procedure TFPregVentasAgente.EFAgenteDBusqueda(Sender: TObject);
begin
  EFAgenteD.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
end;

procedure TFPregVentasAgente.EFAgenteHBusqueda(Sender: TObject);
begin
  EFAgenteH.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr;
end;

procedure TFPregVentasAgente.EFAgenteDChange(Sender: TObject);
begin
  if (EFAgenteD.Text <> '') then
     DMLstVentasAgente.DameTituloAgente(0, EFAgenteD.Text);
end;

procedure TFPregVentasAgente.EFAgenteHChange(Sender: TObject);
begin
  if (EFAgenteH.Text <> '') then
     DMLstVentasAgente.DameTituloAgente(1, EFAgenteH.Text);
end;

procedure TFPregVentasAgente.FormShow(Sender: TObject);
begin
  SEAnoD.SetFocus;
end;

procedure TFPregVentasAgente.SeleccionarModo(aTipoListado: smallint);
begin
  TipoListado := aTipoListado;

  case TipoListado of
     0:
     begin
        Caption := _('Comisiones Detalladas de Agente');
        Grupo := 163;
     end;
     1:
     begin
        Caption := _('Previsión de Comisiones de Agente por Margen');
        Grupo := 164;
     end;
     2:
     begin
        Caption := _('Resumen de Comisiones de Agente');
        Grupo := 165;
     end;
  end;

  ShowModal;
end;

procedure TFPregVentasAgente.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  EjecutaListado(Modo);
end;

end.
