unit UFPregEtiCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFEdit, ULFPanel, ULFToolBar, ULFEditFind2000, ULFLabel,
  UFPEditListadoSimple, rxPlacemnt, ULFFormStorage;

type
  TFPregEtiCliente = class(TFPEditListadoSimple)
     LBLEtiVacias: TLFLabel;
     LBLEtiquetas: TLFLabel;
     EEtiVacias: TLFEdit;
     EEtiquetas: TLFEdit;
     LBLDireccion: TLFLabel;
     EFDireccion: TLFEditFind2000;
     TButtConfRapida: TToolButton;
     procedure AImprimirExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFDireccionBusqueda(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
  private
     { Private declarations }
     Ter: integer;
     vacias, copias, direccion: integer;
     Tipo: string;
     procedure AsignarDatos;
  public
     { Public declarations }
     procedure Muestra(tercero: integer; tipo_listado: string);
  end;

var
  FPregEtiCliente : TFPregEtiCliente;

implementation

uses UDMLstTarifas, UUtiles, UEntorno, {UDMLstAlbaranesEti, dji lrk kri - no se necesita} UDMMain,
  UDMLSTClientes, UDMLSTProveedor, UFMListConfig;

{$R *.DFM}

procedure TFPregEtiCliente.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMLstClientes, DMLstClientes);
  AbreData(TDMLstProveedor, DMLstProveedor);
end;

procedure TFPregEtiCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMLstClientes);
  CierraData(DMLstProveedor);
end;

procedure TFPregEtiCliente.AImprimirExecute(Sender: TObject);
begin
  AsignarDatos;
  if (tipo = 'CLI') then
     DMLstClientes.MostrarListadoEti(Ter, vacias, copias, 1, direccion)
  else if (tipo = 'PROV') then
     DMLstProveedor.MostrarListadoEti(Ter, vacias, copias, 1, direccion);
end;

procedure TFPregEtiCliente.APrevExecute(Sender: TObject);
begin
  AsignarDatos;
  if (tipo = 'CLI') then
     DMLstClientes.MostrarListadoEti(Ter, vacias, copias, 0, direccion)
  else if (tipo = 'PROV') then
     DMLstProveedor.MostrarListadoEti(Ter, vacias, copias, 0, direccion);
end;

procedure TFPregEtiCliente.Muestra(tercero: integer; tipo_listado: string);
begin
  if (tipo_listado = 'CLI') then
     Caption := _('Etiquetas de Clientes')
  else if (tipo_listado = 'PROV') then
     Caption := _('Etiquetas de Proveedores');
  Tipo := Tipo_listado;
  Ter := Tercero;
  EEtiVacias.Text := '0';
  EEtiquetas.Text := '1';
  EFDireccion.Text := '1';
  ShowModal;
end;

procedure TFPregEtiCliente.EFDireccionBusqueda(Sender: TObject);
begin
  EFDireccion.CondicionBusqueda := 'Tercero=' + IntToStr(Ter);
end;

procedure TFPregEtiCliente.AsignarDatos;
begin
  vacias := StrToIntDef(EEtiVacias.Text, 0);
  copias := StrToIntDef(EEtiquetas.Text, 0);
  direccion := StrToIntDef(EFDireccion.Text, 0);
end;

procedure TFPregEtiCliente.AConfigurarExecute(Sender: TObject);
begin
  if (Tipo = 'CLI') then
  begin
     Grupo := 59;
     Listado := DMLstClientes.frClientes;
     ListadoFR3 := DMLstClientes.frxClientes;
  end
  else
  if (Tipo = 'PROV') then
  begin
     Grupo := 61;
     Listado := DMLstProveedor.frProveedor;
     ListadoFR3 := DMLstProveedor.frxProveedor;
  end
  else
     Grupo := 0;

  inherited;
end;

end.
