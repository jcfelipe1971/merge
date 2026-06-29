unit UFMPackingListDatosEmb;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar, UNavigator,
  StdCtrls, DBCtrls, ULFDBMemo, Menus, UTeclas, UControlEdit, UFormGest;

type
  TFMPackingListDatosEmb = class(TG2kForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     DBMIzquierda: TLFDBMemo;
     DBMDerecha: TLFDBMemo;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     NavMain: THYMNavigator;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ModificarDatos;
  end;

var
  FMPackingListDatosEmb : TFMPackingListDatosEmb;

implementation

{$R *.dfm}

uses
  UDMMain, UDMPackingList;

procedure TFMPackingListDatosEmb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMPackingListDatosEmb.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if Button = nbPost then
     ModalResult := mrOk
  else if Button = nbCancel then
     ModalResult := mrCancel;
end;

procedure TFMPackingListDatosEmb.ModificarDatos;
begin
  NavMain.DataSource := DMPackingList.DSQMDatosEmbarque;
  DBMIzquierda.DataSource := DMPackingList.DSQMDatosEmbarque;
  DBMDerecha.DataSource := DMPackingList.DSQMDatosEmbarque;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  NavMain.ControlEdit := CEMain;

  DMPackingList.QMDatosEmbarque.Edit;
  ShowModal;
end;

end.
