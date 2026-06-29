unit UProFMDiario;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, UTeclas, UControlEdit, Grids, DBGrids, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UNavigator, ToolWin, ComCtrls, Buttons,
  ExtCtrls, StdCtrls, DBCtrls, Mask, NsDBGrid, DateUtils,
  rxToolEdit, UFPEdit, ULFDBEdit, ULFPanel, ULFEditFind2000, ULFLabel,
  UHYDescription, ULFHYDBDescription, UEditPanel, ULFToolBar, ULFEdit, ActnList,
  rxPlacemnt, ULFFormStorage, ULFDateEdit, UFormGest;

type
  TProFMDiario = class(TG2KForm)
     LTotalCoste: TLFLabel;
     PEFiltro: TLFPanel;
     LFechaDesde: TLFLabel;
     LFechaHasta: TLFLabel;
     FechaD: TLFDateEdit;
     FechaH: TLFDateEdit;
     PEMain: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     Recurso: TEditFind2000;
     LRecurso: TLFLabel;
     LTotalTiempo: TLFLabel;
     LTotalUnidades: TLFLabel;
     DBTTotalCoste: TDBText;
     DBTTotalTiempo: TDBText;
     DBTTotalUnidades: TDBText;
     DBEDescripRecurso: TLFDbedit;
     LOperario: TLFLabel;
     LFEOperario: TLFEditFind2000;
     DescOperario: TLFDbedit;
     LFToolBar1: TLFToolBar;
     TBFiltrar: TToolButton;
     ToolButton2: TToolButton;
     EPSalir: THYMEditPanel;
     LMaquina: TLFLabel;
     LTrabajadorExterno: TLFLabel;
     LVarios: TLFLabel;
     LFEMaquina: TLFEditFind2000;
     LFEVarios: TLFEditFind2000;
     DescMaquina: TLFDbedit;
     DescTExt: TLFDbedit;
     DescVarios: TLFDbedit;
     LFEText: TLFEditFind2000;
     LCompuesto: TLFLabel;
     LOrden: TLFLabel;
     LFEFCompuesto: TLFEditFind2000;
     LFOrden: TLFEditFind2000;
     PanelTotales: TLFPanel;
     DescCompuesto: TLFEdit;
     TBNuevo: TToolButton;
     FSMain: TLFFibFormStorage;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure RecursoChange(Sender: TObject);
     procedure SpeedButton2Click(Sender: TObject);
     procedure LFEOperarioChange(Sender: TObject);
     procedure TBFiltrarClick(Sender: TObject);
     procedure LFEMaquinaChange(Sender: TObject);
     procedure LFETextChange(Sender: TObject);
     procedure LFEVariosChange(Sender: TObject);
     procedure EPSalirClickRango(Sender: TObject; var Continua: boolean);
     procedure LFEFCompuestoBusqueda(Sender: TObject);
     procedure LFOrdenBusqueda(Sender: TObject);
     procedure LFEFCompuestoChange(Sender: TObject);
     procedure TBNuevoClick(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMDiario : TProFMDiario;

implementation

uses UDMMain, UFMain, UEntorno, UProDMDiario;

{$R *.dfm}

procedure TProFMDiario.FormCreate(Sender: TObject);
var
  Present : TDateTime;
  Year, Month, Day : word;
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMDiario, ProDMDiario);
  DBGFDetalle.DataSource := ProDMDiario.DSQMProDetMarca;
  Present := REntorno.FechaTrabSH;
  DecodeDate(Present, Year, Month, Day);

  FechaD.Date := EncodeDate(Year, Month, StrToInt('01'));
  FechaH.Date := EncodeDate(Year, Month, DaysInAMonth(Year, Month));

  //Poso a fals el component d'operari
  Recurso.Text := '';

  LFEOperario.Enabled := False;
  DescOperario.Enabled := False;
  LFEMaquina.Enabled := False;
  DescMaquina.Enabled := False;
  LFEText.Enabled := False;
  DescTExt.Enabled := False;
  LFEvarios.Enabled := False;
  DescVarios.Enabled := False;
end;

procedure TProFMDiario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(ProDMDiario);
end;

