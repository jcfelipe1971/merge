unit UFMLstArtEscandallo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEditListado, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, UEditPanel, ToolWin, ActnList, Mask, DBCtrls,
  UHYEdits, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple, ULFEdit;

type
  TFMLstArtEscandallo = class(TFPEditListadoSimple)
     PNLMain: TLFPanel;
     EFArt_Hasta: TLFEditFind2000;
     EFArt_Desde: TLFEditFind2000;
     LDesde: TLFLabel;
     LHasta: TLFLabel;
     EArticulo_D: TLFEdit;
     EArticulo_H: TLFEdit;
     TButtConfRapida: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure ARecargaExecute(Sender: TObject);
     procedure EFArt_DesdeChange(Sender: TObject);
     procedure EFArt_HastaChange(Sender: TObject);
     procedure EFArt_DesdeBusqueda(Sender: TObject);
     procedure EFArt_HastaBusqueda(Sender: TObject);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Inicializar(Desde, Hasta: string);
  end;

var
  FMLstArtEscandallo : TFMLstArtEscandallo;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFormGest, UDMLstArtEscandallo;

{$R *.DFM}

procedure TFMLstArtEscandallo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstArtEscandallo, DMLstArtEscandallo);
  ARecargaExecute(Sender);

  Grupo := 35;
  Listado := DMLstArtEscandallo.frEscandallo;
  ListadoFR3 := DMLstArtEscandallo.frxEscandallo;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFMLstArtEscandallo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstArtEscandallo);
end;

procedure TFMLstArtEscandallo.ARecargaExecute(Sender: TObject);
var
  Min, Max : string;
begin
  inherited;
  DameMinMax('ART', Min, Max);
  EFArt_Desde.Text := Min;
  EFArt_Hasta.Text := Max;
end;

// Actualizar el artículo
procedure TFMLstArtEscandallo.EFArt_DesdeChange(Sender: TObject);
begin
  EArticulo_D.Text := DameTituloArticulo(EFArt_Desde.Text);
end;

procedure TFMLstArtEscandallo.EFArt_HastaChange(Sender: TObject);
begin
  EArticulo_H.Text := DameTituloArticulo(EFArt_Hasta.Text);
end;

// Filtrar artículos del sistema
procedure TFMLstArtEscandallo.EFArt_DesdeBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMLstArtEscandallo.EFArt_HastaBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMLstArtEscandallo.FormShow(Sender: TObject);
begin
  EFArt_Desde.SetFocus;
end;

procedure TFMLstArtEscandallo.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMLstArtEscandallo.MostrarListado(EFArt_Desde.Text, EFArt_Hasta.Text, Modo);
end;

procedure TFMLstArtEscandallo.Inicializar(Desde, Hasta: string);
begin
  EFArt_Desde.Text := Desde;
  EFArt_Hasta.Text := Desde;
end;

end.
