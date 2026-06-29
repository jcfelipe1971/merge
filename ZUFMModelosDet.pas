unit ZUFMModelosDet;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, UDBDateTimePicker, ExtDlgs, DB, NsDBGrid, rxPlacemnt, rxToolEdit,
  RXDBCtrl, ImgList, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEditFind2000,
  ULFDBCheckBox, ULFDBEdit, TFlatCheckBoxUnit, ULFCheckBox, Buttons,
  TeEngine, Series, TeeProcs, Chart, DbChart, ULFFIBDBEditFind,
  UHYDescription, ULFHYDBDescription, UG2kTBLoc, ULFLabel, ULFEdit,
  ULFComboBox, ULFEditFind2000, UFormGest;

type
  TZFMModelosDet = class(TFPEdit)
     LblImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     LblSalida: TLFLabel;
     LDecBarrasManual: TLFLabel;
     LblLinea: TLFLabel;
     LDecBarrasMotor: TLFLabel;
     LIncCoste: TLFLabel;
     DBESalida: TLFDbedit;
     DBEDecBarrasManualArriba: TLFDbedit;
     LDecMedidaLona: TLFLabel;
     DBELinea: TLFDbedit;
     DBEIncCorte: TLFDbedit;
     DBEDecBarrasMotorArriba: TLFDbedit;
     DBEDecMedidaLona: TLFDbedit;
     PnlModelo: TLFPanel;
     LblModelo: TLFLabel;
     EFModelo: TLFEditFind2000;
     DBEDescModelo: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     ACrearArmazones: TAction;
     DBEDecBarrasManualAbajo: TLFDbedit;
     DBEDecBarrasMotorAbajo: TLFDbedit;
     LblArriba: TLFLabel;
     LblAbajo: TLFLabel;
     PnlDetalles: TLFPanel;
     DBGFCalcLonas: TDBGridFind2000;
     TBCalcLonas: TLFToolBar;
     NavCalcLonas: THYMNavigator;
     CECalcLonas: TControlEdit;
     CECalcLonasPMEdit: TPopUpTeclas;
     ACrearToldos: TAction;
     ASep1: TAction;
     AReplicarCalculos: TAction;
     AReplicarTipoConfeccion: TAction;
     LTipoConfeccion: TLFLabel;
     DBEFTipoConfeccion: TLFDBEditFind2000;
     DescTipoConfeccion: TLFHYDBDescription;
     PCDetalles: TLFPageControl;
     TSCalcLonas: TTabSheet;
     TSMotores: TTabSheet;
     PnlCalcLonas: TLFPanel;
     PnlMotores: TLFPanel;
     TBMotores: TLFToolBar;
     DBGFMotores: TDBGridFind2000;
     NavMotores: THYMNavigator;
     CEMotores: TControlEdit;
     CEMotoresPMEdit: TPopUpTeclas;
     ASep2: TAction;
     ARecrearToldos: TAction;
     DBChkBIncrLacado: TLFDBCheckBox;
     AReplicarIncrLacadoPVP: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ALstPreciosModelo: TAction;
     SBAEscandallo: TSpeedButton;
     ALModelos: TLFActionList;
     AAEscandallo: TAction;
     LAramzon: TLFLabel;
     LToldo: TLFLabel;
     LFDBArmazon: TLFDbedit;
     LFDBToldo: TLFDbedit;
     LFDescArmazon: TLFDbedit;
     LFDescToldo: TLFDbedit;
     SBAArmazon: TSpeedButton;
     SBAToldo: TSpeedButton;
     AArmazon: TAction;
     AToldo: TAction;
     AReplicaciones: TAction;
     AAsignarEsc: TAction;
     ATarifasModelos: TAction;
     ABorrarDuplicados: TAction;
     LFDBCheckBox1: TLFDBCheckBox;
     AAcualizarPreciosEsc: TAction;
     AActualizarMedidas: TAction;
     AAbrirEscModelo: TAction;
     GroupBox1: TGroupBox;
     LNormal: TLFLabel;
     DBEEscandallo: TLFFibDBEditFind;
     DescEscandallo: TLFHYDBDescription;
     LColor: TLFLabel;
     DescEscandalloColor: TLFHYDBDescription;
     DBEEscColor: TLFFibDBEditFind;
     SBAEscandallocolor: TSpeedButton;
     AAEscandalloColor: TAction;
     TSLama: TTabSheet;
     PnlLamas: TLFPanel;
     TBLamas: TLFToolBar;
     NavLamas: THYMNavigator;
     DBGLamas: TDBGridFind2000;
     SBAModelo: TSpeedButton;
     AModelo: TAction;
     BCargarImagen: TButton;
     LLineaMinima: TLFLabel;
     DBELineaMinima: TLFDbedit;
     AActuModeloEsc: TAction;
     BClipboard: TButton;
     LDecMotorMedidaLona: TLFLabel;
     DBEDecMotorMedidaLona: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFImagenChange(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure EFModeloChange(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure ACrearArmazonesExecute(Sender: TObject);
     procedure ACrearToldosExecute(Sender: TObject);
     procedure ARecrearToldosExecute(Sender: TObject);
     procedure AReplicarCalculosExecute(Sender: TObject);
     procedure AReplicarTipoConfeccionExecute(Sender: TObject);
     procedure AReplicarIncrLacadoPVPExecute(Sender: TObject);
     procedure DBEFTipoConfeccionChange(Sender: TObject);
     procedure DBGFCalcLonasBusqueda(Sender: TObject);
     procedure ALstPreciosModeloExecute(Sender: TObject);
     procedure DBEEscandalloChange(Sender: TObject);
     procedure SBAEscandalloDblClick(Sender: TObject);
     procedure AAEscandalloExecute(Sender: TObject);
     procedure AArmazonExecute(Sender: TObject);
     procedure AToldoExecute(Sender: TObject);
     procedure AReplicacionesExecute(Sender: TObject); //sfg.albert
     procedure AAsignarEscExecute(Sender: TObject);
     procedure ATarifasModelosExecute(Sender: TObject);
     procedure ABorrarDuplicadosExecute(Sender: TObject);
     procedure AAcualizarPreciosEscExecute(Sender: TObject);
     procedure AAbrirEscModeloExecute(Sender: TObject);
     procedure AActualizarMedidasExecute(Sender: TObject);
     procedure DBEEscColorChange(Sender: TObject);
     procedure AAEscandalloColorExecute(Sender: TObject);
     procedure SBAEscandallocolorDblClick(Sender: TObject);
     procedure DBGLamasBusqueda(Sender: TObject);
     procedure SBAModeloDblClick(Sender: TObject);
     procedure AModeloExecute(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure AActuModeloEscExecute(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure DBGFMotoresBusqueda(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltrarModelo(modelo: string);
  end;

var
  ZFMModelosDet : TZFMModelosDet;

implementation

uses ZUDMModelosDet, UFMain, UDMMain, ZUFMLstPreciosModelo, UEntorno, UUtiles,
  ZUFMReplicacionModelosDet, ZUFMTarifasModelos, UDameDato, UImagenes;

{$R *.dfm}

procedure TZFMModelosDet.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMModelosDet, ZDMModelosDet);

  NavMain.DataSource := ZDMModelosDet.DSQMModelosDet;
  DBGMain.DataSource := ZDMModelosDet.DSQMModelosDet;

  DBEEscandallo.Color := REntorno.ColorEnlaceActivo;
  DBEEscColor.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAEscandallo, DBEEscandallo);
  LFDBArmazon.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAArmazon, LFDBArmazon);
  LFDBToldo.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAToldo, LFDBToldo);
  SolapaControles(SBAEscandalloColor, DBEEsccolor);
  RefrescarImagen(Imagen, ZDMModelosDet.QMModelosDetCODIGO_IMAGEN.AsInteger);

  EFModelo.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAModelo, EFModelo);