procedure TProFMDiario.RecursoChange(Sender: TObject);
begin
  with ProDMDiario.xRecurso do
  begin
     Close;
     Params.ByName['TIPORECURSO'].AsString := Recurso.Text;
     Open;
  end;

  //Netejem els camps
  LFEOperario.Clear;
  LFEMaquina.Clear;
  DescMaquina.Clear;
  LFEText.Clear;
  DescTExt.Clear;
  LFEVarios.Clear;
  DescVarios.Clear;

  ProDMDiario.QMProDetMarca.Close;

  if (Recurso.Text = 'MO') then
  begin
     LFEOperario.Enabled := True;
     DescOperario.Enabled := True;
     LFEMaquina.Enabled := False;
     DescMaquina.Enabled := False;
     LFEText.Enabled := False;
     DescTExt.Enabled := False;
     LFEVarios.Enabled := False;
     DescVarios.Enabled := False;

     LFEOperario.SetFocus;
  end
  else
  if (Recurso.Text = 'HM') then
  begin
     LFEOperario.Enabled := False;
     DescOperario.Enabled := False;
     LFEMaquina.Enabled := True;
     DescMaquina.Enabled := True;
     LFEText.Enabled := False;
     DescTExt.Enabled := False;
     LFEVarios.Enabled := False;
     DescVarios.Enabled := False;

     LFEMaquina.SetFocus;
  end
  else
  if (Recurso.Text = 'TE') then
  begin
     LFEOperario.Enabled := False;
     DescOperario.Enabled := False;
     LFEMaquina.Enabled := False;
     DescMaquina.Enabled := False;
     LFEText.Enabled := True;
     DescTExt.Enabled := True;
     LFEVarios.Enabled := False;
     DescVarios.Enabled := False;

     LFEText.SetFocus;
  end
  else
  if (Recurso.Text = 'VAR') then
  begin
     LFEOperario.Enabled := False;
     DescOperario.Enabled := False;
     LFEMaquina.Enabled := False;
     DescMaquina.Enabled := False;
     LFEText.Enabled := False;
     DescTExt.Enabled := False;
     LFEVarios.Enabled := True;
     DescVarios.Enabled := True;

     LFEVarios.SetFocus;
  end;
end;

procedure TProFMDiario.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TProFMDiario.LFEOperarioChange(Sender: TObject);
begin
  if (LFEOperario.Text <> '') then
  begin
     ProDMDiario.xOperario.Close;
     ProDMDiario.xOperario.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ProDMDiario.xOperario.Params.ByName['EMPLEADO'].AsInteger := StrToInt(LFEOperario.Text);
     ProDMDiario.xOperario.Open;
  end;
  //  Descoperario.ActualizaDatos('EMPLEADO', LFEOperario.Text);
end;

