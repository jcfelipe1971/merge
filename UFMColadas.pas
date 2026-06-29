unit UFMColadas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin,
  Grids, DBGrids, UFIBDBEditfind, UDBDateTimePicker, Mask, Buttons, Menus,
  UTeclas, UControlEdit, UHYDBGrid, UComponentesBusquedaFiltrada, ActnList,
  UFormGest, Variants, DB, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ULFActionList, ULFToolBar, ULFDBMemo, ULFDBEditFind2000,
  ULFDBEdit, ULFPageControl, ULFPanel, ULFEditFind2000, ULFLabel, ULFEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ShellApi, URecursos, HYFIBQuery, {IdGlobal,} ULFDBDateEdit;

type
  TFMColadas = class(TG2KForm)
     PNLGeneral: TLFPanel;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     ALColadas: TLFActionList;
     ANotasDetalle: TAction;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     PNLDetalle: TLFPanel;
     TBNavDetalle: TLFToolBar;
     TButtSep8: TToolButton;
     NavDetalle: THYMNavigator;
     TBMain: TLFToolBar;
     TButtSep1: TToolButton;
     TButtSep3: TToolButton;
     TButtImprimeListado: TToolButton;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     NavMain: THYMNavigator;
     EPMain: THYMEditPanel;
     PNLTitiSerie: TLFPanel;
     ETitSerie: TLFEdit;
     MISepEnlaces: TMenuItem;
     MIVerDatosCliente: TMenuItem;
     MIVerDatosAgente: TMenuItem;
     FSMain: TLFFibFormStorage;
     TBActions: TLFToolBar;
     ALMain: TLFActionList;
     AInformeColadas: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfColadas: TAction;
     LFCategoryAction2: TLFCategoryAction;
     PCMain: TLFPageControl;
     TSFicha: TTabSheet;
     PEdCabecera: TLFPanel;
     LColada: TLFLabel;
     LFecha: TLFLabel;
     LOrden: TLFLabel;
     LBebederos: TLFLabel;
     LLingotes: TLFLabel;
     LMaterial: TLFLabel;
     DBEID_COLADA: TLFDbedit;
     DBEOrden: TLFDbedit;
     DBEBebederos: TLFDbedit;
     DBELingotes: TLFDbedit;
     DBEFMaterial: TLFDBEditFind2000;
     DBEMaterial: TLFDbedit;
     DBDTPFecha: TLFDBDateEdit;
     TSTabla: TTabSheet;
     DBGMain: THYTDBGrid;
     LNotas: TLFLabel;
     DBNotas: TLFDBMemo;
     DBGFDetalle: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSFichaShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EFSerieChange(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure AImprimeExecute(Sender: TObject);
     procedure AInformeColadasExecute(Sender: TObject);
     procedure AConfColadasExecute(Sender: TObject);
     procedure ARefrescaDetalleExecute(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
  private
     ColActual: TColumn;
     Editando: boolean;
  public
     SWFIL: integer;
  end;

var
  FMColadas : TFMColadas;

implementation

uses UDMMain, UEntorno, UUtiles, UFMNotasCampo, UFMListConfig,
  UFMain, UDMListados, UDMColadas, UDMLstColadas, UDameDato;

{$R *.DFM}

procedure TFMColadas.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMColadas, DMColadas);
  if REntorno.SerieRestringida <> '' then
  begin
     EFSerie.Text := REntorno.SerieRestringida;
     EFSerie.CondicionBusqueda := 'SERIE=''' + REntorno.SerieRestringida + '''';
     if (DMMain.EstadoKri(184) = 1) then
        EFSerie.CondicionBusqueda := '(SERIE=''' + REntorno.SerieRestringida + ''' OR SERIE=''MO'')';
  end
  else
     EFSerie.Text := REntorno.Serie;

  PCMain.ActivePage := TSFicha;
  NavMAin.DataSource := DMColadas.DSColadasC;
  DBGMain.DataSource := DMColadas.DSColadasC;
  CEMainPMEdit.Teclas := DMMain.teclas;
  NavDetalle.DataSource := DMColadas.DSColadasD;
  DBGFDetalle.DataSource := DMColadas.DSColadasD;

  AInformeColadas.Caption := DameTituloListadoDefectoGrupo(9905);
end;

procedure TFMColadas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(DMColadas);
end;

procedure TFMColadas.TSFichaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMColadas.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  Resultado := DMColadas.BusquedaCompleja;
  if (Resultado in [mrOk]) then
     SWFil := 1
  else if (Resultado in [mrAll]) then
     SWFil := 0;
  Continua := False;
end;

procedure TFMColadas.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if (EFSerie.Text <> '') then
  begin
     if (EFSerie.Text = REntorno.SerieRestringida) or ((DMMain.EstadoKri(184) = 1) and (EFSerie.Text = 'MO')) then
     begin
        EFSerie.Text := REntorno.SerieRestringida;
        EFSerie.CondicionBusqueda := 'SERIE=''' + REntorno.SerieRestringida + '''';
        if (DMMain.EstadoKri(184) = 1) then
           EFSerie.CondicionBusqueda := '(SERIE=''' + REntorno.SerieRestringida + ''' OR SERIE=''MO'')';
     end
     else
     if (REntorno.SerieRestringida > ' ') then
        EFSerie.Text := REntorno.SerieRestringida;

     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     ETitSerie.Text := DameTituloSerie(EFSerie.Text);
     DMColadas.CambiaSerie(EFSerie.Text);
  end;
end;

procedure TFMColadas.TSTablaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
  if not (Editando) then
     DMColadas.RefrescaTabla;
end;

procedure TFMColadas.AImprimeExecute(Sender: TObject);
begin
  AbreData(TDMLstColadas, DMLstColadas);
  DMLstColadas.MostrarListado(DMColadas.QMColadasCID_COLADA.AsInteger, 1, EFSerie.Text);
  CierraData(DMLstColadas);
end;

procedure TFMColadas.AInformeColadasExecute(Sender: TObject);
begin
  AbreData(TDMLstColadas, DMLstColadas);
  DMLstColadas.MostrarListado(DMColadas.QMColadasCId_Colada.AsInteger, 0, EFSerie.Text);
  CierraData(DMLstColadas);
end;

procedure TFMColadas.AConfColadasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstColadas, DMLstColadas);
  TFMListConfig.Create(Self).Muestra(9905, formato, cabecera, copias,
     pijama, EFSerie.Text, DMLstColadas.frColadas);
  CierraData(DMLstColadas);
end;

procedure TFMColadas.ARefrescaDetalleExecute(Sender: TObject);
begin
  if Confirma then
     DMColadas.RefrescaDetalle;
end;

procedure TFMColadas.DBGFDetalleCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

end.
