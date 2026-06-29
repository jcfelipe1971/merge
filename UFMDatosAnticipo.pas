unit UFMDatosAnticipo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UNavigator, ToolWin, ComCtrls, StdCtrls, DBCtrls, Menus,
  UTeclas, UControlEdit, DB, URecursos, ULFDBMemo, ULFPanel, ULFToolBar,
  ULFDBEdit, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, Mask, rxToolEdit, RXDBCtrl, ULFLabel, UHYDescription,
  ULFHYDBDescription, ULFDBDateEdit;

type
  TFMDatosAnticipo = class(THYForm)
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     PNLDatosAnticipo: TLFPanel;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     DBDFecha: TLFDBDateEdit;
     DBEFCta: TLFDBEditFind2000;
     LBLFecha: TLFLabel;
     LBLCtaPago: TLFLabel;
     HYDBDTituloCuenta: TLFHYDBDescription;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBEFCtaChange(Sender: TObject);
     procedure DBEFCtaExit(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

procedure EditarDatosAnticipo(Owner: TComponent; DataSource: TDataSource; Fecha, Cuenta: TField);

implementation

uses UDMMain, UEntorno, UDMFacturas, UUtiles;

{$R *.DFM}

procedure EditarDatosAnticipo(Owner: TComponent; DataSource: TDataSource; Fecha, Cuenta: TField);
var
  FMDatosAux : TFMDatosAnticipo;
begin
  FMDatosAux := TFMDatosAnticipo.Create(Owner);
  with FMDatosAux do
  begin
     NavMain.DataSource := DataSource;
     DBDFecha.DataSource := DataSource;
     DBDFecha.DataField := Fecha.FieldName;
     DBEFCta.DataSource := DataSource;
     DBEFCta.DataField := Cuenta.FieldName;
     HYDBDTituloCuenta.DataSource := DataSource;
     ShowModal;
  end;
end;

procedure TFMDatosAnticipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMDatosAnticipo.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if Button = nbPost then
  begin
     ModalResult := mrOk;
  end;
  if Button = nbCancel then
  begin
     ModalResult := mrCancel;
  end;
end;

procedure TFMDatosAnticipo.DBEFCtaChange(Sender: TObject);
begin
  HYDBDTituloCuenta.ActualizaDatos('CUENTA', DBEFCta.Text);
end;

procedure TFMDatosAnticipo.DBEFCtaExit(Sender: TObject);
begin
  DBEFCta.Text := ExpandirCadena(DBEFCta.Text, REntorno.DigitosSub);
end;

end.
