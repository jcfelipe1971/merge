inherited FMRecepcionFichaTecnica: TFMRecepcionFichaTecnica
  Top = 188
  Width = 755
  Height = 671
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Recepcion Ficha Tecnica'
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 745
    Height = 618
    inherited TBMain: TLFToolBar
      Width = 741
      inherited NavMain: THYMNavigator
        DataSource = DMRecepcionFichaTecnica.DSxRecepcion
        Hints.Strings = ()
        EditaControl = DBEFFichaTecnica
        InsertaControl = DBEFFichaTecnica
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
    end
    inherited PCMain: TLFPageControl
      Width = 741
      Height = 588
      inherited TSFicha: TTabSheet
        object SBAGaleria: TSpeedButton [0]
          Left = 172
          Top = 125
          Width = 376
          Height = 17
          GroupIndex = -1
          OnDblClick = SBAGaleriaDblClick
        end
        object SBACliente: TSpeedButton [1]
          Left = 168
          Top = 82
          Width = 371
          Height = 17
          GroupIndex = -1
          OnDblClick = SBAClienteDblClick
        end
        object SBAFichaTecnica: TSpeedButton [2]
          Left = 304
          Top = 35
          Width = 233
          Height = 17
          GroupIndex = -1
          OnDblClick = SBAFichaTecnicaDblClick
        end
        object SBAOperario: TSpeedButton [3]
          Left = 168
          Top = 103
          Width = 368
          Height = 17
          GroupIndex = -1
          OnDblClick = SBAOperarioDblClick
        end
        object SBAReparacion: TSpeedButton [4]
          Left = 474
          Top = 18
          Width = 69
          Height = 17
          GroupIndex = -1
          OnDblClick = SBAReparacionDblClick
        end
        inherited PEdit: TLFPanel
          Width = 733
          Height = 560
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'FECHA')
            Tabla_a_buscar = 'VER_REP_RECEPCION'
            CampoNum = 'ID_REP_RECEPCION'
            CampoStr = 'TITULO_VEHICULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID_REP_RECEPCION DESC')
          end
          object PNLImagen: TLFPanel
            Left = 537
            Top = 0
            Width = 196
            Height = 560
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Imagen: TImage
              Left = 0
              Top = 0
              Width = 196
              Height = 560
              Align = alRight
              AutoSize = True
              Center = True
              IncrementalDisplay = True
              Proportional = True
              Stretch = True
            end
          end
          object PNLFichas: TLFPanel
            Left = 0
            Top = 0
            Width = 537
            Height = 560
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object PNLFicha: TPanel
              Left = 0
              Top = 0
              Width = 537
              Height = 273
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LIdRecepcion: TLFLabel
                Left = 16
                Top = 11
                Width = 64
                Height = 13
                Alignment = taRightJustify
                Caption = 'Id Recepcion'
              end
              object LFecha: TLFLabel
                Left = 188
                Top = 11
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha'
              end
              object LFichaTecnica: TLFLabel
                Left = 12
                Top = 33
                Width = 68
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ficha Tecnica'
              end
              object LCliente: TLFLabel
                Left = 48
                Top = 77
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cliente'
              end
              object LBLOperario: TLFLabel
                Left = 18
                Top = 121
                Width = 62
                Height = 13
                Alignment = taRightJustify
                Caption = 'Responsable'
              end
              object LFLabel1: TLFLabel
                Left = 12
                Top = 166
                Width = 135
                Height = 13
                Alignment = taRightJustify
                Caption = 'Test del estado del veh'#237'culo'
              end
              object LMatricula: TLFLabel
                Left = 175
                Top = 33
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Matricula'
              end
              object LFLabel4: TLFLabel
                Left = 32
                Top = 55
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'Kilometros'
              end
              object LFLabel5: TLFLabel
                Left = 161
                Top = 53
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'Combustible'
              end
              object LIdReparacion: TLFLabel
                Left = 403
                Top = 11
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reparaci'#243'n'
              end
              object LGaleria: TLFLabel
                Left = 47
                Top = 98
                Width = 33
                Height = 13
                Alignment = taRightJustify
                Caption = 'Galeria'
              end
              object LFechaCierre: TLFLabel
                Left = 19
                Top = 143
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Cierre'
              end
              object DBEClienteNombre: TLFDbedit
                Left = 151
                Top = 73
                Width = 378
                Height = 21
                TabStop = False
                Color = clAqua
                DataField = 'NOMBRE_R_SOCIAL'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 10
                OnDblClick = DBEClienteNombreDblClick
              end
              object DBEIdRecepcion: TLFDbedit
                Left = 84
                Top = 7
                Width = 66
                Height = 21
                Hint = 'Entrada'
                Color = clInfoBk
                DataField = 'ID_REP_RECEPCION'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                Enabled = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBFecha: TLFDBDateEdit
                Left = 223
                Top = 7
                Width = 91
                Height = 21
                Hint = 'Fecha'
                DataField = 'FECHA'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ReadOnly = True
                CheckOnExit = True
                Color = clWhite
                NumGlyphs = 2
                TabOrder = 1
              end
              object DBEMatricula: TLFDbedit
                Left = 223
                Top = 29
                Width = 65
                Height = 21
                Hint = 'Matr'#237'cula'
                Color = clInfoBk
                DataField = 'MATRICULA'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                Enabled = False
                ReadOnly = True
                TabOrder = 5
              end
              object DBEVehiculo: TLFDbedit
                Left = 289
                Top = 29
                Width = 241
                Height = 21
                Color = clAqua
                DataField = 'TITULO_VEHICULO'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                Enabled = False
                ReadOnly = True
                TabOrder = 6
                OnDblClick = DBEVehiculoDblClick
              end
              object DBEFFichaTecnica: TLFDBEditFind2000
                Left = 84
                Top = 29
                Width = 66
                Height = 21
                Hint = 'Ficha T'#233'cnica'
                DataField = 'ID_FICHA_TECNICA'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                TabOrder = 4
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_FICHA_TECNICA'
                Tabla_asociada.DesplegarBusqueda = False
                Campos_Desplegar.Strings = (
                  'TITULO')
                CampoNum = 'ID_FICHA_TECNICA'
                CampoStr = 'MATRICULA'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'ID_FICHA_TECNICA')
                Filtros = []
              end
              object DBECliente: TLFDBEditFind2000
                Left = 84
                Top = 73
                Width = 66
                Height = 21
                Hint = 'Cliente'
                DataField = 'CLIENTE'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                TabOrder = 9
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_CLIENTES_SIMPLE'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CLIENTE'
                CampoStr = 'NOMBRE_COMERCIAL'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'CLIENTE')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEOperario: TLFDbedit
                Left = 151
                Top = 117
                Width = 378
                Height = 21
                Color = clAqua
                DataField = 'NOMBRE_EMPLEADO'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 14
                OnDblClick = DBEOperarioDblClick
              end
              object DBEEmpleado: TLFDBEditFind2000
                Left = 84
                Top = 117
                Width = 66
                Height = 21
                Hint = 'Responsable'
                DataField = 'EMPLEADO'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                TabOrder = 13
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_EMPLEADOS_EF'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'EMPLEADO'
                CampoStr = 'TITULO'
                CondicionBusqueda = 'ACTIVO=1'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'TERCERO')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object LFDBTESTIGO_AVERIA: TLFDBCheckBox
                Left = 10
                Top = 185
                Width = 170
                Height = 17
                Hint = 'Testigo Aver'#237'a'
                Transparent = True
                Caption = 'Testigo Aver'#237'a   '
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 17
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'TESTIGO_AVERIA'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBEstadoPlacas: TLFDBCheckBox
                Left = 10
                Top = 206
                Width = 170
                Height = 17
                Hint = 'Placas Matr'#237'cula'
                Transparent = True
                Caption = 'Placas matr'#237'cula   '
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 18
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ESTADO_PLACAS_MATRICULA'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBEstadoCristales: TLFDBCheckBox
                Left = 10
                Top = 227
                Width = 170
                Height = 17
                Hint = 'Cristales'
                Transparent = True
                Caption = 'Cristales   '
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 19
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ESTADO_CRISTALES'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBAntena: TLFDBCheckBox
                Left = 361
                Top = 227
                Width = 170
                Height = 17
                Hint = 'Antena'
                Transparent = True
                Caption = 'Antena   '
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 27
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ANTENA'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBPilotosFaro: TLFDBCheckBox
                Left = 10
                Top = 248
                Width = 170
                Height = 17
                Hint = 'Pilotos y Faros'
                Transparent = True
                Caption = 'Pilotos y Faros   '
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 20
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'PILOTOS_Y_FAROS'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBPuertasDelanteras: TLFDBCheckBox
                Left = 185
                Top = 185
                Width = 170
                Height = 17
                Hint = 'Apertura puertas delanteras'
                Transparent = True
                Caption = 'Apertura puertas delanteras'
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 21
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'APERTURA_PUERTAS_DELANTERAS'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBPuertasTraseras: TLFDBCheckBox
                Left = 185
                Top = 206
                Width = 170
                Height = 17
                Hint = 'Apertura puertas traseras'
                Transparent = True
                Caption = 'Apertura puertas traseras'
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 22
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'APERTURA_PUERTAS_TRASERAS'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object ELElevalunasDelanteros: TLFDBCheckBox
                Left = 185
                Top = 227
                Width = 170
                Height = 17
                Hint = 'Elevalunas delanteros'
                Transparent = True
                Caption = 'Elevalunas delanteros'
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 23
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ELEVALUNAS_DELATEROS'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBElevalunasTraseros: TLFDBCheckBox
                Left = 185
                Top = 248
                Width = 170
                Height = 17
                Hint = 'Elevalunas traseros'
                Transparent = True
                Caption = 'Elevalunas traseros'
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 24
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ELEVALUNAS_TRASEROS'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBRetrovisores: TLFDBCheckBox
                Left = 361
                Top = 206
                Width = 170
                Height = 17
                Hint = 'Retrovisores'
                Transparent = True
                Caption = 'Retrovisores'
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 26
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'RETROVISORES'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEKilometraje: TLFDbedit
                Left = 84
                Top = 51
                Width = 66
                Height = 21
                Hint = 'Kil'#243'metros'
                DataField = 'KILOMETRAJE'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                TabOrder = 7
              end
              object DBEIdReparacion: TLFDbedit
                Left = 462
                Top = 7
                Width = 68
                Height = 21
                Hint = 'Reparaci'#243'n'
                Color = clAqua
                DataField = 'ID_REPARACION'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                Enabled = False
                ReadOnly = True
                TabOrder = 3
              end
              object DBEFGaleria: TLFDBEditFind2000
                Left = 84
                Top = 95
                Width = 66
                Height = 21
                DataField = 'ID_GALERIA_RECEPCION'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                TabOrder = 11
                OnChange = DBEFGaleriaChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_GALERIA'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'ID'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'ID')
                Filtros = []
              end
              object ETituloGaleria: TLFEdit
                Left = 151
                Top = 95
                Width = 378
                Height = 21
                Color = clAqua
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
              object DBDTPFecha: TDBDateTimePicker
                Left = 315
                Top = 7
                Width = 72
                Height = 21
                CalAlignment = dtaLeft
                Date = 45705
                Time = 45705
                DateFormat = dfShort
                DateMode = dmComboBox
                Kind = dtkTime
                ParseInput = False
                TabOrder = 2
                DataField = 'FECHA'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
              end
              object DBCBEstadoEscobillas: TLFDBCheckBox
                Left = 361
                Top = 185
                Width = 170
                Height = 17
                Hint = 'Estado escobillas'
                Transparent = True
                Caption = 'Estado escobillas'
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 25
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'ESTADO_ESCOBILLAS'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCBCombustible: TDBComboBoxValue
                Left = 224
                Top = 51
                Width = 145
                Height = 21
                Style = csDropDownList
                DataField = 'COMBUSTIBLE'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ItemHeight = 13
                Items.Strings = (
                  'Reserva'
                  '1/4'
                  '1/2'
                  '3/4'
                  'Lleno')
                Values.Strings = (
                  '0'
                  '25'
                  '50'
                  '75'
                  '100')
                TabOrder = 8
              end
              object DBDEFechaCierre: TLFDBDateEdit
                Left = 84
                Top = 139
                Width = 91
                Height = 21
                Hint = 'Fecha'
                DataField = 'FECHA_HORA_CIERRE'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                CheckOnExit = True
                Color = clWhite
                NumGlyphs = 2
                TabOrder = 15
              end
              object DBDTPFechaCierre: TDBDateTimePicker
                Left = 176
                Top = 139
                Width = 72
                Height = 21
                CalAlignment = dtaLeft
                Date = 45705
                Time = 45705
                DateFormat = dfShort
                DateMode = dmComboBox
                Kind = dtkTime
                ParseInput = False
                TabOrder = 16
                DataField = 'FECHA_HORA_CIERRE'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
              end
            end
            object PNLFirma: TLFPanel
              Left = 0
              Top = 431
              Width = 537
              Height = 129
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
              object LFLabel7: TLFLabel
                Left = 70
                Top = 11
                Width = 25
                Height = 13
                Alignment = taRightJustify
                Caption = 'Firma'
              end
              object ImagenFirma: TImage
                Left = 100
                Top = 11
                Width = 181
                Height = 93
                Stretch = True
              end
              object LFDBRecogerPiezas: TLFDBCheckBox
                Left = 328
                Top = 16
                Width = 170
                Height = 17
                Hint = 'Cristales'
                Transparent = True
                Caption = 'Recoger piezas sustituidas'
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 0
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'RECOGER_PIEZAS_SUSTITUIDAS'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBAutorizaPresupuesto: TLFDBCheckBox
                Left = 328
                Top = 37
                Width = 170
                Height = 17
                Hint = 'Autoriza presupuesto'
                Transparent = True
                Caption = 'Autoriza presupuesto'
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 1
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'AUTORIZA_PRESUPUESTO'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBAutorizaPruebas: TLFDBCheckBox
                Left = 328
                Top = 58
                Width = 170
                Height = 17
                Hint = 'Apertura puertas traseras'
                Transparent = True
                Caption = 'Autoriza pruebas'
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 2
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'AUTORIZA_PRUEBAS'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object LFDBPiezasCliente: TLFDBCheckBox
                Left = 328
                Top = 80
                Width = 170
                Height = 17
                Hint = 'Piezas del cliente'
                Transparent = True
                Caption = 'Piezas del cliente'
                ClicksDisabled = False
                ColorDown = clRed
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 3
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'PIEZAS_DEL_CLIENTE'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEIdFirma: TLFDbedit
                Left = 264
                Top = 11
                Width = 16
                Height = 21
                Hint = 'Entrada'
                TabStop = False
                Color = clInfoBk
                DataField = 'ID_FIRMA'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                Enabled = False
                ReadOnly = True
                TabOrder = 4
                Visible = False
                OnChange = DBEIdFirmaChange
              end
            end
            object PNLNotas: TLFPanel
              Left = 0
              Top = 273
              Width = 537
              Height = 158
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              OnResize = PNLNotasResize
              object LTrabajos: TLFLabel
                Left = 10
                Top = 108
                Width = 86
                Height = 13
                Alignment = taRightJustify
                Caption = 'Trabajos a realizar'
              end
              object LComentarioEstado: TLFLabel
                Left = 8
                Top = 58
                Width = 88
                Height = 13
                Alignment = taRightJustify
                Caption = 'Comentario estado'
              end
              object LComentarioCliente: TLFLabel
                Left = 8
                Top = 8
                Width = 87
                Height = 13
                Alignment = taRightJustify
                Caption = 'Comentario cliente'
              end
              object DBMTrabajos: TLFDBMemo
                Left = 100
                Top = 103
                Width = 428
                Height = 50
                Hint = 'Trabajos a realizar'
                DataField = 'TRABAJOS_A_REALIZAR'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                TabOrder = 2
              end
              object DBMComentarioEstado: TLFDBMemo
                Left = 100
                Top = 53
                Width = 428
                Height = 50
                Hint = 'Comentario de Estado'
                DataField = 'COMENTARIO_ESTADO'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                TabOrder = 1
              end
              object DBMComentarioCliente: TLFDBMemo
                Left = 100
                Top = 3
                Width = 428
                Height = 50
                Hint = 'Comentario cliente'
                DataField = 'COMENTARIOS_CLIENTE'
                DataSource = DMRecepcionFichaTecnica.DSxRecepcion
                TabOrder = 0
              end
            end
          end
        end
      end
      object TSGaleria: TTabSheet [1]
        Caption = 'Galeria'
        ImageIndex = 2
        OnShow = TSGaleriaShow
        object LFLabel9: TLFLabel
          Left = -1
          Top = 11
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Matricula'
        end
        object LVGaleria: TListView
          Left = 0
          Top = 22
          Width = 733
          Height = 538
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          Columns = <>
          TabOrder = 0
          OnDblClick = LVGaleriaDblClick
        end
        object TBGaleria: TLFToolBar
          Left = 0
          Top = 0
          Width = 733
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Separators = True
          object PNLGaleriaTBRecepcion: TLFPanel
            Left = 0
            Top = 0
            Width = 153
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LIdRecepcionGaleria: TLFLabel
              Left = 8
              Top = 4
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id Recepcion'
            end
            object DBERecepcionGaleria: TLFDbedit
              Left = 77
              Top = 1
              Width = 66
              Height = 21
              Hint = 'Entrada'
              Color = clInfoBk
              DataField = 'ID_REP_RECEPCION'
              DataSource = DMRecepcionFichaTecnica.DSxRecepcion
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object PNLTBGaleria: TLFPanel
            Left = 153
            Top = 0
            Width = 521
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
            object LGaleriaMatricula: TLFLabel
              Left = 5
              Top = 5
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Matricula'
            end
            object DBEGaleriaMatricula: TLFDbedit
              Left = 53
              Top = 1
              Width = 121
              Height = 21
              Color = clInfoBk
              DataField = 'MATRICULA'
              DataSource = DMRecepcionFichaTecnica.DSxRecepcion
              Enabled = False
              TabOrder = 0
            end
            object DBEGaleriaTitulo: TLFDbedit
              Left = 175
              Top = 1
              Width = 344
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO_VEHICULO'
              DataSource = DMRecepcionFichaTecnica.DSxRecepcion
              Enabled = False
              TabOrder = 1
              OnDblClick = DBEGaleriaTituloDblClick
            end
          end
        end
      end
      object TSPreITV: TTabSheet [2]
        Caption = 'Pre-ITV'
        ImageIndex = 3
        object PNLPreITV: TLFPanel
          Left = 0
          Top = 22
          Width = 733
          Height = 155
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            733
            155)
          object LFichaTecnicaITV: TLFLabel
            Left = 12
            Top = 57
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ficha Tecnica'
          end
          object LMatriculaITV: TLFLabel
            Left = 175
            Top = 57
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Matricula'
          end
          object LKilometros: TLFLabel
            Left = 32
            Top = 79
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Kilometros'
          end
          object LFechaITV: TLFLabel
            Left = 188
            Top = 35
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LIdInspeccion: TLFLabel
            Left = 16
            Top = 35
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id Inspeccion'
          end
          object LEmpleado: TLFLabel
            Left = 18
            Top = 101
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Responsable'
          end
          object LObservaciones: TLFLabel
            Left = 536
            Top = 35
            Width = 71
            Height = 13
            Caption = 'Observaciones'
          end
          object LFLabel2: TLFLabel
            Left = 19
            Top = 123
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Cierre'
          end
          object TBPreITV: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 22
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            Separators = True
            object NavPreITV: THYMNavigator
              Left = 0
              Top = 0
              Width = 240
              Height = 22
              DataSource = DMRecepcionFichaTecnica.DSxPreITV
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBEMatriculaITV: TLFDbedit
            Left = 223
            Top = 53
            Width = 65
            Height = 21
            Hint = 'Matr'#237'cula'
            Color = clInfoBk
            DataField = 'MATRICULA'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBETituloITV: TLFDbedit
            Left = 289
            Top = 53
            Width = 241
            Height = 21
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
            Enabled = False
            ReadOnly = True
            TabOrder = 5
            OnDblClick = DBEVehiculoDblClick
          end
          object DBEFFichaTecnicaITV: TLFDBEditFind2000
            Left = 84
            Top = 53
            Width = 66
            Height = 21
            Hint = 'Ficha T'#233'cnica'
            DataField = 'ID_FICHA_TECNICA'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_FICHA_TECNICA'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'ID_FICHA_TECNICA'
            CampoStr = 'MATRICULA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ID_FICHA_TECNICA')
            Filtros = []
          end
          object DBEKilometros: TLFDbedit
            Left = 84
            Top = 75
            Width = 66
            Height = 21
            Hint = 'Kil'#243'metros'
            DataField = 'KILOMETROS'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
            TabOrder = 6
          end
          object DBDEFechaITV: TLFDBDateEdit
            Left = 223
            Top = 31
            Width = 91
            Height = 21
            Hint = 'Fecha'
            DataField = 'FECHA'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
            ReadOnly = True
            CheckOnExit = True
            Color = clWhite
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBDTBFechaITV: TDBDateTimePicker
            Left = 315
            Top = 31
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 45705
            Time = 45705
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 2
            DataField = 'FECHA'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
          end
          object DBEIdInspeccion: TLFDbedit
            Left = 84
            Top = 31
            Width = 66
            Height = 21
            Hint = 'Entrada'
            Color = clInfoBk
            DataField = 'ID_INSPECCION'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEFEmpleado: TLFDBEditFind2000
            Left = 84
            Top = 97
            Width = 66
            Height = 21
            Hint = 'Responsable'
            DataField = 'EMPLEADO'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
            TabOrder = 7
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EEmpleado: TLFDbedit
            Left = 151
            Top = 97
            Width = 378
            Height = 21
            Color = clAqua
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            OnDblClick = DBEOperarioDblClick
          end
          object DBMObservaciones: TLFDBMemo
            Left = 536
            Top = 53
            Width = 185
            Height = 86
            Hint = 'Comentario cliente'
            Anchors = [akLeft, akTop, akRight]
            DataField = 'OBSERVACIONES'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
            TabOrder = 11
          end
          object DEFechaCierrePreITV: TLFDBDateEdit
            Left = 84
            Top = 119
            Width = 91
            Height = 21
            Hint = 'Fecha'
            DataField = 'FECHA_HORA_CIERRE'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
            CheckOnExit = True
            Color = clWhite
            NumGlyphs = 2
            TabOrder = 9
          end
          object DBDTPFechaCierrePreITV: TDBDateTimePicker
            Left = 176
            Top = 119
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 45705
            Time = 45705
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 10
            DataField = 'FECHA_HORA_CIERRE'
            DataSource = DMRecepcionFichaTecnica.DSxPreITV
          end
        end
        object PNLPreITVVerificacion: TLFPanel
          Left = 0
          Top = 177
          Width = 733
          Height = 383
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBPreITVVerificacion: TLFToolBar
            Left = 0
            Top = 0
            Width = 733
            Height = 22
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Separators = True
            object NavPreITVVerificacion: THYMNavigator
              Left = 0
              Top = 0
              Width = 232
              Height = 22
              DataSource = DMRecepcionFichaTecnica.DSPreITVVerificacion
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGPreITVVerificacion: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 733
            Height = 361
            Align = alClient
            DataSource = DMRecepcionFichaTecnica.DSPreITVVerificacion
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGPreITVVerificacionDrawColumnCell
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            Transaction = DMRecepcionFichaTecnica.TLocal
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            ColumnasCheckBoxes.Strings = (
              'REPARADO')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RESULTADO'
                PickList.Strings = (
                  ' '
                  'B'
                  'M'
                  'R')
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REPARADO'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OBSERVACIONES'
                Visible = True
              end>
          end
        end
        object TBPreITVCabecera: TLFToolBar
          Left = 0
          Top = 0
          Width = 733
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Separators = True
          object PNLPreITVTBRecepcion: TLFPanel
            Left = 0
            Top = 0
            Width = 153
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LPreITVRecacion: TLFLabel
              Left = 8
              Top = 4
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id Recepcion'
            end
            object DBEPreITVRecacion: TLFDbedit
              Left = 77
              Top = 1
              Width = 66
              Height = 21
              Hint = 'Entrada'
              Color = clInfoBk
              DataField = 'ID_REP_RECEPCION'
              DataSource = DMRecepcionFichaTecnica.DSxRecepcion
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object PNLTBPreITVMatricula: TLFPanel
            Left = 153
            Top = 0
            Width = 521
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
            object LPreITVMatricual: TLFLabel
              Left = 5
              Top = 5
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Matricula'
            end
            object DBEPreITVMatricula: TLFDbedit
              Left = 53
              Top = 1
              Width = 121
              Height = 21
              Color = clInfoBk
              DataField = 'MATRICULA'
              DataSource = DMRecepcionFichaTecnica.DSxRecepcion
              Enabled = False
              TabOrder = 0
            end
            object DBEDBEPreITVTitulo: TLFDbedit
              Left = 175
              Top = 1
              Width = 344
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO_VEHICULO'
              DataSource = DMRecepcionFichaTecnica.DSxRecepcion
              Enabled = False
              TabOrder = 1
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 733
          Height = 560
          DataSource = DMRecepcionFichaTecnica.DSxRecepcion
          CamposAMarcar.Strings = (
            'ANTENA'
            'APERTURA_PUERTAS_DELANTERAS'
            'APERTURA_PUERTAS_TRASERAS'
            'AUTORIZA_PRESUPUESTO'
            'AUTORIZA_PRUEBAS'
            'ELEVALUNAS_DELATEROS'
            'ELEVALUNAS_TRASEROS'
            'ESTADO_CRISTALES'
            'ESTADO_ESCOBILLAS'
            'ESTADO_PLACAS_MATRICULA'
            'PIEZAS_DEL_CLIENTE'
            'PILOTOS_Y_FAROS'
            'RECOGER_PIEZAS_SUSTITUIDAS'
            'RETROVISORES'
            'TESTIGO_AVERIA')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'EMPLEADO'
            'FECHA'
            'ID_CLIENTE'
            'ID_EMPLEADO'
            'ID_FICHA_TECNICA'
            'ID_REP_RECEPCION'
            'ID_REPARACION'
            'MATRICULA'
            'NOMBRE_EMPLEADO'
            'NOMBRE_R_SOCIAL'
            'TITULO_VEHICULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_REP_RECEPCION'
              Title.Caption = 'Id.'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_REPARACION'
              Title.Caption = 'Reparaci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_FICHA_TECNICA'
              Title.Caption = 'Veh'#237'culo'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATRICULA'
              Title.Caption = 'Matr'#237'cula'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_VEHICULO'
              Title.Caption = 'Descripci'#243'n'
              Width = 172
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KILOMETRAJE'
              ReadOnly = True
              Title.Caption = 'Km.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMBUSTIBLE'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              ReadOnly = True
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              ReadOnly = True
              Title.Caption = 'Nombre Cliente'
              Width = 185
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPLEADO'
              ReadOnly = True
              Title.Caption = 'Responsable'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_EMPLEADO'
              ReadOnly = True
              Title.Caption = 'Nombre'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TESTIGO_AVERIA'
              ReadOnly = True
              Title.Caption = 'Testigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_PLACAS_MATRICULA'
              ReadOnly = True
              Title.Caption = 'Placas'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_CRISTALES'
              ReadOnly = True
              Title.Caption = 'Cristales'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANTENA'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_ESCOBILLAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PILOTOS_Y_FAROS'
              ReadOnly = True
              Title.Caption = 'Pilotos'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APERTURA_PUERTAS_DELANTERAS'
              ReadOnly = True
              Title.Caption = 'Puertas Delanteras'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APERTURA_PUERTAS_TRASERAS'
              ReadOnly = True
              Title.Caption = 'Puertas Traseras'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ELEVALUNAS_DELATEROS'
              ReadOnly = True
              Title.Caption = 'Elevalunas Delanteros'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ELEVALUNAS_TRASEROS'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RETROVISORES'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUTORIZA_PRESUPUESTO'
              ReadOnly = True
              Title.Caption = 'Autoriza presupuesto'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUTORIZA_PRUEBAS'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PIEZAS_DEL_CLIENTE'
              ReadOnly = True
              Title.Caption = 'Piezas del Cliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECOGER_PIEZAS_SUSTITUIDAS'
              ReadOnly = True
              Title.Caption = 'Recoger piezas sustituidas'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 618
    Width = 745
  end
  inherited CEMain: TControlEdit
    Left = 392
    Top = 20
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 428
    Top = 20
  end
  inherited ALMain: TLFActionList
    Left = 352
    Top = 24
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListadoRecepcion: TAction
      Category = 'Listados'
      Caption = 'Listado Recepcion'
      Hint = 'Listado Recepcion'
      ImageIndex = 14
      OnExecute = AListadoRecepcionExecute
    end
    object AConfigListadoRecepcion: TAction
      Category = 'Listados'
      Caption = 'Configuracion Listado de Recepcion'
      Hint = 'Configuracion Listado de Recepcion'
      ImageIndex = 77
      OnExecute = AConfigListadoRecepcionExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object ACliente: TAction
      Category = 'Otros'
      Caption = 'Ficha Cliente'
      Hint = 'Muestra Ficha de Cliente'
      ImageIndex = 104
      OnExecute = AClienteExecute
    end
    object AGaleria: TAction
      Category = 'Otros'
      Caption = 'Galeria de Imagenes'
      Hint = 'Muestra Galeria de Imagenes'
      ImageIndex = 28
      OnExecute = AGaleriaExecute
    end
    object AFichaTecnica: TAction
      Category = 'Otros'
      Caption = 'Ficha Tecnica'
      Hint = 'Muestra Ficha Tecnica'
      ImageIndex = 119
      OnExecute = AFichaTecnicaExecute
    end
    object AOperario: TAction
      Category = 'Otros'
      Caption = 'Ficha Operario'
      Hint = 'Muestra Ficha de Operario'
      ImageIndex = 135
      OnExecute = AOperarioExecute
    end
    object AReparacion: TAction
      Category = 'Otros'
      Caption = 'Reparacion'
      Hint = 'Muestra Reparacion'
      ImageIndex = 119
      OnExecute = AReparacionExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 121
    end
    object AAdjuntoFicha: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos Ficha Tecnica'
      Hint = 'Adjuntos de Ficha Tecnica'
      ImageIndex = 59
      OnExecute = AAdjuntoFichaExecute
    end
    object actAEnviarRecepcionCorreo: TAction
      Category = 'Listados'
      Caption = 'Enviar Recepci'#243'n por correo'
      ImageIndex = 34
      OnExecute = actAEnviarRecepcionCorreoExecute
    end
    object AListadoPreITV: TAction
      Category = 'Listados'
      Caption = 'Listado PreITV'
      Hint = 'Listado PreITV'
      ImageIndex = 14
      OnExecute = AListadoPreITVExecute
    end
    object AConfigListadoPreITV: TAction
      Category = 'Listados'
      Caption = 'Configuracion Listado PreITV'
      ImageIndex = 77
      OnExecute = AConfigListadoPreITVExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 512
    Top = 16
  end
end
