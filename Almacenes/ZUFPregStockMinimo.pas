{ TODO :
Unir codigo de ZUDMR... y UDMRStockMinimo
Unir codigo de ZUFPreg... y UFPregStockMinimo }

unit ZUFPregStockMinimo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ufpeditlistado, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, ActnList, ComCtrls, ToolWin,
  ULFCheckBox, ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl,
  ULFToolBar, TFlatCheckBoxUnit, ULFEditFind2000, rxToolEdit, ULFEdit,
  ULFLabel, rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TZFPregStockMinimo = class(TFPEditListadoSimple)
     PNLStockMin: TLFPanel;
     GBArticulo: TGroupBox;
     GBFamilia: TGroupBox;
     LDesdeFamilia: TLFLabel;
     LHastaFamilia: TLFLabel;
     EFFamilia_H: TLFEditFind2000;
     EFFamilia_D: TLFEditFind2000;
     EF2000Filtra: TEntornoFind2000;
     EFamiliaDesde: TLFEdit;
     EFamiliaHasta: TLFEdit;
     LDesdeArticulo: TLFLabel;
     LHastaArticulo: TLFLabel;
     EFArticulo_D: TLFEditFind2000;
     EFArticulo_H: TLFEditFind2000;
     EArticuloDesde: TLFEdit;
     EArticuloHasta: TLFEdit;
     TButtConfiguracionRapida: TToolButton;
     TButtMultiCanal: TToolButton;
     GBAlmacen: TGroupBox;
     LAlmacen: TLFLabel;
     EFSelAlmacen: TLFEditFind2000;
     EAlmacenDesc: TLFEdit;
     CBStockVirtual: TLFCheckBox;
     AMultiSeleccion: TAction;
     GBDatos: TGroupBox;
     LBLFechaListado: TLFLabel;
     EComentario: TLFEdit;
     DTPFechaListado: TDateEdit;
     LBLComentario: TLFLabel;
     LAlmacen2: TLFLabel;
     EFSelAlmacen2: TLFEditFind2000;
     EAlmacen2Desc: TLFEdit;
     GBCanal: TGroupBox;
     LDesdeCanal: TLFLabel;
     LHastaCanal: TLFLabel;
     EFCanalD: TLFEditFind2000;
     EFCanalH: TLFEditFind2000;
     ECanalD: TLFEdit;
     ECanalH: TLFEdit;
     procedure ARecargarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFSelAlmacenChange(Sender: TObject);
     procedure EFArticulo_DChange(Sender: TObject);
     procedure EFArticulo_HChange(Sender: TObject);
     procedure EFFamilia_DChange(Sender: TObject);
     procedure EFFamilia_HChange(Sender: TObject);
     procedure EFArticulo_DBusqueda(Sender: TObject);
     procedure EFArticulo_HBusqueda(Sender: TObject);
     procedure EFFamilia_DBusqueda(Sender: TObject);
     procedure EFFamilia_HBusqueda(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AMultiSeleccionExecute(Sender: TObject);
     procedure EFSelAlmacen2Change(Sender: TObject);
     procedure EFCanalDChange(Sender: TObject);
     procedure EFCanalHChange(Sender: TObject);
  private
     { Private declarations }
     ListaCanales, ListaAlm: TStringList;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  ZFPregStockMinimo : TZFPregStockMinimo;

implementation

{$R *.DFM}

uses ZUDMRStockMinimo, UEntorno, UFormGest, UUtiles, UDameDato, UFMultiSeleccion, UDMListados, UFMain,
  UDMMain, HYFIBQuery;

procedure TZFPregStockMinimo.FormCreate(Sender: TObject);
begin
  inherited;
  ListaCanales := TStringList.Create;
  ListaAlm := TStringList.Create;
  AbreData(TZDMRStockMinimo, ZDMRStockMinimo);
  EF2000Filtra.Empresa := REntorno.Empresa;
  ARecargarExecute(Sender); // Calcula los límites

  FMain.AddComponentePunto(EFArticulo_D);
  FMain.AddComponentePunto(EFArticulo_H);
  Grupo := 9004;
  Listado := ZDMRStockMinimo.frStockMinimo;
  ListadoFR3 := ZDMRStockMinimo.frxStockMinimo;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TZFPregStockMinimo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ListaCanales.Free;
  ListaAlm.Free;
  FMain.DelComponentePunto(EFArticulo_D);
  FMain.DelComponentePunto(EFArticulo_H);
  CierraData(ZDMRStockMinimo);
end;

procedure TZFPregStockMinimo.ARecargarExecute(Sender: TObject);
var
  sMin, sMax : string;
  iMin, iMax : integer;
begin
  EFSelAlmacen.Text := REntorno.AlmacenDefecto;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ALMACEN_LAN FROM PRO_CONSTANTES ');
        SQL.Add(' WHERE EMPRESA = ?EMPRESA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        EFSelAlmacen2.Text := FieldByName['ALMACEN_LAN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DameMinMax('ART', sMin, sMax);
  EFArticulo_D.Text := sMin;
  EFArticulo_H.Text := sMax;

  DameMinMax('FAM', sMin, sMax);
  EFFamilia_D.Text := sMin;
  EFFamilia_H.Text := sMax;

  DameMinMax('CAN', iMin, iMax);
  EFCanalD.Text := IntToStr(iMin);
  EFCanalH.Text := IntToStr(iMax);

  ListaCanales.Clear;
  ListaCanales.Add(REntorno.CanalStr);

  ListaAlm.Clear;
  ListaAlm.Add(REntorno.AlmacenDefecto);

  DTPFechaListado.Date := REntorno.FechaTrabSH;
  EComentario.Text := '';
end;

procedure TZFPregStockMinimo.EFSelAlmacenChange(Sender: TObject);
begin
  EAlmacenDesc.Text := DameTituloAlmacen(EFSelAlmacen.Text);
end;

procedure TZFPregStockMinimo.EFArticulo_DChange(Sender: TObject);
begin
  EArticuloDesde.Text := DameTituloArticulo(EFArticulo_D.Text);
end;

procedure TZFPregStockMinimo.EFArticulo_HChange(Sender: TObject);
begin
  EArticuloHasta.Text := DameTituloArticulo(EFArticulo_H.Text);
end;

procedure TZFPregStockMinimo.EFFamilia_DChange(Sender: TObject);
begin
  EFamiliaDesde.Text := DameTituloFamilia(EFFamilia_D.Text);
end;

procedure TZFPregStockMinimo.EFFamilia_HChange(Sender: TObject);
begin
  EFamiliaHasta.Text := DameTituloFamilia(EFFamilia_H.Text);
end;

procedure TZFPregStockMinimo.EFArticulo_DBusqueda(Sender: TObject);
begin
  EFArticulo_D.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''' +
     ' AND FAMILIA>=''' + EFFamilia_D.Text + ''' AND FAMILIA<=''' + EFFamilia_H.Text + '''' +
     ' AND CONTROL_STOCK=1';
end;

procedure TZFPregStockMinimo.EFArticulo_HBusqueda(Sender: TObject);
begin
  EFArticulo_H.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''' +
     ' AND FAMILIA>=''' + EFFamilia_D.Text + ''' AND FAMILIA<=''' + EFFamilia_H.Text + '''' +
     ' AND CONTROL_STOCK=1';
end;

procedure TZFPregStockMinimo.EFFamilia_DBusqueda(Sender: TObject);
begin
  EFFamilia_D.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TZFPregStockMinimo.EFFamilia_HBusqueda(Sender: TObject);
begin
  EFFamilia_H.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TZFPregStockMinimo.FormShow(Sender: TObject);
begin
  EFSelAlmacen.SetFocus;
end;

procedure TZFPregStockMinimo.AMultiSeleccionExecute(Sender: TObject);
var
  Almacen : string;
  Canal : integer;
begin
  Almacen := EFSelAlmacen.Text;
  Canal := REntorno.Canal;

  // TFMultiSeleccion.Create(Self).Mostrar(Canal, DMRStockMinimo.Almacen, ListaCanales, ListaAlm, 1);
  TFMultiSeleccion.Create(Self).Mostrar(Canal, Almacen, ListaCanales, ListaAlm, 1);

  if (Almacen = 'EditFind') then
  begin
     EFSelAlmacen.Text := REntorno.AlmacenDefecto;
     ListaAlm.Add(REntorno.AlmacenDefecto);
  end
  else
  begin
     EFSelAlmacen.Text := Almacen;
  end;
end;

procedure TZFPregStockMinimo.EFSelAlmacen2Change(Sender: TObject);
begin
  inherited;
  EAlmacen2Desc.Text := DameTituloAlmacen(EFSelAlmacen2.Text);
end;

procedure TZFPregStockMinimo.EFCanalDChange(Sender: TObject);
begin
  inherited;
  ECanalD.Text := DameTituloCanal(StrToInt(EFCanalD.Text));
end;

procedure TZFPregStockMinimo.EFCanalHChange(Sender: TObject);
begin
  inherited;
  ECanalH.Text := DameTituloCanal(StrToInt(EFCanalH.Text));
end;

procedure TZFPregStockMinimo.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  DMListados.DatosInforme(DTPFechaListado.Date, EComentario.Text);

  ZDMRStockMinimo.CalculaInforme(REntorno.Canal, ListaCanales, ListaAlm, EFSelAlmacen.Text, EFSelAlmacen2.Text,
     EFArticulo_D.Text, EFArticulo_H.Text, EFFamilia_D.Text, EFFamilia_H.Text,
     CBStockVirtual.Checked, Modo, StrToInt(EFCanalD.Text), StrToInt(EFCanalH.Text));
end;

end.
