inherited FMAuditoria: TFMAuditoria
  Width = 859
  Height = 458
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'FMAuditoria'
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 849
    Height = 405
    inherited TBMain: TLFToolBar
      Width = 845
      inherited NavMain: THYMNavigator
        Width = 145
        DataSource = DMAuditoria.DSxAuditoria
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 145
      end
      inherited EPMain: THYMEditPanel
        Left = 153
        Width = 84
        DataSource = DMAuditoria.DSxAuditoria
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 237
      end
      inherited TbuttComp: TToolButton
        Left = 245
      end
      object PNLFiltroFecha: TLFPanel
        Left = 268
        Top = 0
        Width = 221
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LFechas: TLFLabel
          Left = 3
          Top = 4
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fechas'
        end
        object DEFechaDesde: TLFDateEdit
          Left = 40
          Top = 0
          Width = 89
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DEFechaHasta: TLFDateEdit
          Left = 130
          Top = 0
          Width = 89
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
      end
      object PNLFiltroUsuario: TLFPanel
        Left = 489
        Top = 0
        Width = 101
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object LUsuarioFiltro: TLFLabel
          Left = 5
          Top = 3
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usuario'
        end
        object EFUsuarioFiltro: TLFEditFind2000
          Left = 48
          Top = 0
          Width = 49
          Height = 21
          TabOrder = 0
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'USUARIO'
          CampoStr = 'NOMBRE'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_USUARIOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'NOMBRE')
          Filtros = []
        end
      end
      object PNLFiltroTabla: TLFPanel
        Left = 590
        Top = 0
        Width = 195
        Height = 22
        BevelOuter = bvNone
        TabOrder = 4
        object CBTabla: TLFComboBox
          Left = 0
          Top = 0
          Width = 193
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Todas los Tablas'
          Items.Strings = (
            'Todas los Tablas')
        end
      end
      object TButtFiltrar: TToolButton
        Left = 785
        Top = 0
        Hint = 'Filtrar'
        Caption = 'Filtrar'
        ImageIndex = 26
        OnClick = TButtFiltrarClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 845
      Height = 149
      Align = alTop
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 837
          Height = 121
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'FECHA')
            DataSource = DMAuditoria.DSxAuditoria
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_SYS_AUDITORIA'
            CampoNum = 'ID'
            CampoStr = 'TABLA'
            OrdenadoPor.Strings = (
              'ID')
          end
          object LId: TLFLabel
            Left = 62
            Top = 7
            Width = 9
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id'
          end
          object LTabla: TLFLabel
            Left = 44
            Top = 29
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tabla'
          end
          object LFecha: TLFLabel
            Left = 237
            Top = 6
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
            Enabled = False
          end
          object LUsuario: TLFLabel
            Left = 35
            Top = 51
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario'
          end
          object LUbicacion: TLFLabel
            Left = 23
            Top = 73
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ubicacion'
          end
          object LEntrada: TLFLabel
            Left = 474
            Top = 7
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Entrada'
          end
          object LAccion: TLFLabel
            Left = 622
            Top = 7
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Accion'
          end
          object DBEId: TLFDbedit
            Left = 77
            Top = 4
            Width = 76
            Height = 21
            Color = clInfoBk
            DataField = 'ID'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETabla: TLFDbedit
            Left = 77
            Top = 26
            Width = 372
            Height = 21
            Color = clInfoBk
            DataField = 'TABLA'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBDEFecha: TLFDBDateEdit
            Left = 271
            Top = 4
            Width = 121
            Height = 21
            DataField = 'FECHA'
            DataSource = DMAuditoria.DSxAuditoria
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Enabled = False
            NumGlyphs = 2
            TabOrder = 2
          end
          object DTPFechaHora: TDBDateTimePicker
            Left = 393
            Top = 4
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 43781.3871174653
            Format = 'HH:mm'
            Time = 43781.3871174653
            Checked = False
            Color = clInfoBk
            DateFormat = dfShort
            DateMode = dmComboBox
            Enabled = False
            Kind = dtkTime
            ParseInput = False
            TabOrder = 3
            DataField = 'FECHA'
            DataSource = DMAuditoria.DSxAuditoria
            ReadOnly = True
          end
          object DBEUsuario: TLFDbedit
            Left = 77
            Top = 48
            Width = 76
            Height = 21
            Color = clInfoBk
            DataField = 'USUARIO'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBENombre: TLFDbedit
            Left = 154
            Top = 48
            Width = 295
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEUbicacion: TLFDbedit
            Left = 77
            Top = 70
            Width = 76
            Height = 21
            Color = clInfoBk
            DataField = 'UBICACION'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBEMaquina: TLFDbedit
            Left = 154
            Top = 70
            Width = 295
            Height = 21
            Color = clInfoBk
            DataField = 'MAQUINA'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBELogin: TLFDbedit
            Left = 450
            Top = 92
            Width = 372
            Height = 21
            Color = clInfoBk
            DataField = 'MAQUINA'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBESistema: TLFDbedit
            Left = 77
            Top = 92
            Width = 372
            Height = 21
            Color = clInfoBk
            DataField = 'MAQUINA'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBEDescripcionUbicacion: TLFDbedit
            Left = 450
            Top = 70
            Width = 372
            Height = 21
            Color = clInfoBk
            DataField = 'MAQUINA'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBEEntrada: TLFDbedit
            Left = 517
            Top = 4
            Width = 76
            Height = 21
            Color = clInfoBk
            DataField = 'ENTRADA'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBEAccion: TLFDbedit
            Left = 661
            Top = 4
            Width = 76
            Height = 21
            Color = clInfoBk
            DataField = 'ACCION'
            DataSource = DMAuditoria.DSxAuditoria
            Enabled = False
            ReadOnly = True
            TabOrder = 12
            OnChange = DBEAccionChange
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 837
          Height = 121
          DataSource = DMAuditoria.DSxAuditoria
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TABLA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTRADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FEC_ENTRADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FEC_SALIDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UBICACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGIN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SISTEMA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_UBICACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Visible = True
            end>
        end
      end
    end
    object PNLValores: TLFPanel
      Left = 2
      Top = 177
      Width = 845
      Height = 226
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBMValoresOld: TLFDBMemo
        Left = 0
        Top = 0
        Width = 425
        Height = 226
        Align = alLeft
        Color = clInactiveBorder
        DataField = 'VALORES_OLD'
        DataSource = DMAuditoria.DSxAuditoria
        ReadOnly = True
        TabOrder = 0
      end
      object DBMValoresNew: TLFDBMemo
        Left = 425
        Top = 0
        Width = 420
        Height = 226
        Align = alClient
        DataField = 'VALORES_NEW'
        DataSource = DMAuditoria.DSxAuditoria
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 405
    Width = 849
  end
  inherited CEMain: TControlEdit
    DataSource = DMAuditoria.DSxAuditoria
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Top = 32
  end
  inherited FSMain: TLFFibFormStorage
    Top = 32
  end
end
