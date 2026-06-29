unit UDMADRTipos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMADRTipos = class(TDataModule)
     TLocal: THYTransaction;
     QMADRTipos: TFIBTableSet;
     DSQMADRTipos: TDataSource;
     TUpdate: THYTransaction;
     QMADRTiposID: TIntegerField;
     QMADRTiposACTIVO: TIntegerField;
     QMADRTiposUN_NUMBER: TFIBStringField;
     QMADRTiposNAME: TFIBStringField;
     QMADRTiposCLASS: TFIBStringField;
     QMADRTiposCLASIFICATION: TFIBStringField;
     QMADRTiposPACKING_GROUP: TFIBStringField;
     QMADRTiposLABELS: TFIBStringField;
     QMADRTiposDANGER_NUMBER: TFIBStringField;
     QMADRTiposTRANSPORT_CATEGORY: TFIBStringField;
     QMADRTiposTUNEL_CODE: TFIBStringField;
     QMADRTiposSPECIAL_PROVISIONS: TFIBStringField;
     QMADRTiposLIMITED_QUANTITY: TFIBStringField;
     QMADRTiposEXCEPTED_QUANTITY: TFIBStringField;
     QMADRTiposPACKING_INSTRUCTIONS: TFIBStringField;
     QMADRTiposSPECIAL_PACKING_PROVISIONS: TFIBStringField;
     QMADRTiposMIXED_PACKING_PROVISIONS: TFIBStringField;
     QMADRTiposPORTABLE_TANK_INSTRUCTIONS: TFIBStringField;
     QMADRTiposPORTABLE_TANK_SPECIAL_PROV: TFIBStringField;
     QMADRTiposADR_TANK_CODE: TFIBStringField;
     QMADRTiposADR_TANK_SPECIAL_PROV: TFIBStringField;
     QMADRTiposVEHICLE: TFIBStringField;
     QMADRTiposPACKAGES_SPECIAL_PROV: TFIBStringField;
     QMADRTiposBULK_SPECIAL_PROV: TFIBStringField;
     QMADRTiposLOADING_SPECIAL_PROV: TFIBStringField;
     QMADRTiposOPERATION_SPECIAL_PROV: TFIBStringField;
     QMADRTiposCRITERIO_SELECCION: TFIBStringField;
     QMADRTiposIDENTIFICACION_RIESGOS: TFIBStringField;
     QMADRTiposAPARTADO: TFIBStringField;
     QMADRTiposLETRA: TFIBStringField;
     QMADRTiposCOD_NATURALEZA_PELIGRO: TIntegerField;
     QMADRTiposCOD_MEDIDAS_PROTECCION: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMADRTiposBeforePost(DataSet: TDataSet);
     procedure QMADRTiposUN_NUMBERChange(Sender: TField);
     procedure QMADRTiposNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     function DameTituloClase(Clase: string): string;
     function DameTituloPackingGroup(PackingGroup: string): string;
  end;

var
  DMADRTipos : TDMADRTipos;

implementation

uses UDMMain, uFBusca, HYFIBQuery;

{$R *.dfm}

procedure TDMADRTipos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMADRTipos.Open;
end;

procedure TDMADRTipos.QMADRTiposBeforePost(DataSet: TDataSet);
var
  TunelCode : string;
begin
  DMMain.Contador_Gen(DataSet, 'ID_ADR_TIPO', 'ID');

  // TunelCode dbe tener el formato (C) o (C/C)
  TunelCode := Trim(QMADRTiposTUNEL_CODE.AsString);
  if (Copy(TunelCode, 1, 1) <> '(') then
     TunelCode := '(' + TunelCode;
  if (Copy(TunelCode, Length(TunelCode), 1) <> ')') then
     TunelCode := TunelCode + ')';
  QMADRTiposTUNEL_CODE.AsString := TunelCode;
end;

procedure TDMADRTipos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMADRTipos, '00000');
end;

procedure TDMADRTipos.QMADRTiposUN_NUMBERChange(Sender: TField);
begin
  // Al seleccionar UN Number asigno el texto por defecto.
  if (QMADRTiposNAME.AsString = '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT NAME FROM ADR_NUMBERS WHERE UN_NUMBER = :UN_NUMBER';
           Params.ByName['UN_NUMBER'].AsString := QMADRTiposUN_NUMBER.AsString;
           ExecQuery;
           QMADRTiposNAME.AsString := FieldByName['NAME'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMADRTipos.DameTituloClase(Clase: string): string;
begin
  Result := '';
  if (Trim(Clase) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT NAME FROM ADR_CLASES WHERE CLASS = :CLASS';
           Params.ByName['CLASS'].AsString := Clase;
           ExecQuery;
           Result := FieldByName['NAME'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMADRTipos.DameTituloPackingGroup(PackingGroup: string): string;
begin
  Result := '';
  if (Trim(PackingGroup) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT NAME FROM ADR_PACKING_GROUPS WHERE PACKING_GROUP = :PACKING_GROUP';
           Params.ByName['PACKING_GROUP'].AsString := PackingGroup;
           ExecQuery;
           Result := FieldByName['NAME'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMADRTipos.QMADRTiposNewRecord(DataSet: TDataSet);
begin
  QMADRTiposACTIVO.AsInteger := 1;
  QMADRTiposCOD_NATURALEZA_PELIGRO.AsInteger := -1;
  QMADRTiposCOD_MEDIDAS_PROTECCION.AsInteger := -1;
end;

end.
