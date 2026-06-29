unit UFPregCPostal;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, ExtCtrls,
  ComCtrls, ToolWin, ActnList, Mask, DBCtrls, UFormGest, ULFActionList,
  ULFComboBox, ULFDBEdit, ULFPanel, ULFToolBar, ULFEditFind2000, ULFLabel,
  UFPEditListadoSimple, rxPlacemnt, ULFFormStorage;

type
  TFPregCPostal = class(TFPEditListadoSimple)
     Label1: TLFLabel;
     EFCPDesde: TLFEditFind2000;
     Label2: TLFLabel;
     EFCPHasta: TLFEditFind2000;
     DBECPDesde: TLFDbedit;
     DBECPHasta: TLFDbedit;
     //TButtConfRapida: TToolButton;
     CBOrden: TLFComboBox;
     LblOrden: TLFLabel;
     TButtConfRapida: TToolButton;
     procedure EFCPDesdeChange(Sender: TObject);
     procedure EFCPHastaChange(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
     TipoListado: string;  // 'CLI' o 'PROV'
     function DameOrden: string;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     procedure Muestra(const Listado: string);
  end;

var
  FPregCPostal : TFPregCPostal;

implementation

uses UDMLstClientes, UDMLSTProveedor, UFMListConfig;

{$R *.DFM}

procedure TFPregCPostal.FormCreate(Sender: TObject);
begin
  inherited;

  Grupo := 0;
  Listado := DMLstClientes.frClientes;
  ListadoFR3 := DMLstClientes.frxClientes;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
end;

procedure TFPregCPostal.Muestra(const Listado: string);
var
  CPMin, CPMax : string;
begin
  TipoListado := Listado;
  if (TipoListado = 'CLI') then
  begin
     DBECPDesde.DataSource := DMLSTClientes.DSQMCPDesde;
     DBECPHasta.DataSource := DMLSTClientes.DSQMCPHasta;
     DMLstClientes.DameMinMaxCPostal(CPMin, CPMax);
     CBOrden.Items[0] := _('Código de Cliente');
  end
  else if (TipoListado = 'PROV') then
  begin
     DBECPDesde.DataSource := DMLSTProveedor.DSQMCPDesde;
     DBECPHasta.DataSource := DMLSTProveedor.DSQMCPHasta;
     DMLstProveedor.DameMinMaxCPostal(CPMin, CPMax);
     CBOrden.Items[0] := _('Código de Proveedor');
  end;

  // Inicialización
  EFCPDesde.Text := CPMin;
  EFCPHasta.Text := CPMax;
  CBOrden.ItemIndex := 0;

  ShowModal;
end;

procedure TFPregCPostal.EFCPDesdeChange(Sender: TObject);
begin
  if (TipoListado = 'CLI') then
     DMLstClientes.RefrescaCPDesde(EFCPDesde.Text)
  else if (TipoListado = 'PROV') then
     DMLstProveedor.RefrescaCPDesde(EFCPDesde.Text);
end;

procedure TFPregCPostal.EFCPHastaChange(Sender: TObject);
begin
  if (TipoListado = 'CLI') then
     DMLstClientes.RefrescaCPHasta(EFCPHasta.Text)
  else if (TipoListado = 'PROV') then
     DMLstProveedor.RefrescaCPHasta(EFCPHasta.Text);
end;

function TFPregCPostal.DameOrden: string;
begin
  case CBOrden.ItemIndex of
     0:
     begin
        if (TipoListado = 'CLI') then
           Result := 'CLIENTE'
        else
           Result := 'PROVEEDOR';
     end;
     1: Result := 'NOMBRE';
     2: Result := 'COD_POSTAL';
     3: Result := 'LOCALIDAD';
     4: Result := 'PROVINCIA';
     5: Result := 'TELEFONO';
     6: Result := 'NIF';
  end;
end;

procedure TFPregCPostal.AConfigurarExecute(Sender: TObject);
begin
  if (TipoListado = 'CLI') then
  begin
     Grupo := 81;
     Listado := DMLstClientes.frClientes;
     ListadoFR3 := DMLstClientes.frxClientes;
  end
  else
  if (TipoListado = 'PROV') then
  begin
     Grupo := 82;
     Listado := DMLstProveedor.frProveedor;
     ListadoFR3 := DMLstProveedor.frxProveedor;
  end
  else
     Grupo := 0;

  inherited;
end;

procedure TFPregCPostal.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
var
  OrdenTxt : string;
begin
  OrdenTxt := DameOrden;

  if (TipoListado = 'CLI') then
     DMLstClientes.MostrarListadoCPostal(EFCPDesde.Text, EFCPHasta.Text, OrdenTxt, Modo)
  else if (TipoListado = 'PROV') then
     DMLstProveedor.MostrarListadoCPostal(EFCPDesde.Text, EFCPHasta.Text, OrdenTxt, Modo);
end;

end.
