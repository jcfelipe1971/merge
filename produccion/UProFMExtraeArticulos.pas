unit UProFMExtraeArticulos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolWin, ComCtrls, ULFToolBar, Grids, DBGrids,
  NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, UFormGest, Menus, UTeclas, UControlEdit, UNavigator,
  UEditPanel, ULFActionList, ULFLabel, rxPlacemnt, ULFFormStorage, ULFPanel;

type
  TProFMExtraeArticulos = class(TG2KForm)
     PNLotes: TLFPanel;
     DBGFDistribuye: TDBGridFind2000;
     TBMain: TLFToolBar;
     DBEArticulo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LBArticulo: TLFLabel;
     TBSeparador: TToolButton;
     TBNav: TLFToolBar;
     NavMain: THYMNavigator;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     EFDistribucion: THYMEditPanel;
     TButtAceptar: TToolButton;
     FSMain: TLFFibFormStorage;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDistribuyeBusqueda(Sender: TObject);
     procedure TButtAceptarClick(Sender: TObject);
     procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     AlmacenDoc: string; //SFG_JLA
     tipo_ubic: string;
     procedure MuestraUbiArtic(empresa, ejercicio, canal, rig, linea, id_orden, id_a: integer; serie, tipo: string; Unidades_Doc: double);
  end;

var
  ProFMExtraeArticulos : TProFMExtraeArticulos;

implementation

uses UDMMain, UEntorno, UDMUbicaArticulo,
  UProDMExtraeArticulos;

{$R *.dfm}

procedure TProFMExtraeArticulos.FormCreate(Sender: TObject);
begin
  AbreData(TProDMExtraeArticulos, ProDMExtraeArticulos);
  ControlEdit := CEMain;
end;

procedure TProFMExtraeArticulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ProDMExtraeArticulos);
end;

procedure TProFMExtraeArticulos.MuestraUbiArtic(empresa, ejercicio, canal, rig, linea, id_orden, id_a: integer; serie, tipo: string; Unidades_Doc: double);
begin
  //////////////////// SFG_JLA ////////////////////
  if (tipo = 'ZOM') then
  begin
     ProDMExtraeArticulos.ZxAlmacenMat.Close;
     ProDMExtraeArticulos.ZxAlmacenMat.Params.ByName['ID_ORDEN_MAT'].AsInteger := id_orden;
     ProDMExtraeArticulos.ZxAlmacenMat.Open;
     AlmacenDoc := ProDMExtraeArticulos.ZxAlmacenMatALMACEN.AsString;
  end
  else
  begin
     ProDMExtraeArticulos.ZxAlmacenOrd.Close;
     ProDMExtraeArticulos.ZxAlmacenOrd.Params.ByName['ID_ORDEN'].AsInteger := id_orden;
     ProDMExtraeArticulos.ZxAlmacenOrd.Open;
     AlmacenDoc := ProDMExtraeArticulos.ZxAlmacenOrdALMACEN_ENT.AsString;
  end;
  ////////////////////FIN SFG_JLA ////////////////////

  tipo_ubic := tipo;
  ProDMExtraeArticulos.MuestraUbicacion(empresa, ejercicio, canal, rig,
     linea, id_orden, id_a, serie, tipo, unidades_doc);
  ShowModal;
end;

procedure TProFMExtraeArticulos.DBGFDistribuyeBusqueda(Sender: TObject);
begin
  if (Trim(DBGFDistribuye.TablaABuscar) = 'VER_ARTICULOS_UBICACIONES') then
  begin
     DBGFDistribuye.CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr +
        ' and (id_ubicacion not in ( select det.id_ubicacion from pro_tmp_orden_ubicaciones det where det.id_orden = ' +
        IntToStr(ProDMExtraeArticulos.QMDistribucionID_ORDEN.AsInteger) +
        ' and det.entrada=' + IntToStr(REntorno.Entrada) + '))' +
        ' and composicion like ''' + AlmacenDoc + '%''' + //SFG_JLA
        ' and id_a =' +
        IntToStr(ProDMExtraeArticulos.QMDistribucionID_A.AsInteger);
  end;
end;

procedure TProFMExtraeArticulos.TButtAceptarClick(Sender: TObject);
begin
  if (ProDMExtraeArticulos.InsertaUbicacion(tipo_ubic)) then
     Close;
end;

procedure TProFMExtraeArticulos.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  ProDMExtraeArticulos.BorraTemporal;
end;

end.
