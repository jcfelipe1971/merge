unit UFMGenFacturaElec;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UHYDBGrid, StdCtrls, ULFEdit, Buttons, ULFLabel,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, Mask,
  rxToolEdit, ULFDateEdit, FIBEditFind, ULFFibEditFind, TFlatCheckBoxUnit,
  ULFCheckBox, ULFComboBox;

type
  TFMGenFacturaElec = class(TFPEditSimple)
     PNLFiltros: TLFPanel;
     LDesde: TLFLabel;
     LHasta: TLFLabel;
     SBLimpiar: TSpeedButton;
     EDesdeDocumento: TLFEdit;
     EHastaDocumento: TLFEdit;
     DBGFacturas: THYTDBGrid;
     PNLTitSerie: TLFPanel;
     LSerie: TLFLabel;
     PNLCliente: TLFPanel;
     ETitCliente: TLFEdit;
     LCliente: TLFLabel;
     LFCliente: TLFEditFind2000;
     CBSeries: TLFComboBox;
     PNLCarpeta: TLFPanel;
     LCarpeta: TLFLabel;
     ECarpeta: TLFEdit;
     SBBuscarCarpeta: TSpeedButton;
     TBSep1: TToolButton;
     TBExportar: TToolButton;
     TBMarcarTodas: TToolButton;
     TBDesmarcarTodas: TToolButton;
     TBSep2: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFClienteChange(Sender: TObject);
     procedure SBLimpiarClick(Sender: TObject);
     procedure SBBuscarCarpetaClick(Sender: TObject);
     procedure TBExportarClick(Sender: TObject);
     procedure FiltrarClick(Sender: TObject);
     procedure TBMarcarTodasClick(Sender: TObject);
     procedure TBDesmarcarTodasClick(Sender: TObject);
  private
     { Private declarations }
     Serie: string;
  public
     { Public declarations }
  end;

var
  FMGenFacturaElec : TFMGenFacturaElec;

implementation

uses UDMMain, UEntorno, UFMain, UUtiles, UDMGenFacturaElec, UFormGest, UParam, DB, UFSendCorreo, UDameDato, URellenaLista;

{$R *.dfm}

procedure TFMGenFacturaElec.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGenFacturaElec, DMGenFacturaElec);
  NavMain.DataSource := DMGenFacturaElec.DSQMFacturas;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  ECarpeta.Text := IncludeTrailingPathDelimiter(LeeDatoIni('FacturaE', 'Carpeta', GetSpecialFolderPath(CSIDL_PERSONAL, False)));

  // Imagenes de los botones
  GetBitmapFromImageList(SBLimpiar, 1, DMMain.ILMain_Ac, 26);
  GetBitmapFromImageList(SBLimpiar, 2, DMMain.ILMain_In, 26);

  // Datos a mostrar
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
  Serie := '';

  FiltrarClick(Sender);
end;

procedure TFMGenFacturaElec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGenFacturaElec);
end;

procedure TFMGenFacturaElec.LFClienteChange(Sender: TObject);
begin
  inherited;
  ETitCliente.Text := DameTituloCliente(StrToIntDef(LFCliente.Text, 0));
  FiltrarClick(Sender);
end;

procedure TFMGenFacturaElec.SBLimpiarClick(Sender: TObject);
begin
  inherited;
  EDesdeDocumento.Text := '';
  EHastaDocumento.Text := '';
  LFCliente.Text := '';
  CBSeries.ItemIndex := 0;
  FiltrarClick(Sender);
end;

procedure TFMGenFacturaElec.SBBuscarCarpetaClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;

  Directorio := ExcludeTrailingPathDelimiter(ECarpeta.Text);
  if MySelectDirectory(Directorio, 'FMGenFacturaElec') then
  begin
     Directorio := IncludeTrailingPathDelimiter(Directorio);

     ECarpeta.Text := Directorio;
     EscribeDatoIni('FacturaE', 'Carpeta', Directorio);
  end;
end;

procedure TFMGenFacturaElec.TBExportarClick(Sender: TObject);
var
  i : integer;
  BM : TBookmark;
  Certificado : string;
  FSendCorreo : TFSendCorreo;
  Error : boolean;
begin
  inherited;
  if DBGFacturas.SelectedRows.Count > 0 then
  begin
     // Firma factura electronica española
     Certificado := '';
     if (LeeParametro('FACELEC002', Serie) = 'S') then
        Certificado := DMMain.DameCertificado(Serie);

     with DMGenFacturaElec.QMFacturas do
     begin
        DisableControls;
        BM := GetBookmark;
        FSendCorreo := TFSendCorreo.Create(Self);
        try
           FSendCorreo.Titulo(_('Generando Facturas ...'));
           FSendCorreo.Show;
           Error := False;
           i := 0;
           while (not Error) and (i < DBGFacturas.SelectedRows.Count) do
           begin
              try
                 Bookmark := DBGFacturas.SelectedRows.Items[i];
                 FSendCorreo.Texto(format(_('Genrando la Factura: %s'), [DMGenFacturaElec.QMFacturasSERIE.AsString + '/' + DMGenFacturaElec.QMFacturasRIG.AsString]));
                 DMGenFacturaElec.GeneraFacturaElectronicaES(Certificado);
              except
                 on E: Exception do
                 begin
                    FSendCorreo.Texto(format(_('Error la generación de Factura %s'), [DMGenFacturaElec.QMFacturasSERIE.AsString + '/' + DMGenFacturaElec.QMFacturasRIG.AsString]) + #13#10 + E.Message);
                    Error := True;
                 end
              end;

              Inc(i);
           end;
           GotoBookmark(BM);

           if (not Error) then
              FSendCorreo.Texto(_('Exportacion finalizada'));

           // Muestro boton [OK] y reabro en modo modal.
           FSendCorreo.BitBtnOk.Visible := True;
           Application.ProcessMessages;
           FSendCorreo.Visible := False;
           FSendCorreo.SePuede := True;
           FSendCorreo.ShowModal;
        finally
           EnableControls;
           FreeBookmark(BM);
           FreeAndNil(FSendCorreo);
        end;
     end;
  end;
end;

procedure TFMGenFacturaElec.FiltrarClick(Sender: TObject);
begin
  inherited;

  if (CBSeries.Text <> '') then
  begin
     if (CBSeries.ItemIndex = 0) then
        Serie := ''
     else
     begin
        // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
        Serie := CBSeries.Items[CBSeries.ItemIndex];
        Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     end;
  end;

  DMGenFacturaElec.Filtrar(StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), StrToIntDef(LFCliente.Text, 0), Serie);
end;

procedure TFMGenFacturaElec.TBMarcarTodasClick(Sender: TObject);
var
  IdS : integer;
begin
  DBGFacturas.SelectedRows.Clear;
  IdS := DMGenFacturaElec.QMFacturasID_S.AsInteger;

  with DMGenFacturaElec.QMFacturas do
  begin
     try
        DisableControls;
        First;
        while not EOF do
        begin
           DBGFacturas.SelectedRows.CurrentRowSelected := True;
           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  Posicionar(DMGenFacturaElec.QMFacturas, 'ID_S', IdS);
end;

procedure TFMGenFacturaElec.TBDesmarcarTodasClick(Sender: TObject);
begin
  DBGFacturas.SelectedRows.Clear;
end;

end.
