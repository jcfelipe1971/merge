unit UProFMFases;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, Mask, DBCtrls, ULFDBEdit, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel, ULFLabel;

type
  TProFMFases = class(TFPEdit)
     Label1: TLFLabel;
     DBEFase: TLFDbedit;
     DBETitulo: TLFDbedit;
     Label2: TLFLabel;
     LFCategoryAction1: TLFCategoryAction;
     ALstFasesCodBar: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure ALstFasesCodBarExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMFases : TProFMFases;

implementation

uses UProDMFases, UFormGest, UDMMain, UDMListados, UFMListconfig,
  UProFMLstCodBarras;

{$R *.dfm}

procedure TProFMFases.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMFases, ProDMFases);
  NavMain.DataSource := ProDMFases.DSQMProSysFases;
  DBGMain.DataSource := ProDMFases.DSQMProSysFases;
  CEMainPMEdit.Teclas := DMMain.Teclas;
end;

procedure TProFMFases.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMFases);
  CierraData(DMListados);
end;

procedure TProFMFases.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMFases.BusquedaCompleja;
end;

procedure TProFMFases.ALstFasesCodBarExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstCodBarras, ProFMLstCodBarras, Sender);
  ProFMLstCodBarras.PCMain.ActivePage := ProFMLstCodBarras.TSFases;
end;

procedure TProFMFases.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
