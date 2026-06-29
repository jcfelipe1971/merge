inherited FMPeriodosEmpresa: TFMPeriodosEmpresa
  Left = 435
  Top = 222
  Width = 400
  Height = 247
  HelpContext = 22
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Periodos'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = DMPeriodosEmpresa.DSQMPeriodos
        Hints.Strings = ()
        EditaControl = EFPeriodo
        InsertaControl = EFPeriodo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          object LblHasta: TLFLabel
            Left = 12
            Top = 97
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object LblTipo: TLFLabel
            Left = 19
            Top = 53
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LblDesde: TLFLabel
            Left = 9
            Top = 75
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LblPeriodo: TLFLabel
            Left = 4
            Top = 31
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Periodo'
          end
          object DBETitulo: TLFDbedit
            Left = 94
            Top = 27
            Width = 279
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPeriodosEmpresa.DSQMPeriodos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object EFPeriodo: TLFDBEditFind2000
            Left = 44
            Top = 27
            Width = 49
            Height = 21
            DataField = 'PERIODO'
            DataSource = DMPeriodosEmpresa.DSQMPeriodos
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PERIODOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PERIODO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = EFPeriodoBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDTPDesde: TLFDBDateEdit
            Left = 44
            Top = 71
            Width = 87
            Height = 21
            DataField = 'DESDE'
            DataSource = DMPeriodosEmpresa.DSQMPeriodos
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBDTPHasta: TLFDBDateEdit
            Left = 44
            Top = 93
            Width = 87
            Height = 21
            DataField = 'HASTA'
            DataSource = DMPeriodosEmpresa.DSQMPeriodos
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DBETipoPeriodo: TLFDbedit
            Left = 44
            Top = 49
            Width = 329
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPeriodosEmpresa.DSxTipoPeriodo
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
          object DTPHoraDesde: TDateTimePicker
            Left = 132
            Top = 71
            Width = 67
            Height = 21
            CalAlignment = dtaLeft
            Date = 37573
            Time = 37573
            DateFormat = dfShort
            DateMode = dmComboBox
            Enabled = False
            Kind = dtkTime
            ParseInput = False
            TabOrder = 3
          end
          object DTPHoraHasta: TDateTimePicker
            Left = 132
            Top = 93
            Width = 67
            Height = 21
            CalAlignment = dtaLeft
            Date = 37573.9999884259
            Time = 37573.9999884259
            DateFormat = dfShort
            DateMode = dmComboBox
            Enabled = False
            Kind = dtkTime
            ParseInput = False
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMPeriodosEmpresa.DSQMPeriodos
          CamposAOrdenar.Strings = (
            'PERIODO'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 264
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 52
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
  end
  inherited CEMain: TControlEdit
    Left = 232
    Top = 26
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 270
    Top = 26
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 230
    Top = 78
  end
  inherited FSMain: TLFFibFormStorage
    Left = 270
    Top = 78
  end
end
