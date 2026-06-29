unit UFMFechaVenceRecibos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, StdCtrls, UFormGest, Mask, rxToolEdit,
  ULFEdit, ULFToolBar, ULFPanel, ULFLabel, TFlatCheckBoxUnit, ULFCheckBox, ULFDateEdit,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, UEditPanel;

type
  TFMFechaVenceRecibos = class(TFPEditSinNavegador)
     TButtAceptar: TToolButton;
     DTPFecha: TLFDateEdit;
     LBLFecha: TLFLabel;
     LFCForzar: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure TButtAceptarClick(Sender: TObject);
     procedure DTPFechaKeyPress(Sender: TObject; var Key: char);
     procedure EPMainClickSalir(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMFechaVenceRecibos : TFMFechaVenceRecibos;

function DevuelveFechaValor(Vencer: byte; Padre: TComponent; var Forzar: boolean; PermitirForzar: boolean = True): TDate;

implementation

uses UDMMain, UEntorno, UFMain;

{$R *.DFM}

function DevuelveFechaValor(Vencer: byte; Padre: TComponent; var Forzar: boolean; PermitirForzar: boolean = True): TDate;
var
  FMFechaVenceRecibos : TFMFechaVenceRecibos;
begin
  /// Vencer: 1 vencer recibos, 0 desvencer recibos

  FMFechaVenceRecibos := TFMFechaVenceRecibos.Create(Padre);
  try
     with FMFechaVenceRecibos do
     begin
        LFCForzar.Checked := Forzar;
        LFCForzar.Visible := PermitirForzar;
        if (Vencer = 1) then
        begin
           LBLFecha.Caption :=
              _('Vence los vencimientos pendientes de contabilizar cuya fecha valor sea anterior a:');
           Caption := _('Vencer vencimientos');
        end
        else
        begin
           LBLFecha.Caption :=
              _('Desvence los vencimientos contabilizados cuya fecha valor sea posterior a:');
           Caption := _('Desvencer vencimientos');
        end;

        if (ShowModal = mrOk) then
        begin
           Forzar := LFCForzar.Checked;
           Result := DTPFecha.Date;
        end
        else
           Result := 0;
     end;
  finally
     FMFechaVenceRecibos.Free;
  end;
end;

procedure TFMFechaVenceRecibos.FormCreate(Sender: TObject);
begin
  inherited;
  DTPFecha.Date := REntorno.FechaTrab;
end;

procedure TFMFechaVenceRecibos.TButtAceptarClick(Sender: TObject);
begin
  EPMain.SetFocus;
  ModalResult := mrOk;
end;

procedure TFMFechaVenceRecibos.DTPFechaKeyPress(Sender: TObject; var Key: char);
begin
  if (Key = #13) then
     TButtAceptarClick(Sender);
end;

procedure TFMFechaVenceRecibos.EPMainClickSalir(Sender: TObject; var Continua: boolean);
begin
  // inherited;
  ModalResult := mrCancel;
  EPMain.SetFocus;
end;

end.
