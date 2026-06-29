unit UFMNominasPlantillas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Grids, DBGrids, NsDBGrid,
  UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel,
  UNavigator, ToolWin, ExtCtrls, ULFPanel, Mask, DBCtrls, ULFDBEdit,
  ULFLabel;

type
  TFMNominasPlantillas = class(TFPEditDetalle)
     LID: TLFLabel;
     DBEID: TLFDbedit;
     DBETitulo: TLFDbedit;
     LTitulo: TLFLabel;
     TBImportarExcel: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure TbuttCompClick(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure TBImportarExcelClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMNominasPlantillas : TFMNominasPlantillas;

implementation

uses UDMMain, UEntorno, UFMain, UDMNominasPlantillas, UFMSeleccion, UFormGest, UUtiles;

{$R *.dfm}

procedure TFMNominasPlantillas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMNominasPlantillas, DMNominasPlantillas);
  DBGMain.DataSource := DMNominasPlantillas.DSQMNomPlantilla;
  NavMain.DataSource := DMNominasPlantillas.DSQMNomPlantilla;
  G2kTableLoc.DataSource := DMNominasPlantillas.DSQMNomPlantilla;
  NavDetalle.DataSource := DMNominasPlantillas.DSQMNomPlantillaConf;
  DBGFDetalle.DataSource := DMNominasPlantillas.DSQMNomPlantillaConf;
  ColorCampoID(DBEID);
end;

procedure TFMNominasPlantillas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMNominasPlantillas);
end;

procedure TFMNominasPlantillas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMNominasPlantillas.TbuttCompClick(Sender: TObject);
var
  Periodo, Archivo : string;
begin
  if PideDato('PER', Periodo, '', 'PERIODO BETWEEN ''01'' AND ''12''') then
  begin
     Archivo := Format(_('Plantilla_%s_%s.xls'), [DMNominasPlantillas.QMNomPlantillaTITULO.AsString, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'FMNominasPlantillas') then
        DMNominasPlantillas.ExportarExcel(Periodo, Archivo);
  end;
end;

procedure TFMNominasPlantillas.DBGFDetalleBusqueda(Sender: TObject);
begin
  with TDBGridFind2000(Sender) do
  begin
     if DMNominasPlantillas.QMNomPlantillaConfTIPO.AsString = 'H' then
        Tablas.Text := 'EMP_CONCEPTO_HABERES'
     else
     if DMNominasPlantillas.QMNomPlantillaConfTIPO.AsString = 'D' then
        Tablas.Text := 'EMP_CONCEPTO_DESCUENTOS'
     else
     if DMNominasPlantillas.QMNomPlantillaConfTIPO.AsString = 'P' then
        Tablas.Text := 'EMP_CONCEPTO_PARAMETROS';

     // Solo muestro conceptos que no estan en la configuracion actual
     // Solo muestro los que no son calculables
     CondicionBusqueda := 'CALCULABLE = 0 AND CODIGO NOT IN (SELECT CONCEPTO FROM EMP_NOMINA_PLANTILLA_CONF WHERE ID_PLANTILLA=' + IntToStr(DMNominasPlantillas.QMNomPlantillaID.AsInteger) + ')';
  end;
end;

procedure TFMNominasPlantillas.TBImportarExcelClick(Sender: TObject);
var
  Periodo, Archivo, ArchivoLog : string;
  Log : TStrings;
begin
  if PideDato('PER', Periodo, '', 'PERIODO BETWEEN ''01'' AND ''12''') then
  begin
     Archivo := '';
     if (MyOpenDialog(Archivo, 'XLS,ODS,CSV,ALL', '', 'FMNominasPlantillas-ImportarExcel')) then
     begin
        Log := TStringList.Create;
        try
           DMNominasPlantillas.ImportarXLS(Archivo, Periodo, Log);

           // Guardo el log com un archivo txt y lo visualizo
           ArchivoLog := GetSpecialFolderPath(CSIDL_PERSONAL, True) + '\' + format('ResultadoImportacion_%s.txt', [FormatDatetime('yyyymmdd_hhnn', Now)]);
           if FileExists(ArchivoLog) then
              DeleteFile(ArchivoLog);
           Log.SaveToFile(ArchivoLog);
        finally
           Log.Free;
        end;

        DMMain.AbrirArchivo(ArchivoLog);
     end;
  end;
end;

end.
