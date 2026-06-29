unit UFMRecalculoStocksTotales;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, ActnList, ULFActionList, rxPlacemnt, ULFFormStorage,
  ToolWin, ComCtrls, ULFToolBar, TFlatCheckBoxUnit, ULFCheckBox, ExtCtrls, UFormGest,
  ULFPanel, DB, ULFLabel, UDMArticulos;

type
  TFMRecalculoStocksTotales = class(TG2KForm)
     PNLMain: TLFPanel;
     CBTotal: TLFCheckBox;
     CBPedidos: TLFCheckBox;
     CBPonderado: TLFCheckBox;
     TBOptions: TLFToolBar;
     FSMain: TLFFibFormStorage;
     ALMain: TLFActionList;
     ASalir: TAction;
     AProcesarTotales: TAction;
     PNLDatos: TLFPanel;
     LBLProcesando: TLFLabel;
     LArticulo: TLFLabel;
     LBLFaltan: TLFLabel;
     LFaltan: TLFLabel;
     BInterrumpir: TButton;
     CBLotes: TLFCheckBox;
     CBSerie: TLFCheckBox;
     procedure AProcesarTotalesExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure BInterrumpirClick(Sender: TObject);
  private
     { Private declarations }
     DM: TDMArticulos;
     procedure habilitar_btn(activar: boolean);
  public
     { Public declarations }
     Interrumpir: boolean;
     procedure SetDM(aDM: TDataModule);
  end;

var
  FMRecalculoStocksTotales : TFMRecalculoStocksTotales;

implementation

uses UDMMain;

{$R *.dfm}

procedure TFMRecalculoStocksTotales.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  Interrumpir := False;
  habilitar_btn(True);
end;

procedure TFMRecalculoStocksTotales.AProcesarTotalesExecute(Sender: TObject);
var
  Option : byte;
  temporal : TBookmark;
  cantidad : integer;
begin
  inherited;

  habilitar_btn(False);
  Interrumpir := False;
  Option := 0;
  {cantidad := 0; No se utiliza}
  if (CBTotal.Checked) then
     Option := Option + 1;
  if (CBPedidos.Checked) then
     Option := Option + 2;
  if (CBPonderado.Checked) then
     Option := Option + 4;
  if (CBLotes.Checked) then
     Option := Option + 8;
  if (CBSerie.Checked) then
     Option := Option + 16;

  if (Option <> 0) then
     if (Application.MessageBox(PChar(string(_('Atención : Este proceso recalculará todos los stocks de los artículos filtrados en este momento y puede tardar bastante.'))),
        PChar(string(_('Confirmación'))), mb_iconstop + mb_yesno) = id_yes) then
     begin
        with DM.QMArticulos do
        begin
           LFaltan.Caption := _('Contando...');
           Application.ProcessMessages;
           temporal := GetBookmark;
           try
              Last;
              cantidad := RecordCount;
              DisableControls;
              First;
              // recorro QMArticulos ya filtrados y recalculo stocks articulo por articulo
              while (not EOF) and (not Interrumpir) do
              begin
                 LArticulo.Caption := FieldByName('ARTICULO').AsString;
                 Application.ProcessMessages;
                 DM.RecalculaStock(Option, False);
                 Dec(cantidad);
                 LFaltan.Caption := IntToStr(cantidad);
                 Next;
              end;
              LFaltan.Caption := '0';
              GotoBookmark(temporal);
           finally
              EnableControls;
              FreeBookmark(temporal);
           end;

           if not Interrumpir then
           begin
              LArticulo.Caption := _('Terminado');
              ShowMessage(_('El Proceso terminó con éxito.'));
           end
           else
           begin
              LArticulo.Caption := _('Interrumpido');
              ShowMessage(_('El Proceso terminó con errores.'));
           end;
        end;
     end;
  habilitar_btn(True);
end;

procedure TFMRecalculoStocksTotales.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFMRecalculoStocksTotales.BInterrumpirClick(Sender: TObject);
begin
  Interrumpir := True;
  habilitar_btn(True);
end;

procedure TFMRecalculoStocksTotales.habilitar_btn(activar: boolean);
begin
  CBTotal.Enabled := activar;
  CBPedidos.Enabled := activar;
  CBPonderado.Enabled := activar;
  TBOptions.Enabled := activar;
  BInterrumpir.Enabled := not activar;
end;

procedure TFMRecalculoStocksTotales.SetDM(aDM: TDataModule);
begin
  DM := TDMArticulos(aDM);
end;

end.
