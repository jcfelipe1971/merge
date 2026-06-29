unit UFMTraspasoPedidosAProduccionTyCKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, NsDBGrid, UHYDBGrid, ExtCtrls, UFormGest,
  Mask, rxToolEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDateEdit, HYFIBQuery, ULFEdit,
  ULFLabel, ULFPanel;

type
  TFMTraspasoPedidosAProduccionTyCKri = class(TG2KForm)
     Panel1: TLFPanel;
     Panel2: TLFPanel;
     Panel3: TLFPanel;
     HYTDBGModeloColor: THYTDBGrid;
     EStock01: TLFEdit;
     EStock02: TLFEdit;
     EStock04: TLFEdit;
     EStock03: TLFEdit;
     EStock08: TLFEdit;
     EStock07: TLFEdit;
     EStock06: TLFEdit;
     EStock05: TLFEdit;
     EStock12: TLFEdit;
     EStock11: TLFEdit;
     EStock10: TLFEdit;
     EStock09: TLFEdit;
     EStock14: TLFEdit;
     EStock13: TLFEdit;
     EFalta01: TLFEdit;
     EFalta02: TLFEdit;
     EFalta04: TLFEdit;
     EFalta03: TLFEdit;
     EFalta08: TLFEdit;
     EFalta07: TLFEdit;
     EFalta06: TLFEdit;
     EFalta05: TLFEdit;
     EFalta12: TLFEdit;
     EFalta11: TLFEdit;
     EFalta10: TLFEdit;
     EFalta09: TLFEdit;
     EFalta14: TLFEdit;
     EFalta13: TLFEdit;
     EProd01: TLFEdit;
     EProd02: TLFEdit;
     EProd04: TLFEdit;
     EProd03: TLFEdit;
     EProd08: TLFEdit;
     EProd07: TLFEdit;
     EProd06: TLFEdit;
     EProd05: TLFEdit;
     EProd12: TLFEdit;
     EProd11: TLFEdit;
     EProd10: TLFEdit;
     EProd09: TLFEdit;
     EProd14: TLFEdit;
     EProd13: TLFEdit;
     Label1: TLFLabel;
     Label2: TLFLabel;
     Label3: TLFLabel;
     EEnProd01: TLFEdit;
     EEnProd02: TLFEdit;
     EEnProd04: TLFEdit;
     EEnProd03: TLFEdit;
     EEnProd08: TLFEdit;
     EEnProd07: TLFEdit;
     EEnProd06: TLFEdit;
     EEnProd05: TLFEdit;
     EEnProd12: TLFEdit;
     EEnProd11: TLFEdit;
     EEnProd10: TLFEdit;
     EEnProd09: TLFEdit;
     EEnProd14: TLFEdit;
     EEnProd13: TLFEdit;
     Label4: TLFLabel;
     EPed01: TLFEdit;
     EPed02: TLFEdit;
     EPed04: TLFEdit;
     EPed03: TLFEdit;
     EPed08: TLFEdit;
     EPed07: TLFEdit;
     EPed06: TLFEdit;
     EPed05: TLFEdit;
     EPed12: TLFEdit;
     EPed11: TLFEdit;
     EPed10: TLFEdit;
     EPed09: TLFEdit;
     EPed14: TLFEdit;
     EPed13: TLFEdit;
     Label5: TLFLabel;
     BProducir: TButton;
     RGModo: TRadioGroup;
     Label6: TLFLabel;
     Label7: TLFLabel;
     Label8: TLFLabel;
     Label9: TLFLabel;
     Label10: TLFLabel;
     EFSerie: TEditFind2000;
     EFAlmacen: TEditFind2000;
     DEFechaOrden: TLFDateEdit;
     DEFechaEntrega: TLFDateEdit;
     EFOperario: TEditFind2000;
     EFMaterial: TEditFind2000;
     Label11: TLFLabel;
     LEscandallo: TLFLabel;
     EFEscandalloProd: TEditFind2000;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure RGModoClick(Sender: TObject);
     procedure BProducirClick(Sender: TObject);
  private
     { Private declarations }
     id_s, id_a_m_c, rig: integer;
     // FechaEntrega: TDateTime;
  public
     { Public declarations }
     procedure MuestraAMC(id_a_m_c, id_s: integer);
     procedure RellenaDatos;
  end;

