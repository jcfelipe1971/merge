unit UFMCuAnuales;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ToolWin, Grids, DBGrids, UHYDBGrid, DBCtrls, StdCtrls,
  Mask, UNavigator, Menus, UControlEdit, UTeclas, UFormGest,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, NsDBGrid, ULFToolBar,
  ULFDBEdit, ULFPanel, ULFCheckBox, ULFEditFind2000, TFlatCheckBoxUnit,
  ULFLabel, ULFEdit, rxPlacemnt, ULFFormStorage, UFPEditSinNavegador,
  ActnList, ULFActionList, UEditPanel, Buttons, rxToolEdit, ULFDateEdit,
  ULFDBEditFind2000, ULFDBCheckBox, RXDBCtrl, ULFDBDateEdit, HYFIBQuery,
  UFPEditSimple;

type
  TFMCuAnuales = class(TFPEditSimple)
     DBGMain: THYTDBGrid;
     LBLPeriodo: TLFLabel;
     LBLBalance: TLFLabel;
     ETituloPeriodo: TLFEdit;
     DEPeriodoDesde: TLFDateEdit;
     DEPeriodoHasta: TLFDateEdit;
     TButtDelete: TToolButton;
     TButtAlta: TToolButton;
     TButtConfirma: TToolButton;
     TButtCancela: TToolButton;
     TButtSeparador1: TToolButton;
     TButtExporta: TToolButton;
     TButtImprime: TToolButton;
     TButtPrevisu: TToolButton;
     TButtSeparador3: TToolButton;
     CBArratraApertura: TLFDBCheckBox;
     EFMoneda: TLFDBEditFind2000;
     LMoneda: TLFLabel;
     ETituloMoneda: TLFEdit;
     SBMultiBalance: TSpeedButton;
     LMultiseleccion: TLFLabel;
     LEmpresaAConsolidar: TLFLabel;
     EFEmpresaAConsolidar: TLFEditFind2000;
     EEmpresaAConsolidar: TLFEdit;
     TBComprobar: TToolButton;
     LCentroCoste: TLFLabel;
     EFDigito1: TLFDBEditFind2000;
     EFDigito2: TLFDBEditFind2000;
     EFDigito3: TLFDBEditFind2000;
     EFDigito4: TLFDBEditFind2000;
     EFDigito5: TLFDBEditFind2000;
     B1: TToolButton;
     TBExportacionBalanceCierreExcel: TToolButton;
     AAlta: TAction;
     AConfirma: TAction;
     ACancela: TAction;
     AImprimir: TAction;
     APrevisualizar: TAction;
     ABorrar: TAction;
     AComprobar: TAction;
     AExportacionBalanceCierreExcel: TAction;
     AExportacionBalancePerdidasYGananciasExcel: TAction;
     TBExportacionBalancePerdidasYGananciasExcel: TToolButton;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     PNLProgreso: TLFPanel;
     ProgressBar: TProgressBar;
     ARecreaCuentasAnuales31: TAction;
     ARecreaCuentasAnuales32: TAction;
     ARecreaCuentasAnuales33: TAction;
     ARecreaCuentasAnuales34: TAction;
     ARecreaCuentasAnuales35: TAction;
     LComentario: TLFLabel;
     EComentario: TLFDBEdit;
     DTPFecha: TLFDBDateEdit;
     LFecha: TLFLabel;
     EFBalance: TLFDBEditFind2000;
     ETituloBalance: TLFEdit;
     EFPeriodo: TLFDBEditFind2000;
     PNLEdit: TLFPanel;
     TBMultiBalance: TToolButton;
     AMultiBalance: TAction;
     DBEMultiCanal: TLFDbedit;
     LFCategoryAction3: TLFCategoryAction;
     LFCategoryAction4: TLFCategoryAction;
     LFCategoryAction5: TLFCategoryAction;
     LFCategoryAction6: TLFCategoryAction;
     LFCategoryAction7: TLFCategoryAction;
     PNLArrastre: TLFPanel;
     CBArrastre: TLFCheckBox;
     TBSep2: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFMonedaChange(Sender: TObject);
     procedure EFMonedaExit(Sender: TObject);
     procedure EFEmpresaAConsolidarChange(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure APrevisualizarExecute(Sender: TObject);
     procedure AComprobarExecute(Sender: TObject);
     procedure AExportacionBalanceCierreExcelExecute(Sender: TObject);
     procedure AExportacionBalancePerdidasYGananciasExcelExecute(Sender: TObject);
     procedure ARecreaCuentasAnuales31Execute(Sender: TObject);
     procedure ARecreaCuentasAnuales32Execute(Sender: TObject);
     procedure ARecreaCuentasAnuales33Execute(Sender: TObject);
     procedure ARecreaCuentasAnuales34Execute(Sender: TObject);
     procedure ARecreaCuentasAnuales35Execute(Sender: TObject);
     procedure EFBalanceBusqueda(Sender: TObject);
     procedure EFBalanceChange(Sender: TObject);
     procedure EFPeriodoChange(Sender: TObject);
     procedure CBArratraAperturaChange(Sender: TObject);
     procedure DBGMainDblClick(Sender: TObject);
     procedure AMultiBalanceExecute(Sender: TObject);
     procedure ACrearCuentaAnual31Execute(Sender: TObject);
     procedure ACrearCuentaAnual32Execute(Sender: TObject);
     procedure ACrearCuentaAnual33Execute(Sender: TObject);
     procedure ACrearCuentaAnual34Execute(Sender: TObject);
     procedure ACrearCuentaAnual35Execute(Sender: TObject);
  private
     { Private declarations }
     PedirDatos: boolean;
     procedure RecreaCuentasAnuales(Balance: integer);
     procedure CreaCuentasAnuales(Balance, Periodo: integer);
  public
     { Public declarations }
     cuenta_existencias_kri: string;
     importe_existencias_kri: double;
     nivel_kri: integer;
     procedure ExportarBalanceCierreExcel(Archivo: string);
     procedure ExportarBalancePerdidasYGananciasExcel(Archivo: string);
  end;

var
  FMCuAnuales : TFMCuAnuales;

implementation

uses UDMCuAnuales, UFPregCuAnuales, UDMMain, UEntorno,
  UFMListConfig, UFMultiBalances, UUtiles, UHojaCalc, UParam, UDameDato;

{$R *.DFM}

procedure TFMCuAnuales.FormCreate(Sender: TObject);
var
  i : integer;
  a : TAction;
  Periodo : string;
begin
  for i := 1 to 20 do
  begin
     Periodo := format('%.2d', [i]);
     a := TAction.Create(ALMain);
     with a do
     begin
        Name := format('ACrearCuentaAnual31_%s', [Periodo]);
        Category := 'Procesos;"CrearCuentaAnual31"';
        ImageIndex := 3;
        Caption := format(_('(%s) %s'), [Periodo, DameTituloPeriodo(Periodo)]);
        Hint := Caption;
        Tag := i;
        a.ActionList := ALMain;
        OnExecute := ACrearCuentaAnual31Execute;
     end;

     a := TAction.Create(ALMain);
     with a do
     begin
        Name := format('ACrearCuentaAnual32_%s', [Periodo]);
        Category := 'Procesos;"CrearCuentaAnual32"';
        ImageIndex := 3;
        Caption := format(_('(%s) %s'), [Periodo, DameTituloPeriodo(Periodo)]);
        Hint := Caption;
        Tag := i;
        a.ActionList := ALMain;
        OnExecute := ACrearCuentaAnual32Execute;
     end;

     a := TAction.Create(ALMain);
     with a do
     begin
        Name := format('ACrearCuentaAnual33_%s', [Periodo]);
        Category := 'Procesos;"CrearCuentaAnual33"';
        ImageIndex := 3;
        Caption := format(_('(%s) %s'), [Periodo, DameTituloPeriodo(Periodo)]);
        Hint := Caption;
        Tag := i;
        a.ActionList := ALMain;
        OnExecute := ACrearCuentaAnual33Execute;
     end;

     a := TAction.Create(ALMain);
     with a do
     begin
        Name := format('ACrearCuentaAnual34_%s', [Periodo]);
        Category := 'Procesos;"CrearCuentaAnual34"';
        ImageIndex := 3;
        Caption := format(_('(%s) %s'), [Periodo, DameTituloPeriodo(Periodo)]);
        Hint := Caption;
        Tag := i;
        a.ActionList := ALMain;
        OnExecute := ACrearCuentaAnual34Execute;
     end;

     a := TAction.Create(ALMain);
     with a do
     begin
        Name := format('ACrearCuentaAnual35_%s', [Periodo]);
        Category := 'Procesos;"CrearCuentaAnual35"';
        ImageIndex := 3;
        Caption := format(_('(%s) %s'), [Periodo, DameTituloPeriodo(Periodo)]);
        Hint := Caption;
        Tag := i;
        a.ActionList := ALMain;
        OnExecute := ACrearCuentaAnual35Execute;
     end;
  end;

  inherited;
  AbreData(TDMCuAnuales, DMCuAnuales);

  NavMain.DataSource := DMCuAnuales.DSQMCuentasAn;
  DBGMain.DataSource := DMCuAnuales.DSQMCuentasAn;

  {
  SMInsertar.ShortCut := DMMain.Teclas.FscInsert;
  SMBorrar.ShortCut := DMMain.Teclas.FscDelete;
  SMConfirmar.ShortCut := DMMain.Teclas.FscPost;
  SMCancelar.ShortCut := DMMain.Teclas.FscCancel;
  // SMExportar.ShortCut
  SMImprimir.ShortCut := DMMain.Teclas.FscImprime;
  SMVisualizar.ShortCut := DMMain.Teclas.FscRefresh;
  SMSalir.ShortCut := DMMain.Teclas.FscSalir;
  }

  // EFMoneda.Text := REntorno.Moneda;
  PedirDatos := True;
  PNLProgreso.Visible := False;

  PNLEdit.Height := EFDigito1.Top + EFDigito1.Height + 3;
  PNLEdit.Enabled := False;

  // Asigno Imagenes a botones
  GetBitmapFromImageList(SBMultiBalance, 1, DMMain.ILMain_Ac, 140);
end;

procedure TFMCuAnuales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCuAnuales);
end;

