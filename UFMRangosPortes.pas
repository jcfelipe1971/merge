unit UFMRangosPortes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMRangosPortes = class(TFPEditDetalle)
     LRanto: TLFLabel;
     DBERango: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     RGTipoRango: TDBRadioGroup;
     ATMPRangos: TAction;
     LFCategoryAction1: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure ATMPRangosExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBERangoChange(Sender: TObject);
  private
     { Private declarations }
     procedure RellenaGrid;
     procedure VaciaGrid;
  public
     { Public declarations }
  end;

var
  FMRangosPortes : TFMRangosPortes;

implementation

uses UDMRangosPortes, UFormGest, UEntorno, UFMEditaRangos, DB, UUtiles;

{$R *.dfm}

procedure TFMRangosPortes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRangosPortes, DMRangosPortes);
  DBERangoChange(Sender);

  // Color campo ID
  ColorCampoID(DBERango);
end;

procedure TFMRangosPortes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRangosPortes);
end;

procedure TFMRangosPortes.RellenaGrid;
var
  UnidadDeMedida : string;
  i : integer;
  c : TColumn;
begin
  UnidadDeMedida := DMRangosPortes.DameUnidadDeMedida;

  for i := 1 to 25 do
  begin
     if (DMRangosPortes.xRangos.FieldByName(Format('RANGO_%d', [i])).AsFloat <> 0) then
     begin
        c := DBGFDetalle.Columns.Add;
        with c do
        begin
           Title.Caption := Format('%s %s', [DMRangosPortes.xRangos.FieldByName(Format('RANGO_%d', [i])).DisplayText, UnidadDeMedida]);
           FieldName := Format('VALOR_%d', [i]);
        end;
     end;
  end;
end;

procedure TFMRangosPortes.VaciaGrid;
var
  i : integer;
begin
  with DBGFDetalle.Columns do
  begin
     for i := Count - 1 downto 2 do
     begin
        Items[i].Free;
     end;
  end;
end;

procedure TFMRangosPortes.DBERangoChange(Sender: TObject);
begin
  inherited;
  if (DBERango.Text <> '') then
  begin
     VaciaGrid;
     DMRangosPortes.AsignaMascaraCabecera;
     RellenaGrid;
  end;
end;

procedure TFMRangosPortes.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  {
  if (Button in [nbNext, nbLast, nbPrior, nbFirst, nbCancel, nbCancel, nbPost, nbDelete]) then
     RefrescaGrid
  else
  if (Button in [nbInsert]) then
     VaciaGrid;
  }
end;

procedure TFMRangosPortes.ATMPRangosExecute(Sender: TObject);
begin
  inherited;
  DMRangosPortes.TraspasaATMP;
  TFMEditaRangos.Create(Self).ShowModal;
  Refrescar(DMRangosPortes.QMCabecera, 'ID_RANGO', DMRangosPortes.QMCabeceraID_RANGO.AsInteger);
  DBERangoChange(Sender);
end;

procedure TFMRangosPortes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMRangosPortes.BusquedaCompleja;
  {
  if (DMRangosPortes.BusquedaCompleja) then
  begin
     RefrescaGrid;
  end
  else
     VaciaGrid;
  }
end;

procedure TFMRangosPortes.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  controlEdit := CEDetalle;
end;

end.
