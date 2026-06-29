unit UCrmFMContactosDetalleAcc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, {UFPEditDelfos,} rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, DBCtrls,
  ULFDBEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, Mask, rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFLabel, DB,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, FibTableDataSet, UFPEdit,
  Grids, DBGrids, NsDBGrid, UHYDBGrid, UG2kTBLoc, ULFPageControl;

type
  TCrmFMContactosDetAcc = class(TFPEdit)
     LFecha: TLFLabel;
     DBDEFechaAccionProx: TLFDBDateEdit;
     LFHora: TDateTimePicker;
     DBEFTipoAccionProx: TLFDBEditFind2000;
     DBEDescripcionAccionProx: TLFDbedit;
     LDescripcion: TLFLabel;
     LTipoSeguimiento: TLFLabel;
     DBRENotasAccDet: TDBRichEdit;
     DBCBSeguimeintoFinalizado: TLFDBCheckBox;
     LNota: TLFLabel;
     CBFinalizarSeguimientoAnterior: TLFCheckBox;
     CBFinalizarYCrearNuevoSeguimiento: TLFCheckBox;
     TrBProgreso: TTrackBar;
     LProgreso: TLFLabel;
     DBEDBEProgreso: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure LFHoraChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure CBFinalizarYCrearNuevoSeguimientoChange(Sender: TObject);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBEDBEProgresoChange(Sender: TObject);
     procedure TrBProgresoChange(Sender: TObject);
  private
     { Private declarations }
     id_accion, id_accion_det: integer;
  public
     { Public declarations }
     function Mostrar(Origen: char; aid_accion: integer; var aid_accion_det: integer): boolean;
  end;

var
  CrmFMContactosDetAcc : TCrmFMContactosDetAcc;

implementation

uses UCrmDMContactosDetAcc, UFormGest, UUtiles;

{$R *.dfm}

procedure TCrmFMContactosDetAcc.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMContactosDetAcc, CrmDMContactosDetAcc);

  NavMain.DataSource := CrmDMContactosDetAcc.DSQMAccionesDet;
  DBGMain.DataSource := CrmDMContactosDetAcc.DSQMAccionesDet;
end;

procedure TCrmFMContactosDetAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(CrmDMContactosDetAcc);
end;

procedure TCrmFMContactosDetAcc.LFHoraChange(Sender: TObject);
begin
  inherited;
  if ((CrmDMContactosDetAcc.QMAccionesDet.State = dsEdit) or (CrmDMContactosDetAcc.QMAccionesDet.State = dsInsert)) then
     CrmDMContactosDetAcc.QMAccionesDetHORA_ACCION.AsString := TimeToStr(LFHora.Time);
end;

procedure TCrmFMContactosDetAcc.FormShow(Sender: TObject);
begin
  inherited;
  if ((CrmDMContactosDetAcc.QMAccionesDet.State = dsEdit) or (CrmDMContactosDetAcc.QMAccionesDet.State = dsInsert)) then
     LFHora.Time := StrToTime(CrmDMContactosDetAcc.QMAccionesDetHORA_ACCION.AsString);
end;

procedure TCrmFMContactosDetAcc.CBFinalizarYCrearNuevoSeguimientoChange(Sender: TObject);
begin
  inherited;
  CrmDMContactosDetAcc.QMAccionesDetFIN_SEG.AsInteger := BoolToInt(CBFinalizarYCrearNuevoSeguimiento.Checked);
end;

procedure TCrmFMContactosDetAcc.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbPost) then
     CrmDMContactosDetAcc.QMAccionesDetHORA_ACCION.AsString := TimeToStr(LFHora.Time);

  if (Button = nbCancel) then
     CBFinalizarYCrearNuevoSeguimiento.Checked := False;
end;

function TCrmFMContactosDetAcc.Mostrar(Origen: char; aid_accion: integer; var aid_accion_det: integer): boolean;
begin
  Result := False;
  id_accion := aid_accion;
  id_accion_det := aid_accion_det;

  CrmDMContactosDetAcc.Mostrar(id_accion, id_accion_det);
  CBFinalizarSeguimientoAnterior.Visible := (Origen = 'A');
  CBFinalizarYCrearNuevoSeguimiento.Visible := (Origen = 'C');
  Hide;
  ShowModal;

  // Aqui devuelvo el id de la accion que acabo de crear
  aid_accion_det := id_accion_det;

  // Se ha llamado desde CrmDMContactos
  if (Origen = 'A') then
     Result := CBFinalizarSeguimientoAnterior.Checked;

  // Se ha llamado desde CrmFMConsultaAcciones
  if (Origen = 'C') then
     Result := CBFinalizarYCrearNuevoSeguimiento.Checked = True;
end;

procedure TCrmFMContactosDetAcc.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbPost) then
  begin
     id_accion_det := CrmDMContactosDetAcc.QMAccionesDetID_ACCION_DET.AsInteger;
     ModalResult := mrOk;
  end
  else
  if (Button = nbCancel) then
  begin
     id_accion_det := 0;
     ModalResult := mrCancel;
     CBFinalizarYCrearNuevoSeguimiento.Checked := False;
     CBFinalizarSeguimientoAnterior.Checked := False;
  end;
end;

procedure TCrmFMContactosDetAcc.DBEDBEProgresoChange(Sender: TObject);
begin
  inherited;
  if (TrBProgreso.Position <> (CrmDMContactosDetAcc.QMAccionesDetPROGRESO.AsInteger div 10)) then
     TrBProgreso.Position := CrmDMContactosDetAcc.QMAccionesDetPROGRESO.AsInteger div 10;
end;

procedure TCrmFMContactosDetAcc.TrBProgresoChange(Sender: TObject);
begin
  inherited;
  CrmDMContactosDetAcc.QMAccionesDetPROGRESO.AsInteger := TrBProgreso.Position * 10;
end;

end.
