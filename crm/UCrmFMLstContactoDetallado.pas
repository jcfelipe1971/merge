unit UCrmFMLstContactoDetallado;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListadoSfg, ActnList, ULFActionList, Mask, rxToolEdit,
  StdCtrls, ULFComboBox, ULFEdit, ULFLabel, ExtCtrls, ULFPanel, ComCtrls,
  ULFPageControl, ToolWin, ULFToolBar, ULFDateEdit, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, Fr_HYReport,
  rxPlacemnt, ULFFormStorage;

type
  TCrmFMLstContactoDetallado = class(TFPEditListadoSfg)
     LFPanelCentral: TLFPanel;
     LDesdeContacto: TLFLabel;
     LFDesdeContacto: TLFEditFind2000;
     DBEDesdeContacto: TLFDbedit;
     DBEHastaContacto: TLFDbedit;
     LFHastaContacto: TLFEditFind2000;
     LHastaContacto: TLFLabel;
     LDesdeFechaCreacion: TLFLabel;
     LHastaFechaCreacion: TLFLabel;
     DEFechaDesde: TLFDateEdit;
     DEFechaHasta: TLFDateEdit;
     LFechaCreacion: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure LFDesdeContactoChange(Sender: TObject);
     procedure LFHastaContactoChange(Sender: TObject);
     procedure APrevExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AImprimirExecute(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure EstablecerDesdeHasta(Desde, Hasta: string);
  end;

var
  CrmFMLstContactoDetallado : TCrmFMLstContactoDetallado;

implementation

uses UCrmDMLstContactoDetallado, UFormGest, UUtiles;

{$R *.dfm}

procedure TCrmFMLstContactoDetallado.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TCrmDMLstContactoDetallado, CrmDMLstContactoDetallado);

  Grupo := 8205;
  Listado := CrmDMLstContactoDetallado.frListadoContactos;
  ARecargar.Execute;
end;

procedure TCrmFMLstContactoDetallado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(CrmDMLstContactoDetallado);
end;

procedure TCrmFMLstContactoDetallado.LFDesdeContactoChange(Sender: TObject);
begin
  inherited;
  with CrmDMLstContactoDetallado.xContactoDesde do
  begin
     Close;
     Params.ByName['ID_CONTACTO'].AsInteger := StrToIntDef(LFDesdeContacto.Text, 0);
     Open;
  end;
end;

procedure TCrmFMLstContactoDetallado.LFHastaContactoChange(Sender: TObject);
begin
  inherited;
  with CrmDMLstContactoDetallado.xContactoHasta do
  begin
     Close;
     Params.ByName['ID_CONTACTO'].AsInteger := StrToIntDef(LFHastaContacto.Text, 0);
     Open;
  end;
end;

procedure TCrmFMLstContactoDetallado.APrevExecute(Sender: TObject);
begin
  inherited;
  CrmDMLstContactoDetallado.MostrarListado(StrToIntDef(LFDesdeContacto.Text, 0), StrToIntDef(LFHastaContacto.Text, 0), DEFechaDesde.Date,
     DEFechaHasta.Date, TDPFechaListado.Date, EComentario.Text, 0, Grupo);
end;

procedure TCrmFMLstContactoDetallado.AImprimirExecute(Sender: TObject);
begin
  inherited;
  CrmDMLstContactoDetallado.MostrarListado(StrToIntDef(LFDesdeContacto.Text, 0), StrToIntDef(LFDesdeContacto.Text, 0), DEFechaDesde.Date,
     DEFechaHasta.Date, TDPFechaListado.Date, EComentario.Text, 1, Grupo);
end;

procedure TCrmFMLstContactoDetallado.ARecargarExecute(Sender: TObject);
var
  Min, Max : TDateTime;
begin
  inherited;

  TDPFechaListado.Text := DateToStr(Date);
  DameMinMax('EJE', Min, Max);
  DEFechaDesde.Date := EncodeDate(2000, 1, 1);
  DEFechaHasta.Date := Max;
end;

procedure TCrmFMLstContactoDetallado.EstablecerDesdeHasta(Desde, Hasta: string);
begin
  LFDesdeContacto.Text := Desde;
  LFHastaContacto.Text := Hasta;
end;

end.
