unit ZUFMSysNCF;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, ULFDBEdit, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFLabel, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel,
  UHYDescription, ULFHYDBDescription, DbComboBoxValue, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox;

type
  TZFMSysNCF = class(TFPEditDetalle)
     LblTipo: TLFLabel;
     LblSerie: TLFLabel;
     DBEFTipo: TLFDBEditFind2000;
     DBEFSerie: TLFDBEditFind2000;
     DBEDescripcion: TLFDbedit;
     LblDescripcion: TLFLabel;
     DescSerie: TLFHYDBDescription;
     Z_LblTipoNCF: TLFLabel;
     DBCBVTipoNCF: TDBLookupComboBox;
     DescTipo: TLFHYDBDescription;
     DBChkBDefecto: TLFDBCheckBox;
     LBLVersionXML: TLFLabel;
     DBCBVersionXML: TDBComboBoxValue;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFTipoChange(Sender: TObject);
     procedure DBEFSerieChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMSysNCF : TZFMSysNCF;

implementation

uses UDMMain, ZUDMSysNCF, UFormGest;

{$R *.dfm}

procedure TZFMSysNCF.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMSysNCF, ZDMSysNCF);
  NavMain.DataSource := ZDMSysNCF.DSQMCabecera;
  DBGMain.DataSource := ZDMSysNCF.DSQMCabecera;
  G2KTableLoc.DataSource := ZDMSysNCF.DSQMCabecera;
end;

procedure TZFMSysNCF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMSysNCF);
  Action := caFree;
end;

procedure TZFMSysNCF.DBEFTipoChange(Sender: TObject);
begin
  inherited;
  DescTipo.ActualizaDatos('TIPO', DBEFTipo.Text);
end;

procedure TZFMSysNCF.DBEFSerieChange(Sender: TObject);
begin
  inherited;
  DescSerie.ActualizaDatos('SERIE', DBEFSerie.Text);
end;

end.
