unit UFMModificaPGC;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UFormGest, StdCtrls, Buttons, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, Mask, DBCtrls,
  ULFDBEdit, ULFLabel, ComCtrls, ULFToolBar, UG2kTBLoc, ULFPanel,
  ULFEditFind2000, ULFEdit, ULFMemo, FIBDataSetRO;

type
  TFMModificaPGC = class(TG2kForm)
     PGeneral: TLFPanel;
     PEdit: TLFPanel;
     G2KTableLoc: TG2KTBLoc;
     LCanal: TLFLabel;
     LFechaApertura: TLFLabel;
     LFechaCierre: TLFLabel;
     LFechaActivacion: TLFLabel;
     LPGCActual: TLFLabel;
     DBEEjercicio: TLFDbedit;
     DBECanal: TLFDbedit;
     DBETitCanal: TLFDbedit;
     DBEApertura: TLFDbedit;
     DBECierre: TLFDbedit;
     DBEActivacion: TLFDbedit;
     DBETitPais: TLFDbedit;
     EBEFindPGC: TLFDBEditFind2000;
     DBEPGC: TLFDbedit;
     LDAtosEmpresaEjercicioCanal: TLFLabel;
     LPlanGeneralContableNuevo: TLFLabel;
     LVerificarDatos: TLFLabel;
     DBEEmpresa: TLFDbedit;
     DBETitulo: TLFDbedit;
     LPlanGeneralContableActual: TLFLabel;
     LPGCNuevo: TLFLabel;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     BtnModifica: TBitBtn;
     EBEFindPGCN: TLFEditFind2000;
     LFEPGCNTitulo: TLFEdit;
     PInformacion: TLFPanel;
     MemoInfo: TLFMemo;
     PSeparador: TLFPanel;
     BtnMail: TBitBtn;
     procedure FormCreate(Sender: TObject);
     procedure EBEFindPGCNBusqueda(Sender: TObject);
     procedure EBEFindPGCNChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BtnModificaClick(Sender: TObject);
     procedure BtnMailClick(Sender: TObject);
  private
     { Private declarations }
     procedure ImprimeEnMemo(Cadena: string; Tipo: integer);
     procedure CreaCuentas(Pgc: integer);
     procedure ProcesaEquivalencias(pgc, pgcn: integer);
     function CompruebaCuentas: boolean;
  public
     { Public declarations }
  end;

var
  FMModificaPGC : TFMModificaPGC;

implementation

uses UDMMain, UDMModificaPGC, UEntorno, UUtiles, UFSendCorreo, UDMListados, UImagenes;

{$R *.dfm}

procedure TFMModificaPGC.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  Self.Height := 281;
  AbreData(TDMModificaPGC, DMModificaPGC);
  RefrescarImagen(Imagen, DMModificaPGC.QMSysEmpresasE_IMAGEN.AsInteger);
  BtnModifica.Enabled := True;
  BtnModifica.Visible := True;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BtnMail, 1, DMMain.ILMain_Ac, 34);
  GetBitmapFromImageList(BtnMail, 2, DMMain.ILMain_In, 34);
  GetBitmapFromImageList(BtnModifica, 1, DMMain.ILMain_Ac, 18);
  GetBitmapFromImageList(BtnModifica, 2, DMMain.ILMain_In, 18);
end;

procedure TFMModificaPGC.EBEFindPGCNBusqueda(Sender: TObject);
begin
  EBEFindPGCN.CondicionBusqueda := '(PGC <> ' + IntToStr(REntorno.PGC) + ')';
end;

procedure TFMModificaPGC.EBEFindPGCNChange(Sender: TObject);
var
  pgc : integer;
begin
  if (EBEFindPGCN.Text > '') then
     try
        pgc := StrToInt(EBEFindPGCN.Text);
        LFEPGCNTitulo.Text := DMModificaPGC.DameTituloPGC(pgc);
     except
        LFEPGCNTitulo.Text := '';
     end
  else
     LFEPGCNTitulo.Text := '';
end;

procedure TFMModificaPGC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMModificaPGC);
  Action := caFree;
end;

procedure TFMModificaPGC.BtnModificaClick(Sender: TObject);
var
  pgc, pgcn : integer;
