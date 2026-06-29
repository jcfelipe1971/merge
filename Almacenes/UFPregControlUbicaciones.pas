unit UFPregControlUbicaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFEdit, ULFLabel, HYFIBQuery,
  rxPlacemnt, ULFFormStorage, ULFPanel, UFPEditListadoSimple;

type
  TFPregControlUbicaciones = class(TFPEditListadoSimple)
     GBAlmacenes: TGroupBox;
     GBArticulos: TGroupBox;
     EFDesdeAlmacen: TLFEditFind2000;
     EFHastaAlmacen: TLFEditFind2000;
     EFDesdeArticulo: TLFEditFind2000;
     EFHastaArticulo: TLFEditFind2000;
     LDesdeAlmacen: TLFLabel;
     LHastaAlmacen: TLFLabel;
     LDesdeArticulo: TLFLabel;
     LhastaArticulo: TLFLabel;
     EDesdeAlmacen: TLFEdit;
     EHastaAlmacen: TLFEdit;
     EDesdeArticulo: TLFEdit;
     EHastaArticulo: TLFEdit;
     GBUbicaciones: TGroupBox;
     EFDesdeUbicacion: TLFEditFind2000;
     EFHastaUbicacion: TLFEditFind2000;
     LDesdeUbicacion: TLFLabel;
     LHastaUbicacion: TLFLabel;
     EDesdeUbicacion: TLFEdit;
     EHastaUbicacion: TLFEdit;
     RGTipoListado: TRadioGroup;
     TButtConfigurar: TToolButton;
     procedure EFDesdeAlmacenChange(Sender: TObject);
     procedure EFHastaAlmacenChange(Sender: TObject);
     procedure EFDesdeArticuloChange(Sender: TObject);
     procedure EFHastaArticuloChange(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormDestroy(Sender: TObject);
     procedure EFDesdeUbicacionChange(Sender: TObject);
     procedure EFHastaUbicacionChange(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPregControlUbicaciones : TFPregControlUbicaciones;

implementation

uses UDMLstControlUbicaciones, UFormGest, UDMMain, UEntorno, UDameDato, UFMListConfig;

{$R *.dfm}

procedure TFPregControlUbicaciones.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstControlUbicaciones, DMLstControlUbicaciones);
  ARecargar.Execute;
  Grupo := 5108;
  Listado := DMLstControlUbicaciones.frListadoUbicaciones;
end;

procedure TFPregControlUbicaciones.FormDestroy(Sender: TObject);
begin
  inherited;
  CierraData(DMLstControlUbicaciones);
end;

procedure TFPregControlUbicaciones.EFDesdeAlmacenChange(Sender: TObject);
begin
  inherited;
  EDesdeAlmacen.Text := DametituloAlmacen(EFDesdeAlmacen.Text);
end;

procedure TFPregControlUbicaciones.EFHastaAlmacenChange(Sender: TObject);
begin
  inherited;
  EHastaAlmacen.Text := DametituloAlmacen(EFHastaAlmacen.Text);
end;

procedure TFPregControlUbicaciones.EFDesdeArticuloChange(Sender: TObject);
begin
  inherited;
  EDesdeArticulo.Text := DameTituloArticulo(EFDesdeArticulo.Text);
end;

procedure TFPregControlUbicaciones.EFHastaArticuloChange(Sender: TObject);
begin
  inherited;
  EHastaArticulo.Text := DameTituloArticulo(EFHastaArticulo.Text);
end;

procedure TFPregControlUbicaciones.EFDesdeUbicacionChange(Sender: TObject);
begin
  inherited;
  EDesdeUbicacion.Text := DameComposicionUbicacion(StrToIntDef(EFDesdeUbicacion.Text, 0));
end;

procedure TFPregControlUbicaciones.EFHastaUbicacionChange(Sender: TObject);
begin
  inherited;
  EHastaUbicacion.Text := DameComposicionUbicacion(StrToIntDef(EFHastaUbicacion.Text, 0));
end;

procedure TFPregControlUbicaciones.APrevExecute(Sender: TObject);
begin
  inherited;
  DMLstControlUbicaciones.MuestraListado(0, RGTipoListado.ItemIndex, EFDesdeAlmacen.Text, EFHastaAlmacen.Text, EFDesdeArticulo.Text, EFHastaArticulo.Text, StrToIntDef(EFDesdeUbicacion.Text, 0), StrToIntDef(EFHastaUbicacion.Text, 0));
end;

procedure TFPregControlUbicaciones.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMLstControlUbicaciones.MuestraListado(1, RGTipoListado.ItemIndex, EFDesdeAlmacen.Text, EFHastaAlmacen.Text, EFDesdeArticulo.Text, EFHastaArticulo.Text, StrToIntDef(EFDesdeUbicacion.Text, 0), StrToIntDef(EFHastaUbicacion.Text, 0));
end;

procedure TFPregControlUbicaciones.ARecargarExecute(Sender: TObject);
var
  Q : THYFIBQuery;
begin
  inherited;
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT MIN(ALMACEN) ALMACEN_DESDE, MAX(ALMACEN) ALMACE_HASTA ' +
        'FROM ART_ALMACENES WHERE EMPRESA=?EMPRESA ';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     EFDesdeAlmacen.Text := FieldByName['ALMACEN_DESDE'].AsString;
     EFHastaAlmacen.Text := FieldByName['ALMACE_HASTA'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);

  //Calculo Primer y Ultimo Articulo
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT MIN(ARTICULO) DESDE_ARTICULO, MAX(ARTICULO) HASTA_ARTICULO ' +
        'FROM ART_ARTICULOS WHERE  EMPRESA=?EMPRESA ';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     EFDesdeArticulo.Text := FieldByName['DESDE_ARTICULO'].AsString;
     EFHastaArticulo.Text := FieldByName['HASTA_ARTICULO'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);

  //Calculo Primer y Ultimo ID_ubicacion
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT MIN(ID_UBICACION) DESDE_ID_UBICACION, MAX(ID_UBICACION) HASTA_ID_UBICACION ' +
        'FROM ART_ALMACENES_UBICACIONES WHERE  EMPRESA=?EMPRESA ';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ExecQuery;
     EFDesdeUbicacion.Text := FieldByName['DESDE_ID_UBICACION'].AsString;
     EFHastaUbicacion.Text := FieldByName['HASTA_ID_UBICACION'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

end.
