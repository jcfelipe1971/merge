unit UProFMRelOfertesV;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ULFPanel, ULFLabel, UFormGest, ComCtrls,
  ToolWin, UEditPanel, UDMMain, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEdit, UEntorno, ULFDBEdit, ULFToolBar,
  ActnList, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ULFActionList,
  Menus, UTeclas, UControlEdit;

type
  TProFMRelOfertesV = class(TFPEditSinNavegador)
     RBSeleccionar: TRadioGroup;
     PnlBuscar: TLFPanel;
     PnlSelec: TLFPanel;
     LblSelec: TLFLabel;
     TBGenerar: TToolButton;
     RGPlantilla: TRadioGroup;
     EFSelecc: TEditFind2000;
     LblBusca: TLFLabel;
     LblPlantilla: TLFLabel;
     LFDescSelecc: TLFDbedit;
     BarraEstat: TStatusBar;
     LFDArticle: TLFDbedit;
     AOfertesE: TAction;
     AEscandalls: TAction;
     AOfertasEsp: TAction;
     procedure RBSeleccionarClick(Sender: TObject);
     procedure EFSeleccBusqueda(Sender: TObject);
     procedure RGPlantillaClick(Sender: TObject);
     procedure EFSeleccChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBGenerarClick(Sender: TObject);
     procedure AOfertesEExecute(Sender: TObject);
     procedure AEscandallsExecute(Sender: TObject);
     procedure AOfertasEspExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMRelOfertesV : TProFMRelOfertesV;

implementation

uses UProDMRelOfertesV, UDMOfertas, DB, UFMain, UParam;

{$R *.dfm}

procedure TProFMRelOfertesV.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TProDMRelOfertesV, ProDMRelOfertesV);
  RBSeleccionar.ItemIndex := 0;
  BarraEstat.Panels[0].Text := 'Crear oferta/escandallo de: ' +
     DMOfertas.QMDetalleARTICULO.AsString + ' - ' +
     DMOfertas.QMDetalleTITULO.AsString;
end;

procedure TProFMRelOfertesV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(ProDMRelOfertesV);
end;

procedure TProFMRelOfertesV.RBSeleccionarClick(Sender: TObject);
begin
  if (RBSeleccionar.ItemIndex = 1) then
  begin
     RGPlantilla.Visible := True;
     RGPlantilla.ItemIndex := -1;
  end
  else if ((RBSeleccionar.ItemIndex = 0)) then
  begin
     RGPlantilla.Visible := False;
     PnlBuscar.Enabled := False;
  end;

  EFSelecc.Clear;
  LFDescSelecc.Clear;
  LFDArticle.Clear;
end;

