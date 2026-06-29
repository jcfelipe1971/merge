unit UFPEditListadoSfg;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditListado, StdCtrls, ComCtrls, ExtCtrls, ActnList, ToolWin,
  Mask, rxToolEdit, ULFComboBox, ULFEdit, ULFPanel, ULFActionList,
  ULFPageControl, ULFToolBar, ULFLabel, ULFDateEdit, rxPlacemnt,
  ULFFormStorage;

type
  TFPEditListadoSfg = class(TFPEditListado)
     PNLOrden: TLFPanel;
     LComentario: TLFLabel;
     EComentario: TLFEdit;
     LOrden: TLFLabel;
     CBOrden: TLFComboBox;
     LFechaListado: TLFLabel;
     TDPFechaListado: TLFDateEdit;
     TButtConfigurar: TToolButton;
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FPEditListadoSfg : TFPEditListadoSfg;

implementation

uses UEntorno;

{$R *.dfm}

procedure TFPEditListadoSfg.FormCreate(Sender: TObject);
begin
  inherited;
  TDPFechaListado.Date := REntorno.FechaTrabSH;
end;

end.