procedure TFMCuAnuales.DBGMainKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     DMCuAnuales.VisualizaBalance;
end;

procedure TFMCuAnuales.EFMonedaChange(Sender: TObject);
begin
  ETituloMoneda.Text := DameTituloMoneda(EFMoneda.Text);
end;

procedure TFMCuAnuales.EFMonedaExit(Sender: TObject);
begin
  if EFMoneda.Text = '' then
     EFMoneda.Text := REntorno.Moneda;
end;

procedure TFMCuAnuales.EFEmpresaAConsolidarChange(Sender: TObject);
begin
  if (StrToIntDef(EFEmpresaAConsolidar.Text, 0) > 0) then
     EEmpresaAConsolidar.Text := DameTituloEmpresa(StrToIntDef(EFEmpresaAConsolidar.Text, 0));
end;

procedure TFMCuAnuales.AImprimirExecute(Sender: TObject);
begin
  inherited;

  if (DMCuAnuales.QMCuentasAn.RecordCount > 0) then
  begin
     FPregCuAnuales := TFPregCuAnuales.Create(Self);
     FPregCuAnuales.ShowModal;
  end;
end;

procedure TFMCuAnuales.APrevisualizarExecute(Sender: TObject);
begin
  inherited;

  DMCuAnuales.VisualizaBalance;
end;

procedure TFMCuAnuales.AComprobarExecute(Sender: TObject);
begin
  inherited;

  DMCuAnuales.MostrarListadoComprobacion(0);
end;

