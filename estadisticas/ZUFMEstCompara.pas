unit ZUFMEstCompara;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, Mask, DBCtrls, ULFDBEdit, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ExtCtrls,
  ULFPanel, Grids, DBGrids, NsDBGrid, ULFLabel, rxPlacemnt, ULFFormStorage;

type
  TZFMEstCompara = class(TFPEditListado)
     TSComparacion: TTabSheet;
     PnlVariables: TLFPanel;
     PnlDatos: TLFPanel;
     EFGrupo: TLFEditFind2000;
     DBETitGrupo: TLFDbedit;
     EFPeriodo: TLFEditFind2000;
     DBETitPeriodo: TLFDbedit;
     EFEstadistica2: TLFEditFind2000;
     EFEstadistica1: TLFEditFind2000;
     DBETitEst2: TLFDbedit;
     DBETitEst1: TLFDbedit;
     LGrupo: TLFLabel;
     LEstadistica1: TLFLabel;
     LEstadistica2: TLFLabel;
     LPeriodo: TLFLabel;
     TButtConfigurar: TToolButton;
     DBGFEstCompara: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure TButtImprimirClick(Sender: TObject);
     procedure EFEstadistica1Busqueda(Sender: TObject);
     procedure EFEstadistica2Busqueda(Sender: TObject);
     procedure EFPeriodoChange(Sender: TObject);
     procedure EFGrupoChange(Sender: TObject);
     procedure EFEstadistica1Change(Sender: TObject);
     procedure EFEstadistica2Change(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
     procedure VerComparacion(Modo: integer);
  public
     { Public declarations }
  end;

var
  ZFMEstCompara : TZFMEstCompara;

implementation

uses UFormGest, ZUDMEstCompara, UDMMain, UFMListConfig;

{$R *.dfm}

procedure TZFMEstCompara.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMEstCompara, ZDMEstCompara);

  Grupo := 7002;
  Listado := ZDMEstCompara.frEstadisticaComp;
end;

procedure TZFMEstCompara.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMEstCompara);
  Action := caFree;
end;

procedure TZFMEstCompara.VerComparacion(Modo: integer);
begin
  // PRIMER CAMPO SIEMPRE VISIBLE
  DBGFEstCompara.FindColumn('CLAVE_1').Visible := True;

  ZDMEstCompara.VerComparacion(StrToInt(EFGrupo.Text), StrToInt(EFEstadistica1.Text),
     StrToInt(EFEstadistica2.Text), EFPeriodo.Text, Modo);

  DBGFEstCompara.FindColumn('DESC_CLAVE_1').Visible := (ZDMEstCompara.xEstadisticaDESC_CLAVE_1.AsString <> '');
  DBGFEstCompara.FindColumn('CLAVE_2').Visible := (ZDMEstCompara.xEstadisticaNUM_CLAVES.AsInteger > 1);
  DBGFEstCompara.FindColumn('DESC_CLAVE_2').Visible := ((ZDMEstCompara.xEstadisticaNUM_CLAVES.AsInteger > 1) and (ZDMEstCompara.xEstadisticaDESC_CLAVE_2.AsString <> ''));
  DBGFEstCompara.FindColumn('CLAVE_3').Visible := (ZDMEstCompara.xEstadisticaNUM_CLAVES.AsInteger > 2);
  DBGFEstCompara.FindColumn('DESC_CLAVE_3').Visible := ((ZDMEstCompara.xEstadisticaNUM_CLAVES.AsInteger > 2) and (ZDMEstCompara.xEstadisticaDESC_CLAVE_3.AsString <> ''));
end;

procedure TZFMEstCompara.ARecargarExecute(Sender: TObject);
begin
  inherited;
  if (EFEstadistica1.Text <> EFEstadistica2.Text) then
     VerComparacion(-1);
end;

procedure TZFMEstCompara.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TZFMEstCompara.TButtImprimirClick(Sender: TObject);
begin
  inherited;
  VerComparacion(1);
