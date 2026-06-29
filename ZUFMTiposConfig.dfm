inherited ZFMTiposConfig: TZFMTiposConfig
  Left = 388
  Top = 135
  Width = 1179
  Height = 645
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Configuraciones'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1169
    Height = 592
    inherited TBMain: TLFToolBar
      Width = 1165
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PnlDerecha: TLFPanel
      Left = 585
      Top = 28
      Width = 582
      Height = 562
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PnlConfigDet: TLFPanel
        Left = 0
        Top = 0
        Width = 582
        Height = 96
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LDescSubTipo: TLFLabel
          Left = 33
          Top = 64
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descripci'#243'n'
        end
        object LblSubtipo: TLFLabel
          Left = 18
          Top = 40
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = 'Subtipo Config.'
        end
        object TBConfigDet: TLFToolBar
          Left = 0
          Top = 0
          Width = 582
          Height = 24
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 2
          Separators = True
          object NavConfigDet: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = ZDMTiposConfig.DSQMConfigDet
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEDescSubtipo
            InsertaControl = DBESubtipo
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBEDescSubtipo: TLFDbedit
          Left = 94
          Top = 59
          Width = 211
          Height = 21
          DataField = 'DESCRIPCION'
          DataSource = ZDMTiposConfig.DSQMConfigDet
          TabOrder = 1
        end
        object DBESubtipo: TLFDbedit
          Left = 94
          Top = 37
          Width = 43
          Height = 21
          DataField = 'SUBTIPO'
          DataSource = ZDMTiposConfig.DSQMConfigDet
          TabOrder = 0
        end
      end
      object PnlConfigDetDatos: TLFPanel
        Left = 0
        Top = 96
        Width = 582
        Height = 466
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object TBConfigDetDatos: TLFToolBar
          Left = 0
          Top = 0
          Width = 582
          Height = 24
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object NavConfigDetDatos: THYMNavigator
            Left = 0
            Top = 0
            Width = 176
            Height = 22
            DataSource = ZDMTiposConfig.DSQMConfigDetDatos
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFConfigDet
            InsertaControl = DBGFConfigDet
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFConfigDet: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 582
          Height = 442
          Align = alClient
          DataSource = ZDMTiposConfig.DSQMConfigDetDatos
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Insercion = False
          ColumnaInicial = 1
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'VISIBLE'
            'CAMPO_CALCULADO'
            'HABILITADO')
          ColumnasChecked.Strings = (
            '1'
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0'
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
              FieldName = 'CAMPO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VISIBLE'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HABILITADO'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAMPO_CALCULADO'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_DEFECTO'
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Width = 41
              Visible = True
            end>
        end
      end
    end
    object PnlIzquierda: TLFPanel
      Left = 2
      Top = 28
      Width = 583
      Height = 562
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object PnlConfig: TLFPanel
        Left = 0
        Top = 0
        Width = 583
        Height = 96
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LblTipo: TLFLabel
          Left = 33
          Top = 40
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo Config.'
        end
        object LblDescTipo: TLFLabel
          Left = 34
          Top = 64
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descripci'#243'n'
        end
        object TBConfig: TLFToolBar
          Left = 0
          Top = 0
          Width = 583
          Height = 24
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 2
          Separators = True
          object NavConfig: THYMNavigator
            Left = 0
            Top = 0
            Width = 176
            Height = 22
            DataSource = ZDMTiposConfig.DSQMConfig
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEDescTipo
            InsertaControl = DBEDescTipo
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBETipo: TLFDbedit
          Left = 94
          Top = 37
          Width = 43
          Height = 21
          Color = clInfoBk
          DataField = 'TIPO'
          DataSource = ZDMTiposConfig.DSQMConfig
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEDescTipo: TLFDbedit
          Left = 94
          Top = 59
          Width = 211
          Height = 21
          DataField = 'DESCRIPCION'
          DataSource = ZDMTiposConfig.DSQMConfig
          TabOrder = 0
        end
      end
      object PnlConfigDefecto: TLFPanel
        Left = 0
        Top = 96
        Width = 583
        Height = 466
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object TBConfigDefecto: TLFToolBar
          Left = 0
          Top = 0
          Width = 583
          Height = 24
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object NavConfigDefecto: THYMNavigator
            Left = 0
            Top = 0
            Width = 176
            Height = 22
            DataSource = ZDMTiposConfig.DSQMConfigDefecto
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFConfig
            InsertaControl = DBGFConfig
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFConfig: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 583
          Height = 442
          Align = alClient
          DataSource = ZDMTiposConfig.DSQMConfigDefecto
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Insercion = False
          ColumnaInicial = 1
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'VISIBLE'
            'HABILITADO'
            'CAMPO_CALCULADO')
          ColumnasChecked.Strings = (
            '1'
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0'
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
              FieldName = 'CAMPO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VISIBLE'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HABILITADO'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAMPO_CALCULADO'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_DEFECTO'
              Width = 190
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Width = 41
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 592
    Width = 1169
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
