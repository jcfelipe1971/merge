unit UFMMoldes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, DbComboBoxValue, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, UHYDescription,
  ULFHYDBDescription, Mask, DBCtrls, ULFDBEdit, ULFLabel, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas, UControlEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, ULFDBMemo, ULFEdit;

type
  TFMMoldes = class(TFPEdit)
     LBLMolde: TLFLabel;
     DBEnum_molde: TLFDbedit;
     DBEDescripMolde: TLFDbedit;
     DescPropietario: TLFHYDBDescription;
     DBEFPropietario: TLFDBEditFind2000;
     LBLPropietario: TLFLabel;
     LFLabel1: TLFLabel;
     DescUbicacion: TLFHYDBDescription;
     LBLTipo_boquilla: TLFLabel;
     CBVTipo_boquilla: TDBComboBoxValue;
     LFLabel2: TLFLabel;
     DBComboBoxValue1: TDBComboBoxValue;
     LBLAlto: TLFLabel;
     DBEAlto: TLFDbedit;
     LBLAncho: TLFLabel;
     DBEAncho: TLFDbedit;
     LBLLargo: TLFLabel;
     DBELargo: TLFDbedit;
     DBEDiametroExpulsor: TLFDbedit;
     LBLDiametro_Expulsor: TLFLabel;
     DBEAroCentrador: TLFDbedit;
     LFLabel3: TLFLabel;
     PDetalle: TLFPanel;
     TLFPage: TLFPageControl;
     TSArtPostiz: TTabSheet;
     TSMaquinas: TTabSheet;
     LFLabel4: TLFLabel;
     DBENCavidades: TLFDbedit;
     LBLFechaLlegada: TLFLabel;
     LBLFechaSalida: TLFLabel;
     DBFFechaLlegada: TLFDBDateEdit;
     DBFFechaSalida: TLFDBDateEdit;
     ChkBActivo: TLFDBCheckBox;
     ChkBCorrederas: TLFDBCheckBox;
     ChkBNoyos: TLFDBCheckBox;
     CBVTipoNoyo: TDBComboBoxValue;
     DBEFUbicacion: TLFDBEditFind2000;
     NavArticuloPostizo: THYMNavigator;
     TSRevisiones: TTabSheet;
     TSReparaciones: TTabSheet;
     DBGFArticuloPostizo: TDBGridFind2000;
     LFToolBar1: TLFToolBar;
     LFToolBar2: TLFToolBar;
     HYMNavigator2: THYMNavigator;
     DBGridFind20002: TDBGridFind2000;
     LFToolBar3: TLFToolBar;
     HYMNavigator3: THYMNavigator;
     DBGridFind20003: TDBGridFind2000;
     LFToolBar4: TLFToolBar;
     HYMNavigator4: THYMNavigator;
     DBGridFind20004: TDBGridFind2000;
     CEArticuloPostizo: TControlEdit;
     CEArticuloPostizoPMEdit: TPopUpTeclas;
     CEMaquinas: TControlEdit;
     CEMaquinasPMEdit: TPopUpTeclas;
     CERevisiones: TControlEdit;
     CERevisionesPMEdit: TPopUpTeclas;
     CEReparaciones: TControlEdit;
     CEReparacionesPMEdit: TPopUpTeclas;
     TSImagen: TTabSheet;
     TBImagenMolde: TLFToolBar;
     LFDbedit1: TLFDbedit;
     LFDbedit2: TLFDbedit;
     ToolButton1: TToolButton;
     NavImagen: THYMNavigator;
     LBLImagen: TLFLabel;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     DBEFImagen: TLFDBEditFind2000;
     CEImagen: TControlEdit;
     CEImagenPMEdit: TPopUpTeclas;
     ETituloImagen: TLFEdit;
     DBChkBFabricado: TLFDBCheckBox;
     DBEFFabricante: TLFDBEditFind2000;
     DescFabricante: TLFHYDBDescription;
     TArticuloPostizo: TToolButton;
     TButton: TToolButton;
     ToolButton3: TToolButton;
     LFActionList1: TLFActionList;
     ANotasDetalle: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AInforme: TAction;
     BCargarImagen: TButton;
     BClipboard: TButton;
     procedure ChkBNoyosChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFPropietarioChange(Sender: TObject);
     procedure DBEFUbicacionChange(Sender: TObject);
     procedure DBGFArticuloPostizoBusqueda(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure TSImagenShow(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFFabricanteChange(Sender: TObject);
     procedure DBChkBFabricadoChange(Sender: TObject);
     procedure TArticuloPostizoClick(Sender: TObject);
     procedure ANotasDetalleExecute(Sender: TObject);
     procedure AInformeExecute(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure NavImagenClick(Sender: TObject; Button: TNavigateBtn);
     procedure BClipboardClick(Sender: TObject);
  private
     { Private declarations }
     // sfg_rsl Se añade búsqueda por artículo postizo
     ArtPostizo: string;
  public
     { Public declarations }
  end;

var
  FMMoldes : TFMMoldes;

implementation

uses UDMMoldes, UFMBusquedaArtPostizo, UDMMain, UFormGest, UFMNotasCampo, UEntorno, UFMLstInformeMoldes, UDameDato, UImagenes;

{$R *.dfm}

procedure TFMMoldes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMMoldes, DMMoldes);
  G2KTableLoc.DataSource := DMMoldes.DSQMCabecera;
end;

procedure TFMMoldes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMoldes);
end;

procedure TFMMoldes.ChkBNoyosChange(Sender: TObject);
begin
  inherited;
  CBVTipoNoyo.Enabled := ChkBNoyos.GetChecked; // Activa/Desactiva el CBV depenent del chkbox
end;

procedure TFMMoldes.DBEFPropietarioChange(Sender: TObject);
begin
  inherited;
  DescPropietario.ActualizaDatos('CLIENTE', DBEFPropietario.Text);
end;

procedure TFMMoldes.DBEFUbicacionChange(Sender: TObject);
begin
  inherited;
  DescUbicacion.ActualizaDatos('ID_UBICACION', DBEFUbicacion.Text);
end;

procedure TFMMoldes.DBGFArticuloPostizoBusqueda(Sender: TObject);
begin
  inherited;
  if Pos('VER_ARTICULOS_CUENTAS', Trim(DBGFArticuloPostizo.TablaABuscar)) > 0 then
  begin
     DBGFArticuloPostizo.Filtros := [obEmpresa, obEjercicio, obCanal];
     DBGFArticuloPostizo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
  end
  else if Trim(DBGFArticuloPostizo.TablaABuscar) = 'EMP_POSTIZOS' then
  begin
     DBGFArticuloPostizo.CondicionBusqueda := '';
     DBGFArticuloPostizo.Filtros := [obEmpresa];
  end;
end;

procedure TFMMoldes.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSImagen) then
  begin
     RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
     ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
  end;
