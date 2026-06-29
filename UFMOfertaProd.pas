unit UFMOfertaProd;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UHYDescription, ULFHYDBDescription,
  rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  DbComboBoxValue, Buttons, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMOfertaProd = class(TFPEdit)
     LFLabel1: TLFLabel;
     LFDBOferta: TLFDbedit;
     LFLabel2: TLFLabel;
     DBDate: TDBDateEdit;
     LFLabel3: TLFLabel;
     DBDescripCliente: TLFHYDBDescription;
     LFLabel4: TLFLabel;
     DBDescripCompuesto: TLFDbedit;
     DBEFCliente: TDBEditFind2000;
     DBEFCompuesto: TDBEditFind2000;
     LFLabel5: TLFLabel;
     LFLabel6: TLFLabel;
     LFDBPesoPieza: TLFDbedit;
     LFDBPesoColada: TLFDbedit;
     LFLabel7: TLFLabel;
     LFLabel8: TLFLabel;
     LFLabel9: TLFLabel;
     LFLabel10: TLFLabel;
     LFLabel11: TLFLabel;
     LFLabel12: TLFLabel;
     LFLabel13: TLFLabel;
     LFLabel14: TLFLabel;
     LFLabel15: TLFLabel;
     LFLabel16: TLFLabel;
     LFLabel17: TLFLabel;
     LFLabel18: TLFLabel;
     LFDBPrecioMatPrima: TLFDbedit;
     LFDBUnidadesMatPrima: TLFDbedit;
     LFDBPrecioColor: TLFDbedit;
     LFDBUnidadesColor: TLFDbedit;
     LFDBPrecioComp3: TLFDbedit;
     LFDBUnidadesComp3: TLFDbedit;
     LFDBPrecioComp4: TLFDbedit;
     LFDBUnidadesComp4: TLFDbedit;
     DBEFMatPrima: TDBEditFind2000;
     DBDescripMatprima: TLFHYDBDescription;
     DBDescripColor: TLFHYDBDescription;
     DBDescripCompuesto3: TLFHYDBDescription;
     DBDescripCompuesto4: TLFHYDBDescription;
     DBEFColor: TDBEditFind2000;
     DBEFCompuesto3: TDBEditFind2000;
     DBEFCompuesto4: TDBEditFind2000;
     LFLabel19: TLFLabel;
     LFLabel20: TLFLabel;
     LFDBUniCaja: TLFDbedit;
     LFLabel21: TLFLabel;
     LFLabel22: TLFLabel;
     LFLabel23: TLFLabel;
     LFDBCiclo: TLFDbedit;
     LFDBCavidades: TLFDbedit;
     LFLabel24: TLFLabel;
     LFDBTiempoManipula: TLFDbedit;
     LFLabel25: TLFLabel;
     LFDBHorasPrepMolde: TLFDbedit;
     LFLabel26: TLFLabel;
     LFDBPuestaMarcha: TLFDbedit;
     LFLabel27: TLFLabel;
     LFLabel28: TLFLabel;
     LFDBMargenMaq: TLFDbedit;
     LFDBMargenMatPrima: TLFDbedit;
     LFLabel29: TLFLabel;
     LFLabel30: TLFLabel;
     LFLabel31: TLFLabel;
     LFLabel32: TLFLabel;
     LFLabel33: TLFLabel;
     LFLabel34: TLFLabel;
     LFDBPedido1: TLFDbedit;
     LFDBPedido2: TLFDbedit;
     LFDBPedido3: TLFDbedit;
     LFDBPedido4: TLFDbedit;
     LFDBPedido5: TLFDbedit;
     LFDBPedido6: TLFDbedit;
     DBEFMaquina: TDBEditFind2000;
     DBDescripTMaquina: TLFHYDBDescription;
     LFLabel35: TLFLabel;
     DBEFMolde: TDBEditFind2000;
     DBDescripMolde: TLFHYDBDescription;
     DBTipoCaja: TDBEditFind2000;
     DBDescripCaja: TLFHYDBDescription;
     LFLabel36: TLFLabel;
     LFDBPrecioCaja: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     ACrearOfertaEsc: TAction;
     ACrearEscandallo: TAction;
     DBEDestino: TLFDbedit;
     LblDestino: TLFLabel;
     SBADestino: TSpeedButton;
     ALOfertas: TLFActionList;
     ADestino: TAction;
     SBACliente: TSpeedButton;
     ACliente: TAction;
     SBACompuesto: TSpeedButton;
     ACompuesto: TAction;
     DBChkBEquival1: TLFDBCheckBox;
     DBChkBEquival2: TLFDBCheckBox;
     DBChkBEquival3: TLFDBCheckBox;
     DBChkBEquival4: TLFDBCheckBox;
     LFDBMargenOpe: TLFDbedit;
     LFLabel37: TLFLabel;
     LFLabel38: TLFLabel;
     LFDBMargenVar: TLFDbedit;
     LFDBMargenTrab: TLFDbedit;
     LFLabel39: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure DBTipoCajaChange(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure DBEFMatPrimaChange(Sender: TObject);
     procedure DBEFColorChange(Sender: TObject);
     procedure DBEFCompuesto3Change(Sender: TObject);
     procedure DBEFCompuesto4Change(Sender: TObject);
     procedure DBEFMaquinaChange(Sender: TObject);
     procedure DBEFMoldeChange(Sender: TObject);
     procedure ACrearOfertaEscExecute(Sender: TObject);
     procedure ACrearEscandalloExecute(Sender: TObject);
     procedure SBADestinoDblClick(Sender: TObject);
     procedure ADestinoExecute(Sender: TObject);
     procedure AClienteExecute(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure ACompuestoExecute(Sender: TObject);
     procedure SBACompuestoDblClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBChkBEquivalClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Cerrando: boolean;
     procedure FiltraOferta(Filtro: string);
     procedure ActualizaRelacion(Tipo: string);
     procedure VerArticulosEquivalencias;
  end;

var
  FMOfertaProd : TFMOfertaProd;

implementation

uses UDMOfertaProd, UDMMain, UFormGest, UEntorno, UUtiles, UFMain;

{$R *.dfm}

procedure TFMOfertaProd.FormCreate(Sender: TObject);
begin
  inherited;
  Cerrando := False;
  AbreData(TDMOfertaProd, DMOfertaProd);

  NavMain.DataSource := DMOfertaProd.DSQMOfertaProd;
  DBGMain.DataSource := DMOfertaProd.DSQMOfertaProd;
  G2KTableLoc.DataSource := DMOfertaProd.DSQMOfertaProd;

  SolapaControles(SBADestino, DBEDestino);
  SolapaControles(SBACliente, DBDescripCliente);
  SolapaControles(SBACompuesto, DBDescripCompuesto);
  DBEDestino.Color := REntorno.ColorEnlaceActivo;
  DBDescripCliente.Color := REntorno.ColorEnlaceActivo;
  DBDescripCompuesto.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMOfertaProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Cerrando := True;
  CierraData(DMOfertaProd);
end;

procedure TFMOfertaProd.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMOfertaProd.DBTipoCajaChange(Sender: TObject);
begin
  inherited;
  DBDescripCaja.ActualizaDatos('ARTICULO', DBTipoCaja.Text);
end;

procedure TFMOfertaProd.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  DBDescripCliente.ActualizaDatos('CLIENTE', DBEFCliente.Text);
end;

procedure TFMOfertaProd.DBEFMatPrimaChange(Sender: TObject);
begin
  inherited;
  if (DBChkBEquival1.Checked) then
     DBDescripMatPrima.ActualizaDatos('ID_EQUIVAL', DBEFMatPrima.Text)
  else
     DBDescripMatPrima.ActualizaDatos('ARTICULO', DBEFMatPrima.Text);

  //sfg_rsl por defecto que ponga 100
  if (DMOfertaProd.QMOfertaProdUNI_COMPONENTE1.AsInteger) = 0 then
     DMOfertaProd.QMOfertaProdUNI_COMPONENTE1.AsInteger := 100;
end;

procedure TFMOfertaProd.DBEFColorChange(Sender: TObject);
begin
  inherited;
  if (DBChkBEquival2.Checked) then
     DBDescripColor.ActualizaDatos('ID_EQUIVAL', DBEFColor.Text)
  else
     DBDescripColor.ActualizaDatos('ARTICULO', DBEFColor.Text);
end;

procedure TFMOfertaProd.DBEFCompuesto3Change(Sender: TObject);
begin
  inherited;
  if (DBChkBEquival3.Checked) then
     DBDescripCompuesto3.ActualizaDatos('ID_EQUIVAL', DBEFCompuesto3.Text)
  else
     DBDescripCompuesto3.ActualizaDatos('ARTICULO', DBEFCompuesto3.Text);
end;

procedure TFMOfertaProd.DBEFCompuesto4Change(Sender: TObject);
begin
  inherited;
  if (DBChkBEquival4.Checked) then
     DBDescripCompuesto4.ActualizaDatos('ID_EQUIVAL', DBEFCompuesto4.Text)
  else
     DBDescripCompuesto4.ActualizaDatos('ARTICULO', DBEFCompuesto4.Text);
end;

procedure TFMOfertaProd.DBEFMaquinaChange(Sender: TObject);
begin
  inherited;
  DBDescripTMaquina.ActualizaDatos('CODMAQ', DBEFMaquina.Text);
end;

procedure TFMOfertaProd.DBEFMoldeChange(Sender: TObject);
begin
  inherited;
  DBDescripMolde.ActualizaDatos('NUM_MOLDE', DBEFMolde.Text);
end;

procedure TFMOfertaProd.ACrearOfertaEscExecute(Sender: TObject);
begin
  inherited;
  DMOfertaProd.CreaOfertaEsc(0);
end;

procedure TFMOfertaProd.ACrearEscandalloExecute(Sender: TObject);
begin
  inherited;
  DMOfertaProd.CreaOfertaEsc(1);
end;

procedure TFMOfertaProd.SBADestinoDblClick(Sender: TObject);
begin
  inherited;
  ADestino.Execute;
end;

procedure TFMOfertaProd.ADestinoExecute(Sender: TObject);
begin
  inherited;
  if (DMOfertaProd.xDestinoTIPO.AsString = 'OFE') then
     FMain.EjecutaAccion(FMain.AProOfertasE, 'id_esc = ' + DMOfertaProd.QMOfertaProdID_ESCANDALLO.AsString)
  else if (DMOfertaProd.xDestinoTIPO.AsString = 'EPR') then
     FMain.EjecutaAccion(FMain.AProEscandallosF, 'id_esc = ' + DMOfertaProd.QMOfertaProdID_ESCANDALLO.AsString);
end;

procedure TFMOfertaProd.AClienteExecute(Sender: TObject);
begin
  inherited;
  if (DBDescripCliente.Text <> '') then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE=' + DBEFCliente.Text);
end;

procedure TFMOfertaProd.SBAClienteDblClick(Sender: TObject);
begin
  inherited;
  ACliente.Execute;
end;

procedure TFMOfertaProd.ACompuestoExecute(Sender: TObject);
begin
  inherited;
  if (DBDescripCompuesto.Text <> '') then
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo=''' + DBEFCompuesto.Text + '''');
end;

procedure TFMOfertaProd.SBACompuestoDblClick(Sender: TObject);
begin
  inherited;
  ACompuesto.Execute;
end;

procedure TFMOfertaProd.FiltraOferta(Filtro: string);
begin
  if (Filtro <> '') then
  begin
     with DMOfertaProd.QMOfertaProd do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM EMP_OFERTA ');
        SelectSQL.Add(' WHERE ' + Filtro);
        SelectSQL.Add(' ORDER BY RIG_OF ');
        Open;
     end;
  end;
end;

procedure TFMOfertaProd.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMOfertaProd.BusquedaCompleja;
end;

procedure TFMOfertaProd.DBChkBEquivalClick(Sender: TObject);
begin
  inherited;
  if not Cerrando then
     VerArticulosEquivalencias;
end;

procedure TFMOfertaProd.ActualizaRelacion(Tipo: string);
begin
  if (Tipo = 'OFE') then
  begin
     LblDestino.Caption := _('Oferta Nº');
     ACrearOfertaEsc.Caption := _('Recrear Oferta Esc.');
     ACrearOfertaEsc.Hint := _('Recrear Oferta Esc.');
     ACrearOfertaEsc.Enabled := True;
     ACrearEscandallo.Caption := _('Recrear Escandallo');
     ACrearEscandallo.Hint := _('Recrear Escandallo');
     ACrearEscandallo.Enabled := False;
  end
  else if (Tipo = 'EPR') then
  begin
     LblDestino.Caption := _('Escandallo Nº');
     ACrearOfertaEsc.Caption := _('Recrear Oferta Esc.');
     ACrearOfertaEsc.Hint := _('Recrear Oferta Esc.');
     ACrearOfertaEsc.Enabled := False;
     ACrearEscandallo.Caption := _('Recrear Escandallo');
     ACrearEscandallo.Hint := _('Recrear Escandallo');
     ACrearEscandallo.Enabled := True;
  end
  else
  begin
     LblDestino.Caption := _('Destino');
     ACrearOfertaEsc.Caption := _('Crear Oferta Esc.');
     ACrearOfertaEsc.Hint := _('Crear Oferta Esc.');
     ACrearOfertaEsc.Enabled := True;
     ACrearEscandallo.Caption := _('Crear Escandallo');
     ACrearEscandallo.Hint := _('Crear Escandallo');
     ACrearEscandallo.Enabled := True;
  end;
end;

procedure TFMOfertaProd.VerArticulosEquivalencias;
begin  //  if (QMOfertaProdUSAR_EQUIVAL1.AsInteger = 1) then
  DBEFMatPrima.SalirSiVacio := (DBChkBEquival1.Checked);
  DBEFColor.SalirSiVacio := (DBChkBEquival2.Checked);
  DBEFCompuesto3.SalirSiVacio := (DBChkBEquival3.Checked);
  DBEFCompuesto4.SalirSiVacio := (DBChkBEquival4.Checked);

  if (DBChkBEquival1.Checked) then
  begin
     DBEFMatPrima.CampoNum := 'ID_EQUIVAL';
     DBEFMatPrima.CampoStr := 'DESC_EQUIVAL';
     DBEFMatPrima.DataField := 'ID_EQUIVAL1';
     DBEFMatPrima.Filtros := [obEmpresa];
     DBEFMatPrima.Tabla_A_Buscar := 'PRO_SYS_CAB_EQUIVAL';
     DBDescripMatprima.CamposWhereOrigen[0] := 'ID_EQUIVAL1';
     DBDescripMatprima.CamposWhereOrigen[1] := 'EMPRESA';
     DBDescripMatprima.CamposWhereTabla[0] := 'ID_EQUIVAL';
     DBDescripMatprima.CamposWhereTabla[1] := 'EMPRESA';
     DBDescripMatprima.Campo_Descripcion := 'DESC_EQUIVAL';
     DBDescripMatprima.Tabla_A_Buscar := 'PRO_SYS_CAB_EQUIVAL';
     DBDescripMatPrima.ActualizaDatos('ID_EQUIVAL', DBEFMatPrima.Text);
  end
  else
  begin
     DBEFMatPrima.CampoNum := 'ARTICULO';
     DBEFMatPrima.CampoStr := 'TITULO';
     DBEFMatPrima.DataField := 'COMPONENTE1';
     DBEFMatPrima.Filtros := [obEmpresa, obEjercicio, obCanal];
     DBEFMatPrima.Tabla_A_Buscar := 'VER_ARTICULOS_EF';
     DBDescripMatprima.CamposWhereOrigen[0] := 'COMPONENTE1';
     DBDescripMatprima.CamposWhereOrigen[1] := 'EMPRESA';
     DBDescripMatprima.CamposWhereTabla[0] := 'ARTICULO';
     DBDescripMatprima.CamposWhereTabla[1] := 'EMPRESA';
     DBDescripMatprima.Campo_Descripcion := 'TITULO';
     DBDescripMatprima.Tabla_A_Buscar := 'ART_ARTICULOS';
     DBDescripMatPrima.ActualizaDatos('ARTICULO', DBEFMatPrima.Text);
  end;

  if (DBChkBEquival2.Checked) then
  begin
     DBEFColor.CampoNum := 'ID_EQUIVAL';
     DBEFColor.CampoStr := 'DESC_EQUIVAL';
     DBEFColor.DataField := 'ID_EQUIVAL2';
     DBEFColor.Filtros := [obEmpresa];
     DBEFColor.Tabla_A_Buscar := 'PRO_SYS_CAB_EQUIVAL';
     DBDescripColor.CamposWhereOrigen[0] := 'ID_EQUIVAL2';
     DBDescripColor.CamposWhereOrigen[1] := 'EMPRESA';
     DBDescripColor.CamposWhereTabla[0] := 'ID_EQUIVAL';
     DBDescripColor.CamposWhereTabla[1] := 'EMPRESA';
     DBDescripColor.Campo_Descripcion := 'DESC_EQUIVAL';
     DBDescripColor.Tabla_A_Buscar := 'PRO_SYS_CAB_EQUIVAL';
     DBDescripColor.ActualizaDatos('ID_EQUIVAL', DBEFColor.Text);
  end
  else
  begin
     DBEFColor.CampoNum := 'ARTICULO';
     DBEFColor.CampoStr := 'TITULO';
     DBEFColor.DataField := 'COMPONENTE2';
     DBEFColor.Filtros := [obEmpresa, obEjercicio, obCanal];
     DBEFColor.Tabla_A_Buscar := 'VER_ARTICULOS_EF';
     DBDescripColor.CamposWhereOrigen[0] := 'COMPONENTE2';
     DBDescripColor.CamposWhereOrigen[1] := 'EMPRESA';
     DBDescripColor.CamposWhereTabla[0] := 'ARTICULO';
     DBDescripColor.CamposWhereTabla[1] := 'EMPRESA';
     DBDescripColor.Campo_Descripcion := 'TITULO';
     DBDescripColor.Tabla_A_Buscar := 'ART_ARTICULOS';
     DBDescripColor.ActualizaDatos('ARTICULO', DBEFColor.Text);
  end;

  if (DBChkBEquival3.Checked) then
  begin
     DBEFCompuesto3.CampoNum := 'ID_EQUIVAL';
     DBEFCompuesto3.CampoStr := 'DESC_EQUIVAL';
     DBEFCompuesto3.DataField := 'ID_EQUIVAL3';
     DBEFCompuesto3.Filtros := [obEmpresa];
     DBEFCompuesto3.Tabla_A_Buscar := 'PRO_SYS_CAB_EQUIVAL';
     DBDescripCompuesto3.CamposWhereOrigen[0] := 'ID_EQUIVAL3';
     DBDescripCompuesto3.CamposWhereOrigen[1] := 'EMPRESA';
     DBDescripCompuesto3.CamposWhereTabla[0] := 'ID_EQUIVAL';
     DBDescripCompuesto3.CamposWhereTabla[1] := 'EMPRESA';
     DBDescripCompuesto3.Campo_Descripcion := 'DESC_EQUIVAL';
     DBDescripCompuesto3.Tabla_A_Buscar := 'PRO_SYS_CAB_EQUIVAL';
     DBDescripCompuesto3.ActualizaDatos('ID_EQUIVAL', DBEFCompuesto3.Text);
  end
  else
  begin
     DBEFCompuesto3.CampoNum := 'ARTICULO';
     DBEFCompuesto3.CampoStr := 'TITULO';
     DBEFCompuesto3.DataField := 'COMPONENTE3';
     DBEFCompuesto3.Filtros := [obEmpresa, obEjercicio, obCanal];
     DBEFCompuesto3.Tabla_A_Buscar := 'VER_ARTICULOS_EF';
     DBDescripCompuesto3.CamposWhereOrigen[0] := 'COMPONENTE3';
     DBDescripCompuesto3.CamposWhereOrigen[1] := 'EMPRESA';
     DBDescripCompuesto3.CamposWhereTabla[0] := 'ARTICULO';
     DBDescripCompuesto3.CamposWhereTabla[1] := 'EMPRESA';
     DBDescripCompuesto3.Campo_Descripcion := 'TITULO';
     DBDescripCompuesto3.Tabla_A_Buscar := 'ART_ARTICULOS';
     DBDescripCompuesto3.ActualizaDatos('ARTICULO', DBEFCompuesto3.Text);
  end;

  if (DBChkBEquival4.Checked) then
  begin
     DBEFCompuesto4.CampoNum := 'ID_EQUIVAL';
     DBEFCompuesto4.CampoStr := 'DESC_EQUIVAL';
     DBEFCompuesto4.DataField := 'ID_EQUIVAL4';
     DBEFCompuesto4.Filtros := [obEmpresa];
     DBEFCompuesto4.Tabla_A_Buscar := 'PRO_SYS_CAB_EQUIVAL';
     DBDescripCompuesto4.CamposWhereOrigen[0] := 'ID_EQUIVAL4';
     DBDescripCompuesto4.CamposWhereOrigen[1] := 'EMPRESA';
     DBDescripCompuesto4.CamposWhereTabla[0] := 'ID_EQUIVAL';
     DBDescripCompuesto4.CamposWhereTabla[1] := 'EMPRESA';
     DBDescripCompuesto4.Campo_Descripcion := 'DESC_EQUIVAL';
     DBDescripCompuesto4.Tabla_A_Buscar := 'PRO_SYS_CAB_EQUIVAL';
     DBDescripCompuesto4.ActualizaDatos('ID_EQUIVAL', DBEFCompuesto4.Text);
  end
  else
  begin
     DBEFCompuesto4.CampoNum := 'ARTICULO';
     DBEFCompuesto4.CampoStr := 'TITULO';
     DBEFCompuesto4.DataField := 'COMPONENTE4';
     DBEFCompuesto4.Filtros := [obEmpresa, obEjercicio, obCanal];
     DBEFCompuesto4.Tabla_A_Buscar := 'VER_ARTICULOS_EF';
     DBDescripCompuesto4.CamposWhereOrigen[0] := 'COMPONENTE4';
     DBDescripCompuesto4.CamposWhereOrigen[1] := 'EMPRESA';
     DBDescripCompuesto4.CamposWhereTabla[0] := 'ARTICULO';
     DBDescripCompuesto4.CamposWhereTabla[1] := 'EMPRESA';
     DBDescripCompuesto4.Campo_Descripcion := 'TITULO';
     DBDescripCompuesto4.Tabla_A_Buscar := 'ART_ARTICULOS';
     DBDescripCompuesto4.ActualizaDatos('ARTICULO', DBEFCompuesto4.Text);
  end;
end;

end.
