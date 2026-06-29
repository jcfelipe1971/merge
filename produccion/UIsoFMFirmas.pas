unit UIsoFMFirmas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, StdCtrls, DBCtrls, ULFDBMemo, ULFToolBar, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, Mask,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFPanel, URecursos, UG2kTBLoc, ULFLabel;

type
  TIsoFMFirmas = class(TFPEdit)
     LblPersona: TLFLabel;
     LFecha: TLFLabel;
     DBEPersona: TLFDbedit;
     DBChkBOk: TLFDBCheckBox;
     DBDEFecha: TLFDBDateEdit;
     DBEFirma: TLFDbedit;
     LIDFirma: TLFLabel;
     DBMemoNotas: TLFDBMemo;
     procedure FormCreate(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure NuevaFirma(Id_firma: integer);
     procedure AbreFirma(Empresa, Id_firma: integer);
  end;

var
  IsoFMFirmas : TIsoFMFirmas;

implementation

uses UIsoDMFirmas, UFormGest, UDMMain;

var
  TodasFirmas : boolean;

{$R *.dfm}

procedure TIsoFMFirmas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TIsoDMFirmas, IsoDMFirmas);
  DBGMain.DataSource := IsoDMFirmas.DSQMFirmas;
  NavMain.DataSource := IsoDMFirmas.DSQMFirmas;
  NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh];
  NavMain.Width := 160;
  EPMain.Visible := True;
  TodasFirmas := True;
end;

procedure TIsoFMFirmas.NuevaFirma(Id_firma: integer);
begin
  IsoDMFirmas.NuevaFirma(Id_firma);
  NavMain.VisibleButtons := [nbPost, nbCancel];
  NavMain.Width := 40;
  EPMain.Visible := False;
  TodasFirmas := False;
  ShowModal;
end;

procedure TIsoFMFirmas.AbreFirma(Empresa, Id_firma: integer);
begin
  IsoDMFirmas.AbreFirma(Empresa, Id_firma);
  NavMain.VisibleButtons := [nbPost, nbCancel];
  NavMain.Width := 40;
  EPMain.Visible := False;
  TodasFirmas := False;
  ShowModal;
end;

procedure TIsoFMFirmas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (not TodasFirmas) then
     if button in [nbPost, nbCancel] then
        Close;
end;

procedure TIsoFMFirmas.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if (not TodasFirmas) then
     DBEPersona.SetFocus;
end;

procedure TIsoFMFirmas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  IsoDMFirmas.BusquedaCompleja;
end;

procedure TIsoFMFirmas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TIsoFMFirmas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(IsoDMFirmas);
end;

end.