procedure TFMCuAnuales.AExportacionBalanceCierreExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  // Exportacion de Balance de Cierre PYME

  AExportacionBalanceCierreExcel.Enabled := False;
  try
     Archivo := Format(_('Balance_Cierre-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMCuAnuales') then
     begin
        ExportarBalanceCierreExcel(Archivo);
     end;
  finally
     AExportacionBalanceCierreExcel.Enabled := True;
     PNLProgreso.Visible := False;
  end;
end;

procedure TFMCuAnuales.ExportarBalanceCierreExcel(Archivo: string);
var
  HCalc : THojaCalc;
  f, c, i, o : integer;
  Cuenta : string;
  Periodo : string;
begin
  inherited;
  // Exportacion de Balance de Cierre PYME

  if (Trim(Archivo) > '') then
  begin
     RecreaCuentasAnuales(31);

     // Vuelvo a hacer visible la barra de progreso
     PNLProgreso.Visible := True;
     ProgressBar.Max := 14 + 28;
     ProgressBar.Position := 14;

     try
        // Me posiciono en el balance del mes 1
        with DMCuAnuales.QMCuentasAn do
        begin
           DisableControls;
           try
              First;
              while ((not EOF) and ((FieldByName('PERIODO').AsString <> '01') or (FieldByName('BALANCE').AsInteger <> 31))) do
                 Next;
           finally
              EnableControls;
           end;
        end;

        // Borro fichero antes de volver a crearlo.
        DeleteFile(Archivo);

        DMMain.Log('THojaCalc.Create');
        // Esto mira si el nombre del archivo contienen .xls (.xls, .xlsx);
        if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
           HCalc := THojaCalc.Create(thcExcel, False)
        else
           HCalc := THojaCalc.Create(thcOpenOffice, False);

        try
           HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

           DMMain.Log('Creacion de Sheets Activo+Pasivo');
           // Dos Hojas, Activo y Pasivo
           HCalc.ActivateSheetByIndex(1);
           HCalc.ActiveSheetName := _('Activo');
           if (HCalc.Document.Sheets.Count < 2) then
              HCalc.AddNewSheet(_('Pasivo'))
           else
           begin
              HCalc.ActivateSheetByIndex(2);
              HCalc.ActiveSheetName := _('Pasivo');
           end;

           DMMain.Log('ActivateSheetByIndex(1)');
           // Exportacion de Balance de Cierre PYME (ACTIVO)
           HCalc.ActivateSheetByIndex(1);

           // Primera fila, los periodos
           DMMain.Log('Titulo + Periodos');
           f := 1;
           c := 1;
           HCalc.CellText[f, c] := DMCuAnuales.QMCuentasAnB_TITULO.AsString;
           HCalc.FontSize(f, c, 14);
           HCalc.Bold(f, c);
           Inc(f);

           HCalc.CellText[f, c] := _('Activo');
           HCalc.FontSize(f, c, 14);
           HCalc.Bold(f, c);
           Inc(f);

           for c := 1 to 14 do
           begin
              case c of
                 1..12: Periodo := Format('%.2d', [c]);
                 13: Periodo := '19';
                 14: Periodo := '20';
              end;

              HCalc.CellText[f, c + 1] := Format('M %s-%d', [Periodo, REntorno.Ejercicio]);
              HCalc.Bold(f, c + 1);
              HCalc.ColumnWidth(c + 1, 3000);
              HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

              HCalc.CellText[f, c + 16] := Format('M %s-%d', [Periodo, REntorno.Ejercicio - 1]);
              HCalc.Bold(f, c + 16);
              HCalc.ColumnWidth(c + 16, 3000);
              HCalc.ColNumberFormat(c + 16, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
           end;
           (*
           HCalc.CellText[f, 14] := Format('Total %d', [REntorno.Ejercicio]);
           HCalc.Bold(f, 14);
           HCalc.ColumnWidth(14, 3000);
           HCalc.BackgroundColor(f, 14, clYellow);
           HCalc.ColNumberFormat(14, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

           HCalc.CellText[f, 27] := Format('Total %d', [REntorno.Ejercicio - 1]);
           HCalc.Bold(f, 27);
           HCalc.ColumnWidth(27, 3000);
           HCalc.BackgroundColor(f, 27, clYellow);
           HCalc.ColNumberFormat(27, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
           *)

           // HCalc.NumberFormat ('B:AA', '#'+ThousandSeparator+'##0'+DecimalSeparator+'00');

           for i := 1 to 14 do
           begin
              ProgressBar.StepIt;
              case i of
                 1..12: Periodo := Format('%.2d', [i]);
                 13: Periodo := '19';
                 14: Periodo := '20';
              end;

              f := 3;
              DMMain.LogIni('Exportando Balance de Cierre PYME - Activo (' + IntToStr(i) + ')');
              // Me posiciono en el balance del mes
              with DMCuAnuales.QMCuentasAn do
              begin
                 DisableControls;
                 try
                    First;
                    while ((not EOF) and ((FieldByName('PERIODO').AsString <> Periodo) or (FieldByName('BALANCE').AsInteger <> 31))) do
                       Next;
                 finally
                    EnableControls;
                 end;
                 DMMain.Log('Posicionado en (' + Periodo + ') Periodo: ' + FieldByName('PERIODO').AsString + ' Balance: ' + FieldByName('BALANCE').AsString);
              end;

              // Abre tablas
              DMMain.LogIni('CalculaInforme');
              DMCuAnuales.CalculaInforme(True);
              DMMain.LogFin('CalculaInforme');

              // Excribo en Excel

              Inc(f);
              c := 1;
              with DMCuAnuales.xVerBalanceHaber do
              begin
                 First;
                 DMMain.LogIni('Exportando xVerBalanceHaber');
                 while not EOF do
                 begin
                    DMMain.Log(FieldByName('TITULO').AsString + '\' + FieldByName('ACTUAL').AsString + '\' + FieldByName('ANTERIOR').AsString);
                    HCalc.CellText[f, c] := Trim(FieldByName('TITULO').AsString);
                    HCalc.BackgroundColor(f, c, clSilver);

                    (*
                    // Si no es un Rotulo, que salgan los totales
                    if ((FieldByName('TIPO').AsString = 'L') or (FieldByName('TIPO').AsString = 'T')) then
                    begin
                       HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                       HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                       HCalc.BackgroundColor(f, 14, clYellow);
                       HCalc.BackgroundColor(f, 27, clYellow);
                    end;
                    *)

                    // Si es un Rotulo o Total o "S", que salgan en negrita
                    if ((FieldByName('TIPO').AsString = 'R') or (FieldByName('TIPO').AsString = 'T') or (FieldByName('TIPO').AsString = 'S')) then
                    begin
                       DMMain.Log('Bold');
                       HCalc.FontSize(f, c, 12);
                       HCalc.Bold(f, c);
                    end;

                    // Offset de la columan segun periodo
                    o := StrToInt(FieldByName('PERIODO').AsString);
                    if (o = 19) then
                       o := 13;
                    if (o = 20) then
                       o := 14;

                    // Si es una Linea o Total o "S", se muestran valores del periodo
                    if ((FieldByName('TIPO').AsString = 'L') or (FieldByName('TIPO').AsString = 'T') or (FieldByName('TIPO').AsString = 'S')) then
                    begin
                       DMMain.Log('Bold+Nro ' + FieldByName('TIPO').AsString + ' ' + FieldByName('PERIODO').AsString);
                       HCalc.FontSize(f, c + o, 12);
                       HCalc.Bold(f, c + o);
                       HCalc.Bold(f, c + 15 + o);
                       HCalc.SendNumber(f, c + o, FieldByName('ACTUAL').AsFloat);
                       HCalc.SendNumber(f, c + 15 + o, FieldByName('ANTERIOR').AsFloat);
                    end;
                    Inc(f);

                    with DMCuAnuales.xVerBalanceHaberCuentasExportacion do
                    begin
                       DMMain.LogIni('Exportando xVerBalanceHaberCuentasExportacion');
                       Close;
                       Open;
                       First;
                       Cuenta := FieldByName('CUENTA').AsString;
                       while not EOF do
                       begin
                          // Offset de la columan segun periodo
                          o := StrToInt(FieldByName('PERIODO').AsString);
                          if (o = 19) then
                             o := 13;
                          if (o = 20) then
                             o := 14;

                          DMMain.Log(IntToStr(f) + ' - ' + FieldByName('PERIODO').AsString + '\' + FieldByName('CUENTA').AsString + '\' + FieldByName('TITULO').AsString + '\' + FieldByName('ACTUAL').AsString + '\' + FieldByName('ANTERIOR').AsString);
                          HCalc.CellText[f, c] := FieldByName('CUENTA').AsString + ' ' + FieldByName('TITULO').AsString;
                          HCalc.SendNumber(f, c + o, FieldByName('ACTUAL').AsFloat);
                          HCalc.SendNumber(f, c + 15 + o, FieldByName('ANTERIOR').AsFloat);

                          Next;

                          // Salto de fila si cambia la cuenta
                          if (Cuenta <> FieldByName('CUENTA').AsString) then
                          begin
                             (*
                             HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                             HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                             HCalc.BackgroundColor(f, 14, clYellow);
                             HCalc.BackgroundColor(f, 27, clYellow);
                             *)
                             Inc(f);
                             Cuenta := FieldByName('CUENTA').AsString;
                          end;
                       end;
                       (*
                       HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                       HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                       HCalc.BackgroundColor(f, 14, clYellow);
                       HCalc.BackgroundColor(f, 27, clYellow);
                       *)
                       Close;
                       DMMain.LogFin('Exportando xVerBalanceHaberCuentasExportacion');
                    end;

                    Next;

                    Inc(f);
                 end;
                 DMMain.LogFin('Exportando xVerBalanceHaber');
              end;
              DMMain.LogFin('Exportando Balance de Cierre PYME - Activo(' + IntToStr(i) + ')');
           end;

           // Primera columna contiene textos largos
           HCalc.AutoFit(1);

           // Exportacion de Balance de Cierre PYME (PASIVO)
           HCalc.ActivateSheetByIndex(2);

           // Primera fila, los periodos
           DMMain.Log('Titulo + Periodos');
           f := 1;
           c := 1;
           HCalc.CellText[f, c] := DMCuAnuales.QMCuentasAnB_TITULO.AsString;
           HCalc.FontSize(f, c, 14);
           HCalc.Bold(f, c);
           Inc(f);

           HCalc.CellText[f, c] := _('Pasivo');
           HCalc.FontSize(f, c, 14);
           HCalc.Bold(f, c);
           Inc(f);

           for c := 1 to 14 do
           begin
              case c of
                 1..12: Periodo := Format('%.2d', [c]);
                 13: Periodo := '19';
                 14: Periodo := '20';
              end;

              HCalc.CellText[f, c + 1] := Format('M %s-%d', [Periodo, REntorno.Ejercicio]);
              HCalc.Bold(f, c + 1);
              HCalc.ColumnWidth(c + 1, 3000);
              HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
              HCalc.CellText[f, c + 16] := Format('M %s-%d', [Periodo, REntorno.Ejercicio - 1]);
              HCalc.Bold(f, c + 16);
              HCalc.ColumnWidth(c + 16, 3000);
              HCalc.ColNumberFormat(c + 16, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
           end;
           (*
           HCalc.CellText[f, 14] := Format('Total %d', [REntorno.Ejercicio]);
           HCalc.Bold(f, 14);
           HCalc.ColumnWidth(14, 3000);
           HCalc.BackgroundColor(f, 14, clYellow);
           HCalc.ColNumberFormat(14, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

           HCalc.CellText[f, 27] := Format('Total %d', [REntorno.Ejercicio - 1]);
           HCalc.Bold(f, 27);
           HCalc.ColumnWidth(27, 3000);
           HCalc.BackgroundColor(f, 27, clYellow);
           HCalc.ColNumberFormat(27, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
           *)

           for i := 1 to 14 do
           begin
              ProgressBar.StepIt;
              case i of
                 1..12: Periodo := Format('%.2d', [i]);
                 13: Periodo := '19';
                 14: Periodo := '20';
              end;

              f := 3;
              DMMain.LogIni('Exportando Balance de Cierre PYME - Pasivo (' + IntToStr(i) + ')');
              // Me posiciono en el balance del mes
              with DMCuAnuales.QMCuentasAn do
              begin
                 DisableControls;
                 try
                    First;
                    while ((not EOF) and ((FieldByName('PERIODO').AsString <> Periodo) or (FieldByName('BALANCE').AsInteger <> 31))) do
                       Next;
                 finally
                    EnableControls;
                 end;
                 DMMain.Log('Posicionado en (' + Periodo + ') Periodo: ' + FieldByName('PERIODO').AsString + ' Balance: ' + FieldByName('BALANCE').AsString);
              end;

              // Abre tablas
              DMMain.LogIni('CalculaInforme');
              DMCuAnuales.CalculaInforme(True);
              DMMain.LogFin('CalculaInforme');

              Inc(f);
              c := 1;
              with DMCuAnuales.xVerBalanceDebe do
              begin
                 First;
                 DMMain.LogIni('Exportando xVerBalanceDebe');
                 while not EOF do
                 begin
                    DMMain.Log(FieldByName('TITULO').AsString + '\' + FieldByName('ACTUAL').AsString + '\' + FieldByName('ANTERIOR').AsString);
                    HCalc.CellText[f, c] := Trim(FieldByName('TITULO').AsString);
                    HCalc.BackgroundColor(f, c, clSilver);

                    (*
                    // Si no es un Rotulo, que salgan los totales
                    if ((FieldByName('TIPO').AsString = 'L') or (FieldByName('TIPO').AsString = 'T')) then
                    begin
                       HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                       HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                       HCalc.BackgroundColor(f, 14, clYellow);
                       HCalc.BackgroundColor(f, 27, clYellow);
                    end;
                    *)

                    // Si es un Rotulo o Total o "S", que salgan en negrita
                    if ((FieldByName('TIPO').AsString = 'R') or (FieldByName('TIPO').AsString = 'T') or (FieldByName('TIPO').AsString = 'S')) then
                    begin
                       DMMain.Log('Bold');
                       HCalc.FontSize(f, c, 12);
                       HCalc.Bold(f, c);
                    end;

                    // Offset de la columan segun periodo
                    o := StrToInt(FieldByName('PERIODO').AsString);
                    if (o = 19) then
                       o := 13;
                    if (o = 20) then
                       o := 14;
                    // Si es una Linea o Total o "S", se muestran valores del periodo
                    if ((FieldByName('TIPO').AsString = 'L') or (FieldByName('TIPO').AsString = 'T') or (FieldByName('TIPO').AsString = 'S')) then
                    begin
                       DMMain.Log('Bold+Nro ' + FieldByName('TIPO').AsString + ' ' + FieldByName('PERIODO').AsString);
                       HCalc.FontSize(f, c + o, 12);
                       HCalc.Bold(f, c + o);
                       HCalc.Bold(f, c + 15 + o);
                       HCalc.SendNumber(f, c + o, FieldByName('ACTUAL').AsFloat);
                       HCalc.SendNumber(f, c + 15 + o, FieldByName('ANTERIOR').AsFloat);
                    end;
                    Inc(f);

                    with DMCuAnuales.xVerBalanceDebeCuentasExportacion do
                    begin
                       DMMain.LogIni('Exportando xVerBalanceDebeCuentasExportacion');
                       Close;
                       Open;
                       First;
                       Cuenta := FieldByName('CUENTA').AsString;
                       while not EOF do
                       begin
                          // Offset de la columan segun periodo
                          o := StrToInt(FieldByName('PERIODO').AsString);
                          if (o = 19) then
                             o := 13;
                          if (o = 20) then
                             o := 14;
                          DMMain.Log(IntToStr(f) + ' - ' + FieldByName('PERIODO').AsString + '\' + FieldByName('CUENTA').AsString + '\' + FieldByName('TITULO').AsString + '\' + FieldByName('ACTUAL').AsString + '\' + FieldByName('ANTERIOR').AsString);
                          HCalc.CellText[f, c] := FieldByName('CUENTA').AsString + ' ' + FieldByName('TITULO').AsString;
                          HCalc.SendNumber(f, c + o, FieldByName('ACTUAL').AsFloat);
                          HCalc.SendNumber(f, c + 15 + o, FieldByName('ANTERIOR').AsFloat);

                          Next;

                          // Salto de fila si cambia la cuenta
                          if (Cuenta <> FieldByName('CUENTA').AsString) then
                          begin
                             (*
                             HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                             HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                             HCalc.BackgroundColor(f, 14, clYellow);
                             HCalc.BackgroundColor(f, 27, clYellow);
                             *)
                             Inc(f);
                             Cuenta := FieldByName('CUENTA').AsString;
                          end;
                       end;
                       (*
                       HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                       HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                       HCalc.BackgroundColor(f, 14, clYellow);
                       HCalc.BackgroundColor(f, 27, clYellow);
                       *)
                       Close;
                       DMMain.LogFin('Exportando xVerBalanceDebeCuentasExportacion');
                    end;

                    Next;

                    Inc(f);
                 end;
                 DMMain.LogFin('Exportando xVerBalanceDebe');
              end;
              DMMain.LogFin('Exportando Balance de Cierre PYME - Pasivo (' + IntToStr(i) + ')');
           end;

           // Primera columna contiene textos largos
           HCalc.AutoFit(1);

           DMMain.Log('Guardando ' + Archivo);
           HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
        finally
           DMMain.Log('THojaCalc.Free');
           HCalc.Free;
        end;
     finally
        PNLProgreso.Visible := False;
     end;
  end;
end;

procedure TFMCuAnuales.AExportacionBalancePerdidasYGananciasExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  // Exportacion de Perdidas y Ganancias PYME
  AExportacionBalancePerdidasYGananciasExcel.Enabled := False;
  try
     Archivo := Format(_('Perdidas_Y_Ganancias-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMCuAnuales') then
     begin
        ExportarBalancePerdidasYGananciasExcel(Archivo);
     end;
  finally
     AExportacionBalancePerdidasYGananciasExcel.Enabled := True;
  end;
end;

procedure TFMCuAnuales.ExportarBalancePerdidasYGananciasExcel(Archivo: string);
var
  HCalc : THojaCalc;
  f, c, i, o : integer;
  Cuenta : string;
  Periodo : string;
begin
  inherited;
  // Exportacion de Perdidas y Ganancias PYME
  if (Trim(Archivo) > '') then
  begin
     RecreaCuentasAnuales(32);

     // Vuelvo a hacer visible la barra de progreso
     PNLProgreso.Visible := True;
     ProgressBar.Max := 14 + 28;
     ProgressBar.Position := 14;

     try
        // Me posiciono en el balance del mes 1
        with DMCuAnuales.QMCuentasAn do
        begin
           DisableControls;
           try
              First;
              while ((not EOF) and ((FieldByName('PERIODO').AsString <> '01') or (FieldByName('BALANCE').AsInteger <> 32))) do
                 Next;
           finally
              EnableControls;
           end;
        end;

        // Borro fichero antes de volver a crearlo.
        DeleteFile(Archivo);

        if (UpperCase(ExtractFileExt(Archivo)) = '.XLS') then
           HCalc := THojaCalc.Create(thcExcel, False)
        else
           HCalc := THojaCalc.Create(thcOpenOffice, False);

        try
           HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

           DMMain.Log('Creacion de Sheets Debe+Haber');
           // Dos Hojas, Activo y Pasivo
           HCalc.ActivateSheetByIndex(1);
           HCalc.ActiveSheetName := _('Debe');
           if (HCalc.Document.Sheets.Count < 2) then
              HCalc.AddNewSheet(_('Haber'))
           else
           begin
              HCalc.ActivateSheetByIndex(2);
              HCalc.ActiveSheetName := _('Haber');
           end;

           DMMain.Log('ActivateSheetByIndex(1)');
           // Exportacion de Balance de Cierre PYME (DEBE)
           HCalc.ActivateSheetByIndex(1);

           // Primera fila, los periodos
           DMMain.Log('Titulo + Periodos');
           f := 1;
           c := 1;
           HCalc.CellText[f, c] := DMCuAnuales.QMCuentasAnB_TITULO.AsString;
           HCalc.FontSize(f, c, 14);
           HCalc.Bold(f, c);
           Inc(f);

           HCalc.CellText[f, c] := _('Debe');
           HCalc.FontSize(f, c, 14);
           HCalc.Bold(f, c);
           Inc(f);

           for c := 1 to 14 do
           begin
              case c of
                 1..12: Periodo := Format('%.2d', [c]);
                 13: Periodo := '19';
                 14: Periodo := '20';
              end;

              HCalc.CellText[f, c + 1] := Format('M %s-%d', [Periodo, REntorno.Ejercicio]);
              HCalc.Bold(f, c + 1);
              HCalc.ColumnWidth(c + 1, 3000);
              HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

              HCalc.CellText[f, c + 16] := Format('M %s-%d', [Periodo, REntorno.Ejercicio - 1]);
              HCalc.Bold(f, c + 16);
              HCalc.ColumnWidth(c + 16, 3000);
              HCalc.ColNumberFormat(c + 16, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
           end;
           (*
           HCalc.CellText[f, 14] := Format('Total %d', [REntorno.Ejercicio]);
           HCalc.Bold(f, 14);
           HCalc.ColumnWidth(14, 3000);
           HCalc.BackgroundColor(f, 14, clYellow);
           HCalc.ColNumberFormat(14, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

           HCalc.CellText[f, 27] := Format('Total %d', [REntorno.Ejercicio - 1]);
           HCalc.Bold(f, 27);
           HCalc.ColumnWidth(27, 3000);
           HCalc.BackgroundColor(f, 27, clYellow);
           HCalc.ColNumberFormat(27, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
           *)

           // HCalc.NumberFormat ('B:AA', '#'+ThousandSeparator+'##0'+DecimalSeparator+'00');

           for i := 1 to 14 do
           begin
              ProgressBar.StepIt;
              case i of
                 1..12: Periodo := Format('%.2d', [i]);
                 13: Periodo := '19';
                 14: Periodo := '20';
              end;

              f := 3;
              DMMain.LogIni('Exportando Balance de Perdidas y Ganancias PYME - Debe (' + IntToStr(i) + ')');
              // Me posiciono en el balance del mes
              with DMCuAnuales.QMCuentasAn do
              begin
                 DisableControls;
                 try
                    First;
                    while ((not EOF) and ((FieldByName('PERIODO').AsString <> Periodo) or (FieldByName('BALANCE').AsInteger <> 32))) do
                       Next;
                 finally
                    EnableControls;
                 end;
                 DMMain.Log('Posicionado en (' + Periodo + ') Periodo: ' + FieldByName('PERIODO').AsString + ' Balance: ' + FieldByName('BALANCE').AsString);
              end;

              // Abre tablas
              DMMain.LogIni('CalculaInforme');
              DMCuAnuales.CalculaInforme(True);
              DMMain.LogFin('CalculaInforme');

              // Excribo en Excel

              Inc(f);
              c := 1;
              with DMCuAnuales.xVerBalanceDebe do
              begin
                 First;
                 DMMain.LogIni('Exportando xVerBalanceHaberDebe');
                 while not EOF do
                 begin
                    DMMain.Log(FieldByName('TITULO').AsString + '\' + FieldByName('ACTUAL').AsString + '\' + FieldByName('ANTERIOR').AsString);
                    HCalc.CellText[f, c] := Trim(FieldByName('TITULO').AsString);
                    HCalc.BackgroundColor(f, c, clSilver);

                    (*
                    // Si no es un Rotulo, que salgan los totales
                    if ((FieldByName('TIPO').AsString = 'L') or (FieldByName('TIPO').AsString = 'T')) then
                    begin
                       HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                       HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                       HCalc.BackgroundColor(f, 14, clYellow);
                       HCalc.BackgroundColor(f, 27, clYellow);
                    end;
                    *)

                    // Si es un Rotulo o Total o "S", que salgan en negrita
                    if ((FieldByName('TIPO').AsString = 'R') or (FieldByName('TIPO').AsString = 'T') or (FieldByName('TIPO').AsString = 'S')) then
                    begin
                       DMMain.Log('Bold');
                       HCalc.FontSize(f, c, 12);
                       HCalc.Bold(f, c);
                    end;

                    // Offset de la columan segun periodo
                    o := StrToInt(FieldByName('PERIODO').AsString);
                    if (o = 19) then
                       o := 13;
                    if (o = 20) then
                       o := 14;

                    // Si es una Linea o Total o "S", se muestran valores del periodo
                    if ((FieldByName('TIPO').AsString = 'L') or (FieldByName('TIPO').AsString = 'T') or (FieldByName('TIPO').AsString = 'S')) then
                    begin
                       DMMain.Log('Bold+Nro ' + FieldByName('TIPO').AsString + ' ' + FieldByName('PERIODO').AsString);
                       HCalc.FontSize(f, c + o, 12);
                       HCalc.Bold(f, c + o);
                       HCalc.Bold(f, c + 15 + o);
                       HCalc.SendNumber(f, c + o, FieldByName('ACTUAL').AsFloat);
                       HCalc.SendNumber(f, c + 15 + o, FieldByName('ANTERIOR').AsFloat);
                    end;
                    Inc(f);

                    with DMCuAnuales.xVerBalanceDebeCuentasExportacion do
                    begin
                       DMMain.LogIni('Exportando xVerBalanceDebeCuentasExportacion');
                       Close;
                       Open;
                       First;
                       Cuenta := FieldByName('CUENTA').AsString;
                       while not EOF do
                       begin
                          o := StrToInt(FieldByName('PERIODO').AsString);
                          if (o = 19) then
                             o := 13;
                          if (o = 20) then
                             o := 14;
                          DMMain.Log(IntToStr(f) + ' - ' + FieldByName('PERIODO').AsString + '\' + FieldByName('CUENTA').AsString + '\' + FieldByName('TITULO').AsString + '\' + FieldByName('ACTUAL').AsString + '\' + FieldByName('ANTERIOR').AsString);
                          HCalc.CellText[f, c] := FieldByName('CUENTA').AsString + ' ' + FieldByName('TITULO').AsString;
                          HCalc.SendNumber(f, c + o, FieldByName('ACTUAL').AsFloat);
                          HCalc.SendNumber(f, c + 15 + o, FieldByName('ANTERIOR').AsFloat);

                          Next;

                          // Salto de fila si cambia la cuenta
                          if (Cuenta <> FieldByName('CUENTA').AsString) then
                          begin
                             (*
                             HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                             HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                             HCalc.BackgroundColor(f, 14, clYellow);
                             HCalc.BackgroundColor(f, 27, clYellow);
                             *)
                             Inc(f);
                             Cuenta := FieldByName('CUENTA').AsString;
                          end;
                       end;
                       (*
                       HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                       HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                       HCalc.BackgroundColor(f, 14, clYellow);
                       HCalc.BackgroundColor(f, 27, clYellow);
                       *)
                       Close;
                       DMMain.LogFin('Exportando xVerBalanceDebeCuentasExportacion');
                    end;

                    Next;

                    Inc(f);
                 end;
                 DMMain.LogFin('Exportando xVerBalanceDebe');
              end;
              DMMain.LogFin('Exportando Balance de Perdidas y Ganancias PYME - Debe(' + IntToStr(i) + ')');
           end;

           // Primera columna contiene textos largos
           HCalc.AutoFit(1);

           // Exportacion de Balance de Perdidas y Ganancias PYME (HABER)
           HCalc.ActivateSheetByIndex(2);

           // Primera fila, los periodos
           DMMain.Log('Titulo + Periodos');
           f := 1;
           c := 1;
           HCalc.CellText[f, c] := DMCuAnuales.QMCuentasAnB_TITULO.AsString;
           HCalc.FontSize(f, c, 14);
           HCalc.Bold(f, c);
           Inc(f);

           HCalc.CellText[f, c] := _('Haber');
           HCalc.FontSize(f, c, 14);
           HCalc.Bold(f, c);
           Inc(f);

           for c := 1 to 14 do
           begin
              case c of
                 1..12: Periodo := Format('%.2d', [c]);
                 13: Periodo := '19';
                 14: Periodo := '20';
              end;

              HCalc.CellText[f, c + 1] := Format('M %s-%d', [Periodo, REntorno.Ejercicio]);
              HCalc.Bold(f, c + 1);
              HCalc.ColumnWidth(c + 1, 3000);
              HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

              HCalc.CellText[f, c + 16] := Format('M %s-%d', [Periodo, REntorno.Ejercicio - 1]);
              HCalc.Bold(f, c + 16);
              HCalc.ColumnWidth(c + 16, 3000);
              HCalc.ColNumberFormat(c + 16, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
           end;
           (*
           HCalc.CellText[f, 14] := Format('Total %d', [REntorno.Ejercicio]);
           HCalc.Bold(f, 14);
           HCalc.ColumnWidth(14, 3000);
           HCalc.BackgroundColor(f, 14, clYellow);
           HCalc.ColNumberFormat(14, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

           HCalc.CellText[f, 27] := Format('Total %d', [REntorno.Ejercicio - 1]);
           HCalc.Bold(f, 27);
           HCalc.ColumnWidth(27, 3000);
           HCalc.BackgroundColor(f, 27, clYellow);
           HCalc.ColNumberFormat(27, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
           *)

           for i := 1 to 14 do
           begin
              ProgressBar.StepIt;
              case i of
                 1..12: Periodo := Format('%.2d', [i]);
                 13: Periodo := '19';
                 14: Periodo := '20';
              end;

              f := 3;
              DMMain.LogIni('Exportando Balance de Perdidas y Ganancias PYME - Haber (' + IntToStr(i) + ')');
              // Me posiciono en el balance del mes
              with DMCuAnuales.QMCuentasAn do
              begin
                 DisableControls;
                 try
                    First;
                    while ((not EOF) and ((FieldByName('PERIODO').AsString <> Periodo) or (FieldByName('BALANCE').AsInteger <> 32))) do
                       Next;
                 finally
                    EnableControls;
                 end;
                 DMMain.Log('Posicionado en (' + Periodo + ') Periodo: ' + FieldByName('PERIODO').AsString + ' Balance: ' + FieldByName('BALANCE').AsString);
              end;

              // Abre tablas
              DMMain.LogIni('CalculaInforme');
              DMCuAnuales.CalculaInforme(True);
              DMMain.LogFin('CalculaInforme');

              Inc(f);
              c := 1;
              with DMCuAnuales.xVerBalanceHaber do
              begin
                 First;
                 DMMain.LogIni('Exportando xVerBalanceHaber');
                 while not EOF do
                 begin
                    DMMain.Log(FieldByName('TITULO').AsString + '\' + FieldByName('ACTUAL').AsString + '\' + FieldByName('ANTERIOR').AsString);
                    HCalc.CellText[f, c] := Trim(FieldByName('TITULO').AsString);
                    HCalc.BackgroundColor(f, c, clSilver);

                    (*
                    // Si no es un Rotulo, que salgan los totales
                    if ((FieldByName('TIPO').AsString = 'L') or (FieldByName('TIPO').AsString = 'T')) then
                    begin
                       HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                       HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                       HCalc.BackgroundColor(f, 14, clYellow);
                       HCalc.BackgroundColor(f, 27, clYellow);
                    end;
                    *)

                    // Si es un Rotulo o Total o "S", que salgan en negrita
                    if ((FieldByName('TIPO').AsString = 'R') or (FieldByName('TIPO').AsString = 'T') or (FieldByName('TIPO').AsString = 'S')) then
                    begin
                       DMMain.Log('Bold');
                       HCalc.FontSize(f, c, 12);
                       HCalc.Bold(f, c);
                    end;

                    o := StrToInt(FieldByName('PERIODO').AsString);
                    if (o = 19) then
                       o := 13;
                    if (o = 20) then
                       o := 14;

                    // Si es una Linea o Total o "S", se muestran valores del periodo
                    if ((FieldByName('TIPO').AsString = 'L') or (FieldByName('TIPO').AsString = 'T') or (FieldByName('TIPO').AsString = 'S')) then
                    begin
                       DMMain.Log('Bold+Nro ' + FieldByName('TIPO').AsString + ' ' + FieldByName('PERIODO').AsString);
                       HCalc.FontSize(f, c + o, 12);
                       HCalc.Bold(f, c + o);
                       HCalc.Bold(f, c + 15 + o);
                       HCalc.SendNumber(f, c + o, FieldByName('ACTUAL').AsFloat);
                       HCalc.SendNumber(f, c + 15 + o, FieldByName('ANTERIOR').AsFloat);
                    end;
                    Inc(f);

                    with DMCuAnuales.xVerBalanceHaberCuentasExportacion do
                    begin
                       DMMain.LogIni('Exportando xVerBalanceHaberCuentasExportacion');
                       Close;
                       Open;
                       First;
                       Cuenta := FieldByName('CUENTA').AsString;
                       while not EOF do
                       begin
                          o := StrToInt(FieldByName('PERIODO').AsString);
                          if (o = 19) then
                             o := 13;
                          if (o = 20) then
                             o := 14;
                          DMMain.Log(IntToStr(f) + ' - ' + FieldByName('PERIODO').AsString + '\' + FieldByName('CUENTA').AsString + '\' + FieldByName('TITULO').AsString + '\' + FieldByName('ACTUAL').AsString + '\' + FieldByName('ANTERIOR').AsString);
                          HCalc.CellText[f, c] := FieldByName('CUENTA').AsString + ' ' + FieldByName('TITULO').AsString;
                          HCalc.SendNumber(f, c + o, FieldByName('ACTUAL').AsFloat);
                          HCalc.SendNumber(f, c + 15 + o, FieldByName('ANTERIOR').AsFloat);

                          Next;

                          // Salto de fila si cambia la cuenta
                          if (Cuenta <> FieldByName('CUENTA').AsString) then
                          begin
                             (*
                             HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                             HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                             HCalc.BackgroundColor(f, 14, clYellow);
                             HCalc.BackgroundColor(f, 27, clYellow);
                             *)

                             Inc(f);
                             Cuenta := FieldByName('CUENTA').AsString;
                          end;
                       end;
                       (*
                       HCalc.CellFormula[f, 14] := Format('=SUM(B%d:M%d)', [f, f]);
                       HCalc.CellFormula[f, 27] := Format('=SUM(O%d:Z%d)', [f, f]);
                       HCalc.BackgroundColor(f, 14, clYellow);
                       HCalc.BackgroundColor(f, 27, clYellow);
                       *)
                       Close;
                       DMMain.LogFin('Exportando xVerBalanceHaberCuentasExportacion');
                    end;

                    Next;

                    Inc(f);
                 end;
                 DMMain.LogFin('Exportando xVerBalanceHaber');
              end;
              DMMain.LogFin('Exportando Balance de Perdidas y Ganancias PYME - Haber (' + IntToStr(i) + ')');
           end;

           // Primera columna contiene textos largos
           HCalc.AutoFit(1);

           DMMain.Log('Guardando ' + Archivo);
           HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
        finally
           HCalc.Free;
        end;
     finally
        PNLProgreso.Visible := False;
     end;
  end;
end;

procedure TFMCuAnuales.RecreaCuentasAnuales(Balance: integer);
var
  i : integer;
  MultiBalance : string;
begin
  DMMain.LogIni(format('RecreaCuentasAnuales(%d)', [Balance]));
  // Crea o recrea los balances mensuales arrastrando desde la apertura.
  try
     PNLProgreso.Visible := True;
     ProgressBar.Max := 14;
     ProgressBar.Position := 0;
     try
        MultiBalance := DMCuAnuales.DameListaMultiBalance;

        PedirDatos := False;
        // Creo 12 balances mensuales
        for i := 1 to 12 do
        begin
           DMCuAnuales.Procesa(BoolToInt(CBArrastre.Checked), REntorno.Moneda, '', 0, 4, 0, ' ', ' ', ' ', ' ', ' ', '', Now, Format('%.2d', [i]), Balance, MultiBalance);
           ProgressBar.StepIt;
        end;

        // Balance de Ejercicio fisico
        DMCuAnuales.Procesa(0, REntorno.Moneda, '', 0, 4, 0, ' ', ' ', ' ', ' ', ' ', '', Now, '19', Balance, MultiBalance);
        ProgressBar.StepIt;

        // Balance de Ejercicio contable completo
        DMCuAnuales.Procesa(0, REntorno.Moneda, '', 0, 4, 0, ' ', ' ', ' ', ' ', ' ', '', Now, '20', Balance, MultiBalance);
        ProgressBar.StepIt;
     finally
        PedirDatos := True;
     end;
  finally
     PNLProgreso.Visible := False;
     DMMain.LogFin(format('RecreaCuentasAnuales(%d)', [Balance]));
  end;
end;

procedure TFMCuAnuales.ARecreaCuentasAnuales31Execute(Sender: TObject);
var
  Periodo : integer;
begin
  inherited;
  // Balance cierre de PYME
  Periodo := TAction(Sender).Tag;
  if (Periodo = 0) then
     RecreaCuentasAnuales(31)
  else
     with DMCuAnuales do
        CreaCuentasAnuales(31, Periodo);
end;

procedure TFMCuAnuales.ARecreaCuentasAnuales32Execute(Sender: TObject);
var
  Periodo : integer;
begin
  inherited;
  // Balance de Cierre PYME
  Periodo := TAction(Sender).Tag;
  if (Periodo = 0) then
     RecreaCuentasAnuales(32)
  else
     CreaCuentasAnuales(32, Periodo);
end;

procedure TFMCuAnuales.ARecreaCuentasAnuales33Execute(Sender: TObject);
var
  Periodo : integer;
begin
  inherited;
  // Perdidas y Ganancias
  Periodo := TAction(Sender).Tag;
  if (Periodo = 0) then
     RecreaCuentasAnuales(33)
  else
     CreaCuentasAnuales(33, Periodo);
end;

procedure TFMCuAnuales.ARecreaCuentasAnuales34Execute(Sender: TObject);
var
  Periodo : integer;
begin
  inherited;
  // Balance de Cierre
  Periodo := TAction(Sender).Tag;
  if (Periodo = 0) then
     RecreaCuentasAnuales(34)
  else
     CreaCuentasAnuales(34, Periodo);
end;

procedure TFMCuAnuales.ARecreaCuentasAnuales35Execute(Sender: TObject);
var
  Periodo : integer;
begin
  inherited;
  // Estado de Gastos e Ingresos
  Periodo := TAction(Sender).Tag;
  if (Periodo = 0) then
     RecreaCuentasAnuales(35)
  else
     CreaCuentasAnuales(35, Periodo);
end;

procedure TFMCuAnuales.EFBalanceBusqueda(Sender: TObject);
begin
  inherited;
  EFBalance.CondicionBusqueda := 'ACTIVO=1 AND PAIS=''' + REntorno.Pais + '''';
end;

procedure TFMCuAnuales.EFBalanceChange(Sender: TObject);
begin
  inherited;
  ETituloBalance.Text := DameTituloBalance(StrToIntDef(EFBalance.Text, 0));
end;

procedure TFMCuAnuales.EFPeriodoChange(Sender: TObject);
var
  Min, Max : TDateTime;
begin
  inherited;
  ETituloPeriodo.Text := DameTituloPeriodo(EFPeriodo.Text);
  DameMinMax('PER', Min, Max);
  DEPeriodoDesde.Date := Min;
  DEPeriodoHasta.Date := Max;
end;

procedure TFMCuAnuales.CBArratraAperturaChange(Sender: TObject);
begin
  inherited;
  if (CBArratraApertura.Checked) then
  begin
     if ((EFPeriodo.Text < '01') or (EFPeriodo.Text > '12')) then
     begin
        ShowMessage(_('Solo se pueden arrastrar periodos Mensuales'));
        CBArratraApertura.Checked := False;
     end;
  end;
end;

procedure TFMCuAnuales.DBGMainDblClick(Sender: TObject);
begin
  inherited;
  // Recalcular la cuenta anual
  if ConfirmaMensaje(_('Desea recalcular esta cuenta anual?')) then
     with DMCuAnuales do
        Procesa(QMCuentasAnARRASTRAR.AsInteger, REntorno.Moneda, '', 0, 4, 0, QMCuentasAnDIGITO_1.AsString, QMCuentasAnDIGITO_2.AsString, QMCuentasAnDIGITO_3.AsString, QMCuentasAnDIGITO_4.AsString, QMCuentasAnDIGITO_5.AsString, '', Now, QMCuentasAnPERIODO.AsString, QMCuentasAnBALANCE.AsInteger, QMCuentasAnMULTI_CANAL.AsString);
end;

procedure TFMCuAnuales.AMultiBalanceExecute(Sender: TObject);
begin
  inherited;
  // Seleccionar Canales
  with TFMultiBalances.Create(Self) do
  begin
     // Mostrar(DMCuAnuales.xBalancesBALANCE.AsInteger, DMCuAnuales.xPeriodosPERIODO.AsString);

     // Relleno sin especificar periodo ni balance. No se tienen en cuenta.
     Mostrar(0, '00');
     Free;
  end;
end;

procedure TFMCuAnuales.ACrearCuentaAnual31Execute(Sender: TObject);
begin
  inherited;
  CreaCuentasAnuales(31, TAction(Sender).Tag);
end;

procedure TFMCuAnuales.ACrearCuentaAnual32Execute(Sender: TObject);
begin
  inherited;
  CreaCuentasAnuales(32, TAction(Sender).Tag);
end;

procedure TFMCuAnuales.ACrearCuentaAnual33Execute(Sender: TObject);
begin
  inherited;
  CreaCuentasAnuales(33, TAction(Sender).Tag);
end;

procedure TFMCuAnuales.ACrearCuentaAnual34Execute(Sender: TObject);
begin
  inherited;
  CreaCuentasAnuales(34, TAction(Sender).Tag);
end;

procedure TFMCuAnuales.ACrearCuentaAnual35Execute(Sender: TObject);
begin
  inherited;
  CreaCuentasAnuales(35, TAction(Sender).Tag);
end;

procedure TFMCuAnuales.CreaCuentasAnuales(Balance, Periodo: integer);
var
  Arrastrar : integer;
begin
  Arrastrar := BoolToInt(CBArrastre.Checked);
  if (Periodo > 12) then
     Arrastrar := 0;

  DMCuAnuales.Procesa(Arrastrar, REntorno.Moneda, '', 0, 4, 0, '', '', '', '', '', '', Now, Format('%.2d', [Periodo]), Balance, DMCuAnuales.DameListaMultiBalance);
end;

end.
