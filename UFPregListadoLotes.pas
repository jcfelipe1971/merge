unit UFPregListadoLotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, Mask,
  UHYDescription, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  UFormGest, DBCtrls, rxToolEdit, ULFDBEdit, ULFCheckBox, ULFActionList,
  ULFPageControl, ULFToolBar, ULFEditFind2000, TFlatCheckBoxUnit, ULFEdit,
  ULFLabel, rxPlacemnt, ULFFormStorage, ULFDateEdit, ExtCtrls, ULFPanel,
  UFPEditListadoSimple;

type
  TFPregListadoLotes = class(TFPEditListadoSimple)
     LHastaLote: TLFLabel;
     LDesdeLote: TLFLabel;
     EFLoteDesde: TLFEditFind2000;
     EFLoteHasta: TLFEditFind2000;
     CHKAlmacen: TLFCheckBox;
     LDesdeAlmacen: TLFLabel;
     LHastaAlmacen: TLFLabel;
     EFAlmacenDesde: TLFEditFind2000;
     EFAlmacenHasta: TLFEditFind2000;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     CHKFamilias: TLFCheckBox;
     EFFamDesde: TLFEditFind2000;
     EFFamHasta: TLFEditFind2000;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     CHKArticulos: TLFCheckBox;
     EFArtDesde: TLFEditFind2000;
     EFArtHasta: TLFEditFind2000;
     GBFAbricacion: TGroupBox;
     GBEnvasado: TGroupBox;
     GBCaducidad: TGroupBox;
     DTPFabricacionD: TLFDateEdit;
     DTPFabricacionH: TLFDateEdit;
     LDesdeFechaFabricacion: TLFLabel;
     LHastaFechaFabricacion: TLFLabel;
     LDesdeFechaEnvasado: TLFLabel;
     LHastaFechaEnvasado: TLFLabel;
     LDesdeFechaCaducidad: TLFLabel;
     LHastaFechaCaducidad: TLFLabel;
     DTPEnvasadoD: TLFDateEdit;
     DTPEnvasadoH: TLFDateEdit;
     DTPCaducidadD: TLFDateEdit;
     DTPCaducidadH: TLFDateEdit;
     CHKFabricacion: TLFCheckBox;
     CHKEnvasado: TLFCheckBox;
     CHKCaducidad: TLFCheckBox;
     TButtConfRapida: TToolButton;
     LDesdeAgrupacion: TLFLabel;
     LHastaAgrupacion: TLFLabel;
     CHKAgrupa: TLFCheckBox;
     EFAgrupaDesde: TLFEditFind2000;
     EFAgrupaHasta: TLFEditFind2000;
     DBTituloAlmacenD: TLFEdit;
     DBTituloAlmacenH: TLFEdit;
     DBTituloFamH: TLFEdit;
     DBTituloFamD: TLFEdit;
     DBTituloAgruH: TLFEdit;
     DBTituloAgruD: TLFEdit;
     DBTituloArtH: TLFEdit;
     DBTituloArtD: TLFEdit;
     GBCompra: TGroupBox;
     LDesdeFechaCompra: TLFLabel;
     LHastaFechaCompra: TLFLabel;
     DTPFcompraD: TLFDateEdit;
     DTPFcompraH: TLFDateEdit;
     CHKCompra: TLFCheckBox;
     GBVenta: TGroupBox;
     LDesdeFechaVenta: TLFLabel;
     LHastaFechaVenta: TLFLabel;
     DTPFVentaD: TLFDateEdit;
     DTPFVentaH: TLFDateEdit;
     CHKVenta: TLFCheckBox;
     GBOrdenados: TGroupBox;
     CHKOrdFamilia: TLFCheckBox;
     CHKOrdArticulo: TLFCheckBox;
     CHKOrdLote: TLFCheckBox;
     CHKOrdCaducidad: TLFCheckBox;
     ChkOrdCompra: TLFCheckBox;
     CHKOrdVenta: TLFCheckBox;
     GBDatos: TGroupBox;
     LBLFechaListado: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     CHKstock: TLFCheckBox;
     PNLTop: TLFPanel;
     PNLMain: TLFPanel;
     PNLLimites: TLFPanel;
     PNLResto5: TLFPanel;
     PNLFechas: TLFPanel;
     PNLFechas2: TLFPanel;
     procedure CHKAlmacenClick(Sender: TObject);
     procedure CHKFamiliasClick(Sender: TObject);
     procedure CHKArticulosClick(Sender: TObject);
     procedure CHKFabricacionClick(Sender: TObject);
     procedure CHKEnvasadoClick(Sender: TObject);
     procedure CHKCaducidadClick(Sender: TObject);
     procedure CHKOrdCaducidadClick(Sender: TObject);
     procedure ChkOrdCompraClick(Sender: TObject);
     procedure CHKOrdVentaClick(Sender: TObject);
     procedure CHKAgrupaClick(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure EFAlmacenDesdeChange(Sender: TObject);
     procedure EFFamDesdeChange(Sender: TObject);
     procedure EFFamHastaChange(Sender: TObject);
     procedure EFAgrupaDesdeChange(Sender: TObject);
     procedure EFAgrupaHastaChange(Sender: TObject);
     procedure EFArtDesdeChange(Sender: TObject);
     procedure EFArtHastaChange(Sender: TObject);
     procedure EFFamDesdeBusqueda(Sender: TObject);
     procedure EFFamHastaBusqueda(Sender: TObject);
     procedure EFAlmacenHastaChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFAgrupaHastaBusqueda(Sender: TObject);
     procedure EFAgrupaDesdeBusqueda(Sender: TObject);
     procedure CHKCompraClick(Sender: TObject);
     procedure CHKVentaClick(Sender: TObject);
     procedure EFArtDesdeBusqueda(Sender: TObject);
     procedure EFArtHastaBusqueda(Sender: TObject);
  private
     { Private declarations }
     procedure ExecLstLotes(Modo: integer);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure FiltraTipo(TipoDoc: char);
     procedure EstablecerFiltros(DesdeArticulo, HastaArticulo: string; DesdeLote, HastaLote: string; Almacen: string);
  end;

var
  FPregListadoLotes : TFPregListadoLotes;

implementation

uses UDMMain, UDMLstLotes, UEntorno, UDameDato, UFMListConfig, UDMListados, DateUtils;

{$R *.dfm}

procedure TFPregListadoLotes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstLotes, DMLstLotes);
  ARecargarExecute(Self);

  Grupo := 0;
  Listado := DMLstLotes.frLotes;
  ListadoFR3 := DMLstLotes.frxLotes;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregListadoLotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstLotes);
