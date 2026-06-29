unit UFMExtraccionDatos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, DBCtrls, ULFDBMemo, Mask,
  ULFDBEdit, ULFLabel, ULFEdit, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox;

type
  TFMExtraccionDatos = class(TFPEditDetalle)
     LTitulo: TLFLabel;
     LSentencia: TLFLabel;
     DBETitulo: TLFDbedit;
     DBMSentencia: TLFDBMemo;
     PNLFicha: TLFPanel;
     AEjecutar: TAction;
     ToolButton1: TToolButton;
     TSSentencia: TTabSheet;
     PNLEdicion: TLFPanel;
     DBETituloFicha: TLFDbedit;
     PNLTitulo: TLFPanel;
     ToolButton2: TToolButton;
     TButtEjecutar: TToolButton;
     AExportaExcel: TAction;
     ProgressBar: TProgressBar;
     DBGDetalle: THYTDBGrid;
     AExportarHTML: TAction;
     AExportarCSV: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     DBCHKTransaccionReadOnly: TLFDBCheckBox;
     PNLTotales: TLFPanel;
     procedure AEjecutarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure FormShow(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure AExportaExcelExecute(Sender: TObject);
     procedure DBGMainDblClick(Sender: TObject);
     procedure AExportarHTMLExecute(Sender: TObject);
     procedure AExportarCSVExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure FormResize(Sender: TObject);
     procedure DBGDetalleColEnter(Sender: TObject);
     procedure PDetalleResize(Sender: TObject);
  private
     AlturaEdits: integer;
     Totales: array of double;
     procedure CreaParametros;
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMExtraccionDatos : TFMExtraccionDatos;

implementation

uses UDMMain, UEntorno, UDMExtraccionDatos, UFormGest, DB, ULFREdit, UUtiles;

{$R *.dfm}

procedure TFMExtraccionDatos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMExtraccionDatos, DMExtraccionDatos);
  NavMain.DataSource := DMExtraccionDatos.DSQMExtraccion;
  DBGMain.DataSource := DMExtraccionDatos.DSQMExtraccion;
  G2KTableLoc.DataSource := DMExtraccionDatos.DSQMExtraccion;
  NavDetalle.DataSource := DMExtraccionDatos.DSxResultado;
  DBGFDetalle.DataSource := nil;
  DBGDetalle.DataSource := DMExtraccionDatos.DSxResultado;
  CEDetalle.DataSource := nil;
  AlturaEdits := 22;
end;

procedure TFMExtraccionDatos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMExtraccionDatos);
end;

procedure TFMExtraccionDatos.AEjecutarExecute(Sender: TObject);
var
  i : integer;
  //f : TField;
