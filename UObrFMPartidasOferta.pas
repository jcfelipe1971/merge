unit UObrFMPartidasOferta;

interface

uses
  {IDIOMA_CODE}gnugettext, {IDIOMA_CODE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc,
  UFPEditDetalle, StdCtrls, ULFEditFind2000, ULFDBEditFind2000, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, URecursos, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBMemo;

type
  TObrFMPartidasOferta = class(TFPEditDetalle)
     LblModoForm: TLFLabel;
     LblPartida: TLFLabel;
     LblMedida2: TLFLabel;
     LblMedida3: TLFLabel;
     LTotalVenta: TLFLabel;
     LTotalCoste: TLFLabel;
     LMargenAbsoluto: TLFLabel;
     LMargenPorcentual: TLFLabel;
     LblMedida1: TLFLabel;
     LblPVenta: TLFLabel;
     LPCosteUnidad: TLFLabel;
     LblCantidad: TLFLabel;
     DBEPartida: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     DBEMedida2: TLFDbedit;
     DBEMedida3: TLFDbedit;
     DBETotVenta: TLFDbedit;
     DBETotCoste: TLFDbedit;
     DBEMargenAbs: TLFDbedit;
     DBEMargenPor: TLFDbedit;
     DBEMedida1: TLFDbedit;
     DBEPVenta: TLFDbedit;
     DBEPCoste: TLFDbedit;
     DBECantidad: TLFDbedit;
     PnlOferta: TLFPanel;
     LblOferta: TLFLabel;
     DBEOferta: TLFDbedit;
     LblOrden: TLFLabel;
     DBEOrden: TLFDbedit;
     LblPlantilla: TLFLabel;
     EFPlantilla: TLFEditFind2000;
     AVerArticulos: TAction;
     LFCategoryAction1: TLFCategoryAction;
     DBELineaPartida: TLFDbedit;
     PnlConfig: TLFPanel;
     ChkBInsertarDetalle: TLFCheckBox;
     ChkBBorrarDetalle: TLFCheckBox;
     TSNotas: TTabSheet;
     LFToolBar1: TLFToolBar;
     LFPanelNotas: TLFPanel;
     NavNotas: THYMNavigator;
     LFDBNotas: TLFDBMemo;
     CENotas: TControlEdit;
     ControlEdit1PMEdit: TPopUpTeclas;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFPlantillaChange(Sender: TObject);
     procedure AVerArticulosExecute(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure ChkBInsertarDetalleChange(Sender: TObject);
     procedure ChkBBorrarDetalleChange(Sender: TObject);
  private
     { Private declarations }
     LineaPartida: integer;
  public
     { Public declarations }
     procedure AbreOferta(Modo: word; ID_S: integer);
     procedure SetModoForm(Modo: word);
  end;

var
  ObrFMPartidasOferta : TObrFMPartidasOferta;

implementation

uses UFormGest, UObrDMPartidasOferta, UDMMain, UEntorno;

{$R *.dfm}

procedure TObrFMPartidasOferta.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TObrDMPartidasOferta, ObrDMPartidasOferta);

  NavMain.DataSource := ObrDMPartidasOferta.DSQMCabPlantilla;
  DBGMain.DataSource := ObrDMPartidasOferta.DSQMCabPlantilla;
  NavDetalle.DataSource := ObrDMPartidasOferta.DSQMDetPlantilla;
  DBGFDetalle.DataSource := ObrDMPartidasOferta.DSQMDetPlantilla;

  ChkBInsertarDetalle.Checked := True;
  ChkBBorrarDetalle.Checked := True;
end;

procedure TObrFMPartidasOferta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ObrDMPartidasOferta);
end;

procedure TObrFMPartidasOferta.AbreOferta(Modo: word; ID_S: integer);
begin
  SetModoForm(Modo);
  ObrDMPartidasOferta.AbreOferta(ID_S);
  LineaPartida := ObrDMPartidasOferta.QMCabPlantillaLINEA.AsInteger;

  ShowModal;
end;

procedure TObrFMPartidasOferta.SetModoForm(Modo: word);
begin
  // Modo 0: VER PARTIDAS (solo consulta)
  // Modo 1: AÑADIR PARTIDAS (desde plantillas)
  // Modo 2: MODIFICAR PARTIDAS (desde ofertas)

  case Modo of
     1:
     begin
        LblModoForm.Caption := _('Añadir/Borrar Partida desde Plantilla');
        LblPlantilla.Visible := True;
        EFPlantilla.Visible := True;
        PnlConfig.Visible := True;
        NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
        NavMain.Width := 220;
     end;
     2:
     begin
        LblModoForm.Caption := _('Modificar Partida de Oferta');
        LblPlantilla.Visible := False;
        EFPlantilla.Visible := False;
        PnlConfig.Visible := False;
        NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh];
        NavMain.Width := 176;
     end;
     else
     begin
        LblModoForm.Caption := _('Ver Partida de Oferta');
        LblPlantilla.Visible := False;
        EFPlantilla.Visible := False;
        PnlConfig.Visible := False;
        NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
        NavMain.Width := 110;
     end;
  end;
end;

procedure TObrFMPartidasOferta.EFPlantillaChange(Sender: TObject);
begin
  inherited;
  ObrDMPartidasOferta.CambiaPlantilla(StrToIntDef(EFPlantilla.Text, 0));
end;

procedure TObrFMPartidasOferta.AVerArticulosExecute(Sender: TObject);
begin
  inherited;
  if (LineaPartida = 0) then
  begin //Si se esta mostrando los Articulos sin partida, hacemos el cambio
     AVerArticulos.Caption := _('Ver Artículos sin Partidas');
     AVerArticulos.Hint := _('Ver Artículos sin Partidas');
     LineaPartida := ObrDMPartidasOferta.QMCabPlantillaLINEA.AsInteger;
  end
  else
  begin
     AVerArticulos.Caption := _('Ver Artículos con Partidas');
     AVerArticulos.Hint := _('Ver Artículos con Partidas');
     LineaPartida := 0;
  end;

  ObrDMPartidasOferta.CambiaPartida(LineaPartida);
end;

procedure TObrFMPartidasOferta.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  if (Pos('VER_ARTICULOS_EF', Trim(DBGFDetalle.TablaABuscar)) > 0) then
     DBGFDetalle.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr +
        ' and ejercicio=' + REntorno.EjercicioStr + ' and canal=' + REntorno.CanalStr;
  if (Pos('OBR_PARTIDA_OFC_CAB', Trim(DBGFDetalle.TablaABuscar)) > 0) then
     DBGFDetalle.CondicionBusqueda := 'id_s=' + ObrDMPartidasOferta.QMCabPlantillaID_S.AsString;
end;

procedure TObrFMPartidasOferta.ChkBInsertarDetalleChange(Sender: TObject);
begin
  inherited;
  ObrDMPartidasOferta.CheckInsertar := ChkBInsertarDetalle.Checked;
end;

procedure TObrFMPartidasOferta.ChkBBorrarDetalleChange(Sender: TObject);
begin
  inherited;
  ObrDMPartidasOferta.CheckBorrar := ChkBBorrarDetalle.Checked;
end;

end.
