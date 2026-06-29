unit UFMPedidosAlquiler;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, UFMPedidos, Barras, ULFActionList, ExtCtrls, rxPlacemnt,
  ULFFormStorage, ActnList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, UEditPanel, Grids,
  DBGrids, NsDBGrid, UHYDBGrid, UNavigator, ComCtrls, StdCtrls, ToolWin,
  ULFToolBar, ULFEdit, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, ULFDBEditFind2000, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  Mask, ULFDBEdit, ULFLabel, Buttons, ULFPageControl, ULFPanel,
  UDBDateTimePicker, ULFDBMemo, URecursos, ULFComboBox, UG2kTBLoc;

type
  TFMPedidosAlquiler = class(TFMPedidos)
     TSAlquiler: TTabSheet;
     LPedidoAlquiler: TLFLabel;
     DBEPedidoAlquiler: TLFDbedit;
     LEstadoAlquiler: TLFLabel;
     DBEEstadoAlquiler: TLFDbedit;
     DBCHKListadoAlquiler: TLFDBCheckBox;
     LClienteAlquiler: TLFLabel;
     DBEFClienteAlquiler: TLFDBEditFind2000;
     DBEClienteAlquiler: TLFDbedit;
     LTarifaAlquiler: TLFLabel;
     DBEFTarifaAlquiler: TLFDBEditFind2000;
     ETituloTarifaAlquiler: TLFDbedit;
     LDireccionAlquiler: TLFLabel;
     DBEFDireccionAlquiler: TLFDBEditFind2000;
     ETituloDireccionAlquiler: TLFDbedit;
     LAgenteAlquiler: TLFLabel;
     DBEFAgenteAlquiler: TLFDBEditFind2000;
     ETituloAgenteAlquiler: TLFDbedit;
     LFormaPagoAlquiler: TLFLabel;
     DBEFFormaPagoAlquiler: TLFDBEditFind2000;
     DBETituloFormaPagoAlquiler: TLFDbedit;
     LAlmacenAlquiler: TLFLabel;
     DBEFAlmacenAlquiler: TLFDBEditFind2000;
     DBETituloAlmacenAlquiler: TLFDbedit;
     LReferenciaAlquiler: TLFLabel;
     DBEReferenciaAlquiler: TLFDbedit;
     LFechaPedidoAlquiler: TLFLabel;
     DBDEFechaPedidoAlquiler: TLFDBDateEdit;
     DBTPHoraEventoAlquiler: TDBDateTimePicker;
     DBDEFechaEventoAlquiler: TLFDBDateEdit;
     LFechaEventoAlquiler: TLFLabel;
     DBDTPHoraEntregaAlquiler: TDBDateTimePicker;
     DBDEFechaEntregaAlquiler: TLFDBDateEdit;
     LFechaEntregaAlquiler: TLFLabel;
     LFechaRecogidaAlquiler: TLFLabel;
     DBDEFechaRecogidaAlquiler: TLFDBDateEdit;
     DBDTPHoraRecogidaAlquiler: TDBDateTimePicker;
     LDias: TLFLabel;
     DBEDias: TLFDbedit;
     DBMDireccionEventoAlquiler: TLFDBMemo;
     LDireccionEventoAlquiler: TLFLabel;
     PNLAlquiler: TLFPanel;
     CEAlquiler: TControlEdit;
     CEAlquilerPMEdit: TPopUpTeclas;
     DBGAnticiposAlquiler: THYTDBGrid;
     LAnticiposAlquiler: TLFLabel;
     TButtCreaAnticipo: TToolButton;
     DBETotalAnticipos: TLFDbedit;
     LTotalAnticipos: TLFLabel;
     AVerAnticipos: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure AVerAnticiposExecute(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure ANewClienteExecute(Sender: TObject);
     procedure ANewAgenteExecute(Sender: TObject);
     procedure ACreaAnticipoExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Notas;
  end;

var
  FMPedidosAlquiler : TFMPedidosAlquiler;

implementation

uses UFormGest, UDMPedidos, UDMPedidosAlquiler, UDMMain, UFMain, UUtiles,
  UFMReciboNuevo {$IFNDEF TPV}, UFMCartera{$ENDIF}, UEntorno;

{$R *.dfm}

procedure TFMPedidosAlquiler.FormCreate(Sender: TObject);
begin
  AbreData(TDMPedidosAlquiler, DMPedidos);

  DMPedidosAlquiler := TDMPedidosAlquiler(DMPedidos);
  DBGAnticiposAlquiler.DataSource := DMPedidosAlquiler.DSxAnticiposAlquiler;

  Application.ProcessMessages;

  inherited;

  TSEDI.TabVisible := False;
  TSFicha.TabVisible := False;
  TSAlquiler.PageIndex := 0;
  PCMain.ActivePage := TSAlquiler;

  // Para prevenir que ponga el control en un componente de TSFicha. (KRICONF_218) 
  NavMain.InsertaControl := DBEFClienteAlquiler;
  NavMain.EditaControl := DBEFClienteAlquiler;
end;

procedure TFMPedidosAlquiler.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPedidosAlquiler);
  DMPedidos := nil;
