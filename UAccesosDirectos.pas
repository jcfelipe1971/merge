unit UAccesosDirectos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, TeEngine, Series, TeeProcs, Chart, DbChart,
  Menus, jpeg, ActnList, uutiles;

procedure GuardaAccesoDirecto(NombreAccion: string);
procedure CargaAccesosDirectos;
procedure LiberaAccesosDirectos;
procedure Split(Delimiter: char; Str: string; ListOfStrings: TStrings);
procedure CreaAcceso(Configuracion: string; BordeVisibleValorDefecto: boolean);
procedure DameLabelsCabDet(NombreAccion: string; var Cab, Det: string);
procedure ActualizaPos(Nombre: string; PosLeft, PosTop: integer);
procedure EliminaAccesoDirecto(NombreAccion: string);
procedure CambiaColor(Nombre: string; ColorAD: TColor);
procedure CambiaColorFont(Nombre: string; ColorFontAD: TColor);
procedure CambiaBordeVisible(Nombre: string; BordeVisible: boolean);
procedure BordeVisible(Visible: boolean);

procedure MostrarAvisos;

procedure CargaAvisos;

implementation

uses
  UEntorno, UFFondo, UFMain, StrUtils;

const
  SeparadorPropiedad = '|'; // separador de las propiedades de cada columna
  SeparadorAcceso = ';'; // separador de  las columnas en el INI

// Crea Avisos en el INI
procedure MostrarAvisos;
var
  Configuracion : string;
begin
  // AVISOS=200|200;
  Configuracion := LeeDatoIni('CONFIGURACION', 'AVISOS', ''); // lee si se muestran los Avisos en el  INI
  if Configuracion = ';' then
     Configuracion := '';

  if Configuracion <> '' then
     CargaAvisos
  else
  begin
     EscribeDatoIni('CONFIGURACION', 'AVISOS', '0|0;');
     CargaAvisos; // cargarlos Avisos
  end;
end;

procedure BordeVisible(Visible: boolean);
begin
  // Establece si el borde sera blanco o del mismo color que el panel interior
  EscribeDatoIni('CONFIGURACION', 'BORDE_AD', Visible);
  CargaAccesosDirectos; // Cargarlos Avisos
end;

// Guarda acceso directos en el INI
procedure GuardaAccesoDirecto(NombreAccion: string);
var
  Configuracion : string;
begin
  // ACCESOS_DIRECTOS=AFacturas|250|250|0|clGreen|clRed;
  // ACCESOS_DIRECTOS=[NombreAccion] | [PosX] | [PosY] | [Tipo] | [ColorFondo] | [ColorLetra]
  Configuracion := LeeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', ''); // Lee todos los accesos directos del INI
  if Configuracion = ';' then
     Configuracion := '';

  // Comprobar si esta el que estoy creando AD
  if Pos(NombreAccion + '|', Configuracion) = 0 then
  begin
     Configuracion := Configuracion + NombreAccion + SeparadorPropiedad +
        '250' + SeparadorPropiedad +
        '250' + SeparadorPropiedad +
        '0' + SeparadorPropiedad +
        ColorToString(clMoneyGreen) + SeparadorPropiedad +
        ColorToString(clBlack) + SeparadorAcceso;

     EscribeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', Configuracion);

     // Refresco fondo con nuevos accesos directos
     CargaAccesosDirectos;
  end;
end;

// Carga Avisos
procedure CargaAvisos;
var
  Configuracion : string;
  Propiedades : TStrings;
  CantPropiedades : integer;
  LabelCabecera, LabelDetalle, NombreAccion : string;
  PosLeft, PosTop : integer;
  //ico : integer;
  ColorAD, ColorFontAD : TColor;
  BordeVisible : boolean;