begin
  if ((LFEPGCNTitulo.Text <> '')) then
     if (ConfirmaGrave) then
     begin
        MemoInfo.Clear;
        Self.Height := 581;
        EBEFindPGCN.Color := clInfoBK;
        EBEFindPGCN.Enabled := False;
        pgcn := StrToInt(EBEFindPGCN.Text);
        pgc := REntorno.Pgc;
        if (CompruebaCuentas) then
        begin
           ImprimeEnMemo(_('***** Equivalencias duplicadas  *****'), 0);
           Exit;
        end;
        MemoInfo.Clear;
        ImprimeEnMemo(Format('****************   Iniciando modificación del PGC-%d  al PGC-%d   ****************', [Pgc, Pgcn]), 0);
        DMModificaPGC.CreaFK;
        // Comenzamos actualizando el PGC de le empresa-ejercicio-canal
        DMModificaPGC.ActualizaPGC(pgcn);
        REntorno.Pgc := pgcn;
        // Creando las nuevas cuentas contables
        CreaCuentas(pgcn);
        // Procesando equivalencias
        ProcesaEquivalencias(pgc, pgcn);
        DMMain.AsignaEntornoBusqueda;
        // Modificando Btn
        BtnModifica.Enabled := False;
        BtnModifica.Visible := False;
        BtnMail.Left := BtnModifica.Left;
        BtnMail.Top := BtnModifica.Top;
        BtnMail.Enabled := True;
        BtnMail.Visible := True;
     end;
end;

procedure TFMModificaPGC.ImprimeEnMemo(Cadena: string; Tipo: integer);
begin
  case tipo of
     -1:
     begin
        MemoInfo.Lines.Add(_('ERROR') + ' ' + Cadena);
     end;
     0:
     begin
        MemoInfo.Lines.Add(Cadena);
     end;
     1:
     begin
        MemoInfo.Lines.Add(_('Insertando') + ' ' + Cadena);
     end;

     3:
     begin
        MemoInfo.Lines.Add(_('Equivalencia') + ' ' + Cadena);
     end;
  end;
end;

procedure TFMModificaPGC.CreaCuentas(Pgc: integer);
begin
  ImprimeEnMemo(' ', 0);
  ImprimeEnMemo(_('***** Creando cuentas del PGC  *****'), 0);
  ImprimeEnMemo(' ', 0);
  with DMModificaPGC.xPGCNCuentas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PGC'].AsInteger := Pgc;
     Open;
     First;
     while not EOF do
     begin
        if (DMModificaPGC.CreaCuenta(
           FieldByName('CUENTA').AsString, FieldByName('TITULO').AsString,
           FieldByName('SUPERIOR').AsString, FieldByName('NIVEL').AsInteger,
           FieldByName('TIPO').AsInteger, FieldByName('GESTION').AsInteger,
           FieldByName('TIPO_TERCERO').AsInteger, FieldByName('REG_CIERRE').AsInteger,
           Pgc)) then
           ImprimeEnMemo(FieldByName('CUENTA').AsString + ' ' + FieldByName('TITULO').AsString, 1)
        else
        begin
           ImprimeEnMemo(FieldByName('CUENTA').AsString + ' ' + FieldByName('TITULO').AsString, -1);
           ImprimeEnMemo(DMModificaPGC.UltimoError, 0);
        end;
        Next;
     end;
  end;
  ImprimeEnMemo(' ', 0);
  ImprimeEnMemo(_('***** Creando cuentas de Tipo 5  *****'), 0);
  ImprimeEnMemo(' ', 0);
  with DMModificaPGC.xPGCNCuentasTipo5 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PGC'].AsInteger := Pgc;
     Open;
     First;
     while not EOF do
     begin
        if (DMModificaPGC.CreaCuentaYPadre(
           FieldByName('CUENTA').AsString, FieldByName('TITULO').AsString,
           FieldByName('SUPERIOR').AsString, FieldByName('NIVEL').AsInteger,
           FieldByName('TIPO').AsInteger, FieldByName('GESTION').AsInteger,
           FieldByName('TIPO_TERCERO').AsInteger, FieldByName('REG_CIERRE').AsInteger,
           Pgc)) then
           ImprimeEnMemo(FieldByName('CUENTA').AsString + ' ' + FieldByName('TITULO').AsString, 1)
        else
        begin
           ImprimeEnMemo(FieldByName('CUENTA').AsString + ' ' + FieldByName('TITULO').AsString, -1);
           ImprimeEnMemo(DMModificaPGC.UltimoError, 0);
        end;
        Next;
     end;
  end;
  ImprimeEnMemo(' ', 0);
  ImprimeEnMemo(_('****************   Finalizada modificación del PGC ****************'), 0);
  ImprimeEnMemo(' ', 0);
