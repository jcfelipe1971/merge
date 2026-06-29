unit UProFMLstOrdenDet;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, DBCtrls, ULFDBEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel, Grids, DBGrids,
  RXDBCtrl, ULFDBDateEdit, ULFDateEdit, rxPlacemnt, ULFFormStorage;

type
  TProFMLstOrdenDet = class(TFPEditListadoSfg)
     PanelCentral: TLFPanel;
     LDesdeCompuesto: TLFLabel;
     LHastaCompuesto: TLFLabel;
     EFCompD: TLFEditFind2000;
     EFCompH: TLFEditFind2000;
     DBETituloDesdeCompuesto: TLFDbedit;
     DBETituloHastaCompuesto: TLFDbedit;
     EFCliD: TLFEditFind2000;
     DBETituloDesdeCliente: TLFDbedit;
     DBETituloHastaCliente: TLFDbedit;
     EFCliH: TLFEditFind2000;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     DTPDesde: TLFDateEdit;
     DTPHasta: TLFDateEdit;
     procedure FormCreate(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure EFCompDChange(Sender: TObject);
     procedure EFCompHChange(Sender: TObject);
     procedure EFCliDChange(Sender: TObject);
     procedure EFCliHChange(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     f_desde, f_hasta: TDateTime;
  end;

var
  ProFMLstOrdenDet : TProFMLstOrdenDet;

implementation

uses UProDMLstOrdenDet, UFormGest, UDMMain, UUtiles;

{$R *.dfm}

procedure TProFMLstOrdenDet.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMLstOrdenDet, ProDMLstOrdenDet);
  ProDMLstOrdenDet.Tipo_Esc := 'EPR';
  TDPFechaListado.Date := Date;
  Grupo := 8062;
  Listado := ProDMLstOrdenDet.frListadoOrdenDet;
  ARecargar.Execute;
end;

procedure TProFMLstOrdenDet.ARecargarExecute(Sender: TObject);
begin
  inherited;
  ProDMLstOrdenDet.Recargar;
  EFCompD.Text := ProDMLstOrdenDet.xMinCompuestoDMIN_D.AsString;
  EFCompH.Text := ProDMLstOrdenDet.xMaxCompuestoHMAX_H.AsString;
  EFCliD.Text := IntToStr(ProDMLstOrdenDet.xMinClienteDMIN_D.AsInteger);
  EFCliH.Text := IntToStr(ProDMLstOrdenDet.xMaxClienteHMAX_H.AsInteger);
  DTPDesde.Text := DateToStr(ProDMLstOrdenDet.xFechaDMIN_D.AsDateTime);
  DTPHasta.Text := DateToStr(ProDMLstOrdenDet.xFechaHMAX_H.AsDateTime);
end;

procedure TProFMLstOrdenDet.APrevExecute(Sender: TObject);
begin
  inherited;
  ProDmLstOrdenDet.Comentario := EComentario.Text;
  ProDMLstOrdenDet.FechaListado := TDPFechaListado.Date;
  ProDMLstOrdenDet.TFiltro := _('Compuesto desde: ') + EFCompD.Text + '  ' +
     DBETituloDesdeCompuesto.Text + _(' Compuesto hasta: ') + EFCompH.Text + ' ' +
     DBETituloHastaCompuesto.Text + _(' Cliente desde: ') + EFCliD.Text + ' ' +
     DBETituloDesdeCliente.Text + _(' Cliente hasta: ') + EFCliH.Text + ' ' +
     DBETituloHastaCliente.Text + _(' Fecha desde: ') + DTPdesde.Text +
     _('Fecha hasta: ') + DTPHasta.Text;

  f_desde := HourIntoDate(DTPDesde.Date, '00:00:00');
  f_hasta := HourIntoDate(DTPHasta.Date, '23:59:59');

  ProDMLstOrdenDet.MostrarListado(0, EFCompD.Text, EFCompH.Text, 'EPR',
     StrToInt(EFCliD.Text), StrToInt(EFCliH.Text), f_desde, f_hasta);
end;

procedure TProFMLstOrdenDet.EFCompDChange(Sender: TObject);
begin
  inherited;
  ProDMLstOrdenDet.CambiaCompuestoD(EFCompD.Text);
end;

procedure TProFMLstOrdenDet.EFCompHChange(Sender: TObject);
begin
  inherited;
  ProDMLstOrdenDet.CambiaCompuestoH(EFCompH.Text);
end;

procedure TProFMLstOrdenDet.EFCliDChange(Sender: TObject);
begin
  inherited;
  ProDMLstOrdenDet.CambiaClienteD(StrToInt(EFCliD.Text));
end;

procedure TProFMLstOrdenDet.EFCliHChange(Sender: TObject);
begin
  inherited;
  ProDMLstOrdenDet.CambiaClienteH(StrToInt(EFCliH.Text));
end;

procedure TProFMLstOrdenDet.AImprimirExecute(Sender: TObject);
begin
  inherited;
  ProDmLstOrdenDet.Comentario := EComentario.Text;
  ProDMLstOrdenDet.FechaListado := TDPFechaListado.Date;
  ProDMLstOrdenDet.TFiltro := _('Compuesto desde: ') + EFCompD.Text + '  ' +
     DBETituloDesdeCompuesto.Text + _(' Compuesto hasta: ') + EFCompH.Text + ' ' +
     DBETituloHastaCompuesto.Text + _(' Cliente desde: ') + EFCliD.Text + ' ' +
     DBETituloDesdeCliente.Text + _(' Cliente hasta: ') + EFCliH.Text + ' ' +
     DBETituloHastaCliente.Text + _(' Fecha desde: ') + DTPdesde.Text +
     _('Fecha hasta: ') + DTPHasta.Text;

  f_desde := HourIntoDate(DTPDesde.Date, '00:00:00');
  f_hasta := HourIntoDate(DTPHasta.Date, '23:59:59');

  ProDMLstOrdenDet.MostrarListado(1, EFCompD.Text, EFCompH.Text, 'EPR',
     StrToInt(EFCliD.Text), StrToInt(EFCliH.Text), f_desde, f_hasta);
end;

end.