begin
  PosLeft := 0;
  PosTop := 0;
  //ico := 0;
  Configuracion := LeeDatoIni('CONFIGURACION', 'AVISOS', '');
  if Configuracion <> '' then
  begin
     //AVISOS=200|200;           esta es la forma que viene el INI
     Propiedades := TStringList.Create;
     try
        Split(SeparadorPropiedad, Configuracion, Propiedades);
        CantPropiedades := Propiedades.Count;

        if (CantPropiedades >= 1) then
           PosLeft := StrToIntDef(Propiedades[0], 0);

        if (CantPropiedades >= 2) then
           PosTop := StrToIntDef(LeftStr(Propiedades[1], Length(Propiedades[1]) - 1), 0);

        //ico := 5;
        LabelCabecera := _('AVISOS');
        LabelDetalle := '';
        NombreAccion := '';
        ColorAD := clMoneyGreen;
        ColorFontAD := clWhite;
        BordeVisible := True;

        FFondo.CreaAD(2, PosLeft, PosTop, 5, LabelCabecera, LabelDetalle, NombreAccion, ColorAD, ColorFontAD, BordeVisible);
     finally
        Propiedades.Free;
     end;
  end;
end;

// Lee Accesos directos del INI y los muestra en el Fondo
procedure CargaAccesosDirectos;
var
  Configuracion : string;
  i : integer;
  Accesos : TStrings;
  MostrarBordeValorDefecto : boolean;
begin
  LiberaAccesosDirectos;
  MostrarBordeValorDefecto := LeeDatoIni('CONFIGURACION', 'BORDE_AD', True);
  Configuracion := LeeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', '');
  if (Configuracion <> '') then
  begin
     Accesos := TStringList.Create;
     try
        Split(SeparadorAcceso, Configuracion, Accesos);

        // Cada linea tendra la configuracion de un acceso directo
        for i := 0 to Accesos.Count - 1 do
           if Trim(Accesos[i]) <> '' then
              CreaAcceso(Accesos[i], MostrarBordeValorDefecto);
     finally
        Accesos.Free;
     end;
  end;
end;

procedure LiberaAccesosDirectos;
var
  i : integer;
begin
  // Limpio todos los Accesos directos creados en el fondo
  // Dejo el panel de avisos

  with FFondo do
  begin
     for i := ControlCount - 1 downto 0 do
     begin
        if (Controls[i] <> PNLAvisos) and (Controls[i].ClassName <> 'TImage') then
           Controls[i].Destroy;
     end;
  end;
end;

procedure ActualizaPos(Nombre: string; PosLeft, PosTop: integer);
var
  i : integer;
  Configuracion, ConfiguracionNew, AccesoDirecto : string;
  Propiedades, Accesos : TStrings;
  CantPropiedades : integer;
  //LabelCabecera, LabelDetalle : string;
  NombreAccion : string;
  {PosLeft, PosTop,} ico : integer;
  ColorAD, ColorFontAD : TColor;
  BordeVisible : boolean;
