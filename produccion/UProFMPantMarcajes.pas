unit UProFMPantMarcajes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, Mask, DBCtrls, ULFDBEdit, ExtCtrls, dbcgrids,
  ULFDBCtrlGrid, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus,
  UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar,
  UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator, ToolWin,
  ULFPanel, ULFLabel, ULFEdit, ULFDBMemo, rxToolEdit, RXClock, ULFDateEdit,
  UFPEditSimple;

type
  TProFMPantMarcajes = class(TFPEditSimple)
     PCMain: TLFPageControl;
     TSOperario: TTabSheet;
     PNLOperario: TLFPanel;
     TSMaquina: TTabSheet;
     DBCGOperario: TLFDBCtrlGrid;
     ImagenOperario: TImage;
     DBEEmpleado: TLFDbedit;
     EFilas: TLFEdit;
     EColumnas: TLFEdit;
     LblFilas: TLFLabel;
     LblColumnas: TLFLabel;
     LFDBMemo: TLFDBMemo;
     LFDBNombre: TLFDbedit;
     ToolButton1: TToolButton;
     ToolButton2: TToolButton;
     ToolButton3: TToolButton;
     ToolButton4: TToolButton;
     ToolButton5: TToolButton;
     LFecha: TLFLabel;
     DTPFecha: TLFDateEdit;
     ToolButton6: TToolButton;
     ToolButton7: TToolButton;
     Timer1: TTimer;
     LFDHorario: TLFDbedit;
     LFDHorasTrab: TLFDbedit;
     PNLMaquina: TLFPanel;
     DBCGMaquinas: TLFDBCtrlGrid;
     ImagenMaquina: TImage;
     DBECodMaq: TLFDbedit;
     LFDBMemo1: TLFDBMemo;
     DBENombre1: TLFDbedit;
     DBEMaquina: TLFDbedit;
     DBEHorario1: TLFDbedit;
     RxClock1: TRxClock;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NumImagenesChange(Sender: TObject);
     procedure DBCGOperarioPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: integer);
     procedure DTPFechaChange(Sender: TObject);
     procedure Timer1Timer(Sender: TObject);
     procedure ARefrescarExecute(Sender: TObject);
     procedure TSOperarioShow(Sender: TObject);
     procedure TSMaquinaShow(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AbrirArchivo(const Filename: string);
  end;

var
  ProFMPantMarcajes : TProFMPantMarcajes;

implementation

uses UProDMPantMarcajes, UFormGest, UDMMain, UEntorno;

{$R *.dfm}

procedure TProFMPantMarcajes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMPantMarcajes, ProDMPantMarcajes);
  DTPFecha.Date := REntorno.FechaTrabSH;
end;

procedure TProFMPantMarcajes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMPantMarcajes);
end;

procedure TProFMPantMarcajes.NumImagenesChange(Sender: TObject);
begin
  inherited;
  DBCGOperario.ColCount := StrToIntDef(EColumnas.Text, 3);
  DBCGOperario.RowCount := StrToIntDef(EFilas.Text, 2);

  DBCGMaquinas.ColCount := StrToIntDef(EColumnas.Text, 3);
  DBCGMaquinas.RowCount := StrToIntDef(EFilas.Text, 2);
end;

procedure TProFMPantMarcajes.DBCGOperarioPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: integer);
begin
  inherited;
  AbrirArchivo(ProDMPantMarcajes.LstMarcajes.FieldByName('Imagen').AsString);

  if (PCMain.ActivePage = TSOperario) then
  begin
     DBEEmpleado.Width := DBCGOperario.PanelWidth - 230;
     LFDBNombre.Width := DBCGOperario.PanelWidth - 95;
     LFDHorario.Width := DBCGOperario.PanelWidth - 71;
     LFDHorasTrab.Width := DBCGOperario.PanelWidth - 71;
     ImagenOperario.Width := DBCGOperario.PanelWidth - 170;
     ImagenOperario.Height := DBCGOperario.PanelHeight - 185;
  end;

  if (PCMain.ActivePage = TSOperario) then
  begin
     DBECodMaq.Width := DBCGOperario.PanelWidth - 230;
     DBENombre1.Width := DBCGOperario.PanelWidth - 95;
     DBEMaquina.Width := DBCGOperario.PanelWidth - 71;
     DBEHorario1.Width := DBCGOperario.PanelWidth - 71;
     ImagenMaquina.Width := DBCGMaquinas.PanelWidth - 170;
     ImagenMaquina.Height := DBCGMaquinas.PanelHeight - 185;
  end;
end;

procedure TProFMPantMarcajes.AbrirArchivo(const Filename: string);
begin
  try
     ImagenOperario.Picture.LoadFromFile(Filename);
     ImagenMaquina.Picture.LoadFromFile(Filename);
  except
     on EInvalidGraphic do
     begin
        ImagenOperario.Picture.Graphic := nil;
        ImagenMaquina.Picture.Graphic := nil;
        MessageDlg(_('Formato de imagen no aceptado'), mtError, [mbOK], 0);
     end;
     on EFOpenError do
     begin
        ImagenOperario.Picture.Graphic := nil;
        ImagenMaquina.Picture.Graphic := nil;
     end;
  end;
end;

procedure TProFMPantMarcajes.DTPFechaChange(Sender: TObject);
begin
  inherited;

  if (PCMain.ActivePage = TSOperario) then
  begin
     with ProDMPantMarcajes.QMVerMarcajesOpe do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FECHA'].AsDateTime := DTPFecha.Date;
        Open;
     end;
  end;

  if (PCMain.ActivePage = TSMaquina) then
  begin
     with ProDMPantMarcajes.QMVerMarcajesMaq do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FECHA'].AsDateTime := DTPFecha.Date;
        Open;
     end;
  end;
end;

procedure TProFMPantMarcajes.Timer1Timer(Sender: TObject);
begin
  inherited;

  if (PCMain.ActivePage = TSOperario) then
  begin
     with ProDMPantMarcajes.QMVerMarcajesOpe do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FECHA'].AsDateTime := DTPFecha.Date;
        Open;
     end;
  end;

  if (PCMain.ActivePage = TSMaquina) then
  begin
     with ProDMPantMarcajes.QMVerMarcajesMaq do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FECHA'].AsDateTime := DTPFecha.Date;
        Open;
     end;
  end;
  // ProDMPantMarcajes.RastreaDirMaq;
end;

procedure TProFMPantMarcajes.ARefrescarExecute(Sender: TObject);
begin
  inherited;
  // Mostra components
  LFDBMemo.Visible := False;
  LFDBNombre.Visible := False;
  DBEEmpleado.Visible := False;

  if (PCMain.ActivePage = TSOperario) then
     ProDMPantMarcajes.RastreaDirOpe;
  if (PCMain.ActivePage = TSMaquina) then
     ProDMPantMarcajes.RastreaDirMaq;
end;

procedure TProFMPantMarcajes.TSOperarioShow(Sender: TObject);
begin
  inherited;

  with ProDMPantMarcajes.QMVerMarcajesOpe do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA'].AsDateTime := DTPFecha.Date;
     Open;
  end;
end;

procedure TProFMPantMarcajes.TSMaquinaShow(Sender: TObject);
begin
  inherited;

  // Mostra components
  LFDBMemo1.Visible := False;
  DBECodMaq.Visible := False;
  DBENombre1.Visible := False;
  DBEMaquina.Visible := False;
  DBEHorario1.Visible := False;

  with ProDMPantMarcajes.QMVerMarcajesMaq do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA'].AsDateTime := DTPFecha.Date;
     Open;
  end;
end;

end.
