unit UDMConfiguraAlmacen;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, ComCtrls, ImgList, Controls;

type
  TDMConfiguraAlmacen = class(TDataModule)
     TLocal: THYTransaction;
     QMUbicacionAlmacen: TFIBTableSet;
     DSQMUbicacionAlmacen: TDataSource;
     QMUbicacionAlmacenEMPRESA: TIntegerField;
     QMUbicacionAlmacenALMACEN: TFIBStringField;
     QMUbicacionAlmacenCALLE: TFIBStringField;
     QMUbicacionAlmacenESTANTERIA: TFIBStringField;
     QMUbicacionAlmacenREPISA: TFIBStringField;
     QMUbicacionAlmacenPOSICION: TFIBStringField;
     QMUbicacionAlmacenTITULO: TFIBStringField;
     QMUbicacionAlmacenVOLUMEN_MAX: TFloatField;
     QMUbicacionAlmacenDIAMETRO_MAX: TFloatField;
     QMUbicacionAlmacenPESO_MAX: TFloatField;
     QMUbicacionAlmacenVOLUMEN_ACC: TFloatField;
     QMUbicacionAlmacenPESO_ACC: TFloatField;
     QMUbicacionAlmacenDIAMETRO_ACC: TFloatField;
     xAlmacen: TFIBDataSetRO;
     DSxAlmacen: TDataSource;
     xAlmacenALMACEN: TFIBStringField;
     xAlmacenTITULO: TFIBStringField;
     QTreeAlmacenes: TFIBQuery;
     QTreeCalles: TFIBQuery;
     QTreeEstanterias: TFIBQuery;
     QTreeRepisas: TFIBQuery;
     QTreePosiciones: TFIBQuery;
     QMUbicacionAlmacenID_UBICACION: TIntegerField;
     QMUbicacionAlmacenCOMPOSICION: TFIBStringField;
     TUpdate: THYTransaction;
     QMUbicacionAlmacenTIPO: TFIBStringField;
     QMUbicacionAlmacenSECTOR: TFIBStringField;
     QMUbicacionAlmacenDISPONIBLE: TIntegerField;
     procedure QMUbicacionAlmacenNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure xAlmacenAfterOpen(DataSet: TDataSet);
     procedure QMUbicacionAlmacenBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     procedure RellenaCalles(Nodo: TTreeNode; Almacen: string);
     procedure RellenaEstanteria(Nodo: TTreeNode; Almacen, Calle: string);
     procedure RellenaRepisa(Nodo: TTreeNode; Almacen, Calle, Estanteria: string);
     procedure RellenaPosicion(Nodo: TTreeNode; Almacen, Calle, Estanteria, Repisa: string);
     procedure EstableceMascaras;
  public
     { Public declarations }
     procedure InicializaRegistro(Almacen: string);
     procedure RellenaMapa;
     procedure BusquedaCompleja;
     procedure AbreAlmacenes;
  end;

var
  DMConfiguraAlmacen : TDMConfiguraAlmacen;

implementation

uses UDMMain, UFMConfiguraAlmacen, UEntorno, uFBusca;

{$R *.dfm}

procedure TDMConfiguraAlmacen.QMUbicacionAlmacenNewRecord(DataSet: TDataSet);
begin
  QMUbicacionAlmacenEMPRESA.AsInteger := REntorno.Empresa;
  QMUbicacionAlmacenALMACEN.AsString := xAlmacenALMACEN.AsString;
  QMUbicacionAlmacenVOLUMEN_MAX.AsInteger := 0;
  QMUbicacionAlmacenDIAMETRO_MAX.AsInteger := 0;
  QMUbicacionAlmacenPESO_MAX.AsInteger := 0;
  QMUbicacionAlmacenVOLUMEN_ACC.AsInteger := 0;
  QMUbicacionAlmacenPESO_ACC.AsInteger := 0;
  QMUbicacionAlmacenDIAMETRO_ACC.AsInteger := 0;
  QMUbicacionAlmacenTITULO.AsString := '';
  QMUbicacionAlmacenTIPO.AsString := 'GEN';
  QMUbicacionAlmacenSECTOR.AsString := 'GEN';
  QMUbicacionAlmacenDISPONIBLE.AsInteger := 1;
end;

procedure TDMConfiguraAlmacen.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  EstableceMascaras;
end;

procedure TDMConfiguraAlmacen.EstableceMascaras;
begin
  QMUbicacionAlmacenVOLUMEN_MAX.DisplayFormat := MascaraI;
  QMUbicacionAlmacenDIAMETRO_MAX.DisplayFormat := MascaraI;
  QMUbicacionAlmacenPESO_MAX.DisplayFormat := MascaraI;
  QMUbicacionAlmacenPESO_ACC.DisplayFormat := MascaraI;
  QMUbicacionAlmacenDIAMETRO_ACC.DisplayFormat := MascaraI;
  QMUbicacionAlmacenVOLUMEN_ACC.DisplayFormat := MascaraI;