end;

procedure TFPregListadoLotes.FiltraTipo(TipoDoc: char);
begin
  // TipoDoc nos servirá para distinguir con qué tipo de documento trabajaremos
  DMLstLotes.TipoDoc := TipoDoc;

  if (TipoDoc = 'I') then
  begin
     FPregListadoLotes.Caption := _('Listado de Inventario de Lotes');
     CHKOrdCompra.Enabled := False;
     CHKOrdVenta.Enabled := False;
     CHKFamilias.State := cbChecked;
     CHKFamilias.Visible := False;
     GBCompra.Enabled := False;
     GBVenta.Enabled := False;
     EFAlmacenHasta.Enabled := False;
     CHKVenta.State := cbUnchecked;
     CHKCompra.State := cbUnchecked;
     Grupo := 121;
  end;
  if (TipoDoc = 'C') then
  begin
     FPregListadoLotes.Caption := _('Listado de Lotes para Entradas');
     CHKVenta.State := cbUnchecked;
     CHKOrdVenta.Enabled := False;
     CHKOrdCAducidad.Enabled := False;
     CHKFamilias.State := cbChecked;
     CHKFamilias.Visible := False;
     DTPFVentaD.Enabled := False;
     DTPFVentaD.Color := clInfoBk;
     DTPFVentaD.Font.Color := clGrayText;
     DTPFVentaH.Enabled := False;
     DTPFVentaH.Color := clInfoBk;
     DTPFVentaH.Font.Color := clGrayText;
     GBVenta.Enabled := False;
     Grupo := 122;
  end;
  if (TipoDoc = 'V') then
  begin
     FPregListadoLotes.Caption := _('Listado de Lotes para Salidas');
     CHKCompra.State := cbUnchecked;
     CHKOrdCompra.Enabled := False;
     CHKOrdCAducidad.Enabled := False;
     CHKFamilias.State := cbChecked;
     CHKFamilias.Visible := False;
     DTPFCompraD.Enabled := False;
     DTPFCompraD.Color := clInfoBk;
     DTPFCompraD.Font.Color := clGrayText;
     DTPFCompraH.Enabled := False;
     DTPFCompraH.Color := clInfoBk;
     DTPFCompraH.Font.Color := clGrayText;
     GBCompra.Enabled := False;
     Grupo := 123;
  end;
  if (TipoDoc = 'M') then
  begin
     FPregListadoLotes.Caption := _('Listado de Lotes para Movimientos');
     Grupo := 125;
  end;

  ShowModal;
