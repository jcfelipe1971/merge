unit UProFMLstCodBarras;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, ComCtrls, ToolWin, StdCtrls, ExtCtrls, UControlEdit, UFormGest,
  ULFActionList, ULFToolBar, ULFEdit, ULFPanel, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, Mask, DBCtrls, ULFDBEdit,
  ULFPageControl;

type
  TProFMLstCodBarras = class(TG2KForm)
     PNLCodBarras: TLFPanel;
     TBMain: TLFToolBar;
     TButtImprimir: TToolButton;
     TButtVisualizar: TToolButton;
     TButtSalir: TToolButton;
     ActionList1: TLFActionList;
     ASalir: TAction;
     AVisualizar: TAction;
     AImprimir: TAction;
     AConfRapida: TAction;
     TButtConfRapida: TToolButton;
     GBFamilia: TGroupBox;
     LBLEtiVacias: TLFLabel;
     EdCodBarras: TLFEdit;
     LFLnBlanco: TLFLabel;
     LFEnBlanco: TLFEdit;
     EFFaseD: TLFEditFind2000;
     DBEFaseD: TLFDbedit;
     DBEFaseH: TLFDbedit;
     EFFaseH: TLFEditFind2000;
     Label8: TLFLabel;
     Label7: TLFLabel;
     GroupBox1: TGroupBox;
     PCMain: TLFPageControl;
     TSFases: TTabSheet;
     TSTarea: TTabSheet;
     TSMaquines: TTabSheet;
     TSEmpleado: TTabSheet;
     PNLOcultar: TLFPanel;
     Label1: TLFLabel;
     EFMaquinaD: TLFEditFind2000;
     LFDbedit1: TLFDbedit;
     LFDbedit2: TLFDbedit;
     EFMaquinaH: TLFEditFind2000;
     Label2: TLFLabel;
     Label3: TLFLabel;
     EFEmpleadoD: TLFEditFind2000;
     LFDbedit3: TLFDbedit;
     LFDbedit4: TLFDbedit;
     EFEmpleadoH: TLFEditFind2000;
     Label4: TLFLabel;
     Label5: TLFLabel;
     EFTareaD: TLFEditFind2000;
     LFDbedit5: TLFDbedit;
     LFDbedit6: TLFDbedit;
     EFTareaH: TLFEditFind2000;
     Label6: TLFLabel;
     TSProduccion: TTabSheet;
     Label9: TLFLabel;
     EFOrdenD: TLFEditFind2000;
     EFOrdenH: TLFEditFind2000;
     Label10: TLFLabel;
     procedure ASalirExecute(Sender: TObject);
     procedure AVisualizarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure EFFaseDChange(Sender: TObject);
     procedure EFFaseHChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure EFMaquinaDChange(Sender: TObject);
     procedure EFMaquinaHChange(Sender: TObject);
     procedure EFEmpleadoDChange(Sender: TObject);
     procedure EFEmpleadoHChange(Sender: TObject);
     procedure EFTareaDChange(Sender: TObject);
     procedure EFTareaHChange(Sender: TObject);
     procedure TSFasesShow(Sender: TObject);
     procedure TSEmpleadoShow(Sender: TObject);
     procedure TSMaquinesShow(Sender: TObject);
     procedure TSTareaShow(Sender: TObject);
     // sfg_rsl Poner foco en id_orden al abrir formulario desde ordenes
     procedure TSProduccionShow(Sender: TObject);
     procedure EFOrdenDBusqueda(Sender: TObject);
     procedure EFOrdenHBusqueda(Sender: TObject);
  private
     { Private declarations }
     // Tipo_Listado: integer;
  public
     { Public declarations }
     grupo: integer;
     procedure CambioGrupo;
  end;

var
  ProFMLstCodBarras : TProFMLstCodBarras;

implementation

uses UFMListConfig, UDMMain, UProDMLstCodBarras, UEntorno;

{$R *.DFM}

