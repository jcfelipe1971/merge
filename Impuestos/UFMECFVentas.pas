unit UFMECFVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  StdCtrls, ULFEditFind2000, ULFLabel, ULFComboBox, ULFEdit;

type
  TFMECFVentas = class(TFPEditSimple)
     TBECFVentas: TLFToolBar;
     DBGECFVentas: TDBGridFind2000;
     CBSeries: TLFComboBox;
     LFiltroSerie: TLFLabel;
     LFiltroTipoECF: TLFLabel;
     EFTipoECF: TLFEditFind2000;
     LFiltroCliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     TBFiltrar: TToolButton;
     TBLimpiarFiltros: TToolButton;
     TBSep1: TToolButton;
     LDesdeDocumento: TLFLabel;
     EDesdeDocumento: TLFEdit;
     LHastaDocumento: TLFLabel;
     EHastaDocumento: TLFEdit;
     PNLFitroSerie: TLFPanel;
     PNLFiltroTipoECF: TLFPanel;
     PNLFiltroCliente: TLFPanel;
     PNLFiltroDocumento: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure TBFiltrarClick(Sender: TObject);
     procedure TBLimpiarFiltrosClick(Sender: TObject);
     procedure DBGECFVentasDblClick(Sender: TObject);
     procedure DBGECFVentasCellClick(Column: TColumn);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMECFVentas : TFMECFVentas;

implementation

uses
  UDMMain, UDMECFVentas, URellenaLista;

{$R *.dfm}

procedure TFMECFVentas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMECFVentas, DMECFVentas);
  NavMain.DataSource := DMECFVentas.DSQMDocumentos;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  // Datos a mostrar
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
  TBFiltrar.Click;
  ColActual := DBGECFVentas.Columns[0];
end;

procedure TFMECFVentas.TBFiltrarClick(Sender: TObject);
var
  Serie : string;
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

     DMECFVentas.CambiarSeleccion(StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), StrToIntDef(EFCliente.Text, 0), StrToIntDef(EFTipoECF.Text, 0), Serie);
  end;
end;

procedure TFMECFVentas.TBLimpiarFiltrosClick(Sender: TObject);
begin
  inherited;
  CBSeries.ItemIndex := 0;
  EDesdeDocumento.Text := '';
  EHastaDocumento.Text := '';
  EFTipoECF.Text := '0';
  EFCliente.Text := '';

  TBFiltrar.Click;
end;

procedure TFMECFVentas.DBGECFVentasDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'RESPUESTA_ENVIO') and (DMECFVentas.QMDocumentos.FieldByName('RESPUESTA_ENVIO').AsInteger = 1)) then
     DMECFVentas.AbreJsonRespuesta(False)
  else
  if ((UpperCase(ColActual.FieldName) = 'RESPUESTA_CONSULTA') and (DMECFVentas.QMDocumentos.FieldByName('RESPUESTA_CONSULTA').AsInteger = 1)) then
     DMECFVentas.AbreJsonRespuesta(True);
end;

procedure TFMECFVentas.DBGECFVentasCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

end.
