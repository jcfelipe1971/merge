unit UProFMPauta;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFFIBDBEditFind,
  ULFDBEditFind2000, UHYDescription, ULFHYDBDescription, rxToolEdit,
  RXDBCtrl, ULFDBDateEdit, ULFDBEdit, ULFLabel, ULFDBMemo, ULFComboBox,
  Buttons, ULFEdit;

type
  TProFMPauta = class(TFPEditDetalle)
     TSCroquis: TTabSheet;
     TSNotas: TTabSheet;
     LPauta: TLFLabel;
     DBPauta: TLFDbedit;
     LFechaCreacion: TLFLabel;
     DBDEFechaCreacion: TLFDBDateEdit;
     EDescCompuesto: TLFEdit;
     DBECompuesto: TLFDBEditFind2000;
     DBEFLineaFases: TLFDBEditFind2000;
     LLineaFase: TLFLabel;
     LCompuesto: TLFLabel;
     DBEMaterial: TLFDbedit;
     LMaterial: TLFLabel;
     LCliente: TLFLabel;
     DBEFCliente: TLFDBEditFind2000;
     EDescCliente: TLFEdit;
     EDescResponsable: TLFEdit;
     DBEFResponsable: TLFDBEditFind2000;
     DBEComentario: TLFDbedit;
     LComentario: TLFLabel;
     LResponsable: TLFLabel;
     ToolButton1: TToolButton;
     CBTipoControl: TLFComboBox;
     TBImagenes: TLFToolBar;
     NavDibPauta: THYMNavigator;
     Imagen: TImage;
     LFDBNotas: TLFDBMemo;
     TBNotas: TLFToolBar;
     HYMNavigator2: THYMNavigator;
     CEImagenesPauta: TControlEdit;
     CEImagenesPautaPMEdit: TPopUpTeclas;
     CENotasPauta: TControlEdit;
     CENotasPautaPMEdit: TPopUpTeclas;
     AProPautas: TAction;
     AProConfig: TAction;
     LFCategoryAction1: TLFCategoryAction;
     PNNotas: TLFPanel;
     LEscandallo: TLFLabel;
     DBEEscandallo: TLFDBEditFind2000;
     LPlano: TLFLabel;
     DBEPlano: TLFDbedit;
     LProyecto: TLFLabel;
     DBEProyecto: TLFDbedit;
     LMaquina: TLFLabel;
     DBEFMaquina: TLFDBEditFind2000;
     EDescMaquina: TLFEdit;
     LOperacion: TLFLabel;
     DBEOperacion: TLFDbedit;
     EDescFase: TLFDbedit;
     LNroUtil: TLFLabel;
     LUbicacino: TLFLabel;
     DBEUtil: TLFDbedit;
     DBEUbicacion: TLFDbedit;
     DBGDibPauta: TDBGridFind2000;
     LFCategoryAction2: TLFCategoryAction;
     APautaAprobado: TAction;
     APautaVerificado: TAction;
     APautaValidado: TAction;
     LIndice: TLFLabel;
     DBEIndice: TLFDbedit;
     LFCategoryAction3: TLFCategoryAction;
     LDenominacion: TLFLabel;
     DBEDenominacion: TLFDbedit;
     ALEscandallo: TActionList;
     AEscandallo: TAction;
     SBACompuesto: TSpeedButton;
     ACompuesto: TAction;
     SBAEscandallo: TSpeedButton;
     SBACliente: TSpeedButton;
     ACliente: TAction;
     ANotasDetalle: TAction;
     ToolButton2: TToolButton;
     PNLImagen: TLFPanel;
     DBEFase: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure CBTipoControlChange(Sender: TObject);
     procedure DBECompuestoChange(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure DBEFResponsableChange(Sender: TObject);
     procedure TSCroquisShow(Sender: TObject);
     procedure AProPautasExecute(Sender: TObject);
     procedure AProConfigExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFMaquinaChange(Sender: TObject);
     procedure DBEEscandalloBusqueda(Sender: TObject);
     procedure DBECompuestoBusqueda(Sender: TObject);
     procedure DBEFLineaFasesBusqueda(Sender: TObject);
     procedure DBGDibPautaRowChange(Sender: TObject);
     procedure AEscandalloExecute(Sender: TObject);
     procedure SBACompuestoDblClick(Sender: TObject);
     procedure SBAEscandalloDblClick(Sender: TObject);
     procedure ACompuestoExecute(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure AClienteExecute(Sender: TObject);
     procedure EDescClienteDblClick(Sender: TObject);
     procedure EDescCompuestoDblClick(Sender: TObject);
     procedure DBEEscandalloDblClick(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure DBEFaseChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure CarregaListBox;
  public
     { Public declarations }
  end;

var
  ProFMPauta : TProFMPauta;

implementation

uses UProDMpauta, UDMMain, UFormGest, UDMListados, UFMListconfig, UEntorno,
  UFMain, UUtiles, UDameDato, UFMNotasCampo, UImagenes;

{$R *.dfm}

procedure TProFMPauta.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMPauta, ProDMPauta);
  NavMain.DataSource := ProDMPauta.DSCabPauta;
  NavDetalle.DataSource := ProDMPauta.DSDetPauta;
  DBGFDetalle.DataSource := ProDMPauta.DSDetPauta;
  G2KTableLoc.DataSource := ProDMPauta.DSCabPauta;
  CarregaListBox;
  CBTipoControl.ItemIndex := 0;

  // enlaces
  DBEEscandallo.Color := REntorno.ColorEnlaceActivo;
  EDescCompuesto.Color := REntorno.ColorEnlaceActivo;
  EDescCliente.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAEscandallo, DBEEscandallo);
  SolapaControles(SBACompuesto, EDescCompuesto);
  SolapaControles(SBACliente, EDescCliente);
end;

procedure TProFMPauta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMPauta);
end;

