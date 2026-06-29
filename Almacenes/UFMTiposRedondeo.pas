unit UFMTiposRedondeo;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ULFDBCheckBox, ULFDBEdit,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc;

type
  TFMTiposRedondeo = class(TFPEdit)
     DBETipo: TLFDbedit;
     Label2: TLFLabel;
     Label3: TLFLabel;
     DBETitulo: TLFDbedit;
     DBEDecimales: TLFDbedit;
     DBEValor: TLFDbedit;
     Label1: TLFLabel;
     Label4: TLFLabel;
     DBGTrunca: TDBRadioGroup;
     DBGMultiplo: TDBRadioGroup;
     DBGTipoTerminacion: TDBRadioGroup;
     DBCBAlzaBaja: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTiposRedondeo : TFMTiposRedondeo;

implementation

uses UDMTiposRedondeo, UFormGest;

{$R *.dfm}

procedure TFMTiposRedondeo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTiposRedondeo, DMTiposRedondeo);

  with DMTiposRedondeo do
  begin
     NavMain.DataSource := DSQMTiposRedondeo;
     DBGMain.DataSource := DSQMTiposRedondeo;
  end;
end;

procedure TFMTiposRedondeo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTiposRedondeo);
  FMTiposRedondeo := nil;
end;

end.
