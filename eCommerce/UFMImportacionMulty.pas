unit UFMImportacionMulty;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, Mask, rxToolEdit,
  ULFLabel, TFlatCheckBoxUnit, ULFCheckBox, ULFDateEdit;

type
  TFMImportacionMulty = class(TFPEditSinNavegador)
     PNLConfiguracion: TLFPanel;
     LRutaImportacion: TLFLabel;
     DERutaImportacion: TDirectoryEdit;
     LRutaTratados: TLFLabel;
     DERutaTratados: TDirectoryEdit;
     PNLDatosImportados: TLFPanel;
     LBFicheros: TListBox;
     MLog: TMemo;
     MErrores: TMemo;
     Splitter: TSplitter;
     PNLLog: TLFPanel;
     PNLErrores: TLFPanel;
     LRegistro: TLFLabel;
     LErrores: TLFLabel;
     CBCrearCliPro: TLFCheckBox;
     LFCategoryAction1: TLFCategoryAction;
     AImportarFicheroSelecionado: TAction;
     ABorrarLogs: TAction;
     AReleerCarpetaImportacion: TAction;
     TBSep1: TToolButton;
     TBBorrarLogs: TToolButton;
     TBReleerCarpetaImportacion: TToolButton;
     DEFechaContabilizacionCompras: TLFDateEdit;
     LFechaContabilizacionCompras: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DERutaImportacionChange(Sender: TObject);
     procedure DERutaTratadosChange(Sender: TObject);
     procedure LBFicherosDblClick(Sender: TObject);
     procedure LBFicherosKeyPress(Sender: TObject; var Key: char);
     procedure AImportarFicheroSelecionadoExecute(Sender: TObject);
     procedure ABorrarLogsExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AReleerCarpetaImportacionExecute(Sender: TObject);
     procedure PNLDatosImportadosResize(Sender: TObject);
  private
     { Private declarations }
     procedure RellenaFicheros;
  public
     { Public declarations }
  end;

var
  FMImportacionMulty : TFMImportacionMulty;

implementation

uses
  UDMMain, UFormGest, UDMImportacionMulty, DateUtils;

{$R *.dfm}

