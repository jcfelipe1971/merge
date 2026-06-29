{Especifico cliente DICOMOL}

unit UFMReparacionesDicomol;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, ULFDBEdit, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000,
  ULFEdit, rxToolEdit, RXDBCtrl, UHYDescription, ULFHYDBDescription,
  UFPEditDetalle, ULFDBMemo, ULFDBDateEdit, DbComboBoxValue, Buttons;

type
  TFMReparacionesDicomol = class(TFPEdit)
     LReparacion: TLFLabel;
     LCliente: TLFLabel;
     LArticulo: TLFLabel;
     LFDBCliente: TLFDBEditFind2000;
     LFDBFamilia: TLFDBEditFind2000;
     LFamilia: TLFLabel;
     AGenerarOrden: TAction;
     AListadoEtiquetas: TAction;
     LSerie: TLFLabel;
     LOrden: TLFLabel;
     DBEFSeries: TDBEditFind2000;
     LFOrden: TLFEdit;
     LFDBArticulo: TLFDBEditFind2000;
     DBEProveedor: TLFDbedit;
     DBDTPFecha: TDBDateEdit;
     DescArticulo: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     DescCliente: TLFDbedit;
     DescFamilia: TLFDbedit;
     LEstado: TLFLabel;
     LFDBEstado: TLFDbedit;
     ALReparaciones: TLFActionList;
     AACliente: TAction;
     AAOrden: TAction;
     LFDBOrdV: TLFDbedit;
     SBAOrden: TSpeedButton;
     SBACliente: TSpeedButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure LFDBClienteChange(Sender: TObject);
     procedure LFDBFamiliaChange(Sender: TObject);
     procedure LFDBArticuloChange(Sender: TObject);
     procedure AListadoEtiquetasExecute(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AGenerarOrdenExecute(Sender: TObject);
     procedure AAOrdenExecute(Sender: TObject);
     procedure SBAOrdenDblClick(Sender: TObject);
     procedure AAClienteExecute(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMReparacionesDicomol : TFMReparacionesDicomol;

implementation

uses UDMMain, UFormGest, UDMReparacionesDicomol, UEntorno, UDMListados, UFMListconfig,
  UFMain, UUtiles, FIBQuery, UProFMFicherosCliente, DB, UProFMPedidosOrd,
  UProFMOrden, UProDMOrden, FIBDataSet, UProFMLstCodBarras, HYFIBQuery;

{$R *.dfm}

procedure TFMReparacionesDicomol.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMReparacionesDicomol, DMReparacionesDicomol);
  AbreData(TDMListados, DMListados);

  DescCliente.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBACliente, DescCliente);

  LFOrden.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAOrden, LFOrden);

  NavMain.DataSource := DMReparacionesDicomol.ZDSQMReparaciones;
  DBGMain.DataSource := DMReparacionesDicomol.ZDSQMReparaciones;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  G2KTableLoc.Base_de_datos := DMMain.DataBase;
  G2KTableLoc.DataSource := DMReparacionesDicomol.ZDSQMReparaciones;
end;

procedure TFMReparacionesDicomol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMReparacionesDicomol);
  CierraData(DMListados);
end;

procedure TFMReparacionesDicomol.LFDBClienteChange(Sender: TObject);
begin
  inherited;
  DescCliente.Text := DMReparacionesDicomol.BuscarCliente;
end;

procedure TFMReparacionesDicomol.LFDBFamiliaChange(Sender: TObject);
begin
  inherited;
  DescFamilia.Text := DMReparacionesDicomol.BuscarFamilia;
end;

procedure TFMReparacionesDicomol.LFDBArticuloChange(Sender: TObject);
begin
  inherited;
  DescArticulo.Text := DMReparacionesDicomol.BuscarArticulo;
end;

procedure TFMReparacionesDicomol.AListadoEtiquetasExecute(Sender: TObject);
begin
  inherited;
  DMReparacionesDicomol.xLstReparaciones.Close;
  DMReparacionesDicomol.xLstReparaciones.Open;
  AbreForm(TProFMLstCodBarras, ProFMLstCodBarras, Sender);
  ProFMLstCodBarras.PCMain.ActivePage := ProFMLstCodBarras.TSProduccion;
end;

procedure TFMReparacionesDicomol.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMReparacionesDicomol.BusquedaCompleja;
  Continua := False;
end;

procedure TFMReparacionesDicomol.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.DataSource := DMReparacionesDicomol.ZDSQMReparaciones;
  G2KTableLoc.Click;
end;

procedure TFMReparacionesDicomol.AGenerarOrdenExecute(Sender: TObject);
begin
  inherited;

  if (DMReparacionesDicomol.TieneFamilia = 0) then
     MessageDlg(_('Falta informar la familia en la tabla de familias escandallos.'), mtError, [mbOK], 0)
  else
  begin
     Screen.Cursor := crHourGlass;
     try
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE Z_REPARACIONES_ORDEN(:EMPRESA, :FAMILIA, :COMPUESTO_DEST, :ENTRADA)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['FAMILIA'].AsString := DMReparacionesDicomol.ZQMReparacionesFAMILIA.AsString;
              Params.ByName['COMPUESTO_DEST'].AsString := DMReparacionesDicomol.ZQMReparacionesARTICULO.AsString;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        FMain.EjecutaAccion(FMain.AProOrden);

        ProDMOrden.QMProOrd.Insert;
        ProFMOrden.DBEFCompuesto.Text := DMReparacionesDicomol.ZQMReparacionesARTICULO.AsString;
        ProFMOrden.DBEFCliente.Text := DMReparacionesDicomol.ZQMReparacionesCLIENTE.AsString;
        ProDMOrden.QMProOrd.Post;

        DMReparacionesDicomol.ZQMReparaciones.Edit;
        DMReparacionesDicomol.ZQMReparacionesID_ORDEN.AsInteger := ProDMOrden.QMProOrdID_ORDEN.AsInteger;

        // Es posa l'estat al valor de tancada
        DMReparacionesDicomol.ZQMReparacionesESTADO_REP.AsInteger := 5;
        DMReparacionesDicomol.ZQMReparaciones.Post;

        DMReparacionesDicomol.ZQMReparacionesAfterScroll(DMReparacionesDicomol.ZQMReparaciones);

        AGenerarOrden.Enabled := False;
        CierraFormsMenos(ProFMOrden);
     finally
        Screen.Cursor := crDefault;
     end;
  end;
end;

procedure TFMReparacionesDicomol.AAOrdenExecute(Sender: TObject);
begin
  inherited;
  if (LFDBOrdV.Text <> '0') then
  begin
     FMain.EjecutaAccion(FMain.AProOrden, LFDBOrdV.Text);
  end;
end;

procedure TFMReparacionesDicomol.SBAOrdenDblClick(Sender: TObject);
begin
  inherited;
  AAOrden.Execute;
end;

procedure TFMReparacionesDicomol.AAClienteExecute(Sender: TObject);
begin
  inherited;
  if (LFDBCliente.Text <> '') then
  begin
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + LFDBCliente.Text);
  end;
end;

procedure TFMReparacionesDicomol.SBAClienteDblClick(Sender: TObject);
begin
  inherited;
  AACliente.Execute;
end;

end.
