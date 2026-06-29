unit UFPEditSinNavegador;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, ComCtrls, UEditPanel, UNavigator,
  ToolWin, UControlEdit, Menus, UTeclas, StdCtrls, DB, UFormGest,
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc;

type
  TFPEditSinNavegador = class(TG2KForm)
     CEMain: TControlEdit;
     CEMainPMEdit: TPopUpTeclas;
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     EPMain: THYMEditPanel;
     FSMain: TLFFibFormStorage;
     ALMain: TLFActionList;
     TBActions: TLFToolBar;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormShow(Sender: TObject);
     procedure FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure SalirConEscape(Habilitado: boolean = True);
  private
     { Private declarations }
     SalirConEscapeHabilitado: boolean;
  public
     { Public declarations }
  end;

var
  FPEditSinNavegador : TFPEditSinNavegador;

implementation

uses UDMMain, UFMain, UEntorno, UHYDBGrid, UComponentesBusquedaFiltrada, NsDBGrid, DBCtrls, ULFEdit, ULFDBEdit, ULFEditFind2000, ULFDBEditFind2000;

{$R *.DFM}

procedure TFPEditSinNavegador.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;
  // FSMain.Profile := ifthen(super, - 1, REntorno.User_Profile);
end;

procedure TFPEditSinNavegador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFPEditSinNavegador.FormShow(Sender: TObject);
var
  i, c : integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
     // Evito que las columnas de los grids sean mas grandes que el grid.
     if (Self.Components[i] is TDBGridFind2000) then
     begin
        with TDBGridFind2000(Self.Components[i]) do
        begin
           for c := 0 to Columns.Count - 1 do
           begin
              if (Columns[c].Width > Width) then
                 Columns[c].Width := Width - 50;
           end;
        end;
     end
     else
     if (Self.Components[i] is THYTDBGrid) then
     begin
        with THYTDBGrid(Self.Components[i]) do
        begin
           for c := 0 to Columns.Count - 1 do
           begin
              if (Columns[c].Width > Width) then
                 Columns[c].Width := Width - 50;
           end;
        end;
     end
     else
     if (Self.Components[i] is TNsDBGrid) then
     begin
        with TNsDBGrid(Self.Components[i]) do
        begin
           for c := 0 to Columns.Count - 1 do
           begin
              if (Columns[c].Width > Width) then
                 Columns[c].Width := Width - 50;
           end;
        end;
     end
     else
     // Transformo Enabled en ReadOnly para evitar el color gris en las fuentes
     if (Self.Components[i] is TDBEdit) then
     begin
        with TDBEdit(Self.Components[i]) do
        begin
           if (not Enabled) or ReadOnly then
           begin
              Enabled := True;
              ReadOnly := True;
              Font.Color := clWindowText;
              if (Color <> REntorno.ColorEnlaceActivo) then
                 Color := clInfoBk;
           end;

           if ReadOnly then
              TabStop := False;
        end;
     end
     else
     if (Self.Components[i] is TEdit) then
     begin
        with TEdit(Self.Components[i]) do
        begin
           if (not Enabled) or ReadOnly then
           begin
              Enabled := True;
              ReadOnly := True;
              Font.Color := clWindowText;
              if (Color <> REntorno.ColorEnlaceActivo) then
                 Color := clInfoBk;
           end;

           if ReadOnly then
              TabStop := False;
        end;
     end
     else
     if (Self.Components[i] is TLFEditFind2000) then
        TLFEditFind2000(Self.Components[i]).Font.Color := clWindowText
     else
     if (Self.Components[i] is TLFDBEditFind2000) then
        TLFDBEditFind2000(Self.Components[i]).Font.Color := clWindowText;
  end;
end;

procedure TFPEditSinNavegador.FormKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if SalirConEscapeHabilitado and (Key = VK_ESCAPE) then
     Close;
end;

procedure TFPEditSinNavegador.SalirConEscape(Habilitado: boolean = True);
begin
  // Esto hace que al picar una tecla pase por los controladoes del form antes de seguir.
  if Habilitado then
     KeyPreview := True;
  SalirConEscapeHabilitado := Habilitado;
end;

end.
