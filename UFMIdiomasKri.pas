unit UFMIdiomasKri;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, Mask, DBCtrls, ULFDBEdit, StdCtrls,
  ULFLabel, ULFDBMemo, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox,
  ExtActns, StdActns, ULFEdit;

type
  TFMIdiomasKri = class(TFPEdit)
     PNLDatos: TLFPanel;
     LIdioma: TLFLabel;
     DBEIdioma: TLFDbedit;
     DBETitulo: TLFDbedit;
     PNLNotasKriL: TLFPanel;
     LNotas: TLFLabel;
     LNotasInternas: TLFLabel;
     DBRENotas: TDBRichEdit;
     TBRichNotas: TLFToolBar;
     TButtNotasNegrita: TToolButton;
     TButtNotasItalica: TToolButton;
     TButtNotasSubrayado: TToolButton;
     ToolButton13: TToolButton;
     TButtNotasAlinIzq: TToolButton;
     TButtNotasAlinCent: TToolButton;
     TButtNotasAlinDer: TToolButton;
     ToolButton17: TToolButton;
     TButtNotasBullets: TToolButton;
     ToolButton19: TToolButton;
     PNLTamano: TLFPanel;
     EFontSizeNotas: TLFEdit;
     UpDown1: TUpDown;
     DBRENotasInternas: TDBRichEdit;
     DBCBIdiomaPorDefecto: TLFDBCheckBox;
     procedure EFontSizeNotasChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBRENotasEnter(Sender: TObject);
     procedure DBRENotasInternasEnter(Sender: TObject);
     procedure DBRENotasSelectionChange(Sender: TObject);
     procedure DBRENotasInternasSelectionChange(Sender: TObject);
  private
     { Private declarations }
     FUpdating: boolean;
     RichEditConFoco: TDBRichEdit;
  public
     { Public declarations }
  end;

var
  FMIdiomasKri : TFMIdiomasKri;

implementation

uses UDMIdiomasKri, UFormGest, UDMMain, UFMain;

{$R *.dfm}

procedure TFMIdiomasKri.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMIdiomasKri, DMIdiomasKri);
  FUpdating := False;
  RichEditConFoco := DBRENotas;
  NavMain.DataSource := DMIdiomasKri.DSQMIdiomas;
  CEMain.DataSource := DMIdiomasKri.DSQMIdiomas;
  DBGMain.DataSource := DMIdiomasKri.DSQMIdiomas;
  G2KTableLoc.DataSource := DMIdiomasKri.DSQMIdiomas;
end;

procedure TFMIdiomasKri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMIdiomasKri);
end;

procedure TFMIdiomasKri.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMIdiomasKri.EFontSizeNotasChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if (RichEditConFoco <> nil) then
     with RichEditConFoco do
     begin
        if SelLength > 0 then
           SelAttributes.Size := StrToInt(EFontSizeNotas.Text)
        else
           DefAttributes.Size := StrToInt(EFontSizeNotas.Text);
     end;
end;

procedure TFMIdiomasKri.DBRENotasEnter(Sender: TObject);
begin
  inherited;
  RichEditConFoco := DBRENotas;
end;

procedure TFMIdiomasKri.DBRENotasInternasEnter(Sender: TObject);
begin
  inherited;
  RichEditConFoco := DBRENotasInternas;
end;

procedure TFMIdiomasKri.DBRENotasSelectionChange(Sender: TObject);
begin
  inherited;
  try
     FUpdating := True;
     with DBRENotas.Paragraph do
     begin
        EFontSizeNotas.Text := IntToStr(DBRENotas.SelAttributes.Size);
     end;
  finally
     FUpdating := False;
  end;
end;

procedure TFMIdiomasKri.DBRENotasInternasSelectionChange(Sender: TObject);
begin
  inherited;
  try
     FUpdating := True;
     with DBRENotasInternas.Paragraph do
     begin
        EFontSizeNotas.Text := IntToStr(DBRENotasInternas.SelAttributes.Size);
     end;
  finally
     FUpdating := False;
  end;
end;

end.
