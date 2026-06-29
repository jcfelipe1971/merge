unit UFMCambiaFacCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  ToolWin, ComCtrls, StdCtrls, Spin, Buttons, UEditPanel, DBCtrls,
  UNavigator, UControlEdit, UFormGest, NsDBGrid, ULFPanel, ULFToolBar,
  UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas;

type
  TFMCambiaFacCli = class(TFPEditSimple)
     DBGCierraDocumento: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(id_s: integer);
  end;

var
  FMCambiaFacCli : TFMCambiaFacCli;

implementation

uses UDMMain, UDMCambiaFacCli, UEntorno, UUtiles;

{$R *.DFM}

procedure TFMCambiaFacCli.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCambiaFacCli, DMCambiaFaccli);
end;

procedure TFMCambiaFacCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCambiaFacCli);
end;

procedure TFMCambiaFacCli.Muestra(id_s: integer);
var
  c : integer;
begin
  if (DMCambiaFacCli.DameMoneda(id_s) = REntorno.Moneda) then
  begin
     with DBGCierraDocumento do
     begin
        c := EncuentraField(DBGCierraDocumento, 'I_IVA_CANAL');
        Columns[c].ReadOnly := True;
        Columns[c].Color := clInfoBk;
        Columns[c].Font.Color := clGrayText;

        c := EncuentraField(DBGCierraDocumento, 'I_RE_CANAL');
        Columns[c].ReadOnly := True;
        Columns[c].Color := clInfoBk;
        Columns[c].Font.Color := clGrayText;

        c := EncuentraField(DBGCierraDocumento, 'I_IMPUESTO_ADICIONAL_CANAL');
        Columns[c].ReadOnly := True;
        Columns[c].Color := clInfoBk;
        Columns[c].Font.Color := clGrayText;
     end;
  end;

  if (REntorno.Pais <> 'CHL') then
  begin
     with DBGCierraDocumento do
     begin
        c := EncuentraField(DBGCierraDocumento, 'TIPO_IMPUESTO_ADICIONAL');
        Columns[c].Visible := False;
        c := EncuentraField(DBGCierraDocumento, 'I_IMPUESTO_ADICIONAL');
        Columns[c].Visible := False;
        c := EncuentraField(DBGCierraDocumento, 'I_IMPUESTO_ADICIONAL_CANAL');
        Columns[c].Visible := False;
     end;
  end;

  DMCambiaFacCli.Muestra(id_s);
  ShowModal;
end;

end.
