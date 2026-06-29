inherited FMImagenes: TFMImagenes
  Left = 393
  Top = 241
  Width = 547
  Height = 420
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Im'#225'genes'
  FormStyle = fsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 537
    Height = 367
    inherited TBMain: TLFToolBar
      Width = 533
      inherited NavMain: THYMNavigator
        DataSource = DMImagenes.DSQMImagenes
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TbuttComp: TToolButton
        Hint = 'Mostrar Imagen Completa'
      end
    end
    inherited PCMain: TLFPageControl
      Width = 533
      Height = 337
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 525
          Height = 309
          inherited G2KTableLoc: TG2KTBLoc
            Plan.Strings = (
              ' ')
            DataSource = DMImagenes.DSQMImagenes
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_IMAGENES'
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object ScrBImagen: TScrollBox
            Left = 0
            Top = 69
            Width = 525
            Height = 240
            HorzScrollBar.Visible = False
            VertScrollBar.Visible = False
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
            object Imagen: TImage
              Left = 0
              Top = 0
              Width = 525
              Height = 240
              Align = alClient
              AutoSize = True
              Center = True
              IncrementalDisplay = True
              Proportional = True
            end
          end
          object PnlDatos: TLFPanel
            Left = 0
            Top = 0
            Width = 525
            Height = 69
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              525
              69)
            object LblImagen: TLFLabel
              Left = 13
              Top = 4
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imagen'
            end
            object SBImagen: TSpeedButton
              Left = 500
              Top = 0
              Width = 24
              Height = 23
              Hint = 'Cargar Imagen desde Archivo'
              Anchors = [akTop, akRight]
              Flat = True
              NumGlyphs = 2
              OnClick = SBImagenClick
            end
            object DBETitulo: TLFDbedit
              Left = 100
              Top = 1
              Width = 399
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'NOMBRE'
              DataSource = DMImagenes.DSQMImagenes
              TabOrder = 0
            end
            object DBECodigo: TLFDbedit
              Left = 52
              Top = 1
              Width = 47
              Height = 21
              Color = clInfoBk
              DataField = 'CODIGO'
              DataSource = DMImagenes.DSQMImagenes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnChange = DBECodigoChange
            end
            object DBERuta: TLFDbedit
              Left = 52
              Top = 45
              Width = 473
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'RUTA'
              DataSource = DMImagenes.DSQMImagenes
              Enabled = False
              TabOrder = 2
            end
            object DBCBRepositorio: TLFDBComboBoxValue
              Left = 52
              Top = 23
              Width = 473
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'REPOSITORIO'
              DataSource = DMImagenes.DSQMImagenes
              ItemHeight = 13
              TabOrder = 3
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 525
          Height = 309
          DataSource = DMImagenes.DSQMImagenes
          UsaDicG2K = False
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'ORIGEN')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'CODIGO'
            'FORMATO'
            'IMAGEN'
            'NOMBRE'
            'ORIGEN')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 224
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMATO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMAGE_SIZE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_REPOSITORIO'
              Width = 168
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 367
    Width = 537
  end
  inherited CEMain: TControlEdit
    Left = 278
    Top = 140
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 336
    Top = 140
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 276
    Top = 88
    object AImagenCompleta: TAction
      Category = 'Procesos'
      Caption = 'Mostrar Imagen Completa'
      Hint = 'Mostrar Imagen Completa'
      ImageIndex = 28
      OnExecute = AImagenCompletaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AExportarImagenes: TAction
      Category = 'Procesos'
      Caption = 'Exportar Imagenes Filtradas'
      Hint = 'Exportar Imagenes Filtradas'
      ImageIndex = 36
      OnExecute = AExportarImagenesExecute
    end
    object AImportarImagenesArticulo: TAction
      Category = 'Procesos'
      Caption = 'Importar Imagenes Articulo'
      Hint = 
        'Importar Imagenes Articulo.'#13#10'Nombre de fichero = codigo de artic' +
        'ulo.'
      ImageIndex = 49
      OnExecute = AImportarImagenesArticuloExecute
    end
    object AImportarImagenesModelo: TAction
      Category = 'Procesos'
      Caption = 'Importar Imagenes Modelo'
      Hint = 
        'Importar Imagenes Modelo.'#13#10'Nombre de fichero = Base Creacion de ' +
        'modelo.'
      ImageIndex = 49
      OnExecute = AImportarImagenesModeloExecute
    end
    object AMoverABD: TAction
      Category = 'Procesos'
      Caption = 'Mover archivo de fichero a base de datos'
      Hint = 'Mover archivo de fichero a base de datos'
      ImageIndex = 43
      OnExecute = AMoverABDExecute
    end
    object AMoverAFichero: TAction
      Category = 'Procesos'
      Caption = 'Mover a Fichero'
      Hint = 'Mover a Fichero'
      ImageIndex = 42
      OnExecute = AMoverAFicheroExecute
    end
    object AMoverABDImagenes: TAction
      Category = 'Procesos'
      Caption = 'Mover archivo de fichero a base de datos de Imagenes'
      Hint = 'Mover archivo de fichero a base de datos de Imagenes'
      ImageIndex = 43
      OnExecute = AMoverABDImagenesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 338
    Top = 188
  end
  object OPDImagen: TOpenPictureDialog
    Filter = 
      'Todas las im'#225'genes|*.bmp;*.jpg;*.gif;*.png|BitMap Images (*.bmp)' +
      '|*.bmp|JPG Images (*.jpg)|*.jpg|GIF Images (*.gif)|*.gif|PNG Ima' +
      'ges (*.png)|*.png'
    Title = 'Carga de Imagen'
    Left = 278
    Top = 188
  end
end
