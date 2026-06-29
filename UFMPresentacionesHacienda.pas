unit UFMPresentacionesHacienda;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc,
  ULFComboBox, ULFEditFind2000, ULFEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, UFPEditDetalle;

type
  TFMPresentacionesHacienda = class(TFPEditDetalle)
     DBEEjercicio: TLFDbedit;
     DBEFModelo: TLFDBEditFind2000;
     DBETitulo: TLFDbedit;
     DBENotas: TDBMemo;
     LEjercicio: TLFLabel;
     LModelo: TLFLabel;
     LPeriodo: TLFLabel;
     LNotas: TLFLabel;
     // Panel de filtros
     PNLFiltro: TLFPanel;
     LEjercicioFiltro: TLFLabel;
     LPeriodoFiltro: TLFLabel;
     LModeloFiltro: TLFLabel;
     CBEjercicio: TLFComboBox;
     CBPeriodo: TLFComboBox;
     EFModelo: TLFEditFind2000;
     ETitModelo: TLFEdit;
     DBCBPeriodo: TDBComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FiltroChange(Sender: TObject);
     procedure EFModeloChange(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBGFDetalleDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPresentacionesHacienda : TFMPresentacionesHacienda;

implementation

uses
  UDMPresentacionesHacienda, UFormGest, UDMMain, uUtiles, UDameDato, ShellAPI, URecibeFicheros,
  UDMAdjunto;

{$R *.DFM}

procedure TFMPresentacionesHacienda.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);

  AbreData(TDMPresentacionesHacienda, DMPresentacionesHacienda);

  NavMain.DataSource := DMPresentacionesHacienda.DSQMPresentacionesHacienda;
  EPMain.DataSource := DMPresentacionesHacienda.DSQMPresentacionesHacienda;
  DBGMain.DataSource := DMPresentacionesHacienda.DSQMPresentacionesHacienda;
  G2kTableLoc.DataSource := DMPresentacionesHacienda.DSQMPresentacionesHacienda;
  NavDetalle.DataSource := DMPresentacionesHacienda.DSQMAdjuntos;
  DBGFDetalle.DataSource := DMPresentacionesHacienda.DSQMAdjuntos;

  // Campos clave: color ID en insert
  ColorCampoID(DBEEjercicio);
  ColorCampoID(DBEFModelo);
  ColorCampoID(DBCBPeriodo);

  // Combos del panel de filtros
  CBPeriodo.Items.Add('');
  CBPeriodo.Items.Add('01');
  CBPeriodo.Items.Add('02');
  CBPeriodo.Items.Add('03');
  CBPeriodo.Items.Add('04');
  CBPeriodo.Items.Add('05');
  CBPeriodo.Items.Add('06');
  CBPeriodo.Items.Add('07');
  CBPeriodo.Items.Add('08');
  CBPeriodo.Items.Add('09');
  CBPeriodo.Items.Add('10');
  CBPeriodo.Items.Add('11');
  CBPeriodo.Items.Add('12');
  CBPeriodo.Items.Add('1T');
  CBPeriodo.Items.Add('2T');
  CBPeriodo.Items.Add('3T');
  CBPeriodo.Items.Add('4T');
  CBPeriodo.Items.Add('0A');
  CBPeriodo.ItemIndex := 0;

  DBCBPeriodo.Items.Text := CBPeriodo.Items.Text;

  CBEjercicio.ItemIndex := DMPresentacionesHacienda.RecargaComboEjercicios(CBEjercicio.Items);

  FiltroChange(Sender);
end;

procedure TFMPresentacionesHacienda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMPresentacionesHacienda);
end;

procedure TFMPresentacionesHacienda.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbEdit) then
  begin
     // En edicion los campos clave no son modificables
     DBEEjercicio.Color := clInfoBk;
     DBEEjercicio.Font.Color := clGrayText;
     DBEEjercicio.Enabled := False;
     DBEFModelo.Color := clInfoBk;
     DBEFModelo.Font.Color := clGrayText;
     DBEFModelo.Enabled := False;
     DBCBPeriodo.Color := clInfoBk;
     DBCBPeriodo.Font.Color := clGrayText;
     DBCBPeriodo.Enabled := False;
  end
  else
  begin
     DBEEjercicio.Color := clWindow;
     DBEEjercicio.Font.Color := clWindowText;
     DBEEjercicio.Enabled := True;
     DBEFModelo.Color := clWindow;
     DBEFModelo.Font.Color := clWindowText;
     DBEFModelo.Enabled := True;
     DBCBPeriodo.Color := clWindow;
     DBCBPeriodo.Font.Color := clWindowText;
     DBCBPeriodo.Enabled := True;
  end;
end;

procedure TFMPresentacionesHacienda.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMPresentacionesHacienda.EFModeloChange(Sender: TObject);
begin
  ETitModelo.Text := DameTituloModeloHacienda(EFModelo.Text);
  FiltroChange(Sender);
end;

procedure TFMPresentacionesHacienda.FiltroChange(Sender: TObject);
begin
  inherited;
  DMPresentacionesHacienda.Filtra(
     StrToIntDef(CBEjercicio.Text, 0),
     CBPeriodo.Text,
     EFModelo.Text);
end;

procedure TFMPresentacionesHacienda.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('PHA', DMPresentacionesHacienda.QMPresentacionesHaciendaID_MODELO.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        DMPresentacionesHacienda.RefrescarAdjuntos;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMPresentacionesHacienda.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  AbreData(TDMAdjunto, DMAdjunto);
  try
     // Abro adjuntos de esta presentación
     DMAdjunto.Filtra('PHA', DMPresentacionesHacienda.QMPresentacionesHaciendaID_MODELO.AsInteger);
     // Posiciono en el adjunto que corresponda al de la presentacion
     Posicionar(DMAdjunto.QMAdjuntos, 'ID_ADJUNTO', DMPresentacionesHacienda.QMAdjuntosID_ADJUNTO.AsInteger);
     // Abro adjunto
     DMAdjunto.AbrirAdjunto;
  finally
     CierraData(DMAdjunto);
  end;
end;

end.
