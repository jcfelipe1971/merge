unit UProFMMostrarStock;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ToolWin, ComCtrls, ULFToolBar, ExtCtrls,
  ActnList, ULFActionList, StdCtrls, ULFLabel, Mask, DBCtrls,
  Buttons, ULFPanel, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, TFlatCheckBoxUnit, ULFCheckBox;

type
  TProFMMostrarStock = class(TG2KForm)
     DBGStock: TDBGridFind2000;
     PNLMain: TLFPanel;
     LCancelarOSeguir: TLFLabel;
     BSeguir: TBitBtn;
     BCancelar: TBitBtn;
     LFMuestraTodos: TLFCheckBox;
     PNLBotones: TLFPanel;
     procedure BSeguirClick(Sender: TObject);
     procedure BCancelarClick(Sender: TObject);
     procedure LFMuestraTodosChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMMostrarStock : TProFMMostrarStock;

implementation

uses UProDMOrden, UDMMain, UUtiles;

{$R *.dfm}

procedure TProFMMostrarStock.BSeguirClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TProFMMostrarStock.BCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TProFMMostrarStock.LFMuestraTodosChange(Sender: TObject);
begin
  ProDMOrden.CambiaSelectTmpStock(LFMuestraTodos.Checked);
end;

procedure TProFMMostrarStock.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  LFMuestraTodosChange(Sender);

  // Asigno Imagenes a BitBtn
  GetBitmapFromImageList(BSeguir, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BCancelar, 1, DMMain.ILMain_Ac, 20);
end;

procedure TProFMMostrarStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ProDMOrden.QMTmpStock.Close;
end;

end.
