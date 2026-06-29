unit UFMVerificacionesImpuestos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, UNavigator, Grids, DBGrids, NsDBGrid, ExtCtrls,
  ULFPanel, ComCtrls, ToolWin, ULFToolBar, ULFPageControl, ActnList,
  UHYDBGrid, StdCtrls, Mask, rxToolEdit, ULFDateEdit, ULFLabel, DateUtils;

type
  TFMVerificacionesImpuestos = class(TG2kForm)
     PCMain: TLFPageControl;
     TBMain: TLFToolBar;
     TSIntracomunitarios: TTabSheet;
     PNLIntraClientes: TLFPanel;
     PNLIntraProveedores: TLFPanel;
     Splitter1: TSplitter;
     DBGIntraClientes: THYTDBGrid;
     DBGIntraProveedores: THYTDBGrid;
     TBIntraClientes: TLFToolBar;
     TBIntraProveedores: TLFToolBar;
     NavIntraClientes: THYMNavigator;
     NavIntraProveedores: THYMNavigator;
     ToolButton1: TToolButton;
     ToolButton2: TToolButton;
     ToolButton3: TToolButton;
     ToolButton4: TToolButton;
     ALMain: TActionList;
     ARefrescaIntraClientes: TAction;
     ARefrescaIntraProveedores: TAction;
     TSAutofacturas: TTabSheet;
     TSFacturasModo: TTabSheet;
     PNLModoIncorrectoCliente: TLFPanel;
     DBGModoIncorrectoCliente: THYTDBGrid;
     TBModoIncorrectoCliente: TLFToolBar;
     NavModoIncorrectoCliente: THYMNavigator;
     ToolButton5: TToolButton;
     TButtModoIncorrectoRefrescaCliente: TToolButton;
     Splitter2: TSplitter;
     PNLModoIncorrectoProveedor: TLFPanel;
     DBGModoIncorrectoProveedor: THYTDBGrid;
     TBModoIncorrectoProveedor: TLFToolBar;
     NavModoIncorrectoProveedor: THYMNavigator;
     ToolButton7: TToolButton;
     TButtModoIncorrectoRefrescaProveedor: TToolButton;
     PNLModoIncorrectoAcreedor: TLFPanel;
     DBGModoIncorrectoAcreedor: THYTDBGrid;
     TBModoIncorrectoAcreedor: TLFToolBar;
     NavModoIncorrectoAcreedor: THYMNavigator;
     ToolButton9: TToolButton;
     TButtModoIncorrectoRefrescaAcreedor: TToolButton;
     Splitter3: TSplitter;
     ARefrescaModoIncorrectoCliente: TAction;
     ARefrescaModoIncorrectoProveedor: TAction;
     ARefrescaModoIncorrectoAcreedor: TAction;
     TSCompMod349: TTabSheet;
     PNLMod349Pais: TLFPanel;
     PNLMod349ModoIVA: TLFPanel;
     PNLMod349: TLFPanel;
     Splitter4: TSplitter;
     Splitter5: TSplitter;
     TBMod349Pais: TLFToolBar;
     TBMod349ModoIVA: TLFToolBar;
     TBMod349: TLFToolBar;
     NavMod349Pais: THYMNavigator;
     NavMod349ModoIVA: THYMNavigator;
     NavMod349: THYMNavigator;
     DGBMod349Pais: THYTDBGrid;
     DGBMod349ModoIVA: THYTDBGrid;
     DBGMod349: THYTDBGrid;
     ToolButton6: TToolButton;
     ToolButton8: TToolButton;
     ToolButton10: TToolButton;
     TButtRefrescaMod349Pais: TToolButton;
     TButtRefrescaMod349Modo: TToolButton;
     TButtRefrescaMod349: TToolButton;
     ARefrescaMod349Pais: TAction;
     ARefrescaMod349Modo: TAction;
     ARefrescaMod349: TAction;
     PNLFechas: TLFPanel;
     LDesde: TLFLabel;
     LHasta: TLFLabel;
     DEDesdeFecha: TLFDateEdit;
     DEHastaFecha: TLFDateEdit;
     ToolButton11: TToolButton;
     TButtAFiltrarFechas: TToolButton;
     AFiltrarFechas: TAction;
     ToolButton12: TToolButton;
     TButtSiguienteErrorPais: TButton;
     TButtAnteriorErrorPais: TButton;
     ToolButton13: TToolButton;
     TButtSiguienteErrorModo: TButton;
     TButtAnteriorErrorModo: TButton;
     ToolButton14: TToolButton;
     TButtSiguienteErrorModelo: TButton;
     TButtAnteriorErrorModelo: TButton;
     ASiguienteErrorPais: TAction;
     AAnteriorErrorPais: TAction;
     ASiguienteErrorModo: TAction;
     AAnteriorErrorModo: TAction;
     ASiguienteErrorModelo: TAction;
     AAnteriorErrorModelo: TAction;
     LMod349Pais: TLFLabel;
     LMod349ModoIVA: TLFLabel;
     LMod349: TLFLabel;
     TBIntraClientesModoIncorrecto: TLFLabel;
     LIntraProveedoresModoIncorrecto: TLFLabel;
     LIntraAcreedoresModoIncorrecto: TLFLabel;
     LIntraClientes: TLFLabel;
     LIntraProveedores: TLFLabel;
     PNLIntraAcreedores: TLFPanel;
     LIntraAcreedores: TLFLabel;
     DBGIntraAcreedores: THYTDBGrid;
     TBIntraAcreedores: TLFToolBar;
     NavIntraAcreedores: THYMNavigator;
     ToolButton15: TToolButton;
     ToolButton16: TToolButton;
     Splitter6: TSplitter;
     ARefrescaIntraAcreedores: TAction;
     PNLAutofacturas: TLFPanel;
     LAutofactura: TLFLabel;
     DBGAutofactura: THYTDBGrid;
     TBAutofactura: TLFToolBar;
     NavAutofactura: THYMNavigator;
     ToolButton17: TToolButton;
     TBRefrescaAutofactura: TToolButton;
     ARefrescaAutofactura: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGIntraClientesDblClick(Sender: TObject);
     procedure DBGIntraProveedoresDblClick(Sender: TObject);
     procedure ARefrescaIntraClientesExecute(Sender: TObject);
     procedure ARefrescaIntraProveedoresExecute(Sender: TObject);
     procedure ARefrescaModoIncorrectoClienteExecute(Sender: TObject);
     procedure ARefrescaModoIncorrectoProveedorExecute(Sender: TObject);
     procedure ARefrescaModoIncorrectoAcreedorExecute(Sender: TObject);
     procedure DBGModoIncorrectoClienteDblClick(Sender: TObject);
     procedure DBGModoIncorrectoProveedorDblClick(Sender: TObject);
     procedure DBGModoIncorrectoAcreedorDblClick(Sender: TObject);
     procedure TButtRefrescaMod349PaisClick(Sender: TObject);
     procedure TButtRefrescaMod349ModoClick(Sender: TObject);
     procedure TButtRefrescaMod349Click(Sender: TObject);
     procedure DEDesdeFechaChange(Sender: TObject);
     procedure DEHastaFechaChange(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure AFiltrarFechasExecute(Sender: TObject);
     procedure DGBMod349PaisDblClick(Sender: TObject);
     procedure DGBMod349ModoIVADblClick(Sender: TObject);
     procedure DBGMod349DblClick(Sender: TObject);
     procedure ASiguienteErrorPaisExecute(Sender: TObject);
     procedure AAnteriorErrorPaisExecute(Sender: TObject);
     procedure ASiguienteErrorModoExecute(Sender: TObject);
     procedure AAnteriorErrorModoExecute(Sender: TObject);
     procedure ASiguienteErrorModeloExecute(Sender: TObject);
     procedure AAnteriorErrorModeloExecute(Sender: TObject);
     procedure ARefrescaIntraAcreedoresExecute(Sender: TObject);
     procedure DBGIntraAcreedoresDblClick(Sender: TObject);
     procedure ARefrescaAutofacturaExecute(Sender: TObject);
     procedure DBGAutofacturaDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMVerificacionesImpuestos : TFMVerificacionesImpuestos;

implementation

uses UDMVerificacionesImpuestos, UFMain, UEntorno, UDMMain;

{$R *.dfm}

procedure TFMVerificacionesImpuestos.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMVerificacionesImpuestos, DMVerificacionesImpuestos);
  DEDesdeFecha.Date := EncodeDate(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab), 1);
  DEHastaFecha.Date := EncodeDate(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab), DaysInAMonth(YearOf(REntorno.FechaTrab), MonthOf(REntorno.FechaTrab)));
