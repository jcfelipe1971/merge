unit UFMAsignaLotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, Grids, DBGrids, NsDBGrid, ULFPageControl,
  ULFMemo, rxToolEdit, ULFDateEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, Buttons;

type
  TFMAsignaLotes = class(TFPEditSinNavegador)
     LArticulo: TLFLabel;
     DBEArticulo: TLFDbedit;
     ETituloAticulo: TLFEdit;
     LDocumento: TLFLabel;
     DBETipo: TLFDbedit;
     DBESerie: TLFDbedit;
     DBERIG: TLFDbedit;
     DBELinea: TLFDbedit;
     DBEEjercicio: TLFDbedit;
     LCodCliPro: TLFLabel;
     DBECodCliPro: TLFDbedit;
     ETituloCodCliPro: TLFEdit;
     PNLInfoDocumento: TLFPanel;
     PNLSeleccionLotes: TLFPanel;
     PNLLotesDisponibles: TLFPanel;
     PNLLotesAsignados: TLFPanel;
     DBGLotesDisponibles: TDBGridFind2000;
     DBGLotesAsignados: TDBGridFind2000;
     LLotesDisponibles: TLFLabel;
     LLotesAsignados: TLFLabel;
     PNLMoverLote: TLFPanel;
     BAsignar: TBitBtn;
     EUnidades: TLFEdit;
     DBEUnidadesNecesarias: TLFDbedit;
     LUnidadesNecesarias: TLFLabel;
     LUnidadesAsignadas: TLFLabel;
     DBELUnidadesAsignadas: TLFDbedit;
     BCrearLote: TBitBtn;
     LCantidad: TLFLabel;
     PCLotesDisponibles: TLFPageControl;
     TSLotesDisponibles: TTabSheet;
     TSLoteNuevo: TTabSheet;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     EDescProveedor: TLFEdit;
     LBLFFAbricacion: TLFLabel;
     DTPFFabricacion: TLFDateEdit;
     LBLFENvasado: TLFLabel;
     DTPFEnvasado: TLFDateEdit;
     LBLFCaducidad: TLFLabel;
     DTPFCaducidad: TLFDateEdit;
     LBLClasificacion: TLFLabel;
     EClasificacion: TLFEdit;
     LNotas: TLFLabel;
     MNotas: TLFMemo;
     LFMedida1: TLFLabel;
     LFEMedida1: TLFEdit;
     LFMedida2: TLFLabel;
     LFEMedida2: TLFEdit;
     LFMedida3: TLFLabel;
     LFEMedida3: TLFEdit;
     LFMedida4: TLFLabel;
     LFEMedida4: TLFEdit;
     ELote: TLFEdit;
     LLote: TLFLabel;
     BNuevoLoteIgualClasificacion: TBitBtn;
     Splitter: TSplitter;
     PNLCabLotesDisponibles: TLFPanel;
     LFiltroClasificacion: TLFLabel;
     EFiltroClasificacion: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBECodCliProChange(Sender: TObject);
     procedure DBGLotesDisponiblesDblClick(Sender: TObject);
     procedure DBGLotesAsignadosDblClick(Sender: TObject);
     procedure BAsignarClick(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure BCrearLoteClick(Sender: TObject);
     procedure TSLoteNuevoShow(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
     procedure BNuevoLoteIgualClasificacionClick(Sender: TObject);
     procedure DBEArticuloChange(Sender: TObject);
     procedure DBGLotesDisponiblesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFiltroClasificacionChange(Sender: TObject);
  private
     { Private declarations }
     Tipo: string;
     IdDoc: integer;
     Editable: boolean;
     procedure RefrescaUnidades;
  public
     { Public declarations }
     procedure AsignaDocumento(aTipo: string; aIdDoc: integer; aEditable: boolean);
  end;

var
  FMAsignaLotes : TFMAsignaLotes;

implementation

uses UDMMain, UFormGest, UDMAsignaLotes, UEntorno, DateUtils, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMAsignaLotes.AsignaDocumento(aTipo: string; aIdDoc: integer; aEditable: boolean);
begin
  Tipo := aTipo;
  IdDoc := aIdDoc;
  Editable := aEditable;

  if ((Tipo = 'PEP') or (Tipo = 'ALP') or (Tipo = 'FAP') or (Tipo = 'MAT')) then
     LCodCliPro.Caption := _('Proveedor')
  else
     LCodCliPro.Caption := _('Cliente');

  DMAsignaLotes.AsignaDocumento(Tipo, IdDoc, Editable);

  RefrescaUnidades;

  if (DMAsignaLotes.xDocumento.Active) and (DMAsignaLotes.xDocumento.FieldByName('ID_A').AsInteger <> 0) then
  begin
     Hide;
     ShowModal;
  end
  else
     Close;
end;

procedure TFMAsignaLotes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAsignaLotes, DMAsignaLotes);

  // Color campo ID
  ColorCampoID(DBEArticulo);

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BAsignar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BCrearLote, 1, DMMain.ILMain_Ac, 94);
  GetBitmapFromImageList(BNuevoLoteIgualClasificacion, 1, DMMain.ILMain_Ac, 57);
end;

procedure TFMAsignaLotes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsignaLotes);
end;

