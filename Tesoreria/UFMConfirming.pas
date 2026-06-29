unit UFMConfirming;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UEditPanel, ComCtrls, ExtCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, UHYDBGrid, UFormGest, DB,
  UNavigator, NsDBGrid, rxToolEdit, RXDBCtrl, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBEdit, ULFPanel, ULFPageControl, ULFToolBar,
  ActnList, ULFActionList, rxPlacemnt, ULFFormStorage, TFlatCheckBoxUnit,
  ULFCheckBox, ULFLabel, Buttons, ULFDBDateEdit, HYFIBQuery,
  UFPEditDetalle, UG2kTBLoc;

type
  TFMConfirming = class(TFPEditDetalle)
     LBLConfirming: TLFLabel;
     LBanco: TLFLabel;
     DBEFBanco: TLFDBEditFind2000;
     DBETituloBanco: TLFDbedit;
     DBDTPFecha: TLFDBDateEdit;
     LFecha: TLFLabel;
     DBEImporte: TLFDbedit;
     LImporte: TLFLabel;
     TButtSep2: TToolButton;
     EPDetalle: THYMEditPanel;
     TButtMostrarDisponibles: TToolButton;
     TButtSeleccionarTodas: TToolButton;
     TButtSep5: TToolButton;
     DBCHKCerrada: TLFDBCheckBox;
     DBEConfirming: TLFDbedit;
     DBETituloConfirming: TLFDbedit;
     TButtCerrarConfirming: TToolButton;
     TButtAbrirConfirming: TToolButton;
     ToolButton1: TToolButton;
     TButtGeneraConfirming: TToolButton;
     PPFormatos: TPopUpTeclas;
     MIBBV: TMenuItem;
     MIBSantarder: TMenuItem;
     MIBCentralHispano: TMenuItem;
     MIBGuipuzcoano: TMenuItem;
     MIBdeValencia: TMenuItem;
     AImpresion: TAction;
     LFCategoryAction1: TLFCategoryAction;
     MIBBanesto: TMenuItem;
     DBEAsientoCierre: TLFDbedit;
     LAsientoCierre: TLFLabel;
     SBAsientoCierre: TSpeedButton;
     ALConfirming: TLFActionList;
     AAsientoCierre: TAction;
     ToolButton2: TToolButton;
     TButtDesvenceLineaConfirming: TToolButton;
     ADesvenceConfirming: TAction;
     PNLVerSaldos: TLFPanel;
     CBVerSaldos: TLFCheckBox;
     PNLSaldos: TLFPanel;
     LSaldoDeudor: TLFLabel;
     LSaldoAcreedor: TLFLabel;
     LSaldo: TLFLabel;
     DBESaldoDeudor: TLFDbedit;
     DBESaldoAcreedor: TLFDbedit;
     DBESaldo: TLFDbedit;
     MIBSabadell: TMenuItem;
     MIBankinter: TMenuItem;
     MIBPopular: TMenuItem;
     MILaCaixa: TMenuItem;
     DBEClasePago: TLFDbedit;
     LClasePago: TLFLabel;
     DBECodigoEstadistico: TLFDbedit;
     LCodigoEstadistico: TLFLabel;
     LTipoPagoConfirming: TLFLabel;
     DBRGTipoPago: TDBRadioGroup;
     MIBSantarderRev53: TMenuItem;
     LFCategoryAction2: TLFCategoryAction;
     ADesvenceLineaConfirming: TAction;
     SBABanco: TSpeedButton;
     ABancos: TAction;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure DBEFBancoChange(Sender: TObject);
     procedure TButtMostrarDisponiblesClick(Sender: TObject);
     procedure TButtSeleccionarTodasClick(Sender: TObject);
     procedure TButtCerrarConfirmingClick(Sender: TObject);
     procedure TButtAbrirConfirmingClick(Sender: TObject);
     procedure MIBBVClick(Sender: TObject);
     procedure MIBSantarderClick(Sender: TObject);
     procedure MIBCentralHispanoClick(Sender: TObject);
     procedure MIBGuipuzcoanoClick(Sender: TObject);
     procedure MIBdeValenciaClick(Sender: TObject);
     procedure EPDetalleClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AImpresionExecute(Sender: TObject);
     procedure MIBBanestoClick(Sender: TObject);
     procedure SBAsientoCierreDblClick(Sender: TObject);
     procedure AAsientoCierreExecute(Sender: TObject);
     procedure ADesvenceConfirmingExecute(Sender: TObject);
     procedure CBVerSaldosChange(Sender: TObject);
     procedure MIBSabadellClick(Sender: TObject);
     procedure MIBankinterClick(Sender: TObject);
     procedure MIBPopularClick(Sender: TObject);
     procedure MILaCaixaClick(Sender: TObject);
     procedure MIBSantarderRev53Click(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure ADesvenceLineaConfirmingExecute(Sender: TObject);
     procedure ABancosExecute(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure Iniciaformato(formato: smallint);
  public
     { Public declarations }
     procedure AjustaCheckConfirming(Confirming: integer);
  end;

var
  FMConfirming : TFMConfirming;

implementation

uses UDMConfirming, UDMMain, UUtiles, UFMListConfig, UFPregDatosCFM,
  UFPregConfirming, UFMain, UEntorno;

{$R *.DFM}

procedure TFMConfirming.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMConfirming, DMConfirming);
  NavMain.DataSource := DMConfirming.DSQMConfirming;
  DBGMain.DataSource := DMConfirming.DSQMConfirming;
  G2kTableLoc.DataSource := DMConfirming.DSQMConfirming;

  NavDetalle.DataSource := DMConfirming.DSQMDetalle;
  DBGFDetalle.DataSource := DMConfirming.DSQMDetalle;

  DMConfirming.Filtra;
  // Se asigna el PopUp del principal
  FMConfirming.PopupMenu := CEMainPMEdit;

  DBEAsientoCierre.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAsientoCierre, DBEAsientoCierre);
  DBETituloBanco.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBABanco, DBETituloBanco);

  CBVerSaldos.Checked := False;
  PNLVerSaldos.Visible := (DMMain.EstadoKri(217) = 1);
  CBVerSaldosChange(Self);
  DBRGTipoPago.Visible := (DMMain.EstadoKri(453) = 1);
  LTipoPagoConfirming.Visible := (DMMain.EstadoKri(453) = 1);

  ColActual := DBGFDetalle.Columns[0];
