unit UFMGestionDocumentosPago;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, rxToolEdit, RXDBCtrl, ULFDBDateEdit, StdCtrls,
  ULFEdit, ULFFIBDBEditFind, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  ULFDBEditFind2000, HYFIBQuery;

type
  TFMGestionDocumentosPago = class(TFPEditDetalle)
     LAgrupacion: TLFLabel;
     LFecha: TLFLabel;
     LBanco: TLFLabel;
     LTitulo: TLFLabel;
     DBEAgrupacion: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBEFBanco: TLFDBEditFind2000;
     ETituloBanco: TLFEdit;
     DBDEFecha: TLFDBDateEdit;
     ToolButton1: TToolButton;
     TButtGeneraConfirming: TToolButton;
     LFCategoryAction1: TLFCategoryAction;
     AInsertarDocumentos: TAction;
     AMarcarTodos: TAction;
     ToolButton3: TToolButton;
     PNLTipo: TLFPanel;
     LTipo: TLFLabel;
     RBTalon: TRadioButton;
     RBPagare: TRadioButton;
     PPFormatosConfirming: TPopUpTeclas;
     MIConfirmingBBV: TMenuItem;
     MIConfirmingBSantarder: TMenuItem;
     MIConfirmingBCentralHispano: TMenuItem;
     MIConfirmingBGuipuzcoano: TMenuItem;
     MIConfirmingBdeValencia: TMenuItem;
     MIConfirmingBBanesto: TMenuItem;
     MIConfirmingBSabadell: TMenuItem;
     MIConfirmingBankinter: TMenuItem;
     MIConfirmingBPopular: TMenuItem;
     MIConfirmingLaCaixa: TMenuItem;
     LImporte: TLFLabel;
     DBEImporte: TLFDbedit;
     TBMarcarTodos: TToolButton;
     ToolButton4: TToolButton;
     TBBorrarMarcados: TToolButton;
     ABorrarMarcados: TAction;
     DBGDetalleDocumentos: TDBGridFind2000;
     DBGIncidencias: TNsDBGrid;
     APagaDocumentos: TAction;
     ToolButton2: TToolButton;
     TBPagaDocumentos: TToolButton;
     TButtPagare: TToolButton;
     TSep1: TToolButton;
     PUPagares: TPopupMenu;
     MIPagareSabadell: TMenuItem;
     MIPagareLaCaixa: TMenuItem;
     procedure FormCreate(Sender: TObject);
     procedure DBEFBancoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure RadioButtonTipoClick(Sender: TObject);
     procedure AInsertarDocumentosExecute(Sender: TObject);
     procedure AMarcarTodosExecute(Sender: TObject);
     procedure MIBancoConfirmingClick(Sender: TObject);
     procedure ABorrarMarcadosExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure APagaDocumentosExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleTitleClick(Column: TColumn);
     procedure MIBancoPagareClick(Sender: TObject);
  private
     { Private declarations }
     Tipo: string;
     procedure IniciaFormatoConfirming(Formato: smallint);
     procedure IniciaFormatoPagare(Formato: smallint);
  public
     { Public declarations }
  end;

var
  FMGestionDocumentosPago : TFMGestionDocumentosPago;

implementation

uses UDMGestionDocumentosPago, UDMMain, UEntorno, UFormGest, UUtiles, UFPregDatosCFM, UDameDato;

{$R *.dfm}

procedure TFMGestionDocumentosPago.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGestionDocumentosPago, DMGestionDocumentosPago);

  NavMain.DataSource := DMGestionDocumentosPago.DSAgrupacionDocumentos;
  DBGMain.DataSource := DMGestionDocumentosPago.DSAgrupacionDocumentos;
  G2kTableLoc.DataSource := DMGestionDocumentosPago.DSAgrupacionDocumentos;
  NavDetalle.DataSource := DMGestionDocumentosPago.DSAgrupacionDocumentosDet;
  DBGFDetalle.DataSource := DMGestionDocumentosPago.DSAgrupacionDocumentosDet;
  DBGDetalleDocumentos.DataSource := DMGestionDocumentosPago.DSDetalleDocumento;

  Tipo := '';
  RBPagare.Checked := True;
  RadioButtonTipoClick(RBPagare);
  DBGFDetalle.ColumnasChecked.Strings[DBGFDetalle.ColumnasCheckBoxes.IndexOf('MARCA')] := REntorno.EntradaStr;
end;

procedure TFMGestionDocumentosPago.DBEFBancoChange(Sender: TObject);
begin
  inherited;
  ETituloBanco.Text := DameTituloBanco(StrToIntDef(DBEFBanco.Text, 0));
end;

procedure TFMGestionDocumentosPago.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMGestionDocumentosPago.RadioButtonTipoClick(Sender: TObject);
var
  CambiaTipo : boolean;
