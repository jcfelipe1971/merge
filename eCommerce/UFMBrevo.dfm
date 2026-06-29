inherited FMBrevo: TFMBrevo
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Brevo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 498
      Height = 302
      ActivePage = TSListas
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSListas: TTabSheet
        Caption = 'Listas'
        ImageIndex = 1
        object PNLListas: TLFPanel
          Left = 0
          Top = 0
          Width = 490
          Height = 274
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBListas: TLFToolBar
            Left = 0
            Top = 0
            Width = 490
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
            TabOrder = 0
            Separators = True
            object NavListas: THYMNavigator
              Left = 0
              Top = 0
              Width = 150
              Height = 22
              DataSource = DMBrevo.DSxListas
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh]
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
            object TBSep1: TToolButton
              Left = 150
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBFiltrarPersonas: TToolButton
              Left = 158
              Top = 0
              Hint = 'Filtrar Personas'
              Caption = 'Filtrar Personas'
              ImageIndex = 5
              OnClick = TBFiltrarPersonasClick
            end
          end
          object DBGListas: THYTDBGrid
            Left = 0
            Top = 22
            Width = 490
            Height = 252
            Align = alClient
            Color = clInfoBk
            DataSource = DMBrevo.DSxListas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CamposAOrdenar.Strings = (
              'FOLDER_ID'
              'ID'
              'NAME'
              'TOTAL_BLACKLISTED'
              'TOTAL_SUBSCRIBERS'
              'ULT_SINCRONIZACION'
              'UNIQUE_SUBSCRIBERS')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAME'
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_BLACKLISTED'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_SUBSCRIBERS'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIQUE_SUBSCRIBERS'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FOLDER_ID'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ULT_SINCRONIZACION'
                Visible = True
              end>
          end
        end
      end
      object TSPersonas: TTabSheet
        Caption = 'Personas'
        object PNLPersonas: TLFPanel
          Left = 0
          Top = 0
          Width = 490
          Height = 274
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBPersonas: TLFToolBar
            Left = 0
            Top = 0
            Width = 490
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
            TabOrder = 0
            Separators = True
            object NavPersonas: THYMNavigator
              Left = 0
              Top = 0
              Width = 150
              Height = 22
              DataSource = DMBrevo.DSxPersonas
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh]
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
            object TBSep2: TToolButton
              Left = 150
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBPersonasVerTodos: TToolButton
              Left = 158
              Top = 0
              Hint = 'Ver Todos'
              Caption = 'Ver Todos'
              ImageIndex = 146
              OnClick = TBPersonasVerTodosClick
            end
          end
          object DBGPersonas: THYTDBGrid
            Left = 0
            Top = 22
            Width = 490
            Height = 252
            Align = alClient
            Color = clInfoBk
            DataSource = DMBrevo.DSxPersonas
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGPersonasCellClick
            OnDrawColumnCell = DBGPersonasDrawColumnCell
            OnDblClick = DBGPersonasDblClick
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CamposAMarcar.Strings = (
              'EMAIL_BLACKLISTED'
              'SMS_BLACKLISTED')
            CamposChecked.Strings = (
              '1'
              '1')
            CamposNoChecked.Strings = (
              '0'
              '0')
            CamposAOrdenar.Strings = (
              'CREATED_AT'
              'EMAIL'
              'EMAIL_BLACKLISTED'
              'ID'
              'MODIFIED_AT'
              'SMS_BLACKLISTED'
              'ULT_SINCRONIZACION')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMAIL'
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMAIL_BLACKLISTED'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SMS_BLACKLISTED'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CREATED_AT'
                Width = 112
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MODIFIED_AT'
                Width = 112
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ULT_SINCRONIZACION'
                Width = 112
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_CONTACTO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NUM_PERSONA'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOMBRE'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APELLIDOS'
                Width = 250
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
end
