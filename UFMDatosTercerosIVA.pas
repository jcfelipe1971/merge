unit UFMDatosTercerosIVA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid, ExtCtrls,
  StdCtrls, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ActnList, rxPlacemnt, ULFDBEditFind2000, ULFDBEdit, ULFFormStorage,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMDatosTercerosIVA = class(TFPEdit)
     DBETercero: TLFDbedit;
     DBECuenta: TLFDbedit;
     DBEModoIva: TLFDbedit;
     LTercero: TLFLabel;
     LCuenta: TLFLabel;
     LModoIva: TLFLabel;
     DBENif: TLFDbedit;
     LBLNif: TLFLabel;
     DBRGSigno: TDBRadioGroup;
     DBEFTercero: TLFDBEditFind2000;
     DBEFCuenta: TLFDBEditFind2000;
     DBEFModoIVA: TLFDBEditFind2000;
     DBEDoc_Numero: TLFDbedit;
     LBLDocNumero: TLFLabel;
     LBLDocSerie: TLFLabel;
     DBEFSerie: TLFDBEditFind2000;
     DBETitSerie: TLFDbedit;
     ASalir: TLFNoSaveAction;
     procedure FormCreate(Sender: TObject);
     procedure AConfirmaDatosExecute(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure DBEFCuentaExit(Sender: TObject);
     procedure DBEFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure DBEFCuentaBusqueda(Sender: TObject);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     TeclaGrabar: integer;
  public
     { Public declarations }
     grabar: boolean;
     procedure MostarParametrizado(pEstado: smallint);
  end;

var
  FMDatosTercerosIVA : TFMDatosTercerosIVA;

implementation

{$R *.dfm}

uses
  UDMBorradorContabilidad, UDMMain, UFormGest, UUtiles, UEntorno, UDameDato;

procedure TFMDatosTercerosIVA.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  grabar := False;
  TeclaGrabar := DMMain.Teclas.TecNPost;
  slvar := False;
  DMMain.Teclas.TecNPost := 0;
  ASalir.ShortCut := TeclaGrabar;
  DMMain.Teclas.ActualizarTeclasPopUp(CEMainPmEdit);
  NavMain.DataSource := DMBorradorContabilidad.DSQMAsientos;
  ControlEdit := CEMain;
end;

procedure TFMDatosTercerosIVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMMain.Teclas.TecNPost := TeclaGrabar;
end;

procedure TFMDatosTercerosIVA.MostarParametrizado(pEstado: smallint);
var
  i : integer;
  Activo : boolean;
  Color1, Color2 : TColor;
begin
  if (pEstado = 0) or (pEstado = 2) then // Preparar ventana para vista modal en edicion
  begin
     NavMain.Parent := nil;
     ControlEdit.ActivaEdicion;
     for i := 0 to PEdit.ControlCount - 1 do
        DMMain.AddComponenteEsc(PEdit.Controls[i]);
  end;
  if (pEstado = 2) then
  begin
     Activo := True;
     Color1 := clWindow;
     Color2 := clWindowText;
  end
  else
  begin
     Activo := False;
     Color1 := clInfoBk;
     Color2 := clGrayText;
  end;

  DBEDoc_Numero.Enabled := Activo;
  DBEDoc_Numero.ReadOnly := not (Activo);
  DBEDoc_Numero.Color := Color1;
  DBEDoc_Numero.Font.Color := Color2;
  DBEFSerie.Enabled := Activo;
  DBEFSerie.ReadOnly := not (Activo);
  DBEFSerie.Color := Color1;
  DBEFSerie.Font.Color := Color2;

  if (pEstado = 2) then
     DMBorradorContabilidad.RellenaDatosExtendidos;

  ShowModal;
end;

procedure TFMDatosTercerosIVA.AConfirmaDatosExecute(Sender: TObject);
begin
  if FMDatosTercerosIVA.CloseQuery then
     Close;
end;

procedure TFMDatosTercerosIVA.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  i : integer;
begin
  if (DBRGSigno.ItemIndex = 0) then
     DMBorradorContabilidad.QMAsientosSIGNO.Value := 1
  else
     DMBorradorContabilidad.QMAsientosSIGNO.Value := 0;

  for i := 0 to PEdit.ControlCount - 1 do
     DMMain.DelComponenteEsc(PEdit.Controls[i]);
  CanClose := True;
end;

procedure TFMDatosTercerosIVA.DBEFCuentaExit(Sender: TObject);
begin
  inherited;
  DBEFCuenta.Text := ExpandirCadena(DBEFCuenta.Text, REntorno.DigitosSub);
end;

procedure TFMDatosTercerosIVA.DBEFCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     DBEFCuenta.Text := ExpandirCadena(DBEFCuenta.Text, REntorno.DigitosSub);
end;

procedure TFMDatosTercerosIVA.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  inherited;
  if (DMBorradorContabilidad.ValidaDocumento(StrToIntDef(DBEDoc_Numero.Text, 0),
     DBEFSerie.Text, DBRGSigno.ItemIndex)) then
  begin
     Grabar := True;
     Close;
  end
  else
     raise Exception.Create(Format(_('El documento %s de la serie %s ya existe.'), [DBEDoc_Numero.Text, DBEFSerie.Text]));
end;

procedure TFMDatosTercerosIVA.FormShow(Sender: TObject);
begin
  inherited;
  ASalir.Enabled := True;
  ALMain.Enabled := True;
  TBActions.Visible := False;
end;

procedure TFMDatosTercerosIVA.DBEFCuentaBusqueda(Sender: TObject);
var
  Canal, Pgc : integer;
begin
  with DMBorradorContabilidad do
  begin
     Canal := QMAsientosCanal.AsInteger;
     Pgc := DamePgc(QMAsientosEMPRESA.AsInteger, QMAsientosEjercicio.AsInteger, Canal);
     DBEFCuenta.CondicionBusqueda := 'CANAL =' +
        IntToStr(Canal) + ' AND PGC=' + IntToStr(Pgc) + ' AND TIPO = 5';
  end;
end;

end.
