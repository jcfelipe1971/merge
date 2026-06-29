unit UFPregSerializacion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFormGest, ComCtrls, ToolWin, ExtCtrls, StdCtrls, ActnList, Menus, Grids,
  DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, UTeclas,
  UControlEdit, UNavigator, ULFActionList, NsDBGrid, ULFEdit, ULFToolBar,
  ULFPanel, ULFLabel;

type
  TFPregSerializacion = class(TG2kForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     TButtPrevisualizar: TToolButton;
     TButtImprimir: TToolButton;
     TButtSalir: TToolButton;
     ALSerializacion: TLFActionList;
     APrevisualizar: TAction;
     AImprimir: TAction;
     ASalir: TAction;
     TButtConfiguracion: TToolButton;
     PMConfiguracion: TPopupMenu;
     AConfiguracion: TAction;
     Listadode2columnas2: TMenuItem;
     Listadode3columnas2: TMenuItem;
     Listadode4columnas2: TMenuItem;
     LBLEtiquetasVacias: TLFLabel;
     EDTEtiVacias: TLFEdit;
     LBLNumColumnas: TLFLabel;
     EDTNColumnas: TLFEdit;
     LBLNumCopias: TLFLabel;
     EDTNCopias: TLFEdit;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBGFDetalle: TDBGridFind2000;
     procedure ASalirExecute(Sender: TObject);
     procedure EDTNColumnasChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure APrevisualizarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure Listadode2columnas1Click(Sender: TObject);
     procedure Listadode3columnas1Click(Sender: TObject);
     procedure Listadode4columnas1Click(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPregSerializacion : TFPregSerializacion;

implementation

uses UDMMain, UDMLstSerializacion, UFMListConfig;

{$R *.DFM}

procedure TFPregSerializacion.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPregSerializacion.EDTNColumnasChange(Sender: TObject);
begin
  if (EDTNColumnas.Text > '4') then
     EDTNColumnas.Text := '4';
  if (EDTNColumnas.Text < '2') then
     EDTNColumnas.Text := '2';
end;

procedure TFPregSerializacion.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE 

  AbreData(TDMLstSerializacion, DMLstSerializacion);
  EDTNColumnas.Text := '2';
  EDTNCopias.Text := '1';
  EDTEtiVacias.Text := '0';

  DBGFDetalle.DataSource := DMLstSerializacion.DSQMImpresion;
  NavDetalle.DataSource := DMLstSerializacion.DSQMImpresion;
  CEDetalle.Teclas := DMMain.Teclas;
  ControlEdit := CEDetalle;
end;

procedure TFPregSerializacion.APrevisualizarExecute(Sender: TObject);
begin
  DMLstSerializacion.LanzarListado(StrToInt(EDtEtiVacias.Text),
     StrToInt(EDTNCopias.Text) {+ 1}, StrToInt(EDTNColumnas.Text), 0);
end;

procedure TFPregSerializacion.AImprimirExecute(Sender: TObject);
begin
  DMLstSerializacion.LanzarListado(StrToInt(EDtEtiVacias.Text),
     StrToInt(EDTNCopias.Text) {+ 1}, StrToInt(EDTNColumnas.Text), 1);
end;

procedure TFPregSerializacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstSerializacion);
end;

procedure TFPregSerializacion.Listadode2columnas1Click(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
  serie : string;
begin
  TFMListConfig.Create(Self).Muestra(76, formato, cabecera, copias,
     pijama, serie, DMLstSerializacion.frNumSerie);
end;

procedure TFPregSerializacion.Listadode3columnas1Click(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
  serie : string;
begin
  TFMListConfig.Create(Self).Muestra(77, formato, cabecera, copias,
     pijama, serie, DMLstSerializacion.frNumSerie);
end;

procedure TFPregSerializacion.Listadode4columnas1Click(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
  serie : string;
begin
  TFMListConfig.Create(Self).Muestra(78, formato, cabecera, copias,
     pijama, serie, DMLstSerializacion.frNumSerie);
end;

end.
