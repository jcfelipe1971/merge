{TODO : Ya no se utiliza. Quitar de proyecto}
unit UFPregCarta347;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, ActnList, ComCtrls, ToolWin, Mask, DBCtrls,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  UDBDateTimePicker, rxToolEdit, ULFEdit, ULFDBEdit, ULFActionList,
  ULFPageControl, ULFToolBar, ULFEditFind2000, ULFLabel, ULFDateEdit,
  rxPlacemnt, ULFFormStorage, ULFPanel, UFPEditListadoSimple, Grids,
  DBGrids, NsDBGrid, UHYDBGrid;

type
  TFPregCarta347 = class(TFPEditListadoSimple)
     TButtConfigurar: TToolButton;
     RGTerceros: TRadioGroup;
     EFTerceroD: TLFEditFind2000;
     EFTerceroH: TLFEditFind2000;
     DBETerceroH: TLFDbedit;
     DBETerceroD: TLFDbedit;
     GBDatos: TGroupBox;
     LBLLugar: TLFLabel;
     ELugar: TLFEdit;
     LblFecha: TLFLabel;
     DTPFecha: TLFDateEdit;
     AEnviarMail: TAction;
     TButtEnviarMail: TToolButton;
     EFTerceroMail: TLFEditFind2000;
     DBETerceroMail: TLFDbedit;
     LDesde: TLFLabel;
     LHasta: TLFLabel;
     LTercero: TLFLabel;
     TButtEnviarMailCorreo: TToolButton;
     AEnviarMailCliente: TAction;
     PNLCarta: TLFPanel;
     PNLCorreo: TLFPanel;
     DBGCorreos: THYTDBGrid;
     PNLCorreoTercero: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFTerceroDChange(Sender: TObject);
     procedure EFTerceroHChange(Sender: TObject);
     procedure ARecargarExecute(Sender: TObject);
     procedure RGTercerosClick(Sender: TObject);
     procedure AEnviarMailExecute(Sender: TObject);
     procedure EFTerceroMailChange(Sender: TObject);
     procedure AEnviarMailClienteExecute(Sender: TObject);
  private
     { Private declarations }
     procedure EnviarMail(Modo: integer);
     procedure MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
  public
     { Public declarations }
  end;

var
  FPregCarta347 : TFPregCarta347;

implementation

uses UDMRMayoresCantidad, UFMListConfig, UDMListados, UFormGest,
  UFSendCorreo, UEntorno, UUtiles, DateUtils;

{$R *.dfm}

procedure TFPregCarta347.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMRMayoresCantidad, DMRMayoresCantidad);
  // DMRMayoresCantidad.Recargar;
  ARecargarExecute(Sender);
  Grupo := 134;
  Listado := DMRMayoresCantidad.frMayoresCantidad;
  ListadoHYM := DMRMayoresCantidad.HYReportMail;
  ImprimirPrevisualizar := MyImprimirPrevisualizar;

  DTPFecha.Date := Today;
end;

procedure TFPregCarta347.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRMayoresCantidad);
end;

procedure TFPregCarta347.EFTerceroDChange(Sender: TObject);
begin
  DMRMayoresCantidad.CambiaTerceroD(StrToIntDef(EFTerceroD.Text, 0));
end;

procedure TFPregCarta347.EFTerceroHChange(Sender: TObject);
begin
  DMRMayoresCantidad.CambiaTerceroH(StrToIntDef(EFTerceroH.Text, 0));
end;

procedure TFPregCarta347.ARecargarExecute(Sender: TObject);
var
  Min, Max : integer;
begin
  RGTerceros.ItemIndex := 1; // Todos

  DameMinMax('TER', Min, Max);
  EFTerceroD.Text := IntToStr(Min);
  EFTerceroH.Text := IntToStr(Max);

  EFTerceroMail.Text := IntToStr(Min);

  DTPFecha.Date := DMRMayoresCantidad.FechaListado;
  ELugar.Text := Copy(REntorno.PobEmpresa, 7, Length(REntorno.PobEmpresa) - 6);
end;

procedure TFPregCarta347.RGTercerosClick(Sender: TObject);
begin
  /// RGTerceros.ItemIndex
  /// 0 - Carta Desde-hasta tercero;
  /// 1 - Carta Todos los terceros;
  /// 2 - Correo electronico

  PNLCarta.Visible := (RGTerceros.ItemIndex = 0);
  PNLCorreo.Visible := (RGTerceros.ItemIndex = 2);

  TButtEnviarMail.Enabled := PNLCorreo.Visible;
  TButtEnviarMailCorreo.Enabled := PNLCorreo.Visible;

  TButtImprimir.Enabled := PNLCarta.Visible or (RGTerceros.ItemIndex = 1);
  TButtPrevisualizar.Enabled := PNLCarta.Visible or (RGTerceros.ItemIndex = 1);
