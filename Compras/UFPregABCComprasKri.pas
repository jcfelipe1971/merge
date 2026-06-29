unit UFPregABCComprasKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, ComCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, ToolWin, Spin,
  ULFActionList, ULFPageControl, ULFToolBar, rxToolEdit, ULFDateEdit,
  ULFDBEdit, ULFEditFind2000, ULFLabel, ULFPanel, ULFComboBox,
  TFlatCheckBoxUnit, ULFCheckBox, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPRegABCComprasKri = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     TBCalculos: TLFToolBar;
     CBCanales: TLFComboBox;
     ToolButton2: TToolButton;
     CBAlmacenes: TLFComboBox;
     ToolButton3: TToolButton;
     CBBorrado: TLFCheckBox;
     TButtSep4: TToolButton;
     TButtAcumula: TToolButton;
     AAcumularABC: TAction;
     PCAbc: TLFPageControl;
     TSProveedores: TTabSheet;
     PClientes: TLFPanel;
     LFechaCalculoProveedores: TLFLabel;
     LORdenadoPorProveedores: TLFLabel;
     RGProveedores: TRadioGroup;
     EFProveedorD: TLFEditFind2000;
     DBEProveedorD: TLFDBEdit;
     DTPFechahPro: TLFDateEdit;
     DTPFechadPro: TLFDateEdit;
     EFProveedorH: TLFEditFind2000;
     DBEProveedorH: TLFDBEdit;
     CBOrdenPro: TLFComboBox;
     TSArticulos: TTabSheet;
     PNArticulos: TLFPanel;
     LOrdenadoPorArticulos: TLFLabel;
     LFechaCalculoArticulos: TLFLabel;
     RGArticulos: TRadioGroup;
     EFArticuloD: TLFEditFind2000;
     EFArticuloH: TLFEditFind2000;
     EFFamiliaD: TLFEditFind2000;
     EFFamiliaH: TLFEditFind2000;
     DBEFamiliaH: TLFDBEdit;
     DBEFamiliaD: TLFDBEdit;
     DBEArticuloH: TLFDBEdit;
     DBEArticuloD: TLFDBEdit;
     CBOrdenArt: TLFComboBox;
     DTPFechadArt: TLFDateEdit;
     DTPFechahArt: TLFDateEdit;
     CBNiveles: TLFComboBox;
     LNivel: TLFLabel;
     CHKComparaArt: TLFCheckBox;
     CHKComparaProv: TLFCheckBox;
     SEEjercicioArt: TSpinEdit;
     LEjercicioArt: TLFLabel;
     SEEjercicioProv: TSpinEdit;
     LEjercicioProv: TLFLabel;
     CHKConventas: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure TButtConfigurarClick(Sender: TObject);
     procedure EFProveedorDChange(Sender: TObject);
     procedure EFProveedorHChange(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure EFFamiliaDBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
     procedure RGHabilitaClick(Sender: TObject);
     procedure AAcumularABCExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure PCAbcChange(Sender: TObject);
     procedure CHKComparaArtClick(Sender: TObject);
     procedure CHKComparaProvClick(Sender: TObject);
  private
     { Private declarations }
     semaforo_proveedor: integer;
     semaforo_acreedor: integer;
     semaforo_articulo: integer;
     procedure Habilita;
     procedure Carga;
     procedure AcumularABC;
     function Damegrupo: integer;
  public
     { Public declarations }
  end;

var
  FPRegABCComprasKri : TFPRegABCComprasKri;

implementation

uses UDMABCComprasKri, UFormGest, UEntorno, UFMListConfig, UDMMain, URellenaLista;

{$R *.DFM}

procedure TFPRegABCComprasKri.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMABCComprasKri, DMABCComprasKri);
  RellenaCanales(CBCanales.Items); {dji lrk kri - Memory Leak}
  RellenaAlmacenes(CBAlmacenes.Items); {dji lrk kri - Memory Leak}
  Carga;
  semaforo_proveedor := 0;
  semaforo_acreedor := 0;
  semaforo_articulo := 0;