end;

//Acciones para cada botón de la barra
procedure TFPregListadoLotes.ARecargarExecute(Sender: TObject);
var
  MinLote, MaxLote, MinAlmacen, MaxAlmacen, MinFam, MaxFam, MinAgr, MaxAgr, MinArt, MaxArt : string;
begin
  inherited;

  DMLstLotes.Recargar(MinLote, MaxLote, MinAlmacen, MaxAlmacen, MinFam,
     MaxFam, MinAgr, MaxAgr, MinArt, MaxArt);

  EFLoteDesde.Text := MinLote;
  EFLoteHasta.Text := MaxLote;

  EFAlmacenDesde.Text := MinAlmacen;
  EFAlmacenHasta.Text := MaxAlmacen;

  EFFamDesde.Text := MinFam;
  EFFamHasta.Text := MaxFam;

  EFAgrupaDesde.Text := MinAgr;
  EFAgrupaHasta.Text := MaxAgr;

  EFArtDesde.Text := MinArt;
  EFArtHasta.Text := MaxArt;

  DTPFabricacionD.Date := EncodeDate(YearOf(REntorno.FechaTrabSH), 01, 01);
  DTPFabricacionH.Date := REntorno.FechaTrabSH;
  DTPEnvasadoD.Date := EncodeDate(YearOf(REntorno.FechaTrabSH), 01, 01);
  DTPEnvasadoH.Date := REntorno.FechaTrabSH;
  DTPCaducidadD.Date := EncodeDate(YearOf(REntorno.FechaTrabSH), 01, 01);
  DTPCaducidadH.Date := REntorno.FechaTrabSH;
  DTPFCompraD.Date := EncodeDate(YearOf(REntorno.FechaTrabSH), 01, 01);
  DTPFCompraH.Date := REntorno.FechaTrabSH;
  DTPFVentaD.Date := EncodeDate(YearOf(REntorno.FechaTrabSH), 01, 01);
  DTPFVentaH.Date := REntorno.FechaTrabSH;

  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
end;

procedure TFPregListadoLotes.ExecLstLotes(Modo: integer);
begin
  DMLstLotes.Filtro := '0000000000';
  DMLstLotes.Filtro[1] := '1';
  if (ChkAlmacen.State = cbChecked) then
     DMLstLotes.Filtro[2] := '1';
  if (ChkFamilias.State = cbChecked) then
     DMLstLotes.Filtro[3] := '1';
  if (ChkAgrupa.State = cbChecked) then
     DMLstLotes.Filtro[4] := '1';
  if (ChkArticulos.State = cbChecked) then
     DMLstLotes.Filtro[5] := '1';
  if (ChkFAbricacion.State = cbChecked) then
     DMLstLotes.Filtro[6] := '1';
  if (ChkEnvasado.State = cbChecked) then
     DMLstLotes.Filtro[7] := '1';
  if (ChkCaducidad.State = cbChecked) then
     DMLstLotes.Filtro[8] := '1';
  if (ChkCompra.State = cbChecked) then
     DMLstLotes.Filtro[9] := '1';
  if (ChkVenta.State = cbChecked) then
     DMLstLotes.Filtro[10] := '1';
  DMLstLotes.Orden := '000000';
  if (CHKOrdFamilia.State = cbChecked) then
     DMLstLotes.Orden[1] := '1';
  if (CHKOrdArticulo.State = cbChecked) then
     DMLstLotes.Orden[2] := '1';
  if (CHKOrdLote.State = cbChecked) then
     DMLstLotes.Orden[3] := '1';
  if (CHKOrdCaducidad.State = cbChecked) then
     DMLstLotes.Orden[4] := '1';
  if (ChkOrdCompra.State = cbChecked) then
     DMLstLotes.Orden[5] := '1';
  if (CHKOrdVenta.State = cbChecked) then
     DMLstLotes.Orden[6] := '1';
  if (CHKStock.State = cbChecked) then
     DMLstLotes.Filtro[11] := '1'
  else
  begin
     DMLstLotes.Filtro[11] := '0';
  end;

  DMListados.DatosInforme(DTPFechaListado.Date, EComentario.Text);
  DMLstLotes.MostrarListado(EFLoteDesde.Text, EFLoteHasta.Text,
     EFAlmacenDesde.Text, EFAlmacenHasta.Text,
     EFFamDesde.Text, EFFamHasta.Text, EFAgrupaDesde.Text, EFAgrupaHasta.Text,
     EFArtDesde.Text, EFArtHasta.Text, DTPFabricacionD.Date, DTPFabricacionH.Date,
     DTPEnvasadoD.Date, DTPEnvasadoH.Date, DTPCaducidadD.Date, DTPCaducidadH.Date,
     DTPFCompraD.Date, DTPFCompraH.Date, DTPFVentaD.Date, DTPFVentaH.Date, Modo);
