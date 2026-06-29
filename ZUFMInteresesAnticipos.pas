unit ZUFMInteresesAnticipos;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, rxToolEdit, RXDBCtrl, ULFLabel, ULFDBEdit,
  StdCtrls, Mask, DBCtrls, ULFDBEditFind2000, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, UDBDateTimePicker, UFormGest, DB,
  Buttons, ULFEdit, ULFDBMemo, DbComboBoxValue, ULFDBDateEdit;

type
  TZFMInteresesAnticipos = class(TFPEditDetalle)
     DBECliente: TLFDBEditFind2000;
     DBETituloCliente: TLFDbedit;
     LFechaCorte: TLFLabel;
     DBDTPFecha: TLFDBDateEdit;
     LPorInteres: TLFLabel;
     TBMostrarAnticiposDisponibles: TToolButton;
     ToolButton2: TToolButton;
     LAsiento: TLFLabel;
     DBEAsiento: TLFDbedit;
     DBCBEstado: TDBComboBoxValue;
     DBEFCta: TLFDBEditFind2000;
     DBEDescCta: TLFDbedit;
     TButtSeleccionarTodo: TToolButton;
     ToolButton3: TToolButton;
     LCtaContrapartida: TLFLabel;
     SBVerAsientos: TSpeedButton;
     LID: TLFLabel;
     DBEInteres: TLFDbedit;
     AListadoIntereses: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFDID: TLFDbedit;
     TButtMostrarTodos: TToolButton;
     LCliente: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBMostrarAnticiposDisponiblesClick(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TbuttCompClick(Sender: TObject);
     procedure TButtSeleccionarTodoClick(Sender: TObject);
     procedure SBVerAsientosDblClick(Sender: TObject);
     procedure AListadoInteresesExecute(Sender: TObject);
     procedure TButtMostrarTodosClick(Sender: TObject);
  private
     { Private declarations }
     marcado: integer;
  public
     { Public declarations }
  end;

var
  ZFMInteresesAnticipos : TZFMInteresesAnticipos;

implementation

uses UDMMain, UUtiles, ZUDMInteresesAnticipos, UFMListConfig, UFMain, ZUFPregInteresesAnticipos;

{$R *.dfm}

procedure TZFMInteresesAnticipos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMInteresesAnticipos, ZDMInteresesAnticipos);
  NavMain.DataSource := ZDMInteresesAnticipos.DSQMAnticipos;
  DBGMain.DataSource := ZDMInteresesAnticipos.DSQMAnticipos;
  DBGFDetalle.DataSource := ZDMInteresesAnticipos.DSQMDetalle;
  NavDetalle.DataSource := ZDMInteresesAnticipos.DSQMDetalle;
  ZFMInteresesAnticipos.PopupMenu := CEMainPMEdit;

  marcado := 0;
end;

procedure TZFMInteresesAnticipos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMInteresesAnticipos);
end;

procedure TZFMInteresesAnticipos.TBMostrarAnticiposDisponiblesClick(Sender: TObject);
begin
  inherited;
  //if (not DBCHKCerrada.Checked) then
  ZDMInteresesAnticipos.MostrarAnticiposDisponibles;
end;

procedure TZFMInteresesAnticipos.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TZFMInteresesAnticipos.TSTablaShow(Sender: TObject);
begin
  inherited;

  ControlEdit := CEMain;
end;

procedure TZFMInteresesAnticipos.TbuttCompClick(Sender: TObject);
begin
  inherited;
  if DBCBEstado.ItemIndex = 0 then
  begin
     ZDMInteresesAnticipos.Contabilizar(1, DBDTPFecha.Date, StrToFloat(Copy(DBEInteres.Text, 1, (Length(DBEInteres.Text) - 1))));
     DBCBEstado.Color := $00CECEFF;
     ShowMessage('Anticipo pasado a contabilidad');
  end
  else
  begin
     ZDMInteresesAnticipos.Contabilizar(0, DBDTPFecha.Date, StrToFloat(Copy(DBEInteres.Text, 1, (Length(DBEInteres.Text) - 1))));
     DBCBEstado.Color := $00ECFFD9;
     ShowMessage('Anticipo extraido de la contabilidad');
  end;
end;

procedure TZFMInteresesAnticipos.TButtSeleccionarTodoClick(Sender: TObject);
begin
  if (marcado = 1) then
     marcado := 0
  else
     marcado := 1;

  ZDMInteresesAnticipos.SeleccionarDeseleccionar(marcado);
  DBGFDetalle.Refresh;
end;

procedure TZFMInteresesAnticipos.SBVerAsientosDblClick(Sender: TObject);
begin
  inherited;
  if ZDMInteresesAnticipos.Enlace then
     FMain.MuestraMovConta('ASIENTO = ' + ZDMInteresesAnticipos.QMAnticiposASIENTO.AsString + ' AND EJERCICIO = ' +
        ZDMInteresesAnticipos.QMAnticiposEJERCICIO.AsString, ZDMInteresesAnticipos.QMAnticiposCANAL.AsString);
end;

procedure TZFMInteresesAnticipos.AListadoInteresesExecute(Sender: TObject);
begin
  inherited;
  TZFpregInteresesAnticipos.Create(Self).mostrar(1);
end;

procedure TZFMInteresesAnticipos.TButtMostrarTodosClick(Sender: TObject);
begin
  inherited;
  ZDMInteresesAnticipos.MostrarTodos;
  DBGFDetalle.Refresh;
end;

end.
