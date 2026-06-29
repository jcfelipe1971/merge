unit UFMTercerosIVA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid, ExtCtrls,
  StdCtrls, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ActnList, rxPlacemnt, ULFCheckBox, ULFDBEditFind2000, ULFDBEdit,
  ULFFormStorage, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel,
  TFlatCheckBoxUnit, ULFLabel, UG2kTBLoc;

type
  TFMTercerosIVA = class(TFPEdit)
     DBETercerosNombre: TLFDbedit;
     LTercero: TLFLabel;
     LCuenta: TLFLabel;
     DBECuentaTitulo: TLFDbedit;
     LModoIva: TLFLabel;
     DBEModoIVATitulo: TLFDbedit;
     LBaseImponible: TLFLabel;
     DBEBaseImponible: TLFDbedit;
     DBETercero: TLFDbedit;
     DBECuenta: TLFDbedit;
     DBEModo: TLFDbedit;
     DBRGSigno: TDBRadioGroup;
     Label1: TLFLabel;
     DBETitCuentaCon: TLFDbedit;
     DBEFCuenta_Con: TLFDBEditFind2000;
     CBAuto: TLFCheckBox;
     TButtSalir: TToolButton;
     ALNormal: TLFActionList;
     ASalir: TAction;
     procedure FormCreate(Sender: TObject);
     procedure AConfirmaDatosExecute(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure CBAutoClick(Sender: TObject);
     procedure DBEFCuenta_ConExit(Sender: TObject);
     procedure DBEFCuenta_ConKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ASalirExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFCuenta_ConBusqueda(Sender: TObject);
  private
     { Private declarations }
     TeclaGrabar: integer;
  public
     { Public declarations }
     Grabar: boolean;
     procedure MostarParametrizado(pEstado: smallint);
  end;

var
  FMTercerosIVA : TFMTercerosIVA;

implementation

{$R *.dfm}

uses UDMBorradorContabilidad, UDMMain, UFormGest, UUtiles, UFMain, UEntorno, UDameDato;

{ TFMTercerosIVA }

procedure TFMTercerosIVA.FormCreate(Sender: TObject);
begin
  inherited;

  Grabar := False;
  TeclaGrabar := DMMain.Teclas.TecNPost;
  { No eara visible
  NavMain.DataSource := DMBorradorContabilidad.DSQMApuntes;
  }
  ControlEdit := CEMain;

  // Evitamos que grabe los datasets al cerrar
  slvar := False;

  // Maximos para la cuenta
  DBEFCuenta_Con.MaxLength := REntorno.DigitosSub;
end;

procedure TFMTercerosIVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // Debe permanecer activo para que se pueda leer el resultado en la variable Grabar
  Action := caHide;

  DMMain.Teclas.TecNPost := TeclaGrabar;
end;

procedure TFMTercerosIVA.MostarParametrizado(pEstado: smallint);
var
  i : integer;
begin
  if (pEstado = 0) then // Preparar ventana para vista modal en edicion
  begin
     ControlEdit.ActivaEdicion;
     NavMain.Parent := nil;
     for i := 0 to PEdit.ControlCount - 1 do
        DMMain.AddComponenteEsc(PEdit.Controls[i]);
     DMMain.Teclas.TecNPost := 0;
     ASalir.ShortCut := TeclaGrabar;
     DMMain.Teclas.ActualizarTeclasPopUp(CEMainPMEdit);
  end
  else
  begin
     ASalir.ShortCut := DMMain.Teclas.TecXSalir;
  end;

  if DMBorradorContabilidad.QMApuntesCUENTA_CON.AsString = '' then
     CBAuto.Checked := True;

  Hide;
  ShowModal;

  DMBorradorContabilidad.QMApuntesB_IMPONIBLE.AsFloat := StrToFloat(DBEBaseImponible.Text);
end;

procedure TFMTercerosIVA.AConfirmaDatosExecute(Sender: TObject);
begin
  if CloseQuery then
     Close;
end;

procedure TFMTercerosIVA.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var
  i : integer;
begin
  if (DBEBaseImponible.Text < '') then
     DBEBaseImponible.Text := '0';

  for i := 0 to PEdit.ControlCount - 1 do
     DMMain.DelComponenteEsc(PEdit.Controls[i]);

  if (CBAuto.Checked) then
     DMBorradorContabilidad.QMApuntesCUENTA_CON.AsString := '';

  CanClose := True;
end;

procedure TFMTercerosIVA.CBAutoClick(Sender: TObject);
begin
  inherited;
  if (Sender as TLFCheckBox).Checked then
  begin
     DBEFCuenta_Con.Color := clInfoBk;
     DBEFCuenta_Con.Font.Color := clGrayText;
  end
  else
  begin
     DBEFCuenta_Con.Color := clWindow;
     DBEFCuenta_Con.Font.Color := clWindowText;
  end;
end;

procedure TFMTercerosIVA.DBEFCuenta_ConExit(Sender: TObject);
begin
  inherited;
  DBEFCuenta_Con.Text := ExpandirCadena(DBEFCuenta_Con.Text, REntorno.DigitosSub);
end;

procedure TFMTercerosIVA.DBEFCuenta_ConKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     DBEFCuenta_Con.Text := ExpandirCadena(DBEFCuenta_Con.Text, REntorno.DigitosSub);
end;

procedure TFMTercerosIVA.ASalirExecute(Sender: TObject);
begin
  inherited;
  Grabar := True;
  Close;
end;

procedure TFMTercerosIVA.DBEFCuenta_ConBusqueda(Sender: TObject);
var
  Canal, Pgc : integer;
begin
  with DMBorradorContabilidad do
  begin
     Canal := QMAsientosCanal.AsInteger;
     Pgc := DamePgc(QMAsientosEMPRESA.AsInteger, QMAsientosEJERCICIO.AsInteger, Canal);
     DBEFCuenta_Con.CondicionBusqueda := 'PGC=' + IntToStr(Pgc) + ' AND TIPO = 5';
  end;
end;

end.
