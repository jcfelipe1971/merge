unit UFPregStockResTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, StdCtrls, Mask,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  ULFActionList, ULFPageControl, ULFToolBar, ULFEdit, ULFLabel, ULFDBEdit,
  ULFEditFind2000, ULFComboBox, rxToolEdit, ULFDateEdit, rxPlacemnt,
  ULFFormStorage, ULFPanel, UFPEditListadoSimple;

type
  TFPregStockResTallas = class(TFPEditListadoSimple)
     AMultiseleccion: TAction;
     TButtMultiseleccion: TToolButton;
     PNLLimites: TLFPanel;
     LDesdeReferencia: TLFLabel;
     LHastaReferencia: TLFLabel;
     EFModelo_D: TLFEditFind2000;
     EFModelo_H: TLFEditFind2000;
     DBEModeloDesde: TLFDBEdit;
     DBEModeloHasta: TLFDBEdit;
     GBGrupos: TGroupBox;
     LDesdeGrupo: TLFLabel;
     LHastaGrupo: TLFLabel;
     EFGrupoDesde: TLFEditFind2000;
     EFGrupoHasta: TLFEditFind2000;
     DBEGrupoDesde: TLFDBEdit;
     DBEGrupoHasta: TLFDBEdit;
     GBAlmacen: TGroupBox;
     CBStock: TLFComboBox;
     LAlmacen: TLFLabel;
     EFSelAlmacen: TLFEditFind2000;
     EAlmacenDesc: TLFEdit;
     TBConRap: TToolButton;
     LTipo: TLFLabel;
     LFechaCalculo: TLFLabel;
     DEFechaCalculo: TLFDateEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFmodelo_DChange(Sender: TObject);
     procedure EFmodelo_HChange(Sender: TObject);
     procedure EFGrupoDesdeChange(Sender: TObject);
     procedure EFGrupoHastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AMultiseleccionExecute(Sender: TObject);
     procedure EFSelAlmacenChange(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
  private
     { Private declarations }
     Canal: integer;
     ListaCanales: TStringList;
     procedure DatosListado;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregStockResTallas : TFPregStockResTallas;

implementation

uses UDMLstStockResTallas, UEntorno, UFormGest, UUtiles,
  UFMultiSeleccion, UDMMain, DateUtils, UDameDato;

{$R *.dfm}

procedure TFPregStockResTallas.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLstStockResTallas, DMLstStockResTallas);
  ListaCanales := TStringList.Create;
  Canal := REntorno.Canal;
  CBStock.ItemIndex := 0;
  ARecargarExecute(Sender);

  Grupo := 5000;
  Listado := DMLstStockResTallas.frStockResTallas;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregStockResTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMLstStockResTallas);
end;

procedure TFPregStockResTallas.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaCanales.Free;
end;

procedure TFPregStockResTallas.EFmodelo_DChange(Sender: TObject);
begin
  DMLstStockResTallas.ActualizaModeloDesde(EFmodelo_D.Text);
end;

procedure TFPregStockResTallas.EFmodelo_HChange(Sender: TObject);
begin
  DMLstStockResTallas.ActualizaModeloHasta(EFmodelo_H.Text);
end;

procedure TFPregStockResTallas.EFGrupoDesdeChange(Sender: TObject);
begin
  DMLstStockResTallas.ActualizaGrupoDesde(EFGrupoDesde.Text);
end;

procedure TFPregStockResTallas.EFGrupoHastaChange(Sender: TObject);
begin
  DMLstStockResTallas.ActualizaGrupoHasta(EFGrupoHasta.Text);
end;

procedure TFPregStockResTallas.ARecargarExecute(Sender: TObject);
begin
  DMLstStockResTallas.Rangos;
  EFmodelo_D.Text := DMLstStockResTallas.ModeloDesde;
  EFmodelo_H.Text := DMLstStockResTallas.ModeloHasta;
  EFGrupoDesde.Text := DMLstStockResTallas.GrupoDesde;
  EFGrupoHasta.Text := DMLstStockResTallas.GrupoHasta;
  EFSelAlmacen.Text := DMLstStockResTallas.Almacen;
  CBStock.ItemIndex := 0;
  DEFechaCalculo.Date := Today;
end;

procedure TFPregStockResTallas.AMultiseleccionExecute(Sender: TObject);
begin
  TFMultiSeleccion.Create(Self).MostrarCanal(Canal, ListaCanales);
end;

procedure TFPregStockResTallas.EFSelAlmacenChange(Sender: TObject);
begin
  EAlmacenDesc.Text := DameTituloAlmacen(EFSelAlmacen.Text);
end;

procedure TFPregStockResTallas.DatosListado;
begin
  with DMLstStockResTallas do
  begin
     ModeloDesde := EFmodelo_D.Text;
     ModeloHasta := EFmodelo_H.Text;
     GrupoDesde := EFGrupoDesde.Text;
     GrupoHasta := EFGrupoHasta.Text;
     Almacen := EFSelAlmacen.Text;
     TipoStock := CBStock.ItemIndex;
     FCanal := Canal;
     FechaCalculo := DEFechaCalculo.Date;
  end;
end;

procedure TFPregStockResTallas.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DatosListado;
  DMLstStockResTallas.MostrarListado(Modo, ListaCanales);
end;

end.