begin
  inherited;
  CambiaTipo := False;
  if (Sender = RBTalon) then
  begin
     CambiaTipo := (Tipo <> 'TAL');
     Tipo := 'TAL';
  end;

  if (Sender = RBPagare) then
  begin
     CambiaTipo := (Tipo <> 'PAG');
     Tipo := 'PAG';
  end;

  if (CambiaTipo) then
  begin
     G2kTableLoc.CondicionBusqueda := 'TIPO_EFECTO = ''' + Tipo + '''';
     DMGestionDocumentosPago.FiltraTipo(Tipo);
  end;

  TButtPagare.Enabled := (Tipo = 'PAG');
end;

procedure TFMGestionDocumentosPago.AInsertarDocumentosExecute(Sender: TObject);
begin
  inherited;
  DMGestionDocumentosPago.InsertaDocumentos;
end;

procedure TFMGestionDocumentosPago.AMarcarTodosExecute(Sender: TObject);
begin
  inherited;
  /// Marco o desmarco todos los registros y cambio la función de la acción

  DMGestionDocumentosPago.MarcarTodos((AMarcarTodos.Tag = 0));

  with AMarcarTodos do
  begin
     if (Tag = 0) then
     begin
        Tag := 1;
        Caption := _('Desmarcar Todos');
        Hint := _('Desmarca todos los documentos');
        ImageIndex := 147;
     end
     else
     begin
        Tag := 0;
        Caption := _('Marcar Todos');
        Hint := _('Marca todos los documentos');
        ImageIndex := 146;
     end;
  end;
end;

procedure TFMGestionDocumentosPago.MIBancoConfirmingClick(Sender: TObject);
begin
  inherited;
  IniciaFormatoConfirming(TMenuItem(Sender).Tag);
end;

procedure TFMGestionDocumentosPago.IniciaFormatoConfirming(Formato: smallint);
var
  IdCedente : string;
  // CantidadMonedas : integer;
  // Moneda : string;
  LongitudCedente : integer;
begin
  // Busco el cedente por moneda
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CEDENTE FROM EMP_BANCOS_CENDENTES_MONEDA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' BANCO = ?BANCO AND ');
        SQL.Add(' MONEDA = ?MONEDA ');
        Params.ByName['EMPRESA'].AsInteger := DMGestionDocumentosPago.xAgrupacionDocumentosEMPRESA.AsInteger;
        Params.ByName['BANCO'].AsInteger := DMGestionDocumentosPago.xAgrupacionDocumentosBANCO.AsInteger;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        ExecQuery;
        IdCedente := FieldByName['CEDENTE'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (IdCedente = '') then
  begin
     // Busco el cedente por defecto
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT CEDENTE_CONFIRMING FROM EMP_BANCOS WHERE EMPRESA=:EMPRESA AND BANCO=:BANCO';
           Params.ByName['EMPRESA'].AsInteger := DMGestionDocumentosPago.xAgrupacionDocumentosEMPRESA.AsInteger;
           Params.ByName['BANCO'].AsInteger := DMGestionDocumentosPago.xAgrupacionDocumentosBANCO.AsInteger;
           ExecQuery;
           IdCedente := FieldByName['CEDENTE_CONFIRMING'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  case Formato of
     0: LongitudCedente := 6;
     1: LongitudCedente := 2;
     2: LongitudCedente := 3;
     3: LongitudCedente := 2;
     4: LongitudCedente := 2;
     5: LongitudCedente := 10; // Longitud IdCedente Banesto
     6: LongitudCedente := 12;
     7: LongitudCedente := 20; // Bankinter debe poner el nro. de contrato en el cedente (Ejemplo: '01289451360630018026' [EEEESSSSDDCCCCCCCCCC])
     8: LongitudCedente := 3;
     9: LongitudCedente := 10; // Número de contrato de Confirming [01NNNNNNDD]
     else
        LongitudCedente := 0;
  end;

  IdCedente := Ajusta(IdCedente, 'I', LongitudCedente, '0');

  with TFPregDatosCFM.Create(Self) do
  begin
     if Datos(IdCedente) then
        DMGestionDocumentosPago.FormatoConfirming(Formato, IdCedente);
  end;
end;

procedure TFMGestionDocumentosPago.ABorrarMarcadosExecute(Sender: TObject);
begin
  inherited;
  DMGestionDocumentosPago.BorrarMarcados;
end;

procedure TFMGestionDocumentosPago.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGestionDocumentosPago);
end;

procedure TFMGestionDocumentosPago.APagaDocumentosExecute(Sender: TObject);
begin
  inherited;
  DMGestionDocumentosPago.PagarDocumentos;
end;

procedure TFMGestionDocumentosPago.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  { TODO : Ir al documento (talon/pagare) }
end;

procedure TFMGestionDocumentosPago.DBGFDetalleTitleClick(Column: TColumn);
begin
  inherited;
  DMGestionDocumentosPago.OrdenarDetalle(Column.FieldName);
end;

procedure TFMGestionDocumentosPago.MIBancoPagareClick(Sender: TObject);
begin
  inherited;
  IniciaFormatoPagare(TMenuItem(Sender).Tag);
end;

procedure TFMGestionDocumentosPago.IniciaFormatoPagare(Formato: smallint);
begin
  // Preguntar datos necesarios...

  DMGestionDocumentosPago.FormatoPagare(Formato);
end;

end.
