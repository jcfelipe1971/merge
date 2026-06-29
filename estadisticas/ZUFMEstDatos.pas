unit ZUFMEstDatos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, ExtCtrls, ActnList,
  ComCtrls, ToolWin, Grids, DBGrids, NsDBGrid, rxPlacemnt, ULFActionList,
  ULFPageControl, ULFToolBar, ULFEdit, ULFEditFind2000, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFFormStorage, ULFComboBox, ULFLabel,
  ULFPanel, UFPEditListadoSimple;

type
  TZFMEstDatos = class(TFPEditListadoSimple)
     LBLPeriodo: TLFLabel;
     PnlCab: TLFPanel;
     LBLGrupo: TLFLabel;
     LBLEstadistica: TLFLabel;
     DBEDescGrupo: TLFDbedit;
     DBEDescEstadistica: TLFDbedit;
     EFPeriodo: TLFEditFind2000;
     DBEDescPeriodo: TLFDbedit;
     EGrupo: TLFEdit;
     EEstadistica: TLFEdit;
     DBGFEstadistica: TDBGridFind2000;
     PnlDet: TLFPanel;
     TButtConfigurar: TToolButton;
     ChkBVerTotal: TLFCheckBox;
     CBOrdenTotal: TLFComboBox;
     ChkBOcultarMeses: TLFCheckBox;
     ToolButton1: TToolButton;
     LInformacion: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure EFPeriodoChange(Sender: TObject);
     procedure CambioCheck(Sender: TObject);
     procedure CBOrdenTotalChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     OrdenDefecto: smallint;
     procedure AbrirEstadistica(Grupo, Estadistica, Orden: integer);
     procedure Muestra;
     procedure Log(s: string);
     procedure MesesVer(Periodo: string);
     procedure ConfiguraCamposVisibles;
  end;

var
  ZFMEstDatos : TZFMEstDatos;

implementation

uses ZUDMEstDatos, UDMMain, UFormGest, UUtiles;

{$R *.dfm}

procedure TZFMEstDatos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMEstDatos, ZDMEstDatos);

  Grupo := 7000;
  Listado := ZDMEstDatos.frEstadistica;
end;

procedure TZFMEstDatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMEstDatos);
  Action := caFree;
end;

procedure TZFMEstDatos.AbrirEstadistica(Grupo, Estadistica, Orden: integer);
var
  col : integer;
begin
  EGrupo.Text := IntToStr(Grupo);
  EEstadistica.Text := IntToStr(Estadistica);
  OrdenDefecto := Orden;
  CBOrdenTotal.ItemIndex := OrdenDefecto;

  Muestra;
  try
     with DBGFEstadistica do
     begin
        col := EncuentraField(DBGFEstadistica, 'CLAVE_1');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTITULO_1.AsString;

        col := EncuentraField(DBGFEstadistica, 'DESC_CLAVE_1');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTITULO_DESC_1.AsString;

        col := EncuentraField(DBGFEstadistica, 'CLAVE_2');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTITULO_2.AsString;

        col := EncuentraField(DBGFEstadistica, 'DESC_CLAVE_2');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTITULO_DESC_2.AsString;

        col := EncuentraField(DBGFEstadistica, 'CLAVE_3');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTITULO_3.AsString;

        col := EncuentraField(DBGFEstadistica, 'DESC_CLAVE_3');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTITULO_DESC_3.AsString;

        col := EncuentraField(DBGFEstadistica, 'CAMPO_AUX_1');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTIT_CAMPO_AUX_1.AsString;

        col := EncuentraField(DBGFEstadistica, 'CAMPO_AUX_2');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTIT_CAMPO_AUX_2.AsString;

        col := EncuentraField(DBGFEstadistica, 'CAMPO_AUX_3');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTIT_CAMPO_AUX_3.AsString;

        col := EncuentraField(DBGFEstadistica, 'CAMPO_AUX_4');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTIT_CAMPO_AUX_4.AsString;

        col := EncuentraField(DBGFEstadistica, 'CAMPO_AUX_5');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.xEstadisticaTIT_CAMPO_AUX_5.AsString;

        col := EncuentraField(DBGFEstadistica, 'MES01');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('01');

        col := EncuentraField(DBGFEstadistica, 'MES02');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('02');

        col := EncuentraField(DBGFEstadistica, 'MES03');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('03');

        col := EncuentraField(DBGFEstadistica, 'MES04');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('04');

        col := EncuentraField(DBGFEstadistica, 'MES05');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('05');

        col := EncuentraField(DBGFEstadistica, 'MES06');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('06');

        col := EncuentraField(DBGFEstadistica, 'MES07');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('07');

        col := EncuentraField(DBGFEstadistica, 'MES08');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('08');

        col := EncuentraField(DBGFEstadistica, 'MES09');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('09');

        col := EncuentraField(DBGFEstadistica, 'MES10');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('10');

        col := EncuentraField(DBGFEstadistica, 'MES11');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('11');

        col := EncuentraField(DBGFEstadistica, 'MES12');
        if (col >= 0) then
           Columns[col].Title.Caption := ZDMEstDatos.TituloMes('12');
     end;
  except
  end;
end;

procedure TZFMEstDatos.APrevExecute(Sender: TObject);
begin
  inherited;
  ZDMEstDatos.VerEstadistica(StrToInt(EGrupo.Text), StrToInt(EEstadistica.Text), EFPeriodo.Text, 0);
  ConfiguraCamposVisibles;
end;

procedure TZFMEstDatos.AImprimirExecute(Sender: TObject);
begin
  inherited;
  ZDMEstDatos.VerEstadistica(StrToInt(EGrupo.Text), StrToInt(EEstadistica.Text), EFPeriodo.Text, 1);
  ConfiguraCamposVisibles;
