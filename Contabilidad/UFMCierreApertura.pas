unit UFMCierreApertura;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, UControlEdit, UFormGest, ExtCtrls,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UEditPanel, ToolWin, ComCtrls, ULFToolBar, ULFPanel;

type
  TFMCierreApertura = class(TFPEditSinNavegador)
     BBRegulariza: TSpeedButton;
     BBCierra: TSpeedButton;
     BBApertura: TSpeedButton;
     BBBorraReg: TSpeedButton;
     BBBorraCierre: TSpeedButton;
     BBBorraApertura: TSpeedButton;
     BBSalir: TBitBtn;
     procedure BtnSalirClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BBRegularizaClick(Sender: TObject);
     procedure BBCierraClick(Sender: TObject);
     procedure BBAperturaClick(Sender: TObject);
     procedure BBBorraRegClick(Sender: TObject);
     procedure BBBorraCierreClick(Sender: TObject);
     procedure BBBorraAperturaClick(Sender: TObject);
  private
     { Private declarations }
     procedure ActivaBotones;
  public
     { Public declarations }
  end;

var
  FMCierreApertura : TFMCierreApertura;

implementation

uses UDMCierreApertura, UUtiles, UFMain, UFMRegularizacion, UEntorno, UDMMain;

{$R *.DFM}

procedure TFMCierreApertura.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMCierreApertura, DMCierreApertura);
  FMCierreApertura.ActivaBotones;
  BBBorraApertura.Caption := _('Borrar Asiento de Apertura') + ' ' + IntToStr(REntorno.Ejercicio + 1);
  BBApertura.Caption := _('Crear Asiento de Apertura') + ' ' + IntToStr(REntorno.Ejercicio + 1);

  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(BBSalir, 1, DMMain.ILMain_Ac, 0);
  GetBitmapFromImageList(BBRegulariza, 1, DMMain.ILMain_Ac, 94);
  GetBitmapFromImageList(BBRegulariza, 2, DMMain.ILMain_In, 94);
  GetBitmapFromImageList(BBCierra, 1, DMMain.ILMain_Ac, 94);
  GetBitmapFromImageList(BBCierra, 2, DMMain.ILMain_In, 94);
  GetBitmapFromImageList(BBApertura, 1, DMMain.ILMain_Ac, 94);
  GetBitmapFromImageList(BBApertura, 2, DMMain.ILMain_In, 94);
  GetBitmapFromImageList(BBBorraReg, 1, DMMain.ILMain_Ac, 20);
  GetBitmapFromImageList(BBBorraReg, 2, DMMain.ILMain_In, 20);
  GetBitmapFromImageList(BBBorraCierre, 1, DMMain.ILMain_Ac, 20);
  GetBitmapFromImageList(BBBorraCierre, 2, DMMain.ILMain_In, 20);
  GetBitmapFromImageList(BBBorraApertura, 1, DMMain.ILMain_Ac, 20);
  GetBitmapFromImageList(BBBorraApertura, 2, DMMain.ILMain_In, 20);
end;

procedure TFMCierreApertura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCierreApertura);
end;

procedure TFMCierreApertura.BtnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMCierreApertura.BBRegularizaClick(Sender: TObject);
var
  Cuenta : string;
  Amortiza : boolean;
begin
  if TFMRegularizacion.Create(Self).muestra(Cuenta, Amortiza) = mrOk then
  begin
     if (Amortiza) then
     begin
        try
           Screen.Cursor := crHourGlass;
           DMCierreApertura.CreaAmortizaciones;
        finally
           Screen.Cursor := crDefault;
        end;
     end;

     try
        Screen.Cursor := crHourGlass;
        DMCierreApertura.CreaRegularizacion(Cuenta);
     finally
        Screen.Cursor := crDefault;
     end;

     FMain.MuestraMovConta(' RIC = ' + IntToStr(DMCierreApertura.DameRIC('REG')) + ' and ejercicio = ' + REntorno.EjercicioStr);
  end;

  FMCierreApertura.ActivaBotones;
end;

procedure TFMCierreApertura.BBCierraClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMCierreApertura.CreaCierre;
  finally
     Screen.Cursor := crDefault;
  end;

  FMain.MuestraMovConta(' RIC = ' + IntToStr(DMCierreApertura.DameRIC('CIE')) + ' and ejercicio = ' + REntorno.EjercicioStr);
  FMCierreApertura.ActivaBotones;
end;

procedure TFMCierreApertura.BBAperturaClick(Sender: TObject);
var
  Control : boolean;
begin
  { TODO : Verificar que exista el ejercicio siguiente antes de lanzar la apertura }
  try
     Screen.Cursor := crHourGlass;
     Control := DMCierreApertura.CreaApertura;
  finally
     Screen.Cursor := crDefault;
  end;

  if Control then
  begin
     try
        Screen.Cursor := crHourGlass;
        CierraFormsMenos(Self);
     finally
        Screen.Cursor := crDefault;
     end;

     REntorno.Ejercicio := REntorno.Ejercicio + 1;

     FMain.PoneTituloAplicacion;

     FMain.MuestraMovConta(' RIC = 1 AND EJERCICIO = ' + REntorno.EjercicioStr);
     FMCierreApertura.ActivaBotones;
  end;
end;

procedure TFMCierreApertura.BBBorraRegClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMCierreApertura.BorraRegularizacion;
     FMCierreApertura.ActivaBotones;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMCierreApertura.BBBorraCierreClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMCierreApertura.BorraCierre;
     FMCierreApertura.ActivaBotones;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMCierreApertura.BBBorraAperturaClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMCierreApertura.BorraApertura;
     FMCierreApertura.ActivaBotones;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMCierreApertura.ActivaBotones;
var
  Tipo : integer;
begin
  Tipo := DMCierreApertura.CompruebaFases;
  case Tipo of
     1:
     begin
        BBRegulariza.Enabled := False;
        BBBorraReg.Enabled := False;
        BBCierra.Enabled := False;
        BBBorraCierre.Enabled := False;
        BBApertura.Enabled := False;
        BBBorraApertura.Enabled := False;
     end;
     2:
     begin
        BBRegulariza.Enabled := True;
        BBBorraReg.Enabled := False;
        BBCierra.Enabled := False;
        BBBorraCierre.Enabled := False;
        BBApertura.Enabled := False;
        BBBorraApertura.Enabled := False;
     end;
     3:
     begin
        BBRegulariza.Enabled := False;
        BBBorraReg.Enabled := True;
        BBCierra.Enabled := True;
        BBBorraCierre.Enabled := False;
        BBApertura.Enabled := False;
        BBBorraApertura.Enabled := False;
     end;
     4:
     begin
        BBRegulariza.Enabled := False;
        BBBorraReg.Enabled := False;
        BBCierra.Enabled := False;
        BBBorraCierre.Enabled := True;
        BBApertura.Enabled := True;
        BBBorraApertura.Enabled := False;
     end;
     5:
     begin
        BBRegulariza.Enabled := False;
        BBBorraReg.Enabled := False;
        BBCierra.Enabled := False;
        BBBorraCierre.Enabled := False;
        BBApertura.Enabled := False;
        BBBorraApertura.Enabled := True;
     end;
  end;
end;

end.
