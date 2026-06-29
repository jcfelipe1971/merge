inherited FMAFPIndicadores: TFMAFPIndicadores
  Left = 426
  Top = 324
  Caption = 'AFP Indicadores'
  ClientWidth = 632
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 632
    inherited TBMain: TLFToolBar
      Width = 628
      inherited NavMain: THYMNavigator
        Width = 160
        DataSource = DMAFPIndicadores.DSQMAFPIndicadores
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 160
      end
      inherited EPMain: THYMEditPanel
        Left = 168
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 201
      end
      inherited TbuttComp: TToolButton
        Left = 209
      end
      object PNLPeriodo: TLFPanel
        Left = 232
        Top = 0
        Width = 255
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LPeriodo: TLFLabel
          Left = 14
          Top = 5
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Periodo'
        end
        object EFPeriodo: TLFEditFind2000
          Left = 54
          Top = 1
          Width = 56
          Height = 21
          TabOrder = 0
          OnChange = EFPeriodoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'PERIODO'
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_PERIODOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PERIODO')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloPeriodo: TLFEdit
          Left = 111
          Top = 1
          Width = 141
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object TBSep1: TToolButton
        Left = 487
        Top = 0
        Width = 10
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TBInsertIndicadoresAFP: TToolButton
        Left = 497
        Top = 0
        Hint = 'Inserta indicadores AFP'
        ImageIndex = 18
        OnClick = TBInsertIndicadoresAFPClick
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 628
      Height = 302
      Align = alClient
      DataSource = DMAFPIndicadores.DSQMAFPIndicadores
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
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
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
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
          FieldName = 'CODIGO'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'GLOSA'
          ReadOnly = True
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TASA_AFP_DEPENDIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TASA_SIS_DEPENDIENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TASA_AFP_INDEPENDIENTE'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 632
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
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
    Top = 16
  end
end
