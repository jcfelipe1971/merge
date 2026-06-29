unit UFPregMovManStock;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls,
  Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFComboBox,
  ULFDBEdit, ULFPanel, ULFActionList, ULFPageControl, ULFToolBar,
  ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFPregMovManStock = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     EFArticuloD: TLFEditFind2000;
     EFArticuloH: TLFEditFind2000;
     DBEArticuloD: TLFDbedit;
     DBEArticuloH: TLFDbedit;
     EFFamiliaD: TLFEditFind2000;
     EFFamiliaH: TLFEditFind2000;
     DBEFamiliaD: TLFDbedit;
     DBEFamiliaH: TLFDbedit;
     LDesdeFamilia: TLFLabel;
     LDesdeArticulo: TLFLabel;
     LHastaFamilia: TLFLabel;
     LHastaArticulo: TLFLabel;
     CBCanalOrigenD: TLFComboBox;
     CBCanalOrigenH: TLFComboBox;
     CBCanalDestinoD: TLFComboBox;
     CBCanalDestinoH: TLFComboBox;
     LDesdeCanalOrigen: TLFLabel;
     LDesdeCanalDestino: TLFLabel;
     LHastaCanalOrigen: TLFLabel;
     LHastaCanalDestino: TLFLabel;
     CBAlmacenOrigenD: TLFComboBox;
     CBAlmacenOrigenH: TLFComboBox;
     CBAlmacenDestinoD: TLFComboBox;
     CBAlmacenDestinoH: TLFComboBox;
     LDesdeAlmacenOrigen: TLFLabel;
     LDesdeAlmacenDestino: TLFLabel;
     LHastaAlmacenOrigen: TLFLabel;
     LHastaAlmacenDestino: TLFLabel;
     RGTipos: TRadioGroup;
     RGOrden: TRadioGroup;
     procedure EFArticuloDBusqueda(Sender: TObject);
     procedure EFArticuloHBusqueda(Sender: TObject);
     procedure EFFamiliaDBusqueda(Sender: TObject);
     procedure EFFamiliaHBusqueda(Sender: TObject);
     procedure EFFamiliaDChange(Sender: TObject);
     procedure EFFamiliaHChange(Sender: TObject);
     procedure EFArticuloDChange(Sender: TObject);
     procedure EFArticuloHChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure TButtRecargarClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
     Cadena: string;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
     procedure GeneraSQL;
     procedure Carga;
  public
     { Public declarations }
  end;

var
  FPregMovManStock : TFPregMovManStock;

implementation

uses UFormGest, UDMMain, UEntorno, UFMDocInfoStocks, UDMLSTMovManStock,
  UUtiles, UFMListConfig, UDMMovManStock, URellenaLista;

{$R *.dfm}

procedure TFPregMovManStock.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMLSTMovManStock, DMLSTMovManStock);

  RellenaCanales(CBCanalOrigenD.Items);
  RellenaCanales(CBCanalOrigenH.Items);
  RellenaCanales(CBCanalDestinoD.Items);
  RellenaCanales(CBCanalDestinoH.Items);
  RellenaAlmacenes(CBAlmacenOrigenD.Items);
  RellenaAlmacenes(CBAlmacenDestinoD.Items);
  RellenaAlmacenes(CBAlmacenOrigenH.Items);
  RellenaAlmacenes(CBAlmacenDestinoH.Items);

  Carga;

  Grupo := 507;
  Listado := DMLSTMovManStock.FRMovManStock;
  ListadoHYR := DMLSTMovManStock.HYReport;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregMovManStock.Carga;
begin
  CBCanalOrigenD.ItemIndex := 0;
  CBCanalOrigenH.ItemIndex := 0;
  CBCanalDestinoD.ItemIndex := 0;
  CBCanalDestinoH.ItemIndex := 0;
  CBAlmacenOrigenD.ItemIndex := 0;
  CBAlmacenDestinoD.ItemIndex := 0;
  CBAlmacenOrigenH.ItemIndex := 0;
  CBAlmacenDestinoH.ItemIndex := 0;
  EFArticuloD.Text := DMLSTMovManStock.DameArticuloMin;
  EFArticuloH.Text := DMLSTMovManStock.DameArticuloMax;
  EFFamiliaD.Text := DMLSTMovManStock.DameFamiliaMin;
  EFFamiliaH.Text := DMLSTMovManStock.DameFamiliaMax;
end;

procedure TFPregMovManStock.TButtRecargarClick(Sender: TObject);
begin
  Carga;
end;

procedure TFPregMovManStock.EFArticuloDBusqueda(Sender: TObject);
begin
  EFArticuloD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregMovManStock.EFArticuloHBusqueda(Sender: TObject);
begin
  EFArticuloH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregMovManStock.EFFamiliaDBusqueda(Sender: TObject);
begin
  EFFamiliaD.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregMovManStock.EFFamiliaHBusqueda(Sender: TObject);