end;

// Habilita Edits
procedure TFPregListadoLotes.CHKAlmacenClick(Sender: TObject);
begin
  if ChkAlmacen.State = cbChecked then
  begin
     EFAlmacenDesde.Enabled := True;
     EFAlmacenDesde.Color := clWindow;
     EFAlmacenDesde.Font.Color := clWindowText;
     EFAlmacenHasta.Enabled := True;
     EFAlmacenHasta.Color := clWindow;
     EFAlmacenHasta.Font.Color := clWindowText;
  end
  else
  begin
     EFAlmacenDesde.Enabled := False;
     EFAlmacenDesde.Color := clInfoBk;
     EFAlmacenDesde.Font.Color := clGrayText;
     EFAlmacenHasta.Enabled := False;
     EFAlmacenHasta.Color := clInfoBk;
     EFAlmacenHasta.Font.Color := clGrayText;
  end;
end;

procedure TFPregListadoLotes.CHKFamiliasClick(Sender: TObject);
begin
  if ChkFamilias.State = cbChecked then
  begin
     EFFamDesde.Enabled := True;
     EFFamDesde.Color := clWindow;
     EFFamDesde.Font.Color := clWindowText;
     EFFamHasta.Enabled := True;
     EFFamHasta.Color := clWindow;
     EFFamHasta.Font.Color := clWindowText;
  end
  else
  begin
     EFFamDesde.Enabled := False;
     EFFamDesde.Color := clInfoBk;
     EFFamDesde.Font.Color := clGrayText;
     EFFamHasta.Enabled := False;
     EFFamHasta.Color := clInfoBk;
     EFFamHasta.Font.Color := clGrayText;
  end;
end;

procedure TFPregListadoLotes.CHKAgrupaClick(Sender: TObject);
begin
  if ChkAgrupa.State = cbChecked then
  begin
     EFAgrupaDesde.Enabled := True;
     EFAgrupaDesde.Color := clWindow;
     EFAgrupaDesde.Font.Color := clWindowText;
     EFAgrupaHasta.Enabled := True;
     EFAgrupaHasta.Color := clWindow;
     EFAgrupaHasta.Font.Color := clWindowText;
  end
  else
  begin
     EFAgrupaDesde.Enabled := False;
     EFAgrupaDesde.Color := clInfoBk;
     EFAgrupaDesde.Font.Color := clGrayText;
     EFAgrupaHasta.Enabled := False;
     EFAgrupaHasta.Color := clInfoBk;
     EFAgrupaHasta.Font.Color := clGrayText;
  end;
end;

procedure TFPregListadoLotes.CHKArticulosClick(Sender: TObject);
begin
  if ChkArticulos.State = cbChecked then
  begin
     EFArtDesde.Enabled := True;
     EFArtDesde.Color := clWindow;
     EFArtDesde.Font.Color := clWindowText;
     EFArtHasta.Enabled := True;
     EFArtHasta.Color := clWindow;
     EFArtHasta.Font.Color := clWindowText;
  end
  else
  begin
     EFArtDesde.Enabled := False;
     EFArtDesde.Color := clInfoBk;
     EFArtDesde.Font.Color := clGrayText;
     EFArtHasta.Enabled := False;
     EFArtHasta.Color := clInfoBk;
     EFArtHasta.Font.Color := clGrayText;
  end;