end;

procedure TFPregCarta347.EFTerceroMailChange(Sender: TObject);
begin
  DMRMayoresCantidad.CambiaTerceroMail(StrToIntDef(EFTerceroMail.Text, 0));
end;

procedure TFPregCarta347.EnviarMail(Modo: integer);
var
  Memo, CuerpoMail : TStrings;
  Asunto, TipoDeListado : string;
  Enviar : boolean;
begin
  /// Envia correo electronico.
  /// - Modo 0 directamente.
  /// - Modo 1 mediante cliente de correo instalado.

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando e-mail con Cifra Anual ...'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando listado ...'));

     try
        begin
           Memo := TStringList.Create;
           try
              // Calculo de importes y texto de correo electronico
              DMRMayoresCantidad.MostrarListadoMail(StrToInt(EFTerceroMail.Text),
                 Memo, 1, Trunc(DTPFecha.Date), ELugar.Text, TipoDeListado, Enviar);

              Asunto := _('Cifra Anual para el Modelo 347 de Hacienda') + ' ' + _('de') + ' ' + REntorno.NombreEmpresa;
              if not Enviar then
                 FSendCorreo.Texto(_('El tercero no tiene operaciones que notificar.'))
              else
              begin
                 AbreData(TDMListados, DMListados);
                 try
                    FSendCorreo.Texto(_('Enviando Mensaje...'));

                    if (TipoDeListado <> 'HYM') then
                    begin
                       // FRF, FR3 enviados como PDF adjunto
                       InicializaVariableEmail('347');
                       with VariableEmail do
                       begin
                          Ejercicio := REntorno.Ejercicio;
                          Serie := '';
                          NumeroDocumento := 0;
                          Fecha := Today;
                          SuReferencia := '';
                          SuPedido := '';
                          Folio := '';
                          TituloDocTributario := '';
                          NombreFichero := DMRMayoresCantidad.NombreFichero;
                          Matricula := '';
                          NombreComercial := '';
                          RazonSocial := '';
                          OrdenTrabajo := 0;
                          IdOrdenTrabajo := 0;
                          UsuarioCreadorDocumento := '';
                       end;
                       DamePartesEmail(Asunto, CuerpoMail);

                       try
                          if (Modo = 0) then
                             DMListados.SendMailTerceroPDF(StrToInt(EFTerceroMail.Text), CuerpoMail, DMRMayoresCantidad.RutaFichero, DMRMayoresCantidad.NombreFichero, Asunto, '', -1, True, DMRMayoresCantidad.xCorreosElectronicosEMAIL.AsString)
                          else
                             DMListados.SendMailTerceroPDF2(StrToInt(EFTerceroMail.Text), CuerpoMail, DMRMayoresCantidad.RutaFichero, DMRMayoresCantidad.NombreFichero, Asunto, '', -1, True, DMRMayoresCantidad.xCorreosElectronicosEMAIL.AsString);
                       finally
                          CuerpoMail.Free;
                       end;
                    end
                    else
                    if (TipoDeListado = 'HYM') then
                    begin
                       if (Modo = 0) then
                          DMListados.SendMailTercero(StrToInt(EFTerceroMail.Text), Memo, Asunto, DMRMayoresCantidad.xCorreosElectronicosEMAIL.AsString)
                       else
                          DMListados.SendMailTerceroPDF2(StrToInt(EFTerceroMail.Text), Memo, DMRMayoresCantidad.RutaFichero, DMRMayoresCantidad.NombreFichero, Asunto, '', -1, True, DMRMayoresCantidad.xCorreosElectronicosEMAIL.AsString);
                    end;

                    FSendCorreo.Texto(_('Mensaje enviado con éxito.'));
                 finally
                    CierraData(DMListados);
                 end;
              end;
           finally
              Memo.Free;
           end;
        end;
     except
        on E: Exception do
           FSendCorreo.Texto(_('¡¡ERROR!! Error en el envío.') + #13#10 + E.Message);
     end;

     FSendCorreo.BitBtnOk.Visible := True;
     Application.ProcessMessages;
     FSendCorreo.Visible := False;
     FSendCorreo.SePuede := True;
     FSendCorreo.ShowModal;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TFPregCarta347.AEnviarMailExecute(Sender: TObject);
begin
  inherited;
  EnviarMail(0);
end;

procedure TFPregCarta347.AEnviarMailClienteExecute(Sender: TObject);
begin
  inherited;
  EnviarMail(1);
end;

procedure TFPregCarta347.MyImprimirPrevisualizar(Sender: TObject; Modo: integer);
begin
  {
  DMRMayoresCantidad.MostrarCarta347(Modo, RGTerceros.ItemIndex, StrToInt(EFTerceroD.Text),
     StrToInt(EFTerceroH.Text), Trunc(DTPFecha.Date), ELugar.Text);
  }
end;

end.