begin
  if Nombre = '' then
  begin
     Configuracion := LeeDatoIni('CONFIGURACION', 'AVISOS', '');
     if Configuracion <> '' then
     begin
        EscribeDatoIni('CONFIGURACION', 'AVISOS', IntToStr(PosLeft) + SeparadorPropiedad + IntToStr(PosTop) + ';');
     end;
  end
  else
  begin
     ConfiguracionNew := '';
     Configuracion := LeeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', '');
     if Configuracion <> '' then // Hay accesos directos
     begin
        Accesos := TStringList.Create;
        try
           Split(SeparadorAcceso, Configuracion, Accesos);
           for i := 0 to Accesos.Count - 1 do
           begin
              if Accesos[i] <> '' then
              begin
                 if Pos(Nombre + '|', Accesos[i]) <> 0 then
                 begin
                    Propiedades := TStringList.Create;
                    try
                       ico := 0;
                       Split(SeparadorPropiedad, Accesos[i], Propiedades);

                       CantPropiedades := Propiedades.Count;
                       if (CantPropiedades >= 1) then
                          NombreAccion := Propiedades[0];
                       {
                       if (CantPropiedades >= 2) then
                          PosLeft := StrToIntDef(Propiedades[1], 0);
                       
                       if (CantPropiedades >= 3) then
                          PosTop := StrToIntDef(Propiedades[2], 0);
                       }
                       if (CantPropiedades >= 4) then
                          ico := StrToIntDef(Propiedades[3], 0);
                       {
                       if (CantPropiedades >= 5) then
                          ColorAD := StringToColor(Propiedades[4])
                       else
                          ColorAD := clMoneyGreen;
                       }
                       ColorAD := clMoneyGreen;

                       if (CantPropiedades >= 6) then
                          ColorFontAD := StringToColor(Propiedades[5])
                       else
                          ColorFontAD := clWhite;

                       if (CantPropiedades >= 7) then
                          BordeVisible := (Propiedades[6] = '1')
                       else
                          BordeVisible := True;

                       AccesoDirecto := NombreAccion + SeparadorPropiedad + IntToStr(PosLeft) + SeparadorPropiedad + IntToStr(PosTop) +
                          SeparadorPropiedad + IntToStr(ico) + SeparadorPropiedad + ColorToString(ColorAD) + SeparadorPropiedad + ColorToString(ColorFontAD) + SeparadorPropiedad + IntToStr(BoolToInt(BordeVisible));
                    finally
                       Propiedades.Free;
                    end;
                 end
                 else
                    AccesoDirecto := Accesos[i];

                 ConfiguracionNew := ConfiguracionNew + AccesoDirecto + ';';
              end;
           end;
        finally
           Accesos.Free;
        end;

        EscribeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', ConfiguracionNew);
     end;
  end;

  // CargaAccesosDirectos;
end;

procedure CambiaColor(Nombre: string; ColorAD: TColor);
var
  i : integer;
  Configuracion, ConfiguracionNew, AccesoDirecto : string;
  Propiedades, Accesos : TStrings;
  CantPropiedades : integer;
  //LabelCabecera, LabelDetalle : string;
  NombreAccion : string;
  PosLeft, PosTop, ico : integer;
  {ColorAD,} ColorFontAD : TColor;
  BordeVisible : boolean;
begin
  if Nombre = 'AVISOS' then
  begin
    { Ac := LeeDatoIni('CONFIGURACION', 'AVISOS', '');
     if Ac <> '' then
     begin
        EscribeDatoIni('CONFIGURACION', 'AVISOS', PosL + SeparadorPropiedad + Post + ';');
     end; }
  end
  else
  begin
     ConfiguracionNew := '';
     Configuracion := LeeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', '');
     if Configuracion <> '' then // Hay accesos directos
     begin
        Accesos := TStringList.Create;
        try
           Split(SeparadorAcceso, Configuracion, Accesos);
           for i := 0 to Accesos.Count - 1 do
           begin
              if Accesos[i] <> '' then
              begin
                 if Pos(Nombre + '|', Accesos[i]) <> 0 then
                 begin
                    Propiedades := TStringList.Create;
                    try
                       PosLeft := 0;
                       PosTop := 0;
                       ico := 0;
                       Split(SeparadorPropiedad, Accesos[i], Propiedades);

                       CantPropiedades := Propiedades.Count;
                       if (CantPropiedades >= 1) then
                          NombreAccion := Propiedades[0];

                       if (CantPropiedades >= 2) then
                          PosLeft := StrToIntDef(Propiedades[1], 0);

                       if (CantPropiedades >= 3) then
                          PosTop := StrToIntDef(Propiedades[2], 0);

                       if (CantPropiedades >= 4) then
                          ico := StrToIntDef(Propiedades[3], 0);
                       {
                       if (CantPropiedades >= 5) then
                          ColorAD := StringToColor(Propiedades[4])
                       else
                          ColorAD := clMoneyGreen;
                       }
                       if (CantPropiedades >= 6) then
                          ColorFontAD := StringToColor(Propiedades[5])
                       else
                          ColorFontAD := clWhite;

                       if (CantPropiedades >= 7) then
                          BordeVisible := (Propiedades[6] = '1')
                       else
                          BordeVisible := True;

                       AccesoDirecto := NombreAccion + SeparadorPropiedad + IntToStr(PosLeft) + SeparadorPropiedad + IntToStr(PosTop) +
                          SeparadorPropiedad + IntToStr(ico) + SeparadorPropiedad + ColorToString(ColorAD) + SeparadorPropiedad + ColorToString(ColorFontAD) + SeparadorPropiedad + IntToStr(BoolToInt(BordeVisible));
                    finally
                       Propiedades.Free;
                    end;
                 end
                 else
                    AccesoDirecto := Accesos[i];

                 ConfiguracionNew := ConfiguracionNew + AccesoDirecto + ';';
              end;
           end;
        finally
           Accesos.Free;
        end;

        EscribeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', ConfiguracionNew);
     end;
  end;

  CargaAccesosDirectos;