end;

procedure TFPregListadoLotes.CHKFabricacionClick(Sender: TObject);
begin
  if ChkFabricacion.State = cbChecked then
  begin
     DTPFabricacionD.Enabled := True;
     DTPFabricacionD.Color := clWindow;
     DTPFabricacionD.Font.Color := clWindowText;
     DTPFabricacionH.Enabled := True;
     DTPFabricacionH.Color := clWindow;
     DTPFabricacionH.Font.Color := clWindowText;
  end
  else
  begin
     DTPFabricacionD.Enabled := False;
     DTPFabricacionD.Color := clInfoBk;
     DTPFabricacionD.Font.Color := clGrayText;
     DTPFabricacionH.Enabled := False;
     DTPFabricacionH.Color := clInfoBk;
     DTPFabricacionH.Font.Color := clGrayText;
  end;
end;

procedure TFPregListadoLotes.CHKEnvasadoClick(Sender: TObject);
begin
  if ChkEnvasado.State = cbChecked then
  begin
     DTPEnvasadoD.Enabled := True;
     DTPEnvasadoD.Color := clWindow;
     DTPEnvasadoD.Font.Color := clWindowText;
     DTPEnvasadoH.Enabled := True;
     DTPEnvasadoH.Color := clWindow;
     DTPEnvasadoH.Font.Color := clWindowText;
  end
  else
  begin
     DTPEnvasadoD.Enabled := False;
     DTPEnvasadoD.Color := clInfoBk;
     DTPEnvasadoD.Font.Color := clGrayText;
     DTPEnvasadoH.Enabled := False;
     DTPEnvasadoH.Color := clInfoBk;
     DTPEnvasadoH.Font.Color := clGrayText;
  end;
end;

procedure TFPregListadoLotes.CHKCaducidadClick(Sender: TObject);
begin
  if ChkCaducidad.State = cbChecked then
  begin
     DTPCaducidadD.Enabled := True;
     DTPCaducidadD.Color := clWindow;
     DTPCaducidadD.Font.Color := clWindowText;
     DTPCaducidadH.Enabled := True;
     DTPCaducidadH.Color := clWindow;
     DTPCaducidadH.Font.Color := clWindowText;
  end
  else
  begin
     DTPCaducidadD.Enabled := False;
     DTPCaducidadD.Color := clInfoBk;
     DTPCaducidadD.Font.Color := clGrayText;
     DTPCaducidadH.Enabled := False;
     DTPCaducidadH.Color := clInfoBk;
     DTPCaducidadH.Font.Color := clGrayText;
  end;
end;

procedure TFPregListadoLotes.CHKCompraClick(Sender: TObject);
begin
  if ChkCompra.State = cbChecked then
  begin
     DTPFCompraD.Enabled := True;
     DTPFCompraD.Color := clWindow;
     DTPFCompraD.Font.Color := clWindowText;
     DTPFCompraH.Enabled := True;
     DTPFCompraH.Color := clWindow;
     DTPFCompraH.Font.Color := clWindowText;
  end
  else
  begin
     DTPFCompraD.Enabled := False;
     DTPFCompraD.Color := clInfoBk;
     DTPFCompraD.Font.Color := clGrayText;
     DTPFCompraH.Enabled := False;
     DTPFCompraH.Color := clInfoBk;
     DTPFCompraH.Font.Color := clGrayText;
  end;
end;

procedure TFPregListadoLotes.CHKVentaClick(Sender: TObject);
begin
  if ChkVenta.State = cbChecked then
  begin
     DTPFVentaD.Enabled := True;
     DTPFVentaD.Color := clWindow;
     DTPFVentaD.Font.Color := clWindowText;
     DTPFVentaH.Enabled := True;
     DTPFVentaH.Color := clWindow;
     DTPFVentaH.Font.Color := clWindowText;
  end
  else
  begin
     DTPFVentaD.Enabled := False;
     DTPFVentaD.Color := clInfoBk;
     DTPFVentaD.Font.Color := clGrayText;
     DTPFVentaH.Enabled := False;
     DTPFVentaH.Color := clInfoBk;
     DTPFVentaH.Font.Color := clGrayText;
  end;
