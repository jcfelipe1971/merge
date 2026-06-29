unit UFMSIIFolios;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, DBCtrls, ULFDBMemo,
  ULFDBEdit, rxToolEdit, RXDBCtrl, ULFDBDateEdit, Mask, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFLabel, DbComboBoxValue, ULFDBComboBoxValue, DB;

type
  TFMSIIFolios = class(TFPEdit)
     LSerie: TLFLabel;
     LTipo: TLFLabel;
     LFechaAutorizacion: TLFLabel;
     LNumeroInicio: TLFLabel;
     LNumeroFinal: TLFLabel;
     LContador: TLFLabel;
     LTipoDocTributario: TLFLabel;
     LComentario: TLFLabel;
     CBActivo: TLFDBCheckBox;
     DBEFSerie: TLFDBEditFind2000;
     DBEFEchaAutorizacion: TLFDBDateEdit;
     DBENumeroInicio: TLFDbedit;
     DBENumeroFinal: TLFDbedit;
     DBEContador: TLFDbedit;
     DBEFTipoDocTributario: TLFDBEditFind2000;
     DBMComentario: TLFDBMemo;
     ETituloSerie: TLFEdit;
     ETituloDocTributario: TLFEdit;
     DBCBTipo: TLFDBComboBoxValue;
     AAgregaXmlFolios: TAction;
     AAsignaUltimoFolio: TAction;
     ALimpiaFolioEnviado: TAction;
     AAsignaContadorFolioAlUltimoDelCaf: TAction;
     procedure FormCreate(Sender: TObject);
     procedure DBEFSerieChange(Sender: TObject);
     procedure DBEFTipoDocTributarioChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AAgregaXmlFoliosExecute(Sender: TObject);
     procedure AAsignaUltimoFolioExecute(Sender: TObject);
     procedure ALimpiaFolioEnviadoExecute(Sender: TObject);
     procedure AAsignaContadorFolioAlUltimoDelCafExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSIIFolios : TFMSIIFolios;

implementation

uses
  UDMSIIFolios, UFormGest, UDMMain, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMSIIFolios.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSIIFolios, DMSIIFolios);
  NavMain.DataSource := DMSIIFolios.DSQMFolios;
  DBGMain.DataSource := DMSIIFolios.DSQMFolios;
  G2kTableLoc.DataSource := DMSIIFolios.DSQMFolios;
end;

procedure TFMSIIFolios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSIIFolios);
end;

procedure TFMSIIFolios.DBEFSerieChange(Sender: TObject);
begin
  inherited;
  ETituloSerie.Text := DameTituloSerie(DBEFSerie.Text);
end;

procedure TFMSIIFolios.DBEFTipoDocTributarioChange(Sender: TObject);
begin
  inherited;
  ETituloDocTributario.Text := DameTituloTipoDocTributario(DBEFTipoDocTributario.Text);
end;

procedure TFMSIIFolios.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMSIIFolios.AAgregaXmlFoliosExecute(Sender: TObject);
begin
  inherited;
  with TOpenDialog.Create(nil) do
  begin
     try
        Filter := _('Fichero XML|*.xml;*.xmls|Todos los archivos|*.*');
        FilterIndex := 1;
        // Posicion inicial en Mis Documentos
        InitialDir := GetSpecialFolderPath(CSIDL_PERSONAL, False);
        Title := _('Carga Fichero');
        if (Execute) then
           DMSIIFolios.ActualizaDatosDesdeFicheroXml(FileName);
     finally
        Free;
     end;
  end;
end;

procedure TFMSIIFolios.AAsignaUltimoFolioExecute(Sender: TObject);
begin
  inherited;
  // Verificamos que el usuario tenga un perfil administrador
  if (DamePerfilUsuario(REntorno.Usuario) = 0) then
     DMSIIFolios.AsignaUltimoFolio
  else
     ShowMessage(_('Solo un usuario administrador puede cambiar el contador'));
end;

procedure TFMSIIFolios.ALimpiaFolioEnviadoExecute(Sender: TObject);
begin
  inherited;
  // Verificamos que el usuario tenga un perfil administrador
  if (DamePerfilUsuario(REntorno.Usuario) = 0) then
     DMSIIFolios.LimpiaFolioEnviado
  else
     ShowMessage(_('Solo un usuario administrador puede limpiar el envio de un folio'));
end;

procedure TFMSIIFolios.AAsignaContadorFolioAlUltimoDelCafExecute(Sender: TObject);
begin
  inherited;
  // Verificamos que el usuario tenga un perfil administrador
  if (DamePerfilUsuario(REntorno.Usuario) = 0) then
     DMSIIFolios.AsignaContadorFolioAlUltimoDelCaf
  else
     ShowMessage(_('Solo un usuario administrador puede cambiar el contador del folio'));
end;

end.