end;

procedure CambiaColorFont(Nombre: string; ColorFontAD: TColor);
var
  i : integer;
  Configuracion, ConfiguracionNew, AccesoDirecto : string;
  Propiedades, Accesos : TStrings;
  CantPropiedades : integer;
  //LabelCabecera, LabelDetalle : string;
  NombreAccion : string;
  PosLeft, PosTop, ico : integer;
  ColorAD{, ColorFontAD} : TColor;
  BordeVisible : boolean;
begin
  if Nombre = 'AVISOS' then
  begin
    { Ac := LeeDatoIni('CONFIGURACION', 'AVISOS', '');
     if Ac <> '' then
     begin
        EscribeDatoIni('CONFIGURACION', 'AVISOS', PosL + SeparadorPropiedad + Post + ';');
     end; }
  end
  else
  begin
     ConfiguracionNew := '';
     Configuracion := LeeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', '');
     if Configuracion <> '' then // Hay accesos directos
     begin
        Accesos := TStringList.Create;
        try
           Split(SeparadorAcceso, Configuracion, Accesos);
           for i := 0 to Accesos.Count - 1 do
           begin
              if Accesos[i] <> '' then
              begin
                 if Pos(Nombre + '|', Accesos[i]) <> 0 then
                 begin
                    Propiedades := TStringList.Create;
                    try
                       PosLeft := 0;
                       PosTop := 0;
                       ico := 0;
                       Split(SeparadorPropiedad, Accesos[i], Propiedades);

                       CantPropiedades := Propiedades.Count;
                       if (CantPropiedades >= 1) then
                          NombreAccion := Propiedades[0];

                       if (CantPropiedades >= 2) then
                          PosLeft := StrToIntDef(Propiedades[1], 0);

                       if (CantPropiedades >= 3) then
                          PosTop := StrToIntDef(Propiedades[2], 0);

                       if (CantPropiedades >= 4) then
                          ico := StrToIntDef(Propiedades[3], 0);

                       if (CantPropiedades >= 5) then
                          ColorAD := StringToColor(Propiedades[4])
                       else
                          ColorAD := clMoneyGreen;
                       {
                       if (CantPropiedades >= 6) then
                          ColorFontAD := StringToColor(Propiedades[5])
                       else
                          ColorFontAD := clWhite;
                       }
                       if (CantPropiedades >= 7) then
                          BordeVisible := (Propiedades[6] = '1')
                       else
                          BordeVisible := True;

                       AccesoDirecto := NombreAccion + SeparadorPropiedad + IntToStr(PosLeft) + SeparadorPropiedad + IntToStr(PosTop) +
                          SeparadorPropiedad + IntToStr(ico) + SeparadorPropiedad + ColorToString(ColorAD) + SeparadorPropiedad + ColorToString(ColorFontAD) + SeparadorPropiedad + IntToStr(BoolToInt(BordeVisible));
                    finally
                       Propiedades.Free;
                    end;
                 end
                 else
                    AccesoDirecto := Accesos[i];

                 ConfiguracionNew := ConfiguracionNew + AccesoDirecto + ';';
              end;
           end;
        finally
           Accesos.Free;
        end;

        EscribeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', ConfiguracionNew);
     end;
  end;

  CargaAccesosDirectos;
