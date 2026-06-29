unit UFMGenSeries;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask, DB,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFDBEditFind2000, ULFDBCheckBox, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit,
  ULFCheckBox, ULFLabel, UG2kTBLoc, ULFEdit;

type
  TFMGenSeries = class(TFPEdit)
     DBESerie: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBCHKActivo: TLFDBCheckBox;
     LSerie: TLFLabel;
     LTitulo: TLFLabel;
     LProvincia: TLFLabel;
     DBEFProvincia: TLFDBEditFind2000;
     DBEProvincia: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     AActivarSerie: TAction;
     ADesactivarSerie: TAction;
     DBCBRectificaciones: TLFDBCheckBox;
     DBEAutorizacionSFV: TLFDBEditFind2000;
     LAutorizacionSFV: TLFLabel;
     DBETipoNCF: TLFDBEditFind2000;
     LTipoNCF: TLFLabel;
     ETituloTipoNCF: TLFEdit;
     DBCBEmitidaPorTerceros: TLFDBCheckBox;
     DBEPrefijoTerceros: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AActivarSerieExecute(Sender: TObject);
     procedure ADesactivarSerieExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBETipoNCFChange(Sender: TObject);
     procedure FormActivate(Sender: TObject);
  private
     { Private declarations }
     procedure LimitaSegunPais;
  public
     { Public declarations }
  end;

var
  FMGenSeries : TFMGenSeries;

implementation

uses UFormGest, UDMMain, UFBusca, UDMGenSeries, UEntorno, uUtiles, UDameDato;

{$R *.DFM}

procedure TFMGenSeries.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMGenSeries, DMGenSeries);
  EPMain.DataSource := DMGenSeries.DSQMGenSeries;
  NavMain.DataSource := DMGenSeries.DSQMGenSeries;
  DBGMain.DataSource := DMGenSeries.DSQMGenSeries;
  G2kTableLoc.DataSource := DMGenSeries.DSQMGenSeries;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;
end;

procedure TFMGenSeries.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGenSeries);
end;

procedure TFMGenSeries.FormActivate(Sender: TObject);
begin
  inherited;

  // Color campo ID
  ColorCampoID(DBESerie);

  LimitaSegunPais;
end;

procedure TFMGenSeries.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  TFBusca.Create(Self).SeleccionaBusqueda(DMGenSeries.QMGenSeries, '10000');
end;

procedure TFMGenSeries.AActivarSerieExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMGenSeries.ActivarSerie(1);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMGenSeries.ADesactivarSerieExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMGenSeries.ActivarSerie(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMGenSeries.LimitaSegunPais;
begin
  if (REntorno.Pais <> 'BOL') then
  begin
     LAutorizacionSFV.Visible := False;
     DBEAutorizacionSFV.Visible := False;
  end;

  if (REntorno.Pais <> 'DOM') then
  begin
     LTipoNCF.Visible := False;
     DBETipoNCF.Visible := False;
     ETituloTipoNCF.Visible := False;
  end;
end;

procedure TFMGenSeries.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMGenSeries.DBETipoNCFChange(Sender: TObject);
begin
  inherited;
  ETituloTipoNCF.Text := DameTituloNCF(StrToIntDef(DBETipoNCF.Text, 0));
end;

end.