end;

procedure TFMVerificacionesImpuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMVerificacionesImpuestos);
end;

procedure TFMVerificacionesImpuestos.DBGIntraClientesDblClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMVerificacionesImpuestos.xClientesIntraCLIENTE.AsInteger));
end;

procedure TFMVerificacionesImpuestos.DBGIntraProveedoresDblClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR=' + IntToStr(DMVerificacionesImpuestos.xProveedoresIntraPROVEEDOR.AsInteger) + ' AND EJERCICIO=' + IntToStr(DMVerificacionesImpuestos.xProveedoresIntraEJERCICIO.AsInteger));
end;

procedure TFMVerificacionesImpuestos.ARefrescaIntraClientesExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosIntraCliente;
end;

procedure TFMVerificacionesImpuestos.ARefrescaIntraProveedoresExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosIntraProveedor;
end;

procedure TFMVerificacionesImpuestos.ARefrescaModoIncorrectoClienteExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosModoIncorrectoCliente;
end;

procedure TFMVerificacionesImpuestos.ARefrescaModoIncorrectoProveedorExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosModoIncorrectoProveedor;
end;

procedure TFMVerificacionesImpuestos.ARefrescaModoIncorrectoAcreedorExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosModoIncorrectoAcreedor;
end;

