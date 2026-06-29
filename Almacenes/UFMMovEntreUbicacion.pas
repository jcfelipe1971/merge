unit UFMMovEntreUbicacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  ActnList, ULFActionList, StdCtrls, Mask, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, Grids,
  DBGrids, NsDBGrid, UHYDBGrid, ULFLabel, Menus, UTeclas, UControlEdit,
  UNavigator, UEditPanel, rxPlacemnt, ULFFormStorage, ULFPageControl, ULFEdit;

type
  TFMMovEntreUbicaciones = class(TG2kForm)
     PNMovimientos: TLFPanel;
     PNCabecera: TLFPanel;
     GBOrigen: TGroupBox;
     LFLabel1: TLFLabel;
     EFUbicacionO: TLFEditFind2000;
     DBETitUbicacion: TLFDbedit;
     DBGFArticulosOrigen: TDBGridFind2000;
     GBDestino: TGroupBox;
     LFLabel2: TLFLabel;
     EFUbicacionD: TLFEditFind2000;
     DBETitUbicacionD: TLFDbedit;
     DBGFArticulosDestino: TDBGridFind2000;
     PMDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     TBDetalle: TLFToolBar;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     ALMain: TLFActionList;
     TBSeparador1: TToolButton;
     TButtAceptar: TToolButton;
     AAceptar: TAction;
     TBMain: TLFToolBar;
     EPMain: THYMEditPanel;
     FSMain: TLFFibFormStorage;
     LFPanel1: TLFPanel;
     LFPanel2: TLFPanel;
     PCMovEntreUbicaciones: TLFPageControl;
     TSMovEntreUbicaciones: TTabSheet;
     TSMovimientoSimple: TTabSheet;
     TBMovSimple: TLFToolBar;
     DBGMovimientoSimple: TDBGridFind2000;
     TBTraspaso: TToolButton;
     LAlmacen: TLFLabel;
     ETituloAlmacen: TLFEdit;
     NavMovSimple: THYMNavigator;
     EFAlmacen: TLFEditFind2000;
     ToolButton3: TToolButton;
     CEMovSimple: TControlEdit;
     CEMovSimplePMEdit: TPopUpTeclas;
     ToolButton1: TToolButton;
     PNLAlmacen: TLFPanel;
     procedure EFUbicacionOChange(Sender: TObject);
     procedure EFUbicacionDChange(Sender: TObject);
     procedure EFUbicacionDBusqueda(Sender: TObject);
     procedure EFUbicacionOBusqueda(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure AAceptarExecute(Sender: TObject);
     procedure TBTraspasoClick(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure EFAlmacenBusqueda(Sender: TObject);
     procedure LFEditFind20001Change(Sender: TObject);
     procedure DBGMovimientoSimpleBusqueda(Sender: TObject);
     procedure PCMovEntreUbicacionesChanging(Sender: TObject; var AllowChange: boolean);
     procedure TSMovimientoSimpleShow(Sender: TObject);
     procedure DBGMovimientoSimpleColEnter(Sender: TObject);
     procedure DBGMovimientoSimpleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMMovEntreUbicaciones : TFMMovEntreUbicaciones;

implementation

uses UDMMain, UDMMovEntreUbicaciones, UEntorno, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMMovEntreUbicaciones.EFUbicacionOChange(Sender: TObject);
begin
  if (EFUbicacionO.Text <> '') then
  begin
     DMMovEntreUbicaciones.BorraTemporal;
     DMMovEntreUbicaciones.DameTituloUb(EFUbicacionO.Text, 0);
  end;
end;

procedure TFMMovEntreUbicaciones.EFUbicacionDChange(Sender: TObject);
begin
  if (EFUbicacionD.Text <> '') then
  begin
     DMMovEntreUbicaciones.BorraTemporal;
     DMMovEntreUbicaciones.DameTituloUb(EFUbicacionD.Text, 1);
  end;
end;

procedure TFMMovEntreUbicaciones.EFUbicacionDBusqueda(Sender: TObject);
begin
  EFUbicacionD.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + ' and almacen=''' + EFAlmacen.Text + '''';
  if (EFUbicacionO.Text <> '') then
     EFUbicacionD.CondicionBusqueda := EFUbicacionD.CondicionBusqueda +
        ' and composicion<>''' + EFUbicacionO.Text + '''';
end;

procedure TFMMovEntreUbicaciones.EFUbicacionOBusqueda(Sender: TObject);
begin
  EFUbicacionO.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + ' and almacen=''' + EFAlmacen.Text + '''';
  if (EFUbicacionD.Text <> '') then
     EFUbicacionO.CondicionBusqueda := EFUbicacionO.CondicionBusqueda +
        ' and composicion<>''' + EFUbicacionD.Text + '''';
end;

procedure TFMMovEntreUbicaciones.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMMovEntreUbicaciones, DMMovEntreUbicaciones);
  NavMovSimple.DataSource := DMMovEntreUbicaciones.DSQMDetalleMovSimple;
  DBGMovimientoSimple.DataSource := DMMovEntreUbicaciones.DSQMDetalleMovSimple;
end;

procedure TFMMovEntreUbicaciones.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  DMMovEntreUbicaciones.BorraTemporal;
  CierraData(DMMovEntreUbicaciones);
end;

procedure TFMMovEntreUbicaciones.DBGFDetalleBusqueda(Sender: TObject);
begin
  if (Trim(DBGFDetalle.TablaABuscar) = 'VER_ARTICULOS_UBICACIONES') then
  begin
     if (DMMovEntreUbicaciones.xArticulosDGENERAL.AsInteger = 0) then
        DBGFDetalle.CondicionBusqueda := 'empresa =' + REntorno.EmpresaStr + ' and id_ubicacion =' +
           IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) +
           ' and ( articulo not in ( select tmp.articulo' +
           ' from tmp_traspaso_entre_ub tmp' +
           ' where tmp.entrada =' + IntToStr(REntorno.Entrada) +
           ' and tmp.empresa =' + REntorno.EmpresaStr +
           ' and tmp.canal =' + REntorno.CanalStr +
           ' and tmp.id_ubicacion =' +
           IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) + ' ))' +
           ' and ( articulo in ( select st.articulo' +
           ' from art_stocks_ubicaciones st' +
           ' where (( empresa      =' + REntorno.EmpresaStr + ') and' +
           ' ( canal        =' + REntorno.CanalStr + '  ) and' +
           ' ( id_ubicacion =' +
           IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) + ') and' +
           ' ( existencias  > 0 ))))'
     else
        DBGFDetalle.CondicionBusqueda := 'empresa =' + REntorno.EmpresaStr + ' and id_ubicacion =' +
           IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) +
           ' and ( articulo not in ( select tmp.articulo' +
           ' from tmp_traspaso_entre_ub tmp' +
           ' where tmp.entrada =' + IntToStr(REntorno.Entrada) +
           ' and tmp.empresa =' + REntorno.EmpresaStr +
           ' and tmp.canal =' + REntorno.CanalStr +
           ' and tmp.id_ubicacion =' +
           IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) + ' ))' +
           ' and ( articulo in ( select ver.articulo' +
           ' from ver_articulos_ubicaciones ver' +
           ' where ver.id_ubicacion =' +
           IntToStr(DMMovEntreUbicaciones.xArticulosDID_UBICACION.AsInteger) + '))' +
           ' and ( articulo in ( select st.articulo' +
           ' from art_stocks_ubicaciones st' +
           ' where (( empresa      =' + REntorno.EmpresaStr + ') and' +
           ' ( canal        =' + REntorno.CanalStr + '  ) and' +
           ' ( id_ubicacion =' +
           IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) + ') and' +
           ' ( existencias  > 0 ))))';
  end;
  if (Trim(DBGFDetalle.TablaABuscar) = 'VER_LOTES_UBICACION_DISP_VEN') then
  begin
     DBGFDetalle.CondicionBusqueda := 'empresa =' + REntorno.EmpresaStr + ' and articulo=''' + DMMovEntreUbicaciones.QMDetalleARTICULO.AsString + '''' +
        ' and id_ubicacion =' + IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger);
  end;
end;

procedure TFMMovEntreUbicaciones.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEMain;
end;

procedure TFMMovEntreUbicaciones.AAceptarExecute(Sender: TObject);
begin
  if ((EFUbicacionO.Text <> '') and (EFUbicacionD.Text <> '')) then
     if (Confirma) then
        DMMovEntreUbicaciones.RealizaTraspaso;
end;

procedure TFMMovEntreUbicaciones.TBTraspasoClick(Sender: TObject);
begin
  if (Confirma) then
  begin
     DMMovEntreUbicaciones.RealizaTraspaso;
     //ETituloAlmacen.Text:='';
     //EFAlmacen.Text:='';
  end;
end;

procedure TFMMovEntreUbicaciones.EFAlmacenChange(Sender: TObject);
begin
  if (EFAlmacen.Text <> '') then
  begin
     DMMovEntreUbicaciones.BorraTemporal;
     DMMovEntreUbicaciones.CierraMovSimple;
     DMMovEntreUbicaciones.AbreMovSimple;
  end;
  ETituloAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
  DMMovEntreUbicaciones.AlmacenMovSimple := EFAlmacen.Text;
end;

procedure TFMMovEntreUbicaciones.EFAlmacenBusqueda(Sender: TObject);
begin
  if (Trim(EFAlmacen.Tabla_a_buscar) = 'ART_ALMACENES_UBICACIONES') then
  begin
     EFAlmacen.CondicionBusqueda := 'empresa =' + REntorno.EmpresaStr + ' and id_ubicacion =' +
        IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) +
        ' and ( articulo not in ( select tmp.articulo' +
        ' from tmp_traspaso_entre_ub tmp' +
        ' where tmp.entrada =' + IntToStr(REntorno.Entrada) +
        ' and tmp.empresa =' + REntorno.EmpresaStr +
        ' and tmp.canal =' + REntorno.CanalStr +
        ' and tmp.id_ubicacion =' +
        IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) + ' ))' +
        ' and ( articulo in ( select st.articulo' +
        ' from art_stocks_ubicaciones st' +
        ' where (( empresa      =' + REntorno.EmpresaStr + ') and' +
        ' ( canal        =' + REntorno.CanalStr + '  ) and' +
        ' ( id_ubicacion =' +
        IntToStr(DMMovEntreUbicaciones.xArticulosOID_UBICACION.AsInteger) + ') and' +
        ' ( existencias  > 0 ))))';
  end;
end;

procedure TFMMovEntreUbicaciones.LFEditFind20001Change(Sender: TObject);
begin
  if (EFAlmacen.Text <> '') then
  begin
     DMMovEntreUbicaciones.BorraTemporal;
     ETituloAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
     NavMovSimple.Enabled := True;
  end
  else
     NavMovSimple.Enabled := False;
end;

procedure TFMMovEntreUbicaciones.DBGMovimientoSimpleBusqueda(Sender: TObject);
{  var
  Q : THYFIBQuery;}
var
  i : integer;
begin
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_ARTICULOS_CUENTAS') then
     begin
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND CONTROL_STOCK=1 AND UBICABLE=1';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'ARTICULO';
     end;

     if (Trim(TablaABuscar) = 'VER_ARTICULOS_UBICACIONES') then
     begin
        CondicionBusqueda := 'ID_A=' + IntToStr(DMMovEntreUbicaciones.QMDetalleMovSimpleID_A.AsInteger) + ' AND COMPOSICION STARTING WITH ''' + DMMovEntreUbicaciones.QMDetalleMovSimpleALMACEN.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'COMPOSICION';
     end;

     if (Trim(TablaABuscar) = 'ART_ALMACENES_UBICACIONES') then
     begin
        CondicionBusqueda := 'EMPRESA =' + REntorno.EmpresaStr + ' AND ALMACEN = ''' + DMMovEntreUbicaciones.QMDetalleMovSimpleALMACEN.AsString + '''';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'COMPOSICION';
     end;

     if (Trim(TablaABuscar) = 'VER_LOTES_UBICACION_DISP_VEN') then
     begin
        {Q := THYFIBQuery.Create(nil);
         //verficamos si el articulo es loteable
         with Q do
         begin
         Close;
         DataBase := DMMain.DataBase ;
         SQL.Text := 'SELECT count(*)CONTADOR FROM  ART_ARTICULOS WHERE ARTICULO = ?ARTICULO AND LOTES = 1';
         Params.ByName['ARTICULO'].AsString := DMMovEntreUbicaciones.QMDetalleMovSimpleARTICULO.AsString;
         ExecQuery;
         Result := FieldByName['CONTADOR'].AsInteger;
         FreeHandle ;
         end;
         FreeAndNil(Q);
         if contador = nil then}
        CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr + ' AND ARTICULO =''' + DMMovEntreUbicaciones.QMDetalleMovSimpleARTICULO.AsString + ''' AND ID_UBICACION = ' +
           IntToStr(DMMovEntreUbicaciones.QMDetalleMovSimpleID_UBICACION.AsInteger);
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'LOTE';
     end;
  end;
end;

procedure TFMMovEntreUbicaciones.PCMovEntreUbicacionesChanging(Sender: TObject; var AllowChange: boolean);
begin
  if (PCMovEntreUbicaciones.ActivePage = TSMovimientoSimple) then
     DMMovEntreUbicaciones.CierraMovSimple;
end;

procedure TFMMovEntreUbicaciones.TSMovimientoSimpleShow(Sender: TObject);
begin
  DMMovEntreUbicaciones.AbreMovSimple;
end;

procedure TFMMovEntreUbicaciones.DBGMovimientoSimpleColEnter(Sender: TObject);
begin
  ControlEdit := CEMovSimple;
end;

procedure TFMMovEntreUbicaciones.DBGMovimientoSimpleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_F3) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
        DMMovEntreUbicaciones.Infolotes(1);
  end;
end;

procedure TFMMovEntreUbicaciones.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_F3) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
        DMMovEntreUbicaciones.Infolotes(0);
  end;
end;

end.
