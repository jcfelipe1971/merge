unit UFPregCodArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Mask, UHYDescription, ULFHYDBDescription, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ExtCtrls,
  ULFPanel, ToolWin, ComCtrls, ULFToolBar, TFlatCheckBoxUnit, ULFCheckBox,
  ULFEdit;

type
  TFPregCodArticulo = class(TG2KForm)
     PMain: TLFPanel;
     EFArticulo: TLFEditFind2000;
     ETituloArticulo: TLFEdit;
     TBMain: TLFToolBar;
     TButtAceptar: TToolButton;
     TButtSalir: TToolButton;
     CBBorraOrigen: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFArticuloBusqueda(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure TButtAceptarClick(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
  private
     { Private declarations }
     ModoEquivalencia: boolean;
     Articulo: string;
     AlmacenStock: string;
  public
     { Public declarations }
     procedure ModoSeleccionEquivalente(aArticulo: string; Almacen: string = '');
  end;

var
  FPregCodArticulo : TFPregCodArticulo;

implementation

{$R *.dfm}

uses
  UDMMain, UFMain, UDameDato, UEntorno;

procedure TFPregCodArticulo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE 
  FMain.AddComponenteReturn(EFArticulo);
end;

procedure TFPregCodArticulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.DelComponenteReturn(EFArticulo);
end;

procedure TFPregCodArticulo.EFArticuloKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
     ModalResult := mrOk
  else
  if (Key = VK_ESCAPE) then
     ModalResult := mrCancel;
end;

procedure TFPregCodArticulo.EFArticuloBusqueda(Sender: TObject);
begin
  if (ModoEquivalencia) then
  begin
     with EFArticulo.SelectSQL do
     begin
        Clear;
        EFArticulo.OrdenadoPor.Clear;
        Add(' /* Las equivalencias de una cabecera */ ');
        Add(' SELECT D.ARTICULO_EQUIVAL AS ARTICULO, A.TITULO_LARGO AS TITULO ');
        Add(' FROM PRO_SYS_CAB_EQUIVAL C ');
        Add(' JOIN PRO_SYS_DET_EQUIVAL D ON C.EMPRESA = D.EMPRESA AND C.ID_EQUIVAL = D.ID_EQUIVAL ');
        Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO_EQUIVAL = A.ARTICULO ');
        Add(' WHERE ');
        Add(' C.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' C.ARTICULO = ''' + Articulo + ''' ');
        Add(' UNION ');
        Add(' /* Los padres de equivalencias de un detalle */ ');
        Add(' SELECT C.ARTICULO AS ARTICULO, A.TITULO_LARGO AS TITULO ');
        Add(' FROM PRO_SYS_CAB_EQUIVAL C ');
        Add(' JOIN ART_ARTICULOS A ON C.EMPRESA = A.EMPRESA AND C.ARTICULO = A.ARTICULO ');
        Add(' WHERE ');
        Add(' C.ID_EQUIVAL IN ( ');
        Add(' SELECT ID_EQUIVAL ');
        Add(' FROM PRO_SYS_DET_EQUIVAL ');
        Add(' WHERE ');
        Add(' EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' ARTICULO_EQUIVAL = ''' + Articulo + ''') ');
        Add(' UNION ');
        Add(' /* Los hermanos de equivalencias de un detalle */ ');
        Add(' SELECT D.ARTICULO_EQUIVAL AS ARTICULO, A.TITULO_LARGO AS TITULO ');
        Add(' FROM PRO_SYS_DET_EQUIVAL D ');
        Add(' JOIN ART_ARTICULOS A ON D.EMPRESA = A.EMPRESA AND D.ARTICULO_EQUIVAL = A.ARTICULO ');
        Add(' WHERE ');
        Add(' D.ARTICULO_EQUIVAL <> ''' + Articulo + ''' AND ');
        Add(' D.ID_EQUIVAL IN ( ');
        Add(' SELECT ID_EQUIVAL ');
        Add(' FROM PRO_SYS_DET_EQUIVAL ');
        Add(' WHERE ');
        Add(' EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' ARTICULO_EQUIVAL = ''' + Articulo + ''') ');
     end;
     EFArticulo.OrdenadoPor.Add('1');
  end
  else
  begin
     EFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
  end;
end;

procedure TFPregCodArticulo.EFArticuloChange(Sender: TObject);
begin
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
end;

procedure TFPregCodArticulo.TButtAceptarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFPregCodArticulo.TButtSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFPregCodArticulo.ModoSeleccionEquivalente(aArticulo: string; Almacen: string = '');
begin
  ModoEquivalencia := True;
  Articulo := aArticulo;
  EFArticulo.Filtros := [];
  EFArticulo.OrdenadoPor.Clear;
  EFArticulo.CondicionBusqueda := '';
  CBBorraOrigen.Visible := False;
  AlmacenStock := Almacen;
end;

end.
