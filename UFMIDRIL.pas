unit UFMIDRIL;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, ULFDBEdit, Mask, DBCtrls,
  UFIBDBEditfind, ULFFIBDBEditFind, ULFLabel, UComponentesBusquedaFiltrada,
  Buttons;

type
  TFMIDRIL = class(TFPEdit)
     LAcreedor: TLFLabel;
     ETituloAcreedor: TLFEdit;
     DBEAcreedor: TDBEditFind2000;
     LConfiguracionRemitente: TLFLabel;
     LNombre: TLFLabel;
     DBENombre: TLFDbedit;
     LDireccion: TLFLabel;
     DBEDireccion: TLFDbedit;
     LPoblacion: TLFLabel;
     DBEPoblacion: TLFDbedit;
     LPais: TLFLabel;
     DBEPais: TLFDbedit;
     LCodigoPostal: TLFLabel;
     DBECodigoPostal: TLFDbedit;
     LTelefono: TLFLabel;
     DBETelefono: TLFDbedit;
     LRutaCopiaEtiqueta: TLFLabel;
     ERutaCopiaEtiqueta: TLFEdit;
     LMovil: TLFLabel;
     LEmail: TLFLabel;
     LDepartamento: TLFLabel;
     LObservaciones: TLFLabel;
     DBEMovil: TLFDbedit;
     DBEEmail: TLFDbedit;
     DBEDepartamento: TLFDbedit;
     DBEObservaciones: TLFDbedit;
     LConfiguracionEtiqueta: TLFLabel;
     SBDirectorioCopiaEtiqueta: TSpeedButton;
     LRutaServicio: TLFLabel;
     ERutaServicio: TLFEdit;
     LRutaServicioGLS: TLFLabel;
     LGestion: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure DBEAcreedorChange(Sender: TObject);
     procedure DBEAcreedorDblClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormShow(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure SBDirectorioCopiaEtiquetaClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMIDRIL : TFMIDRIL;

implementation

uses UDMIDRIL, UEntorno, UDMMain, UFormGest, UFMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMIDRIL.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMIDRIL, DMIDRIL);
  NavMain.DataSource := DMIDRIL.DSxIDRILTransportista;
  DBGMain.DataSource := DMIDRIL.DSxIDRILTransportista;
  G2kTableLoc.DataSource := DMIDRIL.DSxIDRILTransportista;

  GetBitmapFromImageList(SBDirectorioCopiaEtiqueta, 1, DMMain.ILMain_Ac, 65);
  ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(LeeDatoIni('IDRIL', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));

  ERutaServicio.Text := DMIDRIL.RutaGLS;
  if (not FileExists(DMIDRIL.RutaGLS + 'GLS.exe')) then
     ColorError(ERutaServicio)
  else
     ColorInfo(ERutaServicio);
end;

procedure TFMIDRIL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMIDRIL);
end;

procedure TFMIDRIL.DBEAcreedorChange(Sender: TObject);
begin
  inherited;
  ETituloAcreedor.Text := DameTituloAcreedor(StrToIntDef(DBEAcreedor.Text, 0));
end;

procedure TFMIDRIL.DBEAcreedorDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AAcreedores, 'ACREEDOR=' + DBEAcreedor.Text);
end;

procedure TFMIDRIL.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMIDRIL.FormShow(Sender: TObject);
begin
  inherited;
  ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(LeeDatoIni('IDRIL', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
end;

procedure TFMIDRIL.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button in [nbPost] then
  begin
     ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(ERutaCopiaEtiqueta.Text);
     EscribeDatoIni('IDRIL', 'RutaCopiaEtiqueta', ERutaCopiaEtiqueta.Text);
  end
  else
  begin
     ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(LeeDatoIni('IDRIL', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
  end;
end;

procedure TFMIDRIL.SBDirectorioCopiaEtiquetaClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  Directorio := ExcludeTrailingPathDelimiter(ERutaCopiaEtiqueta.Text);
  if MySelectDirectory(Directorio, 'FMIDRIL-DirCopiaEtiqueta') then
     ERutaCopiaEtiqueta.Text := IncludeTrailingPathDelimiter(Directorio);
end;

end.
