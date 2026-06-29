unit UFMECFCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  StdCtrls, ULFEditFind2000, ULFLabel, ULFComboBox, ULFEdit;

type
  TFMECFCompras = class(TFPEditSimple)
     TBECFCompras: TLFToolBar;
     DBGECFCompras: TDBGridFind2000;
     CBSeries: TLFComboBox;
     LFiltroSerie: TLFLabel;
     LFiltroTipoECF: TLFLabel;
     EFTipoECF: TLFEditFind2000;
     LFiltroProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
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
     procedure DBGECFComprasDblClick(Sender: TObject);
     procedure DBGECFComprasCellClick(Column: TColumn);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMECFCompras : TFMECFCompras;

implementation

uses
  UDMMain, UDMECFCompras, URellenaLista;

{$R *.dfm}

procedure TFMECFCompras.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMECFCompras, DMECFCompras);
  NavMain.DataSource := DMECFCompras.DSQMDocumentos;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  // Datos a mostrar
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
  TBFiltrar.Click;

  ColActual := DBGECFCompras.Columns[0];
end;

procedure TFMECFCompras.TBFiltrarClick(Sender: TObject);
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

     DMECFCompras.CambiarSeleccion(StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), StrToIntDef(EFProveedor.Text, 0), StrToIntDef(EFTipoECF.Text, 0), Serie);
  end;
end;

procedure TFMECFCompras.TBLimpiarFiltrosClick(Sender: TObject);
begin
  inherited;
  CBSeries.ItemIndex := 0;
  EDesdeDocumento.Text := '';
  EHastaDocumento.Text := '';
  EFTipoECF.Text := '0';
  EFProveedor.Text := '';

  TBFiltrar.Click;
end;

procedure TFMECFCompras.DBGECFComprasDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'RESPUESTA_ENVIO') and (DMECFCompras.QMDocumentos.FieldByName('RESPUESTA_ENVIO').AsInteger = 1)) then
     DMECFCompras.AbreJsonRespuesta(False)
  else
  if ((UpperCase(ColActual.FieldName) = 'RESPUESTA_CONSULTA') and (DMECFCompras.QMDocumentos.FieldByName('RESPUESTA_CONSULTA').AsInteger = 1)) then
     DMECFCompras.AbreJsonRespuesta(True);
end;

procedure TFMECFCompras.DBGECFComprasCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

end.
