unit UFCGestProcesos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, StdCtrls, DBCtrls, Grids, DBGrids, UHYDBGrid, UControlEdit,
  UFormGest, NsDBGrid, ULFToolBar, rxPlacemnt, ULFFormStorage, ULFLabel,
  ULFComboBox;

type
  TFCGestProcesos = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtCierra: TToolButton;
     HYTDBGMain: THYTDBGrid;
     LBLProceso: TLFLabel;
     TButtSeparador1: TToolButton;
     TButtDeshacer: TToolButton;
     TButtRefresca: TToolButton;
     TButtSeparador2: TToolButton;
     LBLSerie: TLFLabel;
     TButtImprimir: TToolButton;
     FSMain: TLFFibFormStorage;
     CBProcesos: TLFComboBox;
     CBSeries: TLFComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtCierraClick(Sender: TObject);
     procedure TButtDeshacerClick(Sender: TObject);
     procedure TButtRefrescaClick(Sender: TObject);
     procedure TButtImprimirClick(Sender: TObject);
     procedure CBGenericChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FCGestProcesos : TFCGestProcesos;

implementation

uses UDMMain, UDMGestProcesos, UEntorno, UUtiles, UFMImprimeFacturas,
  UFInfoFacturacionAlb, URellenaLista;

{$R *.DFM}

procedure TFCGestProcesos.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMGestProcesos, DMGestProcesos);
  RellenaSeries(CBSeries.Items);
  CBSeries.Items.Delete(0);
  DMGestProcesos.RellenaProcesos(CBProcesos.Items);
  CBSeries.ItemIndex := 0;
  CBProcesos.ItemIndex := 0;
  CBGenericChange(Self);
end;

procedure TFCGestProcesos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(DMGestProcesos);
end;

procedure TFCGestProcesos.TButtCierraClick(Sender: TObject);
begin
  Close;
end;

procedure TFCGestProcesos.TButtDeshacerClick(Sender: TObject);
var
  WndList : Pointer;
  id_s, {proc_auto,} ejercicio, canal, estado, factura, empresa, i : integer;
  tipo, serie, tipo_doc : string;
  // error : boolean;
  docList : TDocInfoList;
begin
  docList := nil;
  if (DMGestProcesos.xVerGesPrcCONTADOR.AsInteger = 0) then
     ShowMessage(_('No se puede deshacer un proceso de sistema'))
  else
  begin
     // DMGestProcesos.DesHacer;
     if Confirma and ConfirmaGrave then
     begin
        if ((not DMGestProcesos.EsUltimaFacturacion(DMGestProcesos.xVerGesPrcTIPO.AsString))) then
           if (not ConfirmaMensaje(_('Eliminando facturación anterior, Desea continuar?'))) then
              Exit;
        WndList := DisableTaskWindows(FInfoFacturacionAlb.Handle);
        try
           FInfoFacturacionAlb := TFInfoFacturacionAlb.Create(Self);
           try
              // error := True;
              Screen.Cursor := crHourGlass;
              Tipo := Copy(DMGestProcesos.xVerGesPrcTIPO.AsString, 2, 2);

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
              if not (DMGestProcesos.TLocal.InTransaction) then
                 DMGestProcesos.TLocal.StartTransaction;

              // Damos de baja el antiguo proceso damos de alta el nuevo e insertamos
              // en la tabla temporal
              docList := DMGestProcesos.InicializaProceso(tipo); // Aqui internamente se hace un commit

              // Comenzamos a recorrer las facturas
              // vamos abriendo las cerradas
              for i := 0 to Length(docList) - 1 do
              begin
                 empresa := docList[i].empresa;
                 id_s := docList[i].id_s;
                 ejercicio := docList[i].ejercicio;
                 canal := docList[i].canal;
                 serie := docList[i].serie;
                 factura := docList[i].rig;
                 estado := docList[i].estado;
                 tipo_doc := docList[i].tipo_doc;

                 if (estado = 5) then
                 begin
                    with FInfoFacturacionAlb do
                    begin
                       LBLGeneral.Caption := _('Abriendo Factura');
                       LBLEjercicio.Caption := IntToStr(Ejercicio);
                       LBLCanal.Caption := IntToStr(Canal);
                       LBLSerie.Caption := Serie;
                       LBLRig.Caption := IntToStr(factura);
                    end;
                    Application.ProcessMessages;
                    DMGestProcesos.AbreFactura(empresa, ejercicio, canal, factura, id_s, serie, tipo_doc);
                 end;
              end;

              // Comenzamos a borrar facturas
              for i := 0 to Length(docList) - 1 do
              begin
                 empresa := docList[i].empresa;
                 id_s := docList[i].id_s;
                 ejercicio := docList[i].ejercicio;
                 canal := docList[i].canal;
                 serie := docList[i].serie;
                 factura := docList[i].rig;
                 // estado := docList[i].estado;
                 tipo_doc := docList[i].tipo_doc;

                 with FInfoFacturacionAlb do
                 begin
                    LBLGeneral.Caption := _('Borrando Factura');
                    LBLEjercicio.Caption := IntToStr(Ejercicio);
                    LBLCanal.Caption := IntToStr(Canal);
                    LBLSerie.Caption := Serie;
                    LBLRig.Caption := IntToStr(factura);
                 end;
                 Application.ProcessMessages;

                 DMGestProcesos.BorraFactura(empresa, ejercicio, canal, factura, id_s, serie, tipo_doc);
              end; // fin for

              // error := False;

              // Borramos AHORA el proceso
              DMGestProcesos.BorraFacturacion(tipo);
           finally
              EnableTaskWindows(WndList);
           end;
        finally
           docList := nil;
           DMGestProcesos.BorraTemporales; // Para evitar problemas
           // Ajustamos los contadores de la empresa
           // dji lrk kri - No ajusta FAC porque quedan en contadores recuperacion
           // DMGestProcesos.AjustaContadores;

           Screen.Cursor := crDefault;
           FInfoFacturacionAlb.Close;
           FInfoFacturacionAlb.Free;

           DMGestProcesos.InicializaSeries;
           TButtRefrescaClick(Sender);
        end;  // fin finally
     end; {Confirmacion Grave}
  end;
end;

procedure TFCGestProcesos.TButtRefrescaClick(Sender: TObject);
begin
  CBGenericChange(Sender);
end;

procedure TFCGestProcesos.TButtImprimirClick(Sender: TObject);
begin
  TFMImprimeFacturas.Create(Self).Muestra(DMGestProcesos.xVerGesPrc);
end;

procedure TFCGestProcesos.CBGenericChange(Sender: TObject);
var
  Proceso, Serie : string;
begin
  if ((CBProcesos.Text <> '') and (CBseries.Text <> '')) then
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Proceso := CBProcesos.Items[CBProcesos.ItemIndex];
     Proceso := Copy(CBProcesos.Text, 1, Pos(' ', CBProcesos.Text) - 1);
     Serie := CBSeries.Items[CBSeries.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);

     DMGestProcesos.RefrescaDatos(Serie, Proceso);
  end;
end;

end.
