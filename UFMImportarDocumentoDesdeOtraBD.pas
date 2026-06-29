unit UFMImportarDocumentoDesdeOtraBD;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFMemo, ULFEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel;

type
  TFMImportarDocumentoDesdeOtraBD = class(TFPEditSinNavegador)
     GBOrigen: TGroupBox;
     GBDestino: TGroupBox;
     LOrigEmpresa: TLFLabel;
     LOrigEjercicio: TLFLabel;
     LOrigCanal: TLFLabel;
     LOrigSerie: TLFLabel;
     LOrigTipo: TLFLabel;
     LOrigRIG: TLFLabel;
     EFOrigEmpresa: TLFEditFind2000;
     EFOrigEjercicio: TLFEditFind2000;
     EFOrigCanal: TLFEditFind2000;
     EFOrigSerie: TLFEditFind2000;
     EFOrigTipo: TLFEditFind2000;
     EFOrigRIG: TLFEditFind2000;
     LDestCliente: TLFLabel;
     EFDestCliente: TLFEditFind2000;
     EDestCliente: TLFEdit;
     MDatosDocumento: TLFMemo;
     PNLDatos: TLFPanel;
     GBBaseDeDatos: TGroupBox;
     LBaseDeDatos: TLFLabel;
     LFCategoryAction1: TLFCategoryAction;
     AImportar: TAction;
     LDestSerie: TLFLabel;
     EFDestSerie: TLFEditFind2000;
     EDestSerie: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure ONEFOrigChange(Sender: TObject);
     procedure EFOrigEjercicioBusqueda(Sender: TObject);
     procedure EFOrigCanalBusqueda(Sender: TObject);
     procedure EFOrigSerieBusqueda(Sender: TObject);
     procedure EFOrigRIGBusqueda(Sender: TObject);
     procedure AImportarExecute(Sender: TObject);
     procedure EFDestClienteChange(Sender: TObject);
     procedure EFDestSerieChange(Sender: TObject);
  private
     { Private declarations }
     OEmpresa: integer;
     OEjercicio: integer;
     OCanal: integer;
     ORIG: integer;
     DCliente: integer;
  public
     { Public declarations }
     procedure EstableceSerieDestino(Serie: string);
  end;

var
  FMImportarDocumentoDesdeOtraBD : TFMImportarDocumentoDesdeOtraBD;

implementation

uses UFormGest, UDMMain, UDMSincronizacionKri, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMImportarDocumentoDesdeOtraBD.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSincronizacionKri, DMSincronizacionKri);
  if (DMSincronizacionKri.Conectar) then
     LBaseDeDatos.Caption := DMSincronizacionKri.DataBase.DBName
  else
     LBaseDeDatos.Caption := 'No conectado';
end;

procedure TFMImportarDocumentoDesdeOtraBD.FormDestroy(Sender: TObject);
begin
  inherited;
  CierraData(DMSincronizacionKri);
end;

procedure TFMImportarDocumentoDesdeOtraBD.ONEFOrigChange(Sender: TObject);
begin
  inherited;
  OEmpresa := StrToIntDef(EFOrigEmpresa.Text, 0);
  OEjercicio := StrToIntDef(EFOrigEjercicio.Text, 0);
  OCanal := StrToIntDef(EFOrigCanal.Text, 0);
  ORIG := StrToIntDef(EFOrigRIG.Text, 0);
  DMSincronizacionKri.RellenaDatosDocumento(OEmpresa, OEjercicio, OCanal, EFOrigSerie.Text, EFOrigTipo.Text, ORig, MDatosDocumento.Lines);
end;

procedure TFMImportarDocumentoDesdeOtraBD.EFOrigEjercicioBusqueda(Sender: TObject);
begin
  inherited;
  EFOrigEjercicio.CondicionBusqueda := 'EMPRESA=' + EFOrigEmpresa.Text + ' AND ACTIVO = 1';
end;

procedure TFMImportarDocumentoDesdeOtraBD.EFOrigCanalBusqueda(Sender: TObject);
begin
  inherited;
  EFOrigCanal.CondicionBusqueda := 'EMPRESA=' + EFOrigEmpresa.Text + ' AND EJERCICIO = ' + EFOrigEjercicio.Text;
end;

procedure TFMImportarDocumentoDesdeOtraBD.EFOrigSerieBusqueda(Sender: TObject);
begin
  inherited;
  EFOrigSerie.CondicionBusqueda := 'EMPRESA=' + EFOrigEmpresa.Text + ' AND EJERCICIO = ' + EFOrigEjercicio.Text + ' AND CANAL = ' + EFOrigCanal.Text;
end;

procedure TFMImportarDocumentoDesdeOtraBD.EFOrigRIGBusqueda(Sender: TObject);
begin
  inherited;
  EFOrigRIG.CondicionBusqueda := 'EMPRESA=' + EFOrigEmpresa.Text + ' AND EJERCICIO = ' + EFOrigEjercicio.Text + ' AND CANAL = ' + EFOrigCanal.Text + ' AND SERIE = ''' + EFOrigSerie.Text + ''' AND TIPO = ''' + EFOrigTipo.Text + '''';
end;

procedure TFMImportarDocumentoDesdeOtraBD.AImportarExecute(Sender: TObject);
begin
  inherited;
  DMSincronizacionKri.ImportarDocumento(OEmpresa, OEjercicio, OCanal, EFOrigSerie.Text, EFOrigTipo.Text, ORig, EFDestSerie.Text, DCliente);
end;

procedure TFMImportarDocumentoDesdeOtraBD.EFDestClienteChange(Sender: TObject);
begin
  inherited;
  DCliente := StrToIntDef(EFDestCliente.Text, 0);
  EDestCliente.Text := DameTituloCliente(DCliente);
end;

procedure TFMImportarDocumentoDesdeOtraBD.EFDestSerieChange(Sender: TObject);
begin
  inherited;
  EDestSerie.Text := DameTituloSerie(EFDestSerie.Text);
end;

procedure TFMImportarDocumentoDesdeOtraBD.EstableceSerieDestino(Serie: string);
begin
  EFDestSerie.Text := Serie;
end;

end.