procedure TProFMDiario.TBFiltrarClick(Sender: TObject);
begin
  ProDMDiario.QMProDetMarca.Close;
  ProDMDiario.QMProDetMarca.SelectSQL.Clear;
  ProDMDiario.QMProDetMarcaT.Close;
  ProDMDiario.QMProDetMarcaT.SelectSQL.Clear;

  //SFG.Albert - Es treu tots els filtres de ejercicio, ja que volem que es vegin
  //             anys anteriors a l'actual

  if (Recurso.Text <> '') then
  begin
     if (LFEFCompuesto.Text <> '') then
     begin
        ProDMDiario.QMProDetMarca.SelectSQL.Add('select marc.* from pro_ver_diario_marcajes marc');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('left join pro_ord ord on (marc.id_orden=ord.id_orden)');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('Where marc.Empresa=?Empresa and');
        //ProDMDiario.QMProDetMarca.SelectSql.Add('Ejercicio=?Ejercicio and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Canal=?Canal and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Serie=?Serie and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Tipo=?Tipo and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Fecha>=?FechaD and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Fecha<=?FechaH and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('ord.compuesto=?compuesto');
        if (LFOrden.Text <> '') then
           ProDMDiario.QMProDetMarca.SelectSQL.Add('and marc.id_orden=?id_orden');
     end
     else
     begin   //Sense compuesto
        ProDMDiario.QMProDetMarca.SelectSQL.Add('SELECT * FROM PRO_VER_DIARIO_MARCAJES marc');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('Where marc.Empresa=?Empresa and');
        //ProDMDiario.QMProDetMarca.SelectSql.Add('Ejercicio=?Ejercicio and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Canal=?Canal and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Serie=?Serie and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Tipo=?Tipo and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Fecha>=?FechaD and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Fecha<=?FechaH');
        if (LFOrden.Text <> '') then
           ProDMDiario.QMProDetMarca.SelectSQL.Add('and marc.id_orden=?id_orden');
     end;

     if (LFEOperario.Text <> '') then
        ProDMDiario.QMProDetMarca.SelectSQL.Add('and marc.Operario=?Operario')
     else if (LFEMaquina.Text <> '') then
        ProDMDiario.QMProDetMarca.SelectSQL.Add('and marc.Maquina=?Maquina')
     else if (LFEText.Text <> '') then
        ProDMDiario.QMProDetMarca.SelectSQL.Add('and marc.Proveedor=?Proveedor')
     else if (LFEvarios.Text <> '') then
        ProDMDiario.QMProDetMarca.SelectSQL.Add('and marc.Varios=?Varios');

     ProDMDiario.QMProDetMarca.SelectSQL.Add(
        'Order by marc.Fecha, marc.Rig_Of, marc.SubOrden, marc.Linea_Fase, marc.Linea_Tarea, marc.Hora_Inicio');

     ProDMDiario.QMProDetMarca.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     //ProDMDiario.QMProDetMarca.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     ProDMDiario.QMProDetMarca.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     ProDMDiario.QMProDetMarca.Params.ByName['Serie'].AsString := REntorno.Serie;
     ProDMDiario.QMProDetMarca.Params.ByName['Tipo'].AsString := Recurso.Text;
     ProDMDiario.QMProDetMarca.Params.ByName['FechaD'].AsDateTime := FechaD.Date;
     ProDMDiario.QMProDetMarca.Params.ByName['FechaH'].AsDateTime := FechaH.Date;
     if (LFEFCompuesto.Text <> '') then
        ProDMDiario.QMProDetMarca.Params.ByName['compuesto'].AsString := LFEFCompuesto.Text;
     if (LFOrden.Text <> '') then
        ProDMDiario.QMProDetMarca.Params.ByName['id_orden'].AsInteger := StrToInt(LFOrden.Text);

     if (LFEOperario.Text <> '') then
        ProDMDiario.QMProDetMarca.Params.ByName['Operario'].AsInteger := StrToInt(LFEOperario.Text)
     else if (LFEMaquina.Text <> '') then
        ProDMDiario.QMProDetMarca.Params.ByName['Maquina'].AsInteger := StrToInt(LFEMaquina.Text)
     else if (LFEText.Text <> '') then
        ProDMDiario.QMProDetMarca.Params.ByName['Proveedor'].AsInteger := StrToInt(LFEText.Text)
     else if (LFEVarios.Text <> '') then
        ProDMDiario.QMProDetMarca.Params.ByName['Varios'].AsString := LFEVarios.Text;
  end
  else  // ********* No hi ha recurs ***********
  begin
     //Es mostra el llistat si només es posa el compuesto
     if (LFEFCompuesto.Text <> '') then
     begin
        ProDMDiario.QMProDetMarca.SelectSQL.Add('select marc.* from pro_ver_diario_marcajes marc');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('left join pro_ord ord on (marc.id_orden=ord.id_orden)');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('Where marc.Empresa=?Empresa and');
        //ProDMDiario.QMProDetMarca.SelectSql.Add('Ejercicio=?Ejercicio and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Canal=?Canal and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Serie=?Serie and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Fecha>=?FechaD and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Fecha<=?FechaH and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('ord.compuesto=?compuesto');
        if (LFOrden.Text <> '') then
           ProDMDiario.QMProDetMarca.SelectSQL.Add('and marc.id_orden=?id_orden');
     end
     else
     begin
        ProDMDiario.QMProDetMarca.SelectSQL.Add('SELECT * FROM PRO_VER_DIARIO_MARCAJES marc');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('Where marc.Empresa=?Empresa and');
        //ProDMDiario.QMProDetMarca.SelectSql.Add('Ejercicio=?Ejercicio and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Canal=?Canal and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Serie=?Serie and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Fecha>=?FechaD and');
        ProDMDiario.QMProDetMarca.SelectSQL.Add('marc.Fecha<=?FechaH');
        if (LFOrden.Text <> '') then
           ProDMDiario.QMProDetMarca.SelectSQL.Add('and marc.id_orden=?id_orden');
        ProDMDiario.QMProDetMarca.SelectSQL.Add(
           'Order by marc.Fecha, marc.Rig_Of, marc.SubOrden, marc.Linea_Fase, marc.Linea_Tarea, marc.Hora_Inicio');
     end;

     ProDMDiario.QMProDetMarca.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     //ProDMDiario.QMProDetMarca.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     ProDMDiario.QMProDetMarca.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     ProDMDiario.QMProDetMarca.Params.ByName['Serie'].AsString := REntorno.Serie;
     ProDMDiario.QMProDetMarca.Params.ByName['FechaD'].AsDateTime := FechaD.Date;
     ProDMDiario.QMProDetMarca.Params.ByName['FechaH'].AsDateTime := FechaH.Date;
     ProDMDiario.QMProDetMarca.Params.ByName['FechaH'].AsDateTime := FechaH.Date;
     if (LFEFCompuesto.Text <> '') then
        ProDMDiario.QMProDetMarca.Params.ByName['compuesto'].AsString := LFEFCompuesto.Text;
     if (LFOrden.Text <> '') then
        ProDMDiario.QMProDetMarca.Params.ByName['id_orden'].AsInteger := StrToInt(LFOrden.Text);
  end;

  // ************************** T O T A L E S **********************************
  if Recurso.Text <> '' then
  begin
     if (LFEFCompuesto.Text <> '') then
     begin
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('SELECT Sum(marc.Unidades_Fab)As TUnds, Sum(marc.Total_Recurso)As TImporte, Sum(marc.Tiempo_dec)As TTiempo FROM PRO_VER_DIARIO_MARCAJES marc');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('left join pro_ord ord on (marc.id_orden=ord.id_orden)');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('Where marc.Empresa=?Empresa and');
        //ProDMDiario.QMProDetMarcaT.SelectSql.Add('Ejercicio=?Ejercicio and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Canal=?Canal and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Serie=?Serie and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Tipo=?Tipo and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Fecha>=?FechaD and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Fecha<=?FechaH and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('ord.compuesto=?compuesto');
        if (LFOrden.Text <> '') then
           ProDMDiario.QMProDetMarcaT.SelectSQL.Add('and marc.id_orden=?id_orden');
     end
     else  //Sense compuesto
     begin
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add(
           'SELECT Sum(marc.Unidades_Fab)As TUnds, Sum(marc.Total_Recurso)As TImporte, Sum(marc.Tiempo_dec)As TTiempo FROM PRO_VER_DIARIO_MARCAJES marc');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('Where marc.Empresa=?Empresa and');
        //ProDMDiario.QMProDetMarcaT.SelectSql.Add('Ejercicio=?Ejercicio and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Canal=?Canal and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Serie=?Serie and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Tipo=?Tipo and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Fecha>=?FechaD and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Fecha<=?FechaH');
        if (LFOrden.Text <> '') then
           ProDMDiario.QMProDetMarcaT.SelectSQL.Add('and marc.id_orden=?id_orden');
     end;

     if (LFEOperario.Text <> '') then
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('and marc.Operario=?Operario')
     else if (LFEMaquina.Text <> '') then
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('and marc.Maquina=?Maquina')
     else if (LFEText.Text <> '') then
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('and marc.Proveedor=?Proveedor')
     else if (LFEvarios.Text <> '') then
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('and marc.Varios=?Varios');

     ProDMDiario.QMProDetMarcaT.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     //    ProDMDiario.QMProDetMarcaT.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     ProDMDiario.QMProDetMarcaT.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     ProDMDiario.QMProDetMarcaT.Params.ByName['Serie'].AsString := REntorno.Serie;
     ProDMDiario.QMProDetMarcaT.Params.ByName['Tipo'].AsString := Recurso.Text;
     ProDMDiario.QMProDetMarcaT.Params.ByName['FechaD'].AsDateTime := FechaD.Date;
     ProDMDiario.QMProDetMarcaT.Params.ByName['FechaH'].AsDateTime := FechaH.Date;
     if (LFEFCompuesto.Text <> '') then
        ProDMDiario.QMProDetMarcaT.Params.ByName['compuesto'].AsString := LFEFCompuesto.Text;
     if (LFOrden.Text <> '') then
        ProDMDiario.QMProDetMarcaT.Params.ByName['id_orden'].AsInteger := StrToInt(LFOrden.Text);
     if (LFEOperario.Text <> '') then
        ProDMDiario.QMProDetMarcaT.Params.ByName['Operario'].AsInteger := StrToInt(LFEOperario.Text)
     else if (LFEMaquina.Text <> '') then
        ProDMDiario.QMProDetMarcaT.Params.ByName['Maquina'].AsInteger := StrToInt(LFEMaquina.Text)
     else if (LFEText.Text <> '') then
        ProDMDiario.QMProDetMarcaT.Params.ByName['Proveedor'].AsInteger := StrToInt(LFEText.Text)
     else if (LFEVarios.Text <> '') then
        ProDMDiario.QMProDetMarcaT.Params.ByName['Varios'].AsString := LFEVarios.Text;
  end
  else  //***** Sense Recurs ****
  begin
     if (LFEFCompuesto.Text <> '') then
     begin
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('SELECT Sum(marc.Unidades_Fab)As TUnds, Sum(marc.Total_Recurso)As TImporte, Sum(marc.Tiempo_dec)As TTiempo FROM PRO_VER_DIARIO_MARCAJES marc');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('left join pro_ord ord on (marc.id_orden=ord.id_orden)');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('Where marc.Empresa=?Empresa and');
        //ProDMDiario.QMProDetMarcaT.SelectSql.Add('Ejercicio=?Ejercicio and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Canal=?Canal and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Serie=?Serie and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Fecha>=?FechaD and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Fecha<=?FechaH');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('and ord.compuesto=?compuesto');
        if (LFOrden.Text <> '') then
           ProDMDiario.QMProDetMarcaT.SelectSQL.Add('and marc.id_orden=?id_orden');
     end
     else
     begin
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add(
           'SELECT Sum(marc.Unidades_Fab)As TUnds, Sum(marc.Total_Recurso)As TImporte, Sum(marc.Tiempo_dec)As TTiempo FROM PRO_VER_DIARIO_MARCAJES marc');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('Where marc.Empresa=?Empresa and');
        //ProDMDiario.QMProDetMarcaT.SelectSql.Add('Ejercicio=?Ejercicio and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Canal=?Canal and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Serie=?Serie and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Fecha>=?FechaD and');
        ProDMDiario.QMProDetMarcaT.SelectSQL.Add('marc.Fecha<=?FechaH');
        if (LFOrden.Text <> '') then
           ProDMDiario.QMProDetMarcaT.SelectSQL.Add('and marc.id_orden=?id_orden');
     end;

     ProDMDiario.QMProDetMarcaT.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     //ProDMDiario.QMProDetMarcaT.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     ProDMDiario.QMProDetMarcaT.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     ProDMDiario.QMProDetMarcaT.Params.ByName['Serie'].AsString := REntorno.Serie;
     ProDMDiario.QMProDetMarcaT.Params.ByName['FechaD'].AsDateTime := FechaD.Date;
     ProDMDiario.QMProDetMarcaT.Params.ByName['FechaH'].AsDateTime := FechaH.Date;
     if (LFEFCompuesto.Text <> '') then
        ProDMDiario.QMProDetMarcaT.Params.ByName['compuesto'].AsString := LFEFCompuesto.Text;
     if (LFOrden.Text <> '') then
        ProDMDiario.QMProDetMarcaT.Params.ByName['id_orden'].AsInteger := StrToInt(LFOrden.Text);
  end;

  ProDMDiario.QMProDetMarca.Open;
  ProDMDiario.QMProDetMarcaT.Open;

  // Mascaras detalle
  ProDMDiario.QMProDetMarcaHORA_FIN.DisplayFormat := '00:00'; //MascaraI; //##:##
  ProDMDiario.QMProDetMarcaHORA_INICIO.DisplayFormat := '00:00'; //MascaraI; //##:##
  ProDMDiario.QMProDetMarcaTIEMPO.DisplayFormat := '00:00'; //MascaraI; //##:##
  ProDMDiario.QMProDetMarcaPRECIO_RECURSO.DisplayFormat := MascaraN;
  ProDMDiario.QMProDetMarcaTOTAL_RECURSO.DisplayFormat := MascaraN;
  // Mascaras Totales
  ProDMDiario.QMProDetMarcaTTTIEMPO.DisplayFormat := '00:00';//'##00:00'; //MascaraI; //##:##
  ProDMDiario.QMProDetMarcaTTIMPORTE.DisplayFormat := MascaraN;
  ProDMDiario.QMProDetMarcaTTUnds.DisplayFormat := MascaraN;