procedure TProFMRelOfertesV.EFSeleccBusqueda(Sender: TObject);
begin
  if (RGPlantilla.ItemIndex = 0) then
     EFSelecc.CondicionBusqueda := 'tipo=''' + 'OFE' + ''''
  else if (RGPlantilla.ItemIndex = 1) then
     EFSelecc.CondicionBusqueda := 'tipo=''' + 'EPR' + '''';
end;

procedure TProFMRelOfertesV.RGPlantillaClick(Sender: TObject);
begin
  //Es posa a enabled=el panell de selecció
  PnlBuscar.Enabled := True;
  EFSelecc.Clear;
  LFDescSelecc.Clear;
  LFDArticle.Clear;
  EFSelecc.SetFocus;
end;

procedure TProFMRelOfertesV.EFSeleccChange(Sender: TObject);
var
  tipo_esc : string;
begin
  if (EFSelecc.Text <> '') then
  begin
     if (RGPlantilla.ItemIndex = 0) then
        tipo_esc := 'OFE'
     else if (RGPlantilla.ItemIndex = 1) then
        tipo_esc := 'EPR';

     with ProDMRelOfertesV.xEscandallo do
     begin
        Close;
        Params.ByName['empresa'].AsInteger := REntorno.Empresa;
        Params.ByName['Escandallo'].AsInteger := StrToInt(EFSelecc.Text);
        Params.ByName['Tipo'].AsString := Tipo_Esc;
        Open;
     end;
  end;
end;

procedure TProFMRelOfertesV.TBGenerarClick(Sender: TObject);
var
  Param_MODREST010 : string;
begin
  { TODO : Pasar todo esto al DataModule }

  // ANDALplast
  Param_MODREST010 := LeeParametro('MODREST010');

  if (RBSeleccionar.ItemIndex = 0) then  // Crear ofertas
  begin
     ProDMRelOfertesV.xInsertarOferta.Close;
     if (Param_MODREST010 = 'S') then
        ProDMRelOfertesV.xInsertarOferta.SQL.Text := 'insert into emp_oferta(empresa,fecha,compuesto,cliente,pedido1,id_detalles_ofertas_v,titulo_art)' + //SFG_JLA
           ' values(?empresa,?fecha,?compuesto,?cliente,?unidades,?id_detalles,?titulo_art)'; //SFG_JLA
     ProDMRelOfertesV.xInsertarOferta.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     if (Param_MODREST010 <> 'S') then
        ProDMRelOfertesV.xInsertarOferta.Params.ByName['tipo_esc'].AsString := 'OFE';
     ProDMRelOfertesV.xInsertarOferta.Params.ByName['compuesto'].AsString := DMOfertas.QMDetalleARTICULO.AsString;
     ProDMRelOfertesV.xInsertarOferta.Params.ByName['unidades'].AsFloat := DMOfertas.QMDetalleUNIDADES.AsFloat;
     if (Param_MODREST010 <> 'S') then
     begin
        ProDMRelOfertesV.xInsertarOferta.Params.ByName['unidad'].AsString := '-';
        ProDMRelOfertesV.xInsertarOferta.Params.ByName['id_detalles_ofertas_v'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        ProDMRelOfertesV.xInsertarOferta.Params.ByName['id_detalles_pedidos_v'].AsInteger := 0;
     end;
     ProDMRelOfertesV.xInsertarOferta.Params.ByName['cliente'].AsFloat := DMOfertas.QMCabeceraCLIENTE.AsInteger; //sfg_rsl insertar client
     if (Param_MODREST010 = 'S') then
     begin
        ProDMRelOfertesV.xInsertarOferta.Params.ByName['fecha'].AsDateTime := REntorno.FechaTrabSH;                      //SFG_JLA
        ProDMRelOfertesV.xInsertarOferta.Params.ByName['titulo_art'].AsString := DMOfertas.QMDetalleTITULO.AsString;           //SFG_JLA
     end;
     ProDMRelOfertesV.xInsertarOferta.Prepare;
     ProDMRelOfertesV.xInsertarOferta.ExecQuery;

     ProDMRelOfertesV.xBuscarUltimEscandall.Close;
     if (Param_MODREST010 = 'S') then
        ProDMRelOfertesV.xBuscarUltimEscandall.SQL.Text := 'select max(rig_of) from emp_oferta' + //SFG_JLA
           ' where empresa=?empresa'; //SFG_JLA
     ProDMRelOfertesV.xBuscarUltimEscandall.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     if (Param_MODREST010 <> 'S') then
        ProDMRelOfertesV.xBuscarUltimEscandall.Params.ByName['Tipo'].AsString := 'OFE';
     ProDMRelOfertesV.xBuscarUltimEscandall.Prepare;
     ProDMRelOfertesV.xBuscarUltimEscandall.ExecQuery;
     ShowMessage(Format(_('Oferta de escandallo creada con éxito. Núm. %s'), [ProDMRelOfertesV.xBuscarUltimEscandall.Fields[0].AsString]));

     if (Param_MODREST010 <> 'S') then
     begin
        //sfg.albert - S'inserta el id_esc al detall de la oferta
        ProDMRelOfertesV.xUpdateOferta.Close;
        ProDMRelOfertesV.xUpdateOferta.Params.ByName['id_esc'].AsInteger := ProDMRelOfertesV.xBuscarUltimEscandall.Fields[1].AsInteger;
        ProDMRelOfertesV.xUpdateOferta.Params.ByName['id_detalles_s'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        ProDMRelOfertesV.xUpdateOferta.Params.ByName['tipo_defecto'].AsString := 'OFE';
        ProDMRelOfertesV.xUpdateOferta.Prepare;
        ProDMRelOfertesV.xUpdateOferta.ExecQuery;
        ProDMRelOfertesV.xUpdateOferta.FreeHandle;
     end;

     if (Param_MODREST010 = 'S') then
        AOfertasEsp.Execute //SFG_JLA
     else
        AOfertesE.Execute;
     Close;
  end
  {DE MOMENT NO FAREM SERVIR PER CREAR ESCANDALLS DES DE OFERTES
  else if (RBSeleccionar.ItemIndex=1) then  //Crear escandallos
    begin
      ProDMRelOfertesV.xInsertarOferta.Close;
      ProDMRelOfertesV.xInsertarOferta.Params.ByName['empresa'].AsInteger:=REntorno.Empresa;
      ProDMRelOfertesV.xInsertarOferta.Params.ByName['tipo_esc'].AsString:='EPR';
      ProDMRelOfertesV.xInsertarOferta.Params.ByName['compuesto'].AsString:=DMOfertas.QMDetalleARTICULO.AsString;
      ProDMRelOfertesV.xInsertarOferta.Params.ByName['unidades'].AsFloat:=DMOfertas.QMDetalleUNIDADES.AsFloat;
      ProDMRelOfertesV.xInsertarOferta.Params.ByName['unidad'].AsString:='-';
      ProDMRelOfertesV.xInsertarOferta.Params.ByName['id_detalles'].AsInteger:=DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
      ProDMRelOfertesV.xInsertarOferta.Prepare;
      ProDMRelOfertesV.xInsertarOferta.ExecQuery;

      ProDMRelOfertesV.xBuscarUltimEscandall.Close;
      ProDMRelOfertesV.xBuscarUltimEscandall.Params.ByName['Empresa'].AsInteger:=REntorno.Empresa;
      ProDMRelOfertesV.xBuscarUltimEscandall.Params.ByName['Tipo'   ].AsString:='EPR';
      ProDMRelOfertesV.xBuscarUltimEscandall.Prepare;
      ProDMRelOfertesV.xBuscarUltimEscandall.ExecQuery;
      ShowMessage('Escandallo creado con éxito. Núm. '+ProDMRelOfertesV.xBuscarUltimEscandall.Fields[0].AsString);
      AEscandalls.Execute;
      Close;
    end
}
  //****DUPLICACIÓ*****
  //  else if ((RBSeleccionar.ItemIndex=2) and (RGPlantilla.ItemIndex=0)) then  //Crear ofertas a partir de otra
  else
  if ((RBSeleccionar.ItemIndex = 1) and (RGPlantilla.ItemIndex = 0)) then  //Crear ofertas a partir de otra
  begin
     ProDMRelOfertesV.xDuplicarOferta.Close;
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['tipo_ori'].AsString := 'OFE';
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['escandallo_ori'].AsInteger := StrToInt(EFSelecc.Text);
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['tipo_dest'].AsString := 'OFE';
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['compuesto_dest'].AsString := DMOfertas.QMDetalleARTICULO.AsString;
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['id_detalles_ofertas_v'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['id_detalles_pedidos_v'].AsInteger := 0;
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['entrada'].AsInteger := REntorno.Entrada;
     ProDMRelOfertesV.xDuplicarOferta.Prepare;
     ProDMRelOfertesV.xDuplicarOferta.ExecQuery;
     ShowMessage(Format(_('Oferta de escandallo creada con éxito. Núm. %s'), [ProDMRelOfertesV.xDuplicarOferta.Fields[0].AsString]));

     if (Param_MODREST010 <> 'S') then
     begin
        //sfg.albert - S'inserta el id_esc al detall de la oferta
        ProDMRelOfertesV.xUpdateOferta.Close;
        ProDMRelOfertesV.xUpdateOferta.Params.ByName['id_esc'].AsInteger := ProDMRelOfertesV.xDuplicarOferta.Fields[1].AsInteger;
        ProDMRelOfertesV.xUpdateOferta.Params.ByName['id_detalles_s'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        ProDMRelOfertesV.xUpdateOferta.Params.ByName['tipo_defecto'].AsString := 'OFE';
        ProDMRelOfertesV.xUpdateOferta.Prepare;
        ProDMRelOfertesV.xUpdateOferta.ExecQuery;
        ProDMRelOfertesV.xUpdateOferta.FreeHandle;
     end;

     AOfertesE.Execute;
     Close;
  end
  //  else if ((RBSeleccionar.ItemIndex=2) and (RGPlantilla.ItemIndex=1)) then  //Crear oferta a partir de un escandallo
  else
  if ((RBSeleccionar.ItemIndex = 1) and (RGPlantilla.ItemIndex = 1)) then  //Crear oferta a partir de un escandallo
  begin
     ProDMRelOfertesV.xDuplicarOferta.Close;
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['tipo_ori'].AsString := 'EPR';
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['escandallo_ori'].AsInteger := StrToInt(EFSelecc.Text);
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['tipo_dest'].AsString := 'OFE';
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['compuesto_dest'].AsString := DMOfertas.QMDetalleARTICULO.AsString;
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['id_detalles_ofertas_v'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['id_detalles_pedidos_v'].AsInteger := 0;
     ProDMRelOfertesV.xDuplicarOferta.Params.ByName['entrada'].AsInteger := REntorno.Entrada;
     ProDMRelOfertesV.xDuplicarOferta.Prepare;
     ProDMRelOfertesV.xDuplicarOferta.ExecQuery;
     ShowMessage(Format(_('Oferta de escandallo creada con éxito. Núm. %s'), [ProDMRelOfertesV.xDuplicarOferta.Fields[0].AsString]));

     if (Param_MODREST010 <> 'S') then
     begin
        //sfg.albert - S'inserta el id_esc al detall de la oferta
        ProDMRelOfertesV.xUpdateOferta.Close;
        ProDMRelOfertesV.xUpdateOferta.Params.ByName['id_esc'].AsInteger := ProDMRelOfertesV.xDuplicarOferta.Fields[1].AsInteger;
        ProDMRelOfertesV.xUpdateOferta.Params.ByName['id_detalles_s'].AsInteger := DMOfertas.QMDetalleID_DETALLES_S.AsInteger;
        ProDMRelOfertesV.xUpdateOferta.Params.ByName['tipo_defecto'].AsString := 'OFE';
        ProDMRelOfertesV.xUpdateOferta.Prepare;
        ProDMRelOfertesV.xUpdateOferta.ExecQuery;
        ProDMRelOfertesV.xUpdateOferta.FreeHandle;
     end;

     if (Param_MODREST010 = 'S') then
        AOfertasEsp.Execute //SFG_JLA
     else
        AOfertesE.Execute;
     Close;
  end;
end;

procedure TProFMRelOfertesV.AOfertesEExecute(Sender: TObject);
var
  valor : string;
begin
  if ((RBSeleccionar.ItemIndex = 0){ or (RBSeleccionar.ItemIndex=1)}) then
     valor := ProDMRelOfertesV.xBuscarUltimEscandall.Fields[0].AsString
  //  else if (RBSeleccionar.ItemIndex=2) then
  else if (RBSeleccionar.ItemIndex = 1) then
     valor := ProDMRelOfertesV.xDuplicarOferta.Fields[0].AsString;

  if (valor <> '') then
     FMain.EjecutaAccion(FMain.AProOfertasE, 'Escandallo = ' + valor);
end;

procedure TProFMRelOfertesV.AEscandallsExecute(Sender: TObject);
var
  valor : string;
begin
  if ((RBSeleccionar.ItemIndex = 0){ or (RBSeleccionar.ItemIndex=1)}) then
     valor := ProDMRelOfertesV.xBuscarUltimEscandall.Fields[0].AsString
  //  else if (RBSeleccionar.ItemIndex=2) then
  else if (RBSeleccionar.ItemIndex = 2) then
     valor := ProDMRelOfertesV.xDuplicarOferta.Fields[0].AsString;

  if (valor <> '') then
     FMain.EjecutaAccion(FMain.AProEscandallosF, 'Escandallo = ' + valor);
end;

procedure TProFMRelOfertesV.AOfertasEspExecute(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AOfertasANDALplast, ' RIG_OF = ' + ProDMRelOfertesV.xBuscarUltimEscandall.Fields[0].AsString);
end;

end.
