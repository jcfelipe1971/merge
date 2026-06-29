unit UFPregABCVentasKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, ComCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, ToolWin, Spin,
  ULFActionList, ULFPageControl, ULFToolBar, HYFIBQuery, FIBDataSetRO,
  ULFMemo, rxToolEdit, ULFDateEdit, ULFDBEdit, ULFEditFind2000, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFComboBox, ULFPanel, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple;

type
  TFPRegABCVentasKri = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     PBajo: TLFPanel;
     AAcumularABC: TAction;
     TBCalculos: TLFToolBar;
     CBCanales: TLFComboBox;
     ToolButton2: TToolButton;
     CBAlmacenes: TLFComboBox;
     ToolButton3: TToolButton;
     CBBorrado: TLFCheckBox;
     TButtSep4: TToolButton;
     TButtAcumula: TToolButton;
     ToolButton1: TToolButton;
     Label6: TLFLabel;
     CBMoneda: TLFComboBox;
     PCAbc: TLFPageControl;
     TSAgente: TTabSheet;
     PAgente: TLFPanel;
     LBLFechas: TLFLabel;
     Label1: TLFLabel;
     LEjercicioAge: TLFLabel;
     LNivel: TLFLabel;
     RGAgentes: TRadioGroup;
     EFAgrupacion: TLFEditFind2000;
     EFAgente: TLFEditFind2000;
     DBEAgente: TLFDBEdit;
     DBEAgrupacion: TLFDBEdit;
     DTPFechaH: TLFDateEdit;
     DTPFechaD: TLFDateEdit;
     EFAgenteH: TLFEditFind2000;
     DBEAgenteh: TLFDBEdit;
     CBOrden: TLFComboBox;
     CHKComparaAge: TLFCheckBox;
     SEEjercicioAge: TSpinEdit;
     EFAgrupacionH: TLFEditFind2000;
     DBEAgrupacionH: TLFDBEdit;
     CBVolumen: TLFComboBox;
     CHKVerCosteAge: TLFCheckBox;
     CBNiveles: TLFComboBox;
     EFFamD: TLFEditFind2000;
     EFFamH: TLFEditFind2000;
     DBFamD: TLFDBEdit;
     DBFamH: TLFDBEdit;
     CBTipoCli: TLFComboBox;
     CHKTipoCli: TLFCheckBox;
     CBRutaDesde: TLFComboBox;
     CBRutaHasta: TLFComboBox;
     TSClientes: TTabSheet;
     PClientes: TLFPanel;
     LFechaCalculo: TLFLabel;
     LOrdenadoPorClientes: TLFLabel;
     LEjercicioCli: TLFLabel;
     LNivelCli: TLFLabel;
     LListadosEntreLosAgentes: TLFLabel;
     LDesdeAgente: TLFLabel;
     LHastaAgente: TLFLabel;
     RGClientes: TRadioGroup;
     EFCliente: TLFEditFind2000;
     DBECliente: TLFDBEdit;
     DBEAgrupacionCli: TLFDBEdit;
     DTPFechahCli: TLFDateEdit;
     DTPFechadCli: TLFDateEdit;
     EFClienteH: TLFEditFind2000;
     DBEClienteH: TLFDBEdit;
     CBOrdenCli: TLFComboBox;
     EFAgrupacionCli: TLFEditFind2000;
     CHKComparaCli: TLFCheckBox;
     SEEjercicioCli: TSpinEdit;
     EFAGrupacionCliH: TLFEditFind2000;
     DBEAgrupacionCliH: TLFDBEdit;
     CHKVerCosteCli: TLFCheckBox;
     EFFAmDesde: TLFEditFind2000;
     EFFAmHasta: TLFEditFind2000;
     DBEFamDesde: TLFDBEdit;
     DBEFamHasta: TLFDBEdit;
     CBNivelesCli: TLFComboBox;
     EFAgenteDesde: TLFEditFind2000;
     EFAgenteHasta: TLFEditFind2000;
     DBEAgenteDesde: TLFDBEdit;
     DBEAgenteHasta: TLFDBEdit;
     PSelFamilia: TLFPanel;
     EFFamilia: TLFEditFind2000;
     TBorrar: TButton;
     MSeleccion: TLFMemo;
     bAgregarFamilia: TButton;
     TSArticulos: TTabSheet;
     PNArticulos: TLFPanel;
     LOrdenadoPorArticulos: TLFLabel;
     LFechaCalculoArticulos: TLFLabel;
     LEjercicioArt: TLFLabel;
     LListadoDeFamilias: TLFLabel;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     LBLNivel: TLFLabel;
     RGArticulos: TRadioGroup;
     EFArticuloD: TLFEditFind2000;
     EFArticuloH: TLFEditFind2000;
     DBEArticuloH: TLFDBEdit;
     DBEArticuloD: TLFDBEdit;
     CBOrdenArt: TLFComboBox;
     DTPFechadArt: TLFDateEdit;
     DTPFechahArt: TLFDateEdit;
     CHKComparaArt: TLFCheckBox;
     SEEjercicioArt: TSpinEdit;
     CHKVerCosteArt: TLFCheckBox;
     EFFamiliaDesde: TLFEditFind2000;
     EFFamiliaHasta: TLFEditFind2000;
     DBEFamiliaDesde: TLFDBEdit;
     DBEFamiliaHasta: TLFDBEdit;
     EFamdesde: TLFEditFind2000;
     EfamHasta: TLFEditFind2000;
     DBFamDesde: TLFDBEdit;
     DBFamHasta: TLFDBEdit;
     CHKFamilias: TLFCheckBox;
     CBNivelArt: TLFComboBox;
     PNLFiltroAgentes: TLFPanel;
     LFPanel1: TLFPanel;
     PNLFiltroClientes: TLFPanel;
     PNLFiltroFamiliaArticulos: TLFPanel;
     PNLFiltroArticulos: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFAgenteChange(Sender: TObject);
     procedure RGAgentesClick(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure EFAgenteHChange(Sender: TObject);
     procedure TButtConfigurarClick(Sender: TObject);
     procedure EFClienteChange(Sender: TObject);
     procedure EFClienteHChange(Sender: TObject);
     procedure EFAgrupacionCliChange(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
     procedure AAcumularABCExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure PCAbcChange(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure EFAgrupacionHChange(Sender: TObject);
     procedure CBVolumenKeyPress(Sender: TObject; var Key: char);
     procedure CBTipoCliKeyPress(Sender: TObject; var Key: char);
     procedure CBMonedaKeyPress(Sender: TObject; var Key: char);
     procedure CBAlmacenesKeyPress(Sender: TObject; var Key: char);
     procedure CBCanalesKeyPress(Sender: TObject; var Key: char);
     procedure CBNivelesKeyPress(Sender: TObject; var Key: char);
     procedure CBOrdenKeyPress(Sender: TObject; var Key: char);
     procedure CBRutaDesdeKeyPress(Sender: TObject; var Key: char);
     procedure CBRutaHastaKeyPress(Sender: TObject; var Key: char);
     procedure EFFAmDesdeChange(Sender: TObject);
     procedure EFFAmDesdeBusqueda(Sender: TObject);
     procedure EFFAmHastaBusqueda(Sender: TObject);
     procedure EFFAmHastaChange(Sender: TObject);
     procedure EFFamDChange(Sender: TObject);
     procedure EFFamHChange(Sender: TObject);
     procedure EFFamDBusqueda(Sender: TObject);
     procedure EFFamiliaDesdeChange(Sender: TObject);
     procedure EFFamiliaDesdeBusqueda(Sender: TObject);
     procedure EFFamiliaHastaChange(Sender: TObject);
     procedure EFFamiliaHastaBusqueda(Sender: TObject);
     procedure EFamdesdeBusqueda(Sender: TObject);
     procedure EFamdesdeChange(Sender: TObject);
     procedure EfamHastaBusqueda(Sender: TObject);
     procedure EfamHastaChange(Sender: TObject);
     procedure CHKFamiliasClick(Sender: TObject);
     procedure EFFamiliaKeyPress(Sender: TObject; var Key: char);
     procedure bAgregarFamiliaClick(Sender: TObject);
     procedure TBorrarClick(Sender: TObject);
  private
     { Private declarations }
     procedure Habilita;
     procedure Carga;
     procedure AcumularABC;
     procedure CargaComboVol;
     procedure CargaCombo_Moneda;
     procedure CargaCombo_TipoCli;
     procedure CargaCombo_Rutas;
  public
     { Public declarations }
     semaforo_agente: integer;
     semaforo_cliente: integer;
     semaforo_articulo: integer;
     function Damegrupo: integer;
  end;

var
  FPRegABCVentasKri : TFPRegABCVentasKri;

implementation

uses UDMMain, UDMABCVentasKri, UFormGest, UEntorno, UFMListConfig, URellenaLista;

{$R *.DFM}

procedure TFPRegABCVentasKri.FormCreate(Sender: TObject);
var
  i, p : integer;
  f : string;
  Q : THYFIBQuery;
  DS : TFIBDataSetRO;
begin
  inherited;
  AbreData(TDMABCVentasKri, DMABCVentasKri);
  RellenaCanales(CBCanales.Items); {dji lrk kri - Memory Leak}
  RellenaAlmacenes(CBAlmacenes.Items); {dji lrk kri - Memory Leak}
  Carga;
  semaforo_agente := 0;
  semaforo_cliente := 0;
  semaforo_articulo := 0;

  {recupera la ultima seleccion dji lrk kri}
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT MAX(ENTRADA) FROM TMP_ABC_SEL_FAM WHERE EMPRESA=' + REntorno.EmpresaStr;
     ExecQuery;
     i := FieldByName['MAX'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);

  DS := TFIBDataSetRO.Create(nil);
  with DS do
  begin
     try
        DataBase := DMMain.DataBase;
        Transaction := DMABCVentasKri.TLocal;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT FAMILIA FROM TMP_ABC_SEL_FAM WHERE ');
        SelectSQL.Add('EMPRESA=' + REntorno.EmpresaStr + ' AND ENTRADA=' + IntToStr(i) + ' ORDER BY FAMILIA ');
        Open;
        while not EOF do
        begin
           MSeleccion.Text := MSeleccion.Text + FieldByName('FAMILIA').AsString + ' - ';
           Next;
        end;
     finally
        Free;
     end;
  end;

  i := 0;
  p := 1;
  while ((i < Length(MSeleccion.Text)) and (p > 0)) do
  begin
     p := Pos('-', Copy(MSeleccion.Text, i, Length(MSeleccion.Text)));
     f := Trim(Copy(MSeleccion.Text, i, p - 1));
     i := i + p + 1;
     if (f <> '') then
     begin
        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'INSERT INTO TMP_ABC_SEL_FAM (EMPRESA,ENTRADA,FAMILIA) ' +
                 'VALUES(' + REntorno.EmpresaStr + ',' + REntorno.EntradaStr + ',''' + f + ''')';
              ExecQuery;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
     end;
  end;
end;

procedure TFPRegABCVentasKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  TBorrarClick(Sender);
  CierraData(DMABCVentasKri);
end;

procedure TFPRegABCVentasKri.Carga;
begin
  CargaCombo_Moneda;
  CargaCombo_TipoCli;
  CargaCombo_Rutas;
  CBrutaDesde.ItemIndex := 0;
  CBrutaHasta.ItemIndex := 0;
  CBTipoCli.ItemIndex := 0;
  CBMoneda.ItemIndex := 1;
  PCAbc.ActivePage := TSAgente;
  // Agentes
  CargaComboVol;
  SEEjercicioAge.Value := REntorno.Ejercicio - 1;
  CHKVerCosteAge.Checked := True;
  CHKComparaAge.Checked := False;
  CBCanales.ItemIndex := 0;
  CBAlmacenes.ItemIndex := 0;
  CBOrden.ItemIndex := 0;
  CBVolumen.ItemIndex := 0;
  CBNiveles.ItemIndex := 0;
  CBNivelesCli.ItemIndex := 0;
  EFAgente.Text := '1';
  EFAgenteh.Text := IntToStr(DMABCVentasKri.DameAgenteh);
  EFAgrupacion.Text := DMABCVentasKri.DameAgrupacion;
  EFAgrupacionH.Text := DMABCVentasKri.DameAgrupacionH;
  EFFamD.Text := DMABCVentasKri.DameFamiliaMin;
  EFFamH.Text := DMABCVentasKri.DameFamiliaMax;
  DTPFechaD.Date := DMABCVentasKri.FechaEjercicio;
  DTPFechaH.Date := REntorno.FechaTrabSH;
  // Clientes
  CHKVerCosteCli.Checked := True;
  SEEjercicioCli.Value := REntorno.Ejercicio - 1;
  CBOrdenCli.ItemIndex := 0;
  EFCliente.Text := '-1';
  EFClienteh.Text := IntToStr(DMABCVentasKri.DameClienteh);
  EFAgenteDesde.Text := '1';
  EFAgenteHasta.Text := IntToStr(DMABCVentasKri.DameAgenteH);
  EFAgrupacionCli.Text := DMABCVentasKri.DameAgrupacion;
  EFAgrupacionCliH.Text := DMABCVentasKri.DameAgrupacionH;
  EFFamDesde.Text := DMABCVentasKri.DameFamiliaMin;
  EFFamHasta.Text := DMABCVentasKri.DameFamiliaMax;
  DTPFechaDCli.Date := DMABCVentasKri.FechaEjercicio;
  DTPFechaHCli.Date := REntorno.FechaTrabSH;
  // Articulos
  RGarticulos.ItemIndex := 0;
  CHKVerCosteArt.Checked := True;
  SEEjercicioArt.Value := REntorno.Ejercicio - 1;
  CBOrdenArt.ItemIndex := 0;
  EFArticuloD.Text := DMABCVentasKri.DameArticuloMin;
  EFArticuloH.Text := DMABCVentasKri.DameArticuloMax;
  DTPFechaDArt.Date := DMABCVentasKri.FechaEjercicio;
  DTPFechaHArt.Date := REntorno.FechaTrabSH;
  EFFamiliaDesde.Text := DMABCVentasKri.DameFamiliaMin;
  EFFamiliaHasta.Text := DMABCVentasKri.DameFamiliaMax;
  EFamDesde.Text := DMABCVentasKri.DameFamiliaMin;
  EFamHasta.Text := DMABCVentasKri.DameFamiliaMax;
  // Habilita los EFinf corectos
  Habilita;
end;

procedure TFPRegABCVentasKri.Habilita;
begin
  if RGAgentes.ItemIndex = 0 then
  begin
     EFAgente.Visible := True;
     DBEAgente.Visible := True;
     EFAgenteh.Visible := True;
     DBEAgenteh.Visible := True;
     CBTipoCli.Visible := True;
     CHKTipoCli.Visible := True;
     EFAgrupacion.Visible := False;
     DBEAgrupacion.Visible := False;
     EFAgrupacionH.Visible := False;
     DBEAgrupacionH.Visible := False;
     LNivel.Visible := False;
     CBNiveles.Visible := False;
  end;
  if RGAgentes.ItemIndex = 1 then
  begin
     EFAgrupacion.Visible := True;
     EFAgrupacionH.Visible := True;
     DBEAgrupacion.Visible := True;
     DBEAgrupacionH.Visible := True;
     LNivel.Visible := False;
     CBNiveles.Visible := False;
     EFFAmD.Visible := False;
     EFFamH.Visible := False;
     DBFAmD.Visible := False;
     DBFAmH.Visible := False;
     LNivel.Visible := False;
     CBVolumen.Visible := False;
     CBTipoCli.Visible := False;
     CHKTipoCli.Visible := False;
  end;
  if RGAgentes.ItemIndex = 2 then
  begin
     EFAgrupacion.Visible := False;
     DBEAgrupacion.Visible := False;
     EFAgrupacionH.Visible := False;
     DBEAgrupacionH.Visible := False;
     LNivel.Visible := False;
     CBNiveles.Visible := False;
     CBVolumen.Visible := False;
     CBTipoCli.Visible := False;
     CHKTipoCli.Visible := False;
     EFFAmD.Visible := True;
     EFFamH.Visible := True;
     DBFAmD.Visible := True;
     DBFAmH.Visible := True;
     LNivel.Visible := True;
     CBNiveles.Visible := True;
  end;
  if RGAgentes.ItemIndex = 3 then
  begin
     EFAgrupacion.Visible := False;
     DBEAgrupacion.Visible := False;
     EFAgrupacionH.Visible := False;
     DBEAgrupacionH.Visible := False;
     EFFAmD.Visible := False;
     EFFamH.Visible := False;
     DBFAmD.Visible := False;
     DBFAmH.Visible := False;
     LNivel.Visible := False;
     PSelFamilia.Visible := False;
     CBNiveles.Visible := False;
     CBTipoCli.Visible := False;
     CHKTipoCli.Visible := False;
     CBVolumen.Visible := True;
  end;
  if RGClientes.ItemIndex = 0 then
  begin
     EFCliente.Visible := True;
     DBECliente.Visible := True;
     EFClienteh.Visible := True;
     DBEClienteh.Visible := True;
     EFAgrupacionCli.Visible := False;
     DBEAgrupacionCli.Visible := False;
     EFAgrupacionCliH.Visible := False;
     DBEAgrupacionCliH.Visible := False;
     CBNivelesCli.Visible := False;
     LNivelCli.Visible := False;
     PSelFamilia.Visible := False;
  end;
  if RGClientes.ItemIndex = 1 then
  begin
     EFCliente.Visible := True;
     DBECliente.Visible := True;
     EFClienteh.Visible := True;
     DBEClienteh.Visible := True;
     EFFamDesde.Visible := False;
     EFFamHasta.Visible := False;
     DBEFAmDesde.Visible := False;
     DBEFamHasta.Visible := False;
     PSelFamilia.Visible := False;
     EFAgrupacionCli.Visible := True;
     DBEAgrupacionCli.Visible := True;
     EFAgrupacionCliH.Visible := True;
     DBEAgrupacionCliH.Visible := True;
     CBNivelesCli.Visible := False;
     LNivelCli.Visible := False;
  end;
  if RGClientes.ItemIndex = 2 then
  begin
     EFAgrupacionCli.Visible := False;
     DBEAgrupacionCli.Visible := False;
     EFAgrupacionCliH.Visible := False;
     DBEAgrupacionCliH.Visible := False;
     EFFamDesde.Visible := True;
     EFFamHasta.Visible := True;
     DBEFamDesde.Visible := True;
     DBEFamHasta.Visible := True;
     PSelFamilia.Visible := False;
     CBNivelesCli.Visible := True;
     LNivelCli.Visible := True;
  end;
  if RGClientes.ItemIndex = 3 then
  begin
     EFAgrupacionCli.Visible := False;
     DBEAgrupacionCli.Visible := False;
     EFAgrupacionCliH.Visible := False;
     DBEAgrupacionCliH.Visible := False;
     EFFamDesde.Visible := False;
     EFFamHasta.Visible := False;
     DBEFamDesde.Visible := False;
     DBEFamHasta.Visible := False;
     PSelFamilia.Visible := True;
     CBNivelesCli.Visible := True;
     LNivelCli.Visible := True;
  end;
  if RGArticulos.ItemIndex = 0 then
  begin
     EFArticuloD.Visible := True;
     DBEArticuloD.Visible := True;
     EFArticuloH.Visible := True;
     DBEArticuloH.Visible := True;
  end;
end;

procedure TFPRegABCVentasKri.CargaComboVol;
var
  i : integer;
begin
  DMABCVentasKri.xTipos_volumenes.Open;
  DMABCVentasKri.xTipos_volumenes.First;
  CBVolumen.Items.Clear;
  i := 0;
  CBVolumen.Items.Add(_('Todos'));
  while (not DMABCVentasKri.xTipos_volumenes.EOF) do
  begin
     CBVolumen.Items.Add(DMABCVentasKri.xTipos_volumenes.FieldByName(
        'Agrupacion').AsString + '   ' +
        DMABCVentasKri.xTipos_volumenes.FieldByName(
        'titulo').AsString);

     DMABCVentasKri.xTipos_volumenes.Next;
     Inc(i);
  end;
  CBVolumen.ItemIndex := i;
  DMABCVentasKri.xTipos_volumenes.Close;
end;

procedure TFPRegABCVentasKri.CargaCombo_Moneda;
{var
  i : integer;}
begin
  {TODO -oDuilio : Que cargue de la lista de monedas de DMMain}
  CBMoneda.Items.Add('EUR' + '   ' + 'Euro');
  {
  DMMain.QMonedas.Execquery;
  CBMoneda.Items.Clear;
  i := 0;
  while ( not DMMain.QMonedas.EOF) do
  begin
    CBMoneda.Items.add(DMMain.QMonedas.FieldByName['Moneda'].AsString + '   ' +
      DMMain.QMonedas.FieldByName['titulo'].AsString);
    DMMain.QMonedas.Next;
    Inc(i);
  end;
  CBMoneda.ItemIndex := i;
  DMMain.QMonedas.Close;
  DMMain.QMonedas.FreeHandle;
}
end;

procedure TFPRegABCVentasKri.CargaCombo_TipoCli;
var
  i : integer;
begin
  DMABCVentasKri.QTipo_cli.Params.ByName['Empresa'].AsInteger := REntorno.empresa;
  DMABCVentasKri.QTipo_cli.ExecQuery;
  CBTipoCli.Items.Clear;
  i := 0;
  CBTipoCli.Items.Add('TODOS');
  while (not DMABCVentasKri.QTipo_cli.EOF) do
  begin
     if (DMABCVentasKri.QTipo_cli.FieldByName['Tipo_Cliente'].AsString <> '') then
        CBTipoCli.Items.Add(
           DMABCVentasKri.QTipo_cli.FieldByName['Tipo_Cliente'].AsString);
     DMABCVentasKri.QTipo_cli.Next;
     Inc(i);
  end;
  CBTipoCli.ItemIndex := i;
  DMABCVentasKri.QTipo_cli.Close;
  DMABCVentasKri.QTipo_cli.FreeHandle;
end;

procedure TFPRegABCVentasKri.CargaCombo_Rutas;
var
  i : integer;
begin
  DMABCVentasKri.QRutas.Params.ByName['Empresa'].AsInteger := REntorno.empresa;
  DMABCVentasKri.QRutas.ExecQuery;
  CBRutaDesde.Items.Clear;
  CBRutaHasta.Items.Clear;
  i := 0;
  while (not DMABCVentasKri.QRutas.EOF) do
  begin
     CBRutaDesde.Items.Add(
        IntToStr(DMABCVentasKri.QRutas.FieldByName['Ruta'].AsInteger));
     CBRutaHasta.Items.Add(
        IntToStr(DMABCVentasKri.QRutas.FieldByName['Ruta'].AsInteger));
     DMABCVentasKri.QRutas.Next;
     Inc(i);
  end;
  CBRutaDesde.ItemIndex := i;
  CBRutaHasta.ItemIndex := i;
  DMABCVentasKri.QRutas.Close;
  DMABCVentasKri.QRutas.FreeHandle;
end;

procedure TFPRegABCVentasKri.EFAgenteChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaAgente(StrToIntDef(EFAgenteDesde.Text, 0));
end;

procedure TFPRegABCVentasKri.RGAgentesClick(Sender: TObject);
begin
  Habilita;
end;

procedure TFPRegABCVentasKri.AcumularABC;
var
  Todos_canales, Todos_Almacenes, borrar, comparar : smallint;
  Canal : integer;
  Almacen, Tipo_Volumen : string;
  EjercicioB : integer;
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;
  TButtPrevisualizar.Enabled := True;
  TButtImprimir.Enabled := True;
  Almacen := Trim(Copy(CBAlmacenes.Text, 1, 3)); {dji lrk kri}
  Todos_Canales := 0;
  Tipo_Volumen := '';
  Todos_Almacenes := 0;
  comparar := 0;
  DMABCVentasKri.Moneda := Trim(Copy(CBMoneda.Text, 1, 3));
  DMABCVentasKri.Nivel := StrToInt(Trim(CBNiveles.Text));
  if CBBorrado.Checked then
     borrar := 1
  else
     borrar := 0;

  if (CBAlmacenes.Text = _('Todos los Almacenes')) then
  begin                                      // Elección de almacenes
     Todos_Almacenes := 1;
     Almacen := REntorno.AlmacenDefecto;
  end
  else
     Almacen := Trim(Copy(CBAlmacenes.Text, 1, 3));

  if CBCanales.Text = _('Todos los Canales') then
  begin
     Todos_Canales := 1;                     // Elección de Canales
     canal := 1;
  end
  else
     canal := StrToIntDef(Copy(CBCanales.Text, 7, Length(CBCanales.Text) - 6), 0);

  EjercicioB := 0;
  if (PCAbc.ActivePage = TSAgente)  // Comparación con otro año
  then
  begin
     EjercicioB := SEEjercicioAge.Value;
     if (CHKComparaAge.Checked) then
        Comparar := 1;
  end;

  if (PCAbc.ActivePage = TSClientes)  // Comparación con otro año
  then
  begin
     EjercicioB := SEEjercicioCli.Value;
     if (CHKComparaCli.Checked) then
        Comparar := 1;
  end;

  if (PCAbc.ActivePage = TSArticulos)  // Comparación con otro año
  then
  begin
     EjercicioB := SEEjercicioArt.Value;
     if (CHKComparaArt.Checked) then
        Comparar := 1;
  end;

  if (RGAgentes.ItemIndex = 3) then // Clasificación de clientes por volumen de compra
     case CbVolumen.ItemIndex of
        0: Tipo_Volumen := 'T';    //Todos
        1: Tipo_Volumen := 'A';    //>10.000.000
        2: Tipo_Volumen := 'A1';   //>5.000.000
        3: Tipo_Volumen := 'B';    //>4.000.000
        4: Tipo_Volumen := 'C';    //>3.000.000
        5: Tipo_Volumen := 'D';    //>2.000.000
        6: Tipo_Volumen := 'E';    //>1.000.000
        7: Tipo_Volumen := 'F';    //>300.000
        8: Tipo_Volumen := 'F1';   //<300.000
        9: Tipo_Volumen := 'G';    //Venta 0
     end;

  if (PCAbc.ActivePage = TSAgente) then
  begin
     semaforo_agente := 1;
     DMABCVentasKri.grupo := damegrupo;
     DMABCVentasKri.Acumula(Canal, Almacen, Tipo_Volumen, EFagrupacion.Text,
        EFAgrupacionH.Text,
        EFFamD.Text, EFFamH.Text, EjercicioB,
        Todos_Almacenes, Todos_Canales,
        Comparar, StrToIntDef(EFAgente.Text, 0),
        StrToIntDef(EFAgenteh.Text, 0),
        StrToIntDef(cbRutaDesde.Text, 0),
        StrToIntDef(cbRutaHasta.Text, 0), RGAgentes.ItemIndex, borrar,
        Trunc(DTPFechaD.Date),
        Trunc(DTPFechaH.Date));
  end;

  if (PCAbc.ActivePage = TSClientes) then
  begin
     semaforo_cliente := 1;
     DMABCVentasKri.grupo := damegrupo;
     DMABCVentasKri.AcumulaCli(Canal, Almacen, EFAGrupacionCli.Text,
        EFAGrupacionCliH.Text, EFFamDesde.Text, EfFamHasta.Text, Todos_Canales,
        Todos_almacenes, Comparar, EjercicioB,
        0, Borrar, StrToIntDef(EFcliente.Text, 0),
        StrToIntDef(EFClienteh.Text, 0),
        StrToIntDef(EFAgenteDesde.Text, 0), StrToIntDef(EFAgenteHasta.Text, 0),
        Trunc(DTPFechaDCli.Date),
        Trunc(DTPFechaHCli.Date));
  end;
  if (PCAbc.ActivePage = TSArticulos) then
  begin
     semaforo_articulo := 1;
     DMABCVentasKri.grupo := damegrupo;
     if (CHKFamilias.State = CBUnChecked) then
        DMABCVentasKri.AcumulaArt(canal, almacen, EFarticuloD.Text,
           EFArticuloH.Text, EffamiliaDesde.Text, EFFamiliaHasta.Text
           , Todos_canales, Todos_Almacenes, Comparar, EjercicioB,
           0, Borrar, Trunc(DTPFechaDArt.Date),
           Trunc(DTPFechaHArt.Date))
     else
        DMABCVentasKri.AcumulaArt(canal, almacen, EFarticuloD.Text,
           EFArticuloH.Text, EfamDesde.Text, EFamHasta.Text
           , Todos_canales, Todos_Almacenes, Comparar, EjercicioB,
           1, Borrar, Trunc(DTPFechaDArt.Date),
           Trunc(DTPFechaHArt.Date));
  end;
end;

procedure TFPRegABCVentasKri.ARecargarExecute(Sender: TObject);
begin
  Carga;
end;

procedure TFPRegABCVentasKri.APrevExecute(Sender: TObject);
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;
  DMABCVentasKri.grupo := damegrupo;
  DMABCVentasKri.Tipo_cliente := Trim(CBtipoCli.Text);
  if PcABC.ActivePage = TSAgente then
  begin
     DMABCVentasKri.nivel := StrToInt(Trim(CBNiveles.Text));
     if (CHKVerCosteAge.Checked) then
        DMABCVentasKri.VerCoste := 1
     else
        DMABCVentasKri.VerCoste := 0;
     if (RGAgentes.ItemIndex = 3) then // Clasificación de clientes por volumen de compra
        case CbVolumen.ItemIndex of
           0: DMABCVentasKri.Volumen_Cli := 'T';       //Todos
           1: DMABCVentasKri.Volumen_Cli := 'A';       //>10.000.000
           2: DMABCVentasKri.Volumen_Cli := 'A1';      //>5.000.000
           3: DMABCVentasKri.Volumen_Cli := 'B';       //>4.000.000
           4: DMABCVentasKri.Volumen_Cli := 'C';       //>3.000.000
           5: DMABCVentasKri.Volumen_Cli := 'D';       //>2.000.000
           6: DMABCVentasKri.Volumen_Cli := 'E';       //>1.000.000
           7: DMABCVentasKri.Volumen_Cli := 'F';       //>300.000
           8: DMABCVentasKri.Volumen_Cli := 'F1';      //<300.000
           9: DMABCVentasKri.Volumen_Cli := 'G';       //Venta 0
        end;
     DMABCVentasKri.Muestra(0, 0, CBOrden.ItemIndex, DTPFechaD.Date, DTPFechaH.Date);
  end;
  if PcABC.ActivePage = TSClientes then
  begin
     if (CHKVerCosteCli.Checked) then
        DMABCVentasKri.VerCoste := 1
     else
        DMABCVentasKri.VerCoste := 0;
     DMABCVentasKri.Nivel := StrToInt(Trim(cbnivelesCli.Text));
     DMABCVentasKri.Muestra(0, 1, CBOrdenCli.ItemIndex, DTPFechaDCli.Date,
        DTPFechaHCli.Date);
  end;
  if PcABC.ActivePage = TSArticulos then
  begin
     if (CHKVerCosteArt.Checked) then
        DMABCVentasKri.VerCoste := 1
     else
        DMABCVentasKri.VerCoste := 0;
     DMABCVentasKri.Nivel := CBNivelArt.ItemIndex + 1;
     DMABCVentasKri.Muestra(0, 2, CBOrdenArt.ItemIndex, DTPFechaDArt.Date,
        DTPFechaHArt.Date);
  end;
end;

procedure TFPRegABCVentasKri.AImprimirExecute(Sender: TObject);
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;
  DMABCVentasKri.grupo := damegrupo;
  DMABCVentasKri.Tipo_cliente := Trim(CBtipoCli.Text);
  DMABCVentasKri.nivel := StrToInt(Trim(CBNiveles.Text));
  if PcABC.ActivePage = TSAgente then
     DMABCVentasKri.Muestra(1, 0, CBOrden.ItemIndex, DTPFechaD.Date, DTPFechaH.Date);
  if PcABC.ActivePage = TSClientes then
     DMABCVentasKri.Muestra(1, 1, CBOrdenCli.ItemIndex, DTPFechaDCli.Date,
        DTPFechaHCli.Date);
  if PcABC.ActivePage = TSArticulos then
     DMABCVentasKri.Muestra(1, 2, CBOrdenArt.ItemIndex, DTPFechaDArt.Date,
        DTPFechaHArt.Date);
end;

procedure TFPRegABCVentasKri.EFAgenteHChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaAgenteh(StrToIntDef(EFAgenteHasta.Text, 0));
end;

procedure TFPRegABCVentasKri.TButtConfigurarClick(Sender: TObject);
var
  formato, cabecera, copias, pijama, grupo : integer;
begin
  grupo := damegrupo;
  TFMListConfig.Create(Self).Muestra(grupo, formato, cabecera, copias,
     pijama, '', DMABCVentasKri.frAbc);
end;

function TFPRegABCVentasKri.Damegrupo: integer;
begin
  Result := 0;
  if (PCAbc.ActivePage.Name = 'TSAgente') then
  begin
     if ((RGAgentes.ItemIndex = 0) and (CHKComparaAge.Checked = False)) then
        Result := 5028;
     if ((RGAgentes.ItemIndex = 0) and (CHKComparaAge.Checked = True)) then
        Result := 5029;
     if ((RGAgentes.ItemIndex = 0) and (CHKTipoCli.Checked = True)) then
        Result := 5050;
     if ((RGAgentes.ItemIndex = 1) and (CHKComparaAge.Checked = False)) then
        Result := 5030;
     if ((RGAgentes.ItemIndex = 1) and (CHKComparaAge.Checked = True)) then
        Result := 5031;
     if ((RGAgentes.ItemIndex = 3) and (CHKComparaAge.Checked = False)) then
        Result := 5032;
     if ((RGAgentes.ItemIndex = 3) and (CHKComparaAge.Checked = True)) then
        Result := 5033;
     if ((RGAgentes.ItemIndex = 2) and (CHKComparaAge.Checked = False)) then
        Result := 5034;
     if ((RGAgentes.ItemIndex = 2) and (CHKComparaAge.Checked = True)) then
        Result := 5035;
     if (RGAgentes.ItemIndex = 4) then
        Result := 5049;
     if (RGAgentes.ItemIndex = 5) {Por Familias 1 digito} then
        Result := 5054;
  end;
  if (PCAbc.ActivePage.Name = 'TSClientes') then
  begin
     if ((RGClientes.ItemIndex = 0) and (CBAlmacenes.Text <> 'Todos los Almacenes') and
        (CHKComparaCli.Checked = False)) then
        Result := 5036;
     if ((RGClientes.ItemIndex = 0) and (CBAlmacenes.Text <> 'Todos los Almacenes') and
        (CHKComparaCli.Checked = True)) then
        Result := 5037;
     if ((RGClientes.ItemIndex = 0) and (CBAlmacenes.Text = 'Todos los Almacenes') and
        (CHKComparaCli.Checked = False)) then
        Result := 5038;
     if ((RGClientes.ItemIndex = 0) and (CBAlmacenes.Text = 'Todos los Almacenes') and
        (CHKComparaCli.Checked = True)) then
        Result := 5039;
     if ((RGClientes.ItemIndex = 2) and (CBAlmacenes.Text <> 'Todos los Almacenes') and
        (CHKComparaCli.Checked = False)) then
        Result := 5040;
     if ((RGClientes.ItemIndex = 2) and (CBAlmacenes.Text <> 'Todos los Almacenes') and
        (CHKComparaCli.Checked = True)) then
        Result := 5041;
     if ((RGClientes.ItemIndex = 2) and (CBAlmacenes.Text = 'Todos los Almacenes'))
     // and (CHKComparaCli.Checked=False))
     then
        Result := 5042;                // En previsión de que nos pidan el Comparado
     if ((RGClientes.ItemIndex = 3) {and (CBAlmacenes.Text <> 'Todos los Almacenes') and
      (CHKComparaCli.Checked = true)}) then
        Result := 5055;

     if ((RGClientes.ItemIndex = 1) and (CBAlmacenes.Text <> 'Todos los Almacenes') and
        (CHKComparaCli.Checked = False)) then
        Result := 5043;
     if ((RGClientes.ItemIndex = 1) and (CBAlmacenes.Text <> 'Todos los Almacenes') and
        (CHKComparaCli.Checked = True)) then
        Result := 5044;
     if ((RGClientes.ItemIndex = 1) and (CBAlmacenes.Text = 'Todos los Almacenes') and
        (CHKComparaCli.Checked = False)) then
        Result := 5045;
     if ((RGClientes.ItemIndex = 1) and (CBAlmacenes.Text = 'Todos los Almacenes') and
        (CHKComparaCli.Checked = True)) then
        Result := 5046;
  end;
  if (PCAbc.ActivePage.Name = 'TSArticulos') then
  begin
     if (RGArticulos.ItemIndex = 0) then
     begin
        if (CHKComparaArt.Checked = False) then
           Result := 5047;
        if (CHKComparaArt.Checked = True) then
           Result := 5048;
     end;
     if (RGArticulos.ItemIndex = 1) then
     begin
        if (CBAlmacenes.Text <> _('Todos los Almacenes')) then
           Result := 5051;
        if (CBAlmacenes.Text = _('Todos los Almacenes')) then
           Result := 5052;
     end;
     if (CHKFamilias.Checked = True) then
        Result := 5053;
  end;
end;

procedure TFPRegABCVentasKri.EFClienteChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaCliente(StrToIntDef(EFCliente.Text, 0));
end;

procedure TFPRegABCVentasKri.EFClienteHChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaClienteh(StrToIntDef(EFClienteh.Text, 0));
end;

procedure TFPRegABCVentasKri.EFAgrupacionCliChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaAgrupacionCli(EFAgrupacionCli.Text);
end;

procedure TFPRegABCVentasKri.EFArticuloDChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaArticuloD(EFArticuloD.Text);
end;

procedure TFPRegABCVentasKri.EFArticuloHChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaArticuloh(EFArticuloh.Text);
end;

procedure TFPRegABCVentasKri.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentasKri.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentasKri.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

// Acumular ABCs
procedure TFPRegABCVentasKri.AAcumularABCExecute(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     AcumularABC;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFPRegABCVentasKri.FormShow(Sender: TObject);
begin
  EFAgente.SetFocus;
end;

procedure TFPRegABCVentasKri.PCAbcChange(Sender: TObject);
begin
  if PcABC.ActivePage = TSAgente then
     if semaforo_agente = 0 then
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
  if PcABC.ActivePage = TSClientes then
     if semaforo_cliente = 0 then
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

procedure TFPRegABCVentasKri.EFAgrupacionChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaAgrupacionCli(EFAgrupacion.Text);
end;

procedure TFPRegABCVentasKri.EFAgrupacionHChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaAgrupacionCliH(EFAgrupacionCliH.Text);
end;

procedure TFPRegABCVentasKri.CBVolumenKeyPress(Sender: TObject; var Key: char);
begin
  Key := #0;
end;

procedure TFPRegABCVentasKri.CBTipoCliKeyPress(Sender: TObject; var Key: char);
begin
  Key := #0;
end;

procedure TFPRegABCVentasKri.CBMonedaKeyPress(Sender: TObject; var Key: char);
begin
  Key := #0;
end;

procedure TFPRegABCVentasKri.CBAlmacenesKeyPress(Sender: TObject; var Key: char);
begin
  Key := #0;
end;

procedure TFPRegABCVentasKri.CBCanalesKeyPress(Sender: TObject; var Key: char);
begin
  Key := #0;
end;

procedure TFPRegABCVentasKri.CBNivelesKeyPress(Sender: TObject; var Key: char);
begin
  Key := #0;
end;

procedure TFPRegABCVentasKri.CBOrdenKeyPress(Sender: TObject; var Key: char);
begin
  Key := #0;
end;

procedure TFPRegABCVentasKri.CBRutaDesdeKeyPress(Sender: TObject; var Key: char);
begin
  Key := #0;
end;

procedure TFPRegABCVentasKri.CBRutaHastaKeyPress(Sender: TObject; var Key: char);
begin
  Key := #0;
end;

procedure TFPRegABCVentasKri.EFFAmDesdeChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaFamiliaD(EFFamDesde.Text);
end;

procedure TFPRegABCVentasKri.EFFAmDesdeBusqueda(Sender: TObject);
begin
  EFFamDesde.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentasKri.EFFAmHastaBusqueda(Sender: TObject);
begin
  EFFamHasta.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentasKri.EFFAmHastaChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaFamiliaH(EFFamHasta.Text);
end;

procedure TFPRegABCVentasKri.EFFamDChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaFamiliaD(EFFamD.Text);
end;

procedure TFPRegABCVentasKri.EFFamHChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaFamiliaH(EFFamH.Text);
end;

procedure TFPRegABCVentasKri.EFFamDBusqueda(Sender: TObject);
begin
  EFFamD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentasKri.EFFamiliaDesdeChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaFamiliaD(EFFamiliaDesde.Text);
end;

procedure TFPRegABCVentasKri.EFFamiliaDesdeBusqueda(Sender: TObject);
begin
  EFFamiliaDesde.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentasKri.EFFamiliaHastaChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaFamiliaH(EFFamiliaHasta.Text);
end;

procedure TFPRegABCVentasKri.EFFamiliaHastaBusqueda(Sender: TObject);
begin
  EFFamiliaHasta.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentasKri.EFamdesdeBusqueda(Sender: TObject);
begin
  EFamDesde.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentasKri.EFamdesdeChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaFamiliaD2(EFamDesde.Text);
end;

procedure TFPRegABCVentasKri.EfamHastaBusqueda(Sender: TObject);
begin
  EFamHasta.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPRegABCVentasKri.EfamHastaChange(Sender: TObject);
begin
  DMABCVentasKri.CambiaFamiliaH2(EFamHasta.Text);
end;

procedure TFPRegABCVentasKri.CHKFamiliasClick(Sender: TObject);
begin
  if (CHKFamilias.Checked = True) then
  begin
     LBLNivel.Visible := True;
     CHKComparaArt.State := cbChecked;
     CBNivelArt.Visible := True;
     DBEFamiliaDesde.Enabled := False;
     DBEFamiliaHasta.Enabled := False;
     RGArticulos.Enabled := False;
  end
  else
  begin
     LBLNivel.Visible := False;
     CBNivelArt.Visible := False;
     DBEFamiliaDesde.Enabled := True;
     DBEFamiliaHasta.Enabled := True;
     RGArticulos.Enabled := True;
  end;
end;

procedure TFPRegABCVentasKri.EFFamiliaKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  if (Key = #13) then
     bAgregarFamiliaClick(Sender);
end;

procedure TFPRegABCVentasKri.bAgregarFamiliaClick(Sender: TObject);
var
  Q : THYFIBQuery;
  DS : TFIBDataSetRO;
begin
  inherited;
  if (EFFamilia.Text > '') then
  begin
     // Inserto la familia seleccionada a la seleccion
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'INSERT INTO TMP_ABC_SEL_FAM (EMPRESA,ENTRADA,FAMILIA) ' +
              'VALUES(' + REntorno.EmpresaStr + ',' + REntorno.EntradaStr + ',''' + EFFamilia.Text + ''')';
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     // Releo para mostrar la seleccion
     DS := TFIBDataSetRO.Create(nil);
     with DS do
     begin
        try
           DataBase := DMMain.DataBase;
           Transaction := DMABCVentasKri.TLocal;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT FAMILIA FROM TMP_ABC_SEL_FAM WHERE ');
           SelectSQL.Add('EMPRESA=' + REntorno.EmpresaStr + ' AND ENTRADA=' + REntorno.EntradaStr + ' ORDER BY FAMILIA ');
           Open;
           while not EOF do
           begin
              MSeleccion.Text := MSeleccion.Text + FieldByName('FAMILIA').AsString + ' - ';
              Next;
           end;
        finally
           Free;
        end;
     end;
  end;

  EFFamilia.Text := '';
  EFFamilia.SetFocus;
end;

procedure TFPRegABCVentasKri.TBorrarClick(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  inherited;
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_ABC_SEL_FAM ' +
           'WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND ENTRADA=' + REntorno.EntradaStr;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  MSeleccion.Lines.Clear;
end;

end.
