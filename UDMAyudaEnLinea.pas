unit UDMAyudaenLinea;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDatabase, UFIBModificados, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, FIBTableDataSetRO;

type
  TDMAyudaenLinea = class(TDataModule)
     DSQMFormularios: TDataSource;
     QMFormularios: TFIBTableSetRO;
     TLocal: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function Filtra(Formulario: string): string;
  end;

var
  DMAyudaenLinea : TDMAyudaenLinea;

implementation

uses UDMMain;

{$R *.DFM}

function TDMAyudaenLinea.Filtra(Formulario: string): string;
begin
  with QMFormularios do
  begin
     Close;
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Params.ByName['FORMULARIO'].AsString := Formulario;
     Open;
     Result := FieldByName('NOTAS').AsString;
     Close;
  end;
end;

procedure TDMAyudaenLinea.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TDMAyudaenLinea.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

end.