var
  FMTraspasoPedidosAProduccionTyCKri : TFMTraspasoPedidosAProduccionTyCKri;

implementation

uses UDMTraspasoPedidosAProduccionTyCKri, UDMTallas, UDMMain, UEntorno,
  UDMOrdenProduccionTallas;

{$R *.dfm}

procedure TFMTraspasoPedidosAProduccionTyCKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMTraspasoPedidosAProduccionTyCKri);
  Action := caFree;
end;

procedure TFMTraspasoPedidosAProduccionTyCKri.MuestraAMC(id_a_m_c, id_s: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select serie,rig,fecha_entrega_prev from ges_cabeceras_s_ped where id_s = ' + IntToStr(id_s);
        ExecQuery;
        rig := FieldByName['RIG'].AsInteger;
        EFSerie.Text := FieldByName['SERIE'].AsString;
        DEFechaEntrega.Date := FieldByName['FECHA_ENTREGA_PREV'].AsDateTime;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Self.id_s := id_s;
  Self.id_a_m_c := id_a_m_c;
  AbreData(TDMTraspasoPedidosAProduccionTyCKri, DMTraspasoPedidosAProduccionTyCKri);
  DMTraspasoPedidosAProduccionTyCKri.AbrirAMC(id_a_m_c, 0);
  dmTallas.setColumns(DMTraspasoPedidosAProduccionTyCKri.xStocksAlmacenesModeloColor[
     'ID_G_T'], HYTDBGModeloColor);
  EFAlmacen.Text := REntorno.AlmacenDefecto;
  DEFechaOrden.Date := Now;
  RellenaDatos;
  Self.BringToFront;
  ShowModal;
end;

procedure TFMTraspasoPedidosAProduccionTyCKri.RellenaDatos;
begin
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(01)) then
  begin
     EPed01.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 01));
     EStock01.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 01));
     EFalta01.Text := IntToStr(StrToInt(EPed01.Text) - StrToInt(EStock01.Text));
     EEnProd01.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 01));
  end
  else
  begin
     EPed01.Visible := False;
     EStock01.Visible := False;
     EFalta01.Visible := False;
     EEnProd01.Visible := False;
     EProd01.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(02)) then
  begin
     EPed02.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 02));
     EStock02.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 02));
     EFalta02.Text := IntToStr(StrToInt(EPed02.Text) - StrToInt(EStock02.Text));
     EEnProd02.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 02));
  end
  else
  begin
     EPed02.Visible := False;
     EStock02.Visible := False;
     EFalta02.Visible := False;
     EEnProd02.Visible := False;
     EProd02.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(03)) then
  begin
     EPed03.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 03));
     EStock03.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 03));
     EFalta03.Text := IntToStr(StrToInt(EPed03.Text) - StrToInt(EStock03.Text));
     EEnProd03.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 03));
  end
  else
  begin
     EPed03.Visible := False;
     EStock03.Visible := False;
     EFalta03.Visible := False;
     EEnProd03.Visible := False;
     EProd03.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(04)) then
  begin
     EPed04.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 04));
     EStock04.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 04));
     EFalta04.Text := IntToStr(StrToInt(EPed04.Text) - StrToInt(EStock04.Text));
     EEnProd04.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 04));
  end
  else
  begin
     EPed04.Visible := False;
     EStock04.Visible := False;
     EFalta04.Visible := False;
     EEnProd04.Visible := False;
     EProd04.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(05)) then
  begin
     EPed05.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 05));
     EStock05.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 05));
     EFalta05.Text := IntToStr(StrToInt(EPed05.Text) - StrToInt(EStock05.Text));
     EEnProd05.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 05));
  end
  else
  begin
     EPed05.Visible := False;
     EStock05.Visible := False;
     EFalta05.Visible := False;
     EEnProd05.Visible := False;
     EProd05.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(06)) then
  begin
     EPed06.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 06));
     EStock06.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 06));
     EFalta06.Text := IntToStr(StrToInt(EPed06.Text) - StrToInt(EStock06.Text));
     EEnProd06.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 06));
  end
  else
  begin
     EPed06.Visible := False;
     EStock06.Visible := False;
     EFalta06.Visible := False;
     EEnProd06.Visible := False;
     EProd06.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(07)) then
  begin
     EPed07.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 07));
     EStock07.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 07));
     EFalta07.Text := IntToStr(StrToInt(EPed07.Text) - StrToInt(EStock07.Text));
     EEnProd07.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 07));
  end
  else
  begin
     EPed07.Visible := False;
     EStock07.Visible := False;
     EFalta07.Visible := False;
     EEnProd07.Visible := False;
     EProd07.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(08)) then
  begin
     EPed08.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 08));
     EStock08.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 08));
     EFalta08.Text := IntToStr(StrToInt(EPed08.Text) - StrToInt(EStock08.Text));
     EEnProd08.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 08));
  end
  else
  begin
     EPed08.Visible := False;
     EStock08.Visible := False;
     EFalta08.Visible := False;
     EEnProd08.Visible := False;
     EProd08.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(09)) then
  begin
     EPed09.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 09));
     EStock09.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 09));
     EFalta09.Text := IntToStr(StrToInt(EPed09.Text) - StrToInt(EStock09.Text));
     EEnProd09.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 09));
  end
  else
  begin
     EPed09.Visible := False;
     EStock09.Visible := False;
     EFalta09.Visible := False;
     EEnProd09.Visible := False;
     EProd09.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(10)) then
  begin
     EPed10.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 10));
     EStock10.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 10));
     EFalta10.Text := IntToStr(StrToInt(EPed10.Text) - StrToInt(EStock10.Text));
     EEnProd10.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 10));
  end
  else
  begin
     EPed10.Visible := False;
     EStock10.Visible := False;
     EFalta10.Visible := False;
     EEnProd10.Visible := False;
     EProd10.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(11)) then
  begin
     EPed11.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 11));
     EStock11.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 11));
     EFalta11.Text := IntToStr(StrToInt(EPed11.Text) - StrToInt(EStock11.Text));
     EEnProd11.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 11));
  end
  else
  begin
     EPed11.Visible := False;
     EStock11.Visible := False;
     EFalta11.Visible := False;
     EEnProd11.Visible := False;
     EProd11.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(12)) then
  begin
     EPed12.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 12));
     EStock12.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 12));
     EFalta12.Text := IntToStr(StrToInt(EPed12.Text) - StrToInt(EStock12.Text));
     EEnProd12.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 12));
  end
  else
  begin
     EPed12.Visible := False;
     EStock12.Visible := False;
     EFalta12.Visible := False;
     EEnProd12.Visible := False;
     EProd12.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(13)) then
  begin
     EPed13.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 13));
     EStock13.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 13));
     EFalta13.Text := IntToStr(StrToInt(EPed13.Text) - StrToInt(EStock13.Text));
     EEnProd13.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 13));
  end
  else
  begin
     EPed13.Visible := False;
     EStock13.Visible := False;
     EFalta13.Visible := False;
     EEnProd13.Visible := False;
     EProd13.Visible := False;
  end;
  if (DMTraspasoPedidosAProduccionTyCKri.DameVisible(14)) then
  begin
     EPed14.Text := IntToStr(
        DMTraspasoPedidosAProduccionTyCKri.DameUdsPedido(id_s, 14));
     EStock14.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameStock(
        id_a_m_c, 14));
     EFalta14.Text := IntToStr(StrToInt(EPed14.Text) - StrToInt(EStock14.Text));
     EEnProd14.Text := IntToStr(DMTraspasoPedidosAProduccionTyCKri.DameEnProduccion(
        id_a_m_c, 14));
  end
  else
  begin
     EPed14.Visible := False;
     EStock14.Visible := False;
     EFalta14.Visible := False;
     EEnProd14.Visible := False;
     EProd14.Visible := False;
  end;
  RGModoClick(Self);
