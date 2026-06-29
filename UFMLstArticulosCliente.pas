unit UFMLstArticulosCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, ULFLabel, Mask, DBCtrls,
  ULFDBEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, rxPlacemnt, ULFFormStorage, ULFEdit,
  ExtCtrls, ULFPanel, UFPEditListadoSimple;

type
  TFMLstArticulosCliente = class(TFPEditListadoSimple)
     EFDesdeCliente: TLFEditFind2000;
     EFHastaCliente: TLFEditFind2000;
     EDesdeCliente: TLFEdit;
     EHastaCliente: TLFEdit;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     ToolButtonConfigurar: TToolButton;
     CBMargen: TLFCheckBox;
     procedure APrevExecute(Sender: TObject);
     procedure ASalirExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFDesdeClienteChange(Sender: TObject);
     procedure EFHastaClienteChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMLstArticulosCliente : TFMLstArticulosCliente;

implementation

uses UDMLstArticulosCliente, UFormGest, UEntorno, UDMMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TFMLstArticulosCliente.APrevExecute(Sender: TObject);
begin
  inherited;
  DMLstArticulosCliente.MostrarListado(0, StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), CBMargen.Checked);
end;

procedure TFMLstArticulosCliente.ASalirExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFMLstArticulosCliente.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstArticulosCliente, DMLstArticulosCliente);
  ARecargar.Execute;

  Grupo := 9003;
  Listado := DMLstArticulosCliente.frArticulosCliente;
end;

procedure TFMLstArticulosCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstArticulosCliente);
end;

procedure TFMLstArticulosCliente.EFDesdeClienteChange(Sender: TObject);
begin
  inherited;
  EDesdeCliente.Text := DameTituloCliente(StrToIntDef(EFDesdeCliente.Text, 0));
end;

procedure TFMLstArticulosCliente.EFHastaClienteChange(Sender: TObject);
begin
  inherited;
  EHastaCliente.Text := DameTituloCliente(StrToIntDef(EFHastaCliente.Text, 0));
end;

procedure TFMLstArticulosCliente.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
begin
  inherited;

  DameMinMax('CLI', Min, Max);
  EFDesdeCliente.Text := IntToStr(Min);
  EFHastaCliente.Text := IntToStr(Max);
end;

procedure TFMLstArticulosCliente.AImprimirExecute(Sender: TObject);
begin
  inherited;
  DMLstArticulosCliente.MostrarListado(1, StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), CBMargen.Checked);
end;

end.
