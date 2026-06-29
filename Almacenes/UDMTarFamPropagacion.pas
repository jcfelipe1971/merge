unit UDMTarFamPropagacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery, UFParada;

type
  TDMTarFamPropagacion = class(TDataModule)
     xIzqu: TFIBDataSetRO;
     DSxIzqu: TDataSource;
     xDere: TFIBDataSetRO;
     DSxDere: TDataSource;
     xBusc: TFIBDataSetRO;
     DSxBusc: TDataSource;
     QCambios: THYFIBQuery;
     QTodos: THYFIBQuery;
     xBuscCODIGO: TFIBStringField;
     xBuscTITULO: TFIBStringField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xIzquCODIGO: TFIBStringField;
     xIzquTITULO: TFIBStringField;
     xDereCODIGO: TFIBStringField;
     xDereTITULO: TFIBStringField;
     procedure DMTarFamPropagacionCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     xSQLDetTar: TStringList;
     xSQLDetFam: TStringList;
     xSQLDetTmp: TStringList;
     xSQLCabTar: TStringList;
     xSQLCabFam: TStringList;
     xSQLCabTmp: TStringList;
     procedure GrabaCambios(Cab, Det: string; Propaga: smallint);
  public
     { Public declarations }
     Modo: smallint;
     procedure SetModo(Modo: smallint);
     procedure PropagaSi;
     procedure PropagaNo;
     procedure PropagaTodo;
  end;

var
  DMTarFamPropagacion : TDMTarFamPropagacion;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMTarFamPropagacion.DMTarFamPropagacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  // Creación
  xSQLCabTar := TStringList.Create;
  xSQLCabFam := TStringList.Create;
  xSQLCabTmp := TStringList.Create;
  xSQLDetTar := TStringList.Create;
  xSQLDetFam := TStringList.Create;
  xSQLDetTmp := TStringList.Create;
  // Asignación de cabeceras
  xSQLCabTar.Add('select distinct empresa,tarifa as codigo,titulo_tar as titulo ');
  xSQLCabTar.Add('from ver_tarifas_propaga_edicion');
  xSQLCabTar.Add('where(empresa=?empresa)');
  xSQLCabFam.Add('select distinct empresa,familia as codigo,titulo_fam as titulo ');
  xSQLCabFam.Add('from ver_tarifas_propaga_edicion');
  xSQLCabFam.Add('where(empresa=?empresa)');
  // Asignación de Detalles
  xSQLDetTar.Add('select tarifa as codigo,titulo_tar as titulo ');
  xSQLDetTar.Add('from ver_tarifas_propaga_edicion where((empresa=?empresa)');
  xSQLDetTar.Add('and(familia=?codigo)and(propaga=?propaga))order by tarifa');
  xSQLDetFam.Add('select familia as codigo,titulo_fam as titulo ');
  xSQLDetFam.Add('from ver_tarifas_propaga_edicion where((empresa=?empresa)');
  xSQLDetFam.Add('and(tarifa=?codigo)and(propaga=?propaga))order by familia');
end;

procedure TDMTarFamPropagacion.SetModo(Modo: smallint);
begin
  Self.Modo := Modo;
  if (Modo = 0) then
  begin
     xSQLCabTmp.Assign(xSQLCabFam);
     xSQLDetTmp.Assign(xSQLDetTar);
  end
  else
  begin
     xSQLCabTmp.Assign(xSQLCabTar);
     xSQLDetTmp.Assign(xSQLDetFam);
  end;
  with xBusc do
  begin
     Close;
     if (Modo = 0) then
        xBuscCODIGO.Size := 5
     else
        xBuscCODIGO.Size := 3;
     SelectSQL.Assign(xSQLCabTmp);
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Open;
     Last;
     First;
  end;
  with xIzqu do
  begin
     Close;
     SelectSQL.Assign(xSQLDetTmp);
     Params.ByName['Propaga'].AsInteger := 0;
     if Assigned(Params.ByName['Empresa']) then
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     if Assigned(Params.ByName['Tarifa']) then
        Params.ByName['Tarifa'].AsString := xBuscCODIGO.AsString;
     Open;
  end;
  with xDere do
  begin
     Close;
     SelectSQL.Assign(xSQLDetTmp);
     Params.ByName['Propaga'].AsInteger := 1;
     if Assigned(Params.ByName['Empresa']) then
        Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     if Assigned(Params.ByName['Tarifa']) then
        Params.ByName['Tarifa'].AsString := xBuscCODIGO.AsString;
     Open;
  end;
end;

procedure TDMTarFamPropagacion.PropagaSi;
var
  Cab, Det : string;
begin
  Cab := xBusc.FieldByName('Codigo').AsString;
  Det := xIzqu.FieldByName('Codigo').AsString;
  Self.GrabaCambios(Cab, Det, 1);
end;

procedure TDMTarFamPropagacion.PropagaNo;
var
  Cab, Det : string;
begin
  Cab := xBusc.FieldByName('Codigo').AsString;
  Det := xDere.FieldByName('Codigo').AsString;
  Self.GrabaCambios(Cab, Det, 0);
end;

procedure TDMTarFamPropagacion.PropagaTodo;
begin
  with QTodos do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     // ExecQuery;
     TFParada.Create(Self).ExecQuery(QTodos);
     FreeHandle;
  end;
end;

procedure TDMTarFamPropagacion.GrabaCambios(Cab, Det: string; Propaga: smallint);
var
  Tar, Fam : string;
begin
  if (Modo = 1) then
  begin
     Tar := Cab;
     Fam := Det;
  end
  else
  begin
     Tar := Det;
     Fam := Cab;
  end;

  with QCambios do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Tarifa'].AsString := Tar;
     Params.ByName['Familia'].AsString := Fam;
     Params.ByName['Propaga'].AsInteger := Propaga;
     TFParada.Create(Self).ExecQuery(QCambios);
     FreeHandle;
  end;
  xIzqu.Close;
  xIzqu.Open;
  xDere.Close;
  xDere.Open;
end;

procedure TDMTarFamPropagacion.DataModuleDestroy(Sender: TObject);
begin
  xSQLCabTar.Free;
  xSQLCabFam.Free;
  xSQLCabTmp.Free;
  xSQLDetTar.Free;
  xSQLDetFam.Free;
  xSQLDetTmp.Free;
end;

end.
