unit UDMForeignKey;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery,
  DB, FIBDataSetRO, FIBTableDataSetRO;

type
  TDMForeignKey = class(TDataModule)
     TLocal: THYTransaction;
     QMForeignKey: TFIBTableSetRO;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function OpenFK(FKName: string): string;
  end;

var
  DMForeignKey : TDMForeignKey;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMForeignKey.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.Active then
     TLocal.StartTransaction;
end;

function TDMForeignKey.OpenFK(FKName: string): string;
var
  cOnField : TStringList;
  cFKField : TStringList;
  x : integer;
  c1, c2, cTemp, cTemp2 : string;
begin
  Result := EmptyStr;
  cOnField := TStringList.Create;
  cFKField := TStringList.Create;
  try
     cOnField.Clear;
     cFKField.Clear;
     with QMForeignKey do
     begin
        Close;
        Params.ByName['fk'].AsString := FKName;
        Open;
        while not EOF do
        begin
           if cOnField.IndexOf(Trim(FieldByName('ONFIELD').AsString)) = -1 then
              cOnField.Add(Trim(FieldByName('ONFIELD').AsString));
           if cFKField.IndexOf(Trim(FieldByName('FK_FIELD').AsString)) = -1 then
              cFKField.Add(Trim(FieldByName('FK_FIELD').AsString));
           Next;
        end;
        if (cOnField.Count = 0) or (cFKField.Count = 0) then
        begin // Si no hay datos
           Result := _('Algún valor introducido no tiene correspondencia en la base de' + #13#10 +
              'datos o se está borrando un dato al que se hace referencia.');
        end
        else
        begin
           if cOnField.Count > 1 then
              c1 := _('los campos')
           else
              c2 := _('el campo');

           if cFKField.Count > 1 then
              c2 := _('los campos') + ' '
           else
              c2 := _('el campo') + ' ';

           cTemp := EmptyStr;
           for x := 0 to cOnField.Count - 2 do
              cTemp := cTemp + Trim(cOnField.Strings[x]) + ',';
           cTemp := cTemp + Trim(cOnField.Strings[cOnField.Count - 1]);

           cTemp2 := EmptyStr;
           for x := 0 to cFKField.Count - 2 do
              cTemp2 := cTemp2 + Trim(cFKField.Strings[x]) + ',';
           cTemp2 := cTemp2 + Trim(cOnField.Strings[cOnField.Count - 1]);

           Result := Format(_('Esta intentando guardar en la tabla %s en %s (%s) que deberia tener su correspondencia en %s en %s (%s) por la integridad %s'),
              [QuotedStr(Trim(FieldByName('RDB$RELATION_NAME').AsString)), c1, cTemp, QuotedStr(Trim(FieldByName('FK_TABLE').AsString)), c2, cTemp2, QuotedStr(Trim(FieldByName('RDB$CONSTRAINT_NAME').AsString))]);
        end;
        Close;
     end;
  finally
     cOnField.Free;
     cFKField.Free;
  end;
end;

end.
