unit UFMSIICertificados;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, Buttons, StdCtrls, Mask, DBCtrls, ULFDBEdit,
  ULFLabel, rxToolEdit, RXDBCtrl, ULFDBDateEdit;

type
  TFMSIICertificados = class(TFPEdit)
     LRUT: TLFLabel;
     LContrasenya: TLFLabel;
     DBELRUT: TLFDbedit;
     DBEContrasenya: TLFDbedit;
     DBFechaResolucion: TLFDBDateEdit;
     DBENumeroResolucion: TLFDbedit;
     ACargaCertificado: TAction;
     LFechaResolucion: TLabel;
     LNumeroResolucion: TLabel;
     LNombreResponsable: TLFLabel;
     Sucursal: TLFLabel;
     DBENombreResponsable: TLFDbedit;
     DBESucursal: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure ACargaCertificadoExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSIICertificados : TFMSIICertificados;

implementation

uses UDMSIICertificados, UFormGest, UUtiles, UEntorno, UDMMaestrosTallas, UDMMain;

{$R *.dfm}

procedure TFMSIICertificados.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSIICertificados, DMSIICertificados);
  NavMain.DataSource := DMSIICertificados.DSQMCertificados;
  DBGMain.DataSource := DMSIICertificados.DSQMCertificados;
  G2kTableLoc.DataSource := DMSIICertificados.DSQMCertificados;
end;

procedure TFMSIICertificados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSIICertificados);
end;

procedure TFMSIICertificados.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMSIICertificados.ACargaCertificadoExecute(Sender: TObject);
begin
  inherited;
  with TOpenDialog.Create(nil) do
  begin
     try
        Filter := _('Certificados|*.pfx;*.p12|Todos los archivos|*.*');
        FilterIndex := 1;
        // Posicion inicial en Mis Documentos
        InitialDir := GetSpecialFolderPath(CSIDL_PERSONAL, False);
        Title := _('Carga de Certificado');
        if (Execute) then
        begin
           DMSIICertificados.QMCertificados.Edit;
           DMSIICertificados.GuardaCertificado(FileName);
           DMSIICertificados.QMCertificados.Post;
        end;
     finally
        Free;
     end;
  end;
end;

end.