end;

procedure TDMConfiguraAlmacen.InicializaRegistro(Almacen: string);
begin
  with xAlmacen do
  begin
     Close;
     SelectSQL.Text := 'select * from art_almacenes where empresa=?empresa' +
        ' and almacen=?almacen and ctrol_ubicacion=1';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Open;
  end;
end;

procedure TDMConfiguraAlmacen.AbreAlmacenes;
begin
  with xAlmacen do
  begin
     Close;
     SelectSQL.Text :=
        'select * from art_almacenes where empresa=?empresa and ctrol_ubicacion=1 order by almacen';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMConfiguraAlmacen.xAlmacenAfterOpen(DataSet: TDataSet);
begin
  with QMUbicacionAlmacen do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ALMACEN'].AsString := xAlmacenALMACEN.AsString;
     Open;
  end;
end;

procedure TDMConfiguraAlmacen.RellenaMapa;
var
  Nodo : TTreeNode;
begin
  Nodo := FMConfiguraAlmacen.TWMapa.Items.Add(nil,
     xAlmacenALMACEN.AsString + '-' + xAlmacenTITULO.AsString);
  Nodo.ImageIndex := 34;
  Nodo.SelectedIndex := 34;
  RellenaCalles(nodo, xAlmacenALMACEN.AsString);
end;

procedure TDMConfiguraalmacen.RellenaCalles(Nodo: TTreeNode; Almacen: string);
var
  NodoLoc : TTreeNode;
  Codigo : string;
  Titulo : string;
begin
  with QTreeCalles do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ALMACEN'].AsString := Almacen;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['CALLE'].AsString;
        Titulo := _('Calle') + ': ' + Codigo + '-' + FieldByName['TITULO'].AsString;
        NodoLoc := FMConfiguraAlmacen.TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 10;
        NodoLoc.SelectedIndex := 25;
        RellenaEstanteria(NodoLoc, Almacen, Codigo);
        Next;
     end;
  end;
end;

procedure TDMConfiguraAlmacen.RellenaEstanteria(Nodo: TTreeNode; Almacen, Calle: string);
var
  NodoLoc : TTreeNode;
  Codigo : string;
  Titulo : string;
begin
  with QTreeEstanterias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['CALLE'].AsString := Calle;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['ESTANTERIA'].AsString;
        Titulo := _('Estanteria') + ': ' + Codigo + '-' + FieldByName['TITULO'].AsString;
        NodoLoc := FMConfiguraAlmacen.TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 66;
        NodoLoc.SelectedIndex := 25;
        RellenaRepisa(NodoLoc, Almacen, Calle, Codigo);
        Next;
     end;
     Close;
  end;
end;

procedure TDMconfiguraAlmacen.RellenaRepisa(Nodo: TTreeNode; Almacen, Calle, Estanteria: string);
var
  NodoLoc : TTreeNode;
  Codigo : string;
  Titulo : string;
begin
  with QTreeRepisas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['CALLE'].AsString := Calle;
     Params.ByName['ESTANTERIA'].AsString := Estanteria;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['REPISA'].AsString;
        Titulo := _('Repisa') + ': ' + Codigo + '-' + FieldByName['TITULO'].AsString;
        NodoLoc := FMConfiguraAlmacen.TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 16;
        NodoLoc.SelectedIndex := 25;
        RellenaPosicion(NodoLoc, Almacen, Calle, Estanteria, Codigo);
        Next;
     end;
     Close;
  end;
end;

procedure TDMconfiguraAlmacen.RellenaPosicion(Nodo: TTreeNode; Almacen, Calle, Estanteria, Repisa: string);
var
  NodoLoc : TTreeNode;
  Codigo : string;
  Titulo : string;
begin
  with QTreePosiciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['CALLE'].AsString := Calle;
     Params.ByName['ESTANTERIA'].AsString := Estanteria;
     Params.ByName['REPISA'].AsString := Repisa;
     ExecQuery;
     while not EOF do
     begin
        Codigo := FieldByName['POSICION'].AsString;
        Titulo := _('Posicion') + ': ' + Codigo + '-' + FieldByName['TITULO'].AsString;
        NodoLoc := FMConfiguraAlmacen.TWMapa.Items.AddChild(Nodo, Titulo);
        NodoLoc.ImageIndex := 56;
        NodoLoc.SelectedIndex := 25;
        Next;
     end;
     Close;
  end;
end;

procedure TDMConfiguraAlmacen.BusquedaCompleja;
begin
  //TFBusca.Create( Self ).SeleccionaBusqueda(xAlmacen, '10000') ;
end;

procedure TDMConfiguraAlmacen.QMUbicacionAlmacenBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'ID_UBICACION', 'ID_UBICACION');
end;

end.
