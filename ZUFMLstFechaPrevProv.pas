unit ZUFMLstFechaPrevProv;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids,
  UHYDBGrid, UDBDateTimePicker, ExtDlgs, DB, NsDBGrid, rxPlacemnt, rxToolEdit,
  RXDBCtrl, ImgList, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEditFind2000,
  ULFDBCheckBox, ULFDBEdit, TFlatCheckBoxUnit, ULFCheckBox, Buttons,
  TeEngine, Series, TeeProcs, Chart, DbChart, ULFFIBDBEditFind,
  UHYDescription, ULFHYDBDescription, UG2kTBLoc, ULFLabel, ULFEdit,
  ULFComboBox, ULFEditFind2000, UFPEditListadoSfg, ULFDateEdit, DateUtils;

type
  TZFMLstFechaPrevProv = class(TFPEditListadoSfg)
     PNLTop: TLFPanel;
     PnLst: TLFPanel;
     LProveedorD: TLFLabel;
     LProveedorH: TLFLabel;
     EProveedorD: TLFEdit;
     EProveedorH: TLFEdit;
     LblFechaD: TLFLabel;
     LblFechaPrevD: TLFLabel;
     DateEFechaD: TLFDateEdit;
     DateEFechaPrevD: TLFDateEdit;
     DateEFechaH: TLFDateEdit;
     DateEFechaPrevH: TLFDateEdit;
     LblFechaH: TLFLabel;
     LblFechaPrevH: TLFLabel;
     EFProveedorD: TLFEditFind2000;
     EFProveedorH: TLFEditFind2000;
     RBResumido: TRadioButton;
     RBDetallado: TRadioButton;
     procedure EFProveedorDChange(Sender: TObject);
     procedure EFProveedorHChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure RBResumidoClick(Sender: TObject);
     procedure RBDetalladoClick(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure MostrarListado(Modo: byte; Grupo: integer);
  public
     { Public declarations }
  end;

var
  ZFMLstFechaPrevProv : TZFMLstFechaPrevProv;

implementation

uses ZUDMLstFechaPrevProv, UFormGest, UEntorno, UDMMain, UDameDato;

{$R *.dfm}

procedure TZFMLstFechaPrevProv.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstFechaPrevProv, ZDMLstFechaPrevProv);
  PNLTop.Visible := True;

  Listado := ZDMLstFechaPrevProv.frPedEntregaProv;
  Grupo := 9009;

  ARecargar.Execute;
  RBDetallado.Checked := True;
end;

procedure TZFMLstFechaPrevProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLstFechaPrevProv);
end;

procedure TZFMLstFechaPrevProv.EFProveedorDChange(Sender: TObject);
begin
  inherited;
  EProveedorD.Text := DameTituloProveedor(StrToIntDef(EFProveedorD.Text, 0));
end;

procedure TZFMLstFechaPrevProv.EFProveedorHChange(Sender: TObject);
begin
  inherited;
  EProveedorH.Text := DameTituloProveedor(StrToIntDef(EFProveedorH.Text, 0));
end;

procedure TZFMLstFechaPrevProv.MostrarListado(Modo: byte; Grupo: integer);
begin
  ZDMLstFechaPrevProv.Comentario := EComentario.Text;
  ZDMLstFechaPrevProv.FechaListado := TDPFechaListado.Date;
  ZDMLstFechaPrevProv.Filtro := TDPFechaListado.Text;

  ZDMLstFechaPrevProv.MostrarListado(Modo, DateEFechaD.Date, DateEFechaH.Date,
     DateEFechaPrevD.Date, DateEFechaPrevH.Date, TDPFechaListado.Date,
     StrToIntDef(EFProveedorD.Text, 0), StrToIntDef(EFProveedorH.Text, 0), Grupo, CBOrden.ItemIndex);
end;

procedure TZFMLstFechaPrevProv.ARecargarExecute(Sender: TObject);
var
  year, month, day, dias : word;
begin
  inherited;
  ZDMLstFechaPrevProv.Recargar;
  EFProveedorD.Text := ZDMLstFechaPrevProv.CliMin;
  EFProveedorH.Text := ZDMLstFechaPrevProv.CliMax;

  // Saco la fecha y pongo todos las fecha en todo el mes actual
  DecodeDate(REntorno.FechaTrabSH, Year, Month, Day);
  dias := DaysInMonth(REntorno.FechaTrabSH);

  DateEFechaD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DateEFechaH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
  DateEFechaPrevD.Date := RecodeDay(REntorno.FechaTrabSH, 1);
  DateEFechaPrevH.Date := RecodeDay(REntorno.FechaTrabSH, dias);
end;

procedure TZFMLstFechaPrevProv.APrevExecute(Sender: TObject);
begin
  inherited;
  MostrarListado(0, Grupo);
end;

procedure TZFMLstFechaPrevProv.RBResumidoClick(Sender: TObject);
begin
  inherited;
  Grupo := 9010;
end;

procedure TZFMLstFechaPrevProv.RBDetalladoClick(Sender: TObject);
begin
  inherited;
  Grupo := 9009;
end;

procedure TZFMLstFechaPrevProv.AImprimirExecute(Sender: TObject);
begin
  inherited;
  MostrarListado(1, Grupo);
end;

end.