{
Debe importar ficheros y generar facturas de cliente/proveedo/acreedor para poder generar SII.

************************************************************
************************************************************
   QUEDA AVERIGUAR EL MODO DE IVA DEL CLIENTE/PROVEEDOR
************************************************************
************************************************************


Formato de ficheros de importación
----------------------------------

- Los ficheros tendrán un nombre fijo con extensión .sdf
- La estructura de cada uno de los ficheros a importar ha de estar grabada con formato 
  ASCII/ANSI
- El formato utilizado es de ancho fijo, siendo imprescindible respetar el orden de los
  campos, con lo cual se rellenará con espacios el campo que se desea dejar en blanco,
  pero han de estar separados del campo siguiente y del anterior por el delimitador
  correspondiente (código de escape decimal 35 #), empezando y acabando siempre con
  ese delimitador.
- Los ficheros deben contener todos los registros esperados en la estructura del fichero.
- Todos los ficheros comienzan con un campo de control fijo. Debe estar en mayúsculas.
- Las líneas de registro siempre se separarán con el código de escape decimal 13 (retorno
  de carro).
- Los campos numéricos no deben tener separador de miles ni separador de decimales y
  si se desean dejar en blanco se deberá señalar 0 justificado a la derecha. La información
  debe alinearse a la derecha, completando con espacios por la izquierda.
- En los campos numéricos negativos deben incluir signo (-). Éste debe consignarse antes
  del valor numérico. La información debe alinearse a la derecha, completando con
  espacios por la izquierda.
- Los campos alfanuméricos se justificarán a la izquierda, salvo que se especifique lo
  contrario.


Formatos
--------

Tipo:
     - AN – Alfanuméricos
     - N – Numéricos
     - F – Fechas
Longitud: longitud de ancho ficho especificado.
Descripción campo: explicación breve del campo
Comentario: explicación detallada. Con * es obligatorio informarlo.


Para facturas emitidas:
-----------------------
Fichero BAFEMT.SDF

Observaremos dos tipos de registros:
- H=Cabecera de la factura.
- B=Bases imponibles en Euros.

Registro de cabecera:

Tipo    Long.    Descripción campo    Comentario
AN         6     Formato              * Valor fijo: BAFEMT
N          1     Versión              * Valor fijo: 1
AN         1     Tipo de registro     * Valor fijo: H
AN        10     Número de factura    * Identificador de factura. Formato SSNNNNNNNN (SS – Serie, NNNNNNNN – Número de factura)
F         10     Fecha de factura     * Formato DD-MM-AAAA
AN         6     Código de cliente    * Código de cliente
AN        40     Razón social         Razón social del cliente
AN        15     CIF/DNI              Identificación fiscal del cliente (CIF/DNI)
AN         2     Forma de pago        * Código de la forma de pago
N          4     % Desc. Comercial    % Descuento comercial. Dos posiciones inicales para los enteros y dos para los decimales
N          4     % Desc. P.P.         % Descuento pronto pago. Dos posiciones inicales para los enteros y dos para los decimales
N          4     % R.E.               % Recargo de equivalència. Dos posiciones inicales para los enteros y dos para los decimales
N          4     % I.R.P.F.           % I.R.P.F. Dos posiciones inicales para los enteros y dos para los decimales
N         11     Total factura        Líquido de la factura. 9 enteros y 2 decimales

Registro de detalle de bases:

Tipo    Long.    Descripción campo    Comentario
AN         6     Formato              * Valor fijo: BAFEMT
N          1     Versión              * Valor fijo: 1
AN         1     Tipo de registro     * Valor fijo: B
AN        10     Número de factura    * Identificador de factura. Formato SSNNNNNNNN (SS – Serie, NNNNNNNN – Número de factura)
F         10     Fecha de factura     * Formato DD-MM-AAAA
N         11     Base imponible       * Base imponible de IVA. 9 enteros y 2 decimales
N          4     % IVA                * % IVA. 2 enteros y 2 decimales
N         11     Cuota IVA            * Cuota IVA. 9 enteros y 2 decimales
N          4     % RE                 % RE. 2 enteros y 2 decimales
N         11     Cuota RE             Cuota RE. 9 enteros y 2 decimales


Para facturas recibidas:
------------------------
Fichero BAFREC.SDF

Observaremos dos tipos de registros:
- D=Cabecera de la factura.
- B=Bases imponibles en Euros.

Registro de cabecera:

Tipo    Long.    Descripción campo    Comentario
AN         6     Formato              * Valor fijo: BAFREC
N          1     Versión              * Valor fijo: 1
AN         1     Tipo de registro     * Valor fijo: D
AN        10     Número de factura    * Identificador de factura. Formato SSNNNNNNNN (SS – Serie, NNNNNNNN – Número de factura)
F         10     Fecha de factura     * Formato DD-MM-AAAA
AN         6     Cód. de proveedor    * Código de proveedor
AN        40     Razón social         Razón social del proveedor
AN        15     CIF/DNI              Identificación fiscal del proveedor (CIF/DNI)
AN         2     Forma de pago        * Código de la forma de pago
N          4     % Desc. Comercial    % Descuento comercial. Dos posiciones inicales para los enteros y dos para los decimales
N          4     % Desc. P.P.         % Descuento pronto pago. Dos posiciones inicales para los enteros y dos para los decimales
N          4     % R.E.               % Recargo de equivalència. Dos posiciones inicales para los enteros y dos para los decimales
N          4     % I.R.P.F.           % I.R.P.F. Dos posiciones inicales para los enteros y dos para los decimales
N         11     Total factura        Líquido de la factura. 9 enteros y 2 decimales
AN        20     Su Referencia        Referencia de la factura del proveedor

Registro de detalle de bases:

Tipo    Long.    Descripción campo    Comentario
AN         6     Formato              * Valor fijo: BAFREC
N          1     Versión              * Valor fijo: 1
AN         1     Tipo de registro     * Valor fijo: B
AN        10     Número de factura    * Identificador de factura. Formato SSNNNNNNNN (SS – Serie, NNNNNNNN – Número de factura)
F         10     Fecha de factura     * Formato DD-MM-AAAA
N         11     Base imponible       * Base imponible de IVA. 9 enteros y 2 decimales
N          4     % IVA                * % IVA. 2 enteros y 2 decimales
N         11     Cuota IVA            * Cuota IVA. 9 enteros y 2 decimales
N          4     % RE                 % RE. 2 enteros y 2 decimales
N         11     Cuota RE             Cuota RE. 9 enteros y 2 decimales

Ejemplos:
---------------------
*Fichero BAFEMT*.SDF*
* Facturas emitidas *
---------------------

#BAFEMT#1#H#FK690725  #21-06-2019#037   #ALBARRI, S.L.                           #B78128618      #P2# 000# 000# 000# 000#     207520#
#BAFEMT#1#B#FK690725  #21-06-2019#     171504#2100#      36016# 000#        000#
#BAFEMT#1#H#FK690731  #21-06-2019#1071  #REBULL MARTIN DISTRIBUCIONS,SL          #B64482664      #60# 000# 000# 000# 000#     325755#
#BAFEMT#1#B#FK690731  #21-06-2019#     269219#2100#      56536# 000#        000#
#BAFEMT#1#H#FK690732  #21-06-2019#524   #SCHULPEN SCHUIM LEIDEN BV               #               #  # 000# 000# 000# 000#      15000#
#BAFEMT#1#B#FK690732  #21-06-2019#      15000#2100#        000# 000#        000#
#BAFEMT#1#H#FK690754  #26-06-2019#002   #MERCADONA S.A.                          #A46103834      #P6# 000# 000# 000# 000#    1237292#
#BAFEMT#1#B#FK690754  #26-06-2019#    1022555#2100#     214737# 000#        000#

----------------------
*Fichero BAFREC*.SDF *
* Facturas recibidas *
----------------------

#BAFREC#1#D#FK006139  #14-05-2019#016   #MULTY FOAM                              #EL94062561     #G6# 000# 000# 000# 000#    2894667#457                 #
#BAFREC#1#B#FK006139  #14-05-2019#    2894667#2100#     607880# 000#        000#
#BAFREC#1#D#FK006142  #25-06-2019#001   #SCHULPEN SCHUIM LEIDEN BV*INTR          #NL006248524B03 #01# 000# 000# 000# 000#     105062#692613              #
#BAFREC#1#B#FK006142  #25-06-2019#     105062#2100#      22063# 000#        000#
#BAFREC#1#D#FK006143  #25-06-2019#001   #SCHULPEN SCHUIM LEIDEN BV*INTR          #NL006248524B03 #01# 000# 000# 000# 000#    1037568#692614              #
#BAFREC#1#B#FK006143  #25-06-2019#    1037568#2100#     217889# 000#        000#
#BAFREC#1#D#FK006144  #25-06-2019#001   #SCHULPEN SCHUIM LEIDEN BV*INTR          #NL006248524B03 #01# 000# 000# 000# 000#    1023440#692615              #
#BAFREC#1#B#FK006144  #25-06-2019#    1023440#2100#     214922# 000#        000#
#BAFREC#1#D#FK006145  #25-06-2019#001   #SCHULPEN SCHUIM LEIDEN BV*INTR          #NL006248524B03 #01# 000# 000# 000# 000#      36500#692616              #
#BAFREC#1#B#FK006145  #25-06-2019#      36500#2100#       7665# 000#        000#
#BAFREC#1#D#FK006146  #25-06-2019#001   #SCHULPEN SCHUIM LEIDEN BV*INTR          #NL006248524B03 #01# 000# 000# 000# 000#     169200#692617              #
#BAFREC#1#B#FK006146  #25-06-2019#     169200#2100#      35532# 000#        000#
#BAFREC#1#D#FK006147  #25-06-2019#001   #SCHULPEN SCHUIM LEIDEN BV*INTR          #NL006248524B03 #01# 000# 000# 000# 000#      23031#692618              #
#BAFREC#1#B#FK006147  #25-06-2019#      23031#2100#       4837# 000#        000#
#BAFREC#1#D#FK006148  #25-06-2019#001   #SCHULPEN SCHUIM LEIDEN BV*INTR          #NL006248524B03 #01# 000# 000# 000# 000#     423360#692639              #
#BAFREC#1#B#FK006148  #25-06-2019#     423360#2100#      88906# 000#        000#
#BAFREC#1#D#FK006149  #25-06-2019#001   #SCHULPEN SCHUIM LEIDEN BV*INTR          #NL006248524B03 #01# 000# 000# 000# 000#     535500#692640              #
#BAFREC#1#B#FK006149  #25-06-2019#     535500#2100#     112455# 000#        000#
#BAFREC#1#D#FK000786  #31-05-2019#147   #MERCADONA SA                            #A46103834      #G5# 000# 000# 000# 000#    1589600#IN/086379           #
#BAFREC#1#B#FK000786  #31-05-2019#    1589600# 000#           # 000#        000#
#BAFREC#1#D#FK000807  #13-06-2019#41458 #CFREIXAS E-CUSTOMS SL                   #B66789801      #01# 000# 000# 000# 000#     259778#8247                #
#BAFREC#1#B#FK000807  #13-06-2019#      94723#2100#      19892# 000#        000#
#BAFREC#1#B#FK000807  #13-06-2019#     145163# 000#           # 000#        000#
#BAFREC#1#D#FK000810  #25-06-2019#001   #SCHULPEN SCHUIM LEIDEN BV*INTR          #NL006248524B03 #01# 000# 000# 000# 000#       7146#692641              #
#BAFREC#1#B#FK000810  #25-06-2019#       7146#2100#       1501# 000#        000#
}

procedure TFMImportacionMulty.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImportacionMulty, DMImportacionMulty);
  RellenaFicheros;
  DEFechaContabilizacionCompras.Date := Yesterday;

  // Esta opción estará deshabilitada
  CBCrearCliPro.Checked := False;
  CBCrearCliPro.Enabled := False;
  CBCrearCliPro.Visible := False;