end;

procedure TZFMModelosDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMModelosDet);
end;

procedure TZFMModelosDet.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TZFMModelosDet.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (PCMain.ActivePage.TabIndex = 0) then
     RefrescarImagen(Imagen, ZDMModelosDet.QMModelosDetCODIGO_IMAGEN.AsInteger);
end;

procedure TZFMModelosDet.EFModeloChange(Sender: TObject);
begin
  inherited;
  ZDMModelosDet.FiltraModelo(EFModelo.Text);

  // Canvio els label segons toldo o persiana
  if (ZDMModelosDet.xModeloTIPO_MODELO.AsString = 'PER') then
  begin
     LToldo.Caption := _('Persiana');
     LToldo.Left := 209;
     LblLinea.Caption := _('Ancho');
     LblLinea.Left := 83;
     LblSalida.Caption := _('Alto');
     TSLama.TabVisible := True;
     TSMotores.TabVisible := True;
     TSCalcLonas.TabVisible := False;
     PCDetalles.ActivePage := TSMotores;
     LIncCoste.Visible := False;
     DBEIncCorte.Visible := False;
     LdecMedidaLona.Visible := False;
     DBEDecMedidaLona.Visible := False;
     LdecBarrasManual.Visible := False;
     DBEDecBarrasManualArriba.Visible := False;
     DBEDecBarrasManualAbajo.Visible := False;
     LdecBarrasMotor.Visible := False;
     DBEDecBarrasMotorArriba.Visible := False;
     DBEDecBarrasMotorAbajo.Visible := False;
     LblArriba.Visible := False;
     LblAbajo.Visible := False;
  end
  else if (ZDMModelosDet.xModeloTIPO_MODELO.AsString = 'TOL') then
  begin
     LToldo.Caption := _('Toldo');
     LToldo.Left := 219;
     LblLinea.Caption := _('Linea');
     LblLinea.Left := 85;
     LblSalida.Caption := _('Salida');
     TSLama.TabVisible := False;
     TSMotores.TabVisible := True;
     TSCalcLonas.TabVisible := True;
     PCDetalles.ActivePage := TSCalcLonas;
     LIncCoste.Visible := True;
     DBEIncCorte.Visible := True;
     LdecMedidaLona.Visible := True;
     DBEDecMedidaLona.Visible := True;
     LdecBarrasManual.Visible := True;
     DBEDecBarrasManualArriba.Visible := True;
     DBEDecBarrasManualAbajo.Visible := True;
     LdecBarrasMotor.Visible := True;
     DBEDecBarrasMotorArriba.Visible := True;
     DBEDecBarrasMotorAbajo.Visible := True;
     LblArriba.Visible := True;
     LblAbajo.Visible := True;
  end;
