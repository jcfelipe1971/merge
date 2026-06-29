unit UFMDivilo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, ULFPageControl;

type
  TFMDivilo = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSImportacion: TTabSheet;
     TSPunteo: TTabSheet;
     PNLImportacion: TLFPanel;
     TBImportacion: TLFToolBar;
     TBPunteo: TLFToolBar;
     PNLPunteo: TLFPanel;
     PNLFacturas: TLFPanel;
     PNLDivilo: TLFPanel;
     splPunteo: TSplitter;
     splImportacion: TSplitter;
     PNLExcel: TLFPanel;
     PNLDiviloAImportar: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure splImportacionMoved(Sender: TObject);
     procedure splPunteoMoved(Sender: TObject);
     procedure PMainResize(Sender: TObject);
     procedure TSImportacionShow(Sender: TObject);
     procedure TSPunteoShow(Sender: TObject);
  private
     { Private declarations }
     Porc_splImportacion, Porc_splPunteo: double;
  public
     { Public declarations }
  end;

var
  FMDivilo : TFMDivilo;

implementation

uses UDMDivilo, UDMMain, UEntorno, UFMain, UUtiles, UFormGest;

{$R *.dfm}

procedure TFMDivilo.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  AbreData(TDMDivilo, DMDivilo);

  // Necesito este paso porque el LeeDatoIni se guarda como integer y Porc_... es double y se interpreta como un TDateTime.
  i := LeeDatoIni('FMDivilo', 'Porc_splImportacion', 50);
  Porc_splImportacion := i;

  i := LeeDatoIni('FMDivilo', 'Porc_splPunteo', 50);
  Porc_splPunteo := i;

  PCMain.ActivePage := TSImportacion;
end;

procedure TFMDivilo.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  inherited;

  // Necesito este paso porque el LeeDatoIni se guarda como integer y Porc_... es double y se interpreta como un TDateTime.
  i := Trunc(Porc_splImportacion);
  EscribeDatoIni('FMDivilo', 'Porc_splImportacion', i);
  i := Trunc(Porc_splPunteo);
  EscribeDatoIni('FMDivilo', 'Porc_splPunteo', i);

  CierraData(DMDivilo);
end;

procedure TFMDivilo.splImportacionMoved(Sender: TObject);
begin
  inherited;
  Porc_splImportacion := 100 * splImportacion.Left / PNLImportacion.Width;
end;

procedure TFMDivilo.splPunteoMoved(Sender: TObject);
begin
  inherited;
  Porc_splPunteo := 100 * splPunteo.Left / PNLPunteo.Width;
end;

procedure TFMDivilo.PMainResize(Sender: TObject);
begin
  inherited;
  splImportacion.MinSize := PMain.Width div 4;
  PNLExcel.Width := Trunc(PNLImportacion.Width * Porc_splImportacion / 100);
  splPunteo.MinSize := PMain.Width div 4;
  PNLFacturas.Width := Trunc(PNLPunteo.Width * Porc_splPunteo / 100);
end;

procedure TFMDivilo.TSImportacionShow(Sender: TObject);
begin
  inherited;
  PMainResize(Sender);
end;

procedure TFMDivilo.TSPunteoShow(Sender: TObject);
begin
  inherited;
  PMainResize(Sender);
end;

end.
