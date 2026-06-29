unit UFMUsuariosMensajes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxToolEdit, RXDBCtrl, UHYEdits, StdCtrls, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask, rxPlacemnt, Menus,
  UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids,
  DBGrids, NsDBGrid, UHYDBGrid, ExtCtrls, ULFDBMemo, ULFDBEditFind2000,
  ULFDBEdit, ULFDBCheckBox, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFLabel, UG2kTBLoc, ULFDBDateEdit, UDBDateTimePicker, CheckLst;

type
  TFMUsuariosMensajes = class(TFPEdit)
     LBLAviso: TLFLabel;
     LBLUsuario: TLFLabel;
     LBLTercero: TLFLabel;
     LBLDirigido: TLFLabel;
     DBCKUrgente: TLFDBCheckBox;
     DBCheckBox1: TLFDBCheckBox;
     DBEAviso: TLFDbedit;
     DBETitiUsuario: TLFDbedit;
     DBEFTercero: TLFDBEditFind2000;
     DBETitTercero: TLFDbedit;
     DBMMensaje: TLFDBMemo;
     LBLResultado: TLFLabel;
     LFecha: TLFLabel;
     DBDEFechaRes: TLFDBDateEdit;
     LBLFechaRespuesta: TLFLabel;
     DBDEFechaVal: TLFDBDateEdit;
     LFechaInicioValidez: TLFLabel;
     DBMResultado: TLFDBMemo;
     DBDEFechaIni: TLFDBDateEdit;
     DBEUsuario: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     AListadoAvisos: TAction;
     ButtRefrescar: TToolButton;
     DBDTPFechaIniTime: TDBDateTimePicker;
     DBDTPFechaResTime: TDBDateTimePicker;
     CLBDestinatarios: TCheckListBox;
     PNLDirigido: TLFPanel;
     PNLMensaje: TLFPanel;
     PNLAviso: TLFPanel;
     PNLRespuesta: TLFPanel;
     TBDesmarcarActivo: TToolButton;
     PNLSoloPendientes: TLFPanel;
     CBSoloPendientes: TLFCheckBox;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure AListadoAvisosExecute(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure ButtRefrescarClick(Sender: TObject);
     procedure CLBDestinatariosClick(Sender: TObject);
     procedure TBDesmarcarActivoClick(Sender: TObject);
     procedure PNLMensajeResize(Sender: TObject);
     procedure PNLRespuestaResize(Sender: TObject);
     procedure CBSoloPendientesChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     SWFil, SWEnlace: integer;
     procedure AvisosDeInicio;
     procedure InicializaListaDestinatarios;
     procedure MarcaDestinatario(Usuario: integer);
     procedure RellenaUsuariosMarcados(Lista: TStrings);
  end;

var
  FMUsuariosMensajes : TFMUsuariosMensajes;

implementation

uses UDMUsuariosMensajes, UFormGest, UDMMain, UUtiles, UFMain, UFPregAvisos, URellenaLista;

{$R *.dfm}

procedure TFMUsuariosMensajes.FormCreate(Sender: TObject);
begin
  inherited;

  // Cargo la lista de usuarios en destinatarios
  RellenaUsuarios(CLBDestinatarios.Items);
  InicializaListaDestinatarios;

  AbreData(TDMUsuariosMensajes, DMUsuariosMensajes);
  ControlEdit := CEMain;
  PCMain.ActivePage := TSTabla;
  NavMain.DataSource := DMUsuariosMensajes.DSQMUsuariosMensajes;
  DBGMain.DataSource := DMUsuariosMensajes.DSQMUsuariosMensajes;

  DMUsuariosMensajes.Refrescar(CBSoloPendientes.Checked);
end;

procedure TFMUsuariosMensajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  DMUsuariosMensajes.ActualizaUltimoAvisoMostrado;
  CierraData(DMUsuariosMensajes);
end;

procedure TFMUsuariosMensajes.EPMainClickRango(Sender: TObject; var Continua: boolean);
var
  Resultado : integer;
begin
  inherited;
  Resultado := DMUsuariosMensajes.BusquedaCompleja;
  if (Resultado in [mrOk, mrAll]) then
  begin
     SWFil := 1;
     SWEnlace := 0;
  end;
  //Continua := False;
end;

procedure TFMUsuariosMensajes.AvisosDeInicio;
begin
  DMUsuariosMensajes.AvisosDeInicio;
end;

procedure TFMUsuariosMensajes.AListadoAvisosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFPregAvisos, FPregAvisos);
end;