end;

procedure TProFMDiario.LFEMaquinaChange(Sender: TObject);
begin
  if (LFEMaquina.Text <> '') then
  begin
     ProDMDiario.xMaquina.Close;
     ProDMDiario.xMaquina.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     ProDMDiario.xMaquina.Params.ByName['MAQUINA'].AsInteger := StrToInt(LFEMaquina.Text);
     ProDMDiario.xmaquina.Open;
  end;
end;

procedure TProFMDiario.LFETextChange(Sender: TObject);
begin
  if (LFEText.Text <> '') then
  begin
     ProDMDiario.xTExt.Close;
     ProDMDiario.xTExt.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     ProDMDiario.xTExt.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     ProDMDiario.xTExt.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     ProDMDiario.xTExt.Params.ByName['Proveedor'].AsInteger := StrToInt(LFETExt.Text);
     ProDMDiario.xTExt.Open;
  end;
end;

procedure TProFMDiario.LFEVariosChange(Sender: TObject);
begin
  if (LFEVarios.Text <> '') then
  begin
     ProDMDiario.xVarios.Close;
     ProDMDiario.xVarios.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     ProDMDiario.xVarios.Params.ByName['Varios'].AsString := LFEVarios.Text;
     ProDMDiario.xVarios.Open;
  end;