end;

procedure TFMTraspasoPedidosAProduccionTyCKri.RGModoClick(Sender: TObject);
begin
  case RGModo.ItemIndex of
     0:
     begin
        EProd01.Text := EPed01.Text;
        EProd02.Text := EPed02.Text;
        EProd03.Text := EPed03.Text;
        EProd04.Text := EPed04.Text;
        EProd05.Text := EPed05.Text;
        EProd06.Text := EPed06.Text;
        EProd07.Text := EPed07.Text;
        EProd08.Text := EPed08.Text;
        EProd09.Text := EPed09.Text;
        EProd10.Text := EPed10.Text;
        EProd11.Text := EPed11.Text;
        EProd12.Text := EPed12.Text;
        EProd13.Text := EPed13.Text;
        EProd14.Text := EPed14.Text;
     end;
     1:
     begin
        EProd01.Text := EFalta01.Text;
        EProd02.Text := EFalta02.Text;
        EProd03.Text := EFalta03.Text;
        EProd04.Text := EFalta04.Text;
        EProd05.Text := EFalta05.Text;
        EProd06.Text := EFalta06.Text;
        EProd07.Text := EFalta07.Text;
        EProd08.Text := EFalta08.Text;
        EProd09.Text := EFalta09.Text;
        EProd10.Text := EFalta10.Text;
        EProd11.Text := EFalta11.Text;
        EProd12.Text := EFalta12.Text;
        EProd13.Text := EFalta13.Text;
        EProd14.Text := EFalta14.Text;
     end;
  end;