procedure TFMUsuariosMensajes.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  AListadoAvisos.Execute;
end;

procedure TFMUsuariosMensajes.ButtRefrescarClick(Sender: TObject);
begin
  inherited;
  DMUsuariosMensajes.Refrescar(CBSoloPendientes.Checked);
end;

procedure TFMUsuariosMensajes.MarcaDestinatario(Usuario: integer);
var
  i : integer;
begin
  with CLBDestinatarios do
  begin
     i := 0;
     // Salto "Todos los Usuarios"
     Inc(i);
     while ((i < Items.Count) and (StrToInt(Copy(Items[i], 1, Pos(' ', Items[i]) - 1)) <> Usuario)) do
        Inc(i);

     if (i < Items.Count) then
        Checked[i] := (StrToInt(Copy(Items[i], 1, Pos(' ', Items[i]) - 1)) = Usuario);

     Refresh;
  end;
end;

procedure TFMUsuariosMensajes.InicializaListaDestinatarios;
var
  i : integer;
begin
  with CLBDestinatarios do
  begin
     for i := 0 to Items.Count - 1 do
        Checked[i] := False;
  end;
end;

procedure TFMUsuariosMensajes.RellenaUsuariosMarcados(Lista: TStrings);
var
  i : integer;
begin
  with CLBDestinatarios do
  begin
     i := 0;
     // Salto "Todos los Usuarios"
     Inc(i);
     while (i < Items.Count) do
     begin
        if Checked[i] then
           Lista.Add(Copy(Items[i], 1, Pos(' ', Items[i]) - 1) + '-1')
        else
           Lista.Add(Copy(Items[i], 1, Pos(' ', Items[i]) - 1) + '-0');
        Inc(i);
     end;
  end;
end;

procedure TFMUsuariosMensajes.CLBDestinatariosClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with CLBDestinatarios do
  begin
     if (Checked[0]) then
        for i := 1 to Items.Count - 1 do
           Checked[i] := True;
  end;
end;

procedure TFMUsuariosMensajes.TBDesmarcarActivoClick(Sender: TObject);
begin
  inherited;
  DMUsuariosMensajes.DesmarcarActivo;
end;

procedure TFMUsuariosMensajes.PNLMensajeResize(Sender: TObject);
begin
  inherited;
  // Evito que sea más grande que el panel que lo contiene
  if (DBMMensaje.Top + DBMMensaje.Height > PNLMensaje.Height) then
     DBMMensaje.Height := PNLMensaje.Height - DBMMensaje.Top - 3;
  if (DBMMensaje.Left + DBMMensaje.Width > PNLMensaje.Width) then
     DBMMensaje.Width := PNLMensaje.Width - DBMMensaje.Left - 3;

  if (DBETitiUsuario.Left + DBETitiUsuario.Width > PNLMensaje.Width) then
     DBETitiUsuario.Width := PNLMensaje.Width - DBETitiUsuario.Left - 3;
  if (DBETitTercero.Left + DBETitTercero.Width > PNLMensaje.Width) then
     DBETitTercero.Width := PNLMensaje.Width - DBETitTercero.Left - 3;
end;

procedure TFMUsuariosMensajes.PNLRespuestaResize(Sender: TObject);
begin
  inherited;
  // Evito que sea más grande que el panel que lo contiene
  if (DBMResultado.Top + DBMResultado.Height > PNLRespuesta.Height) then
     DBMResultado.Height := PNLRespuesta.Height - DBMResultado.Top - 3;
  if (DBMResultado.Left + DBMResultado.Width > PNLRespuesta.Width) then
     DBMResultado.Width := PNLRespuesta.Width - DBMResultado.Left - 3;
end;

procedure TFMUsuariosMensajes.CBSoloPendientesChange(Sender: TObject);
begin
  inherited;
  DMUsuariosMensajes.Refrescar(CBSoloPendientes.Checked);
end;

end.
