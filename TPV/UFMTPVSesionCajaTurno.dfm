inherited FMTPVSesionCajaTurno: TFMTPVSesionCajaTurno
  Caption = 'Sesi'#243'n - Caja - Turno'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited EPMain: THYMEditPanel
        Width = 22
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object PNLSerie: TLFPanel
        Left = 22
        Top = 0
        Width = 243
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LSerieVenta: TLFLabel
          Left = 19
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
        end
        object CBSerie: TLFComboBox
          Left = 48
          Top = 0
          Width = 185
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSerieChange
        end
      end
    end
    object PNLSesion: TLFPanel
      Left = 2
      Top = 28
      Width = 498
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LSesion: TLFLabel
        Left = 50
        Top = 26
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sesi'#243'n'
      end
      object LSesionDesde: TLFLabel
        Left = 51
        Top = 48
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LSesionHasta: TLFLabel
        Left = 194
        Top = 48
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DBDESesionFechaHasta: TLFDBDateEdit
        Left = 226
        Top = 44
        Width = 87
        Height = 21
        DataField = 'FECHA_FIN'
        DataSource = DMTPVSesionCajaTurno.DSxSesion
        ReadOnly = True
        CheckOnExit = True
        Enabled = False
        NumGlyphs = 2
        TabOrder = 0
      end
      object DBDESesionFechaDesde: TLFDBDateEdit
        Left = 86
        Top = 44
        Width = 87
        Height = 21
        DataField = 'FECHA_INICIO'
        DataSource = DMTPVSesionCajaTurno.DSxSesion
        ReadOnly = True
        CheckOnExit = True
        Enabled = False
        NumGlyphs = 2
        TabOrder = 1
      end
      object CKSesionAbierta: TLFDBCheckBox
        Left = 361
        Top = 25
        Width = 70
        Height = 17
        Caption = 'Abierta'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
        DataField = 'ABIERTA'
        DataSource = DMTPVSesionCajaTurno.DSxSesion
        ReadOnly = True
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBETituloRelacion: TLFDbedit
        Left = 86
        Top = 22
        Width = 87
        Height = 21
        Color = clInfoBk
        DataField = 'SESION'
        DataSource = DMTPVSesionCajaTurno.DSxSesion
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object PNLCajaTurno: TLFPanel
      Left = 2
      Top = 109
      Width = 498
      Height = 221
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object PNLCaja: TLFPanel
        Left = 0
        Top = 0
        Width = 498
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LCaja: TLFLabel
          Left = 61
          Top = 44
          Width = 21
          Height = 13
          Alignment = taRightJustify
          Caption = 'Caja'
        end
        object LCajaDesde: TLFLabel
          Left = 51
          Top = 66
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LCajaHasta: TLFLabel
          Left = 194
          Top = 66
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DBECaja: TLFDbedit
          Left = 86
          Top = 40
          Width = 87
          Height = 21
          Color = clInfoBk
          DataField = 'CAJA'
          DataSource = DMTPVSesionCajaTurno.DSxCaja
          Enabled = False
          TabOrder = 0
        end
        object CKCajaAbierta: TLFDBCheckBox
          Left = 361
          Top = 42
          Width = 70
          Height = 17
          Caption = 'Abierta'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'ABIERTA'
          DataSource = DMTPVSesionCajaTurno.DSxSesion
          ReadOnly = True
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBDECajaFechaInicio: TLFDBDateEdit
          Left = 86
          Top = 62
          Width = 87
          Height = 21
          DataField = 'FECHA_INICIO'
          DataSource = DMTPVSesionCajaTurno.DSxCaja
          ReadOnly = True
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 2
        end
        object DBDECajaFechafin: TLFDBDateEdit
          Left = 226
          Top = 62
          Width = 87
          Height = 21
          DataField = 'FECHA_FIN'
          DataSource = DMTPVSesionCajaTurno.DSxCaja
          ReadOnly = True
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 3
        end
        object TBCaja: TLFToolBar
          Left = 0
          Top = 0
          Width = 498
          Height = 29
          DisabledImages = DMMain.ILMain_In
          EdgeInner = esNone
          EdgeOuter = esNone
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 4
          Separators = True
          object NavCaja: THYMNavigator
            Left = 0
            Top = 2
            Width = 110
            Height = 22
            DataSource = DMTPVSesionCajaTurno.DSxCaja
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
      end
      object PNLTurno: TLFPanel
        Left = 0
        Top = 89
        Width = 498
        Height = 132
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LTurno: TLFLabel
          Left = 54
          Top = 44
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turno'
        end
        object LSaldoInicial: TLFLabel
          Left = 25
          Top = 88
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Saldo Inicial'
        end
        object LTurnoDesde: TLFLabel
          Left = 51
          Top = 66
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LTurnoHasta: TLFLabel
          Left = 194
          Top = 66
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DBETurno: TLFDbedit
          Left = 86
          Top = 40
          Width = 87
          Height = 21
          Color = clInfoBk
          DataField = 'TURNO'
          DataSource = DMTPVSesionCajaTurno.DSxTurno
          Enabled = False
          TabOrder = 0
        end
        object CKTurnoAbierto: TLFDBCheckBox
          Left = 361
          Top = 42
          Width = 70
          Height = 17
          Caption = 'Abierto'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'ABIERTO'
          DataSource = DMTPVSesionCajaTurno.DSxTurno
          ReadOnly = True
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBDETurnoFechaInicio: TLFDBDateEdit
          Left = 86
          Top = 62
          Width = 87
          Height = 21
          DataField = 'FECHA_INICIO'
          DataSource = DMTPVSesionCajaTurno.DSxTurno
          ReadOnly = True
          CheckOnExit = True
          Enabled = False
          NumGlyphs = 2
          TabOrder = 2
        end
        object DBDETurnoFechaFin: TLFDBDateEdit
          Left = 226
          Top = 62
          Width = 87
          Height = 21
          DataField = 'FECHA_FIN'
          DataSource = DMTPVSesionCajaTurno.DSxTurno
          ReadOnly = True
          CheckOnExit = True
          Enabled = False
          NumGlyphs = 2
          TabOrder = 3
        end
        object TBTurno: TLFToolBar
          Left = 0
          Top = 0
          Width = 498
          Height = 29
          DisabledImages = DMMain.ILMain_In
          EdgeInner = esNone
          EdgeOuter = esNone
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 4
          Separators = True
          object NavTurno: THYMNavigator
            Left = 0
            Top = 2
            Width = 176
            Height = 22
            DataSource = DMTPVSesionCajaTurno.DSxTurno
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
        object DBESaldoInicial: TLFDbedit
          Left = 86
          Top = 84
          Width = 87
          Height = 21
          DataField = 'CAMBIO_ENTREGADO'
          DataSource = DMTPVSesionCajaTurno.DSxTurno
          TabOrder = 5
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 472
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 472
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 440
    Top = 4
    object AAbrirSesion: TAction
      Category = 'Procesos'
      Caption = 'Abrir Sesion'
      ImageIndex = 67
      OnExecute = AAbrirSesionExecute
    end
    object ACerrarSesion: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Sesion'
      ImageIndex = 68
      OnExecute = ACerrarSesionExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ARefrescar: TAction
      Category = 'Procesos'
      Caption = 'Refrescar'
      Hint = 'RefrescarDatos'
      ImageIndex = 26
      OnExecute = ARefrescarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Top = 4
  end
end
