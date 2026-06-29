unit UProDMFicherosCliente;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, Controls, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TProDMFicherosCliente = class(TDataModule)
     TLocal: THYTransaction;
     DSFicheros: TDataSource;
     xFicheros: TFIBTableSet;
     xFicherosID: TIntegerField;
     xFicherosPROCEDENCIA: TFIBStringField;
     xFicherosCLAVE: TFIBStringField;
     xFicherosTABLAS: TFIBStringField;
     xFicherosNOMBRE: TFIBStringField;
     xFicherosEXTENSION: TFIBStringField;
     xFicherosDESCRIPCION: TFIBStringField;
     xFicherosFECHA: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xFicherosAfterScroll(DataSet: TDataSet);
     procedure Borra(DataSet: TDataSet);
     procedure xFicherosNewRecord(DataSet: TDataSet);
     procedure xFicherosAfterCancel(DataSet: TDataSet);
     procedure xFicherosAfterOpen(DataSet: TDataSet);
     procedure xFicherosBeforeDelete(DataSet: TDataSet);
     procedure xFicherosAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     RutaLocal: string; // Ruta con directorio + fichero
     FicheroLocal: string; // Nombre del fichero en local
     ExtensionLocal: string; // extensión del archivo
     FicheroABorrar: string;
     Hacer_commit: boolean;
     Clave: string;
     Procedencia: string;
     Tablas: string;
     procedure InformarRutas;
     procedure CargaModo;
  public
     { Public declarations }
     CarpetaRemota: string;
     CarpetaLocal: string;
     procedure Filtra(aClave, aTablas, aProcedencia: string);
     procedure GuardaFichero(Directorio: string);
     procedure CargarImagen;
     procedure BusquedaCompleja;
  end;

var
  ProDMFicherosCliente : TProDMFicherosCliente;

implementation

uses UDMMain, UEntorno, UProFMFicherosCliente, idGlobalProtocols, UFBusca;

{$R *.dfm}

procedure TProDMFicherosCliente.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  Hacer_commit := True;
  xFicheros.Close;
  xFicheros.Open;
end;

procedure TProDMFicherosCliente.xFicherosAfterScroll(DataSet: TDataSet);
begin
  CargarImagen;
end;

procedure TProDMFicherosCliente.CargarImagen;
begin
  ProFMFicherosCliente.Navegar(REntorno.RutaFicheros + xFicherosID.AsString + xFicherosEXTENSION.AsString);
end;

procedure TProDMFicherosCliente.Filtra(aClave, aTablas, aProcedencia: string);
begin
  Clave := aClave;
  Tablas := aTablas;
  Procedencia := aProcedencia;

  if (xFicheros.State = dsInsert) or (xFicheros.State = dsEdit) then
     xFicheros.Post;

  with xFicheros do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM PRO_FICHEROS_PEDIDOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' CLAVE = ?CLAVE AND ');
     SelectSQL.Add(' PROCEDENCIA = ?PROCEDENCIA ');
     SelectSQL.Add(' ORDER BY FECHA DESC ');
     Params.ByName['CLAVE'].AsString := Clave;
     Params.ByName['PROCEDENCIA'].AsString := Procedencia;
     Open;
  end;
end;

procedure TProDMFicherosCliente.Borra(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;

  if not (DeleteFile(FicheroABorrar)) then
     raise Exception.Create(_('No se ha podido borrar físicamente el fichero especificado') + #13#10 + REntorno.RutaFicheros);
end;

procedure TProDMFicherosCliente.xFicherosNewRecord(DataSet: TDataSet);
begin
  ProFMFicherosCliente.CargaFichero;
  CargaModo;
  InformarRutas;

  XFicherosCLAVE.AsString := Clave;
  XFicherosPROCEDENCIA.AsString := Procedencia;
  XFicherosNOMBRE.AsString := FicheroLocal;
  XFicherosEXTENSION.AsString := ExtensionLocal;
  XFicherosTABLAS.AsString := Tablas;
  XFicherosID.AsInteger := DMMain.ContadorGen('PRO_GEN_ID_FICHERO_WEB');

  if not CopyFileTo(PChar(RutaLocal), PChar(REntorno.RutaFicheros + XFicherosID.AsString + XFicherosEXTENSION.AsString)) then
  begin
     Hacer_commit := False;
     raise Exception.Create(_('No es posible copiar el fichero a la ruta especificada') + #13#10 + REntorno.RutaFicheros);
  end;
end;

procedure TProDMFicherosCliente.InformarRutas;
begin
  // Obtener nombre del fichero
  RutaLocal := ProFMFicherosCliente.LFFichero.Text;
  if RutaLocal = '' then
     raise Exception.Create(_('Fichero no puede ser vacío'))
  else
  begin
     FicheroLocal := ExtractFileName(RutaLocal);
     ExtensionLocal := ExtractFileExt(FicheroLocal);
  end;
end;

procedure TProDMFicherosCliente.xFicherosAfterCancel(DataSet: TDataSet);
begin
  CargaModo;
end;

procedure TProDMFicherosCliente.xFicherosAfterOpen(DataSet: TDataSet);
begin
  CargaModo;
  CargarImagen;
end;

procedure TProDMFicherosCliente.CargaModo;
begin
  // por defecto
  xFicherosNOMBRE.ReadOnly := False;
  ProFMFicherosCliente.CargaModo(xFicheros.State = dsInsert);
end;

procedure TProDMFicherosCliente.GuardaFichero(Directorio: string);
begin
  if not CopyFileTo(PChar(REntorno.RutaFicheros + xFicherosID.AsString + xFicherosEXTENSION.AsString),
     PChar(Directorio)) then
     raise Exception.Create(_('No es posible copiar el fichero a la ruta especificada') + #13#10 + REntorno.RutaFicheros);
end;

procedure TProDMFicherosCliente.xFicherosBeforeDelete(DataSet: TDataSet);
begin
  FicheroABorrar := REntorno.RutaFicheros + XFicherosID.AsString + XFicherosEXTENSION.AsString;
end;

procedure TProDMFicherosCliente.xFicherosAfterPost(DataSet: TDataSet);
begin
  if (Hacer_commit) then
     TFIBTableSet(DataSet).Transaction.CommitRetaining
  else
     TFIBTableSet(DataSet).Transaction.Rollback;

  Hacer_commit := True;
  DataSet.Refresh;
  CargaModo;
end;

procedure TProDMFicherosCliente.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(xFicheros, '00000');
end;

end.
