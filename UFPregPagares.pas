unit UFPregPagares;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFDBEdit, ULFPanel, ULFToolBar, ULFEditFind2000, ULFLabel,
  UFPEditListadoSimple, rxPlacemnt, ULFFormStorage, ULFEdit;

type
  TFPregPagares = class(TFPEditListadoSimple)
     LblPagareDesde: TLFLabel;
     LBLPagareHasta: TLFLabel;
     EFPagare_Hasta: TLFEditFind2000;
     EPagareDesde: TLFEdit;
     EPagareHasta: TLFEdit;
     EFPagare_desde: TLFEditFind2000;
     TBButtConfigurar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFPagare_DesdeChange(Sender: TObject);
     procedure EFpagare_HastaChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Mostrar(Pagare: string);
  end;

var
  FPregPagares : TFPregPagares;

implementation

{$R *.DFM}

uses UEntorno, UUtiles, UDMLSTPagares, UDMMain;

procedure TFPregPagares.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLSTPagares, DMLSTPagares);

  Grupo := 102;
  Listado := DMLSTPagares.frPagares;
  ListadoHYR := DMLSTPagares.HYPagares;
  ListadoHYM := nil;
  ListadoFR3 := DMLSTPagares.frxPagares;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  EFPagare_Desde.Tabla_a_buscar := 'VER_PAGARES';
  EFPagare_Hasta.Tabla_a_buscar := 'VER_PAGARES';

  EFPagare_Desde.OrdenadoPor.Text := 'PAGARE';
  EFPagare_Hasta.OrdenadoPor.Text := 'PAGARE';
end;

procedure TFPregPagares.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLSTPagares);
end;

procedure TFPregPagares.Mostrar(Pagare: string);
begin
  ARecargar.Execute;

  if (Pagare > '') then
  begin
     EFPagare_Desde.Text := Pagare;
     EFPagare_Hasta.Text := Pagare;

     EFPagare_DesdeChange(Self);
     EFPagare_HastaChange(Self);
  end;

  ShowModal;
end;

procedure TFPregPagares.EFPagare_DesdeChange(Sender: TObject);
begin
  EPagareDesde.Text := DMLstPagares.DamePagare(EFPagare_Desde.Text);
end;

procedure TFPregPagares.EFPagare_HastaChange(Sender: TObject);
begin
  EPagareHasta.Text := DMLstPagares.DamePagare(EFPagare_Hasta.Text);
end;

procedure TFPregPagares.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLSTPagares.MostrarListado(EFPagare_Desde.Text, EFPagare_Hasta.Text, Modo);
end;

procedure TFPregPagares.ARecargarExecute(Sender: TObject);
var
  Desde, Hasta : string;
begin
  inherited;

  DMLSTPagares.DameMinMaxPagare(Desde, Hasta);

  EFPagare_Desde.Text := Desde;
  EFPagare_Hasta.Text := Hasta;

  EFPagare_DesdeChange(Self);
  EFPagare_HastaChange(Self);
end;

end.
