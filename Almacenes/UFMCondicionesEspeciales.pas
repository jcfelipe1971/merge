unit UFMCondicionesEspeciales;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, ExtCtrls, DBCtrls, Mask, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UHYDESCRIPTION,
  UDBDateTimePicker, rxPlacemnt, NsDBGrid, URecursos, rxToolEdit, RXDBCtrl,
  ULFComboBox, ULFDBEdit, ULFDBEditFind2000, ULFDBCheckBox, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel,
  ULFHYDBDescription, DBActns, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel,
  UG2kTBLoc, ULFEditFind2000, ULFDBDateEdit;

type
  TFMCondicionesEspeciales = class(TFPEdit)
     DBCHKActiva: TLFDBCheckBox;
     DBEFArticulo: TLFDBEditFind2000;
     LBLArticulo: TLFLabel;
     PDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     HYDBDArticulo: TLFHYDBDescription;
     DBECondicion: TLFDbedit;
     LBLCondicion: TLFLabel;
     LBLCliente: TLFLabel;
     DBEFCliente: TLFDBEditFind2000;
     HYDBDCliente: TLFHYDBDescription;
     DBDTPFechaAlta: TLFDBDateEdit;
     DBDTPFechaBaja: TLFDBDateEdit;
     LBLFechaAlta: TLFLabel;
     LBLFechaBaja: TLFLabel;
     ToolButton1: TToolButton;
     CBTipoCondicion: TLFComboBox;
     LBLAgrupacion: TLFLabel;
     DBEFAgrupacion: TLFDBEditFind2000;
     HYDBDAgrupacion: TLFHYDBDescription;
     HYDBDPerfil: TLFHYDBDescription;
     LBLPerfil: TLFLabel;
     DBEFPerfil: TLFDBEditFind2000;
     HYDBDFamilia: TLFHYDBDescription;
     LBLFamilia: TLFLabel;
     DBEFFamilia: TLFDBEditFind2000;
     PBusqueda: TLFPanel;
     EFCliente: TLFEditFind2000;
     EFAgrupacion: TLFEditFind2000;
     EFArticulo: TLFEditFind2000;
     EFPerfil: TLFEditFind2000;
     EFFamilia: TLFEditFind2000;
     LCliente: TLFLabel;
     LAgrupacion: TLFLabel;
     LPerfil: TLFLabel;
     LArticulo: TLFLabel;
     LFamilia: TLFLabel;
     LFCategoryAction1: TLFCategoryAction;
     AConfListadosCondiciones: TAction;
     AVisualizarCondEsp: TLFDatasetAction;
     LFCategoryAction2: TLFCategoryAction;
     AImprimirCondiciones: TLFDatasetAction;
     ASep: TAction;
     DBCHKTraspasar: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFClienteChange(Sender: TObject);
     procedure DBEFArticuloChange(Sender: TObject);
     procedure DBEFArticuloBusqueda(Sender: TObject);
     procedure DBEFFamiliaBusqueda(Sender: TObject);
     procedure CBTipoCondicionChange(Sender: TObject);
     procedure DBEFAgrupacionChange(Sender: TObject);
     procedure DBEFPerfilChange(Sender: TObject);
     procedure DBEFFamiliaChange(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EFClienteChange(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure EFPerfilChange(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure EFFamiliaChange(Sender: TObject);
     procedure AConfListadosCondicionesExecute(Sender: TObject);
     procedure AVisualizarCondEspExecute(Sender: TObject);
     procedure AImprimirCondicionesExecute(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
  private
     { Private declarations }
     SWFil: integer;
     procedure DescripcionesEnBlanco;
     procedure MuestraCliente(Ver: boolean);
     procedure MuestraAgrupacion(Ver: boolean; Tipo: string);
     procedure MuestraPerfil(Ver: boolean);
     procedure MuestraArticulo(Ver: boolean; Posicion: integer);
     procedure MuestraFamilia(Ver: boolean; Posicion: integer);
     procedure MuestraCondicionesFiltradas(tipo: byte);
  public
     { Public declarations }
  end;

var
  FMCondicionesEspeciales : TFMCondicionesEspeciales;

implementation

uses UFormGest, UDMMain, UDMCondicionesEspeciales, UEntorno, UDMLstCondiciones,
  UFMListConfig;

{$R *.DFM}

procedure TFMCondicionesEspeciales.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMCondicionesEspeciales, DMCondicionesEspeciales);
  NavMain.DataSource := DMCondicionesEspeciales.DSQMCondiciones;
  DBGMain.DataSource := DMCondicionesEspeciales.DSQMCondiciones;
  CEMainPMedit.Teclas := DMMain.Teclas;
  SWFil := 0;

  MuestraCliente(False);
  MuestraAgrupacion(False, '');
  MuestraPerfil(False);
  MuestraArticulo(False, 0);
  MuestraFamilia(False, 0);
  DBCHKActiva.Top := 34;
  DBCHKTraspasar.Top := DBCHKActiva.Top;
  // PMain.Height:=118;
  // Self.Height:=339;
  PMain.Height := 162;
  Self.Height := 383;
  CBTipoCondicion.ItemIndex := 0;
  EPMain.VisibleButtons := [neSalir];
  // TButtListados.Enabled:= False;
end;

procedure TFMCondicionesEspeciales.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCondicionesEspeciales);
end;

procedure TFMCondicionesEspeciales.DBEFClienteChange(Sender: TObject);
begin
  HYDBDCliente.ActualizaDatos('CLIENTE', DBEFCliente.Text);
end;

procedure TFMCondicionesEspeciales.DBEFArticuloChange(Sender: TObject);
begin
  HYDBDArticulo.ActualizaDatos('ARTICULO', DBEFArticulo.Text);
end;

procedure TFMCondicionesEspeciales.DBEFArticuloBusqueda(Sender: TObject);
begin
  DBEFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesEspeciales.DBEFFamiliaBusqueda(Sender: TObject);
begin
  DBEFFamilia.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMCondicionesEspeciales.DBEFAgrupacionChange(Sender: TObject);
begin
  HYDBDAgrupacion.ActualizaDatos('AGRUPACION', DBEFAgrupacion.Text);
end;

procedure TFMCondicionesEspeciales.DBEFPerfilChange(Sender: TObject);
begin
  HYDBDPerfil.ActualizaDatos('PERFIL', DBEFPerfil.Text);
end;

procedure TFMCondicionesEspeciales.DBEFFamiliaChange(Sender: TObject);
begin
  HYDBDFamilia.ActualizaDatos('FAMILIA', DBEFFamilia.Text);
end;

procedure TFMCondicionesEspeciales.CBTipoCondicionChange(Sender: TObject);
begin
  SWFil := 0;

  DescripcionesEnBlanco;
  // Filtra según el tipo de condición.
  case CBTipoCondicion.ItemIndex of
     0: DMCondicionesEspeciales.TipoCondicion('ELI', '');
     1: DMCondicionesEspeciales.TipoCondicion('CCA', '');
     2: DMCondicionesEspeciales.TipoCondicion('CAA', '');
     3: DMCondicionesEspeciales.TipoCondicion('CPA', '');
     4: DMCondicionesEspeciales.TipoCondicion('CAR', '');
     5: DMCondicionesEspeciales.TipoCondicion('CCF', '');
     6: DMCondicionesEspeciales.TipoCondicion('CAF', '');
     7: DMCondicionesEspeciales.TipoCondicion('CPF', '');
     8: DMCondicionesEspeciales.TipoCondicion('CFA', '');
     9: DMCondicionesEspeciales.TipoCondicion('CAG', '');
     10: DMCondicionesEspeciales.TipoCondicion('CPE', '');
     11: DMCondicionesEspeciales.TipoCondicion('CAT', ''); //agrupacion articulo / cliente
  end;
  EFCliente.Visible := False;
  EFAgrupacion.Visible := False;
  EFPerfil.Visible := False;
  EFArticulo.Visible := False;
  EFFamilia.Visible := False;
  EFCliente.Text := '';
  EFAgrupacion.Text := '';
  EFPerfil.Text := '';
  EFArticulo.Text := '';
  EFFamilia.Text := '';
  case CBTipoCondicion.ItemIndex of
     1, 5, 11: EFCliente.Visible := True; //sfg.albert - 11- 
  end;
  case CBTipoCondicion.ItemIndex of
     2, 6, 9, 11: EFAgrupacion.Visible := True;
  end;
  case CBTipoCondicion.ItemIndex of
     3, 7, 10: EFPerfil.Visible := True;
  end;
  case CBTipoCondicion.ItemIndex of
     1, 2, 3, 4: EFArticulo.Visible := True;
  end;
  case CBTipoCondicion.ItemIndex of
     5, 6, 7, 8: EFFamilia.Visible := True;
  end;

  // Cambia el aspecto del formulario dependiendo del tipo de condición.
  case CBTipoCondicion.ItemIndex of
     0:
     begin
        DBCHKActiva.Top := 24;
        DBCHKTraspasar.Top := DBCHKActiva.Top;
        // PMain.Height:=118;
        // Self.Height:=339;
        EPMain.VisibleButtons := [neSalir];
        EPMain.Width := 23;
        // TButtListados.Enabled:= False;
     end;
     4, 8, 9, 10:
     begin
        DBCHKActiva.Top := 45;
        DBCHKTraspasar.Top := DBCHKActiva.Top;
        // PMain.Height:=140;
        // Self.Height:=361;
        EPMain.VisibleButtons := [neRango, neSalir];
        EPMain.Width := 46;
        // TButtListados.Enabled:= True;
     end;
     1, 2, 3, 5, 6, 7, 11:
     begin
        DBCHKActiva.Top := 67;
        DBCHKTraspasar.Top := DBCHKActiva.Top;
        // PMain.Height:=162;
        // Self.Height:=383;
        EPMain.VisibleButtons := [neRango, neSalir];
        EPMain.Width := 46;
        // TButtListados.Enabled:= True;
     end;
  end;
  case CBTipoCondicion.ItemIndex of
     0:
     begin
        MuestraCliente(False);
        MuestraAgrupacion(False, '');
        MuestraPerfil(False);
        MuestraArticulo(False, 0);
        MuestraFamilia(False, 0);
     end;
     1:
     begin
        MuestraCliente(True);
        MuestraAgrupacion(False, '');
        MuestraPerfil(False);
        MuestraArticulo(True, 2);
        MuestraFamilia(False, 0);
     end;
     2:
     begin
        MuestraCliente(False);
        MuestraAgrupacion(True, 'C');
        MuestraPerfil(False);
        MuestraArticulo(True, 2);
        MuestraFamilia(False, 0);
     end;
     3:
     begin
        MuestraCliente(False);
        MuestraAgrupacion(False, '');
        MuestraPerfil(True);
        MuestraArticulo(True, 2);
        MuestraFamilia(False, 0);
     end;
     4:
     begin
        MuestraCliente(False);
        MuestraAgrupacion(False, '');
        MuestraPerfil(False);
        MuestraArticulo(True, 1);
        MuestraFamilia(False, 0);
     end;
     5:
     begin
        MuestraCliente(True);
        MuestraAgrupacion(False, '');
        MuestraPerfil(False);
        MuestraArticulo(False, 0);
        MuestraFamilia(True, 2);
     end;
     6:
     begin
        MuestraCliente(False);
        MuestraAgrupacion(True, 'C');
        MuestraPerfil(False);
        MuestraArticulo(False, 0);
        MuestraFamilia(True, 2);
     end;
     7:
     begin
        MuestraCliente(False);
        MuestraAgrupacion(False, '');
        MuestraPerfil(True);
        MuestraArticulo(False, 0);
        MuestraFamilia(True, 2);
     end;
     8:
     begin
        MuestraCliente(False);
        MuestraAgrupacion(False, '');
        MuestraPerfil(False);
        MuestraArticulo(False, 0);
        MuestraFamilia(True, 1);
     end;
     9:
     begin
        MuestraCliente(False);
        MuestraAgrupacion(True, 'C');
        MuestraPerfil(False);
        MuestraArticulo(False, 0);
        MuestraFamilia(False, 0);
     end;
     10:
     begin
        MuestraCliente(False);
        MuestraAgrupacion(False, '');
        MuestraPerfil(True);
        MuestraArticulo(False, 0);
        MuestraFamilia(False, 0);
     end;
     11:
     begin
        MuestraCliente(True);
        MuestraAgrupacion(True, 'T');
        MuestraPerfil(False);
        MuestraArticulo(False, 0);
        MuestraFamilia(False, 0);
     end;
  end;
end;

procedure TFMCondicionesEspeciales.MuestraCliente(Ver: boolean);
begin
  LBLCliente.Visible := Ver;
  DBEFCliente.Visible := Ver;
  HYDBDCliente.Visible := Ver;
end;

procedure TFMCondicionesEspeciales.MuestraAgrupacion(Ver: boolean; Tipo: string);
begin
  LBLAgrupacion.Visible := Ver;
  DBEFAgrupacion.Visible := Ver;
  HYDBDAgrupacion.Visible := Ver;

  EFAgrupacion.Tabla_a_buscar := 'VER_AGRUPACIONES';
  EFAgrupacion.CondicionBusqueda := 'TIPO=''' + Tipo + '''';
  if (Tipo = 'C') then
  begin
     LBLAgrupacion.Top := 28;
     LBLAgrupacion.Caption := _('Agrup. Clientes');
     DBEFAgrupacion.Top := 24;
     HYDBDAgrupacion.Top := 24;
  end;
  if (Tipo = 'T') then
  begin
     LBLAgrupacion.Top := 50;
     LBLAgrupacion.Caption := _('Agrup. Articulos');
     DBEFAgrupacion.Top := 46;
     HYDBDAgrupacion.Top := 46;
  end;
  DBEFAgrupacion.CondicionBusqueda := 'TIPO=''' + Tipo + '''';
end;

procedure TFMCondicionesEspeciales.MuestraPerfil(Ver: boolean);
begin
  LBLPerfil.Visible := Ver;
  DBEFPerfil.Visible := Ver;
  HYDBDPerfil.Visible := Ver;
  LBLPerfil.Top := 28;
  DBEFPerfil.Top := 24;
  HYDBDPerfil.Top := 24;
end;

procedure TFMCondicionesEspeciales.MuestraArticulo(Ver: boolean; Posicion: integer);
begin
  LBLArticulo.Visible := Ver;
  DBEFArticulo.Visible := Ver;
  HYDBDArticulo.Visible := Ver;
  case Posicion of
     1:
     begin
        LBLArticulo.Top := 28;
        DBEFArticulo.Top := 24;
        HYDBDArticulo.Top := 24;
     end;
     2:
     begin
        LBLArticulo.Top := 50;
        DBEFArticulo.Top := 46;
        HYDBDArticulo.Top := 46;
     end;
  end;
end;

procedure TFMCondicionesEspeciales.MuestraFamilia(Ver: boolean; Posicion: integer);
begin
  LBLFamilia.Visible := Ver;
  DBEFFamilia.Visible := Ver;
  HYDBDFamilia.Visible := Ver;
  case Posicion of
     1:
     begin
        LBLFamilia.Top := 28;
        DBEFFamilia.Top := 24;
        HYDBDFamilia.Top := 24;
     end;
     2:
     begin
        LBLFamilia.Top := 50;
        DBEFFamilia.Top := 46;
        HYDBDFamilia.Top := 46;
     end;
  end;
end;

procedure TFMCondicionesEspeciales.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  if (DMCondicionesEspeciales.BusquedaCompleja in [mrOk, mrAll]) then
     SWFil := 1;
  Continua := False;
end;

procedure TFMCondicionesEspeciales.MuestraCondicionesFiltradas(tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DMCondicionesEspeciales.QMCondiciones.SelectSQL);
  AbreData(TDMLstCondiciones, DMLstCondiciones);
  TempSql.AddStrings(DMLstCondiciones.xCabecera.SelectSQL);
  DMLstCondiciones.xCabecera.Close;
  DMLstCondiciones.xCabecera.SelectSQL.Assign(SqlFiltro);
  DMLstCondiciones.MostrarCondicionesFiltradas(tipo, SWFil, CBTipoCondicion.ItemIndex);
  DMLstCondiciones.xCabecera.Close;
  DMLstCondiciones.xCabecera.SelectSQL.Assign(TempSQL);
  CierraData(DMLstCondiciones);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMCondicionesEspeciales.AConfListadosCondicionesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstCondiciones, DMLstCondiciones);
  TFMListConfig.Create(Self).Muestra(139, formato, cabecera, copias,
     pijama, '', DMLstCondiciones.frCondiciones);
  CierraData(DMLstCondiciones);
end;

procedure TFMCondicionesEspeciales.AVisualizarCondEspExecute(Sender: TObject);
begin
  inherited;
  MuestraCondicionesFiltradas(0);
end;

procedure TFMCondicionesEspeciales.AImprimirCondicionesExecute(Sender: TObject);
begin
  inherited;
  MuestraCondicionesFiltradas(1);
end;

procedure TFMCondicionesEspeciales.DescripcionesEnBlanco;
begin
  HYDBDCliente.Text := '';
  HYDBDArticulo.Text := '';
  HYDBDAgrupacion.Text := '';
  HYDBDPerfil.Text := '';
  HYDBDFamilia.Text := '';

  EFCliente.Text := '';
  EFAgrupacion.Text := '';
  EFPerfil.Text := '';
  EFArticulo.Text := '';
  EFFamilia.Text := '';
end;

procedure TFMCondicionesEspeciales.EFClienteChange(Sender: TObject);
var
  Condicion : string;
begin
  inherited;
  Condicion := '';
  if (Trim(EFCliente.Text) > '') then
  begin
     Condicion := ' CLIENTE = ' + EFCliente.Text;
     case CBTipoCondicion.ItemIndex of
        1:
        begin
           if (Trim(EFArticulo.Text) > '') then
              Condicion := Condicion + ' AND ARTICULO = ''' + EFArticulo.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CCA', Condicion);
        end;
        5:
        begin
           if (Trim(EFFamilia.Text) > '') then
              Condicion := Condicion + ' AND FAMILIA = ''' + EFFamilia.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CCF', Condicion);
        end;
     end;
  end
  else
     case CBTipoCondicion.ItemIndex of
        1:
        begin
           if (Trim(EFArticulo.Text) > '') then
              Condicion := ' ARTICULO = ''' + EFArticulo.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CCA', Condicion);
        end;
        5:
        begin
           if (Trim(EFFamilia.Text) > '') then
              Condicion := ' FAMILIA = ''' + EFFamilia.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CCF', Condicion);
        end;
     end;
end;

procedure TFMCondicionesEspeciales.EFAgrupacionChange(Sender: TObject);
var
  Condicion : string;
begin
  inherited;
  Condicion := '';
  if (Trim(EFAgrupacion.Text) > '') then
  begin
     Condicion := ' AGRUPACION = ''' + EFAgrupacion.Text + '''';
     case CBTipoCondicion.ItemIndex of
        2:
        begin
           if (Trim(EFArticulo.Text) > '') then
              Condicion := Condicion + ' AND ARTICULO = ''' + EFArticulo.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CAA', Condicion);
        end;
        6:
        begin
           if (Trim(EFFamilia.Text) > '') then
              Condicion := Condicion + ' AND FAMILIA = ''' + EFFamilia.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CAF', Condicion);
        end;
        9:
        begin
           DMCondicionesEspeciales.TipoCondicion('CAG', Condicion);
        end;
        11:
        begin
           DMCondicionesEspeciales.TipoCondicion('CAT', Condicion);
        end;
     end;
  end
  else
     case CBTipoCondicion.ItemIndex of
        2:
        begin
           if (Trim(EFArticulo.Text) > '') then
              Condicion := ' ARTICULO = ''' + EFArticulo.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CAA', Condicion);
        end;
        6:
        begin
           if (Trim(EFFamilia.Text) > '') then
              Condicion := ' FAMILIA = ''' + EFFamilia.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CAF', Condicion);
        end;
     end;
end;

procedure TFMCondicionesEspeciales.EFPerfilChange(Sender: TObject);
var
  Condicion : string;
begin
  inherited;
  Condicion := '';
  if (Trim(EFPerfil.Text) > '') then
  begin
     Condicion := ' PERFIL = ''' + EFPerfil.Text + '''';
     case CBTipoCondicion.ItemIndex of
        3:
        begin
           if (Trim(EFArticulo.Text) > '') then
              Condicion := Condicion + ' AND ARTICULO = ''' + EFArticulo.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CPA', Condicion);
        end;
        7:
        begin
           if (Trim(EFFamilia.Text) > '') then
              Condicion := Condicion + ' AND FAMILIA = ''' + EFFamilia.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CPF', Condicion);
        end;
        10:
        begin
           DMCondicionesEspeciales.TipoCondicion('CPE', Condicion);
        end;
     end;
  end
  else
     case CBTipoCondicion.ItemIndex of
        3:
        begin
           if (Trim(EFArticulo.Text) > '') then
              Condicion := ' ARTICULO = ''' + EFArticulo.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CPA', Condicion);
        end;
        7:
        begin
           if (Trim(EFFamilia.Text) > '') then
              Condicion := ' FAMILIA = ''' + EFFamilia.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CPF', Condicion);
        end;
     end;
end;

procedure TFMCondicionesEspeciales.EFArticuloChange(Sender: TObject);
var
  Condicion : string;
begin
  inherited;
  Condicion := '';
  if (Trim(EFArticulo.Text) > '') then
  begin
     Condicion := ' ARTICULO = ''' + EFArticulo.Text + '''';
     case CBTipoCondicion.ItemIndex of
        1:
        begin
           if (Trim(EFCliente.Text) > '') then
              Condicion := Condicion + ' AND CLIENTE = ' + EFCliente.Text;
           DMCondicionesEspeciales.TipoCondicion('CCA', Condicion);
        end;
        2:
        begin
           if (Trim(EFAgrupacion.Text) > '') then
              Condicion := Condicion + ' AND AGRUPACION = ''' + EFAgrupacion.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CAA', Condicion);
        end;
        3:
        begin
           if (Trim(EFPerfil.Text) > '') then
              Condicion := Condicion + ' AND PERFIL = ''' + EFPerfil.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CPA', Condicion);
        end;
        4:
        begin
           DMCondicionesEspeciales.TipoCondicion('CAR', Condicion);
        end;
     end;
  end
  else
     case CBTipoCondicion.ItemIndex of
        1:
        begin
           if (Trim(EFCliente.Text) > '') then
              Condicion := ' CLIENTE = ' + EFCliente.Text;
           DMCondicionesEspeciales.TipoCondicion('CCA', Condicion);
        end;
        2:
        begin
           if (Trim(EFAgrupacion.Text) > '') then
              Condicion := ' AGRUPACION = ''' + EFAgrupacion.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CAA', Condicion);
        end;
        3:
        begin
           if (Trim(EFPerfil.Text) > '') then
              Condicion := ' PERFIL = ''' + EFPerfil.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CPA', Condicion);
        end;
     end;
end;

procedure TFMCondicionesEspeciales.EFFamiliaChange(Sender: TObject);
var
  Condicion : string;
begin
  inherited;
  Condicion := '';
  if (Trim(EFFamilia.Text) > '') then
  begin
     Condicion := ' FAMILIA = ''' + EFFamilia.Text + '''';
     case CBTipoCondicion.ItemIndex of
        5:
        begin
           if (Trim(EFCliente.Text) > '') then
              Condicion := Condicion + ' AND CLIENTE = ' + EFCliente.Text;
           DMCondicionesEspeciales.TipoCondicion('CCF', Condicion);
        end;
        6:
        begin
           if (Trim(EFAgrupacion.Text) > '') then
              Condicion := Condicion + ' AND AGRUPACION = ''' + EFAgrupacion.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CAF', Condicion);
        end;
        7:
        begin
           if (Trim(EFPerfil.Text) > '') then
              Condicion := Condicion + ' AND PERFIL = ''' + EFPerfil.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CPF', Condicion);
        end;
        8:
        begin
           DMCondicionesEspeciales.TipoCondicion('CPF', Condicion);
        end;
     end;
  end
  else
     case CBTipoCondicion.ItemIndex of
        5:
        begin
           if (Trim(EFCliente.Text) > '') then
              Condicion := ' CLIENTE = ' + EFCliente.Text;
           DMCondicionesEspeciales.TipoCondicion('CCF', Condicion);
        end;
        6:
        begin
           if (Trim(EFAgrupacion.Text) > '') then
              Condicion := ' AGRUPACION = ''' + EFAgrupacion.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CAF', Condicion);
        end;
        7:
        begin
           if (Trim(EFPerfil.Text) > '') then
              Condicion := ' PERFIL = ''' + EFPerfil.Text + '''';
           DMCondicionesEspeciales.TipoCondicion('CPF', Condicion);
        end;
     end;
end;

procedure TFMCondicionesEspeciales.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
end;

end.
