unit UFMInfoTercero;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, UFIBDBEditfind, StdCtrls, Mask, DB, FIBDataSet, FIBTableDataSet,
  ExtCtrls, UEditPanel, ComCtrls, ToolWin, Grids, DBGrids, UControlEdit,
  UComponentesBusquedaFiltrada, UFormGest, ULFToolBar, ULFDBMemo,
  ULFDBEditFind2000, ULFDBEdit, ULFPageControl, ULFPanel, ULFLabel,
  rxPlacemnt, ULFFormStorage, UFPEditSinNavegador, ActnList, ULFActionList,
  Menus, UTeclas;

type
  TFMInfoTercero = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSFicha: TTabSheet;
     TSContactos: TTabSheet;
     TSDirecciones: TTabSheet;
     TSBancos: TTabSheet;
     TSInformacion: TTabSheet;
     PCabeceraInfo: TLFPanel;
     DBMMNotas: TLFDBMemo;
     DBTTerceroInfo: TDBText;
     DBTTituloInfo: TDBText;
     PNLDirecciones: TLFPanel;
     DBTTerceroDir: TDBText;
     DBTTituloDir: TDBText;
     PNLContactos: TLFPanel;
     DBTTerceroContactos: TDBText;
     DBTTituloContactos: TDBText;
     PNLBancos: TLFPanel;
     DBTTerceroBancos: TDBText;
     DBTTituloBancos: TDBText;
     DBGBancos: TDBGrid;
     DBGDirecciones: TDBGrid;
     DBGContactos: TDBGrid;
     PEdit: TLFPanel;
     LBLTercero: TLFLabel;
     LBLNombre: TLFLabel;
     LBLNIF: TLFLabel;
     LBLDireccion: TLFLabel;
     LBLLocalidad: TLFLabel;
     LBLTelefono: TLFLabel;
     LBLEMail: TLFLabel;
     LBLWeb: TLFLabel;
     LBLProvincia: TLFLabel;
     LBLFax: TLFLabel;
     LBLNum: TLFLabel;
     LBLBloqEsc: TLFLabel;
     LBLPiso: TLFLabel;
     LBLFechaAlta: TLFLabel;
     DBETercero: TLFDbedit;
     DBENombre: TLFDbedit;
     DBECif: TLFDbedit;
     DBETelefono1: TLFDbedit;
     DBETelefono2: TLFDbedit;
     DBETelefax: TLFDbedit;
     DBEEmail: TLFDbedit;
     DBEWeb: TLFDbedit;
     DBELocalidadNombre: TLFDbedit;
     DBECpostal: TLFDbedit;
     DBEProvincia: TLFDbedit;
     DBEPais: TLFDbedit;
     DBEFLocalidad: TLFDBEditFind2000;
     DBE_TitRazones: TLFDbedit;
     DBEDirNombre: TLFDbedit;
     DBEDirBloqEsc: TLFDbedit;
     DBEDirPiso: TLFDbedit;
     DBEDirNumero: TLFDbedit;
     DBEInfoAlta: TLFDbedit;
     DBETipoDir: TLFDBEditFind2000;
     DBEPuerta: TLFDbedit;
     LBLPta: TLFLabel;
     LBLNComercial: TLFLabel;
     DBENComercial: TLFDbedit;
     DBT_TipDir_T: TDBText;
     LClase: TLFLabel;
     DBEClaseDir: TLFDBEditFind2000;
     LBLDireccion2: TLFLabel;
     DBEDireccion2: TLFDbedit;
     DBT_ClasDir_T: TDBText;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MuestraTercero(Tercero: integer);
  end;

var
  FMInfoTercero : TFMInfoTercero;

implementation

uses UDMMain, UDMInfoTercero;

{$R *.DFM}

procedure TFMInfoTercero.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMInfoTercero, DMInfoTercero);
  PCMain.ActivePage := TSFicha;
end;

procedure TFMInfoTercero.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMInfoTercero);
end;

procedure TFMInfoTercero.MuestraTercero(Tercero: integer);
begin
  DMInfoTercero.SeleccionaTercero(Tercero);
end;

end.