end;

procedure TZFMEstDatos.ARecargarExecute(Sender: TObject);
begin
  inherited;
  CBOrdenTotal.ItemIndex := OrdenDefecto;
  ZDMEstDatos.RecalcularEstadistica(StrToInt(EGrupo.Text), StrToInt(EEstadistica.Text));
  Log('');
  Muestra;
end;

procedure TZFMEstDatos.Muestra;
begin
  ZDMEstDatos.VerEstadistica(StrToInt(EGrupo.Text), StrToInt(EEstadistica.Text), EFPeriodo.Text, -1);
  ConfiguraCamposVisibles;
end;

procedure TZFMEstDatos.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TZFMEstDatos.EFPeriodoChange(Sender: TObject);
begin
  inherited;
  ZDMEstDatos.xDescPeriodo.Close;
  ZDMEstDatos.xDescPeriodo.Params.ByName['PERIODO'].AsString := EFPeriodo.Text;
  ZDMEstDatos.xDescPeriodo.Open;

  if ZDMEstDatos.xDescPeriodoTITULO.AsString <> '' then
     Muestra;
end;

procedure TZFMEstDatos.CambioCheck(Sender: TObject);
var
  col : integer;
begin
  inherited;
  MesesVer(EFPeriodo.Text);

  col := EncuentraField(DBGFEstadistica, 'TOTALPERIODO');
  if (col >= 0) then
     DBGFEstadistica.Columns[col].Visible := ChkBVerTotal.Checked;

  if ChkBOcultarMeses.Checked then
     Grupo := 7001
  else
     Grupo := 7000;
end;

procedure TZFMEstDatos.CBOrdenTotalChange(Sender: TObject);
begin
  inherited;
  Muestra;
end;

procedure TZFMEstDatos.Log(s: string);
begin
  LInformacion.Caption := s;
  Application.ProcessMessages;
end;

procedure TZFMEstDatos.MesesVer(Periodo: string);
var
  Ver : boolean;
  col : integer;
begin
  /// Meses visibles segun periodo a mostrar

  // Siempre que no se oculten los meses
  Ver := (not ChkBOcultarMeses.Checked);

  with DBGFEstadistica do
  begin
     col := EncuentraField(DBGFEstadistica, 'MES01');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '01,13,17,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES02');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '02,13,17,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES03');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '03,13,17,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES04');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '04,14,17,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES05');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '05,14,17,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES06');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '06,14,17,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES07');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '07,15,18,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES08');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '08,15,18,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES09');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '09,15,18,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES10');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '10,16,18,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES11');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '11,16,18,19') > 0) and (Ver));

     col := EncuentraField(DBGFEstadistica, 'MES12');
     if (col >= 0) then
        Columns[col].Visible := ((Pos(Periodo, '12,16,18,19') > 0) and (Ver));
  end;
end;

procedure TZFMEstDatos.ConfiguraCamposVisibles;
var
  col : integer;
begin
  with DBGFEstadistica do
  begin
     // Primer campo siempre visible
     col := EncuentraField(DBGFEstadistica, 'CLAVE_1');
     if (col >= 0) then
        Columns[col].Visible := True;

     col := EncuentraField(DBGFEstadistica, 'DESC_CLAVE_1');
     if (col >= 0) then
        Columns[col].Visible := (ZDMEstDatos.xEstadisticaDESC_CLAVE_1.AsString <> '');

     col := EncuentraField(DBGFEstadistica, 'CLAVE_2');
     if (col >= 0) then
        Columns[col].Visible := (ZDMEstDatos.xEstadisticaNUM_CLAVES.AsInteger > 1);

     col := EncuentraField(DBGFEstadistica, 'DESC_CLAVE_2');
     if (col >= 0) then
        Columns[col].Visible := ((ZDMEstDatos.xEstadisticaNUM_CLAVES.AsInteger > 1) and (ZDMEstDatos.xEstadisticaDESC_CLAVE_2.AsString <> ''));

     col := EncuentraField(DBGFEstadistica, 'CLAVE_3');
     if (col >= 0) then
        Columns[col].Visible := (ZDMEstDatos.xEstadisticaNUM_CLAVES.AsInteger > 2);

     col := EncuentraField(DBGFEstadistica, 'DESC_CLAVE_3');
     if (col >= 0) then
        Columns[col].Visible := ((ZDMEstDatos.xEstadisticaNUM_CLAVES.AsInteger > 2) and (ZDMEstDatos.xEstadisticaDESC_CLAVE_3.AsString <> ''));

     col := EncuentraField(DBGFEstadistica, 'CAMPO_AUX_1');
     if (col >= 0) then
        Columns[col].Visible := (ZDMEstDatos.xEstadisticaCAMPO_AUX_1.AsString <> '');

     col := EncuentraField(DBGFEstadistica, 'CAMPO_AUX_2');
     if (col >= 0) then
        Columns[col].Visible := (ZDMEstDatos.xEstadisticaCAMPO_AUX_2.AsString <> '');

     col := EncuentraField(DBGFEstadistica, 'CAMPO_AUX_3');
     if (col >= 0) then
        Columns[col].Visible := (ZDMEstDatos.xEstadisticaCAMPO_AUX_3.AsString <> '');

     col := EncuentraField(DBGFEstadistica, 'CAMPO_AUX_4');
     if (col >= 0) then
        Columns[col].Visible := (ZDMEstDatos.xEstadisticaCAMPO_AUX_4.AsString <> '');

     col := EncuentraField(DBGFEstadistica, 'CAMPO_AUX_5');
     if (col >= 0) then
        Columns[col].Visible := (ZDMEstDatos.xEstadisticaCAMPO_AUX_5.AsString <> '');
  end;
end;

end.