end;

procedure TFMImportacionMulty.FormShow(Sender: TObject);
begin
  inherited;
  // Esta opción estará deshabilitada
  CBCrearCliPro.Checked := False;
  CBCrearCliPro.Enabled := False;
  CBCrearCliPro.Visible := False;
end;

procedure TFMImportacionMulty.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImportacionMulty);
end;

procedure TFMImportacionMulty.RellenaFicheros;
var
  SearchRec : TSearchRec;
  Resultado : integer;
begin
  LBFicheros.Clear;
  Resultado := FindFirst(DERutaImportacion.Text + '\*.SDF', faAnyFile, SearchRec);
  try
     // Mientras haya archivos...
     while Resultado = 0 do
     begin
        LBFicheros.Items.Add(SearchRec.Name);

        // Busco el siguiente archivo
        Resultado := FindNext(SearchRec);
     end;
  finally
     FindClose(SearchRec);
  end;
end;

procedure TFMImportacionMulty.DERutaImportacionChange(Sender: TObject);
begin
  inherited;
  with DERutaImportacion do
  begin
     if DirectoryExists(Text) then
     begin
        Color := clWindow;
        Font.Color := clWindowText;

        RellenaFicheros;
     end
     else
     begin
        Color := clRed;
        Font.Color := clWhite;
     end;
  end;