end;

// Evitamos que se ordene por más de un tipo de fecha
procedure TFPregListadoLotes.CHKOrdCaducidadClick(Sender: TObject);
begin
  if (CHKOrdCompra.Checked) then
     CHKOrdCompra.Checked := False;
  if (CHKOrdVenta.Checked) then
     CHKOrdVenta.Checked := False;
end;

procedure TFPregListadoLotes.ChkOrdCompraClick(Sender: TObject);
begin
  if (CHKOrdCaducidad.Checked) then
     CHKOrdCaducidad.Checked := False;
  if (CHKOrdVenta.Checked) then
     CHKOrdVenta.Checked := False;
end;

procedure TFPregListadoLotes.CHKOrdVentaClick(Sender: TObject);
begin
  if (CHKOrdCaducidad.Checked) then
     CHKOrdCaducidad.Checked := False;
  if (CHKOrdCompra.Checked) then
     CHKOrdCompra.Checked := False;
end;

procedure TFPregListadoLotes.EFAlmacenDesdeChange(Sender: TObject);
begin
  DBTituloAlmacenD.Text := DameTituloAlmacen(EFAlmacenDesde.Text);
end;

procedure TFPregListadoLotes.EFAlmacenHastaChange(Sender: TObject);
begin
  DBTituloAlmacenH.Text := DameTituloAlmacen(EFAlmacenHasta.Text);
end;

procedure TFPregListadoLotes.EFFamDesdeChange(Sender: TObject);
begin
  DBTituloFamD.Text := DameTituloFamilia(EFFamDesde.Text);
end;

procedure TFPregListadoLotes.EFFamHastaChange(Sender: TObject);
begin
  DBTituloFamH.Text := DameTituloFamilia(EFFamHasta.Text);
end;

procedure TFPregListadoLotes.EFAgrupaDesdeChange(Sender: TObject);
begin
  DBTituloAgruD.Text := DameTituloAgrupacion('T', EFAgrupaDesde.Text);
end;

procedure TFPregListadoLotes.EFAgrupaHastaChange(Sender: TObject);
begin
  DBTituloAgruH.Text := DameTituloAgrupacion('T', EFAgrupaHasta.Text);
end;

procedure TFPregListadoLotes.EFArtDesdeChange(Sender: TObject);
begin
  DBTituloArtD.Text := DameTituloArticulo(EFArtDesde.Text);
end;

procedure TFPregListadoLotes.EFArtHastaChange(Sender: TObject);
begin
  DBTituloArtH.Text := DameTituloArticulo(EFArtHasta.Text);
end;

procedure TFPregListadoLotes.EFFamDesdeBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregListadoLotes.EFFamHastaBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregListadoLotes.EFAgrupaHastaBusqueda(Sender: TObject);
begin
  EFAgrupaHasta.CondicionBusqueda := 'tipo=''T''';
end;

procedure TFPregListadoLotes.EFAgrupaDesdeBusqueda(Sender: TObject);
begin
  EFAgrupaDesde.CondicionBusqueda := 'tipo=''T''';
end;

procedure TFPregListadoLotes.EFArtDesdeBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregListadoLotes.EFArtHastaBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregListadoLotes.EstablecerFiltros(DesdeArticulo, HastaArticulo, DesdeLote, HastaLote, Almacen: string);
begin
  EFLoteDesde.Text := DesdeLote;
  EFLoteHasta.Text := HastaLote;

  EFArtDesde.Text := DesdeArticulo;
  EFArtHasta.Text := HastaArticulo;
  CHKArticulos.Checked := True;

  if (Almacen <> '') then
  begin
     EFAlmacenDesde.Text := Almacen;
     EFAlmacenHasta.Text := Almacen;
     CHKAlmacen.Checked := True;
  end
  else
     CHKAlmacen.Checked := False;

  CHKFamilias.Checked := False;
  CHKAgrupa.Checked := False;
  CHKCompra.Checked := False;
  CHKVenta.Checked := False;
end;

procedure TFPregListadoLotes.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  ExecLstLotes(Modo);
end;

end.
