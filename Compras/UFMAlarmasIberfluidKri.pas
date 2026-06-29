unit UFMAlarmasIberfluidKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, UNavigator, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ComCtrls, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, ULFPageControl,
  StdCtrls, Mask, rxToolEdit, ULFDateEdit, ULFLabel, DateUtils, rxPlacemnt,
  ULFFormStorage, FIBDataSetRO, ULFEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000;

type
  TFMAlarmasIberfluidKri = class(TG2KForm)
     PCMain: TLFPageControl;
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     TSVerde: TTabSheet;
     TSAmarilla: TTabSheet;
     TSRoja: TTabSheet;
     TSVioleta: TTabSheet;
     DBGVerde: THYTDBGrid;
     DBGAmarilla: THYTDBGrid;
     DBGRoja: THYTDBGrid;
     DBGVioleta: THYTDBGrid;
     NavMain: THYMNavigator;
     LFecha: TLFLabel;
     DEFecha: TLFDateEdit;
     LMostrarDesde: TLFLabel;
     DEMostrarDesdeFecha: TLFDateEdit;
     FSMain: TLFFibFormStorage;
     PFiltro: TLFPanel;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     ESerieTitulo: TLFEdit;
     EProveedorTitulo: TLFEdit;
     ToolButton1: TToolButton;
     BRefrescar: TToolButton;
     PNLDescAlarmaVerde: TLFPanel;
     PNLDescAlarmaAmarilla: TLFPanel;
     PNLDescAlarmaRoja: TLFPanel;
     PNLDescAlarmaVioleta: TLFPanel;
     LDescripcionAlarmaVerde: TLFLabel;
     LDescripcionAlarmaAmarilla: TLFLabel;
     LDescripcionAlarmaRoja: TLFLabel;
     LDescripcionAlarmaVioleta: TLFLabel;
     PNLFechaCalculo: TLFPanel;
     PNLMostrarDesde: TLFPanel;
     procedure PCMainChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure DBGridDblClick(Sender: TObject);
     procedure DEFechaFiltroChange(Sender: TObject);
     procedure DBGridTitleClick(Column: TColumn);
     procedure EFSerieChange(Sender: TObject);
     procedure BRefrescarClick(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure DBGridCellClick(Column: TColumn);
  private
     { Private declarations }
     Filtrar: boolean;
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMAlarmasIberfluidKri : TFMAlarmasIberfluidKri;

implementation

uses UDMAlarmasIberfluidKri, UFMain, UEntorno, UDMMain, UDameDato;

{$R *.dfm}

procedure TFMAlarmasIberfluidKri.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMAlarmasIberfluidKri, DMAlarmasIberfluidKri);
  Filtrar := False;
  DEFecha.Date := Now;
  DEMostrarDesdeFecha.Date := EncodeDate(YearOf(Now), 01, 01);
  EFSerie.Text := REntorno.Serie;
  Filtrar := True;
  BRefrescar.Click;
  PCMain.ActivePage := TSVerde;
  NavMain.DataSource := DBGVerde.DataSource;
  ColActual := DBGVerde.Columns[0];
end;

procedure TFMAlarmasIberfluidKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMAlarmasIberfluidKri);
  Action := caFree;
end;

procedure TFMAlarmasIberfluidKri.PCMainChange(Sender: TObject);
begin
  if (PCMain.ActivePage = TSVerde) then
     NavMain.DataSource := DBGVerde.DataSource;
  if (PCMain.ActivePage = TSAmarilla) then
     NavMain.DataSource := DBGAmarilla.DataSource;
  if (PCMain.ActivePage = TSRoja) then
     NavMain.DataSource := DBGRoja.DataSource;
  if (PCMain.ActivePage = TSVioleta) then
     NavMain.DataSource := DBGVioleta.DataSource;
end;

