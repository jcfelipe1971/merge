unit UFPEditListadoSimple;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, UEditPanel, ToolWin, ActnList, UControlEdit,
  UFormGest, ULFActionList, ULFPageControl, ULFToolBar,
  Fr_HYReport, UHYReport, UHYReportMail, frxHYReport, rxPlacemnt,
  ULFFormStorage, ULFPanel;

type
  TImprimirPrevisualizar = procedure(Sender: TObject; Modo: integer) of object;

type
  TFPEditListadoSimple = class(TG2KForm)
     TBMain: TLFToolBar;
     TButtImprimir: TToolButton;
     TButtPrevisualizar: TToolButton;
     TButtSalir: TToolButton;
     ALMain: TLFActionList;
     AImprimir: TAction;
     APrev: TAction;
     ASalir: TAction;
     TButtRecargar: TToolButton;
     ARecargar: TAction;
     AConfigurar: TAction;
     FSMain: TLFFibFormStorage;
     PMain: TLFPanel;
     AExportar: TAction;
     PBListado: TProgressBar;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ASalirExecute(Sender: TObject);
     procedure AConfigurarExecute(Sender: TObject);
     procedure APrevisualizarExecute(Sender: TObject);
     procedure AImprimirExecute(Sender: TObject);
     procedure AExportarExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  protected
     { Variables privadas en los descendientes de la clase }
     Grupo: integer;
     Listado: TfrHYReport;
     ListadoHYR: THYReport;
     ListadoHYM: THYReportMail;
     ListadoFR3: TfrxHYReport;
     ImprimirPrevisualizar: TImprimirPrevisualizar;
     procedure BarraHabilitada(Habilitada: boolean);
  end;

var
  FPEditListadoSimple : TFPEditListadoSimple;

implementation

uses UDMMain, UFMListConfig;

{$R *.DFM}

procedure TFPEditListadoSimple.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AImprimir.ShortCut := DMMain.Teclas.FscReport;
  APrev.ShortCut := DMMain.Teclas.FscImprime;
  ASalir.ShortCut := DMMain.Teclas.FscSalir;
  Grupo := 0;
  Listado := nil;
  ListadoHYR := nil;
  ListadoHYM := nil;
  ListadoFR3 := nil;
  ImprimirPrevisualizar := nil;
end;

procedure TFPEditListadoSimple.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFPEditListadoSimple.ASalirExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPEditListadoSimple.AConfigurarExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  if (Grupo > 0) then
  begin
     // Si no se pasa ningún listado
     if ((not Assigned(ListadoFR3)) and (not Assigned(Listado))) then
        TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '')
     else
     if Assigned(Listado) then
     begin
        // Si el listado es FRF
        if ((Listado <> nil) and (ListadoHYR = nil) and (ListadoHYM = nil)) then
           TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', Listado);
        if ((Listado <> nil) and (ListadoHYR = nil) and (ListadoHYM <> nil)) then
           TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', Listado, ListadoHYM);
        if ((Listado <> nil) and (ListadoHYR <> nil) and (ListadoHYM = nil)) then
           TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', Listado, ListadoHYR);
        if ((Listado <> nil) and (ListadoHYR <> nil) and (ListadoHYM <> nil)) then
           TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', Listado, ListadoHYR, ListadoHYM);
     end
     else
     begin
        // Si el listado es FR3
        if ((ListadoFR3 <> nil) and (ListadoHYR = nil) and (ListadoHYM = nil)) then
           TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', ListadoFR3);
        if ((ListadoFR3 <> nil) and (ListadoHYR = nil) and (ListadoHYM <> nil)) then
           TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', ListadoFR3, ListadoHYM);
        if ((ListadoFR3 <> nil) and (ListadoHYR <> nil) and (ListadoHYM = nil)) then
           TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', ListadoFR3, ListadoHYR);
        if ((ListadoFR3 <> nil) and (ListadoHYR <> nil) and (ListadoHYM <> nil)) then
           TFMListConfig.Create(Self).Muestra(Grupo, Formato, Cabecera, Copias, Pijama, '', ListadoFR3, ListadoHYR, ListadoHYM);
     end;
  end;
end;

procedure TFPEditListadoSimple.BarraHabilitada(Habilitada: boolean);
begin
  /// Al imprimir el listado puede tardar un poco en empezar a procesarse.
  /// Para evitar que se presione dos veces el botón de previsualizar o imprimir, se debe deshabilitar la barra.
  /// *** Siembre dentro de un bloque TRY..FINALLY ***

  TBMain.Enabled := Habilitada;
end;

procedure TFPEditListadoSimple.AImprimirExecute(Sender: TObject);
begin
  BarraHabilitada(False);
  try
     if Assigned(ImprimirPrevisualizar) then
        ImprimirPrevisualizar(Sender, TAction(Sender).Tag);
  finally
     BarraHabilitada(True);
  end;
end;

procedure TFPEditListadoSimple.APrevisualizarExecute(Sender: TObject);
begin
  BarraHabilitada(False);
  try
     if Assigned(ImprimirPrevisualizar) then
        ImprimirPrevisualizar(Sender, TAction(Sender).Tag);
  finally
     BarraHabilitada(True);
  end;
end;

procedure TFPEditListadoSimple.AExportarExecute(Sender: TObject);
begin
  BarraHabilitada(False);
  try
     if Assigned(ImprimirPrevisualizar) then
        ImprimirPrevisualizar(Sender, TAction(Sender).Tag);
  finally
     BarraHabilitada(True);
  end;
end;

end.