procedure TProFMLstCodBarras.AVisualizarExecute(Sender: TObject);
begin
  CambioGrupo;
  if (PCMain.ActivePage = TSFases) then
     ProDMLstCodBarras.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal, REntorno.Serie,
        EFFaseD.Text, EFFaseH.Text, StrToIntDef(EdCodBarras.Text, 0), StrToIntDef(LFEnBlanco.Text, 0),
        REntorno.Entrada, 1, grupo, 0)
  else if (PCMain.ActivePage = TSTarea) then
     ProDMLstCodBarras.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal, REntorno.Serie,
        EFTareaD.Text, EFTareaH.Text, StrToIntDef(EdCodBarras.Text, 0), StrToIntDef(LFEnBlanco.Text, 0),
        REntorno.Entrada, 2, grupo, 0)
  else if (PCMain.ActivePage = TSMaquines) then
     ProDMLstCodBarras.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal, REntorno.Serie,
        EFMaquinaD.Text, EFMaquinaH.Text, StrToIntDef(EdCodBarras.Text, 0), StrToIntDef(LFEnBlanco.Text, 0),
        REntorno.Entrada, 3, grupo, 0)
  else if (PCMain.ActivePage = TSEmpleado) then
     ProDMLstCodBarras.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal, REntorno.Serie,
        EFEmpleadoD.Text, EFEmpleadoH.Text, StrToIntDef(EdCodBarras.Text, 0), StrToIntDef(LFEnBlanco.Text, 0),
        REntorno.Entrada, 4, grupo, 0)
  else if (PCMain.ActivePage = TSProduccion) then
     ProDMLstCodBarras.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal, REntorno.Serie,
        EFOrdenD.Text, EFOrdenH.Text, StrToIntDef(EdCodBarras.Text, 0), StrToIntDef(LFEnBlanco.Text, 0),
        REntorno.Entrada, 5, grupo, 0);
end;

procedure TProFMLstCodBarras.AImprimirExecute(Sender: TObject);
begin
  CambioGrupo;
  if (PCMain.ActivePage = TSFases) then
     ProDMLstCodBarras.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal, REntorno.Serie,
        EFFaseD.Text, EFFaseH.Text, StrToIntDef(EdCodBarras.Text, 0), StrToIntDef(LFEnBlanco.Text, 0),
        REntorno.Entrada, 1, grupo, 1)
  else if (PCMain.ActivePage = TSTarea) then
     ProDMLstCodBarras.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal, REntorno.Serie,
        EFEmpleadoD.Text, EFEmpleadoH.Text, StrToIntDef(EdCodBarras.Text, 0), StrToIntDef(LFEnBlanco.Text, 0),
        REntorno.Entrada, 2, grupo, 1)
  else if (PCMain.ActivePage = TSMaquines) then
     ProDMLstCodBarras.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal, REntorno.Serie,
        EFMaquinaD.Text, EFMaquinaH.Text, StrToIntDef(EdCodBarras.Text, 0), StrToIntDef(LFEnBlanco.Text, 0),
        REntorno.Entrada, 3, grupo, 1)
  else if (PCMain.ActivePage = TSEmpleado) then
     ProDMLstCodBarras.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal, REntorno.Serie,
        EFEmpleadoD.Text, EFEmpleadoH.Text, StrToIntDef(EdCodBarras.Text, 0), StrToIntDef(LFEnBlanco.Text, 0),
        REntorno.Entrada, 4, grupo, 1)
  else if (PCMain.ActivePage = TSProduccion) then
     ProDMLstCodBarras.MostrarListadoCodBarras(REntorno.Ejercicio, REntorno.Canal, REntorno.Serie,
        EFOrdenD.Text, EFOrdenH.Text, StrToIntDef(EdCodBarras.Text, 0), StrToIntDef(LFEnBlanco.Text, 0),
        REntorno.Entrada, 5, grupo, 1);
end;

procedure TProFMLstCodBarras.ASalirExecute(Sender: TObject);
begin
  Close;
  CierraData(ProDMLstCodBarras);
end;

procedure TProFMLstCodBarras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TProFMLstCodBarras.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  CambioGrupo;
  TFMListConfig.Create(Self).Muestra(grupo, Formato, Cabecera, Copias, Pijama, '', ProDMLstCodBarras.frCodBarras);
end;

procedure TProFMLstCodBarras.EFFaseDChange(Sender: TObject);
begin
  with ProDMLstCodBarras.xFaseD do
  begin
     Close;
     Params.ByName['Codigo'].AsString := (Sender as TLFEditFind2000).Text;
     Open;
  end;