procedure TFMAlarmasIberfluidKri.DBGridDblClick(Sender: TObject);
begin
  with DMAlarmasIberfluidKRI do
  begin
     if ((UpperCase(ColActual.FieldName) = 'EJERCICIO_PED') or
        (UpperCase(ColActual.FieldName) = 'SERIE_PED') or
        (UpperCase(ColActual.FieldName) = 'RIG_PED')) then
     begin
        if (Sender = DBGVerde) then
           FMain.MuestraDocumento(xAlarmaVerdeEJERCICIO_PED.AsInteger, 'PEC', xAlarmaVerdeSERIE_PED.AsString, xAlarmaVerdeRIG_PED.AsInteger);
        if (Sender = DBGAmarilla) then
           FMain.MuestraDocumento(xAlarmaAmarillaEJERCICIO_PED.AsInteger, 'PEC', xAlarmaAmarillaSERIE_PED.AsString, xAlarmaAmarillaRIG_PED.AsInteger);
        if (Sender = DBGRoja) then
           FMain.MuestraDocumento(xAlarmaRojaEJERCICIO_PED.AsInteger, 'PEC', xAlarmaRojaSERIE_PED.AsString, xAlarmaRojaRIG_PED.AsInteger);
        if (Sender = DBGVioleta) then
           FMain.MuestraDocumento(xAlarmaVioletaEJERCICIO_PED.AsInteger, 'PEC', xAlarmaVioletaSERIE_PED.AsString, xAlarmaVioletaRIG_PED.AsInteger);
     end
     else
     begin
        if (Sender = DBGVerde) then
           FMain.MuestraDocumento(xAlarmaVerdeEJERCICIO.AsInteger, 'PEP', xAlarmaVerdeSERIE.AsString, xAlarmaVerdeRIG.AsInteger);
        if (Sender = DBGAmarilla) then
           FMain.MuestraDocumento(xAlarmaAmarillaEJERCICIO.AsInteger, 'PEP', xAlarmaAmarillaSERIE.AsString, xAlarmaAmarillaRIG.AsInteger);
        if (Sender = DBGRoja) then
           FMain.MuestraDocumento(xAlarmaRojaEJERCICIO.AsInteger, 'PEP', xAlarmaRojaSERIE.AsString, xAlarmaRojaRIG.AsInteger);
        if (Sender = DBGVioleta) then
           FMain.MuestraDocumento(xAlarmaVioletaEJERCICIO.AsInteger, 'PEP', xAlarmaVioletaSERIE.AsString, xAlarmaVioletaRIG.AsInteger);
     end;
  end;
end;

procedure TFMAlarmasIberfluidKri.DEFechaFiltroChange(Sender: TObject);
begin
  if (Filtrar) then
     DMAlarmasIberfluidKri.Filtra(DEFecha.Date, DEMostrarDesdeFecha.Date, EFSerie.Text, StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMAlarmasIberfluidKri.DBGridTitleClick(Column: TColumn);
begin
  try
     with (Column.Field.DataSet as TFIBDataSetRO) do
     begin
        Close;
        SelectSQL.Text := UpperCase(SelectSQL.Text);
        if (Pos(' ORDER BY ' + Column.FieldName + ' ASC', SelectSQL.Text) > 0) then
           SelectSQL.Text := Copy(SelectSQL.Text, 1, Pos('ORDER BY', SelectSQL.Text) - 1) + ' ORDER BY ' + Column.FieldName + ' DESC '
        else
        if (Pos(' ORDER BY ' + Column.FieldName + ' DESC', SelectSQL.Text) > 0) then
           SelectSQL.Text := Copy(SelectSQL.Text, 1, Pos('ORDER BY', SelectSQL.Text) - 1) + ' '
        else
        if (Pos(' ORDER BY ', SelectSQL.Text) > 0) then
           SelectSQL.Text := Copy(SelectSQL.Text, 1, Pos('ORDER BY', SelectSQL.Text) - 1) + ' ORDER BY ' + Column.FieldName + ' ASC '
        else
           SelectSQL.Text := SelectSQL.Text + ' ORDER BY ' + Column.FieldName + ' ASC ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FECHA'].AsDateTime := DEFecha.Date;
        Params.ByName['DESDE_FECHA'].AsDateTime := DEMostrarDesdeFecha.Date;
        if (TFIBDataSetRO(Column.Field.DataSet).Name = 'xAlarmaVerde') then
           Params.ByName['TIPO'].AsString := 'VERDE';
        if (TFIBDataSetRO(Column.Field.DataSet).Name = 'xAlarmaAmarilla') then
           Params.ByName['TIPO'].AsString := 'AMARILLA';
        if (TFIBDataSetRO(Column.Field.DataSet).Name = 'xAlarmaRoja') then
           Params.ByName['TIPO'].AsString := 'ROJA';
        if (TFIBDataSetRO(Column.Field.DataSet).Name = 'xAlarmaVioleta') then
           Params.ByName['TIPO'].AsString := 'VIOLETA';
        Open;
     end;
  except
  end;
end;

procedure TFMAlarmasIberfluidKri.EFSerieChange(Sender: TObject);
begin
  ESerieTitulo.Text := DameTituloSerie(EFSerie.Text);
  if (Filtrar) then
     DMAlarmasIberfluidKri.Filtra(DEFecha.Date, DEMostrarDesdeFecha.Date, EFSerie.Text, StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMAlarmasIberfluidKri.BRefrescarClick(Sender: TObject);
begin
  DMAlarmasIberfluidKri.Filtra(DEFecha.Date, DEMostrarDesdeFecha.Date, EFSerie.Text, StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMAlarmasIberfluidKri.EFProveedorChange(Sender: TObject);
begin
  EProveedorTitulo.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
  if ((Filtrar) and (EProveedorTitulo.Text > ' ')) then
     DMAlarmasIberfluidKri.Filtra(DEFecha.Date, DEMostrarDesdeFecha.Date, EFSerie.Text, StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMAlarmasIberfluidKri.DBGridCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

end.
