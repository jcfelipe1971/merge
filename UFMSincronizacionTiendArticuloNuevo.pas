unit UFMSincronizacionTiendArticuloNuevo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFEdit, ULFLabel, ULFMemo;

type
  TFMSincronizacionTiendArticuloNuevo = class(TFPEditSinNavegador)
     PNLDatosPrestashop: TLFPanel;
     PNLSeleccionArticulo: TLFPanel;
     MDatosPrestashop: TLFMemo;
     LArticuloPropuesto: TLFLabel;
     EArticuloPropuesto: TLFEdit;
     LArticuloReferencia: TLFLabel;
     EArticuloReferencia: TLFEdit;
     LArticuloAlfa1: TLFLabel;
     EArticuloAlfa1: TLFEdit;
     EFArticuloOtro: TLFEditFind2000;
     LArticuloOtro: TLFLabel;
     LInfoArticuloPropuesto: TLFLabel;
     LInfoEArticuloReferencia: TLFLabel;
     LInfoArticuloAlfa1: TLFLabel;
     LInfoEArticuloOtro: TLFLabel;
     BSeleccionarPropuesto: TButton;
     BSeleccionarReferencia: TButton;
     BSeleccionarAlfa1: TButton;
     BSeleccionarOtro: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EArticuloPropuestoChange(Sender: TObject);
     procedure EArticuloReferenciaChange(Sender: TObject);
     procedure EArticuloAlfa1Change(Sender: TObject);
     procedure BSeleccionarPropuestoClick(Sender: TObject);
     procedure BSeleccionarReferenciaClick(Sender: TObject);
     procedure BSeleccionarAlfa1Click(Sender: TObject);
     procedure BSeleccionarOtroClick(Sender: TObject);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     ArticuloPropuesto: string;
     ReferenciaArticulo: string;
     Alfa1Articulo: string;
     DatosImportacion: TStrings;
     ArticuloSeleccionado: string;
     function Elegir(ImportarSiNoExisteOtro: boolean): string;
  end;

var
  FMSincronizacionTiendArticuloNuevo : TFMSincronizacionTiendArticuloNuevo;

implementation

uses
  UDMMain, UEntorno, UDameDato, HYFIBQuery;

{$R *.dfm}

procedure TFMSincronizacionTiendArticuloNuevo.FormCreate(Sender: TObject);
begin
  inherited;
  ArticuloPropuesto := '';
  DatosImportacion := TStringList.Create;
end;

procedure TFMSincronizacionTiendArticuloNuevo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DatosImportacion.Free;
end;

function TFMSincronizacionTiendArticuloNuevo.Elegir(ImportarSiNoExisteOtro: boolean): string;
begin
  MDatosPrestashop.Text := DatosImportacion.Text;

  EArticuloPropuesto.Text := ArticuloPropuesto;

  // Busco articulo con ALFA_1 = reference (limpia)
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ARTICULO FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ALFA_1 = :ALFA_1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ALFA_1'].AsString := ReferenciaArticulo;
        ExecQuery;
        EArticuloReferencia.Text := FieldByName['ARTICULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Busco articulo con ALFA_1 = reference
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ARTICULO FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ALFA_1 = :ALFA_1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ALFA_1'].AsString := Alfa1Articulo;
        ExecQuery;
        EArticuloAlfa1.Text := FieldByName['ARTICULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  EFArticuloOtro.Text := '';

  Result := '';

  if (ImportarSiNoExisteOtro) then
  begin
     if ((EArticuloReferencia.Text = '') and (EArticuloAlfa1.Text = '')) then
        Result := ArticuloPropuesto;
  end;

  if (Result = '') then
  begin
     ArticuloSeleccionado := '';
     if (ShowModal = mrOk) then
        Result := ArticuloSeleccionado;
  end;
end;

procedure TFMSincronizacionTiendArticuloNuevo.EArticuloPropuestoChange(Sender: TObject);
var
  Titulo : string;
begin
  inherited;
  LInfoArticuloPropuesto.Caption := '';
  Titulo := DameTituloArticulo(EArticuloPropuesto.Text);
  if (Titulo > '') then
     LInfoArticuloPropuesto.Caption := 'Existe artículo' + #13#10 + Titulo;
end;

procedure TFMSincronizacionTiendArticuloNuevo.EArticuloReferenciaChange(Sender: TObject);
var
  Titulo : string;
begin
  inherited;
  LInfoEArticuloReferencia.Caption := '';
  Titulo := DameTituloArticulo(EArticuloReferencia.Text);
  if (Titulo > '') then
     LInfoEArticuloReferencia.Caption := 'Existe artículo' + #13#10 + Titulo;
end;

procedure TFMSincronizacionTiendArticuloNuevo.EArticuloAlfa1Change(Sender: TObject);
var
  Titulo : string;
begin
  inherited;
  LInfoArticuloAlfa1.Caption := '';
  Titulo := DameTituloArticulo(EArticuloAlfa1.Text);
  if (Titulo > '') then
     LInfoArticuloAlfa1.Caption := 'Existe artículo' + #13#10 + Titulo;
end;

procedure TFMSincronizacionTiendArticuloNuevo.BSeleccionarPropuestoClick(Sender: TObject);
begin
  inherited;
  ArticuloSeleccionado := EArticuloPropuesto.Text;
end;

procedure TFMSincronizacionTiendArticuloNuevo.BSeleccionarReferenciaClick(Sender: TObject);
begin
  inherited;
  ArticuloSeleccionado := EArticuloReferencia.Text;
end;

procedure TFMSincronizacionTiendArticuloNuevo.BSeleccionarAlfa1Click(Sender: TObject);
begin
  inherited;
  ArticuloSeleccionado := EArticuloAlfa1.Text;
end;

procedure TFMSincronizacionTiendArticuloNuevo.BSeleccionarOtroClick(Sender: TObject);
begin
  inherited;
  ArticuloSeleccionado := EFArticuloOtro.Text;
end;

procedure TFMSincronizacionTiendArticuloNuevo.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ModalResult := mrCancel;
end;

end.
