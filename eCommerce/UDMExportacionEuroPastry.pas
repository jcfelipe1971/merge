unit UDMExportacionEuroPastry;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, FIBDataSet;

type
  TDMExportacionEuroPastry = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Exportar(CodigoDistribuidor, RutaExportacion: string; Desde, Hasta: TDateTime);
  end;

var
  DMExportacionEuroPastry : TDMExportacionEuroPastry;

implementation

uses UDMMain, UEntorno, Dialogs, DateUtils, UUtiles;

{$R *.dfm}

procedure TDMExportacionEuroPastry.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  
end;

procedure TDMExportacionEuroPastry.Exportar(CodigoDistribuidor, RutaExportacion: string; Desde, Hasta: TDateTime);
var
  DS : TFIBDataSet;
  ts : TStrings;
  Fichero, s : string;
begin
  Fichero := RutaExportacion + CodigoDistribuidor + '_' + FormatDatetime('ddmmyyyyhhnnss', Now) + '.txt';
  Desde := RecodeTime(Desde, 0, 0, 0, 0);
  Hasta := RecodeTime(Hasta, 23, 59, 59, 999);

  ts := TStringList.Create;
  try
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              Close;
              DataBase := DMMain.DataBase;
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then
                    StartTransaction;
              end;

              SelectSQL.Add(' SELECT C.TIPO, C.SERIE, C.RIG, ');
              SelectSQL.Add('        CASE CUC.PERFIL ');
              SelectSQL.Add('          WHEN ''EUPA'' THEN CAST(DIR.CODIGO_EDI AS VARCHAR(25)) ');
              SelectSQL.Add('          ELSE CAST(C.CLIENTE AS VARCHAR(25)) ');
              SelectSQL.Add('        END CLIENTE, ');
              SelectSQL.Add('        CASE CUC.PERFIL ');
              SelectSQL.Add('          WHEN ''EUPA'' THEN CAST(''SI'' AS VARCHAR(2)) ');
              SelectSQL.Add('          ELSE CAST(''NO'' AS VARCHAR(2)) ');
              SelectSQL.Add('        END CLIENTE_EUROPASTRY, ');
              // Debe informarse lo que se imprime en el albaran. En este caso solo se imprime el numero.
              SelectSQL.Add('        (SELECT FIRST 1 RIG_O ');
              SelectSQL.Add('         FROM G_PROCEDENCIA_DOCUMENTO_LINEA(D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA) ');
              SelectSQL.Add('         WHERE ');
              SelectSQL.Add('         TIPO_O = ''ALB'' ');
              SelectSQL.Add('         ORDER BY SERIE_O, RIG_O, LINEA_O) ALBARAN, ');
              SelectSQL.Add('        (SELECT FIRST 1 TIPO_O || ''-'' || SERIE_O || ''/'' || RIG_O ');
              SelectSQL.Add('         FROM G_PROCEDENCIA_DOCUMENTO_LINEA(D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA) ');
              SelectSQL.Add('         WHERE ');
              SelectSQL.Add('         TIPO_O = ''PEC'' ');
              SelectSQL.Add('         ORDER BY SERIE_O, RIG_O, LINEA_O) PEDIDO, ');
              SelectSQL.Add('        (SELECT FIRST 1 P.FECHA ');
              SelectSQL.Add('         FROM G_PROCEDENCIA_DOCUMENTO_LINEA(D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA) R ');
              SelectSQL.Add('         JOIN GES_CABECERAS_S P ON R.EMPRESA_O = P.EMPRESA AND R.EJERCICIO_O = P.EJERCICIO AND R.CANAL_O = P.CANAL AND R.SERIE_O = P.SERIE AND R.TIPO_O = P.TIPO AND R.RIG_O = P.RIG ');
              SelectSQL.Add('         WHERE ');
              SelectSQL.Add('         R.TIPO_O = ''PEC'' ');
              SelectSQL.Add('         ORDER BY R.SERIE_O, R.RIG_O, R.LINEA_O) FECHA_PEDIDO, ');
              SelectSQL.Add('        (SELECT FIRST 1 P.FECHA_ENTREGA ');
              SelectSQL.Add('         FROM G_PROCEDENCIA_DOCUMENTO_LINEA(D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA) R ');
              SelectSQL.Add('         JOIN GES_CABECERAS_S P ON R.EMPRESA_O = P.EMPRESA AND R.EJERCICIO_O = P.EJERCICIO AND R.CANAL_O = P.CANAL AND R.SERIE_O = P.SERIE AND R.TIPO_O = P.TIPO AND R.RIG_O = P.RIG ');
              SelectSQL.Add('         WHERE ');
              SelectSQL.Add('         R.TIPO_O = ''PEC'' ');
              SelectSQL.Add('         ORDER BY R.SERIE_O, R.RIG_O, R.LINEA_O) FECHA_ENTREGA, ');
              SelectSQL.Add('        (SELECT FIRST 1 A.FECHA ');
              SelectSQL.Add('         FROM G_PROCEDENCIA_DOCUMENTO_LINEA(D.EMPRESA, D.EJERCICIO, D.CANAL, D.SERIE, D.TIPO, D.RIG, D.LINEA) R ');
              SelectSQL.Add('         JOIN GES_CABECERAS_S A ON R.EMPRESA_O = A.EMPRESA AND R.EJERCICIO_O = A.EJERCICIO AND R.CANAL_O = A.CANAL AND R.SERIE_O = A.SERIE AND R.TIPO_O = A.TIPO AND R.RIG_O = A.RIG ');
              SelectSQL.Add('         WHERE ');
              SelectSQL.Add('         R.TIPO_O = ''ALB'' ');
              SelectSQL.Add('         ORDER BY R.SERIE_O, R.RIG_O, R.LINEA_O) FECHA_ALBARAN, ');
              SelectSQL.Add('        C.TIPO || ''-'' || C.SERIE || ''/'' || C.RIG DOCUMENTO, C.FECHA, ');
              SelectSQL.Add('        T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.TIPO_RAZON, T.NIF, DIR.DIR_COMPLETA DIRECCION, L.TITULO POBLACION, ');
              SelectSQL.Add('        PRO.TITULO PROVINCIA, L.CODIGO_POSTAL, T.TELEFONO01, T.TELEFAX, ');
              SelectSQL.Add('        CAST(''ZONA_COMERCIAL'' AS VARCHAR(100)) ZONA_COMERCIAL, T.FECHA_ALTA, C.SU_REFERENCIA NRO_ORDEN_COMPRA, ');
              SelectSQL.Add('        CAST('''' AS VARCHAR(17)) IDENTICKET, A.ALFA_3, CAST(''S'' AS VARCHAR(1)) FABRICANTE, D.UNIDADES, A.ALFA_1, ');
              SelectSQL.Add('        CAST(''N'' AS VARCHAR(1)) OBSEQUIO, D.BRUTO, D.B_DTO_LINEA, C.MONEDA, D.ID_DETALLES_S ');
              SelectSQL.Add(' FROM GES_CABECERAS_S C ');
              SelectSQL.Add(' JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S ');
              SelectSQL.Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
              SelectSQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES DIR ON C.TERCERO = DIR.TERCERO AND C.DIRECCION = DIR.DIRECCION ');
              SelectSQL.Add(' JOIN SYS_LOCALIDADES L ON DIR.ID_LOCAL = L.ID_LOCAL ');
              SelectSQL.Add(' JOIN SYS_PROVINCIAS PRO ON L.PAIS = PRO.PAIS AND L.PROVINCIA = PRO.PROVINCIA ');
              SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
              SelectSQL.Add(' JOIN EMP_CLIENTES CLI ON C.EMPRESA = CLI.EMPRESA AND C.CLIENTE = CLI.CLIENTE ');
              SelectSQL.Add(' JOIN CON_CUENTAS_GES_CLI CUC ON C.EMPRESA = CUC.EMPRESA AND C.EJERCICIO = CUC.EJERCICIO AND C.CANAL = CUC.CANAL AND C.CLIENTE = CUC.CLIENTE ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' C.FECHA BETWEEN :DESDE AND :HASTA AND ');
              // Albaranes abiertos y facturas
              SelectSQL.Add(' ((C.TIPO = ''ALB'') AND (C.ESTADO = 0) OR ');
              SelectSQL.Add(' (C.TIPO = ''FAC'')) AND ');
              SelectSQL.Add(' A.EXPORTAR = 1 AND ');
              SelectSQL.Add(' CLI.EXPORTAR = 1 ');
              // Todos los albaranes tienen que estar juntos
              SelectSQL.Add(' ORDER BY 1, 2, 3, 6 ');

              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['DESDE'].AsDateTime := Desde;
              Params.ByName['HASTA'].AsDateTime := Hasta;
              Open;
              while (not EOF) do
              begin
                 s := Copy(CodigoDistribuidor, 1, 8) + ';';
                 s := s + Copy(FieldByName('CLIENTE').AsString, 1, 8) + ';'; // Codigo de cliente (propio o Europastry)
                 s := s + FieldByName('CLIENTE_EUROPASTRY').AsString + ';'; // Es cliente Europastry (SI/NO)

                 // Documento de entrega - Albaran o Factura directa
                 if (FieldByName('TIPO').AsString = 'FAC') then
                 begin
                    if FieldByName('ALBARAN').AsString <> '' then
                       s := s + FieldByName('ALBARAN').AsString + ';'
                    else
                       s := s + FieldByName('DOCUMENTO').AsString + ';';
                 end;
                 if (FieldByName('TIPO').AsString = 'ALB') then
                    s := s + FieldByName('RIG').AsString + ';';

                 // Fecha pedido
                 if (FieldByName('FECHA_PEDIDO').AsDateTime = 0) then
                    s := s + FormatDateTime('dd/mm/yyyy', FieldByName('FECHA').AsDateTime) + ';'
                 else
                    s := s + FormatDateTime('dd/mm/yyyy', FieldByName('FECHA_PEDIDO').AsDateTime) + ';';

                 // Fecha entrega
                 if (FieldByName('FECHA_ENTREGA').AsDateTime = 0) then
                    s := s + FormatDateTime('dd/mm/yyyy', FieldByName('FECHA').AsDateTime) + ';'
                 else
                    s := s + FormatDateTime('dd/mm/yyyy', FieldByName('FECHA_ENTREGA').AsDateTime) + ';';

                 // Fecha albarán
                 if (FieldByName('TIPO').AsString = 'ALB') then
                    s := s + FormatDateTime('dd/mm/yyyy', FieldByName('FECHA').AsDateTime) + ';';
                 if (FieldByName('TIPO').AsString = 'FAC') then
                 begin
                    if (FieldByName('FECHA_ALBARAN').AsDateTime = 0) then
                       s := s + FormatDateTime('dd/mm/yyyy', FieldByName('FECHA').AsDateTime) + ';'
                    else
                       s := s + FormatDateTime('dd/mm/yyyy', FieldByName('FECHA_ALBARAN').AsDateTime) + ';';
                 end;

                 // 8 - Número de factura
                 // 9 - Fecha de factura
                 if (FieldByName('CLIENTE_EUROPASTRY').AsString) = 'NO' then
                 begin
                    if (FieldByName('TIPO').AsString = 'FAC') then
                    begin
                       s := s + FieldByName('DOCUMENTO').AsString + ';';
                       s := s + FormatDateTime('dd/mm/yyyy', FieldByName('FECHA').AsDateTime) + ';';
                    end
                    else
                    begin
                       s := s + ';';
                       s := s + ';';
                    end;
                 end
                 else
                 begin
                    // No hay factura para clientes de Europastry
                    s := s + ';';
                    s := s + ';';
                 end;

                 s := s + Copy(LimpiaCadena(FieldByName('NOMBRE_COMERCIAL').AsString), 1, 40) + ';';
                 s := s + Copy(LimpiaCadena(FieldByName('NOMBRE_R_SOCIAL').AsString), 1, 40) + ';';
                 s := s + Copy(LimpiaNIF(REntorno.Pais, FieldByName('NIF').AsString), 1, 20) + ';';
                 s := s + Copy(Trim(LimpiaCadena(FieldByName('DIRECCION').AsString)), 1, 40) + ';';
                 s := s + Copy(LimpiaCadena(FieldByName('POBLACION').AsString), 1, 25) + ';';
                 s := s + Copy(LimpiaCadena(FieldByName('PROVINCIA').AsString), 1, 30) + ';';
                 s := s + FieldByName('CODIGO_POSTAL').AsString + ';';
                 s := s + Copy(LimpiaCadena(FieldByName('TELEFONO01').AsString), 1, 25) + ';';
                 s := s + Copy(LimpiaCadena(FieldByName('TELEFAX').AsString), 1, 25) + ';';
                 s := s + Copy(LimpiaCadena(FieldByName('ZONA_COMERCIAL').AsString), 1, 20) + ';';
                 s := s + FormatDateTime('dd/mm/yyyy', FieldByName('FECHA_ALTA').AsDateTime) + ';';
                 s := s + Copy(LimpiaCadena(FieldByName('NRO_ORDEN_COMPRA').AsString), 1, 25) + ';';
                 s := s + Copy(LimpiaCadena(FieldByName('IDENTICKET').AsString), 1, 17) + ';';
                 s := s + Copy(LimpiaCadena(FieldByName('ALFA_3').AsString), 1, 8) + ';'; // 23 - Código Artículo
                 s := s + LimpiaCadena(FieldByName('FABRICANTE').AsString) + ';';
                 s := s + FieldByName('UNIDADES').AsString + ';';
                 // Europastry dicen que aquí hay que poner 'CA'
                 // s := s + FieldByName('ALFA_1').AsString + ';';
                 s := s + 'CA' + ';';
                 // 27 - Obsequio será 'S' si el líquido es 0 o si es cliente de europastry
                 if ((FieldByName('B_DTO_LINEA').AsFloat <> 0) or (FieldByName('CLIENTE_EUROPASTRY').AsString = 'SI')) then
                    s := s + 'N' + ';'
                 else
                    s := s + 'S' + ';';
                 s := s + '' + ';'; // Lote
                 s := s + FloatToStrDec(FieldByName('BRUTO').AsFloat, ',') + ';'; // 29 - Importe Bruto
                 s := s + FloatToStrDec(FieldByName('B_DTO_LINEA').AsFloat, ',') + ';'; // 30 - Importe Neto
                 s := s + Copy(FieldByName('MONEDA').AsString, 1, 3) + ';'; // 31 - Divisa
                 s := s + '' + ';'; // 32 - Código de Promocion
                 s := s + '' + ';'; // 33 - Observaciones
                 s := s + '' + ';'; // 34 - Potencial
                 s := s + '' + ';'; // 35 - Cuota
                 s := s + '' + ';'; // 36 - Compentencia
                 s := s + '' + ';'; // 37 - Nro. Pedido EuroPastry
                 s := s + '' + ';'; // 38 - Motivo no entrega
                 ts.Add(s);

                 Next;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
     ts.Text := UTF8Encode(ts.Text);
     ts.SaveToFile(Fichero);
     ShowMessage(Format(_('Se ha creado el fichero: %s'), [Fichero]));
  finally
     ts.Free;
  end;
end;

end.
