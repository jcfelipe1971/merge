unit UFMTraspasoMultiCanal;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Mask, DBCtrls, ComCtrls, ToolWin, ActnList,
  rxToolEdit, ULFDateEdit, ULFLabel, ULFToolBar, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBEdit, ULFEditFind2000, ULFPanel, ULFEdit,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ULFActionList, Menus,
  UTeclas, UControlEdit, UEditPanel;

type
  TFMTraspasoMultiCanal = class(TFPEditSinNavegador)
     PNTraspaso: TLFPanel;
     RGDocumento: TRadioGroup;
     TButtTrapasa: TToolButton;
     ATraspasa: TAction;
     GBDatos: TGroupBox;
     LBCanal: TLFLabel;
     EFCanales: TLFEditFind2000;
     ETituloCanal: TLFEdit;
     LBSerie: TLFLabel;
     EFSeries: TLFEditFind2000;
     ETituloSerie: TLFEdit;
     GBVarios: TGroupBox;
     LFechaDoc: TLFLabel;
     DEFechaDst: TLFDateEdit;
     CBBorraDoc: TLFCheckBox;
     CBStockDestino: TLFCheckBox;
     CBCerrarFactura: TLFCheckBox;
     CBStockOrigen: TLFCheckBox;
     ASalir: TAction;
     CBPrecios: TLFCheckBox;
     procedure EFCanalesChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ATraspasaExecute(Sender: TObject);
     procedure EFSeriesChange(Sender: TObject);
     procedure EFSeriesBusqueda(Sender: TObject);
     procedure CBBorraDocClick(Sender: TObject);
     procedure RGDocumentoClick(Sender: TObject);
  private
     { Private declarations }
     IdS, RIG, Ejercicio, Canal, NTipoDoc, Transportista, Accion, IdCliente: integer;
     Tipo, Serie: string;
     procedure PonCaptionVentana(Tipo: string);
     procedure ConstruyeRG;
  public
     { Public declarations }
     function Carga(AIdS, ARIG, AEjercicio, ACanal, ATransportista: integer; ATipo, ASerie: string): integer;
     function DameTipoDocumentoDestino: string;
     procedure CargaEvaluador(AIdS, ARIG, AEjercicio, ACanal, ATransportista: integer; ATipo, ASerie: string);
  end;

var
  FMTraspasoMultiCanal : TFMTraspasoMultiCanal;

implementation

uses UDMMain, UDMTraspasoMultiCanal, UEntorno, UFMain, UDameDato;

{$R *.dfm}

procedure TFMTraspasoMultiCanal.FormCreate(Sender: TObject);
begin
  AbreData(TDMTraspasoMultiCanal, DMTraspasoMultiCanal);
  CBBorraDoc.State := cbUnChecked;
  CBBorraDocClick(CBBorraDoc);
end;

procedure TFMTraspasoMultiCanal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMTraspasoMultiCanal);
end;

procedure TFMTraspasoMultiCanal.EFCanalesChange(Sender: TObject);
begin
  ETituloCanal.Text := DameTituloCanal(StrToIntDef(EFCanales.Text, REntorno.Canal));
  EFSeries.Text := DMTraspasoMultiCanal.DameMinSerie(StrToIntDef(EFCanales.Text, REntorno.Canal));
  RGDocumentoClick(Sender);
end;

function TFMTraspasoMultiCanal.Carga(AIdS, ARIG, AEjercicio, ACanal, ATransportista: integer; ATipo, ASerie: string): integer;
begin
  IdS := AIdS;
  RIG := ARIG;
  Ejercicio := AEjercicio;
  Canal := ACanal;
  Tipo := ATipo;
  Serie := ASerie;
  Transportista := ATransportista;
  EFCanales.Text := IntToStr(Canal); {dji lrk kri - DMTraspasoMultiCanal.DameMinCanal}
  EFSeries.Text := Serie; {dji lrk kri - DMTraspasoMultiCanal.DameMinSerie(StrToIntDef(EFCanales.Text,REntorno.Canal))}
  DEFechaDst.Date := REntorno.FechaTrabSH;
  PonCaptionVentana(Tipo);
  IdCliente := DMTraspasoMultiCanal.DameIdClienteDocumento(IdS);
  ShowModal;
  Result := Accion;