end;

procedure TFPRegABCComprasKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMABCComprasKri);
end;

procedure TFPRegABCComprasKri.Carga;
begin
  PCAbc.ActivePage := TSProveedores;
  CBCanales.ItemIndex := 0;
  CBAlmacenes.ItemIndex := 0;
  CHKComparaProv.Checked := False;
  CHKconventas.Checked := False;
  CBNiveles.ItemIndex := 0;
  // Proveedores
  CBOrdenPro.ItemIndex := 0;
  EFProveedorD.Text := '-1';
  EFProveedorH.Text := IntToStr(DMAbcComprasKri.DameProveedor);
  DTPFechaDPro.Date := DMAbcComprasKri.FechaEjercicio;
  DTPFechaHPro.Date := REntorno.FechaTrabSH;
  // Articulos
  CBOrdenArt.ItemIndex := 0;
  EFArticuloD.Text := DMAbcComprasKri.DameArticuloMin;
  EFArticuloH.Text := DMAbcComprasKri.DameArticuloMax;
  EFFamiliaD.Text := DMAbcComprasKri.DameFamiliaMin;
  EFFamiliaH.Text := DMAbcComprasKri.DameFamiliaMax;
  DTPFechaDArt.Date := DMAbcComprasKri.FechaEjercicio;
  DTPFechaHArt.Date := REntorno.FechaTrabSH;

  // Habilita los EFind correctos
  Habilita;
end;

procedure TFPRegABCComprasKri.Habilita;
begin
  if RGProveedores.ItemIndex = 0 then
  begin
     EFProveedorD.Visible := True;
     DBEProveedorD.Visible := True;
     EFProveedorH.Visible := True;
     DBEProveedorH.Visible := True;
  end
  else
  begin
     EFProveedorD.Visible := False;
     DBEProveedorD.Visible := False;
     EFProveedorH.Visible := False;
     DBEProveedorH.Visible := False;
  end;
  if RGArticulos.ItemIndex = 0 then
  begin
     CBOrdenArt.Items.Clear;
     CBOrdenArt.Items.Add(_('Codigo Artículo Ascendente'));
     CBOrdenArt.Items.Add(_('Codigo Artículo Descendente'));
     CBOrdenArt.Items.Add(_('Nombre Artículo Ascendente'));
     CBOrdenArt.Items.Add(_('Nombre Artículo Descendente'));
     CBOrdenArt.Items.Add(_('Total Compras Ascendente'));
     CBOrdenArt.Items.Add(_('Total Compras Descendente'));
     CBOrdenArt.ItemIndex := 0;
     EFArticuloD.Visible := True;
     DBEArticuloD.Visible := True;
     EFArticuloH.Visible := True;
     DBEArticuloH.Visible := True;
     EFFamiliaD.Visible := False;
     EFFamiliaH.Visible := False;
     DBEFamiliaD.Visible := False;
     DBEFamiliaH.Visible := False;
     LNivel.Visible := False;
     CBNiveles.Visible := False;
     CHKConventas.Visible := False;
  end
  else
  begin
     CBOrdenArt.Items.Clear;
     CBOrdenArt.Items.Add(_('Codigo Família Ascendente'));
     CBOrdenArt.Items.Add(_('Codigo Família Descendente'));
     CBOrdenArt.Items.Add(_('Nombre Família Ascendente'));
     CBOrdenArt.Items.Add(_('Nombre Família Descendente'));
     CBOrdenArt.Items.Add(_('Total Compras Ascendente'));
     CBOrdenArt.Items.Add(_('Total Compras Descendente'));
     CBOrdenArt.ItemIndex := 0;
     EFArticuloD.Visible := False;
     DBEArticuloD.Visible := False;
     EFArticuloH.Visible := False;
     DBEArticuloH.Visible := False;
     LNivel.Visible := True;
     CBNiveles.Visible := True;
     EFFamiliaD.Visible := True;
     EFFamiliaH.Visible := True;
     DBEFamiliaD.Visible := True;
     DBEFamiliaH.Visible := True;
     CHKConventas.Visible := True;
  end;
