unit UFMPersonalUlises;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, UHYDBGrid, ComCtrls, UEditPanel, UNavigator,
  ToolWin, UControlEdit, Menus, UTeclas, StdCtrls, DB, UFormGest, NsDBGrid,
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEdit, ULFLabel, ULFEditFind2000;

type
  TFMPersonalUlises = class(TG2KForm)
     PMain: TLFPanel;
     PCMain: TLFPageControl;
     TSFicha: TTabSheet;
     PEdit: TLFPanel;
     TSTabla: TTabSheet;
     DBGMain: THYTDBGrid;
     TBMain: TLFToolBar;
     FSMain: TLFFibFormStorage;
     TBActions: TLFToolBar;
     G2KTableLoc: TG2KTBLoc;
     LConnectionString: TLFLabel;
     LDefaultDataBase: TLFLabel;
     EConnectionString: TLFEdit;
     EDefaultDataBase: TLFEdit;
     TSPeticionReposicion: TTabSheet;
     TBPeticionReposicion: TLFToolBar;
     TButtRegenerarPeticionReposicion: TToolButton;
     NavPeticionRepocicion: THYMNavigator;
     ToolButton1: TToolButton;
     ALMain: TLFActionList;
     LFActionList1: TLFActionList;
     ARegenerarPeticionReposicion: TAction;
     TSPedidos: TTabSheet;
     PNLPedidos: TLFPanel;
     PNLPedidosDetalle: TLFPanel;
     TBPedidos: TLFToolBar;
     NavPedidos: THYMNavigator;
     ToolButton2: TToolButton;
     TButtEnviarPedidos: TToolButton;
     TBPedidosDetalle: TLFToolBar;
     NavPedidosDetalle: THYMNavigator;
     DBGPedidosDetalle: THYTDBGrid;
     AEnviarPedidos: TAction;
     DBGFPedidos: TDBGridFind2000;
     CEPeticionRepocicion: TControlEdit;
     CEPeticionRepocicionPMEdit: TPopUpTeclas;
     CEPedidos: TControlEdit;
     CEPedidosPMEdit: TPopUpTeclas;
     TSPedidosServidos: TTabSheet;
     TBPedidosServidos: TLFToolBar;
     NavPedidosServidos: THYMNavigator;
     ToolButton3: TToolButton;
     TButtGenerarAlbaranes: TToolButton;
     DBGFPedidosServidos: TDBGridFind2000;
     CEPedidosServidos: TControlEdit;
     CEPedidosServidosPMEdit: TPopUpTeclas;
     TButtRefrescarPedidosServ: TToolButton;
     ARefrescarPedidosServ: TAction;
     AGenerarAlbaranes: TAction;
     CEPedidosDetalle: TControlEdit;
     CEPedidosDetallePMEdit: TPopUpTeclas;
     PNLPedidosServidos: TLFPanel;
     PNLPedidosServidosDetalle: TLFPanel;
     TBPedidosServidosDetalle: TLFToolBar;
     NavPedidosServidosDetalle: THYMNavigator;
     DBGPedidosServidosDetalle: THYTDBGrid;
     CEPedidosServidosDetalle: TControlEdit;
     CEPedidosServidosDetallePMEdit: TPopUpTeclas;
     TButtServirReposicion: TToolButton;
     AServirReposicion: TAction;
     LAlmacenInteligente: TLFLabel;
     EAlmacenInteligente: TLFEdit;
     ETituloAlmacenInteligente: TLFEdit;
     ToolButton4: TToolButton;
     LAlmacenOrigen: TLFLabel;
     EFAlmacenOrigen: TLFEditFind2000;
     ETituloAlmacen: TLFEdit;
     DBGFPeticionReposicion: TDBGridFind2000;
     PCPeticionReposicion: TLFPageControl;
     TSPeticion: TTabSheet;
     TSRespuestaPeticion: TTabSheet;
     TBPeticionRespuesta: TLFToolBar;
     NavPeticionRespuesta: THYMNavigator;
     ToolButton5: TToolButton;
     TButtRefrescaPeticionRepoRespuesta: TToolButton;
     TButtGeneraMovimientos: TToolButton;
     DBGPeticionRespuesta: TDBGridFind2000;
     CEPeticionRespuesta: TControlEdit;
     CEPeticionRespuestaPMEdit: TPopUpTeclas;
     ARefrescaPeticionRepoRespuesta: TAction;
     AGeneraMovimientosPeticionRepo: TAction;
     TButtConectar: TToolButton;
     TButtDesconectar: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ARegenerarPeticionReposicionExecute(Sender: TObject);
     procedure TSPedidosShow(Sender: TObject);
     procedure TSPedidosHide(Sender: TObject);
     procedure AEnviarPedidosExecute(Sender: TObject);
     procedure TSPedidosServidosShow(Sender: TObject);
     procedure TSPedidosServidosHide(Sender: TObject);
     procedure AGenerarAlbaranesExecute(Sender: TObject);
     procedure ARefrescarPedidosServExecute(Sender: TObject);
     procedure AServirReposicionExecute(Sender: TObject);
     procedure EAlmacenInteligenteChange(Sender: TObject);
     procedure EFAlmacenOrigenChange(Sender: TObject);
     procedure TSPeticionShow(Sender: TObject);
     procedure TSPeticionHide(Sender: TObject);
     procedure ARefrescaPeticionRepoRespuestaExecute(Sender: TObject);
     procedure AGeneraMovimientosPeticionRepoExecute(Sender: TObject);
     procedure TButtConectarClick(Sender: TObject);
     procedure TButtDesconectarClick(Sender: TObject);
     procedure TSRespuestaPeticionShow(Sender: TObject);
     procedure TSRespuestaPeticionHide(Sender: TObject);
  protected
     procedure CreateParams(var Params: TCreateParams); override;
  private
     aConnectionString, aDefaultDataBase: string;
  public
  end;

