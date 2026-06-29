unit UFMImportacionVending;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFEdit, ULFLabel,
  Mask, rxToolEdit, ULFDateEdit, TFlatCheckBoxUnit, ULFCheckBox, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  UNavigator, ULFEditFind2000;

type
  TFMImportacionVending = class(TFPEditSinNavegador)
     DEFechaAlbaran: TLFDateEdit;
     LFechaAlbaran: TLFLabel;
     TSep1: TToolButton;
     TButtCrearAlbaranes: TToolButton;
     ACrearAlbaranes: TAction;
     EFAlmacen: TLFEditFind2000;
     LAlmacen: TLFLabel;
     PNLCabecera: TLFPanel;
     PNLDetalle: TLFPanel;
     ALeerMaquina: TAction;
     EAlmacen: TLFEdit;
     LURLCSV: TLFLabel;
     EURLCSV: TLFEdit;
     LDesdeFecha: TLFLabel;
     DEDesdeFecha: TLFDateEdit;
     LHastaFecha: TLFLabel;
     DEHastaFecha: TLFDateEdit;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     TSep2: TToolButton;
     LProgreso: TLFLabel;
     PNLProgreso: TLFPanel;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     ESerie: TLFEdit;
     PNLConfiguracionImportacion: TLFPanel;
     PNLSeleccinMaquina: TLFPanel;
     DBGFSeleccinMaquina: TDBGridFind2000;
     TBSep2: TToolButton;
     TBMarcarTodas: TToolButton;
     TBDesmarcar: TToolButton;
     AMarcarTodas: TAction;
     ADesmarcar: TAction;
     LFCategoryAction1: TLFCategoryAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ACrearAlbaranesExecute(Sender: TObject);
     procedure EFAlmacenChange(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFSerieChange(Sender: TObject);
     procedure AMarcarTodasExecute(Sender: TObject);
     procedure ADesmarcarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Progreso(s: string);
  end;

var
  FMImportacionVending : TFMImportacionVending;

implementation

uses UDMImportacionVending, UFormGest, UEntorno, UUtiles, DateUtils, UDMMain, UDameDato;

{$R *.dfm}

procedure TFMImportacionVending.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImportacionVending, DMImportacionVending);

  EFAlmacen.Text := LeeDatoIni('ImportacionVending', 'Almacen', REntorno.AlmacenDefecto);
  EFSerie.Text := LeeDatoIni('ImportacionVending', 'Serie', REntorno.Serie);
  DEDesdeFecha.Date := LeeDatoIni('ImportacionVending', 'DesdeFecha', Today);
  DEHastaFecha.Date := LeeDatoIni('ImportacionVending', 'HastaFecha', Today);

  DEFechaAlbaran.Date := Today;
  Progreso('');
end;

procedure TFMImportacionVending.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  EscribeDatoIni('ImportacionVending', 'Almacen', EFAlmacen.Text);
  EscribeDatoIni('ImportacionVending', 'Serie', EFSerie.Text);
  EscribeDatoIni('ImportacionVending', 'DesdeFecha', DEDesdeFecha.Date);
  EscribeDatoIni('ImportacionVending', 'HastaFecha', DEHastaFecha.Date);

  CierraData(DMImportacionVending);
end;

procedure TFMImportacionVending.ACrearAlbaranesExecute(Sender: TObject);
begin
  inherited;
  /// Debe crear albaranes
  /// - Un albaran por cliente
  /// - Todas las maquinas del cliente en el mismo albaran
  /// - Agrupando unidades por articulo
  /// - Se pedira de 1 a 30 de cada mes

  DMImportacionVending.CrearAlbaranes(DEDesdeFecha.Date, DEHastaFecha.Date, DEFechaAlbaran.Date, EURLCSV.Text, EFAlmacen.Text, EFSerie.Text);
end;

procedure TFMImportacionVending.EFAlmacenChange(Sender: TObject);
begin
  inherited;
  EAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
end;

procedure TFMImportacionVending.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'UNIDADES') then
        begin
           if (DMImportacionVending.RXMDDatosImportacionUNIDADES.AsFloat < 0) then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end;
        if (UpperCase(Column.FieldName) = 'EXISTE_ARTICULO') then
        begin
           if (DMImportacionVending.RXMDDatosImportacionEXISTE_ARTICULO.AsInteger <> 1) then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end;
        if (UpperCase(Column.FieldName) = 'EXISTE_CLIENTE') then
        begin
           if (DMImportacionVending.RXMDDatosImportacionEXISTE_ARTICULO.AsInteger <> 1) then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;
  end;

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMImportacionVending.Progreso(s: string);
begin
  LProgreso.Caption := s;
  Application.ProcessMessages;
end;

procedure TFMImportacionVending.EFSerieChange(Sender: TObject);
begin
  inherited;
  ESerie.Text := DameTituloSerie(EFSerie.Text);
end;

procedure TFMImportacionVending.AMarcarTodasExecute(Sender: TObject);
begin
  inherited;
  DMImportacionVending.MarcarTodasMaquinas(True);
end;

procedure TFMImportacionVending.ADesmarcarExecute(Sender: TObject);
begin
  inherited;
  DMImportacionVending.MarcarTodasMaquinas(False);
end;

end.
