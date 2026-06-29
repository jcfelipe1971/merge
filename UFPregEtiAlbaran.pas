unit UFPregEtiAlbaran;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActnList, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, ComCtrls, ToolWin, Mask, DBCtrls, UControlEdit, UFormGest,
  rxToolEdit, ULFActionList, ULFEdit, ULFPanel, ULFToolBar, ULFLabel,
  ULFEditFind2000, ULFDateEdit, UFPEditListadoSimple, rxPlacemnt,
  ULFFormStorage;

type
  TFPregEtiAlbaran = class(TFPEditListadoSimple)
     LBLEtiVacias: TLFLabel;
     LBLEtiquetas: TLFLabel;
     EEtiVacias: TLFEdit;
     EEtiquetas: TLFEdit;
     LBLFecha: TLFLabel;
     DTPFecha: TLFDateEdit;
     LSerie: TLFLabel;
     LDocumento: TLFLabel;
     EAlbaran: TLFEdit;
     EFSerie: TLFEditFind2000;
     LInfo: TLFLabel;
     EFEjercicio: TLFEditFind2000;
     LEjercicio: TLFLabel;
     TButtConfigurar: TToolButton;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
     Ejercicio, RIG, Vacias, Copias: integer;
     TipoListado, Serie: string;
     FechaListado: TDateTime;
     procedure TomarDatos;
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
     Eti_Vacias: integer;
     procedure Muestra(aCopias: integer; fecha: TDateTime; aTipoListado: string; aEjercicio, aRIG: integer; aSerie: string);
  end;

var
  FPregEtiAlbaran : TFPregEtiAlbaran;

implementation

uses UUtiles, UEntorno, UDMLstAlbaranesEti, UDMLstFacturasEti,
  UFMListConfig, UDMMain;

{$R *.DFM}

procedure TFPregEtiAlbaran.FormCreate(Sender: TObject);
begin
  inherited;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;
  ARecargar.Visible := False;
end;

procedure TFPregEtiAlbaran.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if ((TipoListado = 'ALB') or (TipoListado = 'ALM')) then
     CierraData(DMLstAlbaranesEti);
  if (TipoListado = 'FAC') then
     CierraData(DMLstFacturasEti);
end;

procedure TFPregEtiAlbaran.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  TomarDatos;
  if (TipoListado = 'ALB') then
     DMLstAlbaranesEti.MostrarListado(Ejercicio, RIG, Vacias, Copias, FechaListado, Modo, Serie);

  if (TipoListado = 'ALM') then
     DMLstAlbaranesEti.MostrarListadoMul(Ejercicio, RIG, Vacias, Copias, FechaListado, Modo, Serie);

  if (TipoListado = 'FAC') then
     DMLstFacturasEti.MostrarListado(Ejercicio, RIG, Vacias, Copias, FechaListado, Modo, Serie);
end;

procedure TFPregEtiAlbaran.Muestra(aCopias: integer; fecha: TDateTime; aTipoListado: string; aEjercicio, aRIG: integer; aSerie: string);
begin
  Ejercicio := aEjercicio;
  if (REntorno.SerieRestringida > '') then
     Serie := REntorno.SerieRestringida
  else
  if (Trim(aSerie) = '') then
     Serie := REntorno.Serie
  else
     Serie := aSerie;
  TipoListado := aTipoListado;
  RIG := aRIG;
  DTPFecha.Date := Trunc(fecha);
  Vacias := 0;
  EEtiVacias.Text := IntToStr(Vacias);
  Copias := aCopias;
  EEtiquetas.Text := IntToStr(Copias);

  if (aTipoListado = 'ALB') then
  begin
     AbreData(TDMLstAlbaranesEti, DMLstAlbaranesEti);
     Caption := _('Etiquetas de Albaranes');

     EFEjercicio.Text := IntToStr(Ejercicio);
     EFEjercicio.Enabled := False;
     EFEjercicio.Color := clInfoBk;

     EAlbaran.Text := IntToStr(RIG);
     EAlbaran.Enabled := False;
     EAlbaran.Color := clInfoBk;
     LDocumento.Caption := _('Albaran');

     EFSerie.Text := aSerie;
     EFSerie.Enabled := False;
     EFSerie.Color := clInfoBk;

     LInfo.Visible := False;

     Grupo := 58;
     Listado := DMLstAlbaranesEti.frAlbaranes;
     ListadoFR3 := DMLstAlbaranesEti.frxAlbaranes;
     ListadoHYR := DMLstAlbaranesEti.HYReport;
  end
  else
  if (aTipoListado = 'ALM') then
  begin
     AbreData(TDMLstAlbaranesEti, DMLstAlbaranesEti);
     Caption := _('Etiquetas de Albaranes');

     EFEjercicio.Text := IntToStr(Ejercicio);
     EFEjercicio.Enabled := True;
     EFEjercicio.Color := clWindow;

     EAlbaran.Text := '0';
     EAlbaran.Enabled := True;
     EAlbaran.Color := clWindow;
     LDocumento.Caption := _('Albaran');

     EFSerie.Text := Serie;
     EFSerie.Enabled := True;
     EFSerie.Color := clWindow;

     LInfo.Visible := True;

     Grupo := 58;
     Listado := DMLstAlbaranesEti.frAlbaranes;
     ListadoFR3 := DMLstAlbaranesEti.frxAlbaranes;
     ListadoHYR := DMLstAlbaranesEti.HYReport;
  end
  else
  if (aTipoListado = 'FAC') then
  begin
     AbreData(TDMLstFacturasEti, DMLstFacturasEti);
     Caption := _('Etiquetas de Facturas');

     EFEjercicio.Text := IntToStr(Ejercicio);
     EFEjercicio.Enabled := False;
     EFEjercicio.Color := clInfoBk;

     EAlbaran.Text := IntToStr(RIG);
     EAlbaran.Enabled := False;
     EAlbaran.Color := clInfoBk;
     LDocumento.Caption := _('Factura');

     EFSerie.Text := Serie;
     EFSerie.Enabled := False;
     EFSerie.Color := clInfoBk;

     LInfo.Visible := False;

     Grupo := 60;
     Listado := DMLstFacturasEti.frFacturas;
     ListadoFR3 := nil;
     ListadoHYR := DMLstFacturasEti.HYReport;
  end;

  ShowModal;
end;

procedure TFPregEtiAlbaran.TomarDatos;
begin
  Vacias := StrToIntDef(EEtiVacias.Text, 0);
  Copias := StrToIntDef(EEtiquetas.Text, 1);
  FechaListado := Trunc(DTPFecha.Date);
  Serie := Trim(EFSerie.Text);
  RIG := StrToIntDef(EAlbaran.Text, 0);
end;

end.
