unit ZUFMPresupuesto;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UDBDateTimePicker, StdCtrls, Mask, DBCtrls,
  ExtDlgs, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFDBEditFind2000, ULFDBEdit,
  DbComboBoxValue, UG2kTBLoc, ULFLabel, ULFEditFind2000{, NsDBGrid};

type
  TZFMPresupuesto = class(TFPEdit)
     LPresupuesto: TLFLabel;
     DBENumPre: TLFDbedit;
     LFecha: TLFLabel;
     LCliente: TLFLabel;
     DBEDescripCliente: TLFDbedit;
     LResponsable: TLFLabel;
     DBEDescContacto: TLFDbedit;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     DBDateTimePicker1: TDBDateTimePicker;
     LComentariosPedido: TLFLabel;
     LGastosIniciales: TLFLabel;
     DBEGastosIniciales: TLFDbedit;
     LDescGastosIniciales: TLFLabel;
     DBEDecripGastosInciales: TLFDbedit;
     LImagen: TLFLabel;
     DBEImagen: TLFDbedit;
     DBEFCliente: TLFDBEditFind2000;
     LAdhesivo: TLFLabel;
     DBEDescAdhesivo: TLFDbedit;
     LMateria: TLFLabel;
     DBEDescMaterial: TLFDbedit;
     LTinta: TLFLabel;
     DBEDescTinta: TLFDbedit;
     DBEFAdhesivo: TLFDBEditFind2000;
     DBEFMaterial: TLFDBEditFind2000;
     LFNumTintas: TLFDBEditFind2000;
     DBEFPresentacion: TLFDBEditFind2000;
     LPresentacion: TLFLabel;
     DBEDescPresentacion: TLFDbedit;
     LFormaEnvio: TLFLabel;
     DBEDecFormaEnvio: TLFDbedit;
     LSituacionPresentacion: TLFLabel;
     DBEDescSituacionPresentacion: TLFDbedit;
     DBEFSituacionPresentacion: TLFDBEditFind2000;
     DBEFFormaEnvio: TLFDBEditFind2000;
     LAgente: TLFLabel;
     DBEDescAgente: TLFDbedit;
     LComision: TLFLabel;
     DBEComision: TLFDbedit;
     DBEFAgente: TLFDBEditFind2000;
     ButPathImagen: TButton;
     OPPathImagen: TOpenPictureDialog;
     TSImagen: TTabSheet;
     TBImagen: TLFToolBar;
     PNLNotasPrespuesto: TLFPanel;
     DBEImagenPresupuesto: TLFDbedit;
     LImagenPresupuesto: TLFLabel;
     LImagenCliente: TLFLabel;
     DBEFImagenCliente: TLFDBEditFind2000;
     DBEImagenTituloCliente: TLFDbedit;
     IImagenes: TImage;
     TSNotas: TTabSheet;
     TBNotas: TLFToolBar;
     PNotas: TLFPanel;
     DBMNotas: TLFDBMemo;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     PNLNotasPresupuesto: TLFPanel;
     DBENotasTituloCliente: TLFDbedit;
     ToolButton1: TToolButton;
     ToolButton2: TToolButton;
     PMImprime: TPopupMenu;
     Listado11: TMenuItem;
     Listado21: TMenuItem;
     ListadoPresupuestoMod1Cataln1: TMenuItem;
     ListadoPresupuestoMod2Cataln1: TMenuItem;
     ListadoPresupuestoMod1Francs1: TMenuItem;
     ListadoPresupuestoMod2Francs1: TMenuItem;
     DBEFContacto: TLFDBEditFind2000;
     DBCheckWeb: TLFDBCheckBox;
     DBEApellidosContacto: TLFDbedit;
     DBCBTipoCotiz: TDBComboBoxValue;
     LTipoCotizacion: TLFLabel;
     DBEGastosTroquel1: TLFDbedit;
     DBEDescGastosTroquel1: TLFDbedit;
     LGastosTroquel1: TLFLabel;
     LDescGastosTroquel1: TLFLabel;
     DBEGastosTroquel2: TLFDbedit;
     DBEDescGastosTroquel2: TLFDbedit;
     LGastosTroquel2: TLFLabel;
     LDescGastosTroquel2: TLFLabel;
     DBEstampacion: TLFDBCheckBox;
     DBRelieve: TLFDBCheckBox;
     TButtDuplicar: TToolButton;
     DBReimpresion: TLFDBCheckBox;
     DBBarniz: TLFDBCheckBox;
     LFDEmail: TLFDbedit;
     LTelefono: TLFLabel;
     LFDTelf: TLFDbedit;
     LEmail: TLFLabel;
     LCIF: TLFLabel;
     LFax: TLFLabel;
     LWeb: TLFLabel;
     LDireccion: TLFLabel;
     LCodPostal: TLFLabel;
     LPoblacion: TLFLabel;
     LFormaPago: TLFLabel;
     LDatosBancarios: TLFLabel;
     LDiametroInterior: TLFLabel;
     LDiametroExterior: TLFLabel;
     LFDDiametroInt: TLFDbedit;
     LFDDiametroExt: TLFDbedit;
     LEtiqPorRollo: TLFLabel;
     LFDEtqRollo: TLFDbedit;
     LEtiqAlAncho: TLFLabel;
     LFDEtqAncho: TLFDbedit;
     LPosicionSalida: TLFLabel;
     LFDbPosicionSalida: TLFDbedit;
     LObsevEtiqueta: TLFLabel;
     LFDCif: TLFDbedit;
     LFDFax: TLFDbedit;
     LFDCP: TLFDbedit;
     LFDDireccion: TLFDbedit;
     LFDFormaPago: TLFDbedit;
     LFDPoblacion: TLFDbedit;
     LFDWeb: TLFDbedit;
     LFDDatosBancariosDC: TLFDbedit;
     LFDDatosBancariosSucursal: TLFDbedit;
     LFDDatosBancariosEntidad: TLFDbedit;
     DBEObservaciones: TLFDbedit;
     DBEComentario: TLFDbedit;
     LFDDatosBancariosCC: TLFDbedit;
     LArtMaterial: TLFLabel;
     LFEFArtMAt: TLFDBEditFind2000;
     DBEDescArtMaterial: TLFDbedit;
     LTinta1: TLFLabel;
     LTinta2: TLFLabel;
     LTinta3: TLFLabel;
     LTinta4: TLFLabel;
     LTinta5: TLFLabel;
     LTinta6: TLFLabel;
     LTinta7: TLFLabel;
     LTinta8: TLFLabel;
     LArtAdhesivo: TLFLabel;
     LDBEFTinta3: TLFDBEditFind2000;
     LDBEFTinta4: TLFDBEditFind2000;
     LDBEFTinta5: TLFDBEditFind2000;
     LDBEFTinta6: TLFDBEditFind2000;
     LDBEFTinta7: TLFDBEditFind2000;
     LDBEFTinta8: TLFDBEditFind2000;
     LArtCaja: TLFLabel;
     DBEDescCaja: TLFDbedit;
     LDBEFCaja: TLFDBEditFind2000;
     LArtBarniz: TLFLabel;
     LDBEFAdhesivo: TLFDBEditFind2000;
     LDBEFTinta1: TLFDBEditFind2000;
     LDBEFTinta2: TLFDBEditFind2000;
     DBETinta1: TLFDbedit;
     DBETinta2: TLFDbedit;
     DBETinta3: TLFDbedit;
     DBETinta4: TLFDbedit;
     DBETinta5: TLFDbedit;
     DBETinta6: TLFDbedit;
     DBETinta7: TLFDbedit;
     DBETinta8: TLFDbedit;
     DBEDescArtBarniz: TLFDbedit;
     DBEDescDescArtAhesitov: TLFDbedit;
     LDBEFBarniz: TLFDBEditFind2000;
     LFDBCantidad: TLFDbedit;
     LFDBPorcentaje: TLFDbedit;
     TSDatos: TTabSheet;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     CEDatosPMEdit: TPopUpTeclas;
     CEDatos: TControlEdit;
     DBGFDetalle: TDBGridFind2000;
     DBENotasPresupuesto: TLFDbedit;
     LNotasPresupuesto: TLFLabel;
     LNotasCliente: TLFLabel;
     DBEFNotasCliente: TLFDBEditFind2000;
     PNLDatosPresupuesto: TLFPanel;
     LDatosPresupuesto: TLFLabel;
     LDatosCliente: TLFLabel;
     DBEDatosTituloCliente: TLFDbedit;
     DBEDatosPresupuesto: TLFDbedit;
     DBEFDatosCliente: TLFDBEditFind2000;
     DBEPCosteMaterial: TLFDbedit;
     DBEPCosteAdhesivo: TLFDbedit;
     DBEPCosteTinta1: TLFDbedit;
     DBEPCosteCaja: TLFDbedit;
     DBEPCosteTinta2: TLFDbedit;
     DBEPCosteTinta3: TLFDbedit;
     DBEPCosteTinta4: TLFDbedit;
     DBEPCosteTinta5: TLFDbedit;
     DBEPCosteTinta6: TLFDbedit;
     DBEPCosteTinta7: TLFDbedit;
     DBEPCosteTinta8: TLFDbedit;
     LRecursos: TLFLabel;
     DBEDescRecurso: TLFDbedit;
     DBEPRecurso: TLFDbedit;
     LArtPortes: TLFLabel;
     DBEDescArtPortes: TLFDbedit;
     DBEPPortes: TLFDbedit;
     LDBEFPortes: TLFDBEditFind2000;
     LDBEFRecurso: TLFDBEditFind2000;
     DBEPCosteBarniz: TLFDbedit;
     AListado: TAction;
     LFCategoryAction2: TLFCategoryAction;
     LFCategoryAction3: TLFCategoryAction;
     AConfiguracion: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure ButPathImagenClick(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure Listado11Click(Sender: TObject);
     procedure Listado21Click(Sender: TObject);
     procedure ListadoPresupuestoMod1Cataln1Click(Sender: TObject);
     procedure ListadoPresupuestoMod2Cataln1Click(Sender: TObject);
     procedure ListadoPresupuestoMod1Francs1Click(Sender: TObject);
     procedure ListadoPresupuestoMod2Francs1Click(Sender: TObject);
     procedure DBEFContactoBusqueda(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure TButtDuplicarClick(Sender: TObject);
     procedure LFNumTintasChange(Sender: TObject);
     procedure LDBEFBarnizChange(Sender: TObject);
     procedure LDBEFAdhesivoChange(Sender: TObject);
     procedure DBBarnizClick(Sender: TObject);
     procedure LFEFArtMAtChange(Sender: TObject);
     procedure LDBEFCajaChange(Sender: TObject);
     procedure LDBEFTinta1Change(Sender: TObject);
     procedure LDBEFTinta2Change(Sender: TObject);
     procedure LDBEFTinta3Change(Sender: TObject);
     procedure LDBEFTinta4Change(Sender: TObject);
     procedure LDBEFTinta5Change(Sender: TObject);
     procedure LDBEFTinta6Change(Sender: TObject);
     procedure LDBEFTinta7Change(Sender: TObject);
     procedure LDBEFTinta8Change(Sender: TObject);
     procedure LDBEFPortesChange(Sender: TObject);
     procedure LDBEFRecursoChange(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure ACrearOfertaEscandalloExecute(Sender: TObject);
     procedure ABorrarOfertaEscandalloExecute(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure AListadoExecute(Sender: TObject);
     procedure AConfiguracionExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     SWFil, SWEnlace: integer;
     procedure InsertarPresupuesto;
     procedure FiltraPresupuesto(Filtro: string);
  end;

var
  ZFMPresupuesto : TZFMPresupuesto;

implementation

uses ZUDMPresupueto, UDMMain, UFormGest, UEntorno, {UDMOfertas,} UFMain,
  {UProFMOfertaEscandallo,} UUtiles, UDameDato, UFMListConfig;

{$R *.dfm}

procedure TZFMPresupuesto.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMPresupuesto, ZDMPresupuesto);

  NavMain.DataSource := ZDMPresupuesto.DSQMPresupuesto;
  EPMain.DataSource := ZDMPresupuesto.DSQMPresupuesto;
  DBGMain.DataSource := ZDMPresupuesto.DSQMPresupuesto;
  NavDetalle.DataSource := ZDMPresupuesto.DSQMDetalle;

  if (DBBarniz.ValueChecked = '1') then
  begin
     LArtBarniz.Visible := True;
     LDBEFBarniz.Visible := True;
     DBEDescArtBarniz.Visible := True;
     DBEPCosteBarniz.Visible := True;
  end
  else if (DBBarniz.ValueChecked = '0') then
  begin
     LArtBarniz.Visible := False;
     LDBEFBarniz.Visible := False;
     DBEDescArtBarniz.Visible := False;
     DBEPCosteBarniz.Visible := False;
  end;
end;

procedure TZFMPresupuesto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMPresupuesto);
end;

procedure TZFMPresupuesto.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMPresupuesto.BusquedaCompleja;
end;

procedure TZFMPresupuesto.ButPathImagenClick(Sender: TObject);
//var //Nom_Fichero:string;
//    Posicion,PosAnt:integer;
begin
  inherited;
  OPPathImagen.FileName := ZDMPresupuesto.QMPresupuestoIMAGEN_ETIQUETA.AsString;
  if OPPathImagen.Execute then
     ZDMPresupuesto.QMPresupuestoIMAGEN_ETIQUETA.AsString := OPPathImagen.FileName;
end;

procedure TZFMPresupuesto.PCMainChange(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.CargaImagen;
end;

procedure TZFMPresupuesto.Listado11Click(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.ImprimeListado(9002);
end;

procedure TZFMPresupuesto.Listado21Click(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.ImprimeListado(9003);
end;

procedure TZFMPresupuesto.ListadoPresupuestoMod1Cataln1Click(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.ImprimeListado(9004);
end;

procedure TZFMPresupuesto.ListadoPresupuestoMod2Cataln1Click(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.ImprimeListado(9005);
end;

procedure TZFMPresupuesto.ListadoPresupuestoMod1Francs1Click(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.ImprimeListado(9006);
end;

procedure TZFMPresupuesto.ListadoPresupuestoMod2Francs1Click(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.ImprimeListado(9007);
end;

procedure TZFMPresupuesto.DBEFContactoBusqueda(Sender: TObject);
begin
  inherited;
  DBEFContacto.CondicionBusqueda := 'tercero=' + ZDMPresupuesto.QMPresupuestoTERCERO.AsString;
end;

procedure TZFMPresupuesto.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  if DBEFCliente.Text = '-1' then
  begin
     DBEDescripCliente.Color := clWindow;
     DBEDescripCliente.ReadOnly := False;
     DBEDescripCliente.TabStop := True;
     LFDEmail.Color := clWindow;
     LFDEmail.ReadOnly := False;
     LFDEmail.TabStop := True;
     LFDWeb.Color := clWindow;
     LFDWeb.ReadOnly := False;
     LFDWeb.TabStop := True;
     LFDTelf.Color := clWindow;
     LFDTelf.ReadOnly := False;
     LFDTelf.TabStop := True;
     LFDFax.Color := clWindow;
     LFDFax.ReadOnly := False;
     LFDFax.TabStop := True;
     LFDCIF.Color := clWindow;
     LFDCIF.ReadOnly := False;
     LFDCIF.TabStop := True;
     LFDDireccion.Color := clWindow;
     LFDDireccion.ReadOnly := False;
     LFDDireccion.TabStop := True;
     LFDCp.Color := clWindow;
     LFDCp.ReadOnly := False;
     LFDCp.TabStop := True;
     LFDPoblacion.Color := clWindow;
     LFDPoblacion.ReadOnly := False;
     LFDPoblacion.TabStop := True;
     LFDFormaPago.Color := clWindow;
     LFDFormaPago.ReadOnly := False;
     LFDFormaPago.TabStop := True;
     LFDDatosBancariosEntidad.Color := clWindow;
     LFDDatosBancariosEntidad.ReadOnly := False;
     LFDDatosBancariosEntidad.TabStop := True;
     LFDDatosBancariosSucursal.Color := clWindow;
     LFDDatosBancariosSucursal.ReadOnly := False;
     LFDDatosBancariosSucursal.TabStop := True;
     LFDDatosBancariosDC.Color := clWindow;
     LFDDatosBancariosDC.ReadOnly := False;
     LFDDatosBancariosDC.TabStop := True;
     LFDDatosBancariosCC.Color := clWindow;
     LFDDatosBancariosCC.ReadOnly := False;
     LFDDatosBancariosCC.TabStop := True;
     DBEDescContacto.Color := clWindow;
     DBEDescContacto.ReadOnly := False;
     DBEDescContacto.TabStop := True;
     DBEApellidosContacto.Color := clWindow;
     DBEApellidosContacto.ReadOnly := False;
     DBEApellidosContacto.TabStop := True;
  end
  else
  begin
     DBEDescripCliente.Color := clInfoBk;
     DBEDescripCliente.ReadOnly := True;
     DBEDescripCliente.TabStop := False;
     LFDEmail.Color := clInfoBk;
     LFDEmail.ReadOnly := True;
     LFDEmail.TabStop := False;
     LFDWeb.Color := clInfoBk;
     LFDWeb.ReadOnly := True;
     LFDWeb.TabStop := False;
     LFDTelf.Color := clInfoBk;
     LFDTelf.ReadOnly := True;
     LFDTelf.TabStop := False;
     LFDFax.Color := clInfoBk;
     LFDFax.ReadOnly := True;
     LFDFax.TabStop := False;
     LFDCIF.Color := clInfoBk;
     LFDCIF.ReadOnly := True;
     LFDCIF.TabStop := False;
     LFDDireccion.Color := clInfoBk;
     LFDDireccion.ReadOnly := True;
     LFDDireccion.TabStop := False;
     LFDCp.Color := clInfoBk;
     LFDCp.ReadOnly := True;
     LFDCp.TabStop := False;
     LFDPoblacion.Color := clInfoBk;
     LFDPoblacion.ReadOnly := True;
     LFDPoblacion.TabStop := False;
     LFDFormaPago.Color := clInfoBk;
     LFDFormaPago.ReadOnly := True;
     LFDFormaPago.TabStop := False;
     LFDDatosBancariosEntidad.Color := clInfoBk;
     LFDDatosBancariosEntidad.ReadOnly := True;
     LFDDatosBancariosEntidad.TabStop := False;
     LFDDatosBancariosSucursal.Color := clInfoBk;
     LFDDatosBancariosSucursal.ReadOnly := True;
     LFDDatosBancariosSucursal.TabStop := False;
     LFDDatosBancariosDC.Color := clInfoBk;
     LFDDatosBancariosDC.ReadOnly := True;
     LFDDatosBancariosDC.TabStop := False;
     LFDDatosBancariosCC.Color := clInfoBk;
     LFDDatosBancariosCC.ReadOnly := True;
     LFDDatosBancariosCC.TabStop := False;
     DBEDescContacto.Color := clInfoBk;
     DBEDescContacto.ReadOnly := True;
     DBEDescContacto.TabStop := False;
     DBEApellidosContacto.Color := clInfoBk;
     DBEApellidosContacto.ReadOnly := True;
     DBEApellidosContacto.TabStop := False;
  end;
end;

procedure TZFMPresupuesto.TButtDuplicarClick(Sender: TObject);
begin
  inherited;
  with ZDMPresupuesto.SPDuplicar do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Presupuesto_ori'].AsInteger := ZDMPresupuesto.QMPresupuestoN_PRESUPUETO.AsInteger;
     Params.ByName['Ejercicio_dest'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal_dest'].AsInteger := REntorno.Canal;
     ExecQuery;
  end;

  ZDMPresupuesto.QMPresupuesto.Close;
  ZDMPresupuesto.QMPresupuesto.Open;
  ZDMPresupuesto.QMPresupuesto.Last;
  ShowMessage(Format(_('Duplicación de presupuesto hecha. Presupuesto resultante núm.: %s'), [ZDMPresupuesto.SPDuplicar.Fields[0].AsString]));
end;

//SFG_RSP Relacionar Ofertas con Presupuestos
procedure TZFMPresupuesto.InsertarPresupuesto;
{var
  ID_OfertaPres : integer;
  Existe : boolean; No se utiliza}
begin
  {ID_OfertaPres := DMOfertas.QMDetalleID_DETALLES_S.AsInteger; No se utiliza}
  {Existe := ZDMPresupuesto.SeleccionarPresupuesto(ID_OfertaPres); No se utiliza}

  //sfg.ruth if (Existe) then
  {   FMain.EjecutaAccion(FMain.ZAPresupuestos,'id_detalles_ofertas_v = '+
    IntToStr(ID_OfertaPres) +' and Empresa = ' +
    IntToStr(REntorno.EMPRESA))
  else
   begin
     ZDMPresupuesto.InsertarPresupuesto(ID_OfertaPres);
     DBEFCliente.Text := DMOfertas.QMCabeceraCLIENTE.AsString;
     DBEdit5.Text := DMOfertas.QMDetalleTITULO.AsString;
   end
  }
end;

procedure TZFMPresupuesto.FiltraPresupuesto(Filtro: string);
var
  Parametro : TParametroFiltrado;
begin
  Parametro := TParametroFiltrado.Create;
  try
     Parametro.Filtro := Filtro;
     Parametro.SQLBase := TStringList.Create;
     // Mismo SQL pero sin filtrar EJERCICIO
     // Parametro.SQLBase.Text := ZDMPresupuesto.QMPresupuesto.SelectSQL.Text;
     Parametro.SQLBase.Add(' SELECT * FROM Z_EMP_PRESUPUESTO ');
     Parametro.SQLBase.Add(' WHERE ');
     Parametro.SQLBase.Add(' EMPRESA = ?EMPRESA AND ');
     Parametro.SQLBase.Add(' CANAL = ?CANAL ');
     Parametro.SQLBase.Add(' ORDER BY N_PRESUPUETO, FECHA_EMISION ');
     Parametro.Tabla := ZDMPresupuesto.QMPresupuesto;
     DMMain.FiltraSQL(Parametro);
  finally
     Parametro.SQLBase.Free;
     Parametro.Free;
  end;

  if (Filtro <> '') then
  begin
     SWEnlace := 1;
     SWFil := 0;
  end;
end;

//Fin SFG_RSP
procedure TZFMPresupuesto.LFNumTintasChange(Sender: TObject);
var
  Cantidad : integer;
begin
  inherited;
  Cantidad := StrToIntDef(LfDBCantidad.Text, 0);
  LDBEFTinta1.Visible := Cantidad >= 1;
  LDBEFTinta2.Visible := Cantidad >= 2;
  LDBEFTinta3.Visible := Cantidad >= 3;
  LDBEFTinta4.Visible := Cantidad >= 4;
  LDBEFTinta5.Visible := Cantidad >= 5;
  LDBEFTinta6.Visible := Cantidad >= 6;
  LDBEFTinta7.Visible := Cantidad >= 7;
  LDBEFTinta8.Visible := Cantidad >= 8;
  DBETinta1.Visible := Cantidad >= 1;
  DBETinta2.Visible := Cantidad >= 2;
  DBETinta3.Visible := Cantidad >= 3;
  DBETinta4.Visible := Cantidad >= 4;
  DBETinta5.Visible := Cantidad >= 5;
  DBETinta6.Visible := Cantidad >= 6;
  DBETinta7.Visible := Cantidad >= 7;
  DBETinta8.Visible := Cantidad >= 8;
  LTinta1.Visible := Cantidad >= 1;
  LTinta2.Visible := Cantidad >= 2;
  LTinta3.Visible := Cantidad >= 3;
  LTinta4.Visible := Cantidad >= 4;
  LTinta5.Visible := Cantidad >= 5;
  LTinta6.Visible := Cantidad >= 6;
  LTinta7.Visible := Cantidad >= 7;
  LTinta8.Visible := Cantidad >= 8;
  DBEPCosteTinta1.Visible := Cantidad >= 1;
  DBEPCosteTinta2.Visible := Cantidad >= 2;
  DBEPCosteTinta3.Visible := Cantidad >= 3;
  DBEPCosteTinta4.Visible := Cantidad >= 4;
  DBEPCosteTinta5.Visible := Cantidad >= 5;
  DBEPCosteTinta6.Visible := Cantidad >= 6;
  DBEPCosteTinta7.Visible := Cantidad >= 7;
  DBEPCosteTinta8.Visible := Cantidad >= 8;
end;

procedure TZFMPresupuesto.LDBEFBarnizChange(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFBarniz.Text);
end;

procedure TZFMPresupuesto.LDBEFAdhesivoChange(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFAdhesivo.Text);
end;

procedure TZFMPresupuesto.DBBarnizClick(Sender: TObject);
begin
  inherited;
  LArtBarniz.Visible := DBBarniz.Checked;
  LDBEFBarniz.Visible := DBBarniz.Checked;
  DBEDescArtBarniz.Visible := DBBarniz.Checked;
  DBEPCosteBarniz.Visible := DBBarniz.Checked;
end;

procedure TZFMPresupuesto.LFEFArtMAtChange(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LFEFArtMAt.Text);
end;

procedure TZFMPresupuesto.LDBEFCajaChange(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFCaja.Text);
end;

procedure TZFMPresupuesto.LDBEFTinta1Change(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFTinta1.Text);
end;

procedure TZFMPresupuesto.LDBEFTinta2Change(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFTinta2.Text);
end;

procedure TZFMPresupuesto.LDBEFTinta3Change(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFTinta3.Text);
end;

procedure TZFMPresupuesto.LDBEFTinta4Change(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFTinta4.Text);
end;

procedure TZFMPresupuesto.LDBEFTinta5Change(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFTinta5.Text);
end;

procedure TZFMPresupuesto.LDBEFTinta6Change(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFTinta6.Text);
end;

procedure TZFMPresupuesto.LDBEFTinta7Change(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFTinta7.Text);
end;

procedure TZFMPresupuesto.LDBEFTinta8Change(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFTinta8.Text);
end;

procedure TZFMPresupuesto.LDBEFPortesChange(Sender: TObject);
begin
  inherited;
  DameTituloArticulo(LDBEFPortes.Text);
end;

procedure TZFMPresupuesto.LDBEFRecursoChange(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.DameTituloRecurso(LDBEFRecurso.Text);
end;

procedure TZFMPresupuesto.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  if Trim(DBGFDetalle.TablaABuscar) = 'Z_MAQUINAS_CAB' then
  begin
     DBGFDetalle.CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr;
     DBGFDetalle.PlanBusquedaNum := '';
     DBGFDetalle.PlanBusquedaStr := '';
  end
  else
  if Trim(DBGFDetalle.TablaABuscar) = 'Z_MAQUINAS_DET' then
  begin
     DBGFDetalle.CondicionBusqueda := 'CODMAQ= ' + ZDMPresupuesto.QMDetalleMAQUINA.AsString;
     DBGFDetalle.PlanBusquedaNum := '';
     DBGFDetalle.PlanBusquedaStr := '';
  end
  else
  if Trim(DBGFDetalle.TablaABuscar) = 'PRO_RECURSOS' then
  begin
     DBGFDetalle.CondicionBusqueda := 'EMPRESA= ' + REntorno.EmpresaStr;
     DBGFDetalle.PlanBusquedaNum := '';
     DBGFDetalle.PlanBusquedaStr := '';
  end;
end;

procedure TZFMPresupuesto.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProOfertasE, 'id_esc = ' + IntToStr(ZDMPresupuesto.QMDetalleID_ESC.AsInteger));
end;

procedure TZFMPresupuesto.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'ID_ESC') then
     CeldaEnlace(DBGFDetalle, Rect);
end;

procedure TZFMPresupuesto.ACrearOfertaEscandalloExecute(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.CrearOfertaEscandallo;
end;

procedure TZFMPresupuesto.ABorrarOfertaEscandalloExecute(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.BorrarOfertaEscandallo;
end;

procedure TZFMPresupuesto.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  ZDMPresupuesto.RellenaDatosDetalle;
end;

procedure TZFMPresupuesto.AListadoExecute(Sender: TObject);
begin
  ZDMPresupuesto.ImprimeListado(9904);
end;

procedure TZFMPresupuesto.AConfiguracionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(9904, formato, cabecera, copias,
     pijama, '', ZDMPresupuesto.frPresupuesto);
end;

end.
