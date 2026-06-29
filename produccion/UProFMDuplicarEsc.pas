unit UProFMDuplicarEsc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, UFormGest, Buttons,
  ULFEditFind2000, ULFEdit, ULFToolBar, ULFPanel, FIBDatabase,
  UFIBModificados, ULFLabel, TFlatCheckBoxUnit, ULFCheckBox;

type
  TProFMDuplicarEsc = class(TG2KForm)
     PnlDuplicar: TLFPanel;
     ToolBar1: TLFToolBar;
     TBSalir: TToolButton;
     LblOrigen: TLFLabel;
     EDescOrigen: TLFEdit;
     LblDestino: TLFLabel;
     EFEscDestino: TLFEditFind2000;
     EDescDestino: TLFEdit;
     EEscOrigen: TLFEdit;
     BBDuplicar: TBitBtn;
     LFCBInsertMasivo: TLFCheckBox;
     procedure TBSalirClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFEscDestinoChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure BBDuplicarClick(Sender: TObject);
     procedure LFCBInsertMasivoChange(Sender: TObject);
  private
     { Private declarations }
     TipoOrigen, TipoDestino, Compuesto: string;
     Escandallo, IdDetalleOfertaV: integer;
  public
     { Public declarations }
     procedure Mostrar(ATipoOrigen, ATipoDestino: string; AEscandallo, AIdDetalleOfertaV: integer; ACompuesto: string; EscandalloOrigen: integer; EscandalloDestino: string);
  end;

var
  ProFMDuplicarEsc : TProFMDuplicarEsc;

implementation

uses UDMMain, UProDMDuplicarEsc, UEntorno, UUtiles, UDameDato, UFMain;

{$R *.dfm}

procedure TProFMDuplicarEsc.FormCreate(Sender: TObject);
{var
  a : string;}
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMDuplicarEsc, ProDMDuplicarEsc);
  EFEscDestino.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';

  // Asigno Imagenes a BitdBtn
  GetBitmapFromImageList(BBDuplicar, 1, DMMain.ILMain_Ac, 37);
end;

procedure TProFMDuplicarEsc.TBSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TProFMDuplicarEsc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ProDMDuplicarEsc);
  Action := caFree;
end;

procedure TProFMDuplicarEsc.EFEscDestinoChange(Sender: TObject);
begin
  EDescDestino.Text := DameTituloArticulo(EFEscDestino.Text);
end;

procedure TProFMDuplicarEsc.BBDuplicarClick(Sender: TObject);
begin
  ProDMDuplicarEsc.Duplicar(TipoOrigen, TipoDestino, EFEscDestino.Text, Compuesto, Escandallo, IdDetalleOfertaV, LFCBInsertMasivo.Checked);
  Close;
end;

procedure TProFMDuplicarEsc.LFCBInsertMasivoChange(Sender: TObject);
begin
  //  Abre formulario de artículos
  if (LFCBInsertMasivo.Checked) then
  begin
     LBLDestino.Visible := False;
     EFEscDestino.Visible := False;
     EDescDestino.Visible := False;
     FMain.EjecutaAccion(FMain.AArticulos);
  end
  else
  begin
     LBLDestino.Visible := True;
     EFEscDestino.Visible := True;
     EDescDestino.Visible := True;
  end;
end;

procedure TProFMDuplicarEsc.Mostrar(ATipoOrigen, ATipoDestino: string; AEscandallo, AIdDetalleOfertaV: integer; ACompuesto: string; EscandalloOrigen: integer; EscandalloDestino: string);
begin
  EEscOrigen.Text := IntToStr(EscandalloOrigen);
  EDescOrigen.Text := DameTituloArticulo(ACompuesto);
  EFEscDestino.Text := EscandalloDestino;
  TipoOrigen := ATipoOrigen;
  TipoDestino := ATipoDestino;
  Escandallo := AEscandallo;
  Compuesto := ACompuesto;
  //AIdDetalleOfertaV := AIdDetalleOfertaV;
end;

end.
