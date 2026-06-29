unit UFMInfoRecibosBorrador;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ToolWin, ComCtrls, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Menus, UTeclas,
  UControlEdit, UNavigator, ULFToolBar, ULFPanel;

type
  TFMInfoRecibosBorrador = class(TG2KForm)
     PNLMain: TLFPanel;
     TBMain: TLFToolBar;
     DBGFMain: TDBGridFind2000;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     ToolButton1: TToolButton;
     TButtSalir: TToolButton;
     TButtRegenera: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure TButtRegeneraClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMInfoRecibosBorrador : TFMInfoRecibosBorrador;

implementation

{$R *.dfm}

uses UDMMain, UDMBorradorContabilidad, UEntorno, UUtiles;

procedure TFMInfoRecibosBorrador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  action := caFree;
end;

procedure TFMInfoRecibosBorrador.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  

  DMBorradorContabilidad.MarcaRecibos(1);
  DMBorradorContabilidad.MuestraRecibos;
  DBGFMain.ColumnasChecked.Strings[DBGFMain.ColumnasCheckBoxes.IndexOf('ENTRADA')] :=
     REntorno.EntradaStr;
  ControlEdit := CEMain;
end;

procedure TFMInfoRecibosBorrador.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMInfoRecibosBorrador.TButtRegeneraClick(Sender: TObject);
begin
  if Confirma then
     if ConfirmaGrave then
        DMBorradorContabilidad.RegeneraAsientoRecibos;
end;

end.
