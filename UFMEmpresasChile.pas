unit UFMEmpresasChile;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit, ULFEdit;

type
  TFMEmpresasChile = class(TFPEdit)
     DBELNombreRSocial: TLFDbedit;
     LNombreRSocial: TLFLabel;
     DBERUT: TLFDbedit;
     LRUT: TLFLabel;
     LFechaResolucion: TLFLabel;
     DBDEFechaResolucion: TLFDBDateEdit;
     PNLProgreso: TLFPanel;
     PBProgreso: TProgressBar;
     AImportar: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LNumero: TLFLabel;
     DBENumero: TLFDbedit;
     LCorreo: TLFLabel;
     DBECorreo: TLFDbedit;
     LURL: TLFLabel;
     DBEURL: TLFDbedit;
     PNLFiltro: TLFPanel;
     LFiltro: TLFLabel;
     EFiltro: TLFEdit;
     LProgreso: TLFLabel;
     PNLProgresoCancelar: TLFPanel;
     BCancelar: TButton;
     LFiltroRUT: TLFLabel;
     EFiltroRUT: TLFEdit;
     TMRFiltro: TTimer;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImportarExecute(Sender: TObject);
     procedure EFiltroChange(Sender: TObject);
     procedure BCancelarClick(Sender: TObject);
     procedure EFiltroRUTChange(Sender: TObject);
     procedure TMRFiltroTimer(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InicializaProgreso(CantidadTotal: integer);
     procedure Progreso(i, c: integer);
  end;

var
  FMEmpresasChile : TFMEmpresasChile;

implementation

uses
  UFormGest, UDMEmpresasChile, UUtiles, UEntorno;

{$R *.dfm}

{ TFMEmpresasChile }

procedure TFMEmpresasChile.FormCreate(Sender: TObject);
begin
  inherited;
  PNLProgreso.Visible := False;
  TMRFiltro.Enabled := False;
  AbreData(TDMEmpresasChile, DMEmpresasChile);

  PCMain.ActivePage := TSTabla;
end;

procedure TFMEmpresasChile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEmpresasChile);
end;

procedure TFMEmpresasChile.InicializaProgreso(CantidadTotal: integer);
begin
  PNLProgreso.Visible := True;
  PBProgreso.Max := CantidadTotal;
  PBProgreso.Position := 0;
end;

procedure TFMEmpresasChile.Progreso(i, c: integer);
begin
  PBProgreso.Position := i;
  LProgreso.Caption := format('%d / %d', [i, c]);
  Application.ProcessMessages;
end;

procedure TFMEmpresasChile.AImportarExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;

  Archivo := '';
  if (MyOpenDialog(Archivo, 'CSV,ALL', '', 'FMEmpresasChile-ImportarCSV')) then
  begin
     try
        PNLFiltro.Enabled := False;
        NavMain.Enabled := False;
        EPMain.Enabled := False;
        PCMain.Enabled := False;
        TBActions.Enabled := False;

        DMEmpresasChile.ImportarCSV(Archivo);
     finally
        PNLProgreso.Visible := False;
        PNLFiltro.Enabled := True;
        NavMain.Enabled := True;
        EPMain.Enabled := True;
        PCMain.Enabled := True;
        TBActions.Enabled := True;
     end;
  end;
end;

procedure TFMEmpresasChile.EFiltroChange(Sender: TObject);
begin
  inherited;
  TMRFiltro.Enabled := True;
end;

procedure TFMEmpresasChile.BCancelarClick(Sender: TObject);
begin
  inherited;
  DMEmpresasChile.CancelarImportacion := True;
end;

procedure TFMEmpresasChile.EFiltroRUTChange(Sender: TObject);
begin
  inherited;
  DMEmpresasChile.FiltraRUT(EFiltroRUT.Text);
end;

procedure TFMEmpresasChile.TMRFiltroTimer(Sender: TObject);
begin
  inherited;
  TMRFiltro.Enabled := False;
  DMEmpresasChile.Filtra(EFiltro.Text);
end;

end.
