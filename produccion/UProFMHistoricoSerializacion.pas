unit UProFMHistoricoSerializacion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, UNavigator, UFormGest,
  Menus, UTeclas, UControlEdit, UHYDBGrid, UEditPanel, NsDBGrid,
  ULFToolBar, ULFPanel, ULFEditFind2000, Fr_HYReport, ActnList,
  ULFActionList, ULFLabel;

type
  TProFMHistoricoSerializacion = class(TG2KForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     DBGHistorico: THYTDBGrid;
     HYMEPNumSerie: THYMEditPanel;
     ToolButton3: TToolButton;
     PNLSerie: TLFPanel;
     LBLNSerie: TLFLabel;
     EFNSerie: TLFEditFind2000;
     TBLstTraza: TToolButton;
     ToolButton2: TToolButton;
     PMListado: TPopupMenu;
     Imprimetrazabilidaddeseries1: TMenuItem;
     N1: TMenuItem;
     Configuracinrpida1: TMenuItem;
     ATraza: TLFActionList;
     AImprime: TAction;
     AConfig: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFNSerieKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGHistoricoDblClick(Sender: TObject);
     procedure AConfigExecute(Sender: TObject);
     procedure AImprimeExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Grupo: integer;
     Listado: TfrHYReport;
  end;

var
  ProFMHistoricoSerializacion : TProFMHistoricoSerializacion;

procedure HistoricoSerie(padre: TComponent);

implementation

uses UDMMain, UProDMHistoricoSerializacion, UFMain, UEntorno, UFMListConfig;

{$R *.DFM}

procedure HistoricoSerie(padre: TComponent);
var
  ProFMHistoricoSerializacion : TProFMHistoricoSerializacion;
begin
  ProFMHistoricoSerializacion := TProFMHistoricoSerializacion.Create(padre);
  ProFMHistoricoSerializacion.ShowModal;
  ProFMHistoricoSerializacion.Free;
end;

procedure TProFMHistoricoSerializacion.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMHistoricoSerializacion, ProDMHistoricoSerializacion);

  // Conectamos los datasources
  NavMain.DataSource := ProDMHistoricoSerializacion.DSxHistorico;
  DBGHistorico.DataSource := ProDMHistoricoSerializacion.DSxHistorico;

  //Conectamos las teclas
  CEMain.Teclas := DMMain.Teclas;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  ControlEdit := CEMain;

  // Añadimos el editfind para que funcione con el enter estando en modo-enter
  FMain.AddComponenteReturn(EFNSerie);
end;

procedure TProFMHistoricoSerializacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Quitamos el editfind
  FMain.DelComponenteReturn(EFNSErie);
  CierraData(ProDMHistoricoSerializacion);
  Action := caFree;
end;

procedure TProFMHistoricoSerializacion.EFNSerieKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ProDMHistoricoSerializacion.ObtenerHistorico(EFNSerie.Text);
end;

procedure TProFMHistoricoSerializacion.DBGHistoricoDblClick(Sender: TObject);
begin
  with ProDMHistoricoSerializacion do
     FMain.MuestraDocumento(REntorno.Ejercicio, xHistoricoTIPO.AsString, xHistoricoSERIE.AsString, xHistoricoRIG.AsInteger);
end;

procedure TProFMHistoricoSerializacion.AConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;

  TFMListConfig.Create(Self).Muestra(8024, Formato, Cabecera, Copias, Pijama, '', ProDMHistoricoSerializacion.frLstTrazaSeries);
end;

procedure TProFMHistoricoSerializacion.AImprimeExecute(Sender: TObject);
begin
  ProDMHistoricoSerializacion.MostrarListado(0, EFNSerie.Text);
end;

end.
