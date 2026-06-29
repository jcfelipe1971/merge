unit UProFmFormulas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
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
  TProFMFormulas = class(TFPEditDetalle)
     Lbl_id: TLFLabel;
     Lbl_nom: TLFLabel;
     LFId: TLFDbedit;
     LFNom: TLFDbedit;
     BTFormula: TToolButton;
     ToolButton2: TToolButton;
     CBActiva: TLFDBCheckBox;
     ALFormulas: TLFActionList;
     AAbreFormula: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure AbreDetalle(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AAbreFormulaExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtra(Filtro: string);
  end;

var
  ProFMFormulas : TProFMFormulas;

implementation

uses UDMMain, UEntorno, UFmain, UProDmFormulas, UProFmFormCampo;

{$R *.dfm}

procedure TProFMFormulas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMFormulas, ProDMFormulas);
  NavMain.DataSource := ProDmFormulas.DSQMProFormulas;
  NavDetalle.DataSource := ProDmFormulas.DSQMProFormulasDet;
  DBGFDetalle.DataSource := ProDmFormulas.DSQMProFormulasDet;
end;

procedure TProFMFormulas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMFormulas);
end;

procedure TProFMFormulas.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  with DBGFDetalle do
  begin
     if SelectedField.FieldName = 'CAMPO_ESC' then
        if (Trim(TablaABuscar) = 'PRO_VER_CAMPOS') then
           CondicionBusqueda :=
              ' TABLA=''' + Trim(ProDMFormulas.QMProFormulasDetTABLA_ESC.AsString) + ''' ' +
              ' AND TIPO NOT LIKE ''%Texto%'' AND TIPO NOT LIKE ''%Fecha%''';

     if SelectedField.FieldName = 'TABLA_ESC' then
        if (Trim(TablaABuscar) = 'PRO_VER_TABLAS') then
           CondicionBusqueda :=
              ' TABLA IN (''PRO_ESCANDALLO'',''PRO_MAT_ESC'',''PRO_TAREA_ESC'')';

     if SelectedField.FieldName = 'CAMPO_ORD' then
        if (Trim(TablaABuscar) = 'PRO_VER_CAMPOS') then
           CondicionBusqueda :=
              ' TABLA=''' + Trim(ProDMFormulas.QMProFormulasDetTABLA_ORD.AsString) + ''' ' +
              ' AND TIPO NOT LIKE ''%Texto%'' AND TIPO NOT LIKE ''%Fecha%''';

     if SelectedField.FieldName = 'TABLA_ORD' then
        if (Trim(TablaABuscar) = 'PRO_VER_TABLAS') then
           CondicionBusqueda :=
              ' TABLA IN (''PRO_ORD'',''PRO_ORD_MAT'',''PRO_ORD_TAREA'')';

     if SelectedField.FieldName = 'CAMPOS_DESP' then
        if (Trim(TablaABuscar) = 'PRO_VER_CAMPOS') then
           CondicionBusqueda :=
              ' TABLA=''' + Trim(ProDMFormulas.QMProFormulasDetTABLA_DESP.AsString) + ''' ' +
              ' AND (CAMPO IN (''MEDIDA_1'', ''MEDIDA_2'', ''MEDIDA_3'', ''MEDIDA_4'', ' +
              '                ''CORTE_MEDIDA1'', ''CORTE_MEDIDA2'', ''CORTE_MEDIDA3'', ''CORTE_MEDIDA4'', ' +
              '                ''DEC_BARRAS_MOTOR_ABAJO'', ''DEC_BARRAS_MOTOR_ARRIBA'', ' +
              '                ''DEC_BARRAS_MANUAL_ABAJO'', ''DEC_BARRAS_MANUAL_ARRIBA'', ''CANTIDAD''))';

     if SelectedField.FieldName = 'TABLA_DESP' then
        if (Trim(TablaABuscar) = 'PRO_VER_TABLAS') then
           CondicionBusqueda :=
              ' TABLA IN (''PRO_DESPIECE_CAB'',''PRO_DESPIECE_DET_COMPONENTE'',''PRO_DESPIECE_DET_TAREA'', ''Z_SYS_MODELOS_DET'')';
  end;
end;

procedure TProFMFormulas.AbreDetalle(Sender: TObject);
begin
  if (ProDMFormulas.EstaActivo) then
     Application.MessageBox(PChar(string(_('Fórmula activa'))),
        PChar(string(_('¡ATENCION!'))), MB_OK + mb_IconStop)
  else
  begin
     if ((ProDMFormulas.QMProFormulasDet.State = dsBrowse) and (ProDMFormulas.QMProFormulasDetID_FORMULA_CAMPOS_CAB.AsInteger <> 0)) then
        //AbreFormVarias(TProFmFormCampo, ProFmFormCampo, Sender, True);
        AbreForm(TProFmFormCampo, ProFmFormCampo, FMain);
  end;
end;

procedure TProFMFormulas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMFormulas.BusquedaCompleja;
end;

procedure TProFMFormulas.AAbreFormulaExecute(Sender: TObject);
begin
  inherited;
  AbreDetalle(DBGFDetalle);
end;

procedure TProFMFormulas.Filtra(Filtro: string);
begin
  if Assigned(ProDMFormulas) then
     ProDMFormulas.Filtra(Filtro);
end;

procedure TProFMFormulas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
