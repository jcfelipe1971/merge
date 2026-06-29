unit ZUFMModelosFechas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UNavigator, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, ULFToolBar, Mask,
  DBCtrls, ULFDBEdit, StdCtrls, ULFEditFind2000, ULFLabel, ExtCtrls,
  ULFPanel, UFormGest, ActnList, ULFActionList, UEditPanel;

type
  TZFMModelosFechas = class(TG2KForm)
     PnlModelo: TLFPanel;
     LblModelo: TLFLabel;
     EFModelo: TLFEditFind2000;
     DBEDescModelo: TLFDbedit;
     PnlMain: TLFPanel;
     TBDetalle: TLFToolBar;
     DBGFModelosFechas: TDBGridFind2000;
     NavFechas: THYMNavigator;
     TSep1: TToolButton;
     TButtSalir: TToolButton;
     TBMain: TLFToolBar;
     TButtProcesoColores: TToolButton;
     ZLADiasServir: TLFActionList;
     ZAProcesoDias: TAction;
     ToolButton2: TToolButton;
     HYMEditPanel1: THYMEditPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure EFModeloChange(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure ZAProcesoDiasExecute(Sender: TObject);
     procedure DBGFModelosFechasBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMModelosFechas : TZFMModelosFechas;

implementation

uses UDMMain, ZUDMModelosFechas, ZUFMProcesoColores;

{$R *.dfm}

procedure TZFMModelosFechas.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TZDMModelosFechas, ZDMModelosFechas);
end;

procedure TZFMModelosFechas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ZDMModelosFechas);
  Action := caFree;
end;

procedure TZFMModelosFechas.FormShow(Sender: TObject);
begin
  EFModelo.SetFocus;
end;

procedure TZFMModelosFechas.EFModeloChange(Sender: TObject);
begin
  ZDMModelosFechas.FiltraModelo(EFModelo.Text);
end;

procedure TZFMModelosFechas.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TZFMModelosFechas.ZAProcesoDiasExecute(Sender: TObject);
begin
  AbreForm(TZFMProcesoColores, ZFMProcesoColores);
end;

procedure TZFMModelosFechas.DBGFModelosFechasBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'Z_SYS_COLORES') then
     begin
        CondicionBusqueda := 'ACTIVO=1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CODIGO';
     end;
  end;
end;

end.
