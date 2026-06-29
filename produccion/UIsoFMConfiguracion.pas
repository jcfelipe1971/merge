unit UIsoFMConfiguracion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, StdCtrls, DBCtrls, ToolWin, ComCtrls,
  ULFToolBar, UFormGest, UEditPanel, UNavigator, Mask, UFIBDBEditfind,
  ULFFIBDBEditFind, ULFLabel, ULFDBEdit, DB, Grids, DBGrids, NsDBGrid,
  UComponentesBusquedaFiltrada;

type
  TIsoFMConfiguracion = class(TG2KForm)
     LFToolBar1: TLFToolBar;
     LFPanelMain: TLFPanel;
     CBValor_Manual: TLFDBCheckBox;
     CBValor_Inc_Ped: TLFDBCheckBox;
     CBValor_Coste: TLFDBCheckBox;
     CBValor_Entrega: TLFDBCheckBox;
     LFLabel1: TLFLabel;
     LFLabel2: TLFLabel;
     LFLabel3: TLFLabel;
     NavMain: THYMNavigator;
     HYMEditPanel1: THYMEditPanel;
     ToolButton1: TToolButton;
     LFDBInc_A: TLFDbedit;
     LFDBInc_B: TLFDbedit;
     LFDBInc_C: TLFDbedit;
     LFDBCoste_A: TLFDbedit;
     LFDBCoste_B: TLFDbedit;
     LFDBCoste_C: TLFDbedit;
     LFDBEntrega_A: TLFDbedit;
     LFDBEntrega_B: TLFDbedit;
     LFDBEntrega_C: TLFDbedit;
     LFDBManual_A: TLFDbedit;
     LFDBManual_B: TLFDbedit;
     LFDBManual_C: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBValor_Inc_PedClick(Sender: TObject);
     procedure CBValor_CosteClick(Sender: TObject);
     procedure CBValor_EntregaClick(Sender: TObject);
     procedure NavMainChangeState(Sender: TObject);
     procedure CBValor_ManualClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoFMConfiguracion : TIsoFMConfiguracion;

implementation

uses UIsoDMConfiguracion, UDMMain;

{$R *.dfm}

procedure TIsoFMConfiguracion.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TIsoDMConfiguracion, IsoDMConfiguracion);
end;

procedure TIsoFMConfiguracion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(IsoDMConfiguracion);
end;

procedure TIsoFMConfiguracion.CBValor_Inc_PedClick(Sender: TObject);
begin
  //sfg.albert - Quant desmarquen, es borren els valors
  if ((IsoDMConfiguracion.QMConfig.State = dsEdit) or (IsoDMConfiguracion.QMConfig.State = dsInsert)) then
  begin
     if (CBValor_Inc_Ped.Checked) then
        LFDBInc_A.SetFocus
     else
     begin
        IsoDMConfiguracion.QMConfigVALOR_INC_PED_A.AsInteger := 0;
        IsoDMConfiguracion.QMConfigVALOR_INC_PED_B.AsInteger := 0;
        IsoDMConfiguracion.QMConfigVALOR_INC_PED_C.AsInteger := 0;
     end;
  end;
end;

procedure TIsoFMConfiguracion.CBValor_CosteClick(Sender: TObject);
begin
  //sfg.albert - Quant desmarquen, es borren els valors
  if ((IsoDMConfiguracion.QMConfig.State = dsEdit) or (IsoDMConfiguracion.QMConfig.State = dsInsert)) then
  begin
     if (CBValor_Coste.Checked) then
        LFDBCoste_A.SetFocus
     else
     begin
        IsoDMConfiguracion.QMConfigVALOR_COSTE_A.AsInteger := 0;
        IsoDMConfiguracion.QMConfigVALOR_COSTE_B.AsInteger := 0;
        IsoDMConfiguracion.QMConfigVALOR_COSTE_C.AsInteger := 0;
     end;
  end;
end;

procedure TIsoFMConfiguracion.CBValor_EntregaClick(Sender: TObject);
begin
  //sfg.albert - Quant desmarquen, es borren els valors
  if ((IsoDMConfiguracion.QMConfig.State = dsEdit) or (IsoDMConfiguracion.QMConfig.State = dsInsert)) then
  begin
     if (CBValor_Entrega.Checked) then
        LFDBEntrega_A.SetFocus
     else
     begin
        IsoDMConfiguracion.QMConfigVALOR_ENTREGAS_A.AsInteger := 0;
        IsoDMConfiguracion.QMConfigVALOR_ENTREGAS_B.AsInteger := 0;
        IsoDMConfiguracion.QMConfigVALOR_ENTREGAS_C.AsInteger := 0;
     end;
  end;
end;

procedure TIsoFMConfiguracion.NavMainChangeState(Sender: TObject);
begin
  if ((IsoDMConfiguracion.QMConfig.State = dsEdit) or (IsoDMConfiguracion.QMConfig.State = dsInsert)) then
     LFPanelMain.Enabled := True
  else
     LFPanelMain.Enabled := False;
end;

procedure TIsoFMConfiguracion.CBValor_ManualClick(Sender: TObject);
begin
  //sfg.albert - Quant desmarquen, es borren els valors
  if ((IsoDMConfiguracion.QMConfig.State = dsEdit) or (IsoDMConfiguracion.QMConfig.State = dsInsert)) then
  begin
     if (CBValor_Manual.Checked) then
        LFDBManual_A.SetFocus
     else
     begin
        IsoDMConfiguracion.QMConfigVALOR_MANUAL_A.AsInteger := 0;
        IsoDMConfiguracion.QMConfigVALOR_MANUAL_B.AsInteger := 0;
        IsoDMConfiguracion.QMConfigVALOR_MANUAL_C.AsInteger := 0;
     end;
  end;
end;

end.