begin
  inherited;
  if (PCMain.ActivePage = TSFicha) then
  begin
     for i := 0 to PNLFicha.ComponentCount - 1 do
     begin
        if (PNLFicha.Components[i] is TLFEdit) then
        begin
           // Con el parámetro ...
           with DMExtraccionDatos.xResultado.Params[TLFEdit(PNLFicha.Components[i]).Tag] do
           begin
              if (DataType in [DB.ftString, DB.ftWideString]) then
                 AsString := TLFEdit(PNLFicha.Components[i]).Text;

              if (DataType = DB.ftFloat) then
                 AsFloat := StrToFloatDef(TLFEdit(PNLFicha.Components[i]).Text, 0);

              if (DataType in [DB.ftInteger, DB.ftSmallint]) then
                 AsInteger := StrToIntDef(TLFEdit(PNLFicha.Components[i]).Text, 0);

              if (DataType = DB.ftDateTime) then
                 AsDateTime := StrToDateTime(TLFEdit(PNLFicha.Components[i]).Text);
           end;
        end;
     end;

     try
        DMExtraccionDatos.Ejecutar;
     except
        on E: Exception do
           ShowMessage('Ejecucion' + #13#10 + E.Message);
     end;

     // Evito que columnas salgan muy anchas
     try
        for i := 0 to DBGDetalle.Columns.Count - 1 do
        begin
           if DBGDetalle.Columns[i].Width > 300 then
              DBGDetalle.Columns[i].Width := 300;
        end;
     except
        on E: Exception do
           ShowMessage('Columnas' + #13#10 + E.Message);
     end;

     // Calculo Totales
     SetLength(Totales, DBGDetalle.Columns.Count);
     CalculaTotales(DBGDetalle, Totales, 'EMPRESA,EJERCICIO,CANAL,RIG,CLIENTE,PROVEEDOR,ACREEDOR,AGENTE,TERCERO,DIRECCION');
     PintaTotales(PNLTotales, DBGDetalle, Totales, 'EMPRESA,EJERCICIO,CANAL,RIG,CLIENTE,PROVEEDOR,ACREEDOR,AGENTE,TERCERO,DIRECCION');
  end
  else
  begin
     PCMain.ActivePage := TSFicha;
     PCMainChange(Sender);
     CreaParametros;
  end;
end;

procedure TFMExtraccionDatos.CreaParametros;
var
  i, j : integer;
  t : integer;
  ParametroDuplicado : boolean;
  ComponenteEdicion : TObject;
begin
  inherited;
  // Borro los edits que piden parametros
  for i := PNLFicha.ComponentCount - 1 downto 0 do
     PNLFicha.Components[i].Free;

  // Cargo el SQL en la tabla y relleno sus parámetros con valores por defecto
  DMExtraccionDatos.Cargar;

  // Creo los edits para pedir datos para los parametros
  if (not DMExtraccionDatos.QMExtraccion.IsEmpty) then
  begin
     with DMExtraccionDatos.xResultado do
     begin
        Close;
        t := 0;
        for i := 0 to Params.Count - 1 do
        begin
           ParametroDuplicado := False;
           for j := 0 to i - 1 do
           begin
              if (DMExtraccionDatos.xResultado.Params[i].Name = DMExtraccionDatos.xResultado.Params[j].Name) then
                 ParametroDuplicado := True;
           end;
           if (not ParametroDuplicado) then
           begin
              // Creo Label
              ComponenteEdicion := TLFLabel.Create(PNLFicha);
              with TLFLabel(ComponenteEdicion) do
              begin
                 Parent := PNLFicha;
                 Top := (AlturaEdits * t) + 4;
                 Caption := DMExtraccionDatos.xResultado.Params[i].Name;
                 Alignment := taRightJustify;
                 Left := 100 - Width - 10;
                 Name := 'L' + IntToStr(i);
                 Tag := i;
              end;

              // Creo Edit
              ComponenteEdicion := TLFEdit.Create(PNLFicha);
              with TLFEdit(ComponenteEdicion) do
              begin
                 Parent := PNLFicha;
                 Top := AlturaEdits * t;
                 Left := 100;
                 Width := PNLFicha.Width - Left - 10;
                 Name := 'E' + IntToStr(i);
                 Tag := i;
                 Text := '';
              end;

              // Relleno valores por defecto
              if (Params[i].Name = 'EMPRESA') then
                 TLFEdit(ComponenteEdicion).Text := REntorno.EmpresaStr
              else
              if (Params[i].Name = 'EJERCICIO') then
                 TLFEdit(ComponenteEdicion).Text := REntorno.EjercicioStr
              else
              if (Params[i].Name = 'CANAL') then
                 TLFEdit(ComponenteEdicion).Text := REntorno.CanalStr
              else
              if (Params[i].Name = 'SERIE') then
                 TLFEdit(ComponenteEdicion).Text := REntorno.Serie
              else
              if (Params[i].Name = 'PAIS') then
                 TLFEdit(ComponenteEdicion).Text := REntorno.Pais
              else
              if (Params[i].Name = 'PGC') then
                 TLFEdit(ComponenteEdicion).Text := IntToStr(REntorno.PGC)
              else
              begin
                 // Con el parámetro ...
                 with DMExtraccionDatos.xResultado.Params[i] do
                 begin
                    if (DataType in [DB.ftString, DB.ftWideString]) then
                       TLFEdit(ComponenteEdicion).Text := '';

                    if (DataType = DB.ftFloat) then
                       TLFEdit(ComponenteEdicion).Text := '0';

                    if (DataType in [DB.ftInteger, DB.ftSmallint]) then
                       TLFEdit(ComponenteEdicion).Text := '0';

                    if (DataType = DB.ftDateTime) then
                       TLFEdit(ComponenteEdicion).Text := DateToStr(REntorno.FechaTrabSH);
                 end;
              end;
              Inc(t);
           end;
        end;
     end;
  end;

  PCMainChange(Self);
end;

procedure TFMExtraccionDatos.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if not (Button in [nbInsert, nbEdit]) then
     CreaParametros;
end;

procedure TFMExtraccionDatos.FormShow(Sender: TObject);
begin
  inherited;
  CreaParametros;
end;

procedure TFMExtraccionDatos.PCMainChange(Sender: TObject);
begin
  inherited;
  FormResize(Sender);
end;

procedure TFMExtraccionDatos.FormResize(Sender: TObject);
var
  i, Altura : integer;
begin
  inherited;
  if (PCMain.ActivePage = TSFicha) then
  begin
     Altura := PNLTitulo.Height;
     Altura := Altura + PNLTitulo.Height;
     for i := PNLFicha.ComponentCount - 1 downto 0 do
     begin
        if (PNLFicha.Components[i] is TLFEdit) then
           Altura := Altura + AlturaEdits;
     end;
     PMain.Height := Altura + 3 * AlturaEdits;
  end
  else
     PMain.Height := FMExtraccionDatos.ClientHeight div 2;
end;

procedure TFMExtraccionDatos.AExportaExcelExecute(Sender: TObject);
begin
  inherited;
  DMExtraccionDatos.ExportaAExcel(ProgressBar);
end;

procedure TFMExtraccionDatos.DBGMainDblClick(Sender: TObject);
begin
  inherited;
  CreaParametros;
end;

procedure TFMExtraccionDatos.AExportarHTMLExecute(Sender: TObject);
begin
  inherited;
  DMExtraccionDatos.ExportaAHTML(ProgressBar);
end;

procedure TFMExtraccionDatos.AExportarCSVExecute(Sender: TObject);
begin
  inherited;
  DMExtraccionDatos.ExportaACSV(ProgressBar);
end;

procedure TFMExtraccionDatos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMExtraccionDatos.DBGDetalleColEnter(Sender: TObject);
begin
  inherited;
  PintaTotales(PNLTotales, DBGDetalle, Totales, 'EMPRESA,EJERCICIO,CANAL,RIG,CLIENTE,PROVEEDOR,ACREEDOR,AGENTE,TERCERO,DIRECCION');
end;

procedure TFMExtraccionDatos.PDetalleResize(Sender: TObject);
begin
  inherited;
  PintaTotales(PNLTotales, DBGDetalle, Totales, 'EMPRESA,EJERCICIO,CANAL,RIG,CLIENTE,PROVEEDOR,ACREEDOR,AGENTE,TERCERO,DIRECCION');
end;

end.