end;

procedure TFMConfirming.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMConfirming);
end;

procedure TFMConfirming.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMConfirming.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
end;

procedure TFMConfirming.DBEFBancoChange(Sender: TObject);
begin
  DMConfirming.CambiaBanco(StrToIntDef(DBEFBanco.Text, 0));
end;

procedure TFMConfirming.TButtMostrarDisponiblesClick(Sender: TObject);
begin
  DMConfirming.MostrarRecibosDisponibles;
end;

procedure TFMConfirming.AjustaCheckConfirming(Confirming: integer);
begin
  DBGFDetalle.ColumnasChecked.Strings[DBGFDetalle.ColumnasCheckBoxes.IndexOf('CONFIRMING')] :=
     IntToStr(Confirming);
end;

procedure TFMConfirming.TButtSeleccionarTodasClick(Sender: TObject);
begin
  DMConfirming.SeleccionaTodos;
end;

procedure TFMConfirming.TButtCerrarConfirmingClick(Sender: TObject);
begin
  if DBCHKCerrada.Checked then
     ShowMessage(_('El Confirming ya está cerrado.'))
  else
     DMConfirming.CierraConfirming;
end;

procedure TFMConfirming.TButtAbrirConfirmingClick(Sender: TObject);
begin
  if DBCHKCerrada.Checked then
     DMConfirming.AbreConfirming
  else
     ShowMessage(_('El Confirming ya está abierto.'));
end;

procedure TFMConfirming.MIBBVClick(Sender: TObject);
begin
  IniciaFormato(0);
end;

procedure TFMConfirming.MIBSantarderClick(Sender: TObject);
begin
  IniciaFormato(1);
end;

procedure TFMConfirming.MIBSantarderRev53Click(Sender: TObject);
begin
  IniciaFormato(10);
end;

procedure TFMConfirming.MIBCentralHispanoClick(Sender: TObject);
begin
  IniciaFormato(2);
end;

procedure TFMConfirming.MIBGuipuzcoanoClick(Sender: TObject);
begin
  IniciaFormato(3);
