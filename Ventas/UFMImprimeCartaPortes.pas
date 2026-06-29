unit UFMImprimeCartaPortes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, Mask, rxToolEdit, ULFDateEdit,
  ULFEdit, StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, ULFLabel, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  UNavigator, TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMImprimeCartaPortes = class(TFPEditSinNavegador)
     PNLDatosCartaPorte: TLFPanel;
     DBGAlbaranes: THYTDBGrid;
     LFecha: TLFLabel;
     LTransportista: TLFLabel;
     LDirTransportista: TLFLabel;
     EFTransportista: TLFEditFind2000;
     EFDirTransportista: TLFEditFind2000;
     ETransportista: TLFEdit;
     EDirTransportista: TLFEdit;
     DEFecha: TLFDateEdit;
     NavImp: THYMNavigator;
     ToolButton1: TToolButton;
     Butt1: TToolButton;
     TbuttMarcar: TToolButton;
     TButtCancelar: TToolButton;
     Butt2: TToolButton;
     TButtGenerar: TToolButton;
     PNLTodosLosAlbaranes: TLFPanel;
     CBTodosLosAlbaranes: TLFCheckBox;
     LMatriculaDefecto: TLFLabel;
     EFMatricula: TLFEditFind2000;
     LNaturaleza: TLFLabel;
     EFNaturaleza: TLFEditFind2000;
     ETituloMatricula: TLFEdit;
     ETituloNaturaleza: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFTransportistaChange(Sender: TObject);
     procedure EFDirTransportistaBusqueda(Sender: TObject);
     procedure EFDirTransportistaChange(Sender: TObject);
     procedure TbuttMarcarClick(Sender: TObject);
     procedure TButtCancelarClick(Sender: TObject);
     procedure TButtGenerarClick(Sender: TObject);
     procedure CBTodosLosAlbaranesChange(Sender: TObject);
     procedure EFMatriculaChange(Sender: TObject);
     procedure EFNaturalezaChange(Sender: TObject);
  private
     { Private declarations }
     TerceroTransportista: integer;
  public
     { Public declarations }
     function Seleccionado: boolean;
  end;

var
  FMImprimeCartaPortes : TFMImprimeCartaPortes;

implementation

uses UDMImprimeCartaPortes, UDMMain, UFormGest, UEntorno, HYFIBQuery, DB, UDameDato;

{$R *.dfm}

procedure TFMImprimeCartaPortes.FormCreate(Sender: TObject);
begin
  inherited;
  TerceroTransportista := 0;
  AbreData(TDMImprimeCartaPortes, DMImprimeCartaPortes);
  DEFecha.Date := REntorno.FechaTrab;
  CBTodosLosAlbaranes.Checked := False;
  CBTodosLosAlbaranesChange(nil);
end;

procedure TFMImprimeCartaPortes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImprimeCartaPortes);
end;

procedure TFMImprimeCartaPortes.EFTransportistaChange(Sender: TObject);
begin
  inherited;
  TerceroTransportista := DameTercero('ACR', StrToIntDef(EFTransportista.Text, 0));
  ETransportista.Text := DameTituloAcreedor(StrToIntDef(EFTransportista.Text, 0));

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DIRECCION FROM SYS_TERCEROS_DIRECCIONES ');
        SQL.Add(' WHERE ');
        SQL.Add(' TERCERO = :TERCERO AND ');
        SQL.Add(' ACTIVO = 1 ');
        SQL.Add(' ORDER BY DIR_DEFECTO DESC ');
        Params.ByName['TERCERO'].AsInteger := TerceroTransportista;
        ExecQuery;
        EFDirTransportista.Text := FieldByName['DIRECCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  EDirTransportista.Text := DameTituloDireccionTercero(TerceroTransportista, StrToIntDef(EFDirTransportista.Text, 0));
  EFMatricula.Text := DMImprimeCartaPortes.DameMatriculaDefecto(StrToIntDef(EFTransportista.Text, 0));
  EFNaturaleza.Text := IntToStr(DMImprimeCartaPortes.DameNaturalezaDefecto);
end;

procedure TFMImprimeCartaPortes.EFDirTransportistaBusqueda(Sender: TObject);
begin
  inherited;
  EFDirTransportista.CondicionBusqueda := ' TERCERO = ' + IntToStr(TerceroTransportista);
end;

procedure TFMImprimeCartaPortes.EFDirTransportistaChange(Sender: TObject);
begin
  inherited;
  EDirTransportista.Text := DameTituloDireccionTercero(TerceroTransportista, StrToIntDef(EFDirTransportista.Text, 0));
end;

procedure TFMImprimeCartaPortes.TbuttMarcarClick(Sender: TObject);
var
  m : TBookmark;
begin
  inherited;
  DBGAlbaranes.SelectedRows.Clear;

  with DBGAlbaranes.DataSource.DataSet do
  begin
     m := GetBookmark;
     try
        DisableControls;

        First;
        repeat
           DBGAlbaranes.SelectedRows.CurrentRowSelected := True;
           Next;
        until EOF;

        try
           GotoBookmark(m);
        except
           First;
        end;
     finally
        EnableControls;
        FreeBookmark(m);
     end;
  end;
end;

procedure TFMImprimeCartaPortes.TButtCancelarClick(Sender: TObject);
begin
  inherited;
  DBGAlbaranes.SelectedRows.Clear;
end;

procedure TFMImprimeCartaPortes.TButtGenerarClick(Sender: TObject);
begin
  inherited;
  DMImprimeCartaPortes.Generar(DEFecha.Date, StrToInt(EFTransportista.Text), StrToInt(EFDirTransportista.Text), EFMatricula.Text, StrToInt(EFNaturaleza.Text));
  TButtCancelar.Click;
end;

function TFMImprimeCartaPortes.Seleccionado: boolean;
begin
  Result := DBGAlbaranes.SelectedRows.CurrentRowSelected;
end;

procedure TFMImprimeCartaPortes.CBTodosLosAlbaranesChange(Sender: TObject);
begin
  inherited;
  DMImprimeCartaPortes.MuestraAlbaranes(CBTodosLosAlbaranes.Checked);
end;

procedure TFMImprimeCartaPortes.EFMatriculaChange(Sender: TObject);
begin
  inherited;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TITULO ');
        SQL.Add(' FROM EMP_MATRICULAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' MATRICULA = :MATRICULA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['MATRICULA'].AsString := EFMatricula.Text;
        ExecQuery;
        ETituloMatricula.Text := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMImprimeCartaPortes.EFNaturalezaChange(Sender: TObject);
begin
  inherited;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TITULO ');
        SQL.Add(' FROM SYS_NATURALEZA_CARGA ');
        SQL.Add(' WHERE ');
        SQL.Add(' NATURALEZA = :NATURALEZA ');
        Params.ByName['NATURALEZA'].AsInteger := StrToIntDef(EFNaturaleza.Text, 0);
        ExecQuery;
        ETituloNaturaleza.Text := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
