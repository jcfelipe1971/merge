unit UFMExportacionTyrsa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, Menus, ToolWin, ComCtrls, ExtCtrls, StdCtrls, DBCtrls, Buttons,
  IOFFind, FIBEditFind, UFIBDBEditFind, UFormGest, UControlEdit, ComObj,
  FR_Ctrls, FR_Dock, FR_DBOp, FR_Combo, FR_View, rxPlacemnt, ULFFormStorage,
  ULFActionList, ULFPageControl, ULFPanel, ULFToolBar, HYFIBQuery, FIBDataSetRO, DB,
  ExtActns, StdActns, FIBDatabase, FIBDataSet, Printers,
  UFPEditSinNavegador, Mask, rxToolEdit, Grids, DBGrids, NsDBGrid,
  UComponentesBusquedaFiltrada, ULFLabel, UNavigator, UTeclas, UEditPanel;

type
  TFMExportacionTyrsa = class(TFPEditSinNavegador)
     AExportar: TAction;
     LRutaExportacion: TLFLabel;
     DERutaExportacion: TDirectoryEdit;
     PNLCabecera: TLFPanel;
     PNLDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     PNLProgreso: TLFPanel;
     LProgreso: TLFLabel;
     Progreso: TProgressBar;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure AExportarExecute(Sender: TObject);
     procedure DERutaExportacionExit(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ActualizaProgreso(Posicion: integer);
  end;

var
  FMExportacionTyrsa : TFMExportacionTyrsa;

implementation

uses UDMExportacionTyrsa, UEntorno, UUtiles, UDMMain;

{$R *.dfm}

procedure TFMExportacionTyrsa.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMExportacionTyrsa, DMExportacionTyrsa);
  DERutaExportacion.Text := LeeDatoIni('ExportacionTyrsa', 'RutaExportacion', IncludeTrailingPathDelimiter(DERutaExportacion.Text));

  PNLProgreso.Visible := False;
end;

procedure TFMExportacionTyrsa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  EscribeDatoIni('ExportacionTyrsa', 'RutaExportacion', IncludeTrailingPathDelimiter(DERutaExportacion.Text));

  CierraData(DMExportacionTyrsa);
end;

procedure TFMExportacionTyrsa.AExportarExecute(Sender: TObject);
begin
  inherited;
  PNLProgreso.Visible := True;
  Progreso.Max := DMExportacionTyrsa.xTablasExportar.RecordCount;
  ActualizaProgreso(0);
  try
     DMExportacionTyrsa.Exportar(IncludeTrailingPathDelimiter(DERutaExportacion.Text));
  finally
     PNLProgreso.Visible := False;
  end;
end;

procedure TFMExportacionTyrsa.DERutaExportacionExit(Sender: TObject);
begin
  inherited;
  DERutaExportacion.Text := IncludeTrailingPathDelimiter(DERutaExportacion.Text);
end;

procedure TFMExportacionTyrsa.ActualizaProgreso(Posicion: integer);
begin
  Progreso.Position := Posicion;
  Application.ProcessMessages;
end;

end.