end;

procedure TFMConfirming.MIBdeValenciaClick(Sender: TObject);
begin
  IniciaFormato(4);
end;

procedure TFMConfirming.MIBBanestoClick(Sender: TObject);
begin
  IniciaFormato(5);
end;

procedure TFMConfirming.MIBSabadellClick(Sender: TObject);
begin
  IniciaFormato(6);
end;

procedure TFMConfirming.MIBankinterClick(Sender: TObject);
begin
  IniciaFormato(7);
end;

procedure TFMConfirming.MIBPopularClick(Sender: TObject);
begin
  IniciaFormato(8);
end;

procedure TFMConfirming.MILaCaixaClick(Sender: TObject);
begin
  IniciaFormato(9);
end;

procedure TFMConfirming.Iniciaformato(formato: smallint);
var
  idcedente : string;
  CantidadMonedas : integer;
  Moneda : string;
  LongitudCedente : integer;
begin
  idcedente := '';

  // Busco cantidad de monedas y moneda del confirming
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(DISTINCT(MONEDA)), MIN(MONEDA) FROM VER_CARTERA_CONFIRMING ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND ');
        SQL.Add(' EJERCICIO_CONFIRMING=?EJERCICIO AND ');
        SQL.Add(' CANAL=?CANAL AND ');
        SQL.Add(' SIGNO=''P'' AND ');
        SQL.Add(' CONFIRMING=?NUM_CONFIRMING ');
        Params.ByName['EMPRESA'].AsInteger := DMConfirming.QMConfirmingEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := DMConfirming.QMConfirmingEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := DMConfirming.QMConfirmingCANAL.AsInteger;
        Params.ByName['NUM_CONFIRMING'].AsInteger := DMConfirming.QMConfirmingNUM_CONFIRMING.AsInteger;
        ExecQuery;
        CantidadMonedas := FieldByName['COUNT'].AsInteger;
        Moneda := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (CantidadMonedas = 1) then
  begin
     // Busco el cedente por moneda
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT CEDENTE FROM EMP_BANCOS_CENDENTES_MONEDA ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' BANCO = ?BANCO AND ');
           SQL.Add(' MONEDA = ?MONEDA ');
           Params.ByName['EMPRESA'].AsInteger := DMConfirming.QMConfirmingEMPRESA.AsInteger;
           Params.ByName['BANCO'].AsInteger := DMConfirming.QMConfirmingBANCO.AsInteger;
           Params.ByName['MONEDA'].AsString := Moneda;
           ExecQuery;
           idcedente := FieldByName['CEDENTE'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (idcedente = '') then
  begin
     // Busco el cedente por defecto
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT CEDENTE_CONFIRMING FROM EMP_BANCOS WHERE EMPRESA=:EMPRESA AND BANCO=:BANCO';
           Params.ByName['EMPRESA'].AsInteger := DMConfirming.QMConfirmingEMPRESA.AsInteger;
           Params.ByName['BANCO'].AsInteger := DMConfirming.QMConfirmingBANCO.AsInteger;
           ExecQuery;
           idcedente := FieldByName['CEDENTE_CONFIRMING'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  case formato of
     0: LongitudCedente := 6;
     1: LongitudCedente := 2; // Santander
     2: LongitudCedente := 3;
     3: LongitudCedente := 2;
     4: LongitudCedente := 2;
     5: LongitudCedente := 10; // longitud idcedente Banesto
     6: LongitudCedente := 12;
     7: LongitudCedente := 20; // Bankinter debe poner el nro de contrato en el cedente (Ejemplo: '01289451360630018026' [EEEESSSSDDCCCCCCCCCC])
     8: LongitudCedente := 3;
     9: LongitudCedente := 10; // Número de contrato de Confirming [01NNNNNNDD]
     10: LongitudCedente := 3; // Santander Rev 5.3
     else
        LongitudCedente := 0;
  end;

  idcedente := Ajusta(idcedente, 'I', LongitudCedente, '0');

  with TFPregDatosCFM.Create(Self) do
  begin
     if Datos(idcedente) then
        DMConfirming.FormatoConfirming(formato, idcedente);
  end;
end;

procedure TFMConfirming.EPDetalleClickRango(Sender: TObject; var Continua: boolean);
begin
  DMConfirming.FiltraDetalle;
end;

procedure TFMConfirming.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMConfirming.BusquedaCompleja;
  Continua := False;
end;

procedure TFMConfirming.AImpresionExecute(Sender: TObject);
begin
  TFPregConfirming.Create(Self).Muestra;
end;

procedure TFMConfirming.AAsientoCierreExecute(Sender: TObject);
begin
  if (DMConfirming.QMConfirmingCERRADO.AsInteger = 1) then
     FMain.MuestraMovConta(' RIC= ' + DMConfirming.QMConfirmingRIC.AsString +
        ' AND EJERCICIO=' + DMConfirming.QMConfirmingEJERCICIO.AsString);
end;

procedure TFMConfirming.SBAsientoCierreDblClick(Sender: TObject);
begin
  AAsientoCierre.Execute;
end;

procedure TFMConfirming.ADesvenceConfirmingExecute(Sender: TObject);
begin
  DMConfirming.DesvenceConfirming;
end;

procedure TFMConfirming.ADesvenceLineaConfirmingExecute(Sender: TObject);
begin
  inherited;
  DMConfirming.DesvenceLineaConfirming;
end;

procedure TFMConfirming.CBVerSaldosChange(Sender: TObject);
begin
  DMConfirming.CalcularSaldo := CBVerSaldos.Checked;
  PNLSaldos.Visible := CBVerSaldos.Checked;
end;

procedure TFMConfirming.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMConfirming.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (DMConfirming.QMDetalleID_CARTERA.AsInteger <> 0) then
  begin
     if ((UpperCase(ColActual.FieldName) = 'DOC_NUMERO') or (UpperCase(ColActual.FieldName) = 'DOC_SERIE') or (UpperCase(ColActual.FieldName) = 'DOC_TIPO')) then
        FMain.TraspasoDeDocumentosEntrada(DMConfirming.QMDetalle.FieldByName('ID_DOC').AsInteger)
     else
     if (UpperCase(ColActual.FieldName) = 'REGISTRO') then
        FMain.MuestraCartera(DMConfirming.QMDetalleID_CARTERA.AsInteger)
     else
     if (UpperCase(ColActual.FieldName) = 'COD_CLI_PRO') then
     begin
        if ((DMConfirming.QMDetalleDOC_TIPO.AsString = 'FAP') or (DMConfirming.QMDetalleDOC_TIPO.AsString = 'AFP') or (DMConfirming.QMDetalleDOC_TIPO.AsString = 'NRP') or (DMConfirming.QMDetalleDOC_TIPO.AsString = '???')) then
           FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + DMConfirming.QMDetalle.FieldByName('COD_CLI_PRO').AsString)
        else
           FMain.EjecutaAccion(FMain.AAcreedores, 'ACREEDOR = ' + DMConfirming.QMDetalle.FieldByName('COD_CLI_PRO').AsString);
     end
     else
     if (UpperCase(ColActual.FieldName) = 'RIC_DESCUENTO') then
     begin
        if (DMConfirming.QMDetalleRIC_DESCUENTO.AsInteger <> 0) then
           FMain.MuestraMovConta(' RIC= ' + DMConfirming.QMDetalleRIC_DESCUENTO.AsString + ' AND EJERCICIO=' + DMConfirming.QMDetalleEJERCICIO_RIC_DESCUENTO.AsString);
     end;
  end;
end;

procedure TFMConfirming.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'DOC_NUMERO') or (UpperCase(ColActual.FieldName) = 'DOC_SERIE') or (UpperCase(ColActual.FieldName) = 'DOC_TIPO') or (UpperCase(ColActual.FieldName) = 'REGISTRO') or (UpperCase(ColActual.FieldName) = 'COD_CLI_PRO') or (UpperCase(ColActual.FieldName) = 'RIC_DESCUENTO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMConfirming.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMConfirming.ABancosExecute(Sender: TObject);
begin
  inherited;
  {$IFNDEF TPV}
  FMain.EjecutaAccion(FMain.ABancos,
     'BANCO = ' + IntToStr(DMConfirming.QMConfirmingBANCO.AsInteger));
  {$ENDIF}
end;

end.