begin
  EFFamiliaH.CondicionBusqueda := 'familia<>''' + REntorno.FamSistema + '''';
end;

procedure TFPregMovManStock.EFFamiliaDChange(Sender: TObject);
begin
  DMLSTMovManStock.CambiaFamiliaD(EFFamiliaD.Text);
end;

procedure TFPregMovManStock.EFFamiliaHChange(Sender: TObject);
begin
  DMLSTMovManStock.CambiaFamiliaH(EFFamiliaH.Text);
end;

procedure TFPregMovManStock.EFArticuloDChange(Sender: TObject);
begin
  DMLSTMovManStock.CambiaArticuloD(EFArticuloD.Text);
end;

procedure TFPregMovManStock.EFArticuloHChange(Sender: TObject);
begin
  DMLSTMovManStock.CambiaArticuloh(EFArticuloh.Text);
end;

procedure TFPregMovManStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMLSTMovManStock);
end;

procedure TFPregMovManStock.ARecargarExecute(Sender: TObject);
begin
  Carga;
end;

procedure TFPregMovManStock.GeneraSQL;
var
  CorigenD, CorigenH, CdestinoD, CDestinoH, AOrigenD, AorigenH, ADestinoD, AdestinoH : string;
  s : TStrings;
begin
  s := TStringList.Create;
  try
     // Sentencia básica.
     s.Add(' SELECT DISTINCT C.* ');
     s.Add(' FROM GES_CABECERAS_ST C ');
     s.Add(' LEFT JOIN GES_DETALLES_ST D ');
     s.Add(' ON C.ID_ST = D.ID_ST ');
     s.Add(' LEFT JOIN ART_ARTICULOS A ');
     s.Add(' ON D.EMPRESA = A.EMPRESA AND D.ARTICULO = A.ARTICULO ');
     s.Add(' WHERE ');
     s.Add(' C.EMPRESA = ?EMPRESA AND ');
     s.Add(' C.EJERCICIO = ?EJERCICIO AND ');
     s.Add(' C.SERIE=?SERIE ');
     s.Add(' AND A.FAMILIA >= ''' + EFFamiliaD.Text + ''' ');
     s.Add(' AND A.FAMILIA <= ''' + EFFamiliaH.Text + ''' ');
     s.Add(' AND D.ARTICULO >= ''' + EFArticuloD.Text + ''' ');
     s.Add(' AND D.ARTICULO <= ''' + EFArticuloH.Text + ''' ');

     // Condiciones a añadir
     case RGtipos.ItemIndex of
        1: s.Add(' AND C.TIPO_OPERACION = ''E'' ');
        2: s.Add(' AND C.TIPO_OPERACION = ''S'' ');
        3: s.Add(' AND C.TIPO_OPERACION = ''T'' ');
     end;

     if (CBCanalOrigenD.ItemIndex <> 0) then
     begin
        CorigenD := Copy(CBCanalOrigenD.Text, 7, Length(CBCanalOrigenD.Text));
        s.Add(' AND C.CANAL_ORI >= ' + CorigenD);
     end;

     if (CBCanalOrigenH.ItemIndex <> 0) then
     begin
        CorigenH := Copy(CBCanalOrigenH.Text, 7, Length(CBCanalOrigenH.Text));
        s.Add(' AND C.CANAL_ORI <= ' + CorigenH);
     end;

     if (CBCanalDestinoD.ItemIndex <> 0) then
     begin
        CDestinoD := Copy(CBCanalDestinoD.Text, 7, Length(CBCanalDestinoD.Text));
        s.Add(' AND C.CANAL_DST >= ' + CDestinoD);
     end;

     if (CBCanalDestinoH.ItemIndex <> 0) then
     begin
        CDestinoH := Copy(CBCanalDestinoH.Text, 7, Length(CBCanalDestinoH.Text));
        s.Add(' AND C.CANAL_DST <= ' + CDestinoH);
     end;

     if (CBAlmacenOrigenD.ItemIndex <> 0) then
     begin
        AOrigenD := Copy(CBAlmacenOrigenD.Text, 1, Pos(' ', CBAlmacenOrigenD.Text));
        s.Add(' AND C.ALMACEN_ORI >= ''' + AOrigenD + '''');
     end;

     if (CBAlmacenOrigenH.ItemIndex <> 0) then
     begin
        AOrigenH := Copy(CBAlmacenOrigenH.Text, 1, 3);
        s.Add(' AND C.ALMACEN_ORI <= ''' + AOrigenH + '''');
     end;

     if (CBAlmacenDestinoD.ItemIndex <> 0) then
     begin
        ADestinoD := Copy(CBAlmacenDestinoD.Text, 1, 3);
        s.Add(' AND C.ALMACEN_DST >= ''' + ADestinoD + '''');
     end;

     if (CBAlmacenDestinoH.ItemIndex <> 0) then
     begin
        ADestinoH := Copy(CBAlmacenDestinoH.Text, 1, 3);
        s.Add(' AND C.ALMACEN_DST <= ''' + ADestinoH + '''');
     end;

     case RGOrden.ItemIndex of
        0: s.Add(' ORDER BY C.FECHA, C.RIG');
        1: s.Add(' ORDER BY C.SERIE, C.RIG');
        2: s.Add(' ORDER BY C.FECHA, C.SERIE, C.RIG');
     end;

     Cadena := s.Text;
  finally
     s.Free;
  end;
end;

procedure TFPregMovManStock.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  GeneraSQL;
  DMLSTMovManStock.MostrarListadoFiltrado(Cadena, DMMovManStock.QMCabeceraSERIE.Value, Modo, Grupo);
end;

end.
