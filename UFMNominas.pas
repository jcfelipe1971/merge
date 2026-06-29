unit UFMNominas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFPageControl, StdCtrls,
  ULFEdit, Mask, DBCtrls, ULFDBEditFind2000, UFormGest, UNavigator,
  ULFEditFind2000, ULFLabel, ULFComboBox;

type
  TFMNominas = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSNomina: TTabSheet;
     TSAnticipo: TTabSheet;
     TBENominas: TLFToolBar;
     TBAnticipo: TLFToolBar;
     DBGNominas: TDBGridFind2000;
     DBGAnticipo: TDBGridFind2000;
     AImportacionExcel: TAction;
     NavNominas: THYMNavigator;
     ToolButton4: TToolButton;
     NavAnticipos: THYMNavigator;
     ToolButton1: TToolButton;
     TButtAnticiposTodos: TToolButton;
     TButtAnticiposPendientes: TToolButton;
     TButtNominasTodas: TToolButton;
     TButtNominasPendientes: TToolButton;
     ALBotones: TLFActionList;
     ANominasTodas: TAction;
     ANominasPendientes: TAction;
     AAnticiposTodos: TAction;
     AAnticiposPendientes: TAction;
     LFCategoryAction1: TLFCategoryAction;
     ToolButton2: TToolButton;
     TButtSeleccionarTodas: TToolButton;
     ASeleccionarTodas: TAction;
     ADeseleccionarTodas: TAction;
     TButtDeseleccionarTodas: TToolButton;
     ToolButton5: TToolButton;
     TButtCrearOrdenDePago: TToolButton;
     PPFormatos: TPopUpTeclas;
     MINormaCSB34: TMenuItem;
     MINormaCSB34_1: TMenuItem;
     MINormaCSB34_1_Banesto: TMenuItem;
     MINormaCSB34_1_Pastor: TMenuItem;
     MINormaCSB34_1_Bankinter: TMenuItem;
     MINormaCSB34_1_BancoPopular: TMenuItem;
     PNLBanco: TLFPanel;
     LBanco: TLFLabel;
     EFBanco: TLFEditFind2000;
     ETituloBanco: TLFEdit;
     TButtCerrarSeleccionados: TToolButton;
     TButtPagarSeleccionados: TToolButton;
     ToolButton7: TToolButton;
     ACerrarSeleccionados: TAction;
     APagarSeleccionados: TAction;
     MINormaSEPA: TMenuItem;
     PNLPeriodo: TLFPanel;
     LPeriodo: TLFLabel;
     CBPeriodo: TLFComboBox;
     PNLFiltroUsuario: TLFPanel;
     LFiltroEmpleado: TLFLabel;
     EFFiltroEmpleado: TLFEditFind2000;
     EFiltroEmpleado: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGOnBusqueda(Sender: TObject);
     procedure ANominasTodasExecute(Sender: TObject);
     procedure ANominasPendientesExecute(Sender: TObject);
     procedure AAnticiposTodosExecute(Sender: TObject);
     procedure AAnticiposPendientesExecute(Sender: TObject);
     procedure AImportacionExcelExecute(Sender: TObject);
     procedure DBGNominasCellClick(Column: TColumn);
     procedure DBGAnticipoCellClick(Column: TColumn);
     procedure DBGNominasDblClick(Sender: TObject);
     procedure DBGAnticipoDblClick(Sender: TObject);
     procedure DBGNominasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ASeleccionarTodasExecute(Sender: TObject);
     procedure ADeseleccionarTodasExecute(Sender: TObject);
     procedure MINormaCSB34_1Click(Sender: TObject);
     procedure MINormaCSB34_1_BanestoClick(Sender: TObject);
     procedure MINormaCSB34_1_PastorClick(Sender: TObject);
     procedure MINormaCSB34_1_BankinterClick(Sender: TObject);
     procedure MINormaCSB34_1_BancoPopularClick(Sender: TObject);
     procedure MINormaCSB34Click(Sender: TObject);
     procedure EFBancoChange(Sender: TObject);
     procedure ACerrarSeleccionadosExecute(Sender: TObject);
     procedure APagarSeleccionadosExecute(Sender: TObject);
     procedure DBGAnticipoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure MINormaSEPAClick(Sender: TObject);
     procedure DBGNominasColEnter(Sender: TObject);
     procedure DBGAnticipoColEnter(Sender: TObject);
     procedure DBGNominasBeforeColExit(Sender: TObject; var Continuar: boolean);
     procedure DBGAnticipoBeforeColExit(Sender: TObject; var Continuar: boolean);
     procedure CBPeriodoChange(Sender: TObject);
     procedure EFFiltroEmpleadoChange(Sender: TObject);
  private
     { Private declarations }
     ColActualNom: TColumn;
     ColActualAnt: TColumn;
     Param_NOMTIPO001: integer;
     procedure IniciaFormato(Formato: smallint);
  public
     { Public declarations }
  end;