end;

procedure TFMTraspasoPedidosAProduccionTyCKri.BProducirClick(Sender: TObject);
var
  i : integer;
  // cantidad : integer;
  ref_proveedor : string;
  s_color : string;
  // id_g_t : integer;
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select aamc.id_a_m,aamc.s_color,aam.id_g_t,aam.ref_proveedor from art_articulos_mod_color aamc ' +
           'join art_articulos_modelos aam on aamc.id_a_m = aam.id_a_m ' +
           'where id_a_m_c = ' + IntToStr(id_a_m_c);
        ExecQuery;
        ref_proveedor := FieldByName['REF_PROVEEDOR'].AsString;
        s_color := FieldByName['S_COLOR'].AsString;
        // id_g_t := FieldByName['ID_G_T'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  AbreData(TDMOrdenProduccionTallas, DMOrdenProduccionTallas);
  with DMOrdenProduccionTallas do
  begin
     QMCabecera.Insert;
     QMCabeceraSERIE.AsString := EFSerie.Text;
     QMCabeceraTERCERO_OPERARIO.AsInteger := StrToInt(EFOperario.Text);
     QMCabeceraFECHA_ORDEN.AsDateTime := DEFechaOrden.Date;
     QMCabeceraFECHA_ENTREGA.AsDateTime := DEFechaEntrega.Date;
     QMCabeceraALMACEN.AsString := EFAlmacen.Text;
     QMCabeceraMATERIAL.AsInteger := StrToInt(EFMaterial.Text);
     QMDetalle.Insert;
     QMDetalleREF_PROVEEDOR.AsString := ref_proveedor;
     QMDetalleESCANDALLO.AsInteger := StrToInt(EFEscandalloProd.Text);
     QMDetalleS_COLOR.AsString := s_color;
     QMDetalleID_A_M_C.AsInteger := id_a_m_c;
     for i := 1 to 14 do
     begin
        if DMTraspasoPedidosAProduccionTyCKri.DameVisible(i) then
        begin
           case i of
              01: QMDetalleT01.AsInteger := StrToInt(EProd01.Text);
              02: QMDetalleT02.AsInteger := StrToInt(EProd02.Text);
              03: QMDetalleT03.AsInteger := StrToInt(EProd03.Text);
              04: QMDetalleT04.AsInteger := StrToInt(EProd04.Text);
              05: QMDetalleT05.AsInteger := StrToInt(EProd05.Text);
              06: QMDetalleT06.AsInteger := StrToInt(EProd06.Text);
              07: QMDetalleT07.AsInteger := StrToInt(EProd07.Text);
              08: QMDetalleT08.AsInteger := StrToInt(EProd08.Text);
              09: QMDetalleT09.AsInteger := StrToInt(EProd09.Text);
              10: QMDetalleT10.AsInteger := StrToInt(EProd10.Text);
              11: QMDetalleT11.AsInteger := StrToInt(EProd11.Text);
              12: QMDetalleT12.AsInteger := StrToInt(EProd12.Text);
              13: QMDetalleT13.AsInteger := StrToInt(EProd13.Text);
              14: QMDetalleT14.AsInteger := StrToInt(EProd14.Text);
           end;
        end;
     end;
     QMDetalle.Post;
     TraspasaOrden;
  end;
  CierraData(DMOrdenProduccionTallas);
end;

end.
