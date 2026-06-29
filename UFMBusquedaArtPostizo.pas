unit UFMBusquedaArtPostizo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, StdCtrls, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UEditPanel, ToolWin, ComCtrls, ULFToolBar,
  ULFPanel, ULFEditFind2000, ULFLabel;

type
  TFMBusquedaArtPostizo = class(TG2kForm)
     PMain: TLFPanel;
     LBLNArtPostizo: TLFLabel;
     EFArtPostizo: TLFEditFind2000;
     TBMain: TLFToolBar;
     HYMEPanel: THYMEditPanel;
     procedure EFArtPostizoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArtPostizoBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMBusquedaArtPostizo : TFMBusquedaArtPostizo;

implementation

uses UDMMain, UFMain, UEntorno;

{$R *.DFM}

procedure TFMBusquedaArtPostizo.EFArtPostizoKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ModalResult := mrOk;
end;

procedure TFMBusquedaArtPostizo.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  FMain.AddComponenteReturn(EFArtPostizo);
end;

procedure TFMBusquedaArtPostizo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponenteReturn(EFArtPostizo);
end;

procedure TFMBusquedaArtPostizo.EFArtPostizoBusqueda(Sender: TObject);
begin
  EFArtPostizo.CondicionBusqueda := 'ARTICULO IN (SELECT DISTINCT ARTICULO FROM EMP_MOLDE_ART_POSTIZ ' +
     'WHERE EMPRESA =''' + IntToStr(REntorno.Empresa) + ''')';
end;

end.
