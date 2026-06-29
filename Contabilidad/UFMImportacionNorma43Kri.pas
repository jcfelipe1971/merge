unit UFMImportacionNorma43Kri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UFormGest, StdCtrls, ULFMemo, ULFEdit, ULFLabel,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, HYFIBQuery, ULFPanel,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, UEditPanel, ToolWin, ComCtrls, ULFToolBar;

type
  TFMImportacionNorma43Kri = class(TFPEditSinNavegador)
     PNLLog: TLFPanel;
     MErrores: TLFMemo;
     PNLInfo: TLFPanel;
     LProceso1: TLFLabel;
     LProceso2: TLFLabel;
     MLog: TLFMemo;
     LBanco: TLFLabel;
     EBanco: TLFEdit;
     EFBanco: TLFEditFind2000;
     CBBancoAutomatico: TLFCheckBox;
     LFCategoryAction1: TLFCategoryAction;
     AImportar: TAction;
     TBSep1: TToolButton;
     TBImportar: TToolButton;
     ALimpiarLog: TAction;
     spl1: TSplitter;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EFBancoChange(Sender: TObject);
     procedure CBBancoAutomaticoClick(Sender: TObject);
     procedure AImportarExecute(Sender: TObject);
     procedure ALimpiarLogExecute(Sender: TObject);
     procedure PNLLogResize(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
  private
     { Private declarations }
     procedure EstableceColorBanco;
  public
     { Public declarations }
  end;

var
  FMImportacionNorma43Kri : TFMImportacionNorma43Kri;

implementation

uses UDMImportacionNorma43Kri, UEntorno, UDMMain, UUtiles, URecibeFicheros, ShellAPI, UDameDato;

{$R *.dfm}

procedure TFMImportacionNorma43Kri.FormCreate(Sender: TObject);
var
  Min, Max : integer;
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);

  AbreData(TDMImportacionNorma43Kri, DMImportacionNorma43Kri);
  DameMinMax('BAN', Min, Max);
  EFBanco.Text := IntToStr(Min);
  CBBancoAutomatico.Checked := (REntorno.Pais = 'ESP');
  CBBancoAutomatico.Enabled := (REntorno.Pais = 'ESP');
end;

procedure TFMImportacionNorma43Kri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMImportacionNorma43Kri);
end;

procedure TFMImportacionNorma43Kri.EFBancoChange(Sender: TObject);
begin
  EBanco.Text := DameTituloBanco(StrToIntDef(EFBanco.Text, 0));
end;

procedure TFMImportacionNorma43Kri.CBBancoAutomaticoClick(Sender: TObject);
begin
  EstableceColorBanco;
end;

procedure TFMImportacionNorma43Kri.EstableceColorBanco;
begin
  if (CBBancoAutomatico.Checked) then
  begin
     EFBanco.Enabled := False;
     EFBanco.Color := clInfoBk;
     EBanco.Enabled := False;
     EBanco.Color := clInfoBk;
  end
  else
  begin
     EFBanco.Enabled := True;
     EFBanco.Color := clWindow;
     EBanco.Enabled := False;
     EBanco.Color := clInfoBk;
  end;
end;

procedure TFMImportacionNorma43Kri.AImportarExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;

  Archivo := '';
  if MyOpenDialog(Archivo, 'ALL,TXT', '', 'FMImportacionNorma43Kri') then
  begin
     DMImportacionNorma43Kri.Importar(Archivo, StrToIntDef(EFBanco.Text, 0), CBBancoAutomatico.Checked);
  end;
end;

procedure TFMImportacionNorma43Kri.ALimpiarLogExecute(Sender: TObject);
begin
  inherited;
  MLog.Text := _('Log');
  MErrores.Text := _('Errores');
end;

procedure TFMImportacionNorma43Kri.PNLLogResize(Sender: TObject);
begin
  inherited;
  MLog.Height := PNLLog.Height div 2;
end;

procedure TFMImportacionNorma43Kri.FormActivate(Sender: TObject);
begin
  inherited;
  EstableceColorBanco;
end;

procedure TFMImportacionNorma43Kri.WMDropFiles(var Msg: TWMDropFiles);
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
           DMImportacionNorma43Kri.Importar(Ficheros[i], StrToIntDef(EFBanco.Text, 0), CBBancoAutomatico.Checked);
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

end.