var
  FMNominas : TFMNominas;

implementation

uses UDMNominas, UDMMain, UEntorno, UFMain, UFPregDatosCSB34, UUtiles, UParam, UFMSeleccion, DateUtils, UDameDato;

{$R *.dfm}

procedure TFMNominas.FormCreate(Sender: TObject);
//var
//c : integer;
begin
  inherited;
  // Tipo de Importacion de Nómina
  // 1: Micamol
  // 2: Tubos Paris
  Param_NOMTIPO001 := StrToIntDef(LeeParametro('NOMTIPO001', ''), 1);

  AbreData(TDMNominas, DMNominas);
  ColActualNom := DBGNominas.Columns[0];
  ColActualAnt := DBGAnticipo.Columns[1];
  DBGNominas.ColumnasChecked.Strings[DBGNominas.ColumnasCheckBoxes.IndexOf('SELECCIONADO')] := IntToStr(REntorno.Entrada);
  CBPeriodo.ItemIndex := 0;
  CBPeriodoChange(Sender);
  PCMain.ActivePage := TSNomina;
end;

procedure TFMNominas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMNominas);
end;

procedure TFMNominas.DBGOnBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'CON_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CUENTA';
     end
     else
     if (Trim(TablaABuscar) = 'VER_EMPLEADOS_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'EMPLEADO';
     end
     else
     if (Trim(TablaABuscar) = 'EMP_PERIODOS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND TIPO=1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'PERIODO';
     end
     else
     if (Trim(TablaABuscar) = 'VER_EMPLEADOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND ACTIVO=1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'EMPLEADO';
     end;
  end;
end;

procedure TFMNominas.ANominasTodasExecute(Sender: TObject);
begin
  inherited;
  DMNominas.FiltraNominasPendientes(True);
end;

procedure TFMNominas.ANominasPendientesExecute(Sender: TObject);
begin
  inherited;
  DMNominas.FiltraNominasPendientes(False);
end;

procedure TFMNominas.AAnticiposTodosExecute(Sender: TObject);
begin
  inherited;
  DMNominas.FiltraAnticiposPendientes(True);
end;

procedure TFMNominas.AAnticiposPendientesExecute(Sender: TObject);
begin
  inherited;
  DMNominas.FiltraAnticiposPendientes(False);
end;

procedure TFMNominas.DBGNominasCellClick(Column: TColumn);
begin
  inherited;
  ColActualNom := Column;
end;

procedure TFMNominas.DBGAnticipoCellClick(Column: TColumn);
begin
  inherited;
  ColActualAnt := Column;
end;

procedure TFMNominas.AImportacionExcelExecute(Sender: TObject);
var
  Archivo, PeriodoHacienda : string;
begin
  inherited;
  Archivo := '';
  if MyOpenDialog(Archivo, 'XLS,ODS', '', 'FMNominas-ImportacionExcel') then
  begin
     if CBPeriodo.ItemIndex <> 0 then
        PeriodoHacienda := Format('%.2d', [CBPeriodo.ItemIndex])
     else
        PeriodoHacienda := Format('%.2d', [MonthOf(Today)]);

     if PideDato('PER', PeriodoHacienda) then
        DMNominas.ImportacionNominas(Archivo, PeriodoHacienda);
  end;
end;

procedure TFMNominas.DBGNominasDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActualNom.FieldName) = 'NOMBRE_R_SOCIAL') then
     FMain.EjecutaAccion(FMain.AOpeEmpleados, 'EMPLEADO=' + IntToStr(DMNominas.QMNominasEMPLEADO.AsInteger));

  if (UpperCase(ColActualNom.FieldName) = 'RIC_CIERRE') then
     if (DMNominas.QMNominasCERRADO.AsInteger = 1) then
        FMain.MuestraMovConta(' RIC= ' + DMNominas.QMNominasRIC_CIERRE.AsString + ' AND EJERCICIO=' + DMNominas.QMNominasEJERCICIO_CIERRE.AsString);

  if (UpperCase(ColActualNom.FieldName) = 'RIC_CIERRE_SEG_SOCIAL_EMPRESA') then
     if (DMNominas.QMNominasCERRADO.AsInteger = 1) then
        FMain.MuestraMovConta(' RIC= ' + DMNominas.QMNominasRIC_CIERRE_SEG_SOCIAL_EMPRESA.AsString + ' AND EJERCICIO=' + DMNominas.QMNominasEJERCICIO_CIERRE.AsString);

  if (UpperCase(ColActualNom.FieldName) = 'RIC_PAGO') then
     if (DMNominas.QMNominasPAGADO.AsInteger = 1) then
        FMain.MuestraMovConta(' RIC= ' + DMNominas.QMNominasRIC_PAGO.AsString + ' AND EJERCICIO=' + DMNominas.QMNominasEJERCICIO_PAGO.AsString);
end;

procedure TFMNominas.DBGAnticipoDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActualAnt.FieldName) = 'NOMBRE_R_SOCIAL') then
     FMain.EjecutaAccion(FMain.AOpeEmpleados, 'EMPLEADO=' + IntToStr(DMNominas.QMAnticiposEMPLEADO.AsInteger));

  if (UpperCase(ColActualAnt.FieldName) = 'RIC_PAGO') then
     if (DMNominas.QMAnticiposPAGADO.AsInteger = 1) then
        FMain.MuestraMovConta(' RIC= ' + DMNominas.QMAnticiposRIC_PAGO.AsString + ' AND EJERCICIO=' + DMNominas.QMAnticiposEJERCICIO_PAGO.AsString);

  if (UpperCase(ColActualAnt.FieldName) = 'RIC_LIQUIDACION') then
     if (DMNominas.QMAnticiposLIQUIDADO.AsInteger = 1) then
        FMain.MuestraMovConta(' RIC= ' + DMNominas.QMAnticiposRIC_LIQUIDACION.AsString + ' AND EJERCICIO=' + DMNominas.QMAnticiposEJERCICIO_LIQUIDACION.AsString);
