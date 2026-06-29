unit UFGrafico;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, StdCtrls, Buttons, ExtCtrls, TeeProcs, Chart,
  DbChart, ComCtrls, ULFPageControl;

type
  TFGrafico = class(TForm)
     PCMain: TLFPageControl;
     VentasAnuales: TTabSheet;
     DBCAnual: TDBChart;
     Series7: TBarSeries;
     Series6: TBarSeries;
     Series5: TBarSeries;
     Series1: TBarSeries;
     Series2: TBarSeries;
     VentasMeses: TTabSheet;
     DBCMensual: TDBChart;
     BitBtnMensual: TBitBtn;
     Series4: TBarSeries;
     Series3: TBarSeries;
     Prevision: TTabSheet;
     DBCPrevision: TDBChart;
     BitBtnPrevision: TBitBtn;
     BarSeries2: TBarSeries;
     BarSeries1: TBarSeries;
     BitBtnConfigurarVentasAnuales: TBitBtn;
     BitBtnAnual: TBitBtn;
     BitBtnConfigurarMensual: TBitBtn;
     BitBtnConfigurarPrevision: TBitBtn;
     procedure DBCPrevisionGetAxisLabel(Sender: TChartAxis; Series: TChartSeries; ValueIndex: integer; var LabelText: string);
     procedure DBCMensualGetAxisLabel(Sender: TChartAxis; Series: TChartSeries; ValueIndex: integer; var LabelText: string);
     procedure InicializaLeyendaGrafica(ejercicio, ejercicio2: string; TipoGrafica: integer);
     procedure FormActivate(Sender: TObject);
     procedure CopiaGraficaPortapapeles(Grafica: TDBChart);
     procedure MuestraFastreport(Formulario: integer);
     procedure BitBtnAnualClick(Sender: TObject);
     procedure BitBtnMensualClick(Sender: TObject);
     procedure BitBtnPrevisionClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure BitBtnConfigurarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     Formulario, tercero, ejercicio, ejercicio2, tipo: integer;
     BAnual, BMensual, BPrevision: TBitmap;
     Porcent: double;
     moneda: string;
  end;

var
  FGrafico : TFGrafico;

implementation

{$R *.dfm}

uses UDMMain, UFMClientes, UFMAcreedores, UDMAcreedores, UFMProveedores, Clipbrd,
  UDMLSTClientes, UDMLSTProveedor, UFormGest, UFMListConfig, UDMLSTAcreedor, UUtiles;

procedure TFGrafico.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  BAnual := TBitmap.Create;
  BMensual := TBitmap.Create;
  BPrevision := TBitmap.Create;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BitBtnPrevision, 1, DMMain.ILMain_Ac, 14);
  GetBitmapFromImageList(BitBtnConfigurarPrevision, 1, DMMain.ILMain_Ac, 2);
  GetBitmapFromImageList(BitBtnAnual, 1, DMMain.ILMain_Ac, 14);
  GetBitmapFromImageList(BitBtnConfigurarVentasAnuales, 1, DMMain.ILMain_Ac, 2);
  GetBitmapFromImageList(BitBtnMensual, 1, DMMain.ILMain_Ac, 14);
  GetBitmapFromImageList(BitBtnConfigurarMensual, 1, DMMain.ILMain_Ac, 2);
end;

procedure TFGrafico.MuestraFastreport(Formulario: integer);
begin
  // Muestra el report segun desde el formulario al que se le llama
  case Formulario of
     1:
     begin
        AbreData(TDMlstClientes, DMlstClientes);
        DMLstClientes.MuestraEstadistica(tipo, ejercicio, ejercicio2, tercero, moneda, porcent);
        CierraData(DMlstClientes);
     end;
     2:
     begin
        AbreData(TDMlstAcreedor, DMlstAcreedor);
        DMlstAcreedor.MuestraEstadistica(tipo, ejercicio, ejercicio2, tercero, moneda, porcent);
        CierraData(DMlstAcreedor);
     end;
     3:
     begin
        AbreData(TDMlstProveedor, DMlstProveedor);
        DMLstProveedor.MuestraEstadistica(tipo, ejercicio, ejercicio2, tercero, moneda, porcent);
        CierraData(DMlstProveedor);
     end;
  end;
end;