end;

procedure TZFMModelosDet.TSFichaShow(Sender: TObject);
begin
  inherited;
  EFModelo.SetFocus;
end;

procedure TZFMModelosDet.ACrearArmazonesExecute(Sender: TObject);
begin
  inherited;
  if (EFModelo.Text <> '') then
     ZDMModelosDet.CrearArmazones(EFModelo.Text, 0);
end;

procedure TZFMModelosDet.ACrearToldosExecute(Sender: TObject);
begin
  inherited;
  if (EFModelo.Text <> '') then
     ZDMModelosDet.CrearToldos(EFModelo.Text);
end;

procedure TZFMModelosDet.ARecrearToldosExecute(Sender: TObject);
begin
  inherited;
  if (EFModelo.Text <> '') then
  begin
     if MessageDlg(_('Este proceso puede durar unos minutos.' + #13#10 + '¿Desea continuar?'),
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        ZDMModelosDet.RecrearToldos(EFModelo.Text);
     end;
  end;
end;

procedure TZFMModelosDet.AReplicarCalculosExecute(Sender: TObject);
begin
  inherited;
  if (EFModelo.Text <> '') then
     ZDMModelosDet.ReplicarCalculos(EFModelo.Text);
end;

procedure TZFMModelosDet.AReplicarTipoConfeccionExecute(Sender: TObject);
begin
  inherited;
  if (EFModelo.Text <> '') then
     ZDMModelosDet.ReplicarTiposConfeccion(EFModelo.Text);
end;

procedure TZFMModelosDet.AReplicarIncrLacadoPVPExecute(Sender: TObject);
begin
  inherited;
  if (EFModelo.Text <> '') then
     ZDMModelosDet.ReplicarIncrLacadoPVP(EFModelo.Text);
end;

procedure TZFMModelosDet.DBEFTipoConfeccionChange(Sender: TObject);
begin
  inherited;
  DescTipoConfeccion.ActualizaDatos('TIPO_CONFECCION', DBEFTipoConfeccion.Text);
end;

procedure TZFMModelosDet.DBGFCalcLonasBusqueda(Sender: TObject);
begin
  inherited;
  DBGFCalcLonas.CondicionBusqueda := '';
  DBGFCalcLonas.Filtros := [];

  if (DBGFCalcLonas.ColumnaActual = 'LONA') then
  begin
     DBGFCalcLonas.CondicionBusqueda := 'TIPO_ARTICULO_TYC=''L'' and ' +
        'z_lona_tipo=''' + ZDMModelosDet.QMModelosCalcTIPO_LONA.AsString + '''';
     DBGFCalcLonas.Filtros := [obEmpresa, obEjercicio, obCanal];
  end
  else if (DBGFCalcLonas.ColumnaActual = 'FABRICACION') then
  begin
     DBGFCalcLonas.CondicionBusqueda := 'TIPO_ARTICULO_TYC=''F''';
     DBGFCalcLonas.Filtros := [obEmpresa, obEjercicio, obCanal];
  end;
end;

procedure TZFMModelosDet.ALstPreciosModeloExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMLstPreciosModelo, ZFMLstPreciosModelo);
  ZFMLstPreciosModelo.EFModelo.Text := EFModelo.Text;
end;

procedure TZFMModelosDet.DBEEscandalloChange(Sender: TObject);
begin
  inherited;
  DescEscandallo.ActualizaDatos('ESCANDALLO', DBEEscandallo.Text);
end;

procedure TZFMModelosDet.SBAEscandalloDblClick(Sender: TObject);
begin
  inherited;
  AAEscandallo.Execute;
end;

procedure TZFMModelosDet.AAEscandalloExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, 'Escandallo = ''' +
     ZDMModelosDet.QMModelosDetESCANDALLO.AsString + '''');
end;

procedure TZFMModelosDet.AArmazonExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' +
     ZDMModelosDet.QMModelosDetArmazon.AsString + '''' +
     ' and ejercicio=' + REntorno.EjercicioStr);
