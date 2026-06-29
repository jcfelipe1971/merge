inherited FMUsuariosMensajes: TFMUsuariosMensajes
  Left = 531
  Top = 217
  Width = 589
  Height = 448
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = ' Avisos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 579
    Height = 395
    inherited PCMain: TLFPageControl [0]
      Width = 575
      Height = 365
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 567
          Height = 337
          inherited G2KTableLoc: TG2KTBLoc
            Left = 8
          end
          object DBDTPFechaResTime: TDBDateTimePicker
            Left = 327
            Top = 213
            Width = 71
            Height = 21
            CalAlignment = dtaLeft
            Date = 45298
            Time = 45298
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 0
            DataField = 'FECHA_RESPUESTA'
            DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
          end
          object PNLDirigido: TLFPanel
            Left = 419
            Top = 0
            Width = 148
            Height = 337
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object LBLDirigido: TLFLabel
              Left = 0
              Top = 0
              Width = 148
              Height = 13
              Align = alTop
              Caption = 'Dirigido a'
            end
            object CLBDestinatarios: TCheckListBox
              Left = 0
              Top = 13
              Width = 148
              Height = 324
              Align = alClient
              ItemHeight = 13
              TabOrder = 0
              OnClick = CLBDestinatariosClick
            end
          end
          object PNLAviso: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 337
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object PNLMensaje: TLFPanel
              Left = 0
              Top = 0
              Width = 419
              Height = 229
              Align = alClient
              BevelInner = bvRaised
              BevelOuter = bvNone
              TabOrder = 0
              OnResize = PNLMensajeResize
              DesignSize = (
                419
                229)
              object LBLUsuario: TLFLabel
                Left = 29
                Top = 27
                Width = 36
                Height = 13
                Alignment = taRightJustify
                Caption = 'Usuario'
              end
              object LBLAviso: TLFLabel
                Left = 39
                Top = 5
                Width = 26
                Height = 13
                Alignment = taRightJustify
                Caption = 'Aviso'
              end
              object LBLTercero: TLFLabel
                Left = 28
                Top = 49
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tercero'
              end
              object LFecha: TLFLabel
                Left = 193
                Top = 5
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha'
              end
              object LFechaInicioValidez: TLFLabel
                Left = -22
                Top = 72
                Width = 86
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fec. Inicio Validez'
              end
              object DBCKUrgente: TLFDBCheckBox
                Left = 237
                Top = 70
                Width = 65
                Height = 17
                Caption = 'Urgente'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 0
                TabStop = True
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                Alignment = taLeftJustify
                DataField = 'URGENTE'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCheckBox1: TLFDBCheckBox
                Left = 341
                Top = 5
                Width = 58
                Height = 17
                Caption = 'Activo'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 2
                TabStop = True
                BiDiMode = bdLeftToRight
                ParentBiDiMode = False
                Alignment = taLeftJustify
                DataField = 'ACTIVO'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEAviso: TLFDbedit
                Left = 69
                Top = 2
                Width = 74
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'AVISO'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object DBETitiUsuario: TLFDbedit
                Left = 144
                Top = 24
                Width = 269
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                Color = clInfoBk
                DataField = 'NOMBRE'
                DataSource = DMUsuariosMensajes.DSUsuario
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object DBEFTercero: TLFDBEditFind2000
                Left = 69
                Top = 46
                Width = 74
                Height = 21
                DataField = 'TERCERO'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
                TabOrder = 5
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SYS_TERCEROS'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'TERCERO'
                CampoStr = 'NOMBRE_R_SOCIAL'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                Filtros = [obEmpresa]
              end
              object DBETitTercero: TLFDbedit
                Left = 144
                Top = 46
                Width = 269
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                Color = clInfoBk
                DataField = 'NOMBRE_R_SOCIAL'
                DataSource = DMUsuariosMensajes.DSTercero
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 6
              end
              object DBMMensaje: TLFDBMemo
                Left = 69
                Top = 90
                Width = 345
                Height = 132
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataField = 'MENSAJE'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
                ScrollBars = ssVertical
                TabOrder = 1
              end
              object DBDEFechaIni: TLFDBDateEdit
                Left = 227
                Top = 2
                Width = 87
                Height = 21
                TabStop = False
                DataField = 'FECHA_VAL'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
                ReadOnly = True
                CheckOnExit = True
                Color = clInfoBk
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                NumGlyphs = 2
                ParentFont = False
                TabOrder = 7
              end
              object DBEUsuario: TLFDbedit
                Left = 69
                Top = 24
                Width = 74
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'USUARIO'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 8
              end
              object DBDEFechaVal: TLFDBDateEdit
                Left = 69
                Top = 68
                Width = 87
                Height = 21
                DataField = 'FECHA_INI'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 9
              end
              object DBDTPFechaIniTime: TDBDateTimePicker
                Left = 157
                Top = 68
                Width = 71
                Height = 21
                CalAlignment = dtaLeft
                Date = 45298
                Time = 45298
                Checked = False
                DateFormat = dfShort
                DateMode = dmComboBox
                Kind = dtkTime
                ParseInput = False
                TabOrder = 10
                DataField = 'FECHA_INI'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
              end
            end
            object PNLRespuesta: TLFPanel
              Left = 0
              Top = 229
              Width = 419
              Height = 108
              Align = alBottom
              BevelInner = bvRaised
              BevelOuter = bvNone
              TabOrder = 1
              OnResize = PNLRespuestaResize
              DesignSize = (
                419
                108)
              object LBLResultado: TLFLabel
                Left = 17
                Top = 32
                Width = 48
                Height = 13
                Alignment = taRightJustify
                Caption = 'Resultado'
              end
              object LBLFechaRespuesta: TLFLabel
                Left = 13
                Top = 8
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Respuesta'
              end
              object DBDEFechaRes: TLFDBDateEdit
                Left = 69
                Top = 5
                Width = 87
                Height = 21
                DataField = 'FECHA_RESPUESTA'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 1
              end
              object DBMResultado: TLFDBMemo
                Left = 69
                Top = 26
                Width = 345
                Height = 80
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataField = 'RESULTADO'
                DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
                ScrollBars = ssVertical
                TabOrder = 0
              end
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        ParentFont = False
        ParentShowHint = False
        OnShow = nil
        inherited DBGMain: THYTDBGrid
          Width = 567
          Height = 337
          DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
          ParentBiDiMode = False
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'ACTIVO'
            'URGENTE')
          CamposChecked.Strings = (
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'AVISO'
            'FECHA_INI'
            'FECHA_RESPUESTA'
            'FECHA_VAL'
            'TERCERO'
            'URGENTE'
            'USUARIO'
            'USUARIO_FIN')
          Columns = <
            item
              Expanded = False
              FieldName = 'AVISO'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'URGENTE'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_USUARIO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_VAL'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INI'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RESPUESTA'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_TERCERO'
              Width = 190
              Visible = True
            end>
        end
      end
    end
    inherited TBMain: TLFToolBar [1]
      Width = 575
      inherited NavMain: THYMNavigator
        DataSource = DMUsuariosMensajes.DSQMUsuariosMensajes
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 100
        VisibleButtons = [neImprime, neRango, neReport, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 328
        Width = 7
      end
      inherited TbuttComp: TToolButton
        Left = 335
      end
      object ButtRefrescar: TToolButton
        Left = 358
        Top = 0
        Hint = 'Refresca los datos de la vista.'
        Caption = 'Refrescar'
        ImageIndex = 26
        OnClick = ButtRefrescarClick
      end
      object TBDesmarcarActivo: TToolButton
        Left = 381
        Top = 0
        Caption = 'Marcar como Leido'
        ImageIndex = 19
        OnClick = TBDesmarcarActivoClick
      end
      object PNLSoloPendientes: TLFPanel
        Left = 404
        Top = 0
        Width = 137
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object CBSoloPendientes: TLFCheckBox
          Left = 12
          Top = 2
          Width = 121
          Height = 17
          Caption = 'Solo Pendientes'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBSoloPendientesChange
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 395
    Width = 579
  end
  inherited CEMain: TControlEdit
    Left = 444
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 408
    Top = 14
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
  end
  inherited ALMain: TLFActionList
    Left = 130
    Top = 20
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListadoAvisos: TAction
      Category = 'Listados'
      Caption = 'Listado de Avisos'
      Hint = 'Listado de Avisos'
      ImageIndex = 14
      OnExecute = AListadoAvisosExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBSoloPendientes.Checked')
    Left = 320
    Top = 10
  end
end
