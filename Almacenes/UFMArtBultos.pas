unit UFMArtBultos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFEdit;

type
  TFMArtBultos = class(TFPEdit)
     LBLBulto: TLFLabel;
     DBEBulto: TLFDbedit;
     DBETitulo: TLFDbedit;
     LBLTitulo: TLFLabel;
     DBEPeso: TLFDbedit;
     LBLPeso: TLFLabel;
     LBLVolumen: TLFLabel;
     DBEDiametroUd: TLFDbedit;
     LDiametroUnidades: TLFLabel;
     DBEVolumen: TLFDbedit;
     LTipo: TLFLabel;
     DBEFTipoBulto: TLFDBEditFind2000;
     ETipoBulto: TLFEdit;
     LAlto: TLFLabel;
     DBEAlto: TLFDbedit;
     LAncho: TLFLabel;
     DBEAncho: TLFDbedit;
     LFondo: TLFLabel;
     DBEFondo: TLFDbedit;
     BCalcularVolumen: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFTipoBultoChange(Sender: TObject);
     procedure BCalcularVolumenClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBEBultoChange(Sender: TObject);
  private
     { Private declarations }
     procedure VerificaMedidas;
  public
     { Public declarations }
  end;

var
  FMArtBultos : TFMArtBultos;

implementation

{$R *.dfm}

uses
  UDMMain, UDMArtBultos, UFormGest, UUtiles;

procedure TFMArtBultos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMArtBultos, DMArtBultos);
  NavMain.DataSource := DMArtBultos.DSQMArtBultos;
  DBGMain.DataSource := DMArtBultos.DSQMArtBultos;
  G2kTableLoc.DataSource := DMArtBultos.DSQMArtBultos;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TFMArtBultos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMArtBultos);
end;

procedure TFMArtBultos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMArtBultos.BusquedaCompleja;
  Continua := False;
end;

procedure TFMArtBultos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMArtBultos.DBEFTipoBultoChange(Sender: TObject);
begin
  inherited;
  ETipoBulto.Text := DMArtBultos.DameTituloTipoBulto(DBEFTipoBulto.Text);
end;

procedure TFMArtBultos.BCalcularVolumenClick(Sender: TObject);
begin
  inherited;
  with DMArtBultos do
     QMArtBultosVOLUMEN.AsFloat := (QMArtBultosALTO.AsFloat * QMArtBultosANCHO.AsFloat * QMArtBultosFONDO.AsFloat);
  VerificaMedidas;
end;

procedure TFMArtBultos.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCalcularVolumen.Visible := ((Button = nbEdit) or (Button = nbInsert));
  VerificaMedidas;
end;

procedure TFMArtBultos.VerificaMedidas;
begin
  inherited;
  with DMArtBultos do
     if QMArtBultos.Active then
     begin
        if (abs((QMArtBultosALTO.AsFloat * QMArtBultosANCHO.AsFloat * QMArtBultosFONDO.AsFloat) - QMArtBultosVOLUMEN.AsFloat) > 0.001) then
           ColorError(DBEVolumen)
        else
           ColorEdicion(DBEVolumen);
     end;
end;

procedure TFMArtBultos.DBEBultoChange(Sender: TObject);
begin
  inherited;
  VerificaMedidas;
end;

end.
