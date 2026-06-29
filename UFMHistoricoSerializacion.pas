unit UFMHistoricoSerializacion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, UNavigator, UFormGest,
  Menus, UTeclas, UControlEdit, UHYDBGrid, UEditPanel, NsDBGrid,
  ULFToolBar, ULFPanel, ULFEditFind2000, ULFLabel;

type
  TFMHistoricoSerializacion = class(TG2kForm)
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
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFNSerieKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGHistoricoDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMHistoricoSerializacion : TFMHistoricoSerializacion;

procedure HistoricoSerie(padre: TComponent);

implementation

uses UDMMain, UDMHistoricoSerializacion, UFMain, UEntorno;

{$R *.DFM}

procedure HistoricoSerie(padre: TComponent);
begin
  AbreForm(TFMHistoricoSerializacion, FMHistoricoSerializacion);
end;

procedure TFMHistoricoSerializacion.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMHistoricoSerializacion, DMHistoricoSerializacion);

  // Conectamos los datasources
  NavMain.DataSource := DMHistoricoSerializacion.DSxHistorico;
  DBGHistorico.DataSource := DMHistoricoSerializacion.DSxHistorico;

  //Conectamos las teclas
  CEMain.Teclas := DMMain.Teclas;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  ControlEdit := CEMain;

  // Añadimos el editfind para que funcione con el enter estando en modo-enter
  FMain.AddComponenteReturn(EFNSerie);
end;

procedure TFMHistoricoSerializacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Quitamos el editfind
  FMain.DelComponenteReturn(EFNSErie);
  CierraData(DMHistoricoSerializacion);
  Action := caFree;
end;

procedure TFMHistoricoSerializacion.EFNSerieKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     DMHistoricoSerializacion.ObtenerHistorico(EFNSerie.Text);
end;

procedure TFMHistoricoSerializacion.DBGHistoricoDblClick(Sender: TObject);
var
  Pregunta : boolean;
begin
  Pregunta := True;
  if (DMHistoricoSerializacion.xHistoricoCANAL.AsInteger <> REntorno.Canal) then
  begin
     Pregunta := (Application.MessageBox('Se va a cerrar el canal actual para abrir el canal del documento',
        'Confirmación',
        mb_iconstop + mb_yesno) = id_yes);
     if Pregunta then
        FMain.CambiaEjercicioYCanal(REntorno.Ejercicio, DMHistoricoSerializacion.xHistoricoCANAL.AsInteger);
  end;
  if Pregunta then
  begin
     CierraFormsMenos(FMHistoricoSerializacion);
     with DMHistoricoSerializacion do
        FMain.MuestraDocumento(xHistoricoEJERCICIO.AsInteger, xHistoricoTIPO.AsString,
           xHistoricoSERIE.AsString, xHistoricoRIG.AsInteger);
  end;
end;

end.