procedure TFGrafico.CopiaGraficaPortapapeles(Grafica: TDBChart);
begin
  // Copia la grafica al portapapeles
  Clipboard.Clear;
  Grafica.Color := clWhite;
  Grafica.Title.Font.Color := clBlack;
  Grafica.CopyToClipboardBitmap;
  Grafica.Color := clBtnFace;
  Grafica.Title.Font.Color := clBlue;
end;

procedure TFGrafico.InicializaLeyendaGrafica(ejercicio, ejercicio2: string; TipoGrafica: integer);
begin
  // ESTADISTICAS
  DBCAnual.Series[0].Title := IntToStr(StrToInt(ejercicio2) - 3);
  DBCAnual.Series[1].Title := IntToStr(StrToInt(ejercicio2) - 2);
  DBCAnual.Series[2].Title := IntToStr(StrToInt(ejercicio2) - 1);
  DBCAnual.Series[3].Title := ejercicio2;
  DBCAnual.Series[4].Title := ejercicio;
  DBCMensual.Series[0].Title := ejercicio2;
  DBCMensual.Series[1].Title := ejercicio;
  DBCPrevision.Series[1].Title := ejercicio;
  DBCPrevision.Title.Text.SetText(PChar(string(Format(_('PREVISIÓN MENSUAL %s'), [ejercicio]))));

  // Muestra la pagina de la grafica segun la eleccion del tipo de grafica al hacer click
  case TipoGrafica of
     0:
     begin
        PCMain.ActivePageIndex := 0;
        CopiaGraficaPortapapeles(DBCAnual);
     end;
     1:
     begin
        PCMain.ActivePageIndex := 1;
        CopiaGraficaPortapapeles(DBCMensual);
     end;
     2:
     begin
        PCMain.ActivePageIndex := 2;
        CopiaGraficaPortapapeles(DBCPrevision);
     end;
  end;
end;

procedure TFGrafico.DBCPrevisionGetAxisLabel(Sender: TChartAxis; Series: TChartSeries; ValueIndex: integer; var LabelText: string);
begin
  // Asigno los labelas correspondientes segun los valores en el eje x
  if (Sender = DBCPrevision.BottomAxis) then
  begin
     case ValueIndex of
        0: LabelText := MesStr(1);
        1: LabelText := MesStr(2);
        2: LabelText := MesStr(3);
        3: LabelText := MesStr(4);
        4: LabelText := MesStr(5);
        5: LabelText := MesStr(6);
        6: LabelText := MesStr(7);
        7: LabelText := MesStr(8);
        8: LabelText := MesStr(9);
        9: LabelText := MesStr(10);
        10: LabelText := MesStr(11);
        11: LabelText := MesStr(12);
     end;
  end;
end;

procedure TFGrafico.DBCMensualGetAxisLabel(Sender: TChartAxis; Series: TChartSeries; ValueIndex: integer; var LabelText: string);
begin
  // Asigno los labelas correspondientes segun los valores en el eje x
  if (Sender = DBCMensual.BottomAxis) then
  begin
     case ValueIndex of
        0: LabelText := MesStr(1);
        1: LabelText := MesStr(2);
        2: LabelText := MesStr(3);
        3: LabelText := MesStr(4);
        4: LabelText := MesStr(5);
        5: LabelText := MesStr(6);
        6: LabelText := MesStr(7);
        7: LabelText := MesStr(8);
        8: LabelText := MesStr(9);
        9: LabelText := MesStr(10);
        10: LabelText := MesStr(11);
        11: LabelText := MesStr(12);
     end;
  end;
end;