end;

procedure TFPRegABCComprasKri.RGHabilitaClick(Sender: TObject);
begin
  Habilita;
end;

// Acumular ABCs
procedure TFPRegABCComprasKri.AcumularABC;
var
  Todos_Almacenes, Todos_canales, borrar, comparar, Conventas : smallint;
  canal : integer;
  Almacen : string;
  nivel : integer;
  ejercicioB : integer;
begin
  Todos_Almacenes := 0;
  Todos_Canales := 0;
  comparar := 0;
  Conventas := 0;
  nivel := StrToInt(CBNiveles.Text);
  ejercicioB := 0;

  if ((PCAbc.ActivePage = TSProveedores) and (CHKComparaProv.Checked = True)) then
  begin                                         //coomparativa en proveedores
     ejercicioB := SEEjercicioProv.Value;
     comparar := 1;
  end;

  if ((PCAbc.ActivePage = TSArticulos) and (CHKComparaArt.Checked = True)) then
  begin                                       //Comparativa en Articulos
     ejercicioB := SEEjercicioArt.Value;
     comparar := 1;
  end;

  if ((PCAbc.ActivePage = TSArticulos) and (CHKConventas.Checked = True)) then
  begin
     CBAlmacenes.ItemIndex := 0;
     Conventas := 1;                      //Último listado de Familias
  end;

  if (CBBorrado.Checked) then
     borrar := 1                                 //limpiar tabla antes de acumular
  else
     borrar := 0;

  if (CBAlmacenes.Text = _('Todos los Almacenes')) then
  begin                                      //Elección de almacenes
     Todos_Almacenes := 1;
     Almacen := REntorno.AlmacenDefecto;
  end
  else
     Almacen := Trim(Copy(CBAlmacenes.Text, 1, 3)); {dji lrk kri}

  if CBCanales.Text = _('Todos los Canales') then
  begin
     Todos_Canales := 1;                     //elección de Canales
     canal := 1;
  end
  else
     canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);

  // ABC de Proveedores
  if (PCAbc.ActivePage = TSProveedores) then
  begin
     semaforo_proveedor := 1;
     DMABCComprasKri.AcumulaPro(canal, Almacen, ejercicioB, Todos_Almacenes, Todos_canales, comparar,
        StrToIntDef(EFProveedorD.Text, 0), StrToIntDef(EFProveedorH.Text, 0),
        RGProveedores.ItemIndex, borrar, Trunc(DTPFechaDPro.Date), Trunc(DTPFechaHPro.Date));
  end

  // ABC de Artículos
  else if (PCAbc.ActivePage = TSArticulos) then
  begin
     semaforo_articulo := 1;
     DMABCComprasKri.AcumulaArt(canal, Todos_canales, Todos_Almacenes,
        RGArticulos.ItemIndex, borrar, comparar, ejercicioB, nivel, conventas, Almacen,
        EFarticuloD.Text, EFArticuloH.Text, EFFamiliaD.Text,
        EFFamiliaH.Text, Trunc(DTPFechaDArt.Date), Trunc(DTPFechaHArt.Date));
  end;

  if TBMain.CanFocus then
     TBMain.SetFocus;
  TButtPrevisualizar.Enabled := True;
  TButtImprimir.Enabled := True;
  Almacen := Trim(Copy(CBAlmacenes.Text, 1, 3)); {dji lrk kri}
end;

procedure TFPRegABCComprasKri.ARecargarExecute(Sender: TObject);
begin
  Carga;
end;