procedure TFMVerificacionesImpuestos.DBGModoIncorrectoClienteDblClick(Sender: TObject);
begin
  FMain.MuestraDocumento(DMVerificacionesImpuestos.xFACModoIncorrectoEJERCICIO.AsInteger, DMVerificacionesImpuestos.xFACModoIncorrectoTIPO.AsString, DMVerificacionesImpuestos.xFACModoIncorrectoSERIE.AsString, DMVerificacionesImpuestos.xFACModoIncorrectoRIG.AsInteger);
end;

procedure TFMVerificacionesImpuestos.DBGModoIncorrectoProveedorDblClick(Sender: TObject);
begin
  FMain.MuestraDocumento(DMVerificacionesImpuestos.xFAPModoIncorrectoEJERCICIO.AsInteger, DMVerificacionesImpuestos.xFAPModoIncorrectoTIPO.AsString, DMVerificacionesImpuestos.xFAPModoIncorrectoSERIE.AsString, DMVerificacionesImpuestos.xFAPModoIncorrectoRIG.AsInteger);
end;

procedure TFMVerificacionesImpuestos.DBGModoIncorrectoAcreedorDblClick(Sender: TObject);
begin
  FMain.MuestraDocumento(DMVerificacionesImpuestos.xFCRModoIncorrectoEJERCICIO.AsInteger, DMVerificacionesImpuestos.xFCRModoIncorrectoTIPO.AsString, DMVerificacionesImpuestos.xFCRModoIncorrectoSERIE.AsString, DMVerificacionesImpuestos.xFCRModoIncorrectoRIG.AsInteger);
end;