end;

procedure CambiaBordeVisible(Nombre: string; BordeVisible: boolean);
var
  i : integer;
  Configuracion, ConfiguracionNew, AccesoDirecto : string;
  Propiedades, Accesos : TStrings;
  CantPropiedades : integer;
  //LabelCabecera, LabelDetalle : string;
  NombreAccion : string;
  PosLeft, PosTop, ico : integer;
  ColorAD, ColorFontAD : TColor;
  {BordeVisible: boolean;}
begin
  if Nombre = 'AVISOS' then
  begin
    { Ac := LeeDatoIni('CONFIGURACION', 'AVISOS', '');
     if Ac <> '' then
     begin
        EscribeDatoIni('CONFIGURACION', 'AVISOS', PosL + SeparadorPropiedad + Post + ';');
     end; }
  end
  else
  begin
     ConfiguracionNew := '';
     Configuracion := LeeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', '');
     if Configuracion <> '' then // Hay accesos directos
     begin
        Accesos := TStringList.Create;
        try
           Split(SeparadorAcceso, Configuracion, Accesos);
           for i := 0 to Accesos.Count - 1 do
           begin
              if Accesos[i] <> '' then
              begin
                 if Pos(Nombre + '|', Accesos[i]) <> 0 then
                 begin
                    Propiedades := TStringList.Create;
                    try
                       PosLeft := 0;
                       PosTop := 0;
                       ico := 0;
                       Split(SeparadorPropiedad, Accesos[i], Propiedades);

                       CantPropiedades := Propiedades.Count;
                       if (CantPropiedades >= 1) then
                          NombreAccion := Propiedades[0];

                       if (CantPropiedades >= 2) then
                          PosLeft := StrToIntDef(Propiedades[1], 0);

                       if (CantPropiedades >= 3) then
                          PosTop := StrToIntDef(Propiedades[2], 0);

                       if (CantPropiedades >= 4) then
                          ico := StrToIntDef(Propiedades[3], 0);

                       if (CantPropiedades >= 5) then
                          ColorAD := StringToColor(Propiedades[4])
                       else
                          ColorAD := clMoneyGreen;

                       if (CantPropiedades >= 6) then
                          ColorFontAD := StringToColor(Propiedades[5])
                       else
                          ColorFontAD := clWhite;
                       {
                       if (CantPropiedades >= 7) then
                          BordeVisible := (Propiedades[6] = '1')
                       else
                          BordeVisible := True;
                       }

                       AccesoDirecto := NombreAccion + SeparadorPropiedad + IntToStr(PosLeft) + SeparadorPropiedad + IntToStr(PosTop) +
                          SeparadorPropiedad + IntToStr(ico) + SeparadorPropiedad + ColorToString(ColorAD) + SeparadorPropiedad + ColorToString(ColorFontAD) + SeparadorPropiedad + IntToStr(BoolToInt(BordeVisible))
                    finally
                       Propiedades.Free;
                    end;
                 end
                 else
                    AccesoDirecto := Accesos[i];

                 ConfiguracionNew := ConfiguracionNew + AccesoDirecto + ';';
              end;
           end;
        finally
           Accesos.Free;
        end;

        EscribeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', ConfiguracionNew);
     end;
  end;

  CargaAccesosDirectos;
end;

procedure CreaAcceso(Configuracion: string; BordeVisibleValorDefecto: boolean);
var
  Propiedades : TStrings;
  CantPropiedades : integer;
  LabelCabecera, LabelDetalle, NombreAccion : string;
  PosLeft, PosTop, ico : integer;
  ColorAD, ColorFontAD : TColor;
  BordeVisible : boolean;