end;

procedure TFMModificaPGC.ProcesaEquivalencias(pgc, pgcn: integer);
var
  Cuenta, CuentaN : string;
begin
  ImprimeEnMemo(' ', 0);
  ImprimeEnMemo(_('***** Revisando equivalencias  *****'), 0);
  ImprimeEnMemo(' ', 0);
  ImprimeEnMemo(_('Desactivando disparos'), 0);
  DMModificaPGC.DesactivaDisparos;
  with DMModificaPGC.xPGCCuentasTipo5 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PGC'].AsInteger := Pgc;
     Open;
     First;
     while not EOF do
     begin
        Cuenta := FieldByName('CUENTA').AsString;
        CuentaN := Cuenta;
        if (DMModificaPGC.CreaCuentaEquivalencias(CuentaN, Pgc, Pgcn)) then
           ImprimeEnMemo(Cuenta + ' --> ' + CuentaN, 3)
        else
        begin
           ImprimeEnMemo(Cuenta + ' --> ' + '???', -1);
           ImprimeEnMemo(DMModificaPGC.UltimoError, 0);
        end;
        Next;
     end;
  end;
  ImprimeEnMemo(' ', 0);
  ImprimeEnMemo(_('Activando disparos'), 0);
  DMModificaPGC.ActivaDisparos;
  ImprimeEnMemo(' ', 0);
  ImprimeEnMemo(_('Recalculando saldos'), 0);
  DMModificaPGC.RecalculaSaldos;
  ImprimeEnMemo(' ', 0);
  ImprimeEnMemo(_('****************   Finalizada revisión de equivalencias ****************'), 0);
  ImprimeEnMemo(' ', 0);
  ImprimeEnMemo(_('****************   Finalizada la creación de cuentas ****************'), 0);
  ImprimeEnMemo(_('****************   OK ****************'), 0);
  ImprimeEnMemo(' ', 0);
end;

procedure TFMModificaPGC.BtnMailClick(Sender: TObject);
begin
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando log por e-mail ...'));
     FSendCorreo.Show;
     Application.ProcessMessages;
     try
        begin
           AbreData(TDMListados, DMListados);

           FSendCorreo.Texto(_('Enviando Mensaje ...'));
           DMListados.SendMailTercero(REntorno.Tercero, MemoInfo.Lines, _('Modificación del PGC'));
           FSendCorreo.Texto(_('Mensaje enviado con éxito ...'));
        end;
     except
        begin
           Application.ProcessMessages;
           FSendCorreo.Texto(_('¡ERROR! Error en el envío.'));
           CierraData(DMListados);
        end;
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

function TFMModificaPGC.CompruebaCuentas: boolean;
var
  Q : TFIBDataSetRO;
  c_aux : string;
begin
  c_aux := '';
  Q := TFIBDataSetRO.Create(nil);
  with Q do
  begin
     Database := DMMain.Database;
     SelectSQL.Text := 'select o_pgc,o_cuenta,d_pgc,d_cuenta,count(*) ' +
        ' from sys_planes_equivalencias group by o_pgc,o_cuenta,d_pgc,d_cuenta ' +
        ' having count(*)>1';
     Open;
     First;
     ImprimeEnMemo(' ', 0);
     ImprimeEnMemo(_('****************   Comprobando tabla de equivalencias ****************'), 0);
     ImprimeEnMemo(' ', 0);
     while not EOF do
     begin
        if (c_aux <> FieldByName('O_CUENTA').AsString) then
           ImprimeenMemo(Format(_('Registro duplicado. Cuenta %s'), [FieldByName('O_CUENTA').AsString]), 0);
        c_aux := FieldByName('O_CUENTA').AsString;
        Next;
     end;
  end;
  if Q.RecordCount = 0 then
     Result := False
  else
     Result := True;
end;

end.
