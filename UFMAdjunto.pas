unit UFMAdjunto;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, UHYDBGrid, ComCtrls, UEditPanel, UNavigator,
  ToolWin, UControlEdit, Menus, UTeclas, StdCtrls, DB, UFormGest, NsDBGrid,
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, ULFDBEdit, UFPEditSimple;

type
  TFMAdjunto = class(TFPEditSimple)
     PNLTitulo: TLFPanel;
     PNLAdjuntos: TLFPanel;
     DBETituloRelacion: TLFDbedit;
     DBGFAdjuntos: TDBGridFind2000;
     LFCategoryAction1: TLFCategoryAction;
     AAbrir: TAction;
     AGrabarComo: TAction;
     AEnviarEmail: TAction;
     AImprimir: TAction;
     AMoverABD: TAction;
     TBCambiaDestinoAdjunto: TToolButton;
     LFCategoryAction2: TLFCategoryAction;
     AMoverAFichero: TAction;
     AMoverABDAdjunto: TAction;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGFAdjuntosDblClick(Sender: TObject);
     procedure AAbrirExecute(Sender: TObject);
     procedure AGrabarComoExecute(Sender: TObject);
     procedure AEnviarEmailExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure AMoverABDExecute(Sender: TObject);
     procedure DBGFAdjuntosRowChange(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure FormShow(Sender: TObject);
     procedure AMoverAFicheroExecute(Sender: TObject);
     procedure AMoverABDAdjuntoExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
  private
     { Private declarations }
     Tipo: string;
     ID: integer;
     procedure AjustaBotones;
  public
     { Public declarations }
     procedure Muestra(aTipo: string; aID: integer);
  end;

var
  FMAdjunto : TFMAdjunto;

implementation

uses UDMMain, UFMain, UEntorno, UDMAdjunto, UUtiles, ShellAPI, URecibeFicheros;

{$R *.dfm}

procedure TFMAdjunto.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);

  // Esto lo haria UFormGes.AbreForm Sirve para guardar posición de ventana y columnas de grid
  FSMain.User := REntorno.Usuario;
  DBGFAdjuntos.IniStorage := FSMain;

  AbreData(TDMAdjunto, DMAdjunto);
  NavMain.DataSource := DMAdjunto.DSQMAdjuntos;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;
end;

procedure TFMAdjunto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAdjunto);
end;

procedure TFMAdjunto.Muestra(aTipo: string; aID: integer);
begin
  Tipo := aTipo;
  ID := aID;
  Caption := DMAdjunto.Filtra(Tipo, ID);
  // ShowModal;
end;

procedure TFMAdjunto.DBGFAdjuntosDblClick(Sender: TObject);
begin
  if (DMAdjunto.QMAdjuntos.State = dsBrowse) then
     AAbrir.Execute
  else
  if (DMAdjunto.QMAdjuntos.State = dsInsert) then
  begin
     if (DMAdjunto.QMAdjuntosREPOSITORIO.AsInteger = 3) then
        DMAdjunto.QMAdjuntosREPOSITORIO.AsInteger := 0
     else
        DMAdjunto.QMAdjuntosREPOSITORIO.AsInteger := DMAdjunto.QMAdjuntosREPOSITORIO.AsInteger + 1;
  end;
end;

procedure TFMAdjunto.AAbrirExecute(Sender: TObject);
begin
  DMAdjunto.AbrirAdjunto;
end;

procedure TFMAdjunto.AGrabarComoExecute(Sender: TObject);
begin
  DMAdjunto.GuardarComo;
end;

procedure TFMAdjunto.AEnviarEmailExecute(Sender: TObject);
begin
  DMAdjunto.EnviarAdjunto;
end;

procedure TFMAdjunto.AImprimirExecute(Sender: TObject);
begin
  DMAdjunto.ImprimirAdjunto;
end;

procedure TFMAdjunto.AMoverABDExecute(Sender: TObject);
begin
  DMAdjunto.CambiaDestinoAdjunto(DMAdjunto.QMAdjuntosID_ADJUNTO.AsInteger, 1);
  Refrescar(DMAdjunto.QMAdjuntos, 'ID_ADJUNTO', DMAdjunto.QMAdjuntosID_ADJUNTO.AsInteger);
  AjustaBotones;
end;

procedure TFMAdjunto.AMoverAFicheroExecute(Sender: TObject);
begin
  inherited;
  DMAdjunto.CambiaDestinoAdjunto(DMAdjunto.QMAdjuntosID_ADJUNTO.AsInteger, 0);
  Refrescar(DMAdjunto.QMAdjuntos, 'ID_ADJUNTO', DMAdjunto.QMAdjuntosID_ADJUNTO.AsInteger);
  AjustaBotones;
end;

procedure TFMAdjunto.AMoverABDAdjuntoExecute(Sender: TObject);
begin
  inherited;
  DMAdjunto.CambiaDestinoAdjunto(DMAdjunto.QMAdjuntosID_ADJUNTO.AsInteger, 2);
  Refrescar(DMAdjunto.QMAdjuntos, 'ID_ADJUNTO', DMAdjunto.QMAdjuntosID_ADJUNTO.AsInteger);
  AjustaBotones;
end;

procedure TFMAdjunto.AjustaBotones;
begin
  AMoverABD.Enabled := (DMAdjunto.QMAdjuntosREPOSITORIO.AsInteger <> 1);
  AMoverABDAdjunto.Enabled := (DMAdjunto.QMAdjuntosREPOSITORIO.AsInteger <> 2);
  AMoverAFichero.Enabled := (DMAdjunto.QMAdjuntosREPOSITORIO.AsInteger <> 0);
end;

procedure TFMAdjunto.DBGFAdjuntosRowChange(Sender: TObject);
begin
  AjustaBotones;
end;

procedure TFMAdjunto.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  AjustaBotones;
end;

procedure TFMAdjunto.FormShow(Sender: TObject);
begin
  AjustaBotones;
end;

procedure TFMAdjunto.WMDropFiles(var Msg: TWMDropFiles);
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
        for i := 0 to Ficheros.Count - 1 do
           DMAdjunto.CreaAdjunto(Tipo, ID, Ficheros[i]);
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;

  Caption := DMAdjunto.Filtra(Tipo, ID);
  DMAdjunto.QMAdjuntos.Last;
end;

end.
