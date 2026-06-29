unit UFMLstCRM;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, Mask, rxToolEdit, ULFDateEdit,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  ULFLabel, ExtCtrls, ULFPanel, HYFIBQuery, rxPlacemnt, ULFFormStorage,
  UFPEditListadoSimple;

type
  TFMLstCRM = class(TFPEditListadoSimple)
     AConfiguracion: TAction;
     ToolButton1: TToolButton;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     EFDesdeCliente: TLFEditFind2000;
     EFHastaCliente: TLFEditFind2000;
     DEDesdeFecha: TLFDateEdit;
     DEHastaFecha: TLFDateEdit;
     procedure AConfiguracionExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImprimirExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     Usuario, Agente: integer;
     procedure Muestra(Us, Ag: integer);
  end;

var
  FMLstCRM : TFMLstCRM;

implementation

uses UDMMain, UDMLstCRM, UFormGest, UFMListConfig, UEntorno;

{$R *.dfm}

procedure TFMLstCRM.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstCRM, DMLstCRM);
end;

procedure TFMLstCRM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstCRM);
end;

procedure TFMLstCRM.Muestra(Us, Ag: integer);
var
  Q : THYFIBQuery;
begin
  Agente := Ag;
  Usuario := Us;

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT MIN(CLIENTE),MAX(CLIENTE) FROM EMP_CLIENTES WHERE EMPRESA=' + REntorno.EmpresaStr + 'AND AGENTE=' + IntToStr(Agente);
     ExecQuery;
     EFDesdeCliente.Text := FieldByName['MIN'].AsString;
     EFHastaCliente.Text := FieldByName['MAX'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);

  EFDesdeCliente.CondicionBusqueda := 'AGENTE=' + IntToStr(Agente);
  EFHastaCliente.CondicionBusqueda := 'AGENTE=' + IntToStr(Agente);
  DEDesdeFecha.Text := DateToStr(Now);
  DEHastaFecha.Text := DateToStr(Now);

  ShowModal;
end;

procedure TFMLstCRM.AConfiguracionExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  TFMListConfig.Create(Self).Muestra(5700, formato, cabecera, copias,
     pijama, '', DMLstCRM.frCRM);
end;

procedure TFMLstCRM.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMLstCRM.Listar(Agente, 1, StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), DEDesdeFecha.Date, DEHastaFecha.Date);
end;

procedure TFMLstCRM.APrevExecute(Sender: TObject);
begin
  inherited;
  DMLstCRM.Listar(Agente, 0, StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), DEDesdeFecha.Date, DEHastaFecha.Date);
end;

end.