end;

procedure TZFMModelosDet.AToldoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' +
     ZDMModelosDet.QMModelosDetToldo.AsString + '''' +
     ' and ejercicio=' + REntorno.EjercicioStr);
end;

procedure TZFMModelosDet.FiltrarModelo(modelo: string);
begin
  EFModelo.Text := Modelo;
end;

procedure TZFMModelosDet.AReplicacionesExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMReplicacionModelosDet, ZFMReplicacionModelosDet, Sender);

  with ZFMReplicacionModelosDet do
  begin
     LFEModelo.Text := Trim(EFModelo.Text);
     LFEDescModelo.Text := DBEDescModelo.Text;
     LFLineaModelo.Text := DBELinea.Text;
     LFSalidaModelo.Text := DBESalida.Text;
     LFEscandallo.Text := DBEEscandallo.Text;
  end;
end;

procedure TZFMModelosDet.AAsignarEscExecute(Sender: TObject);
begin
  inherited;
  ZDMModelosDet.AsignarEscPerdido(EFModelo.Text);
  ZDMModelosDet.FiltraModelo(EFModelo.Text);
end;

procedure TZFMModelosDet.ATarifasModelosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMTarifasModelos, ZFMTarifasModelos);
end;

procedure TZFMModelosDet.ABorrarDuplicadosExecute(Sender: TObject);
begin
  inherited;
  //sfg.albert - Se eliminan las lonas duplicadas
  if MessageDlg(_('Esta operación puede tardar varios minutos. ¿Desea continuar?'),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     ZDMModelosDet.EliminarDuplicados;
  end;
end;

procedure TZFMModelosDet.AAcualizarPreciosEscExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg(_('Esta operación actualizará los precios de todos los componentes de los escandallos' + #13#10 +
     'de los modelos no obsoletos. ¿Desea continuar?')
     , mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     ZDMModelosDet.ActualizarPrecios;
     ShowMessage(_('Proceso finalizado'));
  end;
end;

procedure TZFMModelosDet.AAbrirEscModeloExecute(Sender: TObject);
begin
  inherited;
  ZDMModelosDet.AbrirEscModelo;
end;

procedure TZFMModelosDet.AActualizarMedidasExecute(Sender: TObject);
begin
  inherited;
  ZDMModelosDet.ActualizarMedidas;
  ShowMessage(_('Proceso finalizado'));
end;

procedure TZFMModelosDet.DBEEscColorChange(Sender: TObject);
begin
  inherited;
  DescEscandalloColor.ActualizaDatos('ESCANDALLO_COLOR', DBEEscColor.Text);
end;

procedure TZFMModelosDet.AAEscandalloColorExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, 'Escandallo = ''' +
     ZDMModelosDet.QMModelosDetESCANDALLO_COLOR.AsString + '''');
end;

procedure TZFMModelosDet.SBAEscandallocolorDblClick(Sender: TObject);
begin
  inherited;
  AAEscandalloColor.Execute;
end;

procedure TZFMModelosDet.DBGLamasBusqueda(Sender: TObject);
begin
  inherited;
  if Trim(DBGLamas.TablaABuscar) = 'ART_ARTICULOS' then
  begin
     DBGLamas.CondicionBusqueda := 'TIPO_ARTICULO_TYC=''S''';
  end
  else
  if Trim(DBGLamas.TablaABuscar) = 'Z_SYS_LONAS' then
  begin
     DBGLamas.CondicionBusqueda := 'tipo=1';
  end;
