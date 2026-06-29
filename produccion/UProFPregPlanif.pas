unit UProFPregPlanif;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ULFToolBar, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, DBCtrls, ULFDBEdit,
  Mask, rxToolEdit, ULFDateEdit, StdCtrls, ULFEdit, ULFLabel, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox;

type
  TProFPregPlanif = class(TForm)
     GBOrden: TGroupBox;
     LFLabel2: TLFLabel;
     LFLabel3: TLFLabel;
     LFToolBar1: TLFToolBar;
     ToolButton1: TToolButton;
     ToolButton2: TToolButton;
     ToolButton3: TToolButton;
     LFEFDOrden: TLFEditFind2000;
     LFEFHOrden: TLFEditFind2000;
     GBFecha: TGroupBox;
     LFLabel8: TLFLabel;
     LFDEDFecha: TLFDateEdit;
     LFLabel9: TLFLabel;
     LFDEHFecha: TLFDateEdit;
     LFCBFecha: TLFCheckBox;
     GBCliente: TGroupBox;
     LFLabel7: TLFLabel;
     LFEFHCliente: TLFEditFind2000;
     LFDbedit3: TLFDbedit;
     LFLabel6: TLFLabel;
     LFEFDCliente: TLFEditFind2000;
     LFDbedit2: TLFDbedit;
     LFCBCliente: TLFCheckBox;
     GBArticulo: TGroupBox;
     LFLabel5: TLFLabel;
     LFEFHArticulo: TLFEditFind2000;
     LFDbedit1: TLFDbedit;
     LFLabel4: TLFLabel;
     LFEFDArticulo: TLFEditFind2000;
     LFDbedit7: TLFDbedit;
     LFLabel1: TLFLabel;
     LFCBOrdenes: TLFCheckBox;
     ToolButton4: TToolButton;
     LFEFCalendario: TLFEditFind2000;
     Label1: TLFLabel;
     LFDbedit4: TLFDbedit;
     LFCBArticulo: TLFCheckBox;
     LFEPlanificacion: TLFEdit;
     procedure LFEFHArticuloChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure LFEFDArticuloChange(Sender: TObject);
     procedure LFEFDClienteChange(Sender: TObject);
     procedure LFEFHClienteChange(Sender: TObject);
     procedure LFCBArticuloClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure LFCBOrdenesClick(Sender: TObject);
     procedure LFCBClienteClick(Sender: TObject);
     procedure LFCBFechaClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure ToolButton4Click(Sender: TObject);
     procedure ToolButton1Click(Sender: TObject);
     procedure LFEFCalendarioChange(Sender: TObject);
     procedure ToolButton3Click(Sender: TObject);
  private
  public
     { Public declarations }
  end;

var
  ProFPregPlanif : TProFPregPlanif;

implementation

uses UDMMain, UProDmPregPlanif, FIBDataSetRO, UEntorno, DB, UFormGest,
  HYFIBQuery, FIBQuery;

{$R *.dfm}

procedure TProFPregPlanif.LFEFHArticuloChange(Sender: TObject);
begin
  with ProDMPregPlanif.xHArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := LFEFHArticulo.Text;
     Open;
  end;
end;

procedure TProFPregPlanif.FormCreate(Sender: TObject);
begin
  AbreData(TProDmPregPlanif, ProDMPregPlanif);
  LFEFDArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
  LFEFHArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TProFPregPlanif.LFEFDArticuloChange(Sender: TObject);
begin
  with ProDMPregPlanif.xDArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := LFEFDArticulo.Text;
     Open;
  end;
end;

procedure TProFPregPlanif.LFEFDClienteChange(Sender: TObject);
begin
  with ProDMPregPlanif.xDCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := StrToInt(LFEFDCliente.Text);
     Open;
  end;
end;

procedure TProFPregPlanif.LFEFHClienteChange(Sender: TObject);
begin
  with ProDMPregPlanif.xHCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := StrToInt(LFEFHCliente.Text);
     Open;
  end;
end;