procedure TFGrafico.FormActivate(Sender: TObject);
begin
  inherited;
  // Compruebo desde que formulario estoy acediendo a mi formulario FGrafico y asigno a las graficas los correspondientes Datasources
  case Formulario of
     1:
     begin
        DBCMensual.Series[0].DataSource := FMClientes.DataModule.DSxFacturasMensualCompara;
        DBCMensual.Series[1].DataSource := FMClientes.DataModule.DSxFacturasMensual;
        DBCPrevision.Series[0].DataSource := FMClientes.DataModule.DSxPrevisionMensual;
        DBCPrevision.Series[1].DataSource := FMClientes.DataModule.DSxFacturasMensual;
        DBCAnual.Series[0].DataSource := FMClientes.DataModule.DSxFacturasAnualC_3;
        DBCAnual.Series[1].DataSource := FMClientes.DataModule.DSxFacturasAnualC_2;
        DBCAnual.Series[2].DataSource := FMClientes.DataModule.DSxFacturasAnualC_1;
        DBCAnual.Series[3].DataSource := FMClientes.DataModule.DSxFacturasAnualCompara;
        DBCAnual.Series[4].DataSource := FMClientes.DataModule.DSxFacturasAnual;

        InicializaLeyendaGrafica(FMClientes.EEjercicio.Text, FMClientes.EEjercicio2.Text, FMClientes.TipoGrafica);
     end;
     2:
     begin
        DBCMensual.Series[0].DataSource := DMAcreedores.DSxFacturasMensualCompara;
        DBCMensual.Series[1].DataSource := DMAcreedores.DSxFacturasMensual;
        DBCPrevision.Series[0].DataSource := DMAcreedores.DSxPrevisionMensual;
        DBCPrevision.Series[1].DataSource := DMAcreedores.DSxFacturasMensual;
        DBCAnual.Series[0].DataSource := DMAcreedores.DSxFacturasAnualC_3;
        DBCAnual.Series[1].DataSource := DMAcreedores.DSxFacturasAnualC_2;
        DBCAnual.Series[2].DataSource := DMAcreedores.DSxFacturasAnualC_1;
        DBCAnual.Series[3].DataSource := DMAcreedores.DSxFacturasAnualCompara;
        DBCAnual.Series[4].DataSource := DMAcreedores.DSxFacturasAnual;

        InicializaLeyendaGrafica(FMAcreedores.EEjercicio.Text, FMAcreedores.EEjercicio2.Text, FMAcreedores.TipoGrafica);
     end;
     3:
     begin
        DBCMensual.Series[0].DataSource := FMProveedores.DataModule.DSxFacturasMensualCompara;
        DBCMensual.Series[1].DataSource := FMProveedores.DataModule.DSxFacturasMensual;
        DBCPrevision.Series[0].DataSource := FMProveedores.DataModule.DSxPrevisionMensual;
        DBCPrevision.Series[1].DataSource := FMProveedores.DataModule.DSxFacturasMensual;
        DBCAnual.Series[0].DataSource := FMProveedores.DataModule.DSxFacturasAnualC_3;
        DBCAnual.Series[1].DataSource := FMProveedores.DataModule.DSxFacturasAnualC_2;
        DBCAnual.Series[2].DataSource := FMProveedores.DataModule.DSxFacturasAnualC_1;
        DBCAnual.Series[3].DataSource := FMProveedores.DataModule.DSxFacturasAnualCompara;
        DBCAnual.Series[4].DataSource := FMProveedores.DataModule.DSxFacturasAnual;

        InicializaLeyendaGrafica(FMProveedores.EEjercicio.Text, FMProveedores.EEjercicio2.Text, FMProveedores.TipoGrafica);
     end;
  end;
end;

procedure TFGrafico.BitBtnAnualClick(Sender: TObject);
begin
  MuestraFastreport(Formulario);
end;

procedure TFGrafico.BitBtnMensualClick(Sender: TObject);
begin
  MuestraFastreport(Formulario);
end;

procedure TFGrafico.BitBtnPrevisionClick(Sender: TObject);
begin
  MuestraFastreport(Formulario);
end;

procedure TFGrafico.BitBtnConfigurarClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  case formulario of
     1:
     begin
        AbreData(TDMlstClientes, DMlstClientes);
        TFMListConfig.Create(Self).Muestra(197, Formato, Cabecera, Copias, Pijama, '', DMLSTCLientes.frClientes);
        CierraData(DMlstClientes);
     end;
     2:
     begin
        AbreData(TDMLstAcreedor, DMLstAcreedor);
        TFMListConfig.Create(Self).Muestra(199, Formato, Cabecera, Copias, Pijama, '', DMLstAcreedor.fracreedor);
        CierraData(DMLstAcreedor);
     end;
     3:
     begin
        AbreData(TDMLstProveedor, DMLstProveedor);
        TFMListConfig.Create(Self).Muestra(198, Formato, Cabecera, Copias, Pijama, '', DMLstproveedor.frProveedor);
        CierraData(DMLstProveedor);
     end;
  end;
end;

procedure TFGrafico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BAnual.Free;
  BMensual.Free;
  BPrevision.Free;
end;

end.