end;

procedure TZFMModelosDet.SBAModeloDblClick(Sender: TObject);
begin
  inherited;
  AModelo.Execute;
end;

procedure TZFMModelosDet.AModeloExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ZAModelos, EFModelo.Text);
end;

procedure TZFMModelosDet.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  ZDMModelosDet.QMModelosDetCODIGO_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TZFMModelosDet.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TZFMModelosDet.AActuModeloEscExecute(Sender: TObject);
begin
  inherited;
  // sfg.albert
  if MessageDlg(_('ATENCIÓN: Se va a actualizar el modelo de los escandallos de este modelo.' + #13#10 +
     'Desea continuar?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     ZDMModelosDet.ActualizarModeloEsc;
     ShowMessage(_('Proceso finalizado.'));
  end;
end;

procedure TZFMModelosDet.BClipboardClick(Sender: TObject);
begin
  inherited;
  ZDMModelosDet.QMModelosDetCODIGO_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TZFMModelosDet.DBGFMotoresBusqueda(Sender: TObject);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + ''' AND TIPO_ARTICULO_TYC=''';

        if (DBGFMotores.ColumnaActual = 'ARTICULO_KIT') then
           CondicionBusqueda := CondicionBusqueda + 'K'''
        else
           CondicionBusqueda := CondicionBusqueda + 'M''';
     end;
  end;
end;

end.
