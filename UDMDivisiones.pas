unit UDMDivisiones;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery;

type
  TDMDivisiones = class(TDataModule)
     TLocal: THYTransaction;
     xDivisionesCab: TFIBTableSet;
     xDivisionesDet: TFIBTableSet;
     DSxDivisionesCab: TDataSource;
     DSxDivisionesDet: TDataSource;
     xDivisionesCabEMPRESA: TIntegerField;
     xDivisionesCabEJERCICIO: TIntegerField;
     xDivisionesCabCANAL: TIntegerField;
     xDivisionesCabSERIE: TFIBStringField;
     xDivisionesCabTIPO: TFIBStringField;
     xDivisionesCabRIG: TIntegerField;
     xDivisionesCabID_S: TIntegerField;
     xDivisionesCabDIVISION: TFIBStringField;
     xDivisionesCabPORCENTAJE: TFloatField;
     xDivisionesDetEMPRESA: TIntegerField;
     xDivisionesDetEJERCICIO: TIntegerField;
     xDivisionesDetCANAL: TIntegerField;
     xDivisionesDetSERIE: TFIBStringField;
     xDivisionesDetTIPO: TFIBStringField;
     xDivisionesDetRIG: TIntegerField;
     xDivisionesDetLINEA: TIntegerField;
     xDivisionesDetID_S: TIntegerField;
     xDivisionesDetID_DETALLES_S: TIntegerField;
     xDivisionesDetDIVISION: TFIBStringField;
     xDivisionesDetPORCENTAJE: TFloatField;
     procedure xDivisionesCabAfterPost(DataSet: TDataSet);
     procedure xDivisionesDetAfterPost(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure xDivisionesCabNewRecord(DataSet: TDataSet);
     procedure xDivisionesDetNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     ID_S: integer;
     ID_DETALLES_S: integer;
     Empresa: integer;
     Ejercicio: integer;
     Canal: integer;
     Serie: string;
     Tipo: string;
     RIG: integer;
     Linea: integer;
     Cabecera: boolean;
  public
     { Public declarations }
     procedure Inicializa(aID_S, aID_Detalles_S: integer; aCabecera: boolean);
  end;

var
  DMDivisiones : TDMDivisiones;

implementation

uses UDMMain, UFMDivisiones;

{$R *.dfm}

procedure TDMDivisiones.DataModuleCreate(Sender: TObject);
begin
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
  xDivisionesCabPORCENTAJE.DisplayFormat := '0.00';
  xDivisionesDetPORCENTAJE.DisplayFormat := '0.00';
end;

procedure TDMDivisiones.Inicializa(aID_S, aID_Detalles_S: integer; aCabecera: boolean);
var
  Q : THYFIBQuery;
begin
  begin
     ID_S := aID_S;
     ID_DETALLES_S := aID_Detalles_S;
     Cabecera := aCabecera;
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        if (cabecera) then
           SQL.Text := 'SELECT EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG FROM GES_CABECERAS_S WHERE ID_S= ' + IntToStr(ID_S)
        else
           SQL.Text := 'SELECT EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA FROM GES_DETALLES_S WHERE ID_DETALLES_S= ' + IntToStr(ID_DETALLES_S);
        ExecQuery;
        Empresa := FieldByName['EMPRESA'].AsInteger;
        Ejercicio := FieldByName['EJERCICIO'].AsInteger;
        Canal := FieldByName['CANAL'].AsInteger;
        Serie := FieldByName['SERIE'].AsString;
        Tipo := FieldByName['TIPO'].AsString;
        Rig := FieldByName['RIG'].AsInteger;
        if (not cabecera) then
           Linea := FieldByName['LINEA'].AsInteger;
        FreeHandle;
     end;
     FreeAndNil(Q);
     if (Cabecera) then
     begin
        xDivisionesCab.Close;
        xDivisionesCab.Params.ByName['ID_S'].AsInteger := ID_S;
        xDivisionesCab.Open;
     end
     else
        xDivisionesDet.Close;
     xDivisionesDet.Params.ByName['ID_S'].AsInteger := ID_S;
     xDivisionesDet.Params.ByName['ID_DETALLES_S'].AsInteger := ID_DETALLES_S;
     xDivisionesDet.Open;
  end;
end;

procedure TDMDivisiones.xDivisionesCabAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMDivisiones.xDivisionesDetAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMDivisiones.xDivisionesCabNewRecord(DataSet: TDataSet);
begin
  xDivisionesCabID_S.AsInteger := ID_S;
  xDivisionesCabEMPRESA.AsInteger := Empresa;
  xDivisionesCabEJERCICIO.AsInteger := Ejercicio;
  xDivisionesCabCANAL.AsInteger := Canal;
  xDivisionesCabSERIE.AsString := Serie;
  xDivisionesCabTIPO.AsString := Tipo;
  xDivisionesCabRIG.AsInteger := RIG;
end;

procedure TDMDivisiones.xDivisionesDetNewRecord(DataSet: TDataSet);
begin
  xDivisionesDetID_S.AsInteger := ID_S;
  xDivisionesDetID_DETALLES_S.AsInteger := ID_DETALLES_S;
  xDivisionesDetEMPRESA.AsInteger := Empresa;
  xDivisionesDetEJERCICIO.AsInteger := Ejercicio;
  xDivisionesDetCANAL.AsInteger := Canal;
  xDivisionesDetSERIE.AsString := Serie;
  xDivisionesDetTIPO.AsString := Tipo;
  xDivisionesDetRIG.AsInteger := RIG;
  xDivisionesDetLINEA.AsInteger := Linea;
end;

end.