end;

procedure TProFMLstCodBarras.EFFaseHChange(Sender: TObject);
begin
  with ProDMLstCodBarras.xFaseH do
  begin
     Close;
     Params.ByName['Codigo'].AsString := (Sender as TLFEditFind2000).Text;
     Open;
  end;
end;

procedure TProFMLstCodBarras.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMLSTCodBarras, ProDMLSTCodBarras);
end;

procedure TProFMLstCodBarras.EFMaquinaDChange(Sender: TObject);
begin
  with ProDMLstCodBarras.xMaquinaD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Codigo'].AsString := (Sender as TLFEditFind2000).Text;
     Open;
  end;
end;

procedure TProFMLstCodBarras.EFMaquinaHChange(Sender: TObject);
begin
  with ProDMLstCodBarras.xMaquinaH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Codigo'].AsString := (Sender as TLFEditFind2000).Text;
     Open;
  end;
end;

procedure TProFMLstCodBarras.EFEmpleadoDChange(Sender: TObject);
begin
  with ProDMLstCodBarras.xEmpleadoD do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Codigo'].AsString := (Sender as TLFEditFind2000).Text;
     Open;
  end;
end;

procedure TProFMLstCodBarras.EFEmpleadoHChange(Sender: TObject);
begin
  with ProDMLstCodBarras.xEmpleadoH do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Codigo'].AsString := (Sender as TLFEditFind2000).Text;
     Open;
  end;
end;

procedure TProFMLstCodBarras.EFTareaDChange(Sender: TObject);
begin
  {with ProDMLstCodBarras.xTareaD do
  begin
   Close;
    Params.ByName['Codigo'].AsString := EFOrdend.Text;
    Open;
  end;  }
end;

procedure TProFMLstCodBarras.EFTareaHChange(Sender: TObject);
begin
  {with ProDMLstCodBarras.xTareaH do
  begin
    Close;
    Params.ByName['Codigo'].AsString := EFOrdenh.Text;
    Open;
  end;}
end;

procedure TProFMLstCodBarras.TSFasesShow(Sender: TObject);
begin
  EFFaseD.SetFocus;
end;

procedure TProFMLstCodBarras.TSEmpleadoShow(Sender: TObject);
begin
  EFEmpleadoD.SetFocus;
end;

procedure TProFMLstCodBarras.TSMaquinesShow(Sender: TObject);
begin
  EFMaquinaD.SetFocus;
end;

procedure TProFMLstCodBarras.TSTareaShow(Sender: TObject);
begin
  EFTareaD.SetFocus;
end;

// sfg_rsl Poner foco en id_orden al abrir formulario desde ordenes
procedure TProFMLstCodBarras.TSProduccionShow(Sender: TObject);
begin
  EFOrdenD.SetFocus;
end;

procedure TProFMLstCodBarras.CambioGrupo;
begin
  if (PCMain.ActivePage = TSFases) then
     grupo := 8039
  else if (PCMain.ActivePage = TSMaquines) then
     grupo := 8040
  else if (PCMain.ActivePage = TSEmpleado) then
     grupo := 8041
  else if (PCMain.ActivePage = TSTarea) then
     grupo := 8042
  else if (PCMain.ActivePage = TSProduccion) then
     grupo := 8043;
end;

procedure TProFMLstCodBarras.EFOrdenDBusqueda(Sender: TObject);
begin
  EFOrdenD.CondicionBusqueda := 'canal=' + REntorno.CanalStr + ' and series=''' + REntorno.Serie + '''' +
     ' and (ejercicio=' + REntorno.EjercicioStr + ' or ((ejercicio < ' + REntorno.EjercicioStr +
     ') and (situacion<3)))';

  EFOrdenD.Filtros := [obEmpresa];
end;

procedure TProFMLstCodBarras.EFOrdenHBusqueda(Sender: TObject);
begin
  EFOrdenH.CondicionBusqueda := 'canal=' + REntorno.CanalStr + ' and series=''' + REntorno.Serie + '''' +
     ' and (ejercicio=' + REntorno.EjercicioStr + ' or ((ejercicio < ' + REntorno.EjercicioStr +
     ') and (situacion<3)))';

  EFOrdenH.Filtros := [obEmpresa];
end;

end.
