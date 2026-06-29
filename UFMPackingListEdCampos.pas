unit UFMPackingListEdCampos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ToolWin, ComCtrls, ULFToolBar, ExtCtrls, ULFPanel,
  UNavigator, StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit, Menus, UTeclas,
  UControlEdit;

type
  TFMPackingListEdCampos = class(TG2kForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     NavMain: THYMNavigator;
     DBEPesoUnitario: TLFDbedit;
     LBLPesoUnitario: TLFLabel;
     LBLPeso: TLFLabel;
     DBEPeso: TLFDbedit;
     LBLVolumen: TLFLabel;
     DBEVolumen: TLFDbedit;
     LBLDiametroPaq: TLFLabel;
     DBEDiametroPaq: TLFDbedit;
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     DBETituloBulto: TLFDbedit;
     LBLTituloBulto: TLFLabel;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ModificarDatos(Modo: integer);
  end;

var
  FMPackingListEdCampos : TFMPackingListEdCampos;

implementation

{$R *.dfm}

uses
  UDMMain, UDMPackingList;

{ TFMPackingListEdCampos }

procedure TFMPackingListEdCampos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFMPackingListEdCampos.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  if Button = nbPost then
     ModalResult := mrOk
  else if Button = nbCancel then
     ModalResult := mrCancel;
end;

{
   Modo 0: Cambio peso unitario de una línea.
   Modo 1: Cambio de peso, volumen, diametro, título de un paquete.
}
procedure TFMPackingListEdCampos.ModificarDatos(Modo: integer);
begin
  case Modo of
     0:
     begin
        NavMain.DataSource := DMPackingList.DSQMBultosDet;
        LBLPesoUnitario.Visible := True;
        DBEPesoUnitario.Visible := True;
        LBLPeso.Visible := False;
        DBEPeso.Visible := False;
        LBLVolumen.Visible := False;
        DBEVolumen.Visible := False;
        LBLDiametroPaq.Visible := False;
        DBEDiametroPaq.Visible := False;
        LBLTituloBulto.Visible := False;
        DBETituloBulto.Visible := False;
        DMPackingList.QMBultosDet.Edit;
     end;
     1:
     begin
        NavMain.DataSource := DMPackingList.DSQMBultoActual;
        LBLPesoUnitario.Visible := False;
        DBEPesoUnitario.Visible := False;
        LBLPeso.Visible := True;
        DBEPeso.Visible := True;
        LBLVolumen.Visible := True;
        DBEVolumen.Visible := True;
        LBLDiametroPaq.Visible := True;
        LBLDiametroPaq.Visible := True;
        LBLTituloBulto.Visible := True;
        DBETituloBulto.Visible := True;
        DMPackingList.QMBultoActual.Edit;
     end;
  end;
  ShowModal;
end;

end.
