unit UFMExportarClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ULFActionList, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, StdCtrls, ExtCtrls, ULFEdit,
  ULFPanel, UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000,
  ULFLabel, rxPlacemnt, ULFFormStorage, UFPEditListadoSimple;

type
  TFMExportarClientes = class(TFPEditListadoSimple)
     TButtExportar: TToolButton;
     LProvincia: TLFLabel;
     EFProvincia: TLFEditFind2000;
     PNLMain: TLFPanel;
     EProvincia: TLFEdit;
     LDesdeAgente: TLFLabel;
     EFDesdeAgente: TLFEditFind2000;
     EDesdeAgente: TLFEdit;
     LHastaAgente: TLFLabel;
     EFHastaAgente: TLFEditFind2000;
     EHastaAgente: TLFEdit;
     LRuta: TLFLabel;
     LDepartamento1: TLFLabel;
     LDepartamento2: TLFLabel;
     EFDepartamento1: TLFEditFind2000;
     EFDepartamento2: TLFEditFind2000;
     EDepartamento1: TLFEdit;
     EDepartamento2: TLFEdit;
     LAgrupacion1: TLFLabel;
     LAgrupacion2: TLFLabel;
     EFAgrupacion1: TLFEditFind2000;
     EFAgrupacion2: TLFEditFind2000;
     EAgrupacion1: TLFEdit;
     EAgrupacion2: TLFEdit;
     LPais: TLFLabel;
     EFPais: TLFEditFind2000;
     EPais: TLFEdit;
     RGTipo: TRadioGroup;
     ERuta: TLFEdit;
     SaveDialog1: TSaveDialog;
     procedure EFPaisChange(Sender: TObject);
     procedure RGTipoClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure AExportarExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure EFDesdeAgenteChange(Sender: TObject);
     procedure EFHastaAgenteChange(Sender: TObject);
     procedure EFDepartamento1Change(Sender: TObject);
     procedure EFDepartamento2Change(Sender: TObject);
     procedure EFAgrupacion1Change(Sender: TObject);
     procedure EFAgrupacion2Change(Sender: TObject);
     procedure EFProvinciaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMExportarClientes : TFMExportarClientes;

implementation

uses UUtiles, UDMMain, UEntorno, UDameDato;

{$R *.dfm}

procedure TFMExportarClientes.FormCreate(Sender: TObject);
begin
  inherited;
  EFAgrupacion1.CondicionBusqueda := 'TIPO=''C''';
  EFPais.Text := REntorno.Pais;
end;

procedure TFMExportarClientes.RGTipoClick(Sender: TObject);
begin
  inherited;
  {El Cliente Potencial utilizará la informacion de Agrupacion de Clientes }
  {
  case (RGTipo.ItemIndex) of
     0 : EFAgrupacion1.CondicionBusqueda := 'TIPO=''C''';
     1 : EFAgrupacion1.CondicionBusqueda := 'TIPO=''P''';
  end;
  EFAgrupacion2.CondicionBusqueda := EFAgrupacion1.CondicionBusqueda;
  }
end;