procedure TFMVerificacionesImpuestos.TButtRefrescaMod349PaisClick(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosMod349Pais;
end;

procedure TFMVerificacionesImpuestos.TButtRefrescaMod349ModoClick(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosMod349Modo;
end;

procedure TFMVerificacionesImpuestos.TButtRefrescaMod349Click(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosMod349;
end;

procedure TFMVerificacionesImpuestos.DEDesdeFechaChange(Sender: TObject);
begin
  DMVerificacionesImpuestos.DesdeFecha := Trunc(DEDesdeFecha.Date);
end;

procedure TFMVerificacionesImpuestos.DEHastaFechaChange(Sender: TObject);
begin
  DMVerificacionesImpuestos.HastaFecha := Trunc(DEHastaFecha.Date) + 0.999999;
end;

procedure TFMVerificacionesImpuestos.FormResize(Sender: TObject);
begin
  PNLIntraClientes.Height := (TSIntracomunitarios.Height) div 3;
  PNLIntraAcreedores.Height := (TSIntracomunitarios.Height) div 3;
  PNLModoIncorrectoCliente.Height := (TSFacturasModo.Height) div 3;
  PNLModoIncorrectoAcreedor.Height := (TSFacturasModo.Height) div 3;
  PNLMod349Pais.Width := (TSCompMod349.Width) div 3;
  PNLMod349.Width := (TSCompMod349.Width) div 3;
end;

procedure TFMVerificacionesImpuestos.AFiltrarFechasExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosMod349Pais;
  DMVerificacionesImpuestos.AbreDatosMod349Modo;
  DMVerificacionesImpuestos.AbreDatosMod349;
end;

procedure TFMVerificacionesImpuestos.DGBMod349PaisDblClick(Sender: TObject);
begin
  if ((DMVerificacionesImpuestos.xMod349PaisTIPO_DOC.AsString = 'FAP') or
     (DMVerificacionesImpuestos.xMod349PaisTIPO_DOC.AsString = 'FCR') or
     (DMVerificacionesImpuestos.xMod349PaisTIPO_DOC.AsString = 'FAC')) then
     FMain.MuestraDocumento(REntorno.Ejercicio, DMVerificacionesImpuestos.xMod349PaisTIPO_DOC.AsString, DMVerificacionesImpuestos.xMod349PaisDOC_SERIE.AsString, DMVerificacionesImpuestos.xMod349PaisDOC_NUMERO.AsInteger)
  else
     FMain.MuestraMovConta(' RIC= ' + IntToStr(DMVerificacionesImpuestos.DameRIC(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, DMVerificacionesImpuestos.xMod349PaisSIGNO.AsString, DMVerificacionesImpuestos.xMod349PaisRIG_VISIBLE.AsInteger)) +
        ' and ejercicio=' + REntorno.EjercicioStr);
end;

procedure TFMVerificacionesImpuestos.DGBMod349ModoIVADblClick(Sender: TObject);
begin
  if ((DMVerificacionesImpuestos.xMod349ModoTIPO_DOC.AsString = 'FAP') or
     (DMVerificacionesImpuestos.xMod349ModoTIPO_DOC.AsString = 'FCR') or
     (DMVerificacionesImpuestos.xMod349ModoTIPO_DOC.AsString = 'FAC')) then
     FMain.MuestraDocumento(REntorno.Ejercicio, DMVerificacionesImpuestos.xMod349ModoTIPO_DOC.AsString, DMVerificacionesImpuestos.xMod349ModoDOC_SERIE.AsString, DMVerificacionesImpuestos.xMod349ModoDOC_NUMERO.AsInteger)
  else
     FMain.MuestraMovConta(' RIC= ' + IntToStr(DMVerificacionesImpuestos.DameRIC(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, DMVerificacionesImpuestos.xMod349ModoSIGNO.AsString, DMVerificacionesImpuestos.xMod349ModoRIG_VISIBLE.AsInteger)) +
        ' and ejercicio=' + REntorno.EjercicioStr);
end;

procedure TFMVerificacionesImpuestos.DBGMod349DblClick(Sender: TObject);
begin
  if ((DMVerificacionesImpuestos.xMod349TIPO_DOC.AsString = 'FAP') or
     (DMVerificacionesImpuestos.xMod349TIPO_DOC.AsString = 'FCR') or
     (DMVerificacionesImpuestos.xMod349TIPO_DOC.AsString = 'FAC')) then
     FMain.MuestraDocumento(REntorno.Ejercicio, DMVerificacionesImpuestos.xMod349TIPO_DOC.AsString, DMVerificacionesImpuestos.xMod349DOC_SERIE.AsString, DMVerificacionesImpuestos.xMod349DOC_NUMERO.AsInteger)
  else
     FMain.MuestraMovConta(' RIC= ' + IntToStr(DMVerificacionesImpuestos.DameRIC(REntorno.Empresa, REntorno.Ejercicio, REntorno.Canal, DMVerificacionesImpuestos.xMod349SIGNO.AsString, DMVerificacionesImpuestos.xMod349RIG_VISIBLE.AsInteger)) +
        ' and ejercicio=' + REntorno.EjercicioStr);
end;

procedure TFMVerificacionesImpuestos.ASiguienteErrorPaisExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.BuscaSiguienteErrorPais;
end;

procedure TFMVerificacionesImpuestos.AAnteriorErrorPaisExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.BuscaErrorAnteriorPais;
end;

procedure TFMVerificacionesImpuestos.ASiguienteErrorModoExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.BuscaSiguienteErrorModo;
end;

procedure TFMVerificacionesImpuestos.AAnteriorErrorModoExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.BuscaErrorAnteriorModo;
end;

procedure TFMVerificacionesImpuestos.ASiguienteErrorModeloExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.BuscaSiguienteErrorModelo;
end;

procedure TFMVerificacionesImpuestos.AAnteriorErrorModeloExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.BuscaErrorAnteriorModelo;
end;

procedure TFMVerificacionesImpuestos.ARefrescaIntraAcreedoresExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosIntraAcreedor;
end;

procedure TFMVerificacionesImpuestos.DBGIntraAcreedoresDblClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AAcreedores, 'ACREEDOR=' + IntToStr(DMVerificacionesImpuestos.xAcreedoresIntraACREEDOR.AsInteger) + ' AND EJERCICIO=' + IntToStr(DMVerificacionesImpuestos.xAcreedoresIntraEJERCICIO.AsInteger));
end;

procedure TFMVerificacionesImpuestos.ARefrescaAutofacturaExecute(Sender: TObject);
begin
  DMVerificacionesImpuestos.AbreDatosAutofactura;
end;

procedure TFMVerificacionesImpuestos.DBGAutofacturaDblClick(Sender: TObject);
begin
  FMain.MuestraDocumento(REntorno.Ejercicio, DMVerificacionesImpuestos.xAutofacturaTIPO.AsString, DMVerificacionesImpuestos.xAutofacturaSERIE.AsString, DMVerificacionesImpuestos.xAutofacturaRIG.AsInteger);
end;

end.
