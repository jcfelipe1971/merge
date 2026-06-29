unit UFMDupArtescandallo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UEditPanel, ComCtrls, ToolWin, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, UHYDBGrid,
  UNavigator, Menus, UTeclas, UControlEdit, UHYEdits, ActnList, UFormGest,
  NsDBGrid, ULFDBEdit, ULFPanel, ULFToolBar, ULFEditFind2000, ULFLabel;

type
  TFMDupArtEscandallo = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtSep2: TToolButton;
     EPMain: THYMEditPanel;
     PNL_Busca_Articulo: TLFPanel;
     DBEArt_Descrip_Or: TLFDbedit;
     TButtSep1: TToolButton;
     TButt_Escandallar: TToolButton;
     NavMain: THYMNavigator;
     DBGMain: TDBGridFind2000;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     TSep2: TMenuItem;
     MIEscandallar2: TMenuItem;
     MISubescandallo2: TMenuItem;
     DBEArticulos: TLFDbedit;
     TSep3: TToolButton;
     PNLDestino: TLFPanel;
     EFArticulo: TLFEditFind2000;
     DBEArt_Descrip_Dest: TLFDbedit;
     LArticuloOrigen: TLFLabel;
     LArticuloDestino: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButt_EscandallarClick(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBGMainBusqueda(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure EFArticuloBusqueda(Sender: TObject);
  private
  public
     SWFil: integer;
     procedure AsignaArticulo(Articulo: string);
  end;

var
  FMDupArtEscandallo : TFMDupArtEscandallo;

implementation

uses UDMDupArtEscandallo, UDMMain, UEntorno,
  UFMLstArtEscandallo;

{$R *.DFM}

procedure TFMDupArtEscandallo.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMDupArtEscandallo, DMDupArtEscandallo);
  EPMain.DataSource := DMDupArtEscandallo.DSQMArticulos;
  NavMain.DataSource := DMDupArtEscandallo.DSQMArticulos;
  DBGMain.DataSource := DMDupArtEscandallo.DSQMEscandallo;
  CEMainPMEdit.Teclas := DMMain.teclas;
  ControlEdit := CEMain;
end;

procedure TFMDupArtEscandallo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if EFArticulo.Text <> '' then
  begin
     with DMDupArtEscandallo.xLimpia do
     begin
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['articulo'].AsString := DMDupArtEscandallo.QMArticulosARTICULO.Value;
        ExecQuery;
        FreeHandle;
        Transaction.CommitRetaining;
     end;
  end;
  Action := caFree;
  CierraData(DMDupArtEscandallo);
end;

procedure TFMDupArtEscandallo.TButt_EscandallarClick(Sender: TObject);
begin
  if EFArticulo.Text <> '' then
     DMDupArtEscandallo.Duplica_Escandallo(REntorno.Empresa,
        DMDupArtEscandallo.QMArticulosARTICULO.Value, EFArticulo.Text)
  else
     ShowMessage(_('Debes de seleccionar un Articulo Destino'));
  EFArticulo.Text := '';
  DMDupArtEscandallo.xArticuloDest.Close;
end;

procedure TFMDupArtEscandallo.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  TFMLstArtEscandallo.Create(Self).ShowModal;
  Continua := False;
end;

procedure TFMDupArtEscandallo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  SWFil := 1;
  DMDupArtEscandallo.BusquedaCompleja;
  NavMain.Enabled := True;
  Continua := False;
end;

procedure TFMDupArtEscandallo.DBGMainBusqueda(Sender: TObject);
var
  vir : smallint;
begin
  vir := 0;
  DMDupArtEscandallo.Es_Virtual(vir);
  if (vir = 1) then
     DBGMain.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''''
  else
     DBGMain.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''' and VIRTUAL=0';
end;

procedure TFMDupArtEscandallo.EFArticuloChange(Sender: TObject);
begin
  if EFArticulo.Text <> '' then
  begin
     DBGMain.Enabled := True;
     NavMain.Enabled := False;
     with DMDupArtEscandallo.xArticuloDest do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := EFArticulo.Text;
        Open;
     end;
  end
  else
  begin
     with DMDupArtEscandallo.xLimpia do
     begin
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['articulo'].AsString := DMDupArtEscandallo.QMArticulosARTICULO.Value;
        ExecQuery;
        FreeHandle;
        Transaction.CommitRetaining;
     end;
     DMDupArtEscandallo.QMArticulos.RefreshSQL;
     DMDupArtEscandallo.QMEscandallo.Close;
     DMDupArtEscandallo.QMEscandallo.Open;
     NavMain.Enabled := True;
     DBGMain.Enabled := False;
  end;
end;

procedure TFMDupArtEscandallo.EFArticuloBusqueda(Sender: TObject);
begin
  EFARticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''' and Abierto=0';
end;

procedure TFMDupArtEscandallo.AsignaArticulo(Articulo: string);
begin
  DMDupArtEscandallo.AbreTabla(Articulo);
  ShowModal;
end;

end.