procedure TFMExportarClientes.EFPaisChange(Sender: TObject);
begin
  inherited;
  EFProvincia.CondicionBusqueda := 'PAIS=''' + EFPais.Text + '''';
  EPais.Text := DameTituloPais(EFPais.Text);
end;

procedure TFMExportarClientes.EFProvinciaChange(Sender: TObject);
begin
  inherited;
  EProvincia.Text := DameTituloProvincia(EFPais.Text, EFProvincia.Text);
end;

procedure TFMExportarClientes.EFDesdeAgenteChange(Sender: TObject);
begin
  inherited;
  EDesdeAgente.Text := DameTituloAgente(StrToIntDef(EFDesdeAgente.Text, 0));
end;

procedure TFMExportarClientes.EFHastaAgenteChange(Sender: TObject);
begin
  inherited;
  EHastaAgente.Text := DameTituloAgente(StrToIntDef(EFHastaAgente.Text, 0));
end;

procedure TFMExportarClientes.EFDepartamento1Change(Sender: TObject);
begin
  inherited;
  EDepartamento1.Text := DameTituloDepartamento(EFDepartamento1.Text);
end;

procedure TFMExportarClientes.EFDepartamento2Change(Sender: TObject);
begin
  inherited;
  EDepartamento2.Text := DameTituloDepartamento(EFDepartamento2.Text);
end;

procedure TFMExportarClientes.EFAgrupacion1Change(Sender: TObject);
begin
  inherited;
  case (RGTipo.ItemIndex) of
     0: EAgrupacion1.Text := DameTituloAgrupacion('C', EFAgrupacion1.Text);
     1: EAgrupacion1.Text := DameTituloAgrupacion('P', EFAgrupacion1.Text);
  end;
end;

procedure TFMExportarClientes.EFAgrupacion2Change(Sender: TObject);
begin
  inherited;
  case (RGTipo.ItemIndex) of
     0: EAgrupacion2.Text := DameTituloAgrupacion('C', EFAgrupacion2.Text);
     1: EAgrupacion2.Text := DameTituloAgrupacion('P', EFAgrupacion2.Text);
  end;
end;

procedure TFMExportarClientes.AExportarExecute(Sender: TObject);
var
  SQL : string;
begin
  inherited;
  if (SaveDialog1.Execute) then
  begin
     SQL := 'select ' +
        'c.cliente,c.agente, ' +
        't.tercero,t.nombre_r_social,t.nombre_comercial,t.tipo_razon,t.nif, ' +
        'd.direccion,d.dir_nombre,d.dir_nombre_2,d.dir_numero,d.dir_bloque_escalera,d.dir_piso,d.dir_puerta, ' +
        'd.dir_telefono01,d.dir_telefono02,d.dir_telefax,t.email, ' +
        'co.contacto,co.apellidos,co.nombre,co.correo,co.telefono,co.extension,co.fax,co.movil,co.departamento,de.titulo, ' +
        'l.codigo_postal,l.titulo,pr.provincia,pr.titulo,p.titulo, ' +
        'a.agrupacion,ag.titulo ' +
        'from ';

     if (RGTipo.ItemIndex = 0) then
        SQL := SQL + 'emp_clientes c '
     else
        SQL := SQL + 'emp_clientes_potenciales c  ';

     SQL := SQL + 'join sys_terceros t on (c.tercero=t.tercero) ' +
        'join sys_terceros_direcciones d on (t.tercero=d.tercero) ' +
        'left join sys_terceros_contactos co on (t.tercero=co.tercero) ' +
        'left join sys_departamentos de on (co.departamento=de.departamento) ' +
        'join sys_localidades l on (d.id_local = l.id_local) ' +
        'join sys_provincias pr on (l.pais=pr.pais and l.provincia=pr.provincia) ' +
        'join sys_paises p on (l.pais=p.pais) ';

     if (RGTipo.ItemIndex = 0) then
        SQL := SQL + 'left join emp_agrupaciones_cli a on (c.empresa=a.empresa and c.cliente=a.cliente) '
     else
        SQL := SQL + 'left join emp_agrupaciones_pot a on (c.empresa=a.empresa and c.cliente=a.cliente) ';

     SQL := SQL + 'left join sys_agrupaciones ag on (a.agrupacion=ag.agrupacion) ' +
        ' where ' +
        ' c.empresa=' + REntorno.EmpresaStr + ' and ' +
        ' d.dir_defecto=1 ';

     if (EFPais.Text > '') then
        SQL := SQL + ' and p.pais=''' + EFPais.Text + ''' ';
     if (EFProvincia.Text > '') then
        SQL := SQL + ' and pr.provincia=''' + EFProvincia.Text + ''' ';

     if (EFDepartamento1.Text > '') then
        if (EFDepartamento2.Text > '') then
           SQL := SQL + ' and de.departamento in (''' + EFDepartamento1.Text + ''',''' + EFDepartamento2.Text + ''') '
        else
           SQL := SQL + ' and de.departamento = ''' + EFDepartamento1.Text + '''';

     if (EFAgrupacion1.Text > '') then
        if (EFAgrupacion2.Text > '') then
           SQL := SQL + ' and a.agrupacion in (''' + EFAgrupacion1.Text + ''',''' + EFAgrupacion2.Text + ''') '
        else
           SQL := SQL + ' and a.agrupacion = ''' + EFAgrupacion1.Text + ''' ';

     if (EFDesdeAgente.Text > '') then
        SQL := SQL + ' and c.agente >= ' + IntToStr(StrToIntDef(EFDesdeAgente.Text, 0));

     if (EFHastaAgente.Text > '') then
        SQL := SQL + ' and c.agente <= ' + IntToStr(StrToIntDef(EFHastaAgente.Text, 0));

     if (ERuta.Text > '') then
        SQL := SQL + ' and c.ruta=''' + ERuta.Text + '''';

     SQL := SQL + ' /* despues de agregar caracteristicas de actividad ' +
        ' and calderas_condensacion > 0 ' +
        ' and calderas_convencioales > 0 ' +
        ' and biomasa > 0 ' +
        ' and bombas_calor > 0 ' +
        ' and climatizacion > 0 ' +
        ' and calefaccion_Y_ACS > 0 ' +
        ' and renovables > 0 ' +
        ' */ ';
     ExportarCSV(SaveDialog1.FileName, SQL);
  end;
end;

procedure TFMExportarClientes.ARecargarExecute(Sender: TObject);
begin
  inherited;
  EFAgrupacion1.CondicionBusqueda := 'TIPO=''C''';
  EFPais.Text := 'ESP';
  EFDesdeAgente.Text := '1';
  EFHastaAgente.Text := '99999';
  ERuta.Text := '';
  EFDepartamento1.Text := '';
  EFDepartamento2.Text := '';
  EFAgrupacion1.Text := '';
  EFAgrupacion2.Text := '';
end;

end.