procedure TProFPregPlanif.LFCBArticuloClick(Sender: TObject);
begin
  if LFCBArticulo.State = cbChecked then
  begin
     LFEFDArticulo.Enabled := True;
     LFEFDArticulo.Color := clWindow;
     LFEFDArticulo.Font.Color := clWindowText;
     LFEFHArticulo.Enabled := True;
     LFEFHArticulo.Color := clWindow;
     LFEFHArticulo.Font.Color := clWindowText;
  end
  else
  begin
     LFEFDArticulo.Enabled := False;
     LFEFDArticulo.Color := clInfoBk;
     LFEFDArticulo.Font.Color := clGrayText;
     LFEFHArticulo.Enabled := False;
     LFEFHArticulo.Color := clInfoBk;
     LFEFHArticulo.Font.Color := clGrayText;
  end;
end;

procedure TProFPregPlanif.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(ProDMPregPlanif);
  Action := caFree;
end;

procedure TProFPregPlanif.LFCBOrdenesClick(Sender: TObject);
begin
  if LFCBOrdenes.State = cbChecked then
  begin
     LFEFDOrden.Enabled := True;
     LFEFDOrden.Color := clWindow;
     LFEFDOrden.Font.Color := clWindowText;
     LFEFHOrden.Enabled := True;
     LFEFHOrden.Color := clWindow;
     LFEFHOrden.Font.Color := clWindowText;
  end
  else
  begin
     LFEFDOrden.Enabled := False;
     LFEFDOrden.Color := clInfoBk;
     LFEFDOrden.Font.Color := clGrayText;
     LFEFHOrden.Enabled := False;
     LFEFHOrden.Color := clInfoBk;
     LFEFHOrden.Font.Color := clGrayText;
  end;
end;

procedure TProFPregPlanif.LFCBClienteClick(Sender: TObject);
begin
  if LFCBCliente.State = cbChecked then
  begin
     LFEFDCliente.Enabled := True;
     LFEFDCliente.Color := clWindow;
     LFEFDCliente.Font.Color := clWindowText;
     LFEFHCliente.Enabled := True;
     LFEFHCliente.Color := clWindow;
     LFEFHCliente.Font.Color := clWindowText;
  end
  else
  begin
     LFEFDCliente.Enabled := False;
     LFEFDCliente.Color := clInfoBk;
     LFEFDCliente.Font.Color := clGrayText;
     LFEFHCliente.Enabled := False;
     LFEFHCliente.Color := clInfoBk;
     LFEFHCliente.Font.Color := clGrayText;
  end;
end;

procedure TProFPregPlanif.LFCBFechaClick(Sender: TObject);
begin
  if LFCBFecha.State = cbChecked then
  begin
     LFDEDFecha.Enabled := True;
     LFDEDFecha.Color := clWindow;
     LFDEDFecha.Font.Color := clWindowText;
     LFDEHFecha.Enabled := True;
     LFDEHFecha.Color := clWindow;
     LFDEHFecha.Font.Color := clWindowText;
  end
  else
  begin
     LFDEDFecha.Enabled := False;
     LFDEDFecha.Color := clInfoBk;
     LFDEDFecha.Font.Color := clGrayText;
     LFDEHFecha.Enabled := False;
     LFDEHFecha.Color := clInfoBk;
     LFDEHFecha.Font.Color := clGrayText;
  end;
end;

procedure TProFPregPlanif.FormShow(Sender: TObject);
var
  MinArt, MaxArt : string;
  MinOrd, MaxOrd, MinCliente, MaxCliente : integer;
begin
  ProDMPregPlanif.Recargar(MinArt, MaxArt, MinOrd, MaxOrd, MinCliente, MaxCliente);
  LFEFDOrden.Text := IntToStr(MinOrd);
  LFEFHOrden.Text := IntToStr(MaxOrd);
  LFEFDArticulo.Text := MinArt;
  LFEFHArticulo.Text := MaxArt;
  LFEFDCliente.Text := IntToStr(MinCliente);
  LFEFHCliente.Text := IntToStr(MaxCliente);
  LFDEDFecha.Date := Now;
  LFDEHFecha.Date := Now;
  LFEPlanificacion.Text := '0';
  LFEFCalendario.Text := '1';