end;

procedure TFMNominas.DBGNominasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  Suma : double;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'NOMBRE_R_SOCIAL') or
        (UpperCase(Column.FieldName) = 'RIC_CIERRE') or
        (UpperCase(Column.FieldName) = 'RIC_CIERRE_SEG_SOCIAL_EMPRESA') or
        (UpperCase(Column.FieldName) = 'RIC_PAGO')) then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'IMP_REMUNERACION') then
           ColorResaltado5(Canvas);

        if (UpperCase(Column.FieldName) = 'IMP_DEVENGADO') then
        begin
           case Param_NOMTIPO001 of
              1:
              begin
                 // Calculo cuando debería valer IMP_DEVENGADO
                 with DMNominas do
                 begin
                    Suma := QMNominasIMP_RETENCION.AsFloat * (-1);
                    Suma := Suma + QMNominasIMP_RETENCION_ESPECIE.AsFloat * (-1);
                    Suma := Suma + QMNominasIMP_REMUNERACION.AsFloat;
                    Suma := Suma + QMNominasIMP_REMUNERACION_ESPECIE.AsFloat;
                    Suma := Suma + QMNominasIMP_SEG_SOCIAL.AsFloat * (-1);
                    Suma := Suma + QMNominasIMP_DIETAS.AsFloat;
                    Suma := Suma + QMNominasIMP_ANTICIPO.AsFloat;
                    Suma := Suma + QMNominasIMP_EMBARGO.AsFloat * (-1);
                 end;

                 if (Abs(DMNominas.QMNominasIMP_DEVENGADO.AsFloat - Suma) > 0.005) then
                    ColorError(Canvas)
                 else
                    ColorEdicion(Canvas);
              end;
              2:
              begin
                 // Calculo cuando debería valer IMP_DEVENGADO
                 with DMNominas do
                 begin
                    Suma := QMNominasIMP_RETENCION.AsFloat;
                    Suma := Suma + QMNominasIMP_RETENCION_ESPECIE.AsFloat;
                    Suma := Suma + QMNominasIMP_REMUNERACION.AsFloat;
                    Suma := Suma + QMNominasIMP_REMUNERACION_ESPECIE.AsFloat;
                    Suma := Suma + QMNominasIMP_SEG_SOCIAL.AsFloat;
                    Suma := Suma + QMNominasIMP_DIETAS.AsFloat;
                    Suma := Suma + QMNominasIMP_EMBARGO.AsFloat;
                 end;

                 if (Abs(DMNominas.QMNominasIMP_DEVENGADO.AsFloat - Suma) > 0.005) then
                    ColorError(Canvas)
                 else
                    ColorEdicion(Canvas);
              end;
           end;
        end;

        if (UpperCase(Column.FieldName) = 'IMP_ANTICIPO') then
        begin
           if (DMNominas.QMNominasIMP_ANTICIPO.AsFloat > 0) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end;

        if (UpperCase(Column.FieldName) = 'IMP_OTROS') then
        begin
           if (DMNominas.QMNominasIMP_OTROS.AsFloat > 0) then
              ColorResaltado2(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMNominas.ASeleccionarTodasExecute(Sender: TObject);
begin
  inherited;
  DMNominas.Seleccionar(True);
end;

procedure TFMNominas.ADeseleccionarTodasExecute(Sender: TObject);
begin
  inherited;
  DMNominas.Seleccionar(False);
end;

procedure TFMNominas.MINormaCSB34Click(Sender: TObject);
begin
  inherited;
  IniciaFormato(-1);
end;

procedure TFMNominas.MINormaCSB34_1Click(Sender: TObject);
begin
  inherited;
  IniciaFormato(0);
end;

procedure TFMNominas.MINormaCSB34_1_BanestoClick(Sender: TObject);
begin
  inherited;
  IniciaFormato(1);
end;

procedure TFMNominas.MINormaCSB34_1_PastorClick(Sender: TObject);
begin
  inherited;
  IniciaFormato(2);
end;

procedure TFMNominas.MINormaCSB34_1_BankinterClick(Sender: TObject);
begin
  inherited;
  IniciaFormato(3);
end;

procedure TFMNominas.MINormaCSB34_1_BancoPopularClick(Sender: TObject);
begin
  inherited;
  IniciaFormato(4);
end;

procedure TFMNominas.MINormaSEPAClick(Sender: TObject);
begin
  inherited;
  IniciaFormato(5);
end;

procedure TFMNominas.IniciaFormato(Formato: smallint);
var
  Sufijo : string;
begin
  if (DMNominas.SeleccionadasEstanCerradas) then
  begin
     if (not DMNominas.SeleccionadasEstanPagadas) then
     begin
        if (Trim(ETituloBanco.Text) <> '') then
        begin
           with TFPregDatosCSB34.Create(Self) do
           begin
              Sufijo := '';
              case Formato of
                 0: Sufijo := '000';
                 1: Sufijo := '000';
                 2: Sufijo := '000';
                 3: Sufijo := '000';
                 4: Sufijo := '000';
                 5: Sufijo := '000';
              end;

              if Datos(Sufijo) then
              begin
                 case Formato of
                    0: DMNominas.ImprimirNorma34(StrToIntDef(EFBanco.Text, 0));
                    1..3: DMNominas.ImprimirNorma34_1(Formato, Sufijo, StrToIntDef(EFBanco.Text, 0));
                    4: DMNominas.ImprimirNorma34_14(Formato, Sufijo, StrToIntDef(EFBanco.Text, 0));
                    5: DMNominas.ImprimirSEPA(Formato, Sufijo, StrToIntDef(EFBanco.Text, 0));
                 end;
              end;
           end;
        end
        else
           ShowMessage(_('No ha seleccionado banco.'));
     end
     else
        ShowMessage(_('Algún registro ya ha sido pagado.'));
  end
  else
     ShowMessage(_('Algún registro no ha sido cerrado.'));
end;

procedure TFMNominas.EFBancoChange(Sender: TObject);
begin
  inherited;
  ETituloBanco.Text := DameTituloBanco(StrToIntDef(EFBanco.Text, 0));
  DMNominas.CambiaBanco(StrToIntDef(EFBanco.Text, 0));
end;

procedure TFMNominas.ACerrarSeleccionadosExecute(Sender: TObject);
begin
  inherited;
  DMNominas.CerrarSeleccionados;
end;

procedure TFMNominas.APagarSeleccionadosExecute(Sender: TObject);
begin
  inherited;
  DMNominas.PagarSeleccionados;
end;

procedure TFMNominas.DBGAnticipoDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'NOMBRE_R_SOCIAL') or (UpperCase(Column.FieldName) = 'RIC_PAGO') or (UpperCase(Column.FieldName) = 'RIC_LIQUIDACION')) then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);
     if (UpperCase(Column.FieldName) = 'NOMBRE_R_SOCIAL') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMNominas.DBGNominasColEnter(Sender: TObject);