procedure TFPRegABCComprasKri.APrevExecute(Sender: TObject);
begin
  DMAbcComprasKri.grupo := damegrupo;
  if PcABC.ActivePage = TSProveedores then
     DMAbcComprasKri.Muestra(0, 0, CBOrdenPro.ItemIndex, StrToInt(CBNiveles.Text), DTPFechaDPro.Date, DTPFechaHPro.Date);

  if ((PcABC.ActivePage = TSArticulos) and (RGArticulos.ItemIndex = 0)) then
     DMAbccomprasKri.Muestra(0, 1, CBOrdenArt.ItemIndex, StrToInt(CBNiveles.Text), DTPFechaDArt.Date, DTPFechaHArt.Date);

  if ((PcABC.ActivePage = TSArticulos) and (RGArticulos.ItemIndex = 1)) then
     DMAbccomprasKri.Muestra(0, 2, CBOrdenArt.ItemIndex, StrToInt(CBNiveles.Text), DTPFechaDArt.Date, DTPFechaHArt.Date);
end;

procedure TFPRegABCComprasKri.AImprimirExecute(Sender: TObject);
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;
  DMAbcComprasKri.grupo := damegrupo; //Le indicamos ya el grupo que se va a imprimir
  if PcABC.ActivePage = TSProveedores then
     DMAbcComprasKri.Muestra(1, 0, CBOrdenPro.ItemIndex, StrToInt(CBNiveles.Text), DTPFechaDPro.Date, DTPFechaHPro.Date);
  if ((PcABC.ActivePage = TSArticulos) and (RGArticulos.ItemIndex = 0)) then
     DMAbccomprasKri.Muestra(1, 1, CBOrdenArt.ItemIndex, StrToInt(CBNiveles.Text), DTPFechaDArt.Date, DTPFechaHArt.Date);
  if ((PcABC.ActivePage = TSArticulos) and (RGArticulos.ItemIndex = 1)) then
     DMAbccomprasKri.Muestra(1, 2, CBOrdenArt.ItemIndex, StrToInt(CBNiveles.Text), DTPFechaDArt.Date, DTPFechaHArt.Date);
end;

function TFPRegABCComprasKri.Damegrupo: integer;
begin
  Result := 0;
  if (PCAbc.ActivePage.Name = 'TSProveedores') then
  begin
     if ((CBAlmacenes.Text <> _('Todos los Almacenes')) and (CHKComparaProv.Checked = False)) then
        Result := 5016;
     if ((CBAlmacenes.Text <> _('Todos los Almacenes')) and (CHKComparaProv.Checked = True)) then
        Result := 5017;
     if ((CBAlmacenes.Text = _('Todos los Almacenes')) and (CHKComparaProv.Checked = False)) then
        Result := 5015;
     if ((CBAlmacenes.Text = _('Todos los Almacenes')) and (CHKComparaProv.Checked = True)) then
        Result := 5018;
  end
  else
  begin
     if ((PCAbc.ActivePage.Name = 'TSArticulos') and (RGArticulos.ItemIndex = 0)) then
     begin
        if ((CBAlmacenes.Text <> _('Todos los Almacenes')) and (CHKComparaArt.Checked = False)) then
           Result := 5019;
        if ((CBAlmacenes.Text <> _('Todos los Almacenes')) and (CHKComparaArt.Checked = True)) then
           Result := 5020;
        if ((CBAlmacenes.Text = _('Todos los Almacenes')) and (CHKComparaArt.Checked = False)) then
           Result := 5021;
        if ((CBAlmacenes.Text = _('Todos los Almacenes')) and (CHKComparaArt.Checked = True)) then
           Result := 5022;
     end
     else
     begin
        if ((PCAbc.ActivePage.Name = 'TSArticulos') and (RGArticulos.ItemIndex = 1)) then
        begin
           if ((CBAlmacenes.Text <> _('Todos los Almacenes')) and (CHKComparaArt.Checked = False)) then
              Result := 5023;
           if ((CBAlmacenes.Text <> _('Todos los Almacenes')) and (CHKComparaArt.Checked = True)) then
              Result := 5024;
           if ((CBAlmacenes.Text = _('Todos los Almacenes')) and (CHKComparaArt.Checked = False)) then
              Result := 5025;
           if ((CBAlmacenes.Text = _('Todos los Almacenes')) and (CHKComparaArt.Checked = True)) then
              Result := 5026;
           if ((CBAlmacenes.Text = _('Todos los Almacenes')) and (CHKComparaArt.Checked = False) and (CHKConventas.Checked = True)) then
              Result := 5027;
        end;
     end;
  end;
