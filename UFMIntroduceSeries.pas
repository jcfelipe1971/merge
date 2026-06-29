unit UFMIntroduceSeries;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, ULFPageControl,
  Grids, DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  UHYDBGrid, DBCtrls, StdCtrls, ULFMemo, ULFEdit, Mask, ULFDBEdit, ULFLabel;

type
  TFMIntroduceSeries = class(TFPEditSimple)
     PCMain: TLFPageControl;
     TSFicha: TTabSheet;
     TSTabla: TTabSheet;
     DBGMain: TDBGridFind2000;
     DBGTabla: THYTDBGrid;
     TButtAsignar: TToolButton;
     PNLImportacionNrosSerie: TLFPanel;
     TBImportacionNrosSerie: TLFToolBar;
     TButtImportar: TToolButton;
     MImportacionNrosSerie: TLFMemo;
     PNLArticulo: TLFPanel;
     TButtSep1: TToolButton;
     LArticulo: TLFLabel;
     DBEArticulo: TLFDbedit;
     ETituloArticulo: TLFEdit;
     TButtSiguiente: TToolButton;
     TButtAnterior: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtAsignarClick(Sender: TObject);
     procedure DBGMainBusqueda(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure DBGMainKeyPress(Sender: TObject; var Key: char);
     procedure TButtImportarClick(Sender: TObject);
     procedure TButtAnteriorClick(Sender: TObject);
     procedure TButtSiguienteClick(Sender: TObject);
     procedure DBEArticuloChange(Sender: TObject);
  private
     { Private declarations }
     TipoOrigen: string;
     id_detalles: integer;
  public
     { Public declarations }
     procedure Inicializar(aid_detalles: integer; aTipo: string);
     procedure HabilitarFichas;
  end;

var
  FMIntroduceSeries : TFMIntroduceSeries;

implementation

uses UDMIntroduceSeries, UFormGest, UDMMain, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMIntroduceSeries.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMIntroduceSeries, DMIntroduceSeries);
  NavMain.DataSource := DMIntroduceSeries.DSQMTmpAsignar;
  DBGMain.ColumnaInicial := EncuentraField(DBGMain, 'NSERIE');
end;

procedure TFMIntroduceSeries.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMIntroduceSeries.BorrarContenido(id_detalles);
  CierraData(DMIntroduceSeries);
end;

procedure TFMIntroduceSeries.FormShow(Sender: TObject);
begin
  inherited;
  HabilitarFichas;
end;

procedure TFMIntroduceSeries.FormActivate(Sender: TObject);
begin
  inherited;
  // NavMain.VisibleButtons := [nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh];

  if (NavMain.DataSource = DMIntroduceSeries.DSxAsignados) then
     TButtAsignar.Enabled := False
  else
     TButtAsignar.Enabled := True;
end;

procedure TFMIntroduceSeries.TButtAsignarClick(Sender: TObject);
begin
  inherited;
  if not DMIntroduceSeries.NrosSeriesAsignados then
     ShowMessage(_('No se puede asignar. Falta informar números de serie'))
  else
  begin
     // Comprobar que les series no existeixin ja i que no doni error de duplicitats - FER-

     DMIntroduceSeries.AsignarSeries;
     TButtAsignar.Enabled := False;
     Close;
  end;
end;

procedure TFMIntroduceSeries.DBGMainBusqueda(Sender: TObject);
begin
  inherited;
  with DBGMain do
  begin
     if (Trim(TablaABuscar) = 'ART_ARTICULOS_SERIALIZACION') then
     begin
        if ((TipoOrigen = 'ALB') or (TipoOrigen = 'MVS') or (TipoOrigen = 'MVT')) then
        begin
           CondicionBusqueda := 'ESTADO = 1 AND EMPRESA=' + REntorno.EmpresaStr + ' AND CANAL=' + REntorno.CanalStr +
              ' AND ALMACEN=''' + DMIntroduceSeries.xDetallesALMACEN.AsString + '''' + ' AND ARTICULO=''' + DMIntroduceSeries.QMTmpAsignarARTICULO.AsString + '''';
        end
        else
        if ((TipoOrigen = 'ALP') or (TipoOrigen = 'MVE')) then
        begin
           CondicionBusqueda := 'ESTADO = 0 AND EMPRESA=' + REntorno.EmpresaStr + ' AND CANAL=' + REntorno.CanalStr +
              ' AND ALMACEN=''' + DMIntroduceSeries.xDetallesALMACEN.AsString + '''' + ' AND ARTICULO=''' + DMIntroduceSeries.QMTmpAsignarARTICULO.AsString + '''';
        end;
     end;
  end;
end;

procedure TFMIntroduceSeries.Inicializar(aid_detalles: integer; aTipo: string);
begin
  id_detalles := aid_detalles;
  TipoOrigen := aTipo;
  DMIntroduceSeries.Inicializar(id_detalles, TipoOrigen);
end;

procedure TFMIntroduceSeries.DBGMainKeyPress(Sender: TObject; var Key: char);
begin
  inherited;

  if (Key = #13) then
     Key := #9;
end;

procedure TFMIntroduceSeries.TButtImportarClick(Sender: TObject);
var
  Seguir : boolean;

  function LimpiaNroSerie(s: string): string;
  var
     i : integer;
  begin
     Result := '';
     s := Trim(s);
     for i := 1 to Length(s) do
     begin
        // Evito caracteres no imprimibles
        if (Ord(s[i]) > 32) then
           Result := Result + s[i];
     end;
  end;

begin
  inherited;
  /// Importa los numeros de serie asumiendo que hay uno por linea

  Seguir := True;
  with MImportacionNrosSerie do
  begin
     while Seguir and (Lines.Count > 0) do
     begin
        Seguir := DMIntroduceSeries.AsignarNroSerie(LimpiaNroSerie(Lines[0]));
        if Seguir then
           Lines.Delete(0);
     end;
  end;
end;

procedure TFMIntroduceSeries.HabilitarFichas;
begin
  // Se comprueba si se han asignado todas las unidades
  // sfg.albert - Ara per ara s'ha posat una restricció que sempre que entrin
  // al form han d'informar totes les unitats. Per tant, o estarà a la pestanya de ficha
  // o la pestanya de tabla. A partir del codi que hi ha es podria desenvolupar que pugués
  // assignar unes unitats i deixar-les per més endavant i llavors mostrar-me les unitats
  // que em faltes i les que ja tinc assignades.

  if (DMIntroduceSeries.ComprobarAsignados) then
  begin
     TSFicha.TabVisible := False;
     TSTabla.TabVisible := True;
     NavMain.DataSource := DMIntroduceSeries.DSxAsignados;
     TButtAsignar.Enabled := False;
  end
  else // Encara en falten per assignar
  begin
     TSFicha.TabVisible := True;
     TSTabla.TabVisible := False;
     NavMain.DataSource := DMIntroduceSeries.DSQMTmpAsignar;
     TButtAsignar.Enabled := True;
     DBGMain.SetFocus;
  end;
end;

procedure TFMIntroduceSeries.TButtAnteriorClick(Sender: TObject);
begin
  inherited;
  DMIntroduceSeries.QMArticulos.Prior;
  HabilitarFichas;
end;

procedure TFMIntroduceSeries.TButtSiguienteClick(Sender: TObject);
begin
  inherited;
  DMIntroduceSeries.QMArticulos.Next;
  HabilitarFichas;
end;

procedure TFMIntroduceSeries.DBEArticuloChange(Sender: TObject);
begin
  inherited;
  ETituloArticulo.Text := DameTituloArticulo(DBEArticulo.Text);
end;

end.