procedure TProFMPauta.CarregaListBox;
begin
  ProDMPauta.QMTControl.First;
  while not ProDMPauta.QMTControl.EOF do
  begin
     CBTipoControl.Items.Add(ProDMPauta.QMTControlTIPOCONTROL.AsString + '-' + ProDMPauta.QMTControlDESCRIPCION.AsString);
     ProDMPauta.QMTControl.Next;
  end;
end;

procedure TProFMPauta.CBTipoControlChange(Sender: TObject);
var
  Tipo : string;
begin
  inherited;
  Tipo := '';
  if (CBTipoControl.ItemIndex <> 0) then
  begin
     Tipo := CBTipoControl.Items.Strings[CBTipoControl.ItemIndex];
     Tipo := Copy(Tipo, 1, Pos('-', Tipo) - 1);
  end;
  ProDMPauta.CambiaTipoControl(StrToIntDef(Tipo, 0));
end;

procedure TProFMPauta.DBECompuestoChange(Sender: TObject);
begin
  inherited;
  EDescCompuesto.Text := DameTituloArticulo(DBECompuesto.Text);
end;

procedure TProFMPauta.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  EDescCliente.Text := DameTituloCliente(StrToIntDef(DBEFCliente.Text, 0));
end;

procedure TProFMPauta.DBEFResponsableChange(Sender: TObject);
begin
  inherited;
  EDescResponsable.Text := DameTituloEmpleado(StrToIntDef(DBEFResponsable.Text, 0));
end;

procedure TProFMPauta.TSCroquisShow(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, ProDMPauta.QMDibPautaID_IMAGEN.AsInteger);
end;

procedure TProFMPauta.AProPautasExecute(Sender: TObject);
begin
  inherited;
  with ProDMPauta.xLstCabPauta do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Pauta'].AsInteger := ProDMPauta.QMCabPautaPAUTA.AsInteger;
     Open;
  end;

  DMListados.Imprimir(8031, 0, '', '', ProDMPauta.FrLstPauta, nil);
end;

procedure TProFMPauta.AProConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8031, Formato, Cabecera, Copias, Pijama, '', ProDMPauta.frLstPauta);
end;

procedure TProFMPauta.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMPauta.BusquedaCompleja;
end;

procedure TProFMPauta.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.DataSource := ProDMPauta.DSCabPauta;
  G2KTableLoc.Click;
end;

procedure TProFMPauta.DBEFMaquinaChange(Sender: TObject);
begin
  inherited;
  EDescMaquina.Text := DameTituloMaquina(StrToIntDef(DBEFMaquina.Text, 0));
end;

procedure TProFMPauta.DBEEscandalloBusqueda(Sender: TObject);
begin
  inherited;
  DBEEscandallo.CondicionBusqueda := 'compuesto=''' + DBECompuesto.Text + '''';
end;

procedure TProFMPauta.DBECompuestoBusqueda(Sender: TObject);
begin
  inherited;
  DBECompuesto.CondicionBusqueda := 'tipo=''EPR''';
end;

procedure TProFMPauta.DBEFLineaFasesBusqueda(Sender: TObject);
begin
  inherited;
  DBEFLineaFases.CondicionBusqueda := 'escandallo=''' + IntToStr(StrToIntDef(DBEEscandallo.Text, 0)) + '''';
end;

procedure TProFMPauta.DBGDibPautaRowChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, ProDMPauta.QMDibPautaID_IMAGEN.AsInteger);
end;

procedure TProFMPauta.AEscandalloExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, 'Escandallo = ''' +
     ProDMPauta.QMCabPautaESCANDALLO.AsString + '''');
end;

procedure TProFMPauta.SBACompuestoDblClick(Sender: TObject);
begin
  inherited;
  ACompuesto.Execute;
end;

procedure TProFMPauta.SBAEscandalloDblClick(Sender: TObject);
begin
  inherited;
  AEscandallo.Execute;
end;

procedure TProFMPauta.ACompuestoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' +
     ProDMPauta.QMCabPautaCOMPUESTO.AsString + '''' +
     ' and ejercicio=' + REntorno.EjercicioStr);
end;

procedure TProFMPauta.SBAClienteDblClick(Sender: TObject);
begin
  inherited;
  ACliente.Execute;
end;

procedure TProFMPauta.AClienteExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(ProDMPauta.QMCabPautaCLIENTE.AsInteger));
end;

procedure TProFMPauta.EDescClienteDblClick(Sender: TObject);
begin
  inherited;
  ACliente.Execute;
end;

procedure TProFMPauta.EDescCompuestoDblClick(Sender: TObject);
begin
  inherited;
  ACompuesto.Execute;
end;

procedure TProFMPauta.DBEEscandalloDblClick(Sender: TObject);
begin
  inherited;
  AEscandallo.Execute;
end;

procedure TProFMPauta.ANotasDetalleExecute(Sender: TObject);
begin
  inherited;
  ProDMPauta.PreparaNotasDetalle;
  EditarCampoNotas(Self, ProDMPauta.DSDetPauta, ProDMPauta.QMDetPautaNOTAS);
end;

procedure TProFMPauta.DBEFaseChange(Sender: TObject);
begin
  inherited;
  EDescFase.Text := DameTituloFase(DBEFase.Text);
end;

end.