var
  FMPersonalUlises : TFMPersonalUlises;

implementation

uses UDMMain, UFMain, UEntorno, UDMPersonalUlises, UDameDato;

{$R *.DFM}

{published}

procedure TFMPersonalUlises.CreateParams(var Params: TCreateParams);
begin
  inherited;
end;

procedure TFMPersonalUlises.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPersonalUlises, DMPersonalUlises);
  PCMain.ActivePage := TSFicha;
  // FSMain.Profile := ifthen(super, - 1, REntorno.User_Profile);
  DMPersonalUlises.DatosConexion(aConnectionString, aDefaultDataBase);
  EConnectionString.Text := aConnectionString;
  EDefaultDataBase.Text := aDefaultDataBase;
  EAlmacenInteligente.Text := DMPersonalUlises.DameAlmacenInteligente;
  CEPeticionRepocicionPMEdit.Teclas := DMMain.Teclas;
  CEPeticionRespuestaPMEdit.Teclas := DMMain.Teclas;
  CEPedidosPMEdit.Teclas := DMMain.Teclas;
  CEPedidosServidosPMEdit.Teclas := DMMain.Teclas;
  CEPedidosDetallePMEdit.Teclas := DMMain.Teclas;
  CEPedidosServidosDetallePMEdit.Teclas := DMMain.Teclas;
  DBGFPeticionReposicion.ColumnasChecked[0] := REntorno.EntradaStr;
  EFAlmacenOrigen.Text := REntorno.AlmacenDefecto;
end;

procedure TFMPersonalUlises.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPersonalUlises);
end;

procedure TFMPersonalUlises.ARegenerarPeticionReposicionExecute(Sender: TObject);
begin
  DMPersonalUlises.RegenerarPeticionReposicion(REntorno.Empresa, REntorno.Canal, EFAlmacenOrigen.Text);
end;

procedure TFMPersonalUlises.TSPedidosShow(Sender: TObject);
begin
  ControlEdit := CEPedidos;
  DMPersonalUlises.AbrePedidos;
