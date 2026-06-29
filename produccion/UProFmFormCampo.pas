unit UProFmFormCampo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, DBCtrls, ComCtrls, UDBDateTimePicker, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, UFormGest,
  ExtDlgs, DB, Buttons, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBEditFind2000, ULFDBEdit, ULFDBCheckBox, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBDateEdit, ULFFIBDBEditFind,
  UHYDescription, ULFHYDBDescription, UG2kTBLoc, UFPregTiempo, ULFLabel,
  ULFEdit, ImgList, Math, UProDMEscandallo, DbComboBoxValue, UFPEditDetalle;

type
  TProFmFormCampo = class(TFPEditDetalle)
     LbFormula: TLFLabel;
     LbEstado: TLFLabel;
     LFFormula: TLFDbedit;
     DBEEstadoFormula: TLFDbedit;
     LBLTipoRedondeo: TLFLabel;
     DBEFTipoRedondeo: TLFDBEditFind2000;
     DBETipoRedondeo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure TbuttCompClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     procedure AbreRegistro(id: integer);
  public
     { Public declarations }
  end;

var
  ProFmFormCampo : TProFmFormCampo;

implementation

uses UDMMain, UEntorno, UFmain, UProDmFormCampo, UProDmFormulas;

{$R *.dfm}

procedure TProFmFormCampo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDmFormCampo, ProDmFormCampo);
  NavMain.DataSource := ProDmFormCampo.DSQmProFormulasCamp;
  NavDetalle.DataSource := ProDmFormCampo.DSQmProFormulasCampDet;
  DBGFDetalle.DataSource := ProDmFormCampo.DSQmProFormulasCampDet;

  AbreRegistro(ProDMFormulas.QmProFormulasDetID_FORMULA_CAMPOS_CAB.AsInteger);
  ProDmFormCampo.DesvalidaFormula;
end;

procedure TProFmFormCampo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ProDMFormulas.QMProFormulasDet.Refresh;
  CierraData(ProDMFormCampo);
end;

procedure TProFmFormCampo.AbreRegistro(id: integer);
begin
  ProDmFormCampo.AbreRegistro(id);
end;

procedure TProFmFormCampo.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  with DBGFDetalle do
  begin
     if SelectedField.FieldName = 'CAMPO_ESC' then
        if (Trim(TablaABuscar) = 'PRO_VER_CAMPOS') then
           CondicionBusqueda :=
              ' TABLA=''' + ProDmFormCampo.QmProFormulasCampDetTABLA_ESC.AsString + ''' ' +
              ' AND TIPO NOT LIKE ''%Texto%'' AND TIPO NOT LIKE ''%Fecha%''';

     if SelectedField.FieldName = 'TABLA_ESC' then
        if (Trim(TablaABuscar) = 'PRO_VER_TABLAS') then
           CondicionBusqueda :=
              ' TABLA IN (''PRO_ESCANDALLO'',''PRO_MAT_ESC'',''PRO_TAREA_ESC'',''VER_DATOS_ESCANDALLO'')';

     if SelectedField.FieldName = 'CAMPO_ORD' then
        if (Trim(TablaABuscar) = 'PRO_VER_CAMPOS') then
           CondicionBusqueda :=
              ' TABLA=''' + ProDmFormCampo.QmProFormulasCampDetTABLA_ORD.AsString + ''' ' +
              ' AND TIPO NOT LIKE ''%Texto%'' AND TIPO NOT LIKE ''%Fecha%''';

     if SelectedField.FieldName = 'TABLA_ORD' then
        if (Trim(TablaABuscar) = 'PRO_VER_TABLAS') then
           CondicionBusqueda :=
              ' TABLA IN (''PRO_ORD'',''PRO_ORD_MAT'',''PRO_ORD_TAREA'',''VER_DATOS_ORD_FASES'')';

     if SelectedField.FieldName = 'CAMPO_DESP' then
        if (Trim(TablaABuscar) = 'PRO_VER_CAMPOS') then
           CondicionBusqueda :=
              ' TABLA=''' + ProDmFormCampo.QmProFormulasCampDetTABLA_DESP.AsString + ''' ' +
              ' AND (CAMPO IN (''MEDIDA_1'', ''MEDIDA_2'', ''MEDIDA_3'', ''MEDIDA_4'', ' +
              '                ''CORTE_MEDIDA1'', ''CORTE_MEDIDA2'', ''CORTE_MEDIDA3'', ''CORTE_MEDIDA4'', ' +
              '                ''DEC_BARRAS_MOTOR_ABAJO'', ''CANTIDAD''))';

     if SelectedField.FieldName = 'TABLA_DESP' then
        if (Trim(TablaABuscar) = 'PRO_VER_TABLAS') then
           CondicionBusqueda :=
              ' TABLA IN (''PRO_DESPIECE_CAB'',''PRO_DESPIECE_DET_COMPONENTE'',''PRO_DESPIECE_DET_TAREA'', ''Z_SYS_MODELOS_DET'')';
  end;
end;

procedure TProFmFormCampo.TbuttCompClick(Sender: TObject);
begin
  inherited;
  ProDmFormCampo.ValidaFormula;
end;

procedure TProFmFormCampo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDmFormCampo.BusquedaCompleja;
end;

procedure TProFmFormCampo.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
