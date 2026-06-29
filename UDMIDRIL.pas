unit UDMIDRIL;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, uLkJSON;

type
  TDMIDRIL = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xIDRILTransportista: TFIBTableSet;
     xIDRILTransportistaEMPRESA: TIntegerField;
     xIDRILTransportistaACREEDOR: TIntegerField;
     DSxIDRILTransportista: TDataSource;
     xIDRILTransportistaREMITENTE_NOMBRE: TFIBStringField;
     xIDRILTransportistaREMITENTE_DIRECCION: TFIBStringField;
     xIDRILTransportistaREMITENTE_POBLACION: TFIBStringField;
     xIDRILTransportistaREMITENTE_PAIS: TFIBStringField;
     xIDRILTransportistaREMITENTE_CP: TFIBStringField;
     xIDRILTransportistaREMITENTE_TELEFONO: TFIBStringField;
     xIDRILTransportistaREMITENTE_MOVIL: TFIBStringField;
     xIDRILTransportistaREMITENTE_EMAIL: TFIBStringField;
     xIDRILTransportistaREMITENTE_DEPARTAMENTO: TFIBStringField;
     xIDRILTransportistaREMITENTE_OBSERVACIONES: TFIBStringField;
     xIDRILTransportistaRUTA_EJECUTABLE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xIDRILTransportistaNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     RutaGLS, RutaCopiaEtiqueta: string;
  published
  end;

var
  DMIDRIL : TDMIDRIL;

implementation

uses UDMMain, UEntorno, HYFIBQuery, IdHttp, IdSSLOpenSSL, UUtiles, DateUtils, Dialogs, Forms;

{$R *.dfm}

procedure TDMIDRIL.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xIDRILTransportista, MascaraN, MascaraI, ShortDateFormat);

  with xIDRILTransportista do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;

  RutaGLS := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  RutaCopiaEtiqueta := IncludeTrailingPathDelimiter(LeeDatoIni('IDRIL', 'RutaCopiaEtiqueta', GetSpecialFolderPath(CSIDL_PERSONAL, True)));
end;

procedure TDMIDRIL.xIDRILTransportistaNewRecord(DataSet: TDataSet);
begin
  xIDRILTransportistaEMPRESA.AsInteger := REntorno.Empresa;
  xIDRILTransportistaRUTA_EJECUTABLE.AsString := '';

  // Datos de la empresa como remitente
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT T.TERCERO, D.DIRECCION, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, D.DIR_COMPLETA, D.DIR_NOMBRE_2, D.DIR_NOMBRE_3, LO.TITULO LOCALIDAD, ');
        SQL.Add('        PR.TITULO PROVINCIA, PA.CODIGO_TEL, LO.CODIGO_POSTAL, D.DIR_TELEFONO01, D.DIR_TELEFONO02, T.EMAIL, ');
        SQL.Add('        CAST('''' AS VARCHAR(50)) DEPARTAMENTO, CAST('''' AS VARCHAR(80)) OBSERVACIONES, PA.PAIS_C2 ');
        SQL.Add(' FROM SYS_TERCEROS T ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
        SQL.Add(' JOIN SYS_LOCALIDADES LO ON D.ID_LOCAL = LO.ID_LOCAL ');
        SQL.Add(' JOIN SYS_PROVINCIAS PR ON LO.PROVINCIA = PR.PROVINCIA AND LO.PAIS = PR.PAIS ');
        SQL.Add(' JOIN SYS_PAISES PA ON LO.PAIS = PA.PAIS ');
        SQL.Add(' WHERE ');
        SQL.Add(' T.TERCERO = :TERCERO AND ');
        SQL.Add(' D.DIR_DEFECTO = 1 ');
        Params.ByName['TERCERO'].AsInteger := REntorno.Tercero;
        ExecQuery;

        xIDRILTransportistaREMITENTE_NOMBRE.AsString := FieldByName['NOMBRE_R_SOCIAL'].AsString;
        xIDRILTransportistaREMITENTE_DIRECCION.AsString := Trim(FieldByName['DIR_COMPLETA'].AsString);
        xIDRILTransportistaREMITENTE_POBLACION.AsString := FieldByName['LOCALIDAD'].AsString;
        xIDRILTransportistaREMITENTE_PAIS.AsString := '34';
        xIDRILTransportistaREMITENTE_CP.AsString := FieldByName['CODIGO_POSTAL'].AsString;
        xIDRILTransportistaREMITENTE_TELEFONO.AsString := FieldByName['DIR_TELEFONO01'].AsString;
        xIDRILTransportistaREMITENTE_MOVIL.AsString := FieldByName['DIR_TELEFONO02'].AsString;
        xIDRILTransportistaREMITENTE_EMAIL.AsString := FieldByName['EMAIL'].AsString;
        xIDRILTransportistaREMITENTE_DEPARTAMENTO.AsString := FieldByName['DEPARTAMENTO'].AsString;
        xIDRILTransportistaREMITENTE_OBSERVACIONES.AsString := FieldByName['OBSERVACIONES'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
