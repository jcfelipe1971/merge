unit UFMlstItbis;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, NsDBGrid, UHYDBGrid, ULFComboBox,
  Mask, rxToolEdit, ULFDateEdit, ULFLabel, ExtCtrls, ULFPanel, UFormGest;

type
  TFMLstItbis = class(TG2KForm)
     PNLFiltro: TLFPanel;
     PNLDatos: TLFPanel;
     LFFechaDesde: TLFLabel;
     DEFechaDesdeMovimientos: TLFDateEdit;
     LFFechaHasta: TLFLabel;
     DEFechaHastaMovimientos: TLFDateEdit;
     LTipoMov: TLFLabel;
     CBTipoMov: TLFComboBox;
     DBGMovItbis: THYTDBGrid;
     BExtraer: TButton;
     BExportar: TButton;
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMLstItbis : TFMLstItbis;

implementation

uses UDMLstItbis, UFPEdit;

{$R *.dfm}

procedure TFMLstItbis.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
