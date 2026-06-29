unit UProFMTrabExt;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, ComCtrls, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls,
  ULFDBEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus,
  UTeclas, UControlEdit, UEditPanel, ToolWin, ULFToolBar, ExtCtrls,
  ULFPanel, ULFEdit, ULFLabel, ULFEditFind2000;

type
  TProFMTrabExt = class(TFPEditSinNavegador)
     Label1: TLFLabel;
     Label2: TLFLabel;
     Label3: TLFLabel;
     Label4: TLFLabel;
     Label5: TLFLabel;
     Label6: TLFLabel;
     Label7: TLFLabel;
     Label9: TLFLabel;
     Label10: TLFLabel;
     Label8: TLFLabel;
     DBEEjercicio: TLFDbedit;
     DBECanal: TLFDbedit;
     DBESerie: TLFDbedit;
     DBENumOrden: TLFDbedit;
     DBEFase: TLFDbedit;
     DBETarea: TLFDbedit;
     DBENumPedido: TLFDbedit;
     DBEDescFase: TLFDbedit;
     DBEDescTarea: TLFDbedit;
     DBEFechaPrev: TLFDbedit;
     DBEFechaFin: TLFDbedit;
     DBGFAlbaranes: TDBGridFind2000;
     TButtPeticion: TToolButton;
     TButtFinal: TToolButton;
     ToolButton4: TToolButton;
     TButtRefrescaDatos: TToolButton;
     ToolButton6: TToolButton;
     ETituloFase: TLFEdit;
     ETituloTarea: TLFEdit;
     LProveedor: TLFLabel;
     LArticulo: TLFLabel;
     LAlmacen: TLFLabel;
     ETituloProveedor: TLFEdit;
     ETituloArticulo: TLFEdit;
     ETituloAlmacen: TLFEdit;
     EFProveedor: TLFEditFind2000;
     EFArticulo: TLFEditFind2000;
     EFAlmacen: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtPeticionClick(Sender: TObject);
     procedure TButtFinalClick(Sender: TObject);
     procedure DBENumPedidoDblClick(Sender: TObject);
     procedure TButtRefrescaDatosClick(Sender: TObject);
     procedure DBGFAlbaranesDblClick(Sender: TObject);
     procedure EFProveedorChange(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AbreTrabajoExt(id_orden, linea_fase, linea_tarea: integer);
     procedure RefrescaForm;
  end;

var
  ProFMTrabExt : TProFMTrabExt;

implementation

uses UDMMain, UFormGest, UProDMTrabExt, UEntorno, UDameDato, HYFIBQuery, UProDMOrden;

{$R *.dfm}

procedure TProFMTrabExt.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMTrabExt, ProDMTrabExt);
end;

procedure TProFMTrabExt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMTrabExt);
end;

procedure TProFMTrabExt.AbreTrabajoExt(id_orden, linea_fase, linea_tarea: integer);
begin
  ProDMTrabExt.AbreTrabajoExt(id_orden, linea_fase, linea_tarea);

  RefrescaForm;
end;

procedure TProFMTrabExt.TButtPeticionClick(Sender: TObject);
begin
  inherited;
  ProDMTrabExt.CrearPedido(StrToIntDef(EFProveedor.Text, 0), Trim(EFAlmacen.Text), Trim(EFArticulo.Text));

  RefrescaForm;
end;

procedure TProFMTrabExt.TButtFinalClick(Sender: TObject);
begin
  inherited;
  ProDMTrabExt.RecepcionPedido;
  ProDMTrabExt.EnlazaAlbaran;

  RefrescaForm;
end;

procedure TProFMTrabExt.DBENumPedidoDblClick(Sender: TObject);
begin
  inherited;
  ProDMTrabExt.AbrePedido;
end;

procedure TProFMTrabExt.RefrescaForm;
var
  SituacionOrden : integer;
begin
  ProDMTrabExt.QMTrabExt.Refresh;
  SituacionOrden := DMMain.DameSituacionOrden(ProDMTrabExt.QMTrabExtID_ORDEN.AsInteger);
  if (ProDMTrabExt.xPedidoID_E.AsInteger = 0) then
  begin
     TButtPeticion.Enabled := (SituacionOrden < 3);
     TButtFinal.Enabled := False;
     DBENumPedido.Color := clInfoBk;
     EFAlmacen.Text := ProDMOrden.QMProOrdMatALMACEN_SAL.AsString;
     EFProveedor.Text := IntToStr(ProDMTrabExt.DameProveedorDeAlmacen(REntorno.Empresa, ProDMOrden.QMProOrdMatALMACEN.AsString));
     EFArticulo.Text := ProDMOrden.QMProOrdMatCOMPONENTE.AsString;
     EFProveedor.Enabled := True;
     EFArticulo.Enabled := True;
     EFAlmacen.Enabled := True;
  end
  else
  begin
     TButtPeticion.Enabled := False;
     TButtFinal.Enabled := (SituacionOrden < 3);
     DBENumPedido.Color := REntorno.ColorEnlaceActivo;
     EFAlmacen.Text := ProDMOrden.QMProOrdMatALMACEN_SAL.AsString;
     { EFProveedor.Text := ProDMTrabExt.xPedidoPROVEEDOR.AsString;
     EFArticulo.Text := '';
     EFAlmacen.Text := ProDMTrabExt.xPedidoALMACEN.AsString;}
     EFProveedor.Enabled := False;
     EFArticulo.Enabled := False;
     EFAlmacen.Enabled := False;
  end;
end;

procedure TProFMTrabExt.TButtRefrescaDatosClick(Sender: TObject);
begin
  inherited;
  RefrescaForm;
end;

procedure TProFMTrabExt.DBGFAlbaranesDblClick(Sender: TObject);
begin
  inherited;
  ProDMTrabExt.AbreAlbaran;
end;

procedure TProFMTrabExt.EFProveedorChange(Sender: TObject);
{
var
  Q : THYFIBQuery;
  Almacen : string;
}
begin
  inherited;
  ETituloProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));

  {
  // Selecciono el almacen asociado al tercero del proveedor
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT A.ALMACEN ');
        SQL.Add(' FROM EMP_PROVEEDORES P ');
        SQL.Add(' JOIN SYS_TERCEROS T ');
        SQL.Add(' ON P.TERCERO = T.TERCERO ');
        SQL.Add(' JOIN ART_ALMACENES A ');
        SQL.Add(' ON T.TERCERO = A.TERCERO AND P.EMPRESA = A.EMPRESA ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.EMPRESA = :EMPRESA AND ');
        SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
        SQL.Add(' A.ACTIVO = 1 ');
        SQL.Add(' ORDER BY A.DEFECTO DESC, A.ALMACEN ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROVEEDOR'].AsInteger := StrToIntDef(EFProveedor.Text, 0);
        ExecQuery;
        Almacen := FieldByName['ALMACEN'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if (Trim(Almacen) = '') then
     Almacen := REntorno.AlmacenDefecto;

  EFAlmacen.Text := Almacen;
  }
end;

procedure TProFMTrabExt.EFArticuloChange(Sender: TObject);
begin
  inherited;
  ETituloArticulo.Text := DameTituloArticulo(EFArticulo.Text);
end;

procedure TProFMTrabExt.EFAlmacenChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
end;

end.