end;

function TFMTraspasoMultiCanal.DameTipoDocumentoDestino: string;
begin
  if (NTipoDoc < 5) then
  begin
     case RGDocumento.ItemIndex of
        0: Result := 'OFC';
        1: Result := 'PEC';
        2: Result := 'ALB';
        3: Result := 'FAC';
     end;
  end
  else
  begin
     if (NTipoDoc < 10) then
     begin
        case RGDocumento.ItemIndex of
           0: Result := 'OFP';
           1: Result := 'OCP';
           2: Result := 'PEP';
           3: Result := 'ALP';
           4: Result := 'FAP';
        end;
     end
     else
        Result := 'FCR';
  end;
end;

procedure TFMTraspasoMultiCanal.ATraspasaExecute(Sender: TObject);
var
  TipoDestino : string;
  Refresca : integer;
  Ejercicio_D : integer;
begin
  TipoDestino := DameTipoDocumentoDestino;

  if (CBBorraDoc.State = cbChecked) then
     Accion := 2
  else
     Accion := 1;

  DMMain.MuestraAviso('CLI', IdCliente, TipoDestino);

  Ejercicio_D := DameEjercicio(REntorno.Empresa, DEFechaDst.Date);
  DMTraspasoMultiCanal.TraspasoDocumento(Tipo, Serie, TipoDestino, EFSeries.Text, IdS, Canal, RIG, Ejercicio, Ejercicio_D, StrToIntDef(EFCanales.Text, REntorno.Canal), NTipoDoc,
     Transportista,
     CBStockOrigen.Checked,    // Borrar Mov. Stock en doc. origen
     CBStockDestino.Checked,   // Generar Mov. Stock en destino
     CBCerrarFactura.Checked,  // Cerrar Factura
     CBBorraDoc.Checked,       // Borrar Doc. Origen
     CBPrecios.Checked,        // Regenerar Precios del Doc. destino
     DEFechaDst.Date, Refresca);

  if (Refresca > -1) then
     Accion := Refresca;
  Close;
end;

procedure TFMTraspasoMultiCanal.PonCaptionVentana(Tipo: string);
var
  Valor : integer;
begin
  if (Tipo = 'OFC') then
  begin
     Caption := _('Traspaso Oferta Multi-Canal');
     NTipoDoc := 1;
  end;

  if (Tipo = 'PEC') then
  begin
     Caption := _('Traspaso Pedido Multi-Canal');
     NTipoDoc := 2;
  end;

  if (Tipo = 'ALB') then
  begin
     Caption := _('Traspaso Albarán Multi-Canal');
     NTipoDoc := 3;
  end;

  if (Tipo = 'FAC') then
  begin
     Caption := _('Traspaso Factura Multi-Canal');
     NTipoDoc := 4;

     // Evito que se borre una factura
     CBBorraDoc.Checked := False;
     CBBorraDoc.Enabled := False;

     CBStockOrigen.Checked := False;
     CBStockOrigen.Enabled := False;
  end;

  if (Tipo = 'OFP') then
  begin
     Caption := _('Traspaso Propuesta Proveedor Multi-Canal');
     NTipoDoc := 5;
  end;

  if (Tipo = 'OCP') then
  begin
     Caption := _('Traspaso Propuesta Proveedor Conf. Multi-Canal');
     NTipoDoc := 6;
  end;

  if (Tipo = 'PEP') then
  begin
     Caption := _('Traspaso Pedido Proveedor Multi-Canal');
     NTipoDoc := 7;
  end;

  if (Tipo = 'ALP') then
  begin
     Caption := _('Traspaso Albarán Proveedor Multi-Canal');
     NTipoDoc := 8;
  end;

  if (Tipo = 'FAP') then
  begin
     Caption := _('Traspaso Factura Proveedor Multi-Canal');
     NTipoDoc := 9;
  end;

  if (Tipo = 'FCR') then
  begin
     Caption := _('Traspaso Factura Acreedor Multi-Canal');
     NTipoDoc := 10;
     // Si se trata de factura acreedor deshabilitamos seleccion de documento para que genere solo factura de proveedor
     RGDocumento.Enabled := False;
     RGDocumento.ItemIndex := 3;
  end;

  if (NTipoDoc > 4) then
     Valor := (NTipoDoc - 4)
  else
     Valor := NTipoDoc;

  ConstruyeRG;

  RGDocumento.ItemIndex := Valor - 1;
  RGDocumentoClick(RGDocumento);
