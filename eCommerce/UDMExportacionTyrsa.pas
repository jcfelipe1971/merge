unit UDMExportacionTyrsa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, FIBTableDataSet;

type
  TDMExportacionTyrsa = class(TDataModule)
     xTablasExportar: TFIBTableSet;
     DSxTablasExportar: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xTablasExportarNOMBRE: TFIBStringField;
     xTablasExportarMARCADO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     procedure ExportarTabla(RutaExportacion, Tabla: string);
  public
     { Public declarations }
     procedure Exportar(RutaExportacion: string);
  end;

var
  DMExportacionTyrsa : TDMExportacionTyrsa;

implementation

uses
  UDMMain, UUtiles, UEntorno, Dialogs, UFMExportacionTyrsa;

{$R *.dfm}

procedure TDMExportacionTyrsa.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  xTablasExportar.Open;
  xTablasExportar.FetchAll;
end;

procedure TDMExportacionTyrsa.Exportar(RutaExportacion: string);
begin
  if not (DirectoryExists(RutaExportacion)) then
  begin
     raise Exception.Create(Format(_('No existe la carpeta %s'), [RutaExportacion]));
  end;

  with xTablasExportar do
  begin
     First;
     while not EOF do
     begin
        if (xTablasExportarMARCADO.AsInteger = 1) then
           ExportarTabla(RutaExportacion, Trim(xTablasExportarNOMBRE.AsString));

        FMExportacionTyrsa.ActualizaProgreso(RecNo);
        Next;
     end;

     First;
  end;
end;

procedure TDMExportacionTyrsa.ExportarTabla(RutaExportacion, Tabla: string);
begin
  ExportarCSV(RutaExportacion + Tabla + '.csv', format('SELECT * FROM %s', [Tabla]));
end;

end.
