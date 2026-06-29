unit UFMDetalleDeCabecera;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, UNavigator, StdCtrls, Mask,
  DBCtrls, ULFDBEdit, ULFLabel, UDBDateTimePicker, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFDBMemo;

type
  TFMDetalleDeCabecera = class(TFPEditSinNavegador)
     ToolButton1: TToolButton;
     NavDetalleDeCabecera: THYMNavigator;
     LTransportistaInstalador: TLFLabel;
     DBETransportistaInstalador: TLFDbedit;
     LTipoVehiculo: TLFLabel;
     DBETipoVehiculo: TLFDbedit;
     DBCBVehiculoEspecial: TLFDBCheckBox;
     LDireccion: TLFLabel;
     LContacto: TLFLabel;
     DBEContacto: TLFDbedit;
     LTelefono: TLFLabel;
     DBETelefono: TLFDbedit;
     LEmail: TLFLabel;
     DBEEmail: TLFDbedit;
     MDireccion: TLFDBMemo;
     LTipoServicio: TLFLabel;
     DBETipoServicio: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Muestra(IdS: integer);
  end;

var
  FMDetalleDeCabecera : TFMDetalleDeCabecera;

implementation

uses UDMDetalleDeCabecera, UFormGest;

{$R *.dfm}

procedure TFMDetalleDeCabecera.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDetalleDeCabecera, DMDetalleDeCabecera);
end;

procedure TFMDetalleDeCabecera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDetalleDeCabecera);
end;

procedure TFMDetalleDeCabecera.Muestra(IdS: integer);
begin
  DMDetalleDeCabecera.CreaRegistro(IdS);
  ShowModal;
end;

end.
