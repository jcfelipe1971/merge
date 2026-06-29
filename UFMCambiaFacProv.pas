unit UFMCambiaFacProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  ToolWin, ComCtrls, StdCtrls, Spin, Buttons, UEditPanel, DBCtrls,
  UNavigator, UControlEdit, UFormGest, NsDBGrid, ULFPanel, ULFToolBar;

type
  TFMCambiaFacProv = class(TG2KForm)
     TBMain: TLFToolBar;
     PNLSeparador: TLFPanel;
     EPSalir: THYMEditPanel;
     DBGCierraDocumento: TDBGridFind2000;
     HYMNavTipoIva: THYMNavigator;
     ToolButton1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(id_e: integer);
  end;

var
  FMCambiaFacProv : TFMCambiaFacProv;

implementation

uses UDMMain, UDMCambiaFacProv, UEntorno, UUtiles;

{$R *.DFM}

procedure TFMCambiaFacProv.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMCambiaFacProv, DMCambiaFacProv);
end;

procedure TFMCambiaFacProv.Muestra(id_e: integer);
var
  Moneda : string;
  Col : integer;
begin
  DMCambiaFacProv.DameMoneda(id_e, Moneda);
  if Moneda = REntorno.Moneda then
  begin
     Col := EncuentraField(DBGCierraDocumento, 'I_IVA_CANAL');
     DBGCierraDocumento.Columns[Col].ReadOnly := True;
     DBGCierraDocumento.Columns[Col].Color := clInfoBk;
     DBGCierraDocumento.Columns[Col].Font.Color := clGrayText;

     Col := EncuentraField(DBGCierraDocumento, 'I_RE_CANAL');
     DBGCierraDocumento.Columns[Col].ReadOnly := True;
     DBGCierraDocumento.Columns[Col].Color := clInfoBk;
     DBGCierraDocumento.Columns[Col].Font.Color := clGrayText;
  end;

  DMCambiaFacProv.Muestra(id_e);
  ShowModal;
end;

procedure TFMCambiaFacProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCambiaFacProv);
  Action := caFree;
end;

end.
