unit UFMDivisiones;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, ULFLabel, UNavigator,
  ToolWin, ULFToolBar, ExtCtrls, ULFPanel, DBCtrls, HYFIBQuery, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest;

type
  TFMDivisiones = class(TG2KForm)
     PNLDatos: TLFPanel;
     TBMain: TLFToolBar;
     PNLTotal: TLFPanel;
     TTermina: TToolButton;
     ToolButton2: TToolButton;
     NavMain: TDBNavigator;
     LTotal: TLFLabel;
     LSumaPorc: TLFLabel;
     DBGCab: TDBGridFind2000;
     DBGDet: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure TTerminaClick(Sender: TObject);
     procedure DBGCabRowChange(Sender: TObject);
     procedure DBGDetRowChange(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
     ID_S: integer;
     ID_DETALLES_S: integer;
     Cabecera: boolean;
  public
     { Public declarations }
     procedure Inicializa(aid_s, aid_detalles_s: integer; aCabecera: boolean);
     procedure SumaPorcentajes;
  end;

var
  FMDivisiones : TFMDivisiones;

implementation

uses UDMDivisiones, UDMMain;

{$R *.dfm}

procedure TFMDivisiones.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMDivisiones, DMDivisiones);
end;

procedure TFMDivisiones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMDivisiones);
end;

procedure TFMDivisiones.FormShow(Sender: TObject);
begin
  DMDivisiones.Inicializa(id_s, id_detalles_s, Cabecera);
  if (Cabecera) then
  begin
     NavMain.DataSource := DMDivisiones.DSxDivisionesCab;
     DBGCab.DataSource := DMDivisiones.DSxDivisionesCab;
     DBGCab.Align := alClient;
     DBGDet.Visible := False;
  end
  else
  begin
     NavMain.DataSource := DMDivisiones.DSxDivisionesDet;
     DBGDet.DataSource := DMDivisiones.DSxDivisionesDet;
     DBGDet.Align := alClient;
     DBGCab.Visible := False;
  end;
  SumaPorcentajes;
end;

procedure TFMDivisiones.TTerminaClick(Sender: TObject);
begin
  SumaPorcentajes;
  if (LSumaPorc.Caption = '100,00') then
     Close;
end;

procedure TFMDivisiones.SumaPorcentajes;
var
  Q : THYFIBQuery;
  s : string;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     if (Cabecera) then
        SQL.Text := 'SELECT SUM(PORCENTAJE) FROM GES_CABECERAS_S_DIVISIONES WHERE ID_S= ' + IntToStr(ID_S)
     else
        SQL.Text := 'SELECT SUM(PORCENTAJE) FROM GES_DETALLES_S_DIVISIONES WHERE ID_DETALLES_S= ' + IntToStr(ID_DETALLES_S);
     ExecQuery;
     s := FormatFloat('0.00', FieldByName['SUM'].AsFloat);
     FreeHandle;
  end;
  FreeAndNil(Q);
  LSumaPorc.Caption := s;
  if (LSumaPorc.Caption = '100,00') then
     LSumaPorc.Color := clBtnFace
  else
     LSumaPorc.Color := clRed;
  if (LSumaPorc.Caption = '100,00') then
     LSumaPorc.Font.Color := clWindowText
  else
     LSumaPorc.Font.Color := clWhite;
end;

procedure TFMDivisiones.DBGCabRowChange(Sender: TObject);
begin
  SumaPorcentajes;
end;

procedure TFMDivisiones.DBGDetRowChange(Sender: TObject);
begin
  SumaPorcentajes;
end;

procedure TFMDivisiones.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  SumaPorcentajes;
end;

procedure TFMDivisiones.Inicializa(aID_S, aID_Detalles_S: integer; aCabecera: boolean);
begin
  ID_S := aID_S;
  Cabecera := aCabecera;
  if (Cabecera) then
     ID_DETALLES_S := 0
  else
     ID_DETALLES_S := aID_Detalles_S;
end;

end.
