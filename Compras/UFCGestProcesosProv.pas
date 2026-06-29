unit UFCGestProcesosProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, DBCtrls, Grids, DBGrids, UHYDBGrid, UControlEdit,
  UFormGest, NsDBGrid, ULFToolBar, rxPlacemnt, ULFFormStorage, ULFLabel;

type
  TFCGestProcesosProv = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtCierra: TToolButton;
     HYTDBGMain: THYTDBGrid;
     DBLCBSerie: TDBLookupComboBox;
     LBLProceso: TLFLabel;
     TButtSeparador1: TToolButton;
     TButtDeshacer: TToolButton;
     TButtRefresca: TToolButton;
     TButtSeparador2: TToolButton;
     DBLCBProc: TDBLookupComboBox;
     LBLSerie: TLFLabel;
     TButtImprimir: TToolButton;
     FSMain: TLFFibFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtCierraClick(Sender: TObject);
     procedure TButtDeshacerClick(Sender: TObject);
     procedure TButtRefrescaClick(Sender: TObject);
     procedure TButtImprimirClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FCGestProcesosProv : TFCGestProcesosProv;

implementation

uses UDMMain, UDMGestProcesosProv, UEntorno, UUtiles, UFMImprimeFacturas,
  UFInfoFacturacionAlb;

{$R *.DFM}

procedure TFCGestProcesosProv.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMGestProcesosProv, DMGestProcesosProv);
  DBLCBSerie.KeyValue := REntorno.Serie;
  DBLCBProc.KeyValue := DMGestProcesosProv.xProcesos.FieldByName('Tipo').AsString;
end;

procedure TFCGestProcesosProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(DMGestProcesosProv);
end;

procedure TFCGestProcesosProv.TButtCierraClick(Sender: TObject);
begin
  Close;
end;

procedure TFCGestProcesosProv.TButtDeshacerClick(Sender: TObject);
var
  WndList : Pointer;
  id_e, ProcAuto, Ejercicio, Canal, Estado, Factura, Empresa : integer;
  Tipo, Serie, TipoDoc : string;
  // Error : boolean;
