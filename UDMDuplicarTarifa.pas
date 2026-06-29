unit UDMDuplicarTarifa;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery,
  DB, FIBDataSet, FIBDataSetRO;

type
  TDMDuplicarTarifa = class(TDataModule)
     SPDuplicar: THYFIBQuery;
     TLocal: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Duplicar(Origen, Destino: string);
  end;

var
  DMDuplicarTarifa : TDMDuplicarTarifa;

implementation

uses UDMMain, Dialogs, Controls, UEntorno, UDameDato;

{$R *.dfm}

procedure TDMDuplicarTarifa.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMDuplicarTarifa.Duplicar(Origen, Destino: string);
begin
  // Control de que la tarifa ya existe
  if (Trim(DameTituloTarifa(Destino)) > '') then
  begin
     if (MessageDlg(_('La tarifa destino contiene datos, ¿quiere realmente eliminarla?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
     begin
        begin
           with SPDuplicar do
           begin
              Close;
              Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
              Params.ByName['Tarifa_o'].AsString := Origen;
              Params.ByName['Tarifa_d'].AsString := Destino;
              ExecQuery;
           end;
        end;
        ShowMessage(_('Duplicación de tarifa hecha.'));
        DMDuplicarTarifa.SPDuplicar.FreeHandle;
     end
     else
        ShowMessage(_('La tarifa no ha sido duplicada'));
  end;
end;

end.
