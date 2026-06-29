unit UFMPackingListTraspasos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, StdCtrls,
  ULFEdit, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TFMPackingListTraspasos = class(TG2kForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     TButtConfirmar: TToolButton;
     TButtSalir: TToolButton;
     GBOrigen: TGroupBox;
     DBENumeroBulto: TLFDbedit;
     DBENumeroBultoActual: TLFDbedit;
     DBEArticulo: TLFDbedit;
     DBETitulo: TLFDbedit;
     GBDestino: TGroupBox;
     LBLUnidades: TLFLabel;
     LBLBulto: TLFLabel;
     EdUnidades: TLFEdit;
     EFBulto: TLFEditFind2000;
     EFTipoBulto: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure EdUnidadesChange(Sender: TObject);
     procedure TButtConfirmarClick(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure EFBultoBusqueda(Sender: TObject);
     procedure EdUnidadesKeyPress(Sender: TObject; var Key: char);
     procedure EFBultoKeyPress(Sender: TObject; var Key: char);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     Modo: smallint;
  public
     { Public declarations }
     function Unidades: double;
     function NumeroBulto: string;
     function TipoBulto: integer;
     function CapturaDatos(Modo: smallint): boolean;
  end;

var
  FMPackingListTraspasos : TFMPackingListTraspasos;

implementation

{$R *.dfm}

uses
  UDMMain, UDMPackingList, UFMain;

procedure TFMPackingListTraspasos.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  EDUnidades.Text := FloatToStr(DMPackingList.QMBultosDetUNIDADES.AsFloat);
  FMain.AddComponentePunto(EFTipoBulto);
  FMain.AddComponentePunto(EFBulto);
end;

procedure TFMPackingListTraspasos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMain.DelComponentePunto(EFTipoBulto);
  FMain.DelComponentePunto(EFBulto);
end;

procedure TFMPackingListTraspasos.EdUnidadesChange(Sender: TObject);
begin
  if (StrToFloatDef(EdUnidades.Text, 0) > DMPackingList.QMBultosDetUNIDADES.AsFloat) then
     EDUnidades.Text := FloatToStr(DMPackingList.QMBultosDetUNIDADES.AsFloat);
end;

function TFMPackingListTraspasos.Unidades: double;
begin
  Result := StrToFloatDef(EdUnidades.Text, 0);
end;

procedure TFMPackingListTraspasos.TButtConfirmarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFMPackingListTraspasos.TButtSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFMPackingListTraspasos.EFBultoBusqueda(Sender: TObject);
begin
  {
  case Modo of
    0,1: EFBulto.CondicionBusqueda :=
            'ID_S = ' + DMPackingList.QMBultosDetID_S.AsString +
            ' AND ID_B <> ' + DMPackingList.QMBultosDetID_B.AsString;
      2: EFBulto.CondicionBusqueda :=
            'ID_S = ' + DMPackingList.QMBultoActualID_S.AsString +
            ' AND ID_B <> ' + DMPackingList.QMBultoActualID_B.AsString;
      3: EFBulto.CondicionBusqueda :=
            'ID_B in (select id_b from g_packing_list_agrupables(' +
             DMPackingList.QMBultoActualID_S.AsString + ',' +
             DMPackingList.QMBultoActualID_B.AsString + '))';
  end;
}
end;

function TFMPackingListTraspasos.NumeroBulto: string;
begin
  NumeroBulto := EFBulto.Text;
end;

procedure TFMPackingListTraspasos.EdUnidadesKeyPress(Sender: TObject; var Key: char);
begin
  if (key = #13) then
     ModalResult := mrOk;

  if (key = #27) then
     ModalResult := mrCancel;

  if not (key in ['0'..'9', #8, '-', {ThousandSeparator,} DecimalSeparator]) then
     Key := #0;
end;

function TFMPackingListTraspasos.CapturaDatos(Modo: smallint): boolean;
begin
{
  Modo 0: Traspasar # de unidades
  Modo 1: Traspasar todas las unidades    *** No se utiliza. Se reemplaza por Modo 0 con 100% de uds.
  Modo 2: Traspasar bulto dentro de otro
  Modo 3: Agrupar bulto                   *** No se utiliza. No se para que sirve.
  Modo 4: Dividir en cajas de x unidades.
}

  Self.Modo := Modo;

  EFTipoBulto.Visible := False;
  LBLUnidades.Visible := False;
  EdUnidades.Visible := False;
  DBENumeroBulto.Visible := False;
  DBENumeroBultoActual.Visible := False;
  DBEArticulo.Visible := False;
  DBETitulo.Visible := False;

  case Modo of
     0:
     begin
        Caption := _('Traspasar unidades a otro bulto');
        DBENumeroBulto.Visible := True;
        LBLUnidades.Visible := True;
        EdUnidades.Visible := True;
     end;
     1:
     begin
        Caption := _('Traspasar todas las unidades a otro bulto');
        DBENumeroBulto.Visible := True;
     end;
     2:
     begin
        Caption := _('Traspasar bulto');
        DBENumeroBultoActual.Visible := True;
     end;
     3:
     begin
        Caption := _('Agrupar bulto');
        DBENumeroBultoActual.Visible := True;
     end;
     4:
     begin
        Caption := _('Dividir en bultos');
        DBEArticulo.Visible := True;
        DBETitulo.Visible := True;

        LBLBulto.Caption := _('Tipo Bulto');
        EFTipoBulto.Visible := True;
        LBLUnidades.Visible := True;
        LBLUnidades.Caption := _('Uds. x Bulto');
        EdUnidades.Visible := True;
     end;
  end;

  case Modo of
     0, 1: EFBulto.CondicionBusqueda :=
           'ID_S = ' + DMPackingList.QMBultosDetID_S.AsString +
           ' AND ID_B <> ' + DMPackingList.QMBultosDetID_B.AsString;
     2: EFBulto.CondicionBusqueda :=
           'ID_S = ' + DMPackingList.QMBultoActualID_S.AsString +
           ' AND ID_B <> ' + DMPackingList.QMBultoActualID_B.AsString;
     3: EFBulto.CondicionBusqueda :=
           'ID_B in (select id_b from g_packing_list_agrupables(' +
           DMPackingList.QMBultoActualID_S.AsString + ',' +
           DMPackingList.QMBultoActualID_B.AsString + '))';
  end;

  Result := (ShowModal = mrOk);
end;

procedure TFMPackingListTraspasos.EFBultoKeyPress(Sender: TObject; var Key: char);
begin
  if (key = #13) then
     ModalResult := mrOk;

  if (key = #27) then
     ModalResult := mrCancel;
end;

function TFMPackingListTraspasos.TipoBulto: integer;
begin
  Result := StrToIntDef(EFTipoBulto.Text, 0);
end;

end.
