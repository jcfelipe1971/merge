unit UFBuscaConfiguracion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, FIBDatabase,
  UFIBModificados, DB, FIBDataSet, FIBTableDataSet, Grids, DBGrids,
  NsDBGrid, UHYDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TFBuscaConfiguracion = class(TFPEditSimple)
     xDiccionaro: TFIBTableSet;
     DSxDiccionaro: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xDiccionaroRELACION: TFIBStringField;
     xDiccionaroCAMPO: TFIBStringField;
     xDiccionaroORDEN: TIntegerField;
     xDiccionaroORIGEN: TFIBStringField;
     xDiccionaroIDIOMA: TFIBStringField;
     xDiccionaroTEXTO: TIntegerField;
     xDiccionaroTIPO: TIntegerField;
     xDiccionaroDEFECTO: TMemoField;
     xDiccionaroTITULO: TFIBStringField;
     xDiccionaroNOTAS: TMemoField;
     xDiccionaroVISIBLE: TIntegerField;
     xDiccionaroORDEN_BUSCADOR: TIntegerField;
     DBGMain: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure xDiccionaroBeforeEdit(DataSet: TDataSet);
     procedure xDiccionaroAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     Tabla: string;
     old_Orden: integer;
  public
     { Public declarations }
     procedure Configurar(aTabla: string);
  end;

var
  FBuscaConfiguracion : TFBuscaConfiguracion;

implementation

{$R *.dfm}

uses UDMMain, UEntorno, UUtiles;

procedure TFBuscaConfiguracion.Configurar(aTabla: string);
begin
  Tabla := aTabla;
  with xDiccionaro do
  begin
     Close;
     Params.ByName['RELACION'].AsString := Tabla;
     Params.ByName['IDIOMA'].AsString := REntorno.IdiomaCanal;
     Open;
  end;

  Hide;
  ShowModal;
end;

procedure TFBuscaConfiguracion.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializamos las fechas
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;
end;

procedure TFBuscaConfiguracion.xDiccionaroBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  old_Orden := xDiccionaroORDEN_BUSCADOR.AsInteger;
end;

procedure TFBuscaConfiguracion.xDiccionaroAfterPost(DataSet: TDataSet);
begin
  inherited;
  if (old_Orden <> xDiccionaroORDEN_BUSCADOR.AsInteger) then
  begin
     Refrescar(xDiccionaro, 'ORDEN_BUSCADOR', xDiccionaroORDEN_BUSCADOR.AsInteger);
  end;
end;

end.