end;

procedure TProFPregPlanif.ToolButton4Click(Sender: TObject);
var
  MinArt, MaxArt : string;
  MinOrd, MaxOrd, MinCliente, MaxCliente : integer;
begin
  ProDMPregPlanif.Recargar(MinArt, MaxArt, MinOrd, MaxOrd, MinCliente, MaxCliente);
  LFEFDOrden.Text := IntToStr(MinOrd);
  LFEFHOrden.Text := IntToStr(MaxOrd);
  LFEFDArticulo.Text := MinArt;
  LFEFHArticulo.Text := MaxArt;
  LFEFDCliente.Text := IntToStr(MinCliente);
  LFEFHCliente.Text := IntToStr(MaxCliente);
  LFDEDFecha.Date := Now;
  LFDEHFecha.Date := Now;
  LFEPlanificacion.Text := '0';
  LFEFCalendario.Text := '1';
end;

procedure TProFPregPlanif.ToolButton1Click(Sender: TObject);
var
  MinArt, MaxArt : string;
  MinOrd, MaxOrd, MinCliente, MaxCliente : integer;
begin
  if (LFEPlanificacion.Text = '') or (IsNum(LFEPlanificacion.Text) = False) then
     Exception.Create('Debe indicar la planificación en la que desea incluir las ordenes.');
  if (LFEFCalendario.Text = '') then
     Exception.Create('Debe indicar el Calendario que se utilizará para la planificación.');

  ProDMPregPlanif.Recargar(MinArt, MaxArt, MinOrd, MaxOrd, MinCliente, MaxCliente);

  if not LFCBOrdenes.Checked then
  begin
     LFEFDOrden.Text := IntToStr(MinOrd);
     LFEFHOrden.Text := IntToStr(MaxOrd);
  end;
  if not LFCBArticulo.Checked then
  begin
     LFEFDArticulo.Text := MinArt;
     LFEFHArticulo.Text := MaxArt;
  end;
  if not LFCBCliente.Checked then
  begin
     LFEFDCliente.Text := IntToStr(MinCliente);
     LFEFHCliente.Text := IntToStr(MaxCliente);
  end;
  if not LFCBFecha.Checked then
  begin
     // Ponemos las fechas mal para que el SP las descarte.
     LFDEDFecha.Text := DateToStr(EncodeDate(1900, 12, 31));
     LFDEHFecha.Text := DateToStr(EncodeDate(1900, 01, 01));
  end;
  with ProDMPregPlanif.SP_Pro_Planifica do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CALENDARIO'].AsInteger := 1;//Hay que poner que se elija
     Params.ByName['PLANIFICACION'].AsInteger := StrToInt(LFEPlanificacion.Text);
     Params.ByName['ORIGEN'].AsString := 'P';
     Params.ByName['DORDEN'].AsInteger := StrToInt(LFEFDOrden.Text);
     Params.ByName['HORDEN'].AsInteger := StrToInt(LFEFHOrden.Text);
     Params.ByName['DARTICULO'].AsString := LFEFDArticulo.Text;
     Params.ByName['HARTICULO'].AsString := LFEFHArticulo.Text;
     Params.ByName['DCLIENTE'].AsInteger := StrToInt(LFEFDCliente.Text);
     Params.ByName['HCLIENTE'].AsInteger := StrToInt(LFEFHCliente.Text);
     Params.ByName['DFECHA'].AsDateTime := LFDEDFecha.Date;
     Params.ByName['HFECHA'].AsDateTime := LFDEHFecha.Date;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TProFPregPlanif.LFEFCalendarioChange(Sender: TObject);
begin
  with ProDMPregPlanif.xCalendario do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['Calendario'].AsInteger := StrToInt(LFEFCalendario.Text);
     Open;
  end;
end;

procedure TProFPregPlanif.ToolButton3Click(Sender: TObject);
begin
  Close;
end;

end.
