unit UFMGarantiasKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, rxPlacemnt, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid,
  UHYDBGrid, ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, UFormGest,
  Mask, DBCtrls, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  UG2kTBLoc, ULFPageControl, ULFPanel, ULFEditFind2000, ULFEdit, ULFLabel, HYFIBQuery,
  UFPEditDetalle;

type
  TFMGarantiasKri = class(TFPEditDetalle)
     LReferencia: TLFLabel;
     TBNuevaReferencia: TToolButton;
     PCabecera: TLFPanel;
     LArticulo: TLFLabel;
     ETituloArticulo: TLFEdit;
     LCliente: TLFLabel;
     ECliente: TLFEdit;
     ETituloCliente: TLFEdit;
     LFecVenta: TLFLabel;
     LFecEmbalaje: TLFLabel;
     LOrdenTrabajo: TLFLabel;
     EFecVenta: TLFEdit;
     EFecEmbalaje: TLFEdit;
     EOrdenTrabajo: TLFEdit;
     EFReferencia: TLFEditFind2000;
     EFArticulo: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure EClienteChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBNuevaReferenciaClick(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure EFArticuloExit(Sender: TObject);
     procedure EFReferenciaExiste(Sender: TObject);
  private
     { Private declarations }
     ID_S_CAB: integer;
     NuevoArticulo: boolean;
  public
     { Public declarations }
     procedure Muestra(id_s_documento: integer);
  end;

var
  FMGarantiasKri : TFMGarantiasKri;

implementation

uses UDMMain, UDMGarantiasKri, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMGarantiasKri.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMGarantiasKri, DMGarantiasKri);
  NavDetalle.DataSource := DMGarantiasKri.DSxGarantias;
  DBGFDetalle.DataSource := DMGarantiasKri.DSxGarantias;

  NuevoArticulo := False;
  EFReferencia.BuscarNums := True;
  EFReferencia.BuscarChars := True;
end;

procedure TFMGarantiasKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGarantiasKri);
end;

procedure TFMGarantiasKri.Muestra(id_s_documento: integer);
begin
  ID_S_CAB := id_s_documento;
  DMGarantiasKri.Filtra(id_s_documento);
end;

procedure TFMGarantiasKri.EClienteChange(Sender: TObject);
begin
  inherited;
  ETituloCliente.Text := DameTituloCliente(StrToIntDef(ECliente.Text, 0));
end;

procedure TFMGarantiasKri.TBNuevaReferenciaClick(Sender: TObject);
begin
  inherited;
  PCabecera.Enabled := True;
  EFArticulo.Text := '';
  EFArticulo.SetFocus;
  NuevoArticulo := True;
end;

procedure TFMGarantiasKri.EFArticuloChange(Sender: TObject);
var
  Cliente : string;
begin
  inherited;
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CLIENTE,FECHA_EMBALAJE,FECHA_VENTA,ORDEN_TRABAJO FROM ART_ARTICULOS_GARANTIAS WHERE ID=' + IntToStr(DMGarantiasKri.xGarantiasID.AsInteger);
        ExecQuery;
        if (FieldByName['CLIENTE'].AsString > '0') then
        begin
           Cliente := FieldByName['CLIENTE'].AsString;
           EFecEmbalaje.Text := FieldByName['FECHA_EMBALAJE'].AsString;
           EFecVenta.Text := FieldByName['FECHA_VENTA'].AsString;
           EOrdenTrabajo.Text := FieldByName['ORDEN_TRABAJO'].AsString;
        end
        else
        begin
           Cliente := '';
           EFecEmbalaje.Text := '';
           EFecVenta.Text := '';
           EOrdenTrabajo.Text := '';
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ECliente.Text := Cliente;
end;

procedure TFMGarantiasKri.DBGFDetalleRowChange(Sender: TObject);
begin
  inherited;
  EFArticulo.Text := DMGarantiasKri.xGarantiasARTICULO.AsString;
end;

procedure TFMGarantiasKri.EFArticuloExit(Sender: TObject);
begin
  inherited;
  if (NuevoArticulo) then
  begin
     ECliente.Text := '';
     EFecEmbalaje.Text := '';
     EFecVenta.Text := '';
     EOrdenTrabajo.Text := '';
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MIN(ID) FROM ART_GARANTIAS_REPARACION';
           ExecQuery;
           DMGarantiasKri.ID := FieldByName['MIN'].AsInteger - 1;
           if (DMGarantiasKri.ID >= 0) then
              DMGarantiasKri.ID := -1;
           FreeHandle;
        finally
           Free;
        end;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add('INSERT INTO ART_GARANTIAS_REPARACION(EMPRESA, ARTICULO, DETALLE, ORDEN, REFERENCIA, ORDEN_TRABAJO, ID, MARCA, ID_S_CAB) ');
           SQL.Add('SELECT EMPRESA, ARTICULO, DETALLE, ORDEN, '''', '''', ' + IntToStr(DMGarantiasKri.ID) + ',0,' + IntToStr(ID_S_CAB) + ' FROM ART_ARTICULOS_ESC_GARANTIA_DET ');
           SQL.Add('WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND ARTICULO=''' + EFArticulo.Text + '''');
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
     DMGarantiasKri.xGarantias.Close;
     DMGarantiasKri.xGarantias.Open;
     EFREferencia.Text := '';

     NuevoArticulo := False;
     PCabecera.Enabled := False;
  end;
end;

procedure TFMGarantiasKri.EFReferenciaExiste(Sender: TObject);
var
  id : integer;
begin
  inherited;
  if (Trim(EFReferencia.Text) > '') then
  begin
     id := StrToIntDef(EFReferencia.Text, 0);
     if (id <> 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add('INSERT INTO ART_GARANTIAS_REPARACION(EMPRESA, ARTICULO, ID, DETALLE, REFERENCIA, ORDEN_TRABAJO, ORDEN, MARCA, ID_S_CAB) ');
              SQL.Add('SELECT EMPRESA, ARTICULO, ID, DETALLE, REFERENCIA, ORDEN_TRABAJO, ORDEN, 0, ' + IntToStr(ID_S_CAB) + ' FROM ART_ARTICULOS_GARANTIAS_DET ');
              SQL.Add('WHERE ID=' + IntToStr(ID));
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     DMGarantiasKri.xGarantias.Close;
     DMGarantiasKri.xGarantias.Open;
     EFREferencia.Text := '';
  end;
end;

end.