procedure TFMAsignaLotes.RefrescaUnidades;
begin
  if (DMAsignaLotes.xDocumento.Active) then
     EUnidades.Text := DMMain.DameUnidadesConFormato(DMAsignaLotes.xDocumento.FieldByName('ARTICULO').AsString, DMAsignaLotes.xDocumento.FieldByName('UNIDADES').AsFloat - DMAsignaLotes.xDocumento.FieldByName('UNIDADES_ASIGNADAS').AsFloat);
end;

procedure TFMAsignaLotes.DBECodCliProChange(Sender: TObject);
begin
  inherited;
  if (DMAsignaLotes.xDocumento.Active) then
  begin
     if ((Tipo = 'PEP') or (Tipo = 'ALP') or (Tipo = 'FAP')) then
        ETituloCodCliPro.Text := DameTituloProveedor(DMAsignaLotes.xDocumento.FieldByName('COD_CLI_PRO').AsInteger);
     if ((Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
        ETituloCodCliPro.Text := DameTituloCliente(DMAsignaLotes.xDocumento.FieldByName('COD_CLI_PRO').AsInteger);
  end;
end;

procedure TFMAsignaLotes.DBGLotesDisponiblesDblClick(Sender: TObject);
var
  Unidades : double;
begin
  inherited;
  // Primero limpio el separador de miles y lo convierto a numero
  Unidades := StrToFloatDef(StringReplace(EUnidades.Text, ThousandSeparator, '', [rfReplaceAll]), 0);
  if ((Editable) and (Unidades <> 0)) then
  begin
     DMAsignaLotes.AsignaLote(Unidades);
  end;
  RefrescaUnidades;
end;

procedure TFMAsignaLotes.DBGLotesAsignadosDblClick(Sender: TObject);
begin
  inherited;
  if (Editable) then
     DMAsignaLotes.QuitaLote;
  RefrescaUnidades;
end;

procedure TFMAsignaLotes.BAsignarClick(Sender: TObject);
begin
  inherited;
  DBGLotesDisponiblesDblClick(Sender);
end;

procedure TFMAsignaLotes.EFProveedorChange(Sender: TObject);
begin
  inherited;
  EDescProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));
end;

procedure TFMAsignaLotes.BCrearLoteClick(Sender: TObject);
var
  id_lote : integer;
begin
  inherited;
  id_lote := DMAsignaLotes.GrabaLote(DMAsignaLotes.xDocumento.FieldByName('EMPRESA').AsInteger,
     DMAsignaLotes.xDocumento.FieldByName('EJERCICIO').AsInteger,
     DMAsignaLotes.xDocumento.FieldByName('CANAL').AsInteger,
     DMAsignaLotes.xDocumento.FieldByName('ARTICULO').AsString,
     ELote.Text, DMAsignaLotes.xDocumento.FieldByName('ALMACEN').AsString, EClasificacion.Text,
     DTPFFabricacion.Date, DTPFEnvasado.Date, DTPFCaducidad.Date,
     DMAsignaLotes.xDocumento.FieldByName('ID_A').AsInteger, StrToIntDef(EFProveedor.Text, -1),
     MNotas.Lines,
     StrToFloat(LFEMedida1.Text), StrToFloat(LFEMedida2.Text), StrToFloat(LFEMedida3.Text), StrToFloat(LFEMedida4.Text));

  DMAsignaLotes.Posiciona(id_lote);
  PCLotesDisponibles.ActivePage := TSLotesDisponibles;
  BAsignar.SetFocus;
end;

procedure TFMAsignaLotes.TSLoteNuevoShow(Sender: TObject);
begin
  inherited;
  ELote.Text := DMAsignaLotes.DameLoteSiguiente(DMAsignaLotes.xDocumento.FieldByName('ID_A').AsInteger);
  if (EFProveedor.Text = '') then
     EFProveedor.Text := DBECodCliPro.Text;
  DTPFFabricacion.Date := Today;
  DTPFEnvasado.Date := Today;
  DTPFCaducidad.Date := Today;
  ELote.SetFocus;
end;

procedure TFMAsignaLotes.FormShow(Sender: TObject);
begin
  inherited;
  PCLotesDisponibles.ActivePage := TSLotesDisponibles;
  TSLoteNuevo.TabVisible := Editable;
  BNuevoLoteIgualClasificacion.Visible := Editable;
end;

procedure TFMAsignaLotes.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  inherited;
  DMAsignaLotes.xDocumento.Next;
  CanClose := DMAsignaLotes.xDocumento.EOF;

  if (not CanClose) then
     RefrescaUnidades;
end;

procedure TFMAsignaLotes.BNuevoLoteIgualClasificacionClick(Sender: TObject);
begin
  inherited;
  PCLotesDisponibles.ActivePage := TSLoteNuevo;
  EClasificacion.Text := DMAsignaLotes.xLoteDisponibleCLASIFICACION.AsString;
end;

procedure TFMAsignaLotes.DBEArticuloChange(Sender: TObject);
begin
  inherited;
  ETituloAticulo.Text := DameTituloArticulo(DBEArticulo.Text);
end;

procedure TFMAsignaLotes.DBGLotesDisponiblesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (DataSource.DataSet.FieldByName('CANAL').AsInteger <> REntorno.Canal) then
           ColorInactivo(Canvas)
        else
           ColorInfo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMAsignaLotes.EFiltroClasificacionChange(Sender: TObject);
begin
  inherited;
  DMAsignaLotes.FiltraClasificacion(Trim(EFiltroClasificacion.Text));
end;

end.
