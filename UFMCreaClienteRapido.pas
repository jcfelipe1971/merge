unit UFMCreaClienteRapido;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, DBCtrls,
  ULFDBMemo, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, Mask, ULFDBEdit, ULFLabel, ULFEditFind2000, ULFEdit,
  UFPEditSinNavegador, ULFMemo;

type
  TFMCreaClienteRapido = class(TFPEditSinNavegador)
     LBLNif: TLFLabel;
     LDireccion: TLFLabel;
     LCodPostal: TLFLabel;
     LProvincia: TLFLabel;
     LBLNombre: TLFLabel;
     LBLPais: TLFLabel;
     LLocalidad: TLFLabel;
     LTelefono01: TLFLabel;
     LTelefono02: TLFLabel;
     LTelefax: TLFLabel;
     LEmail: TLFLabel;
     LNotas: TLFLabel;
     LColonia: TLFLabel;
     ENif: TLFEdit;
     EDireccion: TLFEdit;
     EPais: TLFEdit;
     EProvincia: TLFEdit;
     ENombre: TLFEdit;
     EFLocalidad: TLFEditFind2000;
     ETituloPais: TLFEdit;
     ELocalidad: TLFEdit;
     ETelefono01: TLFEdit;
     ETelefono02: TLFEdit;
     ETelefax: TLFEdit;
     EEmail: TLFEdit;
     MNotas: TLFMemo;
     DBEColonia: TLFEdit;
     LMensajeErrorNIF: TLFLabel;
     ECodigoPostal: TLFEdit;
     ButtCrearCliente: TToolButton;
     LDireccion2: TLFLabel;
     EDireccion2: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure EFLocalidadChange(Sender: TObject);
     procedure ButtCrearClienteClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ENifChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Cliente: integer;
     function DameCliente: integer;
  end;

var
  FMCreaClienteRapido : TFMCreaClienteRapido;

function CreaClienteRapido: integer;

implementation

uses UDMMain, UFMain, UEntorno, UDMCreaClienteRapido, UFormGest, UUtiles, HYFIBQuery;

{$R *.dfm}

function CreaClienteRapido: integer;
var
  F : TFMCreaClienteRapido;
begin
  F := TFMCreaClienteRapido.Create(FMain);
  with F do
  begin
     Result := DameCliente;
     F.Free;
  end;
end;

procedure TFMCreaClienteRapido.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMCreaClienteRapido, DMCreaClienteRapido);
  EFLocalidad.Text := DMCreaClienteRapido.DameLocalidadEmpresa;
  Cliente := 0;
  LMensajeErrorNIF.Caption := '';
end;

procedure TFMCreaClienteRapido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCreaClienteRapido);
end;

procedure TFMCreaClienteRapido.ENifChange(Sender: TObject);
(*
var
  Verificacion : integer;
*)
var
  Valido : boolean;
  MensajeError : string;
  TipoDocumento : string;
begin
  inherited;
  // Verificamos numero de documento

  { TODO : Agregar tipo de documento para no tener que suponerlo según el pais }
  TipoDocumento := 'DES';
  if (EPais.Text = 'ESP') then
     TipoDocumento := 'NIF';
  if (EPais.Text = 'CHL') then
     TipoDocumento := 'RUT';

  DMMain.VerificaDocumentoIdentificacion(EPais.Text, TipoDocumento, ENif.Text, Valido, MensajeError);
  ENif.Hint := MensajeError;

  if (DMCreaClienteRapido.ExisteTerceroNIF(ENif.Text)) then
  begin
     Valido := False;
     ENif.Hint := _('Ya existe otro tercero con este NIF');
  end;

  if (Valido) then
     ColorEdicion(ENif)
  else
     ColorError(ENif);

  LMensajeErrorNIF.Caption := ENif.Hint;
end;

procedure TFMCreaClienteRapido.EFLocalidadChange(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  inherited;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT LOCALIDAD, PAIS, CODPOSTAL, TITULO, PROVINCIA, C_PAIS FROM VER_LOCALIDADES WHERE LOCALIDAD = ?LOCALIDAD';
        Params.ByName['LOCALIDAD'].AsString := EFLocalidad.Text;
        ExecQuery;
        ELocalidad.Text := FieldByName['TITULO'].AsString;
        ECodigoPostal.Text := FieldByName['CODPOSTAL'].AsString;
        EProvincia.Text := FieldByName['PROVINCIA'].AsString;
        EPais.Text := FieldByName['C_PAIS'].AsString;
        ETituloPais.Text := FieldByName['PAIS'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Para que verifique si el NIF es correcto
  ENifChange(Sender);
end;

procedure TFMCreaClienteRapido.ButtCrearClienteClick(Sender: TObject);
var
  Tercero : integer;
begin
  inherited;
  Tercero := DMCreaClienteRapido.CrearTercero(ENombre.Text, ENif.Text, EDireccion.Text, EDireccion2.Text, EFLocalidad.Text, ETelefono01.Text, ETelefono02.Text, ETelefax.Text, EEmail.Text, MNotas.Lines);
  Cliente := DMCreaClienteRapido.CrearCliente(Tercero);
  ModalResult := mrOk;
end;

function TFMCreaClienteRapido.DameCliente: integer;
begin
  Result := 0;
  if ShowModal = mrOk then
     Result := Cliente;
end;

end.
