unit UProFMSelecImpEsc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, TFlatCheckBoxUnit,
  ULFCheckBox;

type
  TProFMSelecImpEsc = class(TForm)
     Caso: TRadioGroup;
     SBCancel: TSpeedButton;
     Importar: TRadioGroup;
     CBReserva: TLFCheckBox;
     SBLanzar: TSpeedButton;
     GBOpciones: TGroupBox;
     procedure SBCancelClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CasoClick(Sender: TObject);
     procedure ImportarClick(Sender: TObject);
     procedure SBLanzarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
     procedure Crear_Lanzar;
  public
     { Public declarations }
     dm: TDataModule;
  end;

var
  ProFMSelecImpEsc : TProFMSelecImpEsc;

implementation

uses UProDMGestOrden, UEntorno, UProDMOrden, UDMMain, HYFIBQuery;

{$R *.dfm}

procedure TProFMSelecImpEsc.SBCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TProFMSelecImpEsc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // CierraData(ProDMGestOrden);
  Action := caFree;
end;

procedure TProFMSelecImpEsc.Crear_Lanzar;
var
  Q : THYFIBQuery;
begin
  if (dm is TProDMGestOrden) then
  begin
     { TODO : Hay que crear un registro de reserva con las unidades totales antes de reservar si se quiere esto. }
     if (CBReserva.Checked) then
        raise Exception.Create(_('No se puede reservar orden automaticamente (1)'));

     with TProDMGestOrden(dm) do
     begin
        if QMProOrdSITUACION.AsInteger = 0 then
        begin
           Lanzar(Importar.ItemIndex * 100 + Caso.ItemIndex * 10);
           if (CBReserva.Checked) then
              Reservar;

           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'INSERT INTO PRO_LANZA_ORDENES (ID_ORDEN, FECHA, ID_CAB) VALUES(:ID_ORDEN, :FECHA, :ID_CAB)';
                 Params.ByName['ID_ORDEN'].AsInteger := QMProOrdRIG_OF.AsInteger;
                 Params.ByName['FECHA'].AsDateTime := QMProOrdFECHA_ORD.AsDateTime;
                 Params.ByName['ID_CAB'].AsInteger := 0;
                 ExecQuery;
                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;

           Close;
        end
        else
           ShowMessage(_('La Orden de Produccion ya ha sido lanzada'));
     end;
  end
  else
  begin
     { TODO : Hay que crear un registro de reserva con las unidades totales antes de reservar si se quiere esto. }
     if (CBReserva.Checked) then
        raise Exception.Create(_('No se puede reservar orden automaticamente (2)'));

     with TProDMOrden(dm) do
     begin
        if QMProOrdSITUACION.AsInteger = 0 then
        begin
           Lanzar(Importar.ItemIndex * 100 + Caso.ItemIndex * 10);
           if (CBReserva.Checked) then
           begin
              Reservar;
           end;
           Close;
        end
        else
           ShowMessage(_('La Orden de Produccion ya ha sido lanzada'));
     end;
  end;
end;

procedure TProFMSelecImpEsc.CasoClick(Sender: TObject);
begin
  case caso.ItemIndex of
     0: importar.ItemIndex := 0;
     1: importar.ItemIndex := 0;
     2: importar.ItemIndex := 0;
  end;
end;

procedure TProFMSelecImpEsc.ImportarClick(Sender: TObject);
begin
  case Importar.ItemIndex of
     0: Caso.ItemIndex := 0;
     1: Caso.ItemIndex := 2;
     2: Caso.ItemIndex := 2;
     3: Caso.ItemIndex := 2;
     4: Caso.ItemIndex := 2;
  end;
end;

procedure TProFMSelecImpEsc.SBLanzarClick(Sender: TObject);
begin
  Crear_Lanzar;
end;

procedure TProFMSelecImpEsc.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