end;

procedure TFPRegABCComprasKri.TButtConfigurarClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama, Grupo : integer;
begin
  grupo := damegrupo;
  TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', DMABCComprasKri.frAbc);
end;

procedure TFPRegABCComprasKri.EFProveedorDChange(Sender: TObject);
begin
  DMABCComprasKri.CambiaProveedorD(StrToIntDef(EFProveedorD.Text, 0));
end;

procedure TFPRegABCComprasKri.EFProveedorHChange(Sender: TObject);
begin
  DMABCComprasKri.CambiaProveedorH(StrToIntDef(EFProveedorH.Text, 0));
end;

procedure TFPRegABCComprasKri.EFArticuloDChange(Sender: TObject);
begin
  DMABCComprasKri.CambiaArticuloD(EFArticuloD.Text);
end;

procedure TFPRegABCComprasKri.EFArticuloHChange(Sender: TObject);
begin
  DMABCComprasKri.CambiaArticuloh(EFArticuloh.Text);
end;

procedure TFPRegABCComprasKri.EFFamiliaDChange(Sender: TObject);
begin
  DMABCComprasKri.CambiaFamiliaD(EFFamiliaD.Text);
end;

procedure TFPRegABCComprasKri.EFFamiliaHChange(Sender: TObject);
begin
  DMABCComprasKri.CambiaFamiliaH(EFFamiliaH.Text);
end;

procedure TFPRegABCComprasKri.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCComprasKri.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCComprasKri.EFFamiliaDBusqueda(Sender: TObject);
begin
  EFFamiliaD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCComprasKri.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamiliaH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

// Acumular ABCs
procedure TFPRegABCComprasKri.AAcumularABCExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     AcumularABC;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFPRegABCComprasKri.FormShow(Sender: TObject);
begin
  EFProveedorD.SetFocus;
end;

procedure TFPRegABCComprasKri.PCAbcChange(Sender: TObject);
begin
  if PcABC.ActivePage = TSProveedores then
     if semaforo_proveedor = 0 then
     begin
        if TBMain.CanFocus then
           TBMain.SetFocus;
        TButtPrevisualizar.Enabled := False;
        TButtImprimir.Enabled := False;
     end
     else
     begin
        if TBMain.CanFocus then
           TBMain.SetFocus;
        TButtPrevisualizar.Enabled := True;
        TButtImprimir.Enabled := True;
     end;
  if PcABC.ActivePage = TSArticulos then
     if semaforo_articulo = 0 then
     begin
        if TBMain.CanFocus then
           TBMain.SetFocus;
        TButtPrevisualizar.Enabled := False;
        TButtImprimir.Enabled := False;
     end
     else
     begin
        if TBMain.CanFocus then
           TBMain.SetFocus;
        TButtPrevisualizar.Enabled := True;
        TButtImprimir.Enabled := True;
     end;
end;

procedure TFPRegABCComprasKri.CHKComparaArtClick(Sender: TObject);
begin
  if (not (CHKComparaArt.Checked) and (RGArticulos.ItemIndex = 1)) then
     CHKConventas.Visible := True;
  if (CHKComparaArt.Checked) then
     (CHKConventas.Checked := False);
  LEjercicioArt.Visible := CHKComparaArt.Checked;
  SEEjercicioArt.Visible := CHKComparaArt.Checked;
  if (SEEjercicioArt.Visible = True) then
     SEEjercicioArt.Value := REntorno.Ejercicio - 1;
end;

procedure TFPRegABCComprasKri.CHKComparaProvClick(Sender: TObject);
begin
  LEjercicioProv.Visible := CHKComparaProv.Checked;
  SEEjercicioProv.Visible := CHKComparaProv.Checked;
  if (SEEjercicioProv.Visible = True) then
     SEEjercicioProv.Value := REntorno.Ejercicio - 1;
end;

end.
