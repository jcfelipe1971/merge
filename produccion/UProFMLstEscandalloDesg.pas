unit UProFMLstEscandalloDesg;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, Mask, rxToolEdit, StdCtrls,
  ExtCtrls, ComCtrls, ToolWin, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFActionList, ULFComboBox, ULFEdit,
  ULFPanel, ULFPageControl, ULFToolBar, ULFDBEdit, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage;

type
  TProFMLstEscandalloDesg = class(TFPEditListadoSfg)
     GBOrden: TGroupBox;
     LblOrden: TLFLabel;
     LCompuesto: TLFLabel;
     EFEscandallo: TLFEditFind2000;
     DBEArtOrd: TLFDbedit;
     EArtDesc: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFEscandalloChange(Sender: TObject);
     procedure EFEscandalloKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure ARecargarExecute(Sender: TObject);
     procedure DBEArtOrdChange(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Inicializa(TipoListado: integer);
  end;

var
  ProFMLstEscandalloDesg : TProFMLstEscandalloDesg;

implementation

uses UDMMain, UProDMLstEscandalloDesg, UFormGest, UEntorno, UDameDato;

{$R *.dfm}

procedure TProFMLstEscandalloDesg.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLstEscandalloDesg, ProDMLstEscandalloDesg);

  Grupo := 8066;
  Listado := ProDMLstEscandalloDesg.frListadoEG;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := ProDMLstEscandalloDesg.frxListadoEG;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TProFMLstEscandalloDesg.FormShow(Sender: TObject);
begin
  inherited;
  TDPFechaListado.Date := Date;
  TButtPrevisualizar.Enabled := False;
  EFEscandallo.Clear;
  EFEscandallo.SetFocus;
end;

procedure TProFMLstEscandalloDesg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMLstEscandalloDesg);
end;

procedure TProFMLstEscandalloDesg.EFEscandalloChange(Sender: TObject);
begin
  inherited;
  if (EFEscandallo.Text <> '') then
  begin
     ProDMLstEscandalloDesg.CambiaEscandallo(StrToInt(EFEscandallo.Text));
     TButtPrevisualizar.Enabled := True;
  end;
end;

procedure TProFMLstEscandalloDesg.EFEscandalloKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  TButtPrevisualizar.Enabled := ((Sender as TEdit).Text <> '');
end;

procedure TProFMLstEscandalloDesg.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  inherited;
  if (EFEscandallo.Text <> '') then
     ProDMLstEscandalloDesg.MostrarListado(Modo, Grupo, StrToIntDef(EFEscandallo.Text, 0), EComentario.Text, TDPFechaListado.Date);
end;

procedure TProFMLstEscandalloDesg.ARecargarExecute(Sender: TObject);
begin
  inherited;
  TDPFechaListado.Date := Date;
  EFEscandallo.Clear;
  EFEscandallo.SetFocus;
end;

procedure TProFMLstEscandalloDesg.DBEArtOrdChange(Sender: TObject);
begin
  inherited;
  EArtDesc.Text := DameTituloArticulo(DBEArtOrd.Text);
end;

procedure TProFMLstEscandalloDesg.Inicializa(TipoListado: integer);
begin
  if (TipoListado = 1) then
  begin
     Grupo := 8066;
     Self.Caption := _('Listado de escandallo desglosado');
  end
  else
  begin
     Grupo := 8068;
     Self.Caption := _('Listado de escandallo desglosado Ingenieria');
  end;
end;

end.