end;

procedure TFMImportacionMulty.DERutaTratadosChange(Sender: TObject);
begin
  inherited;
  with DERutaTratados do
  begin
     if DirectoryExists(Text) then
     begin
        Color := clWindow;
        Font.Color := clWindowText;

        RellenaFicheros;
     end
     else
     begin
        Color := clRed;
        Font.Color := clWhite;
     end;
  end;
end;

procedure TFMImportacionMulty.LBFicherosDblClick(Sender: TObject);
begin
  inherited;
  AImportarFicheroSelecionado.Execute;
end;

procedure TFMImportacionMulty.LBFicherosKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  if (Key = #13) then
     AImportarFicheroSelecionado.Execute;
end;

procedure TFMImportacionMulty.AImportarFicheroSelecionadoExecute(Sender: TObject);
begin
  inherited;
  if (LBFicheros.ItemIndex >= 0) then
  begin
     DMImportacionMulty.ImportarFichero(IncludeTrailingPathDelimiter(DERutaImportacion.Text) + LBFicheros.Items[LBFicheros.ItemIndex], MLog.Lines, MErrores.Lines, CBCrearCliPro.Checked, IncludeTrailingPathDelimiter(DERutaTratados.Text) + LBFicheros.Items[LBFicheros.ItemIndex], DEFechaContabilizacionCompras.Date);
     RellenaFicheros;
  end;
end;

procedure TFMImportacionMulty.ABorrarLogsExecute(Sender: TObject);
begin
  inherited;
  MLog.Lines.Clear;
  MErrores.Lines.Clear;
end;

procedure TFMImportacionMulty.AReleerCarpetaImportacionExecute(Sender: TObject);
begin
  inherited;

  RellenaFicheros;
end;

procedure TFMImportacionMulty.PNLDatosImportadosResize(Sender: TObject);
begin
  inherited;
  PNLErrores.Width := PNLDatosImportados.Width div 2;
end;

end.