begin
  // tipo 3 es el acceso Directo chico  " CreaAD(Tipo,PosL,PosT:integer;lcab,LDet,Accion:string) "
  // Propiedades := DamePropiedades(Ac); //AClientes|200|200|3;

  Propiedades := TStringList.Create;
  try
     PosLeft := 0;
     PosTop := 0;
     ico := 0;
     Split(SeparadorPropiedad, Configuracion, Propiedades);
     DameLabelsCabDet(Propiedades[0], LabelCabecera, LabelDetalle);
     CantPropiedades := Propiedades.Count;

     if (CantPropiedades >= 1) then
        NombreAccion := Propiedades[0];

     if (CantPropiedades >= 2) then
        PosLeft := StrToIntDef(Propiedades[1], 0);

     if (CantPropiedades >= 3) then
        PosTop := StrToIntDef(Propiedades[2], 0);

     if (CantPropiedades >= 4) then
        ico := StrToIntDef(Propiedades[3], 0);

     if (CantPropiedades >= 5) then
        ColorAD := StringToColor(Propiedades[4])
     else
        ColorAD := clMoneyGreen;

     if (CantPropiedades >= 6) then
        ColorFontAD := StringToColor(Propiedades[5])
     else
        ColorFontAD := clWhite;

     if (CantPropiedades >= 7) then
        BordeVisible := (Propiedades[6] = '1')
     else
        BordeVisible := BordeVisibleValorDefecto;

     FFondo.CreaAD(3, PosLeft, PosTop, ico, LabelCabecera, LabelDetalle, NombreAccion, ColorAD, ColorFontAD, BordeVisible);
  finally
     Propiedades.Free;
  end;
end;

procedure DameLabelsCabDet(NombreAccion: string; var Cab, Det: string);
var
  i : integer;
begin
  for i := 0 to (FMain.ALMain.ActionCount - 1) do
  begin
     if (TAction(FMain.ALMain.Actions[i]).Name = NombreAccion) then
     begin
        Cab := TAction(FMain.ALMain.Actions[i]).Category;
        Det := StringReplace(TAction(FMain.ALMain.Actions[i]).Caption, '&', '', [rfReplaceAll]);
     end;
  end;
end;

procedure Split(Delimiter: char; Str: string; ListOfStrings: TStrings);
begin
  ListOfStrings.Clear;
  ListOfStrings.Delimiter := Delimiter;
  ListOfStrings.DelimitedText := Str;
end;

procedure EliminaAccesoDirecto(NombreAccion: string);
var
  Configuracion, ConfiguracionNew : string;
  Accesos : TStringList;
  i : integer;
begin
  ConfiguracionNew := '';
  if NombreAccion = 'AVISOS' then //Elimina Avisos
  begin
     EliminaDatoIni('CONFIGURACION', 'AVISOS');
     CargaAccesosDirectos;
  end
  else
  begin   ////Elimina Accesos Directos
     Configuracion := LeeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', '');
     if Configuracion <> '' then // Hay accesos directos
     begin
        Accesos := TStringList.Create;
        try
           Split(SeparadorAcceso, Configuracion, Accesos);

           for i := 0 to Accesos.Count - 1 do
              if Trim(Accesos[i]) <> '' then
              begin
                 if Pos(NombreAccion + '|', Accesos[i]) = 0 then
                    ConfiguracionNew := ConfiguracionNew + Accesos[i] + SeparadorAcceso;
              end;
           if ConfiguracionNew = '' then
              EliminaDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS')
           else
              EscribeDatoIni('CONFIGURACION', 'ACCESOS_DIRECTOS', ConfiguracionNew);
        finally
           Accesos.Free;
        end;

        CargaAccesosDirectos;
     end;
  end;
end;

end.
