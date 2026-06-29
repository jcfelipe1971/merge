unit UFPEditListado;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, UEditPanel, ToolWin, ActnList, UControlEdit,
  UFormGest, ULFActionList, ULFPageControl, ULFToolBar,
  Fr_HYReport, UHYReport, UHYReportMail, frxHYReport, rxPlacemnt,
  ULFFormStorage, UFPEditListadoSimple, ULFPanel;

type
  TFPEditListado = class(TFPEditListadoSimple)
     PCMain: TLFPageControl;
  private
     { Private declarations }
  public
     { Public declarations }
  protected
  end;

var
  FPEditListado : TFPEditListado;

implementation

uses UDMMain;

{$R *.DFM}

end.