end;

procedure TFMPersonalUlises.TSPedidosHide(Sender: TObject);
begin
  DMPersonalUlises.CierraPedidos;
end;

procedure TFMPersonalUlises.AEnviarPedidosExecute(Sender: TObject);
begin
  DMPersonalUlises.EnviarPedidos;
end;

procedure TFMPersonalUlises.TSPedidosServidosShow(Sender: TObject);
begin
  ControlEdit := CEPedidosServidos;
  DMPersonalUlises.AbrePedidosServidos;
end;

procedure TFMPersonalUlises.TSPedidosServidosHide(Sender: TObject);
begin
  DMPersonalUlises.CierraPedidosServidos;
end;

procedure TFMPersonalUlises.AGenerarAlbaranesExecute(Sender: TObject);
begin
  DMPersonalUlises.GenerarAlbaranes;
end;

procedure TFMPersonalUlises.ARefrescarPedidosServExecute(Sender: TObject);
begin
  DMPersonalUlises.RefrescarPedidosServ;
end;

procedure TFMPersonalUlises.AServirReposicionExecute(Sender: TObject);
begin
  DMPersonalUlises.ServirReposicion(EFAlmacenOrigen.Text);
end;

procedure TFMPersonalUlises.EAlmacenInteligenteChange(Sender: TObject);
begin
  ETituloAlmacenInteligente.Text := DameTituloAlmacen(EAlmacenInteligente.Text);
end;

procedure TFMPersonalUlises.EFAlmacenOrigenChange(Sender: TObject);
begin
  if (Length(EFAlmacenOrigen.Text) = 3) then
  begin
     ETituloAlmacen.Text := DameTituloAlmacen(EFAlmacenOrigen.Text);
     DMPersonalUlises.Almacen := Trim(EFAlmacenOrigen.Text);
     DMPersonalUlises.RegeneraStockPeticRepo(EFAlmacenOrigen.Text);
  end
  else
     ETituloAlmacen.Text := '';
end;

procedure TFMPersonalUlises.TSPeticionShow(Sender: TObject);
begin
  ControlEdit := CEPeticionRepocicion;
  DMPersonalUlises.QMPeticRepo.Open;
end;

procedure TFMPersonalUlises.TSPeticionHide(Sender: TObject);
begin
  DMPersonalUlises.QMPeticRepo.Close;
end;

procedure TFMPersonalUlises.ARefrescaPeticionRepoRespuestaExecute(Sender: TObject);
begin
  DMPersonalUlises.RefrescaPeticionRepoRespuesta(REntorno.Empresa, REntorno.Canal, EFAlmacenOrigen.Text);
end;

procedure TFMPersonalUlises.AGeneraMovimientosPeticionRepoExecute(Sender: TObject);
begin
  DMPersonalUlises.GeneraMovimientosPeticionRepo;
end;

procedure TFMPersonalUlises.TButtConectarClick(Sender: TObject);
begin
  with DMPersonalUlises do
  begin
     Conectar('', '');
     with QPrueba do
     begin
        Close;
        Connection.BeginTrans;
        SQL.Clear;
        SQL.Add(' SELECT * FROM EXP_CABE_PED ');
        SQL.Add(' WHERE TRATADO=''S'' ');
        Open;
     end;
  end;
end;

procedure TFMPersonalUlises.TButtDesconectarClick(Sender: TObject);
begin
  with DMPersonalUlises do
  begin
     QPrueba.Close;
     Desconectar;
  end;
end;

procedure TFMPersonalUlises.TSRespuestaPeticionHide(Sender: TObject);
begin
  DMPersonalUlises.QMPeticRepoResp.Close;
end;

procedure TFMPersonalUlises.TSRespuestaPeticionShow(Sender: TObject);
begin
  ControlEdit := CEPeticionRespuesta;
  DMPersonalUlises.QMPeticRepoResp.Open;
end;

end.
