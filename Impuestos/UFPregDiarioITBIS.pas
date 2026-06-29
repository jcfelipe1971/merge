unit UFPregDiarioITBIS;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, ActnList, ComCtrls, ToolWin, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, rxToolEdit,
  ULFPanel, ULFDBEdit, ULFComboBox, ULFEdit, ULFActionList, ULFPageControl,
  ULFToolBar, ULFEditFind2000, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, TFlatCheckBoxUnit, ULFCheckBox, UFPEditListadoSimple;

type
  TFPregDiarioITBIS = class(TFPEditListadoSimple)
     GBListado: TGroupBox;
     ETituloListado: TLFEdit;
     DTPFechaListado: TLFDateEdit;
     LFecha: TLFLabel;
     LTitulo: TLFLabel;
     RGFacturas: TRadioGroup;
     GBTipoOperacion: TGroupBox;
     CBTipoOperacion: TLFComboBox;
     GBSeries: TGroupBox;
     EFSerie: TLFEditFind2000;
     TButtConfigurar: TToolButton;
     DBESerie: TLFDbedit;
     RGFiltro: TRadioGroup;
     RGOrden: TRadioGroup;
     GBFechas: TGroupBox;
     LFechaFacturaDesde: TLFLabel;
     LFechaFacturaHasta: TLFLabel;
     DTPFecha_Desde: TLFDateEdit;
     DTPFecha_Hasta: TLFDateEdit;
     GBNum_Fras: TGroupBox;
     LFacturaDesde: TLFLabel;
     LFacturaHasta: TLFLabel;
     EFFras_Desde: TLFEditFind2000;
     EFFras_Hasta: TLFEditFind2000;
     CBTodasSeries: TLFCheckBox;
     TButtExportar: TToolButton;
     TButtExportarExcel: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EFFras_DesdeBusqueda(Sender: TObject);
     procedure EFFras_HastaBusqueda(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ASalirExecute(Sender: TObject);
     procedure Imprimir(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure CBTodasSeriesClick(Sender: TObject);
     procedure TButtExportarClick(Sender: TObject);
     procedure TButtExportarExcelClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPregDiarioITBIS : TFPregDiarioITBIS;

implementation

uses UDMMain, UDMRDiarioITBIS, UEntorno, UFormGest, UFMListConfig;

{$R *.DFM}

procedure TFPregDiarioITBIS.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRDiarioITBIS, DMRDiarioITBIS);

  Grupo := 9011;
  Listado := DMRDiarioITBIS.frDiarioITBIS;

  // Inicializamos algunos valores
  CBTipoOperacion.ItemIndex := 3; // Todas
  RGFacturas.ItemIndex := 0; // Emitidas

  ARecargarExecute(Sender);
end;

procedure TFPregDiarioITBIS.EFSerieChange(Sender: TObject);
begin
  // Modificamos el título de la serie
  DMRDiarioITBIS.CambiaSerie(EFSerie.Text);

  CBTodasSeries.Checked := (EFSerie.Text <= '');
end;

procedure TFPregDiarioITBIS.EFFras_DesdeBusqueda(Sender: TObject);
begin
  // Emitidas || ITBIS (R)epercutido
  if RGFacturas.ItemIndex = 0 then
     EFFras_Desde.CondicionBusqueda := 'SIGNO = ''R'' AND DOC_SERIE=''' + EFSerie.Text + ''''
  else // Recibidas || ITBIS (S)oportado
     EFFras_Desde.CondicionBusqueda := 'SIGNO = ''S'' AND DOC_SERIE=''' + EFSerie.Text + '''';
end;

procedure TFPregDiarioITBIS.EFFras_HastaBusqueda(Sender: TObject);
begin
  // Emitidas || ITBIS (R)epercutido
  if RGFacturas.ItemIndex = 0 then
     EFFras_Hasta.CondicionBusqueda := 'SIGNO = ''R'' AND DOC_SERIE=''' + EFSerie.Text + ''''
  else // Recibidas || ITBIS (S)oportado
     EFFras_Hasta.CondicionBusqueda := 'SIGNO = ''S'' AND DOC_SERIE=''' + EFSerie.Text + '''';
end;

procedure TFPregDiarioITBIS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRDiarioITBIS);
  Action := caFree;
end;

procedure TFPregDiarioITBIS.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregDiarioITBIS.Imprimir(Sender: TObject);
var
  Modo : smallint;
  AuxSigno : string;
  AuxTipo : integer;
  Titulo : string;
  AuxTitulo : string;
begin
  if TBMain.CanFocus then
     TBMain.SetFocus;
  AuxTipo := 0;
  // Obtenemos el signo y el título del listado
  if RGFacturas.ItemIndex = 0 then // 606
  begin
     AuxSigno := 'R';
     AuxTitulo := '607';
  end
  else // Recibidas || ITBIS (S)oportado
  begin
     AuxSigno := 'S';
     AuxTitulo := '606';
  end;

  // determinación del Tipo de ITBIS
  case CBTipoOperacion.ItemIndex of
     0: AuxTipo := 0;  // Nacional
     1: AuxTipo := 1;  // Intracomunitario
     2: AuxTipo := 2;  // Extranjero
     3: AuxTipo := -1; // Todos los tipos
  end;

  with DMRDiarioITBIS do
  begin
     sSigno := AuxSigno;
     sTipo := AuxTipo;
     sTitulo := AuxTitulo;

     if RGFiltro.ItemIndex = 0 then
        modo := 0
     else
        modo := 1;

     CalculaInforme(EFSerie.Text, EFFras_Desde.Text, EFFras_Hasta.Text,
        DTPFecha_Desde.Date, DTPFecha_Hasta.Date, modo, RGOrden.ItemIndex);
  end;

  // Imprimir o previsualizar
  Modo := TAction(Sender).Tag;
  Titulo := ETituloListado.Text + ' ' + AuxTitulo;

  DMRDiarioITBIS.MostrarInforme(Modo, Titulo, DTPFechaListado.Date,
     DTPFecha_Desde.Date, DTPFecha_Hasta.Date);
end;

procedure TFPregDiarioITBIS.ARecargarExecute(Sender: TObject);
begin
  DMRDiarioITBIS.Rangos(RGFacturas.ItemIndex);

  // Obtenemos los valores por defecto
  DTPFechaListado.Date := DMRDiarioITBIS.Fecha_Lista;
  DTPFecha_Desde.Date := DMRDiarioITBIS.Fecha_Desde;
  DTPFecha_Hasta.Date := DMRDiarioITBIS.Fecha_Hasta;
  EFSerie.Text := DMRDiarioITBIS.Serie;
  EFFras_Desde.Text := IntToStr(DMRDiarioITBIS.Fra_Desde);
  EFFras_Hasta.Text := IntToStr(DMRDiarioITBIS.Fra_Hasta);
  RGOrden.ItemIndex := 1;
end;

procedure TFPregDiarioITBIS.CBTodasSeriesClick(Sender: TObject);
begin
  if (CBTodasSeries.Checked) then
     EFSerie.Text := '';
end;

procedure TFPregDiarioITBIS.TButtExportarClick(Sender: TObject);
var
  AuxSigno : string;
  AuxTipo : integer;
  AuxTitulo : string;
begin
  // Obtenemos el signo y el título del listado
  if RGFacturas.ItemIndex = 0 then // 606
  begin
     AuxSigno := 'R';
     AuxTitulo := '607';
  end
  else // Recibidas || ITBIS (S)oportado
  begin
     AuxSigno := 'S';
     AuxTitulo := '606';
  end;

  // determinación del Tipo de ITBIS
  AuxTipo := 0;
  case CBTipoOperacion.ItemIndex of
     0: AuxTipo := 0;  // Nacional
     1: AuxTipo := 1;  // Intracomunitario
     2: AuxTipo := 2;  // Extranjero
     3: AuxTipo := -1; // Todos los tipos
  end;

  with DMRDiarioITBIS do
  begin
     sSigno := AuxSigno;
     sTipo := AuxTipo;
     sTitulo := AuxTitulo;

     if RGFiltro.ItemIndex = 0 then
        modo := 0
     else
        modo := 1;

     DMRDiarioITBIS.Exportar(EFSerie.Text, EFFras_Desde.Text, EFFras_Hasta.Text,
        DTPFecha_Desde.Date, DTPFecha_Hasta.Date, modo, RGOrden.ItemIndex);
  end;
end;

procedure TFPregDiarioITBIS.TButtExportarExcelClick(Sender: TObject);
var
  Modo : smallint;
  AuxSigno : string;
  AuxTipo : integer;
  Titulo : string;
  AuxTitulo : string;
begin
  inherited;

  if TBMain.CanFocus then
     TBMain.SetFocus;
  AuxTipo := 0;
  // Obtenemos el signo y el título del listado
  if RGFacturas.ItemIndex = 0 then // 606
  begin
     AuxSigno := 'R';
     AuxTitulo := '607';
  end
  else // Recibidas || ITBIS (S)oportado
  begin
     AuxSigno := 'S';
     AuxTitulo := '606';
  end;

  // determinación del Tipo de ITBIS
  case CBTipoOperacion.ItemIndex of
     0: AuxTipo := 0;  // Nacional
     1: AuxTipo := 1;  // Intracomunitario
     2: AuxTipo := 2;  // Extranjero
     3: AuxTipo := -1; // Todos los tipos
  end;

  with DMRDiarioITBIS do
  begin
     sSigno := AuxSigno;
     sTipo := AuxTipo;
     sTitulo := AuxTitulo;

     if RGFiltro.ItemIndex = 0 then
        modo := 0
     else
        modo := 1;

     CalculaInforme(EFSerie.Text, EFFras_Desde.Text, EFFras_Hasta.Text,
        DTPFecha_Desde.Date, DTPFecha_Hasta.Date, modo, RGOrden.ItemIndex);
  end;

  // Imprimir o previsualizar
  Modo := TAction(Sender).Tag;
  Titulo := ETituloListado.Text + ' ' + AuxTitulo;

  DMRDiarioITBIS.ExportarExcel(Modo, Titulo, DTPFechaListado.Date,
     DTPFecha_Desde.Date, DTPFecha_Hasta.Date, AuxTitulo);
end;

end.