end;

procedure TProFMDiario.EPSalirClickRango(Sender: TObject; var Continua: boolean);
begin
  ProDMDiario.BusquedaCompleja;
end;

procedure TProFMDiario.LFEFCompuestoBusqueda(Sender: TObject);
begin
  LFEFCompuesto.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + ' and ejercicio=' + REntorno.EjercicioStr + ' and canal=' + REntorno.CanalStr + ' and series=''' + REntorno.Serie + '''';
end;

procedure TProFMDiario.LFOrdenBusqueda(Sender: TObject);
begin
  LFOrden.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + ' and ejercicio=' + REntorno.EjercicioStr + ' and canal=' + REntorno.CanalStr + ' and series=''' + REntorno.Serie + '''';
end;

procedure TProFMDiario.LFEFCompuestoChange(Sender: TObject);
begin
  ProDMDiario.xTituloCompuesto.Close;
  ProDMDiario.xTituloCompuesto.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  ProDMDiario.xTituloCompuesto.Params.ByName['articulo'].AsString := LFEFCompuesto.Text;
  ProDMDiario.xTituloCompuesto.Open;

  DescCompuesto.Text := ProDMDiario.xTituloCompuestoTITULO.AsString;
end;

procedure TProFMDiario.TBNuevoClick(Sender: TObject);
begin
  LFEFCompuesto.Clear;
  DescCompuesto.Clear;
  LFOrden.Clear;
  Recurso.Clear;
  LFEOperario.Clear;
  LFEMaquina.Clear;
  LFEText.Clear;
  LFEVarios.Clear;
  ProDMDiario.QMProDetMarcaT.Close;
end;

procedure TProFMDiario.DBGFDetalleDblClick(Sender: TObject);
var
  accion : TAction;
  Inicializada : boolean;
begin
  Inicializada := False;
  accion := nil;
  if (ProDMDiario.QMProDetMarcaTIPO.AsString = 'MO') then
  begin
     accion := FMain.AProMarcajesOpe;
     Inicializada := True;
  end
  else if (ProDMDiario.QMProDetMarcaTIPO.AsString = 'HM') then
  begin
     accion := FMain.AProMarcajesMaq;
     Inicializada := True;
  end
  else if (ProDMDiario.QMProDetMarcaTIPO.AsString = 'TE') then
  begin
     accion := FMain.AProMarcajesTe;
     Inicializada := True;
  end
  else if (ProDMDiario.QMProDetMarcaTIPO.AsString = 'VAR') then
  begin
     accion := FMain.AProMarcajesVa;
     Inicializada := True;
  end;

  if (Inicializada = True) then
  begin
     FMain.EjecutaAccion(accion, 'empresa = ' + IntToStr(ProDMDiario.QMProDetMarcaEMPRESA.AsInteger) + ' and Ejercicio = ' + IntToStr(ProDMDiario.QMProDetMarcaEJERCICIO.AsInteger) + ' and canal = ' + IntToStr(ProDMDiario.QMProDetMarcaCANAL.AsInteger) + ' and serie = ' + chr(39) + ProDMDiario.QMProDetMarcaSERIE.AsString + chr(39) + ' and tipo = ' + chr(39) + ProDMDiario.QMProDetMarcaTIPO.AsString + chr(39) + ' and rig = ' + IntToStr(ProDMDiario.QMProDetMarcaRIG.AsInteger));
  end
  else
     ShowMessage(_('Acción no inicializada correctamente.'));
end;

end.