end;

procedure TFMPedidosAlquiler.Notas;
begin
  inherited;
end;

procedure TFMPedidosAlquiler.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMPedidos.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'STOCK_FUTURO') then
     begin
        with DBGFDetalle do
        begin
           if (gdFocused in State) then //If the cell has the focus
              ColorFocused(Canvas)
           else
           begin
              if (DMPedidos.QMCabeceraESTADO.AsInteger > 0) then
                 ColorInactivo(Canvas)
              else
              begin
                 if (DMPedidos.QMDetalle.FieldByName('STOCK_FUTURO').AsFloat >= DMPedidos.QMDetalleUNIDADES.AsFloat) then
                    ColorInfo(Canvas)
                 else
                    ColorError(Canvas);
              end;
           end;
        end;
     end;
  end;

  inherited;
end;

procedure TFMPedidosAlquiler.AVerAnticiposExecute(Sender: TObject);
var
  ListaId : string;
begin
  inherited;
  ListaId := '';
  with DMPedidosAlquiler.xAnticiposAlquiler do
  begin
     DisableControls;
     try
        First;
        if not EOF then
           ListaId := FieldByName('ID_CARTERA').AsString;
        Next;
        while not EOF do
        begin
           ListaId := ListaId + ', ' + FieldByName('ID_CARTERA').AsString;
           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  {$IFNDEF TPV}
  FMain.EjecutaAccion(FMain.ACartera);

  FMCartera.FiltraRegistro('C', ListaId);
  {$ENDIF}
end;

procedure TFMPedidosAlquiler.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  TSFicha.TabVisible := False;
  TSEDI.TabVisible := False;
end;

procedure TFMPedidosAlquiler.ANewClienteExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     try
        FMain.EnlaceModal := True;
        FMain.EnlaceInstancias := True;
        FMain.EnlaceCrea := True;
        FMain.EjecutaAccion(FMain.AClientes);

        if FMain.EnlaceDatos <> Null then
        begin
           DBEFClienteAlquiler.SetBufferText(FMain.EnlaceDatos);
        end;
        DBEFTarifaAlquiler.SetFocus;
     finally
        FMain.EnlaceModal := False;
        FMain.EnlaceInstancias := False;
        FMain.EnlaceCrea := False;
     end;
  end;
end;

procedure TFMPedidosAlquiler.ANewAgenteExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     try
        FMain.EnlaceModal := True;
        FMain.EnlaceInstancias := True;
        FMain.EnlaceCrea := True;
        FMain.EjecutaAccion(FMain.AAgentes);

        if FMain.EnlaceDatos <> Null then
        begin
           DBEFAgenteAlquiler.SetBufferText(FMain.EnlaceDatos);
        end;
        DBEFFormaPagoAlquiler.SetFocus;
     finally
        FMain.EnlaceModal := False;
        FMain.EnlaceInstancias := False;
        FMain.EnlaceCrea := False;
     end;
  end;
end;

procedure TFMPedidosAlquiler.ACreaAnticipoExecute(Sender: TObject);
begin
  inherited;
  DMPedidosAlquiler.RefrescaAnticipo;
end;

end.
