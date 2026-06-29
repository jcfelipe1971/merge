unit UFPregArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFCheckBox, ULFDBEdit, ULFPanel, ULFToolBar,
  TFlatCheckBoxUnit, ULFEditFind2000, ULFLabel, UFPEditListadoSimple,
  rxPlacemnt, ULFFormStorage;

type
  TFPregArticulos = class(TFPEditListadoSimple)
     LDesde: TLFLabel;
     LHasta: TLFLabel;
     EFArt_Desde: TLFEditFind2000;
     EFArt_Hasta: TLFEditFind2000;
     DBEArticuloDesde: TLFDbedit;
     DBEArticuloHasta: TLFDbedit;
     TButtConfRapida: TToolButton;
     ChkBOrden: TLFCheckBox;
     ChkBVender: TLFCheckBox;
     CBArticulosBaja: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArt_DesdeBusqueda(Sender: TObject);
     procedure EFArt_HastaBusqueda(Sender: TObject);
     procedure EFArt_DesdeChange(Sender: TObject);
     procedure EFArt_HastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  private
     { Private declarations }
     SWFil: integer;
  public
     { Public declarations }
     procedure ArticulosPorTarifa(SqlFiltro: TStringList; SW: integer);
  end;

var
  FPregArticulos : TFPregArticulos;

implementation

uses UDMLstTarifas, UUtiles, UEntorno, UFMListConfig;

{$R *.DFM}

procedure TFPregArticulos.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE   
  AbreData(TDMLstTarifas, DMLstTarifas);
  ARecargar.Execute;

  Grupo := 52;
  Listado := DMLstTarifas.frTarifas;
  ListadoFR3 := DMLstTarifas.frxTarifas;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstTarifas);
  Action := caFree;
end;

procedure TFPregArticulos.EFArt_DesdeBusqueda(Sender: TObject);
begin
  EFArt_Desde.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArticulos.EFArt_HastaBusqueda(Sender: TObject);
begin
  EFArt_Hasta.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregArticulos.EFArt_DesdeChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstTarifas.xArt_Desde, EFArt_Desde.Text);
end;

procedure TFPregArticulos.EFArt_HastaChange(Sender: TObject);
begin
  Actualiza_ArticuloRO(DMLstTarifas.xArt_Hasta, EFArt_Hasta.Text);
end;

procedure TFPregArticulos.ArticulosPorTarifa(SqlFiltro: TStringList; SW: integer);
begin
  SWFil := SW;
  // Modificación del SQL para el listado de artículos por tarifas filtradas */
  DMLstTarifas.ConstruirSelect(SQlFiltro);
  ShowModal;
end;

procedure TFPregArticulos.ARecargarExecute(Sender: TObject);
var
  articulo_d, articulo_h : string;
begin
  DMLstTarifas.Rangos1(articulo_d, articulo_h);
  EFArt_Desde.Text := articulo_d;
  EFArt_Hasta.Text := articulo_h;
  ChkBOrden.Checked := True;
  ChkBVender.Checked := True;
  CBArticulosBaja.Checked := False;
end;

procedure TFPregArticulos.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstTarifas.MostrarListadoFiltrado(EFArt_Desde.Text, EFArt_Hasta.Text,
     ChkBOrden.Checked,
     ChkBVender.Checked, Modo, SWFil, CBArticulosBaja.Checked);
end;

end.