end;

procedure TFMTraspasoMultiCanal.EFSeriesChange(Sender: TObject);
begin
  ETituloSerie.Text := DameTituloSerie(EFSeries.Text);
end;

procedure TFMTraspasoMultiCanal.EFSeriesBusqueda(Sender: TObject);
begin
  EFSeries.CondicionBusqueda := 'CANAL=' + EFCanales.Text;
end;

procedure TFMTraspasoMultiCanal.CBBorraDocClick(Sender: TObject);
begin
  if (CBBorraDoc.State = cbChecked) then
  begin
     CBStockDestino.State := cbChecked;
     CBStockOrigen.State := cbChecked;
     CBStockDestino.Enabled := False;
     CBStockOrigen.Enabled := False;
  end
  else
  begin
     CBStockDestino.State := cbUnChecked;
     CBStockOrigen.State := cbUnChecked;
     CBStockDestino.Enabled := True;
     CBStockOrigen.Enabled := True;
  end;
end;

procedure TFMTraspasoMultiCanal.RGDocumentoClick(Sender: TObject);
begin
  // Visible solo para facturas
  CBCerrarFactura.Visible := (((RGDocumento.ItemIndex = 3) and (NTipoDoc < 5)) or
     ((RGDocumento.ItemIndex = 4) and (NTipoDoc > 4)));

  // Solo al crear Albarán o Factura
  CBStockDestino.Visible := (((RGDocumento.ItemIndex in [2, 3]) and (NTipoDoc in [3, 4])) or
     ((RGDocumento.ItemIndex in [3, 4]) and (NTipoDoc in [8, 9])));

  // Marcado por defecto si se traspasa entre canales o se traspasa entre documentos del mismo tipo.
  CBStockDestino.Checked := False;
  if CBStockDestino.Visible then
     CBStockDestino.Checked := (StrToIntDef(EFCanales.Text, 0) <> REntorno.Canal) or
        ((NTipoDoc = 3) and (RGDocumento.ItemIndex = 2)) or ((NTipoDoc = 4) and (RGDocumento.ItemIndex = 3)) or
        ((NTipoDoc = 8) and (RGDocumento.ItemIndex = 3)) or ((NTipoDoc = 9) and (RGDocumento.ItemIndex = 4));

  // Deshacer el mov. origen si queremos traspasar un albaran o factura
  CBStockOrigen.Visible := (NTipoDoc in [3, 4, 8, 9]);
end;

procedure TFMTraspasoMultiCanal.ConstruyeRG;
begin
  with RGDocumento do
  begin
     Items.Clear;
     if (NTipoDoc < 5) then
     begin
        Items.Add(_('Oferta'));
        Items.Add(_('Pedido'));
        Items.Add(_('Albarán'));
        Items.Add(_('Factura'));
        Columns := 2;
     end
     else
     begin
        Items.Add(_('Propuesta'));
        Items.Add(_('Propuesta Confirmada'));
        Items.Add(_('Pedido'));
        Items.Add(_('Albarán'));
        Items.Add(_('Factura'));
        Columns := 3;
     end;
  end;
end;

procedure TFMTraspasoMultiCanal.CargaEvaluador(AIdS, ARIG, AEjercicio, ACanal, ATransportista: integer; ATipo, ASerie: string);
begin
  IdS := AIdS;
  RIG := ARIG;
  Ejercicio := AEjercicio;
  Canal := ACanal;
  Tipo := ATipo;
  Serie := ASerie;
  Transportista := ATransportista;
  EFCanales.Text := DMTraspasoMultiCanal.DameMinCanal;
  EFSeries.Text := DMTraspasoMultiCanal.DameMinSerie(StrToIntDef(EFCanales.Text, REntorno.Canal));
  DEFechaDst.Date := REntorno.FechaTrabSH;
  PonCaptionVentana(Tipo);
end;

end.