end;

procedure TFMMoldes.TSImagenShow(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, DMMoldes.QMCabeceraIMAGEN.AsInteger);
  ControlEdit := CEImagen;
end;

procedure TFMMoldes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMMoldes.DBEFFabricanteChange(Sender: TObject);
begin
  inherited;
  DescFabricante.ActualizaDatos('PROVEEDOR', DBEFFabricante.Text);
end;

procedure TFMMoldes.DBChkBFabricadoChange(Sender: TObject);
begin
  inherited;
  // Activa/Desactiva el Fabricant depenent del chkbox
  DBEFFabricante.Visible := DBChkBFabricado.GetChecked;
  DescFabricante.Visible := DBChkBFabricado.GetChecked;
end;

// sfg_rsl Se añade búsqueda por artículo postizo
procedure TFMMoldes.TArticuloPostizoClick(Sender: TObject);
begin
  inherited;
  FMBusquedaArtPostizo := TFMBusquedaArtPostizo.Create(Self);
  if (FMBusquedaArtPostizo.ShowModal = mrOk) then
  begin
     ArtPostizo := FMBusquedaArtPostizo.EFArtPostizo.Text;
     if (ArtPostizo <> '') then
        DMMoldes.ActivaFiltro(ArtPostizo, True)
     else
        DMMoldes.ActivaFiltro(ArtPostizo, False);
  end;
end;

procedure TFMMoldes.ANotasDetalleExecute(Sender: TObject);
begin
  inherited;
  DMMoldes.PreparaNotasDetalle;
  EditarCampoNotas(Self, DMMoldes.QMDSReparaciones, DMMoldes.QMReparacionesNOTAS);
end;

procedure TFMMoldes.AInformeExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMLstInformeMoldes, FMLstInformeMoldes, Sender);
  FMLstInformeMoldes.EFMolde.Text := DBEnum_molde.Text;
  FMLstInformeMoldes.TDPFechaListado.Text := DBFFechaLlegada.Text;
  FMLstInformeMoldes.LFLinea.Text := DMMoldes.QMReparacionesLINEA.AsString;
end;

procedure TFMMoldes.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMMoldes.QMCabeceraIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMMoldes.NavImagenClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMMoldes.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMMoldes.QMCabeceraIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

end.