end;

procedure TZFMEstCompara.EFEstadistica1Busqueda(Sender: TObject);
begin
  inherited;
  EFEstadistica1.CondicionBusqueda := 'grupo=' + EFGrupo.Text;
end;

procedure TZFMEstCompara.EFEstadistica2Busqueda(Sender: TObject);
begin
  inherited;
  EFEstadistica2.CondicionBusqueda := 'grupo=' + EFGrupo.Text;
end;

procedure TZFMEstCompara.EFPeriodoChange(Sender: TObject);
begin
  inherited;
  ZDMEstCompara.xDescPeriodo.Close;
  ZDMEstCompara.xDescPeriodo.Params.ByName['PERIODO'].AsString := EFPeriodo.Text;
  ZDMEstCompara.xDescPeriodo.Open;
end;

procedure TZFMEstCompara.EFGrupoChange(Sender: TObject);
begin
  inherited;
  ZDMEstCompara.xDescGrupo.Close;
  ZDMEstCompara.xDescGrupo.Params.ByName['GRUPO'].AsInteger := StrToIntDef(EFGrupo.Text, 0);
  ZDMEstCompara.xDescGrupo.Open;
end;

procedure TZFMEstCompara.EFEstadistica1Change(Sender: TObject);
begin
  inherited;
  ZDMEstCompara.xDescEst1.Close;
  ZDMEstCompara.xDescEst1.Params.ByName['GRUPO'].AsInteger := StrToIntDef(EFGrupo.Text, 0);
  ZDMEstCompara.xDescEst1.Params.ByName['ESTADISTICA'].AsInteger := StrToIntDef(EFEstadistica1.Text, 0);
  ZDMEstCompara.xDescEst1.Open;

  ZDMEstCompara.xEstadistica.Close;
  ZDMEstCompara.xEstadistica.Params.ByName['GRUPO'].AsInteger := StrToIntDef(EFGrupo.Text, 0);
  ZDMEstCompara.xEstadistica.Params.ByName['ESTADISTICA'].AsInteger := StrToIntDef(EFEstadistica1.Text, 0);
  ZDMEstCompara.xEstadistica.Open;

  DBGFEstCompara.FindColumn('CLAVE_1').Title.Caption := ZDMEstCompara.xEstadisticaTITULO_1.AsString;
  DBGFEstCompara.FindColumn('DESC_CLAVE_1').Title.Caption := ZDMEstCompara.xEstadisticaTITULO_DESC_1.AsString;
  DBGFEstCompara.FindColumn('CLAVE_2').Title.Caption := ZDMEstCompara.xEstadisticaTITULO_2.AsString;
  DBGFEstCompara.FindColumn('DESC_CLAVE_2').Title.Caption := ZDMEstCompara.xEstadisticaTITULO_DESC_2.AsString;
  DBGFEstCompara.FindColumn('CLAVE_3').Title.Caption := ZDMEstCompara.xEstadisticaTITULO_3.AsString;
  DBGFEstCompara.FindColumn('DESC_CLAVE_3').Title.Caption := ZDMEstCompara.xEstadisticaTITULO_DESC_3.AsString;
end;

procedure TZFMEstCompara.EFEstadistica2Change(Sender: TObject);
begin
  inherited;
  with ZDMEstCompara.xDescEst2 do
  begin
     Close;
     Params.ByName['GRUPO'].AsInteger := StrToIntDef(EFGrupo.Text, 0);
     Params.ByName['ESTADISTICA'].AsInteger := StrToIntDef(EFEstadistica2.Text, 0);
     Open;
  end;
end;

procedure TZFMEstCompara.APrevExecute(Sender: TObject);
begin
  inherited;
  VerComparacion(0);
end;

procedure TZFMEstCompara.AImprimirExecute(Sender: TObject);
begin
  inherited;
  VerComparacion(1);
end;

end.
