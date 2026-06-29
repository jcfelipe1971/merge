unit UDMSafemoney;

interface

uses
  SysUtils, Classes, ExtCtrls;

type
  TDMSafemoney = class(TDataModule)
     tmrSafemoney: TTimer;
     procedure DataModuleCreate(Sender: TObject);
     procedure tmrSafemoneyTimer(Sender: TObject);
  private
     { Private declarations }
     // Carpeta para comunicaciones
     Carpeta: string;
     // Estado del cajon
     FImporteACobrar: double;
     FImporteCobradoParcial: double;
     FImporteCobrado: double;
     FCambioEntregado: double;
     FCambioNoEntregado: double;
     FErrorDeCobro: string;
     // Se pueden leer los resultados. El cobro se ha completado.
     FOperacionTerminada: boolean;
  public
     { Public declarations }
     procedure Inicializar;
     procedure Cobrar(Importe: double);
     procedure Cancelar;
     procedure Actualizar;
     property ImporteACobrar: double Read FImporteACobrar Write Cobrar;
     property ImporteCobradoParcial: double Read FImporteCobradoParcial;
     property ImporteCobrado: double Read FImporteCobrado;
     property CambioEntregado: double Read FCambioEntregado;
     property CambioNoEntregado: double Read FCambioNoEntregado;
     property ErrorDeCobro: string Read FErrorDeCobro;
     property OperacionTerminada: boolean Read FOperacionTerminada;
  end;

var
  DMSafemoney : TDMSafemoney;

implementation

uses
  UUtiles;

{$R *.dfm}

{ TDMSafemoney }

procedure TDMSafemoney.DataModuleCreate(Sender: TObject);
begin
  Inicializar;
end;

procedure TDMSafemoney.Inicializar;
begin
  Carpeta := LeeDatoIni('Safemoney', 'Carpeta', '');
  if (Carpeta = '') then
  begin
     Carpeta := 'C:\Safemoney\';
     EscribeDatoIni('Safemoney', 'Carpeta', IncludeTrailingPathDelimiter(Carpeta));
  end;

  DeleteFile(Carpeta + 'tobepaid.txt');
  DeleteFile(Carpeta + 'amount.txt');
  DeleteFile(Carpeta + 'paid.txt');
  DeleteFile(Carpeta + 'dispensed.txt');
  DeleteFile(Carpeta + 'notDispensed.txt');
  DeleteFile(Carpeta + 'error.txt');
  DeleteFile(Carpeta + 'void.txt');
  DeleteFile(Carpeta + 'getLevels.txt');
  DeleteFile(Carpeta + 'levels.xml');

  FImporteACobrar := 0;
  FImporteCobradoParcial := 0;
  FImporteCobrado := 0;
  FCambioEntregado := 0;
  FCambioNoEntregado := 0;
  FErrorDeCobro := '';
  FOperacionTerminada := True;

  tmrSafemoney.Tag := 0;
  tmrSafemoney.Enabled := False;
end;

procedure TDMSafemoney.Cobrar(Importe: double);
begin
  DeleteFile(Carpeta + 'amount.txt');
  DeleteFile(Carpeta + 'paid.txt');
  DeleteFile(Carpeta + 'dispensed.txt');
  DeleteFile(Carpeta + 'notDispensed.txt');
  DeleteFile(Carpeta + 'error.txt');
  DeleteFile(Carpeta + 'void.txt');

  try
     FImporteACobrar := Importe;
     FImporteCobradoParcial := 0;
     FImporteCobrado := 0;
     FCambioEntregado := 0;
     FCambioNoEntregado := 0;
     FErrorDeCobro := '';
     FOperacionTerminada := False;

     with TStringList.Create do
     begin
        try
           Add(format('%9.9d', [Round(FImporteACobrar * 100)]));
           SaveToFile(Carpeta + 'tobepaid.txt');
        finally
           Free;
        end;
     end;

     // Establece cuantos ciclos esperar antes de dar por "cobrado"/"error de cobro" la operacion.
     // Una vez aparece el fichero paid.txt se considera cobrado, pero pueden no estar todavia creado otros ficheros con el cambio (dispensed.txt por ejemplo).
     tmrSafemoney.Tag := 4;
     tmrSafemoney.Enabled := True;
  except
     on E: Exception do
     begin
        FImporteACobrar := 0;
        FErrorDeCobro := E.Message;
        FOperacionTerminada := True;
     end;
  end;
end;

procedure TDMSafemoney.Cancelar;
begin
  FImporteACobrar := 0;
  FImporteCobradoParcial := 0;
  FImporteCobrado := 0;
  FCambioEntregado := 0;
  FCambioNoEntregado := 0;
  FErrorDeCobro := '';
  FOperacionTerminada := True;

  with TStringList.Create do
  begin
     try
        Add('CANCELAR');
        SaveToFile(Carpeta + 'void.txt');
     finally
        Free;
     end;
  end;

  tmrSafemoney.Tag := 0;
  tmrSafemoney.Enabled := False;
end;

procedure TDMSafemoney.Actualizar;

  procedure ActualizaVariable(Fichero: string; var Variable: double);
  var
     si, so : string;
     i : integer;
  begin
     // Solo actuo si existe el fichero
     if (FileExists(Carpeta + Fichero)) then
     begin
        with TStringList.Create do
        begin
           try
              // Leo contenido de fichero
              LoadFromFile(Carpeta + Fichero);
              si := Trim(Text);
           finally
              Free;
           end;
        end;

        // Limpio caracteres no numericos
        so := '';
        for i := 1 to Length(si) do
           if (si[i] in ['0'..'9']) then
              so := so + si[i];

        // Transformo a numero
        Variable := StrToIntDef(so, 0) / 100;

        DeleteFile(Carpeta + Fichero);
     end;
  end;

begin
  ActualizaVariable('amount.txt', FImporteCobradoParcial);
  ActualizaVariable('dispensed.txt', FCambioEntregado);
  ActualizaVariable('notDispensed.txt', FCambioNoEntregado);
  ActualizaVariable('paid.txt', FImporteCobrado);

  if (FileExists(Carpeta + 'error.txt')) then
  begin
     with TStringList.Create do
     begin
        try
           LoadFromFile(Carpeta + 'error.txt');
           FErrorDeCobro := Trim(Text);
        finally
           Free;
        end;
     end;

     DeleteFile(Carpeta + 'error.txt');
  end;
end;

procedure TDMSafemoney.tmrSafemoneyTimer(Sender: TObject);
begin
  tmrSafemoney.Enabled := False;
  try
     Actualizar;
  finally
     tmrSafemoney.Enabled := True;

     if (FImporteCobrado >= FImporteACobrar) then
     begin
        // Si se cobro, espero un ciclo a la creacion de otros ficheros que puedan dar informacion de errores o cambio
        tmrSafemoney.Tag := tmrSafemoney.Tag - 1;
        if (tmrSafemoney.Tag <= 0) then
        begin
           tmrSafemoney.Enabled := False;
           FOperacionTerminada := True;
        end;
     end
     else
     if (FErrorDeCobro <> '') then
     begin
        // Si hubo error de cobro, espero un ciclo a la creacion de otros ficheros que puedan dar informacion de errores o cambio
        tmrSafemoney.Tag := tmrSafemoney.Tag - 1;
        if (tmrSafemoney.Tag <= 0) then
        begin
           tmrSafemoney.Enabled := False;
           FOperacionTerminada := True;
        end;
     end;
  end;
end;

end.
