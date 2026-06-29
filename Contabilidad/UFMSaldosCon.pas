unit UFMSaldosCon;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, DB, rxToolEdit, rxPlacemnt,
  NsDBGrid, ULFCheckBox, ULFComboBox, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit,
  ULFLabel, UG2kTBLoc, ULFDateEdit;

type
  TFMSaldosCon = class(TFPEdit)
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     TSDetalle: TTabSheet;
     TBDetalle: TLFToolBar;
     NavDeta: THYMNavigator;
     PArriba: TLFPanel;
     DBExConsulta: TLFDbedit;
     DBExTitulo: TLFDbedit;
     Label2: TLFLabel;
     Label1: TLFLabel;
     DBEConsulta: TLFDbedit;
     Label3: TLFLabel;
     DBRGModo: TDBRadioGroup;
     DBETitulo: TLFDbedit;
     TBCalculos: TLFToolBar;
     DBGFDetalle: TDBGridFind2000;
     AVerSaldo: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AEliminar: TAction;
     AEliminarTodo: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ARecalcula: TAction;
     LBLCalculo: TLFPanel;
     Label4: TLFLabel;
     DTPFecha: TLFDateEdit;
     CBCanales: TLFComboBox;
     CBBorrado: TLFCheckBox;
     CBDetalle: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSDetalleShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure TSTablaShow(Sender: TObject);
     procedure AVerSaldoExecute(Sender: TObject);
     procedure AEliminarExecute(Sender: TObject);
     procedure AEliminarTodoExecute(Sender: TObject);
     procedure ARecalculaExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSaldosCon : TFMSaldosCon;

implementation

uses UDMSaldosCon, UFormGest, UDMMain, URecursos, UEntorno, UTFVerSaldosCon,
  UUtiles, URellenaLista;

{$R *.DFM}

procedure TFMSaldosCon.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSaldosCon, DMSaldosCon);
  RellenaCanales(CBCanales.Items); {dji lrk kri - Memory Leak}
  CBCanales.ItemIndex := 0;
  NavMain.DataSource := DMSaldosCon.DSQMConsultas;
  DBGmain.DataSource := DMSaldosCon.DSQMConsultas;
  NavDeta.DataSource := DMSaldosCon.DSQMConsultasDet;
  DTPFecha.Date := REntorno.FechaTrabSH;
  PopUpMenu := CEMainPMEdit;
end;

procedure TFMSaldosCon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSaldosCon);
end;

procedure TFMSaldosCon.TSDetalleShow(Sender: TObject);
begin
  ControlEdit := CEDetalle;
end;

procedure TFMSaldosCon.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMSaldosCon.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Key = 38 then
     if DBGFDetalle.DataSource.DataSet.State in [dsEdit, dsInsert] then
        NavDeta.BtnClick(nbPost);
end;

procedure TFMSaldosCon.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMSaldosCon.AVerSaldoExecute(Sender: TObject);
begin
  inherited;
  DMSaldosCon.VerSaldo;
  AbreForm(TFVerSaldosCon, FVerSaldosCon, Self);
end;

// Eliminar las Consultas del Usuario
procedure TFMSaldosCon.AEliminarExecute(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  DMSaldosCon.Elimina;
  Screen.Cursor := crDefault;
end;

// Eliminar TODAS las Consultas
procedure TFMSaldosCon.AEliminarTodoExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
     try
        Screen.Cursor := crHourglass;
        DMSaldosCon.EliminarTodas;
     finally
        Screen.Cursor := crDefault;
     end;
end;

procedure TFMSaldosCon.ARecalculaExecute(Sender: TObject);
var
  Fecha : TDateTime;
begin
  inherited;
  Fecha := Int(DTPFecha.Date);
  try
     Screen.Cursor := crHourGlass;
     DMSaldosCon.Recalcula(Fecha, integer(CBCanales.Items.Objects[CBCanales.ItemIndex]),
        CBBorrado.Checked, CBDetalle.Checked);
  finally
     Screen.Cursor := crDefault;
  end;
end;

end.