begin
  inherited;
  if (DBGNominas.SelectedField.FieldName = 'CTA_PAGO') then
     FMain.AddComponentePunto(DBGNominas)
  else
     FMain.DelComponentePunto(DBGNominas);
end;

procedure TFMNominas.DBGAnticipoColEnter(Sender: TObject);
begin
  inherited;
  if (DBGAnticipo.SelectedField.FieldName = 'CTA_PAGO') then
     FMain.AddComponentePunto(DBGAnticipo)
  else
     FMain.DelComponentePunto(DBGAnticipo);
end;

procedure TFMNominas.DBGNominasBeforeColExit(Sender: TObject; var Continuar: boolean);
begin
  inherited;
  with DBGNominas.SelectedField do
  begin
     if FieldName = 'CTA_PAGO' then
        AsString := ExpandirCadena(Trim(AsString), REntorno.DigitosSub);
  end;
end;

procedure TFMNominas.DBGAnticipoBeforeColExit(Sender: TObject; var Continuar: boolean);
begin
  inherited;
  with DBGAnticipo.SelectedField do
  begin
     if FieldName = 'CTA_PAGO' then
        AsString := ExpandirCadena(Trim(AsString), REntorno.DigitosSub);
  end;
end;

procedure TFMNominas.CBPeriodoChange(Sender: TObject);
begin
  inherited;
  DMNominas.FiltraPeriodo(Format('%.2d', [CBPeriodo.ItemIndex]));
end;

procedure TFMNominas.EFFiltroEmpleadoChange(Sender: TObject);
begin
  inherited;
  EFiltroEmpleado.Text := DameTituloEmpleado(StrToIntDef(EFFiltroEmpleado.Text, 0));
  DMNominas.FiltraEmpleado(StrToIntDef(EFFiltroEmpleado.Text, 0));
end;

end.