begin
  // DMGestProcesosProv.DesHacer;
  if Confirma and ConfirmaGrave then
  begin
     if ((not DMGestProcesosProv.EsUltimaFacturacion(DMGestProcesosProv.xVerGesPrcTIPO.AsString))) then
        if (not ConfirmaMensaje(_('Eliminando facturacíón anterior, Desea continuar?'))) then
           Exit;
     // Error := True;

     Tipo := Copy(DMGestProcesosProv.xVerGesPrcTIPO.AsString, 2, 2);
     try
        Screen.Cursor := crHourGlass;
        FInfoFacturacionAlb := TFInfoFacturacionAlb.Create(Self);
        WndList := DisableTaskWindows(FInfoFacturacionAlb.Handle);
        try
           with FInfoFacturacionAlb do
           begin
              LBLGeneral.Caption := _('Procesando Factura');
              GBProcesaCab.Caption := _('Procesando Factura');
              LBLEjercicio.Caption := '';
              LBLCanal.Caption := '';
              LBLSerie.Caption := '';
              LBLRig.Caption := '';
              Show;
           end;

           Application.ProcessMessages;

           if not (DMGestProcesosProv.TLocal.InTransaction) then
              DMGestProcesosProv.TLocal.StartTransaction;

           // Damos de baja el antiguo proceso damos de alta el nuevo e insertamos en la tabla temporal
           ProcAuto := DMGestProcesosProv.InicializaProceso(Tipo);

           // Comezamos a recorrer las facturas
           // vamos abriendo las cerradas
           while not (DMGestProcesosProv.xRecorre.EOF) do
           begin
              id_e := DMGestProcesosProv.xRecorreID_S.AsInteger;
              // Empresa := DMGestProcesosProv.xRecorreEMPRESA.AsInteger;
              Ejercicio := DMGestProcesosProv.xRecorreEJERCICIO.AsInteger;
              Canal := DMGestProcesosProv.xRecorreCANAL.AsInteger;
              Serie := DMGestProcesosProv.xRecorreSERIE.AsString;
              TipoDoc := DMGestProcesosProv.xRecorreTIPO.AsString;
              Factura := DMGestProcesosProv.xRecorreRIG.AsInteger;
              Estado := DMGestProcesosProv.xRecorreESTADO.AsInteger;

              if (Estado = 5) then
              begin
                 with FInfoFacturacionAlb do
                 begin
                    LBLGeneral.Caption := _('Abriendo Factura') + ' (' + IntToStr(ProcAuto) + ')';
                    LBLEjercicio.Caption := IntToStr(Ejercicio);
                    LBLCanal.Caption := IntToStr(Canal);
                    LBLSerie.Caption := Serie;
                    LBLRig.Caption := IntToStr(Factura);
                 end;
                 Application.ProcessMessages;
                 DMGestProcesosProv.AbreFactura(TipoDoc, id_e);
              end;
              DMGestProcesosProv.xRecorre.Next;
           end;

           // Comenzamos a borrar facturas
           DMGestProcesosProv.xRecorre.First;
           while not (DMGestProcesosProv.xRecorre.EOF) do
           begin
              id_e := DMGestProcesosProv.xRecorreID_S.AsInteger;
              Factura := DMGestProcesosProv.xRecorreRIG.AsInteger;
              Ejercicio := DMGestProcesosProv.xRecorreEJERCICIO.AsInteger;
              // Estado := DMGestProcesosProv.xRecorreESTADO.AsInteger;
              Serie := DMGestProcesosProv.xRecorreSERIE.AsString;
              Canal := DMGestProcesosProv.xRecorreCANAL.AsInteger;
              Empresa := DMGestProcesosProv.xRecorreEMPRESA.AsInteger;
              TipoDoc := DMGestProcesosProv.xRecorreTIPO.AsString;

              with FInfoFacturacionAlb do
              begin
                 LBLGeneral.Caption := _('Borrando Factura');
                 LBLEjercicio.Caption := IntToStr(Ejercicio);
                 LBLCanal.Caption := IntToStr(Canal);
                 LBLSerie.Caption := Serie;
                 LBLRig.Caption := IntToStr(Factura);
              end;
              Application.ProcessMessages;

              DMGestProcesosProv.BorraFactura(Empresa, Ejercicio, Canal, Factura, id_e, Serie, TipoDoc);
              DMGestProcesosProv.xRecorre.Next;
           end;
           DMGestProcesosProv.xRecorre.Close;
           // Error := False;

           // Borramos AHORA el proceso
           DMGestProcesosProv.BorraFacturacion(Tipo);

        finally
           EnableTaskWindows(WndList);
        end;
     finally
        DMGestProcesosProv.BorraTemporales; // Para evitar problemas
        // Ajustamos los contadores de la empresa
        DMGestProcesosProv.AjustaContadores;

        if not (DMGestProcesosProv.TLocal.InTransaction) then
           DMGestProcesosProv.TLocal.StartTransaction;
        DMGestProcesosProv.TLocal.CommitRetaining;
        DMGestProcesosProv.xVerGesPrc.Close;
        DMGestProcesosProv.xVerGesPrc.Open;
        Screen.Cursor := crDefault;
        FInfoFacturacionAlb.Close;
        FInfoFacturacionAlb.Free;
     end;
  end;
end;

procedure TFCGestProcesosProv.TButtRefrescaClick(Sender: TObject);
begin
  DMGestProcesosProv.xSeries.Refresh;
end;

procedure TFCGestProcesosProv.TButtImprimirClick(Sender: TObject);
begin
  TFMImprimeFacturas.Create(Self).Muestra(DMGestProcesosProv.xVerGesPrc);
end;

end.
